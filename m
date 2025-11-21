Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C57CC77BF6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168287.1494340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsn-0004Mo-AI; Fri, 21 Nov 2025 07:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168287.1494340; Fri, 21 Nov 2025 07:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLsn-0004Jz-7e; Fri, 21 Nov 2025 07:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1168287;
 Fri, 21 Nov 2025 07:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMLsk-0004J2-Uv
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:48:39 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8ca6ee-c6ae-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:48:37 +0100 (CET)
Received: from MW4PR03CA0018.namprd03.prod.outlook.com (2603:10b6:303:8f::23)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 07:48:32 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::23) by MW4PR03CA0018.outlook.office365.com
 (2603:10b6:303:8f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:48:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:48:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 23:48:27 -0800
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
X-Inumbo-ID: 7c8ca6ee-c6ae-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzgBVcFQNK33NTaHi1MCgRJY4c9zTYQsXuib7CZbfk/TCTB3EHcyuogPVMQI8Pkx59/G+n3cXxY3d71cV9Ov/UBVc34DKNtrVaKWRJ5hrnLKqTFYkuDlu9WP+PPxTd1XotRt7KZeshXr8QMWpW2gNZBQCb4D1gQk8UD+lX4WhGakNU2JZMzT3fEEp9XfLdP7Q6wvuV8bCEOSJ8OJW9ClOoxP+63y5rtfgjfc2cD0yExabVcUkQSkUws9S1H+3qlEr3lh1JHqC/kDRb1uG1/73H5ggnt9t/4+sJtg2ZJ0guvic4riGe0iZF/LFGrOYmRiJ0sfSK+ESUGI74PNQamAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIpRUWtsOO2y93Jwaofsg2E6M3iwctm1+4j0xCcGYgs=;
 b=ZtKq1lCqX2K3e5bsyC3iFsM8N1Q/7e8Up+dlH8eD51K7RjgLq+9YUAAc1OcowC1mG2fsY7RptMFnucuq3WkMqtNIfDF2C2GUMFqGyZkomnqMdOQwJ1rUfLcKNhDurn7/J8csVFx94dRwydOt1JDId/Uj1b3iogiiaEB2l/64BYU3bRkhsE8+UfcR4CZTeH+eYqzcfNgNoGE/fyW/VXKDo/As+/46Hrpei9csEjdVFMLMT5j5sgrVgupmouYqhGIdGpLN/X+yMlD9NKg2N/L8cJV115DUSTHsbcQuzEj+Mq3zU/4IgGvGz87A1/RJJI9ytFvZi04QiA6wBUR5NtbT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIpRUWtsOO2y93Jwaofsg2E6M3iwctm1+4j0xCcGYgs=;
 b=vMFFkzTjxrI4ZYxyMNdOmBG6TCgBe9m0Ft03MqickXBmcUkgLTxlBpnfyFlvFaU6K5g8TxcA9CkOUkYa6Ac6GvBE2c2GMHQOKVfS2L8ULGcnvpW207DY9AFci1Q3eSJPWzWfnrYAMPhj+KPjt5X0ENDtezKsgDkYPuagDZ26Ibo=
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
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v2 0/7] consolidate vm event subsystem
Date: Fri, 21 Nov 2025 15:47:56 +0800
Message-ID: <20251121074803.312568-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: a00d0514-6b0c-4a12-5326-08de28d25e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NfO8DF7IrZNMzpmdBYJW1E4IyTIkGA7fPWBKfPxbcjnkezYGjJd5xzFfyzi+?=
 =?us-ascii?Q?omhYZQzr0uZHi2ik2DJO6eRbVHNuutJ1OcttDh+t+7LJ7ycq9IXao8sSLo9U?=
 =?us-ascii?Q?QipjeAxkVyXIQP81fjLgGGLf5rDyj3uxht26fdygXkO8LHzWnXHlnWuLbetn?=
 =?us-ascii?Q?1oXTEcIIm8TWV93MAWQW8AP+GP2MeDgRsiGtYvFGzbNbd6q+ZMZOb90buZiC?=
 =?us-ascii?Q?aNMP0FfBPC3Ok0Znd4M0JdNTdh7jeJxV8sInqcwJBxHXu9ObUZcLFcEVxk0b?=
 =?us-ascii?Q?A9v6bFp0ZcWLzQKQxeXfNNfVYOPkDkvx64BzENRc2xqIhmWXzak190rA7MIB?=
 =?us-ascii?Q?Rcu4AHMuckiQ2PRXuzJtCbkQzg1vTsFFFvQgh9r3POE7v1//u3ulGCN1S8JZ?=
 =?us-ascii?Q?6RcSwKZs+lFIly9fs/QFBP0Sf7Yw0+nQfcB3eVPmBDIZuJbsbx7BUPlJoZdW?=
 =?us-ascii?Q?g5gPPTXWbcfF/kUmrq2P0hffb3+/dl2V8VEz11MBvh0MwO9enkqdZFT6GpxB?=
 =?us-ascii?Q?uJOM63nBoXBbiO1XflMYh9cpjkaNgqPMaPNmevbtroMOoEdKZ/J3Ky1jpp3x?=
 =?us-ascii?Q?+M059MZqD1dLxbgt7GU1Z+KO8DVtK5wJilHmZ4VjCLmySl7KaZ6dEzSppHMx?=
 =?us-ascii?Q?VtwCqsadec5i91GeOLyiaj9myPUNyvdqQo2/Aj930a5ZpMvgfdvWtSQFbJ/3?=
 =?us-ascii?Q?dIcLj6risZlN9oaFWbEtlPb1FEUYpmzJ/tmIVANFL5IyrSg0BOSmQwljahSs?=
 =?us-ascii?Q?x1A2WYpSi7kKjlgq4XcSgNrx616g2Y/4rjSr5/V5GhrnRgjVUvNenxHlpRiN?=
 =?us-ascii?Q?xB78NRhAA2tLQlT/N64L7ikW1zVLVBFXuafPJfVldRraxT5zXAexZJqi+IXR?=
 =?us-ascii?Q?y/ZNnEb3rwuk646TCQJ7tmnAxR9D9O69JbQTsT5byo+D9caVxaErUtGwy4Fu?=
 =?us-ascii?Q?9bOEKk21Ebc8ehVcpgOTy5+5O4u8RVlLPfAoP5y/wOOC8lKQre8nSrPWNVNV?=
 =?us-ascii?Q?gSJnu68qU95frYoxdRFPzn+SD4PIueZKA7zy0YGw9RrEaQhiEHeblhVDkgpi?=
 =?us-ascii?Q?RjL//55FX2r6eCnEagng3uQaUKuFnlqhrSiNYXltVPE8gJujZHOeFxaVDz7t?=
 =?us-ascii?Q?PM1tJvY/S4eTiB36HIUhvsSRC/X5QV7Vv0C7yOwTfioCrDZ7bdHBxR2PVbxn?=
 =?us-ascii?Q?JQ+Euv+1dLikZEk+TJJ6gCMxELkjiZBY1w0snQTgPjEN77Tn3FKd2bu/SA8z?=
 =?us-ascii?Q?b0QfmSbH/Hgpf8RsuU3JtNC4MBOA62KII64/gFL/rD0TCFqNnBwNX8vlvvdr?=
 =?us-ascii?Q?G9VJUwUBHc50yL53GGtTCEzFaGRwMCatD809H7RyuB5fXkwXS1XxFq32T3Q6?=
 =?us-ascii?Q?ie+Qo1kDtoNB0IiooWiBEaSlESWlvATIbnCxlk7C/Tz1N/llucsp2x//tc94?=
 =?us-ascii?Q?dFy098C01g+Kvg33K0JXITXW+pk27fGok5YJ5/R5LGwvqGCTc+DUVnDT/1BH?=
 =?us-ascii?Q?CQWuqqxzI7Cu/0o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:48:31.8774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00d0514-6b0c-4a12-5326-08de28d25e18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681

This patch serie originates from "Disable domctl-op via CONFIG_MGMT_HYPERCALLS"
[1], and focuses on consolidating vm event subsystem (i.e. VM_EVENT), and its
derived features, like memory paging, etc.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg200843.html

Penny Zheng (7):
  xen/x86: move declaration from mem_access.h to altp2m.h
  xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
  x86/vm_event: introduce vm_event_is_enabled()
  x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
  xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
  xen/mem_access: wrap memory access when VM_EVENT=n
  xen/vm_event: consolidate CONFIG_VM_EVENT

 xen/arch/x86/Makefile                 |  2 +-
 xen/arch/x86/hvm/Kconfig              |  1 -
 xen/arch/x86/hvm/Makefile             |  4 +-
 xen/arch/x86/hvm/emulate.c            | 67 ++++++++++++------------
 xen/arch/x86/hvm/hvm.c                | 49 +++++++++++++++---
 xen/arch/x86/hvm/svm/intr.c           |  2 +-
 xen/arch/x86/hvm/svm/svm.c            | 54 ++++++++++++--------
 xen/arch/x86/hvm/vmx/intr.c           |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c            | 73 ++++++++++++++++++---------
 xen/arch/x86/include/asm/altp2m.h     | 10 ++++
 xen/arch/x86/include/asm/hvm/hvm.h    | 18 ++++---
 xen/arch/x86/include/asm/mem_access.h | 20 ++++----
 xen/arch/x86/include/asm/monitor.h    |  9 ++++
 xen/arch/x86/include/asm/vm_event.h   |  5 ++
 xen/arch/x86/mm/mem_access.c          | 36 -------------
 xen/arch/x86/mm/mem_sharing.c         |  3 ++
 xen/arch/x86/mm/p2m.c                 | 40 +++++++++++++++
 xen/common/Kconfig                    |  7 +--
 xen/include/xen/mem_access.h          |  5 --
 xen/include/xen/p2m-common.h          |  3 ++
 xen/include/xen/vm_event.h            |  7 +++
 xen/include/xsm/dummy.h               |  2 +-
 xen/include/xsm/xsm.h                 |  4 +-
 xen/xsm/dummy.c                       |  2 +-
 xen/xsm/flask/hooks.c                 |  4 +-
 25 files changed, 270 insertions(+), 159 deletions(-)

-- 
2.34.1


