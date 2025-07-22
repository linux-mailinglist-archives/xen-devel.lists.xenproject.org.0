Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC7B0D8B8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052386.1421046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfY-0003lK-95; Tue, 22 Jul 2025 12:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052386.1421046; Tue, 22 Jul 2025 12:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfY-0003ib-2B; Tue, 22 Jul 2025 12:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1052386;
 Tue, 22 Jul 2025 12:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfW-0003QN-Ac
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:26 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2407::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 703d88af-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:20 +0200 (CEST)
Received: from SJ0PR03CA0167.namprd03.prod.outlook.com (2603:10b6:a03:338::22)
 by MN6PR12MB8513.namprd12.prod.outlook.com (2603:10b6:208:472::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 12:00:15 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::45) by SJ0PR03CA0167.outlook.office365.com
 (2603:10b6:a03:338::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Tue,
 22 Jul 2025 12:00:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:15 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:06 -0500
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
X-Inumbo-ID: 703d88af-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpvHEB4PBMr9T9JwdHzVFPA6y2AGVWWi1SKuYNn9aP3+2qAQH0R/aYgMyh8eDgr+5PT5Ez5vlS7joA6rTfaqftgwR6Z4GV0J0+/kS147wFrhd9hoppcRQe3sj1Cxfw600cGBDe2KVeXiEduRbImuQI6hh/If7yfp+ftVKyYcXnRKEOrtJGCfLlAwbUzjouMGxm2oYeYDKuHkhSPvxnp17yw/+5oG+QoK5FNkxYEEr1FmCENjYdXWJg+pe9KIXj2Z99zi4oyQ4NLV8TA2dzOrsl9rh6dkTzD3RaDlETCQQzKcHid3cdaqbq120WkMWA81QpWBbs486z6hCbdKYv3JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgS8CWqrhPnHOoP+s/mJLBkHM+4+Ax0hYJiWs8FvGew=;
 b=KdIip5USUHiUKC4L9OxAepwXjXSVE9JSvlEw9kYPUPFSoWKiXoky0WSIzQyajxFYM7OOuTZqwmK1m+QlbQ72q1WdvacYa0iZ/vpnqdv5n8J5iKsjUIJbkDjAZI6nGVTO7mOBPhvFgwaTPUnLJEeU669TZjAWhLtcHEBQGyIIk3nfhAvDEuvMgHsUwf0cKo2Eg4qvrmEtBdsEwMpwmlsw74RhRBHN6ZDjksC5xCl8tPjEejJKaOF1KUIWslZRWoprTK6Y4qiLiLXxG6xArjxnP4zCOaqp6xCnEBgeW6vPbuNr9VIzHcZOplL/mzfvotMdjTVTbGHz9P0mMyNOLUAc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgS8CWqrhPnHOoP+s/mJLBkHM+4+Ax0hYJiWs8FvGew=;
 b=2cD5NQtlQAsYzVojNvPPjV8DQamPAtQroGE57CohtiqxCYGKpVjVV3qgX1L+rpoUnSESEDD5uuCefcQnJKEnMNMrhcbW6nrHq8f0V4yLrCOEXkCfJIaZKbhZeuUSYWIVBzEsNmQpExE+CDjLcbX/QFzf2yYxtX/IVC0qCLAPm/8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 00/10] Extract bindings in dom0less code
Date: Tue, 22 Jul 2025 13:59:40 +0200
Message-ID: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|MN6PR12MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 3943eff6-4652-4164-3d3b-08ddc91751e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0dLoFyJVcd0P0WMIFFDrzsEagx2UNWYziAQeqagL+ySknDbpKZPJlFLU9E4m?=
 =?us-ascii?Q?HvIjMXrXRQMwGmUKiNjAe58BTmwVq1C3uZco9OfMiJvAQ3E+wHTbfq3L43/r?=
 =?us-ascii?Q?eJId1ZIltw9CsaArlc/7X3LUeM2w3lM63cTud7jvvgngJcf6l6cfTY3CyjW5?=
 =?us-ascii?Q?ap4ufxOpuwotUreBjHNeqqlA6OeMS9u2WZ9vgjXBmXRXg/nWb6cbzVMJbZWj?=
 =?us-ascii?Q?1blrd2NZvdSo60IWjrOuzaVgAJ65vIAj90YwqhhiNVfUh3IY6KvHfYexOccH?=
 =?us-ascii?Q?MH9NuxYiPqhqJSTGZx3rEv6o1DBedAqd8MOcvXe6T9Vpp3/a0mS5lkgDCBNl?=
 =?us-ascii?Q?dvhmEGWzaUhR11SjsDeJmxNfcAKK5NPio1BUVf06/foLtWtx6rnaZdojrDD8?=
 =?us-ascii?Q?aJ/8wjD5zR/ZrDwDXehzPyQuhGcpLEEkeoYpIJK1Bw6Lfa9WXLtB2fDpWebe?=
 =?us-ascii?Q?tA4aqF9Ug+UqWkqZmvETyKzQNIl+mlQ353xMtNhTSAB7Ke5n4bkgVc3BNKvR?=
 =?us-ascii?Q?vJlBPxGempW6iAmGIqP2AWSf6bE5L9VQdtVqJSz7iFyzOVFE+7p2LOA1sGvL?=
 =?us-ascii?Q?oD8dHKyyYpHoCVHMtffO4OCWinkhEyG+hHOlaZ7B4+m3c5GCK4WDgMsCKXFA?=
 =?us-ascii?Q?HIAH/IkWgq/gtXl+NKoR8dZLEgAI7u8tcCFI2B6I8h09TeHd18n4w0nVW+06?=
 =?us-ascii?Q?mfVTZ2agbNtVOm2mUiXqmhcaR02Nn0/Se/x9Nyrmwmk8sSBkRKByPuXNwGuh?=
 =?us-ascii?Q?n7mAbQZljlGr9kf3yNoQZ6Bw5LNnE7uxbUdafoC1kHeZwIw5NoZmRpjkvYmG?=
 =?us-ascii?Q?cHYmnnw3+c+lFA55h6U3g7+BjTK6HFIrX2dUaqhFdm94Tp97DY9qWF/Wb5/6?=
 =?us-ascii?Q?ZRb4OzLdYaQMwCm+wxqnZ6QdKE4SAu2FtJ6cEjGasLvOFui2+3OnoOj0jZ8+?=
 =?us-ascii?Q?8Y/ohODsH5eePOetSL6BCdQlNiV081/XbChO/8Pnt23akCwqFruOAxTIItci?=
 =?us-ascii?Q?RJo+q3OTG6My7PoDQ3y772+30Gd4jmgQyI+0TaHfv6SwDt733rAg62l2VbbA?=
 =?us-ascii?Q?5VPWuTJefrtqb/Es2w1RSfzJLZJXKuoE675WXyC+MfOc9pmEgwNtmx9HUN5I?=
 =?us-ascii?Q?TSW3cOYCz1+Iiuujo1GLYyD/pg7gOC0IRmEU8lQqb5rb1BhII4l/s4VVQFop?=
 =?us-ascii?Q?HBBOfugd5jDPdPe8E6vheg4XHe19H9bbWdYerb23z4RH73HssRvlJpLrs9EO?=
 =?us-ascii?Q?/cKz2xxp89jc7w7lFY5YnrryaPmyISDO43rkEk36PCekSjnRFMmXRNXQX9iz?=
 =?us-ascii?Q?5trZ52ia7VB1dEHLBdi8tBNU+S5oaZ9TpGvLvcueNlNjjyehZPCRjtmXUtPJ?=
 =?us-ascii?Q?5LY6THce9cT9i/tlpHePgcqn1xRIhw6zvc2lrOAVyM7ble6CXRunZjBq6LyV?=
 =?us-ascii?Q?tnZBdlEUPvTMzNhXUfzWTLmfxOR2wOS3n4U/OAHj33c1UCdaYybG74u8vFtP?=
 =?us-ascii?Q?lRVHhnKzqYdG6+AKxK8k+jGBMP8JGsVzl62AKJqP9+fvcgI5MYq6qAtolQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:15.0282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3943eff6-4652-4164-3d3b-08ddc91751e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8513

Hi,

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1941315850

With boot_domain common between architectures, we're now in a position to use
it as the common ground to dump results of dom0less bindings. This series is
largely code motion with a few tweaks to make it simple for x86 to hook into
the dom0less bindings.

The idea is to create a parse_dom0less_node() function, that takes a boot_domain
and depending on the bindings found on the xen,domain node, populates it one way
or the other. parse_dom0less_node() calls internally an
arch_parse_dom0less_node() function to allow arch-specific bindings or checks.

Patch 9: "dom0less: Reinitialise all variables on each loop iteration" is a
         separate bugfix. Patch 10 does code motion and implicitly fixes it
         too, but I added it so it can be backported to stable branches.

Alejandro Vallejo (10):
  static-evtchn: Add missing include
  dt: Add cf_check to device-tree.c function pointers
  dom0less: Move asm-generic/dom0less-build.h -> xen/dom0less-build.h
  bootfdt: Add createdomain arguments to boot_domain
  dom0less: Introduce kernel_info into the domain creation loop
  dom0less: Create llc_color_str field in boot_domain
  dom0less: Turn arch_create_domUs into arch_parse_dom0less_node()
  dom0less: Allow arch_parse_dom0less_node() to be fallible
  dom0less: Reinitialise all variables on each loop iteration
  dom0less: Parse dom0less bindings into createdomain input args

 xen/arch/arm/dom0less-build.c                 |  11 +-
 xen/arch/arm/domain_build.c                   |   2 +-
 xen/arch/arm/include/asm/Makefile             |   1 -
 xen/arch/arm/setup.c                          |   2 +-
 xen/common/device-tree/Makefile               |   3 +-
 xen/common/device-tree/device-tree.c          |  28 +--
 xen/common/device-tree/dom0less-bindings.c    | 145 +++++++++++++
 xen/common/device-tree/dom0less-build.c       | 193 ++++--------------
 xen/common/device-tree/static-evtchn.c        |   1 +
 xen/include/xen/bootfdt.h                     |  11 +
 .../{asm-generic => xen}/dom0less-build.h     |  15 +-
 11 files changed, 228 insertions(+), 184 deletions(-)
 create mode 100644 xen/common/device-tree/dom0less-bindings.c
 rename xen/include/{asm-generic => xen}/dom0less-build.h (90%)


base-commit: e9339514744904061ca01046e5ca6b97cb4f0fb2
-- 
2.43.0


