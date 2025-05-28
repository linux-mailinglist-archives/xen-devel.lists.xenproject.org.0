Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E8AC658E
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999071.1379849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvM-0003r5-Ge; Wed, 28 May 2025 09:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999071.1379849; Wed, 28 May 2025 09:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvM-0003np-Aw; Wed, 28 May 2025 09:18:12 +0000
Received: by outflank-mailman (input) for mailman id 999071;
 Wed, 28 May 2025 09:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvK-0001jE-9a
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2414::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aada3f53-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:07 +0200 (CEST)
Received: from SN7PR18CA0012.namprd18.prod.outlook.com (2603:10b6:806:f3::35)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 09:18:04 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::60) by SN7PR18CA0012.outlook.office365.com
 (2603:10b6:806:f3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 09:18:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:04 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:01 -0500
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
X-Inumbo-ID: aada3f53-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQSx5LbZ6+mjE4TN9TPP6BtZ4Anv15FvVEGDUAD4dUgWP3kvJqvS7DfbhwKYVXNT0AZ3mm8XNm78HfOtk5nP7epwl91fxPb4kg3xsbrjcKXRub7lxYdEvDsEn0IXpg8QNx4RrXvlt4BXAk5MTkFhWaSwYABnzee/2MhQyjmfZgCrKREWQqqPAlUR9ED9SEIJTBbVmJT+ASEXNiKg7VcBaRvjHQVQITxA1gNPvnMSqYbOd+OTBnoND+Gjmqh9SyTOaMhiINpsLtPGV2C9PgaUkvsQuHJZguHNwtNg/aikJ0OKb5cxpfK1EyIkUPg7Syqq8AtFDfrJKnZrS9SeXetkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO6UlKiuVPi7TbpfR8fz/JNSlwLaSYSXABlcKqP5Puo=;
 b=JqgNkudZdkEQk4FPwK1fz8zQZGHqr/aNvwoQybKaDNeI0WmvsUtK7P6Mrcht6lgiD1fS+vc1dTrTu+s8lwKJvqmidpIakDox+pcQDPCu24G1Izd3EOrv7R+O44SOZxebt+9RVFX1lsj+f7qx3NWfflr028wRjT9qYTYVZPl5mUd3yRw1GsmU7pyOSPY9KTrxeN5BTxnIVFiyZgGvWRVwitvh8LwU35wjcYdBUrkdcVtDnJ4BcU/8OYOq7hKysSCfxL7rwjAHNzDPk8nE5Ff3+8WmnWZt+xNNU3ig/QGtOt64hwETS9GX62hjiHISiI+btyrnStjE+KaycCrIzn2kyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO6UlKiuVPi7TbpfR8fz/JNSlwLaSYSXABlcKqP5Puo=;
 b=MGTnZqcN4Ylgmf9HSbkPpK/jUXECcEjLBYn2JRs+KB9x9Q00qoMH5F/3AXrL/mVS+ZvSo0CJKVRdKjch6xzQx8w1lTjixGRoxe8kfeXBkJ1ZmZgou0+9zR6wnVrBac8AyJffCO0a2+NC3Wva81tH9p6zYcZ5GcrGNum+i6jfeY0=
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
Subject: [PATCH v4 09/20] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Wed, 28 May 2025 17:16:57 +0800
Message-ID: <20250528091708.390767-10-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6c2526-3b3d-4cb6-af9a-08dd9dc88d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8txRWvdFF1nBVuc7xNza9emlU+IoflcYqeaupPi5psuScCpRxw2us+LXTr0C?=
 =?us-ascii?Q?+gGDT/B+BmCL6ojpIJby1RNJSkK7ku8jb7ZPJd+L1iVqGhkLiYAd7j5XURzK?=
 =?us-ascii?Q?lvzsQZNjqmkoQ5byEYoG/9ZNyrfYENwDhtJcNax2O7BCOpvN4e9rrAK8HRyN?=
 =?us-ascii?Q?NcVy8ahTTC/YtIztt7mMbiIgFJPca6lF3s4KiLQVOrQFupCm9g46rcj9YdOo?=
 =?us-ascii?Q?adKJDlP7Au35VtbdHAEvP2x1WePOJ7W5LzruUScHYeLXOc3BmteyOMQqvT2w?=
 =?us-ascii?Q?6O+cHffcEwzc/VbjW1k1McGXwrb9wf43QE1lzTdWr5VPupbjvxTPJ9lkDNEv?=
 =?us-ascii?Q?vNiGY6+nYtVHWWNmkPF55hrbuwS3IVRJEEWqDqMXuovto+3x5+skct1fiReU?=
 =?us-ascii?Q?Rx616FH83B4m/txiDV9/TC5lzpUA4UWCfyk139L4gA8LZAAj1CadqGwzJjMj?=
 =?us-ascii?Q?v3OG5L262Dxn9Ykh0VeHbzVaPJBWil7KCDWaOL7UuBucYNxUWq9xDUiNuqfR?=
 =?us-ascii?Q?nx0w5YM7c2ocLhgNFaBMQsxsjd35yvQt5vnUR5MBCKTvlOjjNAJ6gJ8Cq+Kv?=
 =?us-ascii?Q?M4WKUFdvPG6dKxKcaMvUGubEDoe4QNw9/pjzDV9faELi5T79NNE0jHu5YFuD?=
 =?us-ascii?Q?ydWhj+YlujRFb3UTmuJUwiGDW6swkBwlACy7FgU7WzywJyI6XgtSZomxlgMP?=
 =?us-ascii?Q?9FhftV0eV710vlgGKPbPUgY5RRJGaSpqTpLCmNpDNSW4HeE9jhL6zfbpbhgx?=
 =?us-ascii?Q?MPbLUxV3957Fzjfp5agnMz7QAV9ZSyFDK5jjaQzmy8j5yzFPqXYqLs8+O0ot?=
 =?us-ascii?Q?8JZHgh3MKA5i2VY4EzJMnNGwcWIOq4ZMTJ828Wawn2uvbFXz1ejnqyGYODTO?=
 =?us-ascii?Q?1/lZF0YWTpx5QyRPD9vq201DR7sKoo7q66UPe4gg8LLa6Ij9UMUrHbEvktCb?=
 =?us-ascii?Q?xFAZ5Qi+y+DlNZiwNlLS7KzqfpAEY2KtP2EAIZ+6OsIboNC+2Vfh5re2dfvi?=
 =?us-ascii?Q?7P32vtBvpF3zTC6jMfTf0eS4FPJkbHM55NsAlTMEVLx6bXmGuGOWghdgTUw0?=
 =?us-ascii?Q?pi5G2tMcfvjRIfKJzcBKZKhWouI6uTCUKibgN9dmGj/ZriACDnpYj9u5xYhU?=
 =?us-ascii?Q?yZCBFbXIzUBzBIZ7gnlp3xZ0E2yYWPZQGCr4IRFBJdm9YdmSTi2hqX9cYLWN?=
 =?us-ascii?Q?didgjq2umbDaY0vKJ6aXYpBNJYEp+r/FheGsLdOl95WeVA3AWaM9lnmUwIbz?=
 =?us-ascii?Q?/YNdwQdq/6FrPr2PY0a0Jo8FpB0DhsFeEgPSHD+ybuJwn0o/jwVKYWn1Rxw8?=
 =?us-ascii?Q?phntOFcKr1P4kXKqYvEqEoqvpylSK9d5T6ttF26tpiS9FIUmJf56y8+hG+Ty?=
 =?us-ascii?Q?wyqkT/izDFUJgIK672E720s+agjHbwQw+HWIaj4M6WIKeluuryaF2nFdMjPS?=
 =?us-ascii?Q?ssfofIJEN3HMecAbS12TX7Qxp4MqPjs+Ccl1r/xT5DFMUOARACSnYvxiWAR5?=
 =?us-ascii?Q?1cTmDHdWz/i/1liwZMNP/Fa2QHVb1jMWMxeB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:04.1798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6c2526-3b3d-4cb6-af9a-08dd9dc88d14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
v4 -> v5:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/perfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8302b7cf6d..0f3b89af2c 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Local variables:
-- 
2.34.1


