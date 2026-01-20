Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1FD3C3CF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208505.1520702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DE-00025v-36; Tue, 20 Jan 2026 09:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208505.1520702; Tue, 20 Jan 2026 09:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DD-00021n-Tt; Tue, 20 Jan 2026 09:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1208505;
 Tue, 20 Jan 2026 09:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8DC-0001NH-7H
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:46 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1076146-f5e3-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 10:39:41 +0100 (CET)
Received: from SA9PR13CA0140.namprd13.prod.outlook.com (2603:10b6:806:27::25)
 by DS4PR12MB9587.namprd12.prod.outlook.com (2603:10b6:8:282::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:39:34 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::27) by SA9PR13CA0140.outlook.office365.com
 (2603:10b6:806:27::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 09:39:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:34 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:31 -0600
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
X-Inumbo-ID: f1076146-f5e3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfkDOqS31wCdYnTpShbnmcVOXFOlJEA7cLPAHAcYDvDA6/uoZ17Q4iVY0ECN9qxYDZp6AoS7/b1Rv3D0bbnWhMjXJShx5iNHZumqYXLUKtJtY0ADLzt0y1A7knynwE0NBVtqbpZo9W0aYay6gOeS9ti1aKAfXOJGhhMDbRl9UQh/ps6jSIPVlp8kqOET/tKmI8fIxOge2PE2A0HwutMrVLuwYV10HaHfPh08zt0OxLCXAKz2qwJqTbGhbPnxdA7z6+BxzBfR+TlHrRf9wELuIVm5/vyySL1hcEdMHVxMjWtPmYN+L0qea6kNxHLxBViQ0q7E/4aWsRMdQohMNLQuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62HqEqk8utj2zzHdDMhP2cMsxApDUfMNx+Y6Knj7xvY=;
 b=EJabZY8Rr85CDe2gGdcU6wKNsUowQQc4v1u3TB6gB86XTlTDGUAhfn0TLKAZf38jKgYIbPe6d2MmfBPwI0O/L9QBHtxFY/4AOd2UlEaxbk9MIIZ4+Mhaeq50IZMZiO9/PY35bh5wOW8eT9hysQqLya4Fbp6FAb1aN1p1UUzdPCWYN01cVQvpSRELSt3qfYyC89uVnNlom1hCn5dxHGTU9vnmPFw8i4uL4ZB91Emyh0FvhGk0QA1y6Fe+g+WxytfwhwtfPlxh3pCnXdAaINl1hlel8D1jSTWSqpKbW+iXAcauXMQwpclXkX6Lms7YZTbBZ7mi7lrgirvpymIZH9/Xqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62HqEqk8utj2zzHdDMhP2cMsxApDUfMNx+Y6Knj7xvY=;
 b=T7NVIjuloptUwn1HTPAvA6rY9dc1UkW3MNPE9Z3LXGsI+LEihoxiVdu+BmLpCxx665AoSkk32YJ9QSf8gQQX9P9UZ5pRGIhtRJHjHLGpjLNA+GYAU6Xu1nl1xTe48/y0fYvlXoWBeJl783g838qNwXXB+iEbzwu37hlX42dgpFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/5] xen: Allow lib-y targets to also be .init.o
Date: Tue, 20 Jan 2026 10:38:47 +0100
Message-ID: <20260120093852.2380-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|DS4PR12MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: 3562909c-cbe8-4789-65df-08de5807d1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uMQIP/TVxaSLtVRj0dZi4wkb3WGbj4JQK4Ab6TZq9nHTKMom0CHilrbTu/Vo?=
 =?us-ascii?Q?yc3V18CEuXtsyZcsfrL1L/3UY+amhxZofOZ+YxaSvI9riqtI9D4GLKg5l3nX?=
 =?us-ascii?Q?i3uhz5nqQMwp0bdcKM7Jy6UOIrdKi5kXaDK9VUBHP12JRDkYzfqMGEpcoQ44?=
 =?us-ascii?Q?/5jX1sBK9nco4GuI3HUSyBH2X7lPp08GNZQ9mrOC8X8N/+tfURjYL862tqLK?=
 =?us-ascii?Q?S6JUTbomMeV/6HHBz9DsxH4mBZDQgdsO+/+E0Qqyd5BZABxPN4VtVbzm4du6?=
 =?us-ascii?Q?m+nKXqoIwzd7CRZ46kpsm7v5IJMYWj7R3C/ACuZPBuUrI7asBbhXzBc2dyxb?=
 =?us-ascii?Q?XPHCmpOWoNU4dp/J88CgU49U9glrUPYV0P8S+Ercd0RT9PPZ8w6md1f2He6Z?=
 =?us-ascii?Q?bcK3RRS3Zp7cJRwBSb1GX9IR3zIyCLah/Q/PLfK7N5JIBe1msm2ehRkLX9Ef?=
 =?us-ascii?Q?JG7MwRSMjnn8zjrQl3Nqc1Got+qnCaZyEJBYEYVGPF242+dKxyPPoiNXcbWN?=
 =?us-ascii?Q?lxAaeJZ52nqBj+D91ydDFAZpRzUiNLGU496gDTew9CtE+XExZGnDm0T4qMDR?=
 =?us-ascii?Q?pRA3W3m8OwzFyDq9n/9tU1VYjD6bJqZlfNeHJtL/6DHW27IANeuMuu5fob8c?=
 =?us-ascii?Q?Yvjuge28FPmb8UAuIeYF608s+BjniLALH5KDQM2aNxwaBtC/VRCP2xvPfIKp?=
 =?us-ascii?Q?A23vOSOo20r8kX/Rwl3AwaSi5rSxpIbm0FyZMmx6GGyozoJSTmF5NEzxtQxH?=
 =?us-ascii?Q?da68oah43Sp+RhFC/2yUOLuT8hY1d+xLqLz4RSRheh9Uk/ViAi9J9GaU0yQH?=
 =?us-ascii?Q?/aDsM6LRB76v+sg0TB7Q9NNTXTJU36vsBS12xQGs3Wmh5ITQWYxpfpeVCnX7?=
 =?us-ascii?Q?FIRPeNM+bFl2l4aKf2nXJ6JKO6ZxLN6pwEYbf6Kk/E0UFvHtb6cOfTubwoXd?=
 =?us-ascii?Q?h+F48DrO757mATR495y+G3jW1//nTetb6Co4/c80A1+LNDJ8zK+8Q5JqGwSK?=
 =?us-ascii?Q?e1SMSX6VfN+x482A3gBJnJEC7192vhme9TZ8VzlPG8X8XwRWb8H1gVs9mc8Z?=
 =?us-ascii?Q?BjpLkBw5fIbUh6xDaUnpMM/jGDIl4kahxI7n+qo/1mGwgznNPjlAPUkDBHG7?=
 =?us-ascii?Q?edeoMF3VWxdbHQba/QPftVtWQMEeQ//Xp9ZVdE7G/95aFq0MpaijxJqTAvI6?=
 =?us-ascii?Q?bf5cLUWTVQ3mImZDMxyQf4x04K8usjX9ihn5aATn1t85O0xDYJXpf0Na0qGs?=
 =?us-ascii?Q?2oTJ1vFG4MuEZ1pQNYOFP/fLHd6KVEEHuhN7s5EdPM3NWvLHlTodeheYu7GV?=
 =?us-ascii?Q?b/TQ6M1SLLQeTrm+iwnCQCY+6j2accDQ1NF+GfjLzWySA9TOrBYa9U69eXZY?=
 =?us-ascii?Q?1uqUK1fl8INyOpeQoW5huZxgH0DiGbiEoKi9L4lvoKfPkaONnrCMlyVSzPmn?=
 =?us-ascii?Q?QT0BwyyX5sEcWyAoX16lPRc+tt31v4wJiRc/KoP7Nm2fmYUTwWm/asQ2y3xv?=
 =?us-ascii?Q?idpz25lsSJxgQRZtniTEzaxIzLTV1mW6+Gt/3XFeo/nxr9aHLUPSV+1ywDWi?=
 =?us-ascii?Q?vnRw/WXpoVBy+agfVjdpNZwpJLwnPutLZ0X3AbhoViE9ZyU5ppCMUGdsN4w1?=
 =?us-ascii?Q?Hon/meMt1QICCBDtLu/k23RG9oj9iAR/VFkpKxrk+zk8K1IfTs5nEMJoqcVM?=
 =?us-ascii?Q?qcFcaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:34.1409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3562909c-cbe8-4789-65df-08de5807d1db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9587

There's some assumptions as to which targets may be init-only. But
there's little reason to preclude libraries from being init-only.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/Rules.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2b28d1ac3c..2c3f836c1b 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -130,9 +130,9 @@ endif
 
 targets += $(targets-for-builtin)
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
-non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
+non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y))
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
@@ -146,7 +146,7 @@ endif
 $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=atomic)
 
 # Reset cov-cflags-y in cases where an objects has another one as prerequisite
-$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): \
     cov-cflags-y :=
 
 $(non-init-objects): _c_flags += $(cov-cflags-y)
@@ -156,7 +156,7 @@ ifeq ($(CONFIG_UBSAN),y)
 UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
 
 # Reset UBSAN_FLAGS in cases where an objects has another one as prerequisite
-$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): \
     UBSAN_FLAGS :=
 
 $(non-init-objects): _c_flags += $(UBSAN_FLAGS)
@@ -273,7 +273,7 @@ define cmd_obj_init_o
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-- 
2.43.0


