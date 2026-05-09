---
provenance: subagent:ada
lesson: 3
title: Earnings transcript เป็น source + คุม Token
---

# Lesson 3: Earnings transcript เป็น source + คุม Token

**Time: ~25 min**

**You'll finish with:** `/brief TICKER` v2 ที่ section "Latest earnings" อ่านจาก earnings call transcript จริงที่คุณ paste ไว้ในเครื่อง (ไม่ใช่จากความจำของ Claude ที่ training cutoff ค้างอยู่หลายเดือน) บวกกับ 2 ทักษะคุม cost: รู้ว่า session นี้กิน token ไปกี่ % และเลือก model (Sonnet/Opus/Haiku) ให้เหมาะกับงาน ปลายทาง brief ใหม่จะมี earnings ที่คุณ verify ได้ และคุณจะเริ่มเห็นว่าเครื่องมือนี้ "เปลือง" หรือ "ประหยัด" ในมือคุณเอง

Window 1 (folder `ltd-ai-101`) ยังเป็นผม Window 2 (folder `my-first-project`) ยังเปิดต่อจาก Lesson 2 ห้ามเพิ่งปิดนะครับ

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

## What you're building today

Lesson 2 จบที่ `/brief AAPL` v1 ออก 6 sections + เสียงนักลงทุนของคุณใส่เข้าไปแล้ว ที่ยัง weak: **Section 3 (Latest earnings)** Claude มี training cutoff (วันที่ความรู้ของ model หยุดอัพเดต) ของจริง model ของคุณตอนนี้รู้ข่าวถึงประมาณช่วงปลาย 2025 ถึงต้น 2026 (ขึ้นกับ build ของคุณ) ทุกอย่างที่ใหม่กว่านั้น Claude ไม่รู้จริง 3 ผลที่อาจเกิด:

1. **Honest case** = Claude บอกตรงๆ ว่า "ไม่แน่ใจ quarter ล่าสุด"
2. **Bad case** = Claude แต่งตัวเลขเฉพาะเจาะจง (revenue + segment + guidance) จากความน่าจะเป็น ไม่ใช่ข้อเท็จจริง
3. **AI-with-websearch case** = Claude สมัยใหม่บางตัวเรียก websearch เองได้ ออกไปหา online แล้วตอบ — แต่เราไม่ได้คุมว่ามันจะหยิบมาจากเว็บไหน บางทีได้ blog random หรือ tweet ของคนที่เราไม่รู้จัก เลยเลือกวิธีให้เรา feed source ที่เราเลือกเองดีกว่า แน่ใจ source

Lesson 3 แก้ structurally โดยให้ skill อ่าน **earnings call transcript** ที่คุณ paste ไว้ใน folder ของโปรเจค — เอกสารตรงจากบริษัท ไม่ใช่ข่าวที่คนอื่น interpret skill อ่าน transcript ก่อนเขียน Latest earnings section ทุกครั้ง

นอกจากนั้นเราทำอีก 2 อย่าง:

3. **`/context`** (หรือ command ที่ Claude Code version คุณใช้บอก token usage) ดูว่า session นี้กิน context window ไปกี่ %
4. **Model picker discipline** เลือก Sonnet/Opus/Haiku ให้เหมาะกับงาน

จบ Lesson 3 คุณจะรัน `/brief AAPL` อีกครั้ง section "Latest earnings" ดึงตัวเลขจริงจาก transcript ของคุณ ไม่ใช่จากความจำ

---

ACTION: Greet the student briefly in Thai. Confirm starting Lesson 3 (~15 นาที). Then ask:

"ก่อนเริ่ม Lesson 3 ขอ verify ของจาก Lesson 2 ก่อนนะครับ. ในหน้าต่าง 2 (folder `my-first-project`) ลอง paste:

```
อ่านไฟล์ .claude/skills/company-brief/SKILL.md แล้ว show บรรทัดแรก กับ บรรทัดที่มีคำว่า 'description'
```

แล้วต่อด้วย:

```
อ่านไฟล์ CLAUDE.md ที่ root ของ project แล้ว show หัวข้อ section 'How I invest' กลับมา (ถ้ามี)
```

แล้วบอกผมว่า Claude หน้าต่าง 2 อ่านได้ทั้ง 2 ไฟล์ไหม + section 'How I invest' ยังอยู่ในไฟล์ CLAUDE.md ไหม."

---

STOP: Wait for the student to confirm L2 artifacts exist:
1. `.claude/skills/company-brief/SKILL.md` อ่านได้ (Claude show บรรทัดแรก + description ได้)
2. `CLAUDE.md` มี section "How I invest" (ที่ student เขียนเองใน Lesson 2)
3. window 2 ยังเปิดอยู่ที่ folder `my-first-project`

(ถ้ามีไฟล์ `briefs/AAPL.md` จาก Lesson 2 เก็บไว้ก็ดี เดี๋ยวเราจะเทียบกับ v2 ปลาย lesson)

---

USER: [Waits for student to confirm L2 artifacts + window 2 still open]

---

ACTION: When the student responds:

1. ถ้าทั้ง 2 ไฟล์อ่านได้ + section "How I invest" ยังอยู่ + window 2 ยังเปิดที่ `my-first-project`, say "ดีครับ Lesson 2 ของแน่น ไปต่อ." Move to Step 1.
2. ถ้าไฟล์ SKILL.md หาย หรือ Claude หน้าต่าง 2 อ่านไม่ได้, ตอบ: "ขาด skill กลับไปเก็บที่ Lesson 2 Step 2 ก่อนนะครับ. พิมพ์ `Start Lesson 2` ในหน้าต่างนี้ถ้าอยากเริ่มใหม่." Wait for fix.
3. ถ้า section "How I invest" หาย (CLAUDE.md ถูก overwrite ระหว่างนี้), ตอบ: "section voice หาย Lesson 3 จะอ่อน เพราะ skill เรียก voice นั้น. กลับไป Lesson 2 Step 3 ก่อน." Wait for fix.
4. ถ้า student เปลี่ยนชื่อ folder (ไม่ใช่ `my-first-project`), จด name ที่ใช้ และ substitute ทุกครั้งที่ผม reference `my-first-project`.
5. ถ้า window 2 ปิดไป, ขอให้เปิด Claude Code ที่ folder project ก่อนต่อ.

---

## Step 1: ทำไม Latest earnings ของ /brief v1 ยัง weak

ก่อน paste อะไร เราเข้าใจปัญหาก่อน นี่ไม่ใช่ technical detail มันคือเหตุผลที่ทุก step ที่เหลือมีอยู่

**Training cutoff** คือวันที่ความรู้ของ Claude หยุดอัพเดต Claude ทุกตัว train ครั้งเดียว แล้ว frozen ของรุ่นที่คุณใช้ปัจจุบันรู้ถึงประมาณ ปลาย 2025 ถึงต้น 2026 **ทุกอย่างที่เกิดหลังจากนั้น Claude ไม่รู้จริง**

ลองนึกภาพ analyst ที่อ่านหนังสือพิมพ์ฉบับสุดท้ายเมื่อ 4-6 เดือนก่อน แล้วตั้งแต่นั้นไม่ได้อ่านอะไรเลย ถ้าคุณถามเขาเรื่องไตรมาสล่าสุด มี 3 ทาง:

- **Honest analyst:** "ผมไม่รู้ ข่าวล่าสุดของผมหยุดที่ [วันที่]"
- **Bad analyst:** เดาจากแบบที่ "น่าจะเกิด" แล้วพูดเหมือนจริง ใส่ชื่อคน วันที่ ตัวเลข
- **AI ที่ใช้ websearch:** Claude สมัยใหม่บางตัวเรียก websearch เองได้ ออกไปหา online แล้วตอบ — แต่เราไม่ได้คุมว่ามันจะหยิบมาจากเว็บไหน บางทีได้ blog random หรือ tweet ของคนที่เราไม่รู้จัก เลยเลือกวิธีให้เรา feed source ที่เราเลือกเองดีกว่า แน่ใจ source

Claude บางครั้งทำตัวเหมือน analyst ที่ดี บางครั้งเหมือนคนที่ไม่ดี เราสามารถใส่ rule ใน SKILL.md ว่า "ห้ามแต่ง" แต่ rule ใน SOP ไม่ใช่ structural fix มันแค่ instruction fix structural คือ **ให้ Claude อ่านเอกสารจริงก่อนเขียน section นั้น**

**Pattern ของ Lesson 3 = "ก่อนเขียน Latest earnings อ่าน earnings transcript ใน sources/ ก่อน ถ้า transcript ไม่มี บอกตรงๆ ว่าไม่มี source ไม่แต่ง"**

ทำไม earnings transcript ไม่ใช่ news article? เพราะ earnings transcript คือเอกสารตรงจากบริษัท fact-checkable เห็นได้ใน IR page ของบริษัทเอง ส่วนข่าวคือคนอื่นเขียน

---

STOP: เข้าใจหลักการนี้พอใช้ได้ไหม ถ้าเข้าใจ พิมพ์ "ok" หรือ "เข้าใจ" ถ้ามีจุดงงบอกได้

---

USER: [Waits for student to confirm understanding]

---

ACTION: When the student responds:

1. ถ้าเข้าใจ, say "ดี ไปสร้าง folder `sources/` กัน" Move to Step 2.
2. ถ้าถาม "ทำไมไม่ใช้ NotebookLM ตรงๆ", ตอบ: "ใช้ได้ครับ แต่ใน Claude Code (ที่คุณนั่งอยู่ตอนนี้) ทาง connector ตรงๆ ตอนนี้ยังเบียดสำหรับคนเพิ่งเริ่ม paste-from-file = concept คล้ายกัน mechanism เบากว่า ปลาย lesson ผมจะโชว์ two-tab workaround ที่ใช้ NotebookLM web เป็น curator ของ source หลายไฟล์ได้ถ้าคุณอยาก"
3. ถ้าถาม "training cutoff ของ Claude version ผมคือเมื่อไหร่จริงๆ", ตอบ: "ถาม Claude หน้าต่าง 2 ตรงๆ: 'training cutoff ของ model ที่กำลังใช้คือเมื่อไหร่' Claude version ปัจจุบันรู้คำตอบเอง" (Don't assert a specific date, hedge.)
4. ถ้าถาม "ถ้า source ที่ผมใส่ผิด Claude ก็เขียนผิด?", ตอบ: "ใช่ครับ external source = source ของคุณ ความน่าเชื่อถือ inherit จากที่คุณเลือก SEC filing, earnings call transcript จาก IR ของบริษัท คือ source ที่ดี tweet random, blog post ของคนที่คุณไม่รู้จัก คือไม่ดี คุณคุม quality ตรงนี้"

---

## Step 2: สร้าง folder `sources/` + ใส่ source แรก

ขั้นนี้เป็น 2 sub-step (a) สร้าง folder ว่าง + (b) ใส่ earnings call transcript จริง

ใน Lesson 3 เราใช้ **earnings call transcript** อย่างเดียวเป็น source เพราะเข้าถึงง่ายและเป็นเอกสารตรงจากบริษัท Lesson 4 จะเพิ่ม source อื่น (10-K) สำหรับ sub-agent คนอื่น

ACTION: Hand the student this prompt to paste in **window 2** Tell them: "ก็อปบล็อคนี้ paste ใน chat ของหน้าต่าง 2 (folder `my-first-project`) แล้วกลับมาบอกผม"

````text
สร้าง folder sources/ ที่ root ของ project ถ้ายังไม่มี ใน folder นี้ผมจะใส่ earnings call transcript ที่อยากให้ skill company-brief อ่านก่อนเขียน Latest earnings section ตั้ง subfolder ตาม ticker ด้วย เช่น sources/AAPL/, sources/NVDA/ โครงสร้างควรเป็น:

sources/
  AAPL/
    (ผมจะใส่ earnings transcript ที่นี่ใน step ถัดไป)
  README.md

ใน sources/README.md เขียนสั้นๆ ว่า: "Folder นี้เก็บ earnings call transcript ให้ skill company-brief อ่านก่อนเขียน section Latest earnings ใส่ไฟล์ .md หรือ .txt แยก subfolder ตาม ticker"

ทำเลย
````

---

STOP: บอกผม:

1. Claude ในหน้าต่าง 2 ตอบยังไง? (สร้างเลยหรือถามขอ approve)
2. ถาม Claude หน้าต่าง 2: "list ไฟล์ทั้งหมดใน folder sources/" Claude ต้อง show ว่ามี `sources/README.md` อย่างน้อย 1 ไฟล์.

---

USER: [Waits for student to confirm sources/ folder + README.md created]

---

ACTION: When the student responds:

1. ถ้า folder + README สร้างแล้ว, say "ดี โครงสร้างพร้อม ต่อไปใส่ source แรก." Move to Step 2.5 (ใส่ source ตัวอย่าง).
2. **Plan-mode branch:** ถ้า Claude ในหน้าต่าง 2 ขอ approve ก่อน, บอก student: "หน้าต่าง 2 อยู่ใน Plan mode. approve plan หรือสลับเป็น Auto mode แล้ว paste ใหม่. รอจนสร้างเสร็จแล้วบอกผม." Wait until folder exists.
3. ถ้า Claude สร้าง `sources/` แต่ไม่มี README, paste ในหน้าต่าง 2: "เพิ่ม `sources/README.md` ตามเนื้อหาที่ส่งให้ก่อนหน้านี้." Wait.
4. ถ้า Claude สร้าง folder ผิดที่ (เช่น ใน `.claude/sources/` หรือใน subfolder อื่น), paste: "ย้าย sources/ ไปที่ root ของ project (ระดับเดียวกับ briefs/, .claude/)." Wait for fix.

---

## Step 2.5: ใส่ source แรก (real earnings transcript)

ตอนนี้ folder ว่างกับ README ขั้นนี้เราจะใส่ **transcript จริง** จาก earnings call ของ Apple ลงไป ไม่ใช่ placeholder คุณเป็นนักลงทุน คุณ research จริง ดังนั้น smoke test ก็ควร test กับของจริง ไม่ใช่ของปลอม

**ทำไมไม่ placeholder:** ถ้า test ด้วย placeholder คุณรู้แค่ว่า skill อ่าน folder ได้ ถ้า test ด้วย transcript จริง คุณรู้ทั้ง (a) skill อ่าน folder ได้ + (b) skill extract ตัวเลขจริงจาก long-form text ได้ + (c) คุณรู้แล้วว่าจะหา source จากไหนสำหรับครั้งหน้า ของ 3 ข้อในรอบเดียว

### 2.5.1 สร้างไฟล์ transcript เปล่าก่อน

เราจะสร้างไฟล์ md ที่จะรับ transcript ก่อน แล้วค่อยเปิด browser หา transcript จริงไปวาง 2 ขั้นแยก ทำให้คุณไม่ confuse ว่าควร paste อะไรลงไป

ACTION: Hand the student this prompt to paste in **window 2**:

````text
สร้างไฟล์ sources/AAPL/q1-2026-call.md (ถ้าคุณรู้ว่า quarter ล่าสุดที่ Apple ออกแล้วเป็น quarter ใหม่กว่านั้น เช่น q2-2026-call.md ใช้ตามนั้น) ด้วยเนื้อหาตามนี้:

---
ticker: AAPL
source_type: earnings_call_transcript
quarter: <quarter ที่คุณกำลังจะหา transcript เช่น Q1 FY2026>
source_url: <ใส่ทีหลังเมื่อหา URL ได้>
---

# Apple <quarter> Earnings Call (excerpt)

(transcript จะใส่ใน step ถัดไป)

ทำเลย
````

---

STOP: บอกผม Claude สร้างไฟล์เปล่าให้แล้วใช่ไหม path = `sources/AAPL/q1-2026-call.md` (หรือ quarter ที่คุณเลือก)

---

USER: [Waits for student to confirm empty file created]

---

ACTION: When confirmed, move to 2.5.2.

### 2.5.2 หา transcript จริงจาก Motley Fool

เปิด browser tab ใหม่ Google search:

```
AAPL earnings call transcript site:motleyfool.com
```

หรือ `site:fool.com` ก็ได้ (Motley Fool มี 2 domain) ผลแรกๆ จะเป็น article ของ Motley Fool ที่มี transcript เต็มๆ ฟรี ไม่ต้อง login

(ถ้า Motley Fool ไม่มี transcript ของ quarter ที่อยากได้ ลอง Apple IR direct ที่ `investor.apple.com` → Events → Recent earnings call แต่ส่วนใหญ่ Motley Fool ครอบคลุม)

ในหน้า article ที่เปิดได้:
1. Copy URL จาก address bar เก็บไว้
2. Scroll ลงหา CEO หรือ CFO ที่พูดเปิด เช่น "Tim Cook: Thank you..." หรือ "Kevan Parekh: Good afternoon..."
3. Copy ส่วน management discussion (CEO/CFO opening remarks) ประมาณ **500-1500 คำ** ส่วนนี้มัก break down segment (iPhone/Services/Mac/Wearables) มีตัวเลขจริงเยอะ

### 2.5.3 paste transcript ลงไฟล์ที่สร้างไว้

ACTION: Hand the student this prompt to paste in **window 2**:

````text
เปิดไฟล์ sources/AAPL/q1-2026-call.md ที่เพิ่งสร้าง

1. แทนที่ source_url ใน frontmatter ด้วย URL ของ Motley Fool ที่ผมจะวางข้างล่าง
2. แทนที่บรรทัด "(transcript จะใส่ใน step ถัดไป)" ด้วย transcript text ที่ผมจะวางข้างล่าง

source_url: <วาง URL Motley Fool ตรงนี้>

transcript:
<วาง transcript text ตรงนี้>

ทำเลย แล้ว show first 2 lines of body content เพื่อ verify
````

(บอก student ให้แทนที่ `<วาง URL...>` กับ `<วาง transcript text...>` ด้วยของจริงที่เพิ่ง copy มา ก่อน paste บล็อคทั้งหมดนี้ใน chat หน้าต่าง 2)

**Fallback (ถ้าหา transcript จริงไม่ได้ใน 10 นาที):** ถ้า internet ห่วยจริงๆ หรือ flow ติดขัด ใช้ placeholder ก็ได้ แต่อย่าทิ้งไว้นาน paste แทน:

````text
เปิดไฟล์ sources/AAPL/q1-2026-call.md ที่เพิ่งสร้าง แทนที่ทั้งไฟล์ด้วยเนื้อหานี้:

---
ticker: AAPL
source_type: placeholder
note: ของจริงยังไม่ได้ใส่ ใช้ไฟล์นี้ smoke test pipeline ก่อน แทนที่ด้วย transcript จริงก่อนใช้ output จริง
---

# Placeholder source for AAPL

ของยังว่าง ถ้า skill อ่านไฟล์นี้แล้วเขียน Latest earnings ตาม instruction ผมจะรู้ว่า skill ทำงานถูก ขั้นถัดไปจะ replace ด้วย transcript จริง

ทำเลย
````

---

---

STOP: บอกผม:

1. ไฟล์ `sources/AAPL/<filename>.md` ถูก update ไหม + filename ที่ใช้คือ
2. ใส่ transcript จริง (จาก Motley Fool หรือ Apple IR) หรือ fallback placeholder
3. ถ้า transcript จริง: ขอ Claude verify ด้วย `show first 2 lines of body content` content แรกตรงกับสิ่งที่ก็อปจาก browser ไหม

---

USER: [Waits for student to confirm source file content (real transcript preferred, placeholder as fallback)]

---

ACTION: When the student responds:

1. ถ้าใส่ transcript จริง + verify ตรง, say "ดีครับ source แรกเป็นของจริง ตอนเรารัน /brief เดี๋ยว Latest earnings จะ extract bullet จาก transcript นี้ได้จริง" Move to Step 3.
2. ถ้าใช้ placeholder (fallback), say "OK ใช้ placeholder smoke test pipeline ก่อนได้ แต่อย่าลืมกลับมา replace ด้วย transcript จริงก่อนใช้ output จริง quality ของ skill inherit จาก source" Move to Step 3.
3. **Plan-mode branch:** ถ้า Claude ขอ approve, บอก student: "approve plan รอจนสร้างเสร็จ" Wait.
4. ถ้า student ใช้ ticker อื่นไม่ใช่ AAPL, ไม่เป็นไร note ticker และ substitute ทุกครั้งที่ผม reference AAPL ใน steps ถัดไป
5. ถ้า student ติด "Motley Fool ไม่มี transcript ของ quarter ที่อยากได้": "ลอง Apple IR direct ที่ `investor.apple.com` → Investors → Events → Recent earnings call ปกติมี webcast replay + transcript PDF download ได้"
6. ถ้า student งงคำว่า "management discussion section": "เปิด transcript scroll ลงหา CEO หรือ CFO ที่พูดเปิด เช่น 'Tim Cook: Thank you...' หรือ 'Kevan Parekh: Good afternoon...' ก็อปจากตรงนั้น 500-1500 คำพอ ไม่ต้องทั้ง call"
7. ถ้า student paste transcript ที่ยาวมาก (>5000 คำ), เตือน: "ยาวไปได้ pipeline ทำงานได้ แต่กิน token เยอะตอนรัน /brief ตัดให้เหลือ 1500 คำพอ ถ้าจะใช้ครบเก็บไว้ใน source แยกไฟล์" Optional cleanup.

---

## Step 3: แก้ SKILL.md ให้อ่าน `sources/<TICKER>/`

ตอนนี้ folder + source file มีแล้ว แต่ skill ยังไม่รู้ว่ามันอยู่ เราเปิด `.claude/skills/company-brief/SKILL.md` แล้วเพิ่ม step "อ่าน sources/" ก่อนเขียน Latest earnings

**สิ่งที่เปลี่ยน 2 จุดใน SKILL.md:**

1. **Steps section** แทรก step ใหม่ก่อน step ปัจจุบันที่เขียน Latest earnings step ใหม่: "อ่าน `sources/<TICKER>/` ทุกไฟล์ ก่อนเขียน Latest earnings section"
2. **Section 3 (Latest earnings) format** เปลี่ยน rule จาก "ใช้ความรู้ที่มี" เป็น "อ่าน sources/<TICKER>/ ก่อน ถ้าว่าง บอกตรงๆ ว่าไม่มี source ห้ามแต่งจากความจำ"

ACTION: Hand the student this prompt to paste in **window 2**:

````text
เปิดไฟล์ .claude/skills/company-brief/SKILL.md แล้วแก้ตามนี้:

1. ใน section ## Steps แทรก step ใหม่ก่อน step ที่เขียนเรื่อง research:

   2. อ่านไฟล์ทุกตัวใน sources/<TICKER>/ (ถ้า folder มี) ถ้าไม่มี folder หรือ folder ว่าง บอกใน Latest earnings section ตรงๆ ว่า "ไม่มี earnings transcript ใน sources/<TICKER>/" ห้ามแต่งตัวเลขจากความจำ

   แล้ว renumber step ที่เหลือต่อไป

2. ใน section ### 3. Latest earnings ใต้ ## Output format แทนเนื้อหาเดิมด้วย:

### 3. Latest earnings
3-5 bullets **Source:** อ่านทุกไฟล์ใน sources/<TICKER>/ ก่อนเขียน ถ้า folder ว่างหรือไม่มี เขียนตรงๆ: "ไม่มี earnings transcript ใน sources/<TICKER>/ skip section นี้หรือ user ใส่ source ก่อน" ห้ามแต่งตัวเลขจากความจำ ทุก bullet ในนี้ต้อง trace กลับไปที่ไฟล์ใน sources/ ได้ และระบุไฟล์ต้นทางใน parens ท้าย bullet เช่น (source: sources/AAPL/q1-2026-call.md)

ส่วนอื่นของ SKILL.md เก็บไว้เหมือนเดิม ห้ามลบ section อื่น ห้ามเปลี่ยน frontmatter

ทำเลย แล้ว show ให้ผมดูว่า section ## Steps กับ section ### 3. Latest earnings ตอนนี้เป็นยังไง
````

---

STOP: บอกผม:

1. Claude หน้าต่าง 2 ตอบยังไง? (แก้สำเร็จไหม)
2. show step list ใหม่ + section "Latest earnings" ใหม่ใน chat. ตรวจ 2 จุด:
   - มี step ใหม่ที่บอกว่าอ่าน `sources/<TICKER>/` ก่อนหรือยัง
   - section "Latest earnings" บังคับให้ trace ไฟล์ใน `sources/` หรือยัง
3. section อื่น (Output format ที่เหลือ, Voice rules, When unsure) ยังครบไหม

---

USER: [Waits for student to confirm SKILL.md edited correctly with steps + Latest earnings section updated]

---

ACTION: When the student responds:

1. ถ้าทั้ง 3 ผ่าน, say "ดี skill รู้แล้วว่ามี sources/. ลองรันเทียบ v2 vs v1." Move to Step 4.
2. **Plan-mode branch:** ถ้า Claude ขอ approve, บอก: "approve plan. ถ้า Plan mode บอกจะ overwrite ทั้งไฟล์ reject ก่อน แล้ว paste ใหม่บอก 'edit เฉพาะ 2 sections, ห้ามแทนที่ของเดิม'." Wait.
3. ถ้า Claude **แทนที่** SKILL.md ทั้งไฟล์ (ลบ section อื่น), paste: "เพิ่งทำผิด. restore content เดิมของ SKILL.md (Lesson 2 version: 6 sections + Voice rules + When unsure) แล้วแก้เฉพาะ section Steps กับ Latest earnings ตามที่ส่งไป. ส่วนอื่นห้ามแตะ." Wait.
4. ถ้า Claude แก้แต่ section Steps ใหม่ขัดแย้งกับ Steps เดิม (เช่น double-numbered, missing step), paste: "show full Steps section ทั้งก้อน, ถ้ามี step ซ้ำหรือ missing, fix และ renumber ตาม flow ที่สมเหตุสมผล: confirm ticker → read CLAUDE.md voice → read sources/<TICKER>/ → research → save → display." Wait.
5. ถ้าทุกอย่างถูกแต่ student บอกว่า "ผมไม่เห็นต่างจากเดิมเลย" (เพราะ section อื่นยาว step ใหม่หลบสายตา), ตอบ: "ปกติครับ. ลอง grep หรือถาม Claude หน้าต่าง 2: 'show แค่ section Steps และ section Latest earnings' Claude จะ extract ให้." Wait for re-show.

---

## Step 4: รัน /brief AAPL v2, เทียบกับ v1

เป้าหมาย: ดูด้วยตา ว่า section "Latest earnings" ของ v2 (มี sources/) ต่างจาก v1 (Lesson 2) ยังไง.

**ก่อนรัน, expectation:**

- ถ้า student ใส่ transcript จริงใน Step 2.5, Latest earnings ใน v2 ควร extract bullet จาก transcript นั้น และระบุไฟล์ต้นทางใน parens เช่น `(source: sources/AAPL/q1-2026-call.md)`.
- ถ้าเป็น placeholder fallback, Latest earnings ใน v2 ควรบอกตรงๆ ว่า "source ที่อ่านได้คือ placeholder ไม่มี earnings data จริง" ห้ามเดา
- ถ้า skill ยังไม่อ่าน `sources/` (แต่งตัวเลขเหมือนเดิม) ถือว่า edit Step 3 ไม่เข้าผล ต้อง troubleshoot

ACTION: Tell the student to do these 3 things in order:

0. ถ้าอยากเก็บ brief v1 ไว้เทียบ copy ไฟล์ `briefs/AAPL.md` ไปที่ `briefs/AAPL-v1.md` ก่อนรัน เพราะ `/brief AAPL` จะ overwrite ไฟล์เดิม.

1. ในหน้าต่าง 2 พิมพ์ `/brief AAPL` (หรือ ticker ที่เขาใช้ใน sources/).
2. รอ Claude ทำเสร็จ. Plan mode → approve.
3. เปิดไฟล์ `briefs/AAPL.md` (จะถูก overwrite จาก v1) แล้วเทียบ section "Latest earnings" ของ v1 (จำได้คร่าวๆ) กับ v2.

ตัวที่ student ควรสังเกต (บอกเขาก่อน paste):

- v2 Section "Latest earnings" ระบุไฟล์ต้นทางใน parens หรือยัง? เช่น `(source: sources/AAPL/q1-2026-call.md)`
- ถ้า source เป็น placeholder, v2 ต้อง honest ว่า "ไม่มี real news data" ไม่ใช่ "Apple ประกาศ X" ที่แต่งขึ้น
- 5 sections อื่น (Snapshot, Fundamentals, Bull/Bear, Kill conditions, What to ask) ยังครบเหมือน v1

---

STOP: บอกผม:

1. หน้าต่าง 2 รัน `/brief AAPL` ออก output ครบ 6 section ไหม
2. Section "Latest earnings" ตอนนี้:
   - ระบุไฟล์ต้นทาง `(source: ...)` ในแต่ละ bullet ไหม
   - ถ้า source เป็น placeholder, Claude honest ว่าไม่มี data จริง หรือยังแต่งตัวเลข
3. 5 sections อื่นยังเหมือน v1 ใช่ไหม (ไม่ได้ถูกลบ)

---

USER: [Waits for student to report v2 brief output]

---

ACTION: When the student responds:

1. **Latest earnings ใหม่ trace ไฟล์ + honest ว่า placeholder ไม่มี data จริง**, say "structural fix เข้าผลแล้ว. ที่นี้ Claude อ่านจริงไม่เดา." Move to Step 5.

2. **Latest earnings ยังเหมือน v1 (เดาตัวเลข ไม่ trace ไฟล์)**, แสดงว่า skill ไม่อ่าน sources/ ลำดับแก้:
   - paste ในหน้าต่าง 2: "เพิ่งรัน /brief AAPL, Claude อ่านไฟล์ใน `sources/AAPL/` ก่อนเขียน Latest earnings section หรือเปล่า? ถ้าไม่, ทำไม? show step ที่ skill `company-brief` ทำตาม."
   - ถ้า Claude ตอบ "ผมไม่ได้อ่าน sources/ เพราะ Step ใน SKILL.md ไม่ชัด" หรืออะไรประมาณนี้, paste: "รัน /brief AAPL ใหม่ ก่อนเขียน Latest earnings section, อ่านทุกไฟล์ใน `sources/AAPL/` แล้วเขียน Latest earnings ตามที่อ่านได้จริงเท่านั้น. ทุก bullet ต้องระบุ source path ใน parens."
   - ถ้ายังเหมือนเดิม, ปัญหาที่ Step 3 edit. paste: "show ปัจจุบันของ section ## Steps และ ### 3. Latest earnings ใน `.claude/skills/company-brief/SKILL.md`" → ถ้าไม่มี step "read sources/<TICKER>/" จริง, กลับไป Step 3 paste prompt อีกที.

3. **Latest earnings trace ไฟล์ แต่ใส่ข้อมูลที่ไม่มีในไฟล์** (เช่น Claude เขียน data point ที่ source ไม่ได้พูดถึง), ตอบ: "นี่ failure mode น่าระวัง. SKILL.md ห้ามแต่ง source แล้วแต่ Claude ยังลื่น. paste reminder: 'รัน /brief AAPL ใหม่ Latest earnings ห้ามมีข้อมูลที่ไม่ปรากฏในไฟล์ใน sources/AAPL/. ทุก bullet ต้อง quote หรือ paraphrase content ที่อยู่ใน source จริง.'"

4. **5 sections อื่นถูกลบไป** (เหลือแค่ Latest earnings), แสดงว่า edit Step 3 รุนแรงเกิน. paste: "ตรวจ SKILL.md ตอนนี้, section Output format ต้องครบ 6 sub-sections: Company snapshot, Fundamentals signal, Latest earnings, Bull/Bear, Kill conditions, What to ask. ถ้าขาดอะไร restore." Wait. Then re-run /brief.

5. ถ้า student replace ด้วย transcript จริง + Claude extract bullets จาก transcript ได้ดี, point out: "นี่คือ pattern ของจริง. source ใน sources/ เปลี่ยน, output ของ /brief เปลี่ยนตาม คุณ control quality ผ่าน source ที่คุณเลือก."

---

## Step 5: คุม cost ด้วย `/context` + model picker

skill ฉลาดขึ้นแล้ว แต่อาจเริ่มกิน token เยอะขึ้นเพราะอ่าน sources/ เพิ่ม. ก่อนปิด lesson เราต้องรู้ 2 อย่าง:

1. **กี่ % ของ context window ใช้ไปแล้ว** (Claude Code มีคำสั่งอย่างน้อย 1 ตัวบอกได้ ผมจะให้ student ลอง 2-3 รูปแบบ)
2. **Model ที่ใช้ตอนนี้คืออะไร** + เมื่อไหร่ควรสลับเป็น Haiku / Opus

**Honest หมายเหตุ:** ชื่อคำสั่งที่ใช้ดู context อาจต่างใน Claude Code version ของคุณ. **ผมไม่รู้ version ของคุณเป๊ะๆ.** เราทดสอบเอา ถ้า command 1 ตัวไม่ได้ผม fallback ตัวอื่น. Claude หน้าต่าง 2 ตอบให้ได้ว่า version ของคุณใช้คำสั่งไหน.

ACTION: Hand the student these prompts to paste **ทีละตัว** in window 2 (ไม่ต้อง paste พร้อมกัน):

**(a) ดู token usage:**

> ผมอยากดูว่า session นี้กิน context window ไปกี่ % แล้ว. Claude Code version ปัจจุบันของผมใช้คำสั่งหรือวิธีไหน? ลอง suggest 1-2 options ที่ work ใน version นี้ แล้วผมจะลองรัน.

(บาง version มี `/context`, บางตัวมี `/cost`, บางตัวมี statusline ด้านล่างที่โชว์ %, บางตัวต้องใช้ `/status`. ให้ Claude หน้าต่าง 2 บอกว่า version คุณรองรับอันไหน.)

**(b) ดู model ตอนนี้ + วิธีสลับ:**

> ตอนนี้ผมใช้ model อะไรในหน้าต่างนี้ (Sonnet, Opus, หรือ Haiku)? + วิธีสลับใน Claude Code version ปัจจุบันคืออะไร?

**(c) Concept: เมื่อไหร่ใช้ model ไหน:**

(อันนี้เป็น mental model, ไม่ paste ใน window 2. ผมเล่าใน window 1.)

**แนวทางของผม (Paint), ของง่าย ไม่ใช่ rule สากล:**

- **Sonnet** = default. งาน 80% ใช้ตัวนี้พอ. การเขียน /brief, ตอบ Q&A ทั่วไป, edit ไฟล์เล็กๆ
- **Opus** = งานยาก คิดเยอะ output สำคัญ. เช่น ตัดสินใจ thesis ใหญ่, refactor architecture, debug ที่ Sonnet ติด
- **Haiku** = งานซ้ำๆ ไม่ต้องคิดเยอะ. เช่น index ไฟล์, สรุป CSV, classify document

ใน Lesson 4 เรา split /brief เป็น 3 sub-agent, sub-agent บางตัว (เช่น "list ข่าวที่เห็นใน sources/") สามารถใช้ Haiku ก็ได้ เพราะ mechanical. ตอนนี้ทั้ง pipeline run บน Sonnet พอ.

**Cost intuition (ที่ผมใช้):** ถ้า session ปัจจุบันใช้ context > 70% แล้วงานยังไม่เสร็จ, นั่นคือ signal ว่าคุย session นี้ยาวไป. หรือ output มันเริ่มเลื่อนเลือน. วิธีแก้: เริ่ม session ใหม่ + sum สิ่งที่ทำเป็น summary สั้นๆ ใส่ใน chat ใหม่ ไม่ต้อง drag history เก่ามาทั้งหมด. นี่ pattern ที่หลายคนเรียก "context refresh."

---

STOP: บอกผม:

1. Claude หน้าต่าง 2 บอกคำสั่งดู token usage ของคุณคืออะไร? ลองรันแล้วได้ % เท่าไหร่
2. Model ตอนนี้คือ Sonnet / Opus / Haiku?
3. ของ "Sonnet default, Opus เฉพาะงานยาก, Haiku เฉพาะงานซ้ำๆ" make sense ไหม

---

USER: [Waits for student to report token usage + current model + concept understanding]

---

ACTION: When the student responds:

1. ถ้า student ได้ token % ออกมาจริง + model ปัจจุบันชัด, say "ดี ตอนนี้คุณรู้ว่าเครื่องมือกินไปกี่ %, รู้ว่าใช้ model ไหน. ไว้มีประโยชน์ตอน session ยาวๆ ที่รู้สึกว่า Claude เริ่มตอบช้าลง." Move to Step 6.

2. ถ้า command ที่ Claude แนะนำใช้ไม่ได้ (เช่น `/context` ไม่ existent ใน version ของ student), ตอบ: "ไม่เป็นไรครับ ของพวกนี้ change ระหว่าง version. paste อีกที ในหน้าต่าง 2: 'คำสั่งที่ผมลอง [ชื่อ command] ไม่ work. ลอง list คำสั่งทั้งหมดที่ Claude Code version นี้รับใน chat แล้วชี้ว่าตัวไหนดู context/token usage.' Claude จะ list ให้." Wait for fix.

3. ถ้า student บอก "ผมหาไม่เจอ statusline / model ก็ไม่รู้", ตอบ: "ของพวกนี้บางทีอยู่ใน setting page ของ Claude Code ไม่ใช่ chat. ลองถามใน chat หน้าต่าง 2 ตรงๆ: 'show วิธีดู status (model + token usage) ใน Claude Code version นี้, list step-by-step.' Claude version ปัจจุบันรู้คำตอบ."

4. ถ้า student งง concept "เมื่อไหร่ใช้ model ไหน", ตอบ: "ของง่ายๆ คือ: default ใช้ Sonnet. ถ้ามันตอบไม่ตรง / คิดผิด ลองสลับ Opus แล้วถามคำถามเดิม. ถ้างานเป็น list / count / extract ที่ไม่ต้องคิด ลอง Haiku ดู (จะเร็วกว่ามาก). คุณเลือก trial-and-error ภายในเดือนแรกก็พอ."

5. ถ้า student ถาม "ผมจ่ายเงินไหม", ตอบ honest: "ผมไม่รู้ plan ของคุณเป๊ะๆ. ถ้าคุณใช้ subscription Max ของ Anthropic, model สลับได้แต่ใน quota รายเดือน. ถ้าใช้ API key per-call, จ่ายตาม token Sonnet vs Opus vs Haiku ราคาต่างกัน 5-10 เท่า. ตรวจที่ console.anthropic.com / claude.ai billing ของคุณเอง." Don't fabricate numbers.

---

## Step 6: ปลาย lesson, bonus pattern + handoff

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste อะไรในหน้าต่าง 2)

ก่อนปิด Lesson 3 มี 3 อย่างที่อยากให้คุณรู้แต่ยังไม่ต้องทำ:

### Bonus 1: ทำไมแค่ earnings transcript? เครื่องมือเสริมเช่น NotebookLM อยู่ที่ไหน

วันนี้เราใช้แค่ earnings transcript เป็น source — เพราะมันคือเอกสารตรงจากบริษัท ไม่ใช่ข่าวที่คนอื่น interpret แต่บางครั้งคุณอยากใส่ source หลายไฟล์ (10-K + transcript + press release + ข่าวที่เราเชื่อถือ) ปัญหาคือ source ยิ่งเยอะ ยิ่งกิน context ของ Claude

เครื่องมืออย่าง **NotebookLM** ของ Google ช่วยตรงนี้ ใส่ source หลายอันใน notebook เดียว ถามคำถาม Q&A แล้ว save คำตอบกลับเป็น md ใน sources/ ของเรา NotebookLM ทำหน้าที่เหมือน **upstream curator** ก่อนผ่านมาที่ Claude Code

Pattern "two-tab NotebookLM workaround" ที่ใช้ได้เลยวันนี้:

1. เปิด NotebookLM (notebooklm.google.com) บน browser tab 1 สร้าง notebook ของหุ้นที่คุณดู (เช่น "AAPL Research") ใส่ source: PDF 10-Q, transcript, ข่าวที่คุณเชื่อ
2. ใน NotebookLM tab ถาม: "สรุปข่าวสำคัญของ AAPL last 30 days from sources, output as markdown bullets with source link"
3. Copy คำตอบ paste ใน `sources/AAPL/2026-notebooklm-summary.md` ในหน้าต่าง 2
4. รัน `/brief AAPL` skill อ่าน summary นั้นเหมือนทุก source อื่น

NotebookLM เป็น curator ของ source หลายไฟล์ paste-from-file (ที่เราเพิ่งทำ) คือ bridge ระหว่าง 2 เครื่องมือ ทำไม่ต้องในวันนี้ รู้ pattern ไว้พอ

### Bonus 2: Source curation discipline

source quality ของ /brief = quality ของ source ที่คุณใส่ **คุณคุมได้**

- ❌ random tweet, blog post คนที่คุณไม่รู้จัก, "stock guru" YouTube
- ✓ IR page ของบริษัท, SEC filing, earnings transcript จาก official call, FT/WSJ ที่คุณ subscribe

อันนี้ไม่ใช่ rule เป็น habit เริ่มเก็บ source แบบ curated เดือนละ 1 หุ้น ใน 6 เดือนคุณจะมี library ที่ skill ใช้ได้จริง

### Bonus 3: ถ้าทั้งหมดนี้ฟัง labor-intensive เกินไป

มี way to automate ทั้ง flow นะครับ ผมทำ video เรื่องนี้ไว้: https://youtu.be/nnD1w2hlAdk?si=zVdb4-Sf0VujJcN1

ลองดูถ้าอยากให้ระบบสะสม source อัตโนมัติ ไม่ต้อง paste ทุกครั้ง

---

STOP: ทั้ง 3 bonus pattern make sense ไหม ถ้าใช่พิมพ์ "ok" มีคำถามอะไรก่อน wrap up

---

USER: [Waits for student to confirm understanding or ask questions]

---

ACTION: When the student responds:

1. ถ้า student บอก "ok", move to wrap up + handoff.
2. ถ้าถาม "ผมต้องลง NotebookLM CLI ไหม", ตอบ: "ไม่ต้องในคอร์สนี้ครับ. CLI มีแต่ beginner-hostile (Python install + Google OAuth). web NotebookLM + paste-from-file = pattern เดียวกันใน 80% ของกรณี. CLI เก็บไว้เมื่อคุณ workflow scale มากเท่านั้น."
3. ถ้าถาม "Lesson 4 จะ split /brief เป็น sub-agents ไง สลับ model ที่นั่นไหม", ตอบ: "ใช่ครับ Lesson 4 sub-agent บางตัว (เช่นตัวที่อ่าน sources/ แล้ว extract bullets) จะสลับเป็น Haiku ได้ เพราะงาน mechanical. ตัวที่ตัดสินใจ Bull/Bear / Kill conditions ใช้ Sonnet หรือ Opus. คุณจะเห็น cost ลงเองหลัง split."
4. ถ้าถาม "ถ้า Claude อ่าน PDF ใน sources/ ได้ ผม save 10-K PDF เลยได้ไหม", ตอบ: "ได้ครับ Claude Code version ปัจจุบันอ่าน PDF ได้ตรง. ระวัง 10-K ใหญ่ (200+ pages) จะกิน token เยอะ. Lesson 5 / advanced จะคุยเรื่อง chunking PDF ใหญ่. ตอนนี้ใช้ excerpt ของ section สำคัญ (MD&A, Risk Factors) พอ."

---

## Step 7: เช็คความเรียบร้อย + ปิดท้าย

ก่อนปิด Lesson 3 เช็ค checklist:

1. มี folder `sources/` ที่ root ของ `my-first-project` + `sources/README.md`
2. มี `sources/<TICKER>/<filename>` อย่างน้อย 1 ไฟล์ (placeholder หรือของจริง)
3. SKILL.md edited: section Steps มี "อ่าน sources/<TICKER>/" + section Latest earnings บังคับ trace ไฟล์
4. รัน `/brief <TICKER>` ใหม่: section Latest earnings ระบุ source path ใน parens หรือ honest ว่า placeholder ไม่มี data
5. รู้คำสั่งดู token usage ใน Claude Code version ของคุณ + รู้ว่า session นี้ใช้กี่ %
6. รู้ว่า model ปัจจุบันคืออะไร + concept Sonnet default / Opus งานยาก / Haiku งานซ้ำ
7. หน้าต่าง 2 (folder `my-first-project`) ยังเปิด, Lesson 4 ใช้ต่อ

---

STOP: ทั้ง 7 ข้อ ผ่านครบไหม? ตอบในหน้าต่าง 1.

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. ถ้าผ่าน 6-7/7, say "ครบ Lesson 3 ผ่าน. /brief ตอนนี้อ่าน external source จริง + คุณเริ่มเห็น cost ของ session ตัวเอง." Move to "What just happened" + Common Stumbles + handoff.
2. ถ้าผ่าน 4-5/7, focus แก้ข้อที่ค้าง. ห้ามขึ้น Lesson 4 ถ้า ข้อ 3 หรือ ข้อ 4 ค้าง (structural blocker, Lesson 4 build ต่อจาก v2 brief นี้).
3. ถ้าผ่าน <4/7, suggest กลับไป step ที่ค้าง. ข้อ 5+6 (cost / model) ถ้ายังไม่เห็นผ่านได้, partial pass OK ตราบที่รู้ว่า command อะไรลองได้. รายละเอียดจะคุ้นเองเมื่อใช้เยอะขึ้น.

---

## What just happened (สรุปสั้นๆ)

ใน 15 นาทีที่ผ่านมา คุณ:

1. เข้าใจว่า training cutoff คืออะไร และทำไม Latest earnings ของ /brief v1 weak
2. สร้าง folder `sources/` + ใส่ source แรก (placeholder หรือของจริง)
3. แก้ SKILL.md ให้อ่าน `sources/<TICKER>/` ก่อนเขียน Latest earnings + บังคับ trace ไฟล์ใน output
4. รัน /brief AAPL v2 ดู section Latest earnings ที่ตอนนี้อ่านจาก source จริง
5. รู้คำสั่งดู token usage ใน Claude Code version ของคุณ + รู้ pattern เลือก model ตามงาน

`/brief` ตอนนี้ honest กว่าเดิมเยอะ. section Latest earnings trace กลับไปไฟล์ได้, ไม่ใช่ "Claude เดาจากความน่าจะเป็น."

ที่ยัง weak อยู่:

- ทำงาน sequential ทีละ section เปลือง token (Lesson 4 แตก 3 sub-agent ขนาน + บาง sub-agent ใช้ Haiku ลด cost)
- ใช้ในเครื่องคุณคนเดียว (Lesson 5 deploy showcase)

แต่ตอนนี้ pipeline ของ /brief ของคุณมี 4 layer พร้อมแล้ว: skill SOP + voice + external source + cost awareness. นี่คือโครงของเครื่องมือลงทุนของคุณเอง.

---

## Common stumbles (ถ้าติดตรงไหน)

- **Latest earnings ยังเหมือน v1 ไม่ trace ไฟล์** SKILL.md ไม่อ่าน sources/. ตาม Step 4 ACTION ข้อ 2: ถาม Claude หน้าต่าง 2 ทำไม + show step ปัจจุบันของ skill. ถ้าจริงๆ Steps section ไม่มี "read sources/" กลับ Step 3 paste prompt ใหม่.
- **Claude เปิด `sources/` ไม่เจอ** ตรวจ path ต้องเป็น `sources/<TICKER>/` ที่ root ของ project (ระดับเดียวกับ `briefs/`, `.claude/`). ไม่ใช่ใน `.claude/sources/`. ถ้าผิดที่ paste: "ย้าย sources/ ไปที่ root" ในหน้าต่าง 2.
- **Source file ใส่แล้วแต่ Claude ไม่อ่าน** อาจเพราะ encoding ของไฟล์ (binary PDF ที่ Claude version คุณยังไม่รองรับ). ทดลอง save เป็น `.md` หรือ `.txt` plain text ก่อน. ถ้า PDF แน่ใจว่ารองรับ ถาม Claude หน้าต่าง 2: "อ่านไฟล์ `sources/AAPL/<filename>.pdf` ได้ไหม show paragraph แรก."
- **PDF ใหญ่กิน token เยอะ** 10-K 200 หน้ากิน 100K+ tokens. ใช้ excerpt section ที่สำคัญ (MD&A, Risk Factors) แทน. Lesson หลังจะคุยเรื่อง chunking.
- **`/context` หรือ `/cost` ไม่ถูก recognize** version ของ Claude Code คุณอาจใช้ชื่อต่าง. ถาม Claude หน้าต่าง 2: "list คำสั่ง slash ทั้งหมดที่ session นี้รับ" Claude จะ enumerate ให้.
- **Model สลับใน chat ไม่ได้** บาง version model picker อยู่ใน setting / preference page, ไม่อยู่ใน chat UI. ถาม Claude หน้าต่าง 2: "show me the exact UI step to switch model in this Claude Code version" Claude version ปัจจุบันรู้ทาง.
- **Latest earnings bullets มี source path แต่ paths ผิด** Claude สร้าง path ที่ไม่มีอยู่. paste reminder: "ทุก path ใน Latest earnings ต้อง verify ว่ามีจริงใน `sources/<TICKER>/`. show actual file list ก่อนเขียน."
- **paste prompt ผิดหน้าต่าง** prompt ทั้งหมดต้องไปหน้าต่าง 2. ถ้าเผลอ paste ในหน้าต่าง 1 (ที่ผมพูดอยู่) ผมจะตอบเหมือน Claude ปกติ แต่ไฟล์จะไปสร้างใน folder คอร์ส `ltd-ai-101` ไม่ใช่ folder ของคุณ. ลบไฟล์ที่หลงสร้างใน `ltd-ai-101` แล้วสลับไปหน้าต่าง 2.

ถ้าหาทางออกไม่ได้จริงๆ comment มาในคลิปคอร์ส ผมก็เพิ่งหัดเหมือนกัน.

---

## พร้อมขึ้น Lesson 4 ยัง

ก่อนขึ้นบทถัดไป ตรวจอีกครั้งว่า:

- มี folder `sources/<TICKER>/` + source file อย่างน้อย 1 ตัว
- SKILL.md edited ให้อ่าน sources/ ก่อนเขียน Latest earnings
- รัน /brief <TICKER> ออก Latest earnings ที่ trace กลับ source path ได้
- รู้คำสั่งดู token usage + รู้ model ปัจจุบัน
- หน้าต่าง 2 (folder `my-first-project`) ยังเปิด

พิมพ์ `Start Lesson 4` ในหน้าต่างนี้ (หน้าต่าง 1 = `ltd-ai-101`) แล้วเปิดหน้าต่าง 2 ค้างไว้.

---

STOP: ทั้ง 5 ข้อข้างบน ผ่านครบหรือยัง? ถ้าครบ พิมพ์ "Start Lesson 4". ถ้ายังขาด บอกผมตรงข้อไหน เราเก็บก่อนไปต่อ.

---

USER: [Waits for student to confirm readiness or report missing artifact before moving to Lesson 4]

---

ACTION: When the student types "Start Lesson 4" or anything that signals they're ready (e.g., "พร้อมแล้ว", "ไปต่อ", "next lesson"), read the file at `lesson-modules/4-subagents/CLAUDE.md` and begin Lesson 4 from its instructions.

If they ask a question or want to revisit something from Lesson 3, answer it. Don't move on until they say they're ready.

If the file `lesson-modules/4-subagents/CLAUDE.md` doesn't exist yet (course is still being shipped lesson by lesson), tell them: "Lesson 4 ยังไม่ ship ครับ คอร์สนี้ทยอยปล่อยทีละบท. เก็บ sources/ + SKILL.md v2 ไว้แบบนั้น Lesson 4 จะ build ต่อจาก /brief v2 นี้โดยตรงด้วยการแตก 3 sub-agents ขนาน. ไว้เจอกัน."
