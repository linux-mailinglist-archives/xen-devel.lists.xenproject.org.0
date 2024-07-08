Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDF92A15A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755306.1163662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkz-0005U1-BB; Mon, 08 Jul 2024 11:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755306.1163662; Mon, 08 Jul 2024 11:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkz-0005Qb-7d; Mon, 08 Jul 2024 11:42:09 +0000
Received: by outflank-mailman (input) for mailman id 755306;
 Mon, 08 Jul 2024 11:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmkx-00042n-R1
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:42:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199b86e5-3d1f-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 13:42:06 +0200 (CEST)
Received: from BN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:ee::17)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:42:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::24) by BN0PR04CA0012.outlook.office365.com
 (2603:10b6:408:ee::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:42:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:42:01 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:41:57 -0500
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
X-Inumbo-ID: 199b86e5-3d1f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4B1XBl+lTO8+doz6ICL12nryJCgEppYPLFLiMCdUcYg+i6rcH4gPLjs0bJZp83GcIywOz4QhaPS6kEtVEQ4QkNJ89Tr//6JfcaOv4ixJZekD+5YUfZo8g8qJERDgJxXQt1yTIr3wr6Jy0ipXH/WqTOkF476WBN6Rs2WGN7SAsp6k94QBWg+KQ286CXZOJCmocodO+2dbc9mv4lZ2aGvkUvtUMEN3UVv4cbuzroYo05Ga1PjWc2EzcE9VXkOkO/KOslEwDmxtq/9nVGJwgT/NSjZbPhMN29XkistEsoGnj3zxOQfSQKztwMb9JqlCzG+m37T+Z83PTF0yxcoVdsg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSUMECa+KJwIDIvEDAv8tiYigyciwYLZAvCuoQwKiN4=;
 b=e3eWwaYEPAGOwwSvTXPPDca7MrMSEmAC9Qh7nsxHGH8Rgdq2EoBNRTeSGdn944OBrI5wwC6NIpmoO5OfI9VqFTTQGtDzzJaWHKYfHSqr7pCGSY7SmWAx9FjwM4LGZ8JlH5/n29XTA/C8k5JcZMryonTJtyI5XYKEBTAVYzJBWRU1pAjvYacLtdQl79KuZ+U7BPF6eB3XffkU+mzvQQvtsepMWSO4+omIRB81aFCrFy+TRxQS/NrbKlOzC1v/c1zsdqfxQQ/YwGxTi4uy23GJhkdLYkDm/r3Fo9+eyoVxpoYsImKba9j/cG30JNuJTZe0ndNM6MOgxNbqsjW6AthNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSUMECa+KJwIDIvEDAv8tiYigyciwYLZAvCuoQwKiN4=;
 b=3jAkEQvqG3tkxsEC210/MedWfZMJCadvdalzPK8zjNk5CdJFZJNWbU+24ajIfOnSso3fCQmVOE1sUBiKBqdUnq8rrl2rplYeMr9BresgH1LSATpdUn/mo5EzQFmpqfJyNarfzddEB+ZQcWcPud4ZzRMXgQ2WV5efmQkWiXCAHUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v12 5/7] tools/libxc: Allow gsi be mapped into a free pirq
Date: Mon, 8 Jul 2024 19:41:22 +0800
Message-ID: <20240708114124.407797-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708114124.407797-1-Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f27321d-6750-4afe-4137-08dc9f42fb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NTuSCTQpmqvM2TR0b9BM1YozPKeQPGIBcJfs1iaTVytLksCTo35odu5b1Q2/?=
 =?us-ascii?Q?tM2Nn1hRjhWy9mUJdyr5VVAzfjmDEyAwYPeL4dcHDsdRszVN5d3CJyilOOaW?=
 =?us-ascii?Q?LMrTMtps9yNl4dGS7EIxb8me2h3LePVucyJP5ja8Wn8YRJnvnJT/VcVJ6qMK?=
 =?us-ascii?Q?Zo/P3YqWTzfAcTh4w6kj86PU5ikFI7aeUjes6DyUbo+VW52CoBoQL1CbatDL?=
 =?us-ascii?Q?5HjJxDG1fseiVjnVpQyFqkiIqbez1EztoVTYkJ/A+N9T8IVHOQ9Uz5w8Dj0x?=
 =?us-ascii?Q?1W3S97TqPXDorjEbhdbzSFBmQD9f9VglimTnweZLiEyeqtI1fcxQm1kDje2d?=
 =?us-ascii?Q?VmMhWHxYZ0qy0WYBrNh/VFSuKhUcJknxgd1iytZTxXPdHOFE1zwQVcIHzVue?=
 =?us-ascii?Q?tWUr9QW7JfErTA4xOU+85BwPtX1B/AnU3YvUljCL8/Ns9t2mEyDh0fkrQNRN?=
 =?us-ascii?Q?qGthoCaXvMcHkP6218Xa2YqTRw8g0Reo6d0fi9rNsFESeKwtwfyUPl4p2aqc?=
 =?us-ascii?Q?oZ9SdD0ru+xf47BTl4lKcYbkijuOZ7SmIoTm3ojtv7G8aMmbxr2jMrS4r72T?=
 =?us-ascii?Q?zsraY01iTYY2Dm67Hybx58S8WIegW0Bk7pVJZ+S236O3eCdadXdqk2ISuNmW?=
 =?us-ascii?Q?DffR1TtWlmPNUxueNtbhmWN2FkAD0HuG/k6edI8+t26Jw00IJuLnyPC5Aluk?=
 =?us-ascii?Q?8DjrdZ+7NrRk7/JyZbxz0YWcfwQ0A1BRFz2QDx45cxUopzZLAwO+BMtKf7Gu?=
 =?us-ascii?Q?AaNIG30qcLZ9bB0Ic4PooN7JnMbIQmKUVz4ROnmJLHVYkwWP25dKcZlpLZtl?=
 =?us-ascii?Q?QVv99vs+P30hzYcA5VfTcEciKFOC+NnbqxevlpH5Jrf6V3PLQm1H1sUXUL5W?=
 =?us-ascii?Q?k/vQgsisw09zoM7Y5edRj9dfqgWvVkRmKqoL6T6Gpitd9GVjxT/v1uUb5LFG?=
 =?us-ascii?Q?LjsEPJjOvGO0e9m2NQ/vc2oVsCnNFbIXfcy6LnLXbU4260HOoKiAsyMPVwA3?=
 =?us-ascii?Q?I8Mxrj8TvAqtillDYUIefCx0c0E7tcQ7GnbJn5FK2DuBSCCILnmSjYbMe+1t?=
 =?us-ascii?Q?TiIGYLwo8j6QmHFyaSb/hVSqInVVXrpNRSv5SZkLDLolLBQBszqKJykISyl5?=
 =?us-ascii?Q?XCIGqnQ+P1jPW50S9A42GHFStgYVFV4hblg+u9Hz/L7HCzUN7o5ouYmygZ6i?=
 =?us-ascii?Q?GNPxYLCvNUEWrx4kr6RgDmC5Y+lccMRb3xipN8tFgysQJAlImD0ZoPNEnL8g?=
 =?us-ascii?Q?/2e0pziL7Grc8XD13LF/RzokgjTYwMydAbPamAbOliKpeqAZB8UXOrUcZHQJ?=
 =?us-ascii?Q?I+lZqhWYcPpNpvj6UBWYUNn1nnLAEUxe4qnO7DiZ1vs2g6gN1YQoT76Q3/tw?=
 =?us-ascii?Q?BcZgMD5Ikz13SihDBu/0SI+hJXTqkGD3N4qpAsYwTPBK4nnyUcvpAH+XaUfv?=
 =?us-ascii?Q?4atB7r3uAu0rzjwcaLYqqF94RSxo5bcV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:42:01.6139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f27321d-6750-4afe-4137-08dc9f42fb8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625

Hypercall PHYSDEVOP_map_pirq support to map a gsi into a specific
pirq or a free pirq, it depends on the parameter pirq(>0 or <0).
But in current xc_physdev_map_pirq, it set *pirq=index when
parameter pirq is <0, it causes to force all cases to be mapped
to a specific pirq. That has some problems, one is caller can't
get a free pirq value, another is that once the pecific pirq was
already mapped to other gsi, then it will fail.

So, change xc_physdev_map_pirq to allow to pass negative parameter
in and then get a free pirq.

There are four caller of xc_physdev_map_pirq in original codes, so
clarify the affect below(just need to clarify the pirq<0 case):

First, pci_add_dm_done->xc_physdev_map_pirq, it pass irq to pirq
parameter, if pirq<0 means irq<0, then it will fail at check
"index < 0" in allocate_and_map_gsi_pirq and get EINVAL, logic is
the same as original code.

Second, domcreate_launch_dm->libxl__arch_domain_map_irq->
xc_physdev_map_pirq, the passed pirq is always >=0, so no affect.

Third, pyxc_physdev_map_pirq->xc_physdev_map_pirq, not sure, so add
the check logic into pyxc_physdev_map_pirq to keep the same behavior.

Fourth, xen_pt_realize->xc_physdev_map_pirq, it wants to allocate a
pirq for gsi, but it isn't necessary to get pirq whose value is equal
with the value of gsi. After this patch, it will get a free pirq, and
it also can work.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/libs/ctrl/xc_physdev.c      | 2 +-
 tools/python/xen/lowlevel/xc/xc.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce8..e9fcd755fa62 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -50,7 +50,7 @@ int xc_physdev_map_pirq(xc_interface *xch,
     map.domid = domid;
     map.type = MAP_PIRQ_TYPE_GSI;
     map.index = index;
-    map.pirq = *pirq < 0 ? index : *pirq;
+    map.pirq = *pirq;
 
     rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
 
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16..f8c9db7115ee 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -774,6 +774,8 @@ static PyObject *pyxc_physdev_map_pirq(PyObject *self,
     if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iii", kwd_list,
                                       &dom, &index, &pirq) )
         return NULL;
+    if ( pirq < 0 )
+        pirq = index;
     ret = xc_physdev_map_pirq(xc->xc_handle, dom, index, &pirq);
     if ( ret != 0 )
           return pyxc_error_to_exception(xc->xc_handle);
-- 
2.34.1


