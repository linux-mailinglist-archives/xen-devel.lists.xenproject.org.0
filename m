Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E8AF8EA0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033089.1406540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcka-0007wl-5B; Fri, 04 Jul 2025 09:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033089.1406540; Fri, 04 Jul 2025 09:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckZ-0007sB-UL; Fri, 04 Jul 2025 09:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1033089;
 Fri, 04 Jul 2025 09:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckY-0006x0-65
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:30 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2406::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853f5b80-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:28 +0200 (CEST)
Received: from MW4PR03CA0269.namprd03.prod.outlook.com (2603:10b6:303:b4::34)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Fri, 4 Jul
 2025 09:30:25 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::e5) by MW4PR03CA0269.outlook.office365.com
 (2603:10b6:303:b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:24 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:21 -0500
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
X-Inumbo-ID: 853f5b80-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFrGxXGoeRU2Yg/dvdpHU1R+IfrHlex/JL8Rtu1+xQkbSx+28vzFAwT4RvaI1aem7Qh0IBN1M2FyJGIAT0UhV/Yk9NxkNDdSUV2EdwFV+7fYpRCmrMRDJ2hw7l9JDje5na4oUMWwItmrLO9THoZfA4UIlpNhp/4CAm6O8fVweewXB104NBvYNr1aUdJAvVOr4VZpBRlRhfQjTTwB2O2CacZq1fPimyiKwhKjVa8bPJwO5uScwvnTy6E7/p1s/VrLhgq/D0ibZ+ln6YXPJiIyYLAdt+kAU+q5xjg87ExIjxubkKa3FDdMO9fKn4RSD/Qn2oJQjLXeuCs7yDqQHB1m5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=jhagLfU3jeEO0h7BkIAuuFv2isLSYRYVUpoXR3ZLnz63+C2ohaxtjGkE9vFDqHtztt++gxkP+qQlhjXbbtk3q3TvQ2LPAGEyRLfRpW1xGvfGFSbkDkn1eI9vRkQyYIIkI0iRIrNxwA+7B8VFs9Qnsb/RwvrpXajOPU4U1ZFCqPOjj/50NCH/bA4ErKS4V2Rn9YHjJS1p/O2CXOSrUWQZ8QlvHpi/Qf72Sh/6nweu+5C8jTA6HLZQV7814/fQ1kyBEZYIdst1fI95q9egIQm0+HPZpKyx1N2ruYtN6C65U5qMFybAHX0D2TH1ZgeTmZGa84FCHtcCrXjXiUXxHFO3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=yCxYlRmDdbNVpjt1AtF+GhQdMSVozaDs3/jKr+NaV6EqC2v2dq0k//OR0fWkDitcn/1seH2bV90u/+tEcXvO4SdAhD8ncAMkIbGQ/MdeODBb0V8gsHE/XbRxtY1RRyeHw6nXk4NuThFHQWRSIQVdZLgtELHbnAParOnT95cI7m0=
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
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 05/18] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Fri, 4 Jul 2025 17:29:39 +0800
Message-ID: <20250704092952.822578-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 192f018e-35d7-4533-a897-08ddbadd6792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YSIqVWlLbT7fIYkuxqgc/58VpGgFbCb/iXTWaHCUt313naXlbOYMWN3U7FnZ?=
 =?us-ascii?Q?vhWNED4sY9xpXONu96nqIThYRbxIKs2gTzC9BQ2owtthvmkuHyTqy7nURXHW?=
 =?us-ascii?Q?TMIuompzD25dEZO42rNzVXU9ijg3ZADp2zmqwFGXdj90n+hRH513ypI23OHI?=
 =?us-ascii?Q?74iPReUdGkTGelzPsmoljKU6eRM950/m9B18u2fyWKqHba3uU8qqCT1iPnNH?=
 =?us-ascii?Q?socXk7XjnXjJnRRWrv0bTqv+houoETWf6gRCKYb/ELcHrEraU0UnW7yIt1Td?=
 =?us-ascii?Q?1uZo6ZpWki9sYKgxHCsxT6B9j0fPnrlnb/uoXJlybUSrw+ApjqmYzIe+pgJN?=
 =?us-ascii?Q?STfQiXKYfZjuX8+splV9NioDnSoTi3RxSE8L19m2O7Rpydocdmoz77eGvYPj?=
 =?us-ascii?Q?VCs8ehSFOWMEi/1crdiIWqe4TYEF6RJ0dVG7sxH9IyiwtFnyl0QxOl60OsZF?=
 =?us-ascii?Q?XXrXBrMv2VfDvkDEq+2g8DUDxnUQBklRIrZxPPA0342SCVsrE7hOn3w9ynKz?=
 =?us-ascii?Q?sF/SgCgvQN+7hiNXpuTz84Gis2G4A0R2MiT+WJUISS6P2x7eLQ7jC0EQDQaL?=
 =?us-ascii?Q?35Qaesm9CmuvteUleAmdQXmXgKyBtkWqqeiB1v3T+OT98sG0kOFKLKzT8TlU?=
 =?us-ascii?Q?Os1LcwedVnU3y2xnzct2mtm77sXFwHU5L71hUY7vJIrnohMMEzu0Bc3IAPGV?=
 =?us-ascii?Q?5TEdowlLmahcbwWxQ/uqpe3kkF7AVXi5YiLtz2m0MiqSCdZnlLE2G3KbIEan?=
 =?us-ascii?Q?v2qf9ukpDt7XCXaQgclZHUJ0WhZiF4m7vlC7M8J/+TM0v+fmYOVdS7XkgsTN?=
 =?us-ascii?Q?QPHKiuc4NpMXK3jVIITPrdoRMZvTTLkxBvgzq6RPA+4oSZESO4XjYDo0U4zO?=
 =?us-ascii?Q?qQj4xrjFWTA69q5tJHIeaeTH3lL2B9xEL1pjdqnBBj1pkt18uqXUxPS4jpaa?=
 =?us-ascii?Q?oUxxOVz3N47vXkPBggybprTPWorXAYB2A4Rij9gsNlqIvUE85K1xpIqV12GE?=
 =?us-ascii?Q?rsZNO1yXSPHVYzpt3gWwZuV0XktNYQnd+/cgOb95hhITtXK9teUzIlzA84BK?=
 =?us-ascii?Q?Z2f89VWETt0JiTxwpNSofq1nRmhCH/FgI11oYDRG/hsU9/vrwJ/yWgNv79pY?=
 =?us-ascii?Q?DJCqL3ZUdTNt0PZBhWCghg+95V5nuxwT3jbMWhqQwm8nnkw3xrxh9TH4aL1C?=
 =?us-ascii?Q?x4kbygmlNuBEFe1VT+eVYo5/aGFUjMvqX2sY89bvMYaAR8+YdKbhRBVAvn6z?=
 =?us-ascii?Q?OveaIDx+U+jMs5TNo/sqoQyd2Rq5cgsEmHOEejlB7CKlV47nJs8sEGhFkCgd?=
 =?us-ascii?Q?5SCCawdNfelttxBcxIFSzF8EDkrqVLI0Gr2BTJHHoZcOLbE6iaTJCBkc/JGE?=
 =?us-ascii?Q?zsmMrphDL7XQvCXMqPf7TFoTt4CkS3Dg0HvH/ASaSaLSGN4LWiEBkkLBy8tl?=
 =?us-ascii?Q?N6nqe2OgkqLvlyX1+VEJf2jS0EHw/oDy8TfeqDD1kFgbYaw9yWSyvqXiCTJN?=
 =?us-ascii?Q?iFnG5MDkTyQKHJScd2qHLn1Ejh7rDmgP66fF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:24.3339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192f018e-35d7-4533-a897-08ddbadd6792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110

The following function shall be wrapped:
- scheduler_id()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.34.1


