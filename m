Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41160BB3AAF
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 12:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135698.1472721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GkQ-0003Y6-Hd; Thu, 02 Oct 2025 10:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135698.1472721; Thu, 02 Oct 2025 10:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GkQ-0003Vk-Ee; Thu, 02 Oct 2025 10:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1135698;
 Thu, 02 Oct 2025 10:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4GkO-0003Ve-Ky
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 10:41:16 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51593311-9f7c-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 12:41:15 +0200 (CEST)
Received: from CH2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:610:54::12)
 by SJ5PPF01781787B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::986) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 2 Oct
 2025 10:41:10 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:54:cafe::4d) by CH2PR11CA0002.outlook.office365.com
 (2603:10b6:610:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 10:41:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Thu, 2 Oct 2025 10:41:09 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 03:41:08 -0700
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
X-Inumbo-ID: 51593311-9f7c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSd7QK/G0PKZP8lP6UQb3mKHGsioD594ik598hIKn6qcEkb3eK+fJQRuQufC25G7o8B4xIu987P8WEIQWEguycTj0LFXSoujS59sEfoFPhVk+rEKpQRNMq8ZZaMr7dae4z+2nXXzCrTQu3QAZDmtlS+IKeeoONgKXyFk9rSebPNsve5LDrwwwXQ6P7wFF8YOxI9WyIBrr/lOVI/FesmbXHBlQNLJiSNf/Izo1w9PyQqwd2Z0IaChCVbz4HZawmhIIDuuirSdE8guYqrQFix3Uz1BpicOHyDTHg56c4FYRRR4soN5HOvPyXkkaXdm9LVAOBl952MR5bXPvBhTiVq1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP1BmQt8UQRlP324pyLNobZDTrZPP14vT0RO6Ev9z9g=;
 b=G9tQHXajVChcjeh0TL3NNA7OOm4KOGZEy4iuEVHYCzZqVUTum0k/epjhoQm3SpoYNU+pH+JZ+tZPNXxE5C/CwnDIOz+KW4Xv/5blSPGvHhlcwwpFYu72pzFw3rT161Iui1IwifhiYo1YDwHXqSAHJHvy8tJM+tSNrCwL56x7UJOqb2r2AhsbW6xp4eg9ujdEOu/htcBgD5RG5CcqVKBXtxvdyONt5kISP6VMtf8ZXIh/lOgK3J1b8A9svuC5q1m1SNqUSfGthRSwEmp858pQ0gFyShLqifvY87urnCKLySOgmYHtbnyiVnPXRitvPmbCQSqLKDXlyD3so+1cFw9A9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP1BmQt8UQRlP324pyLNobZDTrZPP14vT0RO6Ev9z9g=;
 b=5pvQX3FSkzW7XbzKAEEmB26qlvQSLF4XFRfuIGpank/eB5dkfmPqO/tiSiRaMLa12FZnZ0BC1sVPi4YZc4USFknLVd1HNYvp8olNkX9HVgHDoUwt5jbIJLJPW3/zUnEHJ6dqn3U3R0OCfBCuHnHlN2DFRYX4l1M5MAVeatjoSBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Oct 2025 12:41:06 +0200
Message-ID: <DD7RU7OHCZ83.QERYHBDKV7FR@amd.com>
Subject: Re: [XTF PATCH] x86: Remove Xen as a hard requirement to run XTF.
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250930085412.1643-1-alejandro.garciavallejo@amd.com>
 <97b1a3cc-6e8b-4207-b467-4ab39396482e@citrix.com>
In-Reply-To: <97b1a3cc-6e8b-4207-b467-4ab39396482e@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fad1247-3e4b-4907-1f18-08de01a03323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTVSNkNzcXRwNFJFRnowNVEzZThYMkx0Q0ExZUdDdE0vcUVUYk9Ya0cyNHo4?=
 =?utf-8?B?TDRyVkRpZG5DeDF1cys1M01xemhBNHlGM2Z0QkJxK0FYL1dSclFJbW5BL3Br?=
 =?utf-8?B?UHloYit4NzYwRGdWNzFuNEpXaXFOUzNZZ3daSHBPRkFDQzRMekhIZW9peG0w?=
 =?utf-8?B?YjlCZGo3bk84ZTVVSVVuZjhpbzVOK0JjTFJaMVJwa1orbjZpSHlZcWdkSHBn?=
 =?utf-8?B?cnhhV24wa3RKelkzTmdLaHNXajg3TTQxVDVKODI4cEVxZU1wQ0U5cVJDdGZr?=
 =?utf-8?B?OUJzams3dnk1UWlLVnZEUFRicE5aWUFnSmRhditBcUdqdXJpcENNdHNVQ0xa?=
 =?utf-8?B?VERwbXZQbGlwdURWbkV1a2dKREMzME9NblQ3R2lndFNTMjBVeUc4a0VMUTc2?=
 =?utf-8?B?Yk5VSmIzVlZYcmxyWXN2VVl4NFhsYjdGSTBKYmVXTHNVWnNGaUR6clpnN0pJ?=
 =?utf-8?B?Ny9GVSt4cnF0cGYyUjM2S0Q4RVMvenY5bzhVaStnRDlWSTRUYVhNZjRpZHNL?=
 =?utf-8?B?eTQwbklSZ3lhNms1Z24xTURJcC9jamFxNzdVZkN5ajJBVWplcVV0WTZhUS9U?=
 =?utf-8?B?aHJ0K2VsRWZzUWlGQjJNNUIwNVlDQ0NaM29hbjFEbjdVVTN5QkViZGpnT2tk?=
 =?utf-8?B?R1h6MWZXU2F4MmFOT1FPWFFqMStMakRLNG16c3hnSS9hTE52bGIweEN5UWpS?=
 =?utf-8?B?QS9iTlo1d0Jja3ZTeTdsTzNmZTRpL201SU5sOTBhYUY5aFc5ZWx2Q01lMkJu?=
 =?utf-8?B?TDMvdncwbSt0ZCtKWUZxbWNnM3JVR2M5a1V4SFpTaGVSMG9NMHY0ajBvRDhO?=
 =?utf-8?B?NGluU2txbURidnFwRTVQeEIvVzNaYzYybnc2NzhVWUJvWUFuUS9jLzFnQTN5?=
 =?utf-8?B?Yk83TXhtdnIrendUY1RFTnJKK2h1SWt0MWQzT3VaNVlIMzlPeE1DR0lNNjIr?=
 =?utf-8?B?cXQ3Q3NzeWNzV0RmMzQrQnEvMytTT3M3ckVaNGNuZllNQ283NU5XU1lVNi9K?=
 =?utf-8?B?NjdmRE8vSEIxSWlaQVVLTzRqRWx2MysyK3R4UTZacG1FbGxjRkV4clB4ZHkx?=
 =?utf-8?B?dEduUkh1eG5ZOHNDSjVGVDBFUFYwaFVRU1U5WjFnNzB3a240QjljV1F5NUxh?=
 =?utf-8?B?M0hvNHV2Z204NlBSRkZJUTVtUU1kbGY1MWlCTkIyZXVRYnpsZGwzbGJ6TVdE?=
 =?utf-8?B?aDd5c3B6Qkc3L2g3bkN2L3NLak5iaGtLbG5NWDV3TUJGL29OR0MycmVnQWpR?=
 =?utf-8?B?Q1lRbTVsOCt1UnIvODNMREl2TmZzTFZJVXAwTktwNGxRcTlQZnM3eEdMam1Z?=
 =?utf-8?B?cXcyNWV0WXFjd1NRSjhKbGV4bVhpTVVkK051cmVGeFRmcUZvS253aUVaNHhz?=
 =?utf-8?B?Vmt2SCtUYXp4S01DeklLL1V6QjV4WERpdW5ueTIwM2JlMzFVZG43cUhZTTJj?=
 =?utf-8?B?OHd0dS90b3pudU50a210N0hWTGJ3TkNLbU4xSzhrRVFOVHArZ29OTHFSdHgw?=
 =?utf-8?B?NGxkYTB1RTBxRm5LSGpvOVVxN0dhT3dVSUtEVVhmMHhlM2NnV295bjUzVlV4?=
 =?utf-8?B?bmFtOHNRbVJWMnlFME1HOUtVV2p0dFFiTkw5RFBiTVNaaElJZ0VzbzdnWU9P?=
 =?utf-8?B?THdNMUtoVlRJbk5oYUptQWNYTktiRnhTYzFmMDJ6dHVaUEJpaGdUaHBFd1N3?=
 =?utf-8?B?RlB2cjcvR3BWWWkrSEhWZGY3a3ZuTlU3NmlJRWJCaXhRcVFtaDA0Zndzdy9z?=
 =?utf-8?B?enlPaWVTeDREbHZzM1l5c29MMXhSN0JWNlQ3bmdDaFM5Y0pGdldKYUU1TEw4?=
 =?utf-8?B?Y2JzVW5aYTBmUEYvdDl6WWN0VmxjTlpNd3I2MzRyZyt3bU4zT252dGNvUWJN?=
 =?utf-8?B?MjVub0hUOWxtQUhzLzA5NTY1TnRTZ2RGRzRMVWtBU1RqeVYveStlZk9oZUY4?=
 =?utf-8?B?dFdPQkgzS3pLYnk2WjN3OGRObE9SemRteFFUZ1U0cWtpWkVMMEtDK0ZzSldo?=
 =?utf-8?B?YzRpUWhLNlEraE80RVpHSXd3ekpUeG5ReFVWeXUwMmYyMW85NWdmcjBiLzFP?=
 =?utf-8?Q?k0aKq8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 10:41:09.6981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fad1247-3e4b-4907-1f18-08de01a03323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

On Wed Oct 1, 2025 at 7:10 PM CEST, Andrew Cooper wrote:
> On 30/09/2025 9:54 am, Alejandro Vallejo wrote:
>> If Xen isn't detected on CPUID, then:
>>
>>  * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
>>  * Register COM1 as an output callback.
>>
>> This patch enables running XTF on QEMU-TCG/KVM out of the box.
>
> When I did a KVM branch for amluto,
> https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen-test-framework.=
git;a=3Dshortlog;h=3Drefs/heads/kvm
> was what was necessary to get tests to pass.
>
> I can see the need for MB1 going away now that KVM uses the PVH
> entrypoint, but is the rest really unnecessary?

I do run it, as-is and it works.

Depends what you're after. As-is the commit spins at the end for a lack of =
the
code knowing how to turn off QEMU. 0xF4 isn't the default qemu-debug-exit P=
IO,
(that'd be 0x501), but I assume that was the intent and you (or someone els=
e)
got it from the TCG unit tests, that have a non-default PIO.

I didn't include something like that because it relies on the user having s=
et
up " -device isa-debug-exit" in their QEMU cmdline. Thinking about it, the =
worst
case scenario is that the PIO write is ignored, so I'll just go with that.

Also, I'm not sure QEMU implements PIO 0xE9? I've only seen it in Xen. This
patch writes directly to COM1, and that seems like the better option.

>
>> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
>> index 2ac212e..6172c7e 100644
>> --- a/arch/x86/setup.c
>> +++ b/arch/x86/setup.c
>> @@ -243,11 +245,19 @@ static void map_shared_info(void)
>>          panic("Failed to map shared_info: %d\n", rc);
>>  }
>> =20
>> +static void pio_write(uint16_t port, const char *buf, size_t len)
>> +{
>> +    asm volatile("rep; outsb" : "+S" (buf), "+c" (len) : "d" (port));
>> +}
>
> I've factored out rep_movsb() in the proper place for library functions,
> and without the rebasing issue reinserting the erroneous ;.

You meant rep_outsb(). Too much ERMS is bad for you ;). It's just the commi=
t
title that's wrong, the patch is still good. So I'll resend with using that
helper.

I'm a bit triggered by the port being the last argument rather than the fir=
st,
but I'll get over it.

>
>> @@ -255,12 +265,41 @@ static void xen_console_write(const char *buf, siz=
e_t len)
>>      hypercall_console_write(buf, len);
>>  }
>> =20
>> +static bool detect_xen_runtime(void)
>> +{
>> +    uint32_t eax, ebx, ecx, edx;
>> +
>> +    /* PV tests always run under Xen */
>> +    if ( IS_DEFINED(CONFIG_PV) )
>> +        return true;
>> +
>> +    /* HVM tests may additionally run on non-Xen hypervisors or baremet=
al */
>> +    cpuid_count(0x40000000, 0, &eax, &ebx, &ecx, &edx);
>> +    if (  ebx =3D=3D XEN_CPUID_SIGNATURE_EBX &&
>> +          ecx =3D=3D XEN_CPUID_SIGNATURE_ECX &&
>> +          edx =3D=3D XEN_CPUID_SIGNATURE_EDX )
>> +        return true;
>> +
>> +    /* Viridian guests have the Xen leaves higher up, so check there to=
o */
>> +    cpuid_count(0x40000100, 0, &eax, &ebx, &ecx, &edx);
>> +    return ebx =3D=3D XEN_CPUID_SIGNATURE_EBX &&
>> +           ecx =3D=3D XEN_CPUID_SIGNATURE_ECX &&
>> +           edx =3D=3D XEN_CPUID_SIGNATURE_EDX;
>> +}
>
> This isn't quite correct.=C2=A0 There's a find_xen_leaves() helper which
> should do what you want.

Right. find_xen_leaves() wants adjusting so it returns a sentinel leaf when=
 no such
leaf exists, like -1ULL, or 0. I'll go with the former tentatively.

Now that I've noticed the existing detection function I might be able to
just do early returns where it's invoked rather than avoiding calling them
altogether.

I'll send a v2 shortly.

Cheers,
Alejandro

