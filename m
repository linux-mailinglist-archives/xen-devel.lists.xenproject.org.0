Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF1B093A1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047199.1417667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmY-0003GN-0q; Thu, 17 Jul 2025 17:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047199.1417667; Thu, 17 Jul 2025 17:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmX-0003DC-TK; Thu, 17 Jul 2025 17:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1047199;
 Thu, 17 Jul 2025 17:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucSmX-0003CT-1o
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:52:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf7b6c36-6336-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 19:52:31 +0200 (CEST)
Received: from SJ0PR03CA0141.namprd03.prod.outlook.com (2603:10b6:a03:33c::26)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 17:52:13 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::86) by SJ0PR03CA0141.outlook.office365.com
 (2603:10b6:a03:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Thu,
 17 Jul 2025 17:52:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 17:52:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 12:52:06 -0500
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
X-Inumbo-ID: cf7b6c36-6336-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV8S4JB9w67JeaTOnZLl/DL2D7B92URPDO7zXj0QS59PrCxd33VD336WGMsubP0w8F15lNfY03Btun2PAamy4HutraKgXABWWd0jNznRSBkDS8NnwAW5a9XgJl7uMlDiNl5kxrwUn0TdB6SXyQ78QOSpKVASahvIUsepedMZ/YGhg0oK+B3/E7Maow3yFjZlfQaALHDXNiHsSbrFz8OC7Po+UVJZ05HtBl28jAVZ0Bl8HJ6fXoqfj58A5Sw7bRhk9deC/8J+Je2qKmH4sRLj8kaVghgHpOX0ddqX8wEnfG8Tx0nwccgHTP3l4FJ8VyaAtSh5k6yxmkpD233NWbXxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVqJy8u+ZQH3wJGcwDe1Leaf8U63aTNrpPQjEZwcVgY=;
 b=swLmhwUBmSzZzTEi++a16BY0ySsrivRbofPnxcaV8AuKw9am+mHsEsD1Jg+fEoae3gY15T7c+fHYZnMhs4z/p5EN7l0BnV2jUIWgXAlxBDt3d3Qzl9+7c6XCwqtoOVMI1Gt3m1wPOPUoDDX+ch3ATtm1eJWDn5EygFCgkitiz0FDohQVuzeTimF1LK6EGLetl4Aa7nnTzzccZF1TDi4p/bK8TM5LNAbSRJw2fW8rpzP+cIUbTwuRBJFxXy9v/rrfcTUMi/KfZ8hHEIVuTW9d3UKCMuSIX2q3/06Cw27FhxxWzlTfAVCF2acfSeNqDCXRoYIYuucmya1uB8oysKl7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVqJy8u+ZQH3wJGcwDe1Leaf8U63aTNrpPQjEZwcVgY=;
 b=AbhahNXYd6RWZhXgSewEYxCehzaxng/6UfRnlMr+lPV3cB02dEDbIHHtGZtdJ8Y7vVjhL/tLNwQgiY0ZhbQdBqUtZ+MiBF3nzXg854qXThX5FwZ43do6OGnHPG/vbuvFeh7tWJnjGpk27JQZ6k8YAUdi1MdvNpwliR5ZNg12RAE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/2] generalise vcpu0 creation for predefined domains
Date: Thu, 17 Jul 2025 19:51:25 +0200
Message-ID: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2ae599-3a9c-4901-93d8-08ddc55aa916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tBuqrnuSolgsCf5EI2OYf/eR4E9+cUQQTX6Ityr8GqFvJ9ieRFNeSKSq8imQ?=
 =?us-ascii?Q?ngXG3gvET9WVYbrQ/cRvqN6TxBYhljV6YODEindZPysa4PKRDQnHTG8zdCo4?=
 =?us-ascii?Q?qZdh5fZJQ5MfvekfGCYfv5AZyJYWhWahhtYemcqtMWzqeMYNY4sBHXvZvDvv?=
 =?us-ascii?Q?DLeELLpAI1alEZ+MQBDqI2G/t2XQ1VuOwbVz2Vn8FLFZ7I93OD7b1CZe3wYv?=
 =?us-ascii?Q?+DOGsG6OjClhocGHogR83rVnknpdwb6geSH8IAb6Z1WX6nT+SXD7H72MrOED?=
 =?us-ascii?Q?3jVnH5yNWEKMuG2E5JQdMoHvgBqvxB0sSRmGg4mADcOFgQfKZXR5Hre6vonc?=
 =?us-ascii?Q?0ZSWRIQmQnnn+QJHjo9XOfJhLwysxyBSZaJDGu96vxGWd0OVunlax78PfHXm?=
 =?us-ascii?Q?BzzmCJJURBLAPI4jQSGC++e6C2zV0vcp4WCP/G83Nj3FlUKmv36wOnRqLKOY?=
 =?us-ascii?Q?T9CfixO+0X2AAX9gtIW6BgUykNIXOkabGGUDqtEzKhROLMxbua0NBumrFQrW?=
 =?us-ascii?Q?NrZ6n6C8U0FDwokxfhp46ijU4ym8YEGzAaZ/3yJkG+tVjbE957hLVbwiDtw/?=
 =?us-ascii?Q?ifnsmfXvq4sYKUbGsqQuVL48UGS6tc0vi2VxBKbCeGYBJQ/Hm4sfATjFD0uc?=
 =?us-ascii?Q?o+86fi/liwrjNlKvDz3eXxxkwM94l3woqWsqv1/EOQOODaSyCF0CVrcOTh7b?=
 =?us-ascii?Q?dheoJ/Fu6ULSkbgSO7I3ew8MZcM1Y62QgxXjOjeS246KLmDkAIMNPSI+1UOL?=
 =?us-ascii?Q?bZAumVmR7sgQ7DMED51qU7qUWOwgBMpIjAc7HfD48qyWzuf7TKKOff+7uUOE?=
 =?us-ascii?Q?gkiGhLtGYMPvhsqcm0DlOrsjeeEN8V111rcm2BLSzW9c3FJs4KgmdTZtsQBx?=
 =?us-ascii?Q?IV3KXUmO7Oh70w0yUxm2yeSswD0acIf4n0tC9UB7+rZg4jNh5cO8VG7z1eBJ?=
 =?us-ascii?Q?DCrnBSrRZLKmDljm/ZuwMF4nm0qYC2Rhy2Ar2h0wf8E9ajaoihTHSO+JGNAi?=
 =?us-ascii?Q?LhPLoAhpUuy7Y9NU+2Khwl3Z16ibmTpTxSr4viE627WQiHMo9LzT0xp8iA7B?=
 =?us-ascii?Q?JDV3mozYuxxCNyL+qSQlYtN7DTHX0p6O+NlR/vK+t/CjRdswqajN3plb0vkq?=
 =?us-ascii?Q?kscowXoX5kqIn4MXve6LZGmf90CCK3xQ2kIVjpfZ/c0ZnrvI5kVRP6uW8z4c?=
 =?us-ascii?Q?YlwWHCHDXXPE4nRppQn0qtB9BTdnpqLCrhuyqJWBruWIc/O4LMkHoWgKY6gn?=
 =?us-ascii?Q?pVa4YHmT2/NSvQyc3QU6DOFdzUaS2O28E+TpgqzqDQlImZjfZQ4tvpb+v7GR?=
 =?us-ascii?Q?lo/8k5Ya5fylK7WJDRmQjzxB6aLrIJOMUQM0sxd1Ga9JsVwx10oaf1tRUowh?=
 =?us-ascii?Q?faouKnU4nEV5PDRpIL1+tOHNsJZiXoQMynXO6eGyTgD0gEZifA7taTFfmFuO?=
 =?us-ascii?Q?TfLTVXrUju5Bb1EAkM6a5p/bmlnP/x973tEKZ09YA+VWIjsohA1uvjDLM1wK?=
 =?us-ascii?Q?psLiBm4kLlgiCCEvNOWJRvs0GoKNT5nN9/OVjfpKuRBfIFQFuSNejfytaQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 17:52:12.9702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2ae599-3a9c-4901-93d8-08ddc55aa916
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808

Hi,

This patch is a very compressed version of Daniel's. Originally, it
performed code motion between dom0_build.c and domain-builder/domain.c,
but in order for this to go in early, I've compressed everything in a
single hunk and left it in dom0_build.c.

We can move whatever must be moved later on.

I could see inlining the affinity settings and removing this function
altogether (having a regular vcpu_create() in its place). I've kept it
as is for consistency with the previous patch.

See https://lore.kernel.org/xen-devel/20250515131744.3843-5-dpsmith@apertussolutions.com/

I've kept the S-by too, as this patch descends directly from that one.

Differences with Daniel's RFC:
  * Function takes a domain, as the struct already exists by then.
  * Apply dom0 cmdline overrides to control and hardware domains.
  * Keep everything in dom0_build.c for the time being.
  * Remove arm's incarnation of the function. It's just useless.

Cheers,
Alejandro

Alejandro Vallejo (2):
  arm: Remove alloc_dom0_vcpu0()
  x86: generalise vcpu0 creation for a domain

 xen/arch/arm/domain_build.c           |  7 +------
 xen/arch/x86/dom0_build.c             | 12 ++++++++----
 xen/arch/x86/include/asm/dom0_build.h |  5 +++++
 xen/arch/x86/setup.c                  |  6 ++++--
 xen/include/xen/domain.h              |  1 -
 5 files changed, 18 insertions(+), 13 deletions(-)


base-commit: 55719030b0bb0069fc8b57cd808dc98dc9d39add
-- 
2.43.0


