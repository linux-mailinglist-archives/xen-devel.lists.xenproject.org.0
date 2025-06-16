Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC6ADB318
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017302.1394282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAVx-0001xZ-Ar; Mon, 16 Jun 2025 14:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017302.1394282; Mon, 16 Jun 2025 14:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAVx-0001w9-7A; Mon, 16 Jun 2025 14:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1017302;
 Mon, 16 Jun 2025 14:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRAVv-0001vy-Hz
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:08:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2009::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ad1300-4abb-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 16:08:38 +0200 (CEST)
Received: from PH8PR20CA0024.namprd20.prod.outlook.com (2603:10b6:510:23c::19)
 by PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:08:34 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::b2) by PH8PR20CA0024.outlook.office365.com
 (2603:10b6:510:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Mon,
 16 Jun 2025 14:08:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 14:08:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:08:31 -0500
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
X-Inumbo-ID: 65ad1300-4abb-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRDRNRCauDvkq6+OXulVGwJH49CVfemlb7qLFkvJzw2sMzPjq1B2N+Hz3qIq4wcZNfYdli3Suov+Qs464G9TvImBt4ZTU8R+TqJGR/r2pqKLMzK5FwBkmQdi5TCYd+q8eS5yA27bLpQYQ3RVnfzHJkfhMF5rr6lLPYB3LU0wjKmG73PnNnjPPswaLLOK8NAIZU1qazzqzmiqr037VULMN6IpiiPcHsV63km2rSNGcM6iv9uRlKroc9LPoYNs6/M6U3hNSc6EsoxS1mv13YQ6UHI+PXG1FqAVgJEVCk3XCjRxJx9A/8l4XaAND5N+uS03jPLC6E7I3Zwed0toFuWg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3fZjslBWIdPOqFP7dv90TaPfz4WBFA3AvqZfXgklTQ=;
 b=PLMUUi6lakIHf3FrDcNM+nOHq+og4KvQhkf/D+pHgQsrUJoh60pR/ouCJtbi1P06B1AzrZUKca2dNT50kPsFDocqAqmRQiMj9JCiZ6q7tKpFIyKkbXkcH8cNJUhC1+6voeYxoyXtxq5+QlXHZTdlDN4CvwL4kJhmCfR+jvCr65KbhWTB7viejZTpVfFV8Ivf1NhF6PQiIHa3uTJJT7MZKRxceOBx6p8qxq0dT0m/sbecB0CdiAzyDWsBtL6encKA6C2xcM2ZK93cpg5JAA6lCq9ur7Ct1Rs3egjtN8rqqZ/wnYcVLi9YRNlTCoJ9JSmdxUtIoyMM2EzVV6TajQZ55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3fZjslBWIdPOqFP7dv90TaPfz4WBFA3AvqZfXgklTQ=;
 b=KvcR1XVQvtK1L8rRdzAfSSoKzPwMPfZCrOQxDhrD75gJzZkhdAmXxlUuj7E7xyL4jHk92FBmUxngE8H3YTr8ADAW6dAiAZ5OaFbeeUit+mT0Tl2jBuNbhX6liZ6wefOmHd/QY/CvyKkesa0XCRCm98eI78etpCX6LkDJU/lkSCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 16:08:29 +0200
Message-ID: <DAO0M5RC6G0Y.32PK3XMHXB623@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v3 13/14] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include
 device-tree/
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-14-agarciav@amd.com>
 <c6524b35-6454-450c-a521-bf2d617d9ab6@suse.com>
In-Reply-To: <c6524b35-6454-450c-a521-bf2d617d9ab6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 0135fc72-b45f-4596-154b-08ddacdf47bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHZYb2N2Z2o4U0E5ajh6MnkzYitiYlVlSXdEQXBwcVVBVE9XT0tsS1N2cHFz?=
 =?utf-8?B?TU9FVnhZL0k1TE5kd2xEajBRWDBycFJYWlVlRjJuTVNDVmxXVmQ2d3J3VVQ3?=
 =?utf-8?B?QlUyN3hBMHFhQ2dvZEI5eTY4VXRVMDUxZFl2aVM1a0N6OWpXT0w4bXpLRXFK?=
 =?utf-8?B?dkxCK0xrYVQ2NzNqTFB1SnZKVFAvb1BkZVBUaUJkV01wQWtEazdSN1lyMHJ5?=
 =?utf-8?B?Z1NBeUJTUXA5dVFVWEhQNjN1TDdhUGlYRVNRUDE4ZFdHek9NNERxVUYyRmps?=
 =?utf-8?B?ekJxUVF4aFlKTWxxM1l1SHU5UGhPcG1Ha2JoSDFXT0NBUU5vTlI0ZFBCeC9v?=
 =?utf-8?B?VExGTTBseGJKL1ZCOVp4N050RVdFNzgyZ3NML2xmZGtiR1h5SUczL3ljK1g4?=
 =?utf-8?B?ZkRxb0xVNVN3Q2V3SXFKNy9iRjY0aEkrS2R0RHZRSVpEZ1k2U0k3dzBxQUk4?=
 =?utf-8?B?N0N0bU9xakVaOHBWT00vK1ZGb28weVNYdGpndkdEdlhObVlXZDVjODNyOWYr?=
 =?utf-8?B?MnFZd0djN1dkVlpSUEppSEVUMU5jTzZ4VzJOT2FLaC9wWlZBVWpTS0ZMZEg0?=
 =?utf-8?B?NE85bm5VOWJld3NMdEplZy85QUVpWlBBN2Q4QUd3b0pxSmh2QkVtdmN6N2F5?=
 =?utf-8?B?TGhtRDdSQk9pNVRuOS96ZzNKRnJmR0lRcU1qcUFmdHFmTThiY3RXQTJ3Mm9T?=
 =?utf-8?B?VG0vR1Z0KzFzZFZwNUs5RTNteHBzZVR6aGNIRkJNYWxXNXdELzY1cXNhTHZi?=
 =?utf-8?B?dmVHZlhjYzNSbzJ6NW51SGg3azRoZ0Jzb0E2SDVJdmdudUoyRXlHcU1FcW5h?=
 =?utf-8?B?YnNleGtZVzlHUU9XdE9jOGx0ZXNaSmYvek5ucjVSY3ZSajlDT3k3YnEveUNz?=
 =?utf-8?B?eEU4RjVXeStDcXo3YnR3SVFRVkZPNkhiekFmb0grUEx0UFNsMjJNNmZzRmU5?=
 =?utf-8?B?UjVUajBQZ3Q0TmxlZTVSWVd3K212ckk2ZUNzTUorcURRcCtuMktiMGpXbUFK?=
 =?utf-8?B?NTFxZlo1Sjk2N1dlaW1XNkFFbmovdWRTQXVVTjRBMmZjN0tYbzZITFNSVFR6?=
 =?utf-8?B?VzQyOGplK2Ftdnh3VXhYY1RwSkJROXlOZE40ZkFmakZQY2tjM3ZDQ29oZkFH?=
 =?utf-8?B?d21ldDVzM2xwdnc3Vk5LNUs5TjV2alZXdXY4eVV2ajRHUzRlYy84LzVCbmZB?=
 =?utf-8?B?UzRnV1AyUnYycmpadi9DUWZZVjRlV1gxT295d2N1YUk2SlZFcjJES1JnM1hJ?=
 =?utf-8?B?U0xmYncwVjZla0h6N2pjUTRYUURNdjQ5djNlNzMxVFB1NldzWjYveUYzL0RK?=
 =?utf-8?B?UDFYOFJCN0llUjJzWGhrcGZDNk1zTmFjaFBtOVNXSy9jWXpiSWN2alhRdTBo?=
 =?utf-8?B?L2YvMm1BdWlyejRCMUFWelRXRkVQMTFHRE5lZHdSME9rUzdLYlBiaXdSVjJO?=
 =?utf-8?B?dmJ3YnI1U3luOUgrSjFHVG5PZ05OZnJxbERPKzA3TmV1Zm02WXVKSmtnUVpL?=
 =?utf-8?B?alFNKzhENzE1VjQ3WE9mUDdDMCs3M093RTZFMUdNL2Nvb0ZYOURwVm5idjB3?=
 =?utf-8?B?L2dBREwyL0dQTml0bmFIWEtVeldaNGJCZmJqL1V1OUJwNy9IS2UwOHIwS1cv?=
 =?utf-8?B?dzRnSld3cjR4SjRZVlVBOE5Td3U0Wjl4UzdEREFkNnFEaEkvZGNYdFQyZ05o?=
 =?utf-8?B?QU9IR0xDdnBGaEY5SmpGUWx3YzhUWUJrZXlyalZxRnB0NDVxTEtrV1I2Wmd2?=
 =?utf-8?B?U2hBZ0txaXN2WUJoeHkrY0RITUtOUnEwVkdUOWF2N1hmanRmNUVLcXd4WlQw?=
 =?utf-8?B?OXIxN2Y5dWZsM1dhMm1HT1ZHazZhdmNaVUpsZFlhS09qQXdhZ1IvcXdTR01q?=
 =?utf-8?B?dHdFaVZSeWxQdmdwQmNoa0gzakpKcGd5TUdpRjU4V3EwWENQQ2YxUzRtWUZq?=
 =?utf-8?B?LytQZ1dpcWREbWNuaWJIR3dxOEdGL0Y1bnplMDlSR2s1M2VQVVdPY2h2cDF0?=
 =?utf-8?B?OXZvbHpzRlVkb0JFU1BaM0FHTHQ3c2JLd2pqakM3WHNPaW9WVzA0cTR5dDlj?=
 =?utf-8?Q?3OWlV1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:08:33.6554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0135fc72-b45f-4596-154b-08ddacdf47bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

On Mon Jun 16, 2025 at 8:55 AM CEST, Jan Beulich wrote:
> On 13.06.2025 17:13, Alejandro Vallejo wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -14,6 +14,7 @@ config CORE_PARKING
>> =20
>>  config DOM0LESS_BOOT
>>  	bool "Dom0less boot support" if EXPERT
>> +	select LIBFDT
>>  	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>>  	default y
>>  	help
>
> Nit: Imo it is good practice to have the select-s after the "depends on",
> and perhaps also after any default(s).
>
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -8,7 +8,7 @@ obj-y +=3D cpu.o
>>  obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
>>  obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
>>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D device.o
>> -obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
>> +obj-$(firstword $(CONFIG_HAS_DEVICE_TREE) $(CONFIG_DOM0LESS_BOOT)) +=3D=
 device-tree/
>
> Why not
>
> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
> obj-$(CONFIG_DOM0LESS_BOOT) +=3D device-tree/
>
> as we have it in a few similar situations?

Because I wasn't sure the build system would swallow it. If you claim it do=
es, sure.
I think the "firstword" version is clearer, but I don't mind.

>
> And why would the duplication be needed in the first place? Shouldn't
> DOM0LESS_BOOT imply HAS_DEVICE_TREE? Sadly the description once again
> only says what is intended, but not why. And the dependency is actually
> visible in patch context above, in the hunk altering xen/common/Kconfig.
>
> Jan

After this series the idea is that CONFIG_HAS_DEVICE_TREE means a platform
in which platform resources (memory, devices, etc) are described on DTs.

While x86 ends up understanding DTs to the extent that it's able to parse
and extract "xen,domain" nodes, it's not capable of much more than that. Th=
e
distinction is important because making x86 understand general DT (devices,=
 IRQs
and memory) would be far too invasive and not very helpful.

I can rename it to CONFIG_HAS_PLATFORM_DT or CONFIG_HAS_DT_DEVICES, or anyt=
hing
else if you (or anyone else) have any ideas.

TL;DR: It's to still be able to compile-out the bits x86 cannot use in the =
DT
machinery.

Cheers,
Alejandro

