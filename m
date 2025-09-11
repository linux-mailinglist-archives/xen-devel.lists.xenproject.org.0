Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40798B53914
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 18:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120608.1465477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5q-0001bU-HG; Thu, 11 Sep 2025 16:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120608.1465477; Thu, 11 Sep 2025 16:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5q-0001Vw-Cv; Thu, 11 Sep 2025 16:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1120608;
 Thu, 11 Sep 2025 16:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwk5p-0001Cf-8y
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 16:24:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2416::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c19072a0-8f2b-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 18:24:15 +0200 (CEST)
Received: from DS7PR06CA0039.namprd06.prod.outlook.com (2603:10b6:8:54::7) by
 MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 16:24:07 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::e2) by DS7PR06CA0039.outlook.office365.com
 (2603:10b6:8:54::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 16:24:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 16:24:06 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 09:24:04 -0700
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
X-Inumbo-ID: c19072a0-8f2b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khpTxSjS5qTCijoQK2D3WJJ5sRYAWSH3PHWGbTaf2Z3W9m0dVCAi33D1DX6XLZav3GbzeXgrLgycqoQT47R71EErWFMTgQw9YoWlBsZd+r0FnW9MZtGF0Kxnb1QJcCfizBtgFZ2qp5bv0ywCTkz2o3sLj8nAx9mWhFg2/ZFBMK1CrTQt2fFyzH5QnbrzmNXra50AjQk5QcBeHDo3EtQkj3BuI3AQVvJpTLLBx6MiElYqv1JEUzqbcJhW9KwACk6xSWBBD+BsMHslybMvOTfHqufVHsLBCKzvWBZMWraR054gl+hBw/JsDF/Ur91CbCiTpj0VP+ySuqPH80k9veBMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn+dK7+SCQSLAhJxI3AXAoO++irC+zRNHzsL5Pd8Fv8=;
 b=CDC6vhVVbToYct/gaay2+pBiQ/ypxzd6dJnPkYfiWMHMdUTgaTzuj8s6nZ6SCkryzOlufwzTikRfkn86ah2BImQqodSnlmazMO0MaQ8tQTmW/PQlGRcDfFO+FrytLBXIBY0kU+Fa0AbCgrC0KnFGJ1WmjK5PkwuUR4JLoHMJPeOEneHjHYFxeAzFz6WfuHBjEovrs4MUA8BkhGB/GB3WQwdmGfjHBMAT8OCWjF+SHrtp8BbqtWPio9NX/0p/wUrgvqQNutgv2Ssr1I85CQAo8RP0abLS+MsIJGLBYdm9Sh1Uzui73wRS/UftcX2eu0hFcLISHVKrN6HF4LJxpoCAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn+dK7+SCQSLAhJxI3AXAoO++irC+zRNHzsL5Pd8Fv8=;
 b=YsJGwqUKHYsJXbI6xk6BqdETVrIDlLnINjwRb+XQ2sjJvK4edCY0MMbzc8MtrNWyZPsqGFto2MkLCpKth8sox4S99weYf/PE09stT0cxf69VbtsZ7Pkkci2qV3JJKKXEipH9XtoWegS9NiSc1GP3rktYMtAXUMNWrtIVEwW969c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, "Grygorii
 Strashko" <grygorii_strashko@epam.com>
Subject: [PATCH v2 0/2] libacpi: Fix memory corruption on ACPI CPU hotplug
Date: Thu, 11 Sep 2025 18:23:31 +0200
Message-ID: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0f4a41-b11b-4805-1df6-08ddf14fa151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2my4Kcx7Fld+iIGETGdqLpToyuu+3MRnIP2X3t1BmOA8RyUR2yBosVj0phxp?=
 =?us-ascii?Q?tfjdoJunZ3AvdCLt4p37bFyBSJBBnDexAT+pD0vrVd2AcDwV+CjtP6Nkf/8y?=
 =?us-ascii?Q?TcE/1E++pDW164ZtkTPk6LSvIBcN2BEQVruLzekomTt3sibOS560qLz0zy6w?=
 =?us-ascii?Q?oAOC7MkLU0Zgp6hDyuWZqtaewQtHy0e+bXPnnVA3WO1rGT7n6GNIHkY5C6F5?=
 =?us-ascii?Q?YmJ6i6sQCJJxMlMqn0AuF9GF342SLJVSNXJvVVE/mcUbTf0Ec6FX/LrzqQ3n?=
 =?us-ascii?Q?Gqw6av7RWSBmUfhjbQKUgkuSvysx12S/D+7IguzmBp5Xx+GkzH+myxwJVZKg?=
 =?us-ascii?Q?GnOMPu6uTwGYrF7JItNbMGjDKoXUZHAkgGXHSuiEUckTbURwyUIL/6iAGyDA?=
 =?us-ascii?Q?EsMOX9+3trs20D3YGn9hmnt2f1QDqFzsV6GmBhYh1j8ZxMQqw7D6Dt2Sv0pi?=
 =?us-ascii?Q?I5naSnzIVlzpNxLbkCtEbrYymg854Xh4IkbCR+RSz0dAlaloyi85fRcngGIU?=
 =?us-ascii?Q?BuRm9ZqFwAKq8rcL+U5ZOAcifOpzdS1tPVZuS3uJikyFd8IzYzOzKVWeaYeD?=
 =?us-ascii?Q?P57bz4yvqlyAgaZ51vZMrfKPXa3lGkVSAqcGhpMvEvJOU8xjFnoiWKL6Sybw?=
 =?us-ascii?Q?xCGX3ZboLolrvz4Gixbr3EZ7sc3DY9lyN/zJ1Y/9BhD3jFbum6wX/9smrhqj?=
 =?us-ascii?Q?VifqXD9IhgEk9YxDfOZuq3CI4A0mVZpxayNOLcvPuNx6/EGzTNEzx9R7OAJ+?=
 =?us-ascii?Q?sKI7CTO6ZezPXk7aH/nOZ3xhhjsXCa6dNKj2fWc1FSiwRjMaVc96FxWPJxqD?=
 =?us-ascii?Q?cF8ixVfWkXG3BCWaYVNMmwdC7tf4QupeeLM/U0qXR+E2AfIsq5hsFASnWSf1?=
 =?us-ascii?Q?0bT6XbgONgjFX7Fl+pdipvyB4up5gROoU6pRp657tAy5P5E08SjWB5dcc1OC?=
 =?us-ascii?Q?9gVigYaATFRV41sX/yymOjA2O6ewg8smfxKhnbY39ESZD3L+It3ZjRDwC3go?=
 =?us-ascii?Q?B3vVvE1gFXlMckwGJ4LUzEWEDZe2ffAM3VURmOYh3MrO5o9OLl3X6zwKKaty?=
 =?us-ascii?Q?Ch3QWUOW96xFbESoZyl6QPPvHDESIiQvOur0tJqFkbDllt/tEA9E21Xh/zgY?=
 =?us-ascii?Q?bKHayjdTd2KzM+4/t6Xd+tfuO21vPaG6wEbYKhVF6OT7+dcegNlZkUvmHJwg?=
 =?us-ascii?Q?S5EHIdkNoEiqs7uaQTZM6CpX5NrhI8cgg1eR+bgNptp2qLRzoP3wAJ+IEBEY?=
 =?us-ascii?Q?RR9KJgA93Qnx4S1H61Utoef7x7Gew0r3vcLgJwCIgF3Zts6M6Vte87aXvYL6?=
 =?us-ascii?Q?Exc2xaMyrxDMzlEQ+StE1wsQPp0HhCVYGVFT8iukrqmheAi/I4wo8sDECQ0b?=
 =?us-ascii?Q?6AyyqTFdRl/cQ8E91l4otP85mX9IjMjoCF7AqDOiPpuTGwXPNuyHyuL+WMG9?=
 =?us-ascii?Q?dzmargS0l2QFVaJs6w5qSmMYddCpN2NK2cvzE7aGRAF1nd5q6NVl1p5UyCrS?=
 =?us-ascii?Q?mC70nJCfuKJelNaOK1i0MlfwtqnYDgMIl8/AlMpZjeObxyHWfA9YU3tduA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:24:06.6751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0f4a41-b11b-4805-1df6-08ddf14fa151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897

Hi,

Both patches are independent Patch 2 can very well go in before patch 1.

pipeline:  https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2034774204
(still running as of now)

      v1: https://lore.kernel.org/xen-devel/20250911115308.16580-1-alejandro.garciavallejo@amd.com/
original: https://lore.kernel.org/xen-devel/20250910144921.29048-1-alejandro.garciavallejo@amd.com/

Cheers,
Alejandro

Alejandro Vallejo (2):
  libacpi: Prevent CPU hotplug AML from corrupting memory
  libacpi: Remove CPU hotplug and GPE handling from PVH DSDTs

 tools/libacpi/mk_dsdt.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)


base-commit: 16fae1561354f35dd524eb8953385d31eac3ce37
-- 
2.43.0


