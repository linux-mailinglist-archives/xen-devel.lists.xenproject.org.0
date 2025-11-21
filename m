Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83CC7896B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168574.1494560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqj-000818-TD; Fri, 21 Nov 2025 10:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168574.1494560; Fri, 21 Nov 2025 10:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqj-0007yq-Ok; Fri, 21 Nov 2025 10:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1168574;
 Fri, 21 Nov 2025 10:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqh-0007TB-Qg
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:43 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0973cfbf-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:42 +0100 (CET)
Received: from SN7PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:f2::7)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:31 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::80) by SN7PR04CA0002.outlook.office365.com
 (2603:10b6:806:f2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:58:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:28 -0800
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0973cfbf-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtVbDNiIPWKH3o1u3UwwgLUfiSoAS8p/K70GL1vfzftMcGzZtpkoCufQVWjk0Cna7VRFS1/z+rvZfaClOPOIYM8AlCfw6FfNPRt1oxZpUEaV1a5B65adsLOfPDhFHTtjmpl2e30bWsOa6UIjG83hq/abegngfCOP8J7J746pOx82B4uNJedND6TWFCP3m+q+65svBCHJ2RQjn090P/BS137QPn2fwuy3SAIJOgLLcMvDuxD5W20LOSsyNHKJHVpyC1vO9uI4GzQEUDimhWTbM212ps4pp8eXOjv4kcprMhZ1MpUUOaGnRRaomGNWIStNX6uaunmqwtH38Z5ms2yM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qN6QOTfDkP9ovx5v9FOHYWiIbKZEtnqTSmaa7qbMxI=;
 b=gUFGIMy4bsePrl2QZWPz+JA1XswnkklHudq6chtoydamUaN24wdxnh1eYTPRHzqBV8HtLoDnR9VZUA36CYNxEZZduQLdTPrwHd0Tl2lhh/m8rWqEih/9S7mybxP7jkBorb3pUa8Vk+q8K3SvIqk75WCQaofOmw7bybfLl5b8IjEUSHt6rx9gSTKqWlNFN+5EWwRiKyjVvEpM3oAR1swzSzsiIZiLCn/6UXHaGEvtg7VnvoJtIObzG/+OwDEuGqH2lhV7JTPmX0/KvcybH152xnmMVLj9y+937eImU9at5yNxhTiNxXpgOCYKdrvsCcCTvYGcZTr0eSmxwaVGB3ywFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qN6QOTfDkP9ovx5v9FOHYWiIbKZEtnqTSmaa7qbMxI=;
 b=GGLgwfgVSylCWW2EAJ68HYKb1ytbvCAb3HPaTiMVuC/WQB08JNqCQi5mUTS4oJaG1o2G+aUjfHgiaFv+KexHp/8d3JWS/QlnZMrFogm9BRIZDFBsTPuML7Fx844fAnwHbb+71qA/2uRZRZQQNLZRiiezmNtTroIBSTiHrcMYHgw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v4 02/24] xen: consolidate cpuid library
Date: Fri, 21 Nov 2025 18:57:39 +0800
Message-ID: <20251121105801.1251262-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: c6925e70-7175-4225-76ab-08de28ece877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ENjvpS0SGpP6HAHS5E+Dj484FqS0q/ys+9leSe9fDSrzRBUj8LBHzbi/ZEyy?=
 =?us-ascii?Q?Bi5V/GwPcaspapcNZuseF8i6uG+2b3szHHF40myooQNEqKgBNgo6kp7Be3V3?=
 =?us-ascii?Q?+5A88pWccmR49HnpA7xv+f4w+m6DGNp2cObgj5xUv6NerLoHeTF/3HfjWX9p?=
 =?us-ascii?Q?RO808yJeJA0B3YKn7BgmesgzyO+dPwN/ly9khVWX8Np4jrMl+3XUKy53DL/f?=
 =?us-ascii?Q?dA5HtK4kenKY3tEhVCvH4Zo9dB/2lGgU2sTzNyebhfQJ+IReHaHuoQoXTohM?=
 =?us-ascii?Q?AuA1ymghmgzlmTN1Mt6nEUX8yMQo/cpl7+PshF7c69+TnIpy4pavv1LlnUhj?=
 =?us-ascii?Q?xXP3YvCTnMZdtsYLiP1D+V4TYD2JQIsKM4Be4cNohzD4OGeyIK7bPbcXyKAy?=
 =?us-ascii?Q?oh5xhA6Jscc6vCs4VTq1akIFAGtPhpbIsYk35JgdoTEIV7bnG1NTyGgS4zB6?=
 =?us-ascii?Q?V/7MtKdVrZTOIC0jqce4ePkIeI+iHSor3UmFA2sowIrhy/uT1yBY4oKHQDDy?=
 =?us-ascii?Q?kowaJBLyjw2Blm6n4WVA9Vih1rTFdN3fRD12lT4CFimRr4bRCKrBd2mcAfXL?=
 =?us-ascii?Q?U1+zTFwoOIJihH/tmNZXrsGEiqdEkHH8plQdjARwEeOPtqsqHJzfVEP5+1e3?=
 =?us-ascii?Q?z361tw3OwLir0o8pVzO3miUnfYgk9NBI8XsrMp8y4iRwQHxN9PTVHTjBcGzP?=
 =?us-ascii?Q?NXUv4hvNx0qCGknUpMujDMPqtgNPo6Zy1JS+zaZp7hG9QXX0RMiS5Ja+AANJ?=
 =?us-ascii?Q?8wONhRly6b2nOohDdAchuv/Jp6cSpLaUbFg9gwBPpGFMQIlf/Onrf0xxWPK1?=
 =?us-ascii?Q?PFeYH7IQn8rM2pW61azMruXxhDoj84eknX0bviftya4rou0aOGWrxcvY+Rj3?=
 =?us-ascii?Q?9CW0A9TMHJF7gpMqUqDAFcLyUnK/8BeDBBQ6AQRrxSf7CIrGgej41CI3xPWP?=
 =?us-ascii?Q?2KJD82P4N1bmQ6yuaJq2v3VOQl1zgx+dO0XJwJEWYpltcs0qM3fv6uiTWwEr?=
 =?us-ascii?Q?7/eVlfmITSXJ4nazotTFxGslsEIE5TdhJRiffr6+bJG0mlRU6rSID2o1Okwk?=
 =?us-ascii?Q?+eG0QSLCLEoAnDLaLXcjQO924b+KR8JN/9ckxe4X8M7THt74ciUuktnoezNL?=
 =?us-ascii?Q?wEHwVDxrywZntGbMvyNa+dYDMC6+CYsMaQ6nYJ6nLcYPlLnLdUqo+ZITPVrS?=
 =?us-ascii?Q?HCQE/pEUsKP1FORwaFtyWiGWcJg+aiAYDSxrddFjnQWXWgqtkLw/sA3F6LGa?=
 =?us-ascii?Q?Gnxuz93uujN9umWwYxdihggPSqaRVbSLwSMqiHHn9FYmJkR/NxIA85Sj+8Nm?=
 =?us-ascii?Q?/dORgnYc0EImX6Ih1iekQXlN3bn8LMC8OTR1uZQA0BDczndYVZqdbTZchHVw?=
 =?us-ascii?Q?/P9q/rXfAIX9274YuMs+t3bpakdO0OtKPDmVpC/AyrONgqVhdZqcWjbdX8M7?=
 =?us-ascii?Q?SgfZFYGn5osBaABlqEUzF3YIo5pJElXd9ejMkwuaOl93aXZf844wZSHHtKKx?=
 =?us-ascii?Q?yyJ8Zav9+LvQ0IhXa3CjqwQowc+TVvIRWnawgtoehQQTe8/rl46X4C+PZgb0?=
 =?us-ascii?Q?VYExlq/QREqX6dQfxLo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:30.9989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6925e70-7175-4225-76ab-08de28ece877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495

There are some cpuid library functions only referenced in
XEN_DOMCTL_get{,set}_cpu_policy-case, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS later, otherwise they will become unreachable when
MGMT_HYPERCALLS=n, and hence violate Misra 2.1
- x86_cpu_policy_clear_out_of_range_leaves
  - zero_leaves
- x86_cpuid_copy_to_buffer
  - copy_leaf_to_buffer
- x86_cpuid_copy_from_buffer
We seperate these functions by moving other functions to a new file named
cpuid-generic.c, and modify related Makefile-s to retain same behavior.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 tools/fuzz/cpu-policy/Makefile               |   2 +-
 tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
 tools/libs/guest/Makefile.common             |   2 +-
 tools/tests/cpu-policy/Makefile              |   2 +-
 tools/tests/x86_emulator/Makefile            |   2 +-
 xen/lib/x86/Makefile                         |   1 +
 xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
 xen/lib/x86/cpuid.c                          | 260 ------------------
 8 files changed, 283 insertions(+), 269 deletions(-)
 create mode 100644 xen/lib/x86/cpuid-generic.c

diff --git a/tools/fuzz/cpu-policy/Makefile b/tools/fuzz/cpu-policy/Makefile
index 6e7743e0aa..9d4627887b 100644
--- a/tools/fuzz/cpu-policy/Makefile
+++ b/tools/fuzz/cpu-policy/Makefile
@@ -22,7 +22,7 @@ CFLAGS += $(APPEND_CFLAGS) -Og
 
 vpath %.c ../../../xen/lib/x86
 
-afl-policy-fuzzer: afl-policy-fuzzer.o msr.o cpuid.o
+afl-policy-fuzzer: afl-policy-fuzzer.o msr.o cpuid.o cpuid-generic.o
 	$(CC) $(CFLAGS) $^ -o $@
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 459743f4d9..6e2363a06b 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -25,7 +25,7 @@ x86_emulate/%.h: x86_emulate ;
 	ln -nsf $< $@
 
 CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -iquote .
-cpuid.o: CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
+cpuid.o cpuid-generic.o: CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
 
 GCOV_FLAGS := --coverage
 %-cov.o: %.c
@@ -49,16 +49,16 @@ $(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c $(private.h)
 $(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c $(private.h)
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) $(GCOV_FLAGS) -c -o $@ $< $(APPEND_CFLAGS)
 
-x86-insn-fuzzer.a: $(OBJS) cpuid.o
+x86-insn-fuzzer.a: $(OBJS) cpuid.o cpuid-generic.o
 	$(AR) rc $@ $^
 
-afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
+afl-harness: afl-harness.o $(OBJS) cpuid.o cpuid-generic.o wrappers.o
 	$(CC) $(CFLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
-afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
+afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o cpuid-generic.o wrappers.o
 	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
-libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
+libfuzzer-harness: $(OBJS) cpuid.o cpuid-generic.o wrappers.o
 	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
 # Common targets
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index a026a2f662..da3c21e67e 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -35,7 +35,7 @@ OBJS-y += $(LIBELF_OBJS)
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-OBJS-y                 += cpuid.o msr.o policy.o
+OBJS-y                 += cpuid.o cpuid-generic.o msr.o policy.o
 endif
 
 # new domain builder
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 24f87e2eca..2f946b8a5e 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -46,7 +46,7 @@ vpath %.c ../../../xen/lib/x86
 
 %.o: Makefile
 
-test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
+test-cpu-policy: test-cpu-policy.o msr.o cpuid.o cpuid-generic.o policy.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index fefa29a06c..eb79abd5b4 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -248,7 +248,7 @@ xop.h avx512f.h avx512fp16.h: simd-fma.c
 
 endif # 32-bit override
 
-OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
+OBJS := x86-emulate.o cpuid.o cpuid-generic.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index 780ea05db1..ac6d4369f3 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,4 @@
 obj-y += cpuid.o
+obj-y += cpuid-generic.o
 obj-y += msr.o
 obj-y += policy.o
diff --git a/xen/lib/x86/cpuid-generic.c b/xen/lib/x86/cpuid-generic.c
new file mode 100644
index 0000000000..465bdee35a
--- /dev/null
+++ b/xen/lib/x86/cpuid-generic.c
@@ -0,0 +1,273 @@
+#include "private.h"
+
+#include <xen/lib/x86/cpu-policy.h>
+
+unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx)
+{
+    switch ( ebx )
+    {
+    case X86_VENDOR_INTEL_EBX:
+        if ( ecx == X86_VENDOR_INTEL_ECX &&
+             edx == X86_VENDOR_INTEL_EDX )
+            return X86_VENDOR_INTEL;
+        break;
+
+    case X86_VENDOR_AMD_EBX:
+        if ( ecx == X86_VENDOR_AMD_ECX &&
+             edx == X86_VENDOR_AMD_EDX )
+            return X86_VENDOR_AMD;
+        break;
+
+    case X86_VENDOR_CENTAUR_EBX:
+        if ( ecx == X86_VENDOR_CENTAUR_ECX &&
+             edx == X86_VENDOR_CENTAUR_EDX )
+            return X86_VENDOR_CENTAUR;
+        break;
+
+    case X86_VENDOR_SHANGHAI_EBX:
+        if ( ecx == X86_VENDOR_SHANGHAI_ECX &&
+             edx == X86_VENDOR_SHANGHAI_EDX )
+            return X86_VENDOR_SHANGHAI;
+        break;
+
+    case X86_VENDOR_HYGON_EBX:
+        if ( ecx == X86_VENDOR_HYGON_ECX &&
+             edx == X86_VENDOR_HYGON_EDX )
+            return X86_VENDOR_HYGON;
+        break;
+    }
+
+    return X86_VENDOR_UNKNOWN;
+}
+
+const char *x86_cpuid_vendor_to_str(unsigned int vendor)
+{
+    switch ( vendor )
+    {
+    case X86_VENDOR_INTEL:    return "Intel";
+    case X86_VENDOR_AMD:      return "AMD";
+    case X86_VENDOR_CENTAUR:  return "Centaur";
+    case X86_VENDOR_SHANGHAI: return "Shanghai";
+    case X86_VENDOR_HYGON:    return "Hygon";
+    default:                  return "Unknown";
+    }
+}
+
+void x86_cpu_policy_to_featureset(
+    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
+{
+    fs[FEATURESET_1d]        = p->basic._1d;
+    fs[FEATURESET_1c]        = p->basic._1c;
+    fs[FEATURESET_e1d]       = p->extd.e1d;
+    fs[FEATURESET_e1c]       = p->extd.e1c;
+    fs[FEATURESET_Da1]       = p->xstate.Da1;
+    fs[FEATURESET_7b0]       = p->feat._7b0;
+    fs[FEATURESET_7c0]       = p->feat._7c0;
+    fs[FEATURESET_e7d]       = p->extd.e7d;
+    fs[FEATURESET_e8b]       = p->extd.e8b;
+    fs[FEATURESET_7d0]       = p->feat._7d0;
+    fs[FEATURESET_7a1]       = p->feat._7a1;
+    fs[FEATURESET_e21a]      = p->extd.e21a;
+    fs[FEATURESET_7b1]       = p->feat._7b1;
+    fs[FEATURESET_7d2]       = p->feat._7d2;
+    fs[FEATURESET_7c1]       = p->feat._7c1;
+    fs[FEATURESET_7d1]       = p->feat._7d1;
+    fs[FEATURESET_m10Al]     = p->arch_caps.lo;
+    fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
+    fs[FEATURESET_e21c]      = p->extd.e21c;
+}
+
+void x86_cpu_featureset_to_policy(
+    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
+{
+    p->basic._1d             = fs[FEATURESET_1d];
+    p->basic._1c             = fs[FEATURESET_1c];
+    p->extd.e1d              = fs[FEATURESET_e1d];
+    p->extd.e1c              = fs[FEATURESET_e1c];
+    p->xstate.Da1            = fs[FEATURESET_Da1];
+    p->feat._7b0             = fs[FEATURESET_7b0];
+    p->feat._7c0             = fs[FEATURESET_7c0];
+    p->extd.e7d              = fs[FEATURESET_e7d];
+    p->extd.e8b              = fs[FEATURESET_e8b];
+    p->feat._7d0             = fs[FEATURESET_7d0];
+    p->feat._7a1             = fs[FEATURESET_7a1];
+    p->extd.e21a             = fs[FEATURESET_e21a];
+    p->feat._7b1             = fs[FEATURESET_7b1];
+    p->feat._7d2             = fs[FEATURESET_7d2];
+    p->feat._7c1             = fs[FEATURESET_7c1];
+    p->feat._7d1             = fs[FEATURESET_7d1];
+    p->arch_caps.lo          = fs[FEATURESET_m10Al];
+    p->arch_caps.hi          = fs[FEATURESET_m10Ah];
+    p->extd.e21c             = fs[FEATURESET_e21c];
+}
+
+void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
+{
+    p->x86_vendor = x86_cpuid_lookup_vendor(
+        p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
+}
+
+void x86_cpu_policy_fill_native(struct cpu_policy *p)
+{
+    unsigned int i;
+
+    cpuid_leaf(0, &p->basic.raw[0]);
+    for ( i = 1; i <= MIN(p->basic.max_leaf,
+                          ARRAY_SIZE(p->basic.raw) - 1); ++i )
+    {
+        switch ( i )
+        {
+        case 0x4: case 0x7: case 0xb: case 0xd:
+            /* Multi-invocation leaves.  Deferred. */
+            continue;
+        }
+
+        cpuid_leaf(i, &p->basic.raw[i]);
+    }
+
+    if ( p->basic.max_leaf >= 4 )
+    {
+        for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
+        {
+            union {
+                struct cpuid_leaf l;
+                struct cpuid_cache_leaf c;
+            } u;
+
+            cpuid_count_leaf(4, i, &u.l);
+
+            if ( u.c.type == 0 )
+                break;
+
+            p->cache.subleaf[i] = u.c;
+        }
+
+        /*
+         * The choice of CPUID_GUEST_NR_CACHE is arbitrary.  It is expected
+         * that it will eventually need increasing for future hardware.
+         */
+#ifdef __XEN__
+        if ( i == ARRAY_SIZE(p->cache.raw) )
+            printk(XENLOG_WARNING
+                   "CPUID: Insufficient Leaf 4 space for this hardware\n");
+#endif
+    }
+
+    if ( p->basic.max_leaf >= 7 )
+    {
+        cpuid_count_leaf(7, 0, &p->feat.raw[0]);
+
+        for ( i = 1; i <= MIN(p->feat.max_subleaf,
+                              ARRAY_SIZE(p->feat.raw) - 1); ++i )
+            cpuid_count_leaf(7, i, &p->feat.raw[i]);
+    }
+
+    if ( p->basic.max_leaf >= 0xb )
+    {
+        union {
+            struct cpuid_leaf l;
+            struct cpuid_topo_leaf t;
+        } u;
+
+        for ( i = 0; i < ARRAY_SIZE(p->topo.raw); ++i )
+        {
+            cpuid_count_leaf(0xb, i, &u.l);
+
+            if ( u.t.type == 0 )
+                break;
+
+            p->topo.subleaf[i] = u.t;
+        }
+
+        /*
+         * The choice of CPUID_GUEST_NR_TOPO is per the manual.  It may need
+         * to grow for future hardware.
+         */
+#ifdef __XEN__
+        if ( i == ARRAY_SIZE(p->topo.raw) &&
+             (cpuid_count_leaf(0xb, i, &u.l), u.t.type != 0) )
+            printk(XENLOG_WARNING
+                   "CPUID: Insufficient Leaf 0xb space for this hardware\n");
+#endif
+    }
+
+    if ( p->basic.max_leaf >= 0xd )
+    {
+        uint64_t xstates;
+
+        cpuid_count_leaf(0xd, 0, &p->xstate.raw[0]);
+        cpuid_count_leaf(0xd, 1, &p->xstate.raw[1]);
+
+        xstates = cpu_policy_xstates(p);
+
+        /* This logic will probably need adjusting when XCR0[63] gets used. */
+        BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
+
+        for ( i = 2; i < min_t(unsigned int, 63,
+                               ARRAY_SIZE(p->xstate.raw)); ++i )
+        {
+            if ( xstates & (1ULL << i) )
+                cpuid_count_leaf(0xd, i, &p->xstate.raw[i]);
+        }
+    }
+
+    /* Extended leaves. */
+    cpuid_leaf(0x80000000U, &p->extd.raw[0]);
+    for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
+                          ARRAY_SIZE(p->extd.raw) - 1); ++i )
+        cpuid_leaf(0x80000000U + i, &p->extd.raw[i]);
+
+    /* Don't report leaves from possible lower level hypervisor, for now. */
+    p->hv_limit = 0;
+    p->hv2_limit = 0;
+
+#ifdef __XEN__
+    /* TODO MSR_PLATFORM_INFO */
+
+    if ( p->feat.arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
+#endif
+
+    x86_cpu_policy_recalc_synth(p);
+}
+
+const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
+{
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    static const struct {
+        uint32_t feature;
+        uint32_t fs[FEATURESET_NR_ENTRIES];
+    } deep_deps[] = INIT_DEEP_DEPS;
+    unsigned int start = 0, end = ARRAY_SIZE(deep_deps);
+
+    BUILD_BUG_ON(ARRAY_SIZE(deep_deps) != NR_DEEP_DEPS);
+
+    /* Fast early exit. */
+    if ( !test_bit(feature, deep_features) )
+        return NULL;
+
+    /* deep_deps[] is sorted.  Perform a binary search. */
+    while ( start < end )
+    {
+        unsigned int mid = start + ((end - start) / 2);
+
+        if ( deep_deps[mid].feature > feature )
+            end = mid;
+        else if ( deep_deps[mid].feature < feature )
+            start = mid + 1;
+        else
+            return deep_deps[mid].fs;
+    }
+
+    return NULL;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 6298d051f2..5de1e2ca74 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -9,235 +9,6 @@ static void zero_leaves(struct cpuid_leaf *l,
         memset(&l[first], 0, sizeof(*l) * (last - first + 1));
 }
 
-unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx)
-{
-    switch ( ebx )
-    {
-    case X86_VENDOR_INTEL_EBX:
-        if ( ecx == X86_VENDOR_INTEL_ECX &&
-             edx == X86_VENDOR_INTEL_EDX )
-            return X86_VENDOR_INTEL;
-        break;
-
-    case X86_VENDOR_AMD_EBX:
-        if ( ecx == X86_VENDOR_AMD_ECX &&
-             edx == X86_VENDOR_AMD_EDX )
-            return X86_VENDOR_AMD;
-        break;
-
-    case X86_VENDOR_CENTAUR_EBX:
-        if ( ecx == X86_VENDOR_CENTAUR_ECX &&
-             edx == X86_VENDOR_CENTAUR_EDX )
-            return X86_VENDOR_CENTAUR;
-        break;
-
-    case X86_VENDOR_SHANGHAI_EBX:
-        if ( ecx == X86_VENDOR_SHANGHAI_ECX &&
-             edx == X86_VENDOR_SHANGHAI_EDX )
-            return X86_VENDOR_SHANGHAI;
-        break;
-
-    case X86_VENDOR_HYGON_EBX:
-        if ( ecx == X86_VENDOR_HYGON_ECX &&
-             edx == X86_VENDOR_HYGON_EDX )
-            return X86_VENDOR_HYGON;
-        break;
-    }
-
-    return X86_VENDOR_UNKNOWN;
-}
-
-const char *x86_cpuid_vendor_to_str(unsigned int vendor)
-{
-    switch ( vendor )
-    {
-    case X86_VENDOR_INTEL:    return "Intel";
-    case X86_VENDOR_AMD:      return "AMD";
-    case X86_VENDOR_CENTAUR:  return "Centaur";
-    case X86_VENDOR_SHANGHAI: return "Shanghai";
-    case X86_VENDOR_HYGON:    return "Hygon";
-    default:                  return "Unknown";
-    }
-}
-
-void x86_cpu_policy_to_featureset(
-    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
-{
-    fs[FEATURESET_1d]        = p->basic._1d;
-    fs[FEATURESET_1c]        = p->basic._1c;
-    fs[FEATURESET_e1d]       = p->extd.e1d;
-    fs[FEATURESET_e1c]       = p->extd.e1c;
-    fs[FEATURESET_Da1]       = p->xstate.Da1;
-    fs[FEATURESET_7b0]       = p->feat._7b0;
-    fs[FEATURESET_7c0]       = p->feat._7c0;
-    fs[FEATURESET_e7d]       = p->extd.e7d;
-    fs[FEATURESET_e8b]       = p->extd.e8b;
-    fs[FEATURESET_7d0]       = p->feat._7d0;
-    fs[FEATURESET_7a1]       = p->feat._7a1;
-    fs[FEATURESET_e21a]      = p->extd.e21a;
-    fs[FEATURESET_7b1]       = p->feat._7b1;
-    fs[FEATURESET_7d2]       = p->feat._7d2;
-    fs[FEATURESET_7c1]       = p->feat._7c1;
-    fs[FEATURESET_7d1]       = p->feat._7d1;
-    fs[FEATURESET_m10Al]     = p->arch_caps.lo;
-    fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
-    fs[FEATURESET_e21c]      = p->extd.e21c;
-}
-
-void x86_cpu_featureset_to_policy(
-    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
-{
-    p->basic._1d             = fs[FEATURESET_1d];
-    p->basic._1c             = fs[FEATURESET_1c];
-    p->extd.e1d              = fs[FEATURESET_e1d];
-    p->extd.e1c              = fs[FEATURESET_e1c];
-    p->xstate.Da1            = fs[FEATURESET_Da1];
-    p->feat._7b0             = fs[FEATURESET_7b0];
-    p->feat._7c0             = fs[FEATURESET_7c0];
-    p->extd.e7d              = fs[FEATURESET_e7d];
-    p->extd.e8b              = fs[FEATURESET_e8b];
-    p->feat._7d0             = fs[FEATURESET_7d0];
-    p->feat._7a1             = fs[FEATURESET_7a1];
-    p->extd.e21a             = fs[FEATURESET_e21a];
-    p->feat._7b1             = fs[FEATURESET_7b1];
-    p->feat._7d2             = fs[FEATURESET_7d2];
-    p->feat._7c1             = fs[FEATURESET_7c1];
-    p->feat._7d1             = fs[FEATURESET_7d1];
-    p->arch_caps.lo          = fs[FEATURESET_m10Al];
-    p->arch_caps.hi          = fs[FEATURESET_m10Ah];
-    p->extd.e21c             = fs[FEATURESET_e21c];
-}
-
-void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-{
-    p->x86_vendor = x86_cpuid_lookup_vendor(
-        p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
-}
-
-void x86_cpu_policy_fill_native(struct cpu_policy *p)
-{
-    unsigned int i;
-
-    cpuid_leaf(0, &p->basic.raw[0]);
-    for ( i = 1; i <= MIN(p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1); ++i )
-    {
-        switch ( i )
-        {
-        case 0x4: case 0x7: case 0xb: case 0xd:
-            /* Multi-invocation leaves.  Deferred. */
-            continue;
-        }
-
-        cpuid_leaf(i, &p->basic.raw[i]);
-    }
-
-    if ( p->basic.max_leaf >= 4 )
-    {
-        for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
-        {
-            union {
-                struct cpuid_leaf l;
-                struct cpuid_cache_leaf c;
-            } u;
-
-            cpuid_count_leaf(4, i, &u.l);
-
-            if ( u.c.type == 0 )
-                break;
-
-            p->cache.subleaf[i] = u.c;
-        }
-
-        /*
-         * The choice of CPUID_GUEST_NR_CACHE is arbitrary.  It is expected
-         * that it will eventually need increasing for future hardware.
-         */
-#ifdef __XEN__
-        if ( i == ARRAY_SIZE(p->cache.raw) )
-            printk(XENLOG_WARNING
-                   "CPUID: Insufficient Leaf 4 space for this hardware\n");
-#endif
-    }
-
-    if ( p->basic.max_leaf >= 7 )
-    {
-        cpuid_count_leaf(7, 0, &p->feat.raw[0]);
-
-        for ( i = 1; i <= MIN(p->feat.max_subleaf,
-                              ARRAY_SIZE(p->feat.raw) - 1); ++i )
-            cpuid_count_leaf(7, i, &p->feat.raw[i]);
-    }
-
-    if ( p->basic.max_leaf >= 0xb )
-    {
-        union {
-            struct cpuid_leaf l;
-            struct cpuid_topo_leaf t;
-        } u;
-
-        for ( i = 0; i < ARRAY_SIZE(p->topo.raw); ++i )
-        {
-            cpuid_count_leaf(0xb, i, &u.l);
-
-            if ( u.t.type == 0 )
-                break;
-
-            p->topo.subleaf[i] = u.t;
-        }
-
-        /*
-         * The choice of CPUID_GUEST_NR_TOPO is per the manual.  It may need
-         * to grow for future hardware.
-         */
-#ifdef __XEN__
-        if ( i == ARRAY_SIZE(p->topo.raw) &&
-             (cpuid_count_leaf(0xb, i, &u.l), u.t.type != 0) )
-            printk(XENLOG_WARNING
-                   "CPUID: Insufficient Leaf 0xb space for this hardware\n");
-#endif
-    }
-
-    if ( p->basic.max_leaf >= 0xd )
-    {
-        uint64_t xstates;
-
-        cpuid_count_leaf(0xd, 0, &p->xstate.raw[0]);
-        cpuid_count_leaf(0xd, 1, &p->xstate.raw[1]);
-
-        xstates = cpu_policy_xstates(p);
-
-        /* This logic will probably need adjusting when XCR0[63] gets used. */
-        BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
-
-        for ( i = 2; i < min_t(unsigned int, 63,
-                               ARRAY_SIZE(p->xstate.raw)); ++i )
-        {
-            if ( xstates & (1ULL << i) )
-                cpuid_count_leaf(0xd, i, &p->xstate.raw[i]);
-        }
-    }
-
-    /* Extended leaves. */
-    cpuid_leaf(0x80000000U, &p->extd.raw[0]);
-    for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
-                          ARRAY_SIZE(p->extd.raw) - 1); ++i )
-        cpuid_leaf(0x80000000U + i, &p->extd.raw[i]);
-
-    /* Don't report leaves from possible lower level hypervisor, for now. */
-    p->hv_limit = 0;
-    p->hv2_limit = 0;
-
-#ifdef __XEN__
-    /* TODO MSR_PLATFORM_INFO */
-
-    if ( p->feat.arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
-#endif
-
-    x86_cpu_policy_recalc_synth(p);
-}
-
 void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
 {
     unsigned int i;
@@ -291,37 +62,6 @@ void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
-const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
-{
-    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-    static const struct {
-        uint32_t feature;
-        uint32_t fs[FEATURESET_NR_ENTRIES];
-    } deep_deps[] = INIT_DEEP_DEPS;
-    unsigned int start = 0, end = ARRAY_SIZE(deep_deps);
-
-    BUILD_BUG_ON(ARRAY_SIZE(deep_deps) != NR_DEEP_DEPS);
-
-    /* Fast early exit. */
-    if ( !test_bit(feature, deep_features) )
-        return NULL;
-
-    /* deep_deps[] is sorted.  Perform a binary search. */
-    while ( start < end )
-    {
-        unsigned int mid = start + ((end - start) / 2);
-
-        if ( deep_deps[mid].feature > feature )
-            end = mid;
-        else if ( deep_deps[mid].feature < feature )
-            start = mid + 1;
-        else
-            return deep_deps[mid].fs;
-    }
-
-    return NULL;
-}
-
 /*
  * Copy a single cpuid_leaf into a provided xen_cpuid_leaf_t buffer,
  * performing boundary checking against the buffer size.
-- 
2.34.1


