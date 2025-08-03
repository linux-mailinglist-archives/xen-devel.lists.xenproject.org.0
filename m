Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CEBB19357
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068431.1432531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMr-0006zy-H5; Sun, 03 Aug 2025 09:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068431.1432531; Sun, 03 Aug 2025 09:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMq-0006lb-Kf; Sun, 03 Aug 2025 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1068431;
 Sun, 03 Aug 2025 09:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVLD-0005hH-VK
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f058e51-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:17 +0200 (CEST)
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:49:12 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::92) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.9 via Frontend Transport; Sun, 3
 Aug 2025 09:49:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:49:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:49:04 -0500
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
X-Inumbo-ID: 1f058e51-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoVfVpmYEdtcTjw1bHdMTOf3qA2L2KSGpYERIh6A21xYgqlmz64SyzdsHSjtdOVVPBaBf/TtjjsUT31qHaOMFadaC9c+AISRdc8BeK0xNaT+LvNsvvxM8HhBSIJ+c6xmkgUPqlYxzkRdqeRa3aJYSXuIEpmQdTfa6w2xZh7hYkooJbpqwvvMU64v+/aH07GOW232GixXmZFP9LKG7OvDP0uu7ERQ2q8/LpU6bWTB/RMsx1UFqPjkIWra86iXApgiOeG0jRqTHr9E9+e1qJ4dsany+yRCG+iPYZwSZeND03GO86HOWIBuuGaCl/cvzpR0bkp81y81n03+DBLthmRD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkmjKkYefqtobgNH03iIRJVYC12nGUoQ3b5JMZ1dr/c=;
 b=CEihGbvrF/VWBu1z/B5TgC3Fdu5bMDBYPCwnEDzQZIBRjyhAKSk5YRDr9CmBlqL9TD1BoRA94hMYOudWGN/cE/1hKDm+9rSkIpnjg2ZhhvAD/bYIFD+ImaiSGLh1WMD7ImqzVdzf8zrDdHsFzhplnyJAoq6oAsPw0OnA/4aDh3FoioATWnFMN1jC6PH1A2ReuS3FbfWeflscQoQ7gEFo0mtmrYPF/w0aJZI7qE4J1tu8jYrxksk5RXMHj5tBDUEd5qTWykJIitNQTWZzgCIJOIKktdxvo5MhEH0FEq9QcQEXUVHRXjYcQUDeOpM+2UtBeTdyP6+eu6J95rtJOXxhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkmjKkYefqtobgNH03iIRJVYC12nGUoQ3b5JMZ1dr/c=;
 b=pafAS1V+EmRFAgoDSfvDoZ3SbHaBOJV8FGk/1J5e0tW9MgKvQl0nPX4fWbLjTZGUvGi6KCnOHVRvwD6fJCMDDFiVD63mTYCaVKgLRrJEek9KONrgcS6AfLBuIyUoQuAY8z0ccGsnXcbUTMLuvfC/YtPZZF8yF2X+0cTglpu0fxQ=
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
Subject: [PATCH v1 23/25] xen/x86: make CONFIG_X86_PSR depend on SYSCTL || DOMCTL
Date: Sun, 3 Aug 2025 17:47:36 +0800
Message-ID: <20250803094738.3625269-24-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e769449-15ed-4713-b2eb-08ddd2730044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VNBEZloTWHPaMddamAsaZ6dbCCUJAbwZmx234at7iBkWjw9bEvTpKHAqntj/?=
 =?us-ascii?Q?zi8mUyJbT7K42NQK2mPHvi4e05eWXrRkIWDWQp+8Mx9LRBYt3g2i/ZoXt3Oj?=
 =?us-ascii?Q?2NF/QV/dBlD05v44nYsHDgRVDzy4JAfuaAQZZI56zEM9jFeP9jK6NaddoxPw?=
 =?us-ascii?Q?n8Anc5m0tpMZBGJP49eMDowKl7iIzTPSCIBXqThzh/MXCof3OJRITW/sDADe?=
 =?us-ascii?Q?xxZupG6N2arFUmRAwGJz9UQSw8fHtyQDgvVO8SBREiDlv5QHYDTjYhXb0iO1?=
 =?us-ascii?Q?f1s0I/iOzH0Xa35sNeUk6ZJPU7QHbixpJcrKXh4ARuIHwQI4N6xS0/l5jJBb?=
 =?us-ascii?Q?mIXdHG+m40UeFDGGRBC7r6TEk/m8b6j+yamO2eTyhxAMw14C8jwaNeVLAGRt?=
 =?us-ascii?Q?HHdEG0TPWmLaDuT13D/1gMPSx9dOZFRueQih7AFonf8hpi61XuR/Om0nGim+?=
 =?us-ascii?Q?TErVTOyJ/bzjBtl0S2ZUmH/D6u4DexLL1pBNkjtEe4hMuyMUX+OLuZnpZdeH?=
 =?us-ascii?Q?XImULo4de5BAul345/w/m2bCiwB3/sFrzqYt33n9esX/BEp1Sty2mI4fRjoe?=
 =?us-ascii?Q?0n5R29mkIC7Ys/rR0VCg675tVS6cuC9kjfSglRR/Sgcb0LFLcCeZC3nl4+w5?=
 =?us-ascii?Q?PZPT0b2ZMisoYPCN0YKtWsWRnAJAA8s/eSfgFolNYx1PiBMlNibamwHBAagD?=
 =?us-ascii?Q?4DP2NTuScTAnut27hHRB4/+3pRCqJvcMMJwxAVHd2wzS9dhq2wxxWfmo7L1F?=
 =?us-ascii?Q?BCX1Lu7q7ESltQBOMxOjssGp51SP8lsYA9IJb5lF1KbqtIvUZZVmuKpR32GU?=
 =?us-ascii?Q?O32/6+Po30fTx620iREb0npk+Vwp6J27Sp2fquO/P5H4yOH/g4RnhYs5vkUA?=
 =?us-ascii?Q?53svRRaomZwDqe8tl6TTFfEjZ+hfx2386788ZhTrmmZ3ZnR8co2HP4fR3M1e?=
 =?us-ascii?Q?J0pI1e0HWDpQgfHrRwlVWGMepuUl4uB5pq1CwJTbad3JfCM1Co+2gNf8plOE?=
 =?us-ascii?Q?AJKYQTGWyKiqe1PMcozllnsa78XMWvBC9Vcl4o/4DkOcU2EYABdRrJmJcg3Q?=
 =?us-ascii?Q?+VAjhTBSoWlXeQXAeo4L8p/AeZs42L8w8s7BA7OPScEND4DwmjW/QaePx4aK?=
 =?us-ascii?Q?QrpE8OjwICv9PTyPeUf9svKDRZ+EJ6OcUDzGd2TEgjzYVUW0dpH6osmBWgZo?=
 =?us-ascii?Q?HtISAAPbCh1E3hMOnDGbvbNBQ8WnRPyKAdWUeMAy9mmDLM/ICfcnwKQIQ3ox?=
 =?us-ascii?Q?b6wVSe/AiIynvf1PQ7jJRdX67C3Jlc/wI5AKjNakcUry7/EKt0jgaflILaXb?=
 =?us-ascii?Q?fqLwS0u4K2RmJkDsS/7ylRDgH2qq7+jdadmDYlGzzxIXYP0xJ2ZO9PZ22rWw?=
 =?us-ascii?Q?B2QHyLQbTMyZtLQki1mHgIfu/dx3Ty/iotMEzJdmJzweBGu+JmbrSn+U22pl?=
 =?us-ascii?Q?+GywXgiju1Hwo7kKQONo1KkfWiRlMP9Go9V4PuNm+nquMDHVrerZRJDq0Tq6?=
 =?us-ascii?Q?tx9f9wvtmWzshzSPTrDRUIqtofWLNrFg47Ov?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:49:12.2707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e769449-15ed-4713-b2eb-08ddd2730044
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235

Users control/monitor Intel Platform Shared Resource (PSR) through
related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
SYSCTL or DOMCTL. with this change, we could remove SYSCTL-wrapping
in psr.c

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/Kconfig |  1 +
 xen/arch/x86/psr.c   | 18 ------------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a45ce106e2..691edf8926 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -187,6 +187,7 @@ config TBOOT
 config X86_PSR
 	bool "Platform Shared Resource support" if EXPERT
 	default INTEL
+	depends on SYSCTL || DOMCTL
 	help
 	  Support of Platform Shared Resource technology, which is basis for
 	  monitoring and control of resources like cache and memory bandwidth.
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 499d320e61..5815a35335 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -133,11 +133,9 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
-#ifdef CONFIG_SYSCTL
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
-#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -420,7 +418,6 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
-#ifdef CONFIG_SYSCTL
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -433,7 +430,6 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -446,14 +442,11 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_SYSCTL
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -465,7 +458,6 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -481,9 +473,7 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
-#ifdef CONFIG_SYSCTL
     .get_feat_info = l3_cdp_get_feat_info,
-#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -499,14 +489,11 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_SYSCTL
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -521,7 +508,6 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -559,9 +545,7 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
     .get_feat_info = mba_get_feat_info,
-#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -824,7 +808,6 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
-#ifdef CONFIG_SYSCTL
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -856,7 +839,6 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
-#endif /* CONFIG_SYSCTL */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
-- 
2.34.1


