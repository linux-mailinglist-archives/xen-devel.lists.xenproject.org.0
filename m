Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53233C78957
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168582.1494606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqs-0000oO-Pi; Fri, 21 Nov 2025 10:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168582.1494606; Fri, 21 Nov 2025 10:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqs-0000hl-JX; Fri, 21 Nov 2025 10:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1168582;
 Fri, 21 Nov 2025 10:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqr-0007TB-0e
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:53 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fd5d176-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:51 +0100 (CET)
Received: from SN7PR04CA0015.namprd04.prod.outlook.com (2603:10b6:806:f2::20)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:58:47 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::9) by SN7PR04CA0015.outlook.office365.com
 (2603:10b6:806:f2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:58:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:45 -0800
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
X-Inumbo-ID: 0fd5d176-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmQ1rt+lENMv7gdHWZ0GU3ZA4fOfFxHXSpX8JwdTXlfXK0cbBAACPQ3KdkvBDf8u17fgYin5ryqy+N+r/Qmd0lEK1wy01KTe37VMZNIdz/V4xZX0Avr9qjeNH5anYvzr2HV6xoqQW1JoMNoMqHoJqybqjw5ep8SnD9e17Z/vf1Qj+gVQlcFveYpfWx/EouhpoPCxBwYmIOsWnv+sjesJaBQf3psdSz6PlpcZA0fhJRQonoDyiktU0zjQoH6m1CzH7cNCyRUhGpkQKFDLROph/LHjmhnbmsNqHnEDacS0ua7umyZ2bg9dpA37y8lDpq66/TxxxW9kiI5e5A33kXp7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJQa97U8fCuAP/uXruekBreFwPtbzuy9JqoPuZ3dpZQ=;
 b=QwxVp4kAsmq00Hnf9/vF2qrH23n+Lx40XsvD+S6ZNe0UORJHkrUZHUL4ba4U/7F/8jIqYWlROp5uDOP1I0afZQlDCqEdEHi+6mEruiZc8PkZ8gCLl7mg9nvE+G8jz1bljlv8tdVOqhEasN0vyYN7d8OiCyVBd6qi/lSNR/ATlhCwh5n2bbWY/TI+Q9ZMJzYSe1CLzOxxfhWIT4W3tv9DDX1G3m+Fw1Y8EIyyZPegXip6uAkYarYWviRO/hj3u7aKlfez3i1A8DHhEs81yGNWZzNWd/3M4Ng9M2M25yBKwuZsielWujwa5lbIuJ9pncmf/vEbSPVsGQgtBtYH2ET6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJQa97U8fCuAP/uXruekBreFwPtbzuy9JqoPuZ3dpZQ=;
 b=d4zkzIJq8N03DggK5o8HlFDHOo7MI8+tEgmB3+kmOVwrIYNmWHACI6OSOcvirxUk/8M+xWy7i/XxmMEIaBUz4hSU7zZSXr6ZsziRa2wolbG+AKWtnvrypDg83XFS1/1djEe9xeDaNHQdnqqakCcyEW3q14KQtFG6OcyxWTW54cU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 07/24] xen/mem_sharing: make memory sharing depend on MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:44 +0800
Message-ID: <20251121105801.1251262-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e54b4b-31a3-4dee-b37d-08de28ecf258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/99LccyDKjT7hDg1mNae94XqBonr2M/Tpg0A7VtQcaWeTmoGzEjG3KkT1ed7?=
 =?us-ascii?Q?AvHFDZ0PAojBZG2BgttZfxyIdNUKxRsWAX2gerHAzYpCjQEsjtx9tm6a/C2J?=
 =?us-ascii?Q?zxPwjAaT9Avt1DGJwbUy6z/+3d8yAm6/3wuTWHl+11K6XSIjz3UptnR2mqZo?=
 =?us-ascii?Q?rTieeyoiDXUceumXlA1F6lIM5Q7y3G9f0fZIglDdhi9X6MiWD/aMz6wOuydi?=
 =?us-ascii?Q?roxpNeoSCL8DNUzjDmDIdggRuh/WghJkCkK90IjpaNY1T0LaH5gV/COJtCJb?=
 =?us-ascii?Q?TC6CGyzKF7hDQj81Lbl5Q0Rpr9Y5sq7IQLHgA4cn9lFqRcwNHl/yeLje2gV7?=
 =?us-ascii?Q?wRSlS/tTGYouZUJ1j1ElFWKXfswE6iC1AhJZpO7BCv6Qz4zYZlf7rkYnHtLn?=
 =?us-ascii?Q?JlJJraOVIgyjaE6sCaE8yKNZLWaGudL9QAHei++UbXoGSPX7vM8IbSJLNLhX?=
 =?us-ascii?Q?PWi955xGDEgAnCcBNMsqU2zT5wRGW+zk7uT3VjSjnv1p25h/QHbh6PebW90L?=
 =?us-ascii?Q?8utsNe8xKa7RcjPuznznAQEu5DYXdknnDCfCPdNzd5XpcHzdARikgALei98N?=
 =?us-ascii?Q?yDJ++KYO2cVULTvfklyT8pEL/4mpF/0A193PdE+5DTmtP1T9b+jgdGxEJkdw?=
 =?us-ascii?Q?eRUSnUhnAU566npgXiBmcBwRzIpmLzLSM2G8yhcW2OB364z+BAfVPeKGHFve?=
 =?us-ascii?Q?m7v6jqeEaW6KIX14wcM/k8TGIqyrzbW2X9H4M5HJeRN6zYSng2bGQ8ycEKDa?=
 =?us-ascii?Q?SI9+lkuOAYiL0byn3oTkFarv4u9Wl5MkvcP6Z2nBANnQvz9uC/YQg4in7pS6?=
 =?us-ascii?Q?hT3rvv/CjtbXTlQ5/FITSgD4Zao2X4o8cAdo7XZEKMZQwWfPwTzEqVdGawcP?=
 =?us-ascii?Q?1qT12qhR8kV1UFXQt5RvZaDanI4C0HPMfL+zGLalZ4Bf7lI8DZCM/bnmv2lr?=
 =?us-ascii?Q?k6xzSotC+eHA+nat/u33XaWrx2MF6CT7qiHYvM9mppHFD8GZCQ2V5nvBE7fz?=
 =?us-ascii?Q?yZa0I9+uYD6kiGjdYLY5EgZxhyCLtpaK0rduliMUBzEZBsnB2K6l8y3LnwKQ?=
 =?us-ascii?Q?dfqKN/JtChwrO61eJDsPko8b4h1CL43DgYHaibTl2rjFYa1zDtBDQp8Beq2g?=
 =?us-ascii?Q?M9L5aPuepbEgZ25/SAgdWpwV7ss/pCk+migef/0LRhryC6gmKRb/8252IOuN?=
 =?us-ascii?Q?e4E87Pr+d8R7JbzdGUtvr6EAVZEGgI/YMSbb4qHi7MXUshagEbsYwvKMgmXx?=
 =?us-ascii?Q?tveoaNCtyInMdvi8nFTWpnektvO3FuJgn/YKuNE/KO647VKUVlRSDJjYynwu?=
 =?us-ascii?Q?2lLnDrWyMa0eu31Ban4evwwW23HMKQbVGS1o4NY1Bqp193zuEuOjLuy9m6Ii?=
 =?us-ascii?Q?8Yuoqf9Qt6YBQ7m2BVK8HnJYx7LqfnyCg4y5BIcWghOzAbn98W0Ozb6dVUBd?=
 =?us-ascii?Q?PH0jmeQmKJk3Lnxn5Gj75lJhGfTnqfijyx5JwmsHVT3FvgAN2G+WEaFgaOMO?=
 =?us-ascii?Q?d4PCnLf+VOSG3Nr8dheNCWq4HPYhhHgsy0vYm/Diy/IMXIeaSMmZiqqSknoD?=
 =?us-ascii?Q?D4kif4gLR4n0OpgvyFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:47.5757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e54b4b-31a3-4dee-b37d-08de28ecf258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404

The enabling bit (d->arch.hvm.mem_sharing.enabled) for memory sharing could
only be enabled via domctl-op, so we shall make memory sharing feature
depend on MGMT_HYPERCALLS.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/hvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 62dfb1b6f1..d540c0ebf3 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -81,5 +81,6 @@ config MEM_PAGING
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
+	depends on MGMT_HYPERCALLS
 
 endif
-- 
2.34.1


