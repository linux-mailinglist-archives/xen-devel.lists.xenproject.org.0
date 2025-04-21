Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9EA94D4A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960998.1352627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj3-0008HR-2K; Mon, 21 Apr 2025 07:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960998.1352627; Mon, 21 Apr 2025 07:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lj2-0008E7-Ud; Mon, 21 Apr 2025 07:37:56 +0000
Received: by outflank-mailman (input) for mailman id 960998;
 Mon, 21 Apr 2025 07:37:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6lj1-0007m8-Qq
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:37:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 896d24dc-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:37:55 +0200 (CEST)
Received: from MN2PR04CA0004.namprd04.prod.outlook.com (2603:10b6:208:d4::17)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:37:50 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::ca) by MN2PR04CA0004.outlook.office365.com
 (2603:10b6:208:d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 07:37:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:37:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:47 -0500
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
X-Inumbo-ID: 896d24dc-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k74Zq/Py08UBBRG6nHXGlb7123ZLeqF2hpcMiRCfLp/chMeLTxOU/9lWbIU+DaX1HXIRkH/mh3sX8Dz/RADLYCVgLSmu/WRlswqHxT0mg4wVSD8xyG8T9Wuvxhh0gFJTLf0vvrC3sL+2KnXSugQOGWEOoM0HSyiN4TMzdT657txXy7zy1Fuxc/JnC5FCSl6UHksTXHh4GPNkTak79ih05Q+J4sjUhOjOR7JxgqtlonIeu7Snyax92+qOp/e8goH+QeLZtJxU8OSw3KrOlYpLbNFVzKCAL2tXHkfjY2Yz6wAGCRJ46S7jLgfwJLhOPkPnKhRrt2FyoqHGcx/+26iOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh6k+g8a8P3bX846oPvy8UVrY9rgIKh41SXuJfB5ceo=;
 b=k/ZreVE/CI20qncPmFxrphvpkUm5RrEwblKrEz87R0GiHOeeLJg4MRifa6dq0IAO1H8gwCrS85PoElfCRgZoS4UmYuQkjzCVrWDYUCjP3TBZqxOXUjslSX01ZtsSUxgbkbiXULgOhDj2y1H9gs7QktBXa6MFUwz9Y4vA9JWnrm4ynoF//mdgo+XrA23lLrs7Fcivp+byCynW7r55urMvTX1IIgqsesj6cVHcVfvASxSwE8YEC8clcYZhcQbIsN+X68jWMV4kCIJ3fUejCKkzfpmAWK/udBQO5RxuHQlcqHSEOSONa9hKIrQJJbjTslpXsVUm8qXHmq6hWk6GTxjzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh6k+g8a8P3bX846oPvy8UVrY9rgIKh41SXuJfB5ceo=;
 b=n5xJKgc+YXouV/H8jZCqNxB6OZ/bwi4nJkHEM/5PnQjqCJLkIEntKcOQGvGOevq8d7d3nCyiEdvmel8iobiMeIHtAU88Tlpp2uC0j0d7+0wlLl/HPZ5IEmmODPYThVgHtngLrhUmYch74oGuOxYE7eGcQ3FF4AFpe+tyeMsYL4Y=
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
Subject: [PATCH v3 02/20] xen: introduce CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:05 +0800
Message-ID: <20250421073723.3863060-3-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2111da00-48f6-4c42-0c62-08dd80a76b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yeaawpUBG6mQ/8H8f6DU7dBEq1AtriQO3QCfEzRCJ69FTV8oH6iA2dCuCTKf?=
 =?us-ascii?Q?ON7zHZgQ6HSNerdMs1IJu/DDyoD32cEHs3yIvdGW/SJ/xoEUkfB4hxl+mXg5?=
 =?us-ascii?Q?7rjmg9v6dOcmb8lLVPVaFU5kWFtmsmbzcYuBzx/GSQqnv/GHhXcnrdCMKLgg?=
 =?us-ascii?Q?yMWAxx7LcfCnFP3SQRFAKjG1WQ6auzif31tnrH7mB48lZA6+LQIDyszOAUoN?=
 =?us-ascii?Q?VHZaGjqveFVVhODQVONMrniufWJHlut9MD4AY2jji3KFWFkKkCu5442V0bjj?=
 =?us-ascii?Q?VX96z3+5e/V8DQnY/dGVzkgplu0zrmlPK1959P6f9qrhgVrLP8wz91f5oPBo?=
 =?us-ascii?Q?RXL5Cwx8POB9m3Q/DZcBvqN9iRG4jegnatQ/PKN02a6YJpIuw84WOhoXbfUD?=
 =?us-ascii?Q?AesQaAPJXrvDQG/sSEQYw7YwYe3aq1Ae/64bpnNQiHmvuOIE92XLsn0eOoor?=
 =?us-ascii?Q?ptN2/2pulmHuOyn2IWgrfBxBqos7ZpLrzw7xiofpO/XzUvCrWnMwHGFulizt?=
 =?us-ascii?Q?PnoUxDb5PHzJSJwawgrTIN2rvCa9YhyoB6jjX201ICb4rNBS7bSta2b4WdQi?=
 =?us-ascii?Q?X/cNWptUcebjVxmApvSPT+sIKuHZZDByS+54WNYPcI5aoK847qLHFN0imL/C?=
 =?us-ascii?Q?qCGlSHA0exvSbwUFw4cWbYwkFOtgSczqbkD6hAPzFuuyz5m9WFk2T2r12tj5?=
 =?us-ascii?Q?fFfOcWn7VimHk2JX7drdcuEOofF7x6MMFudF04KO2Hi91OnrYH7am8JCbHWP?=
 =?us-ascii?Q?jsRABAmrv6nbsCf+ZbzamEtOiyWsozyHYfeDnfI9Z55z8wibpLjfF2EZpnF5?=
 =?us-ascii?Q?3oD7d2NaD8F/FMvJd7omRfIuuCRDwvxpi+ihY+7EHOmBc0cjEadpXB6akhP1?=
 =?us-ascii?Q?bMDomOQhWJONPUM2J1p7dVHWZaV9Xdakm1bRlgHxiXnab7L+iYCxbHqiE5bC?=
 =?us-ascii?Q?BCTsyxvC+HZHwBKzniuoBcvNxRtqh4+kfmk+KzepPXKbMipCGeuJPNl65ma7?=
 =?us-ascii?Q?Mptpm0z3iS+U8RvZJBsSOnJVjYpi9tzwzKAjANIRrjZS2DL1g+TSxZc6e4wo?=
 =?us-ascii?Q?GNXEyjGY5LE5yxRoceT7DSdmgB1Dz6A5N7u6EB+Ox+0Zg+KifVwW33CJl9rM?=
 =?us-ascii?Q?AI5yVinA9hu1JX88UCJWIveEP7fDKUoljeWuJvZnI6+P+JCq+56a1GjKlpI3?=
 =?us-ascii?Q?Q8mJroflL9kCAzrOfgVaRos+Ec7IUB592UtuoDl7kDCkqoRo/uzEorAzOC9h?=
 =?us-ascii?Q?cHRwoMZ0cQJplFWWWpFFGICFKQpAPRwHWBnh9bdQQwjZTaKxbzjdzBjkp/CX?=
 =?us-ascii?Q?KrYTsB4gyvJEZbTnwRKjD4EX99M2ppNgVBs6vHn2qaJEEY+KT1kARAtAyjcz?=
 =?us-ascii?Q?KIdl+SEYdJL4YQMITVDZWuLXhu4RCsBoHTvEh6yqwCRG8Qml8jW6xA9KG2Wa?=
 =?us-ascii?Q?loOdkPWa0SO8MKCOQFYTMPrK7cHhjMEi4xauZZB2rIRGEvAiPDIt7fa2HP5r?=
 =?us-ascii?Q?XN48OLwUj8XKId57Uhze6Ecn0p05cDsDcoxr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:50.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2111da00-48f6-4c42-0c62-08dd80a76b64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

From: Stefano Stabellini <stefano.stabellini@amd.com>

We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
on some dom0less systems, to reduce Xen footprint.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- remove "intend to" in commit message
---
 xen/common/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index be28060716..d89e9ede77 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -581,4 +581,15 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	default y
+	help
+	  This option shall only be disabled on some dom0less systems,
+	  to reduce Xen footprint.
+endmenu
+
 endmenu
-- 
2.34.1


