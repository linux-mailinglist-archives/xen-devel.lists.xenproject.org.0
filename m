Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE821C7815E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168460.1494460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFs-0007hV-Fd; Fri, 21 Nov 2025 09:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168460.1494460; Fri, 21 Nov 2025 09:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFs-0007et-Cz; Fri, 21 Nov 2025 09:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1168460;
 Fri, 21 Nov 2025 09:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNFr-0007en-1d
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:35 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5155ab0-c6ba-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 10:16:32 +0100 (CET)
Received: from CH0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:610:b3::35)
 by CY5PR12MB6645.namprd12.prod.outlook.com (2603:10b6:930:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:16:26 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::95) by CH0PR03CA0060.outlook.office365.com
 (2603:10b6:610:b3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 09:16:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:21 -0800
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
X-Inumbo-ID: c5155ab0-c6ba-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtcvaWyRDLip0XFgWlju6tUjv1XtayEVhFzJS0w0VF441n963Jx8OsCOvk/VVkZz1Nq42LZcQER6/WWVPizAABU5IbFAeUtYr+bJBxIC9miKN314WHoEHJbtqLQMM5/tKFLKlID/hYrZY5Hp6YzQmETycIGiOAuU2aSayF/nKuYf8R0mCYX3KLlFvmKLZBO+9ZOH4ux/BZnKVDQ6aRLo32jaFO9TnDKaErOITfiMlJ1rMm12lY5tbm6rCsWnSp3XU7AVVJqEWRP1w9pjI39cUQh6iSKnOK3SGdaPthg7NXeVrnM6k8GWcWJk8y2eBOsIPHIDlxNcwutF6BIcvPUklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DSx+HHx9tvNCK9DIqy8VDRIKiE5Q9s4OQdG8SXk6GM=;
 b=gwcyRzSDtDEiD5akkTqQUc4vgzxUNoNLK7Tqp13atvImv2TBPTWamOZ8Xgn7T17Pg9fx3aRBhfGbn8VXpFvxZ/Lfie1usb9p7GHi5vtoo/42DUcy7obqCk7DXbq+zdmfMvEqn5Q1yupXWv4YjmPovH+a/5j70l3/kPPFarxyNpWVFuelMFlklbP8cEIzi2IxFdZQ7ST7b0yBxvaP2jyXGW9cfXVk/W0gce6ID9DZhPiOM5gAWpszBy2+LYjHZ4nemwWgBg2W1ZxOdu2Qtq6C3AP7ZY8XHzx+zu8lISqEiW35Alqzk0CAGd6L2IgaYyyrEPyzcZ5V1N9MPSWPO5OKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DSx+HHx9tvNCK9DIqy8VDRIKiE5Q9s4OQdG8SXk6GM=;
 b=ZGAwB/Sp7/UxGcc09yXoR2LOfveqeoM0TPpLy5lv8kikNNq0QBBv12Ha0MAVeZQsg1CWW/UGWO5HF6XdoUn8XE2IGwb6bKqunr0nHt9pej9sQXq6vVyYGA6rccwPLIWD29ToxA76tJa1iYHnr3UETsFxDM+EWSHnwNX7fOrUBuU=
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
Subject: [PATCH v3 0/7] consolidate vm event subsystem
Date: Fri, 21 Nov 2025 17:15:47 +0800
Message-ID: <20251121091554.1003315-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CY5PR12MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af54ede-5ccc-4889-9c85-08de28dea5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+276i4dtaZ32jlWzKEjeHAIzojA3pK6zyQdauqiD13txJzVmlw6nQroXICbC?=
 =?us-ascii?Q?4xA/Q7dbmLomegvG8G9QC1lKGkiptQGsL6qj9fsM8SBUJ5tCwhpU4brWGvYD?=
 =?us-ascii?Q?VRSKEgw5BtyWLJ9NoOVSOLHLL3+PwLpZlfToIDnbkh90XgUTIPw3nSC96uU4?=
 =?us-ascii?Q?etCrm1XXubFNwz7r373yG6C8S3DkV7yaatCZfV/s/xK6nPDLGh7goneUF4aJ?=
 =?us-ascii?Q?HJUqpOewuOdvjvgpH1gWSZy9EAGhWgFUhILhvdN5Jh8N60Gyg2W3pivhonnS?=
 =?us-ascii?Q?b278zTv70MFwGd6EfsJCsNifmQYJkXJ9jI4wJFHsie86LJlfRWrOprchRnhf?=
 =?us-ascii?Q?EuUXrxVpJQlZvArWhbNjpUr6nyuFqNGD4FEEsEJhaL/99WM6fcN6/qtzrz4P?=
 =?us-ascii?Q?d6cCr3CYzNcsC6XITubyI9xmol3M9SN477VIAJOKvMIWilngixn4b5x1JOaW?=
 =?us-ascii?Q?mqfvuF0h3+OsJvo87agI7E7tb0twJQ+6En5yWtRla1PDdHhOj2nCf3NIKoX8?=
 =?us-ascii?Q?8CNH+Nk0ly7JlN/hdakVvahBjatuOnWRluErz1Y3U7B41tpoQMjQhKqewqoh?=
 =?us-ascii?Q?+OLKiwOcbbbf7+1dW1Rg2cAsyRLJFgSNUY4dHghUQg7JGT/hyXfccJlIEErQ?=
 =?us-ascii?Q?BFatzYTIMiVpbXhuC3o+7CFms1fRKCP4pkDDcl0NmgF93coW2SSRThfxnL+8?=
 =?us-ascii?Q?uaX0O29nxDOA+Vmdg/PISFclR96scYIEgPBSudPZKpszBUq/92zuMWO2/mBz?=
 =?us-ascii?Q?0wjX9/esQhZ1LhJDbQ3zewkVokZFgQA92ZZt94wAUWISZ2yOXSge6B35sOwA?=
 =?us-ascii?Q?MXSpFpPqVO7MAIdTrjarTvbmx4GfAB2la3BnlswNzzYL1yGrtXI6gvltLmwh?=
 =?us-ascii?Q?isftJWR04xzJ5j3EDHKygX8Ez3pZDjOKiofTcw9WKizGX/wgCy09XRxoc10g?=
 =?us-ascii?Q?WokdFOG4EAhT4WYfadoW0b7LJy8/IihRXnTPMbDgDLBUQ7ukT2dRM58ZCMyP?=
 =?us-ascii?Q?W8Z1wTT0Awgl/HmPqHlcHT7aufeKiu/maEg7xlg2sTz3aHRcwzRlsBEB0Tj4?=
 =?us-ascii?Q?+HtcE/obr9l+Tu5AIOx3VwHEiVRfAtv541eg2NVmjViWLvltsJN1fa2rayum?=
 =?us-ascii?Q?LGOstu62qzFIn0NBNcDiMFU5DVdI6E/8atLzlZcPBMOs6aOdSzjq6FC06Nfa?=
 =?us-ascii?Q?V+w+DcDp0oA5H0eK6jErBupnW/jDzhV6Ge3UZthHXyngibngoGf2YvT9SpRk?=
 =?us-ascii?Q?fXF4OJ1Ss5OEQQcOFDPcHMbLVL142DM1WfpamMnA5bOSAAg/LAXB7buxTFx8?=
 =?us-ascii?Q?DJrRja5PYy5rHv//wXRVPps768S+JQxWWV82PzXXZC79KAOezPHPDeBtWgBn?=
 =?us-ascii?Q?aheCe97x3UWqZ2S9vGoeg1SJnf2VxijPoGBPhDkufJqOoS928g4B9pyojAMU?=
 =?us-ascii?Q?aIhR1NTH8zYeywDjK/YdA4uf64eyK7crjg3O9VKpzGofBunD4UeXsC5Uy9JU?=
 =?us-ascii?Q?Tsfjrt4qlrRNaHU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:25.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af54ede-5ccc-4889-9c85-08de28dea5a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6645

This patch serie originates from "Disable domctl-op via CONFIG_MGMT_HYPERCALLS"
[1], and focuses on consolidating vm event subsystem (i.e. VM_EVENT), and its
derived features, like memory paging, etc.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg200843.html
---
Plz ignore v2 version, as I accidently sent the weong dev version.

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
 xen/arch/x86/hvm/hvm.c                | 50 +++++++++++++++---
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
 25 files changed, 271 insertions(+), 159 deletions(-)

-- 
2.34.1


