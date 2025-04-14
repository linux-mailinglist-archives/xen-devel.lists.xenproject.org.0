Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C07A8792D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949123.1345813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERw-000285-6X; Mon, 14 Apr 2025 07:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949123.1345813; Mon, 14 Apr 2025 07:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERw-00024o-1n; Mon, 14 Apr 2025 07:41:48 +0000
Received: by outflank-mailman (input) for mailman id 949123;
 Mon, 14 Apr 2025 07:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERu-0008Gw-1L
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:46 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2407::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84cf65c-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:43 +0200 (CEST)
Received: from CH2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:610:54::40)
 by PH7PR12MB9103.namprd12.prod.outlook.com (2603:10b6:510:2f5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 14 Apr
 2025 07:41:38 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::c8) by CH2PR11CA0030.outlook.office365.com
 (2603:10b6:610:54::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:35 -0500
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
X-Inumbo-ID: e84cf65c-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW9AjRrItGT5FF6J1DcMWYzZk3r9C6uQiNdCyNR/5z09GE7DdDV5psbtSLZnlOzvvnHTlrlZD4zR321mrmkPATVOuEB15Y6QZGKexKPszfQk8/wllWDVU1tQtFLvtVKgCDKm40JQrl7iMSFkK6Zm5cvuxHj9EgB8x3gp8SZBJk4gAwGGc/R2BiimoK6RV7rhCbv0S/zeAhAwiMdR7In2qbQ6gGmKWqrTUtP9I9+s7/vBwEw7WmfeCrK7G6KfVh7HDeqo7DQPB0gYcBPENngmh6c6M/dCn52PDzGTEcNTVb/u+0EyB1Rpo+MsJazszwJbPBgfhd08FRSVne4YfJkvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN4BZakspViyeH4n1uhsJy+yyhej3a/UQkx9Wrv7CvQ=;
 b=ukYbZ1T3lALT/40uC8K007T2+xL672EFip2K0wpPvwoO3bmgFcZjRfHvqks1QZWuPw2bUp/UOwuoT+swUGXHqFQzr940ieyKz+zyBkkUdlnixd0VTHWJ6fvG4YzIrko8aORX7tnOwW4n2oGp+hKbrxx216umBcMq2qSrjOkXYHOjZCovKFKDJjQX3QBJ+M3e2gGLXxVdxCPmTQJ6EwnMjSx+1DZabnBKXLFzPUV9vbQE4VdUq3SzAdVDctolhpd/Vag/Nz4bqttyGzyzGh6TinEFjOS1MMZVYWkY+HQbGSSwQGfaYsCzdaJswOFyF5JDqOG/0AiFt2uV4DI6iy0KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN4BZakspViyeH4n1uhsJy+yyhej3a/UQkx9Wrv7CvQ=;
 b=Xvy9+YwYIELvYBBAQUsQokOf8w61mhYnOyzLg6quq/zbHwgcf6Knd8bSb7lnHkVgQRTVVo6gDZPn/nkFHHQwdQeF46jxMt5DHv7rJxPSwCixZyKyjQTfOmPfZEGb2Q/CodPLgiOccF1azryvHeY3HFu980EbIZ2HpdrabnyZZ4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 08/15] xen/amd: introduce amd_process_freq() to get processor frequency
Date: Mon, 14 Apr 2025 15:40:49 +0800
Message-ID: <20250414074056.3696888-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af51a41-e409-4f17-086e-08dd7b27c9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6BxdMoXfkSHeGA0zKqfBAmidHXyDT9r/fUjgi+b6Y6gipHue080vMbaAYWED?=
 =?us-ascii?Q?IX2QRyexhRsxtQqLRUkwF8x8OPsAXgMTtRq8QfA6Y9WFX3fPXcDzV70IuTys?=
 =?us-ascii?Q?7Y9YhTN4fbEBcMhp47xgqr+sd2cRvn8z/Sp4OogETOLwEN6EIFGUHqRfsHDY?=
 =?us-ascii?Q?+IWEQLZyB/lga31sI5YZAL0GWkG1k8ZpQFxzgFa8xqRnxEScJ6JeVZI6BsL4?=
 =?us-ascii?Q?jnIVOGZIzxIK+nXtVm3sq12yUZlBD70rs81K7AL1Fy4y0LqS5fGfnUc9tkN/?=
 =?us-ascii?Q?jfR2rHlQwpnzWpXSIwvB72hct0bd2FmZ7tBDbq4JDjqSlihfTFNFsMBro446?=
 =?us-ascii?Q?PJ+cc9qJjPKAU/SxsMqycpbPeUYe94/CiLv3U5mFSL/+EbvBKdb0YaV0Hbcx?=
 =?us-ascii?Q?1NA9QRK6M7umU7WRbgWVRxheDvX3sye3R2D875O0xx25vukt3aJoaVhlDIE4?=
 =?us-ascii?Q?RuXgh76/xCL9U2gUqZKYMEP3nL7f9u9g1cbovf8rLmfXRgTghcpvyGbLeEKd?=
 =?us-ascii?Q?zUipBEYfRLtmOiDmWOvLgwlUBKQs2HNNKKoeL0SXOdC/sBVx/NdERPPeuN+A?=
 =?us-ascii?Q?crexY2Ws7SEYAJDBIoA9Gkgp3XwHrMY+gEH1zt0GrO9V13lIrnfG8TFx194k?=
 =?us-ascii?Q?8MbU0H6Pzf7pSU5nDLv/8yu3DMrkbGKk47au+yJTX9UD+QDpN7SGYP7I0UP6?=
 =?us-ascii?Q?JTX0BpuFPLTkGdER1O/uePWkDt76yAZd2irmLrq3OYm34c9MqDJC68m+I2CJ?=
 =?us-ascii?Q?KeamquFmcdb1PUuA2Sdjuh+QGR/vyzxbp2xXZn6h2LiaBnCT9yxUAER91gwQ?=
 =?us-ascii?Q?fFc8ynY1AnZB9ItHHQFwiAInpIQ+ASMLXMXNs13bdC4a6rEC0CwtJo+76n+5?=
 =?us-ascii?Q?2JazfZHTvzyVUkoganIqiZFYsVUiReWET+mcUtp6J0Mvr9SwXIwUEj26VW+u?=
 =?us-ascii?Q?i9ZvXs9awzA7mHDtBAq9FLPKR/alGcm0e5ZSJlHA1vw9yu65QeOSzb+wwLte?=
 =?us-ascii?Q?fJlCtu7VI+xVuQBjrj/gzT6r3sNQ3BGSetS4tiodGEfYJ33wwCY3nSvtVX2u?=
 =?us-ascii?Q?UcdsWzqjhWcQ2GEcYgRT7fRFFu6vX9hJF2ydZVhz+Ko1YkPhrGx+6Lwiz1Z6?=
 =?us-ascii?Q?pVnP9CrQTYx5okmm59SExokxGDRKhWu5D7PW21/0YormQPSoCNDJrOAS9NZQ?=
 =?us-ascii?Q?qRnDdVP/pZ3V6neudrcVstSA+9N9i0JJNqnZT1NuRZbjyQAAmWU2MsTDhKam?=
 =?us-ascii?Q?G3uS3DLnFXUmnJ/r/BY0pRBEl8JeC3dp/7va0dEWs3dnlUVJ434IPK4XIi7X?=
 =?us-ascii?Q?70koC2dKD3ksMvBh6D1zn/2D1f25wHSU9fTlPLlSHGxekDV7+59DnvTJXniU?=
 =?us-ascii?Q?DxXlMacna7Wo7fR8efKK9UQEeIVkIuzjZ/7/HNQepRlmebLwrTopUFbq+VYY?=
 =?us-ascii?Q?n7ArsGRA8LFjENCYyEeF6gvD0PaR8znwboiu7ARaKnukKEQduTcNlAxjfmcS?=
 =?us-ascii?Q?/GsnOF7Lz/GHfqWiqiB/5IopBwYm+3dszf8l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:37.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af51a41-e409-4f17-086e-08dd7b27c9fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103

When _CPC table could not provide processor frequency range
values for Xen governor, we need to read processor max frequency
as anchor point.
So we extract amd cpu core frequency calculation logic from amd_log_freq(),
and wrap it as a new helper amd_process_freq().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
v3 -> v4
- introduce amd_process_freq()
---
 xen/arch/x86/cpu/amd.c         | 60 +++++++++++++++++++++++-----------
 xen/arch/x86/include/asm/amd.h |  4 +++
 2 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index f93dda927e..e875014de9 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -57,7 +57,6 @@ bool __initdata amd_virt_spec_ctrl;
 static bool __read_mostly fam17_c6_disabled;
 
 static uint64_t attr_const amd_parse_freq(unsigned char c, uint64_t value);
-#define INVAL_FREQ_MHZ  ~(uint64_t)0
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -596,14 +595,13 @@ static uint64_t amd_parse_freq(unsigned char c, uint64_t value)
 	return freq;
 }
 
-void amd_log_freq(const struct cpuinfo_x86 *c)
+void amd_process_freq(const struct cpuinfo_x86 *c,
+		      uint64_t *low_mhz, uint64_t *nom_mhz, uint64_t *hi_mhz)
 {
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
 
-	if (c->x86 < 0x10 || c->x86 > 0x1A ||
-	    (c != &boot_cpu_data &&
-	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
+	if (c->x86 < 0x10 || c->x86 > 0x1A)
 		return;
 
 	if (c->x86 < 0x17) {
@@ -684,20 +682,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
-	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
-		       smp_processor_id(),
-		       amd_parse_freq(c->x86, val),
-		       amd_parse_freq(c->x86, lo),
-		       amd_parse_freq(c->x86, hi));
-	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
-		printk("CPU%u: %lu ... %lu MHz\n",
-		       smp_processor_id(),
-		       amd_parse_freq(c->x86, lo),
-		       amd_parse_freq(c->x86, hi));
-	else
-		printk("CPU%u: %lu MHz\n", smp_processor_id(),
-		       amd_parse_freq(c->x86, lo));
+	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (nom_mhz)
+			*nom_mhz = amd_parse_freq(c->x86, val);
+		if (low_mhz)
+			*low_mhz = amd_parse_freq(c->x86, lo);
+		if (hi_mhz)
+			*hi_mhz = amd_parse_freq(c->x86, hi);
+	} else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (low_mhz)
+			*low_mhz = amd_parse_freq(c->x86, lo);
+		if (hi_mhz)
+			*hi_mhz = amd_parse_freq(c->x86, hi);
+	} else
+		if (low_mhz)
+			*low_mhz = amd_parse_freq(c->x86, lo);
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
@@ -708,6 +707,29 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
 	ctxt_switch_levelling(NULL);
 }
 
+void amd_log_freq(const struct cpuinfo_x86 *c)
+{
+	uint64_t low_mhz, nom_mhz, hi_mhz;
+
+	if (c != &boot_cpu_data &&
+	    (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1))))
+		return;
+
+	low_mhz = nom_mhz = hi_mhz = INVAL_FREQ_MHZ;
+	amd_process_freq(c, &low_mhz, &nom_mhz, &hi_mhz);
+
+	if (low_mhz != INVAL_FREQ_MHZ && nom_mhz != INVAL_FREQ_MHZ &&
+	    hi_mhz != INVAL_FREQ_MHZ)
+		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
+		       smp_processor_id(),
+		       low_mhz, nom_mhz, hi_mhz);
+	else if (low_mhz != INVAL_FREQ_MHZ && hi_mhz != INVAL_FREQ_MHZ)
+		printk("CPU%u: %lu ... %lu MHz\n",
+		       smp_processor_id(), low_mhz, hi_mhz);
+	else if (low_mhz != INVAL_FREQ_MHZ)
+		printk("CPU%u: %lu MHz\n", smp_processor_id(), low_mhz);
+}
+
 void amd_init_lfence(struct cpuinfo_x86 *c)
 {
 	uint64_t value;
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..9dd3592bbb 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -174,4 +174,8 @@ bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
 
+#define INVAL_FREQ_MHZ  ~(uint64_t)0
+void amd_process_freq(const struct cpuinfo_x86 *c, uint64_t *low_mhz,
+		      uint64_t *nom_mhz, uint64_t *hi_mhz);
+
 #endif /* __AMD_H__ */
-- 
2.34.1


