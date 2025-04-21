Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF69A94D61
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961084.1352732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm3-0007mr-QL; Mon, 21 Apr 2025 07:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961084.1352732; Mon, 21 Apr 2025 07:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lm3-0007g2-Kw; Mon, 21 Apr 2025 07:41:03 +0000
Received: by outflank-mailman (input) for mailman id 961084;
 Mon, 21 Apr 2025 07:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljJ-0007m8-4e
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2408::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931c5ec8-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:11 +0200 (CEST)
Received: from BL1P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::19)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Mon, 21 Apr
 2025 07:38:07 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::64) by BL1P221CA0041.outlook.office365.com
 (2603:10b6:208:5b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 07:38:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 07:38:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:04 -0500
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
X-Inumbo-ID: 931c5ec8-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJRYoi1N7OKP0hsovwBhPDOKxmLfoOp0ikH0SWmgzfKcBr4aJh2cg3kR/Y6i0Dn2cBRGETyv1s2BFJtMiE9fRiwYnvugIu2my2CCXAFzFTaE/J6BKom6KrpTcGbcvC499rjtGygdj93cogVzIq3DEC4IsN4aKvuDyeXTe28seYDz0hoBUuFBKYR8pQVLQoKmGJ5iavwrrLxEK42fCufFQDUGS7Q+NHohsyL0UjrVOZ8xNdf6QfcPUJIg+Ee+D6sxC0QEgolIjTqg0QHIVE/af54VNCsTUPeoUnfwuluXCQwcbcYOy4c1tzqWM8zzTw7x26k13YE1ugVIpaPluYKqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmYhue6f45DT6XjBHMe0aXLexIDjqwA/EdqSvJB28ZE=;
 b=W+ch+yu4eRpTc+0VGL1E5s8tbeIMSf68fWWM1JigYd3pOdGp6FOM06HCF2xch/4RBAONtX6GRWYW4Gt7avx7vGuaS5iLY14y5jgvt7dcekVcsQ42SDXEmO0q46dxH54bUemiZnSMHA6Wukbqx/aa8uunYI1KWLsk+5sLPmny4okTR+5aV6NwvmX65CcF2PWMHvvyIKj0GziEfExPXTkX3suqvajPGJFS6+0LiJzuW4sFqKk6N0bJUsmlm7BER/C1RxxUHyHRsRJe4YFg2VIXGoB1lLcHdDXXCYqE6EJult+OksdAUsSdwEAc1TTRrOyfxwlRtHe1EXTmAJLkeKgUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmYhue6f45DT6XjBHMe0aXLexIDjqwA/EdqSvJB28ZE=;
 b=Jd4gOBJiKSWaq1HxJ1vqZWyT8iCSZFENob66KuK20NMJIvBtGmaN3gWx2DaXFsf51PPbGcLP/TCIMqMccDToNfnIHTddLuorCCJSqmN4UNlEHpjS2SB/ueQ9RrvHNNC13VNkr2tgEKDUY1FUpZnhP9KFhq+nVQoIvWBfBwRLnV8=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 08/20] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Mon, 21 Apr 2025 15:37:11 +0800
Message-ID: <20250421073723.3863060-9-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf3c808-31f4-4688-cc98-08dd80a77551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6rl5bhthfbN03Qu6YCfRZtjsIJoO/sMMSMStC1Uk+XHLg9i/ttPvcmVEW9JS?=
 =?us-ascii?Q?STUpOJ+rgU+ftkOcrbpPqtSLhBNpBOaXx3fZ6xTzjbrwlkVczSMNtf+zrFUx?=
 =?us-ascii?Q?XdchSp2Ex66vvL1MxbGRIZpihDI6oNdE7mR2r0sDGlNzXkz9o6BXBtlLD2la?=
 =?us-ascii?Q?bZIilxow/ts0ralyqVJvngiaMfiWhcP7sJvLGrnI7b2qdAf+pGBrtB8xGnVj?=
 =?us-ascii?Q?Y4zIPZXwz4FOfdrd9elBl6S6Nn6PPhIrQyFckDiLe5XCVTMsGqsxm7kj3oRY?=
 =?us-ascii?Q?uZk292UUJYvNhQWCH8f6jyr99FnW/BLQoJbgm0aHytKD78YuKGp553E3T7o0?=
 =?us-ascii?Q?X8R37N+bUDOfErK7d9iIpyn9Q42wvKCKQdOd8EKtdE8xFv5xPjW+1bap/K/2?=
 =?us-ascii?Q?ZyZPJzwmz69BMWdUX4WZoQyCmoHM3TwfD0Gu5WZtOj283Xx8//djq0DQ95ud?=
 =?us-ascii?Q?mimMR+/+bOt/egxV9eYmobTdPK1SDz1EG2ucoCnb0iamso+UzlMlINN+obzs?=
 =?us-ascii?Q?bolVBcTw34edlHkFveb01sINXiyRM8n9hTUQw8Mq0njbr6oRJuAlxZGt1m7V?=
 =?us-ascii?Q?hNYUEofjokLByGCr12SKjFn+gT5RANn/GU9+/u3dYtQvpm9dU+9WNZtbAvAI?=
 =?us-ascii?Q?zYzHA37QnPnHqGcnlylWVe8Dkcl9mMxNPDXj5pnkbsMj5oXu7XVDV+swdTYv?=
 =?us-ascii?Q?qeEggOEu10PQRIom2mlxLdPID5QgeKwLMa3XvZ9a6X1S2zxgqdHQFB+9Rl5u?=
 =?us-ascii?Q?zcigw5qAY2ppDnhXVf7IybIMEAjuaZXj1S26e+RSFiYOmO9ui+4ZJCMzx9fK?=
 =?us-ascii?Q?bTwxYtGOXEplkysn9I1benHu9Un8GjcIL+4S1ERkxJmXDoGMEgnlkwPZ4hRd?=
 =?us-ascii?Q?tPz2Rz0IBjAeeNpM7SRz8clod7v77HQtlAUTUWS2cv2mf3Pp1ZucG/TcoFFd?=
 =?us-ascii?Q?0Txr1u5PP5BS9ed+rDszmxrxDIx+ji77CCzRGvS9USusVw6kj79Nwv1DGAhn?=
 =?us-ascii?Q?Qo0Usf7Emgwu7H+V/fVc/5XAVwjGkAFWHzt6gVzjIEMAcxnIUllmIXP1uR2E?=
 =?us-ascii?Q?6oa/qDXWiHyYCFWnAszeIaep/HItvrB2GMxcJHGH07Hw6No/JJH/ea3yDYBp?=
 =?us-ascii?Q?ygQ/Ce4TEqxOmuLMExV+saq8uYnOzRi7aSn3OCFjq24gmncav2gh/C1iKsVJ?=
 =?us-ascii?Q?N4a25CasZkcCzN+3HTRkIIltFoll3FlcMI9XGuSVesSzgdLi82OAE0MIHo8O?=
 =?us-ascii?Q?YkaZhz9XelFeOdO6ceEl37fkBK4xmS4cjZNURjdE6vI9n+5J/ekzvX6VujqZ?=
 =?us-ascii?Q?l68+J6SDOPIlX35AYRCcXhLxBYWMSe67JnRC/Q/CbL+GRP2O9aj3u2NvexLm?=
 =?us-ascii?Q?50jTFJllHtOojFI50VyxYh4p58hGIYT0Pi1PUDp+oXlbwFlLYO/qO5rzu9nv?=
 =?us-ascii?Q?RSkFvccDcDWJVFCFEKsPMUPNyiNlSiva6Aos/ZVqMwvuyBeGqkY5XykK52r3?=
 =?us-ascii?Q?SCKej5xg0i5iV7Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:07.2248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf3c808-31f4-4688-cc98-08dd80a77551
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

The following function is only to serve spinlock profiling via
XEN_SYSCTL_lockprof_op, so it shall be wrapped:
- spinlock_profile_control

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
 xen/common/spinlock.c | 2 ++
 xen/common/sysctl.c   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 38caa10a2e..0389293b09 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -690,6 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 typedef struct {
     struct xen_sysctl_lockprof_op *pc;
     int                      rc;
@@ -749,6 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 608e159571..2fe76362b1 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -123,13 +123,14 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = perfc_control(&op->u.perfc_op);
         break;
 #endif
-#endif /* CONFIG_SYSCTL */
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     case XEN_SYSCTL_lockprof_op:
         ret = spinlock_profile_control(&op->u.lockprof_op);
         break;
 #endif
+#endif /* CONFIG_SYSCTL */
+
     case XEN_SYSCTL_debug_keys:
     {
         char c;
-- 
2.34.1


