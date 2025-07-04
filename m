Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31208AF8E98
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033093.1406557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckg-0000DD-Ca; Fri, 04 Jul 2025 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033093.1406557; Fri, 04 Jul 2025 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckg-0000A4-5z; Fri, 04 Jul 2025 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1033093;
 Fri, 04 Jul 2025 09:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcke-0006x0-8K
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88eacee2-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:34 +0200 (CEST)
Received: from MW4PR03CA0246.namprd03.prod.outlook.com (2603:10b6:303:b4::11)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:30:30 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::20) by MW4PR03CA0246.outlook.office365.com
 (2603:10b6:303:b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:26 -0500
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
X-Inumbo-ID: 88eacee2-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBFdd9uagrf0OuzKpcBKig+IU4WMyk2HgL2Zsxe4yYGW8Zx7eSTSfMExQre+nPHR4tOa1U74V6eZ5GiVsimpQ+efRJhM1A2fy3T/NkUyP+Pj1QrMy2h/NSoQcPnuKfOsuhdAKgbUMbu6+g4fGYHBgEI4KMM+dfZoYeA+j/NbDLieViP7nppJf2V1SHDsJVJ5GTkSSUeu3XDsovW2wRyt+JhhpNxbpmsYSxTNuTUD2nEQDQcOWub2EHGEhJPKyqgyeSIEu9svrsZC+fc3Bql2PNhw8rH2mvNBrx1fVdc41HBdha7B0EkrJRzhQbjx8HhC6RD2iXLYnrge4Rbi7YHgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPsu3Whzar30hPPztM4eYMHCA+8Epbp9x/t6GVQxLw0=;
 b=Bc9S1nC9PDGswzvWD4Mr7Wal24R13QKj5tiLyZe7Z8vSd1JNTUkTKGRyhoMfCpbt9d8WvyZeRN6pV4jXLUDNK70KI+hq/ms31ZTX1ThWCJ2VcO0f7/lOqsI9SsTabLsaE3jkPnl6aK0DvmDgVNrY71HjCAHRdKvARyMLoTaJ22iLyRGHxzrrfw+QGV94hVxJoBMvHpyWz1GVm9gZGxcSUuBNclEzryOeCg2HzMoGmyoT79udRin9Simzz0mJPyWwq9BsQKXt79yOYEjfDRDTWsg4SqigD4MdehziOrjt9ZmbfkXL/0bG9QlojAgF39dqTN4f9EBtUXjo4/mAh9qSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPsu3Whzar30hPPztM4eYMHCA+8Epbp9x/t6GVQxLw0=;
 b=t61+WeKZmGRa4dnlu/9jHISbMfNAocyGIbzZGlEskD/S5guPiI9J/pEDMWgFvOcL5kPMp4zF3t9LqXRuLkKe46o0fzl+d9KPiHVDqfy2/ULTVYPkVgsNBdzaf/bVQA5vE0KO9tAWJRLgacJvEB1xVi5as9ztE8qcGCVlDf/zhhY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 07/18] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
Date: Fri, 4 Jul 2025 17:29:41 +0800
Message-ID: <20250704092952.822578-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e11384-54e6-428b-0bc9-08ddbadd6acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7v55Bl1ZwHh//FU/Q3iE7R6Pt/w4Ggb7xHzwjkUKWsmsNoaYt3L62oDYP2mz?=
 =?us-ascii?Q?D8fqcib/w7ffTcgFmhRVhX/OGPMpl+jbBCV0EX/4ZPGtg224Ye3AoitHdoXR?=
 =?us-ascii?Q?pQj2KVBBb6c3nAGpzXIkOriiZK5gkylTeonampopKryFM2plZ9jeIqjNG2ry?=
 =?us-ascii?Q?aOMIUIc35FRdVcqNIfvQZrkvFOUZuuAh2AlwIza3S+jFYRAUAKzn3pUGE/9T?=
 =?us-ascii?Q?xcFvw69KTs3wEJ0wZp24Sma1XH++dLBFN9eJrgV56YCTNHImtJ1fyAVkhfpL?=
 =?us-ascii?Q?b9jZjX4u9kAUBKjsDiJVAdODULxHa3ayqTsLr3gv6oHU8n95tgNeouYY9Y2q?=
 =?us-ascii?Q?bo3zJyjNeltjoeNWScSteRJngaz07NjpF4Rmwlv9Uu0n6STdNe58/FXqUpnq?=
 =?us-ascii?Q?a6jm0HNDjjzNXLoUB8MJ5osF2HwOBCbb6UV5fGYz85fpxfx3eFLnGLSF+FBy?=
 =?us-ascii?Q?MRf76WijqJ+/pIQI1puTX4H7n5dI5kzLBgofLO0uYWty3KHkq6G+stCbAIws?=
 =?us-ascii?Q?licvJpSlVRCULbukxpxkDKZf5SSF8JWdxYY8b+oNW8dw9bfA3XMttsdUufEv?=
 =?us-ascii?Q?xGnhjEKNwzEYDur3/J88E9UPUNSrZk0g/PJqXlvyc505+pwbwmFSjv15Um8t?=
 =?us-ascii?Q?hzCZs1iL5UDIOWdEKAHUOlldVNnoze3Yq4xl4LOStG73Cte8zyV4D4osBTZR?=
 =?us-ascii?Q?3g+s0TQiLpLKQGIWDP6l54p09Cq66eCttkd20F2JsygLloklM308091zkWmG?=
 =?us-ascii?Q?RY0k4swNhfhOD0C8BnlBLbC/wzk7+NRcXbvG4pWNLV4h7+8iW+wrKW0VPt6h?=
 =?us-ascii?Q?tusdYMXwah4kaAk6MlDF0I+wop5BxBIAYoiM0hFvmvaefgJVQtBqNl81bBDN?=
 =?us-ascii?Q?/K9paaSF+DyHT1ryCQqJRJY5We9wKXS30qfZyirlykvf3sIcLjgkw1UEMsrY?=
 =?us-ascii?Q?Nk0KIu565ZX1QPpAOaqbfyQ2e3LYHLshXI2PmKQCb2Xu0kQEMYQrlnMz8osR?=
 =?us-ascii?Q?pmezulkywxe4vJ6kWb4xBbkwCnx+oAKtTK9a0iwCmUcR/3Hhw8yEAV0ZsMn6?=
 =?us-ascii?Q?grhaRahG2tHF1A/g5W47tfIDsM/51l+PyBVSPzVL7Tz5TyRBZvFqGVpSxYox?=
 =?us-ascii?Q?yrm7z8eSUMopGw98L1yTcv9MgX5erPh2/Mzz6CzZePTapBOdQeNmOxHioukc?=
 =?us-ascii?Q?sMTrg9/92XskQgWjrHIohu8J5xDzZlyg3pc08A38d6wya5yblFIhGO2UepMR?=
 =?us-ascii?Q?h3XWP3I4SNHCc3TqV9qPoWYbwF6I9M/IEoKxlnbyD3dSTQs4mHz6xdS3KmAg?=
 =?us-ascii?Q?J6xdZlY3Vy2vzBctYKWMlAT9wlgewPzec6mqe53pGkDNVkwKRLdh8mua2fP1?=
 =?us-ascii?Q?/OaG57mytEeH/jtaxl/LIzkW2um0ALnoBuvqCSY3u0/aiIQAm5xOSa7vE9nb?=
 =?us-ascii?Q?+3eF6IfqAxwNYEc81zVkQA5kniHMPYZgO4/rKT7VguwryAwkBFSu7KHyFHZC?=
 =?us-ascii?Q?acKC8B+ULRAXZBz/XTCAXd6g3mh/j3gqp7Pr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:29.6959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e11384-54e6-428b-0bc9-08ddbadd6acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742

The following function is only to serve spinlock profiling via
XEN_SYSCTL_lockprof_op, so it shall be wrapped:
- spinlock_profile_control()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/spinlock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 38caa10a2e..0389293b09 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -690,6 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
 }
 
+#ifdef CONFIG_SYSCTL
 typedef struct {
     struct xen_sysctl_lockprof_op *pc;
     int                      rc;
@@ -749,6 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
-- 
2.34.1


