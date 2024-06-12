import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score, classification_report

# Step 1: Load and examine the data
match_level_df = pd.read_csv('664389efa0868_match_level_scorecard.csv')
batsman_level_df = pd.read_csv('663e2b548c98c_batsman_level_scorecard.csv')
bowler_level_df = pd.read_csv('663e2b2c60743_bowler_level_scorecard.csv')
train_df = pd.read_csv('663e2b6d54457_train_data_with_samplefeatures.csv')
test_df = pd.read_csv('6644a1e287df6_test_data_with_samplefeatures.csv')

# Rename 'match id' to 'match_id' in all dataframes
match_level_df.rename(columns={'match id': 'match_id'}, inplace=True)
batsman_level_df.rename(columns={'match id': 'match_id'}, inplace=True)
bowler_level_df.rename(columns={'match id': 'match_id'}, inplace=True)

# Verify common key for merging
common_key = 'match_id'

if common_key in match_level_df.columns and common_key in batsman_level_df.columns and common_key in bowler_level_df.columns:
    # Step 2: Merge data
    match_batsman_df = pd.merge(match_level_df, batsman_level_df, on=common_key, how='left')
    full_data_df = pd.merge(match_batsman_df, bowler_level_df, on=common_key, how='left')

    # Display the combined dataframe
    print("\nFull Combined Data:")
    print(full_data_df.head())

    # Print columns before dropping
    print("\nColumns before dropping:")
    print(full_data_df.columns)

    # Step 3: Prepare features and target variable
    # Encoding winner as 1 for 'team1' and 0 for 'team2'
    full_data_df['match_outcome'] = full_data_df.apply(lambda row: 1 if row['winner'] == row['team1'] else 0, axis=1)

    # Drop unnecessary columns
    columns_to_drop = [common_key, 'match_dt_x', 'match_dt_y', 'winner', 'by', 'city', 'series_name', 'season',
                       'umpire1', 'umpire2', 'team1_roster_ids', 'team2_roster_ids', 'series_type', 'batsman',
                       'batsman_details', 'wicket kind', 'out_by_bowler', 'out_by_fielder', 'bowler_details_x',
                       'bowler_details_y']

    columns_to_drop = [col for col in columns_to_drop if col in full_data_df.columns]

    full_data_df = full_data_df.drop(columns=columns_to_drop)

    # Identify non-numeric columns that need encoding
    non_numeric_columns = full_data_df.select_dtypes(include=['object']).columns
    print("Non-numeric columns to encode:", non_numeric_columns)

    # Convert categorical features to numerical using one-hot encoding
    full_data_df = pd.get_dummies(full_data_df, columns=non_numeric_columns)

    # Split the data into features and target
    X = full_data_df.drop('match_outcome', axis=1)
    y = full_data_df['match_outcome']

    # Ensure all data is numeric
    X = X.apply(pd.to_numeric, errors='coerce').fillna(0)

    # Sample data to reduce size (if necessary)
    X, _, y, _ = train_test_split(X, y, train_size=0.1, random_state=42)

    # Split into train and test datasets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Step 4: Train GBM model
    model = GradientBoostingClassifier(n_estimators=100, learning_rate=0.1, max_depth=3, random_state=42)
    model.fit(X_train, y_train)

    y_pred = model.predict(X_test)
    print("Accuracy:", accuracy_score(y_test, y_pred))
    print("Classification Report:\n", classification_report(y_test, y_pred))

    # Feature importance
    feature_importances = pd.Series(model.feature_importances_, index=X.columns)
    print("Feature Importances:\n", feature_importances.sort_values(ascending=False))
else:
    print(f"Column '{common_key}' does not exist in all dataframes.")
