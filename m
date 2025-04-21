Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B2A94D4D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961006.1352666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljG-00015O-AW; Mon, 21 Apr 2025 07:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961006.1352666; Mon, 21 Apr 2025 07:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljG-00011Y-3D; Mon, 21 Apr 2025 07:38:10 +0000
Received: by outflank-mailman (input) for mailman id 961006;
 Mon, 21 Apr 2025 07:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljF-0007m8-3r
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2412::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9090a18c-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:07 +0200 (CEST)
Received: from MN2PR04CA0033.namprd04.prod.outlook.com (2603:10b6:208:d4::46)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Mon, 21 Apr
 2025 07:38:01 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::8d) by MN2PR04CA0033.outlook.office365.com
 (2603:10b6:208:d4::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 07:38:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:58 -0500
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
X-Inumbo-ID: 9090a18c-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6cuSsvftTpGWJtvCoyFCI8GiWDqr331zRj61Uk7MOfjLdex0Nugeke58IelhB09iN+cqsbbQtOa6q5h1u40iJKJkYQ93j4U0BL2YT/gyl9MUXeqUgORE7ihuj4TYj93h9gHlLNCl/BJxADoOpFGcfee2haBaGTAWgltF1WhQMyvdAuQn2D05O90KtoJeYE6NUSv4VKLWFmv16WHPaVE4CRdJb4Wuijo/FkmUg1z9lmi3+r/pX79DHeAhs/zmz9as/Z9oD80ty2cp+0qFl34XQOExBVOUl7f/QtWgB9e4dpiRCm7fXsUhzOLqa8ZrUVPUD70S2N49+/hL+L19MT12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlGZ6nIZ1xZRQKXrjrM4A3O5qRVkPyMvLih7C/GSpNo=;
 b=ZlHzbc8C6XJcC/26/iGEl6n6VQVWCqx20Zgioawka2zyyuLdbh9SB+aarFQdvwZGqPCNECdMxdxP559fNP0vBo5Jf3zygSdFPgjSMCuMLwC20u0+ebVEvFPiEaohM6+mTIj6o2v89tpUjsSu+9LCBslG+5J86+0vXl5z8uGSoJS1CTefrArAuoEcUO4kPmMxP68DbBS7LX9wrT6ljInn7Kv5/6DYTSNM2zwBNkZnXrMARZOR2N7oymgWF5XPidI1TVzdSPCjSG2LXcTbaciQc+iijAQWBStYJCLnWe3egCGHlRzrKI/+3FGkLRLZbxdIatyFpgob49zGAHY9n67kUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlGZ6nIZ1xZRQKXrjrM4A3O5qRVkPyMvLih7C/GSpNo=;
 b=mJtK9HpH2PHoaR91CLcn2pdWf2BF3Ppxh7Qqjm97KebSUCDQK4TxxnA50OyGCCdulAN4kmSj+HWeD4FZ3BdE3cbZcreRwgEZWbbKux9OVn9+7qchVDnmpqF4ZGdNB+12GsY4bOyI1zTwhQ+5gPlzLvSWw90lJRFA4UUa7wA6dcU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 06/20] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Mon, 21 Apr 2025 15:37:09 +0800
Message-ID: <20250421073723.3863060-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b814164-248c-41cc-bf2a-08dd80a771fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cOKvB2f6ioPB2ANr0kswYbQZUGrL9S7baI4SRsNH+gUf8kK3hCIeaDMgFbdl?=
 =?us-ascii?Q?0dB+42+zftLFab1BLCFFaFBNuAMkc42+BpfDk1QnscYkWJyDiIikDAnQGd1n?=
 =?us-ascii?Q?ZnsS3S7ujl/TBfWmMEWM9kV1fPyptDZzrWPIPvSBeCaJAlDziGTS1qY7ELhh?=
 =?us-ascii?Q?aiRFfitO9Zuw1FB3qXy92DNkAFmpxTbDezICiaZSuvThiiCeNsm6dDyDa1df?=
 =?us-ascii?Q?fZ/ot3JU0s1lRNdkyDYEAucT3N8nwcNkfwWWzeXYpWEy4onDrjemxcGqENFz?=
 =?us-ascii?Q?WlOw20yVg0JpcqlFt/cypKeGbd6aHUy1RpR+KQOAlluaNZZPLR4fL39KB2d5?=
 =?us-ascii?Q?3bNd38qqjtiI/ubTM6IK9c51XBo/x6aVviQsN7XXotpc5b3N/T+ZTe1m3wbJ?=
 =?us-ascii?Q?dmApxIFSsbdGoeZ+t+A4/X8H+c25oO0KWfZU+Kqx9+kCOEjUqjzuDnUmJKWD?=
 =?us-ascii?Q?v9/uVh4rqcWv2D56HB4bSySGo0mVhvQCiLoM59ATDCkrJm4WkQBWcFQ/tAaL?=
 =?us-ascii?Q?0vH98egNMJxUfQq9cDP3ajTlpQXV0uZWLiiQBAwcoTokapMLJ4+IDDkduBck?=
 =?us-ascii?Q?duNf9pIoj9ZYOExIfPOd9TlR0z9yGEPwh9oQix5klFzASkyZ2grkVIr/3wEa?=
 =?us-ascii?Q?RjjgFP7qcHU5VUvBgMfflcer/FwZwNBq2h11tzQp6fBwBQZ0SUmVTarKfFRZ?=
 =?us-ascii?Q?e8Of1gVt1nl0DAC+X6no1zmuDD0u9db0qb5r8rfGy9KrdIeQfT9VWyfEyN62?=
 =?us-ascii?Q?gnYhgj8sYuGt2ZeWQ5dzJw1iCqc6IspPHPnXcF6t7WKohTuZ47G6nB7qYpSP?=
 =?us-ascii?Q?HWNjh0XeYNRynf467vCRxHx15dhrHDyFUSwBe/Oyb2MxO6UhBaiszR4++95W?=
 =?us-ascii?Q?h9AXsa2FMQY9O0JWF/pk+k0Twess6c2ThSXNXSP26MxcCqxzJPZduwQfBxBH?=
 =?us-ascii?Q?iu9Q87MU+IMCI3j9qfZhbvbRLUjCEFHvI+gWgCPfk8gw4nzwsz+6jV3eDt+k?=
 =?us-ascii?Q?8UWSJkRGlXiNdbwqON63ez1sKe4wLfCOkOgpMOKh6iSsn7TFMS81dVaT5dE7?=
 =?us-ascii?Q?GgD+urISK6qgzqxcRXyFxqUo4m6yRDCuimdgCUPIetRgxBVW9TtXUpRRSR8I?=
 =?us-ascii?Q?oNMaL+cT9YynKWQoc5XYgjcvDrQTsHtrd0/NOCudzAAd3zuagGSnOcb4h6rQ?=
 =?us-ascii?Q?wcdwlNODnoly1QrIN883EqFA8UO6SmHMpKSFMNO2oRVStUKzx1azt5dwE6ac?=
 =?us-ascii?Q?6u5LtJd3FPxHABr8TVc8gHaJhDhpQ+W/1bfiN+PmJLoXHXjDGNoUZZflS6C/?=
 =?us-ascii?Q?/WgOZvp5TW8gxfTvmZaMK5ELdsPxrMjQ74yvOt9hV5HSyeX/kQwJwMcMabX9?=
 =?us-ascii?Q?qK4Rn8+54bi50Tur2vy/FkmcIGBndFHqxIYALaXjDeK98LPvrx5fdRxVAe7C?=
 =?us-ascii?Q?zoPwSZYcbWfoF/vcWh8SXSIM8F1WGoAxvjNCzRK5ZvexeNmJY8zTkID/QldS?=
 =?us-ascii?Q?X0CR3Ve37/5VIki8w2wpvAZq50UFuZA7wXzL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:01.6472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b814164-248c-41cc-bf2a-08dd80a771fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658

The following function shall be wrapped:
- scheduler_id

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- move #endif up ahead of the blank line
---
 xen/common/sched/core.c | 2 ++
 xen/common/sysctl.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..13fdf57e57 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2069,11 +2069,13 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
     return operations.sched_id;
 }
+#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 814f153a23..b644347b40 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -72,9 +72,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = tb_control(&op->u.tbuf_op);
         break;
 
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_sched_id:
         op->u.sched_id.sched_id = scheduler_id();
         break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_getdomaininfolist:
     { 
-- 
2.34.1


