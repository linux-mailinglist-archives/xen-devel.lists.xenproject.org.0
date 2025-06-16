Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59EADA886
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016575.1393506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3fy-0006Ui-Jc; Mon, 16 Jun 2025 06:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016575.1393506; Mon, 16 Jun 2025 06:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3fy-0006TB-Fs; Mon, 16 Jun 2025 06:50:38 +0000
Received: by outflank-mailman (input) for mailman id 1016575;
 Mon, 16 Jun 2025 06:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3YK-0008OL-DO
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:200a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199c6a8d-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:42 +0200 (CEST)
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:42:37 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::35) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Mon,
 16 Jun 2025 06:42:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:33 -0500
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
X-Inumbo-ID: 199c6a8d-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqoOZWl7Z4nPqR1AKooQiOfTQ/zmTQDMb17XUv0gcPJG6ed0/TfNQfvO/cxgUjO/pPf5U2gJvjehFQrrG3tk0pDs3asdE6tYBOaWbDX3PDaFQVxZGDsZ4NXoTQ9ALu+pbbifnEk5vBnopdjdjx4n76TbEy0VnoNee7G7SlP7uLBf1d+AFuDYkM+j4gjIfmR0F0B/Fzb315abRnWUFMk0RgMDof+2zZo8yo6RrVZeo7ybepf0G0dWpXRfNqhHzpuj/qgmznlT7z6MoeyMlPpcj9pKt/9I1wxZMUmrCrEz9bOYPdg8quv0HUyoIC+/t1PEinOO9Zhs+JfU9Xys45jIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35yKf3d5uTnHBVPeuSh9Vu35IJaCNYT50NKMa26ijs0=;
 b=HeKBuLv2T48qDcBrCKpmOwBTWTOh0EbClCBrvVaeW4E74KCxJaY68smX9a+6VPONK7zxPInckUYILnAieH8c9wL3a6QatUz11NKUh2EYe4Q1KjHUcLpKb3qgnjhBoBYwSmVNaBJWpeSDKsjDcCKcM1tHpq8XJGFfp2Oi/yWax+PJySj5nzokYo4h55NWXc7JG+KkL9+9vLx28WWHB4lqLVrWRkyhrIeosUsIWbqK3MBUQXpw+JGkHPPXymoxZI1nBpRap8Fve5dHvFMBdpyoZfPhSEANWzbC71x5862C4W2rWwqQL/XdlRlJQ2chvg8/nnbKXUYcxjIwH55qzxcJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35yKf3d5uTnHBVPeuSh9Vu35IJaCNYT50NKMa26ijs0=;
 b=XdEU2RZBaHDlOvEZQMALMuadRrMHetqlkQLFFzK+RDe7PQMtNXUu1A9KoirFrWNsitEiKca7bH8er3eIEyZOPTivrNFpl5lBcIxxRQLpzm0hKGOzS4+/Na+QhU+5z021IYOJLiSKfiub/HmLR0WiRuW8mLcJ5iFH65UTR+E7UhY=
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
Subject: [PATCH v5 15/18] xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:25 +0800
Message-ID: <20250616064128.581164-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcc1672-6056-4d90-6681-08ddaca0fb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uIeqRogR0GTLM99ELaLhwSw0Lng3zbltsyQPx4c0PHKDOM5ver6YNTRfD12r?=
 =?us-ascii?Q?NMYb/dRUatiwZhFlbwmeciPmORB7vhIeRE+eytN9oecDSMRcUhoSBKB+g7NW?=
 =?us-ascii?Q?eReNxzouff4KuJ1ATUiDCXFv7nqbf5/N9GiyfI4fRtWdKDf27tCEZgE3Yq+x?=
 =?us-ascii?Q?5KwbqDlNX/bhzpeh56p0LweemkS05kaK3/YJQ8qhtmvOiuuFhp4QKf7vgels?=
 =?us-ascii?Q?/EW69ud24KbvunNp0wwFMmEjE4pKiQUwldsBZmzJ28pz2Vabx1U3NsqPlRie?=
 =?us-ascii?Q?SWemtC93VZKa9EN4fF/vnrDzjpO1P64RURJxieLYX2Of6EFuKz88igKiZNr0?=
 =?us-ascii?Q?c4lDlYSJsP99KandwA0ZaLZG092IJ2xGV9xZu6+8XCdRgb0BPn1QS/QS3xi+?=
 =?us-ascii?Q?bMPZbq6o9kE/MwL2rrfgNCFRe+NpwzgIzLfDoFoPNvcIOTUmaUMA2wx9r9Ia?=
 =?us-ascii?Q?xmGACkGKcBVAbImtDdZDF1nt+Vx32ULSncxAKbLWGwmE7RrM+1Hc7vYwVmDQ?=
 =?us-ascii?Q?/p+m0947+YCbWwMFDeaF6LCQJ1ZkfrtujbWKNoGGskJ6UEahBgyKWybUYeze?=
 =?us-ascii?Q?mLu8ZTe6N1LKhhzGdnfpd/NwwKUmKOLgofWptxSeOXF+g+d2Y5T/Ont+A9kG?=
 =?us-ascii?Q?xJsaLlgoCQ4p5pithDhzmPgEdqxs17cMCFPVvbHsiBZ27i4MEGZcw9+JoCWl?=
 =?us-ascii?Q?b2xukKXLRzKNpmfVKsK1JhM+TEbLpEIkKDOnjN9R9c/ipZZcyg1D04NWWM6o?=
 =?us-ascii?Q?S5WJ9ZTgCa2oaHg83GK4qs1x7wVeBxm0bPOCT5yJAScHlzGYjn28GRbWldqG?=
 =?us-ascii?Q?Wa8d4fnfceDAv++kzMJDqqKN8+OurEnfS+wHj2FxuDRWmDQZaO/zYxbULsTz?=
 =?us-ascii?Q?Ywf1Ad1NAdFPmlxRbenvz26zA9XZntghI+l9VWgPnhzdXMoNjhCkCz7YBnSs?=
 =?us-ascii?Q?RjIbRnTx7PZNckvCJSdlzx5IyVOHIaKG+TjRX/ZD4zf+KljS19KC0ShjyxB0?=
 =?us-ascii?Q?12MROFfVDXdTgxp4DjbVgw7ZQJ93acb1uV7TT8tnYJ5wG6hLyBXKe53PpPkB?=
 =?us-ascii?Q?u6zX5UjuvyuUrG0tsk0DOcT0Y3vf7k8jIO2CO1kr6xVAtuf6WT7pTw67tfZI?=
 =?us-ascii?Q?MNp7VQwEx9wZXZn+pKnVtsCG3zXGe3VfnKIuZUY1cvYOrV34Ymu0YutRc1cU?=
 =?us-ascii?Q?b6WW5YxutO0tF6j2rZt+p4945Swu27wKVFRkktk/wZ8MK16ZEWifbJd0W91u?=
 =?us-ascii?Q?06ZuQNh7nhXwbqG9nAT0XXTUAB9g/Ujsz2xoQMGFX1Psg/MJrVFTGOiIkLut?=
 =?us-ascii?Q?l6Q7V+giF4JjqO4pX1/sA0dMJOlobj7lJNzgN75b4St56cnjVQFnywXv37dl?=
 =?us-ascii?Q?0vfz0z7Ca11rkZ+JdTN83FVia5eKGp4/kRDyff5P1w5G0Gn/eYI6KrcZPtYW?=
 =?us-ascii?Q?nmYHiJRkZri9BhRibgL3TLbcYt0ad2bem+BNNhfsfW62GuY0AsU8isgIjLHO?=
 =?us-ascii?Q?FaEI5Avlgd2xLmpC9jiTqkp4l/Sluv9CTQwM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:36.3873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcc1672-6056-4d90-6681-08ddaca0fb27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881

Users rely on SYSCTL_coverage_op hypercall to interact with the coverage data,
that is, according operations shall be wrapped around with CONFIG_SYSCTL.
Right now, it is compiled under CONFIG_COVERAGE, so we shall make
CONFIG_COVERAGE depend on CONFIG_SYSCTL.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
v3 -> v4:
- commit message refactor
---
v4 -> v5:
- commit message refactor
- switch the dependency order of "!LIVEPATCH" and "SYSCTL"
---
 xen/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d14093017e..38a134fa3b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -37,7 +37,7 @@ config SELF_TESTS
 
 config COVERAGE
 	bool "Code coverage support"
-	depends on !LIVEPATCH
+	depends on SYSCTL && !LIVEPATCH
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
 	help
 	  Enable code coverage support.
-- 
2.34.1


