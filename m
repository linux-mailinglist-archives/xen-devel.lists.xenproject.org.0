Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1509D7C18
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 08:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842330.1257715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFTiX-0002rg-LJ; Mon, 25 Nov 2024 07:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842330.1257715; Mon, 25 Nov 2024 07:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFTiX-0002p8-IH; Mon, 25 Nov 2024 07:41:09 +0000
Received: by outflank-mailman (input) for mailman id 842330;
 Mon, 25 Nov 2024 07:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Axd7=SU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tFTiW-0002p2-7n
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 07:41:08 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f403:2407::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d187ba5-ab00-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 08:41:00 +0100 (CET)
Received: from SN7PR04CA0199.namprd04.prod.outlook.com (2603:10b6:806:126::24)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 07:40:56 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::6e) by SN7PR04CA0199.outlook.office365.com
 (2603:10b6:806:126::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend
 Transport; Mon, 25 Nov 2024 07:40:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Mon, 25 Nov 2024 07:40:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 01:40:55 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 01:40:54 -0600
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
X-Inumbo-ID: 9d187ba5-ab00-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNzo6NjIzIiwiaGVsbyI6Ik5BTTAyLUJOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjlkMTg3YmE1LWFiMDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTIwNDYwLjYyODI3NCwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1Ee0LPAoHkffC/nRmTwrwvtHVhOItZim05Tvb+zgHinE5fWSZWEEagrglx3Wo/dckeZNMFMA5jMD/OxDROi3OJooDjyGzOHiOsEoiMdZwItQi5TwFziK3GZZESiBzDd0Yc0azNT20hjHIL6KSE81ZOWg3K0b/GMShnxARsoTnGuZSH5VQkDXhzsocSF9SwQ0jlDe9tL0PUSntBslzmAhcimnoBW6OY/zU5qlAaAUYmtsDxTq1Lu0Mpt2Hlux2hIEzfO9aNep65/rZWF1bLO7DuHEyYAiQmy6NzhYXGNmppGKME7HL5O1FCRJu3Ck4/6WabF1/CnX/U/+uVvGRDb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGI4QZ3NnjGlHsrU14t9hERHIiYS15v85k5p7oHJtO8=;
 b=wMo6hpZ7IRyKwZZGlHOPlT2wNfkk/txmvSZuklDsOsj7FwBCnFqKAk9G3ikb+KrPA3FPbk96yyrUndGpoYAEHTLtDQAJJ6jw1snklyrLgS1rv4XmvOYj9HnMN4+An7Bz8K+oCT8voJGZFWeCP9s7OIziv4h2EgiZcnoOGB/sevfMACx1FGpwxkEn00wLe82/Bi0h7gzrur2AuwLjPL9H2UBV+KT7Oj03NWR8fhNbuLTWz7FtJPOaZFTU1LlhvS9x5Qgr3epp0T+jlx39vlCrs2y7nt/lpePyM6vqFO03lddRvGXYVe6kJYTYNQYU8NgkDiJ+yIYETgOxEUtGQ4T99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGI4QZ3NnjGlHsrU14t9hERHIiYS15v85k5p7oHJtO8=;
 b=AFywZe+/06S6sj7+TCOUnb85WH1kxkchBGy6MVWeMCzvevdted7qJz1rk1B9l9/xTR8XtLOAop7JdIglmbA04j4rAak7R572aoJKYSn00vTfOzfSCw/TRgJJAyQrBxVfzZL9PSKnTRlM/a6CrnjHQHBiNgeS5EDGRSPzQk6jKL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03620cbe-a251-46f1-8d48-2ea04b3ed3fa@amd.com>
Date: Mon, 25 Nov 2024 08:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/common: Move gic_dt_preinit() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ac9508-444a-42e9-bfb7-08dd0d247f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3JOOEd3Yit1Qzl4bkJqSi9vdlVkbG5yMkNLUU1PdFphM1ErZmN0Q0Zublhj?=
 =?utf-8?B?d0NWZk5GQkN0MlVDTmcrQ0dNbk9qMWttMUtvMUtjVW5aUEhyZnNJbzdLRVp1?=
 =?utf-8?B?aVNkTjU3Z2ZURFFxYlM4MnNtRjgvWHlsQmpjTktoSGlINmJ5dm1DRFhXRm1h?=
 =?utf-8?B?clRzVTZzeXFBTlE2SW5xOEhtd2phVWlWZjNsYzY5UXRXWTR3YUNUeHhnaXRJ?=
 =?utf-8?B?N292YlpoZzBBVFVxSExhaFNINzFHZjRyT1l1bU91dUYzbHR6ZUwrV0R0VTFF?=
 =?utf-8?B?SUpFZWl5dWFNTXFoM1ljN0tTZEhRQi9uTjUxTzZnSWp0cFBQRjRKSk5CYnR3?=
 =?utf-8?B?Y05QdUVaKzZPQ25lOTllaUdKUkk2bHNOSW40SGNVTTZXb0E4ajR6RlFZNW9L?=
 =?utf-8?B?dmVMNHlFY0d0b2pRUVVBbE9qRDFCeE9CUlcxbnk4Z0VwRGZsVUVNdVR4ZHdO?=
 =?utf-8?B?RGZGMUdUN0w1cjhHOHBRMnJrVXIzWGpmS2ZXZDNDQUVVM2t3aG8wSU1RMU5D?=
 =?utf-8?B?aTZtOXVYYWVmTkkrSW1tN1hFZ3IyZDRYUGdkL0tDRzRDWlZheXJMZmMrMS9p?=
 =?utf-8?B?VUkwWjhDc2VRMlY1OWVXQUZWOFpIR3ZNRGYrdm40NWx5S0NhMStRTDVSVWJo?=
 =?utf-8?B?aW9yM05xVWkyMlVvRFUxa0pJdUR5dkJvQ1pucS90NFBZbERWVE5WWWVRYXJ3?=
 =?utf-8?B?T2FVeU1aaXByRjJKQmlGUTQwQmIzZUd4TzJtOG5DbnlQNmhVOG5UZW92YTF2?=
 =?utf-8?B?Wko5N2N5NzdrUEcwWVJIU3hLcEp3YUN3YitTcXJkV0N5a0lGanpCeUFNZ3NS?=
 =?utf-8?B?Y2RUY0VEZ0Q3L2p3NGRtdHRXQ1VLMnhjUGZXay9TN0V4SlorL1dNUkxIZXdU?=
 =?utf-8?B?UkU0ZWZiM28rT3NlSFdFa2JxbWlManVId1NkZ0JFNmhITG9FMEFzMTRhT012?=
 =?utf-8?B?SUN2VVorcHRrVVYrTTRPQnNNWk85WVpxRkdRU21CZzZ0YlZCQTdhS2Y0bjR3?=
 =?utf-8?B?cjFoS09HVjFCSzJzSGcxNllaQ2lZVmEwWDVjN3oyZWR5SjgwK1JqYUdxcnB2?=
 =?utf-8?B?ZWh1UHJoTzg1cUlmNzV6UWt0RGpmTzlqcmtlaXl1aG9TYnhiYWJ2WWRVbElV?=
 =?utf-8?B?Sm9JRHBtKytUZ0krMm5DNEtBRVkrV2djODhPQllobEI4Z1lKeU55YVZ2UkRj?=
 =?utf-8?B?S0p4TlFLL0k1Q2NyZWtxRXc2SmtZRlNRay93RU1lSlRmTHhqT05jTlplRUkw?=
 =?utf-8?B?ZVJLajd0REdoYVpqei8wcXdiSytnSk1lVGt6Wk1mTDgraDd0WE45amttbTVq?=
 =?utf-8?B?a1pRdEcxVmFpQ0FVOWhZVHAxVTVlUXpucFJUWExsK2VlNXRFc0FXVkZsa0pH?=
 =?utf-8?B?aTE2L0w1amNGbjJqQ3NFamY2Vno5RFc3VHduWU5jcFhCTTc3M3pVbHZ0K2ND?=
 =?utf-8?B?cUV1ay83STJyb2pSYW5zSUxqT01hYm4vanhRUDNRSEJ0NGZZL0s4aWRYbGts?=
 =?utf-8?B?aTVRZTNrNXlPa00rek9GdEhBdHI0d0dBM2tMN0t1bkEyejVpa3hkcFNqamJ2?=
 =?utf-8?B?TWNaektLZ0tVMVBCZStqUkV6ZThRdlV3Wm40NVNyTThPUW43eTROU3o3RWtW?=
 =?utf-8?B?Vng4cG1XNG1oVTd4eW9yYldHTWc5R09RREs5Y2tEcHNONTBFNjdjK2RoWStl?=
 =?utf-8?B?ZWJYQUo1aUhYYkFtSUU1NHVUVmRWTkVDcmpKUUxxYWRNY1g2QkNycDMxRExj?=
 =?utf-8?B?ekxkT29scUg0OWV4REltYVFDcTNaZmxTRk8yS2JkcGhaV09SY212V3NxZzl6?=
 =?utf-8?B?Y1Q2czRXSmtrMVdnMXc4Nm5sMUR6bTdPOTBmLy9YMit6ZkhObjdmcE1zNVho?=
 =?utf-8?B?UXVWc0FoT0lhRTdzNTFIOVRpU2l5NnN1S1B0NnB2UHBVSElWalBVdFFYN09s?=
 =?utf-8?Q?38XOhOmV9kH1UI8NK/TxwjISJUv6lvG1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 07:40:56.1810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ac9508-444a-42e9-bfb7-08dd0d247f52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

NIT: In commit title s/common/device-tree/ but I wouldn't send a respin for that.

On 22/11/2024 16:19, Oleksii Kurochko wrote:
> 
> 
> Introduce intc_dt_preinit() in the common codebase, as it is not
> architecture-specific and can be reused by both PPC and RISC-V.
> This function identifies the node with the interrupt-controller property
> in the device tree and calls device_init() to handle architecture-specific
> initialization of the interrupt controller.
> 
> Make minor adjustments compared to the original ARM implementation of
> gic_dt_preinit():
>  - Remove the local rc variable in gic_dt_preinit() since it is only used once.
>  - Change the prefix from gic to intc to clarify that the function is not
>    specific to ARM’s GIC, making it suitable for other architectures as well.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


