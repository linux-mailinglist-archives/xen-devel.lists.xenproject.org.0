Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DEB11869
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057238.1425203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnh-0006wC-FA; Fri, 25 Jul 2025 06:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057238.1425203; Fri, 25 Jul 2025 06:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnh-0006sZ-B5; Fri, 25 Jul 2025 06:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1057238;
 Fri, 25 Jul 2025 06:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBjD-0007jJ-SF
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e157f41b-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:21 +0200 (CEST)
Received: from MW4PR04CA0070.namprd04.prod.outlook.com (2603:10b6:303:6b::15)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:16 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::60) by MW4PR04CA0070.outlook.office365.com
 (2603:10b6:303:6b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:16:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:12 -0500
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
X-Inumbo-ID: e157f41b-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/inWyrvDTqw2wjQrY+011EKmj9W/4nIDuv9CBRO4E2/+hp5ZDuIHAlctwVvktLOXZY9hM1FXKcORkKCnI0hFH2nnoNMiK9Mg9TW3XxlmvG+dsQY7InZ5z0fN8W6pcBtdbincczLUIRRIxGWFLXfQENBea2s/w2WzVR2oZdgKxcA2TCwDe6ZDJFt7ddbQdsF4JfRi9IgrpgL2nfAg9Ij3/NrXmwyDOlW6xF0zr0CpswGiJBf1R8uSthPSaf1bqAZIM/NpaGbIh16efeC0wlIowR1m8yMKl81zitn/2si8kNZr7cUPkLDV4SiTTO/YHLyF2A5zG5/vimEsUrwWvvQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TL2qoxruEqT6O3jCVVSBwjF4BhlpagaCPV+ejCwsrk=;
 b=NXatpqlkyAPwvNnM1DVUDsIxJYETvpuzE3Ne4xEcIOwcHzlthrt+tGQhrLru4BmgRgCCknXew7RyRMxle/e0DVFmQWT7xFFwVkn5/HzkP331DZj4QhPZs9S6eRsP+dOsxC2UBZr2BwSt2OI5GLm/yeMXoL8VUrRYV7y2nedeUrxbbTcOeLgh7m+0HIpPfPi0vQDvjVWGcFDagAXE9goU3WKz26vU54SPGal22xDXblhNsgY5BsK0sogjc+eZiprzW1tvcYjluVzw2qz6/y06TBJRXF4CRtTT0fqmUe1I2gpfsKsOJ4yQjrCJI2AIDVZrnjgbjLUoVkbB4KqcQAbVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TL2qoxruEqT6O3jCVVSBwjF4BhlpagaCPV+ejCwsrk=;
 b=rx0G3uQF3r5bzcHe/8Ya2kKHhpUPd7nUlkTjiWjdBXIqZyFZ6OBRE3lwxmMTmE3m+dFvOEXtgahrKsjhiXGuRcHRQIlGkrmw6gFLV9AyKFStgEMhx/p7eIbHEKE2gZDYdTRIMK+jMB1QqTBjsftt5M4jgV3IddLJbuFbK+CfXsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 10/11] xen/platform_op: Wrap around XENPF_core_parking
Date: Fri, 25 Jul 2025 14:15:29 +0800
Message-ID: <20250725061530.309953-11-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 2414e34f-cb77-4f51-62c4-08ddcb42c37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFJ1M2YwM0JWc1VWREVxRE51cWdMUnF1Y3hwbk5RM3c5UE01YWU0ckdEN1ph?=
 =?utf-8?B?ZllDcmZNUHFBS1RGZDd2bDg2M1Baa3RGeTZibkRSVjNnV2V6aGJBY2R1b3Nw?=
 =?utf-8?B?SkxUSGVZa3BKeXBKUDd5aXpxTnMySDNaNHBlRWxVQ0lzSFUwbm54bGlod3c5?=
 =?utf-8?B?bWs4V2F1Vit2RWJRZjBONGMzS0pZNDREV0k5WTlhQlgrUHpGTFhqNzYyT2Vm?=
 =?utf-8?B?cGQyVXBsTGhDakFvcVlhRVhKazEvZlJtbHh6TGd3UG9TcThMU1RCVTFjNytL?=
 =?utf-8?B?RmhXZGFlZFd2ZVZZNmFUeXYyaGxHUS9FRGNRVTVrazZSLzBJRDNleDltSGg5?=
 =?utf-8?B?eUpjQWk1Tjc0MnVsRGl5c2FyWCttZGdsdHhQNmtSclpZQUN5ZHAxbnRUeTRv?=
 =?utf-8?B?NUxKZ3kydkEzVEc0bDhadEtHcXlpbGRKMmVVR1RzZEJSRE1KdnlyLzZ3b2xv?=
 =?utf-8?B?SE5QSzdDL2tuYWFxWURXdmJUK1RvNWpFU2NWbkVScEVQTW5PZlJBYjJ1akFT?=
 =?utf-8?B?dkRNTVNOUkVKbUN0UkxJTThnMWNYOFI1UEMvYTlmc1RkTndvZjZ5dWdxMlU3?=
 =?utf-8?B?a2owdDRZUmg3RmZRazhhK2t1RnloTHNTRCtlaXZIL1dGbnRab1ZIc0FDa0ZX?=
 =?utf-8?B?K2poL0l5bFZLbFlNOFh1RlRPVGM0cDVQK3VqdC9yZWV0SkZHc2pLZ0pjMk9B?=
 =?utf-8?B?QUdiZTZQcWwyVFAyT3RuaXBuQk42VWphZGhTNlJJZ2R3Zm93T1dyUGJaM3FY?=
 =?utf-8?B?Q2lDRDUrcWw1T3pXcG4rdlphWXk3UnRwcVp0WC9ObzdhOVBRK3JndG82Ti9q?=
 =?utf-8?B?RVpFSEhnS1Y4MjFOSFl1MVNpSW92SDk4NmhHcG1zamluYlZ6Z3psOStqUGhQ?=
 =?utf-8?B?WXlkcGNwOStJSXRLcy9hcGJKenFtNTF2ajd5ZHdnVE1pRTlTNjFTcTFVOW9V?=
 =?utf-8?B?aVhuaDhKZTJWMTRpL3hmUHNSWXM2ckpyVnozRE0ydGlWQWpNcjhxbXhmMlRx?=
 =?utf-8?B?VUlzQzZTeFdKaFNoRVZuNElpSzU4VmF6TnlpSldNUEhKTE1FR1I1Ym93MW1O?=
 =?utf-8?B?dUJ4b1Y4TURkV1R6MmJaRExTbE1taDNCQzZ2WFRoSkVkUlk2NUNub2dIdVNa?=
 =?utf-8?B?NmpHblBLOWtyNk4rRFJ0V2l1YWFYRDAvS0dTdllJOGRYWnJBRGkwU01MbUxi?=
 =?utf-8?B?ZGRDVis3ZmFyTHJVNm9hZWJUd3IvUTRrK0xveUN5cjBaU0dqVVltT0JhL0FE?=
 =?utf-8?B?cTFyOEFvSmlDT3VmZnRlV2Z1aXRSTENIemJsTkEwb0Y0QWh6clVxRVBhV1g0?=
 =?utf-8?B?ZmswSTdhNXRuV0t0NzF2aHdWckdBTnhXWVI5UDZpc0xrMjQ0aXF2OWtmZU0z?=
 =?utf-8?B?QjhIQXkzQ3lzZXdjUitDMTZ4TktzODhGSm81bkxDZ0pTVmU4ZStXOHlCV25z?=
 =?utf-8?B?cnowZjJXeTZGbi85YVFkaDZRUG8va0NZeTRRMnJkbWJ1MTlabHB0Smo0RW1q?=
 =?utf-8?B?Y3RubDJva3N2cWE5NDEwM2NrV0ZUbVdFSEUrLzVCMTM3WmtuSGtiNklLb3J4?=
 =?utf-8?B?VHBMZ0kzdDI2WFEvK29keUdISGgzc0QwNkM0bk9sbER1cGxaY3ZPUWtURm1N?=
 =?utf-8?B?THQ0R1BHWVdBYTNtSkxxdVQ4V0hidWtSMWN5MURVc2djZmpUQ0Q5bTlzQzdq?=
 =?utf-8?B?cUw3dEJDL1R2eVpESWhtRFVGRU5KMlB0REdaZ0VpcHZVanJwVy9JbTZYd0hP?=
 =?utf-8?B?QkhLRHNzclp1UTNjS1RhaFJKMWNXeUs5d25lSzVhRVd2ZUZWZklEaXhyWmJD?=
 =?utf-8?B?QTFKNmF2YXNraFZlTlFCZ0dMSUNvdkZ1S0hMN3h2dlA0aEVGMjUvRG9EdktP?=
 =?utf-8?B?TXp5V3pJdlNJYmg5RWNtUGQ2cjlKSjZTb1VLQ25OMHRENmpIRTk0Y21qSjR2?=
 =?utf-8?B?QjdMa2xBc0RWUFZGRzQwaTl4c3VPenFjZlhGWld6RC9ycUVpSURpSGlwYW92?=
 =?utf-8?B?cSt2T0hOU2x2NEtZelhHV0tYYzAwcHRMeUR4RWdTV1lyWk1vTk92bmpOWllv?=
 =?utf-8?Q?5hiUUj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:16.3124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2414e34f-cb77-4f51-62c4-08ddcb42c37c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685

core_parking_helper() and get_cur_idle_nums() are only used for
XENPF_core_parking, so wrap them.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/core_parking.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index 7d6a18cdcf4c..2b763f83da93 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -170,6 +170,7 @@ static unsigned int cf_check core_parking_power(unsigned int event)
     return cpu;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 long cf_check core_parking_helper(void *data)
 {
     uint32_t idle_nums = (unsigned long)data;
@@ -213,6 +214,7 @@ long cf_check core_parking_helper(void *data)
 
     return ret;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 bool core_parking_remove(unsigned int cpu)
 {
@@ -237,10 +239,12 @@ bool core_parking_remove(unsigned int cpu)
     return found;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 uint32_t get_cur_idle_nums(void)
 {
     return cur_idle_nums;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static const struct cp_policy __initconst_cf_clobber power_first = {
     .name = "power",
-- 
2.34.1


