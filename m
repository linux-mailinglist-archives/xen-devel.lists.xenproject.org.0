Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCEEAFAA1A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035075.1407302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJH-000873-MY; Mon, 07 Jul 2025 03:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035075.1407302; Mon, 07 Jul 2025 03:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJH-00085T-JV; Mon, 07 Jul 2025 03:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1035075;
 Mon, 07 Jul 2025 03:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJF-0007mT-VJ
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b11ad30-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:24 +0200 (CEST)
Received: from CH2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:610:4d::21)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 03:14:21 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::17) by CH2PR19CA0011.outlook.office365.com
 (2603:10b6:610:4d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:12 -0500
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
X-Inumbo-ID: 7b11ad30-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwRTx31fNS0k+ySHR82pduseSqVnUAloe067dW8j21Qc4k1nYT6lCyFiEcTDYoiHlH1ppsvAzoakpxqsgJ+BVBgtjMMng4DZ36ERXkzHZuX3zj/34vaaoqKl3x9yYnTUVS/uRSak5UzXS/UhMU5CQUhfaOjtDc8uX28ytod7UKOBbv8WGrO3z2urOAPEHK2wXemR6k8hX/imwDB91WNOMywSt6nuTMjprQCmMAzCZMkFMI6DSA/qTvUrm3ZYNRa0Xf6rnL5opaPKzO9llL0JLl4V+SEGC922Y/Z/anWRJ2B14RVUPb7ty7zSMqsTbAmZFcRB3VW81bPA/sQ9enlvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=GthoU+gVHfqPaPTJGotMGgEjz1u/LuqIyxId0hIsBv81Rd1SNSKyfl2iXOkZEHD7hvJiSKXZ4nXwHJVtVBRfipyMWCz4R2DR9eirFtnVif8KbVVJk1xE43qC8MESp4+Hz0cmQIX/v+npUvWYGJvl/z/ZjJ0FwzM4bqsnYbzWKomOBpkgni8bYTvGuHjbLyr6Et1wc9oT+TLEk9N98WZSoBrsXvPnCxzLyjZWT7JwsutYe4iKm1TMOdmvGM1lSodWGciyHWSNS61S1C0JMVAW4FVDljt3B92lZU7pLB0k4BPQ0r/nFsrXdRCsuY4AVlK8m0BA7DjH3Yauy7nsMb2v6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=uvV1qFgClss0zb9xMQyJYJeQ+bOx/T3onbq+B9rKFw5s/RG2JQggXXG4b1VnYUD3ReK1gzGzcmF8SRBKArw6JTEAsFvji8rn3lPsZuaMYcIyuWciia4I80IHmzDx+miKLRk9hIDpFhJVk5rDNvMV5JPDRMljYor1erelaxYS5ZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 03/11] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Mon, 7 Jul 2025 11:13:38 +0800
Message-ID: <20250707031346.901567-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: d361d738-d802-4d99-7f2a-08ddbd045d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oXXp1ZfmQg310TuFb6ycfi0J6f6FOEGvm8n/cTfFu186HkTzIkqsVD8aYWDd?=
 =?us-ascii?Q?XVkA1DGF7wNWRnaYpnhaePD4p5MhY2Mr/OMYW5jxQ2azrI21ffdyQcQG1yDE?=
 =?us-ascii?Q?prSniRK0UTErF74x+y3nnNMiE7YL52nZpS50ciQ6W0mvYyLPBL/O2rpkHoii?=
 =?us-ascii?Q?Je04d2W85sWHdltiH41jQtZ9LuMyJxroC2Xf0pmpNucKYWy9o1MBBePWfkq1?=
 =?us-ascii?Q?zZMn4mVWKcpkJdBdjZTK+nqsU9cXYV6NV62XLtJlwmrQkmk1o+9WY0A2CqMl?=
 =?us-ascii?Q?IN3hpoyXMdBYF7tHI29AUukDFe2OAXSzjWlwWQT7Sgk2ZpQxytzTzrzaCGAz?=
 =?us-ascii?Q?N1RPWSMSCYegTKpskg+pviQXIKGqR08mRnxbYEDnNxc3gpb2mdmpGg9fPXUT?=
 =?us-ascii?Q?uDGX20hNDrOzaKeCPb/r1QP16dWmdzDpu0POe0kmNb1OG3WAg7HCkEqoOX2M?=
 =?us-ascii?Q?t7EucnhTBS898SeKGDfAaBgk1XPeBD8XWFxUJ7cZs4IdyMyLExHDMJbIwN3E?=
 =?us-ascii?Q?Kjdw/K8fmUgasw2j1UCKrfpNZOC4Dy3Icd/bvvrsxwVA7Dcyl3yQ6nnk0BnS?=
 =?us-ascii?Q?GGvMkyBEkaPkrbEpAM4YLLSZZTHu38DZul1dqUg7ZlRh/pzNnYK3k+c5p4ff?=
 =?us-ascii?Q?+JOZWW5frd9jnNFdufXlR8i7C1WFQptxhFadBfc5WS6JHozaqIEBtOZbWMmc?=
 =?us-ascii?Q?ophiHwM2BhOZcBqBmjlVx1+TLb4u/FzZ8RJRw8YehEQ8ZwfDMtCJ2jTepT/3?=
 =?us-ascii?Q?MqqXD29q4PViAMEQ45UomDS/FbkJ2r+gkktiyFlaoV/HplJllB8LKi3YdXKz?=
 =?us-ascii?Q?zzcNLznC4Pp6O+1x9dX+c13y3YcX089Qi3eTKKCvIpr1ZE+sqcicWaLrXDc7?=
 =?us-ascii?Q?bk1mt9pgcf4y1gg2jFLI4wCy4NMdAY385cd5c11psZaJjBxvhSnj8GiQmrNe?=
 =?us-ascii?Q?R9Csy3P6SGloeyUWjBOyaWpJtIJlkkfuSWMcgrMzkPaiWDh5DoGtlUMbRy4P?=
 =?us-ascii?Q?n2hTzKEWwvkRvS1frOhfNEtoj9bzkqqRQlO6MXOmOsS4cMMOAoaRW1O1T0By?=
 =?us-ascii?Q?lMu9XefUsKvtofY4J85mCERKq+aqp0XdyWF6R0yuQsqHQeaXUnGBNfHmsZF2?=
 =?us-ascii?Q?329+krS0yXLueS6Jg+T0SHhtn8hxNe66KQP9GQdU+7dDaPx2PosDodXvP2kC?=
 =?us-ascii?Q?KI42pIL7Ufr8e2NFK2kMcHQG5pe7fXrL1cUYA2NWRqhCrFdQthIewjLK6BX8?=
 =?us-ascii?Q?TeeEkG3XmFtprvnsgr5FeF8FER4MQWlp+K8l2Bd1NnG3k8vMvnd3pTLnM8X6?=
 =?us-ascii?Q?yEjBJYFvqzcnisGgr0/RuPpUqUE94b+D9xDL2f6kUg+POiHg+u3cUcjm5kCi?=
 =?us-ascii?Q?gvxJv8smckfB1N6KcBDFtZwzQcUDK0Egd1kRp/VLgN72/U7qiu1C9FSFdPVS?=
 =?us-ascii?Q?oF+uMxkCJgqJY5OMt4zlHoQC+W1OdZe9pmtPSXhS6EkCpe1ZYAhs97e7sOFn?=
 =?us-ascii?Q?iEKhnVPkPGKGPaSw+pmP/87nbMh/65ia+NJ4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:20.3866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d361d738-d802-4d99-7f2a-08ddbd045d9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273

The following function shall be wrapped:
- scheduler_id()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..13fdf57e57 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2069,11 +2069,13 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
+#ifdef CONFIG_SYSCTL
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
     return operations.sched_id;
 }
+#endif
 
 /* Adjust scheduling parameter for a given domain. */
 long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
-- 
2.34.1


