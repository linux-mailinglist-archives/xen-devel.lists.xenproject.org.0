Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3CD18AE7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201589.1517197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP6-00058I-Gj; Tue, 13 Jan 2026 12:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201589.1517197; Tue, 13 Jan 2026 12:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP6-00055Q-Co; Tue, 13 Jan 2026 12:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1201589;
 Tue, 13 Jan 2026 12:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdP5-0004bR-EI
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:21:43 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ffe719-f07a-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 13:21:41 +0100 (CET)
Received: from MN2PR16CA0055.namprd16.prod.outlook.com (2603:10b6:208:234::24)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:21:37 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::a6) by MN2PR16CA0055.outlook.office365.com
 (2603:10b6:208:234::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 12:21:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:21:37 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:21:34 -0600
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
X-Inumbo-ID: 69ffe719-f07a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4x9Bz3kINVh/FeVvZq08z/WtS2Uktnn25zZ9RiRErV8A7wa3Wo3DtL5TLJBcfot63psUnvu3MKHetqkecPzGbVM1A3mSshJhx2y9DNg0mVh+89JfDpeeeSUG1RW8FrZCKQaIKoQfei/PnpQ5t7CDY/fzl1uj+laKeLff9zgH78mSTIYzohZ7UX1ko89Qy1i6ICHzf+CUK4oUugHYCH8esnS2kHE5RO4swKbigo+V2yeLO9WWDwFVTyIpKO8abMlvRdTuzH1o7FPJ1v2MBEdZt2FxDmojgr2fyVSVFvdPv6JVpUZtuc0iRJFQWBj3h/JOXg3ozyD1mibZ2TmhaQG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWp8DZG/eGZsi9jg+Gber251xIS5sXUS7XbDSzbTugk=;
 b=hSFQi6IgwB6RDyrPiVD3eYdxgilO4x/SDOj4avI+YYKo0Ue+ZpXU6WEHu9wkUaC5KEjWK3iSX6rci1RulvCB8+Y/mVbVfO1lR7zXh8J4Sl++NLx7kRulh39DuhLaYS2jMjiMWXEHtrWOn6tj0/DOGAZ4HdIU1hNb+OhSkgtbWgd0Ydi2nE0hIVYzv/94+LA4W1k3e9Zn5+0bNbYGGq2FGlKnQNTOCyi+WHHHhsFpuTgINQYvNwBtFTFv59XAb6PXvDBn4Kjifz93yxRiaEffuuZLV4bROkKjfcna1U+u6Qh3DOOAgAK72U6sC0ahHXtW9CZ9MenMAEVgIBd04jC5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWp8DZG/eGZsi9jg+Gber251xIS5sXUS7XbDSzbTugk=;
 b=0ycaEQaKymNtbrIpawnq5xhJjJyGJ4c83KIBvnRfi4FdfehMjP42075+Ww3xFGS3Ye9NOfpXKYOy8d/BLwqidJM4OJI/IG62XJd//ifW+ebFQigS0jbp0yOn9Dt5T7e+Xenr0E1NYo7Po4X3ClVYxcrG1CVothNYK0aet1CTxbM=
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
Subject: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
Date: Tue, 13 Jan 2026 13:21:03 +0100
Message-ID: <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: d21156ef-730a-4c7c-0e6c-08de529e4c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ilzf2mVMOrVafu8e4YNN1uKRfS7jZhfexCu/OEhHt3ZtiIzPRRk5V/Ssjzn7?=
 =?us-ascii?Q?zei7IBltip60vblZEpfBAWcuW7i4olE+9MOAuLhXdxXLoSR2CK/TrHeuN1FR?=
 =?us-ascii?Q?Loz3yQ3kcAKyEO84cp+vjB07T8LA1I3sxJsLlxzOG7MVee99Ek4zydSWIDcb?=
 =?us-ascii?Q?N/nVVFU4X+N1xaY6yAUreYYTMqvfB6KBxLQ2Aot0JYmU5XeksUrnTqEblYAH?=
 =?us-ascii?Q?mCdI/ECSg13lsVpiNbqpbvX6uvNY/wYRjAwtddobKhvRC5el8xG9KcvSzdc+?=
 =?us-ascii?Q?gDhkeOAQs7D71dIJnfpfafAEZdY6NTfsKwLKW662vBcgYY8XncTo8YlDY4Wh?=
 =?us-ascii?Q?a48vITU0DNse1HM9vkmPQ1EU/EbJ+ehWfNiiT8rlxefbxFjPFml2S1I+Jlq0?=
 =?us-ascii?Q?0ojw/8m+ejOOaE97bY9CC3kCav7m9KC1v7ID4I8jspzfuY+YsOJwm11GwEtW?=
 =?us-ascii?Q?tV2To9DpzTBWDSomIuDhMinIBKTUo2fpakuu3UJA67RB4Tuni7udePebn22F?=
 =?us-ascii?Q?NvaknS9CGua8U5PIop7pZCQaWcmDRuQr6JgKo+qUNt6dS1gGwd1M88/YU9OP?=
 =?us-ascii?Q?8dur5zLzsP3E1JAzf9dh5TcJmpgufjICrzOTdsXrRi1PSlhXYVTpds55/dGv?=
 =?us-ascii?Q?bghz8iDxggGDlAoLZZ7VttfSVP19P4srSIlGzdyTsGlAc0DkfsGwNxPvg506?=
 =?us-ascii?Q?A9n2iUiDUvi/up8HlAkYI8k7NcRSbzTRKKFmN0axxxBb+2asYlCwUvAnU+DV?=
 =?us-ascii?Q?/zp4pz49ra7WnEGhV//NlfS5tkBN9BJ5b9B6wmokUBxkERXfxGX0ZYJYWHnQ?=
 =?us-ascii?Q?EtNKDZiHGMwu3GLWMqm5FsBgeREAwDuKbKy95XBpv61NOmzZnRIcvuTINwEu?=
 =?us-ascii?Q?zayhVDQMF1VOlsUfHXOtSH7UW7cDwQMnySAdpN8uizqBltMy4jkqL7GC9jsy?=
 =?us-ascii?Q?hg+HupKdh7mDVKR/tyCaQUpcURMbhF5wBx8t5g0tUWs2t8Ye4DN+CBASVpMb?=
 =?us-ascii?Q?CeRe5hR783cD5VlPJXUNL0bARSAfGl17VixEWMEXpxy712iIKNlKHpU4VD79?=
 =?us-ascii?Q?HL037okEqntYwafNnHRwTZ4MeYsoiEX1xdj5Z2x90rj7iynJN7UgX3etPBnP?=
 =?us-ascii?Q?lHmXBclJTdUV4yp1nCrOz8sXD1ZnGeHHAwuMl0CtbA6KSiIK/7YI6AL41ORv?=
 =?us-ascii?Q?EcEodlRax5tmKVu9IqQOH4eHqWDufmcFhx/QW98lhtz0V1/XaU/xAJ4TjkSV?=
 =?us-ascii?Q?R7sfBolqwVc33gGFV9FjnqJq+aeOn5rzOWIX7M4cY6cHZaRR67OeoYN/fzWM?=
 =?us-ascii?Q?pPv4miW9OX/u8IBlt9rnnTkWPS9zgp8lm7umIhH5zBMT3FzKjTan57vDXigm?=
 =?us-ascii?Q?ZlTt+MDMN0NGg9G8Em6llbHE9qOGgFSjRzqMrGp0esYBrLN+062bLGnFrEzY?=
 =?us-ascii?Q?rNPXMf9Cmwz7wmfXdrn7tRuxVD2ctzV5cgPvapHKGzt+Feyom/hN0Z1dwEaI?=
 =?us-ascii?Q?n1/a8wKxeazXMDxBldarHrq8EGcu8NWTgutQq+asPFJ0IIGBltUoUOWN6L/2?=
 =?us-ascii?Q?S7/MvMayGuW6gMblPaI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:21:37.3367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21156ef-730a-4c7c-0e6c-08de529e4c76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181

It's only used for microcode loading on x86. By lib-ifying it we can make
it go away automatically when microcode loading becomes an optional
feature in follow-up patches.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * New patch. Subsumes earlier conditionalisation of earlycpio.c on
    CONFIG_MICROCODE_LOADING.
---
 docs/misra/exclude-list.json    | 8 ++++----
 xen/common/Makefile             | 2 +-
 xen/lib/Makefile                | 1 +
 xen/{common => lib}/earlycpio.c | 0
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename xen/{common => lib}/earlycpio.c (100%)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 388397dd3b..2b874dfd3b 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -121,10 +121,6 @@
             "rel_path": "common/bunzip2.c",
             "comment": "Imported from Linux, ignore for now"
         },
-        {
-            "rel_path": "common/earlycpio.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
         {
             "rel_path": "common/gzip/*",
             "comment": "Imported from Linux, ignore for now"
@@ -225,6 +221,10 @@
             "rel_path": "include/xen/decompress.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "lib/earlycpio.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "lib/find-next-bit.c",
             "comment": "Imported from Linux, ignore for now"
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 92c97d641e..4fc0c15088 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -65,7 +65,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
-obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
+obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index efca830d92..60cfda4dfc 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
+lib-y += earlycpio.o
 lib-y += find-next-bit.o
 lib-y += generic-ffsl.o
 lib-y += generic-flsl.o
diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
similarity index 100%
rename from xen/common/earlycpio.c
rename to xen/lib/earlycpio.c
-- 
2.43.0


