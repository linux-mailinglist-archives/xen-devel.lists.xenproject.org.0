Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026FCB7D98
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185098.1507384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTueE-0004vI-Cv; Fri, 12 Dec 2025 04:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185098.1507384; Fri, 12 Dec 2025 04:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTueE-0004sg-AD; Fri, 12 Dec 2025 04:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1185098;
 Fri, 12 Dec 2025 04:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuR9-0007SS-W3
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:23 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dc838d4-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:20 +0100 (CET)
Received: from BL6PEPF00013DF6.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:a) by SN7PR12MB7024.namprd12.prod.outlook.com
 (2603:10b6:806:26e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:07:15 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2a01:111:f403:f901::7) by BL6PEPF00013DF6.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 04:07:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:13 -0600
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
X-Inumbo-ID: 0dc838d4-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3ciX5dAa8hy/uKpXcvJ9R7gitR7SbT1ON+BeJlOBWYYeuLgurJqTE3JedvjNr3zabJNr9vggqLLysGqYBIWh8e/7yh5Huho69Zzhr61sp+NgHnZnAqCgD+8OCcLM+f5tenyFhHkmdPaRDU5oRS2nNKu0lwq+q5N5ufJ3OcGkoofS8zm4zypbZUDZScMWSHRf+vEdilzSfe+Aj0d7WXyBGyRN8sCdV7iODyuW+Ltr5ceVUTNFWc8ob6IhxTbC3lUKIK6l4MJ+F5x8+Q/CKJOkPduVaj5+QFCFV8+ezfOHFofxODkUHHLH7c1UofaERvo5fEF4C2TVk++D7bs4and/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bok7u4Xk+jAmguRQIjJccc8H+q65eQAsNIZzfh2MqlE=;
 b=cCFp8sjOt1LCv7XzUtvVrpVfJN94VB/njYCzbUODW63OdI4myJSVFo5z9OQj2OWCNDRKQ+QiEWiep1i7sp7ZKwzQmSAGrdeMHFLcg5c+1cMuEP2giR8RkdXblMqzeE+hLTcwX6XgnX9oCoowel6cJjxY9aqQ/CBKDVcTLkrsujC2jeWW3iNA5x7ui9QVR9qVWMNxN78uLXYGJIc2/h6+F9EtVPW2YwJdy1zD9/woypQ4sTQOxbxjOStfSMy8QTHSLroOz97rV9qFLhEMZUJ2RSAxI8bAoBkh3bzG+MAMVQK9eoFz79UwmTLtVZwjeMoAq6A0Y8diMqOiNhaY5C3yzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bok7u4Xk+jAmguRQIjJccc8H+q65eQAsNIZzfh2MqlE=;
 b=GLBqMJsqin5zj2KHy7h1FlcaXLqQE0DotDng18986AtjJpKeBJGQDvxVUp7bAjPoFTnhKoU9bsH+V/p0RMAaun/O8jWJ/EJ8WiwT2JJnOzdxg2tt8BgcPQDq2RE/O5/TccIh5bLiH9Dwtif13Ff/Krb2bzyz153p5F8vePPiF0c=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 19/24] xen/domctl: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:04 +0800
Message-ID: <20251212040209.1970553-20-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SN7PR12MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7476f342-3dce-4a7c-3216-08de3933ef4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Isybgq6zQ/gc6+xvCSAVR4BfFBhR+gMUr6fU3zXpogbveAe8Zl4/juwFpU/y?=
 =?us-ascii?Q?dIagsKBq/LDXKdIQdbnIOjScmMsIccQ+rhPsPhtQIsltNww9tj/aq9EN/dzI?=
 =?us-ascii?Q?8dFelrXLhcYT4xclmsH4jlTNVyfRnbsf08s+v1pvclZV6SNnuv9nMwazQDZj?=
 =?us-ascii?Q?phtngG9sCoSCu6wKFkR1utbPwXTm4dE7WRWIIyTHw4D00htKWzmGIHlvCASF?=
 =?us-ascii?Q?4dbUT37/IudSKQFawWZNYo4lxxuQYaI6SVu+e0Xdj3hYHLLx4TTiKd2mLh5W?=
 =?us-ascii?Q?pkvc0pKS+tJAE8jHxWyr6J1pHGXIKm9kDGvInqK0SeADwk6J670NS4CO2Uc/?=
 =?us-ascii?Q?P1mmrSaFgxT0+02yZaG5Tlj0XwcM17TJnqwHPELbrFU9anomG9n36O7ifRey?=
 =?us-ascii?Q?4UcaRI0o+3GBEpu/VDgVPt0mlJLkfLQDnnlTtrTZAQCdsNDsQzkQXwVGdYos?=
 =?us-ascii?Q?WRcw/Voaa4pzbVlYOph4MhEPzt8hKMriPRXQtgMKrRJwoJPh+GCo5lr8yTd/?=
 =?us-ascii?Q?JSHhsgYdAQud9dtgHkMy2LAo+GccY17Luk4dAer7MuKk6LfZaYEOAr8uvg6k?=
 =?us-ascii?Q?8ubvy3IQm/U8EueUXYDvjuvsbCuIDGQEBnSlSCc3gq4WWDRX+5w0yeUpEGxN?=
 =?us-ascii?Q?N2Dk1cFcKMkUZk4sCsH/Iqmkbikp/7W0V8li1DSJArHTMLYJ2wX7rZHf515d?=
 =?us-ascii?Q?BVSJprigu5wmfnXUr94l+W4OX80s9gMOpvAJpfYfczS1B7AxUZkvvF5HZ+s9?=
 =?us-ascii?Q?KIcRBKwtQJS6zIeKYSGdAWrGM/9fFo2uNuRLTWWYAqrWirjSHpVy7mI6e4eK?=
 =?us-ascii?Q?PuaVU2dXalXkGoBSkOmjy7H8B0sTP8WBK//8GLgSpVAGyKR7Hi9LeONzSFKk?=
 =?us-ascii?Q?FKUm/4F/x/+eSHcFgyGAkX14Edd3wfAqG5bXXKQnFg7r1ALy/C2vrNMOHYg1?=
 =?us-ascii?Q?QY4pHPEtYd2iKwxMRu7lFmn0M7IQTy01H3D79o3Km0lY7ihTOYwdQXY3xa2i?=
 =?us-ascii?Q?q58vmwE9D2EVxJWfetwMeQrKav2s7WHuNiG2r0si1Saypkjg491HFi0zY+BK?=
 =?us-ascii?Q?Qy0aOmppn9Z1j+Sjnm5pNcoqswyjptFp+a/QtwCisGTJHOBj8TWQOeP+lunK?=
 =?us-ascii?Q?bQWPBEsR0eJRpBIMLsZybOq1WLOr1nPMpFTRKN3tRQY/Y9C2tIKKnKVyuh7p?=
 =?us-ascii?Q?oILDwSMDtSZ60vBb2A2/HyWn1ehF2xEv7xQoyYmBz7hgr1/K/kri8tdPUSMI?=
 =?us-ascii?Q?K5G6s45GrKBMcEdrAXeyFIKTsGdpUFJdZpDT7qJDzQ1A0VvDWWVmZac/Mxm/?=
 =?us-ascii?Q?xmCDF+cRCiDKlZLhQNBZTotulJXjEOulBzVifl7BHbPjhdNbyNc9KNCYhW3Y?=
 =?us-ascii?Q?/B3mLG6e94oAgX+/KiimXksqVntp/gwqcuG/FkNhYRqzHodWxnYbLZL492e9?=
 =?us-ascii?Q?iSWWSRaeZAyiEdZfNJQva8OOZCezCGlkUKaQcmz/QWDwJIzz9MyF7oXOS+6e?=
 =?us-ascii?Q?Ek/R6wSA20jy2OUGpTreomS7UpAKBGKo/xutf/XbIKDiAQGh3f8LMuWPwGma?=
 =?us-ascii?Q?ozaKIG1Pzr2DGNhmZKo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:15.3519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7476f342-3dce-4a7c-3216-08de3933ef4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024

Users control/monitor Intel Platform Shared Resource (PSR) through
related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
MGMT_HYPERCALLS. With this change, we could remove MGMT_HYPERCALLS-wrapping
in psr.c.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/arch/x86/Kconfig |  1 +
 xen/arch/x86/psr.c   | 18 ------------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index c808c989fc..8368c6ecf0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -191,6 +191,7 @@ config TBOOT
 config X86_PSR
 	bool "Platform Shared Resource support" if EXPERT
 	default INTEL
+	depends on MGMT_HYPERCALLS
 	help
 	  Support of Platform Shared Resource technology, which is basis for
 	  monitoring and control of resources like cache and memory bandwidth.
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 80ce5804b4..4f2c2d0042 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -135,11 +135,9 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
-#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -422,7 +420,6 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -435,7 +432,6 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -448,14 +444,11 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -467,7 +460,6 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -483,9 +475,7 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = l3_cdp_get_feat_info,
-#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -501,14 +491,11 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -523,7 +510,6 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -561,9 +547,7 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = mba_get_feat_info,
-#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -826,7 +810,6 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -858,7 +841,6 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
-- 
2.34.1


