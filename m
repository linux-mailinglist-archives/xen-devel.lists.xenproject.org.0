Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD3A94D48
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961000.1352646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljA-0000R4-M0; Mon, 21 Apr 2025 07:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961000.1352646; Mon, 21 Apr 2025 07:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljA-0000O8-Ia; Mon, 21 Apr 2025 07:38:04 +0000
Received: by outflank-mailman (input) for mailman id 961000;
 Mon, 21 Apr 2025 07:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6lj8-0007m8-J0
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d3d9515-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:01 +0200 (CEST)
Received: from MN2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:208:d4::37)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Mon, 21 Apr
 2025 07:37:56 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::7) by MN2PR04CA0024.outlook.office365.com
 (2603:10b6:208:d4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 07:37:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:37:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:52 -0500
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
X-Inumbo-ID: 8d3d9515-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4sPIB4uWLPaSbd7ILSBm+ZxLkrXuqDjn4nPstxmTJFiGGaU8FbzDdbKBF+6525SFqJVa1g91tlNRnJhTKTwunqyhkXtvo88ItBsI9bTZ9Kg0ec7kfuu4XnnS7yTRbEsDgkSbdJl74AQfIsniAoKIZiIJDQWdr570DHZVrsi1DoCCdspZoClAnlJSoptf51pctz+EfqiDIuDvwNGrR/q3RUngHN822tHiBch5gO6A5exDnGttV+JfL1cfAekcdIb4El96FEL17A0efLFuIogus3+OlM4fth6YLTXKKGnjKM/gkRsxi6AfSucAMG0PDBIlPK68mMX2rwUMFv43kr/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v10ezJO1RVNOYEoAI4at0ERhWAX/qYDJ48ts9ZOHevg=;
 b=LhrGP9kAscyJxc+HuNV3lHwAaVX15PUV7znKzSjQTveKb0MPDJ+uf1/0b8ztEljSiYZBvcokaR41iwBm8SiOGkzSZO6xnRSUN650tRg6DtlXQnAF8kaEhHocR6MBfZjNPB/t9Jkv4HBnJ2DEbXIPsoSCjfgwOfL1pTK+XEsZyECbrVue0/dWFtzHxkOSKO++mW4tH32hNM4vu1WHnXo+ED+exrOqKE5N71KqmwRQrUo8RDVcK9Y1fM4n6xUICGNEhTYHkllnJ7Q2vA8TgII22GgCD1mcjz2V7V7Qv5z/Y7yrQS5FFnYxJlqueum8hYMcnxIFPSSxNO3V5Mia776k7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v10ezJO1RVNOYEoAI4at0ERhWAX/qYDJ48ts9ZOHevg=;
 b=Poee/Blq1EPsATSKeNU7anmjrGxDIilPpQmCIRNI1P+hKrn4R5hg8e/afbJrBpxTVBQJckUxDXLJeJOUtEX2LZ6RGym/WGvB8CXQjqgjV1m3q+W1hOxLe8A/G+J7g22V9/7xroMSJnpymRJIAWRtqPqWD0GTDVfqxO7uOLIJtDQ=
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
Subject: [PATCH v3 04/20] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Mon, 21 Apr 2025 15:37:07 +0800
Message-ID: <20250421073723.3863060-5-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 7609ec10-9daa-405b-d304-08dd80a76e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ONnWl7aud2Okh8a3BX/UT8Be+N9gNbkMhmkPuSXxaBZl6qwU65gsLdG1Q9i?=
 =?us-ascii?Q?DwD3ZQ7rOe3HZTFBuh1WnDpCGpSMFXm8/qL2U0k9xtgrxcCp4chlOp+jmB73?=
 =?us-ascii?Q?foYEBqi70T15rlZ7NnyFP/57+zelQTs7e+kw4PPidPqCKve/M/SiANvWNaWG?=
 =?us-ascii?Q?k63PhOl3gTbyiUSYu4JxHOZlzqH62YNHHpouGENE5dV83oZNVFMqAceM9fcT?=
 =?us-ascii?Q?IvgrO4Fit40YZzlwkTU21flTrB6bIpgha44tNArinBFQN7PXo7bp/ASsJxx4?=
 =?us-ascii?Q?nN/RBHtik8eX6sU4AChcz4BXhs9R4f7xOBEI28FJou/81M322vKpHNSQkzeu?=
 =?us-ascii?Q?BrSk5wteyk0QNSGG3IlD0PuCtLfc7ftewLqdByrrM7CcVQhTjdr19oPj1Lfc?=
 =?us-ascii?Q?f5YVIei87kXWXGYdh4yWpn6ZrkFxnG7tyE9YccGt0IZI8zMl9VOuH8mOp2m1?=
 =?us-ascii?Q?ndUXXjf/9zFRuXjO+l3JEi6Qie/i7N98tMK0Kk+kINzEuhOUwoM80DLTEOO+?=
 =?us-ascii?Q?ge4sKswRqAs9qn1egiWRlMvoTG9GTDtaUwAnqaVxtxzq9eTFZUtKakDAtKtZ?=
 =?us-ascii?Q?T7DypZFImG26iKSskpFK85N3ah098b5ZbAqC5URgKPYT+fAjfpBfh7PX+NwG?=
 =?us-ascii?Q?ZlVHRasQC+f+ceje+axdm5xsLlS/o8QwUwr2QA7DXOf+/22SdO+YQ8f68nVS?=
 =?us-ascii?Q?2NaulQSGRDtC2EwLHUpYnQx+x+56qqHS5gxgGpCKo6v4FGlZ0K1HkMc3CKwy?=
 =?us-ascii?Q?q4meUzSCxVhpMDZHxbyFDIdLBT0Y3gbOqu+1C9bM0icIRVhPIzbzDK6/nVOW?=
 =?us-ascii?Q?BFwqUDvE4iHzfizOLXP249vSog4Pfe3GYabxjz5yf9cnBKurM2srdWazr2GP?=
 =?us-ascii?Q?wR2eh2Grml44l3l01ruI8HLeOeJbhZF/kwCP8lxR45QAlJirAeXCdlDwaq+O?=
 =?us-ascii?Q?VEK6BTdehtgroqjKoyQUjbkhDoKdmE7kVL168+WLo71EmK22SdUoysJOGzld?=
 =?us-ascii?Q?MMJzKwdc+sf6IG0tys+9gO6bCa0yjYMITesc5e/u3Ch8jUNb03eRRIl+Z3Ru?=
 =?us-ascii?Q?jg0mVLKh/o9JqIJ5yYGbmzhgc5FQQ6bEHaXRAHWsg3X+S422Zh2CfPE8aSFZ?=
 =?us-ascii?Q?A92Upz2uXLQ9tQ3snqneSBr4XOoooSZ5ukGTntxQvmBuIDFHjnP4x/TKhkCZ?=
 =?us-ascii?Q?SSXkH8hkqpMGg7/XK5v4RBv2O7AUA99G8Ua33RANB8lVXIOR04qDL9xr0+Fq?=
 =?us-ascii?Q?ogQd7EsNZzCBr58AoPVOZUjX/ZOCPHtx3FvzftU1qQgc6Pcq+LaBhcIo96rw?=
 =?us-ascii?Q?rsEL6v3bI1DTXkXKm4lgzErWmQ5YwGeu6hXDV3TE3+gStNi6vglUmKa0p9HB?=
 =?us-ascii?Q?OdlWdUvKIX2yRviP5FSob05WuvBs7qcJEqzVuzpEoz0x6dtJuAKxFtDvPxf7?=
 =?us-ascii?Q?OtOt2yXOpTmBbUhCksLS7D0dGfIlF9D0SnWPKTzCMu3toGShxgbTFz+5LcqK?=
 =?us-ascii?Q?e+YAsGmwyZhPrxv2OIDR9A2xuEYzTCIBPr0E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:55.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7609ec10-9daa-405b-d304-08dd80a76e8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole
- read_console_ring

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- move #endif up ahead of the blank line
---
 xen/common/sysctl.c        | 2 ++
 xen/drivers/char/console.c | 2 ++
 xen/include/xsm/xsm.h      | 4 ++++
 xen/xsm/dummy.c            | 2 +-
 xen/xsm/flask/hooks.c      | 4 ++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c2d99ae12e..814f153a23 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -58,6 +58,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
     switch ( op->cmd )
     {
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_readconsole:
         ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
         if ( ret )
@@ -65,6 +66,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
         ret = read_console_ring(&op->u.readconsole);
         break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_tbuf_op:
         ret = tb_control(&op->u.tbuf_op);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..64f7e146a7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -336,6 +336,7 @@ static void conring_puts(const char *str, size_t len)
         conringc = conringp - conring_size;
 }
 
+#ifdef CONFIG_SYSCTL
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
@@ -378,6 +379,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
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


