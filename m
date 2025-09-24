Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AAB99917
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129318.1469327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NbU-00007w-SI; Wed, 24 Sep 2025 11:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129318.1469327; Wed, 24 Sep 2025 11:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NbU-0008WF-PG; Wed, 24 Sep 2025 11:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1129318;
 Wed, 24 Sep 2025 11:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=946M=4D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v1NbS-0008Vb-V0
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:24:07 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa1e77dd-9938-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 13:24:05 +0200 (CEST)
Received: from PH1PEPF000132F3.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::38)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 11:23:57 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH1PEPF000132F3.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Wed,
 24 Sep 2025 11:23:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 11:23:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Sep
 2025 04:23:54 -0700
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
X-Inumbo-ID: fa1e77dd-9938-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRMkRlVBYZX35HXUseKZopbzGYhXj2Z1lq8LQEXqyhJi2+tANNDe3Efxlau37Tuk9+lrNuyp63x7asTmSFue6KOA/Hrtn8TdlT74z5A5XsuVywwi55oY7mbvEE5z4nXMPouJCDSRJWCLay+derZF4bCwIVcGW2jnK7rm+9dsAZZ50co2qCPGfd5AcylLL02G4rdmCVi1VZM/bsIot4yiunQGtCMs4OcQl2M1aGWAsTlQbo46OXiD5IZ5PU03A0XXyMhc4pvoDrFzk1HtlI0bzxW/I3+7JlvCaz8OsaoK1+7Fg030o18d2dyhYD7KbmRJkieJzNh6/BtQ0xFLwYJgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ1tSyabFMHOybYVns4qVp3jMn68goaH320dG5GL//I=;
 b=CTV9UcAaD5nd4O9Z/XwvxmnI+xsmsT66BB75L/bDbv9AoTzN5h7/muCRGq4gGEG7uaSinN2mPLjwJbrPDX9abNKYyrMHyaOmDLPPwqIJhI8t8RQHVceTZlIrWeNz8C3+ejB6FMAX45j9Lu6O7QlhVrxzchrmXp78uIY770PmpcDZuqnPwZLkBc2E0pSrOq5oF6dTHd1p4RJ+qpJZDlCtWTfzwnVbMiQ0uKT0Gc7eLJU/k3S+7/eqo2tZ597FAgVjHU5H8C5Wjl3oRIhOWuOM/OAsDXKbjAevfqGgkhHaazxopChOVUqO8GWm9ba0xhjvPpnZbJDPH7C/X+V9bZjFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ1tSyabFMHOybYVns4qVp3jMn68goaH320dG5GL//I=;
 b=DeUsyd2h555B9FZD37iTvNHR9AeaowBv8UF4iHK45/MNLudSBY75WEd3/HD0FttCEGTd3Kj/vf/02jx/CyR2qwHsBccDt3UhKcDrKJT9NhSArKEFHUEHcZGKs+hd3a/Eb9lOEpwCFTKhBHipDa/ezRG9JShw0zjjrTSnFqtGWQs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Sep 2025 13:23:53 +0200
Message-ID: <DD0ZQLVE0KSS.3HHC8OHAQPL8L@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew@xen.org>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
 <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
 <88cc4cf1-3bc9-47f5-b8f7-e04f01b027ee@xen.org>
In-Reply-To: <88cc4cf1-3bc9-47f5-b8f7-e04f01b027ee@xen.org>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: bbebd8ed-c60b-4f03-5878-08ddfb5cd9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTRVVER6bS9oRDRSTVdaK3RmUkd6U0VGdE9Uay9mQ29lbTRidUFOSGNQL2Qr?=
 =?utf-8?B?cTJ3L2NTWEE2aXVpTzdWaUJBcVl5NHVnSmZ3aU1HekxsYTg5QzVzMnZvM21t?=
 =?utf-8?B?WHo1cXQ0Zk9YbjRZZXF5Qml2SVNtWlloSGpQdVJVam1QYjlqOE45eEpiNVRv?=
 =?utf-8?B?Zld2VzJRQVUrTVY5ODQwd29zbzF2TnVMaUJxQjNreGhkb0llUVpQQmNtZjJl?=
 =?utf-8?B?cy9WTXo2SHV5QWJJclNnYkVuT25sdDdXamcvMnBzWFF4aWcvYWg5SWt5cWIw?=
 =?utf-8?B?ODRWY3A1R1Y4SVFzSW1IelJvSDJRV0M1L0hQRHVtTWExTUxZK0FCZ1FhRGNw?=
 =?utf-8?B?aVBHUldxLytERWVxRUFabnpvOENRR2tJMnMrcU9GNXpRMCtrUGRzLzYzR01h?=
 =?utf-8?B?cGRERzdTRC9JL3Q0Nm5MRFNrajRNOTBib2hBZENYc3hxTUtOT0NTL3ZPN0sw?=
 =?utf-8?B?SUYwbHUrZ0J0eURSMS8rMDI0dUFIU0Q2ZnljYjNXenNpY2tkUXJWQit3WXFZ?=
 =?utf-8?B?VnJJNnpSMEhFQWdMcVU2MFRhSzUrZXdYemVvUkN6NmVxbjhGZGpEbjJXVDVF?=
 =?utf-8?B?WE1nVGNscmRnVW45VTBKWkU3Mmh5ci9jTkFVNlVXRlJVZ3M2Qjk3eEtPY0Rn?=
 =?utf-8?B?N0M0SDJwN0I5VW11dUk4L29MdFdoT0h3dFA1cUJkQzZ2Nld5b09IbTYvTmtq?=
 =?utf-8?B?N2Naei9wRC94cTZJUk9YNlJEa3loQk10Mk1pTXprTjRiNjYzaFMyRkp4Mmd6?=
 =?utf-8?B?dHB5dDJWQUZ5RVB5OExmc3FSZUN6SndqN05UWU1rM2NPNk50WDdqYUhIYTlj?=
 =?utf-8?B?WVg0Z0pUU3hWeU9iWEtjZ2svUEVFS1hZTDRNOFh0YkpadFRjbnBucWNTeTRh?=
 =?utf-8?B?NE9SRlhBN0xPcjhzeUgvcVIxME1oNm5BaVV5S3I0TzBhSVdBU2p5ODZuTUU1?=
 =?utf-8?B?Z1Z2M1psZEhQT2tUWWRveHc5cEdnNldwWmV4TCtJVWRDZUxkQ1VlcmFiV3Uw?=
 =?utf-8?B?QzVHblFIbzFJa1hTbFJ6bWtoMUZxdVpGT3pCbXRmSTQxOHZpaGo3Q0VTT0Vj?=
 =?utf-8?B?ckRXOGNlZ1grTFdwQzY3L0dTR01QWk1xV0JNSmZUb1JORnN3M2kzTlJ1akZt?=
 =?utf-8?B?ZmNKQkJld083QVYvbUpGTWFkZTlGcXI1Y0xGTVFPbHM2czdwbnptVzFSUlBN?=
 =?utf-8?B?MDd2UUxIb3ZZb3JlTFlTc0V2WDI1bEtEUEFGbDAxUWxCcFlmYVNmT0xteUJT?=
 =?utf-8?B?MW0xUHRFakVVOHczM2UrS3JoWkJNTzRxVGI5K1RhOUhvbjdWUmdqN2wzUkFZ?=
 =?utf-8?B?VDZCWUhRMG9iejZFdVpBdU1rMytRc0ZHRUllV1BCeXBCVnVDQ2ZiQnN6NjEx?=
 =?utf-8?B?MHZtOWh5YkpEZGdJK1Nmb3JKWGp4a3JMWmNQTlhUWUo1NVo5OGZNRWZ2K3Vp?=
 =?utf-8?B?NGRkK1JuQlRXQ21vRUo2b1VnSG00RGRYcG9mUFE5SkdjbDVkN2RvYTFscXlu?=
 =?utf-8?B?RFZDNEdGRHpDbHhxRUd3R0hiNkR0V2dPODhORzZLclQ4YWZTdUpjbERHMm8r?=
 =?utf-8?B?eW1NejZ1ZUJsSkd5QXNRL2gzM1k0NmtvdTlMdXJGdjhhM2k0SWpFVVNGM1RJ?=
 =?utf-8?B?QmJ4RzczQmU4LzYrcGN3YUozRnlnSHZnOWZUVk0wNjNoNXNSWXFsc0dIS0pq?=
 =?utf-8?B?bFRlVG14c0xVMUQ4T3BkUEhnNEwrM0ZmbUUreFMvRysvWmZHN0UxRVNLOVR4?=
 =?utf-8?B?ODhUbFpMeGpXTk1mbGNURXNyTlBGT2p6RjZhbERCV0REYSs5YmtOTFFUK2lp?=
 =?utf-8?B?L2ZIRnN0SmRzSnRqOUowY0w4MnJaZEtoQlowWjJ6ZmZZSEp2V1d5VkNQWHI3?=
 =?utf-8?B?SXB0dHBmYXdPenFqWUdabXMxNjF6WEJ4TCtuL2dHZ3ZJcFVadXBuSXBNbVdz?=
 =?utf-8?B?ZklNdXRlRG14K2g4eGxudUJHSmxnVGRlelBYZHBTeVFCRzBzN0U0ODh6cHlF?=
 =?utf-8?B?WWJpSHdMei9HMVZMOUdyRFovTm1GajBicnZ2Z29PMXZHdndEY3pONGVFNVNm?=
 =?utf-8?B?Y1JNRnJqdGF5OTkzcmpJTDBUN3F6RzA2aG93Zz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:23:56.4238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbebd8ed-c60b-4f03-5878-08ddfb5cd9bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

On Tue Sep 16, 2025 at 7:14 PM CEST, Andrew Cooper wrote:
> On 16/09/2025 9:57 am, Grygorii Strashko wrote:
>> Hi Jan,
>>
>> On 16.09.25 17:34, Jan Beulich wrote:
>>> On 16.09.2025 12:32, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX
>>>> dependency") the
>>>> HVM Intel VT-x support can be gracefully disabled, but it still
>>>> keeps VMX
>>>> code partially built-in, because HVM code uses mix of:
>>>>
>>>> =C2=A0 - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_V=
MX cfg
>>>> =C2=A0 - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX c=
fg
>>>>
>>>> for runtime VMX availability checking. As result compiler DCE can't
>>>> remove
>>>> all, unreachable VMX code.
>>>>
>>>> Fix it by sticking to "cpu_has_vmx" macro usage only which is
>>>> updated to
>>>> account CONFIG_INTEL_VMX cfg.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>> Hi
>>>>
>>>> It could be good to have it in 4.21, so vmx/svm disabling
>>>> option will be in complete state within 4.21 version.
>>>
>>> Imo this isn't release critical and has come too late. It's of course
>>> Oleksii's call in the end.
>>>
>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>> =C2=A0 #define cpu_has_sse3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 boot_cpu_has(X86_FEATURE_SSE3)
>>>> =C2=A0 #define cpu_has_pclmulqdq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
oot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>> =C2=A0 #define cpu_has_monitor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 boot_cpu_has(X86_FEATURE_MONITOR)
>>>> -#define cpu_has_vmx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 boot_cpu_has(X86_FEATURE_VMX)
>>>> +#define cpu_has_vmx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (IS_ENABLED(CONFIG_INTEL_VMX) && \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_cpu_has(X86_FEATURE_V=
MX))
>>>
>>> I'm pretty sure using_vmx() was introduced precisely to avoid the use o=
f
>>> IS_ENABLED() here. What is completely missing from the description is a
>>> discussion of the effect of this change on pre-existing uses of the
>>> macro. ISTR there being at least one instance which would break with
>>> that change. And no, I'm not looking forward to digging that out again,
>>> when I already did at the time the using_vmx() was suggested and then
>>> implemented. (I can't exclude it was the SVM counterpart; we want to
>>> keep both in sync in any event, imo.)

Apologies if this has already been discussed, but I didn't participate in p=
rior
discussions. Targeted lookups in lore are not shedding a lot of light eithe=
r.

>>
>> Thank you for your comments and sorry for not digging into the history o=
f
>> the related patches.
>>
>> All, please ignore these patches as existing places. where
>> cpu_has_vmx/smv
>> are still used, need to be revised one by one.
>>
>
> Off the top of my head, fixups to MSR_FEATURE_CONTROL, and AMD SKINIT
> need cpu_has_vmx/svm not guarded by Kconfig like this.
>
> ~Andrew

What do you mean? AFAICS SKINIT is guarded by cpu_has_skinit, not cpu_has_s=
vm.

And MSR_IA32_FEATURE_CONTROL tweaking seems self-contained in xen/hvm/vmx/ =
which
is compiled out when !CONFIG_INTEL_VMX.

For the hypothetical case in which we might want to know the real HW value
we can go look at the raw policy, as in "raw_cpu_policy.basic.vmx" or
"raw_cpu_policy.extd.svm". Or what's mentioned in passing here.

https://lore.kernel.org/xen-devel/a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse=
.com/

Forcing the common case to use a helper and leaving the rare case in the
shorthand macro seems like a bad idea. This ought to follow what cpu_has_nx
already does.

Is there a specific code instance in which having IS_ENABLED() in the
cpu_has_{svm,vmx} macros would cause issues today? While there are some dub=
ious
choices of svm vs vmx with or without negation, they all seem to resolve
to correct code, with less codegen after IS_ENABLED() ends up in all the
conditionals.

IOW: I have seen fear of incorrectness, but not proof of it. Now, obviously=
 the
burden of proof rests on the submitter, indeed, but I'd like to know where =
we
stand in terms of what that proof would look like. A naive grep shows not m=
any
sites to check.

  $git grep cpu_has_svm | grep -v cpu_has_svm_ | wc -l
  6

  $git grep cpu_has_vmx | grep -v cpu_has_vmx_ | wc -l
  11

cpu_has_X_Y would be off when cpu_has_X is off, but those shouldn't matter =
for
this discussion.

Am I missing something here?

Cheers,
Alejandro

