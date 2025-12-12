Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FACB7D32
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184895.1507200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQQ-0007lc-MU; Fri, 12 Dec 2025 04:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184895.1507200; Fri, 12 Dec 2025 04:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQQ-0007i3-FA; Fri, 12 Dec 2025 04:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1184895;
 Fri, 12 Dec 2025 04:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQO-0007SS-Q2
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:37 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18e1697-d70f-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:06:33 +0100 (CET)
Received: from MN2PR18CA0028.namprd18.prod.outlook.com (2603:10b6:208:23c::33)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:06:27 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::37) by MN2PR18CA0028.outlook.office365.com
 (2603:10b6:208:23c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:05:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:23 -0600
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
X-Inumbo-ID: f18e1697-d70f-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y57Zy71ynCrEmBsD9ITzj6hCSJKrx1SYavN8zsaVdOXzULjUSIm4E7kd0ykIUDmYvkyPTsawp+FjoAkpOtk6+nMP4GaybLJK2ajWfGz62k15/bqjuXZ8dgSDm9E0JOtAnzzQ4Jzrcz5mG8v/b0GGyr0ZUr9QJPJHyFO58cfkDezwJuosB6/pKPNW3iAI1GwPgXVnEugRS9QTE13RW5cOL+X58sNsrxtinjbZ9rPa711TAWgjmRh8B1WHFm2RK3/n+E6ensJZk71kVS58Iab3Vb0taM7dRvlGJp4aZ8DQ0EqXsz3S3YEuTCzFzThFufVdY3rRxRJsDjJNE4hZsK6Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8kEpXRvqr8MrFDJ2wvTbPkfdGzZSeSHrE84ezAGE34=;
 b=cRlOV7T6deCVtD57oWgGiiohhmc2lPcevD91OUNcbi48zKLcIfORq1sZFwplJQkgiEqU44vQvjSbSGSzssoRqojtur8pVI9mt8OmmmM3wHD7zfdoHfZUr0ZqMzCQkpY3ES5jJ095Ixae7O1KOoEF5hzw4U5Gtsj9TFQYwolBxn3ZuyXC4dfHsasQqgEncLXx7V9PWlZEQ/y22TLZ+lCZ6sAdqNkZFoopfiR/94JeKIpXgyfLd55zYH0sYU/RDgG/gDVnm75hDTu17aSodblaZ99QH+cv8Oy70N2PULGYhe/60GbD6p+fzCDTAuzbn42nj9NvO13oZMWBZCFkGG1uPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8kEpXRvqr8MrFDJ2wvTbPkfdGzZSeSHrE84ezAGE34=;
 b=BkHokY3UPicgMmUoTB9iuxIKuPEpfKSNrqhClRMmtrQEkNZZJ5veUl81ty+CEjr93/o+8IeTpSqFGUXmv7yNnSLYNbpcULN8W/x1kV1GLo5m+Cg/PaCK27wlX7LkV61ou04FqVu6iF7JWIkw+0JhbmFzSLHvjM3OW9B8UchsoKc=
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
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 02/24] xen/x86: library-fy cpuid-releated functions
Date: Fri, 12 Dec 2025 12:01:47 +0800
Message-ID: <20251212040209.1970553-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1c4b18-f28b-459c-f07d-08de3933d237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VsTmTsMT1UqhEAvbB7kuSqxziCTbEhzS2Ur8SWFRVUEgxNukNu34feWmq7I/?=
 =?us-ascii?Q?DHeftFavsH7bFDVsLsEva2keOzvUnMp9bM7tI5JJJG6iJZZECQgVBOqkbOyK?=
 =?us-ascii?Q?62TKzaw5Y3Y1gWe+KHzeYTqSfvSN9rUeUyDDLPbGtL6nnJgIRSTt5CMoNniK?=
 =?us-ascii?Q?FY6jzLuVjwljDwvhgq2k5GUViPfIeGAE79m77IIk/w1NXPf94Rs7C0p3Jb4h?=
 =?us-ascii?Q?L5WjPgh3tg3JNnv3Df2QPNkSLtdRtokIXj/mrf4YgT+sBnTWlDxJTNtw0sdG?=
 =?us-ascii?Q?hlT5wfNsuxSWB0lN7e4x5mpMacRdh9v9M1j9xd0fHuFzTWnRW6V0kJACKE51?=
 =?us-ascii?Q?G7Gv/c4OHPjQmxwab6mmFrTAL9LfadF8XAB3Y9Djd0zIj4CpCGP6/A8IJMs2?=
 =?us-ascii?Q?Qg2RLyqVDtCXGWXQjpJGTEgYGxGSuz8SisRzLD+e+8vpm2xSbttETieg1Ljd?=
 =?us-ascii?Q?+ve9I5SnzlG4eLWE2iuxYe8x5qCCtgbBu5tG/Ko9Wn8IRnzF1F2GJSi1GWVx?=
 =?us-ascii?Q?10jSimavxd7egCp99SVx7Qy5FvoerYL/0s9z1JAJnJv8ulPZvKmx1RHRexwn?=
 =?us-ascii?Q?Ixdnp0tpIDN7xkfUkb2+45+c7g5omBQ5eV25vARZAy6l/aiM61HghmF/LjTs?=
 =?us-ascii?Q?K8YBne55wtsWJkGZEbUBtgcKFqN6A60+DpO3//Od24ULCWHT3vysjukSNeYQ?=
 =?us-ascii?Q?rthnEKH1TblNypRSr6ma5cGmj7Rkf50kiTRLZjYo4ipf0/ReDV0jp6knFlql?=
 =?us-ascii?Q?0BeDUFyv0drdjrpSD6Lt1V9wZXVZpLtXHIkob3oB3hfPWEwP5pMKEX46d1y4?=
 =?us-ascii?Q?TzLyWRpAtemrZVf2Al9ZK4KcvWHe0tL3lknhb6noGpIrkm2pO2hIqD6hcvcj?=
 =?us-ascii?Q?8fd4Yj6qiMQRW23yFw9sMrILWZLjdwdGWQzwRQIwkRnksrVbfw2dVJ2j42zM?=
 =?us-ascii?Q?iMIlPUpBX61hgJrsqvoaqjEt7lmUMXa209lG2rLYBAK7sVgbm2Rg5YdmCG7u?=
 =?us-ascii?Q?b9A1PNhv2kH2/VA9GNgs3vlnuCvQAh91OASjBZqCiS/dutkruN55Xwer85NV?=
 =?us-ascii?Q?Q3pGIz/oEj5fS7RtzQjLES6383NszXZlu8frfhitCs+QEDvh8w3kQUEcHxSV?=
 =?us-ascii?Q?eaziYlaXRUGgZZzkboZlKXfd/aBmOz7fP5ZkrY1GtoWokRZ6ouydkI0FiTOB?=
 =?us-ascii?Q?zrojSoMa0meLSTTH/grcB0VxEn7Qm2T2Z+g8SlHMVXLaCqWc8eEadlS2Jau4?=
 =?us-ascii?Q?2U0NRY/scSL1JdAM2qFlQwC8+tBSHL14pLYd8U5lFGhPs5Fx+EIV27X1fpOz?=
 =?us-ascii?Q?p8r54riuPanPEDnQ9V8+ub/gYt68H6AvQa7/wNFCUXNNnkXtnIFVSPDDDpEl?=
 =?us-ascii?Q?7YMoqlJfA8ZOwRUTzO78cCpEkQjiA9mzWfIwoB8N/bgmYsCmV8NxePR5wbkq?=
 =?us-ascii?Q?DvtbynuTfZTJQXXJ53QlpCb46JKalr83AUcmiRknPABGDoA7PjCpj812KyXw?=
 =?us-ascii?Q?5saKsEWx7+9xFQ3Hq35wGR7EvJ+c0f5Cytk+j9ysJPj+rv0X5yFFVroG5R1i?=
 =?us-ascii?Q?NJm3GGO0CZnyJZJmrPE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:26.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1c4b18-f28b-459c-f07d-08de3933d237
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966

There are some cpuid library functions only referenced in
XEN_DOMCTL-case, and shall be wrapped with CONFIG_MGMT_HYPERCALLS later,
otherwise they will become unreachable when MGMT_HYPERCALLS=n, and hence
violate Misra 2.1
For file cpupolicy-clr.c to contain cpupolicy clearing library function:
- x86_cpu_policy_clear_out_of_range_leaves
  - zero_leaves
For file cpuid-cp2buf.c to contain cpuid copy-to-buffer library function:
- x86_cpuid_copy_to_buffer
  - copy_leaf_to_buffer
For file cpuid-cpfrbuf.c to contain cpuid copy-from-buffer library function:
- x86_cpuid_copy_from_buffer
Sunmmerize all needed cpuid-library object file under a new variable
CPUID_OBJS in Makefile.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- library-fy cpuid-releated functions
---
 tools/fuzz/cpu-policy/Makefile               |   4 +-
 tools/fuzz/x86_instruction_emulator/Makefile |  11 +-
 tools/libs/guest/Makefile.common             |   4 +-
 tools/tests/cpu-policy/Makefile              |   3 +-
 tools/tests/x86_emulator/Makefile            |   3 +-
 xen/lib/Makefile                             |   5 +
 xen/lib/x86/cpuid-cp2buf.c                   | 123 ++++++++
 xen/lib/x86/cpuid-cpfrbuf.c                  | 129 +++++++++
 xen/lib/x86/cpuid.c                          | 286 -------------------
 xen/lib/x86/cpupolicy-clr.c                  |  73 +++++
 10 files changed, 346 insertions(+), 295 deletions(-)
 create mode 100644 xen/lib/x86/cpuid-cp2buf.c
 create mode 100644 xen/lib/x86/cpuid-cpfrbuf.c
 create mode 100644 xen/lib/x86/cpupolicy-clr.c

diff --git a/tools/fuzz/cpu-policy/Makefile b/tools/fuzz/cpu-policy/Makefile
index 6e7743e0aa..543d265e62 100644
--- a/tools/fuzz/cpu-policy/Makefile
+++ b/tools/fuzz/cpu-policy/Makefile
@@ -22,7 +22,9 @@ CFLAGS += $(APPEND_CFLAGS) -Og
 
 vpath %.c ../../../xen/lib/x86
 
-afl-policy-fuzzer: afl-policy-fuzzer.o msr.o cpuid.o
+CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
+afl-policy-fuzzer: afl-policy-fuzzer.o msr.o $(CPUID_OBJS)
+
 	$(CC) $(CFLAGS) $^ -o $@
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 459743f4d9..7a0ca79db8 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -25,7 +25,8 @@ x86_emulate/%.h: x86_emulate ;
 	ln -nsf $< $@
 
 CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -iquote .
-cpuid.o: CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
+CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
+$(CPUID_OBJS): CFLAGS += -iquote $(XEN_ROOT)/xen/lib/x86
 
 GCOV_FLAGS := --coverage
 %-cov.o: %.c
@@ -49,16 +50,16 @@ $(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c $(private.h)
 $(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c $(private.h)
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) $(GCOV_FLAGS) -c -o $@ $< $(APPEND_CFLAGS)
 
-x86-insn-fuzzer.a: $(OBJS) cpuid.o
+x86-insn-fuzzer.a: $(OBJS) $(CPUID_OBJS)
 	$(AR) rc $@ $^
 
-afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
+afl-harness: afl-harness.o $(OBJS) $(CPUID_OBJS) wrappers.o
 	$(CC) $(CFLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
-afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
+afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) $(CPUID_OBJS) wrappers.o
 	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
-libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
+libfuzzer-harness: $(OBJS) $(CPUID_OBJS) wrappers.o
 	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
 # Common targets
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index a026a2f662..7dee6c0e0b 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -35,7 +35,9 @@ OBJS-y += $(LIBELF_OBJS)
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-OBJS-y                 += cpuid.o msr.o policy.o
+CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
+OBJS-y                 += $(CPUID_OBJS)
+OBJS-y                 += msr.o policy.o
 endif
 
 # new domain builder
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 24f87e2eca..f99a8b3ea2 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -46,7 +46,8 @@ vpath %.c ../../../xen/lib/x86
 
 %.o: Makefile
 
-test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
+CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
+test-cpu-policy: test-cpu-policy.o msr.o $(CPUID_OBJS) policy.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 3e02580a35..2f2bf933d3 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -248,7 +248,8 @@ xop.h avx512f.h avx512fp16.h: simd-fma.c
 
 endif # 32-bit override
 
-OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
+CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
+OBJS := x86-emulate.o $(CPUID_OBJS) test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index efca830d92..9b3e03a511 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -45,3 +45,8 @@ lib-$(CONFIG_X86) += xxhash64.o
 lib32-y := divmod.o
 lib32-$(CONFIG_64BIT) :=
 lib-y += $(lib32-y)
+
+libx86-y := x86/cpuid-cp2buf.o
+libx86-y += x86/cpuid-cpfrbuf.o
+libx86-y += x86/cpupolicy-clr.o
+lib-$(CONFIG_X86) += $(libx86-y)
diff --git a/xen/lib/x86/cpuid-cp2buf.c b/xen/lib/x86/cpuid-cp2buf.c
new file mode 100644
index 0000000000..144d915ad9
--- /dev/null
+++ b/xen/lib/x86/cpuid-cp2buf.c
@@ -0,0 +1,123 @@
+#include "private.h"
+
+#include <xen/lib/x86/cpu-policy.h>
+
+/*
+ * Copy a single cpuid_leaf into a provided xen_cpuid_leaf_t buffer,
+ * performing boundary checking against the buffer size.
+ */
+static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
+                               const struct cpuid_leaf *data,
+                               cpuid_leaf_buffer_t leaves,
+                               uint32_t *curr_entry, const uint32_t nr_entries)
+{
+    const xen_cpuid_leaf_t val = {
+        leaf, subleaf, data->a, data->b, data->c, data->d,
+    };
+
+    if ( *curr_entry == nr_entries )
+        return -ENOBUFS;
+
+    if ( copy_to_buffer_offset(leaves, *curr_entry, &val, 1) )
+        return -EFAULT;
+
+    ++*curr_entry;
+
+    return 0;
+}
+
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
+                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
+{
+    const uint32_t nr_entries = *nr_entries_p;
+    uint32_t curr_entry = 0, leaf, subleaf;
+
+#define COPY_LEAF(l, s, data)                                       \
+    ({                                                              \
+        int ret;                                                    \
+                                                                    \
+        if ( (ret = copy_leaf_to_buffer(                            \
+                  l, s, data, leaves, &curr_entry, nr_entries)) )   \
+            return ret;                                             \
+    })
+
+    /* Basic leaves. */
+    for ( leaf = 0; leaf <= MIN(p->basic.max_leaf,
+                                ARRAY_SIZE(p->basic.raw) - 1); ++leaf )
+    {
+        switch ( leaf )
+        {
+        case 0x4:
+            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->cache.raw); ++subleaf )
+            {
+                COPY_LEAF(leaf, subleaf, &p->cache.raw[subleaf]);
+
+                if ( p->cache.subleaf[subleaf].type == 0 )
+                    break;
+            }
+            break;
+
+        case 0x7:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->feat.max_subleaf,
+                                 ARRAY_SIZE(p->feat.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->feat.raw[subleaf]);
+            break;
+
+        case 0xb:
+            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->topo.raw); ++subleaf )
+            {
+                COPY_LEAF(leaf, subleaf, &p->topo.raw[subleaf]);
+
+                if ( p->topo.subleaf[subleaf].type == 0 )
+                    break;
+            }
+            break;
+
+        case 0xd:
+        {
+            uint64_t xstates = cpu_policy_xstates(p);
+
+            COPY_LEAF(leaf, 0, &p->xstate.raw[0]);
+            COPY_LEAF(leaf, 1, &p->xstate.raw[1]);
+
+            for ( xstates >>= 2, subleaf = 2;
+                  xstates && subleaf < ARRAY_SIZE(p->xstate.raw);
+                  xstates >>= 1, ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->xstate.raw[subleaf]);
+            break;
+        }
+
+        default:
+            COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
+            break;
+        }
+    }
+
+    /* TODO: Port Xen and Viridian leaves to the new CPUID infrastructure. */
+    COPY_LEAF(0x40000000, XEN_CPUID_NO_SUBLEAF,
+              &(struct cpuid_leaf){ p->hv_limit });
+    COPY_LEAF(0x40000100, XEN_CPUID_NO_SUBLEAF,
+              &(struct cpuid_leaf){ p->hv2_limit });
+
+    /* Extended leaves. */
+    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
+                                ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
+        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
+
+#undef COPY_LEAF
+
+    *nr_entries_p = curr_entry;
+
+    return 0;
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
diff --git a/xen/lib/x86/cpuid-cpfrbuf.c b/xen/lib/x86/cpuid-cpfrbuf.c
new file mode 100644
index 0000000000..41eb7ee250
--- /dev/null
+++ b/xen/lib/x86/cpuid-cpfrbuf.c
@@ -0,0 +1,129 @@
+#include "private.h"
+
+#include <xen/lib/x86/cpu-policy.h>
+
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
+                               const cpuid_leaf_buffer_t leaves,
+                               uint32_t nr_entries, uint32_t *err_leaf,
+                               uint32_t *err_subleaf)
+{
+    unsigned int i;
+    xen_cpuid_leaf_t data;
+
+    if ( err_leaf )
+        *err_leaf = -1;
+    if ( err_subleaf )
+        *err_subleaf = -1;
+
+    /*
+     * A well formed caller is expected to pass an array with leaves in order,
+     * and without any repetitions.  However, due to per-vendor differences,
+     * and in the case of upgrade or levelled scenarios, we typically expect
+     * fewer than MAX leaves to be passed.
+     *
+     * Detecting repeated entries is prohibitively complicated, so we don't
+     * bother.  That said, one way or another if more than MAX leaves are
+     * passed, something is wrong.
+     */
+    if ( nr_entries > CPUID_MAX_SERIALISED_LEAVES )
+        return -E2BIG;
+
+    for ( i = 0; i < nr_entries; ++i )
+    {
+        struct cpuid_leaf l;
+
+        if ( copy_from_buffer_offset(&data, leaves, i, 1) )
+            return -EFAULT;
+
+        l = (struct cpuid_leaf){ data.a, data.b, data.c, data.d };
+
+        switch ( data.leaf )
+        {
+        case 0 ... ARRAY_SIZE(p->basic.raw) - 1:
+            switch ( data.leaf )
+            {
+            case 0x4:
+                if ( data.subleaf >= ARRAY_SIZE(p->cache.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->cache.raw, data.subleaf) = l;
+                break;
+
+            case 0x7:
+                if ( data.subleaf >= ARRAY_SIZE(p->feat.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->feat.raw, data.subleaf) = l;
+                break;
+
+            case 0xb:
+                if ( data.subleaf >= ARRAY_SIZE(p->topo.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->topo.raw, data.subleaf) = l;
+                break;
+
+            case 0xd:
+                if ( data.subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->xstate.raw, data.subleaf) = l;
+                break;
+
+            default:
+                if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                    goto out_of_range;
+
+                array_access_nospec(p->basic.raw, data.leaf) = l;
+                break;
+            }
+            break;
+
+        case 0x40000000:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            p->hv_limit = l.a;
+            break;
+
+        case 0x40000100:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            p->hv2_limit = l.a;
+            break;
+
+        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            array_access_nospec(p->extd.raw, data.leaf & 0xffff) = l;
+            break;
+
+        default:
+            goto out_of_range;
+        }
+    }
+
+    x86_cpu_policy_recalc_synth(p);
+
+    return 0;
+
+ out_of_range:
+    if ( err_leaf )
+        *err_leaf = data.leaf;
+    if ( err_subleaf )
+        *err_subleaf = data.subleaf;
+
+    return -ERANGE;
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
index 6298d051f2..465bdee35a 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -2,13 +2,6 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-static void zero_leaves(struct cpuid_leaf *l,
-                        unsigned int first, unsigned int last)
-{
-    if ( first <= last )
-        memset(&l[first], 0, sizeof(*l) * (last - first + 1));
-}
-
 unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx)
 {
     switch ( ebx )
@@ -238,59 +231,6 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
     x86_cpu_policy_recalc_synth(p);
 }
 
-void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
-{
-    unsigned int i;
-
-    zero_leaves(p->basic.raw, p->basic.max_leaf + 1,
-                ARRAY_SIZE(p->basic.raw) - 1);
-
-    if ( p->basic.max_leaf < 4 )
-        memset(p->cache.raw, 0, sizeof(p->cache.raw));
-    else
-    {
-        for ( i = 0; (i < ARRAY_SIZE(p->cache.raw) &&
-                      p->cache.subleaf[i].type); ++i )
-            ;
-
-        zero_leaves(p->cache.raw, i, ARRAY_SIZE(p->cache.raw) - 1);
-    }
-
-    if ( p->basic.max_leaf < 7 )
-        memset(p->feat.raw, 0, sizeof(p->feat.raw));
-    else
-        zero_leaves(p->feat.raw, p->feat.max_subleaf + 1,
-                    ARRAY_SIZE(p->feat.raw) - 1);
-
-    if ( p->basic.max_leaf < 0xb )
-        memset(p->topo.raw, 0, sizeof(p->topo.raw));
-    else
-    {
-        for ( i = 0; (i < ARRAY_SIZE(p->topo.raw) &&
-                      p->topo.subleaf[i].type); ++i )
-            ;
-
-        zero_leaves(p->topo.raw, i, ARRAY_SIZE(p->topo.raw) - 1);
-    }
-
-    if ( p->basic.max_leaf < 0xd || !cpu_policy_xstates(p) )
-        memset(p->xstate.raw, 0, sizeof(p->xstate.raw));
-    else
-    {
-        /* This logic will probably need adjusting when XCR0[63] gets used. */
-        BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
-
-        /* First two leaves always valid.  Rest depend on xstates. */
-        i = max(2, 64 - __builtin_clzll(cpu_policy_xstates(p)));
-
-        zero_leaves(p->xstate.raw, i,
-                    ARRAY_SIZE(p->xstate.raw) - 1);
-    }
-
-    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
-                ARRAY_SIZE(p->extd.raw) - 1);
-}
-
 const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
@@ -322,232 +262,6 @@ const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
     return NULL;
 }
 
-/*
- * Copy a single cpuid_leaf into a provided xen_cpuid_leaf_t buffer,
- * performing boundary checking against the buffer size.
- */
-static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
-                               const struct cpuid_leaf *data,
-                               cpuid_leaf_buffer_t leaves,
-                               uint32_t *curr_entry, const uint32_t nr_entries)
-{
-    const xen_cpuid_leaf_t val = {
-        leaf, subleaf, data->a, data->b, data->c, data->d,
-    };
-
-    if ( *curr_entry == nr_entries )
-        return -ENOBUFS;
-
-    if ( copy_to_buffer_offset(leaves, *curr_entry, &val, 1) )
-        return -EFAULT;
-
-    ++*curr_entry;
-
-    return 0;
-}
-
-int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
-                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
-{
-    const uint32_t nr_entries = *nr_entries_p;
-    uint32_t curr_entry = 0, leaf, subleaf;
-
-#define COPY_LEAF(l, s, data)                                       \
-    ({                                                              \
-        int ret;                                                    \
-                                                                    \
-        if ( (ret = copy_leaf_to_buffer(                            \
-                  l, s, data, leaves, &curr_entry, nr_entries)) )   \
-            return ret;                                             \
-    })
-
-    /* Basic leaves. */
-    for ( leaf = 0; leaf <= MIN(p->basic.max_leaf,
-                                ARRAY_SIZE(p->basic.raw) - 1); ++leaf )
-    {
-        switch ( leaf )
-        {
-        case 0x4:
-            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->cache.raw); ++subleaf )
-            {
-                COPY_LEAF(leaf, subleaf, &p->cache.raw[subleaf]);
-
-                if ( p->cache.subleaf[subleaf].type == 0 )
-                    break;
-            }
-            break;
-
-        case 0x7:
-            for ( subleaf = 0;
-                  subleaf <= MIN(p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1); ++subleaf )
-                COPY_LEAF(leaf, subleaf, &p->feat.raw[subleaf]);
-            break;
-
-        case 0xb:
-            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->topo.raw); ++subleaf )
-            {
-                COPY_LEAF(leaf, subleaf, &p->topo.raw[subleaf]);
-
-                if ( p->topo.subleaf[subleaf].type == 0 )
-                    break;
-            }
-            break;
-
-        case 0xd:
-        {
-            uint64_t xstates = cpu_policy_xstates(p);
-
-            COPY_LEAF(leaf, 0, &p->xstate.raw[0]);
-            COPY_LEAF(leaf, 1, &p->xstate.raw[1]);
-
-            for ( xstates >>= 2, subleaf = 2;
-                  xstates && subleaf < ARRAY_SIZE(p->xstate.raw);
-                  xstates >>= 1, ++subleaf )
-                COPY_LEAF(leaf, subleaf, &p->xstate.raw[subleaf]);
-            break;
-        }
-
-        default:
-            COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
-            break;
-        }
-    }
-
-    /* TODO: Port Xen and Viridian leaves to the new CPUID infrastructure. */
-    COPY_LEAF(0x40000000, XEN_CPUID_NO_SUBLEAF,
-              &(struct cpuid_leaf){ p->hv_limit });
-    COPY_LEAF(0x40000100, XEN_CPUID_NO_SUBLEAF,
-              &(struct cpuid_leaf){ p->hv2_limit });
-
-    /* Extended leaves. */
-    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
-                                ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
-        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
-
-#undef COPY_LEAF
-
-    *nr_entries_p = curr_entry;
-
-    return 0;
-}
-
-int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
-                               const cpuid_leaf_buffer_t leaves,
-                               uint32_t nr_entries, uint32_t *err_leaf,
-                               uint32_t *err_subleaf)
-{
-    unsigned int i;
-    xen_cpuid_leaf_t data;
-
-    if ( err_leaf )
-        *err_leaf = -1;
-    if ( err_subleaf )
-        *err_subleaf = -1;
-
-    /*
-     * A well formed caller is expected to pass an array with leaves in order,
-     * and without any repetitions.  However, due to per-vendor differences,
-     * and in the case of upgrade or levelled scenarios, we typically expect
-     * fewer than MAX leaves to be passed.
-     *
-     * Detecting repeated entries is prohibitively complicated, so we don't
-     * bother.  That said, one way or another if more than MAX leaves are
-     * passed, something is wrong.
-     */
-    if ( nr_entries > CPUID_MAX_SERIALISED_LEAVES )
-        return -E2BIG;
-
-    for ( i = 0; i < nr_entries; ++i )
-    {
-        struct cpuid_leaf l;
-
-        if ( copy_from_buffer_offset(&data, leaves, i, 1) )
-            return -EFAULT;
-
-        l = (struct cpuid_leaf){ data.a, data.b, data.c, data.d };
-
-        switch ( data.leaf )
-        {
-        case 0 ... ARRAY_SIZE(p->basic.raw) - 1:
-            switch ( data.leaf )
-            {
-            case 0x4:
-                if ( data.subleaf >= ARRAY_SIZE(p->cache.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->cache.raw, data.subleaf) = l;
-                break;
-
-            case 0x7:
-                if ( data.subleaf >= ARRAY_SIZE(p->feat.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->feat.raw, data.subleaf) = l;
-                break;
-
-            case 0xb:
-                if ( data.subleaf >= ARRAY_SIZE(p->topo.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->topo.raw, data.subleaf) = l;
-                break;
-
-            case 0xd:
-                if ( data.subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->xstate.raw, data.subleaf) = l;
-                break;
-
-            default:
-                if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                    goto out_of_range;
-
-                array_access_nospec(p->basic.raw, data.leaf) = l;
-                break;
-            }
-            break;
-
-        case 0x40000000:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            p->hv_limit = l.a;
-            break;
-
-        case 0x40000100:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            p->hv2_limit = l.a;
-            break;
-
-        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            array_access_nospec(p->extd.raw, data.leaf & 0xffff) = l;
-            break;
-
-        default:
-            goto out_of_range;
-        }
-    }
-
-    x86_cpu_policy_recalc_synth(p);
-
-    return 0;
-
- out_of_range:
-    if ( err_leaf )
-        *err_leaf = data.leaf;
-    if ( err_subleaf )
-        *err_subleaf = data.subleaf;
-
-    return -ERANGE;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/lib/x86/cpupolicy-clr.c b/xen/lib/x86/cpupolicy-clr.c
new file mode 100644
index 0000000000..de090a7c95
--- /dev/null
+++ b/xen/lib/x86/cpupolicy-clr.c
@@ -0,0 +1,73 @@
+#include "private.h"
+
+#include <xen/lib/x86/cpu-policy.h>
+
+static void zero_leaves(struct cpuid_leaf *l,
+                        unsigned int first, unsigned int last)
+{
+    if ( first <= last )
+        memset(&l[first], 0, sizeof(*l) * (last - first + 1));
+}
+
+void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
+{
+    unsigned int i;
+
+    zero_leaves(p->basic.raw, p->basic.max_leaf + 1,
+                ARRAY_SIZE(p->basic.raw) - 1);
+
+    if ( p->basic.max_leaf < 4 )
+        memset(p->cache.raw, 0, sizeof(p->cache.raw));
+    else
+    {
+        for ( i = 0; (i < ARRAY_SIZE(p->cache.raw) &&
+                      p->cache.subleaf[i].type); ++i )
+            ;
+
+        zero_leaves(p->cache.raw, i, ARRAY_SIZE(p->cache.raw) - 1);
+    }
+
+    if ( p->basic.max_leaf < 7 )
+        memset(p->feat.raw, 0, sizeof(p->feat.raw));
+    else
+        zero_leaves(p->feat.raw, p->feat.max_subleaf + 1,
+                    ARRAY_SIZE(p->feat.raw) - 1);
+
+    if ( p->basic.max_leaf < 0xb )
+        memset(p->topo.raw, 0, sizeof(p->topo.raw));
+    else
+    {
+        for ( i = 0; (i < ARRAY_SIZE(p->topo.raw) &&
+                      p->topo.subleaf[i].type); ++i )
+            ;
+
+        zero_leaves(p->topo.raw, i, ARRAY_SIZE(p->topo.raw) - 1);
+    }
+
+    if ( p->basic.max_leaf < 0xd || !cpu_policy_xstates(p) )
+        memset(p->xstate.raw, 0, sizeof(p->xstate.raw));
+    else
+    {
+        /* This logic will probably need adjusting when XCR0[63] gets used. */
+        BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
+
+        /* First two leaves always valid.  Rest depend on xstates. */
+        i = max(2, 64 - __builtin_clzll(cpu_policy_xstates(p)));
+
+        zero_leaves(p->xstate.raw, i,
+                    ARRAY_SIZE(p->xstate.raw) - 1);
+    }
+
+    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
+                ARRAY_SIZE(p->extd.raw) - 1);
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
-- 
2.34.1


