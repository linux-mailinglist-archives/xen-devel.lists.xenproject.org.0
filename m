Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E80B0EAFF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053311.1422063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTLE-0008LG-ME; Wed, 23 Jul 2025 06:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053311.1422063; Wed, 23 Jul 2025 06:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTLE-0008Iw-JK; Wed, 23 Jul 2025 06:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1053311;
 Wed, 23 Jul 2025 06:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ad9G=2E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ueTLD-0008Il-7h
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:52:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e4cd1bd-6791-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 08:52:38 +0200 (CEST)
Received: from MW4PR04CA0088.namprd04.prod.outlook.com (2603:10b6:303:6b::33)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 06:52:32 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::2c) by MW4PR04CA0088.outlook.office365.com
 (2603:10b6:303:6b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 06:52:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:52:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Jul 2025 01:52:27 -0500
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
X-Inumbo-ID: 9e4cd1bd-6791-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3IXC8+3dKd0MwFD9TS7POYwrBV9SOvIMKkvB+b7fYQYpsE9GFz+rNhVw/aF21UlM+nIw604x0LwtNruj03xbL4rC9nGWkRnZe+NOKqW2XCrB0ZtZfDS2pVFf5KQWCkDqGhrGuPeDMU+HCoqAv2r9omd4m7l/1xo0exFAJDYTO8cW3v1Ga1yqb9BVGt8f3d25177CwVJ7TCLnsRtA/l9XhijwbFbl9dFN96dNoBW96VbCwakyuUAeyBYGAtGFUl3a2+3yZxytPL6L8sl2SEDgzHc+VenZQvcootmlbxuysRUp7wetlXsTKfVBxDAmjrWPq1K6QgVWjyZuULPHSBZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB4uJjh2n1Vd5KQstRkQVBQiyrYFfwdIF6rOlkiPSKo=;
 b=vUSKid9bvnpUCRPLINyimkVIhEDVeLY85Rfgm98rkxrX8yOulWCAjaBlGTyAh7uY6vrmieZ1eaV8xSaXwvPZMiV1PT+oFyOYPJxHZJgPPPlnyGV9YntxXFP4xf/A/TQ5mlUJDzAQ8+5judTpOX5gzkWF74L9IuIWLKjmYmP+2KyJAuAqVASeCmv0fLn+nG8QMgrM56LYJWYOjr6sIDJaJt4ndlqih9wKUOMQthlDSanwQ/xD5CJGhjEPXRsvrU2OWpReneCqzTIilvQC3zKvcLk0pzE4ouOjf43f/EuCWWTpOvyEqWFjKPwvf6AIGGY0PJVLnS5LIE0PsZ/Qp0YyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB4uJjh2n1Vd5KQstRkQVBQiyrYFfwdIF6rOlkiPSKo=;
 b=O69FLEKq2TsyymHEnuHzxn6EMQfUOOr81X5lXHbNMa47ZS9EZ/F9FedXEbne7UsBPaAA1zzNPoDAl4X2hLYEseAfBkQ9+Ror9NZ6oMJrfRBa/GfSEbKR/CRH2nFBDnj7mY45xMKK3mdpVPapDnBGX48Y/7GY6iMuPc8ntjYRupc=
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
Subject: [PATCH v1] xen/x86: move monitor.o out of PV_SHIM_EXCLUSIVE condition
Date: Wed, 23 Jul 2025 14:52:06 +0800
Message-ID: <20250723065206.1451514-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9c0bcd-f49b-456e-6229-08ddc9b57ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|30052699003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uAU59ROkV16dqKNyrsNC6B8k3Vfa1yz8W7PWDDFQTYSRaLBwhlYplxwiuZL/?=
 =?us-ascii?Q?/B5LM7fMbvJrnIkmO6e1/v+WQJE/sjnZzTbDElIpN0IVeR517bQ4iJaitcIy?=
 =?us-ascii?Q?vjmeLExo7MPryeMU2uueHdLyUqA5m2ES60WUwrYOP7elYUsEOinENMW4vHEU?=
 =?us-ascii?Q?vGE0asFQjggl5xjxBOuPZ+seMICsUciGJ3So+jRCeNKDKm1RhY9LBfu6N5Ib?=
 =?us-ascii?Q?4QSAJe4zrNHogYbJ72wSj++8eScBGLmcDyvaBqx5b620xAhhRmIO1J6skRaN?=
 =?us-ascii?Q?5moRufyJR0+Ge09TFams9Z0PMBDHKhkpdGjercMDbXJntdz38AQ4L7L0FT5M?=
 =?us-ascii?Q?CikJ4f8ALjp0Pzz3FGcoJ2t9Owi+d2eXgZa7mJAWSkauARYBhsJpzKVWL1af?=
 =?us-ascii?Q?vJAVWO/TC3uVuLA0qXrRx7V8KKnj5ObtNzdtvv0a+8JJYcsmvf6TbKaxuLK5?=
 =?us-ascii?Q?2T1yGwc3FsO0RlrR+mVta4SEgeT1Q4y8gzdqn8CFFqsPSub8JUzShPgcBNPo?=
 =?us-ascii?Q?UmTHS5M1boLJ9Ap++NciXSdqJ8tVqwAQxZrkLrR6ImKgd+w1E5i+I7ss3rVG?=
 =?us-ascii?Q?3EmUuEBDCs89H0oE1zvN4q24fdrPx9PnRCKoHtaEOI4NrGQw2Q+HRXXer6QV?=
 =?us-ascii?Q?xkkDXAxSXvtHwSxlfG5jyMa4JY+czNwMkq9uR5z1I1JUJ8nXtrsqBPS91ziF?=
 =?us-ascii?Q?446NCYF1CF+6IHL2+ImBclQ9NGFdXUegPHxGVJI5I9xYK2HTmdnzETKvwxJa?=
 =?us-ascii?Q?nbW+GkuVxBbknNhndLh6q6hYIflGCPBjZnuzGdgaV/hdVQgwSspcO0QxbcM8?=
 =?us-ascii?Q?uGCeZSnvFonCdHlj+y5iLPqUkcTwW5iEKVaLXBHrJFYOFEZ+Bxdx17SujkFc?=
 =?us-ascii?Q?ZmWUefzoQJiPphahYOs4nwGw7Xs5O+szV/Gh/ws0TJxdC1JLqbwk+l4iot3q?=
 =?us-ascii?Q?h3yYSIX7kUEHDonqlSIZ0A5T+SnN/G374sbivLDND/kva7DtPony/b8qyhcz?=
 =?us-ascii?Q?j4JC25G8Okpcq2QftoaCvEuLpew48GWi0fctJjIVsS7+k91H+BxcOGRhBGVD?=
 =?us-ascii?Q?xHqV/r4YNfHO8TVICTga8YJVEsMY2njmkIW1iCQc7zEv0JV1qIXoX8fsWqIa?=
 =?us-ascii?Q?7p5KtDnbIAL7a0aGK6NHR7aOGx20CieTQ9kAAPilJcHpGSmXQEmw3lUnB09V?=
 =?us-ascii?Q?ido3ZKP/l1/86xzsw/UqgdmqqEzY1qSUV9UY3SClQgMPYgSPEtftt6Ug9dkC?=
 =?us-ascii?Q?S5XCfANYUeak+fuTGsVOmD2cy6Z5DXP/LLqoZidAk3+nqyOmQ2er+KbthEXJ?=
 =?us-ascii?Q?/0MX6vfwbC69aRF9uo8VNb8+evz/+8Y080KeH09JHdiwcfRbVN5PPc/1wnIj?=
 =?us-ascii?Q?GUxSeSy7ymFKGzuSFlHXif7cJnwc4UYUq8EOujxXMqBkdSO6jxmLGuWl5TnM?=
 =?us-ascii?Q?n8MXxilKD6+lZ6MVjXsKxVF+Hxho1kZj4UNAstWqJvf2LXcW/yO+yeVNeWpc?=
 =?us-ascii?Q?4THQU+HXL8wM8acynBZOcX0Fw9PE6+JIRtbP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(30052699003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:52:30.6690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9c0bcd-f49b-456e-6229-08ddc9b57ead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

Since we move "!PV_SHIM_EXCLUSIVE" dependency from CONFIG_HVM, there is
a chance that a randconfig picking both PV_SHIM_EXCLUSIVE=y and HVM=y results
in hvm.c being built, but monitor.c not being built, which leaves
functions like monitor_traps(), etc, undefined, causing linking to fail.
So we move monitor.o out of PV_SHIM_EXCLUSIVE condition to fix above linking
failure.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 8dce771970..c316957fcb 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += memory.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
@@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
-obj-$(CONFIG_VM_EVENT) += monitor.o
 endif
 
 extra-y := symbols-dummy.o
-- 
2.34.1


