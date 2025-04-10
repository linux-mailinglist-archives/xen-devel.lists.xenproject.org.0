Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD0A84C13
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 20:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946176.1344155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2wdQ-0001HG-RK; Thu, 10 Apr 2025 18:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946176.1344155; Thu, 10 Apr 2025 18:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2wdQ-0001F8-OT; Thu, 10 Apr 2025 18:28:20 +0000
Received: by outflank-mailman (input) for mailman id 946176;
 Thu, 10 Apr 2025 18:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2wdP-0001Ey-PS
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 18:28:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91b5dcd9-1639-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 20:28:16 +0200 (CEST)
Received: from SN7PR04CA0116.namprd04.prod.outlook.com (2603:10b6:806:122::31)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 18:28:10 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::71) by SN7PR04CA0116.outlook.office365.com
 (2603:10b6:806:122::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Thu,
 10 Apr 2025 18:28:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 18:28:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 13:28:08 -0500
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
X-Inumbo-ID: 91b5dcd9-1639-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5ZZKz8Filimjfvy6E37izUglHMv1fPjBkoIBmtyOxdHcdtakQ5Vgl+mb47M/oRTcsl5XMo0vud3ILlxUQlr/RWE/VH2VKczA6C9pqIvoWv+2JhQSceAwFCEfon0dckRMhDn1faqpMChvPA5obf0JMwA9DDe6bniPSoDHddgkGYbRycEFqsI6nWQVgFVC6dW4ZOg6wiVydPW6vnTPt+teO+k0VUWubTXwC1VHhLbmxT/hGXI6btINZNi2LCR257cHDG56rciH2269AVUs7ETS+yDlrgs1OeLH/8n/GnCsyX4v5fCx66trT3gIrDX+lWUcJBd+sThuhvF9Z/9SIhm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJlZBkoz+InmaXmYN/Ffzi81Ixt5jr7Ou6i6yo6gCs8=;
 b=u3gVRsaUxZkhbB7mkouTlkGTLJh6P4Q/djfWSrPtgqEIcsmgxiujBsVZXNV7T0G7oi7CX0urpRtfI1jFwPifh8cCPJCbPeC+yl6Rg2lCSpS14VSn5zjEvVtBXRox5p71rwkLimtrBBEVEUwICmh0lTRbr9E3rmD3hA5UitBUEY3OJDOsGZvkQ7aCuDl/m0eRuNzege/FdPBDug6kjA0pSpcLh/4cXsl6zhDI1Uwyml9dkUuNa7r/f6TawCtou7syX9G/42xkvhR4znU3jdLVC9DNauGNeDk+y+3g7tBTMTRWDQBaHJJQTkdE+D712BGTrAwFVTZJk5oCdXDg3QU3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJlZBkoz+InmaXmYN/Ffzi81Ixt5jr7Ou6i6yo6gCs8=;
 b=tTgD3gkUmVjOXKjvelrmtUA5SRI0brhWlF/CODRZA0SXoxLbyuMzTG8Xb0WgDhOOT1CpD6ZqopHhD4jzUjpH65ifvmOQ/8WzGpt/DdFtOG439vUWiB+9If4gcfyXHkUND80zdof8ZISbGFPDfs/osSMKjCsy/zqMKb2MgApBqNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 19:28:06 +0100
Message-ID: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
 <5da1f4ec-43ca-4279-88dd-b51d57b306e4@citrix.com>
 <D9360R5QOOU6.2Z9QQZYYJ5A6T@amd.com>
In-Reply-To: <D9360R5QOOU6.2Z9QQZYYJ5A6T@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff83f6e-b490-4688-8945-08dd785d7228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDhuRnlLMGJVZGdjcEpod2NmTmUwRjA4Z0lUbkx6bllMYjNxeVhFMUhTbFNj?=
 =?utf-8?B?bWw3Sk96TDRTaFNrQmVJcFZ0NjRPdmlIR2JuU0xyTFdkTEk1WnJHOUFsV29p?=
 =?utf-8?B?ZjdPdlNPVXFmVW5jWFZCVG8rYjZkVDZnZ1BPRWVYYzQ3bmhBbnhhUGNkZElZ?=
 =?utf-8?B?ZXN2TDRnbjBRWXdaZnljTDRyWUJFa2RtZUcrY3NvQnVGMGNITk51eEV4RWNN?=
 =?utf-8?B?aldwS0xxSVZyNUNtUDYxemlHenNpZzkyQVVYWU14b2RPSTNMMk82WnNoL2dr?=
 =?utf-8?B?VjJzWGNjYXQ0dVpPUVdPWFBrTWJhN285Tkx3RDdzbkVHdFduSWNRbGVmR1dB?=
 =?utf-8?B?WERwVzgrdmxVV3JTSnF0aWlDYStManhGb3d2Y205Nmc2MEtINjE5SkozNGxi?=
 =?utf-8?B?U0F3YXRGZDF6MWtROC9EMisweEw3OGNEekFRMWFQbnJCNzgrRTZGc1FGa21X?=
 =?utf-8?B?dVVMWGlta09tcmpwcGkrV3NVamsxeWIvZUFtV2kvbWp0RWV4Rm5zYWlrVCtJ?=
 =?utf-8?B?MG53Y1NOeWM1MnZBMGdGWnJ0K2hwMmpyd0M0ZnRWWm5GU002QndSMC9MQWFz?=
 =?utf-8?B?KytOUy9UTVdMUGs3d253WCtrY0E0Nk5teUM3VlNTQ01hQ3hERFlhSUpKcnFI?=
 =?utf-8?B?OTlJdmd5LzhKR2hxQlJwMlFrNDcwdHh0Tm95M0VqcGpmbGNPcU5McVlFZ0NK?=
 =?utf-8?B?TUpnMFZPdDhkMEE0WWI2TE5xSC9jbXV4ZmxkTVdMUU9jaGtpczFOS09GUHZ0?=
 =?utf-8?B?MkYzdTV5YnpGMVU4QWkvRHVlUHFXOWNHQWJrQTdqNVNmalUzSGFCaHpTaXhr?=
 =?utf-8?B?Vy9yaUNQU3BxUTVPaGoyZkw0YnBoYkFURVRZQXB3TUNkZVFwclJMdDdWSnpK?=
 =?utf-8?B?aGt4bittQmZDYVNaYU9uN0txblZhY25kVVAxalJkTkx2QjdEbGZXdnpENHdu?=
 =?utf-8?B?dThGcU83cFV3YkQ3NktDVmQrT3RyNjNlUkViVHJab2JoOUkyYUVKUUdDZDB6?=
 =?utf-8?B?ZWpuZ0g4dnhVNk5sZlNRSzhxOUFKN3QyaCtTd0E2bC92Rm5PYVlreUZGRzV1?=
 =?utf-8?B?L0RjZEVhUm1kR084M2hNMy9wWW84YnBnNVRIa0VjT1dwaTRtOWhpSXFGS2lq?=
 =?utf-8?B?V2d1d2EyaE9pK1piYngwRUFlbmc0bHJnRUFCV3RTTnhYWTNOSXZwM2F4dy9O?=
 =?utf-8?B?azNvWk5ucm1tamw0ZEZLWndsd3RSZ050LzNaNE5ZazFFZmk3L0hQRmdiaDB2?=
 =?utf-8?B?bzdkRnYzL00zdFZPbHNxNmNoYWxkQWFneU05aDFNNjFmNnhlSFNWS203cHlL?=
 =?utf-8?B?MGNLS1BmNWVLMmZvaXVZQ0dHWkd5S0UzQXEwdXF1UzFHTjRwLzJPcFd0ekFV?=
 =?utf-8?B?cUMvMGJTbUVkQmtsNFVOWmVTOFNIWTVOcU5TQXN4LzluNzU3Sy9zUmoxYWcv?=
 =?utf-8?B?QWFqYjRSOVMyU3NSSXFGcm11dkxrOTBhUUYrZ3JCMXlONWRQNWVyNVluQXNN?=
 =?utf-8?B?SWZPbTBTNXBjaXVMMHhJV3pab3l6NGgyZU1hNm9CMjlWQVpnVU5yZ1JDWGxP?=
 =?utf-8?B?ckYyeE1wQi83V1JNWnhNMTlnTWh3ZlpwTmhIUWhGSnZvM21pVGY5V2duYmNV?=
 =?utf-8?B?OVVzUEMwSUV3aHBkb2NjRS9iblpRZ1FSZ3lVaWNhWnNWQzdmL2ZOQ2Uwa3BF?=
 =?utf-8?B?eHVYOWdzRXN1NHhibEpTWmI1M01iMVBrVWh1S0Z1YjVVaEpVSWxEUTB5ZE5s?=
 =?utf-8?B?RE0yV0pOSGhUSXoxUHhFbE5IOGtjR1BNeDBOL0tlNDZ3M1FwT3kxNzdmWmRO?=
 =?utf-8?B?ekVDUk1DSXVrZHYzNFl2SXZZTk1XczAzblVXa0NOdHorZ0xHc1FzSDFEVkZU?=
 =?utf-8?B?d2sxZXhDejhHNkRTRXlJQU51cWpVc2Foc05mME83Si8vaDc3UWJzVk5LSHJU?=
 =?utf-8?Q?dE8JmnzilLP8hzQNCOMvGsTVweDqZ9AY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:28:09.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff83f6e-b490-4688-8945-08dd785d7228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972

On Thu Apr 10, 2025 at 7:20 PM BST, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 10:17 AM BST, Andrew Cooper wrote:
>> On 10/04/2025 1:09 am, Jason Andryuk wrote:
>>> On 2025-04-09 13:01, Andrew Cooper wrote:
>>>> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>>>>> Various bits of cleanup, and support for arm64 Linux builds.
>>>>>
>>>>> Run using the new Linux 6.6.86 on (most) x86, and ARM64:
>>>>> =C2=A0=C2=A0
>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/17606=
67411
>>>>
>>>> Lovely, Linux 6.6.86 is broken for x86 PVH.=C2=A0 It triple faults ver=
y
>>>> early on.
>>>>
>>>> Sample log:
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9673797450
>>>>
>>>> I guess we'll have to stay on 6.6.56 for now.=C2=A0 (Only affects the =
final
>>>> patch.)
>>>
>>> This is an AMD system:
>>>
>>> (XEN) [=C2=A0=C2=A0=C2=A0 2.577549] d0v0 Triple fault - invoking HVM sh=
utdown action 1
>>> (XEN) [=C2=A0=C2=A0=C2=A0 2.577557] RIP:=C2=A0=C2=A0=C2=A0 0008:[<00000=
00001f851d4>]
>>>
>>> The instruction:
>>> ffffffff81f851d4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f 01 c1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 vmcall
>>>
>>> vmcall is the Intel instruction, and vmmcall is the AMD one, so CPU
>>> detection is malfunctioning.
>>>
>>> (Early PVH is running identity mapped, so it's offset from
>>> ffffffff80000000)
>>>
>>> There are no debug symbols in the vmlinux I extracted from the bzImage
>>> from gitlab, but I can repro locally with on 6.6.86.=C2=A0 It's unclear=
 to
>>> me why it's failing.
>>>
>>> Trying:
>>> diff --git i/arch/x86/xen/enlighten.c w/arch/x86/xen/enlighten.c
>>> index 0219f1c90202..fb4ad7fe3e34 100644
>>> --- i/arch/x86/xen/enlighten.c
>>> +++ w/arch/x86/xen/enlighten.c
>>> @@ -123,11 +123,10 @@ noinstr void *__xen_hypercall_setfunc(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!boot_cpu_has(X86_FEATUR=
E_CPUID))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 xen_get_vendor();
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((boot_cpu_data.x86_vendor =3D=
=3D X86_VENDOR_AMD ||
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boo=
t_cpu_data.x86_vendor =3D=3D X86_VENDOR_HYGON))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 func =3D xen_hypercall_amd;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (boot_cpu_data.x86_vendor =3D=
=3D X86_VENDOR_INTEL )
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 func =3D xen_hypercall_intel;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 func =3D xen_hypercall_amd;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_call_update_early(xen=
_hypercall, func);
>>>
>>> But it still calls xen_hypercall_intel().=C2=A0 So maybe x86_vendor isn=
't
>>> getting set and ends up as 0 (X86_VENDOR_INTEL)?
>>>
>>> That's as far as I got here.
>>>
>>> Different but related, on mainline master, I also get a fail in
>>> vmcall. There, I see in the disassembly that
>>> __xen_hypercall_setfunc()'s calls to xen_get_vendor() is gone.=C2=A0
>>> xen_get_vendor() seems to have been DCE-ed.=C2=A0 There is some new cod=
e
>>> that hardcodes features - "x86/cpufeatures: Add {REQUIRED,DISABLED}
>>> feature configs" - which may be responsible.
>>
>> 6.6.74 is broken too.=C2=A0 (That's the revision that the ARM tests want=
).=C2=A0
>> So it broke somewhere between .56 and .74 which narrows the bisect a lit=
tle.
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/17613237=
74
>>
>> In Gitlab, both AMD and Intel are failing in roughly the same way.
>>
>> ~Andrew
>
> I've bisected the tags and it was was introduced somewhere between the
> v6.6.66 and the v6.6.67 tags.
>
> The hypercall page was removed very shortly before v6.6.67 was tagged,
> so I have a nagging suspicion...
>
> Cheers,
> Alejandro

The cutoff point is bcf0e2fda80c6("x86/xen: remove hypercall page").

Together with Jason's observation it would seem that Linux doesn't guess
the correct instruction (or not early enough) when running as PVH dom0.
On PV it's just "syscall", but on PVH it's a tad more complicated.

Cheers,
Alejandro

