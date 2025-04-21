Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61327A94D4C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961011.1352675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljI-0001Ph-Od; Mon, 21 Apr 2025 07:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961011.1352675; Mon, 21 Apr 2025 07:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljI-0001NC-Jh; Mon, 21 Apr 2025 07:38:12 +0000
Received: by outflank-mailman (input) for mailman id 961011;
 Mon, 21 Apr 2025 07:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljH-0007m8-43
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92276f3c-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:09 +0200 (CEST)
Received: from BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::6)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 07:38:04 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::94) by BL1P221CA0036.outlook.office365.com
 (2603:10b6:208:5b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 07:38:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 07:38:04 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:01 -0500
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
X-Inumbo-ID: 92276f3c-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/xHelMs1EsbXpI6QsNfIvzryL+EuXW01gJ8TRMi1TShYPGGwFRNtaUg0pqKOHCNIA7CbNYDgPKlK/a72LKSgaAHMVdy/Pr40J1yFZaZYcPqnPGQ+/crPE5+bVnUXlW517J5X1OkoVHcCg9C5cqphlh8nw3GqUZxXjSqxSU3aEZd3YtWDEoBmeZj7cG+uWIblacie2FtnvvFYFvOFaVyQV0aVZuRcfHgAy3c7bRnZCL8XKcbBk+jhEt9jNKJiULUR1xOZcMW/LhV/CgYcbdCU+HEwzD9XZaLD3dzazXrV+ftwhqpnw+BVDbkpc1iO2XaBiE9QHgSiMfSxPD6DMa1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtqepNbzG/v0HEc0GM7qbXHNRHLGLqkNYOLvoJlXcTQ=;
 b=Dl8ujQ6dwkQn9CnSLPtf5dJVlMlqE26QnvrvSR49s0eMk/j9yJhnanr2ih6AhQ/MCY+SkiX6+o6B5JpUqahd0MC+XqP89EkiCKvavkMBHhLISrlKdQ+ioBQzZpKf5upjrN2lgQDpKK8Z/Un5LeTGVZD5dOh9gMmiM4SaWzPYiNQrHtNLN7kvcsqpG7o8bipS0c8Zx+ugGyIcXccj85gIjiux61vEH5aZSpIG6smiV7A+xqCEIhWUxPkgyuvj6OuOLBP71hK9SBWBIMcywWjKRVO+RvzH30Y4LORimSxdguPObqXa2ZaoHaZmtVYBi3WlJQYqM+MrR/LZa8UIuhCeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtqepNbzG/v0HEc0GM7qbXHNRHLGLqkNYOLvoJlXcTQ=;
 b=ZuunVBZePe+ApZXOCVPVLUOKQN24Nw6MTabINTBUIiQrw8qN7MuhN08GY6uy0Ok+X9dhvhblMykgnhQejFmQNrBlYCxARvFfPmE7Qq/2FngIZLpQyMtTfASonJdoLGGE0uq27MvXEYGyUTYGvoVUJsHCycAkH7LfKrrOfQxJt4E=
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
Subject: [PATCH v3 07/20] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Mon, 21 Apr 2025 15:37:10 +0800
Message-ID: <20250421073723.3863060-8-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SA1PR12MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: be46c09a-519b-4835-6d41-08dd80a773a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1JmxELVEzI+GukZxogtyohaLTnzTpPG4XL32+UNF947Vn0ZHmvVMOHrkQtx5?=
 =?us-ascii?Q?2Kn3GYkZrl8N5q4oX6hWIuOMHEzda6fzYxXevwhnovdqB2T0/XZLeCG8LMCg?=
 =?us-ascii?Q?yNuyshAKydo8I2XLqlOCK/SBxpEokVxkliANbsZ6+gYMWM5CSPHkrdyA6WhM?=
 =?us-ascii?Q?r6fr5JpFt0pZN6DGMUiTrTgIVaLCJpPP1NjLGlhyhNMUbEjRXKwpI3+WxA2L?=
 =?us-ascii?Q?VDT0W/0NiSxCRB7oLV1BNgLNp2hW+OZLnnV5wtLiSltNbEWWSS3g8v3ffjo6?=
 =?us-ascii?Q?8zhH5P6BAhOnU+b9l5hRDS23DmP9Uy0Ywz75erlbn97WRhAeYJ9JNC9EIQ4K?=
 =?us-ascii?Q?8QPW1u7UK3rtBIE2s2IzuaLXSi/EYyBXHAfAOe8omBAzPPet86AuXkxoFZ4g?=
 =?us-ascii?Q?RoaXgub5CuRlKeY9QRlibsCFmBs5njgLqiH1xvQJxxZHh5B6hq5FY26gVkCd?=
 =?us-ascii?Q?A02TGgL/Rb1PpQKSwv/Evg8eb8H4ZmyCzWcHK60Xrp/9ClV/LMxhvR1K3WYG?=
 =?us-ascii?Q?LQ94QzG6dN1Mx4Sqj9ELHwGgVFCCFpMNPppZsPx7lodE+w+/K1tBd9cmaWmu?=
 =?us-ascii?Q?67n8WM9UqNe6c2c01Cwe9/xy/4uyFrdEcXB0x/h6rfcmWpBSm2MLT4+sKm29?=
 =?us-ascii?Q?kMwU7HNBEH4rpihWcoJ4rVgI17UScob95qsZKqqNYJbW3B3ZV+lkctS2H+cO?=
 =?us-ascii?Q?eckaO7v3aBeNIHsoAE+Cq0DtEabmvdYIQMujlqZm8aiDjOJYJE/2C889B7tz?=
 =?us-ascii?Q?IVulAkA+gmtWhzMy4pEJhtrYuEJhT3NPjbQU2z/P4ETtIPjj1/rc+X9DVeY4?=
 =?us-ascii?Q?1HNAqG+U6gIvjB6ClJb4qo9IIePdAbCT6P1D2u9+45RcppftuV59ojtcTIpK?=
 =?us-ascii?Q?Grimym6b6yj8sL0RQ4yyVxGOsUMBMmOHGqvBG6ARjCXn9VftVF8ZNsOWb5Cw?=
 =?us-ascii?Q?ARHhiwqvP3S7/5X8P1yUxl5Y3K2YOVJ+bR6rmMXucOJsqn1X1eX98N3yIrrT?=
 =?us-ascii?Q?Bi/QgVSWczhz8nmXu4wC4NhEL7mmq6JzPLUJtKWR/D81y78xXHcE87y3OXE0?=
 =?us-ascii?Q?BEgrFYlHrEbowkqHl3dTCBQxQfe6gs00c0BBtAt/mLXbF90RnZqa+lgWxPTA?=
 =?us-ascii?Q?Ni4WcsE1H95ny0mVVJioN/I+qhWBBoicrDwsVJveOozkNBi81Sc8M388sSEe?=
 =?us-ascii?Q?N8Q0lkr3/ir7y8zGa8HSSzGnjwjoH5wo9CAPEl54c7uhwORgKeispsCjMlFB?=
 =?us-ascii?Q?BsngxJ4DxWdVPPCAFxSUmUihJAZSpBp7AsSJLcYBGOMT69eZ20VgYsV0fwAg?=
 =?us-ascii?Q?RNwjQBnJo/eJIF1FVZJfksBZa+iWSjGP92n5x2FDp56NUR9R3Bi3b7NLVgCF?=
 =?us-ascii?Q?Jf1+vBFfWp5SjiPRT/TQM2tSqqHLN2ZwdK1Jxser3o8BqZwzVQYj2gx5EsM7?=
 =?us-ascii?Q?biDYjT1wlcpVl+be4EthhS+DHC6ICMOGHsAkw0x9EQMQV98Qmi3e7Rg0wwtY?=
 =?us-ascii?Q?TqTYAi7Grz7pr2I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:04.4033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be46c09a-519b-4835-6d41-08dd80a773a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/perfc.c  | 2 ++
 xen/common/sysctl.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8302b7cf6d..0f3b89af2c 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Local variables:
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index b644347b40..608e159571 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -117,11 +117,13 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
+#ifdef CONFIG_SYSCTL
 #ifdef CONFIG_PERF_COUNTERS
     case XEN_SYSCTL_perfc_op:
         ret = perfc_control(&op->u.perfc_op);
         break;
 #endif
+#endif /* CONFIG_SYSCTL */
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     case XEN_SYSCTL_lockprof_op:
-- 
2.34.1


