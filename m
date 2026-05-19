Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOH6HVKlDGq8jwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 20:00:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA658363A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 20:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313319.1583515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPOjx-0003Nn-3f; Tue, 19 May 2026 18:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313319.1583515; Tue, 19 May 2026 18:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPOjx-0003L1-13; Tue, 19 May 2026 18:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1313319;
 Tue, 19 May 2026 18:00:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wPOjv-0003Kv-Ep
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:00:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPOju-001O53-Ca
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 20:00:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a0ca527-e002-0a2a0a5209dd-0a2a4507ed2a-24
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 20:00:20 +0200
Received: from [52.101.61.53]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a0ca532-229c-0a2a45070019-34653d3536da-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 20:00:19 +0200
Received: from PH0PR07CA0062.namprd07.prod.outlook.com (2603:10b6:510:f::7) by
 BN7PPFA8145BD40.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6de)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 19 May
 2026 18:00:13 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:f:cafe::7b) by PH0PR07CA0062.outlook.office365.com
 (2603:10b6:510:f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:00:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Tue, 19 May 2026 18:00:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:00:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 11:00:08 -0700
Received: from [172.26.18.13] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:00:07 -0500
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
 b=BPW9EuKVhwrM9Mk2r2eptoNaJVXmK1TOIai+f1ruSqMpZUO7CH8rkKLg+xm2//0tqMEOtGRNxIE6bE3FdKVc1NIqCvFs//M3XdCsKbGl90Gwbyzcd8mD9uMR/Oh/kxoioSqPv6io3/dImz7T5cklco9X6UeRXaPKDNkM3RVmiAVY6ZfQvAk3a81DHK8FiPWi+eRPOfBIAai6m4LGMxmI0Rpn7ibg7nDGwOKBHBkBZRmkfnSkx3iSfLJhxkyeub/YpqG+bzsSAl9T7ZCbLmBvtnODimod7pcDu9CiS7hOnTdgH4zJXLko8xOoPEFRQ0/eRUmxw41/ue4tJFxoB5LBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjknw+1Oy9Iv1ktAAF/hX0aOUOpZcxnroVvhN5VaOGg=;
 b=avOzKu4NP8AmEmYIaruTeRpuWGMZihw9D5rmoyI0cVtJcCfh4AZWGPyYZ/2w3/EgJjJzUSFQ9FHLtk0XjcZU/ZExdcIwKHfby2GR98YqomhntPQzRBDZ8j0X1QAoeOY4y3yylS5wUNghEWcNwU3QOZ/1NMH+BipLs319EdKViJNP1CUy6aCeMIjLCOgnPi2vFGs9hxowo2XWz9sBseWxLF+4IGMBep0GVaxinLMg6nyn9rOet0y0zlYAsV173bUtVhLXfqQ08s6FKt75LYkft6CQNw24VnD9sqg14IUaR3IfglJZlgLiH00ygmudRkKkh7Jd2nJq2igYB+oVIFKzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjknw+1Oy9Iv1ktAAF/hX0aOUOpZcxnroVvhN5VaOGg=;
 b=tTnLcoNUaZagER38GT4eoc8jrdsypeuXE9kROE7Phj3YeplEPkL1u1S3VyMN3N0Pem501IUb9y2iwglbrWB83a7amf3HqoBpea5yE2IcjpIxFifUmQ/M5cMGh5f33OTw3VBl/dXJtD7iHMGlO+7lkzLYCShjMZQlS7gxLu3SS+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <38dc7297-5107-4b41-8a28-daf631118912@amd.com>
Date: Tue, 19 May 2026 14:00:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: Return -EEXIST from map_domain_pirq()
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20260519001559.28129-1-jason.andryuk@amd.com>
 <0686cb4d-3020-4c2e-9231-f1a28c714c0c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0686cb4d-3020-4c2e-9231-f1a28c714c0c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|BN7PPFA8145BD40:EE_
X-MS-Office365-Filtering-Correlation-Id: db656b06-ba4e-4244-b748-08deb5d07962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|11063799006|18002099003|56012099003|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	LKgod0T9UiALmz5xlquAv+4dYuM59w07yC1QRI+FqsKZPWQFEhuPM3JdseiKyUywOBkoN2Cuh6VWMo8Lxon7ljhCGaefc1mR7TDVHaGWr0nFU1DJaw6yHqG40a0F9h9aYCdz9aIZBBsi29ilBhoiCGSVUfRsv8RTgNplJBzS1Smke18dwbMFYvNXLxvFoDitn3UXOF66n9+q5Jjlwj9MTlokTYRTN0IqEoOnp1LONiVPTVBjfmQCr+KRU1a0vZOcLLTDO6OAvhHr+OHD4ru5Ep31vWneGQ/cdsOuEHQGW/YzEjfy96oFbjQkU9BE79cknaOIoMVel44sfzCx9IxPpsn6hSqfFwWNkU7Jr6k/SpOyyHuE86irNo8Hvj8CeNIx5oWHHME3sKuinekr8AkPfmL7HxQ/t+cjWbsJ+B5LIPDgXm8Jfp+O+BhFnFffnYLJ+derrWMx2CGzTG32sVrETzGq42UY0TlciARBUE+teno/74fwOnuAEHaD8bXD/G156J7Fbo0ThsXqO0ZEJ5DhilACMWe3PPU22XVb908bLsx5oqwxhWgA0ulcPH1pkJSe8Rxumi1p0UXXgj1CNi9AumPhHr1Az0dDAQ9laJsbOk4TSQ9DGlTLd9FkAixOHk6kQA2nll5aQ3RJTqvHqyIjfdGDAXHHlS7XWRLliSZEhQGpVKnttdZvX+zXxB8OAHVblQRpqUuA9T1NlHDtnKY5df1GmLzOX/Uzq1wwW+ihx8s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(11063799006)(18002099003)(56012099003)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ocXy+tDomfhHCNIoq+dtKcCpRG3Lvw6ehqwCfP7fRmzt+n0CkKcC1XVhms7kgsUXgHjCsTsMUkj+gBmB9X/V5ayC2m98j3uAoVqKktZOwqx5yjqhPdh3BwqBgBr5/B/bBpX7L8BYhi0pF+b6LZC9gXVlDoAVUlXNGJ/pW/XZH+mZwIiqBs4lfvnMQJ2NjtwVG/1hO5skN+QGlv9fUGfgUcmeFGPXwusZWeyO+y8QeTeOQMe1xVrvL16vLU0U2KWDhl5y7UsauZjzPudu40DPUN/TDONQNSKK9kM5e1ohmtijIyvDAQzhEkUkyM2hvfcci92Pn5Yu4hQbVVUnkkEcVCgVO+l01KnQbZEFU1ZO9wMabF8swmVqVsmZdljuZJ5a6lR60yC8N9ghrWoKlMS4wTKS5uEK9gYqym0ACEvfSoC/wdPrOvg+hGpxH4KfpQ7H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:00:12.6698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db656b06-ba4e-4244-b748-08deb5d07962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA8145BD40
X-purgate-ID: tlsNG-ef75cf/1779213619-0AB70C48-B60F94B3/0/0
X-purgate-type: clean
X-purgate-size: 2353
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: CABA658363A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-19 03:21, Jan Beulich wrote:
> On 19.05.2026 02:15, Jason Andryuk wrote:
>> commit bfc341a65cfb ("x86: Make the hypercall PHYSDEVOP_alloc_irq_vector
>> hypercall dummy.") modified map_domain_pirq() to return 0 when an irq or
>> pirq is already mapped, when it previously returned -EINVAL.  This
>> occured when moving map_domain_pirq()'s call from
>> PHYSDEVOP_alloc_irq_vector into PHYSDEVOP_apic_write.
>>
>> However, this means other callers cannot detect when a pirq or irq is
>> already mapped.  Since success is returned but the pirq is not
>> connected, it will never fire.
>>
>> Modify map_domain_pirq() to return -EEXIST.  -EINVAL is already returned
>> elsewhere in map_domain_pirq(), so -EEXIST allows identifying this case.
>> With that, squash -EEXIST in ioapic_guest_write() so the behavior does not
>> change.
> 
> What about the function's uses from allocate_and_map_[gm]si_pirq()? Don't they
> then also need to cope with getting back -EEXIST to keep externally visible
> behavior unaltered? Else those cases want discussing in the description, I
> suppose.

For my use, I want allocate_and_map_gsi_pirq() to return -EEXIST.  I'll 
have to look at everything again and update the description.

>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> I'm not sure whether or not this warrants a Fixes.  Nothing in tree
>> today is broken, so I did not add one.
> 
> In which case this then also isn't 4.22 material, I guess?

Probably not.

>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2315,6 +2315,8 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
>>           ret = map_domain_pirq(hardware_domain, pirq, irq,
>>                                 MAP_PIRQ_TYPE_GSI, NULL);
>>           write_unlock(&hardware_domain->event_lock);
>> +        if ( ret == -EEXIST )
>> +            ret = 0;
>>           if ( ret < 0 )
>>               return ret;
> 
> Slightly shorter
> 
>          if ( ret < 0 && ret != -EEXIST )
>              return ret;
> 
> ?

Well, I intentionally set ret = 0, so -EEXIST wasn't seen later in the 
function.  Though double checking now, there aren't any further uses of 
ret, so your suggestion is okay.  I just felt better overriding ret 
instead of leaving it.

Thanks,
Jason

