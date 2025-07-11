Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71ABB01235
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040355.1411800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R3-0003do-Jd; Fri, 11 Jul 2025 04:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040355.1411800; Fri, 11 Jul 2025 04:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R3-0003cK-Ft; Fri, 11 Jul 2025 04:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1040355;
 Fri, 11 Jul 2025 04:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5R1-0003OX-7s
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1e58f6-5e10-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 06:32:29 +0200 (CEST)
Received: from BN9PR03CA0912.namprd03.prod.outlook.com (2603:10b6:408:107::17)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 04:32:23 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::6) by BN9PR03CA0912.outlook.office365.com
 (2603:10b6:408:107::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 04:32:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:20 -0500
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
X-Inumbo-ID: 0d1e58f6-5e10-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFyZHdxQcUMnR3vF99nnomGRb08ansTo9562jZSmUAQL6fwcxzomi274Ul+j2vaJQ8T8jN7lNHFAFl67/g9KrEAPE5EvLuQ6DNuGsZ+cTbMNbRAcsITKYH9w21M7w9QjmktCoDcpvsWPWTc/mTNo0pAa1CG9+B2WuBGoT9HwiShhQbgmqadScqZidaSnBEAnoWT5yB7mxtZjxin8tOPnGKmgg94bk4JPqy/7/K0CmR+c9uSUkTnkBZSRoiWm2kfK9w1z9Ej9fdTo4K8++zaQOkih4e1nF9M8vQ0oag6MOin/G3dCxWW9+m6S2OF5dgmY1m8MzWvOX+MFD4mRGCsiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=gJtD7Vu7+Vc5hTCIAYnIhg6BWO4Tx8AxlhCAMkb1GCkNxVgF+758QvOOpLUhdPwxjKnvGgwblhtaXhVrBadGmxzNmhTWfrRfQJZf/683swzkdZpHuzYN4lMaQ3A1YHygnacORPS75YnuL1mxmmJV6PuepuOIPg+/Q11pfiAutgTbwMRDu6bCQWIseRRwIjB7qhCr/9xm/pCJYxmXiKd+9TzfqO4IDrvxG8LOYtMvJuru3FcI72exPMda3VYePnbKNZXaf1N6DODoesTBWSOu9SQPyFL8mhdhTiQCg2qz+xrYqnsLqIb7SS9oO41oKvDlAPYqqR74zUfu1Lre9++ysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=InhmV0mTw+LMoY0Q9fZ1RtvM2X1KhqPzv6M7pFGH7r3PRsb9a4HOh6o3f7sMbEDxRmyuN9yxlKHw3OKAGEUVP/jkaGmptWtHXJiwVW/27Myzf/ES124Da8OeFTZxhjjrTBsoVmcy8se6YmK/JEzqmEbVN29OaT9OfdEHJTCBKt0=
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
Subject: [PATCH v8 1/7] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Fri, 11 Jul 2025 12:31:52 +0800
Message-ID: <20250711043158.2566880-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 2183c9fe-05a1-44c8-794f-08ddc033ee3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HuFiuoEdk6wAaYqhLNlmsdK8Eq0m6c1VWAxp7ZIkNioAa1zvjzy/yjRyTlNm?=
 =?us-ascii?Q?cOaYAEqRKhvdXjE0m4dMa9M6dzO0LkIN7U+dtK960+b+32tCLCpaeMpDNHKA?=
 =?us-ascii?Q?BsdAI32w5uzh89fV2YIivyej6U4Vf4UoIA3kN/9XUd1W4/sFH7MqXR3vpTMF?=
 =?us-ascii?Q?n0Be6YG3h66pX3ENW8xUo1TocbRyT0xZXVXoNaotcQcLCwB5upLHl9LtBTF/?=
 =?us-ascii?Q?xBiGfMF1o2U1NlHz9CZ4den4DPGR8Ehx/JeVZvXY7h0L8TEGYQgIppXx2vpW?=
 =?us-ascii?Q?lTdxb/Hz7YxO0iTCrY4vvt0DEa45yo1gXUJgmckgdxIUUpWi0Qfu4brHlhaI?=
 =?us-ascii?Q?4wGvobSFvN/RWhP8nDwgD4+jmlplOm9uqMle5ER7Bqz3wP9s/auyPqnzfe0+?=
 =?us-ascii?Q?8zpV4z+KLdgNrhwCKxmGLkENps2lHYG0MlOiYb+VC3GPZlzZDj4p7jVhsy8p?=
 =?us-ascii?Q?/aFIb/1jtW3O8+O0ZrvOrOC6T6IhBJITsr58PqxPiMid8QqLwR9uoyrmh2iF?=
 =?us-ascii?Q?butIHP6WnIb8PU00bwcVQmz5oaazHXSijnhunid+E0CWfOVEIqkFp1lqoTKz?=
 =?us-ascii?Q?15wh74AUSEknvdXPjvplrGF3Vxmizz1un6YqAIkLD4bKcZMZKtN9b7ifuh58?=
 =?us-ascii?Q?Ulodr6OzAA7/DVh52evG71sOzM0z22DQr1VOMC42/cF15DNFliGRgHuAaqlK?=
 =?us-ascii?Q?zc0ZLm9oLp54luRSvVa36fHmKH2ihB6JxNz/ioN5tLb+gX84vgGrydWaREi4?=
 =?us-ascii?Q?Iu0vBHx+fetGbxm/ddmgchJKEHKgI7/r8VTTM28d9OTvO8hoWOHfjdd3AsYT?=
 =?us-ascii?Q?D1kuHF5AzepFxA5jKKqFQ+nBCoV4TWBAu6qfUsTtbZKRt3SY1hCgCexY4oSR?=
 =?us-ascii?Q?lYXSpVFVc9v8LxyZDQwUqYRTNt2nTUe5FBS7NxuTXxQpl4WpCz3Hn+BcvdYU?=
 =?us-ascii?Q?+ekfS9s5MBdowwSiFUoi4wCwKVR0k3Aq7Rwwk4m9RilNLJQ7CbV/804kKb4P?=
 =?us-ascii?Q?iwXWwqBabk56Lse7/o0t1zc55npNRD41ZRCNmfGlqPGILRYF2r7BZ+lKY/ER?=
 =?us-ascii?Q?R2vdQgnxfOgkqsb8mAXsWivS0bnmzKnyqGJmG3VZ15POJnpIyWzQm0Pc68zC?=
 =?us-ascii?Q?L0yYsqwGT7+MR1FdJ5z21rX7c/f9fRWV22yYI/vEv4lnkWldVsOCG2e38R1L?=
 =?us-ascii?Q?SQZjLtzykzIEJm0YIFLptckzEU6PJGEFwD+1u66dnb+74m1oPS3OLTqpwy4I?=
 =?us-ascii?Q?pI+iKbTRKqDGN753+8qL+4VwETy48dQ45le4e9Q3rDpWNmnxx7NPUpkqJst7?=
 =?us-ascii?Q?HuxQPFoTNFlYu7+3W2LF6L9T7Z87B12k2g83dxmxtPXs1n+KZNrk7n60e0fR?=
 =?us-ascii?Q?LNtUuYVY7BaCjW8dXiNx2nbUtQD1z5u0i+y9ViMxLjoMkeg+wDfqIYhQvoe9?=
 =?us-ascii?Q?brS3Q4DbL16r5DCFbLOmJ7GTfM0mjz1W8NEfcF91GvQMTfYvLJD9+DAikHAN?=
 =?us-ascii?Q?XFXqsv/sa96xP0UMEZw1mkx/0ecW89UxH8EM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:22.8917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2183c9fe-05a1-44c8-794f-08ddc033ee3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687

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


