Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09BAC0D9B
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994058.1377101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6a2-0006qo-4I; Thu, 22 May 2025 14:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994058.1377101; Thu, 22 May 2025 14:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6a2-0006oQ-1T; Thu, 22 May 2025 14:07:30 +0000
Received: by outflank-mailman (input) for mailman id 994058;
 Thu, 22 May 2025 14:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/RR=YG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uI6a0-0006oK-Lb
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:07:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1616f900-3716-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 16:07:26 +0200 (CEST)
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:07:22 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::50) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Thu,
 22 May 2025 14:07:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 14:07:21 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 09:07:19 -0500
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
X-Inumbo-ID: 1616f900-3716-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjBIzlRu/rLQIFJThF0i7xDdBs4mirk5wY4YTCyn32gUx864E0xbiqRpGs028TmJHrPAsvNA/xHdanS7lR4hmt2sBojgiv2obLFspPzEALlJ/IQN80HV+vd8aScfyIYtWbjAKIUiXfLzPCEe6AB/3Y9WoMJgelHlTDMmUCIJgLGVoUqhPC8VRaBDOHkC5CRu9491T4JKBXV7MpUj2loRiYmxyH44GzLJ0rD1quA1NkoIi8kzqohM1vdNTbOyDJCc0DyJdB3Mg1d4HG9UeSc9xSkBZfQ1Yi5U1mXJQsdGG/dQTYMFGlvnW4hUAIbU9hdfUJMo89GjA1TGaJfDD6iNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV6cTio2L9OT3+QQPqcHUlzTFaFVxKZcp8ZxyuZ4dqA=;
 b=qcALVtDAE2gatPfXl4oJOkUmYlJ7ptk8m+B/pgvIAP/pqofe8l8TUBY+cCC8FIN25IacFu4dUkw4IZh8aLqjIvZTGMkxEUj+sM5p3CQCMed6BA+Sd/VeK2JFXvCjVAj0IrD2pjt/6Y7hgDf+uAdhzhjSdfZzrSPXSv5q/sKhixNt1OzVJLJIyfofuxjybFk4OWmBIPtIsPpTeKotDPKc04Rle5HR28dq0MB+mmzk+Qn4kUIhRtMTObFVlZTgftabkGYcilsY7WYyh7vBIxIpAiGc8cS71STCQgeFaB7EdOfMWJ+6K9mr/dwRu8spPw3bw9ZOOsX07dyqPGbwa7P1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV6cTio2L9OT3+QQPqcHUlzTFaFVxKZcp8ZxyuZ4dqA=;
 b=PF/8dSFT5quHWncwmLeCJHy9mcm7plttwMPP7hxbL4XfRHG7drCyVNLUOQuMasgbdZPNPH0GXBIOFsBe/qNA/CJ1h8VGu13W7xDFr6Q0PlOQR4BVGymUBspyxN/vECMQoPtBFGMaPlXzVh1NP2rJYDaCttbj/O3MkbQIYIkZEhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 May 2025 16:07:17 +0200
Message-ID: <DA2QXMFRM1ZY.306NI4IC9CCP1@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain
 builder
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
 <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
 <29a55d44-c26e-4834-b93b-47cbd98f885e@suse.com>
 <f199c2a3-88c6-4578-8667-2060a79285d6@apertussolutions.com>
 <f8828ac3-face-401b-bad6-84eef390cab6@suse.com>
 <6e3f3727-d084-40b9-a42a-46c52e770c88@apertussolutions.com>
In-Reply-To: <6e3f3727-d084-40b9-a42a-46c52e770c88@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 5232ccfc-25b9-4420-7ed3-08dd9939f890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkpDMSs3YXpLQlBLYUYzb1Y4Sml2NXhRRHJuUlZMM1lXSm52Zkw4N2dCbVlN?=
 =?utf-8?B?YWV4WU56NG9hZEU5SHBzb2lsT3RNZU9qUHJSMWIwUnpmb0pvM0drbjJtMkty?=
 =?utf-8?B?aHlCVlY5Z2tmeitINTVXUVRwUUFoZUJOZ2JJMlhMQ3hpaTl6U04zREZPbjh2?=
 =?utf-8?B?OE02Y2ZaekRySWFTRlZIS21seFlZdlpKUnJQelBkZFpCUXVFQzU4UTJPbXJ4?=
 =?utf-8?B?c2lVZVVWbU9oQ1ZXVVNuQU5FcHdCV3loaTB2VWF6aGowOGJteHRiVDRocGlL?=
 =?utf-8?B?aGRJczd3MStPM2Nlckk5M3l1NUxnZDdtSWUrUUcvUzh6Z1lFSDVMQjlnT3Iw?=
 =?utf-8?B?c2hUOHhYOFd2OTRHbVR2SGwzYnhvd2Q3aHNIL0Rpb2MyY2h6R2tUY0d4ZVZB?=
 =?utf-8?B?dnN6cmJMU010TzQxblYyNmRvTExHbVNpZUF3Q0NiMU90cnlYUDBxc1VHWjZa?=
 =?utf-8?B?N0ZVNy9GV0I2K0RlMVlqV0N0Zm5MaTNyeVFrWGJVeTRUTEpaK3Rmb0VYb3FI?=
 =?utf-8?B?OEhLbTVHUTkxYWV1dXc3RVBSRmM4QzFTMGViWWVkMWh0amFORVVlcmtub3JT?=
 =?utf-8?B?Rkt4ajhwYzNpYnJwTnNEUnJ5VkZaeUZsUDB5eDRrWEYxcWdabndTNnFKazVD?=
 =?utf-8?B?dGtwSStpQWw3UU9TSUVuRnBjZVdxWGxyVE81c2hkcFVlYjZZR1plM3oxa1la?=
 =?utf-8?B?L0dkZFRwcXBMZUMyaHpRdVNpd1ZzdERTN3VJQ1lXbnMwYnNjTSs4dlc3bkhX?=
 =?utf-8?B?M3FYcHJteFowSkQxODAvOE5obm1nK2NsYzlVbVVNOUJRTDVJN1pUN0Q1WU9D?=
 =?utf-8?B?SWZWcGN0WjFKK3hNTnh3V0NIbkJtMW5RS1ZRYkkyc0Z6empoMEEzRHJBbHVK?=
 =?utf-8?B?SnZiWE1kaGhFdW4rTk5qdmQ3VStDc1UzeXdkYThJUFM1WXJmY1hKNDY4OFJs?=
 =?utf-8?B?dUJCdFVGb0lBbVJEWWlnTGN0QVVHQk5DbVlYb2VrMGRVb00vM0FjS0t2azRk?=
 =?utf-8?B?TmwyOWJTZmk4MHFrdU9MeXhTWTd4L2loZGh1NlkyQnovVTh0VXFiMm92ZFR0?=
 =?utf-8?B?WGs2N2xNZ2pJUVR1UjZldFdKUDArQmtWd0VJN0NGbGNSdm82SVhGRUgrTFdU?=
 =?utf-8?B?bTRoajJ5MkE4cm9yUWdXcVZJUVcvV2R4YnR5SWtHWU9leEdMcklGdVVtT1NP?=
 =?utf-8?B?ZVRzZ1duSzdPK2J2MXFYeDVybis2V3ZUditZUzBJQllFbmVPNE1VWGdCUXFx?=
 =?utf-8?B?UklZa054WXRJVkpXOXZ1UnNXZDBHNkVic3gyNmN6TFRZT2cxQTJFQTE3a1M4?=
 =?utf-8?B?VGxmRXZud2FJUWhJQkIzQUUxUmtVeUFUUngzbklQelp2NEdWcXhRMkwxWnFz?=
 =?utf-8?B?cmNsMS90Y1Nzdkd6ZFc4YjBpOWQxNFZXNG5xaC9JWlo5eWhmN0V1NlhINXEr?=
 =?utf-8?B?SkhJSHNmdTQ5L1dSTGtETnJCSUg3ODBYaTExdFZaR2g5cTYxSGtETzhEak1z?=
 =?utf-8?B?UFFKYkRmaUFPTm4zSllGcjNhbmFyVmY1Q1JUYTdzU01KelF5UTRpOGJJdm5V?=
 =?utf-8?B?UW1uV3gweWh0ZUhFN1JWc2M3M0cvSzZVV0ZPdXlhcythb0hCeC9yc1lROVJU?=
 =?utf-8?B?NzFoUDUyWHVqSFJObEtxRUQ5czdDK1V6YzhGbUlOaUh5KysvNkdycndoNGlo?=
 =?utf-8?B?ZTh3TVRyY0IyWGY1SXNBcHo4UFFmV0MrckM4MFBIRzFwMktrVTVCNDR3Y3Vn?=
 =?utf-8?B?Q0dWOHBTcGZWekdOWGNUYnpVSHliem5sN28yUUlJYjdCSWI0V2J2UXp3VUY3?=
 =?utf-8?B?ODMvdjBNTkJZTytteFhwOUlRT1lqalAyc2ozUkUvUkhGeUZhZ2U3enpNTTMz?=
 =?utf-8?B?V3ZqZ1NPS3k5V2sxbWFxamdTOW84SVFuejl0ZytFWmtoVXhYWERabGthSy9i?=
 =?utf-8?B?dXI4czNuRDZCUHNrRGFuaHJlZ1JLS2ZtOVVTdW9EU2RidHh2OHhIdEp2OXBt?=
 =?utf-8?B?VElNcFdDdVZibmx4a2hvMVBVcW5jMzVuYmtCYjZIYWZDNkVDMlRUeXY2eU1n?=
 =?utf-8?Q?vfPeOY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:07:21.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5232ccfc-25b9-4420-7ed3-08dd9939f890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089

On Wed May 14, 2025 at 12:23 AM CEST, Daniel P. Smith wrote:
> On 5/13/25 04:05, Jan Beulich wrote:
>> On 06.05.2025 21:29, Daniel P. Smith wrote:
>>> On 5/2/25 03:21, Jan Beulich wrote:
>>>> On 30.04.2025 20:56, Daniel P. Smith wrote:
>>>>> On 4/29/25 08:36, Alejandro Vallejo wrote:
>>>>>> --- a/xen/common/Makefile
>>>>>> +++ b/xen/common/Makefile
>>>>>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=
=3D device.o
>>>>>>     obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
>>>>>>     obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>>>>>>     obj-y +=3D domain.o
>>>>>> +obj-$(CONFIG_DOMAIN_BUILDER) +=3D domain-builder/
>>>>>
>>>>> Please don't do this, use IF_ENABLED in core.c and then hide the
>>>>> unnecessary units in domain-builder/Makefile as I originally had it.
>>>>> This allows for a much easier time incrementally converting the dom0
>>>>> construction path into a generalized domain construction path.
>>>>
>>>> That is, are you viewing this as a transitional thing only? If the end
>>>> goal is to have it as Alejandro has it above, that may be acceptable
>>>> (even if not nice).
>>>
>>> There is/will be shared domain construction code between dom0-only and
>>> multidomain construction, with it will all living under domain builder.
>>> So no, the end goal is not what Alejandro just did. The end result will
>>> be the way I had it, with a different kconfig option to enable/disable
>>> the multidomain construction path.
>>=20
>> Isn't CONFIG_DOMAIN_BUILDER a misnomer then?
>
> Which is why I originally had two kconfig flags, one to enable dtb=20
> parsing for domain configuration, which allowed dom0 construction from=20
> dtb. Then there was the second flag that was to enable multi-domain=20
> construction. I have reworked a portion of the approach in the RFC based=
=20
> on feedback, which is based off of this series. In it, I tried to=20
> minimize how much went into common, but you will see how I still had to=
=20
> rework the kconfig flags.
>
> v/r,
> dps

Does it really make sense to have a flag to restrict multidomain while
allowing parsing the DTB? There's virtually nothing compiled out in that
case.

If you did it that way because it doesn't initially build several
domains, that's just transitional and to be expected on any feature
tagged as unsupported with (EXPERIMENTAL) in the name.

What if I collapse everything under a single CONFIG_MULTIDOMAIN_BUILDER
that compiles-in support for parsing DTBs while introducing an
unconditional builder as I go? From what I'm seeing, there are no
breaking changes in the series and the end goal is to have the builder
be unconditionally used, after all.

In fact, with the bindings code in common, I can also collapse everything
in core.c (and later domain.c) into a single arch/x86/domain-builder.c
that is unconditionally compiled in. The DTB parsing logic is already=20
in separate files and that can be compiled out with
CONFIG_MULTIDOMAIN_BUILDER flag.

In retrospect, after looking at dom0less long enough there's bootfdt.c and
bootinfo.c with similar intent, but far more ad-hoc cohesion. While the
builder wants to be in common, no other arch is in a position to take
it. It needs merging with the stuff done in bootfdt.c/bootinfo.c

So, in short. I'm planning to:

  1. Collapse domain-builder/{core,domain}.c into domain-builder.c
     under arch/x86. There's little reason to have them separate.
  2. Remove CONFIG_DOMAIN_BUILDER, and replace it with something that
     reflects the intent of using a DTB. Either CONFIG_MULTIDOMAIN_BUILDER
     or CONFIG_DTB_BUILDER. Or maybe even CONFIG_DTB_BOOT.
      * I specifically want to avoid CONFIG_BOOTFDT, because that'd
        create confusion with the already existing bootfdt.c in common.

and, from the discussion in the other thread about code sharing in the
spirit of getting somewhere soon:

  3. Do minimal parsing at builder_init() (module identification,
  basically), and do the full parsing by the create_dom0() mark,
  immediately before constructing all domains. With the unflattened
  tree.

Moving forward I for sure want to merge the boot paths in the x86
builder with those of arm/riscv. Having a unified boot frontend can only
bring niceness.

Cheers,
Alejandro

