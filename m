Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D00A7103B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927010.1329849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhv-0000w7-12; Wed, 26 Mar 2025 05:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927010.1329849; Wed, 26 Mar 2025 05:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhu-0000tk-TB; Wed, 26 Mar 2025 05:53:42 +0000
Received: by outflank-mailman (input) for mailman id 927010;
 Wed, 26 Mar 2025 05:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJht-0008HQ-NQ
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ef60bf-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:39 +0100 (CET)
Received: from MW3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:303:2b::20)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:35 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::24) by MW3PR05CA0015.outlook.office365.com
 (2603:10b6:303:2b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:31 -0500
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
X-Inumbo-ID: a9ef60bf-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twYYG8E2QYKASZ6aSpshO09EWXsZynw5IM0eezNil9sTzKhOdfguNyDsXwMoxoRe0DHyDsFtiG+oN7kznuAtABzvpv7Da6y6ZD0EZ5CRtqPmW2oeScE3d0lHb+kmvX+9QXkIhnMcIapMJst5g1S2dZ4pefLggG5MuKI1hnJ3fG9xKA9fybCPajb/m/0/Udxv/o7l6XO9tYpzbvgMzTKD+8bOHQW4xXXQBRkTwwRzXZeT2IG0CAorQ4T68iQ47Dpd2nfymtdSe+CNx/joaF6n2JdoEvy0gnwMsPVFNblQ/Is8ZCEPQQb7Fq0lVBX/QODVQrz9z6KE6iY14kDb1wvOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlzaRevyyzgJnBGygvCpqfER1aWr/DT0ER3WY6jD2QA=;
 b=iKLJa4SmtqhTUyt3UwOO2Jzq1z6EozTy1lKXlpZypZ41ohQi4JsF6irTWRA6nravfRR4GTc/BhLFxU+CPrC5xcXAGO9iIHwCTPxLCZEIOsShaDLMqozFYLknpx5M8bVpUBe3Dl+bLb9DoUOicbAH46UQYXZ5UCVVAJ5JqDXX1nt2YDd6yJBvB8+PkeRlsSLr7ODGU8zlPo7/cc+7Vj0nDKdeLHRoUOd7eO/XByzrTWQFMF/n/APnwEV3eYTUpvSrtiyzBYG4zBDDxwIHkR7lgC5imorNZszPNbrahr+3Eo0/wScO6LYEpPLz2hdb+M0b1p/QU5wp0FJJDEZFuH5NMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlzaRevyyzgJnBGygvCpqfER1aWr/DT0ER3WY6jD2QA=;
 b=AdH+8Y3yXZzDWb+t1t5d97T0vyDnT4LVDRxZ7z4rPe0qhtjJFWqLR1MZs5fvMafV3Cw0i9BQdvbnHJmFd8P6SN/YzsXo+gbCFOJz0IDd/4MFw0EHn6NfeoK6KmMLr9cdokoaFuPBwm+Oy7Oqn+XueVt6ZMnFkRS1Lo51vuo+7IE=
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
Subject: [PATCH v2 05/19] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:39 +0800
Message-ID: <20250326055053.3313146-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: fe735fc4-de50-4bd1-b5f8-08dd6c2a8bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xX4PAALO+yqzNyPiDMJiFUaQEU1ydQG6ja9tvRVbQEXqC8L23MchhR7rN/Be?=
 =?us-ascii?Q?8ybIJp6Ar0hPu6xjipORiYNv9PbsrcD6VM4B7ShF7/KkGGuQfSquSJNG+vLM?=
 =?us-ascii?Q?dYRJarIC/2I9e9ACrWb3ZpepW6Uu4Uk40/7ViTrnfftcg/QW0zqmJftSWY9M?=
 =?us-ascii?Q?ODrec9KCYFGasruI7m3GZZjyo8mBNdo3LaI/v+TWnUqz/ipHdom1UFBZcziB?=
 =?us-ascii?Q?wW6wu/nxvAqy0w3GOjtoXbKgIhnU5tR3WlxXKJo4izlOdYuTGon+aM2pdP5G?=
 =?us-ascii?Q?ZpF01i9+8zCxyfUT4PHxIthjCtwjk5RlD8m7pd6MlMVokm7Z+NB+1TUB1LNk?=
 =?us-ascii?Q?Oyt3q0bzuO7u9z+5yQiIyGThwrE5/A46TMGpr6MiT2vODxSJz2jBQzPnmvJU?=
 =?us-ascii?Q?xc7BqRhioWIJONCTdn2pSa0zPlZojvrktiiMyz2xID9Spskrzm2xUeuKSwdd?=
 =?us-ascii?Q?FzALwS0WTP0OyPnU3M0sd0ekmYyjXMpj1YJhXhYKM1bkFvschLms2+lOvgPb?=
 =?us-ascii?Q?7BtXBn1RgbveSZemqyW8CB3+cyTjUGDzXXBiZ0dd9fLHpWOQbE7Xh2kYoF5l?=
 =?us-ascii?Q?pGyr+Uv91+E4Usdg9tAfSfldKrgicGB3z9RdHfOhV+bAu4e6QweCn4lJobo9?=
 =?us-ascii?Q?dKUGENOuy8Qo/3P8mx9HQVERRooB+zyZzo7QFwHo9u7nrR1YuWqxxS+rg2Gr?=
 =?us-ascii?Q?enWWhdOST0Hb/yjP3AdLjwlN+im34Y7Ck5Xkffka6qhzXiJsgBx5MTv/thAl?=
 =?us-ascii?Q?AnkV7EJcpb/WaMJdHcGCT3tX5VPCCWOTWm7CKCmn6YtmhJF19GfnjfNoxSuZ?=
 =?us-ascii?Q?ew8kGa80Y1IL6LiDNHfQZRkiKLpjmj3akOZTj8ytoz7qP34IbrmUEA0D5mAo?=
 =?us-ascii?Q?K16Ai6J/sEoGTDiblLOI41C3Rjd1bvYetVma8eX08RyzIsaxMOKwOaS1DkUt?=
 =?us-ascii?Q?Jc+kiQYq27WJtSPf4ou7h+WzSZbZ299w0UqwTtBTKCcB7eDIudwu/zLBucL5?=
 =?us-ascii?Q?yTYxqdVnVCb+rKPAemfk3vbAA4b77xAHH3osN5WjNk+YwsPLjprwGp5CJlJo?=
 =?us-ascii?Q?dWFcEYCuNdDmiw8cC/bSPhg/7tVCS+93Hps/mC59SznQR49x/TK7kJ0Ibv6p?=
 =?us-ascii?Q?gQYtcJAbCCycJva/qh5MWy/uJ78jK8Ah9hVkJY+XEG6qgNe/WX0WtzG7x1/r?=
 =?us-ascii?Q?8IKW/1jchCMcl+jKXL61HRFpwS3qneVSk4u0WoZAsWd90sqFEv94ru1ts63z?=
 =?us-ascii?Q?t3v3R+SJkFsKRH/RuiZg1sSbYQfC1ENsV0KBIBc/UAn7yW/ccv7aj65WeY3k?=
 =?us-ascii?Q?3J5H8CLmGXGjWc9l0F45EOxkaULgIsd9FaZ1hMKOQfPVpdUTvUn5jdlhK8Ll?=
 =?us-ascii?Q?/qn6oF6hdrOwE7NR2B/raLVVEHEJ97o67LPrh4ly07CJg9EsPcKLOVPuw2Er?=
 =?us-ascii?Q?G7aYaYZmpcPFeIpoaVv/SPACUT59+klpxmEdPugdRJB6SjPr635RcktTTQ0z?=
 =?us-ascii?Q?5IGQu1VaHWX9yQY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:34.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe735fc4-de50-4bd1-b5f8-08dd6c2a8bfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486

Users could only access trace buffers via hypercal XEN_SYSCTL_tbuf_op,
so this commit makes CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fe9303c7c1..5b55ca6eaa 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -513,6 +513,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


