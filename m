Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA37B50FE2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117704.1463828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX5-000703-Fu; Wed, 10 Sep 2025 07:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117704.1463828; Wed, 10 Sep 2025 07:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX5-0006xl-7J; Wed, 10 Sep 2025 07:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1117704;
 Wed, 10 Sep 2025 07:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQo-0005yo-9d
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:54 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:240a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554308fb-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:52 +0200 (CEST)
Received: from BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:47 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::f1) by BYAPR02CA0053.outlook.office365.com
 (2603:10b6:a03:54::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:45 -0700
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
X-Inumbo-ID: 554308fb-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gundG3Imx6ihamTOiGDIoBSl4+M9m3E90m+DSvXZwP1k0rdrfg9q0ow1T9eeTQIFnshBo5IjebCS0SYQhYEqID18O8GyAajoKDffPyXpHSZWX2uQ2jxt9PeDHq2ry9ZSMaWC9U9xmgAxS75Nq3cFRcJJSuxhIsQ1ikahwQTYeaq01lmjiaSDKU3pmlFQwC5ximcp29c0r1oV0JVx9w0xqJjklBhkOw8Hc6DVPSEQc+E0InwN9hc7waVoJ9Zr7DXxLpoOzLIYM7HWCYA4L7569pnKrnh/sHV6aQO92HJ68sx8rLAVyltb3Nwgk7WgEPVTyaRSqpBo6ERgvEaWPokqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsmFgRDA4WFTLrqEIuLxOXiyrzOrGFpurXCsxhnftMA=;
 b=buRt3pol+wnP9OX6fcBs3HaKn05AEk6MUaP46Yjr+Kyz0lbY8i1n3iSYuDnvX2wf0eOAHNqkOoFT4u6ZJD+tkvGB8GtGOZD24AbpoE/ZOcSji9AbCm9fgVLHwSzLPUem53vS8nsOLgaUG9zokN4Px4MvhIIZ/3J7+deRXw/MgIyZPHgpFGJ+k/FWs4ls4NU2SxX/nAcxG+ca55wwN7NRu45c/0HiqO83IxfX00g+UfpaTM36P3pw+X1Xo8dxl2eBKeG0z6gSDBcYK1DAEo+ZVUccVW13P5svBvFWoIai4BsweUKClL/9if+TLH2i+efYzPWvBIstgftGrKkv374DsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsmFgRDA4WFTLrqEIuLxOXiyrzOrGFpurXCsxhnftMA=;
 b=EoPjfOnxqcoJmG/3W7DgG8em7FNQL1xZJIgnbFwvUm6TPRXrSiGJxZsrb7/dJV82syhpQ52Fi90bfcoNgst/wfg75Z2AszOlPHdgXzFTt+Sw+2Kgjlm1hugKUOC85NUl7s09ZlvUAPS7fOtRHc2b5Ahi+NQP4SDTG8GBGNkOsgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 17/26] xen/domctl: wrap xsm_set_target() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:18 +0800
Message-ID: <20250910073827.3622177-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|MN0PR12MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c74ed39-fce7-4469-b6c9-08ddf03d378c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wz1ZR9o3RS35/bobW7WRwWgc7f1Ag/Iq68r3HhSmQ7ETfJFsJx57bio9JSed?=
 =?us-ascii?Q?rQxmx3Og9Ep7AyJi/lL8zN2Sr/aGl+CXsWJQyuJn0lJfWEKtRpmYNbuWDqMZ?=
 =?us-ascii?Q?31Lw/f9V7GoEZfptFzxbNAnkQnQZXKrieEaawqL5SwPaO4tgYvV/UePz4BcW?=
 =?us-ascii?Q?mcIfgb6IVbvmBzyjEhjdow9qx0nOHWp8C9vRRY9koHFO7gbxnrsqR5SjORQh?=
 =?us-ascii?Q?Q/LxKWiDY7F8hxp/lfqZq++ATtNoRtfMNEKUSE0nYzKLwP7VbnzZTRlSEVe/?=
 =?us-ascii?Q?TrWddusO4gNqROECbl6ZqS/uLhRvtvA1UaCp9jf8jwOVg23q9Ln7gJa4BFbo?=
 =?us-ascii?Q?l7pXYhxJ9VwXlozc/MU0kaY5zESqLyObZ3quWQTP9rsoEpnV29CpTE5OTo8D?=
 =?us-ascii?Q?U29juWRa2V8HupYArkEQ9qv3PY3tlnLKWBCLgXxtoI1d3RfBS1IIaO9X6nTR?=
 =?us-ascii?Q?CVaGm7LJmxgqQRzKrYgxHjHWEUTKaMP+eWzA8Rglu4ETITBEeLZKkxE6psq/?=
 =?us-ascii?Q?fxU+rFHbC/9cgcQtNA5dazZ659jCMCtgqcn0rJwnxDcfCvRCKjfZpHVs0XLw?=
 =?us-ascii?Q?FUEIjiMygQ6fnfwE9AfqPhqqsvxYVvuqn9a3OAWmrMpbo5ooxsIvm+D4nxy9?=
 =?us-ascii?Q?pAC0Lw623G+ay0GaK1jSZwKiBtNaVmroiEkIjWe6tFJ0QKezBsylhwHdHQGm?=
 =?us-ascii?Q?kxrmsstHEaYUFmXK8Bmron3OtVJRvSaaMShNyvbPfxbQxS2j7Hfd4JPbFuNv?=
 =?us-ascii?Q?0A3uhtXMaJYBPgEBF51z3elhrHx8st6VEJ08KX7YS94SuzlqxvDpA0S8GkeX?=
 =?us-ascii?Q?lrSW8iYBm8PD1XSPhD/BWDX8I0tkI3xys70VeB2Qy5I0tfbLPjEMhtGMUUe3?=
 =?us-ascii?Q?7UuB842C4n3QTQmPrHK43JLTWJKlmGMuPgOYFznHLyQehahZrB6ibBhmLcpg?=
 =?us-ascii?Q?z1QrQztbn3vczfYnvvXvpi2QgpFsyK1Tz5RTV6icp6DziWu0t3KI35HcWWiu?=
 =?us-ascii?Q?+QPdKosgjDMg/41xvV+z9sYpMourgFgQXUcbc6K00Q7FvHI0U1YDkrNy8rn2?=
 =?us-ascii?Q?amLLBkPsFpdY/ESXJzUTxateISJeXv3DIoS9KouJc9X2VQnbJ29Q5US9MMTJ?=
 =?us-ascii?Q?DihZ1fBYHL/70JJc9Vt+y72kOTq+2wcCj3wO6FtRytPBNROjYxYcjKZWo2eA?=
 =?us-ascii?Q?FBCdpNz3rYtmkE/Zq/NhXKQ4lV/K2NX3XpzS2HGIWCN6RWIPsia4l6O7fD1Y?=
 =?us-ascii?Q?PiHwYDYYyasPmnQ9p/ozkXGKtseo5lxXgoAkljPF1k4EnivA09MNNK/M4ohr?=
 =?us-ascii?Q?grwjqQavdF63G1kJIj/J95rIWQaYdpayACJhGcwL2DFDNFuukNu1GjsALejj?=
 =?us-ascii?Q?zMwJN0bmW8Iqj2ZCsgrA7JRXG6ExTCh+9jrzCPcLNPHDY9uFVUbvc9WxpdCP?=
 =?us-ascii?Q?y2fPft48n0ZTrqFfSDqBA2zFUT518jDKioFv6V86Fwfs1LT1oM5pgiZatvTA?=
 =?us-ascii?Q?bu5l7fTfmz6MbbVTBClwh73JQOUHZpvO4ktl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:47.1394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c74ed39-fce7-4469-b6c9-08ddf03d378c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126

Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/include/xsm/xsm.h | 6 +++++-
 xen/xsm/dummy.c       | 2 +-
 xen/xsm/flask/hooks.c | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1fcd945336..678cb0f346 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -59,8 +59,8 @@ struct xsm_ops {
 #ifdef CONFIG_MGMT_HYPERCALLS
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
-#endif
     int (*set_target)(struct domain *d, struct domain *e);
+#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
@@ -258,7 +258,11 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
 {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.set_target, d, e);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b216894579..f6986dd2bb 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -21,8 +21,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
-#endif
     .set_target                    = xsm_set_target,
+#endif
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl                        = xsm_sysctl,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 198053be77..ed4e466302 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -641,7 +641,6 @@ static int cf_check flask_sysctl_scheduler_op(int op)
         return avc_unknown_permission("sysctl_scheduler_op", op);
     }
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
@@ -666,6 +665,7 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -1893,8 +1893,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #ifdef CONFIG_MGMT_HYPERCALLS
     .domctl_scheduler_op = flask_domctl_scheduler_op,
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
-#endif
     .set_target = flask_set_target,
+#endif
     .domctl = flask_domctl,
 #ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl = flask_sysctl,
-- 
2.34.1


