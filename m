Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDBA5D4FC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909728.1316642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQP-0003qR-Bt; Wed, 12 Mar 2025 04:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909728.1316642; Wed, 12 Mar 2025 04:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQP-0003nI-8u; Wed, 12 Mar 2025 04:10:33 +0000
Received: by outflank-mailman (input) for mailman id 909728;
 Wed, 12 Mar 2025 04:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNW-0006o2-Ht
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2416::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85b290a9-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:32 +0100 (CET)
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:26 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::49) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:22 -0500
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
X-Inumbo-ID: 85b290a9-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRZG8EJS2LJE1VEiiC1/2R7hoIEDm3S7xm+10f8hT6mOoOhi1fdkHqTzXRxOBCDDQHw1ABjeJ7ZC3t4baiquUJGtAAyfUW7HKzGXEBtQsxIEvrvnSJsaR0jbJOj0+ucyDIjTYlLslo3NC4JjgkHDnhngF6hyw+WayvxVRqQdeyc8Hl4l+CKQoNoDRMyBxzul/ELW+vFbS3hm+Ju2M/0JlwLFcQW13RGLSOtBnGGjw5jMNszlO6TuvXy9FxOK8n4mk95cltgFo5jV7CgH9v4HdicaWqkt40b8Tq6+1J5eI7ERKpiMBkMpE/aRdITICgU6GsZ+VMUi0cKTh3L6wDkJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR3SsepG3t9YxiFUsfOzjKUwTZ03/Ksnj1S8vSaXtPI=;
 b=UVm5xzUJvvnHH/Q1K0GsTRxCvIcG309ZI8hKhOUddv5Q7EEngU5EOQImmdqTK24jOfcUtT5Tip3sTHmz8y1cEFcR3siV/ltyityHyymiafCL5Mxn83ihRxKw+S8Izdy4svZMxXPn0AVwfs6JTUgHCh8NxutlHhViBWqfGHoRys1aOvL1qaoAquyiRp8RYKe3EFTrDR+hPwvJ8tegNHlFFWUFTA33s/LzjEV+vYlJ/bxIURbDlHbJsKPmG83t6Vpj7wF0zerXZNvpRNMgIlaEa0f/fydVadNYJdCaKSDmoozo8QryduIijDPxp2fCqTR89HBhqjXZlnz3bRCcREl3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR3SsepG3t9YxiFUsfOzjKUwTZ03/Ksnj1S8vSaXtPI=;
 b=1WqiYDPz3pj1VLbvK+eaVvrS9vRUBw0mg+6FAh60JcGnA1wffXjAdFYPnO4r+rwax8TVnhSTfUdT0JDiE3A+Rl1miFJ5gyctTVxmXc60SYuWPNdRlLNhzeElinfRJfQUJfC1qkgBlUgQ8fHRgqd2DTFQLPD7ziM0AJVi+fPuP0A=
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
Subject: [PATCH v1 11/19] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Wed, 12 Mar 2025 12:06:24 +0800
Message-ID: <20250312040632.2853485-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 73af178c-db9a-44d1-eb12-08dd611b663f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPC6YSRSvXMA43gpXw78z8cFml7gzXxNu9BQg2tWpt1VMyLMkmjc328nKHRw?=
 =?us-ascii?Q?dQK0NRcVW59yYJ2cFFdxSxWcb5FmRZqXhHeph3Nx3xVeNzpHWfEqJwFAM1YC?=
 =?us-ascii?Q?teYD8HIr1pEEhnEgHpXPfHT5nAXw9Z8SGxISD9eQMkkM3Q6T9hKYuqQ32jCV?=
 =?us-ascii?Q?dG0EDvpwPSL94GA+k1AFXjpdTF4NM+2REj0GCp92+EFuFnSmOX1cbOygPqPk?=
 =?us-ascii?Q?RlHD/HKpZDTotUdcIlqxobCNusqweJUvyh8FEYZ+U4sJLqD5B4CaFLqFBUfb?=
 =?us-ascii?Q?HeoYNCKawxq6yTYS4QUW62JCTT0gclhhLAgwWeofU8syA5FbUVFUXG896Cm2?=
 =?us-ascii?Q?cVXk8LUZAsGKcVMkooXJisv8AVMVYlxFF4Q4BNt4SE3XKru/4CMkppXWPmbV?=
 =?us-ascii?Q?LElIWZ9T8v1O3zW64Za2JDlBIuCRpITMnwi+LDGH9wWd6eJa6xKjr3EtKzbE?=
 =?us-ascii?Q?IeV3+ufSrnL4NO08Vr0c/CZGp/r5edA8kuQSOSsT1Qa0pBOx8H7gWDYvoObn?=
 =?us-ascii?Q?fyORE2RKRqzKJc30ZQiIEKEDoQ/23tG4AD0BwLsIGWwZGQSucJ9rz4xDZony?=
 =?us-ascii?Q?9PmESqqfGLwDVSdrwAma9UkWmCe92hi3YdJbr5tqECEWXszIVykay/Tuy6bL?=
 =?us-ascii?Q?O2tv0PVth1+V9dfXGEP7X1sGB6ABJA0a7uPsFh2TW9K8o0n0Qo7Wyh7lB/is?=
 =?us-ascii?Q?n8/I6zdgfSxvzcGQniuntosF5yqQnQK6zgtyHHtDGxO+TXPbTWx78w83b1T6?=
 =?us-ascii?Q?M785i2t6OgYf+vg/l85YDCne/CDVqyuoCxcWyqVA3O5aVA54AZjs6KVgJsjz?=
 =?us-ascii?Q?8zI8wAd+k30hJalo79Jm1Bg20vECYAPSB8WqySwQz9y20/xI3n7Byx39Rzhd?=
 =?us-ascii?Q?r1vZ/JulTK5QtUN5u/SRCyIIrOGEHzs7nfNQ8u4+SEsTAQbKnwvsZu0iD348?=
 =?us-ascii?Q?XnEaTmYyxMK4WzgkN7JeNIpht8Kg8faa4RVe82YdhKzIzeJTZMfTtK35o0ya?=
 =?us-ascii?Q?YSDJ4YGjhNVNdj8gxv73tUoD6Bd8AYi+CAvfRGjNsVX2BLPSX4Wcb+uhoME0?=
 =?us-ascii?Q?9uz9u7DR2mVf8C3PppVqvMhulqX+p8tLn64ZSOlsSlFS8V6RaHeL6c9vWfBy?=
 =?us-ascii?Q?hlPSQGubSXrnEmF6NlxsENROwaAAChKVmIzEvZ+Yx+EiRE7n8d8awDCFTx6z?=
 =?us-ascii?Q?njSiXNvguCY1LAH+XyCpZNoimBHPtwfX5xE5ZfRwycPYhXOA0B9vGbLgZNoY?=
 =?us-ascii?Q?2B3o9hdfIlKPjbweyVpMsZ+WSMeq38IBi0qmUfSjDEZbBjJVx/2yHirVStBl?=
 =?us-ascii?Q?NGT/W70nDWzpB4cz6YE26uABc0141uepG3MS0kBesR+MB4UI4jwUHJAvJLOh?=
 =?us-ascii?Q?fq80WF3WdfYyXm//wHBpzwsV4VdMEqVuc5qOhTHRi3icyZXQo+eOhwF3Rh5x?=
 =?us-ascii?Q?G4mY2ukNs3vtSlHFkodQ3hOICCmmqiXSDyDH0L6JfppPDuussw6XkhjBEKWt?=
 =?us-ascii?Q?T82jot7YTiWaFeY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:26.3485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73af178c-db9a-44d1-eb12-08dd611b663f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803

The following functions are only to deal with XEN_SYSCTL_page_offline_op,
then shall be wrapped:
- xsm_page_offline
- online_page
- query_page_offline

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/page_alloc.c |  2 ++
 xen/include/xen/mm.h    | 13 ++++++++++++-
 xen/include/xsm/dummy.h |  7 +++++++
 xen/include/xsm/xsm.h   |  9 +++++++++
 xen/xsm/dummy.c         |  2 ++
 xen/xsm/flask/hooks.c   |  6 ++++++
 6 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b5ec4bda7d..7476d37238 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1759,6 +1759,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1843,6 +1844,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index ae1c48a615..86bbb15890 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -144,9 +144,20 @@ unsigned long avail_domheap_pages(void);
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
-int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
+#ifdef CONFIG_SYSCTL
+int online_page(mfn_t mfn, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
+#else
+static inline int online_page(mfn_t mfn, uint32_t *status)
+{
+    return -EOPNOTSUPP;
+}
+static inline int query_page_offline(mfn_t mfn, uint32_t *status)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_SYSCTL */
 
 void heap_init_late(void);
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 35d084aca7..5f89fc98fc 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -497,11 +497,18 @@ static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#else
+static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index d322740de1..d6f27aa977 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -140,7 +140,9 @@ struct xsm_ops {
     int (*resource_setup_gsi)(int gsi);
     int (*resource_setup_misc)(void);
 
+#ifdef CONFIG_SYSCTL
     int (*page_offline)(uint32_t cmd);
+#endif
     int (*hypfs_op)(void);
 
     long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
@@ -601,10 +603,17 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
     return alternative_call(xsm_ops.resource_setup_misc);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
     return alternative_call(xsm_ops.page_offline, cmd);
 }
+#else
+static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 4c97db0c48..aa89ee5331 100644
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
index 7c46657d97..9819cd407d 100644
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
+#endif
 
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
+#endif
 
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


