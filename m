Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CCB15CF1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063627.1429346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3QP-0003pY-5X; Wed, 30 Jul 2025 09:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063627.1429346; Wed, 30 Jul 2025 09:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3QP-0003nZ-23; Wed, 30 Jul 2025 09:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1063627;
 Wed, 30 Jul 2025 09:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rpg=2L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uh3QN-0003nT-DS
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:48:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c1073aa-6d2a-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 11:48:36 +0200 (CEST)
Received: from MW4PR04CA0283.namprd04.prod.outlook.com (2603:10b6:303:89::18)
 by SA5PPFD911547FB.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 30 Jul
 2025 09:48:32 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::f2) by MW4PR04CA0283.outlook.office365.com
 (2603:10b6:303:89::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.27 via Frontend Transport; Wed,
 30 Jul 2025 09:48:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 09:48:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 04:48:30 -0500
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
X-Inumbo-ID: 5c1073aa-6d2a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIJMcj8M2jfZXhk+wldfmAAP5b9xQboHHgVil9JXwHG+vN67/EbY9/66V1kjDACf4YeMsOfm3yNsJNaK/msUYtCfuCt2RlnsfKbLtR24WtwEgjYF6UZpsL+UcS7tyYdXGZIx0Oxo2K4dFAh25mw3lml1XU+T5rnfb4tu3+Nkke4IwQ/CvjtsdgJozl7Zt+dIcLeadmmt5ZuH3/glHZSTC6JHE6vhAm8jEj6e4lVN6mgxclbrtXO8Y7h+dRedXOU2bMCD8ttdPsbAQKGxs7cCkVkecKaSP95B4I2aKWU/QZuTgY7XWpQtMQkmBuxqS38Smq+HuRbW1VvvCnsJxXmdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa0epT7yl3dFM2zLVtXhAd7laGTEas+C52HF9W0K+Os=;
 b=uqXsaMeGmCUS13WjRjgpsfiTNJOC9cWNpdZvBH/YBQ2t+7g1J2Cvd9kceuI39dGJnDa2Xs9DM+l5PXV4n5UyvJp2JNdFuv8MFl/9ARky0+RyqxgIaLL3mkLGSxU5ofSI/+g5f7HRDJhcjin/RkSDVeUs/wMFdEQGXjbe/SHJw63moVjPE6T0yP23T5gz7WOU1eMZwToxkvh1bWLuIB4g76BU5JgwAvnm/RG/z+ilUeAYpW0/inLIlSMw60pemAtbWZFFzorp9JqGdJl48K6lZ77P0oGLe+lQA6GZPLcwkJG7wCojOY9tigrw1YZRLIA5jcsDHKW4R7qnu6p9U8mgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa0epT7yl3dFM2zLVtXhAd7laGTEas+C52HF9W0K+Os=;
 b=QzJFWnsJ0Os4sTrU0N/bzdglgG/EB+V7belqiw8Hg93HgAfeocQPDAH9Cc531ExpBTcWf3n/MZ+n5nGBJ29XANlv8Kso1OoMK7WDcWom+6TJN14L0Yk79fE4fapwgSux8zieUxMxzv2Ou4rlrdSR37xKLeD+KeXoaTfNF2Gpito=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Jul 2025 11:48:29 +0200
Message-ID: <DBPAN1UFFCVS.3BUNHPA38O4NU@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
X-Mailer: aerc 0.20.1
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local> <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
 <aINi024baOV5LQgn@macbook.local>
 <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
 <0006e9f6-49af-4aef-b680-2042fb0d5213@suse.com>
In-Reply-To: <0006e9f6-49af-4aef-b680-2042fb0d5213@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|SA5PPFD911547FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 360ff2ed-0962-4990-9454-08ddcf4e3e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUxqekFQWUpkRi9GZGRtUTUrYUFlQkF5a0huak5TdTh2RklhYko0VVREZG5t?=
 =?utf-8?B?UERXY1ZQamhYNmtxRkl2M1lJeUNUSStudnBIWmh3eG5FRXp2Z0ZENnprakVa?=
 =?utf-8?B?a3BOWk9jK2haaE9GSHd3MElVbUoyWWI2ZUQxb00wRW9hdDRtYUhhLzdsMVM5?=
 =?utf-8?B?L0ZzVStwR090RnVaWDBtZVhXcFdJYk1TeHkwZW1rWUsrN3U1dmRESzBKYkRU?=
 =?utf-8?B?QkVWN3J2YlZtelFySEJnemlLTUk3Wk0xVWtaclUyNFdIakxSM0pjb0RXSGky?=
 =?utf-8?B?VFNZOFM0cXN3UUJJT1FUTStQempOWm9PZFd4TmVYWUpxWE85d3pCUVN4OWVS?=
 =?utf-8?B?L3EyL1FCUm5iditNdnpma0VLZlNFOGI1N0dOTzgzRVlvSDdjVit6NmdLYUJl?=
 =?utf-8?B?RHhYblBGUm1HZzVjNkxlNHVSWXhEUVVIMUpqSzgyRG8xMnNHbEtEMmpMTW81?=
 =?utf-8?B?Y0wvTnUwNXpuZXlwcnNWTmN1WHliNXVUbHljL25QQlJZNS9pRHN4MHl5dnBi?=
 =?utf-8?B?eTVHelRSenhqZXgxN2xjbnR1aFJqbFdGdkk1SEw3eTc3YnlyYy91amNqT1B5?=
 =?utf-8?B?eXdsdTV6bTMySTR2VjZFMm1GTEdRWENnYzUzZ2lqWFNkWTJBd0kwWTRwM2dp?=
 =?utf-8?B?VUFrenZrUGtTK25GTElWMXhSSzNZTi9MWDlmWm9aSmpnZC9tbVQ3aHo4ZXly?=
 =?utf-8?B?VzZXclVhL0puT0ZacVdZL01nUTVHSHo1c0o0aEEyN2ozWTNCZktaajVDVkw4?=
 =?utf-8?B?UkFrMmI5VUIyTXB6K05NTUxscEQwMXBWdjd1STNadHdHU0NEQ1JoY0NUUDFz?=
 =?utf-8?B?K1h6ZGZvYWY0blJ3UE5JVitKUmlEVkhDQ3FtR0s1c2Y5eUhrYlF4bllzbjRz?=
 =?utf-8?B?QXZYRHpZYUU0ZGZRc1VlRU5icUt4dU81cWlraU9saWNmOUtvUGFGcWJsSDAw?=
 =?utf-8?B?dlhuenY1Um5JR3pYTkFrV0QydmhyeEtpM29GNHp4Q3Jmb2dWb1lQZm9YT3N6?=
 =?utf-8?B?UklYS3pHUFBtbmdDcnJtVFc2MXdhQlVzWkw1VmltQzJpL3A5SFlOcUpKWnBP?=
 =?utf-8?B?RG5lTmxYdlUvZGlCdk1MbFBtd3dReEZKZ2xHY3pIYXV6SklmOVNmaHM2eGlj?=
 =?utf-8?B?eW40OXlpZ1J2QzdHdjVqc0M5cjdSQ3o3UDZhS2o5VFpHejdOOUNSeWFyKy9k?=
 =?utf-8?B?Yy8rVG9OZm1XeitkVUJiRHhDWHNIQzEwUzY5a1Zoem9kWVJWaVNPM2N5NjU1?=
 =?utf-8?B?dTlsMzFtdzlDeGV4cUNQZmhUQ1pGNmJ4c0JRKzBmQmRIV05oM0MyTjdrdjVL?=
 =?utf-8?B?NUN3bm5NQkxoZVI0K1pPVDFhQ3Njb1RBL252SWY5bkV2YitncTRvRkRNOGRK?=
 =?utf-8?B?RUltMUNzWGY0UnZocDhwelcwbllFK3FLUDM2M1JFTzhKeTdnVFdaUjQzL3Fv?=
 =?utf-8?B?UUhvaGhJbkljcnF6MHNvbDlLbEgvRkVwY2FqcEszY3lGWVBFTVdiMTVJL1Rt?=
 =?utf-8?B?RTlIalRnM1VXRkkzUmUzTFQzVXIyR2hrOVdWVXI5dWFoOENRcm42R3pmdmRw?=
 =?utf-8?B?SXZPS2plR0U1SmNGWGZTWkk0V1BMeUVwQmtLWEl1cDBaWjZSYTZHZWx3WXJ4?=
 =?utf-8?B?azA1RE5EODhEUHNoWjNTaEFjaWNZa085VWVOVmozUUduSHBIZzF3aUZJcFg0?=
 =?utf-8?B?QldaTmMrNkNFVVI2V2R2R0lIZnBVYW5HSFY4NngxV3UybjUzdFV3MVM1VVBD?=
 =?utf-8?B?TEhkN0hiNFNDbGlRdERWN2lJS2ZwOFgrS2ZHcUdaSjE2cmZNY2FLZHdhYW9P?=
 =?utf-8?B?YWJxZWlWMzI4U2ZLYkVjakgrYUlGaHp5ZEJ3SEJTY3FiUnVlcWg3TEVhamdG?=
 =?utf-8?B?bUhQTk1VMzE5cmpYMmIxSTRHNzJNbnlNWDFSNzZ5dlRiRzl1RjRyWElmdXlU?=
 =?utf-8?B?NGE5V3FoS0llTXp5eXFkN0xpTlJLTlhXYW4xbm1DNHRkR2x2MDFETjBzRkk5?=
 =?utf-8?B?bXowZW4vUms4N0g0VFJBcnhkYkt6bkhYbFU5aGZFdGhqY2QrWjliOWtabi9I?=
 =?utf-8?Q?I9cial?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 09:48:31.9910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360ff2ed-0962-4990-9454-08ddcf4e3e9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD911547FB

On Wed Jul 30, 2025 at 9:48 AM CEST, Jan Beulich wrote:
> On 29.07.2025 23:29, Daniel P. Smith wrote:
>> On 7/25/25 06:56, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
>>>> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>>>>>> Later patches will keep refactoring create_dom0()
>>>>>> until it can create arbitrary domains. This is one
>>>>>> small step in that direction.
>>>>>>
>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>>> ---
>>>>>>   xen/arch/x86/setup.c | 3 ++-
>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>>>> index c6890669b9..6943ffba79 100644
>>>>>> --- a/xen/arch/x86/setup.c
>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struc=
t boot_info *bi)
>>>>>>       if ( IS_ERR(d) )
>>>>>>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>>>  =20
>>>>>> -    init_dom0_cpuid_policy(d);
>>>>>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>>>>>
>>>>> You possibly want this to be:
>>>>>
>>>>> (d->cdf & (CDF_privileged | CDF_hardware)) =3D=3D (CDF_privileged | C=
DF_hardware)
>>>>>
>>>>> To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
>>>>> and not to the hardware or control domains.  I assume it should be
>>>>> possible to pass a different set of cpuid options for the hardware vs
>>>>> the control domains.
>>>>>
>>>>> Thanks, Roger.
>>>>
>>>> Why only a hwdom+ctldom, surely a single hwdom should get it too.
>>>
>>> hm, not really I think: a late hardware domain would get any custom
>>> cpuid options from the toolstack that created it, or in the
>>> hyperlaunch case from the provided configuration, but not from the
>>> dom0-cpuid command line option I would expect.  Otherwise you have two
>>> different sources of cpuid options, the inheritance from dom0-cpuid,
>>> plus whatever is provided from the hardware domain configuration.
>>=20
>> Yes, this has been a sticking point for me and never got any good=20
>> answers thus far. Should the dom0 related xen command line options only=
=20
>> apply when not booting via hyperlaunch. If the answer is no, then you're=
=20
>> in this area with some dom0 options that really are applicable to hwdom=
=20
>> vs ctldom and vice-a-versa. Some could even be suggested to apply to=20
>> both. And then, I don't believe there really is a consensus one which=20
>> options apply to which domains. Over the years working on this, I have=
=20
>> been an advocate that commandline adjustments allow for quicker=20
>> troubleshooting by the user/administrator.

>> In the last version of the multidomain construction RFC, I am growing mo=
re
>> and more to advocate for my initial proposition, that dom0 options only
>> apply when not using  hyperlaunch.

I agree. It simplifies everything a ton, and it's far less confusing to kno=
w
ultimate settings, which in a predefined initial system definition is impor=
tant.

>
> With the hyperlaunch plans, is there something that's still properly
> "Dom0", perhaps under certain conditions? That (and only that) is
> where I would see respective command line options to apply. IOW no
> more than one specific domain (i.e. in particular not to both hwdom
> and ctldom, when they're separate). In cases when respective options
> are entirely ignored, I think some kind of warning would want issuing.
>
> Jan

The problem is that lines are blurred. A ctldtdom + hwdom + xsdom with domi=
d0
is clearly a dom0. Is it still a dom0 when there's no xenstore? What about =
when
it's not privileged? What about a ctldom + hwdom + xsdom with domid3? What =
about
dom0_mem options when some domains have already been constructed and availa=
ble
memory is less than total host memory?

Also if a domain is or isn't dom0 depending on whether a certain other doma=
in
exists makes things confusing. You have a DTB+commandline and get a behavio=
ur,
then add a domain and you get another behaviour on the first one, even when=
 you
didn't touch its configuration.

My general view after a while experimenting with the full series is to _not=
_ use
the dom0 command line, as Daniel mentions. The simplifying effect of not lo=
oking
at (e.g) dom0_mem is staggering.

There's exceptions. nmi=3Ddom0 should be renamed to nmi=3Dhwdom (if anythin=
g,
because that's exactly what it does even with late hwdom), but anything wit=
h
dom0_X ought to be ignored. Which implies first and foremost moving its use=
s
outside domain construction and general use.

All dom0_ options ought to be parsed and used from __init functions before
construct_dom0(), and construct_dom0 ought to depend strictly on informatio=
n
in boot_domain + domain.

Only then we'll have sanity.

Cheers
Alejandro

