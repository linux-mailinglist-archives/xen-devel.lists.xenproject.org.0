Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA62AF8EE0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033153.1406628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcub-0006hq-LL; Fri, 04 Jul 2025 09:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033153.1406628; Fri, 04 Jul 2025 09:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcub-0006fp-Gw; Fri, 04 Jul 2025 09:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1033153;
 Fri, 04 Jul 2025 09:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcl3-0007ek-HO
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:31:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 950d1e49-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:55 +0200 (CEST)
Received: from SJ0PR03CA0106.namprd03.prod.outlook.com (2603:10b6:a03:333::21)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:30:51 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::c5) by SJ0PR03CA0106.outlook.office365.com
 (2603:10b6:a03:333::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:46 -0500
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
X-Inumbo-ID: 950d1e49-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpB4Sgkq/lkRWagYKc8OH8/QuQwqCJ3kBOapyhA6A7wbSAmTyMzvd8WpKjbP2YcSzT2LckY/VcHwsdJlKXMN0KhKWxfTNdhj9P3BCWJITmWvI72legNNk8F16JbK8j+8w0cVkJWEFTQeG2gdSQ/kMT2EWnnOT7hfkKsaPkoCWFvfo+oiljNbue94NtV2NGSV+kWUoy6wgzQvtnIrA+s6sX2Ecs5aJwUp6aZ6sh4tUx5QiFkXfk15DnIuA3C3mBx4qZdjAmihqB5rqKq8WhHp0c2BtNDrP8FmzX65Ncva4CNt8Law6iygLyKyPAHPEBhDmfmCA8C38xcR7raKMhXQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35yKf3d5uTnHBVPeuSh9Vu35IJaCNYT50NKMa26ijs0=;
 b=gWqEizxDNV2JJtXr3+51+yDkXHVUlI2MXxBM70wI5QnTEvpczDpPHMf7Y02Xz5iV6+GKItH+1DbJbEQ3SL++HRAfHIFQDKHL3QfYZ9G3b2CpacuR0ClTLzvdGh0RcC3zbSWU+muVwp4ShhoCR2tK8Uo5ZOL0BLVu5S+OLjH6/eb6URlTuaM0lNkfW+qQgzzuXTmEgn1c4rQ2WsYRZt5/T7n2gFLW0KRLIS8Mu+1yN5iIJOWWV+om1vBC+EEebRU77rDtqtYIwxrb30myR7yNpeDYzryqHMf4V8dp5Rg5nv8NOftef/0rWLpCQS9lczLlL3ivqRfJRY1opHCXnqhBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35yKf3d5uTnHBVPeuSh9Vu35IJaCNYT50NKMa26ijs0=;
 b=1PbjiyuWZunGo505kYbO+XT9znA0owFmv9MBsgYW8CArIV2Ao0hWApoo0PaZ0hTwwqOfOe6Q4OJOnVpb12b+w+2dOgrZOvuvy5BLmD24fuTJ+zrm/gJ8HfGd331GdQCElTdqhawp8Cc9wF5WlbuAxdXw6/djGlNutg7Y96tWLks=
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
Subject: [PATCH v6 14/18] xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:48 +0800
Message-ID: <20250704092952.822578-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 624b0f36-631b-4215-7d88-08ddbadd774d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aZZ2/pyrUJAg/uTdIqmdj/xX7KGcSyqlNfENibrfPiHWpVh5tzlUq0Kh8LEW?=
 =?us-ascii?Q?5GHkP+VZIERKsjRESTDgiv060wYJ2EuqzsEdlM3CN/om1JxrA7unxbXsJMQ4?=
 =?us-ascii?Q?MdrgLqxR5l2aRLygjJ35VO2JeUqt3t2+PtyEZBCszCvLkgtsHZspjUM9Ep/q?=
 =?us-ascii?Q?owx01kC1fftkrWNMtEE6h0fX6dnnD0Ni2YxcO7hJ5oP3b+agFKzgBHabSQAd?=
 =?us-ascii?Q?+JP/BtH2V+3eatvKYYhQ6Ec63uBWU6POFjrcakr2zrCe8iz/+a80sW0LB/K7?=
 =?us-ascii?Q?Fzm9VAxJcpmAC0KF5QtczqCuc00DlFcM9VRb+WEexAmBOUE9eDM/O5sOkXGR?=
 =?us-ascii?Q?mh6kwyBvFl+KbmWBLolFEL5cC0LtoFBk3tm47cmed+khDNAdEjHNDwGaK4k/?=
 =?us-ascii?Q?5LRmUgqLM1woneIBWNqGq/xw0Sv+3r/4pn3YfBWVxCflcwAfVLM+cIE95r6M?=
 =?us-ascii?Q?dl3tQKgvYEQz4YLJnPSdtsJbD7wwloXuWujaxr0+tjYR3DmjVGWmWO29G1hC?=
 =?us-ascii?Q?r3suC2g46VL/fJYFtKC9pYcJM/PWZeOwgC5YR6XwYq0Ka3bv0vipjfK7AAAg?=
 =?us-ascii?Q?PKHueLEZNKJaJsO69+B6pHGwhN/+SAKqOVzR/W9OR3b3FktrVZj94CbNYeOA?=
 =?us-ascii?Q?2t2RtvsBgSYNuymmPxHu5/7UlXR7jgFCWCsEFIiTZhZZmX2nWgjEticuEHSD?=
 =?us-ascii?Q?a4Vebr8jB4epzY2cFca3GE8JKpYbmSbkeXssBEZoJTQbuInmC+bU+sVi+rCi?=
 =?us-ascii?Q?ElVfuNtgRawNABUC99Cith5FpM/003WF3oRTyrJqL/57Wxrdp57eADdbGQZ/?=
 =?us-ascii?Q?LDXdWPov//5/E1g2U9mQHqTrnp4fLa1tCYXrJsWZuEEAFuu7UiF7UMdM4G22?=
 =?us-ascii?Q?l8zKEApzCMXWgb7aK+dCzAgF7GFp0v/QRHOCx+0/z2Kq4tOdozKjEO87MKcX?=
 =?us-ascii?Q?p5qUk/mUCQtV3+9nepCHahE6MA5ffAOcwCv6ZznJMHtiQp/7IkfKG0YD46Ll?=
 =?us-ascii?Q?FDaHNXW5OTxpnp3i4FygOUOl/eGp8jEIouYmzzvagLLT0IpHbFR3COr/FaqB?=
 =?us-ascii?Q?cFnIfIupXw4Vwoij7RWSo4pc87Ds9P+ybx4CZuQi/TI8USaPadBCE1ZmSE51?=
 =?us-ascii?Q?nzqOR3StSl6V4zuuTM19QWIwdFnzBHwZJyefzv3bDC4aZykv5z+GYngFmJUo?=
 =?us-ascii?Q?hF7O4G0pmuRUi72vwayYAU+aq6/hSXq0nkuC2K1VaJdjtl3cBVO65rVRkQQV?=
 =?us-ascii?Q?laajY34NAPuyp6xp8+SCS2j890UCKEjzBnJxmoH3ykoRSO6cUhdV/U+1/cNc?=
 =?us-ascii?Q?dFvG3Dj6ucD8g0PTUAMDrBF+qrheKqGyk8D9HVz9LebnPvpc00jSo22jAv0a?=
 =?us-ascii?Q?MZEXEyAsT9a5gKE8I+H+m3IqYF0QziH5vuQ/mvb9niVUuXamEx2cWKSUzQnq?=
 =?us-ascii?Q?KAM3DehYp9jDUIIgm5XAgATssbNeku76eojNSYVO3NtX68GeI2FRC9xmsg+D?=
 =?us-ascii?Q?z8T6SNT0aVTk8nwEyYnmfhbXlM/WqRfvIBUc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:50.7133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624b0f36-631b-4215-7d88-08ddbadd774d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507

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


