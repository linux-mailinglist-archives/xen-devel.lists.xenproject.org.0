Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPKeJuPBu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:29:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF92C8AA3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256844.1551318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39gV-0008Uj-BE; Thu, 19 Mar 2026 09:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256844.1551318; Thu, 19 Mar 2026 09:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39gV-0008Ri-8L; Thu, 19 Mar 2026 09:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1256844;
 Thu, 19 Mar 2026 09:28:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYGS=BT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w39gT-0008RY-4q
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:28:53 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06c57243-2376-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:28:46 +0100 (CET)
Received: from PH8PR20CA0016.namprd20.prod.outlook.com (2603:10b6:510:23c::20)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 09:28:40 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::c1) by PH8PR20CA0016.outlook.office365.com
 (2603:10b6:510:23c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 09:28:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 09:28:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 04:28:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 02:28:39 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 04:28:37 -0500
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
X-Inumbo-ID: 06c57243-2376-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASJ/cP5nVzsmCS8O9oH6VV17pl9JYgd6Mef/Yp3QdbltkNQOY+XbOmS+82ou7MdL8UJx1B2FLwO9RdthVISkkpqz43IAL36vKOwXDS8Gk/m0EGjwRr2YSMLuaxMZy3jIYD7VMn+pHgNTDHuYF+bADSIBvCEsV6UNy7nvj6WZPSCA0w/1BSRmEKAi+UDfYvXRa1weGzCBNRp00odxKNhyAXUKmts/igCa+WeP4aKQlTOMR8QYU5nD4unLz1LIWsosLkQoCQAVe6gFCwL+J9OEdkeuB6DoOejomZCb+6+2yc/IBo8AZ7c72EMxbOVFUPm2f0puVaAUhCB4gSeXdZiifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdkG7nBL4T4qmr2bx0P9gnAO44WwwubE14ca1IziGG4=;
 b=Ix1t1Krml8xdhKBTpIlJi29wQUO4JnBUnTdQjrarE7q+6UCk56xrY6Bd+EGq1nbcbxYlD/LbQFbg3r7X0SnSofXCixjDTZDfwj/uf7gvm6PaSsBldppzCMBQYtuZPaCCYR2bk8M8iUeEYRQa5jkl9KgUnQIIOgOPhsNiTBqDbOny4DyhWpQUIoJsKsUP8/mVn1IYjubq/X4hXCUkXRcR5G2FZ0XflYJ/UsSU7zeKkAMeOWwtUI/qhYfmE3W/R2me+8l/vvsNza2/0xQB2gpa79ImEqusHJGHmgF9w2D62lZrTu5RfmcdBOky/RiNpuYUWzIHTPPBf7NsjtKgSIgv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdkG7nBL4T4qmr2bx0P9gnAO44WwwubE14ca1IziGG4=;
 b=Yhg5BCb0e88BIcycsa1chNGH60SluN1hwjZbdabdLxdN7X3aXFk6XDmtluAx1EiGUnP5r6bTmODbOfWWv6fif13RIqerErb4vj/K595ue5KU9umddCuCuLV/cl1h6laBsQ2/khhnRCPurB5FqADw8z1mZtx+jiGk79vDqEIq8zA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <47887f58-5654-465b-bcf9-65605a4a2bb9@amd.com>
Date: Thu, 19 Mar 2026 10:28:36 +0100
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
 <806731b5-6c56-4274-98f1-120530cfe398@amd.com>
 <CAGeoDV8hCwBgjKDsms68f8MnY0tEus6oGWC2v1uYNSYiUfWBBw@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV8hCwBgjKDsms68f8MnY0tEus6oGWC2v1uYNSYiUfWBBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 74022975-1bfe-45a3-b952-08de8599e7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1iwxOOj/D5ulF9oySt8WSoB3hEz0c8uuNIhmunNN0j9AQxTYywno4W3E4hQ9lm3ktHFmsy7mRn2hjXTeu87zO7igKxO6KGEfzcqodvRYGepDY42/xOD7lLnzjV5w3w9igs/QUSSCRDitulDqoreVbGGQ24NEdLCuMKclamg7jqJvYJ1xT2MY/+/H2ELauJRGOC49FQTYoxQ/+rnCKl5UW+ePMfvf3jL217ZPV0GHBCsbQVRr2ROfkuFZTafc81YBkz7cR2rrYNoap9TMjly9aff+swqwt3vAuDscZ4uy/AIg2bMxrwzhadNzVJNMa5Z0ZuwcOhAMnrDOJSMCMV0atUS66E0jZcynL/haQ2OvZUPwNYnBusjYUNHtsgPDUlHgFsA7PcAKWAAMvacY1P7SNEok1BkPDXqNlYU70hyqZrvJrZ77DtJggzaBXpztbwLMyFYuzgW+163WYqEU9xV6rOXvbMGIlviMUMU5K2xKODS2VtinaYsodJOsm9NtzfUesW6eruR0SEutYmN2w2AcvMGuQBdpGzq+/3aiIUvDssdcXakIEh541AHZBwAYV9omxixX9CSIGYe/0VixI+fLWdKO1M9d9iExeIkGayje42Q5xav6qg7PDrYSQntvNCCVkQb7he/u5z39Fyq0rGsa+wpvGzosiyCjsPmruYMnZAPwgwlDz6RRAWNB5AB9HIUBe47oy4+LsR2hjhaKg0j2FuhaV551SzB9+qiXZu2eARTcCvFppWfNqUzwZNmn0mfWcIGP8GxHIrndTPtok2X/kg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WF9nhbZoybApLkv4LtIcqdYtmCYoy71PDrUmBDX/SejWc7a16KAWazG2zPPl3IDS1uDKuz+r+oNBMaOi91Hhd3gQesQXsVLBnBDxL8dl+qj6/7nlg3Sw2pDjeg37yeKiF84hS5lwMbbi6cJwSPg1iCgYm6/GMTgm9otqzeX8D28sDd3yRO/k6/wH8eKV7IvfC+g71M8heoTaxplKWNRP1I7h/S17pfYxt14+mXEZ7yhyEfVgUTyepYkKCs6RGmxMjTTu/zZQoiTtoK8c11K7xmk1xzxa2u+MEpwyc8aL0OByjXHAvRdaAdIFlts1G3jyNZxi5ThbSxHcd9AyCtwdN0aRYjQHEnZ05ZCQgRwt57NOADaNvwZdB51LpNVdCAis+Z5JdxwlaaL0MK9vMnHeJqhRwzHebTNS2rBb4kC9LEzPbSw8ycORYR7tjFOSlMgE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:28:40.0194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74022975-1bfe-45a3-b952-08de8599e7ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 0EBF92C8AA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29/01/2026 12:30, Mykola Kvach wrote:
> Hi Michal,
> 
> Thanks for the review -- I think there are two separate concerns here
> (domain state vs. ARM-specific resume context), and it’s easy to conflate
> them.
> 
> On Thu, Jan 15, 2026 at 11:03 AM Orzel, Michal <michal.orzel@amd.com> wrote:
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
>> How does this check and returning -EINVAL correspond to...
> 
> The
> 
>   if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
> 
> guard is meant to validate the domain state for the DOMCTL resumedomain
> entry point (i.e. reject an xl resume on a domain that isn’t in the
> "suspend shutdown" state). Suspend requests issued via SCHEDOP_shutdown /
> SCHEDOP_remote_shutdown with reason SUSPEND still put the domain into
> is_shutting_down=1 and shutdown_code=SHUTDOWN_suspend, so they do pass
> this state check.
> 
> What the comment below was trying to say is different: those hypercall
> paths don’t go through vPSCI SYSTEM_SUSPEND, so they don’t populate the
> Arm-specific resume context (notably wake_cpu). In that case ctx->wake_cpu
> remains NULL and the Arm arch_domain_resume() returns early.
> 
>>
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
>> this comment? This patch assumes that we can now resume successfully (i.e. this
>> function returns 0 and common domain_resume can continue) only if the shutdown
>> was with SCHEDOP_shutdown. Anything else will infinitely keep the vCPUS paused.
> 
> Separately (and this is why I’m hesitant to make domain_resume()
> "suspend-only"): domain_resume() is also used by the soft-reset flow.
> Today soft-reset is effectively x86-only (gated by HAS_SOFT_RESET), but
> the core plumbing is in common code and is intentionally generic -- the
> soft-reset calling chain ends up using domain_resume() as a generic
> helper. If domain_resume() itself starts rejecting anything other than
> SHUTDOWN_suspend, it would also be a future trap if/when someone
> enables HAS_SOFT_RESET on Arm.
Ok, thanks for explanation.

~Michal


