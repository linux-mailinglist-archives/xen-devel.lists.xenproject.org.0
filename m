Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170DA5D4EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909668.1316573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN3-000756-Ti; Wed, 12 Mar 2025 04:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909668.1316573; Wed, 12 Mar 2025 04:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN3-000733-Q4; Wed, 12 Mar 2025 04:07:05 +0000
Received: by outflank-mailman (input) for mailman id 909668;
 Wed, 12 Mar 2025 04:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDN2-0006o2-Ln
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2415::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73571b4c-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:03 +0100 (CET)
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:06:58 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::62) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:06:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:06:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:06:54 -0500
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
X-Inumbo-ID: 73571b4c-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzHAZFRS4Em+KPaYUrN9V4a9ZznKRZLpLp6NAvEa8+QdIHU/J+IsriCReN50BYAbHb5onVzfBRh8pRdwDr07u78AoL+kot9kYUoiRBbMSSATkwvxBdyfAsay14j6Jeo6mm+y4VA9jYja3NxF73+lHf21rsW/klRk0nlQj3HIPL08ssRQqliroAHe5W/Jm8QHLoVuK4pxCUFOkaAltrmctlYyF0IMp8hHDJEhiv4COl/KbwIWLhKPWHnz+LdSXCy6x0UlylobHqK3PBk9RO5QTW8c1cAEvd0aU7GgV/0tL91GKWnslm/cWZ7teVuqaVR3ZIQ6KojiaCncdqFkcGDVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbN9hLSoIYbmj6b7CVezgOjL65vV44FxolcdmjDHBPU=;
 b=Yqabbb3ZVXV+y2DewWh+AEZGZQsB/qZr/zLPhExay+lrvrv+8xnUum/4tXElUz2FUKLG5oK+pPSFs8fRotKdWMh13cSj5q0Dn3V/h+CyxqynmHdQT7ZJiyz2LOmW4f+LxGDsLcQ+2Y3IJep2lupJJU4c6pM8yxU4KLXENbOEZf9/XEGCZkaKLWwdyTbqkg8LfjNHe6sN09bWEjYt1Z04Y0miXPCJj9+ikSvx/gmg+b+fgG2+GZolLcPrfw0y7KYcahOFk0e1K8VvG8VeRrJvtzS4Lo1EvjhhgiVC3+5UfiZla74/ga/UEoErwbzWBHWbsiLe3hkv1ZrdiKbsM0G5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbN9hLSoIYbmj6b7CVezgOjL65vV44FxolcdmjDHBPU=;
 b=edqZhhVFxJZXFsgTJ1q9noBeWMmJB2g1SvW5cHxaEV9Z3Y8V/8lkhihYCC1dDl7JtBA0p8Ydsn+dXKmDJyOx/m1PHm3do4eSWv9IyoBEwOfvfuhcrBOEnp8WfOp30kz8BGxmkZOWVZFYma84HVryq+RuLxp1bLfYAY7kJ6HjAN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
Date: Wed, 12 Mar 2025 12:06:14 +0800
Message-ID: <20250312040632.2853485-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: fde9096f-ae70-4999-a108-08dd611b5578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X6sxGB8ELVjXOcXA8q4hjt451rqB7Ios1o6ldDaNImP7UvonQtPWnKTC9op2?=
 =?us-ascii?Q?zc6c42npO5ycWiRTw0yKdqsHKrZfoJJzAnyHvFtECOgstBp6anYZEvFS7KR2?=
 =?us-ascii?Q?M2jkDV1gp58wMzXuNHbMj5A4uXm6DZ1mDn89EoyueM95N80rtZjc9XrCBqX+?=
 =?us-ascii?Q?xWgFJzgQU3oOiLM6MoOQ+GRav60Wjl6d+7sfV3rhJSB8V1+Lc9Ho0R1WzhWT?=
 =?us-ascii?Q?zVqZlNTS21ORQ2LaaFrW82AnWiV35vNoqfhRXPg7S+q0gxQhCqME+1bhhpxO?=
 =?us-ascii?Q?2wg946nWWVSHyH7xsfQMT6QITN11qlrUjwxY/UM+IC/A5z66BAi1BZEt4b60?=
 =?us-ascii?Q?ZKX2QC50B2YjSDkx+BFwFNe5Psi/QO9U+edWNjjr4jO9/czfLxKX+fbKrykZ?=
 =?us-ascii?Q?/oFVXOVmui0JnGCCGzIuXmTNG9T0brgROCfUQ4nMFipPvYJ4ud6/zQ0GYHqT?=
 =?us-ascii?Q?c+wfwKnXFWN9Whg6Ws1e2Y39umq9zt/eVQNp0WmZ00gvYG86D1iQ5rYXYIXz?=
 =?us-ascii?Q?Bl/7ZFtJ+bSOqUxScRgmPViWAueOVZ2xmDb5pEUMViU0WBj/HDuX5/1MxGgM?=
 =?us-ascii?Q?hK1cQo0Bqaeq1yAZoNcbisDYOZ0Awctg8IkKKMJKCWSntQRj8XzjxG2cSeve?=
 =?us-ascii?Q?8s/UeUbQe+6RQhhhbRrBPS7u0QDEZdyay+fLHAbAbcx6HommpuklWhTqlqof?=
 =?us-ascii?Q?Q+fPWM+oTMMQVa7sOdT/LWTdCorj+6YnypSdhuDAIj8F1OhKythEnUVjwgpo?=
 =?us-ascii?Q?GR5fnuvc0oqjLaGjk1lDRxlBFxodsdBzWtwNNT+GQOM30RYQLlCDcdpS5rIi?=
 =?us-ascii?Q?vfoDxgKaAsdctzxs8r6FePSaK4OD7mK0wJ3hUGrWoaSnj9zb1y2RBI/RTUmw?=
 =?us-ascii?Q?ruxIkp0fxN5tuTF+XQaZfYcOLPWpWs4qiSzXNh2fB5uciAvNUpZldU4lrbMd?=
 =?us-ascii?Q?tWpb2CbvQMXfg1yNkRnlXgm6Yf0AX6/hyNew+nFZBAvSMiKX7Sp1+1IBo6dc?=
 =?us-ascii?Q?o7YolSZ8kaaYyVJwKGAB8Mq+tSZSu5aAyXwOOoz92DPrM9zelzKgGVBLGlJI?=
 =?us-ascii?Q?n9MqYj4jG0+6itpd1q9u18rSsS4+7llz6KU0gGrTiRI3G88Avu5faRh1Ttmt?=
 =?us-ascii?Q?Oyk8lra13FQRHQNYiYHOc9YKTszQFfXNFYVJ/h2H6RYS36LHxlrF6+LlW48N?=
 =?us-ascii?Q?JZmq0vAj+RU3yafabIG8fMbtU9fJ7Akj1QOOM/Q086fy5lBaSVNhITxpNlNN?=
 =?us-ascii?Q?JS21rpa5rJjLD7V/u9ktIUK83iHWDJMz9E9qLo5DZTuUmnq5LfGiGmUbLzFY?=
 =?us-ascii?Q?H1/5wrAFvdWvoX1h+RmrxzuLgC8+Ny3ZdPbiPLO2Ik4CXDFiIEtu52m/PUFd?=
 =?us-ascii?Q?qixklVRWVmW+kt13yAteAtF1dvLItbvaKGuFpGDRk5THBOsyIWNzoiRo2L3t?=
 =?us-ascii?Q?cxyWlnN+EVEviMDc2i9Y/KG9muvWeioi2mY93DyC9jmZ4coJPyyUsqWV46mC?=
 =?us-ascii?Q?IOjDCpDxYVBLOtQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:06:58.1989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde9096f-ae70-4999-a108-08dd611b5578
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d..72e1d7ea97 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -519,6 +519,15 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
+endmenu
+
 config LLC_COLORING
 	bool "Last Level Cache (LLC) coloring" if EXPERT
 	depends on HAS_LLC_COLORING
-- 
2.34.1


