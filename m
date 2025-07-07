Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7942DAFAA17
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035074.1407292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJD-0007q6-Fp; Mon, 07 Jul 2025 03:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035074.1407292; Mon, 07 Jul 2025 03:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJD-0007o9-Bv; Mon, 07 Jul 2025 03:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1035074;
 Mon, 07 Jul 2025 03:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJB-0007mT-O9
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2414::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78462a4e-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:19 +0200 (CEST)
Received: from BY3PR10CA0026.namprd10.prod.outlook.com (2603:10b6:a03:255::31)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 03:14:13 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::9b) by BY3PR10CA0026.outlook.office365.com
 (2603:10b6:a03:255::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:10 -0500
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
X-Inumbo-ID: 78462a4e-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWQi449MpRBq/6cZUZk44H2KQRCIstvI+a2UOkwB9eExboKKDA0yu65GrA4J5HiM5vZ9z7mfeIU0QZfKZal9wlzW5JTmXV8JbuclbyPXo6m9PnrW2WygdTnDLKIN586CKfU//QLQejvhlbguWEg5tKPxkLplFhByUGMXLl29z15fF9P+fErgN4Ews9ZMLVgUyGV3ylyVEgVcxYlz96grKj1yqoGs5p6h5cIwE43HIkf2I1eTzLJapWblA+qSX58u4phPVMf3WTWfFhKkpZBo4VyAjcnMPs15AC0xpvu3AmoTv5W6/F6eLgiTuX4e8LepXYvsaEfXi7DeFBZ8UzklRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=SWGmk3lTBPnJluHz6bul5zdNgbPe3M4mIzxEveEjaf8IliOiHU0HAQH0Lh3sFMhrOV6Kq9ioQTRmDGHbKzqKv0qppJ/1QDCOVMR3vefzopI5J+Uz5l8dF4ruBbP/mDr9Yp8FHvib9+2A8XxIKcl9VvItqUfJre1TNLCZJT1eTvg4xZZPqIExmw4pLoqHDQhvMXfgTRHmQoJSFt5wnUWfUmQuluaLCvH7UJx1+oPt9LG9KgKxCXrFv9AKryXoUZ7DmqXzFXY+ptdsB3llA1S7IZKI3LM1S8Vu1KYaArO1NUSQyfItySKA8LfH4vG0xpUd8gb7bWrBfnbKh+LyMiv5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=2KDqq+OKfFAC0LbHyIOn8ifCLAdXFQiCyuum+W1WK2XX8O1Gfgrie5Ncb+2dIv8Bi082tsBNdp/iBXWD0kqblgT1JntXcUlV8TuaelNYp55FYqKhEg7VyhKEhRp4MCk4PvCWtK6QaArIydYoDcpMljA1v2i+7B9RJCWZKx+hmak=
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
Subject: [PATCH 02/11] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Mon, 7 Jul 2025 11:13:37 +0800
Message-ID: <20250707031346.901567-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: ef75b8a3-8339-4f45-94a5-08ddbd04597d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PFd4UogxRLqXCD8QLwj45aG0lIlDsPfIqqS0VNLM3IuZ4itof7FWgI+zVj2I?=
 =?us-ascii?Q?y4QUYZjydHAHnaRsVm99fUPnq6+0u0euz7haYQRrROHCYoFNywedPmXHUoN2?=
 =?us-ascii?Q?kxA5qPo52MeML/HQwuY5IlBk+axyIq6guOgPNokOnmYvrcmn9Kw+s5y1Cxlz?=
 =?us-ascii?Q?ZiVSWwBuQ4MuQjg7hVifgTdMz7K/sghP875eBYQcu53lpldQTFa9RMroEhuz?=
 =?us-ascii?Q?TaFv3Z0zWqy+FlXKNly6M2xdUdJW9lhkxG8umDWXkMOn7ajORzcr8kdBGRyc?=
 =?us-ascii?Q?LOnHU3JsPPCjdeAmsGByOqDdWKmvHSENmhOQpdkCh19+KJqKyLW8kuhHOMc4?=
 =?us-ascii?Q?/lRZaW9WWP89xMDNgovJNqtcxMdb0YuI1zBYQgX169sSzq8M5r5HU042e6jo?=
 =?us-ascii?Q?B3aPmCZvRiTF98Dkj8ikgmMPcODJ1lSLiIjq0IQcJW6ucEmRuh4mYCtQq4A8?=
 =?us-ascii?Q?RteIc6wIrTKMfAD8gMePyC6kMD6B09LYtn+n645FL5VJm2tp7vp6+RWen12a?=
 =?us-ascii?Q?IT4VoFDNHdKBUnf7jSl9ORhSOX4z6Zvv58PEuQAkBlzqLN13DoFdzYog9nak?=
 =?us-ascii?Q?0J69g5MzxJGEkrl57JG90GDKk/BoV37LxEK3mFz2E0NDavIEztVpJwpsP+nu?=
 =?us-ascii?Q?JFR8dNx20MOFY9WBcp/7YOCKhlfGcAbW+adEaLDkaD7vLGzWOkCPgSY6PruG?=
 =?us-ascii?Q?wPJRvfJVvmTYODUUDDohMhK916W9dM5KyH5rVxg41ur6F9YVdCqHxw0aLvxn?=
 =?us-ascii?Q?5QBiDckOnk5CfjE/3hyHt/CQIOUUabt9F3fNjGYx3FBiS0vpJktT115yeF0P?=
 =?us-ascii?Q?P9VA6//tAVz35FO599HPRAABF1P7etQoFgrKgEDLMGRn79lCbiD7s1elSPb1?=
 =?us-ascii?Q?nfzLbG14iBhGQFBEJksklfoIncs/CmM6mBhi3S3Wy9InvIjcHyaRMKERdU4B?=
 =?us-ascii?Q?0x2rlG6c3pFiWeeH2tpGztZ/c0V8n83zag1tcpFcOcqFA9RjcBTTJyU7XECv?=
 =?us-ascii?Q?amXwnCuwQDX8VFJhQvir924vgHlI1kGdT+Um4qevfnVi/lGkoxmXrtAgLy2N?=
 =?us-ascii?Q?pIQwPJu+k1BGtQ+HP0cewbrxdk/kNTodlw4yOyocliYBg+pcyw4YTSeUm4Qo?=
 =?us-ascii?Q?4mew0HhWvw735pjxnl870RCH6vtorKdhn6KP5snkLdp6MRXvX8diV1K+g9Uj?=
 =?us-ascii?Q?5FyVonMzO+CLfYSQqrEIHXTO1CK8n98FQA1jGJYel4ROzwHEyZFE0Qu+sZ4T?=
 =?us-ascii?Q?Y23zpqnYzG2OPM8K8koDrVOMfe6USH3UpyoKOVe0246nLx7TBVSbAnb10TCf?=
 =?us-ascii?Q?sTXsZVtH3a0zbMx+mYETDoBnSx5Nk+mKIY3PsFEmeTOJ4N6/ym28fzES/kKw?=
 =?us-ascii?Q?lcD+NQCGN6se7K9Vief5lG3EMONRLSI1VZRa8jFc+lYjd1xt18SoK/ptRw+J?=
 =?us-ascii?Q?WM805tsI1VWocuZfuILAuRlk+JzBfEk/9MnVXETMncy/eMTP7ef8eScLHQDo?=
 =?us-ascii?Q?KoqfTm7r8qwYTrB2o3a/aabmXyd7VbKVvJAF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:13.4060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef75b8a3-8339-4f45-94a5-08ddbd04597d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole()
- read_console_ring()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/drivers/char/console.c | 2 ++
 xen/include/xsm/xsm.h      | 4 ++++
 xen/xsm/dummy.c            | 2 +-
 xen/xsm/flask/hooks.c      | 4 ++--
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba5a809a99..c5afac9f72 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -368,6 +368,7 @@ static void conring_puts(const char *str, size_t len)
         conringc = conringp - conring_size;
 }
 
+#ifdef CONFIG_SYSCTL
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
@@ -410,6 +411,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 
 /*
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 22e2429f52..042a99449f 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -270,7 +270,11 @@ static inline int xsm_sysctl(xsm_default_t def, int cmd)
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.readconsole, clear);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_evtchn_unbound(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93a0665ecc..cd0e844fcf 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -24,8 +24,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
-#endif
     .readconsole                   = xsm_readconsole,
+#endif
 
     .evtchn_unbound                = xsm_evtchn_unbound,
     .evtchn_interdomain            = xsm_evtchn_interdomain,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3a43e5a1d6..df7e10775b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -934,7 +934,6 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
-#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -945,6 +944,7 @@ static int cf_check flask_readconsole(uint32_t clear)
 
     return domain_has_xen(current->domain, perms);
 }
+#endif /* CONFIG_SYSCTL */
 
 static inline uint32_t resource_to_perm(uint8_t access)
 {
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domctl = flask_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
-#endif
     .readconsole = flask_readconsole,
+#endif
 
     .evtchn_unbound = flask_evtchn_unbound,
     .evtchn_interdomain = flask_evtchn_interdomain,
-- 
2.34.1


