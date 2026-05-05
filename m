Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHeWDurH+WkwEAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:35:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2014CB7AB
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300517.1575046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKD7L-0002ss-B1; Tue, 05 May 2026 10:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300517.1575046; Tue, 05 May 2026 10:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKD7L-0002rA-7x; Tue, 05 May 2026 10:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1300517;
 Tue, 05 May 2026 10:35:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKD7J-0002r3-Qn
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:35:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKD7I-00DZUh-Rn
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:35:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9c7d6-bab6-0a2a0a5309dd-0a2a4508d89a-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:35:04 +0200
Received: from [40.107.209.56]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9c7d6-63b5-0a2a45080019-286bd1384608-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:35:03 +0200
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:34:56 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::79) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.11 via Frontend Transport; Tue,
 5 May 2026 10:34:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 10:34:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 05:34:55 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 05:34:54 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 05:34:53 -0500
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
 b=bOKSnjjBvq9Pv+JGC1k3G9HibS4nM2YOndkLV+C+WCbBd51qoZj/XiBW36NZuvi6eOUuW8Bc+EOF5wvvDu8C7/lh2DXNR/Z+vkqAJHepfXyzaE4YgDau/KHjx4RRwWZvv7CJPzs2nG830ivAoChDEEXLGx7KgzPdOmUs8Q0PVNEJV4OqkGjIx70R5GUt/Irwy6FE4Z/+QQN4Bpt+Mwi69xZcpQ1skwb03QodN7VfUdLcMQVIrONcJcA36RzR/A0aZ8j23nB+Q/HaVVu3jkWEd1KSyo/ya0JmsN4+dzSo4lATFcaLUzK/xTdQGhXRjBmFyDvAczG+/3iduiNDGy075g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErPlzHvG3PE22CxQ2xtzDPmTcnyiKBjfEy4LxTteHF8=;
 b=hw4JmtZsqWvCQH3MrRje+xxCypV/x4+ULPwRQoLUQ3xT/neDUjOn0KFzS4gx6/4TDlm/YvC18ZLd6i/eVZvZAoTRSHNXo/Rqh3bVBU/eTeN182BlW8NuPijFPzGJhDweigKHn05GFdqjLa+X6d1sGsF+nIeJijDLgBUye3ktRZlbekP/752O7J2hGYa19tMPW2iBDDxjbXGxewBxOSl5kQs3QEpy3CbcI9s7QzJbYLK+ioDXTMRRTDfnEsTN5uL8bBwY6YAwh+RjltjuAyjVn8JzkpuPOXxMkxbbxPpYULD5MOtZ2uDnqajdRGRUKkP0kkIcmIazaBTZuXdgijUnQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErPlzHvG3PE22CxQ2xtzDPmTcnyiKBjfEy4LxTteHF8=;
 b=nobI9q9VNvwMr9GUEWp4zTGTHVtBLAGZAd9xMlgL7UbY8ANKU3t7HVkMqKWpSWhZ4gyTlN3ETi7M56/nXnNH5bQMP7qfdYDhdqjoWUVkH/JdZdMZSC/QaXtAaI8L+zuucxBzUgy2XgQXRPj1Dq8yJmKpgbOa7gEDFVPA/t/gdsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <18280bdb-e33a-4aba-aa1d-8f42675717e8@amd.com>
Date: Tue, 5 May 2026 12:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Harry
 Ramsey" <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20260420142224.1802911-1-luca.fancellu@arm.com>
 <20260420142224.1802911-3-luca.fancellu@arm.com>
 <6ba6db51-3ff0-4ecd-9f86-03735e7dfc05@amd.com>
 <55B3CCAD-8EF6-4949-BC87-D7EE3A348FEC@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <55B3CCAD-8EF6-4949-BC87-D7EE3A348FEC@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c982b6-ba31-4605-e546-08deaa91f320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y85bpCwf9n8TQgGaMPl8ozopx0JYx+lpmfPUdwca3irzPbJOkOLjbA8uQbp2hz+LOkhk3NUvqbM8KIapBRF1gi6dVM2M3ZLQDiXfxcSItzGxy5aH313EHVFI58j+wEz5g7RRsefjAMX/oF9cav6vzj/cbSGPk/s3CSvX36cC5PBHY/GlpEg1Q5AXaKtzJJ3HuaLuuoSuvk6N4MxaTPp0J1bbjDqPCul5HPsFFpAdYLCQ8JodS+IF33EXRTXEYYIWPjw4+icDfgfiydT24VHzJbn+3q9BHGEoSGQjDY+jCaxBPzpxKy1HFmKZNKY+byLD4/cgso8Gdw7uH+3gO9Oz1r2WekPVezr/lkidIy6CHImLJfaurpuEmM5e+XLSkHZ/MR/YQxudUNU4bVB81c985aU3KXTLFPUPjZh1EfpEf0ToZcPD6yYytpG35ehX8T8qTrl5O6UM45qUwacPPkfX5UxGelyptjhCzuKkAaHj0aEWP/OC9SthCgRcvsoOdTbL0XmPe38idNpXIlM+O7LI1zsoI6elEvIbBeQgmCCtReHmKtexj2AKlwIB5zZUVYBJsBQSyitYqtytncgZHB4W3RdjuzqtA2tXcbRGVCa1Ytqg22TzTcHIuRceJhAOjgrwH4UctJvgYpQdbZ9SQM9NmCCH3vAKzbWI+Hz1RMryKu2qRu0dqZeZK4siKV5KEb+QyQU5qg7TUl+Rwx3T8GC8DsmvQohSTlmPagth75xuuLc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dL6OQSdMGI5t11t03IS0kfN4f8dzdsQYhhbFzctQH1KZr+F8l0Qh/P7Kkyp5fJ5sycyrXKLCB54fEAZuwVuPwhiCerdiVa2Si7DQEfhzLicm2VOJ1bKqYpQIFO7Zc+knZ3R+oCjVGLPlz64Ree7+IkmQHpHT/H+5pAWW/5t+WfyDN/kYsZr35fQzenjbV28OTuo6Y9FTsSvWzym1cYQTI7A/bYRlhrlbx3enZJqlQUZ65TozcsfbEKSNfafGgPsqE8xBzefHNrzoPH1rP9lDa+Wly3svseXBVtLqqCnzxJdy7immP3cD9Bhg+ZneUR7/7PxED0yiCZvSKjgEY3GWPZFLJYDc1qWee8qoJnMJ2ZrUqRgTL8tdjkxzXtkAJdJXXZRcDLzqxw6tJ4eVHmaBjQwFBlOIAwQj7GNF6dpU+ha+/ZgWq94S2dSXSDRcRxZM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:34:55.7827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c982b6-ba31-4605-e546-08deaa91f320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
X-purgate-ID: tlsNG-c1860d/1777977304-C156FDB1-64F97BA0/0/0
X-purgate-type: clean
X-purgate-size: 12848
X-Rspamd-Queue-Id: 7D2014CB7AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 29-Apr-26 14:46, Luca Fancellu wrote:
> Hi Michal,
> 
> thanks for your review,
> 
>>>
>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>>> index 977b4286082f..c3f484a3b01a 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -322,6 +322,20 @@ with the following properties:
>>>     Should be used together with scmi-smc-passthrough Xen command line
>>>     option.
>>>
>>> +- v8r_el1_msa
>>> +
>>> +    A string property specifying whether, on Armv8-R systems, a domain
>>> +    should use PMSAv8 (MPU) at EL1 or VMSAv8 (MMU) at EL1.
>> Instead of repeating at EL1 you could move it next to "on Armv8R systems"
> 
> ok
> 
>>
>>> +
>>> +    - "mmu"
>>> +    Enables VMSAv8 at EL1. This requires hardware support and is only
>>> +    optionally available on AArch64.
>> Maybe it's due to the combination of words but it does not immediately tell that
>> it's not present on AArch32. I would add: "Not supported on AArch32".
> 
> Ok
> 
>>
>>> +
>>> +    - "mpu"
>>> +    Enables PMSAv8 at EL1. This is the default behaviour when the property is
>>> +    not passed. This configuration requires static allocation (xen,static-mem)
>>> +    and direct mapping (direct-map).
>>> +
>>> Under the "xen,domain" compatible node, one or more sub-nodes are present
>>> for the DomU kernel and ramdisk.
>>>
>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>> index 4181c105389a..6f0256f9d825 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -24,6 +24,7 @@
>>> #include <asm/domain_build.h>
>>> #include <asm/firmware/sci.h>
>>> #include <asm/grant_table.h>
>>> +#include <asm/mpu.h>
>>> #include <asm/setup.h>
>>>
>>> #ifdef CONFIG_VGICV2
>>> @@ -322,6 +323,8 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>>     if ( domu_dt_sci_parse(node, d_cfg) )
>>>         panic("Error getting SCI configuration\n");
>>>
>>> +    arch_dt_v8r_el1_msa_parse(node, d_cfg);
>> "arch" prefix should be used by functions called from the common code that have
>> arch-specific implementation. This is not the case for functions you're
>> introducing here, so please drop this prefix.
>>
>> Also, I would continue using the SCI approach e.g. call it domu_dt_msa_parse()
>> and decide to panic at the call site rather than making this decision in the
>> function itself.
> 
> sounds good
> 
>>
>>> +
>>>     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>>>     {
>>>         int vpl011_virq = GUEST_VPL011_SPI;
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 26380a807cad..dfa7ace1141b 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -18,6 +18,7 @@
>>> #include <asm/cpuerrata.h>
>>> #include <asm/cpufeature.h>
>>> #include <asm/current.h>
>>> +#include <asm/domain_build.h>
>>> #include <asm/event.h>
>>> #include <asm/gic.h>
>>> #include <asm/guest_atomics.h>
>>> @@ -725,6 +726,9 @@ int arch_domain_create(struct domain *d,
>>>     if ( (rc = sci_domain_init(d, config)) != 0 )
>>>         goto fail;
>>>
>>> +    if ( (rc = arch_set_v8r_el1_msa(d, config, flags)) != 0 )
>>> +        goto fail;
>>> +
>>>     return 0;
>>>
>>> fail:
>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>> index ffe5d0d9f0a6..4a3fb825962b 100644
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -128,6 +128,10 @@ struct arch_domain
>>> #endif
>>>
>>>     struct resume_info resume_ctx;
>>> +
>>> +#ifdef CONFIG_MPU
>>> +    uint8_t v8r_el1_msa;
>>> +#endif
>>> }  __cacheline_aligned;
>>>
>>> struct arch_vcpu
>>> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
>>> index 6674dac5e2f8..921d6f98f4f4 100644
>>> --- a/xen/arch/arm/include/asm/domain_build.h
>>> +++ b/xen/arch/arm/include/asm/domain_build.h
>>> @@ -4,6 +4,14 @@
>>> #include <xen/fdt-kernel.h>
>>> #include <xen/sched.h>
>>>
>>> +#if defined(CONFIG_MMU)
>>> +#include <asm/mmu/domain-build.h>
>>> +#elif defined(CONFIG_MPU)
>>> +#include <asm/mpu/domain-build.h>
>>> +#else
>>> +# error "Unknown memory management layout"
>> I don't think that this error msg is correct for domain build.
> 
> are you suggesting dropping the error or modifying the message? 
modifying the message

> 
>>>
>>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> index 72fa5b00b861..8a8c01086206 100644
>>> --- a/xen/arch/arm/include/asm/mpu.h
>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>> @@ -27,6 +27,11 @@
>>>
>>> #ifndef __ASSEMBLER__
>>>
>>> +/*
>>> + * Utility function to determine if an Armv8-R processor supports VMSA.
>>> + */
>> NIT: No need for multi-line comment for a single sentence that can fit in one line.
> 
> ok
> 
>>
>>> +bool has_v8r_vmsa_support(void);
>>> +
>>> /*
>>>  * Set base address of MPU protection region.
>>>  *
>>> diff --git a/xen/arch/arm/include/asm/mpu/domain-build.h b/xen/arch/arm/include/asm/mpu/domain-build.h
>>> new file mode 100644
>>> index 000000000000..463cd85b5b7e
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/domain-build.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ARM_MPU_DOMAIN_BUILD_H__
>>> +#define __ARM_MPU_DOMAIN_BUILD_H__
>>> +
>>> +#include <xen/device_tree.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/types.h>
>>> +#include <public/domctl.h>
>>> +
>>> +void arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
>>> +                               struct xen_domctl_createdomain *d_cfg);
>>> +
>>> +int arch_set_v8r_el1_msa(struct domain *d,
>>> +                         const struct xen_domctl_createdomain *config,
>>> +                         unsigned int flags);
>>> +
>>> +#endif /* __ARM_MPU_DOMAIN_BUILD_H__ */
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
>>> index 3327fadd5d0e..e3997e41b81b 100644
>>> --- a/xen/arch/arm/mpu/Makefile
>>> +++ b/xen/arch/arm/mpu/Makefile
>>> @@ -1,5 +1,6 @@
>>> obj-$(CONFIG_ARM_32) += arm32/
>>> obj-$(CONFIG_ARM_64) += arm64/
>>> +obj-y += domain-build.o
>>> obj-y += domain-page.o
>>> obj-y += mm.o
>>> obj-y += p2m.o
>>> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
>>> index a4673c351141..5eaeb3400e6c 100644
>>> --- a/xen/arch/arm/mpu/arm32/mm.c
>>> +++ b/xen/arch/arm/mpu/arm32/mm.c
>>> @@ -38,6 +38,11 @@
>>>         break;                                            \
>>>     }
>>>
>>> +bool has_v8r_vmsa_support(void)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> /*
>>>  * Armv8-R supports direct access and indirect access to the MPU regions through
>>>  * registers:
>>> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
>>> index ed643cad4073..b07e729a7d05 100644
>>> --- a/xen/arch/arm/mpu/arm64/mm.c
>>> +++ b/xen/arch/arm/mpu/arm64/mm.c
>>> @@ -32,6 +32,11 @@
>>>         break;                                                  \
>>>     }
>>>
>>> +bool has_v8r_vmsa_support(void)
>>> +{
>>> +    return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
>>> +}
>>> +
>>> /*
>>>  * Armv8-R supports direct access and indirect access to the MPU regions through
>>>  * registers:
>>> diff --git a/xen/arch/arm/mpu/domain-build.c b/xen/arch/arm/mpu/domain-build.c
>>> new file mode 100644
>>> index 000000000000..1bdd0ffedebb
>>> --- /dev/null
>>> +++ b/xen/arch/arm/mpu/domain-build.c
>>> @@ -0,0 +1,76 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/device_tree.h>
>>> +#include <xen/domain.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/init.h>
>>> +#include <xen/types.h>
>>> +#include <xen/sched.h>
>>> +#include <asm/mpu.h>
>>> +#include <asm/mpu/domain-build.h>
>>> +#include <public/arch-arm.h>
>>> +#include <public/domctl.h>
>>> +
>>> +void __init arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
>>> +                                      struct xen_domctl_createdomain *d_cfg)
>>> +{
>>> +    const char *v8r_el1_msa;
>>> +
>>> +    d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
>>> +
>>> +    if ( !dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa) )
>>> +    {
>>> +        if ( !strcmp(v8r_el1_msa, "mmu") )
>>> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
>>> +        else if ( !strcmp(v8r_el1_msa, "mpu") )
>>> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
>>> +        else
>>> +            panic("Invalid device tree option for v8r_el1_msa\n");
>>> +    }
>>> +}
>>> +
>>> +int arch_set_v8r_el1_msa(struct domain *d,
>>> +                         const struct xen_domctl_createdomain *config,
>>> +                         unsigned int flags)
>>> +{
>>> +    switch ( config->arch.v8r_el1_msa )
>>> +    {
>>> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
>>> +        fallthrough;
>>> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
>>> +        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
>>> +        {
>>> +            dprintk(XENLOG_INFO,
>>> +                    "PMSA is not valid for domain without static allocation and direct map (v8r_el1_msa)\n");
>>> +            return -EINVAL;
>>> +        }
>>> +        break;
>>> +
>>> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
>>> +        if ( !has_v8r_vmsa_support() )
>>> +        {
>>> +            dprintk(XENLOG_INFO,
>>> +                    "Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
>>> +            return -EINVAL;
>>> +        }
>>> +        break;
>>> +
>>> +    default:
>>> +        dprintk(XENLOG_INFO, "Unsupported arch.v8r_el1_msa value (%u)\n",
>>> +                config->arch.v8r_el1_msa);
>>> +        return -EINVAL;
>>> +    }
>> Why do we even need this split. It seems like all the above checks could be done
>> in arch_dt_v8r_el1_msa_parse given that it is called after static-mem,direct-map
>> are set. This would simplify this file and we would not even need to introduce
>> new domain-build split for one function.
> 
> Please correct me if I’m wrong, if I move the checks in arch_dt_v8r_el1_msa_parse() they will
> be handled only on dom0less domain creation only.
> If I have it in the current way it will be handled by dom0less and XL toolstack creation.
> I understand that for now the toolstack path is not implemented, but it felt better to do this now
> rather than change it later.
> 
> Let me know what you think.
MPU == everything static, so I'm not sure how dynamic domain creation via libxl
would come into play here.

> 
>>
>>> +
>>> +    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>> index cd563cf70684..7d6f87e8b2b1 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -330,6 +330,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>> #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>>> #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>>
>>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
>>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
>>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>>> +
>>> struct xen_arch_domainconfig {
>>>     /* IN/OUT */
>>>     uint8_t gic_version;
>>> @@ -355,6 +359,9 @@ struct xen_arch_domainconfig {
>>>     uint32_t clock_frequency;
>>>     /* IN */
>>>     uint8_t arm_sci_type;
>>> +    /* IN */
>>> +    uint8_t v8r_el1_msa;
>>> +    uint16_t pad;
>> Before this change there were 3B of implicit padding. Now you added 1B of data
>> and 2B of explicit padding. The struct size is the same, so why bumping the
>> interface version? I don't see it necessary here. Also, why explicit padding?
>> With explicit padding I do think you need to now check that it's 0.
> 
> I’ve bumped because if an older toolstack is passing something that is not zero
> in the v8r_el1_msa we would return an error and stop the domain creation by the
> above:
I guess we won't have this issue if we drop arch_set_v8r_el1_msa as suggested above.

~Michal


