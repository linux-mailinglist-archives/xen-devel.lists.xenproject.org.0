Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBEADA86D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016514.1393435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xt-0000nF-QF; Mon, 16 Jun 2025 06:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016514.1393435; Mon, 16 Jun 2025 06:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xt-0000lL-MJ; Mon, 16 Jun 2025 06:42:17 +0000
Received: by outflank-mailman (input) for mailman id 1016514;
 Mon, 16 Jun 2025 06:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xs-0008AT-F4
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2406::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a379954-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:16 +0200 (CEST)
Received: from CYXPR03CA0041.namprd03.prod.outlook.com (2603:10b6:930:d2::12)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:42:11 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::80) by CYXPR03CA0041.outlook.office365.com
 (2603:10b6:930:d2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Mon,
 16 Jun 2025 06:42:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:08 -0500
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
X-Inumbo-ID: 0a379954-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/LaStIm4XRo85XJZNtySVFEg5Dq+nBHRbKRaQCEIJFkmhUc/QN4kH7xpwnAN12JX6LurOfd5N2cBbaEtiJCNJjaPe11CKLgH+Hm87fDyxwId/dJrKwEpjgwJDE2AU04oF8/at8AjHpSqU2xjsNj77Uqe4ceDI+3PX88MZWUJuKTIunEOkKTr9AwoNbqE5Qyk4Po8wHP6wehkChrWrV36ByTL5u92PLIdqAHTanCFjboZduS2wcUIfNlTIP1vMQgPJe0GlYBqybszwiaYsnQlvLPqSDkFnKN7d3iLepI5IUyyxOp75Tf4ZgH+2Zo4F+P+i2WkTJgDjzHLNMBc5Ue5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=pmPUCcKHTzi1T5D8gKNR3M62YL+xgqB/SXi8hZfyBGvgFz1tMfIFiB723DUvipCaXGqr6+SqM1cwXvb+3klXCUP8ycuBrI2XLdEbsP9CgQFOmrW+yxb3tnTeuNvuJcqDMWIvVqQgtjZpnDF2GDtWQhJ+onTI8pnyzvCOuKmMohnK3dFwgIGe8Wd/sxR/ACu/tbZSpxJz2DnsL9nGymnd8QKWKzzW/HylFliBqByawNPGZdMy5czUtXBcgBkJhKa+8mBqxjC3oX+dUfba6jtqt/p7rS70DT0H2lauQBfd0RtV8ac/DpH9JXIMH7bMeprGUhVYus/EsnGp96mUXWCHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI/6AN7Kc6qmUPgrDZbatiRRdKNwzya65ykPb1EYoB8=;
 b=gegQpHswEfqYnNGunLpGnXgaCTPXRufrXhtULF0XY1g4xJQ99TMdUJIZROH0WGIlGSTg2sRqNwR4X+xFkVRTUyVaWyKbjca1Qp7Yi/1wIDBX1YtzUxoqzo2meqEcVmvU2vx7ID43DQI4vE+LlI1gVr2WzF1lrzHkIsP1jHDXR0w=
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
Subject: [PATCH v5 06/18] xen/sysctl: wrap around XEN_SYSCTL_sched_id
Date: Mon, 16 Jun 2025 14:41:16 +0800
Message-ID: <20250616064128.581164-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ef4b57-073b-4d34-24fc-08ddaca0ec5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qeXX8PHAcHcAhHY1TA4E3l1oQYIIPH/ZM1MXvLz+4koHnRa3AZfU9Gcg1b8q?=
 =?us-ascii?Q?n24lopB/iSSw/1Exc9t5p9LGR28XRIRoIspmNPM8mkE1zcL/aoIJWWhbYCTY?=
 =?us-ascii?Q?STxM+1tTu5ADHDXPTB5rftnr2icRT3CLQ2JfZqWJlJHBF+tlkg/FdQ/nE9GV?=
 =?us-ascii?Q?8rNRhYc9llS8d81QyrIcASqj19MY4NvZ0qCtvzo7O3l91arxgazKqbGAFYGO?=
 =?us-ascii?Q?/DX0zmcllAUNFn+/ptCfK6uaRuyOHVyrbbN/L6Ni2WdnPPOFlcC1H60aJ+PG?=
 =?us-ascii?Q?RA9ooiRgV51mLYQ5YRqt18Lu/DjE3qc5ypcpmLvL2HYH0z8ppq6qqrVOjIkc?=
 =?us-ascii?Q?VKwv6FzlkrRuH5vLOhUtlKIBXIHYvkbXjX7WreKyjJBm6C2+cLe49rvmpF5Y?=
 =?us-ascii?Q?dOpW+SV7JFYwjAItmLdoKHp9suT6hPewHtZlcKqwWeRezVVHUV4NAqi+vbE7?=
 =?us-ascii?Q?VhF9YjBw2MJcIfj+8+A5IEHiUrmhVtxWjdPeZCVXOGKNQlPA9rhsGeK+saSR?=
 =?us-ascii?Q?HR1f86wPb/cwJdq8AYMigKE5jMhX1OkV/eW5uw9v2F/jIJIiyXMG6B3B5cT+?=
 =?us-ascii?Q?CbyfNVweu9FJdO8rXkESARmoeKxMTVhlcjlR4M54SV2vuWSLhDN4Z7RQKbAw?=
 =?us-ascii?Q?O664JEd/C24ZWbTVRTt7xsm6rYu5g5NmbwSempM/YTbjkiCWc8m62xQdElgA?=
 =?us-ascii?Q?dVNm0xflJQTuTBX+CeeRoxzHJvkaHDqrdyzU3OPjwRXtfjXslF/eFlI56nvu?=
 =?us-ascii?Q?+guxxw9Chrr4FAimq81+WMcsisFOKqojlP3atzOrhO9S4OcX/slC9MpQJbM+?=
 =?us-ascii?Q?Dnc0lQ2i8ZXI9H30ds2PxX0cxMvfoByvS81+EZ0EJVdht8QjiUI0exQ1k9SQ?=
 =?us-ascii?Q?1yTGAVYWIVI3j9HGw739hKv0MeT9dy5egGTV4cms3T3auPkoxVNvOZuj86YF?=
 =?us-ascii?Q?Yd96R/4v2C3jpqEfQ+NDBAFTj/ot8VnMCLchr7/vSHqS2/VVOO2EO/RCIblU?=
 =?us-ascii?Q?RDh/b7MrQCcb/Z/VbUdRS4Imq8qOJ3+cYIxW7R+zS+xGWU4ODw/GZJvtLw1+?=
 =?us-ascii?Q?Dnx80yKi8dD/IQ2LHIPz0m/DkXn/jE2oRKR1M0bdQxNFmJEHR9sliZa+nVWp?=
 =?us-ascii?Q?irTX76WWcUSm6VwrBg9Eill1l5iKNN+XmBHmk9X3N5oZ/fzSdRCPFxQYbbrA?=
 =?us-ascii?Q?D/w93dDDO2jns+7dN2FDeTNFkDKsGSm+xTzfkQd+ruXq8kK/e09Krnl7VyUK?=
 =?us-ascii?Q?D7b7CaB8DB07JBIN5GDuzkd2cFSAo9uLrcK6UmEi5gHiT9e6Kyv+TljLiYBH?=
 =?us-ascii?Q?/uM7jPCFNtXWLg2KMReOYNHrL9ed9APAhURY9gG6unxW39nXZxwZE4QU6i+Y?=
 =?us-ascii?Q?er9AKgTbezh4315mn3AB8ynLgVW76epw7Lm9nJjKWeW7C6/uzAIEAz4Roq7c?=
 =?us-ascii?Q?e47OBFALT7lrjZF4Ea12Uaj1o099iB7IyI7tEu+c/V3iKIeNMa9SUpda/VMj?=
 =?us-ascii?Q?KpYB7x8CzM3P0l01zqxUhdFDRHKJ/ANcLcHL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:11.5614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ef4b57-073b-4d34-24fc-08ddaca0ec5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726

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


