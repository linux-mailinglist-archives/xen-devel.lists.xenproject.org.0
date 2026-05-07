Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPtIBSA2/Gl2MwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 08:50:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A594E3B5C
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 08:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302169.1576153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKsXX-0002OZ-OH; Thu, 07 May 2026 06:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302169.1576153; Thu, 07 May 2026 06:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKsXX-0002Le-ID; Thu, 07 May 2026 06:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1302169;
 Thu, 07 May 2026 06:48:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKsXW-0002LY-8C
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 06:48:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKsXV-00BrPz-5s
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:48:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fc35c9-5cb7-0a2a0a5109dd-0a2a4509cea2-28
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 08:48:52 +0200
Received: from [52.101.193.58]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fc35d3-2497-0a2a45090019-3465c13a199b-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 08:48:52 +0200
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:48:43 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:303:86:cafe::55) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 06:48:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Thu, 7 May 2026 06:48:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 01:48:42 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 23:48:41 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 7 May 2026 01:48:40 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MByHTuFJfj6xJDWHKN0NGM9U1kI2DLzFWfAqaZmfxPDjJQHJ22BNXfyZi0Uvom9h1y7ZubMv4qQOQeh26uAXnk8RMkyCSw2rjdImmkmwhapf85fqa0mVnJIY+DNMvAGjxEDTEhM9oYsAwW519vemsp0x9yh+i9OqD2UXNy2IIE+v9kIU00i06Q31i6q7fDzFIXlgoVLjZ23LZQTskM9i1SjqFpMKcg1j6XH2h35AmZLEUIgNwVvA3OCf0KPtLIg18oSBZU1+a7qzfDkgsPbC2nYA0YIFRJqgU00EB3cO4SvG4ZO/RjhVtatvcIh4Gl8upBV/rZbizJwuy4FjSgoVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQnsXo8ShLlcSLHfB3gU9u0PBi2v1z/C0PjQy49ENPM=;
 b=FfjLNfnbLMMj6tv7RUEyOjbrkapi9J3jRfPeGvjEmn7gf5/a14rI/+noOas6a8TcFqQDVCEndodZ9aDnp1Lu/0y9QSfLbbqiG1JC7zGHjmpGJdSX6GS9b6ICgpBwzhuF195uphwHovza9sDMS2vziOCGE1SExB+xPCj+JmR6Bkl0JKeTizU32FTLXpy9mmn2XmCYH7HEk6srtcT8UUvgm2/f78DZmCHKrxJSBHuRgGLoKpXyRvAGmQg0wdj3Re5fX1N/Oiyja997CI7I2wqzM3gooAtp5bC0pMrXQMOJ4R+Ky2oUNOHM4DFcXDovLZ+ai2ic3Cig+V4IS77cZ0SYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQnsXo8ShLlcSLHfB3gU9u0PBi2v1z/C0PjQy49ENPM=;
 b=EfUNE6WnAg1G3K6gMpk/rLyzZiZqsjHY6sGZbH8+tkydXnYaUAlcWVf97zfmC3agOKaRFHZhVGU1QJZpxaGOUS69is5OVX8sAPu7DPipAUP4HmAEmInTt4q+64EXsvyiX3v44uzV/1mr+aPPv2YPF+KEH4II7n1jUm/g6VSa+eA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8375cb34-9e95-4ca7-9d72-4dcf9fbe27c7@amd.com>
Date: Thu, 7 May 2026 08:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
 <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
 <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
 <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|LV8PR12MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fbf7d7-2051-43d6-0a69-08deac04adae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9WcO3wZriRiSUg02H7d4cG/sjHJC4YlmxZiO1YKmpeY05vBkc2lx4so5zKZ8xhYbsdCVZ9cb/nM0MHsH48u4nsk0rxU8L1yCasracCFB1p28CeTuMMjcoL01vSblS/ILoaRzk2plmIhJqDNFkFgCtrsCqMHd1bhxnox4p2fm/6zel3FC5eps5R2okN1+AIUfUEKLfj7/lC7rQdxf7rKffvEu7imI8wfpXkwBdntP4bLSEsj31XNAQK2zLdOM4ebFeGJnhEnAyUJeeNVqN8zC7wAdPyxdNRk1N6cYdIL0XGLyulGl6wXdA9U2/K44wgnJEbvDCD9sbQtbmPvYNrIbj0mfzbwv144Fg6YsUMeP14pT8YDDM9E1TVdqgjZqkB/cduK56oZNFbm7O/WIbDA3n/iz+nrNebrQzKyxu2mNJnp7JZTUYJkBpNUIFavX5QjyK5F2uzg8xlsBQ/LZhCK77hWXIuh/MwlbchtkjrDXQmUX9/J8o7znbtdaTmBrvsNs0tgGi7qfgB4vikgdM2s1vgZJnyM8laJ64qiTuXneA1x80hXMLE13KFL4J2+m4WUeiaca33q8u8YWRobrkVvwQ7z20aBEFB+sRlPZzAKQcFyhH7jolo9Rtvp0z052FRDiEboV+FjtR8FprYYw05nNZ6ydknGSPsaRXzge/IF8IS5yd+tKyFrteyWuKpMYVWXqUsQZwgD7etsn0DfY5gjk4Yaj19nQJp0Bc4XnZD84tqw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X2n/tAOOld4fwwL8Tao3u/NYN/Y2+q5DOce4SfuaLq/JTq4RMDWQq8O0hlyFsU1kmN8+PMo99V3+D1MX3wosomepzcw4gGcQIErZgsqCAiSPUn80RnlFPVVm8VZ6ktQom2OKuJRZXAzk/D6d++9+M0zS11i6ci5GGFIRvSkypr4t1igKay/IYz2vUiBD3wFAILFfIobmGK54gV7+EHtqHjVD2M/ph/Owmt3QXLc/MCLa+aY3gdcmRhGIETEyWENgrOxX4VsN83YtRWtBS5/tL3xPKZMeb4I/sghsb5bQBiZyNQ20vA+utDMpX35ptkvNkI21+IWAEqpqI+FBcx1uG1hEbBL5F4IH/jXX6fP+uzjNgEVKvESj3ilRRkzLRqEr0wbi+fe1YO0kGQJVM92zAB36WOqxNSZPFw/F/yZCjaSxuLfWzPUDQSMvY8jh806Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:48:42.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fbf7d7-2051-43d6-0a69-08deac04adae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619
X-purgate-ID: tlsNG-bad1c0/1778136532-88970A53-BD0BDF50/10/73395122804
X-purgate-type: spam
X-purgate-size: 3246
X-Rspamd-Queue-Id: 66A594E3B5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 06-May-26 09:44, Oleksii Kurochko wrote:
> 
> 
> On 5/4/26 2:21 PM, Jan Beulich wrote:
>> On 27.04.2026 17:34, Oleksii Kurochko wrote:
>>> As domain type is part of common code now there is no any reason
>>> to have architecture-specific set_domain_type() functions so
>>> it is dropped.
>>>
>>> Change the guard around access of kinfo->type to CONFIG_HAS_DOMAIN_TYPE
>>> for consistency. Also, drop and add some parentheses to be aligned
>>> with the similar if() below.
>>>
>>> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
>>> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. Since x86_32 Xen no
>>> longer builds, the fallback is currently only relevant for arm32.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> In principle:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>> However, still a few remarks:
>>
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -13,6 +13,19 @@ struct guest_area {
>>>       void *map;
>>>   };
>>>   
>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>> +enum __packed domain_type {
>>> +    DOMAIN_32BIT,
>>> +    DOMAIN_64BIT,
>>> +};
>>> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
>>> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
>>> +#elif !defined(CONFIG_64BIT)
>>> +/* At the moment on 32-bit-only platforms all domains are 32-bit. */
>>> +#define is_32bit_domain(d) (true)
>>> +#define is_64bit_domain(d) (false)
>>
>> I think it would be nice if the excess parentheses were dropped from here.
>>
>>> --- a/xen/include/xen/fdt-domain-build.h
>>> +++ b/xen/include/xen/fdt-domain-build.h
>>> @@ -7,6 +7,7 @@
>>>   #include <xen/device_tree.h>
>>>   #include <xen/fdt-kernel.h>
>>>   #include <xen/mm.h>
>>> +#include <xen/sched.h>
>>>   #include <xen/types.h>
>>>   
>>>   struct domain;
>>> @@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>>>       return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>>>   }
>>>   
>>> +static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>
>> Pointer-to-const for the 2nd parameter?
> 
> I will apply this comment and comment above.
> 
>>
>>> +{
>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>> +    /* Type must be set before allocate memory */
>>
>> This comment would be more prominent if it lived outside of the #ifdef,
>> perhaps (read on) ahead of the function. I wonder though why it's only
>> a comment, and not e.g. an assertion. If an assertion was possible to
>> add, the comment would want to live next to it. Without an assertion
>> putting it ahead of the function may be better.
>>
>> Depending on how far to go, changes could be made while committing, or a
>> proper v5 may want submitting.
> 
> I think that instead of comment or just after comment the following 
> could be added:
>    ASSERT(!domain_tot_pages(d));
> 
> Jan, Michal, do you see any concern with that ASSERT() or I could add it 
> and keep your Ack-by and R-by.
I don't see any issues with it. You can send a v5 and I'll commit it later on.

~Michal


