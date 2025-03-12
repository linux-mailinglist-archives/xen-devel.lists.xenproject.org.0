Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A9A5D4F0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909672.1316593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNA-0007fC-HW; Wed, 12 Mar 2025 04:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909672.1316593; Wed, 12 Mar 2025 04:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNA-0007cY-Aq; Wed, 12 Mar 2025 04:07:12 +0000
Received: by outflank-mailman (input) for mailman id 909672;
 Wed, 12 Mar 2025 04:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDN9-0006o2-50
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76d9b4e1-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:09 +0100 (CET)
Received: from BN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:e4::20)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:07:03 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::e9) by BN0PR02CA0015.outlook.office365.com
 (2603:10b6:408:e4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:06:59 -0500
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
X-Inumbo-ID: 76d9b4e1-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWQmTq78xCvWDdrXeBmv6ibx0YsGReARteo1t6cC4v8UvAn6L8KFTac3ISE2tKa+lBRFcOtR14oAlvqzoCV43dsNDyBgMauJA5VCPpxR4CGEf/dFy6uRxUFkx3jJHhmCbFm6LmMAOvuRNiBcbYctWSG0Y9DT3fa9gxgWBDqimhuqYKR+dOwZEuAJEUqxN/eooZP6uL1+ZJXVfyo1q8OZ1i3j/KPmt9CYJIvxmwSt2pnGuykV4ypJq1hiJJlu96rdCEL9k2X+AF1ycA/KJyQ+S48VSxO0mWitNGLnNoW3gUiLAPFHbKaQUG2J6/YRUWZFSyP56dSqTPX6YzZ76391Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfJvd41dMivz5QRFtPQPjoU8VhwHzIPONjPe2MQlcts=;
 b=PymuyoOysdLP2dldS3Tt9E9ZMEhZ8dhxDkHxYcOmMZgBtBRHebEh5nl/FyDJjBhRf4u2MvH8Fe8J5rvesJg0aZi8g302XTd/fNAHcX5yRSBrZ1e0pn+ihRlx//fh4B83bfiE/UPyyDG2tn6INhEZyeKj5pZ9oagDKmfV7N/3RiCCAHfGhBykBnnWG5IMWeUzVdXt3HRicJ/GeLaKwb4wdwJYsHMdOFRyBrUSV8+BffE+/R2GsKA07nQuyGEq6hsI57aidyU5Q4PzHfSgAl4dgc+pI6N+SEZZ0a4KDKWS/leS4fV846p5M+D9TjS1b5+vg2gQd0CyPAU4ZHD7XqDjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfJvd41dMivz5QRFtPQPjoU8VhwHzIPONjPe2MQlcts=;
 b=n+gy4BodC8GBmQti5umGZ8jhtF46DboCYbK6z6rmqL0Jli/HT4cKiEP5rqHrhCp3Du2M8W17de9QXNPHebnBJEo6BcxBjYSd508kjSCYNOz6f2qDL3GvFzM31cLbZpVlwcjE1rp6mg0PiMIH0Gf6jfu90dwOWxP40DkU7XssF2c=
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
Subject: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Wed, 12 Mar 2025 12:06:16 +0800
Message-ID: <20250312040632.2853485-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 9343d474-6fc9-4d37-4a2b-08dd611b58d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AT32nOezBV3/d3k8muScHV5l5VPFzI6CYIwoioMVcDJHGA77DSfpzWGhT5Ak?=
 =?us-ascii?Q?x3r3N2Zs23hzWcY4JtUkBUu4Jrqb52mS7d1FBp9NYaO5sgZwg6hVWVlPjJ1O?=
 =?us-ascii?Q?E65BpQNrqUO6hZN6ETLAbq/aortkNiUL08DA/bgvDr1S7qwSYOUeLirbgd+c?=
 =?us-ascii?Q?OztjQC4zON7nDpi7HMbjieVVl+Udqepwlzi58KiGSIbuBYRt8VS3R3pJVy+E?=
 =?us-ascii?Q?CJzKN9O+IpjsG+Oa9gMGyE3+D6fonVeokXooqj2kXy1FC3vTl+Co+7biKW4I?=
 =?us-ascii?Q?C+4M2PKW2+bnkn6/jUJRlb03etCKDbg9AvBBmZ7PD3TFr2HBofGHF/Ku+ggs?=
 =?us-ascii?Q?xzBb+8lQVlqCNpzRBrEkRgAArlaRmgo1i2hjq7FP+7T/c1bsNCuT0phYoG6y?=
 =?us-ascii?Q?fNlwoAASULeiplsoErRsKTWZ3wwBvRjRwcp4ArXI9DIUWh9qhbHj62qLttOr?=
 =?us-ascii?Q?DfmcqfqYt/LoMMktVyiEL+SU3i2+1GxYV3LittT9M732UqkhNbA0/1jSgWM5?=
 =?us-ascii?Q?ENONr2HVr5xEodpyipIu0CdqPP1xQVm2Niql+otMdaGXH9b/S6a/TPZTrc8i?=
 =?us-ascii?Q?DExmf610ljzJDIEzQKolBN5P9xSR3h+yGYWqhDAP0u514nfxAvm9JprEalFO?=
 =?us-ascii?Q?Hd4t6OUhJgvxRwQ+IKbIejgD3Df2jusUmkAyrpPp+owdAICRoFk/JOc670tA?=
 =?us-ascii?Q?KNe2y/fFjcpD9tEl1BIMolDHmOilUhrxs3kPB/oPJjlHxMLn5CRmvIb7+b8a?=
 =?us-ascii?Q?FI6wIArelOyP7klxaZS2WRk/zCPVy64YQ7t0/GH69CWj27DCgeJ/U3a0fWIj?=
 =?us-ascii?Q?5V7RT2MOoRjcbPgqFIINaP4Phr5OeMQt4QfqFVwYYJ8M8Zt79JQTmwvh+Q66?=
 =?us-ascii?Q?DKJ6cIuUBABoQQ9qaPTjSrQz9z9W5Br7NjlwiBE+7QyHS7v409GPyC05qLxB?=
 =?us-ascii?Q?VRh07H4jc1JeDma5ZnczLxrOk1nB/UjsGn9xRvv56HDCw+7UuJ+gNOUODS9e?=
 =?us-ascii?Q?+GiLgcDTBISw4eF7AQhbebw3ik05iuO1zQfmUKelWekOuBhSumnn+89g2yH8?=
 =?us-ascii?Q?bmU4msqj9DLovdq1bkibGnLVV3F5lBQuP23R4BZoVr0V/kC2zKWPiG6L0IU+?=
 =?us-ascii?Q?Th7MTq+QQP95dPqzZGGlN4gTWR1PIkgGW9xTRozZzxld1e1vXqKxHjRRXj9k?=
 =?us-ascii?Q?YD3nGmYxDHw3FGc8bkzWWk1tlAETRSvJjqzwLM8JV6GiZsBM2hEWFHJjQSXU?=
 =?us-ascii?Q?BB+A50lCevwT05m30FrJLBeXxpRns8LBM1vSnoF+gzz4f5VU8XSepMdLjAB6?=
 =?us-ascii?Q?rP+/T99XQOSAEGhbChO679w8iLLRFAamUHobO04kkAoQ9N+/Brq3g7IA4cAY?=
 =?us-ascii?Q?R6wxxo+UaD4YiS4NUspXKotUpnFVoxHRHj5nWFgMnBsVuvzD59krl64LWZJR?=
 =?us-ascii?Q?E4avd/wjAmHeRWmG4UgJjQfa/Pc4AIIt05+LZc9Aora40eY7BWJbdDxpBrhB?=
 =?us-ascii?Q?0zGI1nIh3gcE4FM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:03.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9343d474-6fc9-4d37-4a2b-08dd611b58d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole
- read_console_ring

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/drivers/char/console.c |  2 ++
 xen/include/xen/console.h  |  8 ++++++++
 xen/include/xsm/dummy.h    | 11 ++++++++---
 xen/include/xsm/xsm.h      | 11 ++++++++---
 xen/xsm/dummy.c            |  2 +-
 xen/xsm/flask/hooks.c      |  4 ++--
 6 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2f028c5d44..6e4f3c4659 100644
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
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 83cbc9fbda..e7d5063d82 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -7,12 +7,20 @@
 #ifndef __CONSOLE_H__
 #define __CONSOLE_H__
 
+#include <xen/errno.h>
 #include <xen/inttypes.h>
 #include <xen/ctype.h>
 #include <public/xen.h>
 
 struct xen_sysctl_readconsole;
+#ifdef CONFIG_SYSCTL
 long read_console_ring(struct xen_sysctl_readconsole *op);
+#else
+static inline long read_console_ring(struct xen_sysctl_readconsole *op)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 void console_init_preirq(void);
 void console_init_ring(void);
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index afc54a0b2f..35d084aca7 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -186,18 +186,23 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
+
+static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
+}
 #else
 static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
     return -EOPNOTSUPP;
 }
-#endif
 
 static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return -EOPNOTSUPP;
 }
+#endif /* CONFIG_SYSCTL */
 
 static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *d)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 276507b515..d322740de1 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -62,8 +62,8 @@ struct xsm_ops {
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
 #ifdef CONFIG_SYSCTL
     int (*sysctl)(int cmd);
-#endif
     int (*readconsole)(uint32_t clear);
+#endif
 
     int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
     int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
@@ -266,17 +266,22 @@ static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl, cmd);
 }
+
+static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
+{
+    return alternative_call(xsm_ops.readconsole, clear);
+}
 #else
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
     return -EOPNOTSUPP;
 }
-#endif
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
-    return alternative_call(xsm_ops.readconsole, clear);
+    return -EOPNOTSUPP;
 }
+#endif
 
 static inline int xsm_evtchn_unbound(
     xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 0a5fc06bbf..4c97db0c48 100644
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
index 7c5e7f5879..7c46657d97 100644
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


