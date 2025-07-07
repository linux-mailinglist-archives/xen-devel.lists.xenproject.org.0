Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BEAFAA14
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035073.1407276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJA-0007Po-7a; Mon, 07 Jul 2025 03:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035073.1407276; Mon, 07 Jul 2025 03:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJA-0007N9-4N; Mon, 07 Jul 2025 03:14:20 +0000
Received: by outflank-mailman (input) for mailman id 1035073;
 Mon, 07 Jul 2025 03:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJ8-0007KZ-JB
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76bb2390-5ae0-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 05:14:17 +0200 (CEST)
Received: from BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 03:14:11 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::26) by BYAPR08CA0053.outlook.office365.com
 (2603:10b6:a03:117::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:08 -0500
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
X-Inumbo-ID: 76bb2390-5ae0-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBaFgp6mHG7EDpWnptSdg3KHXOTDOY3/Q0MA6g8iEd8QlftX8qLMX3keC13sTt+NcPUMse56ucBQzRNqsrOA3rCb1fMcCgPbEBtsV8DLLh9mhPiyZVhcY+4LC9H2r9vgokDD/cYHNHVyFIoLsDTJZltj3nOqNkDB9QD4Q1yEQdIvtWb9BJQAQw0SgfQNW8mGnVAGKdtbLLesfflaI0JPHkre++bf8PDO7Y/3Ae8KvePuTlkfrLFExID8rHkbFG2UgvyyV+FohYir47c/RtNXUx7qmvk55o2sVXHQlz6c8W09FPxApB7gA5SG7juRGUtgqtRI/DrKxfGfyLbVTp5rcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=EsSAQSQEEsdod075iiced8NNLk6tj/2QaIcNGVMM+yOYc9CNfyd9ASIfMmu/gvRN2OcLCvbfxAe5glLVHBn8TZ+R+Om+bAsdWv6k4EvD/yg/MrI99PWx8jdrVA7skJ6HEqDKHtKImdGoaH0MDtS2oiB2zbQOb/CTDwn6Wjmf/wI594lIZmxjXUqgQGJg+E44AbH9ythDQROB7fUs/VOqLhKnEjXRVU8+nkmo17OTiCbmVXAerKaPncArdkBUwvv1/WhG/PB3rGB/Qy4yGuinV+balIxA/Mnv+D56Qs5pHwJGgeFwEBtq30NEtPu3mLFg7Oor2OSVnJ9rasoyvwqzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=LKR2c2vX9OE+Sl+apku9wqvDYvVMNWVye4CCprwyG8e3eUQadKKzuxej6lCI5md6jjuDrmuaZ17pOdOW/Pb8n6dIaXIfU7WDw9ZG3ArZ1clvH50PEGFvghMPJS2yobS3TW3AKwq8OPTvJZmUFdCPLy/ikS/phUDRBs7YA0CxdAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 01/11] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Mon, 7 Jul 2025 11:13:36 +0800
Message-ID: <20250707031346.901567-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 41651e16-6a74-483a-eab8-08ddbd0457ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DkwXQ/xL+DOIb9X5Z9JMU/8uV3Wmy335zfONCjuKsg1VxN/phQ8sOhdNmBpP?=
 =?us-ascii?Q?jhuU8B3gkVYSktVo4aorZxDXp5N8VEtv1hXUIM7k2IKU9yfl5354iWEfY/Qp?=
 =?us-ascii?Q?F2XdX5m90spjlTXwtBGNu+0Y9ALsUM06CwZEVlTZd4OQklKnUd/6u+X4tukZ?=
 =?us-ascii?Q?rc+tF6CXB6myAbcKF5G8SjMivPSX3nX1IoJ9MUi8w3LwO05HUWGX95AoRtY9?=
 =?us-ascii?Q?pEpIK5Sd2DY/dw/9Itq5wdmFhTVZQHv0vpMmDCl6UeRTXCi2fYczRW+65/Qg?=
 =?us-ascii?Q?6wgvSlXi/3pEZb4VdSx7obal6yRZnOWKzTpmmCLD+yhmeifET8DwmHOzmfJs?=
 =?us-ascii?Q?pZE1TISx7+wBcp02H0Qk4F47dwVQoew8lz86Ul8mkeHDpvSjQwijFvVo9kyx?=
 =?us-ascii?Q?z+T96IpQ2Li+/PfodH4ay1gU0hlbRD8oTjT0Quh0YWkjaxlPPdNelHq8+hZ0?=
 =?us-ascii?Q?PIAn8YPoqXJWtW48S+MSTKDVJXm8ypVPjg2cp00uakzoiu5pfeL91h3kNw+L?=
 =?us-ascii?Q?oOZGQPeQEt234gg7Hv1LQ6FREMiHbu/ftjlT2O/L6U5j8XVbTrL3MHoeDb7I?=
 =?us-ascii?Q?jfpkBdb7fOQpOa4SXrhpoMMEgpR9a+G6jzc0ruf43AYpk4+609Izb2tjKgCP?=
 =?us-ascii?Q?wHlHxJJ248BN5Z/+IPloCTYt+RlZiUb8Ztt8uH8R0AngVIr6Ai6lv8mucVTe?=
 =?us-ascii?Q?uXbEeSdp4DTE7SpPAIurCz2lW6K4r0UGrig9VZHSAnuYSwN2ozOvTSSxZK8c?=
 =?us-ascii?Q?NUQSIX/VY8MkTNzIQtPZH+Gxk4NauGsm4L2CsZJyKQecy/M5LiQLE477QmJn?=
 =?us-ascii?Q?vW1X73+BGp7l4tTR8d+w654nnHaW2ccfDmugoUb1nkGP/7t12a/nrV1Q9Sds?=
 =?us-ascii?Q?S+qVC5gDaf6T9fcfWIm6MVvI0TdzieX4nNuKhS1W9f/brzX59JI8ep6aoF4n?=
 =?us-ascii?Q?jkITLBympElmuqKVSwgpcvM//k8d1xfOvTk2OUJi2goR3EqoR5b/MtbVegpw?=
 =?us-ascii?Q?g9P60j9y4eSDpMgDuZ2PRjxzv3iX2/rMZp1K+QU1XWoKhB/ePq288iYWlv15?=
 =?us-ascii?Q?xcV2DW2shdJLoMfwm8eRquiyu7BV3r1HCjkHfyM5rdtqw3DtStYg824y+K4w?=
 =?us-ascii?Q?HyICaGCatet3kDfKRWQDFxNJYyWYe+KCvAMI2oJVhwi0n+PlcnsUo0aKB2cN?=
 =?us-ascii?Q?olDUf6X6e5K20A0v12P1AQRhfXyI3uw0CfHC5ayGYPBGYt2m9J8oPKhK+N3m?=
 =?us-ascii?Q?vZqg703SiOyRDFwKNzSbJ7QCJ6BgtcyqC18DYCgOhmluYJRkWG0qq282IKMb?=
 =?us-ascii?Q?WA71U2DNbkHdCEE42eWjaj7GnsGsu98V302QNdwQT2CJzJOYk28PzOxeA8xv?=
 =?us-ascii?Q?Xh8oUKDasd4SbjYdmGwtCaQbvymXzTjW14RYxU9z/0yW49WJQu/zGYFwaBXQ?=
 =?us-ascii?Q?Iq3AeHoMRf248GdNxsQrzXAC9RFlTLal6bv1AgjpL9MQUalthNLnrj+DOoNJ?=
 =?us-ascii?Q?fdg/YyUIQIjYZ2cRa54M9LcgJ9qgejvngCOV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:10.3544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41651e16-6a74-483a-eab8-08ddbd0457ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..3a43e5a1d6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


