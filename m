Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFDC8B068
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173109.1498211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIds-0000B3-Sh; Wed, 26 Nov 2025 16:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173109.1498211; Wed, 26 Nov 2025 16:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIds-00005H-Ma; Wed, 26 Nov 2025 16:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1173109;
 Wed, 26 Nov 2025 16:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdq-0008EF-Oi
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:18 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48fd024d-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:18 +0100 (CET)
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:45:08 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::a7) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 16:44:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:08 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:06 -0600
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
X-Inumbo-ID: 48fd024d-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS2rCBpA6RxZIqcJZLxNWszeMdSxo7xjk4j0JdpRrC5Ors1Kpvwl/aEW4C3oBDSiPN7p9d0wF/NHybxbdGg0ITMOZXyFPCLcVNipnbDikMd/RxZyq/ad7rm66k6n3s4lg8ghY26fhGdP9Zw1SOjHSIjZ/UTRqbgYUiYhKx1ktj3+//+AQ7WP9ZCKV1bIxY4ylQbyatgao+0SUX/RITVSlKkiQR6xwzRQVunvsb1NwMvdo3ng/jRtfCxfPFmp7jLm4rIxrAlR7Mr3sDSx5j+2tbkzS8SP6KmRdTa8yOXHAFqVkr5xGMPoh9LExJsNAyEI5umT1grqYPqL8TNISCgvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAHa7MUCZqeioDzsZSkQDA41NnZnvXxGowHMxx8/l0c=;
 b=kv6Ly/kS/axfRZMPoh1aMoCcANQNYwZALsYwHylkPDWgAoQ7Bk/xl8uagXyso7GiKdQG4sYPjXg/ifXU56hZ57QxZxFy6LLXk2MyoqCRCFX1x2B2CuE/s+AltTibLr70Pc79gmyVob2xDCORr92+q/voN5bp4OcLCzggxAgR8r1CKBhXfrtH23w2URjcEhG1+a4BZIVLLhdayc9qnoqrRgnVlsvIBg6XxMLGYmkn9d5gBNUaPMXpwVoRENU2RtzLrtFGbjWwI+qLSc8dtyZ388GTaArh03gPsLxWDWbXrnYzdavE37KWxMA1ju6BAMf8t167u5EsKA6MXozvWo8WsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAHa7MUCZqeioDzsZSkQDA41NnZnvXxGowHMxx8/l0c=;
 b=0ht2CrU/HPLP5vCvBfkMFNsPF8H8cLH2ihENhf07lNQxdG/171NzsEkmtBf/F/2ady3b39k114jPjS22x+Sdz8db3bO+yYSrisLie/qU4oeZdW5jl0FfOdM/X1u90x0pCoTwQ31ZmG3rYUuhZpDimf5ESpr8WBWx/axyE6SzFnU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before using it
Date: Wed, 26 Nov 2025 17:44:05 +0100
Message-ID: <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: b9794a4a-afc0-4974-9f53-08de2d0b28af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8hmMHXydGQYBO1L6hnPOT3HG1bt3Y5FVbywIdpMOwuYbCN0E5+hVGkL/RH+3?=
 =?us-ascii?Q?66pq2ZHEsF5ivpSSm5Jw5z8ZBNTGsIIyCV+WQ6zPf7IwOHn09zuLLW77jwTa?=
 =?us-ascii?Q?Nu047gCRjdUryV1pC8RRxZa365mqkrOPa8hUve0dpB5qkxU2UU4wyYPqXacU?=
 =?us-ascii?Q?GzU+3OQW2gWaTQl2grrtlf1qCgBndlk1pYFLYZi5N2xaIsQfORQ9OCYdAgAo?=
 =?us-ascii?Q?PB7TsMMwYf9VqnuekTEzh6oua17BWA7NBh3B87UVndmPf9P9EjvDqljlvwAE?=
 =?us-ascii?Q?jypb0D9qyDVfaeivXlONZmIPYopuMBX6gwDutrxttx9FMdGAcwr+XO9z5rdc?=
 =?us-ascii?Q?tOPUJPDTbPmahAb1grieYWSlKJziZv8oytEfuETwHJbWOUlodJHRCZMlY3NH?=
 =?us-ascii?Q?chO70iOnme6xZwdjYHt4gwFJlhJCkIB2+yptGtKnK9o93LKUf69risCgcz7b?=
 =?us-ascii?Q?cwjLr7FqWCvDwlO+qW7KROR3xvUIzQlzlMvH1mxTKnrB40hAPEOn1kYoIPZq?=
 =?us-ascii?Q?Nbt/S52NYAX9JULLABSNZJJ79wBA+siOST81C+ebuDqqVB1dHnYyJPnUqrLx?=
 =?us-ascii?Q?4vngJ2Stg6K/3/fthSNit46hTCSgS3g3TMdNj8ziSM7C4VB6A49IKVoCi+si?=
 =?us-ascii?Q?2Kh5PepLbHImevBUXOHgfh+7u96xyt5RRI6Ezx6Kamop6pRTmyXiCkn5azrY?=
 =?us-ascii?Q?IEC4IfpgJtNE8MovNcSuDqnzNrd42C4PnZddlMtsRIcgq+RE6tppYGFWBKYE?=
 =?us-ascii?Q?QJl0fcLHqF72NBwbmoKMJHK9qQHk3ovkoNdq9u381CFVTAPlKFRni0CqCU/J?=
 =?us-ascii?Q?tPWJ2IuwA6K+H515rtJogFMRjtKapbnUEgX4J7DVM+5uZOJsIA6FJqmRdLm/?=
 =?us-ascii?Q?v7QC781AG9faNZI2A7jn5bnjGKyJsLtQG/C6cerTDbDqRoxNugr6qKv3QPkc?=
 =?us-ascii?Q?oG+GyeaWabumXpZhAOp3XWGdy+LYgHH65RmdsE26gZEg1kZcWRhSZb1osPP4?=
 =?us-ascii?Q?J1QTOjTknftv/VeYn4eZb0GSwgJJysfVGReJhIzlV2dgmVkDV/8rF3/+UgPU?=
 =?us-ascii?Q?KyYpQrHAlIGIIP7fnhUd0xuhAKyHPhOvr7CFX/+r69orJgWSFOg1lzfAJY8D?=
 =?us-ascii?Q?LL06sxQ1oxL5dS9jRsuMMNliIMWpDDCrtyYGOl08cdsQLKRNfmIbvCMUfM4r?=
 =?us-ascii?Q?jLN74XDeUtN3ttgmqTggySI0CSBrq2CU+qvbYwa1rLDh951/Um1nLSbLc1WA?=
 =?us-ascii?Q?sb0hkniQEGFTOpfld3nxsvjkpf+mHasPV9XuxqBkSyjX10Bzgn5tSA/Zlar4?=
 =?us-ascii?Q?QxEwxunzV4V93B474MjlBCpkauUm9iiH0GoOfdc0fgJOqEClNh4/NuGzkd0o?=
 =?us-ascii?Q?rKz/D+uvIQ06SLV9m+Rk38PlPIUQVIuVxf6RkQ0wogJUVPafQ5/qv04E/1BT?=
 =?us-ascii?Q?cnwvw8TfGQv8yVtwLZxYA5pTS5+ReIeq6J3l0Yd9t/wQYZTnWb8SX56LKsSC?=
 =?us-ascii?Q?NBgJxrsnZkmjRm1pIlP/jOhgIhwhr8G8urrD+j/l0yZpPHjPnzLRlVl3hzzU?=
 =?us-ascii?Q?xFpAN+dAnMOM1MdFej4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:08.3383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9794a4a-afc0-4974-9f53-08de2d0b28af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080

This function is meant to replace all instances of the following
patterns in CPU policies and boot_cpu_data:

  - x->x86_vendor == X86_VENDOR_FOO
  - x->x86_vendor != X86_VENDOR_FOO
  - x->x86_vendor & (X86_VENDOR_FOO | X86_VENDOR_BAR)

The secret sauce is that all branches inside the helper resolve at
compile time, so for the all-vendors-compiled-in case the function
resolves to equivalent code as that without the helper and you get
progressively more aggressive DCE as you disable vendors. The function
folds into a constant once you remove the fallback CPU vendor setting.

While at this, move an include out of place so they sort alphabetically.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/include/asm/cpuid.h | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index bf1c635cdd..a4280d1b0d 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -2,10 +2,12 @@
 #define __X86_CPUID_H__
 
 #include <asm/cpufeatureset.h>
+#include <asm/x86-vendors.h>
 
-#include <xen/types.h>
+#include <xen/compiler.h>
 #include <xen/kernel.h>
 #include <xen/percpu.h>
+#include <xen/types.h>
 
 #include <public/sysctl.h>
 
@@ -56,6 +58,51 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
      (IS_ENABLED(CONFIG_SHANGHAI) ? X86_VENDOR_SHANGHAI : 0) | \
      (IS_ENABLED(CONFIG_HYGON)    ? X86_VENDOR_HYGON    : 0))
 
+/*
+ * When compiling Xen for a single vendor with no fallback vendor there's no
+ * need no check the candidate. `vendor` is always a compile-time constant,
+ * which means this all can fold into a constant boolean.
+ *
+ * A runtime check at the time of CPUID probing guarantees we never run on
+ * wrong hardware and another check when loading CPU policies guarantees we
+ * never run policies for a vendor in another vendor's silicon.
+ *
+ * By the same token, the same folding can happen when no vendor is compiled
+ * in and the fallback path is present.
+ */
+static always_inline bool x86_vendor_is(uint8_t candidate, uint8_t vendor)
+{
+    uint8_t filtered_vendor = vendor & X86_ENABLED_VENDORS;
+
+    if ( vendor == X86_VENDOR_UNKNOWN )
+    {
+        if ( IS_ENABLED(CONFIG_UNKNOWN_CPU) )
+            /* no-vendor optimisation */
+            return X86_ENABLED_VENDORS ? vendor == candidate : true;
+
+        /* unknown-vendor-elimination optimisation */
+        return false;
+    }
+
+    /* single-vendor optimisation */
+    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU) &&
+         (ISOLATE_LSB(X86_ENABLED_VENDORS) == X86_ENABLED_VENDORS) )
+        return filtered_vendor == X86_ENABLED_VENDORS;
+
+    /* compiled-out-vendor-elimination optimisation */
+    if ( !filtered_vendor )
+        return false;
+
+    /*
+     * When checking against a single vendor, perform an equality check, as
+     * it yields (marginally) better codegen
+     */
+    if ( ISOLATE_LSB(filtered_vendor) == filtered_vendor )
+        return filtered_vendor == candidate ;
+
+    return filtered_vendor & candidate;
+}
+
 #endif /* !__X86_CPUID_H__ */
 
 /*
-- 
2.43.0


