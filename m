Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4DBEA3FE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 17:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145278.1478353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mlL-0002mA-Uy; Fri, 17 Oct 2025 15:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145278.1478353; Fri, 17 Oct 2025 15:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mlL-0002jl-S8; Fri, 17 Oct 2025 15:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1145278;
 Fri, 17 Oct 2025 15:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pBh=42=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v9mlK-0002Ua-E0
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 15:53:02 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5792bd3f-ab71-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 17:52:54 +0200 (CEST)
Received: from DS7PR03CA0313.namprd03.prod.outlook.com (2603:10b6:8:2b::18) by
 SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 15:52:49 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::b5) by DS7PR03CA0313.outlook.office365.com
 (2603:10b6:8:2b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 15:52:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 15:52:47 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 08:52:46 -0700
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
X-Inumbo-ID: 5792bd3f-ab71-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwsO8/4VVesGHWumvjGSRTfKge0tl83Nj53m2/MQ9uh8iUeKgq8Pj+1vnt+Ag1R+6Ejkw+aBzJcslI00Ujbw9xKUgFos3T/bQmr8xEMzJ2plbN4afz61JAt1fjJxGK01azVtqtuINhZblC4oaewCN+3QdefAHjbcIpwXxkKPAqlpum9FKDlWub3fCP1/WisXB5vJb5crQ4zQuac9030ljk0uqQ9rJYbY+X0P64DtZoKKe2qcxuGMW2WckD+nUAZer0X44VJHD2kjpe58+TYw+Uxl5HgPzEG59FrABx/sBZLzswXbZFOd+pvbKiw2JOZvUQUaCn9H2GJXP0MDs5l0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFLwtmkAbVm8lHlRmdgUQhQ19QIEqDTNcq/B0nh31qo=;
 b=gR7mzUkDpvtEXxVU8QciPxKz5m+ntG2kpx5I2u2fuRmmheA2Q542L06CADhVdR1gm7FfsNkzSaN6Xjg2AjcH3NZg7YX0AKf86+FzOZs2UFK1RLurduXrDtMaqoczm3gs4o3W8jBkfWs+01z3ITkcXZ4ugu5fVrDONe1IJiwpxO5iekuZ4lEEodg1SLjEUAIhEQ2fHbsMZfycx3E5OsLvOvUcrIhyNXFkYc7czahya+RdN9UplCkPEqdHKg64ok62xIU4SljuFX8Cn603xymO5nyI8Qp9cDcah9bEqJimub25Pswhw4Mzo5lCREVa+9LNS0fYVvpS+/wUTtRMT0r+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFLwtmkAbVm8lHlRmdgUQhQ19QIEqDTNcq/B0nh31qo=;
 b=uBA3p1tVJC8gmazjn3ltKSIaNlHpbqozpNgToJYXVppXvNUh39NHyMRCqzJyykO3a0X1omsHkI8pvglQKNV+sH/8G6zrYqkcXCTWb42ks7ECC22qTPsvpHrhtxJtMA34EoW4xCDxABdjSUZawBlJl6TW73iYCBBpV51oQAlwVf4=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Oct 2025 17:52:44 +0200
Message-ID: <DDKPUZKA0UHL.2WRO9M23R4G3E@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] x86: make Viridian support optional
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>
X-Mailer: aerc 0.20.1
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
 <DDH3W3VM2ZDJ.PMFSGBWBTS0S@amd.com>
 <9248eda6-cf9b-4fdf-ab32-66e777585f65@gmail.com>
In-Reply-To: <9248eda6-cf9b-4fdf-ab32-66e777585f65@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e7b33b-1144-4b81-0563-08de0d953863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amVKTnlFSWFKbHlGK2pUU3czSDdmT1BQRm1hN25RZDJCRi9OMHFQSGFJVHZG?=
 =?utf-8?B?SzhvOE9SMXZpRE1YM29SRWlKbnV2MzN5ZWp1SnBFSG9MZ3I4VnRScFIyM0x4?=
 =?utf-8?B?bFFWcXMrRlc0eU4waEFGaGcvd2VzbjBwRzNBNTJVdG9Dc0hEK05ac251SVBs?=
 =?utf-8?B?QitnbmRvMnZSVDVsU3JrMzZET1RtUnhoQi9nczZrdXB5UndtTTdSMnFKbk1X?=
 =?utf-8?B?aEMwRUR5RFVKT2gyNmlYSmlRZmxtUGNUSVA2UTFtUFpUVjJDbDJ5WkJGeGQw?=
 =?utf-8?B?NzBrWlRyYVJTMm5JKzAwRXpKdjhKV05taVRTdUpzWkt3MHlyeGl2RzZXdlg2?=
 =?utf-8?B?VFR6SnI1Zm1YWmdJL1E0dnVoYkMzb1UrYWp0SHZhbW5hUWZRaEk4ZFUrMnlS?=
 =?utf-8?B?RzZVZzY3ZjJkdWVvTldhMWxWR3BjaWJ3S2RDQk5OeGluMEdrdWpwWEZiZjVm?=
 =?utf-8?B?dlhTQjZ4MDBGZW1KMjdIVUFEa2JNbkNzc3MvM2J5MUdmU1lBOHozUW5IMVE3?=
 =?utf-8?B?QW1zdEI3akFJTyszdXBBVGFyL3JuczRUcFJRNGY5SGxTYkJGd0pMcnl0QklJ?=
 =?utf-8?B?MFJWUVY1dWgzTERqQ2h4WXpXSGhMY25oU3l4VHBKR0Z0b25PdUhvcXM3RWcw?=
 =?utf-8?B?WXIyT0piVmpLOSs0TVhhbXA2M2xIVXJLVW5mOTQyWitiRXZlaSszbGRlSXJU?=
 =?utf-8?B?MGdtTHlvNlM5eGZxdGNWUXQ3RHlSVm92U1ZVV005a0pTT1ZyUjk5SVZGYzAz?=
 =?utf-8?B?dU15Z0M4cFN2aVNIUE5BdUtzQXV5OFNxamhKYnJtYWFNd25kUCtZZWl6V2Zw?=
 =?utf-8?B?ejQwRHhoNGc5UVFieTN5dkFNTTlIaXRMbnRSSGJxUjBwYXdDVW05S3k0Y1dG?=
 =?utf-8?B?UkE3REdPRnNSZzUvSkhCWFNIazJYTEdZb0ZkVVN6cC9Sc2QrS1hJZk9jRXR4?=
 =?utf-8?B?bW1RR1A4SEtzNHYzTWxkOENHMUFiNk1kaExZcHBxc0IrVzZWb0NtT2RCV1Ay?=
 =?utf-8?B?a2J4dGVYQmdDRzRSYkkyekxMU1RLSzNYMVpOZFBPVHZjdldZY21xR0ZCaStD?=
 =?utf-8?B?YjNjd0pGUXdObzJ0VUV2QzZHZThWNDlJaEhTMXEyZjZtVmp2VlBYZko3QlFr?=
 =?utf-8?B?OE91R3BxaWR1N3BONTk1Q2pKTFVEWHJYdEFFNGJmSndIWjhpZTlRT1NBd1hU?=
 =?utf-8?B?SFV3TDhBS3ViUndWV0gwbklrQVFCcS9hbGFhUG1uQm1RQXZ6LzRPaWZsQ1Ni?=
 =?utf-8?B?cDZSNmVoVDEzbVZYeEMyVGZSMGNWT0JaSEpIUllJR1FnTGRueGVzdjVuT2ta?=
 =?utf-8?B?bU04VjBvWVNQdm05ODRtN1F6bFhCSjFQbll1Ti84MzVXOEo5SWJObWg5WUYy?=
 =?utf-8?B?UFhyejNRWnkvT3lYNzErak56RS9JME1talV6Q2J0eFBvZjg2SHM1bzFkMXVM?=
 =?utf-8?B?RUNwZksyUmlidVREZStoSFowczFndlE5UWZhT3k2S0VuNkQreXdmY2VOamlR?=
 =?utf-8?B?eHVDZXRvUkNLNHBxaVpRT1VmRGkxYkRqdVRBS1lNRkV3dSthRS9sbGxXRE83?=
 =?utf-8?B?dUlwaVRIMS9qSWlLSnpmOVVva3NoWUR1UmZ3dDVvQjAvbzJEditSckpDc0hD?=
 =?utf-8?B?cFk4d3luSEc0cVRVNmxxSG9zUWFHNHRqWkxHZ1JsVmRQOWVJdGxocHprYjZo?=
 =?utf-8?B?V3ZMeC9FU1B6NWRmaC9BeHZ5c2VWZS9QLzVsbkNtOGpjYTBuSVh6aFFvVXZZ?=
 =?utf-8?B?amtqbWJ6NmFZMlpkVmlMK2xaYUU5YlFIdU1OSUVacDRzbXo3ZWp0K2JFVDAr?=
 =?utf-8?B?cGwzalgxYnZtNXR3dU81TmJIamJPay96TXUveWNnMlk3UkVOQWRkOTdVTUdG?=
 =?utf-8?B?WHE1dXZvQnNFNm1pK3ZuNVdvRy8rWG5zcFdZUng0Y0dtaG9qVUVPczB1dmNv?=
 =?utf-8?B?bVlsL0h5ZzdWVW1rVlVnT3BkSkk0a2llN3Q0SzVOeklZUXZuSllueWdKTll6?=
 =?utf-8?B?d3lpbTVEY0QwdlFXeFgrRVNzY0FVUldzd01VMjY5anBWdXlDM0J0b1JxWWlu?=
 =?utf-8?B?amJ3QXo4Yzhhc1NLU1pNR3p2SzVFU1RiWFoydGk3Q20vZ0s0bnRSRVRaQno4?=
 =?utf-8?Q?peGg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:52:47.9691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e7b33b-1144-4b81-0563-08de0d953863
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129

On Wed Oct 15, 2025 at 7:58 AM CEST, Demi Marie Obenour wrote:
> On 10/13/25 06:01, Alejandro Vallejo wrote:
>> On Wed Oct 8, 2025 at 6:04 PM CEST, Jan Beulich wrote:
>>> On 30.09.2025 14:52, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/hvm/Kconfig
>>>> +++ b/xen/arch/x86/hvm/Kconfig
>>>> @@ -62,6 +62,16 @@ config ALTP2M
>>>> =20
>>>>  	  If unsure, stay with defaults.
>>>> =20
>>>> +config VIRIDIAN
>>>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>>>> +	default y
>>>> +	help
>>>> +	  Support optimizations for Hyper-V guests such as faster hypercalls=
,
>>>> +	  efficient timer and interrupt handling, and enhanced paravirtualiz=
ed
>>>> +	  I/O. This is to improve performance and compatibility of Windows V=
Ms.
>>>
>>> What is "paravirtualized I/O" about in this context?
>>=20
>> Hypervisor-assisted IPIs, TLB flushes, etc. Or so I understood back when=
 I said
>> that looked ok. I see there could be confusion with Xen PV device protoc=
ols,
>> but as far as the user of the help message is concerned it makes no diff=
erence.
>>=20
>> One could even remove the examples and leave it as "... for Hyper-V gues=
ts. This
>> is to...". They are truly inconsequential.
>>=20
>> All that matters is that (modern) Windows won't run without it, and that=
 it
>> provides some indeterminate hypervisor-provided assists to try to reduce=
 some
>> virtualization overheads.
>
> Qubes OS doesn't expose Viridian at all, which is why it wasn't
> vulnerable to XSA-472.  It still runs Windows guests just fine.

Can you run Windows 11?

I don't remember which, but I do know some versions of Windows refuse to bo=
ot
if they determine they are virtualised and don't see the mandatory parts of
the TLFS.

If 11 works, maybe Windows Server?

Cheers,
Alejandro

