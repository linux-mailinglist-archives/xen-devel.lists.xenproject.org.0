Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB3A2A33B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882554.1292661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKD-0000jE-5o; Thu, 06 Feb 2025 08:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882554.1292661; Thu, 06 Feb 2025 08:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKD-0000h1-2w; Thu, 06 Feb 2025 08:33:29 +0000
Received: by outflank-mailman (input) for mailman id 882554;
 Thu, 06 Feb 2025 08:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKB-0000gq-Lj
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:27 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2407::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07b5d558-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:24 +0100 (CET)
Received: from BN0PR04CA0136.namprd04.prod.outlook.com (2603:10b6:408:ed::21)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 08:33:21 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::3b) by BN0PR04CA0136.outlook.office365.com
 (2603:10b6:408:ed::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:18 -0600
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
X-Inumbo-ID: 07b5d558-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx/jreXkk7dC5sXQUM0Y2IYpzUOxOEWgWG6VXE0+32ltIRglNW7LhD2y07XLVG+CBqLC3Eba9ek5mvjQw4ftqKcA/PYksfPX/2g6nk61Nq6QT1DCgPjHp1p2HfNws7qoRlRB9uXtbqNPh5MY0yt/vBDnwFXEn6b7303bVGaohaz6+DdirfXSvSvlOp09kHumNrBk7WV28KxVIq08kuz84SeeZPvIftli6Fw+DZbVjPo9JxdUQCqR0skI2mN5rnCPhYhjNLHaQ0pnPb8n06bXFcpOEDOz5RsPzRLgzVwZ9bqJjw3TbXeF4BWzKTSrKTn/rp1PuQyYgoeF1EKin8C7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41y8sec6nqUyzgRa9rWZO3TQWkVErDGbU7dAJLNct/4=;
 b=wzn2mQw9VVzGe97WJuBI/EzoL1MjAsxePrBTkHpqvzA1sNUvL2gVUkQXnXf2+14VOltUMzwWwbK1J5YTi0OwcbMLEsTZuDZ7ZtQ0+7hgYaUwpRnydJcICJvSaPAUP0Z1pyeYa5WFUKooM2XTFJPdDclFu+bjNtutrUWG8LfY5gPKed5rWKSH/H8FtDG3dG6CVrkF6du0dyX9vvhGAvUY9oXXLg3jijIl4OlH9l8v1H0u2q5PpOE14xSUTIZiiSXxdNuUuWZ0HN8qOLBDgWmKsklyeqA3u5uegKxq6oFBw8VPIgzxCk3n75MHMbxSUkqoI9lUsykqYxl7z3ygEjIrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41y8sec6nqUyzgRa9rWZO3TQWkVErDGbU7dAJLNct/4=;
 b=p99r19jLxwJSiOKLCYplV8oKHElRDVJAXHmW/vxo5s1g1ZecBPECcbLZLTrOOQ9uRdiEcjIkrdz/DYug7WKzvlWMwoT7ApD6ECZ5A/R0cfh0o78LP24CJvhK8dBBKnpm7zH2L+kjFy+u1QuhOAL/3JkUCnBcuw15hmHFFNdBaN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 01/11] xen/x86: add CPPC feature flag for AMD processors
Date: Thu, 6 Feb 2025 16:32:45 +0800
Message-ID: <20250206083255.1296363-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0c470a-aec4-4232-fee4-08dd4688e9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BlUfm2mr0hKcldLYMJfbcH0qWBOVD+WHiBN7pK6V6gVqJ27+71ecsmLp6MDg?=
 =?us-ascii?Q?isKG9PJmZ5jtcfWjHlhRWadjXmHXhK5zrV3PTmW47je7aJf/75p9v/8kaHYm?=
 =?us-ascii?Q?rkx7M+2N+l7hn2bsGAk1mqT7Q2fzQOeJsKz/TNDYlDMEip7v9ydjSTC1H3kK?=
 =?us-ascii?Q?dQ9JBZgogeAYXqVZ/tx1tF4VFxd0mY+RXu+nCww05QxOUPSl90LVTjV/VJx2?=
 =?us-ascii?Q?pjNm6X5rESAnfq3bmSP9lEMoZDqjkgpQclVamzs1ujXLmHMHddefLg86cALp?=
 =?us-ascii?Q?VhWyZBcxGmGJPAto9gD6N6yx0ovUlL03ojc2Cv6HB2lRQ89cNbX9iCBEIwbU?=
 =?us-ascii?Q?1y/NoOFTFwku7GcmEaYPRUqylsG9NawapRF2Zn35wsr5Wy59R35yzly1mAZa?=
 =?us-ascii?Q?T5I2UdWRJ1KGAEqOHEZZys+owCDWiyZ8Mr6NSVgILl2KuGUBenWTADJW4Rfl?=
 =?us-ascii?Q?/RnQRH+kPj53+7pzUw6gKxVTnbZBTGaG8lWBvl0clzmgs+kmFHdruQutp6Eu?=
 =?us-ascii?Q?GYSfRL+42tRXu0AL0ROS+AROOiY/jyzaW/ZavQcGyO6GIIIK3ASJXjbozI96?=
 =?us-ascii?Q?56jRBOJRY77l2kw5jB97sM99ni44yMGN3vVpaKS5jOq6DT3XiqNz4DiCOv13?=
 =?us-ascii?Q?GxRE91M8bzrcfaIdGaMR3UyHvtFdXrCv+Q1ksjqneZWgnM1+omX5IsWi2qk+?=
 =?us-ascii?Q?iFOXgXNmkQiZVaP5MToC3o3fMpKybZRMyIjasQvyqELsrbBaILGrQDWkKqz7?=
 =?us-ascii?Q?2W5yZmoQcZWNHRr0kBMyGfAeA7NKdP7vJmXim2gzqhSntY/iGr+70lNtZzjN?=
 =?us-ascii?Q?NAnvTBZM9MzLiGSr0fiPd1RJd+89uziun471T6fctlC7443q7LmWGYh/5VF9?=
 =?us-ascii?Q?yZ6DCMsPUhA/eC4PY5hWxzvTiigGrdHN1Dffusqfm5y7nN6M/R8CxsA4n6Yc?=
 =?us-ascii?Q?RHZr6JQQOtIabLYmafPYet2xyYLhQqiI6U4lmTavt1eTOFf+2j1dV1tkWnTI?=
 =?us-ascii?Q?MJ54LbxMwu3jkujBQaIM61rwNKwj47G3/AajIh9dk7k/TRZ5kKZ+GeHzfWG9?=
 =?us-ascii?Q?jwZarwyFWCR//UDnD+QRn9MBl5lBACaPA3rOKiCKIGvLrsspm6996P1etgSH?=
 =?us-ascii?Q?G5PaRePWJbHVn7zhC9/6jg3PIOm7sndMHmo+XT+KTThZwwD9bD35VJ73tUZE?=
 =?us-ascii?Q?Ror2J5jEF5cFU/u4tCUF23Q7Ut17/VTAx5c/wKXViM39Ox+piLow2VHd9HmQ?=
 =?us-ascii?Q?0QP94DjCB0EkZvyKUsZwx8CBEv6FV1WXoM1NJFsLQRJ3R0q8kg9/p/r+rGzC?=
 =?us-ascii?Q?PGizFXY7k0q3S9K35yC8alNhxCTDYbmg9guAAnSE40MdamHmb3wWOo0m5vSc?=
 =?us-ascii?Q?Hm0C5T/w81inuaO4acf+f7skImI+LHDUakFl9bgHdBkwlw9qSnJ7akS/SSxI?=
 =?us-ascii?Q?kKoai/tJJKOpyQTzPTBy29/VQlTG0X253GZkGMUwLjJ7fa0xu5C9eKG+Fy+i?=
 =?us-ascii?Q?aC0o3XZDShWrgOg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:20.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0c470a-aec4-4232-fee4-08dd4688e9d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

Add Collaborative Processor Performance Control feature flag for
AMD processors.

amd-cppc is the AMD CPU performance scaling driver that
introduces a new CPU frequency control mechanism on modern AMD
APU and CPU series.
There are two types of hardware implementations: "Full MSR Support"
and "Shared Memory Support".

Right now, xen will only implement "Full MSR Support", and this new
feature flag indicates whether processor has this feature or not.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove A flag, as the feature is Xen-only
---
 xen/arch/x86/include/asm/cpufeature.h       | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 3a06b6f297..6935703e71 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -170,6 +170,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_amd_ssbd        boot_cpu_has(X86_FEATURE_AMD_SSBD)
 #define cpu_has_virt_ssbd       boot_cpu_has(X86_FEATURE_VIRT_SSBD)
 #define cpu_has_ssb_no          boot_cpu_has(X86_FEATURE_SSB_NO)
+#define cpu_has_cppc            boot_cpu_has(X86_FEATURE_CPPC)
 #define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 /* CPUID level 0x00000007:0.edx */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 16207e3817..cc6e984a88 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,6 +265,7 @@ XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
+XEN_CPUFEATURE(CPPC,          8*32+27) /*   Collaborative Processor Performance Control */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(BTC_NO,        8*32+29) /*A  Hardware not vulnerable to Branch Type Confusion */
 XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
-- 
2.34.1


