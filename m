Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PX+INXcu2kmpQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:24:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9D2CA40C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256971.1551427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3BT1-0005xY-UB; Thu, 19 Mar 2026 11:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256971.1551427; Thu, 19 Mar 2026 11:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3BT1-0005um-Qi; Thu, 19 Mar 2026 11:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1256971;
 Thu, 19 Mar 2026 11:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYGS=BT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w3BT0-0005ug-6b
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 11:23:06 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe225c54-2385-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 12:23:03 +0100 (CET)
Received: from BLAPR03CA0100.namprd03.prod.outlook.com (2603:10b6:208:32a::15)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 11:22:57 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::4f) by BLAPR03CA0100.outlook.office365.com
 (2603:10b6:208:32a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 11:22:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 11:22:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 06:22:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 04:22:56 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 06:22:54 -0500
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
X-Inumbo-ID: fe225c54-2385-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLqLyLMjVVz7x+mXPQaDQJ3+3DLFoWK6v/b9QUeHdUkXOurqZgFPrP6CB5yj8/d7zR1lPU5c6XbQC2z+DckbpIDbnZIjWOR6Gr7qubFXOqOdGb7PZp0DoCgubMjn49y218hCFHRjak+Eqv8QhiXlYvsPDb9A3CZPlozAePOQoqQ0Wxn+W6DCNJYOXR8I030zHR3/mo+/1EQGde6DHghMfiaQAUkoRaTaiCOlwhRv+qEfGqn1bEp54yOL/xIRNypEqNM0OZWAOgCiXRv5k2/DKtsOa4/lSts5MEnXdCBEXwm7MooaFm4eSwKfmTlivp+UV0jH7PWBQP+4ZGRImUmCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr3nO03A93G2llvy3nxhrHIoxFGUN3TDwPL0nuvAyRE=;
 b=R+hXaeTEG8pvyd0JygcHTwI+5GwsBTzwMtCu2atCuSFyLAbfRZFMpUeyA263QsiwNSyAaAm2eSVuszwPYhyU1L1EENIRw15peEMzvwUfjRhZTd/lhnsGH9QThfabS+LeZQEaD1pgfV+/qO0fcRtt8aL+6QrCr7lkLujKjLM+lCPrq9L51izsETWTJWolcKAJpDoh945nWa9Cwj3jO81bTnrpHDL4FK0Al20qVWt6vCEkDya4SywD9eJtJuXwn1t8d/JCVzQFyiHaHxsLGtud8am+7TA1aRqF0JJMwPmIzYqu/6HJcEZk4hWgiEeg/5VC8xxYeKrVSBlIlBgAwd2qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr3nO03A93G2llvy3nxhrHIoxFGUN3TDwPL0nuvAyRE=;
 b=3193wkfveP2N+cqeMZ90JHFS07b2FSRBF3JbE+aQXbr0ksf3kYBW+r1CVdYmQJLLX8X1/6lAoVHqJDJof+o3DVI/VlK5K7csW692D2TUamr0+0sBCM0uX69rqExKF/1QI8PxBhpT0FhWW+QVQbuAIyYVjYEMCHPJ6du6nS+5hTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <07f32178-f265-431e-9e3b-9d2af4b0ec59@amd.com>
Date: Thu, 19 Mar 2026 12:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
 <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
 <04017286-885e-4e81-9e89-f012ee608287@amd.com>
 <CAGeoDV-oTMYnEJTibOyXFZqNKpyNA3Yf8ffUgEim=tsihs9W1A@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV-oTMYnEJTibOyXFZqNKpyNA3Yf8ffUgEim=tsihs9W1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b4ba68-40de-4935-9d2d-08de85a9df15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yUMj3RXVj1XcTuSWTppKwk3/oJo4cBkHesBlqiTHILnGiYAoleIGFflsbXf/58HS+5irCziNRnhSSC5jZMOiyCHAlcJLj76YjPmclptvWnHFiC+k2S0/KHu+fumo/gImaiNt/XAVVOBxSRN60H3b+P0pxvmP+WHTzvHDkO56L1bvH+OxkZmtOcb2uqD9xMYC298exGzqCdLTcpxVW5kH7DgIB9Q+4GLGKgJwwk6L25K6x6HsI2utr6ihIFvIytzYxHKMG1EAusyaSvALlCg0dGttvgHotqOdUoPfcsrSO4mZniQWgpkQ0d/trJOfh6R4XP04UgD2yvWyBYvrNFCZetAXl495iD01xuilTO1w7G9yeek6eVAiTbIQRHTgRKba4US5OvFw0A0V7r8yfFnlG8ucrPYi6hp36HpUL2kv0IJVZrJYb3ekIv8isgybwG+iv0fPE1aVfVabn6y32NrZ25f966hJF1DS58RPmY5/xXjxn/vH4zn+kvOYOYXqywO66g5ijity3v6+xuTztwpyz6qC7gy7KbE+zWHBlx39r3ikjXYSKCrX1pXh4gmYSIm3aWqWIrNFhqaW6dkBX1AkxZJe0Tpaz+h583L2kBd5BiZRz1nCpNYPngb6Ykyd8h7MPiwOf6I39d7PVTsoep6CpdE47/ezBZKW68KKWSkWhHrCmPNkAt0lWqkSsf7w8a1uPP8oLNjYX7b6yEzljtGABD8YiO0aLxE3MZLPKP4CF6eig/vHic4kKv4p27lC7xB4IXKmM080Vh308Ixba5bPPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	95jU+dz3WQpieEPn47sAAjJCKhOFePv5Z6RZgE+5LBJUNIl8Hw9/0lvKt6RM4SRdSHFy8PCfZznyYkmyUF0BExRI0IE6oelklaIXwFUfTpe/jKJ9wZoDTKU3aR/7cAOqvXws4GwNdJiYFK8xQBA/VHYvDwUlbhDaisr1YtvY4mE1b8I1D2BefTq/jbtlT9u6jzKbqRSRFUw0VcI/toGFNEAiJT6ywHJaavB97RPOLur5FhaqrMMbwA/GmuYK+TX+3NhKKxOHi174/htxi1FbldP7rGp9PoB+pP3asd2KMrl3xba7Zr8mnmavYc5ivq/6DK/Ps7uRmR+FzpcQA/wfWAGSFmH10msRZIVx56jNNIeYQpsugeblgaqYE8p96JaGEjBu0qCKzLfI42zJ+xmVjMc+gETuOiLrQQq1AJHJ/UfEk1kd/u1sEhAjDiy5AxLn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:22:57.1448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b4ba68-40de-4935-9d2d-08de85a9df15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A1E9D2CA40C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/03/2026 11:14, Mykola Kvach wrote:
> On Thu, Mar 19, 2026 at 11:37 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 12/12/2025 14:18, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
>>> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
>>> (both 32-bit and 64-bit variants).
>>>
>>> Implementation details:
>>> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
>>> - Trap and handle SYSTEM_SUSPEND in vPSCI
>>> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>>>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>>>   in hwdom_shutdown() via domain_shutdown
>>> - Require all secondary VCPUs of the calling domain to be offline before
>>>   suspend, as mandated by the PSCI specification
>>>
>>> The arch_domain_resume() function is an architecture-specific hook that is
>>> invoked during domain resume to perform any necessary setup or restoration
>>> steps required by the platform. arch_domain_resume() stays int to propagate
>>> errno-style detail into common logging; preserving the integer keeps the
>>> reason visible and leaves room for future arch-specific failures or richer
>>> handling.
>>>
>>> The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
>>> the vCPU context (such as entry point, some system regs and context ID) before
>>> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
>>> code and avoids intrusive changes to the generic resume flow.
>>>
>>> Usage:
>>>
>>> For Linux-based guests, suspend can be initiated with:
>>>     echo mem > /sys/power/state
>>> or via:
>>>     systemctl suspend
>>>
>>> Resuming the guest is performed from control domain using:
>>>       xl resume <domain>
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in V16:
>>> - Refactor error handling in domain_resume: move logging to generic code,
>>>   use explicit return code checking.
>>> - Make context clearing conditional on success in arch_domain_resume.
>>> - The 'int' return type is retained for arch_domain_resume for consistency
>>>   with other arch hooks and to allow for specific negative error codes.
>>> ---
>>>  xen/arch/arm/domain.c                 |  39 +++++++++
>>>  xen/arch/arm/include/asm/domain.h     |   2 +
>>>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>>>  xen/arch/arm/include/asm/psci.h       |   2 +
>>>  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
>>>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>>>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>>>  xen/common/domain.c                   |  10 +++
>>>  xen/include/xen/suspend.h             |  25 ++++++
>>>  9 files changed, 205 insertions(+), 22 deletions(-)
>>>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>>>  create mode 100644 xen/include/xen/suspend.h
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 47973f99d9..f903e7d4f0 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -12,6 +12,8 @@
>>>  #include <xen/softirq.h>
>>>  #include <xen/wait.h>
>>>
>>> +#include <public/sched.h>
>>> +
>>>  #include <asm/arm64/sve.h>
>>>  #include <asm/cpuerrata.h>
>>>  #include <asm/cpufeature.h>
>>> @@ -24,10 +26,12 @@
>>>  #include <asm/platform.h>
>>>  #include <asm/procinfo.h>
>>>  #include <asm/regs.h>
>>> +#include <asm/suspend.h>
>>>  #include <asm/firmware/sci.h>
>>>  #include <asm/tee/tee.h>
>>>  #include <asm/vfp.h>
>>>  #include <asm/vgic.h>
>>> +#include <asm/vpsci.h>
>>>  #include <asm/vtimer.h>
>>>
>>>  #include "vpci.h"
>>> @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
>>>      p2m_domain_creation_finished(d);
>>>  }
>>>
>>> +int arch_domain_resume(struct domain *d)
>>> +{
>>> +    int rc;
>>> +    struct resume_info *ctx = &d->arch.resume_ctx;
>>> +
>>> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>>> +    {
>>> +        dprintk(XENLOG_WARNING,
>>> +                "%pd: Invalid domain state for resume: is_shutting_down=%u, shutdown_code=%u\n",
>>> +                d, d->is_shutting_down, d->shutdown_code);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * It is still possible to call domain_shutdown() with a suspend reason
>>> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
>>> +     * In these cases, the resume context will be empty.
>>> +     * This is not expected to cause any issues, so we just notify about the
>>> +     * situation and return without error, allowing the existing logic to
>>> +     * proceed as expected.
>>> +     */
>>> +    if ( !ctx->wake_cpu )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
>>> +                d);
>>> +        return 0;
>>> +    }
>>> +
>>> +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
>>> +    if ( !rc )
>>> +        memset(ctx, 0, sizeof(*ctx));
>>> +
>>> +    return rc;
>>> +}
>>> +
>>>  static int is_guest_pv32_psr(uint32_t psr)
>>>  {
>>>      switch (psr & PSR_MODE_MASK)
>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>> index 758ad807e4..66b1246892 100644
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -5,6 +5,7 @@
>>>  #include <xen/timer.h>
>>>  #include <asm/page.h>
>>>  #include <asm/p2m.h>
>>> +#include <asm/suspend.h>
>>>  #include <asm/vfp.h>
>>>  #include <asm/mmio.h>
>>>  #include <asm/gic.h>
>>> @@ -126,6 +127,7 @@ struct arch_domain
>>>      void *sci_data;
>>>  #endif
>>>
>>> +    struct resume_info resume_ctx;
>>>  }  __cacheline_aligned;
>>>
>>>  struct arch_vcpu
>>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>>> index effd25b69e..8dfcac7e3b 100644
>>> --- a/xen/arch/arm/include/asm/perfc_defn.h
>>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
>>> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>>>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>>>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>>>  PERFCOUNTER(vpsci_features,            "vpsci: features")
>>> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>>>
>>>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>>>
>>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
>>> index 4780972621..48a93e6b79 100644
>>> --- a/xen/arch/arm/include/asm/psci.h
>>> +++ b/xen/arch/arm/include/asm/psci.h
>>> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>>>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>>>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>>>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
>>> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>>>
>>>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>>>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>>>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
>>> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>>>
>>>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>>>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
>>> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
>>> new file mode 100644
>>> index 0000000000..313d03ea59
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/suspend.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef ARM_SUSPEND_H
>>> +#define ARM_SUSPEND_H
>>> +
>>> +struct domain;
>>> +struct vcpu;
>>> +
>>> +struct resume_info {
>>> +    register_t ep;
>>> +    register_t cid;
>>> +    struct vcpu *wake_cpu;
>>> +};
>>> +
>>> +int arch_domain_resume(struct domain *d);
>>> +
>>> +#endif /* ARM_SUSPEND_H */
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * tab-width: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
>>> index 0cca5e6830..d790ab3715 100644
>>> --- a/xen/arch/arm/include/asm/vpsci.h
>>> +++ b/xen/arch/arm/include/asm/vpsci.h
>>> @@ -23,12 +23,15 @@
>>>  #include <asm/psci.h>
>>>
>>>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
>>> -#define VPSCI_NR_FUNCS  12
>>> +#define VPSCI_NR_FUNCS  14
>>>
>>>  /* Functions handle PSCI calls from the guests */
>>>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>>>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>>>
>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>> +                          register_t context_id);
>>> +
>>>  #endif /* __ASM_VPSCI_H__ */
>>>
>>>  /*
>>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>>> index 7ba9ccd94b..c4d616ec68 100644
>>> --- a/xen/arch/arm/vpsci.c
>>> +++ b/xen/arch/arm/vpsci.c
>>> @@ -10,32 +10,16 @@
>>>
>>>  #include <public/sched.h>
>>>
>>> -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>> -                            register_t context_id)
>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>> +                          register_t context_id)
>>>  {
>>> -    struct vcpu *v;
>>> -    struct domain *d = current->domain;
>>> -    struct vcpu_guest_context *ctxt;
>>>      int rc;
>>> +    struct domain *d = v->domain;
>>>      bool is_thumb = entry_point & 1;
>>> -    register_t vcpuid;
>>> -
>>> -    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>> -
>>> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>> -        return PSCI_INVALID_PARAMETERS;
>>> -
>>> -    /* THUMB set is not allowed with 64-bit domain */
>>> -    if ( is_64bit_domain(d) && is_thumb )
>>> -        return PSCI_INVALID_ADDRESS;
>>> -
>>> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>> -        return PSCI_ALREADY_ON;
>>> +    struct vcpu_guest_context *ctxt;
>>>
>>>      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
>>> -        return PSCI_DENIED;
>>> -
>>> -    vgic_clear_pending_irqs(v);
>>> +        return -ENOMEM;
>>>
>>>      memset(ctxt, 0, sizeof(*ctxt));
>>>      ctxt->user_regs.pc64 = (u64) entry_point;
>>> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>>      free_vcpu_guest_context(ctxt);
>>>
>>>      if ( rc < 0 )
>>> +        return rc;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>> +                            register_t context_id)
>>> +{
>>> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +    int rc;
>>> +    bool is_thumb = entry_point & 1;
>>> +    register_t vcpuid;
>>> +
>>> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>> +
>>> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>> +        return PSCI_INVALID_PARAMETERS;
>>> +
>>> +    /* THUMB set is not allowed with 64-bit domain */
>>> +    if ( is_64bit_domain(d) && is_thumb )
>>> +        return PSCI_INVALID_ADDRESS;
>>> +
>>> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>> +        return PSCI_ALREADY_ON;
>>> +
>>> +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
>>> +    if ( rc )
>>>          return PSCI_DENIED;
>>>
>>> +    vgic_clear_pending_irqs(v);
>>>      vcpu_wake(v);
>>>
>>>      return PSCI_SUCCESS;
>>> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>>>      domain_shutdown(d,SHUTDOWN_reboot);
>>>  }
>>>
>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>> +{
>>> +    int32_t rc;
>>> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +    bool is_thumb = epoint & 1;
>>> +
>>> +    /* THUMB set is not allowed with 64-bit domain */
>>> +    if ( is_64bit_domain(d) && is_thumb )
>>> +        return PSCI_INVALID_ADDRESS;
>>> +
>>> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
>>> +    if ( is_hardware_domain(d) )
>>> +        return PSCI_NOT_SUPPORTED;
>>> +
>>> +    /* Ensure that all CPUs other than the calling one are offline */
>>> +    domain_lock(d);
>>> +    for_each_vcpu ( d, v )
>>> +    {
>>> +        if ( v != current && is_vcpu_online(v) )
>>> +        {
>>> +            domain_unlock(d);
>>> +            return PSCI_DENIED;
>>> +        }
>>> +    }
>>> +    domain_unlock(d);
>>> +
>>> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
>> There is a theoretical race between this and ...
>>> +    if ( rc )
>>> +        return PSCI_DENIED;
>>> +
>>> +    d->arch.resume_ctx.ep = epoint;
>>> +    d->arch.resume_ctx.cid = cid;
>>> +    d->arch.resume_ctx.wake_cpu = current;
>> setting up resume context. It is practically impossible but still we could move
>> setting up the context before domain_shutdown and clearing it on failure to be
>> race free. The race is about small window between domain_shutdown releasing the
>> shutdown_lock and other CPU calling domain_resume, taking the lock and running
>> arch_domain_resume before resume_ctx has been populated.
> 
> I think the current flow is already serialized, so I don't believe
> arch_domain_resume() can observe an uninitialized resume_ctx here.
> 
> A concurrent domain_resume() does not take shutdown_lock first. It starts
> with domain_pause(d), and that path is synchronous: it walks all domain
> vCPUs and uses vcpu_sleep_sync().
> 
> In the SYSTEM_SUSPEND path, the calling vCPU is still running after
> domain_shutdown() returns, and it populates resume_ctx before leaving the
> hypercall path. So if another CPU tries to resume the domain in that
> window, it should block in domain_pause() until that vCPU stops running.
> Only after that can it take shutdown_lock and proceed to
> arch_domain_resume().
> 
> So, as far as I can see, arch_domain_resume() should not be able to
> observe an uninitialized resume_ctx in the current flow.
> 
> Also, moving resume_ctx setup before domain_shutdown() would slightly
> complicate the failure path, since we would then need to explicitly
> clear/invalidate the pre-populated context if domain_shutdown() fails.
> 
> So unless we think this race is actually reachable, I would prefer to
> keep the current ordering. That said, if you strongly prefer making the
> ordering more explicit, I can rework it that way.
No, you're right. Resuming CPU will block until the suspending vCPU has fully
stopped, so the race is impossible.

~Michal


