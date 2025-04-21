Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2040A94D65
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961098.1352755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmA-0000UD-Qe; Mon, 21 Apr 2025 07:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961098.1352755; Mon, 21 Apr 2025 07:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmA-0000Pk-N9; Mon, 21 Apr 2025 07:41:10 +0000
Received: by outflank-mailman (input) for mailman id 961098;
 Mon, 21 Apr 2025 07:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljY-0007m8-7a
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2413::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a79db7e-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:24 +0200 (CEST)
Received: from BN1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:408:e2::27)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 07:38:18 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::12) by BN1PR13CA0022.outlook.office365.com
 (2603:10b6:408:e2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.10 via Frontend Transport; Mon,
 21 Apr 2025 07:38:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 07:38:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:15 -0500
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
X-Inumbo-ID: 9a79db7e-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiqVXOpmjUjDczYincGEBfmymwRzqP8nEHOUzYwql4QB9GIoymdA9yU1uxooJMa+Nm+9ZARo5dOYUaKhkALmqH3dABbwrbjMtNdaZ0gmCdY7RBbr8Ho3Q8/oO9nTXMGuhFKLzCu0PtzZXEncr1rpTEpKsDDJ563XMvJnJoaO3gDEiNi6N5EvBl+0DGiXG45ROQXR/leJsgK34zLhoPUBob0xISdMik8Hs3WfyPYaBIbNcNArYUDTaJK8CI7h0Nky3PPbVbivn8T84+GlnX0AxRSyqDBLe5dAvdY4l/E/RQVAVkaDa9JsdqH6pAp4bwDN2kGfydColqyIQCD1OHYmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOhRRiNHZPNu8AVL3BqYSG/H9sWAd5fdmyFUquc9k1Y=;
 b=W6pmswRHL5dBreRgm/n7sCG/fGfeB981GSyAyLCYitQHjEQiLuUoXIdwe3keLH7/433qqq5eNvoSvC6l4ZWHxJud02ol3/6ZBs7Kklk9jz1muwDek09Om3z0RIzTp+M6u4zUmnJK0Cz3WjawNvwPWIhFcnvb54dvZGu3ew1YQ4TMHFIjwQ4zyG7vs0LKN5UomfId8xRX2yf/ea/DodI0qgU849MnDQx4Z+B5dnCv2MMfDIuPT5u5rKCSov5o5GAozWQrNQUuhdM0lP6EwJJaAuR7YH/Et/mhqf5Xu8TkZSPvRop9umtcVD6pWTnHpV1xZ1tK0ywg/6GxcD40Noqpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOhRRiNHZPNu8AVL3BqYSG/H9sWAd5fdmyFUquc9k1Y=;
 b=4ZgUm+NbqMPDYeCfTYcO6aVK4DroMuIcGTxBPKEXn/ODuZpUUWwB4aTv6hew6+5fOj/iVYzVYj+B1mVgyIipZCgTGBnrhatL67BkZnFA4+QMpwcOv35wuA5v+BuJdpMhKakOHvuRDoBaKawFu1dELbRcyVPFv70+lsdnfTkBKag=
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
Subject: [PATCH v3 12/20] xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
Date: Mon, 21 Apr 2025 15:37:15 +0800
Message-ID: <20250421073723.3863060-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f3cc6d-e35a-4bf8-1f57-08dd80a77bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dc7B64Wegsizw8Jlrp+tL/wrwlAEJMihLEvW5Porxj8NT72J4hyTzUo2QFpk?=
 =?us-ascii?Q?Tj4fWt+wPQguvlQ4Aw5a4TwoC54diEU0tg+t0DQAXpCitKMlf73BdxBhmFmy?=
 =?us-ascii?Q?+d3ncJqtNPSHEsIXmcy1V7s2FoCybGUqbcZke2lc9M2mstFi2Z5jxtn4qEIQ?=
 =?us-ascii?Q?xW9P6uTat3t6sn0cZ6bAp4yDHq658keXsyjcGgSJIYheplsbQggN9fZ9Aiuh?=
 =?us-ascii?Q?pLmwTJQbKnbnWqvxp0RA/NhZHbYjicYrpihiPtaGzwnqo2Mz5wE4IJr1H6Lm?=
 =?us-ascii?Q?N582I0uBWvRKsoktyY4z9Dr5NQ+sS0GdPmnvtXhje0I/Z5NwqMcU9qEN1Irc?=
 =?us-ascii?Q?2Ua4ehKaaPzT+4GE6zrsoNR9W4nx8kCVwEgQY3M0qWnY4v4mrzCmI5j238Cg?=
 =?us-ascii?Q?a+1BPImnUEJffoRVnpRDlD6tLPUJXKOmIBAcYSDMv0WR75blTzX6SRbhFspn?=
 =?us-ascii?Q?pj6ZG/GPBF+ZaGKC1x99baL8oiMs1Uo5OKq8fqHcVtZabjN06PhkaCOuw4eC?=
 =?us-ascii?Q?6fs4u9lEpnXi4q8HWSjMsZhXbNGkAxCQs7oCqrU0PcaoEdIwgwW/ClTzOo7Q?=
 =?us-ascii?Q?TUGvkcwDl3ITqje+lOElwMmxC0djK5cEl4TN/hHO4iQnd1hgcsOFlJU2U5Wq?=
 =?us-ascii?Q?ijT2JHFwUuOR51ejW0FOnulgn9SbCEIJEOhtI5oAI3m6trYwPPIr3ovu7DKt?=
 =?us-ascii?Q?zPraiInQbN/H0uzwNqjbFPZg5u0YkiHLENum9Ut60UyIWa7bLAtzfo2F/r55?=
 =?us-ascii?Q?dKMrRHCIKEJoP1SooeEN4m5Q3JlnaJnZQpoevftI7pbTKyzkgWTYTV+maneY?=
 =?us-ascii?Q?yeV/11QBppUVFHoD6avArDZfy0Jyv+ecKIa+VlPS/K74q9Rq3b930wnVT+Me?=
 =?us-ascii?Q?Wxc6GK3ucPCazUWi7bF1WFU+OrCDyurfcAfuSn4Es28EGp3hr82ep0THc3Wi?=
 =?us-ascii?Q?PU5DQ5JT55Ab+1sroUZDvu/OSpH+8kFwBQuwIOw2XLk+ApU2KemoqFqs03Fq?=
 =?us-ascii?Q?RBJ8u4xePazWTsVkRSIpjDbCmqaTZSPIVj6ZjJXTq8rFhsfF+ATxqrM2wK2Y?=
 =?us-ascii?Q?x2mm4XmVJBVsObSqP/NvTJnCfsusZw26LayrNi/fZNaFzy/SwYvMsNPcyvoB?=
 =?us-ascii?Q?3TTSzplH9JTy72JnqVLfCVDNdK5vmZluA07MkfZh18i96i8gOG4DuUjP30G4?=
 =?us-ascii?Q?VIq2qBfYOR2iVkRimgJrQfmUNOnSLnikugDaeyOOns+Q+8M2D4vaeMYGgWVN?=
 =?us-ascii?Q?wbOoeCPGMm9pt99hmlqg9ZXnAMlanB3ZkDEunXmM9ilyW9XWHEaKvPtqc5a+?=
 =?us-ascii?Q?SAJmb8mD+sIIZ3eD1v4b5NmcZJPmNfNcfuCpmN1uJvxEIO2TXX7BOL49ZXWl?=
 =?us-ascii?Q?k6GRRaRoIGYSGKwEc5AX43EKtizIA5mUYgXUJFOdV2p5hMSTLDoIz4is5/uE?=
 =?us-ascii?Q?6CgyGlt6APfX25E0ytWV7v+mu17pLgEzxLvmGHDFs7Ge0ycZNP45iS9xw23q?=
 =?us-ascii?Q?RSA9J8JSZC/41zw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:18.1237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f3cc6d-e35a-4bf8-1f57-08dd80a77bd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

The following functions are only to deal with XEN_SYSCTL_page_offline_op,
then shall be wrapped:
- xsm_page_offline
- online_page
- query_page_offline

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- add transient #ifdef in sysctl.c for correct compilation
- no need to wrap declarations
- place the #ifdef inside the function body to have less redundancy
---
 xen/common/page_alloc.c | 2 ++
 xen/common/sysctl.c     | 2 ++
 xen/include/xsm/xsm.h   | 6 ++++++
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 6 ++++++
 5 files changed, 18 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bd4538c28d..cc2ad4423a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1758,6 +1758,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1842,6 +1843,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index baaad3bd42..504e3516c3 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -191,6 +191,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 #endif /* CONFIG_PM_OP */
 
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_page_offline_op:
     {
         uint32_t *status, *ptr;
@@ -251,6 +252,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         copyback = 0;
     }
     break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_cpupool_op:
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
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


