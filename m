Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1EB161C3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 15:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064014.1429763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh79W-0006d2-FM; Wed, 30 Jul 2025 13:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064014.1429763; Wed, 30 Jul 2025 13:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh79W-0006a6-Bk; Wed, 30 Jul 2025 13:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1064014;
 Wed, 30 Jul 2025 13:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rpg=2L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uh79U-0006a0-MY
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 13:47:28 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2405::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b97bbe84-6d4b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 15:47:26 +0200 (CEST)
Received: from DSZP220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::16) by
 DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.11; Wed, 30 Jul 2025 13:47:22 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::64) by DSZP220CA0009.outlook.office365.com
 (2603:10b6:5:280::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Wed,
 30 Jul 2025 13:47:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 13:47:21 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 08:47:18 -0500
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
X-Inumbo-ID: b97bbe84-6d4b-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG1tuv9qtx8zC+aiEVmMIL1L0rri7qIG27UsYbwhbwUORgX0atjvQZd/TLRkjiifcC/fKhln09NAAO5lk/OrSboiO0s35YAletA1oDtrxA1ctkBp0fmNeiJoUl4cjWRpEK4rX95BWrujCS92F2TeMiLr4XJZjTjDuHgUYBH0H5/ww2uEbtbDaROzGdGNGEElieKVtHz8AVvk4NfkaPkabxIMLNSiCWB2mrjYGH/axKfLA/nHLJmsKYUQIIaox4CiUhS8Vst5LaU7SaconLbAqrkk5Q24YS/4Kg8cCmo9rCaB2JTLArDaxn4Y34xlbjcsxJcti2Tx1b5SZ0uAVIhd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyZ3SOKwmvmlKCFsKJAMHjaB7frtjXxXE7Q2lf9jVsA=;
 b=CTWY6IQMNlz+IDVWF6WRfY2YlhBjm8ihIXN9C/lhau0DP7waVQ5y14e0unDvdVchgidlmpfu+yR+kIWofQjhNWhOIxwHPmd+O6iP2WwioiNxSEzUe+dDj7usZbqHVmTiBwKlGNphCT8lclzjPgsYRezbY4LEst2t8Y38FCGkICMzkvyzEX8Wna8CQEyrcZyvY/bOGFyuMmjzY03YCBxfWeoKO4a1vmdwhA/Xc6JN9/IDkPQUKSbcvCKPApPe+PCi79mAonjlxUe66RMAHALigdRxENuHK7LKqyE1xle6z7B39gjbPuYAdkQcyDMAKV6waTnA1WoBKYjasvfyGPAE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyZ3SOKwmvmlKCFsKJAMHjaB7frtjXxXE7Q2lf9jVsA=;
 b=tM3i71IhFH7D46i9IrtrBLZlFumNWdk2I8pJ2CTslXNHZACRHuAw3Mm4ejJVkimuDJkJ0bFneNMt3OeA24QomrE6/AF9Mq9tZBqfu9GkDv7Atk6Ysi9iZJgeDoOf9fJegmsOObU6wn4aUkmFbDwsuGlk5pPhNXRlITiZZlSJpG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Jul 2025 15:47:17 +0200
Message-ID: <DBPFPW2THZSB.1GDK6VN4LFHTQ@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local> <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
 <aINi024baOV5LQgn@macbook.local>
 <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
 <0006e9f6-49af-4aef-b680-2042fb0d5213@suse.com>
 <DBPAN1UFFCVS.3BUNHPA38O4NU@amd.com>
 <1eacbe00-b285-4071-8b16-d970c91af8e1@suse.com>
In-Reply-To: <1eacbe00-b285-4071-8b16-d970c91af8e1@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: b557e40b-0255-42c4-b4d3-08ddcf6f9b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC8yQnoxMW5PRURsQk5BRGc2RUx6TG9KYzc1VFU4OUhObndHN3kwRWpIVFUx?=
 =?utf-8?B?UFBNcnBHb2xYQlc3dFFXb2lSd2FGZkV0bVM5bUtSbkg4ZGJQT3NTQThISWJa?=
 =?utf-8?B?LzhIc0RBTTl1Uy9mOVcvQlJaeVdSUGdQTGlYTVp4WEUzQ2dJbnJrK1BKd2th?=
 =?utf-8?B?cWRmeCtvai9zNFNFem5KWUVFZ3hyb3pFMlh3Z2FOcUd3VFY3c1dnUzlYdlM5?=
 =?utf-8?B?cGo3L0xtcngzS1RrcnYyK3QwWnRuTWFHT0hobjVraUlRNWVFTlUrTjRTd3pN?=
 =?utf-8?B?ZXVwZVAzL3cvMjNNa3kxQ3M0cDFUTU9KTlpMN3VRSktFd0VGZjQvbElKYWNL?=
 =?utf-8?B?V0JDQVg5bVZDUDY5dE8wOHNzbExQb0VmMTFUOFNQZGQ5aXl3SUczQUREL1ky?=
 =?utf-8?B?dHZKMnkwR1BoU3FjMEZqRlRFTEUxQXpqTHJhSW5lNE8vcE1TZzd6bXJBRzJp?=
 =?utf-8?B?eG84em95TXo2QS9pMWhhTXNPMHp6VzJsTjdMdjRrREZaRHhuR0dGaGx4Qjlo?=
 =?utf-8?B?aTB5UFdVLzI5bVdrdHY0NjdkVGNITU5Oc3NqWW5nZ2UwTVo5NithQ3lVQ1o1?=
 =?utf-8?B?YTl1eWJIODc2dmhFOFNENG0xaVhLQW96Y0VuY3JZVFlNdmlwYzdmTnJSbTBX?=
 =?utf-8?B?aUNmeWNXM25RekdDRnFrRE5DcUNBUmdrSVplajg3NW9NeUlXS3NoZ1JPMmt5?=
 =?utf-8?B?VDROVC90YmNOQ1ZYZit4NjlJSThjR04xZGU1Sk5kTE56YkEySmt6dTA3RCt0?=
 =?utf-8?B?ai9GYjZ3bi9rNERLdHZ3NUR4cmRabXpKV3c5bXdzYVM2cWh1ckZwV1d3Q2k2?=
 =?utf-8?B?SXNlTyt2Z3pDUk1HdEo4b0lQdExGWUh5bDFaZDBVRHFIWWh3T3IvbjVIL3VN?=
 =?utf-8?B?QTlHb1BWM0h5THhFc3BpT2VBMXNQU3FFaHlIYy9LOU9Oa3cyNXNERzhGcXhh?=
 =?utf-8?B?QnBzbEc2K3NBT24ySGtUWnQwR0duQWp3RnJmMmNBYWpSV1d2emhTbTVDcDJK?=
 =?utf-8?B?WXdVam8xWjZub0NXNlQrRm0wMGE0aWQxN09zSGxPY3B0K2xDUWQ3RTRXbXRz?=
 =?utf-8?B?TWNIWUtEUGFuZkx6NjRqd2JrNDh2M1Vrc0NtQVlKSUM4VjVyMHpEdzY3YjlF?=
 =?utf-8?B?VUhyTW9vV0VscjFla1dybWVxdGg5WTZTU0wvVnMxdGc5TnVrOTVDbFRES3dD?=
 =?utf-8?B?bXNlNldQL1dGUXFXK0tLWnJWSUNOZkUyc0FveFJTRS9WNTFyRCszQVFUTGdV?=
 =?utf-8?B?Rk85K1ZxWVlSMnVXdTdjYmtkZ0k5cTdUajNwMU4wOWlZaVI5MDcyZFdOSnY5?=
 =?utf-8?B?V0c2UVdUUDJpV1g4a2lzMzROb0ljenUyTVRLOE5JeWNpc2JKRnZ5NXJZbGpC?=
 =?utf-8?B?Zi9CSGcrZHo5Z25RczQxUVhyUExVbHdrcFh1dWZBRFRIT3JjZGw1dmQ3dEk0?=
 =?utf-8?B?Vms0a2loaWhKSmhFTFZ0RjcyeDZBSVhqYjB1WjNIQkluNkViRVhWQ2c5cUgz?=
 =?utf-8?B?Y0UxNFE4UUgxdTY5d1NKZjMrcmZQWEFMa3pYc3ZUelQrSnVjbVU1MFU5NktT?=
 =?utf-8?B?Q1BxdEV3cWxGcGtwUU9xUmgwS0lVMk1ING9Ua0ZmMVBiVWx6TnlOczVSRDM0?=
 =?utf-8?B?YTYrMVliTCtWT2phUXl2ZWRvcm1mRUpnVXpDUTJaMkhRaVVId1hrVzVqNW9G?=
 =?utf-8?B?MlNsTWVGM1RZOEhxVnZyNnFvQnpWUndkaFBLd3k1SVRzYTE5bEJWdzRGckpi?=
 =?utf-8?B?MWFTaVJsQ2UwTlh5Sm90YzUxVDdodUN0ZWFVS2hLQjJlOHNHVGZVaEVta29l?=
 =?utf-8?B?NkNhcVYvTmZ4czFWZ2g4S1RpeS9YendQMEU5a3RRcGNUSXRWRnRSUHJNUDdU?=
 =?utf-8?B?bkxQM0k4ZDJtREZQRDkwaklQMS96TWY5VlNpNFBrVmVZTHpmem42MXkrb1hF?=
 =?utf-8?B?V29UcGNzaHJiaTNwcXlKVzdEWm1haWg3dERKK0VLSkhxblByZGtEckttTVl1?=
 =?utf-8?B?V2QxM0tuZ3pZT2M4anBKeStzN0hYRU9MZjQxVlRSVHg1WVNtU2FDaXlYNmFs?=
 =?utf-8?Q?d1j1Go?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:47:21.3274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b557e40b-0255-42c4-b4d3-08ddcf6f9b87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741

On Wed Jul 30, 2025 at 11:58 AM CEST, Jan Beulich wrote:
> On 30.07.2025 11:48, Alejandro Vallejo wrote:
>> On Wed Jul 30, 2025 at 9:48 AM CEST, Jan Beulich wrote:
>>> On 29.07.2025 23:29, Daniel P. Smith wrote:
>>>> On 7/25/25 06:56, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
>>>>>> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>>>>>>>> Later patches will keep refactoring create_dom0()
>>>>>>>> until it can create arbitrary domains. This is one
>>>>>>>> small step in that direction.
>>>>>>>>
>>>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>>>>> ---
>>>>>>>>   xen/arch/x86/setup.c | 3 ++-
>>>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>>>>>> index c6890669b9..6943ffba79 100644
>>>>>>>> --- a/xen/arch/x86/setup.c
>>>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>>>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(str=
uct boot_info *bi)
>>>>>>>>       if ( IS_ERR(d) )
>>>>>>>>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d)=
);
>>>>>>>>  =20
>>>>>>>> -    init_dom0_cpuid_policy(d);
>>>>>>>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>>>>>>>
>>>>>>> You possibly want this to be:
>>>>>>>
>>>>>>> (d->cdf & (CDF_privileged | CDF_hardware)) =3D=3D (CDF_privileged |=
 CDF_hardware)
>>>>>>>
>>>>>>> To ensure the contents of dom0_cpuid_cmdline is only applied to dom=
0,
>>>>>>> and not to the hardware or control domains.  I assume it should be
>>>>>>> possible to pass a different set of cpuid options for the hardware =
vs
>>>>>>> the control domains.
>>>>>>>
>>>>>>> Thanks, Roger.
>>>>>>
>>>>>> Why only a hwdom+ctldom, surely a single hwdom should get it too.
>>>>>
>>>>> hm, not really I think: a late hardware domain would get any custom
>>>>> cpuid options from the toolstack that created it, or in the
>>>>> hyperlaunch case from the provided configuration, but not from the
>>>>> dom0-cpuid command line option I would expect.  Otherwise you have tw=
o
>>>>> different sources of cpuid options, the inheritance from dom0-cpuid,
>>>>> plus whatever is provided from the hardware domain configuration.
>>>>
>>>> Yes, this has been a sticking point for me and never got any good=20
>>>> answers thus far. Should the dom0 related xen command line options onl=
y=20
>>>> apply when not booting via hyperlaunch. If the answer is no, then you'=
re=20
>>>> in this area with some dom0 options that really are applicable to hwdo=
m=20
>>>> vs ctldom and vice-a-versa. Some could even be suggested to apply to=
=20
>>>> both. And then, I don't believe there really is a consensus one which=
=20
>>>> options apply to which domains. Over the years working on this, I have=
=20
>>>> been an advocate that commandline adjustments allow for quicker=20
>>>> troubleshooting by the user/administrator.
>>=20
>>>> In the last version of the multidomain construction RFC, I am growing =
more
>>>> and more to advocate for my initial proposition, that dom0 options onl=
y
>>>> apply when not using  hyperlaunch.
>>=20
>> I agree. It simplifies everything a ton, and it's far less confusing to =
know
>> ultimate settings, which in a predefined initial system definition is im=
portant.
>>=20
>>>
>>> With the hyperlaunch plans, is there something that's still properly
>>> "Dom0", perhaps under certain conditions? That (and only that) is
>>> where I would see respective command line options to apply. IOW no
>>> more than one specific domain (i.e. in particular not to both hwdom
>>> and ctldom, when they're separate). In cases when respective options
>>> are entirely ignored, I think some kind of warning would want issuing.
>>=20
>> The problem is that lines are blurred. A ctldtdom + hwdom + xsdom with d=
omid0
>> is clearly a dom0. Is it still a dom0 when there's no xenstore? What abo=
ut when
>> it's not privileged? What about a ctldom + hwdom + xsdom with domid3? Wh=
at about
>> dom0_mem options when some domains have already been constructed and ava=
ilable
>> memory is less than total host memory?
>
> Well, this is what needs determining before we actually move in any (uncl=
ear)
> direction. And we need to keep in mind that people used to infer certain
> things from domain ID being 0.=20
>
>> Also if a domain is or isn't dom0 depending on whether a certain other d=
omain
>> exists makes things confusing. You have a DTB+commandline and get a beha=
viour,
>> then add a domain and you get another behaviour on the first one, even w=
hen you
>> didn't touch its configuration.
>>=20
>> My general view after a while experimenting with the full series is to _=
not_ use
>> the dom0 command line, as Daniel mentions. The simplifying effect of not=
 looking
>> at (e.g) dom0_mem is staggering.
>
> Which likely would imply not to create any domain with ID 0.
>
> Jan

I'm currently of that opinion as well, but that doesn't preclude that the
codebase must stop assuming there _is_ a dom0. There might not be any, or i=
t
might not have domid 0. The scheduler, the io bitmap setter and some late h=
wdom
code still assume domids.

I have some patches to fix at least _that_ side of the situation, but I hav=
en't
had time to test them in any credible form.

The fact that dom0 construction logic should not be looking at opt_* variab=
les
still stands, IMO.

Cheers,
Alejandro

