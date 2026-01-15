Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60871D2385B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204473.1519122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfE-0007Ls-4V; Thu, 15 Jan 2026 09:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204473.1519122; Thu, 15 Jan 2026 09:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfE-0007Jk-1C; Thu, 15 Jan 2026 09:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1204473;
 Thu, 15 Jan 2026 09:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfB-0007JZ-Pg
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:09 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a47e4754-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:29:08 +0100 (CET)
Received: from DS7PR05CA0051.namprd05.prod.outlook.com (2603:10b6:8:2f::12) by
 DS0PR12MB8200.namprd12.prod.outlook.com (2603:10b6:8:f5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Thu, 15 Jan 2026 09:29:02 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::e) by DS7PR05CA0051.outlook.office365.com
 (2603:10b6:8:2f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 09:29:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 09:29:02 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:28:58 -0600
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
X-Inumbo-ID: a47e4754-f1f4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2mGPHk/PGIbaEQG1hW9W0oXW9kXn8/pAM50se01+KJkCeZxMngF/5K5Q5I3Q9TNc4wFrprHPuelrIiHpzNNsuTBZl7iP9Y5C0XP4zTaUX/HjQ6FcMcdccVylldVjq3BDasZusZeqRZxxBMAYbhK475bZU+/ANsH9EB24OGRqTuZuhM5CmviLCyUU1wG89qDHjuyfvTVg2OEUscY5V6jKkk155ZRwJR+2UDPwy9t4RFF1i9Rv/Wv+kFMFp/rvKew3iQOSLQrb/n0gSSKhuGJXVFlEvWpKoSnwMfZTT71m4VaN727gtFUALHEnQ6muzeWOml1qLaixXg2LQ9/VH6HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QWX3MEiUvQV4E1tz+nSas99Rto/scgJscwAKJ9D2l4=;
 b=y6JhlWZdBImBFrTcQF5xXd9KrEniO+0Lh+1u89kJVxajtvCw96+LPclRlkM+K6HD9kKHT1oYaOpE63vvvpMTqbZm6Qlyn1DfzJY3dgRNuDRx933jH+v9aOo0NFFrIeYK2kxFiBFdb0c6NR8WUzxL+inAoBNbwqj97zO0x0Gr9qWmMWSWyzgEUJmES9+onGrdB4jQBr/VffH5RhS5PrgGkcwOXYSZYH3YdWYqoP1fmsQ3h8myoaL7BQrKC4W1MvRqEFJgzuGG8lZ4x6a2zZ693QWb53H4wXbzf3ma3bHLVqLErcHrX2+vHOycbKkOi4LMiO85hs9wuhcsvz+59bvbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QWX3MEiUvQV4E1tz+nSas99Rto/scgJscwAKJ9D2l4=;
 b=qmPnF5up2Y3fiInij/cu3E3gBxMu+ye9IHOtarDH2UmB3iGGhT9soS0/YBIFvjxA58sp0L1b9bqC5RHvneKIwccI9HBWTd1YTaTuCO0s0KtXXb4RnGj1Tdbvj3RNjnmvnRdnLPi4z6bxvLsA7T+sD6+pkJUc5+6nDU5obBp13tU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <jason.andryuk@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/6] consolidate vm event subsystem
Date: Thu, 15 Jan 2026 17:28:35 +0800
Message-ID: <20260115092841.2651224-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DS0PR12MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: c32aee2c-39cb-4d7d-0a01-08de54188530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IRWRk2+txkiRha3ycrkqriYRhj/5j8NNmQrsxD9rEZxP2s6aDtZn4tlG7o68?=
 =?us-ascii?Q?TfL5wixxqABGzpfDbJE3vAJb+Og/zZTUD/9ccUszA5LGR+Y8qpwl4cVEPQ74?=
 =?us-ascii?Q?44mIGz6ADWk5vMDrUy1TFSZslAF06xdVLpO46ZRHKtYNi/oJrSbbTz2umJEL?=
 =?us-ascii?Q?C+eSjY9Z9JcwfESb8A6HSTwMioBO5vZStT7CAV3v04kDWJz0Du/a+DOciBGg?=
 =?us-ascii?Q?Q+BTp3z9Tzsi46b3xBOIw90q7WsYsFQN9Hu2q0Lzo94VX7tXt0JO2jXslN35?=
 =?us-ascii?Q?qEWmL9B2DKcqCVn4cKmHFkcyWLnsRoq96aEMmimvbCUwTPSlinkRHCuopcar?=
 =?us-ascii?Q?QODUP6FOdRSo6KUA67yjbwYGd8npunHEcGkQFvbaTzSawH5GY+HzmAi5GDEM?=
 =?us-ascii?Q?h94t1wBaS9NmmLHZaVXElaGd9u7P8Zg3XucYZEq3YdPE/jemGtkEQ2L2lKjY?=
 =?us-ascii?Q?IoXl9LAtig2XXEJ50r5SYWSPW04Gl9qQiavTEUrq688mOdPZ7EYFivk5ubb/?=
 =?us-ascii?Q?VuvX4odCvZgUCkgS5ZVngg0+GJ8FP2m+CmKGuCm5FcMIR+KCtY48szKmi5Sa?=
 =?us-ascii?Q?Uw+6aLO1usGFcJZGi8iubujL8iZ2xevl30PT2DJx7Jd2FEsTWF4kVAxqfyw/?=
 =?us-ascii?Q?l5JQECZP1icc3893rd9XF1akRF+hzrsWh8Vv/JK4ZCFBNhvRRc3t6Cq3JNbC?=
 =?us-ascii?Q?41k8YJ5z2KTC1FUO/Bvuhox/3cudVXv/9hqSRbRBGkAdYi27zV8mgdQ9QM39?=
 =?us-ascii?Q?sRy48S3paJLp8aHCJfLMqLCaV9WbughNklW1gfJA8QF5sES92uWNAKfh84P7?=
 =?us-ascii?Q?oMDgyn9X1D5PDyPPqqCxA+VHsJXycViRjRNYQoE6GTbrpyiGQAx5oOUKKCsp?=
 =?us-ascii?Q?0tMAvefkhIgKZUuX7ollpgnJTxGylPugHNLtnKxD42t+nOOBALhAdx2TxH6T?=
 =?us-ascii?Q?uWcMZmKBpVJzLyswX3SxxDGr3PIk9nUPaORyKmUmwaXrq6jbFQhz/GTepdnr?=
 =?us-ascii?Q?VsETov9fhJCmFEpIsBQZzbIZaxCXuhyzjlUzW5L7RBwJkIqwolG0FQRh978M?=
 =?us-ascii?Q?qsHMJFgmGTzueY/e49lS2T7qWAFtDPYVHiIuZxecgbWAnrYjs5PgF2pA/IOU?=
 =?us-ascii?Q?jDxrTYT6yCBXMTGLLz3oO8C+8XNh+qb8ZI+89qYs/2BBHgVMqW6ltsgnJ1Vt?=
 =?us-ascii?Q?VH3pHzqMbhDpthu7O0YYG5A+o5WDzvLQmJLMGJ+r9ayGf3gz4YX8hp/Ketbu?=
 =?us-ascii?Q?C5DyOUe9ADBtlv0goaCkpv3tfaaWFpITATc9te9F38ArS6hoXqs83v0bfTsU?=
 =?us-ascii?Q?NvxZj8s9TQqjiHZYizo07deEhYjSEgD4Vc6AUj9GCTwiWSy8eScRTjCl77GJ?=
 =?us-ascii?Q?OSY0tYgjvmEiFoZLT5kzDmCv2QZIn+6Eq8rrycdUnBzZWr4dURycAje7OMmy?=
 =?us-ascii?Q?GwgaxHk+m7hk11CTgdrq92Xg2Yuk2qOPsorbNje46qvDcZ5Auy0Q74RJ63C6?=
 =?us-ascii?Q?76MbD8es0XFkUvYiQPp5oYWlRBNvU+bx9T7bdARkL5T8qKho3pkt+ziCh0iw?=
 =?us-ascii?Q?g4453Z1CXUVnLaiGtnvmZjjFnzXm12CTF4fbI/w4tg75erDQiv/WO3r7kOW+?=
 =?us-ascii?Q?Lg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:02.2850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32aee2c-39cb-4d7d-0a01-08de54188530
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8200

This patch serie originates from "Disable domctl-op via CONFIG_MGMT_HYPERCALLS"
[1], and focuses on consolidating vm event subsystem (i.e. VM_EVENT), and its
derived features, like memory paging, etc.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg200843.html
---
Happy 2026!
Sorry for the late response to this patch serie and the domctl one.
v4 is just doing a rebase on the latest staging, and one comment fix.
I still need 2 acks for commit "xen/p2m: move xenmem_access_to_p2m_access() to
common p2m.c" and "xen/mem_access: wrap memory access when VM_EVENT=n".
---

Penny Zheng (6):
  xen/x86: move declaration from mem_access.h to altp2m.h
  x86/vm_event: introduce vm_event_is_enabled()
  x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
  xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
  xen/mem_access: wrap memory access when VM_EVENT=n
  xen/vm_event: consolidate CONFIG_VM_EVENT

 xen/arch/x86/Makefile                 |  2 +-
 xen/arch/x86/hvm/Kconfig              |  1 -
 xen/arch/x86/hvm/Makefile             |  4 +-
 xen/arch/x86/hvm/emulate.c            | 67 ++++++++++++------------
 xen/arch/x86/hvm/hvm.c                | 51 ++++++++++++++++---
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
 21 files changed, 266 insertions(+), 153 deletions(-)

-- 
2.34.1


