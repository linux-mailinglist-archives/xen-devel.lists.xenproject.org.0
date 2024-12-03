Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15759E1583
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847293.1262417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-0008UG-CQ; Tue, 03 Dec 2024 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847293.1262417; Tue, 03 Dec 2024 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-0008Or-6D; Tue, 03 Dec 2024 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 847293;
 Tue, 03 Dec 2024 08:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO4l-0006fu-5h
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:16:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6c5211e-b14e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:16:05 +0100 (CET)
Received: from BY3PR10CA0024.namprd10.prod.outlook.com (2603:10b6:a03:255::29)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 08:16:00 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::13) by BY3PR10CA0024.outlook.office365.com
 (2603:10b6:a03:255::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:15:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Tue, 3 Dec 2024 08:15:59 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:13:05 -0600
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
X-Inumbo-ID: d6c5211e-b14e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD5I0XmGN/cozyynmRCQly4xwqQFuFWu40PVHdzdOuR3O55htGbVJkr+d1e+noOt4wdG08eKK2IEtb56pkE+U+f9kDOevxEBu3yLK4CFP404fnqDps/2dj0kEqmfHK532co+3+wFOt0iMxuu/Ak40dqh9HamT0Nd68f5Q2HKSlMPYUkeSgyRK6QJKvul4QHARJ4WewBsy/WTbTtzfLZa90POcqbU/dA9jy0K90e8zR08kJGvPgZ+sYw9hfYomcYG30UyHutR3c/p5ud4uAPNejIt02O93Z9ZWXV7DLgR+JqwJxWVXr0FamkKjyJVY9ySs1JWQd5f656Sd0VZbm6h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcv16TAN0uUZcF80nkgtKyHscsZfjQCW9TkOZr32cuk=;
 b=h5c1MQtaT0tNABSc3OsHz2IOLIrgrtA1s3LbPSiXNMqnsSLWAA5Wi5B/OQiVTwo1LHvwy6zMWZKUq1elrNB1rwPqY7caMvxUGtI//mmCAmNGhTB4H2a7GkSAMWPIwfFZ5p7qf+OtAQ0ztg4wt0mLPsHSnjOKTXES0C+3hrdSKNj2qfwHkKJHdlpdDBLL5iQpED1zULz6RhTDzjDmq3vtGhppCIORz6yI6qP0LBeRSRCquCzz9w9Tw9hah2bbH55RSuUhz+Hd6iHy/MUzYKmdhLdlMSlOfrdKwKbqfKVTfA/0CiNRpznZQXXtKkRyfQSBOaLA3v4D4Yq5V5H8ZOKsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcv16TAN0uUZcF80nkgtKyHscsZfjQCW9TkOZr32cuk=;
 b=el/Pa6wxBt4zegLUrB0zke9uJSmq0OASOxqvPxoTrh1EA3q6v2UmeUfL6PdHULL9MHauv0Q4EvYOkoQ+U5dMA00t2P5ErvSw9d/wJWPdCs04S36iuYg6KSFZflYdy1n9XBIOwlrscFbV9WtfLeBkXjEWcj80RL/gAUq4Wq0wSyM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 01/11] xen/x86: add CPPC feature flag for AMD processors
Date: Tue, 3 Dec 2024 16:11:01 +0800
Message-ID: <20241203081111.463400-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 55dd04e2-4651-402c-3915-08dd1372b810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IM43IzqbFs5eNIWXHAU+n3FB1dXYAoZeNBHvcPP7EB50l1O4FUJ84S64sTpP?=
 =?us-ascii?Q?jyedxh15OUPwyaFOFpku1MLkzrlcJeqBzGNUvyh0ii1k+0W0bV/JjXxlwR9o?=
 =?us-ascii?Q?GvUorKXNKOa53RlNaPk3Zjgcd/MK2bbr371fKbI7muLr/Gwi/rDQlzr2n0aU?=
 =?us-ascii?Q?wQlIPhyaozMCSGtNhKi2eWuoY3T60poy/uyMAWKq1t504aID+I3ztCyFfWke?=
 =?us-ascii?Q?APIc8wFv/ZJBvTz3zaFGAXAbcTpac6OU6M/EhARJwWsKLCF/RxAQBOX0VJ+c?=
 =?us-ascii?Q?wqVR71ceF9mzdeAjRJhxUPVR3xlAnNJ+mCMI+/qR4BspkXNdeUkhYcx120Uc?=
 =?us-ascii?Q?bvr2iWaj0pVFooe9w4jSdQeCa1dghbf1MzVJTFmCXbH2yhToFe1GAvwBOHjz?=
 =?us-ascii?Q?hnmyLMimHTaQkSp2e6NoVAcFIYMAWvalXu5E5y6rFc/DXT9eItMJcLlXmYSE?=
 =?us-ascii?Q?WKFSVCC9SOi8KEMuEM5lRlu3+ekuisU8ogkR9gsXaC9cmE4AKc8jw/QEMA+I?=
 =?us-ascii?Q?iWFbmWzF1N/fkNEW5hgTVQPNf8bv7YZWKYJXIA/+R3swTnkqSUxoivNadVyk?=
 =?us-ascii?Q?aG56O6HKTxG8FY8eUwqZk41K074QT2nacuUDeXg1suwqzZRFwK4bOgDSV0Yl?=
 =?us-ascii?Q?LTffLLDyLGDTHqyx0BDTlBVsDh/Q4EW5LSgPGrI/+13Cfk7DhaO0TpGeqMF8?=
 =?us-ascii?Q?hKavgJ4D23qIECLIIWl2D3hm+fkauFuhuokraGbKi9C68z4qHOwGceSGOH90?=
 =?us-ascii?Q?SIHLxfH/Dcd6gkXy0AfSpEEZHlJsIcau80niZf1MyUZcNFpcoRy3eekpz//4?=
 =?us-ascii?Q?7cOodGcSSIkujT+TqLOi+kSoq2Fppj78ftAF3+StlFZBA+vizhlu1ODY8o6a?=
 =?us-ascii?Q?Vik3weOiU/5a4wnfoiAZ6M4lnpIq26z22V9YSDxvONsTJYry9VEGGYVI/+95?=
 =?us-ascii?Q?ZhzWgkaD33LgVEqLs8z6VMw+zy68TUZ1SSYewz6tDjfrBZCptnXmg5P/936E?=
 =?us-ascii?Q?QwMgW+PrGWowWplBy0w/UBDC0EsSOenT/DWXcxtZ+8S6bO+ZmlclR2T1tOg8?=
 =?us-ascii?Q?PgT5Q+eyyqe1twFP059LI833CXORf0Owuzxk1wqrv9xai8v4hs+8aGVToHtU?=
 =?us-ascii?Q?+CQCNX3f+ZSNPIzQVnT1ChBvUA4YqyjrWEh3Mi21wrOpFylbLne0tsBSfhNG?=
 =?us-ascii?Q?Z+/YXASAk9Oze+1y8PwyyZJKNQzEkGULVoEgUmSgem9KeeqRjjEMWYV+eVRy?=
 =?us-ascii?Q?MmIviVelrVSqioVqYL/5J3l8t8gGTQNZtWDMl2SD4I52k5q55r5l7sgKMRUg?=
 =?us-ascii?Q?0T3Auq7IGqAZ5Xi0qEGsYgd0pl9hP+Rx/mL9TvOKV1KjTEsUYlEMeiKqBmET?=
 =?us-ascii?Q?uHvCFuWPtsG6ofmYmkwSeo5KfzuyS1/FxdDvBIUdRzzc4f90lFDoJnDl4ipP?=
 =?us-ascii?Q?jdIrFM2GgvF+sv4M3/IppKctVAju2+DY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:15:59.0186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dd04e2-4651-402c-3915-08dd1372b810
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

Add Collaborative Processor Performance Control feature flag for
AMD processors.

amd-pstate is the AMD CPU performance scaling driver that
introduces a new CPU frequency control mechanism on modern AMD
APU and CPU series.
There are two types of hardware implementations: "Full MSR Support"
and "Shared Memory Support".

Right now, xen will only implement "Full MSR Support", and this new
feature flag indicates whether processor has this feature or not.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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
index 8fa3fb711a..15f707639b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,6 +265,7 @@ XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
+XEN_CPUFEATURE(CPPC,          8*32+27) /*A  Collaborative Processor Performance Control */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(BTC_NO,        8*32+29) /*A  Hardware not vulnerable to Branch Type Confusion */
 XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
-- 
2.34.1


