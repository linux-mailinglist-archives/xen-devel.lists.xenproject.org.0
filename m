Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF0jAgPly2l7MQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:15:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC5536B85D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269084.1558224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7anT-0000xc-8I; Tue, 31 Mar 2026 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269084.1558224; Tue, 31 Mar 2026 15:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7anT-0000vj-5A; Tue, 31 Mar 2026 15:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1269084;
 Tue, 31 Mar 2026 15:14:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7anR-0000un-NX
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7anQ-008DAD-UZ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:14:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cbe4bb-2eae-0a2a0a5409dd-0a2a45088716-46
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:14:24 +0200
Received: from [40.93.201.17]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cbe4ce-1950-0a2a45080019-285dc911191b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:14:24 +0200
Received: from MN2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:208:1a0::27)
 by CH1PPF4CBE7339A.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Tue, 31 Mar
 2026 15:14:16 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::52) by MN2PR07CA0017.outlook.office365.com
 (2603:10b6:208:1a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 15:14:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 15:14:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 10:14:15 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 10:14:14 -0500
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
 b=hDhlhE/0s/EPFaedOOd+Pas4PJq2IcryWr0BByishYp/5m/CTlYVeiaYkOV0nuj2Z6dnwePDyM/If7nyTXjuht2eKoiyzuBkqbzTcsR2LpseRfUHcVyExtHX1yeyVBoybK/T4KMF7DOY5809B1RpaTNLQLAMpxjQyFnzPGqd3cAhhdPMxWInK4xTh4cyY+5+4eSKVNBAOusnwuCkfkhDb6rqljQfMnt+GqkG98/qZbJ3+RpfoFyxnaKkjda+rukQxTg1uDHruQznU3MAIL15aR9BBygcwbPYl3B48sIyVtBoYJB+QVJzwmdNpB/6jNcsRpuJS3HMDDGJvM9+2Yt0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMmZ8twaCp7Axb1ZfHLhjkGZVxF27h8/re92RhbYGiw=;
 b=ioLjAQ4oESVB8MUOLxdnDX4P7cKBVJU5Mx0X/DRXmxlJo2SxXlWaZCxI7l2KaRsFBCpi4gYKKyTAk8bJ4nbOO5zUcTgrIu0+GPKw4Nu7lu7g1FyP4XR++4HNFyktvCxmCsr5gKogAchTN8pxS+ql3XLezjn46AoYC4dj3DpMyW6a0PR9rs34OsztVh660Oil7FB0HiaN0NLZIY6FUC41SwArb+Xk2xKinfNKHZaauMh4NB0DTXD11+XFEyujRZnkkaULwfVHoXtctUqgoVKt4+wbQzRazwrifl1GapCmUcaR2/K7CyzLUeFmEeQx62LHOxGvhVBW7ykykvFt5UsEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMmZ8twaCp7Axb1ZfHLhjkGZVxF27h8/re92RhbYGiw=;
 b=D4m+JQYcJKYluAOMACtkCVq6MIH0MioNZ7RYNpDAxvS14olREh5pc+CC8GnMXbEA6h+P+sZ7sVKP0yzp6KpqvjDDP8/zaOGsw44XiGPsbRrgflnw5RpiMg8zWQP3bNYzRe8oPxOoIzWrHFvijE7QhByMGkfy0X318ijIozwG6pk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <29922538-f20f-40e1-8ed2-5913b421008b@amd.com>
Date: Tue, 31 Mar 2026 17:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
 <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
 <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
 <89782bb0-d910-49b8-9a7d-83c3cf38d442@epam.com>
 <c8e8fbd1-33f8-469f-96c4-22d384196cdb@amd.com>
 <4d18fa65-fb01-40ac-9354-023f243f7f41@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4d18fa65-fb01-40ac-9354-023f243f7f41@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|CH1PPF4CBE7339A:EE_
X-MS-Office365-Filtering-Correlation-Id: f41c5d8f-5a16-4aac-f0be-08de8f382cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E46HRrGSzmrOhnlVu7Igjq/iul/buydZYyrPoBQWJ93vcQXYBqrwQZaYyJQlahJGWWEMaVFqXl/wp68pmSHEZEN6nV9oR6DyyfzfrfJjVGSWR74of4bHtxyuOPKOLM4WpOQAQF4AYgmluwzd6w5vKCyORrCQi15BNZuVctOmqekKvtymMAIbJ15te7OV2iTPPIeomns2cmoUqEbBNXz6D78yZGRUDb+Wih4pbETVDzKyn6/jYB9UomATuqPkT5ncaDEg2f37SOEwpSCYciNYNYi2kRt3//Kf9AV9FdhR3y3FQ9MKIuF97edxuIbAcbMCzr71UZONe/eVArr52v2gJudIxrwjha7I2YNOYBar7Jgl9479Ss5rwPZaLy2So1OPM2wnl6+enOENY447RQ+JSOJfZXXTaGGX6FXJmlM0lET0ZdJcyKudWPjWXG2g4n6MZUfTNhjFQGp8BG9553T19MMeB89YfOLW96q0jkl34hpSMw1lUSKs7/Zl5pidHQe/Qy67Tab9IwjMqM6mqvHkdl7qcxy36NOiuywj810k8rWy+VfcMP8nQZ5YJbELs7q67HUDR41UkmMVPEo5x7LJWEnGLWZuklF6n1QoGu7+yA4k9zCi4uwjJUYoeWbZWHsRG5YTRcmyH7VhPbI+znjYiA7m27zpExLfC7TUgq5/5qoWkl78EYrdSQM3h47mrpbR/fztZwkItyzIJSeN5ZpSQLLlfykakEWtiHCPCfDhyFt8NxK1ELfQqCS6ajxVyH6TAw/wGeuCyZbB7+Co8vewjQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G52t9YdrkO2slIJE44G3ba4/BJq+u4u5pIUQ/F6lFYwL3d2DC7ONgUHThmK+vBzAZWDbR3+fpfTOBUn8EPbnooKstAuwSP+PNgrO29FES3q5grI2h7UZGIg9YMcyW/zvwQeHLOFbUVrzO6kihZ5qYNieDRmywXHiUCfT3IuePzdiXOaNBRZvjfFk2WNqbPaGfUcFTy5Sjy+Rd70lvf/v92gKPAREGfTpaDpTN7WZ8n+oy56whXQ69StWyk5/jtetL+tX4xnRzKfCy6TXc46k4WyIEgA/Da5soqaxsFm/ixee3SDGrR5z2gHkqhzfq43vuLQ0F1sbkTvR1T7bB6H6+wkmlWtLRmpUqBbneOqycH8TRfQiwWvcbgFzJbokT9EwTr8K7ZTGWTXmYkiffl6uoQ+t+qYm5tWOiBMtyHJJEeDAEa7XjYa5ladNOLg7qMSN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:14:16.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41c5d8f-5a16-4aac-f0be-08de8f382cda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4CBE7339A
X-purgate-ID: tlsNG-c1860d/1774970064-E3297726-5E6FE088/0/0
X-purgate-type: clean
X-purgate-size: 6758
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 4EC5536B85D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 31/03/2026 16:10, Oleksandr Tyshchenko wrote:
> 
> 
> On 3/31/26 11:12, Orzel, Michal wrote:
> 
> Hello Michal
> 
> 
>>
>>
>> On 27/03/2026 13:23, Oleksandr Tyshchenko wrote:
>>>
>>>
>>> On 3/27/26 09:30, Orzel, Michal wrote:
>>>
>>> Hello Michal
>>>
>>>>
>>>>
>>>> On 26/03/2026 20:03, Oleksandr Tyshchenko wrote:
>>>>>
>>>>>
>>>>> On 3/26/26 18:50, Orzel, Michal wrote:
>>>>>
>>>>> Hello Michal
>>>>>
>>>>>>
>>>>>>
>>>>>> On 26/03/2026 14:15, Oleksandr Tyshchenko wrote:
>>>>>>> Xen fails to construct the hardware domain's device tree with
>>>>>>> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
>>>>>>> (e.g., numerous reserved memory regions).
>>>>>>>
>>>>>>> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
>>>>>>> required for the generated extra /memory node. make_memory_node()
>>>>>> Where does this extra /memory node come from? If this is for normal reserved
>>>>>> memory regions, they should be present in the host dtb and therefore accounted
>>>>>> by fdt_totalsize (the host dtb should have reserved regions described in /memory
>>>>>> and /reserved-memory. Are you trying to account for static shm regions?
>>>>>
>>>>>
>>>>> I might have misunderstood something, but here is my analysis:
>>>>>
>>>>> The extra /memory node is generated by Xen itself in handle_node() ->
>>>>> make_memory_node() (please refer to the if ( reserved_mem->nr_banks > 0
>>>>> ) check).
>>>>>
>>>>> Even though the normal reserved memory regions are present in the host
>>>>> DTB (and thus accounted for in fdt_totalsize), Xen generates a new
>>>>> /memory node specifically for the hardware domain to describe these
>>>>> regions as reserved but present in the memory map. And since this node
>>>>> is generated at runtime (it is not a direct copy from the host DTB),
>>>>> its size must be covered by DOM0_FDT_EXTRA_SIZE.
>>>> Yes, but the original DTB should also have these reserved regions described in
>>>> /memory nodes, thus taking up some space that is already accounted in
>>>> fdt_totalsize. Are you trying to say that in host DTB, these reserved ranges fit
>>>> nicely into e.g. a single /memory node range (i.e. a single reg pair covering
>>>> most of the RAM)?
>>>
>>> yes
>>>
>>>
>>>    I can see that it might be possible but the commit msg needs
>>>> to be clear about it. As of now, it reads as if the problem occured always when
>>>> there are multiple reserved memory regions. That's not true if a host DTB
>>>> generates one /memory per one /reserved.
>>>
>>> Yes, you are correct that the total size depends on how the host DTB is
>>> structured compared to how Xen regenerates it at runtime. So, the issue
>>> can arise if host DTB represents RAM using a single, large reg entry or
>>> a few entries.
>>>
>>> ***
>>>
>>> I will update the commit message to clarify that, something like below:
>>>
>>> Xen fails to construct the hardware domain's device tree with
>>> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
>>> (e.g., numerous reserved memory regions) and the host DTB represents
>>> RAM compactly (e.g., a single reg pair or just a few).
>>>
>>> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
>>> required for the generated extra /memory node. While the host DTB
>>> might represent RAM compactly, make_memory_node() aggregates
>>> all reserved regions into a single reg property.
>>> With NR_MEM_BANKS (256) and 64-bit address/size cells, this property
>>> can grow up to 4KB (256 * 16), easily exceeding the space originally
>>> occupied by the host DTB's nodes plus the current padding, thereby
>>> overflowing the allocated buffer.
>> This reads better.
> 
> ok
> 
> 
>>
>>>
>>>
>>>>
>>>> Another issue is with the static shm nodes. User specifies the regions in the
>>>> domain configuration and Xen creates *additional* nodes under /reserved and
>>>> /memory that afaict we don't account for.
>>>
>>> Yes, you are right.
>>>
>>> Since these SHM sub-nodes and properties are generated purely from the
>>> Xen domain configuration and are not present in the host DTB, they have
>>> zero space allocated for them in fdt_totalsize.
>>>
>>> So we need to redefine the macro. I propose the following formula that
>>> separates the range data (16 bytes per bank in /memory) from the node
>>> overhead (160 bytes per SHM region):
>> What is included in these 160 bytes? Did you manually check all fdt functions
>> inside make_shm_resv_memory_node?
> 
> According to my calculations (which, of course, might be not precise):
> 
> - FDT_BEGIN_NODE + xen-shmem@ffffffffffffffff\0 (27b padded to 28): 32 bytes
> - compatible (12b header + 21b string padded to 24): 36 bytes
> - reg (12b header + 16b payload [4 cells]): 28 bytes
> - xen,id (12b header + 16b max string [15 chars + \0]): 28 bytes
> - xen,offset (12b header + 8b payload): 20 bytes
> - FDT_END_NODE: 4 bytes
> Total exact node payload: 148 bytes. I also added 12-byte margin (so it 
> gets rounded up to the nearest 16-byte boundary).
> 
>>
>>>
>>> #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>>>                               (NR_MEM_BANKS * 16) +                    \
>>>                               (NR_SHMEM_BANKS * 160))
>> I think you only accounted for shm nodes under /reserved-memory. As any other
>> reserved memory node, they are also added to /memory reg property (see
>> DT_MEM_NODE_REG_RANGE_SIZE).
> 
> You are right, and I completely missed this in my original calculation. 
> I mistakenly believed (NR_MEM_BANKS * 16) would cover the entire 
> capacity of the /memory node's reg.
> 
> The shm_mem_node_fill_reg_range() appends the shared memory banks 
> directly into the main /memory node's reg. Each SHM bank adds 16 bytes 
> (4 cells = 16 bytes) to the main memory node.
> 
> So, I will refine the macro to explicitly reflect both the 160-byte 
> discrete sub-node and the 16-byte extra to the /memory node:
> 
> #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>                               (NR_MEM_BANKS * 16) +                    \
>                               (NR_SHMEM_BANKS * (160 + 16)))
> 
> Or wait, we can actually drop the SHM overhead entirely when 
> CONFIG_STATIC_SHM=n:
> 
> #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>                               (NR_MEM_BANKS * 16) +                    \
>                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
>                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
Yes, the CONFIG was my next question. I'm ok with this solution.

~Michal


