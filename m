Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A9A5459E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903236.1311183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73Q-0005I5-Aj; Thu, 06 Mar 2025 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903236.1311183; Thu, 06 Mar 2025 08:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73Q-0005GD-6J; Thu, 06 Mar 2025 08:58:08 +0000
Received: by outflank-mailman (input) for mailman id 903236;
 Thu, 06 Mar 2025 08:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6md-00031D-Hi
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2416::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b17abe18-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:45 +0100 (CET)
Received: from CH2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:610:4c::36)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:41 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::ec) by CH2PR10CA0026.outlook.office365.com
 (2603:10b6:610:4c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:39 -0600
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
X-Inumbo-ID: b17abe18-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUdLrgISklfZGltEqej33jG5BfMxsu4kE9VUvHqQ9DBezZ4OBfmCPzICDxZBELRjCCJnHTI2ozACUDeK5BnG8nHeXhrYpW039mW2HusTRZuVxBIqUS6JgHCXYPr46a5X+D9/L7A007UQAOXoxXXGbQ0AAqj2jcjS8ivrz/c9tIFybBP3vP5wYVBn8UDm1SxwfgB/kLaPPoKSh5UdJfGMpMYKLfea8+oCZD1TyneDA/EKPFJEmsnJxbvhJcXMRIJiSf+xjZDo7rdpE1Vi9cUmpV/r4/N1G3xQxF6YsqOdjLehIgf7L7lFTvqu3k1xJ7lX3d89q9+zAaANKPM9FmqK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWoURI9UoGDnQV3zAsQtajok02PmR6ELhXOEUkvQD6w=;
 b=XL8EQKmSUGurOQM+pHx6gA/l6Z7OvnrPyAMDg1Pa1x1ahMWq1x15QEyIy7sI4FJh76++pVv04JNFCe7OOKzQVEG07BBZ1EwSyb2stK3VrS7Z/VZGLQWjJ1ocxokz+IGgE57ymH3xwZQ5rNdO1ZYTve4bx+7dIz+8nvBfiaoT3F3WdO5MstTHVVhCYeCOqhGoMnnGW2EYflBGyvZ5w2wID3cWS5M3E2hz4unNu/F/IhF5VpDlrnvjNK7Hhl9TsgxAmch9SIKkMM6KRJSLHHjKhNYCE8rujo0H20SxRcTsR3ujkA4el+lX9m2XX4itz/ha5+YjfW+4i+MQjmuJHeRCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWoURI9UoGDnQV3zAsQtajok02PmR6ELhXOEUkvQD6w=;
 b=oQ2RrY6+ZnBDlZAazC81JGwmF7X23gKdXa8jEH9YW6fbK9FQMzUZNEctNKAirp/MVXTJPt6AVDBOKh1G+bkq5RjjH/5b9cBVVG/50n3zPM8z6YHSMIqQ+6NpkA2rZK0L5adYBPs6U8ZMjptxcBrzrVP2Xw3RbXVoOCOq9NFiWec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v3 10/15] xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
Date: Thu, 6 Mar 2025 16:39:44 +0800
Message-ID: <20250306083949.1503385-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BL3PR12MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d857b7f-ad88-440d-7a44-08dd5c8a93ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H5ILEu1lovzLACCN6Yvu1TwTuFE6vLTPFCElCrfnsZXmFkFWMIeEXwRiaIN8?=
 =?us-ascii?Q?o5+pXECjatIilO7k0crVrcMpqIV9YXhWHmTsEYS6sfh8jfEBFvJ9NSorsYod?=
 =?us-ascii?Q?cWE4lXmIbTPcAudz9S9z0jHBQmvNKhVCTQLTbjr3Fenui4/X8QeczrSGn4XJ?=
 =?us-ascii?Q?7WYxe6i8rnK5I/FvkXEb8KujRjFTb7y4mLMf6YNuqOftYg8hmSubI4tF3GwN?=
 =?us-ascii?Q?chi7APB10YWzS2XdSE5w+D+XMPRXzA2U09HcHk1vgQMJxMa7gSEa5y3PUq7D?=
 =?us-ascii?Q?Tz79zop8jH4BkSvAyDIahzbmB0t1f/l7+/utOwNYclO4ba2Z7VHyw/6TdcS8?=
 =?us-ascii?Q?BBvvwuMffgrG+pKxpHcQfe4YNBQg8uEAAfkl8+AIN9LobQaEmaoLs1gGlxp4?=
 =?us-ascii?Q?IUd0ya4XewFQAVgsltAjh1+8dtp3/4A89Szmx5blHp8Kyy+PAm9XwivzOz0F?=
 =?us-ascii?Q?JegGpwlQzcr5MkIibW5S4iSH0gvrYaRnNIlIVkIoPPSPE1TuolHBrRK3LdaQ?=
 =?us-ascii?Q?LRPuG8vSSiIrG8i+cO19nH5MsPXbEg0tByaY1dmFf7TYvoFjkqEVta87dS7X?=
 =?us-ascii?Q?bIJXb1CnPNZ+Tl7UxoZhWOKSZepr5ekKIi4cEqo/K5sT4SnwuSrH+Q+zeSb0?=
 =?us-ascii?Q?qSFVe08ELvl2ZDfBSJSCauoPbihEbZQek1XRxrYFLJmKqhVoiAMzGr7qBpfn?=
 =?us-ascii?Q?BlnySxDttNdjE7+ri2qtYZSGt31MKkJgee7dOU8kAC+gAbF/Lhyj5leJSnIj?=
 =?us-ascii?Q?l3NPR9Z10SJzROd0Nb/Do6ZfTPQh7RQflXuQFaz5WzwBbzgGNyIRdvp1o4YM?=
 =?us-ascii?Q?AdT/B701Mar4yDimtmzWhpYgJgImz9l/HeTPG/1ZiA8OCLBv6RHvRTgxv16t?=
 =?us-ascii?Q?xbHzlCcuJFdf+peAagzr3kd9tuDefsNiRZYsygYOrwVjL7rUMQuTAFcP0xTn?=
 =?us-ascii?Q?YWHD97QCV0D0pbiVIx9BbnLd1eK0+5SDV5NsETNtWdcSs06l83hi5otzc1/P?=
 =?us-ascii?Q?NA6ttOQUrfqa4QZOKg/WRh3kxuj5LWhqN48Rc6PsuY9uot5wP2yuWKpYjneK?=
 =?us-ascii?Q?/COg5YxDV9HPl8wNI7w3gmGygZsErtEEGrC0EGxyQH2jd1Va4pJt+CP13tnS?=
 =?us-ascii?Q?/WgfOMDeG2gFkmWqUOt6D2cVszHDb5PHpY1vFxe7DYjmmKYhk128IYJIrpWX?=
 =?us-ascii?Q?FZt2AoHNP9D1hsjVONdFmi3Hng4g1hrHram+kamyT8nXzg74ibTSAcv5Qg8W?=
 =?us-ascii?Q?X5uIRncQFyl3Rr76j8Y4o8imm2Ag5kxE0xMOUMA0/PH6SPinwL5AE37WmrT1?=
 =?us-ascii?Q?K0jd91vrssn9Mo1WNJw85u9Z4akRG8AEjS55ZiPoB+jVAtAQo9976Nyymxzj?=
 =?us-ascii?Q?gbBgtrpoRYvJ8SD9MyoeV5aByWzGZTslA/Mvjli1gtyqzj82vXRGnkS/BoLM?=
 =?us-ascii?Q?3Zw0Xn8bhl1pLvGXfBgpMB2JUpegY1omr1lLXeqkUPQZ0O/apThIruIdMR4U?=
 =?us-ascii?Q?bEToRPENh4aIMbY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:41.3776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d857b7f-ad88-440d-7a44-08dd5c8a93ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522

From: Penny Zheng <penny.zheng@amd.com>

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
 xen/drivers/cpufreq/cpufreq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 792e4dc02c..8fc6e527c2 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -353,7 +353,13 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
                    pmpt->domain_info.num_processors)) {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        policy->governor = NULL;
+
+       /*
+        * Only when cpufreq_driver.setpolicy == NULL, we need to deliberately
+        * set old gov as NULL to trigger the according gov starting.
+        */
+       if ( cpufreq_driver.setpolicy == NULL )
+            policy->governor = NULL;
 
         cpufreq_cmdline_common_para(&new_policy);
 
-- 
2.34.1


