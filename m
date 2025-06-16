Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B27ADA899
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016661.1393616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hm-0003n6-84; Mon, 16 Jun 2025 06:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016661.1393616; Mon, 16 Jun 2025 06:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hm-0003ex-2K; Mon, 16 Jun 2025 06:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1016661;
 Mon, 16 Jun 2025 06:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3YM-0008OL-5v
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b42808c-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:44 +0200 (CEST)
Received: from PH0PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:e::7) by
 IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:42:40 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::ff) by PH0PR07CA0032.outlook.office365.com
 (2603:10b6:510:e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Mon,
 16 Jun 2025 06:42:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:36 -0500
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
X-Inumbo-ID: 1b42808c-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYP9fV3paS2Tlz56scLoanfwVAOpYFbJ0r/ynirTVelVl5UaQ0HYKNKAcfmp3XPK5zBe+6vuuEgl1n2/JfQBz936vx6ZaNbGojpX6Vq0uIvuZu1uaTjyt/ChplxmiYsABaUI2d7UvnR/NSaa0u+E2XG+ro6lEoXol8Ov56m2/+WM4xJjFfOoSsw/kL189O+dqPj17CskKvxZzIpDvcBvDu8i+gf0GYnGoU9XalgksnuNEldjEvQRJIi+u32V1XkUVBUKCb+2ZB7Pc2X3rfAgzUpWo56eFnvfBVIFfh8j6LpngnzH2jF5qzkU/I9FtlDDvdlzLn4I77aHvaSTPPhfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwJhrnnb+2MW/ne4s8eBK/wVf0i4fVNoPwNCu0hf/gQ=;
 b=pldeJ2jsfHOT491HG5xpseqxRRGD/gfBWhduaV4j/HT5ZyuliPPotDjLCWWen5rG9VT7kVIffZWU1hLMaGzQKkG9CoQPt/QjnfyVNNsHxTGXT2/LaTbPXMIzAEpGeg4eWJpRPTfR7q6rafzG6cEpUmJQHuM4tTh2uGdjSjpWKLDNUzYVOFaOqUbK1uHKGKhTDkqdRoh3ZC0cMH9rPZb+Y0QJvy2xphHnT/xGyiqxWHF1oo+JeKSDA7vD7polateTegZ/v7N7mcl58g27NVaYK1UtlI2LHd6cqmWNwbzt4Qto1jemlc6reHCBdj6FJMAamjiwIZRcjsyIbXnPkcRy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwJhrnnb+2MW/ne4s8eBK/wVf0i4fVNoPwNCu0hf/gQ=;
 b=h4NSw7ZzQakB2qEsw3z4kvNHSAq9ia7Z2ZxhJwOcW0+C2VgEBEqnMeN8Vd/W0mxAKehY+f/NJzu0h6qQAYJDsO8wWsjQol8bTSw5iiR1obDIPYWYhwhJabbeDYzNxhKOmLFBpU2c7xddppb8Waiimz7KWqIyMYprOq9Bb3KnINI=
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
Subject: [PATCH v5 16/18] xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:26 +0800
Message-ID: <20250616064128.581164-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9c2d25-fa40-486d-d0fb-08ddaca0fcc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zNtPxSMtMXi9I7N4GfqluPnMolpPKH2wyc8YvmYT4g3W+VGI3c0YGmanrRTZ?=
 =?us-ascii?Q?5IHMAN5/5O1dB1R403nVdOt9OILcwPFDcMKjHvUf3NUwlFfILG8PXFpt5jVp?=
 =?us-ascii?Q?6OK197aiLhpCaNITGhwzJCUiPoXbsMQyINjkA3MeRzMFGWgEaxnfP+jALC5H?=
 =?us-ascii?Q?8d+7vZa1YASNF2BZmsiDKHEPN3FiXD/J8+YAxIFwAJihe9q+X7QyZOBKB5Ey?=
 =?us-ascii?Q?lBYTuyRKhNSmeQXLR18RJw1FFg6zaUq9DJfCNS3AmWpLkQdL8IRKqTih5CvP?=
 =?us-ascii?Q?iyUNTM/4mORRAe0qPi72fv4t2613kQhKukf1LL5ij2MDHTW2tScuDvrT5zbH?=
 =?us-ascii?Q?8HhgQVdJr0KjpZ2px2eBjyLE7VTo4oGUQp17mtl2243gA+oLJq2jDqFX7/T2?=
 =?us-ascii?Q?shtPlzb9laNriwvOqkZ9JPFzuztj/02jWn0pRsS1GcxRKlF1UtCl+xyd0NIF?=
 =?us-ascii?Q?Q4zTYDNq2H4ePBt6B7QkFfFw9Gm3gg+H9uuhy0ez3SxaKWrE/87hfYeA/fjA?=
 =?us-ascii?Q?Y48z1mCqgUC1VhhXcxVdPKPlQXR8Cg0wScCXfgclER8xKCZAfPoPGdetalMf?=
 =?us-ascii?Q?5RxWhNlUD+YXIIaURdZ7KXvWJeG9SMXKRH5ll2utj+UIryUfXLSqp08BILn9?=
 =?us-ascii?Q?Sy+hARU2qv05gUkJ39QeI4iHEjg+rBLvlwZLPrhUT211HbbfX6AldAr+rP2m?=
 =?us-ascii?Q?uWyuBvHr6hrPrQdzqI0tjeE/GBtTf5DN8gldTYlRV9aHhGRaoopN39gdZ3Ln?=
 =?us-ascii?Q?YrJMGFy+T9x/zMc0YXdzWHHsJ9f91tCzU/ZC4tfs5TUkZzOR3TU19zwgGmix?=
 =?us-ascii?Q?Lg9gc0H17qff5tM2hvQ6wQnPAB9BAzM7HCallh3g3OgG7XObiQcbECM5z5Fx?=
 =?us-ascii?Q?FSQ8M3fZZaY6xtrqHhD7d7p6Zg8LySUVHQJ+TjYpfM+OF1rYdy3aMKieH0k5?=
 =?us-ascii?Q?wuYjXweaEGvyC4FnvNc/+o5/5BzQadS+q3beTiVz1mCkrsNh7coyNTO6gu1u?=
 =?us-ascii?Q?Di69UqRHJ/wWW8pkYiIKa7Gck7LgdyFHc+fsTMxv+yb7cxtFpr3pwYYRrOce?=
 =?us-ascii?Q?JHO/EH31Xh2PHdVZVc5azb4GmfgATw8gzVnRHqMRmD+3BaDpPGDC4ZIlsDOF?=
 =?us-ascii?Q?LcVHrniPJ+44t5jeF1Xsbo+waGv1BdiyUYEYfTAeL8/2xmaq44v3iD2td2uW?=
 =?us-ascii?Q?0JmtTdrFZYh18QD7DQoUpNjRO+x6Y8avtSdy/uFKqFS3YtWTgm6wm+/RCeGH?=
 =?us-ascii?Q?s4v3loCcHJU0odzdUC++AqUazb3TVG54X+LmEib7XvPNMOnUILwYeP9+sXpX?=
 =?us-ascii?Q?KpB2+S2iQETw46RpVJ1eMG6nLLKPLY+hDVHPC2bFdgyr4MFaRNc6qbOrMW/S?=
 =?us-ascii?Q?GxtvlKiUHAQ1IsCQSEREmaTBIyB5xELYHNtnyhLpo8vWsibmlxEU2Nh4/DsF?=
 =?us-ascii?Q?cHPZhYfCuMil7c5DJ2OME7mQHW9G4GliZ8H6C28lMlqJZxUVAsf8V3g01vPG?=
 =?us-ascii?Q?dT+RdgQKFWc5VnVVaUfUN27aXCbDFaEo4OJu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:39.0806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9c2d25-fa40-486d-d0fb-08ddaca0fcc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519

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


