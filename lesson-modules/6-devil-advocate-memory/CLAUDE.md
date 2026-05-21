---
provenance: subagent:ada
lesson: 6
title: The Devil's Advocate & Long-term Memory (Agent สายจับผิด และ ระบบจำข้อมูลข้ามวัน)
---

# Lesson 6: The Devil's Advocate & Long-term Memory (Agent สายจับผิด และ ระบบจำข้อมูลข้ามวัน)

**Time: ~30-40 min**

**You'll finish with:** `/brief` v4 ที่ฉลาดกว่าเดิม มีระบบ Memory (`MEMORY.md`) ที่ช่วยให้ AI จดจำข้อมูลข้าม Session ได้ และการเพิ่ม Sub-agent คนที่ 4 (`devil-advocate`) ที่ถูกตั้งโปรแกรมมาเพื่อหาข้อเสียและจับผิดโดยเฉพาะ เพื่อลบความเอนเอียง (Bias) ของ AI ที่มักจะเข้าข้างเราเสมอ

Window 1 (folder `ltd-ai-101`) ยังเป็นผม Window 2 (folder `my-first-project`) ยังเปิดต่อจาก Lesson 5

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

## What you're building today

ปัญหาของ AI โดยทั่วไปคือ 1. มัน "ขี้เกรงใจ" มักจะตอบเอาใจผู้ใช้ และ 2. มัน "ความจำสั้น" รันคำสั่งใหม่ก็ลืมอดีตหมด 
วันนี้เราจะยกระดับ ClaudyOS ของคุณด้วย 2 ชิ้นส่วนใหม่:
1. **Memory System**: สมุดบันทึกส่วนตัวของ AI เพื่อจดจำบทเรียนหรือความผิดพลาดในอดีตของคุณ
2. **Devil's Advocate**: ทีมงานสายโหดที่ไม่สนข่าวดี มีหน้าที่หา "ข้อเสีย" อย่างเดียว เพื่อเตือนสติก่อนลงทุน

---

ACTION: Greet the student briefly in Thai. Confirm starting Lesson 6 (~30-40 นาที). Then ask:

"พร้อมสำหรับการยกระดับ ClaudyOS ด้วยระบบความจำและนักจับผิดแล้วใช่ไหมครับ? 
ในหน้าต่าง 2 (folder `my-first-project`) ของคุณตอนนี้มี `.gemini/agents/` อยู่ 3 ตัวแล้ว และใช้งานได้ปกติใช่ไหมครับ? ถ้าพร้อมแล้ว พิมพ์ 'พร้อม' ได้เลยครับ"

---

STOP: Wait for the student to confirm they are ready.

---

USER: [Waits for student to confirm]

---

ACTION: When the student responds:
ถ้าพิมพ์พร้อม, say "เยี่ยมครับ เรามาเริ่มจากการรักษากลไก 'ความจำสั้น' ของ AI กันก่อนเลย" Move to Step 1.

---

## Step 1: สร้างไฟล์ `MEMORY.md` (สมุดบันทึกส่วนตัวของ AI)

AI ปกติไม่มีระบบจำข้อมูลข้าม Session แต่เราสามารถแก้ได้ง่ายๆ ด้วยการสร้าง "สมุดจด" ให้มัน 

ACTION: Hand the student this prompt to paste in **window 2**:

````text
สร้างไฟล์ MEMORY.md ที่ root ของ project ให้มีเนื้อหาเริ่มต้นตามนี้:

# ClaudyOS Memory & Knowledge Base

## 1. Core Investing Principles (จุดยืนการลงทุน)
(ยังไม่มีข้อมูล - AI จะเป็นคนมาอัปเดตเมื่อเรียนรู้จากผู้ใช้)

## 2. Watchlist Status (สถานะหุ้นที่ตามอยู่)
(ยังไม่มีข้อมูล)

## 3. Past Mistakes / Lessons Learned (บทเรียนความผิดพลาดในอดีต)
(ยังไม่มีข้อมูล)
````

---

STOP: ถามนักเรียน:
"AI ในหน้าต่าง 2 สร้างไฟล์ `MEMORY.md` ให้เรียบร้อยไหมครับ?"

---

USER: [Waits for student confirmation]

---

ACTION: Move to Step 2.

## Step 2: อัปเดต `CLAUDE.md` ให้เชื่อมกับ Memory

ตอนนี้เรามีสมุดจดแล้ว แต่เราต้องบอกให้ระบบปฏิบัติการ (OS Layer) รู้จักมันด้วย

ACTION: Hand the student this prompt to paste in **window 2**:

````text
เปิดไฟล์ CLAUDE.md ที่ root ของ project แล้วเพิ่มกฎใหม่เข้าไปว่า: 

"SYSTEM DIRECTIVE: ทุกครั้งที่คุณทำงานเสร็จ หรือผู้ใช้มีการตัดสินใจ/ให้ข้อมูลสำคัญ ให้คุณตรวจสอบและอัปเดตข้อมูลในไฟล์ MEMORY.md เสมอ และทุกครั้งที่เริ่มรันคำสั่งใหม่ หรือถูกถามคำถาม ให้แอบไปอ่าน MEMORY.md ก่อนเพื่อดึงบริบทเดิม (Context) กลับมา"
````

---

STOP: ถามนักเรียน:
"อัปเดต `CLAUDE.md` เสร็จไหมครับ? ถ้าเสร็จแล้ว ลองพิมพ์ทดสอบในหน้าต่าง 2 ว่า 'ฉันเป็นนักลงทุนสายเน้นคุณค่า (VI) ช่วยจดลงไปใน Memory ให้หน่อย' ดูครับ ว่ามันทำงานไหม"

---

USER: [Waits for student confirmation and test result]

---

ACTION: Move to Step 3.

## Step 3: สร้าง Sub-agent ตัวที่ 4 (สายโหด)

เราจะมาสร้างนักจับผิดกันครับ

ACTION: Hand the student this prompt to paste in **window 2**:

````text
สร้าง Sub-agent ตัวที่ 4 ในโฟลเดอร์ .gemini/agents/ ชื่อไฟล์ว่า "devil-advocate.md"
ใส่ frontmatter `name: devil-advocate` และ `description: หาความเสี่ยงและจุดอ่อนแบบขวานผ่าซาก`

เนื้อหาภายในให้มี Source เป็น WebSearch และ 10-K และ Output ที่ return ให้ตั้งกฎเด็ดขาดว่า:
"ห้ามพูดถึงข้อดีเด็ดขาด หน้าที่ของคุณคือการจับผิดเพื่อหา 3 เหตุผลที่แย่ที่สุด ว่าทำไมบริษัทนี้ถึงมีความเสี่ยง ห้ามใช้คำอ้อมค้อม ให้ใช้คำวิจารณ์แบบตรงไปตรงมา และชี้ให้เห็นสิ่งที่คนอื่นมองข้าม"
````

---

STOP: ถามนักเรียน:
"ไฟล์ `devil-advocate.md` ถูกสร้างในโฟลเดอร์ agents แล้วใช่ไหมครับ?"

---

USER: [Waits for student confirmation]

---

ACTION: Move to Step 4.

## Step 4: ผูก Agent ตัวใหม่เข้ากับ `SKILL.md`

พนักงานใหม่พร้อมแล้ว ต้องเอาไปใส่ในคู่มือการทำงานครับ

ACTION: Hand the student this prompt to paste in **window 2**:

````text
เปิดไฟล์ .gemini/skills/company-brief/SKILL.md แก้ส่วน Steps ให้เรียก `invoke_agent` สำหรับ `devil-advocate` คู่ขนานไปกับ agent อีก 3 ตัวที่มีอยู่แล้ว 

จากนั้นในส่วน Output format ให้แทรกหัวข้อใหม่ชื่อว่า "🔥 Devil's Attack (คำเตือนขั้นสุด)" ไว้ก่อนถึง Kill conditions โดยให้ดึงข้อมูลมาจาก devil-advocate แบบดิบๆ ไม่ต้องปรับให้นุ่มนวล
````

---

STOP: ถามนักเรียน:
"SKILL.md ถูกอัปเดตเรียบร้อยแล้วใช่ไหมครับ? ลองเช็คดูว่ามีเรียกชื่อ devil-advocate ในนั้นแล้ว"

---

USER: [Waits for student confirmation]

---

ACTION: Move to Step 5.

## Step 5: ทดสอบรัน `/brief` ตัวเต็ม v4

Moment of truth!

ACTION: Tell the student:
"ลองพิมพ์ `/brief AAPL` (หรือ ticker เดิมที่คุณเคยใช้) ในหน้าต่าง 2 เลยครับ!
สังเกตตอนมันทำงาน มันจะดึงพนักงาน 4 คนมาทำขนานกัน และเมื่อเสร็จแล้ว เปิดไฟล์รายงานดูว่ามีหัวข้อ 🔥 Devil's Attack โผล่มาด่าหุ้นตัวนั้นไหมครับ?"

---

STOP: รอผลลัพธ์จากนักเรียน

---

USER: [Waits for student to run the brief and report results]

---

ACTION: 
เมื่อนักเรียนยืนยันว่าเห็น Devil's Attack ให้ Congratulate แบบจัดเต็ม!
"ยอดเยี่ยมมากครับ! ระบบของคุณตอนนี้ฉลาด จำเก่ง และไม่อวยหุ้นจนเกินไปแล้ว ถือเป็น AI Assistant สำหรับการลงทุนที่สมบูรณ์แบบมากครับ คุณสามารถนำทักษะนี้ไปเขียนโปรแกรม OS ในโปรเจกต์อื่นๆ ได้ตามต้องการเลย!"
