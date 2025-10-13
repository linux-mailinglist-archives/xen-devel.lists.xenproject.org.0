Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8BABD2822
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141919.1476143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbq-0006AU-I7; Mon, 13 Oct 2025 10:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141919.1476143; Mon, 13 Oct 2025 10:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbq-00068g-BP; Mon, 13 Oct 2025 10:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1141919;
 Mon, 13 Oct 2025 10:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbp-0004Hi-2y
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:53 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc39b325-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:16:52 +0200 (CEST)
Received: from MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46) by
 BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 10:16:47 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::d0) by MW2PR16CA0033.outlook.office365.com
 (2603:10b6:907::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:16:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:44 -0700
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
X-Inumbo-ID: bc39b325-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMbftuS7zxQG6v4CJ0s1ljr+YaAANHFlPScEQyYiIeutmN/C9XUa2jIG2rBIDNv0QtKIFdAjQgmp3wOXvGKMqt4ZwUxM5Or2nM67CyuHOG1qhgxOoBBIPubHFTtBqjZLdylYZieuQfZVCtJLKtuP9LkxYb2IM4Bw0WoJz9xJq33KemExJ/cYFi7moPvi23rCEpeege/piVQ18vFKf2dcuNnpi3IwZ8D29lJjMJbzsykFQYBCvJb19tp7MiJlzjSL5nO3VOBeTmmgU6/nOzF+FCuLOoG3ve0I/9jGUE+x/p9M/H5c7Wt1XRGO7VwmloIMc4cdLdsEvZ/7ZI2os1JrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMWhrUBqiBoALQdRloPk0tPwtfuVXQqmf7VPSSV0wkg=;
 b=w5nmqgKtg3auC3dqBlgW5DdlDiiT4T0vXEQTzLDCwthwjkRE+kkBiKHoK9WUS8pbZmgg1EHlMOg2NVPpU5AvoJXkeEShvP73v1Zwo/B7qp7NDRVjNAWblLJtOpr7o0e6vKsT+jvjsNTrWzntwrvj1W+1LO2AgA6SR7HBwqQ4KoSUlCuVxFkQqLo1CdvEUQAcJqsY5OpdPieizztX/pZJQqGGc2fpqCs/LSZJZZuipCeFi5kLd9yHr4y8c5IkHIa7veFL4wiSnWYqog9pCsxZUswy0pHq85LNIk4gEDzEdNDRsHAdVM/FFhaHBNAlrcVtJWRj0lYDmR2On5Q/kub+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMWhrUBqiBoALQdRloPk0tPwtfuVXQqmf7VPSSV0wkg=;
 b=KEFrC3Lzkl7R+utPGnTEHjvrUS629sN7cmBPmyza8pnvdi7y0ASTIr3MgBh0WR/ARHu3kpYEC9uOe66zYWHImQ8OZzqKn3xxscCkPlqOi3UQsSU/rSadwzJG/5RI3p+0oMh3bwRuDVFukMw3WxprDBgL3oR2zrejQsjMXiE0pFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 07/28] xen/domctl: make MGMT_HYPERCALLS transiently def_bool
Date: Mon, 13 Oct 2025 18:15:19 +0800
Message-ID: <20251013101540.3502842-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6db390-0f0e-43f1-b532-08de0a419ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e56uZZuwz+7vfU2cdak5Hn5NTVq9yMyD38qWfLku8t/RMvkEG6im6sDja/2D?=
 =?us-ascii?Q?TVsgOP8FA4MNbpPDNaIGNd8ShandCYOJZLA4eEjjNRl/jQxDJviJac3LlZtK?=
 =?us-ascii?Q?OiRRyFRiV51z0AnMDdOqIRNMktgkdpol3fZ7wAwLl4jH1cf8sUI1OIC8CWVB?=
 =?us-ascii?Q?/28l9MstfSF/VwYhplagCAnInlo2IYhrcM+rRv+n5jMkD65/Ue8lHguR0Zwa?=
 =?us-ascii?Q?brynqFz0cOy2MrMnIxEdpECqcrzHmUmSM6vnisHaGytj7+rIAOGjgA7LGOBV?=
 =?us-ascii?Q?Ns2OonJq2JtvRakU84fK3b1pTv0eb6apv2ai/2M03pGu7ofrysBCvxCzmWZJ?=
 =?us-ascii?Q?B4juIhbQ3pEKHkHkQrwpkmOxW+TBGFV0ulOVAabThan46CwJzDGH6JHZiv3W?=
 =?us-ascii?Q?qdeSRgtXRP/7F6j+xH4arczi02TUqIuK6ZU9Vfv+h+zlCTSAH4yflquHrGTW?=
 =?us-ascii?Q?yv/yKM/ozOtwFmfMpUFyepYP7+QuapyqpRC2PHblVWXpOWLeuxKPqx+aIZ7g?=
 =?us-ascii?Q?IMzMlTR9W6WINh/m6gjom1zRk45CLrXPCICEpHVG72Hg7oieg6mJpEkjAdVB?=
 =?us-ascii?Q?CG6bpfGeO3thRj0yau1UBP/JhZC7gR6Su/hhNxwG8/N341CaLzQCB5qsM9tk?=
 =?us-ascii?Q?Oj9a377jCiImYJF7slIZXIwki4la5pePs4jiysh8TlapWBO29hftMIjDHqJ2?=
 =?us-ascii?Q?AaGEfOnbyEwYh8upAUtYVO5CKhoTkjvHSr9L+0IdUSbX/5nffXXKqMO4U1wz?=
 =?us-ascii?Q?mWcliZ8osMGX7aYbt8/4dH7mExqgzDdEReoCFpM/6TC5XCqvbXcERUun5KBy?=
 =?us-ascii?Q?Tngmn0ZvTXoRJmEGmY2bIigSc8KrPEZN9KaX3NzP68uBUDLcNkTXkaZn9PeC?=
 =?us-ascii?Q?htHOE19f2qxOQYYJenfskidZgBcVSdJurNSKwVno2EVrbcP0ezQs7fJI2A4h?=
 =?us-ascii?Q?W/F/bgR6i0/14nKd3irwGkmw8K/6KMeBbzP4B9Lt2YAeKWr8F7cSsxUHx1EU?=
 =?us-ascii?Q?PWVS/JPlGf2NynsKuzrzM31aKXGwH3bbchlnC4h2xvZ6bak6s12DuG2xOXaO?=
 =?us-ascii?Q?dJUWHZgCm2e0prSj//2RCQfJeqn0Z0C9J6jLMqA/iCDeJJ44C7h12ypnHeQp?=
 =?us-ascii?Q?UbvGH1uooe0KMA6GRoygQINyj0VCatZ4zvXEpNGvFz4sMJw93YyqW3lnhFRe?=
 =?us-ascii?Q?A7lZDnMih9TeZGHrwAemKlk6yyEKa55P/QOUbD5p1tVcWn4KMQv++5sLUT2n?=
 =?us-ascii?Q?LvaZ+hKm5S0I691SlMc8H7BkrNURvEXX0JrnahteYQBUXKb/1z5WWfN7xVdl?=
 =?us-ascii?Q?68rH+tstbHVt/gd1U5JwLPckMJM7ldQPpJKxSdU/9a79BXWe5PCCLbAbV6OD?=
 =?us-ascii?Q?0XJKon/4+U+5D/nll0AI6Ee3LYGZmu0I+99D2p0hH7PAYH1Wb/WUu+0ceyXA?=
 =?us-ascii?Q?0fNvTK2MkSv2XLk1LO1u7IJN7kKI4q5CH1sVr54h59GO3maQ757jMSMgWPSp?=
 =?us-ascii?Q?1x9/Vhc7zracp7DH8IB4puNGM1wMmm9Chy16DyB/SY0A9K0f/BZDQaGGQYwE?=
 =?us-ascii?Q?AFXy20Yzqej0Z2wP28I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:46.9683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6db390-0f0e-43f1-b532-08de0a419ddf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051

In order to asist in reviewing/developing disabling domctl-op patch serie,
we will transiently make MGMT_HYPERCALLS def_bool. And it will become
optional at the last of domctl-op patch serie, where common/domctl.o's
building as a whole becomes dependent upon that setting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/common/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 7bd8a04730..807b213e8b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -649,8 +649,7 @@ config SYSTEM_SUSPEND
 	  If unsure, say N.
 
 config MGMT_HYPERCALLS
-	bool "Enable privileged hypercalls for system management"
-	default y
+	def_bool y
 	help
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint via managing unnessary
-- 
2.34.1


