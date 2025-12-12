Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD11CB7D2E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184901.1507231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQa-0000JD-Oz; Fri, 12 Dec 2025 04:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184901.1507231; Fri, 12 Dec 2025 04:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQa-0000D3-Iq; Fri, 12 Dec 2025 04:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1184901;
 Fri, 12 Dec 2025 04:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQY-0007SS-SA
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:46 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f86857ee-d70f-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:06:45 +0100 (CET)
Received: from MN2PR15CA0056.namprd15.prod.outlook.com (2603:10b6:208:237::25)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:06:40 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::6a) by MN2PR15CA0056.outlook.office365.com
 (2603:10b6:208:237::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 04:06:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:37 -0600
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
X-Inumbo-ID: f86857ee-d70f-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkBDPd0DrInEZIiMaTSfRuvDKpsOIKzMdm4NphF7pR3oMV17ml4lsXsiuvxNQXwqE8f/ziAfp/ZUYWqkEVUc69eiNHLNUzL6SPPFqCgxMpNoF8jMijv5Rmi+NWvwGCCgdcYp5RmcfiHn/83E8+x68KNoNBWbCZIvC3TpYrno4d7Ji/gSp2dtctLvhMZMzukPRW5iyKN3aNI8ODJD5TPPbXMN0B7XOZU9M4aiz3IpYdsiZwcHyblCq4WMk2K/h+s++p6lkXAF6KqmNKewXza1pJGfzmhbTrRYHLMUzUQeBhJTZBUFeXJT8WHdINoV70SykLZyU0eh2BzjPOW7fMM6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP0m5fEJkd3B7Qh6DPpCoP4ZtIZdbWL+1PtIZr2jEUk=;
 b=OwsdefG2j7Km19KVSBORyTs6cZqwU+QZizhjiuXaPLj/34xI+WQpCFAFzz2/9c9mEcLQHpOASImbKWn1C1QcIkRRyJtuWLQjFoBz21sRWoAmFlS90C0nhreaC7BAC7QfRJHqOalwgJHmOqKZlLJYATpYPH7Etl3Fo6hH/cfDBQvGWyse6EALAgZkCGrPIhP5z/ZFnWgA3IOU4fgCtvwx5L7LmNu++ekUEhU0pS+NxCWgLQ7CUsf5Z+pmMH1VwRU8lV78yMEblqFF0y+2bFG+NBpEMiwDiZxtcCpyyAQCd/51OcKJHdH0QEfzgv/Tt6jvfJQE+urz/y0Pk0Vl4dz4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP0m5fEJkd3B7Qh6DPpCoP4ZtIZdbWL+1PtIZr2jEUk=;
 b=kQlNjhkfEiL59HQQ7uX4P1UU6jBrdRVBI62UtC4VkVTnhElfOghbwZZmcBmTQNmujRKcWvyZHi5KAss0xBOGY7FUyMTTMPPYFFFp5if4klFG54v5XpWpkCKfPHNV+VfYd0X14EFd5xCqoicQ71K91xtf5KycQz/G3wIp3IC2Qtw=
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
Subject: [PATCH v5 06/24] xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:51 +0800
Message-ID: <20251212040209.1970553-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: bae88c4b-a625-4fff-c781-08de3933da6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hn4y3k0UCm1t6sEcbTQdXs//MY3R7Qtnfl5LpFFqxYXeG7PgnNNUU4wnxVaO?=
 =?us-ascii?Q?THzj7Bq0pX0aBrSBa0KJYTsaRONTF1jcFqn+Sbd0+lIwxG/PA2qhi9/z+PT/?=
 =?us-ascii?Q?kLAZRiY4SzytkF+hKZ0Yq/p4VN51q1uYaaXD/XofIqK2NpUVvF2zn+qVOLTw?=
 =?us-ascii?Q?T150pshWWiae+nZXGuIUN4UecrXezEpsoN+fnvXRowiVjd69h/q9eisY90E/?=
 =?us-ascii?Q?vl2ia0X5I9RRfrcIZTBPzfprQzid2hUKSHWu3VjSF2ckmwHfuI7t/EQCaYyL?=
 =?us-ascii?Q?qX9jOuXiiImSOE+RN8ogqq3fRCH13qozJYqHNHAl9aguw06GdbZ7C6q7Opt0?=
 =?us-ascii?Q?SKXn6MlqeZ804aoLQfoHJac2qWruUPE57h0typlMuxPTmPfRSvmU4++mw2yq?=
 =?us-ascii?Q?O0Zmsl0ycWjDx0oVSd+ZEy2CILNZLxEfcdDmQHb1zKsWKOOMIdHGRECwivCV?=
 =?us-ascii?Q?Saag2H5u8h6wZrPpRstiHrX0PRwjjOzfKmmC1ebFkBSq+sjMyMZUDdEpbfcD?=
 =?us-ascii?Q?nTmlaMzQoNwNktJ6Ulz65MFU0goJFPDMU8hn3MWSCV1OJnuqZOJ90Q/mUEL5?=
 =?us-ascii?Q?WjYrqy2dvIewjgcgtN5j2cQ3qm8zt9SweELn88xHipLc9LAqvXR1rcfRpmjp?=
 =?us-ascii?Q?szbWPXn9xp7Mif9TntwmaEnJrQscX2TMfnKhPnj23cbmR2ceBSRsnIczCqcn?=
 =?us-ascii?Q?UxMVEKC5/qMBoCHMsjVFQb/2SYbetagZ8735kHdi7U/svX+DsuzCuZS8CFXl?=
 =?us-ascii?Q?RUJ8tKOJWQtD6Yq7X5VlI3yIZhCQC57aMzBcMP45mQVO38KpYDo/LfOA1LEE?=
 =?us-ascii?Q?i/L/uGePIA/s5pGS3Eit1c4FetBciu+nNz1HKi4qz/PCRgYzys4BLkIC8i5j?=
 =?us-ascii?Q?JMZgDyN/PexEsezmhC+2dwEoM+QYK1mdVSiH13oic4gH1Cx8o0xrkS+wfDnJ?=
 =?us-ascii?Q?WxX6n+J5t1PisGJxWjFVlXiu/G64rUDs5MhTGbF4jtKSDL7A+zvL0n0IW4IC?=
 =?us-ascii?Q?24RH1lIRqyendUDCrl8R1XCBl+8gLkJfWDOxdopHkTp0nYgdlzbBgQOvMEW0?=
 =?us-ascii?Q?sfhCo+IKnmLLyXEt4Dgb5wuJne4T42kn5xZC9jyYVS7JIH2HhP4ntCU8V37z?=
 =?us-ascii?Q?X1cuJMqpW6unKmo5oTpHtcxS1+vSn/icoxiH6qQnkketDs5RnxsTYAxSYjYm?=
 =?us-ascii?Q?yI71R1sjSymCWE+2TwDIa5WHTQX77SzODPCD5NfWb3u9VJCKAkUbg/IgnIEk?=
 =?us-ascii?Q?V0PyAfL0ZB+h1yhTxHwO/8qYh9kOGflZASWPSmWlfi8Kophkr0f2N1Gcihvz?=
 =?us-ascii?Q?xuYYJIcl7xV/7nb5tXdKK0XKbol3neJ/aFyBzbcuzrPVYHetlgyCDJru78+Q?=
 =?us-ascii?Q?5DCdszniMCyPzigZ4Ba2i9PwVdn+Iu3HLwvs5S+PDBjeBjBPs/Do1K8JPu/3?=
 =?us-ascii?Q?MN/Jnhs8dGS7Y/LoNbxnVJmOLvAIzSkadH+k82Wn3EdII1LxK7Ttu8j25PGr?=
 =?us-ascii?Q?xGfdm2W7zETujWK0x1xgmjxx8tGGlwfSVgEz6NWNTKDwUbuKXIQLg8q4Iypv?=
 =?us-ascii?Q?FGBvixYYPmb/fP2c6KY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:40.3381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae88c4b-a625-4fff-c781-08de3933da6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905

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
index 7f7ed62f78..2914508a8f 100644
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


