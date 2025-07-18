Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD351B0A007
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 11:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048298.1418522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchg1-0004Ht-9e; Fri, 18 Jul 2025 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048298.1418522; Fri, 18 Jul 2025 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchg1-0004Fc-67; Fri, 18 Jul 2025 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1048298;
 Fri, 18 Jul 2025 09:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us2c=Z7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uchfz-0004FV-Sv
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 09:46:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2416::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf69c3d-63bc-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 11:46:45 +0200 (CEST)
Received: from SJ0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:a03:3a0::24)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Fri, 18 Jul
 2025 09:46:41 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::56) by SJ0PR03CA0259.outlook.office365.com
 (2603:10b6:a03:3a0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 09:46:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 09:46:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 04:46:37 -0500
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
X-Inumbo-ID: 1cf69c3d-63bc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ9zENYIGCwQ9uONZ1FrQSRcehGMmWqHsH8gsvimpq9B3rZXwvJ2nKWwh+sk18Ow9d5bwyHfwetucLe2rj6WNn/9gm225cBcgbcTslVqXY9frA6T4vf243ly8KKn4T59IiWZfhAEhzxSH4ggYVs6bl9Gqfdgh95SFq9TBjIx3A+R5dkxiozzw0wcuTsO8e/IBch0WjZ7D7LapTKZrOUpX56dAy8fs+nqfnT8iiFdRj3L8Unn6zEndg6mk9IZ3M9ZEgntTR21DYrxnNRVBaT4d/s9nADDDMFNrc71DUhQq+j+xdd6RTwVMezagI3N8LxrDCtalIifPDbzqhC7o/IMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSsdYlXXtXYHFiRjzkJZVTQohIrNnqXGtDaHKPBJn1o=;
 b=YWnWFVTaZ5EuKOrXEQhdAiCc4brCjiULn+WSEMt+tiMxEqTRu2CCJ3F69oD20omAjzHtlqHw6oOEGpHPgL42WgbMpPEc7hkUC1Bt2EUzRrT/zImIUIAuFShz4XFdEf4ENOGxVz6FfD48/WFi77Yh2iSSZge8mNKX9tG6BDkDWt4j0Jc4NCozhjIrXOBv6xI5PTxWQNGnin2mwaM8lVb9vDRlzvmpekQS/0gai/fewDtHYn+Z2vtpcXOSvSDSMNZDb6EMNHuW0joiKz/ZknZz+lxsjWTIbX1z1Oysv5IdJuAESXSCcfJqWyF8gWzAtLui15L2gKibjeqz3Kz5FUbDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSsdYlXXtXYHFiRjzkJZVTQohIrNnqXGtDaHKPBJn1o=;
 b=S3x3mzE49Dolpk6ToTDmqeiyhazdRntvCPfT6ZYkrIqP9H4rKlV6k2K5N/ligS1a8VQ+mN1zdq6o6fjGW8uWWNKmF5r2/TNWFFGCUeXYgl7rRPFyolBVeK1W/1IeuP/2pOF0O/R+9oVmtpYARvsWy8u+zK/AkrfWGkZAbnVy300=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jul 2025 11:46:35 +0200
Message-ID: <DBF3328087KY.3CR27JZGGQXV4@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
 <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com>
 <alpine.DEB.2.22.394.2507171657180.15546@ubuntu-linux-20-04-desktop>
 <426330c3-ab77-46ae-89eb-1b67224afd3f@suse.com>
In-Reply-To: <426330c3-ab77-46ae-89eb-1b67224afd3f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf18b7e-6ef2-4779-1882-08ddc5dfff6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGV4TnhyZzBEYzBnL2NtWGdHSFY5cy8vbkhCcnV2Z2RrbHF3Sys0K3ZOdEcw?=
 =?utf-8?B?c1R5cEdkcjhYSFFRajFsZk80ZE5xK2ZXSEhoeG56aHhTZS9KT3N3NEdWK0ZV?=
 =?utf-8?B?UkdycFhoUGVNSURCdnJ3dUtIb2ZqN0NseW5ZVmJVU1ZVRm91ZVdrdkhOUTI5?=
 =?utf-8?B?cTRJUUFTZXU0akNKc2xJaFBnUXpIQ21IMTNzV25MT3RvOTVFeDRRaTF4UWZj?=
 =?utf-8?B?OHdvbHRQOTVTZGQ5T2p5a2kyWFZQRDJKVkNCUysyTnNaZVJRcE54MHpGalE0?=
 =?utf-8?B?RHhWSEZoODVnUG5UR3VTOS8rVzZEbWowQ2dDdTRlZ2VRcmphM215VzdHOU9E?=
 =?utf-8?B?N2djLzI5VUxaNjBFMXVKd1N3WXlicXQ1RTNNRmN4RForNUh2YTRjcmVIUTl2?=
 =?utf-8?B?ME5iQkN0SXRibWdNUm9mczliY2N4RlRINGFhU3BTKzlMZXp1clBHOWpRWWRt?=
 =?utf-8?B?ZVJ4YmluRTFucUdNV1YxYlBLTUQ3Q0xhUjRpTlA2Y2dYclJERXBkMFp1WTRu?=
 =?utf-8?B?bGdXejlXSHJtTm1RY2NsdDBVV29ZdEJkd3JmOXkxaHd0dDNPV0RPLzJJOGhk?=
 =?utf-8?B?UzFCRXVmOW1ldnlWVUx3RS8rem5UbDZSUW1Pci9UckM1ZUJGd2tYWXh1YW9h?=
 =?utf-8?B?R1N5dnpDUm9EVURWWENxTVFTZWVZQWJOeituTmNjU2JUMS85ZXd2dDhaNnVQ?=
 =?utf-8?B?Y0lvOGwzdjJEd3R4cG0xZjVpMXpJSFFNODVrNlIzOWJjRmc0Qnluc2RmM0NU?=
 =?utf-8?B?WHBKWDFHNG9pVGFhcU9EMmc5dVFMTmV5TkpKWWF5bzJ1eGFDRzJqb3FDQ3Fx?=
 =?utf-8?B?K2FVWmtTOE9aZ1YyUkoxQUh1dkxtTFl5R2xGbVBKRVU0alNEVVEzM0drQTNo?=
 =?utf-8?B?bitnSXFqQkpOYW82RmxXcHR6SXJXU2pUdTRxOVFFYWZmTkl2MG1rR2hDbkVX?=
 =?utf-8?B?dW51UCtmakVRMld1ODhBQTNoZG02eGxrdkVKQzNqUmw4dUpmYlN3TytvV0Ft?=
 =?utf-8?B?QXZML2pabGFoa1ZqOWQ2dlUzMWR6MlBFdTByejV0U2YvOWltUTI0TWJqaUhj?=
 =?utf-8?B?WHFSVUwrZVN0cTd4RDgrOUJtUnJ5OFR4MzRQcVRNNnBWa2VlMkNFc24ycDNz?=
 =?utf-8?B?WXZJcmVXVUxZRWZWRHNidlBJakx3TmR6MGc3b2Q5S0ZsWERZYTVCZlVZZEdN?=
 =?utf-8?B?TWVvRFhnNEdpaDZldmYvM3laSUZVT2lYU3lKL1RlSGduVWJsQk5PcE5SK3Bq?=
 =?utf-8?B?UjBiL1Vzd01ZYTJOakt4UGpWNGJUeTFYSW9QbkQwMVhLa2VZTXYzUzYwdCtQ?=
 =?utf-8?B?dTRxZ1lrMTJmN3VZdkI1RXlNakVZZ0RjMXVOcDAxSHFyNy9FZldQYnVEZEtV?=
 =?utf-8?B?MXg3VnVCL2dUUlBwNDZFUkRHTHg1RlBvSVVRZDhZc3k3ZkRwUlNLZVlVc0R4?=
 =?utf-8?B?YmlQSjVweHFlY0xyT2ozeDNVK0Y4NnRhOURDc3NWOGErRWEyMmhtRHVxbzJM?=
 =?utf-8?B?WlI2dXJQTW92QjA2cm1HTFJlQ1pXR3Mwa3VvWmNoOXQxeEpCWlRHdGY4cnlE?=
 =?utf-8?B?QnFScHhaMjhEN0VaVTRoaVNKdk45L1NVL3pWcFVUMjRjdlMrbmx2UVp6eU45?=
 =?utf-8?B?cHBGRGRxYVlSeWgxTU1IVTAyTDNDUnpZUjdvVDEyM2NYZFdOUjNEeENMTloz?=
 =?utf-8?B?dnZZQlNzVkxFYmtOWHZCc2ovcEVidmhOczg3TDdGbnU0bjhoNWlQNGhOdlZE?=
 =?utf-8?B?YysyYnczaFdzUGlzSjYwU2pvZ2pZdythRFZVRG9mUWZ6VkE0QTNrMXdzRCtY?=
 =?utf-8?B?MlBaNk43SkRHdEZ2VElUWXBRWGsxZWg3T2V1RmtHWlJsTzdJcjRwRXhVWHNO?=
 =?utf-8?B?ZEUyeGJqUmcyZE1IbWdTcUNGWGhLZ0dxdFFLNGRITThOenFHbUI4NFNOTXZm?=
 =?utf-8?B?ZFJLSE5kbUN3QVVyQVkzdE9vSGgzV21Ea2l5N0VXY0xvNTlCRHlNYmsvMzN2?=
 =?utf-8?B?N0ZUaHlWZVFpN1RqeG5nSWJjWTBwMTM3TUtlWVM4NkZlcXpvV0VkSkdVWTVh?=
 =?utf-8?Q?F0GDMu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:46:40.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf18b7e-6ef2-4779-1882-08ddc5dfff6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0

On Fri Jul 18, 2025 at 8:42 AM CEST, Jan Beulich wrote:
> On 18.07.2025 02:04, Stefano Stabellini wrote:
>> On Thu, 17 Jul 2025, Jason Andryuk wrote:
>>> On 2025-07-17 13:51, Alejandro Vallejo wrote:
>>>> Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
>>>> behaviour on any hwdom/ctldom identical to that dom0 used to have, and
>>>> make non-dom0 have auto node affinity.
>>>>
>>>> Rename the function to alloc_dom_vcpu0() to reflect this change in
>>>> scope, and move the prototype to asm/domain.h from xen/domain.h as it'=
s
>>>> only used in x86.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>>   xen/arch/x86/dom0_build.c             | 12 ++++++++----
>>>>   xen/arch/x86/include/asm/dom0_build.h |  5 +++++
>>>>   xen/arch/x86/setup.c                  |  6 ++++--
>>>>   xen/include/xen/domain.h              |  1 -
>>>>   4 files changed, 17 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>>>> index 0b467fd4a4..dfae7f888f 100644
>>>> --- a/xen/arch/x86/dom0_build.c
>>>> +++ b/xen/arch/x86/dom0_build.c
>>>> @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
>>>>       return max_vcpus;
>>>>   }
>>>>   -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
>>>> +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
>>>>   {
>>>> -    dom0->node_affinity =3D dom0_nodes;
>>>> -    dom0->auto_node_affinity =3D !dom0_nr_pxms;
>>>> +    d->auto_node_affinity =3D true;
>>>> +    if ( is_hardware_domain(d) || is_control_domain(d) )
>>>
>>> Do we want dom0 options to apply to:
>>> hardware or control
>>> just hardware
>>> just dom0 (hardware && control && xenstore)
>>>
>>> ?
>>>
>>> I think "just dom0" may make the most sense.  My next preference is jus=
t
>>> hardware.  Control I think should be mostly a domU except for having
>>> is_privileged =3D true;

I could get behind just hardware, but I don't think the xenstore cap bears =
much
importance in this.

>>=20
>> Great question. Certainly dom0 options, such as dom0_mem, should not
>> apply to Control, and certainly they should apply to regular Dom0.

But what is a regular dom0, when not booted regularly? What is it that make=
s
dom0 quack like a dom0 and not like a domU? It may very well be the case th=
at
it's the regularity of dom0 that makes it a dom0, and cannot be sensibly
described in the presence of split ctl/hw domains.

>>=20
>> The interesting question is whether they should apply to the Hardware
>> Domain. Some of the Dom0 options make sense for the Hardware Domain and
>> there isn't an equivalent config option available via Dom0less bindings.

Well, bindings can be easily created. nmi=3D in particular can be trivially
directed anywhere via a boolean binding attached to any domain.

The fact that the bindings are less granular than the dom0 cmdline due
to not being needed until now.

>> I am not thinking about the dom0_* options but things like nmi=3Ddom0. F=
or
>> simplicity and ease of use I would say they should apply to the Hardware
>> Domain.

That's a fun case. So when nmi=3Ddom0 the report goes to the hwdom even if =
it's
not dom0 (i.e: late hwdom).

>
> Interesting indeed. So far we more or less aliased hwdom =3D=3D dom0.
>
> Jan

Some arguments do want to be adjusted one way or the other spec_ctrl.c make=
s
heavy assumptions about there not being any hwdom/ctldom separation, and bo=
th
having domain_id =3D=3D 0. There are other cases.

Yet another option is to single-out the Hyperlaunch/dom0less case and never
apply dom0 commandline overrides there (dom0_*=3D). It'd be a flag in
boot_domain. Might even allow us to compile them out altogether for
dom0less-only configurations (e.g: CONFIG_DOM0LESS_BOOT && !CONFIG_DOM0_BOO=
T, or
something like that).

Thoughts?

Cheers,
Alejandro

