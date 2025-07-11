Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902EB0123A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040354.1411789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R1-0003Qb-Bw; Fri, 11 Jul 2025 04:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040354.1411789; Fri, 11 Jul 2025 04:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5R1-0003OY-9A; Fri, 11 Jul 2025 04:32:31 +0000
Received: by outflank-mailman (input) for mailman id 1040354;
 Fri, 11 Jul 2025 04:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5Qz-0003OR-Sc
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2415::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a787fd0-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:24 +0200 (CEST)
Received: from BN9PR03CA0529.namprd03.prod.outlook.com (2603:10b6:408:131::24)
 by IA0PPF89A593F05.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Fri, 11 Jul
 2025 04:32:21 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::1e) by BN9PR03CA0529.outlook.office365.com
 (2603:10b6:408:131::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 04:32:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:15 -0500
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
X-Inumbo-ID: 0a787fd0-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk81wSZCasu80tlPX6xwTYWUqRUFnzaDwNx73dgS0M3b/zCeQskTLirbdLto2sTGwwDe/lLcRURk9/FXe9O6skXfqVfhjZcrCYdpEDqJlij58aIIUQEpRVIQFkQqDViShiivkDWKOwh8wNpRAdPejTxARCluc3NzTrOUxumygzd1lVnSZM6JEwNMiTPCKyKxeHwKbi+MVavb+r7PDLMInRScOkrZoUNQvx+S8stSmIgS6u1Nqi6t2UiIYpGxME+jU3cb7Vf+762xmJgCGr+nVec3G+3PhwJwfI3PEzWar9W53z2GFrPNZZDHjHg/Vs7wx/sMc7UdCv+eC9A1ZENKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn+hbzleANDErUWqs0xWJJj38a3ZoCgEf6BMYVjfmIw=;
 b=qBUky7n6wX3V/AaPJFgh60mvsPDGdyT0uZsuKeWeXE1mD5gcBT9IwY2WldnC43T7P8It3AG6UhYK5DbCZDky90HqX1UybIBiPbL7eRo/SboDJKug08hFY+l4oZXqgbwUt2Aos3cbwm3pJp/G8VdzMxVN4TrXvXQkSy7zWSN1uwuTHKJQBwi6+73SQau7i8WPSBd4RVijtF804iiN4/RUiOZH5uV0K8yhpuwZbiCRu+huLc2Yer+ddmQP6VmnNE/KO20jkWAt2dm6xWKZIKsRPlFTdVa50jbF5/MJrh2Rt4kaGj/tSMCG9PjoDWKiq0qUS3tdHprmBt4tzwNe7HmRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn+hbzleANDErUWqs0xWJJj38a3ZoCgEf6BMYVjfmIw=;
 b=Ex5e5jZDeA+VL1VIu06+3WEOqrG2tUDk65gr8qMd+DQAQ3+b+mxWfx5K2nyQPbW/aQW3tQxGIkj8dEwzmJk3YlGXrFQxr1IUZD74AhjQhXvW1ybol8+9qrPI9hVxI1r29Ocve36xeJwRTJwE3mQyivo0tA5ANvA4TtfNHPV8XIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Nathan
 Studer" <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v8 0/7] xen: introduce CONFIG_SYSCTL
Date: Fri, 11 Jul 2025 12:31:51 +0800
Message-ID: <20250711043158.2566880-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: ad329d44-e7b1-46d2-d2c7-08ddc033eca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOKtfmrUK/8QWMhw0QPXy3IBXJDCEJqlSGj/mhYnUm4U0uH9xE4agaeS9ON9?=
 =?us-ascii?Q?32C4+eWliWG7bG/iFucERBC4Tm7Y/9YINyS4p9lAaD7A5gvLXh+npux5l6In?=
 =?us-ascii?Q?4HhLndL4D1IPDB/21jRd2bieWWs3M+5HyAXIfiuldgBBnaO1z1ivstQ8BQAU?=
 =?us-ascii?Q?i4vDxgI+yaW6KiLYl93jFMpeAamaOoHo4cOIQbxsh0X0N5QYOQJ5Cs4ZpsNu?=
 =?us-ascii?Q?xX6ZcN7faF78k/tOvDlKG5fAfvPYpYDkYLMtlGrgeyMGroVu9ZqtkYkeSPSS?=
 =?us-ascii?Q?JVdy3+MkDeC1ifXLerg/gJYF0T6/4sRkHaOG9IRfjcuAJqRdvMFC6HIuoxUb?=
 =?us-ascii?Q?rhALL+aFmY+u/Z6b4wb+Cli2MinP5WxjHA79iuqEKr8hzhAKYhzsbTyDUsG8?=
 =?us-ascii?Q?tKy7mfmFgGvcIm+bqWqdjOx6KVgC7SSvMLGm5yvarCgvUtu8aP6dzdY8P9hW?=
 =?us-ascii?Q?FUnDAyCAh68GSiiNzp7/J0nl4LfE6IWBmZt+nuYxqPNGJ9FZSRpTZcfaMBHc?=
 =?us-ascii?Q?EyB/k1hQBim6rsNy9TUEnU2OkBn70zBzSH/Kmbnj8U/i1/yUgpf9qc7MZNKz?=
 =?us-ascii?Q?1qo7JZ1YLw3fQLOsd+fo7HnHfoO/qDKyQnfC7qYPD3L+7T1dYedRRTCjMuZe?=
 =?us-ascii?Q?rXP/ni5GizTTujk6sutB8o1Ch+7nfNv5n2tqpsyP1UfaTIRBvPW4n4IudirK?=
 =?us-ascii?Q?X3oQN2cOVESyY5n05zrYKIrUuI9c+mfCmbe2289JBv4JxuQc5VMOmNAcYGqj?=
 =?us-ascii?Q?WkX5NFFMD9gNDc50YDj1ZAFr3TetrzyVpgO2lqUBa0ZjPXhQit1EfVnqKbtu?=
 =?us-ascii?Q?AJzrEonsxe7O5PgUqvFbwjC6CC4dxwPJeo1DiAUQ2fgrAJ+NOTNU6L+EirDY?=
 =?us-ascii?Q?//vCmmkd3QfEtDFEMl5FKk9byFhM/NlZ5WsFeK+0nZeTsCAenwxUHIXEVek1?=
 =?us-ascii?Q?IqG7rPMQf4EfJgD36Evl7xmA9Mm8hQeONIWVijyl4By8FLIgayYoZUJ6uiEV?=
 =?us-ascii?Q?2iiRlFf3VMFQfPN+i78/WKkOadHcCjM9HMM/xMDt/8K1cUK3kzCiBPwHDMND?=
 =?us-ascii?Q?2AzihImeacQjUHWcsIK16JZK03A8hPmSUF+4TQagQikq4FZ1gyyhszMKfKrc?=
 =?us-ascii?Q?UXyo3wKDjwVZ0U+VG2vB31EyD4fBmo++hv3GfmcN0/o9dUPKbr+Bv0dFk/DE?=
 =?us-ascii?Q?OU+HZEkhzoSwpIbqno+cecRowzoED41jdBSi3F5oqUG5y/iXEbL+8fmCt9GB?=
 =?us-ascii?Q?cOYfXyhdZoTgry2k1uBV+eD36WZAHV/wc/2P63qJPiIsZBAi4ndu9/xTcPhJ?=
 =?us-ascii?Q?Za0HNjli8H1lPjJSj0D4mfuXJWkmCJzLPYf2fEqurmUV1wYjtHAh5zUJWr+5?=
 =?us-ascii?Q?3dHJdX+Jovy0+NC7w7fakRvfaUys39tskVI6X2wioF/InxM30BecynTrUzrR?=
 =?us-ascii?Q?+hpYCNx2n3M5xdBRQcVrQ0DUDo3WCNI9FJTDVkGSF6WTF8xuBfK4bCuCnp4+?=
 =?us-ascii?Q?LgPXwXhdru7DKHB5nFHduIdSiFsPQ7If3SIC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:20.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad329d44-e7b1-46d2-d2c7-08ddc033eca9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems. Each hypercall has a separate option to keep
configuration flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
options will be covered in different patch serie.

Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

---
Commit "xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"" and commit "
xen/sysctl: wrap around sysctl hypercall" shall be commited together.
---
Penny Zheng (6):
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen/sysctl: wrap around arch-specific arch_do_sysctl
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"

Stefano Stabellini (1):
  xen/sysctl: wrap around sysctl hypercall

 xen/arch/arm/Kconfig                  |  1 +
 xen/arch/arm/Makefile                 |  2 +-
 xen/arch/arm/sysctl.c                 |  2 --
 xen/arch/riscv/stubs.c                |  2 +-
 xen/arch/x86/Kconfig                  |  4 ----
 xen/arch/x86/Makefile                 |  2 +-
 xen/arch/x86/configs/pvshim_defconfig |  5 +----
 xen/arch/x86/hvm/Kconfig              |  1 -
 xen/arch/x86/psr.c                    | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c                 |  2 --
 xen/common/Kconfig                    |  6 +++++-
 xen/common/Makefile                   |  2 +-
 xen/common/page_alloc.c               |  2 ++
 xen/common/sched/arinc653.c           |  6 ++++++
 xen/common/sched/core.c               |  2 ++
 xen/common/sched/credit.c             |  4 ++++
 xen/common/sched/credit2.c            |  4 ++++
 xen/common/sched/private.h            |  4 ++++
 xen/drivers/char/console.c            |  2 ++
 xen/drivers/video/Kconfig             |  2 +-
 xen/include/hypercall-defs.c          |  8 ++++++--
 xen/include/xsm/xsm.h                 | 18 ++++++++++++++++++
 xen/xsm/dummy.c                       |  6 ++++++
 xen/xsm/flask/hooks.c                 | 14 ++++++++++++++
 24 files changed, 98 insertions(+), 21 deletions(-)

-- 
2.34.1


