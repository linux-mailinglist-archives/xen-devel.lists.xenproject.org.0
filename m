Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC3C575DE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161165.1489171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWJx-0000fY-W6; Thu, 13 Nov 2025 12:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161165.1489171; Thu, 13 Nov 2025 12:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWJx-0000e7-Sm; Thu, 13 Nov 2025 12:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1161165;
 Thu, 13 Nov 2025 12:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIX7=5V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJWJv-0000dx-Ub
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:20:59 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3525e117-c08b-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 13:20:58 +0100 (CET)
Received: from MN2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:208:23c::13)
 by LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 12:20:54 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::95) by MN2PR18CA0008.outlook.office365.com
 (2603:10b6:208:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 12:20:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 12:20:54 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 04:20:52 -0800
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
X-Inumbo-ID: 3525e117-c08b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSfbGXF/zcLAzj66ZW4shUePrsUXIZcw3ELsu9TSOVOPd8fkLKRJTDLCCiVJORZiUDMHR56b3slfBZRaD20nfb6Nr/Cx0iT5kH3CvPKV+lR3y4px3H+EpR+ofj+0cVvzgmb46FP8EFFmsdLtZ+elTDQFKtSJ49u5atL4zms5QK57F1gYKTkKlSh0ltNWEhLu4qotPnoSjhfpPZ/HW6JOVP8/KD1lgsWPVWUTuahg28XkXgWP5PFf90mjivU1EDW5N8k3VP3A6GqHxDoDhPjE2/HfskWAFSV3oVv0jKL5XZHyJ73YxGNdDRfQtK/7RP5NlgtgaKAnmZAROqz/HaG6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EczQbUIAzunZNp5c+f3DsSUMSvpC+Ob+/nbF+WrTaYA=;
 b=UkXL0QwWMCoc0e7Llovfp793+UfaTSgDHCjDa4nG112T9DCT2/nGOvrO4LvgdrDb35Z5aQsmlHzc3m+E0VVYSgXWX9NvPoDTBs5QDbxdOx0XDWJLPNVMk9bSn5Rqv0EPiLD/xJOZVoDDmt6PtWRXTDRrouzaQ6uFDYou2HgAcz+K+vTDLL3HXQVuKneF8W+1xPkDx5pNbW15REhErrocwDACcp9J/ze3OVMLEUKoUth/lZoG2nMq/tP0bBDZBnyv7c8o56VTKzFS+RLGjxkAeTafIQLupQWXnqiqG7OaNCsd5/+MbvS7rjyQhH691nX1PN0ANrWrNodSrH7HB+dzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EczQbUIAzunZNp5c+f3DsSUMSvpC+Ob+/nbF+WrTaYA=;
 b=XfLsKWFTzeW4Hsz8kyMUkwzwtshotY3ABlsu2qp3hkPuj54R23+vgagTf/hr9IwWbUS+p0C9JV8NRW3Qrmb6oHmSusIJyShVCbMBbbilxl37VOxHfJANrkorbWvbOJPzzpS5koCtpntL/fNDN2DhssbZJzSwqGX/cFluFNbTk4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Nov 2025 13:20:50 +0100
Message-ID: <DE7K9G9FS7ZL.2JVRCUHFJFH6W@amd.com>
Subject: Re: [PATCH 1/2] x86: Conditionalise PV-only fallback branches on
 CONFIG_PV
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
 <730c6001-58a2-46db-95fa-c8ec2081d3b0@suse.com>
In-Reply-To: <730c6001-58a2-46db-95fa-c8ec2081d3b0@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa31581-70f3-4303-2eab-08de22af177e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UE5FRlNwV2pjTjVUVHFNZWRjKzBUcnRUZE01RW51dUxaaEl2WG1XN2ZsNDJJ?=
 =?utf-8?B?aVcwWFF2NW1CZFJ4K3dsaEY3ZzdDMjVqSXpCWU1PUlJTZDJrYkpMeEQ0S1Qx?=
 =?utf-8?B?Zk9TUTVHMnNYdUVXMUJGZkx1amV3bys3Qll1eTdKRmdCM3pUSUVzaGwyZStQ?=
 =?utf-8?B?S0EwRXk1S0hBcUhQSmJ3aElsMU54ZzROTHhUQ0x2Ylkzb2p3c2tWV2loVHhs?=
 =?utf-8?B?cnNhaW1UMlptTzk2WmRpUVRkU2N0ZnFMblUxVHlBK2IwcGZ3cTZnZnhSWncr?=
 =?utf-8?B?UWNVZUlEMjFaMTlCR2daMXkreHp5aldtWEJGbTVjcGRzaEc5TDk4UjlEOExk?=
 =?utf-8?B?ODBvSDc0blp4cWlWeGxtc2FNY1IzYjlmVmQvNU8rR0Q1L1p0UFAvbWgwZ093?=
 =?utf-8?B?Z0U4ZHVUa3NMaXNaTDdYekhkZlBEZGlRUmU5a1dLR0FNWjA4b1F5N2RZM3pJ?=
 =?utf-8?B?VzR5bFFsNW1sdy9idWFiQkVoamlVR2ZEVWVCYzFpU3crZno3SzNYREYyRWZx?=
 =?utf-8?B?S1N5SHJvazhHNmFsZ0hXa0x3UGU2NXRROEVrcHBYY2FQbnRHR3VGbnVyVW1q?=
 =?utf-8?B?UUtxbFp5cFZYUmxuc1pUYmpuRnVuMWZmdDRHbm10SHhYaHVuUUw5N09pcm9z?=
 =?utf-8?B?czB1VkNpZjVhNmlIL2dCUjBYaEY5eEVvT29oc1pma0RIK0J1VzRiWG1YSTZ1?=
 =?utf-8?B?cHAybXZkeHRRY1lpNS93TmYzT0ZlY1ZNenlvLzlPQmw4b1M3ZDhiblFmd3R5?=
 =?utf-8?B?WDNKSnpqOTNlYmI3Q2ZHVnRtdVRNcXhSNmJHWkVUamptalRXQjNZK0tPR011?=
 =?utf-8?B?Mlo5amEzOVJPTW9nQWZLdFh4WGJ6T0MrQUJKZFkvTEVoZk1leE03dEQ5VXk1?=
 =?utf-8?B?UnRvL1BVbUlKTTgvaU50Q2czSkNzcEo0TFFya2VSY3lBaTFJZTJyM25nMGRJ?=
 =?utf-8?B?cEh5MnFoWjZLWVFsY0NNdC9CNXJYLzY0SHhTL05tUERibmlvR2N2Y2pBODUv?=
 =?utf-8?B?alpENWFUYUZGeFJMOFRTV0VpV0c3V2NNN1p5amkxdjIwK01LeFhrTGNJeEVu?=
 =?utf-8?B?UHROdGFqYzJKQ1pRblpFREtBQWRCN2NDdUZwTEZrWXZQOGVXekI4TWhQWTlI?=
 =?utf-8?B?L04rVDdlekFlaHFYTVA1b3V5ZS8zVEF2VGRQY2l4bjFGZ3duVmRhV3JqcEhG?=
 =?utf-8?B?UEI3YlVYaGFFckh6R0d1b1FzNWUzT3I2MWliRis3S21iN0dOVjNteWZ4bURx?=
 =?utf-8?B?d0pKcjA2ZWs5SDZiYVgyMVlTSHhIWjBwRE84UFMxYmx0SUZ1ODZMSGFtMXJH?=
 =?utf-8?B?Y3k5N2hMS1lLTU9kSWxxbjRxcFYvNHQ4R0EvVC93UVJ3ZzBWWmYwZzI1bGFt?=
 =?utf-8?B?YWtxV2xwbjlwMmFGMTQxM2x0K0dKcGtqcUwraVNDNDRzS1ppcVVaQ0tmSDFk?=
 =?utf-8?B?VXFuQVZ4U1VwSlhreFZkUUVWRDRNWTBXbkgvTE9BbUtORkFQTEd6cmdqL3dH?=
 =?utf-8?B?MXZHVnZYdDdIQzZkcC9GeDZYaXdrUzBEemlkWnpXT2hSZlk5UnhzVTBiUkJ0?=
 =?utf-8?B?UVB1aE5YeXN1bVRYaFdQdGVnazhvWHdqeTRPY3BmVXhyTTJUT1FpcjFvUTIw?=
 =?utf-8?B?MjNxRG85eWZTT010d3l6Q2VKT3BOY01waGZ4Y3lUajFSaDJSYlk5ZVJlaDJK?=
 =?utf-8?B?bUNoVXJRSjFVZ20wSk9ObHdZR2RkYzF6eG1NNVNpNk9zNWsyRVZTYWlUelZv?=
 =?utf-8?B?WEZsMUNrSER5b01yTVJrcjNzemlUVVZRazdSRGY5cTM3NG8yT0J0R3ZhM1R2?=
 =?utf-8?B?RHYxYWZUaHRkZnFxdmN5SjJQb0o5SlRCQTdLQ3EvVEFEQVIzKy9DNm4zSlRM?=
 =?utf-8?B?dVBYSG13YjcvcWt0dG1DME1tNjVueEVjWnMwTGFCV1pnZVlDSXp3dnh0TkJT?=
 =?utf-8?B?SWlXaGxYRzZpVkFia05CU2ZjaXl1NkQ3QVZhYkxoYTNjeXFTdE5saC9scnR5?=
 =?utf-8?B?SmI0YjlBdmZoaStrUVMxNFp4S28yWCtnMHVZR1MvNVR0RkdDRzNPTTlrSmZI?=
 =?utf-8?B?S0RyRXR0VFRzd2IzblA3MEhTQnUxOVpkNVRtRjBTRDU3NEdRSEZFTWRRaGJp?=
 =?utf-8?Q?mitQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:20:54.1513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa31581-70f3-4303-2eab-08de22af177e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825

On Thu Nov 13, 2025 at 12:42 PM CET, Jan Beulich wrote:
> On 12.11.2025 16:22, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -297,7 +297,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf=
,
>>              if ( v->arch.hvm.guest_cr[4] & X86_CR4_OSXSAVE )
>>                  res->c |=3D cpufeat_mask(X86_FEATURE_OSXSAVE);
>>          }
>> -        else /* PV domain */
>> +        else if ( IS_ENABLED(CONFIG_PV) )
>>          {
>>              regs =3D guest_cpu_user_regs();
>> =20
>> @@ -509,7 +509,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf=
,
>>              if ( !hap_enabled(d) && !hvm_pae_enabled(v) )
>>                  res->d &=3D ~cpufeat_mask(X86_FEATURE_PSE36);
>>          }
>> -        else /* PV domain */
>> +        else if ( IS_ENABLED(CONFIG_PV) )
>
> Maybe better leave the "else"-s as is and, ahead of them, insert
>
>         else if ( !IS_ENABLED(CONFIG_PV) )
>             ASSERT_UNREACHABLE();
>
> Happy to make the adjustment while committing, provided you'd be happy wi=
th me
> doing so.
>
> Jan

Should I understand that as an Acked-by?

I think it'd be marginally clearer with the assert added to my code as an e=
lse
branch at the end, but either form works. I'm fine with it being committed
in the form I originally sent, what you proposed, or the ASSERT as an else
branch.

They all have the same effect, after all.

Cheers,
Alejandro

