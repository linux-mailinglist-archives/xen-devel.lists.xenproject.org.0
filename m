Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF5B40D60
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 20:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107292.1457770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utW7z-0006un-Me; Tue, 02 Sep 2025 18:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107292.1457770; Tue, 02 Sep 2025 18:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utW7z-0006ss-JE; Tue, 02 Sep 2025 18:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1107292;
 Tue, 02 Sep 2025 18:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrvT=3N=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1utW7x-0006sm-M1
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 18:53:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f6e1e1a-882e-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 20:53:06 +0200 (CEST)
Received: from CYXPR03CA0019.namprd03.prod.outlook.com (2603:10b6:930:d0::16)
 by SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:53:03 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::af) by CYXPR03CA0019.outlook.office365.com
 (2603:10b6:930:d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Tue,
 2 Sep 2025 18:53:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 18:53:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 13:53:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 13:53:01 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 13:53:00 -0500
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
X-Inumbo-ID: 0f6e1e1a-882e-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2jN34h1tyZfN1GJ5wzrSi29ix+e+CY9Rr1oJxZde58sSR9WgmpEmzi1maSuJnpNcXROoKg83wKkR5Xnhv/xmyixfPwd54Pe05WhH6ojxYqussVuaBBZP9rBc5C0pN+dF1zKhRxwv/EQufDzKs91TjL7uT8C68r8FfxiG6Zm7w3XwJMYESmmXO1+jwtkq510ZMrCG0YAH5qMHTZIdEaM3ocdTUSp/qiU5l+aEPNLB088gdXfxUjzjI4xGWegpt2Iw6Nxi5oUDwEdhj5T+t/hUj2pKQFkW9PIcTM/ZO1xhg0zDEOlp2CVJz9cEHsOGrrDJMzPPyhGMwC0WoBhMpsfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIy6GuThc4GKjoVg7TEXuAnD5k/i4XiSHVvQgeN4b9I=;
 b=aVcW/YkXdwT4iwAgCWNqNE45fkPh83xoIQ53AjMAhJAyYUKUG63HlyH5rvNbwTUVldLFgv/ncF38V4qMURDq1wZfbBpprhKig5ieKzki/x4/sFCx6YAS/byXlMBf4sbLY7adEg3HsgTONsk0WyEOoW8Z6+Em7NRxJ0nYvccGHAzADS9kMEQ9Alno2DPrySSK7kqWsgNtRRX7yVynZSRLgWI6gZXTWflEQdSov13QW4Sxut4DgwKjo+vb0Lh8be+YmYTyXnvkWBfEk+nAzKpiIUTqT2bxs94RDbJcFCAEoYuUDgOFoM1Vy5MB30qIjX24WipT8R2TZjk+++WTRFlHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIy6GuThc4GKjoVg7TEXuAnD5k/i4XiSHVvQgeN4b9I=;
 b=UvMQHTOi9bOJQm6xskf/asmr46pj9u7J7vyejeVZR5n+yT3iQ71v9yomEe+3Z1qZzaEOEtdxOulb6KQn0zBuLONSgHjjEhn4wgnCqleIEfO1u8jZf608k6BeklQPuDlLk4l4vpJrPdF+GHga5kGtvPGR/yFBm5qIw/SuDeUZ6gQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: [PATCH v1 1/2] automation: call expect script with redirected standard error
Date: Tue, 2 Sep 2025 11:52:34 -0700
Message-ID: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.50.GIT
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: bc929388-3bca-4544-3fee-08ddea51f1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LytvMlJTaWMyYnF0KytYZVNtdGhmY2xvMndhUURLUk8zSDFhL2JnazlFSk9N?=
 =?utf-8?B?ZWlSZmNLTU9JMisxNFlwenFSeUJ4VVNEejNqYXUyWGRObkU2bjQwZkx0SHU2?=
 =?utf-8?B?Nm5PaGpLQUUwUnFaMk16R0oyY010NUlvSDliV0Vwei9VTkRwZjNBRzJaWDlV?=
 =?utf-8?B?b0pabU95S0czNjFOcE1CY3IrbGJESFRrc1dzOVpCQmtXQjl5TzJlSTlRbHQr?=
 =?utf-8?B?RGlCR0Eya05LeU9jenp6Mm9VRzZTZVI0VzV5STZIbmRmSHh6ZGhPUFlKQjYy?=
 =?utf-8?B?RVhrbWt3WEtOY1VrRTM2eWM5UUN0bnpXZDdwTHpGUXdDc2ZLcWpLZjdMUXdP?=
 =?utf-8?B?V1dUdjFkbUViRG9mRlU1QTZhUjVIcU1vUVZUL0hIc3Q1LzZyUEVwdk1LOXgy?=
 =?utf-8?B?MUVsTjdPUHpCVDdCSFRka2Q1MjZRMzIyZ3EyUUdZcHZjRVA1TlFXMzNPZFpB?=
 =?utf-8?B?c0lqaEE5K2dGRjhSRzBuRG12Q3V6eE9vTllzVWRFUUY5QzZPL2daYjRLNVRw?=
 =?utf-8?B?NHE1STBiYUpvVzJvQm1CeEdxYmZGSGlwMVBpM2kyeXpVU09PRHF1bDJRbnY0?=
 =?utf-8?B?MkhqRlQ4WE14WmNiT1prRHpnNk16a2xGVGRSdlQ2dU1jU0p0N1A3TWVlTjlX?=
 =?utf-8?B?Z3VRZUJ2L09WTDY5eXE2QUQrSCtWM05ZcjBvSGxyeVgxSUUvWkh1STJCTTli?=
 =?utf-8?B?am9QNmNZcjM1dE5penlpNGs1ZVBmQTBON21yWUR6aW92UVJxVGJRR21hTitq?=
 =?utf-8?B?bVZOdGtWNytUT0JMeWdVN1A2WkFjN2RyQnJ3SStCT1NmNGRDUng5K0lpTGlv?=
 =?utf-8?B?K2hobFZMdEI4NzVoUXdQVWVCUXcxMC8wVjRjQkk1K3R4c3VySjRsYnNwaWFv?=
 =?utf-8?B?d2pDSXcyM0R1VkNlQjk2cytOSUhyZTZCK2lUeXFtdUk2SUdZRkR2QW5FNUxy?=
 =?utf-8?B?eVZyaUZsU1BZMzFRQjJDVmkxWHpyWkpxRFpBS3ZBUXNWS1Bma0xhN3BFWjVT?=
 =?utf-8?B?RVVvRHFqMTB3UzdNNkVScmZGeGtCNnN6V0l1WU5sTnNSdmlHR3B6b3dFdlJP?=
 =?utf-8?B?NGZSUmk2STVVSE1YSEsxQnJlYXFVUmxBVmwxa3lHZGl2T0xRVHA3ZDJ1NHZJ?=
 =?utf-8?B?UTkvb1p4WG1qZlcxZ0JmY2RiM1k4YzN2UXdxVHJzU3d1aCt5OVVQMlViMCtL?=
 =?utf-8?B?OVA1b0NaRjRoREJGVWtSZUJ0eEV6Y1l6d3FTb3UyQzhueGo0T2FOOUNFeXA2?=
 =?utf-8?B?RVAySmdSQ2NlaXh3VWRZREU3YXNjWjlKbmlFSGtsRHIxU2ZxYnQwdmh0eDRD?=
 =?utf-8?B?R3NxTGxaeFRSU2gvWGNPL0JRcWV5MVdhRGtmZzlqUUFuVlFTcHlkL0t6czdr?=
 =?utf-8?B?VXpvVWpORExTVFY1MWdvejZmZ1pKb1hXZUNNWm9qWHo0SFFkbU1BUVZvU3Ev?=
 =?utf-8?B?R0RUeGw5NHVkUDBvbE1GOGFPK0ZGU0VrMXg3KzUyQSswMERIMjByRjJ0YXdq?=
 =?utf-8?B?eVpJWmhCM05iVzlod2VtZDd5MTR5bUxLNFlWQUtONFB3bmhqRytlRDExOGp0?=
 =?utf-8?B?bEJ2SWVsSmJqRVpvZFdGazVUNzFpRDN3OVIwVXU2RTZsYkhtaWdjemxrQnVu?=
 =?utf-8?B?QVhoMXR6anB2b1BwMU84VVdZSWFsYjFZelM1eDhlOTZOVmtFOWFqRkZ2bGJz?=
 =?utf-8?B?elBNK3R0Wnp3L2lGYTAwN05mMlNhU0VPTVc5Z29TajdiaSs5czYxc3FIVnJ3?=
 =?utf-8?B?WGFxclRyQXBNemd2MDd4blpOK0g3R2d1SW5sSmFxcHBrb1lPblBJVGFCa3pu?=
 =?utf-8?B?RjFPblo3bHVZZURKWlBQV0ROM2tzTW53L3k4ZzZTenJ4R2NyVlk3VjI5NjZh?=
 =?utf-8?B?aFkrMWxTZ1NCMjk1Z3JScU1rTTdyYzR5QjNoSjVWYnJVdE1yTlBXc2pEUG8z?=
 =?utf-8?B?YSt2amd3NktPM3RzeVdHTnpFdTF2RHNKSWNpdlhFVTdMT1dNRzJvbWFQMEkr?=
 =?utf-8?B?WHBudmpQbFZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:53:02.6988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc929388-3bca-4544-3fee-08ddea51f1e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114

From: Victor Lira <victorm.lira@amd.com>

In the console expect script, "send_error" will send a message to standard
error. Current use of this script redirects only standard output into a
pipeline. This causes the error messages to sometimes appear hidden in the
middle of the test logs.

Redirect also standard error to clearly show when a test has timed out or hit
EOF.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
example of the problem:
 - https://gitlab.com/xen-project/people/luca.miccio/xen/-/jobs/11136585863#L615
 - timeout message on line 615 shown before end of log
note:
 - I couldn't check the change on cirrus-ci as I don't have access
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org
---
 .cirrus.yml                                       | 2 +-
 automation/scripts/include/xtf-runner             | 2 +-
 automation/scripts/qemu-alpine-x86_64.sh          | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qemu-smoke-ppc64le.sh          | 2 +-
 automation/scripts/qemu-smoke-riscv64.sh          | 2 +-
 automation/scripts/qubes-x86-64.sh                | 2 +-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 3163ab8f11..f295c8cb0a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -166,7 +166,7 @@ task:
     export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
     export PASSED="Test result: SUCCESS"
     export TEST_TIMEOUT=120
-    ./automation/scripts/console.exp | sed 's/\r\+$//'
+    ./automation/scripts/console.exp |& sed 's/\r\+$//'

   always:
     serial_artifacts:
diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
index b7fea52dad..43ff2d4d88 100644
--- a/automation/scripts/include/xtf-runner
+++ b/automation/scripts/include/xtf-runner
@@ -114,7 +114,7 @@ function xtf_run_test()
 {
     rm -f ${TEST_LOG}
     export BOOT_MSG PASSED TEST_CMD TEST_LOG UBOOT_CMD
-    ./console.exp | sed 's/\r\+$//'
+    ./console.exp |& sed 's/\r\+$//'
 }

 # Setup environment and run an XTF test.
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 746e70483d..c4666b9507 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -84,4 +84,4 @@ export BOOT_MSG="Latest ChangeSet: "
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 4f50eabdef..36c47daa42 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -96,4 +96,4 @@ export BOOT_MSG="Latest ChangeSet: "
 export LOG_MSG="Domain-0"
 export PASSED="/ #"

-../automation/scripts/console.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index d6f6b74880..ee682015a0 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -106,4 +106,4 @@ export TEST_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 0e2c5496db..e27636dc9e 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -149,4 +149,4 @@ export TEST_LOG="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"

-../automation/scripts/console.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index e7a3e670d0..e660485f3a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -218,4 +218,4 @@ export TEST_LOG="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
 export PASSED="${passed}"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 617096ad1f..119c3ed4d5 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -24,4 +24,4 @@ export TEST_CMD="qemu-system-ppc64 \
 export TEST_LOG="${serial_log}"
 export PASSED="Hello, ppc64le!"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 25f9e4190e..c0b1082a08 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,4 +16,4 @@ export TEST_CMD="qemu-system-riscv64 \
 export TEST_LOG="smoke.serial"
 export PASSED="All set up"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index b49a44c5b1..bd939dc948 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -292,7 +292,7 @@ export LOG_MSG="\nWelcome to Alpine Linux"
 export TEST_CMD="ssh $CONTROLLER console"
 export TEST_LOG="smoke.serial"
 export TEST_TIMEOUT="$timeout"
-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
 TEST_RESULT=$?

 if [ -n "$retrieve_xml" ]; then
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 0ad8f658e3..96f534f3aa 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -173,7 +173,7 @@ export BOOT_MSG="Latest ChangeSet: "
 export TEST_CMD="cat ${SERIAL_DEV}"
 export TEST_LOG="smoke.serial"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
 TEST_RESULT=$?
 sh "/scratch/gitlab-runner/${TEST_BOARD}.sh" 2
 exit ${TEST_RESULT}
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 1d7162f1b3..a6da7a830c 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -137,7 +137,7 @@ export LOG_MSG="Welcome to Alpine Linux"
 export TEST_CMD="cat ${SERIAL_DEV}"
 export TEST_LOG="smoke.serial"

-./automation/scripts/console.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp |& sed 's/\r\+$//'
 TEST_RESULT=$?
 sh "/scratch/gitlab-runner/zcu102.sh" 2
 exit ${TEST_RESULT}
--
2.50.GIT

