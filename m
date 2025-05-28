Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EDAC659B
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999123.1379880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxy-00081M-Ew; Wed, 28 May 2025 09:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999123.1379880; Wed, 28 May 2025 09:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxy-0007y4-BV; Wed, 28 May 2025 09:20:54 +0000
Received: by outflank-mailman (input) for mailman id 999123;
 Wed, 28 May 2025 09:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCva-0000yL-BG
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2418::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0e8e1b0-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:18 +0200 (CEST)
Received: from SN7PR18CA0004.namprd18.prod.outlook.com (2603:10b6:806:f3::13)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 28 May 2025 09:18:15 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::51) by SN7PR18CA0004.outlook.office365.com
 (2603:10b6:806:f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 09:18:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:12 -0500
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
X-Inumbo-ID: b0e8e1b0-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykJq8yy1UHtKmFvNbnv1JBg7SzJTkhbzaYyWhQSedH/cKIpu/lZtiDEXblp/datB5q3DVT9DtkHKyXnzU+k1OKog5halHZJJuYhGE9s4u12cgFa2uieMcoKkrqANxF+Q/2/tS7v/PEcjVBLwDPzYKxZFe2lFQdBSRu5g46J9iHD4GIjoZZoGjJfn1shA5I0vxhyA6lhxd0FS7vewWg6NPEyUkmUXm7FjYwXs6L4FLQQ3ddnslCqnl2qvg6IgFuHInPRMnqzC/pRcjbjaWPt+aN8LTR5k6bw8e1i6DdilCxE2v9T7UShy9S+///VSq5DuwUV8r9ND5fjBEqk0Ty8wYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=yiqZytG1XXqN2UXcUX1UTuFgmaaaUmhy/NODRZ5D7U+WwzKgPWrolgXDSmPcdG6x17gjbfbifg3I/shucm+h5hFno7KUPe8VQvG1kOIGIz8JMgdzwYRfQEwmbSpk9ehavPN4Ushcm0UnLg011B4XaTdglIghp7berk+tELTINpyozuydNG+SE1z/hZmCtNhDL/+4YYvhPNb9fU8BUKvVfkt1TfNBOA4A/U2+BY1YyXlorRwUIeZj/6ENS2wpbqykxY41J3u6Gs41XSQrt0Rasjq7NHieBG0ia+6SZSLTJRuHP5uLnYTtxaLOBLUjszYoCPIxem6a9CD6xoaxjs5hjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WurO22YY37NaFn6R/aK5cXS4C2DatHBPKOP8khrxpEY=;
 b=v0GwN7HhBMpIFJ3g9/DBdKRaMeQBHyz7Ll9+iNJmX0YaCxKNMFKrLyWE/3ozjOIX/aPHTIkyaU2FLfZ0qDOLXEvr8ko1tYrzEiwQ0lInjEdY/bnIZyjX0gX9lUYwICCJgu08lEKdIdUzFymzwswVxOp7d8/IBQXFpo0DcAPAjac=
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
Subject: [PATCH v4 13/20] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Wed, 28 May 2025 17:17:01 +0800
Message-ID: <20250528091708.390767-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DS0PR12MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f79078-27e1-4d13-c6ee-08dd9dc893c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nIeEmvyZMha014u5xvbK/IZcBcV22JBIvxbVm9IhzUWs/3g1tbFXUIcjym12?=
 =?us-ascii?Q?7hn3eGa3PgR+OjwUpTcej4O/VoyOxaAhr8FMjqVn/jubNfa/T61jEzvYslz0?=
 =?us-ascii?Q?o8J/A/V2O84dRSvUyvQtaSSHDO0VAQtjilCx2CMaZ1rhbtyCeikw6JpIvaHb?=
 =?us-ascii?Q?5XdxTLH7+D4RGfmJmqj3apImkpfAAwaAFXrEH0JuvLkGRZe4H8q69+xtm/b5?=
 =?us-ascii?Q?351javU7Zcpm2EN4AT/ZO/XId04tmuE43M07eqMqd1aT8Co3/zxG/pNy8zuT?=
 =?us-ascii?Q?Q5BDyYLixn1WwFe6dm3P/I+3XJWPoi2qizZDmZhNfPDCfC2AElR0LgXfxxpi?=
 =?us-ascii?Q?NdQhv8eIBCt7ISGLVTPwe82mb7fuLeJXzKbcl6JJzqycorNTzCa9AwTcPVA/?=
 =?us-ascii?Q?OftEzA3OcbbwiOZoQP3Nkj4t06V1DpqTp7RjEhhSvMpPPPDT++XBf/Uu4f0k?=
 =?us-ascii?Q?E/x8QQyJBtg5axB5ZL5hu3N/rMhV07N44LgjZLkUoP/qevDlXTV0MKWV1mgn?=
 =?us-ascii?Q?zwa/HRPuziMBbuejeKe+zfiDKsLDoYOtqzwklKnjn3NowmuCibcReIXcer5l?=
 =?us-ascii?Q?4VWEHnHKLyYVDT8fRZQ2jDew3T2BafgMjZWQ/oxKSp+kqKksDONpyfyfOkpd?=
 =?us-ascii?Q?ySESZ1Py+aN/fAXNf0voJbKLLRKh1Npq4jwtuZnnO+eVrX6tT2/IxkR671p7?=
 =?us-ascii?Q?AHpODspuJtCGyZrqlZ17JtaRMX/hY4iuJaH0NTiov3bL82+u0xNWJFBau0sV?=
 =?us-ascii?Q?8P+7UiOc7msTI8mT8F3KTHjfhfe/G2vip7NdLuYoAayyG8/Zv2r3FdnFYyYn?=
 =?us-ascii?Q?o78uG5MotvNJo1oTuwDDLmykssbWgmYYIKuFMnGgL//tL0nC7I5q5lgHg4+w?=
 =?us-ascii?Q?z05oqfFYnqggjWwn5+HMnH0MUhuOU3jQFIZ4MQJIrMv2ZggA4K72xiWfQ56Y?=
 =?us-ascii?Q?YbSHBrtH01n1DVt5u9FEh083IM53F+2xVgt35L3jWFkrua4uvyOe2eXFI91t?=
 =?us-ascii?Q?SyIspVLY1Sas+YlamzOKvFbHvw8dk7BIjMKloQr57ZJABahmvg1KvXrm/sCA?=
 =?us-ascii?Q?7EIkBvl4fPcN7/7gvuM2lyhGg/zCcOBucyk0trvS26ZUxiaZaNLc4upUwoe8?=
 =?us-ascii?Q?YZzYnaWfCs8BZ8+g1ADATEwqj7+LYJ1HyfXGjzKiiQCx2+hZM0ao3Ny1eNy+?=
 =?us-ascii?Q?nTOWLxg6kxVRSx/bHMhCteC4+E2nHxWg5tX3gFHk51FOr7B26GRANCiVfnnb?=
 =?us-ascii?Q?7A2gAOBmJ1kBXvnlThcBDYAFo3RNQPlvdu0ePHagzZd0V3248m0//LrN3JO8?=
 =?us-ascii?Q?TlKzTXGWWHrGMMtRh3ouCoiTX9SZ0BsZ2MgxilXtIMFMTg6/6ZX0zknU/+W7?=
 =?us-ascii?Q?/ZBnzvK6h1qk63873Hv+CdRuMpkuxf1s5d8r6SIQC0l5pwhDA4ob95n+bfdv?=
 =?us-ascii?Q?7UN+oasN9Qwv2N1eN0/zgKs2/UUmO5BJHYhGqZ7FGAVgOY5VIJkFDbdG7gf4?=
 =?us-ascii?Q?s1a4VHKtApulPOohYwaKALDNJaIyLf9xk01O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:15.3798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f79078-27e1-4d13-c6ee-08dd9dc893c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485

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
index b204f22f50..dec4cb2ab1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1779,6 +1779,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1863,6 +1864,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
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


