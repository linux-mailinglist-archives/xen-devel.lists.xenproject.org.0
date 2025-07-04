Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8947AF8EE8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033191.1406648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvG-0008NQ-Ah; Fri, 04 Jul 2025 09:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033191.1406648; Fri, 04 Jul 2025 09:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvG-0008Ll-7F; Fri, 04 Jul 2025 09:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1033191;
 Fri, 04 Jul 2025 09:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcl5-0007ek-HX
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:31:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96256cc8-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:57 +0200 (CEST)
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by MW4PR12MB8612.namprd12.prod.outlook.com (2603:10b6:303:1ec::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 4 Jul
 2025 09:30:53 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::19) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:49 -0500
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
X-Inumbo-ID: 96256cc8-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdVCjBljNIgINQUqNubGYY4fJsDad1djfPGkT6BzMxwD2mAUioMpVOqF8/mVb6G+0LqPNY994lQ8iB7xOWn6Evrh6yJ6i31WULeeHdZkyFwrzInSneSIcWt50sRefpmxRc95Kdb4RugFbl/7/MNGKcBPKlHgQT8F/hVmKbF18YGPkuqy+w3U9ge7jcOkPK0waIMF0XquQ8ekP0n7uFtd1Hn3ZL3zf+6lG08mCtV6o01W7u2hgZaEzsFC47LsCsj9M9hKTG8pRlSyNT+mZD6AxSb1/3RKtoS+92oNvcmoXX3fCIup0473JgIAmki3zYBqtAMl/6n2oCGs/U1YcdkaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwJhrnnb+2MW/ne4s8eBK/wVf0i4fVNoPwNCu0hf/gQ=;
 b=OqOXq6I43jzoaiwKPGOJUXIUgayx3GmxyTzXwam7ITkh5VYWrt656F8xeAZqW4uzIsxTn0Wf+2STzy/4qXtdn4ubIj9DZC0ktZVuU5kjAZcCQS0lBSS/r6j23jSFEncZShn9UVjt6E5PryWOs21QFl6q91XmE/l97P+Nh8CVmHPI33OFx9DnDLIwRnk3mk7tESPcgd1ni0jWBoJRC4Yns9KERabA1rX91ew4imLecq1lrkZKgqqCOJsZh1yyK6ACbSm/1rknPjeefvQH6asnCTANyA5Roz5cYrIAs/JvZIiJ02I9RGUO88rhReV7sk0/OA1QPPTinZhA7lnMrcYXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwJhrnnb+2MW/ne4s8eBK/wVf0i4fVNoPwNCu0hf/gQ=;
 b=i7Fy5xluZoDI8Nt7EXg4mHsk3ZlAQoWEZ/8OXEQgnQTiwp2amjdz+uObCFo9BVUW9DAfYqEEJ6Alouh58EiBF2IR8g7AJVsraAxDodYirofruRzmpoJhLRgmPiUkYA+44P2Pamzl6unruYDiWB+9AYxdaW9WwHPZoAXP+nFYb4M=
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
Subject: [PATCH v6 15/18] xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:49 +0800
Message-ID: <20250704092952.822578-16-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MW4PR12MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef6a896-af1d-4baa-8e80-08ddbadd7914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?78vKLrotZcLwLeUyAdMDgq5U8J+SD6YT1E/xTlWFrA51Nas3zV2xSTBTUMvy?=
 =?us-ascii?Q?3Y+sdQp44W42ee12YTWqbtvvgI4QKIxD4gScXkxkXaTs9QW1AXbmUGxlI+ZC?=
 =?us-ascii?Q?LIJWefp1nuuhx3TGR7mimN6yDHNSwiFPTzrwtCNWB5aZRUwvV1mXfnDAUTE+?=
 =?us-ascii?Q?MkKsQ2/Ey7oAuH9Vx00P7NdkY0m0OX6fD754nJ9bLE5o3jwi/IUtzHGnCvov?=
 =?us-ascii?Q?ZGUbOzR6WAG6mlXnHh1Shbfhv8u2sZiB8HHTFEKFmnSV9I46Unt3+SG8CGKm?=
 =?us-ascii?Q?FSPwGlY57IB+X8ua05P2iSbI07HRgbUzXCSQnOTIemGyhft86JegIjz2srfq?=
 =?us-ascii?Q?PYKUryNupGVlZhwNpIlpFDXga3PrAbkiAxEsSV5IelpB9o1qU5MZ/0JutJRV?=
 =?us-ascii?Q?m1UWyiJRj2/8++pxEw9J0fyXNwi1ke8imx6VJKrSRb9p9YII1n50z3GchyZd?=
 =?us-ascii?Q?Tr6OvgJ+I/FEgCgePTvD1eWycAdVEofvgcfkOFeS8oXQm/6gxF93+GKQfqV6?=
 =?us-ascii?Q?qdUEinSg4iDQuC6HDmb/FbKU9y8liGDPwswc6Xu8dFwWxOT2LPz9UKg/sd1Y?=
 =?us-ascii?Q?ouR9bE28JjIkeumk/XXA38VCAgUbaV+V6uV30/u+MYy00PHfcOpOuJJ/fdqo?=
 =?us-ascii?Q?hrS3LWWhN1pqOL54o1ZNi5Oym8kWEJFBCG6ag8AefXTqeeemH1+gWRqTAbAr?=
 =?us-ascii?Q?0lGK3D1K/BjpZHanwE8ovCaVCT/hG3nnMT1Doycp5+e1BLk+0wxnsvFsyLmS?=
 =?us-ascii?Q?IIHvC9aU00svqoeZWZjizlCtRZQtah3C6A2pVLeMhzzL1ie5N7goyBq9tGz8?=
 =?us-ascii?Q?n482awVFXcixDIBEILnoW/YdqbDriEh9e/TfgaFkpCEtYgRr7RXsxFiiddd1?=
 =?us-ascii?Q?cDhZsYi02aojG6OHSZo0mPcZBVqCqBFUdJFINfXSGHKpH4oabNi8xjakmtHt?=
 =?us-ascii?Q?cHUE605alEAxLoxS/ahqQDLukLWD/HmGeyHIuRi+/IeU+5Z2U4PJIlMPMGyW?=
 =?us-ascii?Q?Nu4KRr9CjtxTzAq6w4LodTNXxQMKEFQuweZA2K/B/KymN2b67Hp8nAdmzpu2?=
 =?us-ascii?Q?JBCgnFeu6XtpIDtuZNqedV9xbX8MndR9v6mp/KEp4LnaZVO4CL/enkIH3LHD?=
 =?us-ascii?Q?QrCqr8FBzC7j8833o5fbFYLtl5cHKwl8t4TI62aAiydqlTlTRfQ6crfJN2uS?=
 =?us-ascii?Q?vOjN+cmjWAjYlDN9Fh1mlMFS1mUO8whnUW5fuW6kygn90Ayvbncu2Hakohtf?=
 =?us-ascii?Q?3xT7EM+vFgnizpepUC7ri1Uz6P9S6cijwetkCitGXxgAzcwyiDo8h7vYniQW?=
 =?us-ascii?Q?7gLFcjvz1toVmp1CpTVLjCaUupiZneiGf07rgWPYRlK8SKVkmF/flSGR7OS8?=
 =?us-ascii?Q?VU0z4kzAanUkVD5uRUqdBo9IYcQWI4/lHVnQ+k8N/rKmPf7+DlHf08+BnBxL?=
 =?us-ascii?Q?425PFRsmh3SoFx6sVhcv1NN2KYsK8rtNggXXTiua0qGu3TWr1DqfxIEPFc5L?=
 =?us-ascii?Q?AP9CXHfQUfse2DhY8hWpbDZCzQbj+XM75wmh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:53.7048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef6a896-af1d-4baa-8e80-08ddbadd7914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8612

LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 998e672fa7..65f07289dd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -472,7 +472,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
-- 
2.34.1


