Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHXeIAq1AWr2igEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:52:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEB50C44F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306023.1578121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOFd-0005wV-De; Mon, 11 May 2026 10:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306023.1578121; Mon, 11 May 2026 10:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOFd-0005uO-AJ; Mon, 11 May 2026 10:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1306023;
 Mon, 11 May 2026 10:52:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMOFb-0005u0-3o
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:52:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOFa-00CizY-Gg
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:52:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b4e3-5cb7-0a2a0a5109dd-0a2a4509a1ba-40
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:52:38 +0200
Received: from [52.101.43.5]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b34f-2497-0a2a45090019-34652b05dda1-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:45:37 +0200
Received: from PH7PR17CA0022.namprd17.prod.outlook.com (2603:10b6:510:324::7)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:45:30 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::59) by PH7PR17CA0022.outlook.office365.com
 (2603:10b6:510:324::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:45:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:45:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 05:45:29 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:45:28 -0500
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
 b=prqm+kZiGDTle7W9Y+DX3DnkKub05igOlvVmcWISjxluRcjdUnYDjWakOBuZJfQSTJ+irZx54yc1S9meP+g2EFgtM5BXftMjhJPaxnZ2/7aBRa8n5Xk95jH4luBcoUHpwNJxmDbQ8Cg9/LIBG5LJmccuXKdj8Tc/QmJKOPkPAELkGU06DSdQPphV+GeIbVrzafXK7kDlui7ma35RWmjH6Yp3RHrJzh1bnYy8k0YLu4t/nFFAhQXEr3puDA474t7NIJgSfxOV5eJITKXWDALcLrJpcP44y3Oxr8wnIKxoKmASm4J/eIaDynqx7t0Swdl6TjJ/89tLUpFi0qlolhhzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNB2libJw3++ctP4LmCO3yxzuvARImjF/CR4UhFMlKY=;
 b=GjEds9wW1280HCD9Au0qUKuDoHgj/HNlZhAsycuWjUYJZmqX6j2ZP2Y+D+tLr/NlfLQMoA3XGLE+6uREEej/EUc9xmCDOJswgfxUe+2QmnlVjwi68xsdwTmvGByWPuGlaMAV7nDVO3eQksKw1rwb2rwRoQvvFEHVA0gs8sQAS2vusioU+t9JsVAi5CrJEba+N5TrnUKRBDpxV7NJDtuhbDZAR5qDkzqr0hVEjbdr9ErSv88CLiE6TemaRlRPD9r6CyBIDYZ0R/gT92lImSg3JfYqmGj7RKKJzumrIjRlSvzbSFf+vi93SWuljzQvScxDt+qGqv3SaJS/TK5REZTBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNB2libJw3++ctP4LmCO3yxzuvARImjF/CR4UhFMlKY=;
 b=ScpG6636OlBslyV1RLSEB9+fZW17hAThbZajlRF1AOagTatIH7Gf7cGjRGtWVWlzA5VRArueYXtoRFCK41D2PPXsjlao3VQIcWd6kvVL1Jvuz02tQ3S0xORLWGjbD+5UhlcYXwlrzgAQAich+byxwaqxPIs9bX9eGm9z5Urbfnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <494b99b4-2d45-4893-9300-b3e8ffdd4396@amd.com>
Date: Mon, 11 May 2026 12:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm/mpu: Implement p2m tables
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-4-luca.fancellu@arm.com>
 <a9460f33-1798-461d-95dc-c40cdf2f7f68@amd.com>
 <0A9C53BD-D9FD-4CBF-B874-E7465C8E421E@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0A9C53BD-D9FD-4CBF-B874-E7465C8E421E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0f368a-ce0d-469a-25dd-08deaf4a6be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2nlhoa8Wp1uWfkWNVuOhGkUzwwQKvkmV1FcrfeeRwPRE5hCts/XDJGFy72YzD0lDJnolaL5xdhS0YIuE2nm+gd8JxevIpk3TECrlXMK3VoRVss0XAgyiMzwkym79Ns5JrOysXZzNztmDJvb6QbQa1aAsQp8dnDRuQNaz5zM3skHZpcK16+mAH38DaQdkP5QjyoVdRK5Ln+CR7lFwURPmCMZbdekT0jcSDt2ac8xtYx6vNM8SeTR9UboylIv4EuNXX97hHDVK101eZcrtmEk0xMpmLvwx/r1Gm9sUrgJDKfmBs0mi+aHs8tKnBneC6bbMfCw5ZWwZ8ipuxqyxClkw7tTQ55bgE9Xh7T8yqe9MGW0nmZ5tfdBMqQ5UU1cr1gJV2KJ8zHW1vBIEqW9SkdO/cWkCHYUjYUQY2fEkuw6KBimxfeUh6ZGwLctbaq9mVGZaueIPGchMO6fAwxNVQ18lBa90TXhIpNjm6o+pOcPClCFXzWZYWHBErEIkXeMX3kxBMb7ML7cjDNX4LL10ENMLI1VEhLtulPTMIk3x0wVPDWJbAHYoa6r4OSa9n5CHBSbzYUqJiRWOxSjvzZ3/sQlpBGaXt9IFQvu4aMI/GErkvqBEuwDql23Kk5yiy7KJfH8eq8NXAII+CJw9vZJCz3jdDGcKDrYoXZfyDIAVyEcyYzRnAR1dpVvfzNj+lweVIpXSGL8LUtzixbY904HZMYaoh3uXxyJ6vOOM+gtjZldRoYQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hPWgL4FGdLEi79U4gEPJKG+AvbMZ6h921NhI9Od4xDIJ1fcl4oGO3pSFBsesR5byUghe/uXjFHjEMINfNgF5eaUxGgGVcwPp89T3Z2aPQqFyaplhY/MK1WHEBuDSyQf1VFkG7z2q4mC4pp2hu8ZMY9s8XQVDX9OoUEdIwVT52qSLaaRNCXYd9xdZ4/mborHlinxVPHA1YlFnfeRMcuV0sTgs/YFFayE2dqGwN87Pfcm5hS59rU21u/gLDqSinjuQmC/nWx72PgbmbH7xt9VxRw80V3jT6c0C+WxOTZQDxlat5jp1aQKN9KIyftmw1Ve5XnnehHV5KvZIFl+54khNxJYljsFzhi3sDXYhEO6HBNqoNsajBxO8bQcuZ6hszGqfiYPDyFAet8KNIwU68Zrh4PClEmsarRBAVtWLd9cBlDof6Rd/rJoWfvyQbEn3P+TN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:45:30.5088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0f368a-ce0d-469a-25dd-08deaf4a6be4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416
X-purgate-ID: tlsNG-bad1c0/1778496337-89377A53-B48A3C80/37/8731086901-1579827
X-purgate-type: clean
X-purgate-size: 3075
X-Rspamd-Queue-Id: D8CEB50C44F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action



On 11-May-26 12:39, Luca Fancellu wrote:
> Hi Michal,
> 
> 
>>> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
>>> index e46d9e757a1d..0d4149c71987 100644
>>> --- a/xen/arch/arm/include/asm/mpu/p2m.h
>>> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
>>> @@ -3,8 +3,15 @@
>>> #ifndef __ARM_MPU_P2M_H__
>>> #define __ARM_MPU_P2M_H__
>>>
>>> +#include <xen/bitops.h>
>>> +#include <xen/macros.h>
>>> +#include <xen/page-size.h>
>>> +
>>> struct p2m_domain;
>>>
>>> +#define P2M_ROOT_PAGES DIV_ROUND_UP(MAX_MPU_REGION_NR * sizeof(pr_t), PAGE_SIZE)
>> You should include mpu.h for MAX_MPU_REGION_NR definition
> 
> right, I’ll include
> 
>>
>>> +#define P2M_ROOT_ORDER get_count_order(P2M_ROOT_PAGES)
>>> +
>>> static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>>>
>>> static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
>>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>>> index 010ce8c9ebbd..ed1b6dd40f40 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -48,8 +48,13 @@ struct p2m_domain {
>>>     /* Current VMID in use */
>>>     uint16_t vmid;
>>>
>>> +#ifdef CONFIG_MMU
>>>     /* Current Translation Table Base Register for the p2m */
>>>     uint64_t vttbr;
>>> +#else
>>> +    /* Current Virtualization System Control Register for the p2m */
>>> +    register_t vsctlr;
>>> +#endif
>>>
>>>     /* Highest guest frame that's ever been mapped in the p2m */
>>>     gfn_t max_mapped_gfn;
>>> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
>>> index f7fb58ab6aa8..8d5c65b1003f 100644
>>> --- a/xen/arch/arm/mpu/p2m.c
>>> +++ b/xen/arch/arm/mpu/p2m.c
>>> @@ -28,10 +28,63 @@ void p2m_dump_info(struct domain *d)
>>>     BUG_ON("unimplemented");
>>> }
>>>
>>> +static int p2m_alloc_table(struct domain *d)
>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    char *table = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
>> Why char and not void? We use void and pointer arithmetic is done by treating
>> the size of a void as 1.
> 
> I did it on purpose since it’s a compiler extension, but if you say it’s ok I’ll change it to void.
Yes, this is a documented extension in our MISRA language toolchain and as you
can see, we use it in our code base.

BTW, please also ...

> 
>>> +    unsigned int i;
>>> +
>>> +    if ( !table )
>>> +    {
>>> +        printk(XENLOG_G_ERR "%pd: p2m: unable to allocate P2M MPU mapping table\n",
>>> +               d);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    p2m->root = virt_to_page(table);
>>> +
>>> +    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
>>> +        clear_page(table + (i * PAGE_SIZE));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> int p2m_init(struct domain *d)
>>> {
>>> -    BUG_ON("unimplemented");
>>> -    return -EINVAL;
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    int rc = 0;
... drop this redundant assignment.

~Michal

