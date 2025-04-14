Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6BA87926
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949125.1345823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERx-0002PZ-PF; Mon, 14 Apr 2025 07:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949125.1345823; Mon, 14 Apr 2025 07:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERx-0002Ki-Fg; Mon, 14 Apr 2025 07:41:49 +0000
Received: by outflank-mailman (input) for mailman id 949125;
 Mon, 14 Apr 2025 07:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERv-0008Gw-JH
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93c85b2-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:45 +0200 (CEST)
Received: from CH0P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::13)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:41 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::b) by CH0P221CA0031.outlook.office365.com
 (2603:10b6:610:11d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:39 -0500
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
X-Inumbo-ID: e93c85b2-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/t1RcNKfOlQuF2W8Tdsq6UDXxUGpxJBJDhC55ZMlpvpjk2/msHLHmXnAROWZ6yfzB+92zIxooEGTbKhmpB6yoe5lt/0ZQhDRJsXbzuc/PCUEXdsBctVC45LFDMZnC4QmkSOUap9aF42QQTg5qVBx1bKVPVF+hwGJizL8OwczJ6L2lgrC0EwluFr9wL6rCL3iKEyuuABKvYb4I7B8RXHbznzqZ6EdEgB5uoRdbDU82LK/eNbUKtxBz2e6xQ52l6TqVNHGLiH1mnXo0AN1LtgpJYyV8NaW2Syx+2Cq+CzmrR0yGMukr27So7RjycpRQhap4axI/zckl3yXeE+yb+OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYKj+c3hCaRMUyQyZHcVEmjkaY1O+Uy8Y1vxZ7yGoGc=;
 b=u8B8aY1FzgDL+Vi2ZfmXx/p/codOUEwnu4MXO2hxDRBqYJ8bbtMZ6pYLNYjED1hzX8Pbfe1bV595Ml27/12RZl35UWDG0w7GeURSC5W/Y1V1mo1CGazZGqdhN9blNlx+XFJz4dHUPdzriBsH2/BQ94ZyeQWmlnT89CyU/VGm+x0EDfRfFtk8i9ybJd24rxgN085OryXpTj5Fnsr8vHSDFw8y2m4cthszs/iqzzmizgUdF7Eb8GOim8iwK2V5LT/ZT52DVqnDumd0TOB/jEl4NtqzuFIkqeKXlKwfRBf8KV3Y7tzPxaTh9y0XDP1wImuqmcWiTLrl7K2NaXTnK6HF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYKj+c3hCaRMUyQyZHcVEmjkaY1O+Uy8Y1vxZ7yGoGc=;
 b=QXri2bFRbAaa+3Twn6ddTJdXv5zmlhapuOjFUlbV084Wpb6MVNuz8nG/gsrTVsWjdsdeqF6R0GN9sjLj8FnwssvTtsT3rtcEPWdQz8yb6aAHNHBVH1fqYs/0oV9WWLO3Do+rD6S8higeNkFUcnhtfbNddPA7TJLjANb4Zd0C3ZI=
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
Subject: [PATCH v4 10/15] xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
Date: Mon, 14 Apr 2025 15:40:51 +0800
Message-ID: <20250414074056.3696888-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d8c3be-2526-4df4-16f1-08dd7b27cc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QbsgT6Nu2EAlxjFoLJTubPZSMGKW2bsz0uyPrcKHSx8Q4ok8yxFmC8tBAkcX?=
 =?us-ascii?Q?Y34b2naTvoQbdK1LQRqSG0ne66fx1MIoYmn1YO6lydUkhtD7CRuC6l0oQVuZ?=
 =?us-ascii?Q?rTRsxHHrRu0PnXjKWmghKVhJFZM4pQn85s6X+vqfnQvs4Old4bVWKBgnElai?=
 =?us-ascii?Q?NGhSt9sYKkwL+TwFjt9C1nbKPZY0bLZ9w4/u8YGijyy3LaEEyhFdC6DgEg4o?=
 =?us-ascii?Q?3zvHqCVXhU8hzOHOdapKUCGEn2Pxp0aqJodl7Bz/aF/KwZ71XXLPXPIvoaVk?=
 =?us-ascii?Q?MguFI6AZcEgiV2gSSomqVZrNIyutEDSKavj1EpcnCzDeeP17b9FaORccYv3y?=
 =?us-ascii?Q?BrleMg0FWGH+N0PF1ZJDtOopqcU1mB5QtXl6SloumnWNHNwj7cVc8MuJqWFj?=
 =?us-ascii?Q?A6Fx71jqOBXVavhEfJyUIXQmU+oF4YKqv4dCaB7gwKvu80GcOEdtF43TyGOj?=
 =?us-ascii?Q?RFiRT/yix7W1BQ90hJPUqXWrqjoiD7e68Qco5RogpfVkkW/L/m0ATVaQ//8E?=
 =?us-ascii?Q?kvez22qdx8ksJERwKbPo7I9w/TNdoDDF8at8GM2bTxISkFmVh9ubn9G1BjJG?=
 =?us-ascii?Q?YXirhuoZZvwinY8qtIicBchgxxglKh87VX27K+cJeRn36gVblXjQ4luVu5PM?=
 =?us-ascii?Q?F8ab/a0gAjFirz7fK9DkFlBBpJvOh1QZUTdlnJOYzTNdZD7ACp5OUC40sOVd?=
 =?us-ascii?Q?QxQyd4ICfG/njHTr2Uso+65a2MwteZK3DC4swK9a3G5sX4pLfvGJOpQmCUuU?=
 =?us-ascii?Q?+nEwGJXTCCc8ZZUEXRE65XlBk75sVnSo8cIC/6RZRDX0tl4pjs08HmnqdgMW?=
 =?us-ascii?Q?DGKEXKHYW86yzc7oy7HKqzRxeiLSJaJ57jU2kKiMM+VNWgQSeNUCbD0MMLWL?=
 =?us-ascii?Q?mS4N7bHdn9goVSxcvnCvtehmxlcl1ETXy+lgKmm9P4yqfFU7hbHWuvKN4YvY?=
 =?us-ascii?Q?sZA4kQkc+kmC8ZHu8Mxc5no9HG/NPQCLZGZMosyXMawNLNiq5oMYqBsdpOkL?=
 =?us-ascii?Q?7JVLaN93krcWNcmH+BHmqwc2Zs4QWNZn8NhEK22GKq2JKED5XmoAv78STXGQ?=
 =?us-ascii?Q?XnxwVEQXZJKu3mwe4ZbO6sBHZ29LQxiDBxg8Z++21X0rtkf8EoQfVIRlLIun?=
 =?us-ascii?Q?7pk0fqOLhnXXI6bVwsvOJQAYyLNu3Y8SRjeKAynCwAYLlK9h5VY+42wuUGP8?=
 =?us-ascii?Q?u+nz81ITVHATFmvZPuUbEsli85bIAyOnrifgOl/tYk3wawcl02O6nEAmvAR1?=
 =?us-ascii?Q?I5jv9Yx6O7g+6ZAuTapeLSxipE71xTa08cEi+w0+JHYKezSXMlkhHicltbGy?=
 =?us-ascii?Q?5OpYjmYQuGZpmiswjTmhBUcAf6hkCEaXbE39XSLDXCtIq31o8Zh+BgoEcUgD?=
 =?us-ascii?Q?UD2RwE7BpruBwqTGHxq3fA/igJLgt4DqhJV+mIEy+doqrvJSiqEAy4PZIJ4J?=
 =?us-ascii?Q?f/1ap1zaXH5pIIzulGKxnSG+uU4GvM7a0efBiLoSX5XRoHVI0aKaBp+iCloT?=
 =?us-ascii?Q?ma58J0xeomZJYK3bniMpvjoomeCzrYjRVi80?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:41.3925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d8c3be-2526-4df4-16f1-08dd7b27cc18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471

amd-cppc on active mode bypasses the scaling governor layer, and
provides its own P-state selection algorithms in hardware. Consequently,
when it is used, the driver's -> setpolicy() callback is invoked
to register per-CPU utilization update callbacks, not the ->target()
callback.

So, only when cpufreq_driver.setpolicy is NULL, we need to deliberately
set old gov as NULL to trigger the according gov starting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
- fix indentation and this commit is independent of all earlier patches
---
 xen/drivers/cpufreq/cpufreq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 818668c99c..2e392110d8 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -396,7 +396,13 @@ int cpufreq_add_cpu(unsigned int cpu)
                     domain_info.num_processors) )
     {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        policy->governor = NULL;
+
+        /*
+         * Only when cpufreq_driver.setpolicy == NULL, we need to deliberately
+         * set old gov as NULL to trigger the according gov starting.
+         */
+        if ( cpufreq_driver.setpolicy == NULL )
+            policy->governor = NULL;
 
         cpufreq_cmdline_common_para(&new_policy);
 
-- 
2.34.1


