Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB4AC4AB5
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998067.1378903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1d-0004c6-65; Tue, 27 May 2025 08:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998067.1378903; Tue, 27 May 2025 08:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1c-0004XN-V4; Tue, 27 May 2025 08:51:08 +0000
Received: by outflank-mailman (input) for mailman id 998067;
 Tue, 27 May 2025 08:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0F-0002ks-81
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ab588a-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:36 +0200 (CEST)
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 08:49:36 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::21) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.20 via Frontend Transport; Tue,
 27 May 2025 08:49:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:33 -0500
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
X-Inumbo-ID: 84ab588a-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7Zm4GZQMTHpOJ/utqLehAb078P5Mxqsc/OC+NByfLRAW9CHiM2PxiYe/9BzNhd0/mQmb3ajefmTFcFdYeJ5g0it0dvh6kmedbvND57q9MPH5nB3soYWxzXdnkA69dqZqkL7QaTmqUKE3GJS2vPFWTZJe1Cbu+SswpEYMbyVP4JJchBhd7vNQCgDMCjSMRrzspojY/w02TQCYubqzrnZvXgsJ6poIC6v4qlg781CrHAmoWkE1VKRcDqH+3F+2EqIyZmH3xAa0KzlDPIRXWVjMnlIsJuBd/YUGXDScq0se/tNKLT0B6GGwyzIx4KksRPCSXLZbQThoo2o/KY9r5/LOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8UNDtkJ77Jej48aHtABIfIEduYhPVXTw5TZb7gBSLo=;
 b=YvTzvSsz7/Y1BCH3fzCW1X0fZmsXmJA4mxJp2ELz8HJt2M7KFygjcDAwmEhb9RWecgaejtsdKzhjywqtCDUHQ1N4/3QNEHaPRFXAv/TYk/FSfTxntWqTK2srlnNgHR6aFU4S39Zkc3T5fNC52NsiQwZW4UM2T6w7K5Qw/vtILV0YjS7yH1jC9YXQldDey3DmTh6FVoi1BfUSQpRrKs1MDGMTPrzQlGRLxhcO6E3ob/LYgtM2EAaB5NwG1/lRnsdA0h+7P+9Qcy4lNnnfWIWDPDwCCMA0SZcdSKGroHRB34OgDYRgEJ9VP0zHdp/JKNU5EM/WPhGH4ivLwTyEh3YJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8UNDtkJ77Jej48aHtABIfIEduYhPVXTw5TZb7gBSLo=;
 b=vfFE3rA2KdTTHGJfe43JYLfF6lEC237f1NuYuSDG2YbV8oUlWjMfw+g1XD2O7Jl4+7Un8OI2FfqGg3NZYurc/XB6nDswgDsC4xqQwympdjgLZ2g3r2cRq0Kipfr7ZlYHntKW0vnwSp2DL6xUZHwFo6XEk8/L9/IeJhzqvbRgBKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v5 13/18] xen/cpufreq: normalize hwp driver check with hwp_active()
Date: Tue, 27 May 2025 16:48:28 +0800
Message-ID: <20250527084833.338427-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 9596d741-2bc9-4640-f764-08dd9cfb6815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2V7q0DghCvDVWe4wE1IsFwapW+XICSdq2t0EU9CYOyD+3+XeMU8qRswEGPl1?=
 =?us-ascii?Q?o95I9+COMKNn4R9/3b5BiKc7FHXvlW5Kkc88uXFFbjMJFY1e2elPTa4rDX8K?=
 =?us-ascii?Q?ArapXye+P/zVbB6iosEFwvGk67cgTafYy5fNKV6U2alfQj/0f9ktjU/Jip4z?=
 =?us-ascii?Q?v1uN8ekJwwp1MNfqAF67fZ9k9YBeX5CC095xEo+R1lVQnOR5RQW4QKD08JxN?=
 =?us-ascii?Q?cAkNDaG19k12bC50jAGLqP7byyytt+IQC9So9gsulodIlKgBJI15W7GM02b3?=
 =?us-ascii?Q?m8W1OjG/u8VFwsU7LsQwsZ47ZCHoeWJ8A8eJed5VVCgb4udP2CugXyaXp73p?=
 =?us-ascii?Q?bEt82dS979WH/Okk6eSoWm4wIFQ+5fsKnd04UJxuH3AS9eSpoF4YiwrqLz7v?=
 =?us-ascii?Q?8KkhYB9pjqhhfcfFcVkIieP2+vE9n3HdoXFBB8QdvBh6MkIS5lXgGwcXM21w?=
 =?us-ascii?Q?zl4wogqG6DycIPYwTafHLNvFq8RBmoJIZunk+ehP1SkJH26CiVphaaXVmTd1?=
 =?us-ascii?Q?Z7J1f4yZYvHVNsYoMKeMAiANcFSFlACz6RA6kEurD16ks5T8evNhBUBO3diH?=
 =?us-ascii?Q?H0cVHeMaspWrXBzrpooldUpSoiKmJKxjetbvkVsTIueFlr4qDavTAQY2xo1h?=
 =?us-ascii?Q?9zLls8jywPLAqQmNO7WYpoGGeahHwoqZ+sUxoTrW7Le0fAMKhHW0HOSJGg1a?=
 =?us-ascii?Q?Y/F5bKOnhAyyE0wnKJ3pNt8XSFxRpQyOfKzrU7IzNs3XJOskMGzPxKSQ9tmW?=
 =?us-ascii?Q?cZ9aLGWKi7GO67/uGYwTnD3rK0KKnrrPn19jnT9TqeOjOr5KnyHKjKVoj7kC?=
 =?us-ascii?Q?xBkeKY+nL1Gu1JGHWAOIXzFhZB5YLbtX/rKPlwk/5QuXU3diTwk+rSvMtlok?=
 =?us-ascii?Q?iBFt+8uIqPIBjm1HHe2TQNbz+LhShTO2YTIt/OXjQ9u9HrAvifd0SgdeYR7k?=
 =?us-ascii?Q?auRiPk1qFD1KX+tk9F80jhDpFWlUGC9tnWkh6tj1jVvHRS6fl6XyVVoSA4Wg?=
 =?us-ascii?Q?uvtfpZw0QY3fMaL82U6dIhXMVc2NVvPyF3g2ehxG94VibRU/fFx5xGB9GSjc?=
 =?us-ascii?Q?15NbVk9J+6x0t0jQ5+7y439GzS86cLQLsql6h8S6l7JgJwAUGDhM8QPcZPI0?=
 =?us-ascii?Q?BERffxby6ECVayc0/OfngGPmEWbqnx3DKyJquz6KnztVQE4EyFkWRtJ0MmOq?=
 =?us-ascii?Q?78h5K5lGeKiVChtkI27IAnB81MZyGFtkh6UIVoQJ6LmplY7vwUJAeOS6iH/6?=
 =?us-ascii?Q?iaxdJvSgJRtCubmxMm2QzOahkO7k0u+PzymvpU6tBZXe1B2nRdUr9aGv0P5p?=
 =?us-ascii?Q?T4ixIzFdTmOpBCRhVrS6vfksv6h0m7wDYhi1eS9Ufoa7oqD/iXF3yPNT+nn8?=
 =?us-ascii?Q?F8CMWs5R/6azFQGeR/cQF18H5UBCrlJlFZbnRvx+FSeMvCxOFLDqgVz4w3eZ?=
 =?us-ascii?Q?z4PBJL1IzC/TDFQo4pwa2RZ25GTUJijAGawbgaCKFbRZsApkwQjMPsdXhZyq?=
 =?us-ascii?Q?Bxbt0cJaH68nvhwKyZu+V/Bad03tk+N+VvlW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:35.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9596d741-2bc9-4640-f764-08dd9cfb6815
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810

Instead of using hypercall passing parameter to identify hwp driver,
we shall use hwp_active(). Also, we've already used hwp_active() in
do_get_pm_info() in the same file to do hwp driver check, it's
better syncing with same way.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
 xen/drivers/acpi/pmstat.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 514475cf5c..c09e001ec3 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -253,9 +253,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( IS_ENABLED(CONFIG_INTEL) &&
-         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
-                  CPUFREQ_NAME_LEN) )
+    if ( hwp_active() )
         ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
     else
     {
-- 
2.34.1


