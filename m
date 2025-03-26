Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F0A71040
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927012.1329858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhx-0001Eo-Ck; Wed, 26 Mar 2025 05:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927012.1329858; Wed, 26 Mar 2025 05:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhx-0001CJ-84; Wed, 26 Mar 2025 05:53:45 +0000
Received: by outflank-mailman (input) for mailman id 927012;
 Wed, 26 Mar 2025 05:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhv-0008HQ-Sc
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac0ff53c-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:42 +0100 (CET)
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:53:38 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::13) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:33 -0500
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
X-Inumbo-ID: ac0ff53c-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgP3jQfmGdZm3e1SMjdtX3qt/GooDXYTpzRwACFE2opwbTlqHumG4ZZ6qKmitiAtEeViwdRzkUrqVCWbaer/IK+whQX/u7aap5sUNmdWOMzWFBOV1ZgeJaXclgyCiYj6qct4fnmjmvT8UPOoFFHqfE4jyleIcicKFabblPwMlKJIzkWNnG3gLsnNrIc5rS1SlqzgWARSmbgF7JFLvXD3cYJI3VKCgnou+RoDhhLbPNw0I1fWqpWhhX3bpPZTh3ufGR7RApWPLb5JiBR5jKJ1lsjfQGT8CC8PmajTCRgLxYkF3KuwviRs8A+NvGtsEzocdVw+HpSprt0pay5HO5F3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fahbkFRvYWnR+Kb+Lv/kbd/si9rp9S/2unBDtYoWV0A=;
 b=xB7BYrUPbQ5P9StqAK37G7QITlh+6wilB1F96rIWjSQdoTco90YT7w8HxMY6ar90WVFDhoX8HG0V5Q2corORzfJ+YtEcvOQvfcaX7kB7cBwlGCJ/q7L15yC+BSIsgx6utZsO71J5D6tykOC+N98jz96Zr2zbg8YCeQQZOk8nyXe7r1x5zIouiTljkJTeTCMujGRFbajiZzBo+2f1DoLt9Tu8gOV3pl5O7x6bsji2ul4b36yNaMAdnHBxFl851CCjerBsF7y7tO2l67HTHsfKgFrAlbMiEBxIl6kVBljhf/QRFhEEcGy2o6ky3vBGOXRiGWEiMfz/3U/tfuGEW3QRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fahbkFRvYWnR+Kb+Lv/kbd/si9rp9S/2unBDtYoWV0A=;
 b=1NYXS5pk1htU7lbD8AdItE7oIOFI/QlCteGP5IgMEcgxILxTWfpWXtILi9KLaP3b28g6UxR3hPRiX/RyLvNsSwdPup8lVqMOxILbjFdSwqe6XT2u1N8JSK7u7PZQ4oIS324ZJzcOZk1IHYBBm2NaY4rEU75lcoPbWe6+B78erzQ=
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
Subject: [PATCH v2 06/19] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Wed, 26 Mar 2025 13:50:40 +0800
Message-ID: <20250326055053.3313146-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 0698e460-d0c8-4e53-a1f2-08dd6c2a8dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W+r8FRfO73ZSThMeRSZnMQ29VbsTKmdt/kJzRhZRUnrBdJNU+9xhGmNd3Y23?=
 =?us-ascii?Q?REk6w6VzalQK0BiHv9R42zIYpOKRcVhrwPo/UicAoIPX7ny8CWI70wxoTaZa?=
 =?us-ascii?Q?NrnVBXmPWfoVVgid5nkvitKzZR3K04jvJaUOXUpuWZ1Z7I6ElM9bthUBCnoh?=
 =?us-ascii?Q?2xtZgwjwd661eFJEmKkiacgq32DXx+zKh+AjqMGlHijHo8OI2Ozg0Y8xbl9w?=
 =?us-ascii?Q?uo8mpEFACwgriAHingO3B1o9YyXbAWGYlnTTzLjdB+VPezz552ykEIzcbtfr?=
 =?us-ascii?Q?GcHCPwP+XN9lDcujTBcVb6UhEh9908Nf9S9XbutO7cqLVjMTPY9YnPDw3Zet?=
 =?us-ascii?Q?aU4Dla6qeFvE0jRAQxMbsBgf+8LKg9Nanw18BW9Cdg52RnmNy1zI1+uaGk05?=
 =?us-ascii?Q?7XSKysxAp+CsKTEXwDGmCuoU6GisD3+sAfVnte3rnBkFdQhxyqIYU63pppAl?=
 =?us-ascii?Q?4iwgh3+WATeUX7G3ssUSgHS0iXk5cVnlMwrRyHawPgArpzeT+TCnJ9BCgqaW?=
 =?us-ascii?Q?RSQQAjHzZC5843Y8OHZ0XFq6b/ZhkyzGAS7LNSkxNWXrmcX0OaARAA2/Ht40?=
 =?us-ascii?Q?W7Npd5see8y8UdM+Fmg/eh1VgTCPlBQhBRMr67ERNHbgYawQef3yYQEiPb7a?=
 =?us-ascii?Q?8jHn17fWcWaps6rxjw6iBZToUVUGFYhbzGwl9Ux24/qO/fUP4tH+nM4mKnRC?=
 =?us-ascii?Q?DXbpihM4gOdmYbmtxSQkHSJQ/+25Liia8vkJu3elKALR7J8c2EHZTzrLIjc1?=
 =?us-ascii?Q?QRA8GtF5goXcLcw4GoPaEEJVNb/vYwmqxUEGaWcmY4yp/z/KqR2TupI0y4rS?=
 =?us-ascii?Q?tQYMArbDGfE2DPnyX3SzOVwTrCCc5ADwD0ESUnlItMQ0wjaIJ6evnPCS4Do+?=
 =?us-ascii?Q?We8Yt8hhUdQGua6Ybf9hfJ07DRFP5k1RlVb76G29lat04gd/n9CcT6Y/MH6e?=
 =?us-ascii?Q?shYtUo+UTQdZE15o53Jn1FjhbvMlQFH0QUpycVtgZR0eMLcoiduMhOwheul7?=
 =?us-ascii?Q?W+FKULURbImzHdu87PbpJsjjAqXL8GIyJyWbCpWKbjG8+A5rM8ZUEqj7QqC1?=
 =?us-ascii?Q?MDXj4DzO0rxsw4yK3NvyakOuUT4EDz/4tTtnIc10pvSczs0RCOZqGrg+IBxg?=
 =?us-ascii?Q?8M2RfkBoBRZEYIlxw5oey7ibi0SnHj0JUBmneaAiSw+sBgCCNluSDOpLHtN4?=
 =?us-ascii?Q?lC37LwQSIKJnX8RETH6GlE+gNNHRyej+9u+MSfOeP6Vb/m/WkktQo3aETgX4?=
 =?us-ascii?Q?eRmw0gaj+6vB3X2YFXJYh+pXKOTlBxSoUNe5yVjXLr5unpEXfApQrB3fege9?=
 =?us-ascii?Q?fstd09asnSXdV2hXT6Dj6q26g+tHAsr6NS718kXSRhHgorodpFMQbgN3Na7m?=
 =?us-ascii?Q?jyW2nXOAHY/ZoSyNJLsZJ3ngXF2uz0so5gGjQHJw3hZ0iCYHDM/qgh45eydA?=
 =?us-ascii?Q?sjOwfQJ+UFOnKxoIJGCQTycFeLvkMy3FumiCbNq9N0IQCTXaJuy9wVJxuelc?=
 =?us-ascii?Q?5xejYatc09h57zA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:37.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0698e460-d0c8-4e53-a1f2-08dd6c2a8dac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231

The following function shall be wrapped:
- scheduler_id

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
index dfc87a2846..c3646517bc 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -72,10 +72,12 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = tb_control(&op->u.tbuf_op);
         break;
 
+#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_sched_id:
         op->u.sched_id.sched_id = scheduler_id();
         break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_getdomaininfolist:
     { 
         struct domain *d;
-- 
2.34.1


