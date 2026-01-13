Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9BD1A255
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202044.1517640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfh4P-0001Hf-0J; Tue, 13 Jan 2026 16:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202044.1517640; Tue, 13 Jan 2026 16:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfh4O-0001Ft-Tj; Tue, 13 Jan 2026 16:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1202044;
 Tue, 13 Jan 2026 16:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfh4M-0001Fn-R1
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:16:34 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38af3da9-f09b-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 17:16:32 +0100 (CET)
Received: from MN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:52f::28)
 by DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:16:23 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::8c) by MN0PR03CA0001.outlook.office365.com
 (2603:10b6:208:52f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:16:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:16:22 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 10:16:21 -0600
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
X-Inumbo-ID: 38af3da9-f09b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEfID/2Ct/xo0YkaeApda1mtO2DnTU1a4BhU4fTbaNwWi8gnbYUkf+yd5Cdo7E8hTLnKvl09niNlgrmUpjBB1u2h//f3eIrVeHlmPeoBMdUWi+OPAKLXbfPvZ8R1HBuxes+x/d/+hmUlwFVmSl5B/GR9fEs6pQz3uSonB9VoX5VhXT2I4m1AzOgz95Ygda8ttcHN9hhvENuKfBFWhw5CCTZJKgEAru3Ej+hEL1V7DBYtVrfHAndRTjvXYmp8YCfneiEhWtLm9q7UMr0UWynInMV2N/XhJstC6hoUfWIyXak9IHngCmVJP3WgBCWZO7xy5A2D91ziAyrKVay/wEeO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsr7nMo8BX3rxrcUabuZmfRBRJ//ey16ldT8y054K0w=;
 b=BvO7C0EmApmjELGsGHpn4q8D1Z2BCC5B03XOEqVOvzAAlS5yMBfQfvv8AdVDy8ypG4BLRbKjEB924UZQrYs5tZ4hqnLLyf3SeoFtsBqkhxNfpWO8yHpmKOp4K4GSPpapAJkAKuot+hcwcIR5axIKXwUC0yyUIEbSYXOql9DIrQHa5aao47R/fsxR2RbAaTY9E4uVnIYmZp/oQ2mEoLFgMFNBNJKTk7JW2ZbOK4X8frAJJ17F4tsEmf0Df05i/NlZSb6b7ObDPZgVhDCXsXe0PfcRfTbKIMTmtAmp5WxFjRkQfd4DLuhCbBCdIfhI+kZ29A0r554RgyNcUR7S6elqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsr7nMo8BX3rxrcUabuZmfRBRJ//ey16ldT8y054K0w=;
 b=NX68Zql5YbbdaFyk9/Ply4d+8S1jFcx0RUmkCI/t0yPUGYzK8zkBnTH5EhAW6yy77MecV8/GCm1uDkMIIjG9sv81AHKn+jiRwoKvPdq8XS4JAPhBIp6WRUydt4ZcreKY837kMwksMKVXrNa9IdbHsHy3muYQEJNs4x0WTEmMBTc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2026 17:16:20 +0100
Message-ID: <DFNLGZK4QDXB.1CILIAR3DXVWD@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
X-Mailer: aerc 0.20.1
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
 <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
 <DFNJUME4L1XB.3AUTF02P2QZ9T@amd.com>
 <e0c53bc2-f441-450c-bbd6-b070db25a504@citrix.com>
In-Reply-To: <e0c53bc2-f441-450c-bbd6-b070db25a504@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 51776997-ac56-4c72-059f-08de52bf1817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmpUVG1hcXppck9uOG5xVWJIK0dwK3Y1c0FWN0dLNjFJdUxLYm9MTnJzSXBv?=
 =?utf-8?B?d3YvUHFEcXUwRUg5eGlGVGwybmlVRW9QNllLUDQrZU9mNG9yV0pKSE5obHlz?=
 =?utf-8?B?anQzYmI4UDFid1ZRUzJFdmlMUWVvWnhmWm5PWCtiN0hhbndMMkJpRXE3MEJY?=
 =?utf-8?B?ZTdUL3VIbklJTVNYcGJRVTFheHNKZE5hRnlpb3BCYk42YmhYTDdZSUdxUU9m?=
 =?utf-8?B?ZTJ0Nk82eXZzeUZTM1kzZ2ZCUy9PdWN0eHlCdjhHMlBZdGFWckxmZGlSMGJ5?=
 =?utf-8?B?TjhGLzhNRnZRZk1WWThsK2dxcGFWdGR4Y2RQeGpmaUtmOWpSQUpmK3lpS0lp?=
 =?utf-8?B?NVFabEYxTzE4aFB2WkVHeHN2SWhkc1pyMHY2bXRhR25RYWdlQ3NoVmtNaDBD?=
 =?utf-8?B?dkdWakhKN1F5amdNV1RCQkFZSGMzT3A5ejNKV25Gd28wUUZaTndMRDFmVi92?=
 =?utf-8?B?a3NieEVoeWdQellKOU9qYUtUSWQ5aG0zNU5pOTd1YWJucnZiQ2ZqZCt6ekt0?=
 =?utf-8?B?UXJIZHRrR3gxc2FJY2lqa0JCcXArTGNiaFJkcjVJUGIwMGtIWVpEc2hqL3h6?=
 =?utf-8?B?YnB4K0UvNUs1Mk9MU203eTFZRFR5RmorbW9kU0Rpa3p2RnZKK2NYMFU4NU1O?=
 =?utf-8?B?ejBBTmdiaUhKd2JFaVBGWENzTC96N2NMSEFMbjNxYWYyem9sL2dQam9aYkE4?=
 =?utf-8?B?SVE2dEV1TEpWTWRGajB3eWZYa3FlWDVleWtnbTB4R2M5VzM5U1RUcDZLbWQ2?=
 =?utf-8?B?Qk9OcVR3OCtCK0pMNmJZYU9BMEdVNkdxdE5PK3ZzUlJGOUtIcnM4UWhOMy9X?=
 =?utf-8?B?ZllsTzE3NTFROXVFNkd3ZGZTOUFxZFQ4Q1REdTJmcmg3eFVzNFVWMTFBWmZX?=
 =?utf-8?B?TllsMlJmUXVrNEhJRUlrdkgvMFcvNDVJMlhuRGJXMyt3Zm82SlNYbjM4MGRT?=
 =?utf-8?B?RW1naE1Ybkp6Q2hJNnFNY0JrMVNqT0tMbDFqQmg2M3RvZnRSdlFyVzNuMjJB?=
 =?utf-8?B?MHdjODR5UmM1ZExWYkd1b1NYM2kwdllHSWM2KzNvUXJzYms1T2pwZkhZOVpL?=
 =?utf-8?B?ZlFoRm1ZMHNDYzJyVkNUdERYOEtOZWxhMEpZU0pNbTNSMHFweG5vUWVuS3do?=
 =?utf-8?B?R0V4Y0YwbVlWaDE4S1VXaGRvUi9UUVljRDZUeVp3VGJNWEVSbGJYdUkrVmZU?=
 =?utf-8?B?OElzemgrS3dIbFVlNGw0TEpwTDd2YnNFY2dnVnRjSC9KNUI4V2wwS2dMeTRk?=
 =?utf-8?B?c0dGS0R2TG9XK05GMXB5VGhNWXIvczNLZW5QRjZQYnd4UDBYRmc3eWowYXZL?=
 =?utf-8?B?QTdBckVUVTRidWVQeUVoQUNlZE9uaGxsdkRKNkdNUi8wa2VYcm9EMGRjUHJS?=
 =?utf-8?B?REJTSzZ2QUQwVnRDZmt2RXYyQmQzVFA0OHlsN003a3BuNE5yY3BIMVY5WGtn?=
 =?utf-8?B?RHZRUy92MzE1RTMySWIwcDg5ZkJvQ2dLTTArRlBlUmg5TE9RTjd0b25FV0hU?=
 =?utf-8?B?eWJlTXhiQVREUVdlZzROZDRuQ1YvN3JKZ1c4QlBXR0NKYUdyOHBVZ21hdzJj?=
 =?utf-8?B?R3U0eWxMdEJzNnpGblJUcFNaaWNGZWVmNm1UdEtrSDI3Zmt1bStxRDRKQ2tF?=
 =?utf-8?B?dFlDbVVwamdhVWxqS3hSeExBU3FkQ2FPMTF3a3loeDU3S0cxcHpuQnA1WTVH?=
 =?utf-8?B?WldoY1NORWFzRHBuUUsvNG5JeW1oQ1NBWUxYL1F3bHk1dHRJaEIwN0tzWHpJ?=
 =?utf-8?B?dmVnNFZQZ3FHZmZ4UzcyUHpwZWJsdGtlTWMwTlcvUEFGOUFkNlM1SElKMk9H?=
 =?utf-8?B?NWVjZE9RcXJ4YlNScTlkUVFCZGRJWXFsMzgrN0ZtVVpDQmorQWF4T1E2TjFo?=
 =?utf-8?B?eDV4clNaY3ErSFZVY0JWSEl2QmdKdEhpUkVNV1lvb09NTC9YbXBTQlF5clZ3?=
 =?utf-8?B?RVRvdmsxWjZMTkZ4THVmeGgzVHFQdG9HQ0Y5Ti9sZ0tIenRiK3lkcUZwdTFG?=
 =?utf-8?B?SlBmMG84UGdDZUtEZlFXYnRFNnd1NFJxbFNBNVZkV0xYY0tMcmZMT3g1MG5L?=
 =?utf-8?B?a0JDcHJmS01jVWNIMjlnaXoyNUVwL3FicEo4cE9venpzdjJ1NDhML2VxU2pq?=
 =?utf-8?Q?CZa8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:16:22.9125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51776997-ac56-4c72-059f-08de52bf1817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417

On Tue Jan 13, 2026 at 4:19 PM CET, Andrew Cooper wrote:
> On 13/01/2026 3:00 pm, Alejandro Vallejo wrote:
>> On Tue Jan 13, 2026 at 3:24 PM CET, Andrew Cooper wrote:
>>> On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
>>>> It's only used for microcode loading on x86. By lib-ifying it we can m=
ake
>>>> it go away automatically when microcode loading becomes an optional
>>>> feature in follow-up patches.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>> v3:
>>>>   * New patch. Subsumes earlier conditionalisation of earlycpio.c on
>>>>     CONFIG_MICROCODE_LOADING.
>>>> ---
>>>>  docs/misra/exclude-list.json    | 8 ++++----
>>>>  xen/common/Makefile             | 2 +-
>>>>  xen/lib/Makefile                | 1 +
>>>>  xen/{common =3D> lib}/earlycpio.c | 0
>>>>  4 files changed, 6 insertions(+), 5 deletions(-)
>>>>  rename xen/{common =3D> lib}/earlycpio.c (100%)
>>>>
>>>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.js=
on
>>>> index 388397dd3b..2b874dfd3b 100644
>>>> --- a/docs/misra/exclude-list.json
>>>> +++ b/docs/misra/exclude-list.json
>>>> @@ -121,10 +121,6 @@
>>>>              "rel_path": "common/bunzip2.c",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>>          },
>>>> -        {
>>>> -            "rel_path": "common/earlycpio.c",
>>>> -            "comment": "Imported from Linux, ignore for now"
>>>> -        },
>>>>          {
>>>>              "rel_path": "common/gzip/*",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>> @@ -225,6 +221,10 @@
>>>>              "rel_path": "include/xen/decompress.h",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>>          },
>>>> +        {
>>>> +            "rel_path": "lib/earlycpio.c",
>>>> +            "comment": "Imported from Linux, ignore for now"
>>>> +        },
>>>>          {
>>>>              "rel_path": "lib/find-next-bit.c",
>>>>              "comment": "Imported from Linux, ignore for now"
>>> Honestly, I think this needs simply dropping.=C2=A0 "ignore for now" is=
n't
>>> going to cut it with any competent evaluators.
>> That would depend on justifications and such. But regardless clearing th=
e
>> exclusion list is a different matter aside from removing microcode loadi=
ng.
>>
>>> By libryfing it, it's no longer part of the AMD target build, but it
>>> does want covering by *-allcode.
>>>
>>> Given that you noticed it for v2, I presume there's something in the
>>> file that Eclair doesn't like?
>> I didn't run Eclair on it. It's ignored as part of common, and the build
>> fails in CI if the file in common is absent. That's how I noticed it.
>>
>> I'd rather not gate this particular change on earlycpio playing ball wit=
h
>> Eclair.
>
> I'm explicitly not gating it.=C2=A0 *-allcode is non-blocking, but I want
> earlycpio being scanned.
>
> Simply omitting the second hunk should do this, and not explode the AMD
> target build.=C2=A0 (Once this patch is reordered to the end of the serie=
s.)
>
>>
>>>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>>>> index 92c97d641e..4fc0c15088 100644
>>>> --- a/xen/common/Makefile
>>>> +++ b/xen/common/Makefile
>>>> @@ -65,7 +65,7 @@ obj-y +=3D wait.o
>>>>  obj-bin-y +=3D warning.init.o
>>>>  obj-y +=3D xmalloc_tlsf.o
>>>> =20
>>>> -obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma=
 lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>>>> +obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma=
 lzo unlzo unlz4 unzstd,$(n).init.o)
>>>> =20
>>>>  obj-$(CONFIG_COMPAT) +=3D $(addprefix compat/,domain.o memory.o multi=
call.o xlat.o)
>>>> =20
>>>> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
>>>> index efca830d92..60cfda4dfc 100644
>>>> --- a/xen/lib/Makefile
>>>> +++ b/xen/lib/Makefile
>>>> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
>>>>  lib-y +=3D bsearch.o
>>>>  lib-y +=3D ctors.o
>>>>  lib-y +=3D ctype.o
>>>> +lib-y +=3D earlycpio.o
>>>>  lib-y +=3D find-next-bit.o
>>>>  lib-y +=3D generic-ffsl.o
>>>>  lib-y +=3D generic-flsl.o
>>>> diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
>>>> similarity index 100%
>>>> rename from xen/common/earlycpio.c
>>>> rename to xen/lib/earlycpio.c
>>> What's wrong with .init here?=C2=A0 There's only a single string which =
will
>>> end up unmerged so I'm not worried on this side of things, but we now
>>> have series doing safety things getting tangled with .init and I want t=
o
>>> get it fixed.
>> .init.o doesn't work with lib-y; only obj-y, obj-bin-y and extra-y. See =
below:
>>
>>   $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y +=3D -DI=
NIT_SECTIONS_ONLY
>>
>>   [snip]
>>
>>   non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(ex=
tra-y))
>>
>>   [snip]
>>
>>   $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: =
$(obj)/%.o FORCE
>>   	$(call if_changed,obj_init_o)
>>
>> That's just what I eyeballed. There might be more hidden elsewhere.
>>
>> It might want fixing, specially if something like libfdt is to turn into
>> a library. But it's just not relevant for this particular change where t=
he
>> single contained function is already __init.
>
> *.init.o does two things:
>
> 1) For things we can tag, check everything is tagged
> 2) For things we can't tag with __section(), such as string literals,
> move them into .init
>
>
> Fixing lib init properly should just be a case of sprinkling lib-y
> through those places you mention.=C2=A0 If you want me to do the patch th=
en
> fine, but I want it fixed rather than keeping on going around in circles.

I can do it, but I'll make a new series to deal with that independently
of this if that's alright. Feel free to leave this patch uncommitted until =
then.=20

I care far more about the next patch going in.

Cheers,
Alejandro


