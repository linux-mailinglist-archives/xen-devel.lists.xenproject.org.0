Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54857C91673
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 10:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174604.1499554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOud1-0008Pr-IQ; Fri, 28 Nov 2025 09:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174604.1499554; Fri, 28 Nov 2025 09:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOud1-0008Nv-Fn; Fri, 28 Nov 2025 09:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1174604;
 Fri, 28 Nov 2025 09:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94Jm=6E=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOud0-0008Np-1w
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:18:58 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424d386f-cc3b-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 10:18:54 +0100 (CET)
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 09:18:48 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::f4) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 09:18:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:18:47 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 03:18:45 -0600
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
X-Inumbo-ID: 424d386f-cc3b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzT62rWdaA8Vq/qnJEHfxk0r86e+msiOeAWZXGZfrWA2q5Ts9u9ndo7rfJpdxynjFdCXG2cTBgsqXhDJiXMNytsaP+kLhedsmsMt2AYBhjXXXWUNuNWtQhDuPbk4OBGwvt8tPeiJFIOkVG/eSlgUL9ICBIWJ5WivvLi642lk+Lul5p0GJ5qfZ7ol6M3i4SdiOiXTCfViRhvQRP90I/dYvebTF4UYewq2wC+HM7B6plG671kSqEQom/MXpGzhnlORJLbJ3bw5nEC3vb278/qPKHfUk35UvS/qPwT9G5kfLilnTqHXFFCHoIn2xXEe6NL7n4qNbmGYIZBoRwX/VlIL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHLXLseoA3eo8/r9g2m5hKUIhaYs1D9J4LidwETFmHU=;
 b=MvMZZIdloO/XwX80f/GLHJYF4hKDMbSOVCOWjMzu6RFKLTwkXfCtDwsm22OGLihIuIvs0AfhVWgxvdomC3182J8xyvZTuTt3pM9YD+mlv5yDDRW49PaRtHnarInxqgKnnkOUkySOMzMvT6v5bV+3RzsNQJzqbx6mGWgMJ4oVfmS/9p0k1mcEBmUgm0fvDyzqPZZrgsvCjv3ywP0b6CuxF0fVJCXRcHO7OlqDv4kUAwyxM+vs7ZgDPuwUu/dUvrzg/VMjO3DhzkoutYdHI0oUhnMnIxKfFgIbu4UNiZwlpo4Yyt6cRBoVSsaUI67GGT7iXHasKo4Cmk5Cd9unJbW1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHLXLseoA3eo8/r9g2m5hKUIhaYs1D9J4LidwETFmHU=;
 b=cZ2+LjeQ79VPVYu7cNY3TUa3WcJIfCeXeEPjbtn49UEcvMJDrnFlowjnS0e8ro39TsBlHqsZv+pocSpV61KmoInu+vEpIp6q9URL8rCegqZIw1WXcIMrVoBTXEWMoncRUvtGGKYe1i4wExTwikfzXzcXbk0E2t52tBBKzWZRkG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Nov 2025 10:18:38 +0100
Message-ID: <DEK7S46A99EM.3LIH1753H2L8Q@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH 00/11] x86 vendor check optimisations
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <d27c3599-ecea-432a-b244-13b92b274c14@citrix.com>
In-Reply-To: <d27c3599-ecea-432a-b244-13b92b274c14@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: fe41b422-f3ab-4df0-a70f-08de2e5f2341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|30052699003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmJlRm01eXFOdk1rQzlXOFZMSG5YcVYvRlMzUEpxTXh2TGZWd2NaUjdVMG41?=
 =?utf-8?B?b1JTY0czWndWK1NvU0MrWmFJd3NJS0ZIeVgwbmxBMnJVNnova3NSSzlvMnIr?=
 =?utf-8?B?OGJnaWU1TXpiT1l2NEZ1L1p2TlpXN0h5MnRWeEJqbVBwSkk0TUVnaXJuYjVV?=
 =?utf-8?B?WTNOd0ZtbkN3TVB3N1kyVmgzaXJJSEt4WHhxYTBFNnUzcGVxbGZVYWhjZ3Rk?=
 =?utf-8?B?eTlvTWp3ZWo3N0EvV0h4ZThHVllZTVpoOU02U1VwRGxuaGs4c3ZsT1NnZVNk?=
 =?utf-8?B?eW9BeEtQNXNpZjlNSGFlL096UnJRd3M5N2ZTZXFSMHZhdzEwL3BWVi9XZkIy?=
 =?utf-8?B?alNQWGQzVjYrSDZBQlNvb1J3TERpYW5BbmI5NUhoK05ncVlzNlJ0S0dUNXB6?=
 =?utf-8?B?VmlvLzJldnlITHBmTFlUZzQ2WVV6QU5vNFRGa2Y4bjB5NEUzT3RFUnZxQU1o?=
 =?utf-8?B?eGhYeGZHblluNjVtdXc1OUdoN1hJM1lvRiszU2grK3YvUXMvZjVJYTFmc2c1?=
 =?utf-8?B?cGtMRXZHa3NoVXlsMXJCZjNkVC9iSjVHWE5tSUdVSXhBak90cmFqUlZLN2pj?=
 =?utf-8?B?ejRielVTdlFtSUo1NklHL1dyVkRkMDZjY3ZmYWNmOWFUaDd6UHNDYmJrbStB?=
 =?utf-8?B?N0RkVjZ3VDJ1WDA3bUxmNmlyTzZtQlpPaklOY3lyUTMvcmJNd3ZiNmlZSERx?=
 =?utf-8?B?UHNGZWNNSUVVMlJVRW1vZkN4MkczTnR4bUVHQzI3ZkU5L29FMlZNREE1Qksr?=
 =?utf-8?B?SCttbU9mZUdzUkVqZk5OaXB3cHFLZEFDRUdzUjJ1ZzZWVVB3VGtwTWhPL0t1?=
 =?utf-8?B?YVRGV0sremZGWWNqclRNMFg5bFRzTVZzRUJOZTlpdXNlaDhPOXJkWE5UaUNK?=
 =?utf-8?B?U3AvNW5VRFZOT2JSUGZ6VHpBU1paSkRJNWJ5UjBRWHBFUzRRQVJsNnEycDVt?=
 =?utf-8?B?K3lJdTVSUzRxQzR6Z2tiVVpDcGptS1JPdFdyc1NRNWdNbm16bjRhL3EzMEZL?=
 =?utf-8?B?SFRXQmNnanBNaEhWaWpnMkhWc3EvM3owNlR6c3RiR1hzM3NOTlYvTVdwZUZE?=
 =?utf-8?B?NDBwWkMxRFoxUnIrVHo2NDd4NHRVNGNuUHpLbHRTeEZOU0hpU3A0VU9hZVFQ?=
 =?utf-8?B?ejJ6M3BkQXAzU3FjeUlMSjJEYTE1VzJnd09aaHErWUlFWWpKM2RrcFpoN3V4?=
 =?utf-8?B?ZW9HUFFKNEY1endWVEV4ZUVhdEFtSnhwMFNaRWUzZ1o5Q2pobmlZZHhpbXZQ?=
 =?utf-8?B?OVpadmJGc29YN0Y0cDNTdDZVREVjekNFMy9nK1BCc1ZKYklUb2p1Ni96cTll?=
 =?utf-8?B?RENYTWhtcTRXVTNkL252NzVZS3JucnVacVpqN1JmMDVZa3BveHhNSkVKcFcz?=
 =?utf-8?B?d1ljSW5JZDB5Y2pGcFhzblhjemQwUXZ6VTRCbVViMTVTQm1IUEg3cFdDYlJy?=
 =?utf-8?B?QkQxVHJUYlRVSnZHZXZTSUIvd3NWampVbFhHRk12RitwSWpEQzJuTEhkYWlQ?=
 =?utf-8?B?YUJQcm5IVjZ1dHBCMnV4clhnWXk4WmVXY2dqTFV5SmF5ekorUHQya1lIZW13?=
 =?utf-8?B?TExaWHlKaHl0VlNBT1RJcndab3F0VllCSk5zNG5uRnBIcXNZRDdEYW5tS0s3?=
 =?utf-8?B?QnR6QTRXelJNUTE1Sng1OEZocmpVR0hVOHZTdkQ4dFU0anNRUWhEMHV3dEJ1?=
 =?utf-8?B?MFVNVEpHcHo4dVB4YnJJZ0pmL3M3dHdFYW1CSEc2dlp3WE5XbFFoRHI4UmFm?=
 =?utf-8?B?bzhabVFFRWU5V2R2TElPcHpPdjVPK04vczVCSUhUQlJkVzVTNnloSm5rVk9C?=
 =?utf-8?B?S2FhQk43aWxUakpJUXlxbTg0T2JIL1RoUndHTW1DOGRtaWdnZEtNMWpTYzZL?=
 =?utf-8?B?M1d3TmNiSkhKWkNCT3RPNWlwbnk3NkJ3ME5VN3A1VzE0Zys3TEF4akdCNmNv?=
 =?utf-8?B?UEVHOVZjL0xrdEZ1a01JT1VFQ2RQcGZDdDlLaXFtL1Y4bFBWS0lSTGI5cFlr?=
 =?utf-8?B?RUVreStwUDFBb0gzbzBKTlplTENoa0xKYXBiZm5NVGUrblFNdlZJR2tUT0I1?=
 =?utf-8?B?S25sTUFyL0lUT0ljTkthdk0zc3lSamRGQm1iMGswWFhqOVBiL0hWbmVuOUNV?=
 =?utf-8?Q?l7GU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(30052699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:18:47.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe41b422-f3ab-4df0-a70f-08de2e5f2341
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

On Thu Nov 27, 2025 at 11:11 PM CET, Andrew Cooper wrote:
> On 26/11/2025 4:44 pm, Alejandro Vallejo wrote:
>> Just knowing x86_vendor_is() is "good to have" is good enough as it enab=
les our
>> downstream to customise it with whatever optimisations we need.
>>
>> I also suspect other areas of the hypervisor could benefit from this mel=
d of
>> runtime+compiletime sort of checking, allowing transparent code removal.
>>
>> I'm thinking DOM0LESS_BOOT vs DOM0_BOOT vs PVSHIM_BOOT, or AMD_SVM vs IN=
TEL_VMX
>> in HVM-only builds, or family checks to have (i.e) a explicit "older-tha=
n-zen"
>> Kconfig option with a similar approach on a family range check.
>>
>> This is maybe one of several such uses.
>>
>> So... thoughts? I'm definitely fond of the single-vendor bloat-o-meter o=
utput.
>
> Having looked through the whole series, I'm not a massive fan of
> converting the switch() statements, but it's the only way to do the
> DCE.=C2=A0 So be it.
>
> I think x86_vendor_is(var, MASK) wants to become boot_vendor(MASK).
>
> Most cases want the boot vendor, and those that appear to want something
> else don't actually.=C2=A0 When you disable the cross-vendor case (patch =
2
> pulled out ahead), then cp->vendor =3D=3D boot_vendor and then you don't
> need a variable to pass in.
>
> This also reduces the verbosity of the new lines which is an improvement.
>
>
> That said, this series also collides substantially with the Intel Fam
> 18/19 work, which is more urgent and needs backporting to 4.21.=C2=A0 Mor=
e
> specifically, there are a bunch of changes which interfere with VFM
> conversion, and for which I can't see an obvious DCE reason to have, so
> I'm wondering if they were just part of "convert everything".
>
> ~Andrew

I converted everything under the sun because it's easier to find all of the=
m
than the strict subset the will give me gains. It's also easier to have new
commits using the function when there are no seemingly random instances whe=
re
it's not used.

What's exactly the area you need to touch for the Fam 18/19 work? I can lea=
ve
that conversion for last in the series so you have time to push and backpor=
t.

It's quite likely not in an area of the tree I care deeply about.

Cheers,
Alejandro

