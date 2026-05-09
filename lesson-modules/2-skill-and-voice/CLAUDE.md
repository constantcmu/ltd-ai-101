---
provenance: subagent:ada
lesson: 2
title: Skill + Voice. ทำให้ /brief ฉลาดขึ้น
---

# Lesson 2: Skill + Voice. ทำให้ /brief ฉลาดขึ้น

**Time: ~15-20 min**

**You'll finish with:** `/brief TICKER` ที่ออกผลตาม SOP คงที่ทุกครั้ง (ไม่ใช่แค่ prompt ดิบๆ แบบ Lesson 1) แล้วก็ได้สีของนักลงทุน "คุณเอง" เข้าไปด้วย, ผ่านการเขียน skill (`.claude/skills/company-brief/SKILL.md`) บวกกับเพิ่มย่อหน้าสั้นๆ เรื่องสไตล์ลงทุนของคุณใน `my-first-project/CLAUDE.md`. ปิดท้ายเรารัน `/brief AAPL` ใหม่ ดู output ว่าต่างจาก Lesson 1 ยังไง.

Window 1 (folder `ltd-ai-101`) ยังเป็นผม Window 2 (folder `my-first-project`) ยังเปิดต่อจาก Lesson 1 ห้ามเพิ่งปิด

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

## What you're building today

Lesson 1 จบที่ `/brief AAPL` ทำงานได้ "พอใช้ได้" แต่ output มันคุมไม่ได้:

- บางรันมี 4 section บางรันขาด
- ภาษาเขียนเหมือน analyst ฝรั่งทั่วไป ไม่ใช่ของคุณ
- ไม่มี kill condition (ตัวที่บอกว่าเมื่อไหร่ควรเลิกถือ)
- ไม่ได้ honest เรื่องไม่รู้ บางครั้งแต่งข่าวขึ้นมาเอง

Lesson 2 แก้ 2 อย่าง:

1. **Skill** = SOP ที่บอก Claude ว่า "ทุกครั้งที่รัน /brief เดินตามขั้นนี้ ออก format นี้"
2. **CLAUDE.md voice** = ย่อหน้าสั้นๆ เล่าว่าคุณลงทุนยังไง, Claude อ่านทุก session แล้วใส่สีของคุณลง output

ปลาย Lesson 2 รัน `/brief AAPL` ในหน้าต่าง 2 อีกที output จะ structurally แน่นกว่าเดิม + อ่านแล้วรู้สึกเหมือนของคุณเขียนเอง.

---

ACTION: Greet the student briefly in Thai. Confirm starting Lesson 2 (~15-20 นาที). Then ask:

"ก่อนเริ่ม Lesson 2 ขอ verify ของจาก Lesson 1 ก่อนนะครับ. ในหน้าต่าง 2 (folder `my-first-project`) ลองพิมพ์:

```
list ไฟล์: CLAUDE.md, .claude/commands/brief.md, briefs/ (รวมไฟล์ใน briefs/)
```

หรือถ้าอยากแน่ใจกว่า ลอง paste:

`อ่านไฟล์ CLAUDE.md ที่ root ของ project แล้ว show บรรทัดแรกมา`

ถ้า Claude อ่านไม่ได้แสดงว่าไฟล์หายจริง.

แล้วบอกผมว่า Claude หน้าต่าง 2 ตอบว่ามีครบทั้ง 3 อย่างไหม."

---

STOP: Wait for the student to confirm L1 artifacts exist:
1. `CLAUDE.md` ที่ root ของ `my-first-project`
2. `.claude/commands/brief.md`
3. ไฟล์อย่างน้อย 1 ตัวใน `briefs/` (เช่น `briefs/AAPL.md`)

และยืนยันว่า window 2 ยังเปิดอยู่ที่ folder `my-first-project`.

---

USER: [Waits for student to confirm all 3 L1 artifacts + window 2 still open]

---

ACTION: When the student responds:

1. If all 3 artifacts exist AND window 2 is still at `my-first-project`, say "ดีครับ Lesson 1 ของแน่นเดินต่อได้." Move to Step 1.
2. If any artifact is missing, do NOT proceed. Tell them: "ขาด [item ที่หาย] กลับไปเก็บที่ Lesson 1 Step [ที่ตรงกัน] ก่อนนะครับ Lesson 2 ใช้ของพวกนี้ต่อ. พิมพ์ `Start Lesson 1` ในหน้าต่างนี้ถ้าอยากเริ่มใหม่ หรือบอกผมตรงๆ ว่า step ไหนค้าง ผมพาเก็บเฉพาะ step นั้นได้." Wait for fix before continuing.
3. If window 2 was closed, ask them to reopen Claude Code at the `my-first-project` folder before continuing. Don't proceed without window 2.
4. If they used a different folder name in L1 (not `my-first-project`), note that name and use it whenever this lesson references `my-first-project`.

---

## Step 1: Slash command vs Skill (ต่างกันยังไง)

ก่อน paste อะไร เราเข้าใจคำ 2 คำนี้ก่อน เพราะ Lesson 2 ทั้งบทอยู่ที่ความต่างของมัน.

**Slash command** ที่คุณสร้างใน Lesson 1 (`/brief`) คือ "ปุ่มลัด", Claude อ่าน prompt สั้นๆ ในไฟล์ `brief.md` แล้วทำตาม. มันคือ **shortcut prompt** เปลี่ยนแค่ 1-2 ประโยคก็จบ.

**Skill** คือ **SOP** (Standard Operating Procedure), เอกสารยาวกว่า บอก Claude ว่า "ถ้าเจองานแบบนี้ เดิน step นี้ ใช้ format นี้ มี checklist อันนี้". Skill เป็นเอกสารวิธีการ ไม่ใช่ prompt สั้น.

Analogy ที่ผมใช้ คือร้านกาแฟ:

- **Slash command** = ปุ่มเครื่อง POS "Latte" คนกดแล้วบาริสต้าทำ Latte (รู้แต่ชื่อเมนู)
- **Skill** = สูตร Latte ในเล่มคู่มือร้าน บอกตั้งแต่ grind size, ratio, milk temp, pour pattern (เดินทุกขั้น เหมือนกันทุกแก้ว)

ปุ่มเรียกได้ครั้งเดียวกด เร็ว แต่ผลออกไม่คงเส้นคงวา. สูตรในเล่ม ผลคงที่ทุกแก้ว แต่เขียนยาวกว่า.

**ในคอร์สนี้เราใช้ทั้ง 2 ตัว:** Lesson 1 เริ่มที่ slash command เพราะมันสั้นพอให้รู้สึกได้ก่อนว่า "ปุ่มลัด" ทำงานยังไง. Lesson 2 ยกระดับขึ้นเป็น skill เพราะ stock brief เป็นงานที่ output ต้องคงเส้นคงวา.

**Skill discovery (วิธีที่ skill โดนเรียกขึ้นมา) ทำงานได้ 3 แบบใน Claude Code, ขึ้นกับ version:**

1. **Auto-invoke**: Claude เห็นว่างานตรงกับ description ใน frontmatter ของ skill เลยเรียกเอง
2. **Explicit invocation**: คุณพิมพ์ชื่อ skill ตรงๆ (เช่น "ใช้ skill company-brief กับ AAPL")
3. **User asks Claude**: ถ้าเงียบไป คุณถาม Claude หน้าต่าง 2 ตรงๆ ว่า "ทำไม skill ไม่ fire" Claude version ปัจจุบันรู้คำตอบเอง

ไม่ต้องจำว่า version คุณใช้แบบไหน. **อย่างใดอย่างหนึ่งจะทำงาน** ตอน paste จริงใน Step 4. ถ้าตัวแรกไม่ติด ตัวสองหรือสามจะติด.

ย่อสั้นๆ:

| | Slash command | Skill |
|---|---|---|
| ความยาว | สั้น 1 prompt | ยาว เป็น SOP เต็ม |
| ใช้ตอน | งาน trigger ด้วยปุ่มลัด | งานที่ต้องการ output คงที่ |
| ที่อยู่ไฟล์ | `.claude/commands/<name>.md` | `.claude/skills/<name>/SKILL.md` |

---

STOP: เข้าใจความต่างประมาณ 70% ก็พอครับ ส่วนที่เหลือจะรู้สึกได้เองตอนเรา paste ใน step ถัดไป. พิมพ์ "ok" หรือถามตรงไหนยังงง.

---

USER: [Waits for student to confirm understanding or ask clarifying questions]

---

ACTION: When the student responds:

1. If they say "ok" or anything affirmative, say "ไปสร้าง skill กัน" และไป Step 2.
2. ถ้าเขาถาม "แล้ว slash command อันเก่ายังใช้ได้ไหม", ตอบ: "ยังใช้ได้ครับ. Lesson 2 เราเก็บ slash command อันเดิมไว้ และเพิ่ม skill อีกตัวเข้ามา. ตอนรัน `/brief` Claude จะอ่านทั้ง 2 ที่, slash command บอก trigger, skill บอกขั้นตอนละเอียด. ผมไม่ได้รีบบอกตอนนี้ เพราะ rule แท้จริงเรา verify ด้วย demo ใน Step 4."
3. ถ้าถาม "ทำไมต้องสร้างทั้ง 2 อย่าง", ตอบ: "ถ้าจะ minimal ที่สุดสามารถใช้ skill อย่างเดียวก็ได้ในบาง version. แต่ Lesson 2 เก็บ slash command ของ Lesson 1 ไว้ก่อน เพื่อให้คุณเห็นด้วยตาว่ามันต่างกันยังไง. Lesson หลังถ้าจำเป็นเราจะ refactor."

---

## Step 2: สร้าง skill `company-brief`

Skill 1 ตัวอยู่ใน folder ของตัวเอง: `.claude/skills/company-brief/SKILL.md`. ชื่อ folder = ชื่อ skill. ไฟล์ข้างในชื่อ `SKILL.md` (ตัวพิมพ์ใหญ่ทั้ง 5 ตัว เป็น convention ที่ผมใช้ เพื่อให้หา skill ได้ง่าย. บาง version อาจรับ lowercase ด้วย แต่ uppercase ปลอดภัยกว่า).

Skill ที่ดีมี 2 ส่วน:

1. **Frontmatter** ด้านบน (frontmatter คือ block ข้อมูล metadata ด้านบนสุดของไฟล์ ระหว่าง --- ทั้งบนล่าง. yaml คือ format key-value ในนั้น คล้ายตาราง field-value ใน Excel แต่เขียนเป็น text) (block yaml ระหว่าง `---`), บอก Claude ว่าใช้ skill นี้ตอนไหน. Field สำคัญ: `name` (ชื่อ skill), `description` (เมื่อ Claude ควรเรียก skill นี้). **ผมขอ honest ตรงนี้**, frontmatter spec ของ skill อาจ evolve ระหว่างผมอัด video กับวันที่คุณเรียน. ถ้า Claude หน้าต่าง 2 บ่นเรื่อง field ขาดหรือเพี้ยน ให้ถาม Claude ตรงๆ ใน window 2 ว่า "frontmatter ของ skill ปัจจุบันต้องมี field อะไรบ้าง", Claude version ปัจจุบันรู้คำตอบเอง.

2. **Body** = SOP เป็นภาษาคนปกติ บอก Claude ว่า "ทำตามนี้ทีละ step".

หมายเหตุสั้นๆ ก่อน paste: ใน Voice rules ของ skill นี้จะมีคำว่า **Helmer's 7 Powers** (7 Powers คือ framework ของ Hamilton Helmer ที่แบ่ง competitive advantage เป็น 7 แบบ specific เช่น Scale Economies, Network Economies, Switching Costs ถ้ายังไม่รู้จัก ลองเสิร์ชชื่อเล่นๆ ดู หรือผ่านไปก่อน skill ใช้แค่ enforce ให้ specific). เจอแล้วไม่ต้องตกใจ skill แค่บอกให้ใช้ชื่อ competitive advantage ที่ specific แทนคำกว้างๆ.

ACTION: Hand the student this prompt to paste in **window 2** (folder `my-first-project`) Tell them: "ก็อปทั้งบล็อคนี้ paste ใน chat ของหน้าต่าง 2 แล้วกลับมาบอกผม"

````text
สร้างไฟล์ใหม่ที่ .claude/skills/company-brief/SKILL.md ด้วยเนื้อหาตามนี้:

---
name: company-brief
description: Use when the user asks for a research brief on a public stock (e.g. "/brief AAPL", "ทำ brief NVDA ให้หน่อย", "research TSLA"). Outputs a 6-section markdown brief saved to briefs/<TICKER>.md.
---

# company-brief SOP

## When to use this

ผู้ใช้ขอ research brief ของหุ้น 1 ตัว Trigger ทั่วไป:
- `/brief <TICKER>` slash command
- "ทำ brief หุ้น X ให้หน่อย"
- "ขอข้อมูลย่อๆ ของ <ticker>"

## Inputs you need

- 1 stock ticker (เช่น AAPL, NVDA, GOOGL)
- ถ้าไม่มี ticker ให้ ask before doing anything else

## Steps

1. Confirm the ticker. ถ้า ambiguous (เช่น "META" อาจหมายถึงหลายบริษัทใน history) ask user to confirm
2. Read `CLAUDE.md` ที่ root ของ project ใน CLAUDE.md จะมีย่อหน้า investing voice ของ user, output ต้องสะท้อนสไตล์นั้น (focus, framing, kill-condition discipline)
3. Research บริษัทจากความรู้ที่มี ถ้าไม่รู้ข้อมูลล่าสุดจริง say so honestly, don't guess ห้ามแต่งชื่อคน, วันที่, ตัวเลข ที่ verify ไม่ได้
4. ถ้า folder `briefs/` ยังไม่มี ให้สร้าง
5. Save brief ที่ `briefs/<TICKER>.md` (uppercase ticker)
6. แสดง brief เต็มกลับใน chat ด้วย

## Output format (6 sections, required, no skipping)

ใช้ markdown headings ทั้ง 6 section ต้องมี ครบทุก brief

### 1. Company snapshot (3-4 ประโยคไทย)
บริษัททำอะไร, ขายให้ใคร, รายได้หลักมาจากไหน ภาษาคนปกติ ไม่เอาคำตลาด

### 2. Fundamentals signal (3-5 bullets)
Revenue trend, margin trend, balance sheet feel, capital allocation pattern **เน้น direction มากกว่าตัวเลข** เพราะตัวเลขเฉพาะอาจเก่า ถ้า ratio/margin specific ที่ไม่แน่ใจ ให้ใส่ "(ตัวเลข ตรวจสอบใน 10-K ล่าสุด)" ต่อท้าย

### 3. Latest earnings
3-5 bullets อิงจาก quarterly earnings call ล่าสุดเท่าที่ training data รู้ **ถ้าไม่แน่ใจว่า quarter ล่าสุดของจริงคืออะไร ให้บอกตรงๆ** ว่า "ผมไม่แน่ใจว่า quarter ล่าสุดที่ออกแล้วคืออะไร, อิงจากที่ผมรู้คือ Q[N] FY[Y]" ห้ามแต่งตัวเลขเฉพาะเจาะจง (revenue + segment + guidance ที่ verify ไม่ได้) เราใช้ earnings transcript เป็น source ของ section นี้ (Lesson 3 จะ feed transcript จริงเข้ามาแทน training memory) ไม่ใช่ news article ที่คนอื่นเขียน เพราะ earnings call คือเอกสารตรงจากบริษัท fact-checkable

### 4. Bull case / Bear case
2-3 bullets แต่ละข้าง Bear case ต้อง substantive ไม่ใช่ "เศรษฐกิจไม่ดี" ต้องเป็นเหตุผลที่ specific to บริษัทนี้

### 5. Kill conditions (สำคัญ อย่าข้าม)
2-3 bullets "ถ้าเห็นอะไรเกิดขึ้น ผม/คุณควรเลิกถือ" ตัวอย่าง: "margin ลดลง 3 quarter ติด", "ลูกค้า top-3 หายไป 1 ราย", "CEO ออก + replacement weak" Kill conditions เป็นข้อเดียวที่กันให้ thesis ไม่กลายเป็น religion

### 6. What to ask before owning it (3-5 questions)
คำถามที่ beginner ควรตอบให้ได้ก่อนกดซื้อ ไม่ใช่คำตอบ เป็น question prompt

## Voice rules

- Tone reflect investing voice ใน `CLAUDE.md` ของ project ถ้า CLAUDE.md บอก "long-term focus" ห้าม brief เน้น short-term trading angle
- **ห้าม** ออก buy/sell recommendation นี่คือ research summary ไม่ใช่คำแนะนำ
- **ห้าม** แต่ง verbatim quote ของ executive ใส่ blockquote ถ้าจะอ้างคำผู้บริหาร ใช้ indirect speech ("CEO กรอบ message ว่า...") ห้ามใส่ `>` quote ที่ verify ไม่ได้
- **ห้าม** ใช้คำว่า "moat" ตรงๆ ใช้ Helmer's 7 Powers ที่ specific (Scale Economies, Network Economies, Switching Costs, Branding, Counter-Positioning, Cornered Resource, Process Power) ถ้าจะพูดเรื่องความได้เปรียบ
- **ห้าม** บอกว่า "ตลาดยังไม่ price in" หรือทำนายว่านักลงทุนคนอื่นคิดอะไร

## When unsure

Honest > confident ถ้าข้อมูลไม่พอ พูดว่า "ผมไม่แน่ใจ ลองดูใน [source ที่ user ใช้]" ดีกว่าแต่ง

ทำเลย
````

---

STOP: บอกผม:

1. Claude ในหน้าต่าง 2 ตอบยังไง? (สร้างไฟล์เลยหรือถามขอ approve ก่อน)
2. ถ้าสร้างแล้ว ลองถาม Claude ในหน้าต่าง 2 ว่า "show full path of SKILL.md ที่เพิ่งสร้าง", path ต้อง = `.claude/skills/company-brief/SKILL.md` เป๊ะๆ.

---

USER: [Waits for student to confirm SKILL.md created at correct path]

---

ACTION: When the student responds:

1. If file exists at exactly `.claude/skills/company-brief/SKILL.md`, say "ดี skill ถูกที่. เหลืออีกอันเดียว, เสียงนักลงทุนของคุณ." Move to Step 3.
2. **Plan-mode branch:** ถ้า Claude ในหน้าต่าง 2 ขอ approve ก่อน (Plan mode), บอก student: "หน้าต่าง 2 อยู่ใน Plan mode ครับ. approve plan ของ Claude ไปก่อน หรือสลับเป็น Auto mode แล้ว paste prompt อีกที. รอจน Claude สร้างไฟล์เสร็จแล้วค่อยบอกผม path ในหน้าต่าง 1." Wait until file exists.
3. ถ้า path ผิด (เช่น `skills/company-brief/SKILL.md` ขาด `.claude/` ข้างหน้า, หรือ filename เป็น `skill.md` ตัวพิมพ์เล็ก), ให้ paste ในหน้าต่าง 2: "ย้ายไฟล์ไปที่ `.claude/skills/company-brief/SKILL.md` (ตัวพิมพ์ใหญ่ครบ 5 ตัว)." Wait for fix.
4. ถ้า Claude ในหน้าต่าง 2 บอกว่า "frontmatter format นี้ไม่ตรงกับ spec ปัจจุบัน" หรือมี warning เรื่อง field, ให้ paste: "บอก field frontmatter ของ skill ที่ Claude Code version ปัจจุบันคาดหวัง แล้วแก้ไฟล์ตามนั้น เก็บ description กับ name เดิมไว้." Wait for fix. Don't argue, Claude in window 2 has the current spec.
5. ถ้า `.claude/` folder ยังไม่ปรากฏใน file tree, นั่นปกติ (hidden folder). path verification ผ่าน chat ของหน้าต่าง 2 คือ source of truth.

---

## Step 3: เพิ่มเสียงนักลงทุนใน CLAUDE.md

ตอนนี้ skill มี SOP แล้ว แต่ output ยังเขียนเป็น generic analyst voice. เราใส่สีของคุณลงไป.

วิธี: เปิด `CLAUDE.md` ที่ root ของ `my-first-project` เพิ่มย่อหน้า 1-2 ย่อ บอก Claude ว่า "เวลาผม research หุ้น ผมสนใจอะไร ผมหลีกเลี่ยงอะไร". Claude อ่านไฟล์นี้ทุก session, voice นี้จะ leak ลง output ของ skill.

**ตัวอย่างเสียงของผม (Paint)** ใช้เป็น reference เฉยๆ. **อย่า copy เสียงผมตรงๆ** เขียนของคุณเอง ดูตัวอย่างเพื่อให้รู้ shape ของย่อหน้า.

> ผมลงทุนสไตล์ long-term (ถือ 3+ ปี). ดู fundamentals ก่อน, revenue durability, margin trend, ใครเป็นลูกค้า, capital allocation. ผมเลี่ยงหุ้นที่ thesis อยู่กับ macro หรือ Fed move. ผมต้อง name kill condition ให้ได้ก่อนกดซื้อทุกครั้ง, ถ้านึกไม่ออกว่าเมื่อไหร่ควรเลิกถือ แสดงว่าผมไม่เข้าใจหุ้นพอ. ผม honest เรื่องไม่รู้, ตัวเลขที่ verify ไม่ได้ผมไม่ใส่ confidence. ผมไม่ทำนายว่าตลาดคิดอะไร ผมพูดถึงสิ่งที่ผมเห็นในธุรกิจ.

ของคุณอาจต่าง. short-term ก็ได้ ถ้าใช่จริง. focus dividend yield ก็ได้. หลีกเลี่ยง biotech ก็ได้. **เขียน honest เกี่ยวกับวิธีที่คุณตัดสินใจจริงๆ** ไม่ใช่วิธีที่หนังสือบอก.

ACTION: Hand the student this prompt to paste in **window 2** Tell them: "ก่อน paste ขอเขียนย่อหน้า 1-2 ย่อสไตล์ลงทุนของคุณก่อน ใส่แทน `[เขียนของคุณตรงนี้]` ในข้อความนี้ ไม่ต้องสมบูรณ์แบบ เขียนของจริง แล้ว paste ทั้งบล็อคใน chat ของหน้าต่าง 2"

````text
เปิดไฟล์ CLAUDE.md ที่ root ของ project แล้วเพิ่ม section ใหม่ต่อท้าย (หลัง section ที่มีอยู่แล้ว ไม่ใช่แทนที่):

## How I invest (voice for /brief output)

[เขียนของคุณตรงนี้: 1-2 ย่อหน้า บอกว่าคุณลงทุนสไตล์ไหน (long-term/short-term?), focus อะไร (fundamentals? dividend? momentum?), หลีกเลี่ยงอะไร, รอบ horizon เท่าไหร่ honest เกี่ยวกับวิธีตัดสินใจจริง ไม่ใช่ถ้อยคำสำเร็จรูป]

Skill `company-brief` ต้องสะท้อนเสียงนี้ใน output ทุกครั้ง ใน Bull/Bear, Kill conditions, และ "What to ask" sections โดยเฉพาะ

ทำเลย append section นี้ ห้ามลบของเดิม
````

---

STOP: บอกผม:

1. Claude ในหน้าต่าง 2 ตอบยังไง? (append สำเร็จไหม)
2. เปิดไฟล์ `CLAUDE.md` ดูสิ มี section "How I invest" ใหม่อยู่ท้ายไฟล์ไหม + ของเดิม (Project header, วิธีทำงาน, What lives where, ห้าม) ยังอยู่ครบไหม.

---

USER: [Waits for student to confirm CLAUDE.md updated, voice section appended, original sections intact]

---

ACTION: When the student responds:

1. If section appended AND original content intact, say "ดี เสียงเข้าไปแล้ว ลองรัน /brief ดูว่าต่างจากเดิมยังไง." Move to Step 4.
2. **Plan-mode branch:** ถ้า Claude ขอ approve ก่อน (Plan mode), บอก: "approve plan แล้ว Claude จะ append. ถ้า Plan mode บอกว่าจะ overwrite ทั้งไฟล์, reject ก่อน แล้ว paste ใหม่บอก 'append เท่านั้น ห้ามแทนที่ของเดิม'." Wait for clean append.
3. ถ้า Claude **แทนที่** ไฟล์ทั้งก้อนแทนที่จะ append (lost original content), ให้ paste ในหน้าต่าง 2: "เพิ่งทำผิด, restore original CLAUDE.md content (Project: My First Project header, วิธีทำงาน, What lives where, ห้าม sections) แล้ว append section 'How I invest' ที่ user เขียนต่อท้าย." Wait for fix.
4. ถ้า student เขียน "How I invest" sparse มาก (1 ประโยค), ไม่ต้อง push เพิ่ม. นี่ first pass. ตอน Lesson หลังหรือ video หลัง student อาจขยายเอง. แต่ถ้า empty (ไม่ได้แทนที่ placeholder), ให้ paste แทนที่ด้วย: "ขอ student ใส่อย่างน้อย 2-3 ประโยคเรื่องวิธีลงทุน, Claude อ่าน section ที่ว่างจริงไม่ได้." Then re-run prompt. ถ้ายังตัน ใช้ 3 คำถามใน ข้อ 5 ก่อน.
5. ถ้า student ถาม "ผมเขียนอะไรไม่ออก", ให้ตอบ: "ลองตอบ 3 คำถามสั้นๆ: (a) ถือยาวกี่ปี (b) ดูอะไรก่อน (PE? revenue growth? dividend?) (c) หุ้นแบบไหนจะไม่แตะ (penny stock? crypto-related? leveraged ETF?). 3 คำตอบนี้คือเสียงคุณแล้ว." Then they re-paste with their answers.

---

## Step 4: รัน `/brief AAPL` ใหม่ เทียบกับ Lesson 1

เป้าหมาย step นี้: ดูด้วยตา ว่า output v1 (skill + voice) ต่างจาก v0 (slash command ดิบ Lesson 1) ยังไง.

ACTION: Tell the student to do these 3 things in order:

1. ในหน้าต่าง 2 พิมพ์ `/brief AAPL` (ใช้ ticker เดียวกับ Lesson 1 ดีที่สุด เพื่อเทียบของจริง). ถ้า Lesson 1 student ใช้ ticker อื่น ให้ใช้อันเดิมตามที่เขาใช้.
2. รอ Claude ทำเสร็จ. ถ้า Plan mode ขอ approve, approve ตามขั้น.
3. เปิดไฟล์ `briefs/AAPL.md` (จะถูก overwrite จาก Lesson 1) แล้วเทียบกับ output Lesson 1 ที่ student อาจจำได้.

**ถ้า output ออกมาเหมือน v0 (4 sections, ไม่มี Kill conditions, voice เหมือนเดิม)** = skill ไม่ถูก invoke ใน version ของคุณ. ทาง recovery ง่ายสุด: paste ในหน้าต่าง 2 ว่า `ทำไม skill company-brief ไม่ถูก invoke ตอนรัน /brief AAPL?` Claude version ปัจจุบันจะวิเคราะห์เองและบอกวิธีแก้ของ version นั้น. ทำตามที่ Claude แนะนำแล้วรัน /brief AAPL ใหม่.

ตัวที่ student ควรสังเกต (บอกเขาก่อน paste):

- จำนวน section: v0 = 4 sections, v1 ควร = 6 sections (Company snapshot, Fundamentals signal, Latest earnings, Bull/Bear, Kill conditions, What to ask)
- Kill conditions: v0 ไม่มี, v1 ต้องมี
- เสียง: v1 อ่านแล้วควรรู้สึกใกล้กับย่อหน้า "How I invest" ที่ student เพิ่งเขียน — bull/bear angle, framing คำถาม
- Latest earnings: ทั้ง v0 และ v1 ควร honest เรื่องไม่แน่ใจ quarter ล่าสุด ถ้า v1 แต่งตัวเลขเฉพาะเจาะจง (revenue + segment + guidance) นั่นคือปัญหา Lesson 3 จะแก้ด้วยการ feed earnings transcript จริงเข้ามา

---

STOP: บอกผม:

1. หน้าต่าง 2 รัน `/brief AAPL` ออก output ครบ 6 section ไหม?
2. มี Kill conditions section ใหม่หรือยัง?
3. อ่าน Bull/Bear กับ "What to ask", รู้สึกใกล้เสียง investing ของคุณ (จาก section "How I invest" ใน CLAUDE.md) หรือยัง?
4. Latest earnings Claude honest ว่าไม่แน่ใจ quarter ล่าสุด หรือแต่งตัวเลข specific (revenue + segment + guidance)?

---

USER: [Waits for student to report v1 brief output]

---

ACTION: When the student responds:

1. **All 4 ดีหมด** (6 sections ครบ + Kill conditions มี + voice ใกล้ + news honest), say: "ผ่าน foundation 2 ของคอร์ส. `/brief` ตอนนี้มี SOP คุมและเสียงคุณใส่เข้าไปแล้ว." Move to Step 5.

2. **Output ยังเหมือนเดิม v0 (4 sections, no kill condition, no voice shift)**, แสดงว่า skill ไม่ถูก invoke. ทางแก้: paste ในหน้าต่าง 2: `ทำไม skill company-brief ไม่ถูก invoke ตอนรัน /brief AAPL?` Claude version ปัจจุบันจะบอกเองว่าต้องเรียก skill ยังไงใน version นี้ (อาจให้พิมพ์ชื่อ skill ตรงๆ, อาจให้แก้ `.claude/commands/brief.md`, อาจอย่างอื่น). ทำตามที่ Claude แนะนำแล้วรัน /brief AAPL ใหม่.

3. **6 sections มี แต่ Kill conditions ว่าง / generic** ("เศรษฐกิจไม่ดี" แบบทั่วๆ ไป), ตอบ: "Kill conditions ที่ดีต้อง specific to บริษัท. ลอง paste ในหน้าต่าง 2: 'รัน /brief AAPL อีกครั้ง, Kill conditions section ต้อง specific to AAPL business (เช่น iPhone unit decline, Services growth stall, China revenue %), ห้ามใช้ macro generic.'" Re-run.

4. **Voice ยังเหมือน analyst generic** (ไม่สะท้อน "How I invest"), ตอบ: "Skill อ่าน CLAUDE.md ไม่ครบ. Paste: 'รัน /brief AAPL อีกครั้ง, ก่อนเริ่ม อ่าน section How I invest ใน CLAUDE.md แล้ว Bull/Bear + What to ask sections ต้อง frame ตาม horizon และ focus ที่เขียนไว้ที่นั่น.'" Re-run. ดู v2 ว่าใกล้ขึ้นไหม.

5. **Latest earnings แต่งตัวเลขเฉพาะ** (revenue + segment % + guidance ที่ specific มากจน verify ไม่ได้), ตอบ honest: "อันนี้ failure mode ที่ skill ของเรา 'รู้แล้วแต่ยังพลาด' SKILL.md บอกห้ามแต่งแล้ว แต่ Claude ลื่น Lesson 3 เราจะ feed earnings transcript จริงเข้าไปแก้ structural ตอนนี้ฝึกตัวเองก่อนว่า ถ้าเห็น earnings section มีตัวเลข specific + ไม่บอกว่าเป็น quarter ไหน = สงสัยและ verify ที่ transcript จริงเสมอ" Move on to Step 5, skeleton ใช้ได้แล้ว

6. ถ้า `briefs/AAPL.md` ไม่ถูก update (ยังเหมือน v0), paste ในหน้าต่าง 2: "เพิ่งรัน /brief AAPL, เปิดไฟล์ `briefs/AAPL.md` ตอนนี้แสดง content ให้ดู. ถ้ายังเหมือน v0 (4 sections) ทำไมไม่ overwrite?" รอตอบ + แก้ตาม.

---

## Step 5: เช็คความเรียบร้อย + ปิดท้าย

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste อะไรในหน้าต่าง 2)

ก่อนปิด Lesson 2 เช็ค checklist:

1. มีไฟล์ `.claude/skills/company-brief/SKILL.md` (verify ผ่านถาม Claude หน้าต่าง 2)
2. ไฟล์ `CLAUDE.md` มี section "How I invest" ที่ student เขียนเอง + section เดิม (จาก Lesson 1) ยังอยู่ครบ
3. รัน `/brief AAPL` ออก 6 sections มี Kill conditions
4. Output อ่านแล้วต่างจาก Lesson 1 visibly (อย่างน้อย Kill conditions section ใหม่ + Bull/Bear framing ใกล้ voice). อย่างน้อย 1 bullet ใน Bull/Bear หรือ Kill conditions ใช้ภาษาที่ตรงกับที่คุณเขียนใน "How I invest" section (ไม่ใช่แค่ style analyst ทั่วไป).
5. หน้าต่าง 2 (folder `my-first-project`) ยังเปิด, Lesson 3 ใช้ต่อ

---

STOP: ทั้ง 5 ข้อ ผ่านครบไหม? ตอบในหน้าต่าง 1 (หน้าต่างนี้).

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. ถ้าผ่าน 5/5, say (in Paint's friendly voice): "ยินดีด้วย คุณได้สร้าง skill แรกเรียบร้อยแล้ว ลองนึกดูว่าชีวิตคุณปกติทำอะไรซ้ำๆ บ้าง แล้วลองไปสร้าง skill ของคุณเองดูได้นะ ครบ Lesson 2 ผ่าน ของในมือคุณตอนนี้แน่นกว่า Lesson 1 จริง" Move to "What just happened" + Common Stumbles + handoff
2. ถ้าผ่าน 3-4/5, focus แก้เฉพาะข้อที่ค้าง ห้ามขึ้น Lesson 3 ทั้งที่ยังขาด structurally (ข้อ 1 หรือ 3 ขาด = block)
3. ถ้า voice เพิ่งเริ่มออก แต่ยัง subtle (ข้อ 4 ครึ่งๆ), OK voice ที่ใช้งาน skill จะคมขึ้นเมื่อ student edit `How I invest` ตามจริง over time ข้อนี้ partial pass ได้

---

## What just happened (สรุปสั้นๆ)

ใน 15-20 นาทีที่ผ่านมา คุณ:

1. เข้าใจ slash command vs skill: ปุ่มลัด vs SOP ในเล่มคู่มือ
2. สร้าง skill ตัวแรก `.claude/skills/company-brief/SKILL.md` พร้อม frontmatter + body SOP 6 section
3. เพิ่มย่อหน้า "How I invest" ใน `CLAUDE.md`, เสียงนักลงทุนของคุณเอง Claude อ่านทุก session
4. รัน `/brief AAPL` v1 ดู output ที่ structurally แน่น + reflect voice ของคุณ

`/brief` ตอนนี้ไม่ใช่ "dumb prompt" แล้ว มี SOP คงที่ + เสียงเฉพาะตัว.

ที่ยัง weak อยู่:

- Latest earnings ยังอิงจาก training memory ไม่ใช่ transcript จริง (Lesson 3 จะ feed transcript เข้ามาแก้)
- ทำงาน sequential ทีละ section เปลือง token (Lesson 4 แตก 3 sub-agent ขนาน)
- ใช้ในเครื่องคุณคนเดียว (Lesson 5 deploy showcase)

แต่โครงสร้าง persistent voice + persistent SOP เกิดแล้ว.

---

## Common stumbles (ถ้าติดตรงไหน)

- **Skill ไม่ถูก invoke ตอนรัน /brief** ตามที่ผมเตือนใน Step 1, skill discovery มี 3 แบบ (auto / explicit / user asks). ถ้าแบบแรกไม่ติด paste ในหน้าต่าง 2: `ทำไม skill company-brief ไม่ถูก invoke?` Claude version ปัจจุบันจะบอกวิธี.
- **Frontmatter parse error** ถ้า Claude หน้าต่าง 2 บ่นเรื่อง field, ถาม Claude ตรงๆ ว่า frontmatter ปัจจุบันต้องมีอะไรบ้าง แล้วแก้ตาม. spec evolve ระหว่าง version.
- **Output ออก 4 sections แทน 6** Skill SOP ไม่ถูกอ่านครบ. ลอง re-run และ paste reminder: "ตาม SKILL.md output ต้องครบ 6 section ไม่ skip." หรือ check ว่า SKILL.md ถูก save จริง (ถาม Claude หน้าต่าง 2 read ไฟล์กลับมาดู).
- **Voice ไม่เปลี่ยน, output ยังเหมือน analyst generic** Claude อ่าน `CLAUDE.md` แต่ไม่เอา section "How I invest" มาใช้. ลอง paste reminder ตาม Step 4 ACTION ข้อ 4. ถ้ายัง subtle, voice section ใน CLAUDE.md ของคุณอาจ generic เกินไป. เขียนใหม่ specific มากขึ้น (เช่น "ผมไม่ซื้อหุ้นที่ revenue concentrate กับลูกค้า top-3 > 50%" ดีกว่า "ผมชอบบริษัทดีๆ").
- **Brief แต่งตัวเลข earnings เฉพาะ** SKILL.md ห้ามแล้วแต่ Claude ลื่น Lesson 3 จะแก้ structurally ด้วยการ feed earnings transcript จริง (Claude อ่านจาก transcript ไม่ใช่ memory) ตอนนี้ฝึกตัวเองให้สงสัยทุกครั้งที่เห็นตัวเลข earnings ที่ specific แต่ไม่ระบุ quarter
- **CLAUDE.md ถูก overwrite แทน append** Claude เผลอลบของเดิม. ตาม Step 3 ACTION ข้อ 3 มี recovery: paste บอก restore original + append ใหม่. ห้าม panic ของเดิมอยู่ในประวัติ chat.
- **paste prompt ผิดหน้าต่าง** prompt ที่ผมส่งทั้งหมดต้องไปหน้าต่าง 2 (folder `my-first-project`). ถ้าเผลอ paste ในหน้าต่าง 1 (ที่ผมพูดอยู่) ผมจะตอบเหมือน Claude ปกติ แต่ไฟล์จะไปสร้างใน folder คอร์ส `ltd-ai-101` ไม่ใช่ folder ของคุณ. ลบไฟล์ที่หลงไปสร้างใน `ltd-ai-101` แล้วสลับไปหน้าต่าง 2 paste ใหม่.

ถ้าหาทางออกไม่ได้จริงๆ comment มาในคลิปคอร์ส ผมก็เพิ่งหัดเหมือนกัน.

---

## พร้อมขึ้น Lesson 3 ยัง

ก่อนขึ้นบทถัดไป ตรวจอีกครั้งว่า:

- มีไฟล์ `.claude/skills/company-brief/SKILL.md` ที่ project ของคุณ
- `CLAUDE.md` มี "How I invest" section ของคุณเอง
- รัน `/brief <TICKER>` ออก 6 sections จริง รวม Kill conditions
- หน้าต่าง 2 (folder `my-first-project`) ยังเปิด Lesson 3 ใช้ต่อ

พิมพ์ `Start Lesson 3` ในหน้าต่างนี้ (หน้าต่าง 1 = `ltd-ai-101`) แล้วเปิดหน้าต่าง 2 ค้างไว้.

---

STOP: ทั้ง 4 ข้อข้างบน ผ่านครบหรือยัง? ถ้าครบ พิมพ์ "Start Lesson 3". ถ้ายังขาด บอกผมตรงข้อไหน เราเก็บก่อนไปต่อ.

---

USER: [Waits for student to confirm readiness or report missing artifact before moving to Lesson 3]

---

ACTION: When the student types "Start Lesson 3" or anything that signals they're ready (e.g., "พร้อมแล้ว", "ไปต่อ", "next lesson"), read the file at `lesson-modules/3-earning-and-cost/CLAUDE.md` and begin Lesson 3 from its instructions.

If they ask a question or want to revisit something from Lesson 2, answer it. Don't move on until they say they're ready.

If the file `lesson-modules/3-earning-and-cost/CLAUDE.md` doesn't exist yet (course is still being shipped lesson by lesson), tell them: "Lesson 3 ยังไม่ ship ครับ คอร์สนี้ทยอยปล่อยทีละบท เก็บ skill `company-brief` กับ voice ใน CLAUDE.md ไว้แบบนั้น Lesson 3 จะ build ต่อจาก /brief v1 นี้โดยตรงด้วยการ feed earnings transcript จริงเข้ามาแทน training memory ไว้เจอกัน"
