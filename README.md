# 📸 Instagram Clone SQL Analysis

This project is a SQL-based analytical exploration of an Instagram-like relational database.  
It focuses on understanding user behavior, content performance, and engagement patterns through structured queries.

The analysis covers key product metrics such as user activity, popularity of content, social interactions (likes, comments, followers), and hashtag trends.  
Special attention is given to engagement measurement, identifying high-performing content, and detecting unusual or potentially automated (bot-like) behavior.

By working with multiple related tables (users, photos, likes, comments, follows, and tags), this project demonstrates the ability to extract meaningful insights from complex data structures and simulate real-world product analytics tasks.

---

## 📂 Database Structure

The project is built on a relational database with the following tables:

- `users` – platform users  
- `photos` – uploaded images  
- `likes` – user likes on photos  
- `comments` – comments under photos  
- `follows` – follower-following relationships  
- `tags` – hashtags  
- `photo_tags` – many-to-many relationship between photos and tags

---

## 📂 Project Structure

```
ig_clone_sql_analysis
│
├── analysis_queries
│   ├── Average_Likes_Per_Photo.sql
│   ├── Average_Photos_Per_User.sql
│   ├── Detects_Potential_Bot_Or_Spam_Behavior.sql
│   ├── Engagement_Score.sql
│   ├── Finding_5_oldest_users.sql
│   ├── Top_10_Most_Liked_Photos.sql
│   ├── Top_10_Most_Used_Tags.sql
│   ├── Top_10_Photos_With_Most_Comments.sql
│   ├── Top_10_Users_By_Followers.sql
│   ├── Top_10_Users_Who_Comment_The_Most.sql
│   ├── Users_Registrations_By_Day_Of_Week.sql
│   └── Users_Without_Photos.sql
│
├── database
│   ├── create_tables.sql
│   ├── data_model.png
│   └── dataset.sql
│
├── LICENSE
└── README.md
```

---

## 📊 Key Insights & Analysis

### 👤 User Behavior
- Identify inactive users (no uploaded photos)
- Analyze user registration trends by day of the week
- Calculate average number of photos per user
- Find the oldest users on the platform

### ❤️ Engagement Metrics
- Calculate engagement score (likes + comments)
- Analyze average likes per photo
- Identify most liked and most commented photos

### 🔥 Content & Trends
- Discover most popular hashtags
- Detect low-performing content (no engagement)

### 🌐 Social Graph
- Identify top users by number of followers
- Analyze most active commenters

### 🚨 Anomaly Detection
- Detect potential bot or spam behavior based on abnormal activity patterns

---

## 💡 Example: Engagement Score

```sql
SELECT
  p.id,
  p.image_url,
  COUNT(DISTINCT l.user_id) AS likes,
  COUNT(DISTINCT c.id) AS comments,
  COUNT(DISTINCT l.user_id) + COUNT(DISTINCT c.id) AS engagement
FROM photos p
LEFT JOIN likes l ON p.id = l.photo_id
LEFT JOIN comments c ON p.id = c.photo_id
GROUP BY p.id
ORDER BY engagement DESC;
