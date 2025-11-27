Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14194C8E8B1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173915.1498904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcIC-0003EZ-0Y; Thu, 27 Nov 2025 13:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173915.1498904; Thu, 27 Nov 2025 13:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcIB-0003Cd-U4; Thu, 27 Nov 2025 13:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1173915;
 Thu, 27 Nov 2025 13:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOcIA-0003CX-Ld
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:44:14 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272bcd1d-cb97-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:44:11 +0100 (CET)
Received: from BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 13:44:06 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::94) by BL1PR13CA0352.outlook.office365.com
 (2603:10b6:208:2c6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.8 via Frontend Transport; Thu,
 27 Nov 2025 13:44:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 13:44:06 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 07:44:04 -0600
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
X-Inumbo-ID: 272bcd1d-cb97-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaR9pBrEK9FRfh9c6+J63+hw6+lauXxt+7xbcPynZ6kYEk/PmNmSQc3Sv05UD7J6dx/HkJ3Gx7Meo/MdGkvNWG0viIe7ep+Ft1ubMXAfqdXmE78+CYP3uX8dFUFLDHvGwq6J2E45TSXZOstoftHfYHayHfWbtSizZ4iZIi+x0AEoEoj9W2eiPR70tmhdwp3yXa+bs3LtfVYv8W7NWrVwEGKT08aiYbfk+76m38+hdGgOAl9pp3Up/e6tiagGZwZAK/rnKGLhgcdvLh8t4WXofVSHcyqeBoJbotCnN5ct8FU4jJlMX9Eepz3LNUK3HYHmAtgN9jbGI5s9wunJNxWTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5Od9bg8JtiOFmHtfyA5PxGlZBy+yYNjw+KVVj3Rhao=;
 b=eDS/KBYVMryzpSTwLcIkmRAzuCUs4l8MVo8jg9D6xL8oGCmo4wQEHHJpcg/mt2U4rNJsa4n5kn/zddPW5dciP7j3j1sdEaC0M0I/WLSnOzcxlY5zLVXH+Eh41tMRqe6f34SWfK6JFpa3Q8SmOoAxu6ntdRPfr6YHq6bgLpshMvwwyKTtu+3qCF04LoKaruunlpYCd1xMddbAoA/W3qRzOGuhkazqG2ZFETUDLnAF2MhHaBJ+QYVjBDkRmQE7R3xXlY2dv5vDZVewLGZHsJ2l1lilDg5NbLNdDMiMqNupIO/qCL4oV9seXZQ2TFZCRD/BTEf20CuP0SrvWj7QVSIbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Od9bg8JtiOFmHtfyA5PxGlZBy+yYNjw+KVVj3Rhao=;
 b=kyYpVHr+AgwkU+DKIdqRneDiYdZiYS3AU8545gB6nn6B4Wd6BY//zEttkUkODKI+r+BNQFvMNXarOGQXOXrpQFj8L/i8IklyCjrVCSneNRc/2qA94rwa84J86Fdj8IOtNCVlGKWc3djpED3G6mjdYhKbCRLKySQGDA0AzDWwOGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 14:44:02 +0100
Message-ID: <DEJISRV113CH.PGYQKBCR6OMZ@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
 <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
 <DEJHD0L6BMLD.1IWHHEXGAHH4I@amd.com>
 <7cbca09d-919f-490a-9b68-26a466c84831@suse.com>
In-Reply-To: <7cbca09d-919f-490a-9b68-26a466c84831@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1cf2c4-1b8b-435c-bfcf-08de2dbb08bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmV4cTNReXNYbkx0RllJa09RTjlkR2toRkp6dTF3ekpMNlZ4R05TYmM3Q0VB?=
 =?utf-8?B?UktXUWoxeFpkQjJyNWtjc0RGWTRSVVpNbUtGRTUvcXJ5R3V3K09xOENnOEtX?=
 =?utf-8?B?RHp3ZVRaaVBqUTRIR0JZcVFFc1AzNXMweTJNTDlleUdhb2d2K2p5c1ZLdjlu?=
 =?utf-8?B?LzE1SDNways2MVBhVFh6ZEJKeTBPTy9KVDNoMStGd2FteEtEcC8wZjQ4VlVL?=
 =?utf-8?B?bXI5U2VNRGRqSWIvMktwb1RQZjRzeWlPZ0Y5WlNrT1VkUENxRWowYkZJdm1D?=
 =?utf-8?B?U2IzM1lCbG5TY1lNYUxPd2VZVTgxdEM3RHp2Z2NQejNWeWpLeXJ3amR6NGJ1?=
 =?utf-8?B?bHEzdWNnajZZc3pzL2lsLzVpZ1RCdW55aEdZZFZZTTNPRGk4ZjBZS1Zza0o3?=
 =?utf-8?B?dVdZMEJFNkk3S2NOMm5YMlU4bWFHT0JLcjJ1MTJpUndpQXFmRlA4dzdUaWMw?=
 =?utf-8?B?bkhZdTlObU5qYXhPWXNpVzdXMGh0YVg0eFhYYU5zMFpwbXNPclZVd214QU9m?=
 =?utf-8?B?aEZJZWlNblovdjFrb0hIc2lWakVtcStpM2xFTVUzQnN3aDRFQzF3UFlJS1A4?=
 =?utf-8?B?UjdQeVV1aDQ0bGRWRXBCUW9jSDFlcXNxTXlSaHVZZ2lFNlZNRys0blExQ000?=
 =?utf-8?B?d2lPY2V0QXN2bk1BTmVYMU5Od2JnR21FRDNWYTU2NU5QU2YrWi9NNktXYi9G?=
 =?utf-8?B?M3NOQXY3ZURkK0l4eHJIT21QS2hwclRic1MzTlRzWi81aFBhTXpmeW9RUEtS?=
 =?utf-8?B?bC9zUXV2YUFiU29wN3pJVEZUakc1dXV4WVlFbSsvTVZEOWpmSTE4WFZPZ29y?=
 =?utf-8?B?YzhOMGduQkpidlNaS3RLU1ltTzhrT1pxTDZxb2ViWkxXS3piejFCUGxkZ1No?=
 =?utf-8?B?SUJ6VlhpSkRqdGUrTENycWhXNnlMNXZiU0luM3J2ZkVNVUlWalEySDArVE0z?=
 =?utf-8?B?VGE1M3NJVlllMXNNeFVtVlZJbTJseTZnTlA3M05MOXRJc0pTVnZHV002aDdL?=
 =?utf-8?B?R0ZHeG51RW9uZjlSTHlnYWJSNys3dmhtNGM2a1ByNDBySURScS9NWFpha2xS?=
 =?utf-8?B?MEF3L0hOUkZtUHlheUdEQm5Ob0dOanAzNDRBZHdYWCs5cEU4YWlaeENpbi9Q?=
 =?utf-8?B?YnBlK2xvK2xoNFBGL0I1dW03MTZKYkF5OVBubWlOZnNwV0tlWmR0SWVjbEFz?=
 =?utf-8?B?ZDFMMjA4SnJ2aVpPWFh0QW53OElrczM0WjdTRkRJMVM2Tm5TZFJQbEprSVJL?=
 =?utf-8?B?ckpHSUoreExlRDBoQzdRWXVoQTNuYWFZaXNuWFhOTnVIMzQ3THJhbkE5cjEy?=
 =?utf-8?B?M0FmV1YySmxyVlgzUXAzc3JTMXgvenFoazhjYUFxTzRhNHhIUGI2L1RjZnN2?=
 =?utf-8?B?RURlRGY5bnlnUHBLQVNlNFpuZWN3OXZ5ai9HMzEwZ1Rta0pGbVFEU3VMVzBC?=
 =?utf-8?B?bUhDNFo2Q0N4MURSdzVCMUthdmREa1dHNlphcVJiNFlIMlI5QSs1L3lHMnFi?=
 =?utf-8?B?TFBrK3U0TW5KNjBBeUo1eU05eUt0TVR2WXA1RTVhdGNQYTBNa0xNWFRhQk5w?=
 =?utf-8?B?cC9UZDNzcXZuZUhYc1JheklMSGFCZGdBemJXNWpIOWhWZ2FBVmpyNDkxRGJ6?=
 =?utf-8?B?bCtKY2ZxYjRtSnMrbHhQcFJxUVFNRTh3NnhGMGlGb1pRTGtiV3BJTzRSb045?=
 =?utf-8?B?S0ZpdHZzbzJpMW5kMVNlVHhjUG5uVUhodmpBa0lzRlNRMnNtSmVaMG9wTElP?=
 =?utf-8?B?RWpmWnplMHpZNHhpTjhFWXdyL0RIbkMzZUdFZzUrMUlkSTFaVmFwcXRhUTQ5?=
 =?utf-8?B?Z1Zrd3RtUHplSzRJZG0xTkZDSDE0cTlObU4xRUwvMWJuWjJYQ2c4MmdYd3Vk?=
 =?utf-8?B?Q1R6VWF6NVFGUjBTb0ZrbzBxNWI0T1ZtRUcwRElRN1dmcFpLbVlxZGN2M2RU?=
 =?utf-8?B?OE0xOFJ1RTQzd1ExN0ZVZnRyeGJHN0syWnZtYUovcWwwMTB2cG1zYmkwRks5?=
 =?utf-8?B?Y3Z1azdqQ0dQTU01S2UwSXRxc1pDNlo3dXdzYXFVVWF6QlJ5Y0o0ZE5rWlJ1?=
 =?utf-8?B?Uk9KSzZvWHZwejdwTWNaMS9Ybml6aUZtNTZMWHU3WnRVU05ud3l5TEpIQXhM?=
 =?utf-8?Q?K1wM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:44:06.1659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1cf2c4-1b8b-435c-bfcf-08de2dbb08bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

On Thu Nov 27, 2025 at 2:19 PM CET, Jan Beulich wrote:
> On 27.11.2025 13:36, Alejandro Vallejo wrote:
>> On Thu Nov 27, 2025 at 10:43 AM CET, Jan Beulich wrote:
>>> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/Kconfig.cpu
>>>> +++ b/xen/arch/x86/Kconfig.cpu
>>>> @@ -19,4 +19,49 @@ config INTEL
>>>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>>>  	  must be enabled for Xen to work suitably on Intel platforms.
>>>> =20
>>>> +config HYGON
>>>> +	bool "Support Hygon CPUs"
>>>> +	depends on AMD
>>>> +	default y
>>>> +	help
>>>> +	  Detection, tunings and quirks for Hygon platforms.
>>>> +
>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>>>> +
>>>> +
>>>> +config CENTAUR
>>>> +	bool "Support Centaur CPUs"
>>>> +	depends on INTEL
>>>> +	default y
>>>> +	help
>>>> +	  Detection, tunings and quirks for Centaur platforms.
>>>> +
>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>>>> +
>>>> +config SHANGHAI
>>>> +	bool "Support Shanghai CPUs"
>>>> +	depends on INTEL
>>>> +	default y
>>>> +	help
>>>> +	  Detection, tunings and quirks for Shanghai platforms.
>>>> +
>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>>>> +
>>>> +config UNKNOWN_CPU
>>>> +	bool "Support unknown CPUs"
>>>
>>> "Unknown CPUs" can be of two kinds: Such of vendors we don't explicitly=
 support,
>>> and such of vendors we do explicitly support, but where we aren't aware=
 of the
>>> particular model. This needs to be unambiguous here, perhaps by it beco=
ming
>>> UNKNOWN_CPU_VENDOR (and the prompt changing accordingly).
>>=20
>> Right, what I do in this RFC is have compiled-out vendors fall back onto=
 the
>> unknown vendor path. Because it really is unknown to the binary.
>>=20
>> I could call it GENERIC_CPU_VENDOR, or anything else, but the main quest=
ion
>> is whether a toggle for this seems acceptable upstream. I don't see obvi=
ous
>> drawbacks.
>
> I'd recommend against "generic" or anything alike, as it'll rather sugges=
t any
> vendor's CPU will work reasonably. I'm fine with "unknown", just that the=
 nature
> of the unknown-ness needs making unambiguous.

Got it, if UNKNOWN_CPU_VENDOR sounds better I'm fine with that.

What are your thoughts on the panic-on-compiled-out-vendor vs use-unknown?

>
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x=
86 * c)
>>>>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>>>>  }
>>>> =20
>>>> -static const struct cpu_dev __initconst_cf_clobber __used default_cpu=
 =3D {
>>>> +static const struct cpu_dev __initconst_cf_clobber default_cpu =3D {
>>>
>>> This change isn't explained in the description. __used here was introdu=
ced not
>>> all this long ago together with __initconst_cf_clobber. Maybe this real=
ly was
>>> a mistake, but if so it's correction should be explained.
>>=20
>> It wasn't clear to me why __used was there (I assume it shouldn't have b=
een),
>> but it definitely clashes with the intent of having it gone when UNKNOWN=
_CPU=3Dn.
>>=20
>> If __used was misplaced to begin with I'm happy to get rid of it in a se=
parate
>> patch. I don't think it warrants a Fixes tag, though.
>
> I can only vaguely reconstruct that it may have been put there so the
> .init.rodata.cf_clobber entry wouldn't go away. But as long as the compil=
er
> also eliminates the function pointed at, that would be of no concern.

ack.

>
>>>> @@ -340,7 +340,8 @@ void __init early_cpu_init(bool verbose)
>>>>  	*(u32 *)&c->x86_vendor_id[8] =3D ecx;
>>>>  	*(u32 *)&c->x86_vendor_id[4] =3D edx;
>>>> =20
>>>> -	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>>>> +	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx) &
>>>> +	                X86_ENABLED_VENDORS;
>>>
>>> May I suggest the & to move ...
>>>
>>>>  	switch (c->x86_vendor) {
>>>
>>> ... here? Yes, you panic() below, but I see no reason to store inaccura=
te
>>> data when that's easy to avoid.
>>=20
>> That's intentional. Otherwise further checks of c->x86_vendor in other p=
arts of
>> the code may not go through the same branch as the one here.
>
> Hmm. I would kind of expect x86_vendor_is() to be capable of dealing with
> that.

Sure, but that's not done until the end of the series. and otherwise I'd be
introducing the fallback behaviour in some places and not others. I could
remove this AND at the end. Or remove it altogether if we go for a panic on
compiled-out vendor strategy.

Cheers,
Aljandro

