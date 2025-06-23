Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48175AE4269
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022335.1398117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTh4j-0006tQ-5p; Mon, 23 Jun 2025 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022335.1398117; Mon, 23 Jun 2025 13:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTh4j-0006ra-2H; Mon, 23 Jun 2025 13:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1022335;
 Mon, 23 Jun 2025 13:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjIQ=ZG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uTh4h-0006rU-WD
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:19:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2009::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a019fe53-5034-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:19:01 +0200 (CEST)
Received: from DS2PEPF00004564.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::51c) by SJ2PR12MB8064.namprd12.prod.outlook.com
 (2603:10b6:a03:4cc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 13:18:56 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:2c:400:0:1007:0:a) by DS2PEPF00004564.outlook.office365.com
 (2603:10b6:f:fc00::51c) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.4 via Frontend Transport; Mon,
 23 Jun 2025 13:18:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 13:18:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 08:18:53 -0500
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
X-Inumbo-ID: a019fe53-5034-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRFhouuOxxg9HrmTHYocf62CQmGsPzYtYkVm78SuG1HdLNnJR5Sw1/v6T3JQkHL0qEkoCdzCkMFU9mYGUo0arX+duKZBZsH43rjN0HnpHHIg4wKv2jKQuwcOJSuEr5PJJdUZL8nP2K2eEOBnhbdaQ8KiSGaMJL83yNC4Q2Gg4kpUgCILe3PdWuQcdkaG3+JXf6IXMC1As46G1tY5akqOVRH7bU3cLHdr9PA0bRj+ePUzhB7h8TAatem1ChPekduai+TksUcJTESaKgniewCNPTEa1SDk/B0HIVsJks/ox2FcGVGPDUMt9levgvSBSa+xxWq9GiP+2FXaely348yutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhZT9PUfZYV50C7KkICGq/MzwGt9MACt4eHQPw+CGfY=;
 b=t8myiLZI2OhHf/O0/HFLybg9ub+uzdNWftsPRExReoNOXywRm9OJwlS1l43He4/1Ch2yYWqoxXUOu8KGWOArpO3UHkfxd1kRDMx3olVyZBQWaM64czeS2z2sf/Wg14yQ0ndSolKofXQz0bBp3qF6M/AfmbVNKH5oMxFAw4OGhUJ6GcwKmdqqfbyrvGV5bEthGrbKz3Tz4jlwl4tdJLwD+q5yvNrLKfDBbWLSJDYwbEZQ/SkL0OxSz/hShzKDig81noY8gt1A/VGJ3EZzRxpIrYZW0VY7bKVTlQ3E7Lw+ercGtfMBhjC4HU+d+rCxzJ/thvOqWmedekjljObg+a+qIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhZT9PUfZYV50C7KkICGq/MzwGt9MACt4eHQPw+CGfY=;
 b=Rrv5Vn1vPmolr7RNgsDo14AWgLUMNExPiPPWu56qMY2QqXTc1qu9om+NTOBzl4fcvDvZPUzOFadTROptzyeQFmDVU/QTbtVFYurUVUYJweoBqJM5fq8FGltzGjRj9wyxW0p7k+izUsO18NLpZMeR0BOMiuQ735itnqShbgbR2II=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 15:18:52 +0200
Message-ID: <DATXXZ432HNT.36S8Y01SVXYJO@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 11/12] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-12-agarciav@amd.com>
 <faf255a2-a0d1-4c6b-ad94-0395d8af1e58@suse.com>
In-Reply-To: <faf255a2-a0d1-4c6b-ad94-0395d8af1e58@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ea0aa6-8e9f-487e-cae2-08ddb2588189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlY5MXpVWUpINm12R1RYVHh6SE9tNWpSNXZVMG1Xd2tWRnBWbnhmdHdOMUd0?=
 =?utf-8?B?TmtZbW1mNFd0TXhmZWZXSW9Nd09jVGFNcFl3eCtXUHBvUnRWcDRNZFNmZHBS?=
 =?utf-8?B?bVRWZm0wU0ZCN2RZY2Ura2pzTHl5M3ZLUUVxWElBeHFpKzJaY3RCM1NFL1Iw?=
 =?utf-8?B?cXY1VkpLdjVuNzdvQ3JQaSthUkJWUnJEMS9ORUpsOFFJS1RMV2RoZVhrS3h4?=
 =?utf-8?B?eUpKb2hIbU1hdy9PMXRMNGNFVVhrRFVFdGRHeWptZE1qQnZuRDFycGNHeUtO?=
 =?utf-8?B?MDZWOWRXRGRTVGFDd1V4M3JmSmF1RnBReFBhWGFBaGphb0NTZjNTbXRYSjRI?=
 =?utf-8?B?UkxwSkQxTDY5a2ZNTnhiblB1Zm1jWm1ibHc2TVIyYjJLaVhIcUY5L1Q4bURS?=
 =?utf-8?B?TENEUVVwMDNabTh4UjJiWE0wQUdKT2llajdDWGs4SkVMakRYb3BoeVhkM1R4?=
 =?utf-8?B?V3NaVW5JMnVqR0w5eVBYQUJkRGErcUtnVUcyMkhGdWNlc0Q5aDNmZzBJMlNP?=
 =?utf-8?B?VGx1eFRsTnU2eEZhTDVMUmhUL01NTXBpeWJNRi9kR3UxMHBTcEhCVG9FMU50?=
 =?utf-8?B?WnpqbkdidXJkTmNQNzNmK0t6YWs1U1p5ZVduWVp3U091cUNNNFhLMmFjc0tE?=
 =?utf-8?B?ZkVRQmNLaFI1RDcyVFRITzFrVWVnVTNhUGJKQVM1UzR4YXplbGh3eUxaWVd6?=
 =?utf-8?B?czdrUmxVS09oM2daMFgxbXhtdVdqSEpRbnAzSkNDeGw4NFBQMXZ0dTArTUEy?=
 =?utf-8?B?NXBJeFkvMmh0NDlqbmlPRkFZelp1SzkxV0Y3T081Ni9PNE10cU0veVZyZlB5?=
 =?utf-8?B?eDI4bjRQUmQ3dUFtU2ZIbTdTYjV1K1FENVVzU1l3dU5zR21Ca1BzcitIZzNh?=
 =?utf-8?B?dnRDWkI5WUUwZ3pEbkJtU2NCZkhHQ3ozd1R1QVpjMzl2ZHFpOXljMm1kbGRH?=
 =?utf-8?B?UVVHRGN5cW9nemVGWXlLZy91NDVTKzAyWUJHZmxRczhuaDY1UlY0STFVRWxG?=
 =?utf-8?B?OHpQY2RVbDR2b3Y3aDdHTlJOemRVcTN1Y2lUbHdnakNtL0dCOGJIN3BiOHhp?=
 =?utf-8?B?K3JERmhyWm0xZExTNGUrQnpaeTQ3WDZrdkpqc1gwRXRNTzU0cWc1NUFFLzRV?=
 =?utf-8?B?aEF3ekZ3OTllR3luSmdTbVpPL21URkthQzhlQXE3aDl5S0FhVUY2Y3hJVS8y?=
 =?utf-8?B?R3lhazBoM21DV05lZGRYUno1WHNQcDBPbTB1RW9oamdOYW5HSmNoSTJGNmlX?=
 =?utf-8?B?UGlJVE16bG9jVzdReG9YUHhvWHBnWjZvNUJWOGhOeXl2c2U3R1Q1bGk4Q3o0?=
 =?utf-8?B?RFNac2RTMGM4aWxLUk1JTTZUb2dBdnZMYmo4V2ZmZlV0YVdaalNYb2I2UGhT?=
 =?utf-8?B?Y1VEUGJNNnV0Y2JoOHFkL0lTYVg5dFFGaUZ4TVNrMWhlQWlyTk8wMGZqVlJp?=
 =?utf-8?B?ZlZ3azBCQ2NyM1FnWEt3NmFvRkVhc3RIY2poZTc3WVczZTRWbWQ4MlpNZm03?=
 =?utf-8?B?RXV0YnR1UVptZVJvaTNOWFo4OWhWWTJJZDg4MUViMFF4a29lZGFEdkJnSFNN?=
 =?utf-8?B?Z0FpNzVObU1zZDFsSjhoSkVCY1hDVTUzak8zUjVnLzltUHJMZXJDOXlPNEZs?=
 =?utf-8?B?N2RidElVbWV1UzJVeTRWbFJuN2JFWk1aOVgzcmduWG81bnc3OHNsd25ycWp3?=
 =?utf-8?B?WllXMjYzRjA3eVFQQ3hvYk1COXcxTDR4N09nb2w5WDFpNzBaOHZBeWR4MkJu?=
 =?utf-8?B?QTRjcjZkM21LTTVpL1M4SjIzS3d0eWM0Z1g1dmtjaHB0UjY5UDEzLzArVUVP?=
 =?utf-8?B?RGhRbGlHYXJIaFAxbm1wMWRFNzlkNUpTTUhMV3A1TzBER3Z6Qis1K2FiaG5G?=
 =?utf-8?B?Sk0yZGYwVW40a25rK1Rrb1RoMXhHOUpxcC9EQ3Q2UUJUMklGNjNqSk5hS2M1?=
 =?utf-8?B?ZFR2dlg0YVA1RDJaQkhnRm9wbVFYNkZFTGRORkYwODVsRlMxOTZCSXBoMkkx?=
 =?utf-8?B?Nk5OamhxY3VHejBESk9wMk54US9BVnZGM3QrY1BRUDluOUxoSmFDS3hXbDZp?=
 =?utf-8?Q?jLgYgI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:18:55.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ea0aa6-8e9f-487e-cae2-08ddb2588189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064

On Mon Jun 23, 2025 at 9:44 AM CEST, Jan Beulich wrote:
> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>> device-tree.c stops requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY and may
>> function with DOM0LESS_BOOT.
>>=20
>> Without this, there's a clash with x86's definition of device_t. Because
>> x86 doesn't discover devices in the DT it can simply skip the code
>> to do so during the unflattening phase.
>>=20
>> Not a functional change on architectures that currently use these files,
>> as they already select CONFIG_HAS_DEVICE_TREE_DISCOVERY.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/common/device-tree/device-tree.c | 2 ++
>>  xen/include/xen/device_tree.h        | 4 ++++
>>  2 files changed, 6 insertions(+)
>>=20
>> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tr=
ee/device-tree.c
>> index 725ff71646..741e2ce585 100644
>> --- a/xen/common/device-tree/device-tree.c
>> +++ b/xen/common/device-tree/device-tree.c
>> @@ -2029,9 +2029,11 @@ static unsigned long unflatten_dt_node(const void=
 *fdt,
>>              ((char *)pp->value)[sz - 1] =3D 0;
>>              dt_dprintk("fixed up name for %s -> %s\n", pathp,
>>                         (char *)pp->value);
>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>              /* Generic device initialization */
>>              np->dev.type =3D DEV_DT;
>>              np->dev.of_node =3D np;
>> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>>          }
>>      }
>
> Without something said to that effect in the description, this contradict=
s
>
> obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D device-tree/
>
> that the previous patch put in place, and that only the subsequent patch
> will further change.
>
> Jan

Would replacing the last paragraph of the commit message with...

  Not a functional change because the whole file is gated by
  CONFIG_HAS_DEVICE_TREE_DISCOVERY already. A later patch allows the file t=
o be
  usable without it, for which this ifdefs are a prerequisite.

... help?

Cheers,
Alejandro

