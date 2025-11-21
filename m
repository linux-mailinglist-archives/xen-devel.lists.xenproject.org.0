Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB809C7895B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168577.1494576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqm-0008L0-Jp; Fri, 21 Nov 2025 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168577.1494576; Fri, 21 Nov 2025 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqm-0008GL-Dq; Fri, 21 Nov 2025 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1168577;
 Fri, 21 Nov 2025 10:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOql-0007TB-Bj
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:47 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d245109-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:46 +0100 (CET)
Received: from SN6PR08CA0014.namprd08.prod.outlook.com (2603:10b6:805:66::27)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:58:42 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::66) by SN6PR08CA0014.outlook.office365.com
 (2603:10b6:805:66::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:58:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:39 -0800
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
X-Inumbo-ID: 0d245109-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrGpHlBhCtPXNVvP9OkJ6R5FwDyTcnJC0rnY+LPa/6W9c9NMWifymjJaY1CQT6bWSHUgyXQoWhZyRa11Cgy7tnlRObiWn1e9WWzGo74byobrSH6hLbngryOr/z3fWjvlZ35veCcvh76aI1dwt+CTnWwgT70fxcKQn3CtZzzKRFAFwjwIDxs4NsDaF1cliUWIFPj5SqTsT62Ewth4QVmHI4/7ZfjzMPj10fl/dy0lTnnzsUxSX3+FbhXEYK0nhE3FsX0dLxHx9sfVX3AOduigBAhVKP2dc5feC3zSHo4v3O5qqgS4RnoNotUY1Egzoe8zQlgtnnxva6UkAJ8PSo8yww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GQVuXC7B0B8twCs+l8AJnzRTVvVzhnihKsh/9HGxZY=;
 b=lYPGRVfVADuAEUyqq4/Gv8LZxKy4o1V4IXtpda5WTbI/vNS4hSYdMVgpOzqhHlU7Mmxi2q+7sZ7IbUx856qGwr6Z4Cl81JSX+SCWS4jWK0DUs4QtrL9ulzSPao7xIZ0eqIcKPyKUnfUcH7khlUMztq3D2ldSSiXNAmaEMdyezXMutnzEs/F1l7upFBdwt5zxVuwYgihx256XlU87AldqJMLJuEGQ2dZejwwHir4owK63aN+sVqAUh8cKz4YalBQ4roZ9xCXv8nQk3saYuox3Zw8e0fZIdhcWYpeDpovtyJfXYLMdbzx5Rl+tBQNDD6L/OInGuFqwyPICnukRN+DMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GQVuXC7B0B8twCs+l8AJnzRTVvVzhnihKsh/9HGxZY=;
 b=TZAqM3l0ums4CHyQ0lFep/Gsgw8eIriQerhc+wrLDiu7g/S4gsT13KmKNmKJTNyZfm2v9acstoFanS2fmyGhAw1Mtg2Ji2jlyv14pFhGpGwz8zUKammZuaZciYtniRka0fbWAACL+e4yzG7XmHIPDYoTBexKWyR/WIIlkZ0CT+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 05/24] xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:42 +0800
Message-ID: <20251121105801.1251262-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dda5add-e648-4090-a2a7-08de28ecef57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lDKWyzcumBISSbZXx4qRmxDT/eBMiOSn9O344CCSRPja82YIE51t9owWHJrn?=
 =?us-ascii?Q?ptzdgrbNfuhWMx1GEuu004xetwjh9HTohNIRt3jLP5ZCKwdMgMfZlKpJovC4?=
 =?us-ascii?Q?61ENClFwxBCxITCEEfROAhn7Mjfzq7R0XiAnZq5OikHrWWfdJNPqttrSNTMg?=
 =?us-ascii?Q?GgTApr3dSKMKT+TWDnDS6Yxr/7RaqI5SpcME+UCJsOZFaLqMZcJXK8BeuDQM?=
 =?us-ascii?Q?Gus4BmlNHrqyh2zYckDzLjaoKRsLGZMr0fvsuJyitEXKl/Et57LMMbIabE7B?=
 =?us-ascii?Q?n06Xe4ED/UlL+Bt6XqK3C3iHnjLOXBL0sRXep1Qvg2j3wLa0+j/cIA3AReCR?=
 =?us-ascii?Q?rKWuP0/1wKKejM6gWIIVQ9821gqEIXRjzjw3SdOKn61PU/0pN2lmEMBFK+AZ?=
 =?us-ascii?Q?ysJsv1HMBdMruNdxDnNzJ+LzJ/V/F1nANu8PiwPrTRPL3AEwl6E7844V4uu3?=
 =?us-ascii?Q?GPyUpXhn8jJ9XcKKxmWgLhphkOrJirDinVRpzzvQDeIkKH8rCbmLaUHNaOo7?=
 =?us-ascii?Q?WIWeRF8IAdn7B+aUz4WW2XJeYtKQRSEO+KDaMG4RKh9eVKFAx6Ezgrz+/nJO?=
 =?us-ascii?Q?+UovQLwE0KTwGPuumlEcdKVZwAAs30kNXCjLQHVEhmcTCvpctgu608PKEYcG?=
 =?us-ascii?Q?Gvcdejl3xTHp32a1IFsJbz+AnPCm70JGcbZ+lHNr4dTMK5x8O3ek+xiw7cfd?=
 =?us-ascii?Q?pjZqNf1IRJdOCvh5tO/yfmB3CruwpUKX7ZJ4oySuuI/EisYFPeK3PlLwiO16?=
 =?us-ascii?Q?tJ4Ruzfm9BUiKqYn4KjRitc8r4Qq6JfW2CMZzKrh7dyWh8aKf0S9uOhJ6f+z?=
 =?us-ascii?Q?CdeEyO7W6Ed/jUHkQeOzj/6fqLbjIg3uXbT+jUuZQiAJYol05uYqExSCKCF/?=
 =?us-ascii?Q?ICjvZDsuX3Ez7b1OVTMgiIXNQ83iYSy1r3sDXQq0PbVrO/NEnoTXJXx4Dyhr?=
 =?us-ascii?Q?xH40I5NP8wHvcMgCZVlDvnKu5Ant03SxVeWzWWmn3VIknXeHk69mobWkBO3S?=
 =?us-ascii?Q?mwiwpwfqtldHcFC4gptBGIZW7JKS0L75sf4+tN9XfZ3Bhv2J2VDrC9zzoY5r?=
 =?us-ascii?Q?ycWA8OZqeXEDKHnb1zswbVHX6xc+w6SfRwVMusMLjP+VvpeNV/oGisGBn/fY?=
 =?us-ascii?Q?rlH2LoTjNkU4l04rdLhYvtDMYhWxr1+nKDpEQjtj7WdXGmMMS2AchxZm4hbK?=
 =?us-ascii?Q?GV2muabyMi5tpoRW+qlHGRCNFck8zz+ja8gOE3b/gJjJTmr5SqiOm7Pdv9i7?=
 =?us-ascii?Q?nzo9HyCKa0B841X8j441iL6KXBTRvWZOpsyWlAVrhW73peFIHGB/hx2iWsXR?=
 =?us-ascii?Q?NJmpwhB+pZjD45ys6TNoWRrv/JllbdBIEWyD92v/6UTaHz1zlpiMCNKhH5rn?=
 =?us-ascii?Q?opKEtjPhs+/whRx3OHkD/8MgNjZj5XPx50wRr5LsqrMBhayExbPFmFQAYbQN?=
 =?us-ascii?Q?IxCbshPQFx2noObmyny10MHtBdKOxXm8LbyAOM2q5w4VEzh8LkBmkSEBmyt8?=
 =?us-ascii?Q?Y05z69HYaN4dz9ynE8MqSKGg3+jE6tRtr/blTRGZMKYoK3eYmiEg8okJHPEO?=
 =?us-ascii?Q?TWn+x6n1kDSx0kqWwTw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:42.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda5add-e648-4090-a2a7-08de28ecef57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477

VM event could only be enabled/disabled via vm_event domctl-op, so
CONFIG_VM_EVENT shall depend on CONFIG_MGMT_HYPERCALLS

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index aef29e0174..973b8e26bd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -175,7 +175,7 @@ config LIBFDT
 
 config VM_EVENT
 	bool "Memory Access and VM events"
-	depends on HVM
+	depends on HVM && MGMT_HYPERCALLS
 	default X86
 	help
 
-- 
2.34.1


