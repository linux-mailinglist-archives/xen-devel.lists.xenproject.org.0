Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOBeKqfhAmpEyQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:15:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E551C8C6
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306611.1578459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMiGf-0000YF-Bs; Tue, 12 May 2026 08:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306611.1578459; Tue, 12 May 2026 08:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMiGf-0000WS-9E; Tue, 12 May 2026 08:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1306611;
 Tue, 12 May 2026 08:15:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMiGd-0000WM-ME
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 08:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMiGc-005hPj-Vd
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:15:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a02e17b-bab6-0a2a0a5309dd-0a2a4504c028-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:15:02 +0200
Received: from [52.101.85.27]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a02e184-1dec-0a2a45040019-3465551b2260-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:15:01 +0200
Received: from CH2PR07CA0039.namprd07.prod.outlook.com (2603:10b6:610:5b::13)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 08:14:56 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::b3) by CH2PR07CA0039.outlook.office365.com
 (2603:10b6:610:5b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 08:14:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 08:14:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 03:14:55 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Tue, 12 May 2026 03:14:53 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/vMmPrji07mWzP3W5+CTWrUCYYks8X0OWFaHt0uP45n1FPzhfmge4Ib4VxCewIlJ0GR+mPI+vIS5MRrGSq9BFZvfSLGLHr/sQlAtlleY+WvQYnGVG3NVJT+phQJOcS6sNA31MxVCXjvZXpJ/Iv1Xo4KIdK6Ej4Y5auUnwir6RODL6HICJp7+vTBSj6cZSiwM2nuqHaW8UlsbVN9ZdhpFJVCZhTQ79vLUYZi6JORnJYP1uIj6x/vCf4YmMmxg07QCzwmvFV76ZB0pAAvLPx6szwkLtQv10a2fKz81B399YXCjVwGQQqdpiJ6DoSpq4Ez0ssd+dzsfzEUii/IQHlMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKswvIF4y7K3yp5QmM7rqu8Sxek2Dgy5WMsD5+uf7Mc=;
 b=GBl+HeSTmaNFf92sqYoVsJkvpxrJj+ddOjcmiJEuEbsERb1ZrpSqbamBCcxPklEjKqP2gluCCabkZk9P4uxdowsqge/3pUyELgIpEU/EFWxRZ2yHYHHIVQDYfI0dbAL6Uu1bh43u8QvHGxU9T7yRvWXDTJ2tYrr5QyBSJ67gVSZ5pd+98e/biNv2GuyYjN4FkU/2oEvmTMcdVgV0Nt/+QhjPhJgv0raUlKyTnqPCfIZ1xR9sY/QU6dRWwcqjxMCV2ejlARszfKCIaMPzxLNGr4J4maJ09RZSx7Yp4vvwUPkS9TPFCFCYWBw8pOc0lGbsNGl2AyYdQxvhzKlW+coZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKswvIF4y7K3yp5QmM7rqu8Sxek2Dgy5WMsD5+uf7Mc=;
 b=SF2kDDVyA6+l7bI70Nf3BqNTA/5tuOxM1vuGhEWmGykmsvnfLjH8t6MvIh4EE4VIq2iA35a4CZfYy7aJQF2sHhlpYpkLS4ZuJkjjliOlxuGMEooR0s9USX6b1EHTXmN5M97X0mKaWuE+PWJfMrTXuGfLMLryoSRgrGiXmwr0Ce8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: [PATCH] xen/arm: sci: Don't create a domain with unsatisfied user requests
Date: Tue, 12 May 2026 10:14:42 +0200
Message-ID: <20260512081442.48149-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c47f011-cae1-4dc4-1450-08deaffe8d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	HoctdsyCMk7OuX9Hv2HmNkp7JTMqZyy0c3InzaNkfM+SKGarP0WzwFFd6gyfYxQ/ftPJWqxQCP5+mweuaiQhs4wJKzkGhHnSJIVWzgpwysR8Xa03rTKKZnzbHgvv1VRgKCO2Su0zXIWo+VjlRaoiBRJnhzWK2gu+TsOdyOpXlRj7WpZqIJvFUrkWu44726GSGWRC5E4/25Oyfaz+Y6j/FUtmJ1GKg2w30qQ6hluQG7C0GWLM8irt16yQaPrrQaETLb9RmBQZ/QrOSY9KEqnu1CiawG1NBs2PSNPBdYv+cLYndnfMBBM55yN7q2N0cTz1NHpHD+IjDaSeB6bDoWwn24YhOiL+cvMVYHGsQBPIUjNVeweBKyGpbI/LA9IUX8BVQgdCPn/r3E4qgTI5W+6QpniXPvzztgYn/vB1sluIc57+zGXA7nuoRcR6sqhPU6DlzCCf2Faot6KJTUi1X4zyj7MGPsYDgtcGScXWaQKrhewAWMqNR7eLTX45MFHMbDyNLuhffDv9aHcmivcW6OAaLkLHYhz9cG/g7AjmoMXFy4kY+NsLB3Y9vE/Q5Z2gvtcfmyrWvR7yodPyMszmIvdS4F26neX3OduMBsgl6COk6/k4bsbtae5b2u0V7fjgqaV8ZNhGjB5+z88w6SL/W4s/prpPQREgPspFiYIYc++Hgjk2EqtQtQ4zjJ76bJ4SeMggox4wNIY/8ZkOl551GIxtoSiHpxIhfTlBgNWC24kmRQQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TXXcuH49MPvH4CaPiSLn9fbeEDYXzukPL2Wb3EIj5+otuSabVNczWkAyiQr35Z8VKGpPhxqKWPu6XtrR3GdO5uuaY5enNtfxog3nuVlQI8b5xd7onBkM5sZ9dTs3WFbSH7cBC0he3PFY5DU7eIH/HXHi77GK4954ijA4OzWgpbnrz3r0kl0rskChtswHzrHUm5sy6QhSBWD3Csmk66WZZay/DDq51q/BFRytlb+TIosazqW1Gsss61frRMJU9AfFIFNTKKo9liLjlcmyQj7DvHXWY55qW4PrFCHYY+Gwk4axCbtcaFEB/e4mjBOjzdPXZicOSj+SuBzR9F2m1mM4FbQDxVJNTsCRh0XYhxdTOF9V3QIOdnAVSdifoNt4W34dRnxZTXb0VS9hvEex6/BB9D4Wt2dtP0kdU0dkobg9fUjU/7VswIZlxeAXn+MMK91K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:14:56.0747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c47f011-cae1-4dc4-1450-08deaffe8d5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-purgate-ID: tlsNG-ebf023/1778573702-2B96A3FF-31ED3B11/0/0
X-purgate-type: clean
X-purgate-size: 2812
X-Rspamd-Queue-Id: F05E551C8C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On Arm we stay on the safe side and refuse to create a domain on user
requests (e.g. via xl.cfg, DT options) that cannot be satisfied due to
the feature not being compiled in. SCI fall through the crack and does not
adhere to that i.e. a user request for SCI type other than NONE when
CONFIG_SCMI_SMC (and thus CONFIG_ARM_SCI) is not set would be silently
ignored. Fix it by not allowing anything else other than NONE if the
feature is not enabled.

Fixes: 10e7473d6024 ("xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/dom0less-build.c           | 11 +++++++++--
 xen/arch/arm/include/asm/firmware/sci.h |  5 +++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 6f73c65e5151..52cf788a45ea 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -273,8 +273,7 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
 
     d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
 
-    if ( !IS_ENABLED(CONFIG_ARM_SCI) ||
-         !dt_property_read_bool(node, "xen,sci_type") )
+    if ( !dt_property_read_bool(node, "xen,sci_type") )
         return 0;
 
     ret = dt_property_read_string(node, "xen,sci_type", &sci_type);
@@ -284,7 +283,15 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
     if ( !strcmp(sci_type, "none") )
         d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
     else if ( !strcmp(sci_type, "scmi_smc") )
+    {
+        if ( !IS_ENABLED(CONFIG_SCMI_SMC) )
+        {
+            printk(XENLOG_ERR "xen,sci_type=scmi_smc requested, but CONFIG_SCMI_SMC not set\n");
+            return -EINVAL;
+        }
+
         d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    }
     else
     {
         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
index 3500216bc250..485ce211c995 100644
--- a/xen/arch/arm/include/asm/firmware/sci.h
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -148,6 +148,8 @@ int sci_dt_finalize(struct domain *d, void *fdt);
 int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
 #else
 
+#include <public/arch-arm.h>
+
 static inline bool sci_domain_is_enabled(struct domain *d)
 {
     return false;
@@ -162,6 +164,9 @@ static inline int sci_domain_init(struct domain *d,
 static inline int
 sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
 {
+    if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return -EINVAL;
+
     return 0;
 }
 
-- 
2.43.0


