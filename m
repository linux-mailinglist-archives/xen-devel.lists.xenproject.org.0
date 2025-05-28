Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA77AC658A
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999062.1379793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv9-0001rB-KA; Wed, 28 May 2025 09:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999062.1379793; Wed, 28 May 2025 09:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCv9-0001nX-F3; Wed, 28 May 2025 09:17:59 +0000
Received: by outflank-mailman (input) for mailman id 999062;
 Wed, 28 May 2025 09:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCv8-0001jE-6p
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:17:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a340abee-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:17:56 +0200 (CEST)
Received: from SN4PR0501CA0114.namprd05.prod.outlook.com
 (2603:10b6:803:42::31) by MW4PR12MB6827.namprd12.prod.outlook.com
 (2603:10b6:303:20b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 09:17:52 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::98) by SN4PR0501CA0114.outlook.office365.com
 (2603:10b6:803:42::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Wed,
 28 May 2025 09:17:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:52 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:48 -0500
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
X-Inumbo-ID: a340abee-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN0KWN0Cj7UQ7m5uKuGlie0Kr4uUvGzGzxqWOI3SF32pCPtAl70EMWW1gKzVIbWE0CqGiGKAixRA9Kpo1sMgG+K8C8SwGM3z8aTB6KU6VtRIrTCtiYfifiJ6HzQcTUKI1Sbl/OmUcO8hXu/yX+b5PreZnOHIGRoSO98mKLb6p8a98x+bvuPUszcXx683+cY7NOJ6pc+K5Q66D02YUUzZLgQTrfrsLOEwS5ux3UhYTP1vU+NXYN34lfoV3W7J9N1UM8tuUaraMjDZggBU5U3bI6fwUOgiYNY6ILqenMhxOgk01hYGRjgBqG4IOo2CSy1Rzrp5aVVl6Kw7HkNV3J/yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IInfV2ukP7/cIfBLXmKwCiycp7vzTCpHzRB2edrn7tA=;
 b=ZEntzBlcHHYccXcyiXdlpeSIvehJbF4C0FGlTpj2pc7etUs9pnRxMrqsPgdYdvLPwjRIgSUh3XKvdA9TCwA+ODXl16wq+iGP+pXKmtNCZ262BFqgSaJnzDhP6Jx66mB2yl81L7C7tKWSpIUEdatfBzTxerqaZYsq7Q+Z/XkoVmqfekj0ckHwnYGksrqpBrvK+REpB4fJuXc+CfL9LfdbuIb984AJ0OWdksEIfGISOq1RpdkT4RnBJ1asQtEJ2bDKs2g+yAtPh1/HLSpxfxz2+flD9GfJvdDEBl8NsUU+B/W7sc/H/R+DEM4b1nTMNMTraWBPmkfIuwrLaHQakSBeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IInfV2ukP7/cIfBLXmKwCiycp7vzTCpHzRB2edrn7tA=;
 b=U2WkvG00t2wc5ivWH5T+jZtKgdt2qlRJoBoVSk8zBTkScjQunEJI+xv1qVuDdpWgW03r7CnQpSjd7F3YB41clsrIfmDvss9TtJoyb9tbGtkMED/xTCjkbAMr+1acrzaRYpzBlwn728/OGPr2W1nXjS318aeRRbDSzEFIC6dRX3A=
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
Subject: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:16:52 +0800
Message-ID: <20250528091708.390767-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|MW4PR12MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af7723b-2623-4f05-a6d8-08dd9dc885eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RUm6UfY61yUKgzzTGCB5svrBqvDANV084lmt9bRDIx9zxNjbbmhSg5VXuBsf?=
 =?us-ascii?Q?XImz05P9kJ1eNiDHDqYIYSmpEefFEkiFtjTgNcukQoo1vHHG0c9aDxcHAKWZ?=
 =?us-ascii?Q?jLAao3GpBcZUCdVAoknYUQ1ctuwxz/rt6SoFTBHJJB1UDKvrVYjwEXPe8ux8?=
 =?us-ascii?Q?pLWmIJRRSUjDAufGIysoW0q3k10OU4JUboQr90G8fqngGhp7T9gcMuMHFnZN?=
 =?us-ascii?Q?LUthFXpKB/n8Dy1hNUJRRgy6gYGe/P2qlIEaq0IvLzSokQSj5LeNetrRe/AT?=
 =?us-ascii?Q?lcouxOQNnnZJZ7oeMBVCxn+fURLAsoeKBS1nkemAdihOCWEv1oKcjCbU+oOG?=
 =?us-ascii?Q?jLvSbEaN6XF7zMrhDfz8skudzW8JiO171FArBu5bsaoo9ODF5iuIxZ4FOB72?=
 =?us-ascii?Q?nNobK2em/qYu/Hd5rt2zMib0zy9Er66N4MxufCBr+P0V5ZdbJtjO1vKWVNI0?=
 =?us-ascii?Q?EPYG0W+mChYTn8sZBeCL9gqSR06WzqXPxwNsO5ZsrG1zSOO4Zyi1LrH/9evy?=
 =?us-ascii?Q?NAbFBdjPFnqkImHvw/ebfR26+Z0bahXY/QMf4GOaOLXrYycN2FBnacDsr6Bd?=
 =?us-ascii?Q?wGhLxyhs3eRiqI3C/uj83oLidG9Tb0SbkQV41KcPiwwHElvjIFiDCZjIaMz9?=
 =?us-ascii?Q?crKvje5XuEuh6euSBOAVomXO2+vVQ8xf6gwo2RQGPnrXW7ivwp6OKSgKIjS6?=
 =?us-ascii?Q?IJg9Slk2ZifiG00QL5p/cUUez2nNJ2ep7muqAQOT8KO+JzI7DE48kHK32ylP?=
 =?us-ascii?Q?tIkpmlgAt6Upu0Id1Qkz60ji7kQjff3dvDCEK94K+Voz+vFtQdoUPd8pfmNp?=
 =?us-ascii?Q?mDrd/aoqEKF4NmW+go3pZGwCG91OZHrFhRNSB944vPAtXA/t1fnKMqhHiW01?=
 =?us-ascii?Q?ocDuNaA3oRcNzMe7yPdsivgqe4p6Epxv9qKLmWGXF+2cclRQNmfaK2zp12SJ?=
 =?us-ascii?Q?7uAVPweDdsXNRGhbpek8psD8kHMvtUSOF1GpB1GjrZ8iV7HneQAzPLYj1BMi?=
 =?us-ascii?Q?q8vB7+JZtP56lFwZ2QlJCn6qKCSu5Av18wAX6RQ45ZqpNPBXzXeT+QDK7vpG?=
 =?us-ascii?Q?WGZd0afnmABwlOryTs11FH+wCXJW73/xudgPqhZgSD0QxV/NOpCFa9AbfLUW?=
 =?us-ascii?Q?S6khBsKh64t8P4WG5tzei3QHPDxR0Wo0m+JyIs3thS5D0dXhODBnM9/8KdK+?=
 =?us-ascii?Q?2RcV8dyyxSx56CqG0XwVV62aiyO0u6HGhbn7eM5zrFIvtcudlncTTD0DD79F?=
 =?us-ascii?Q?7YbeBQ8guCA+Sn8ZB0ZOTnCyqy8xr8YGLVc6F2P0nx8dNAma7/grYMZlinh9?=
 =?us-ascii?Q?by5pzZ2eN1Ks0qLtEGNwpuCpw+hyz8J/O+ximPxNY6Vk1uQsjvEU1PHOd3ZE?=
 =?us-ascii?Q?F953eIdsfJc1+hbtZ1y8DtR/5Melwz/Zr0/IP21mQwAb8/rjUYboY6L8rn4/?=
 =?us-ascii?Q?IaJyxOCKD2zCBTKMi/sRIQvE4iH2r384lyupQqLucsSrSM8GD19A0V8rT/SA?=
 =?us-ascii?Q?JCggcwz/srcP7uzZq4Uussil3NmVq6JoIRlY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:52.1677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af7723b-2623-4f05-a6d8-08dd9dc885eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6827

From: Stefano Stabellini <stefano.stabellini@amd.com>

We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
on some dom0less systems or PV shim on x86, to reduce Xen footprint.

Making SYSCTL without prompt is transient and it will be fixed in the final
patch. Also, we will also state unsetting SYSCTL in pvshim_defconfig to
explicitly make it unavailable for PV shim in the final patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- remove "intend to" in commit message
---
v3 -> v4:
- introduce the option without prompt (simply "defbool y") to eliminate the
need for transient "#ifdef CONFIG_SYSCTL"
- calling out the transient scenario in commit message
---
 xen/common/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3d66d09397..28e6ac2142 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -579,4 +579,15 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	def_bool y
+	help
+	  This option shall only be disabled on some dom0less systems,
+	  to reduce Xen footprint.
+endmenu
+
 endmenu
-- 
2.34.1


