Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13756B01239
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040357.1411819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R6-00047Q-52; Fri, 11 Jul 2025 04:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040357.1411819; Fri, 11 Jul 2025 04:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R6-00045D-1x; Fri, 11 Jul 2025 04:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1040357;
 Fri, 11 Jul 2025 04:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5R4-0003OR-JR
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2416::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f053cab-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:33 +0200 (CEST)
Received: from BN9PR03CA0926.namprd03.prod.outlook.com (2603:10b6:408:107::31)
 by SA5PPFA403A61D8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8da) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 11 Jul
 2025 04:32:28 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::46) by BN9PR03CA0926.outlook.office365.com
 (2603:10b6:408:107::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 04:32:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:25 -0500
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
X-Inumbo-ID: 0f053cab-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8rlI3oBziBbSZyElOi47xaXPwW6JnrIVZ0A3Ckjk2k5DhOqE7ikFbqII2+fx06szMG7oYzZuM+Kp3oRDJzKGn20BlLO7haC3b3aq5j/q73xoii/MN/eio8gaKPHv7mQKPEKNVrAJcGaCSZxMKeel1DzyW3C9hCNmrSbs710j0Xnr0n4169WRO2zHUJtZF4Zwvk9zw/b5LYXaaXpm0SafHewmrsxaj1NFe0SRZK4UEZEK8/HvUZytnacZbhtADbvy5UC4YQIymVBcm7+toGHyL5nPrfE+Vfwf9F/2OMNKCsNERMxuGvBXzQXXt9cIxVU4q1v3hutYtcyhRByePvp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyQBDL0uFgow+1a2Y3dSLlMZH4IZJahaUJN2J/+JEcc=;
 b=R412QSeBkTgi0mly+qO+Kji0VSpnMMRn1SgJ/D6DNqeaqFFtjtAswltF8P6EPH0GtRbk1vO7K0uA7Jq71n8KQaoSM6ZlJ4Py8q2QQRXbw/JZqXg8nDiRhyALbaf4DfhfF9od60NvC3eQv1DFIao6EsjPUBCyD3fQUNhEsiBq6QgYOOAAMr/94LV4GdDTkvx8/yOEGmksTnlNDng1FDR7k2t4AN5O0zCGSF4y14mV9/cmHUDidv5F2G6tF1p/l5PGwkarlm211Gh3vDewJlkjszImes4c+xlXZu67mRqD1ew+mBNBlzMEDIa/9gI9L4ROnha80dpHHuLtpjrXdIMEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyQBDL0uFgow+1a2Y3dSLlMZH4IZJahaUJN2J/+JEcc=;
 b=ztdk6/yohgfPKVHht7Guo9WdrJLVcKBFc0DQ/4j7m2szRennWH6Ru9BiSIiOtBC2Px/sWqV337KJLzdBU9PFRh/wSdzsMAY8opW/sGHY6j7p2vOYKq8mmEPeUTZUQy/9kZSRaw12EBYzMAExghx85/j5oudBmaBEAp55kfSNaI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v8 3/7] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Fri, 11 Jul 2025 12:31:54 +0800
Message-ID: <20250711043158.2566880-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 4604e2c4-87c1-44a8-29c3-08ddc033f170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+tvH7BT2RVAkgIo/Et6Gdvt89GEisJXtYL0mztBwDUedmW8ff0sWqLypozB?=
 =?us-ascii?Q?79TNI+LGNmIAazTmRZzmDwHtbwkZTuq3UIDsdJN+hOuSG5csQUdhd+quUfdV?=
 =?us-ascii?Q?bKITOMeR7VPuQvIPkb15aSpNB4nZfOmQy76C4HeOmEQfS0LO2EwYJBopRYZL?=
 =?us-ascii?Q?rGlPSfacLF5eD8+hkeBU4vSOwjsJjow7N5zm8nQtmeTV6hCq9kxQy/mZWkGN?=
 =?us-ascii?Q?Hrb2mCdChLdMXRbluhvKpQugGz2h6FX1FzjtGwJmuDBb0cDUs2jubbYUKCb7?=
 =?us-ascii?Q?wyE0hRf3krhQZGhstmB8hoD0NrZBlGKSaYwuLhclI1WzxvOMxIOPnuW4RlpM?=
 =?us-ascii?Q?rV11lQVzBlQKgO4ATjEMVG9ifRnAC5WyJ2Dj5GyHJaZPv1hlaE54MsRR+Jj7?=
 =?us-ascii?Q?R0B0WqXArGlLSOiFUL+Lq/CJpbYuvZw1xDfa988/uLdTCqBEPtHpz2gCOrSU?=
 =?us-ascii?Q?rCVJelnkWHjtQFaQsgvFE4aa4dWQjIL4wpnan4ilDy0YQeG4cFNEli52RE3A?=
 =?us-ascii?Q?HymXqz3HISbkpPHT8ew5dpjEauzeHVrdTwu4G3GzDvTyBQWjoIIMEODgz7bU?=
 =?us-ascii?Q?28JadDwihc0c08STnV8ejaqaJhXdY9Caa7GycaKDGe+SWbrizJ7QXDl3Q/xC?=
 =?us-ascii?Q?5JmRLqRQYA6xzaRJFiBOH7PpG9fLQ0otoTKNyhsnAnrjI6j6BxS9AR5i+5c/?=
 =?us-ascii?Q?zt6AyAmWCnoVEVtMTH/WPSH+gRijX8UkjP8zhzzrF1JRX8o0YFUgSrtQADGq?=
 =?us-ascii?Q?/D09eoTO2NwsNeCdYxMZIZUhkwY1Vg4IYvKQXyLQqv5T3ynrcWXIemzj0l0d?=
 =?us-ascii?Q?Q6k7SFlDqnJUq8YOvqrKcdNfugkPuYnrT7v1OMz24sKLIqwf2/cFBLrc/d/r?=
 =?us-ascii?Q?Neo/VL6bt9dSRUgPYJbGQ/AMB1ww2zcsBrhI72uBHi0Kh0sYeKbfLNpuo34k?=
 =?us-ascii?Q?ScyNgaQBerM09b3kh3ECW4Uvno0wMz3L4AA0QqaRRAsFJx5lxsU3tS6ClYln?=
 =?us-ascii?Q?7PXP84HMavevS/p4jKQRrncSGGzZ5qxI3DxeNLaZ0aHEXo26InLNfMtaDj3Y?=
 =?us-ascii?Q?pheNDpTdF6QRHpcHhjMiy+k+l57ZzcibCO2VZwwN1CgUJoaE0EXTxnw1q+3Q?=
 =?us-ascii?Q?DrrwPma3rM+Rc8GZUTPibvKUKpXRABA7gM+2BdaBDL7f4iaeHqHNX+pUpaVk?=
 =?us-ascii?Q?U74xab0RRf61S/eXRL3PWdm0D/SHVwieJtJZb989LzqPck/c1HmEWNKQcUO3?=
 =?us-ascii?Q?xa0l6FyjQQlzsHQu4YNS3zmOGxXjC7zNjLthaBvL2l5JKaQHxuA1ofAnqRgt?=
 =?us-ascii?Q?D45pAX7uXovxdnhUfw4nBIt2sISnCte6duo+Bbi46oKKD7vhWPbqjHomsZo7?=
 =?us-ascii?Q?QTApK+D1s5CaznhGKBT+/drhqwFYx7bC5AZeKasG7ShAcfNQoxPqquVae9ZA?=
 =?us-ascii?Q?r/AU61//FpjK4iWDkayFu4U7bLs1ExnprJwYqOcGe1Hnu+ppa1tgbO6dBKAY?=
 =?us-ascii?Q?eCfqpinYmbHoXVRjog6nXhQT8R8V78xLi2BH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:28.2573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4604e2c4-87c1-44a8-29c3-08ddc033f170
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8

The following functions are only to deal with XEN_SYSCTL_page_offline_op,
then shall be wrapped:
- xsm_page_offline()
- online_page()
- query_page_offline()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- add transient #ifdef in sysctl.c for correct compilation
- no need to wrap declarations
- place the #ifdef inside the function body to have less redundancy
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/page_alloc.c | 2 ++
 xen/include/xsm/xsm.h   | 6 ++++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 6 ++++++
 4 files changed, 16 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8f93a4c354..8177d12f50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1781,6 +1781,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1865,6 +1866,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 042a99449f..5ac99904c4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -138,7 +138,9 @@ struct xsm_ops {
     int (*resource_setup_gsi)(int gsi);
     int (*resource_setup_misc)(void);
 
+#ifdef CONFIG_SYSCTL
     int (*page_offline)(uint32_t cmd);
+#endif
     int (*hypfs_op)(void);
 
     long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
@@ -597,7 +599,11 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
 
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.page_offline, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_hypfs_op(xsm_default_t def)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index cd0e844fcf..d46413ad8c 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -96,7 +96,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .resource_setup_gsi            = xsm_resource_setup_gsi,
     .resource_setup_misc           = xsm_resource_setup_misc,
 
+#ifdef CONFIG_SYSCTL
     .page_offline                  = xsm_page_offline,
+#endif
     .hypfs_op                      = xsm_hypfs_op,
     .hvm_param                     = xsm_hvm_param,
     .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index df7e10775b..45c12aa662 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1206,10 +1206,12 @@ static int cf_check flask_resource_unplug_core(void)
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__UNPLUG, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 static int flask_resource_use_core(void)
 {
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__USE, NULL);
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
@@ -1274,6 +1276,7 @@ static int cf_check flask_resource_setup_misc(void)
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int cf_check flask_page_offline(uint32_t cmd)
 {
     switch ( cmd )
@@ -1288,6 +1291,7 @@ static inline int cf_check flask_page_offline(uint32_t cmd)
         return avc_unknown_permission("page_offline", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static inline int cf_check flask_hypfs_op(void)
 {
@@ -1948,7 +1952,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .resource_setup_gsi = flask_resource_setup_gsi,
     .resource_setup_misc = flask_resource_setup_misc,
 
+#ifdef CONFIG_SYSCTL
     .page_offline = flask_page_offline,
+#endif
     .hypfs_op = flask_hypfs_op,
     .hvm_param = flask_hvm_param,
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
-- 
2.34.1


