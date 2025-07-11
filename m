Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2AB01237
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040356.1411806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R3-0003k1-U0; Fri, 11 Jul 2025 04:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040356.1411806; Fri, 11 Jul 2025 04:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R3-0003gT-Q1; Fri, 11 Jul 2025 04:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1040356;
 Fri, 11 Jul 2025 04:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5R2-0003OR-P6
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dea3c97-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:31 +0200 (CEST)
Received: from BN9PR03CA0920.namprd03.prod.outlook.com (2603:10b6:408:107::25)
 by SA1PR12MB8744.namprd12.prod.outlook.com (2603:10b6:806:38c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 11 Jul
 2025 04:32:26 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::ef) by BN9PR03CA0920.outlook.office365.com
 (2603:10b6:408:107::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 04:32:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:22 -0500
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
X-Inumbo-ID: 0dea3c97-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhibGtaxG+6B0FOKQFPGXDYUDy1zFRLoOkiWv+5wANyv1lUaygk9reKPPX4Rm4o9lEXWMgVsofOiHu7vJHqXMZb8E1alKuRpdR5sF/nK35ZvQgXKFtXcqTNDqmSkZt0UP+hAj9OQUc8OYSImEPela/TIgasgY0n4iBIGkkRRnahAhOij2wn8e+AFtyCEYkEkKOEoOA4L1a8FofJbmqP+nBVssHovNbyZ8NNIxoDwUaksdB01iFVB6c9kuhklbMLxRs1ErDQtOvw+L2ooSRDP+rVBET7ystwLxW0vOYNAlkYGNZabumQyNr9OX6yCfHgJ/JWH6UB76pRonn2hBhA+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=oK8kI1/daT1rSjYmPjNSc3z/iVJenqMye6PHn+qzgmlsJJiN0JlpZR0pD3ZCux+C+3t5PxGCq+Xa5B4noJKjgKSV17G7Iz73/uPsGUSIimFaaikTOhBsqAnyS6LCFwRFr2sCAOilsHs5yPDv/T9GAzchAZazuq8tHYH1vKQmo8j7OOZe/JqrVB6+MpODOtByzFv2s0s8SqxOjcy1RzcBEfXdBGwWK3cMpZ3Oz5iwjOxa1F5aoTVt6reVLkoHC5VFnTadrVEv0wKeSrWzK9EgaCaK1/cWhnm13erubgz8qcQI0Ywcr783k9nv2wwNtxQgPx54nW68GdnsXFeekcSQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRS93Hqoh3N+utDDcTTMVxjdZcKA6NhPk5u7Ncd0IJ8=;
 b=42aFn1iB/4MAjHzaT+52Z6FvQSbBSji1b9O+CaT/kIVQG/n5ruWVQz6uE4VkvTGUlHj8GLbUkiZOq/ORAfya9xnBTT7o4KLTAowtbM5+SlwGbIdN9i68gO91PCM6YrrktgD0ltg2vudT/KwNfntlaWbhp+Bgg2QubM3Cg5xRl5s=
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
Subject: [PATCH v8 2/7] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Fri, 11 Jul 2025 12:31:53 +0800
Message-ID: <20250711043158.2566880-3-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|SA1PR12MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f08753b-5dd1-4921-9241-08ddc033f040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MYLMHZKuzEgSzZyk0I5i/gNfbvw6n7MkfMDZ9iRbfMAU/6uK+mVZeIN9JAPj?=
 =?us-ascii?Q?T2JWxAB8BPrfWvPbBSILx7CFFGtmi6FxpQrkl7Qw59XOQHBYsKUHMEXqVdl6?=
 =?us-ascii?Q?NTK14mip0DI+KzeDT3i4cx2VEmml3kNYit1I+/uDXEeG7cMmgOw0DEDBqGBX?=
 =?us-ascii?Q?3DT3fZYXSzbz9fagWSvRT6SdFquXcZPjcS1Et/5pBKKklCV9DXFOM2aBYdul?=
 =?us-ascii?Q?pgHTftKlKiwTzthpR4MVeQFtLqQ4HdBAohACB/Nkr5RKT7ectCjUCHw7H8+E?=
 =?us-ascii?Q?njCeZlJO+TsNtHHzQ7hhC+Z+vg/75MGqaPCe38ff9iCzG7nJI4XqTCO6E5q+?=
 =?us-ascii?Q?CXU7EPcJAPuc5KB22dv9BeHSUywlqsV4Tv4guJaPbdZRWxLEYf99wi3pZ7hf?=
 =?us-ascii?Q?5AURDfvqOzwHG47FV/cQdVFIOsw6FwvDLimYQHawd+az6Hets20aRsYCuU7u?=
 =?us-ascii?Q?rCVApGVoX8nr/KvE8N8tSZFPd1ln+4GSfw/4Z1y9jj1t1mI5IzyX2yLLaNRy?=
 =?us-ascii?Q?7OzE82kZHZnOsg1t35lRAVtNlz8ub8PJnALbHoKdmkC77HCS0i2UgCjZPoiZ?=
 =?us-ascii?Q?0YauYEsbcKvJg/a/bJs0W5dOSa0w+jAPWMoef6AWQjy5fvyQwv33W5pJhser?=
 =?us-ascii?Q?zTThpUcwoi1HBl4CoXgb9kyvemONGHR8db7wdFH7u76NZqcJZE5IXB7Ncbjd?=
 =?us-ascii?Q?LNLBTqUJ7y35k+59vAMEpACqeM+Al3NtLhYYgFD56jU2S3ZshqRsGGNlvUHA?=
 =?us-ascii?Q?eghc7kI7S5Iux7ztONd43+KhOe26yoqhlKGKpVP+xjGs2zjE7475XQHtz+p9?=
 =?us-ascii?Q?VC07H+gUt6vN7C3/+q+frg6k3p1P9hzdvK7kWxt1s/2t8WOcAu1vDLGVwldj?=
 =?us-ascii?Q?7EWFOmYgav6HfWMtqUTM5glgHVXoz+tkpoACsKifiyF73nlwTwByEduBeBXf?=
 =?us-ascii?Q?1ssPuNPi4fVRRZVpZA8MmZ80xOjaDtdPSrvkI2jBC+d8XGAjbUjR0PnA5riO?=
 =?us-ascii?Q?L3nnP4wRod/kFJlaZEG91EGuJFeSA569qw1swOtRBHC/L/uS5cFSGywSURwp?=
 =?us-ascii?Q?hk1wucBpBX3e9svg79BT9ZynVvGQjZn9OvVlDIgYWUej4+lG1ouAjtl2A+iw?=
 =?us-ascii?Q?jqFYKzzsGg0yRKMY/7Zfw8X4AdHHAoTLQGvGk+NLAQhKDhqZ7QIgjauthfV5?=
 =?us-ascii?Q?0eoXLYL8Rg69XSInQXU54X/Or71rkN3TVNMnsfK+T9mUThUDT3+eMF2k6wSw?=
 =?us-ascii?Q?GmwIeuFQRpRagM1pYtsFKHgI+rPtk8t6cq0ClCz4MuNIXaBIQK6T7d3cEfti?=
 =?us-ascii?Q?iT+CCN5sCRI1sjd7CoVPFAg2hieG97uvsoWBgnNAUs4GvIe7cdyINegKDXA0?=
 =?us-ascii?Q?cIVHK/Pn3ixig0iz2GZ59xhLxSpX6J8lsB7PpszPI8l1B+uuVr0I4V43n7m/?=
 =?us-ascii?Q?xx/HlZfYbkAJjdsg+0eDWBQIs6tC1DJw/jUz2rQ8C0R3hTxO6p3yzYNhL3t1?=
 =?us-ascii?Q?oQeeGh2F4NwFXHm/Y2ZsFyRjpnmJADS172uN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:26.2685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f08753b-5dd1-4921-9241-08ddc033f040
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8744

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


