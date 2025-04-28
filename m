Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6BA9EE10
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 12:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970426.1359124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Lo4-0000Ut-Rr; Mon, 28 Apr 2025 10:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970426.1359124; Mon, 28 Apr 2025 10:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Lo4-0000SG-Np; Mon, 28 Apr 2025 10:33:48 +0000
Received: by outflank-mailman (input) for mailman id 970426;
 Mon, 28 Apr 2025 10:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9Lo3-0000SA-4z
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 10:33:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2407::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4266d230-241c-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 12:33:44 +0200 (CEST)
Received: from DSZP220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::14) by
 LV8PR12MB9643.namprd12.prod.outlook.com (2603:10b6:408:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 10:33:41 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::96) by DSZP220CA0006.outlook.office365.com
 (2603:10b6:5:280::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 10:33:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 10:33:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 05:33:39 -0500
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
X-Inumbo-ID: 4266d230-241c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9DCKZvAemCNhXa3RvOPKErxkGm0GM/9fmrE9CGCg2H763xzxQjbBuZSdrkz9F1O1K1vsRhETc1leKEEtn7bjoZNGmR6eUL44biVCyqYHBOSFvwhycTWdvPcEvKw1ubRhhoEkiBmgFsc9EGghi3KsX8/LCG5+FqX3ZFe5T+GZPOhTGGjh1nK2Cq9d3X5aAd9uf1HO9vEuM9zBD87SIHH/xbwjFS5vohWg0IP2QkbKWhMVrj51ArDQ5OGL2z3ZCDGxEWD2dO0toTei3J5djIbCr3jElNcSLFeF6VJ3Bb/fswFMfQyMVT/dJGP8AxCxRqULaYqkstMlxna8iti5Eb3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIsKUkfbKSTxHHoBW0hOVaLIBXvHJnqewMVM0szoZic=;
 b=erJlmTnq2aWlzTweW5rPcwVgdMv1xRlUMus43oMqD91iEnW7921gadxslvrDuykFwv9H4ZklzhCWap0yy6colcxZGhLPT3Z5CJ0ALJ8Zs81mDycW8dsA5PbAnGBhlKblhwgGrgbuls+aizFT2hiFqGvt/J0v/qNNGOc4R4LU/UoQ+k4JVZqRzdDumC1kdqae17MmRHBn3IACcrfwxhnJxi9cBPVI309gKH9t4U8GpV/dzR+/59RamoFbmam2eSWTgqx17MHa+AmUi483tyeNiZ4R6O4MlWyntoE1F685bzYfH5hILWiV5pPvyDwL00/blTUUtcsHIaAUWqfYKIS09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIsKUkfbKSTxHHoBW0hOVaLIBXvHJnqewMVM0szoZic=;
 b=JjLb5xC2ElzdqvtZkYruxtfW8wCDw+8zzqUCep2+mOG7JSFWJ63V4Git+hsFWWVF8GFBM0PCSNRKnWUemqGg0HyxaeHTglAq+bTN9sjZLLJqwPK1b4JPV7U9QHO+WzCJsYUJDs2M+DXf0ZvNdESPrtcgNkO8R7ZsACj0g+Au94o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 11:33:38 +0100
Message-ID: <D9I7CYQG59BZ.2GZ9CJ27Z7KX7@amd.com>
CC: <jason.andryuk@amd.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC 04/38] x86/hyperlaunch: convert vcpu0 creation to domain
 builder
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-5-dpsmith@apertussolutions.com>
 <D9FTMDQ501TU.1H73IHNYGWKZH@amd.com>
 <9cad677f-cfcd-4eec-b824-01d281cb7076@apertussolutions.com>
In-Reply-To: <9cad677f-cfcd-4eec-b824-01d281cb7076@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|LV8PR12MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: f5be1516-ba9a-416d-c2a8-08dd864024fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXpEb3dia3ArR2o2a2tiSGVkaVVFc1dsMUd5ZFAyL3RTZEMrN1NvYTFrQkps?=
 =?utf-8?B?UlhOZ3dpZ1hZbXlySFhyQTJGSE81d3BPM283WEFySWR5bDJlTSs3UCs1REVv?=
 =?utf-8?B?cHFIUmd3KzVBQzRtOFc0UGZIMGtTeGlsWnhYUFZBeVNDZ3UyUzhzcDQybXNF?=
 =?utf-8?B?QTRkbzBWdkx0cVVoNXg3ek9vdGFRWTM0WnN6RFpIQXFSbVZmREVEb1Bqd0dT?=
 =?utf-8?B?aSt3eDc1TlBtUlVaSXdXQlptWERyS09sN0FDS3JRN1JlNkI4UmRaRk9oKzFs?=
 =?utf-8?B?K2crZDI4ckRHVEM2a2xmdzF4bWkyVEp2OVZraW1ldFp1TWs5WWhBY2d1WWxJ?=
 =?utf-8?B?NitJZnZPc09YRkNoT0VPaXZPMXJic3FaN2pJT2d4Y0ZDMCtGb09wdW80cXl4?=
 =?utf-8?B?RlZVeWJjejNHM3h6cHhBck9KRGRoM0g0Z2JvNVRQY2NOY3dwdzhScnNSM0FD?=
 =?utf-8?B?ZEpFeVJQNEExaW81SEVmTkY4QSs3SzUvTDJrYXd0SUxoUndCTFMxU1M2WmJC?=
 =?utf-8?B?QWd2bzZvVlRUeTdtUENER1VpWXI1RTBuYjA0UW1HU2RXbU9wOTNXVElvclVS?=
 =?utf-8?B?SVJBTFUrSXE2a28zYU1tcUNlbm0rdW5YVGk5SWJGMlN5aUdhL3pkWWQyby83?=
 =?utf-8?B?aU5sbFNsaEhvelcwVVg1ODdBMEFhSVZhek9UNWxGeDQ4WXdDc05JRHJqZWFn?=
 =?utf-8?B?UGdZL1ovNTVuakV1eWxyUS80Q2NNSVhiTTlmemE2NlQxZFBqdWpwTzZRWWxN?=
 =?utf-8?B?ZklJeE54dFgrWGd1Sk8zbEVQNE1vS1o1WWk5aUJ4U3kwbGt2cFhXeFRLNE1E?=
 =?utf-8?B?aXl2eEI4VVRmMXh6VmFWNk9uMXA4OGd4WWtub21iNGExSE9UTk5hUjV2ZlpP?=
 =?utf-8?B?R2pxK0UwVHVXL0QwSHJEY1dFb3lYdXA0MVkvM25tL2JCUFdrNDErWXFIWW5m?=
 =?utf-8?B?RTZuQk5sWmVQWmY1dFBBSnM1cHZVd09QaW1qQWdYb0g3RjlZWlMvb2lGNWs2?=
 =?utf-8?B?cXRhM2R6NC9PL25PN1Z3RlNLa01IZnhZbXFvWWltdU1ERDZUdmVObmxMcFFV?=
 =?utf-8?B?L1R0M3p6N2laZjNwdnhjTFRaVXlHR0dkRDR1NjJUS0lldFZ5eVh5NDEvM3JW?=
 =?utf-8?B?MUFNWEZsZWxHNm5vaU9MTXhmaUwyaVBiLzZNakw4SHdETDV1U0VUbXNnQmE5?=
 =?utf-8?B?djludWFXLzZ1K1BtODVBdCtHZmpVSnJHQ3QvWEl4YzVVSFFIMldmdXpQODlD?=
 =?utf-8?B?VkpOVTFnUXIxUGZmSk9JQW9rRzE4RWQ2OTdzbjFoTzhINnZDdURxbUpYcmZO?=
 =?utf-8?B?NzFrbGNYQVNQOVUrb21rbXNjM2ltUE9QVTRyZzZxZC9ieDhMbVg1QTJqeFFq?=
 =?utf-8?B?NE5iNW9OVGVlb043VFM1OUpCZVptNFl4cG1WcEFXMVhmSC8wVWVNbkpIblpp?=
 =?utf-8?B?WDk5ejVHRTdnRjNpYVNKdlI0a1VTaGd1d2ZEZ2pxaFNJYXU4NVZsYWp6Y0py?=
 =?utf-8?B?Qk81Q1NaR0FYR3dPcTVMVTE3anQrM3ZnUGsyVTJUMlllNDhFcVpXVUFKb0h0?=
 =?utf-8?B?WlJ5TkNCbDY5dVJhTUVzTDMzSVREc25SbnYzK21mZm8zTEl5RXJndVhYVU9l?=
 =?utf-8?B?R1Z4VGphZVZSMzVWbnY5TEdRYmpDNmtkcTN2d0pIUFN1RkRvNURLQlNSVlN2?=
 =?utf-8?B?LzYxSGg3TXF6V05qU3BnbmNlYzJOOXJMY1d1QjZUbXBXOVBMWThBRkY3MGl3?=
 =?utf-8?B?MTMzOHozckk0OFdZbEg1Mm9RcERxWUtLOW9lT1M3WnJnUDZCL0thQUVidFlB?=
 =?utf-8?B?RnZXRDE0UHN1V2RtUzM2UlF6MlliL3FoYXVKcEZ3bTBrQTBUVFk1aVJ3Vlk4?=
 =?utf-8?B?K0dJNlV1UUpsWU5nSnZZZGNMMlBoVUNaeUhEWnNQVFdWUkkxQVRNN2ZqWkRr?=
 =?utf-8?B?MVU2VHh0THUzblRRekdEUE81OXptKzc1cWVSWWt3VmdqTUxiaGVIN2M2Vysy?=
 =?utf-8?B?bVR0MWo5ZkFpRTYzWXMyRER4MEx5ZmhWcXlSakJwak5aZ054cWQrR2hkZEwr?=
 =?utf-8?Q?X9qNVa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:33:41.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5be1516-ba9a-416d-c2a8-08dd864024fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9643

On Fri Apr 25, 2025 at 11:04 PM BST, Daniel P. Smith wrote:
> On 4/25/25 11:22, Alejandro Vallejo wrote:
>> On Sat Apr 19, 2025 at 11:07 PM BST, Daniel P. Smith wrote:
>>> Convert alloc_dom0_vcpu0() to dom0_set_affinity(), making it only set u=
p the
>>> node affinity based on command line parameters passed. At the same time=
,
>>> introduce alloc_dom_vcpu0() as the replacement for alloc_dom0_vcpu(). T=
hen have
>>> alloc_dom_vcpu0() call dom0_set_affinity() when the boot domain is the =
control
>>> domain, otherwise set the affinity to auto.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/arch/x86/dom0_build.c                 |  4 +---
>>>   xen/arch/x86/domain-builder/domain.c      | 11 +++++++++++
>>>   xen/arch/x86/include/asm/dom0_build.h     |  2 ++
>>>   xen/arch/x86/include/asm/domain-builder.h |  1 +
>>>   xen/arch/x86/setup.c                      |  5 +++--
>>>   5 files changed, 18 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain=
-builder/domain.c
>>> index f2277b9e3cf3..619d36ea0b87 100644
>>> --- a/xen/arch/x86/domain-builder/domain.c
>>> +++ b/xen/arch/x86/domain-builder/domain.c
>>> @@ -9,6 +9,7 @@
>>>   #include <xen/sched.h>
>>>  =20
>>>   #include <asm/bootinfo.h>
>>> +#include <asm/dom0_build.h>
>>>  =20
>>>   unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>>>   {
>>> @@ -27,6 +28,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain=
 *bd)
>>>       return bd->max_vcpus;
>>>   }
>>>  =20
>>> +struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
>>> +{
>>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>> +        dom0_set_affinity(bd->d);
>>=20
>> Similar as before, this probably wants to be DOMAIN_CAPS_HARDWARE?
>>=20
>> I'll adjust while rebasing.
>
> Does it?
>
> v/r,
> dps

The situation is similar later on when choosing a CPU policy. Why
mustn't the hardware domain get the same treatment as the control
domains? Using (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE) at the
very least seems warranted.

All these cases single-out dom0 when dom0 is both a control and a
hardware domain, but as Jason mentioned how is Xen meant to deal with
dom0_X arguments when dom0 is disaggregated? Either it applies to all
its constituents (with the plausible exception of a xenstore domain), or
just one (the hardware domain), or none. Only applying to control
domains and not the hardware domain doesn't look right (to me).

Cheers,
Alejandro

