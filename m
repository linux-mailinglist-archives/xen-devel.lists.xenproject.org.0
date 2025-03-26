Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBCA7103F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927007.1329839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhr-0000d6-LZ; Wed, 26 Mar 2025 05:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927007.1329839; Wed, 26 Mar 2025 05:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhr-0000Zt-Fb; Wed, 26 Mar 2025 05:53:39 +0000
Received: by outflank-mailman (input) for mailman id 927007;
 Wed, 26 Mar 2025 05:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhp-00083W-JG
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a861b6a4-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:53:37 +0100 (CET)
Received: from MW3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:303:2b::31)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:31 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::99) by MW3PR05CA0026.outlook.office365.com
 (2603:10b6:303:2b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:28 -0500
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
X-Inumbo-ID: a861b6a4-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMKpHihNs+umcKLkk+pp+haS2rwepO+jUCgHBketiCKXy92hA1Wq6OaanpKz+rKKMLHBStYxyhW/ThXm6Oq2aE8TFiNuDE9ji4yM1NJsMQcKJwDZJwzkApno7kD/fOTnvaXa58x6HBHE9hqt5f9BcPULcxHtmmq3ulk3ldIYjez1nvwFnJpMk6wXxRNwWxXOZ1OI1na67eUJTwIStxx2ykjEjIV/EGs3fwyOWEEOlAo/zfwuXx+rgkPQWiq/YNIyXmLyy9pAuHtZNEeYlGccL5DAipNdR7hObRrjoo9uebdUgMF5I1L+3S+uotcIW8kE+gIhedEu5ZNGwMuBdnrj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOBJks5j7PnIe5vuLLY0nvyA4IHUS7BuHQpKqgii/A4=;
 b=ilar5xwiJrtLuGEENlV9+owINndSQlG164ewEqm85Uow6OmU6Sn141+RwUl/PdUsHmlYf7hgLGutoElqZ5Hm4haQKuA9WfGZCnLCHddafdqQ+0+xdIrpb66CYZ4ZTmcxtIIqEg4xJmquGdxJKkcaUopTw2HX9/Y+KfjrVO9laL3CEto7Rwghjdejk/xytlgh/f0qv33IqGLa2B4RPY2HsAPnGfaaOfLCASWNiINlPNrxeMg27KqO7JoZox0RukSzeiyvLbaIT6yVyIm73X+apvffIvKeaWmXgRM4B0kmobbEXuUpdW3rUccWiBVXnS+xixEdu4mg95bqC+MkQqaA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOBJks5j7PnIe5vuLLY0nvyA4IHUS7BuHQpKqgii/A4=;
 b=HxLlFj93fJYWznzGpEMzLFyjFfw1zL6iQiRxJHDuQfgboWmUETF26seSreOjOMyx33qmzyk6kPVLLEmfG+Km09v+PjM6D8xbYfpR1ET3SMrHJ2rcaIYSNYE3pf3gmBGOIwdx/CRNoevoiQfvILQJkFKGDA8nqQmpOomAnqlgtGI=
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
Subject: [PATCH v2 04/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Wed, 26 Mar 2025 13:50:38 +0800
Message-ID: <20250326055053.3313146-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: e7afc185-5eaf-44ae-2efd-08dd6c2a89f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EoGkyFBi7B2a0zHrVKaYOZ9VGE7dwlzc2lQC5xrLBuWerXi56aGb4FDa9b3n?=
 =?us-ascii?Q?AVZ/DVRU459oIK5/5wASGSS7zxgJuX1RyIPKDM2fo+X0iv7xumPDRxjQ2my2?=
 =?us-ascii?Q?GlR0wJ6JRdql6ZryyJp9cL/8ue2V+oyuXraDiU7Z3halW/J6R6pu7MH0qjvV?=
 =?us-ascii?Q?SBYYNCYZLp7hhrqHpC83inI/6I7+utVAR9fczdetzd0+CJ7EZ/aD/3l1fa6j?=
 =?us-ascii?Q?z527ZKaevRalD21zG/vBXGNbpCZM7t4plPOIOt3t8Gu0FAEuljWAkuSA7rNf?=
 =?us-ascii?Q?9GI0oxIn1LMsqthrcUfMEk2E/bfJqeNh2Z23w+PaRHkp0qcKqm0MgAtEbZr/?=
 =?us-ascii?Q?BU7zlrIjuNsTHqRNIK1QG0G7GbdFl1uXW9/pReK1KPOoeZH90wwvoVDAxbXb?=
 =?us-ascii?Q?ja/NG46+YBY0wfBqa4ZgpvKIt6Izi+sUxQxk/7EpvzNcqKQ9rImUqLcSxxUL?=
 =?us-ascii?Q?8mGEkq0FygzdsZS50MNaxnsBn9AN16lvxz4ZRaJgeYruXQbmmGXYk7nXYtSs?=
 =?us-ascii?Q?qLUS/2pEvc8GPR7QhuhyiaoLiBXtXNrV3SStQyg8lsXGz6eNb678lfuYQi4l?=
 =?us-ascii?Q?7NmHCc7vyYHsr20yDD+xMm+bW6pHpvYMK9Y7Z2iwDx1btllFlBhKzEFRVHn4?=
 =?us-ascii?Q?7azqOcbLjVbNRgY+dA2UgfZSlHdO4AWa6sZ/N+xZC0lxZZOvIWuF5KRuRGpc?=
 =?us-ascii?Q?CDzs47fJJVsv7a1O98iSnqurAE7KFksLQMwppS8Duv0sD0cdoLodFAYhgUMn?=
 =?us-ascii?Q?4ga8vTcxoQMKJD4BbKweIDZd09zyoyMQgOCRvqhQ/1NnaPuwKEyK1L8RNnen?=
 =?us-ascii?Q?akuUg6U7duO6Z+UKeLb9ZkB46OIu3zU6oyoXACS19kJPW8Utb1Pi0qzoFAPT?=
 =?us-ascii?Q?kRnuK4dZgbuZ5ryD05uHuP87atxRvkS7ImQoLPbl+NrLrijqme0h5+uqz2Ty?=
 =?us-ascii?Q?niWY3Z1/81xjYjdoikvHm/35WNsedN6jRsNrHEvjTnrEBJhNCv7nq+b+vNv4?=
 =?us-ascii?Q?AYPDJW1Cc7+Pbn6aGIKdH3SQE9vwx1DIidvjsEIbsVTkNLHlJM07PM5i5SmL?=
 =?us-ascii?Q?lvnshXFTy+7h4YYIsJSTgEiUSMaNKAwxXFs4kpjdrXlGUfBkl/NuDqGamR0s?=
 =?us-ascii?Q?0V56qtF9SdS2+S3RZB2BJHVWlGtGMSIp1bRr/Ln2dl91Koqv/oRLRd8lREBQ?=
 =?us-ascii?Q?W+h0vZdgLDiDQlpxFV2YglFZ3BWdz+Ft6yMtZRN5/RiJpH6PTj9uYqdSNdU9?=
 =?us-ascii?Q?8aBdtd2dH+DMFbd7zxt65eignjr9Jafv/W2YlsoeQWwawSYuItNNmhCqCk3h?=
 =?us-ascii?Q?z+NWf8UDtqHSHDNrInx/JotG//5fv8b6ZDwukPV0J1fB6Bg5xWXXhVCEwLtS?=
 =?us-ascii?Q?N0kzp4XpqBpZcz4LIyKME+EeII1xwwgBQ6xMYGOEuDKiJ7MhdYe+SIpzJ3sF?=
 =?us-ascii?Q?p0T+7YJpZetdm/Q3mDYI5A9Ym+n0g2ORDBNSM0arEDaYMJOdP+UwIrYWSQ33?=
 =?us-ascii?Q?8IpBRwlitzLo0Y4iO0KcIpykTakadJQAhRvP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:31.4005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7afc185-5eaf-44ae-2efd-08dd6c2a89f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole
- read_console_ring

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove redundant dummy handle
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/common/sysctl.c        | 2 ++
 xen/drivers/char/console.c | 2 ++
 xen/include/xsm/xsm.h      | 4 ++++
 xen/xsm/dummy.c            | 2 +-
 xen/xsm/flask/hooks.c      | 4 ++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c2d99ae12e..dfc87a2846 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -58,6 +58,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
     switch ( op->cmd )
     {
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_readconsole:
         ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
         if ( ret )
@@ -66,6 +67,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = read_console_ring(&op->u.readconsole);
         break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_tbuf_op:
         ret = tb_control(&op->u.tbuf_op);
         break;
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
index befe9336ee..df7e10775b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -934,7 +934,6 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
-#endif
 
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


