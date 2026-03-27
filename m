Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JPBH1wyxmnzHQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:31:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B434072B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265097.1556176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w61eX-0006Cv-MO; Fri, 27 Mar 2026 07:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265097.1556176; Fri, 27 Mar 2026 07:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w61eX-0006AG-JX; Fri, 27 Mar 2026 07:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1265097;
 Fri, 27 Mar 2026 07:30:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w61eW-0006A4-4I
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:30:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w61eV-004qDc-5E
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:30:43 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69c6321b-5cb7-0a2a0a5109dd-0a2a4502e652-38
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:30:42 +0100
Received: from [52.101.53.6]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69c6321f-63bb-0a2a45020019-34653506b7bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:30:40 +0100
Received: from BYAPR02CA0031.namprd02.prod.outlook.com (2603:10b6:a02:ee::44)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 07:30:35 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a02:ee:cafe::1e) by BYAPR02CA0031.outlook.office365.com
 (2603:10b6:a02:ee::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Fri,
 27 Mar 2026 07:30:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:30:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 02:30:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 02:30:34 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 02:30:33 -0500
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
 b=TxsyZx4SfZ5Z0I6LWyHCoQrxWBu7Bs8/cv5wVkccyBznngoChRhZnWZc5woApYXYoPXBHLMwg3e6C6dCK9QnnbQqS5YIoyZlSyUSskaJqfeRsIblfWCt+BlFuLWKIYn9Ls1aGMdWEFr5e1G47zQ20p6SHbAW33rFHmgvaC9AM1OZEjdNafiPCfcndH94LjfyEpp0pNkt17zcrJp9WCCYVH+cis3Ck3O0jFp9U3/ITFaRhAkCfDDoW3PqcXXOx7rAT2l1s5zoPTp9SQWB+H0ECdnH/Mm6rrWKiNCNeD/UdW6Dd/4hX8Nu1gFyu517r69nuvTL0G8YtHv0iom2mF3dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+x7CuKT81cEFIO+nKmHwglHzpWdK98meyNdtzmteFU=;
 b=xut/VQIwaOfwSa47jAlSSsFUeNu7A34y4igHu2FOnxfr1qpcLLDVbjkSXZIWcmx/1ZdLnYCM9wjMMHPAJJLv3QHAS96InmaqKDx0HUJJjFIthP9j0FQTCzN91h9nMZp8rZcGZHyi7z+3m4GVjEQC4z0/3qcV+QeI0KVIfq7uweZwRX1WzWmdu4jbc+PXbvra0lFD5WSe4Dk6D8x/l6VhAWjXnNES7O9YejiXbAWfbO+TcfgGh+BYBIAU+SqxYEHPJmeVWsOKWBDLUQkmok1jLEF2bhPCAoLyuZaDEFDk52c1vVVTmLPvvrkrDZ6gdlFHKT2kGamVcVQKb3EvqUh0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+x7CuKT81cEFIO+nKmHwglHzpWdK98meyNdtzmteFU=;
 b=IPfFn04kUBYC4iAVM6b9vfH64K/ejc1kwiatReK9z0PzJcg1B1+1MDAYXe2E/mnoG06EGJanu7M94ah5RBa2L67cgbrcnVs52llUjljLUV6TeO9WWYxJ7Ied35VBZ6E4oZklB6duEiMlhfLHMXbp+W7KdkqF2J/Fp3zhL1YacXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
Date: Fri, 27 Mar 2026 08:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
 <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb3e295-f40b-4bc2-4518-08de8bd2bcac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y/4NbRb9Hid1iNJdyh2l9ov7W1dNqPIrjSiYntvGvLp9IML86w293pP/yyebQ8V+UHNmonHmemWENIRlS0e2GagQzPlNlSCBp5UZqAbmJrqTMSFRnH2NTqxhH6pxRvuFBLel5NojBNEbMfdeaEsgYavlSZ8DvInRHoGn4MaBJyy4EB7aCucuvAZRvufqyGzTl/2GbiczFqAg9YgJoLHSswaZJ2wH0I59R+StU+tDuzcnBbrx2smKeabT7tF1r8c4YZ/fl5D1kQe0pVTvsAs985Gp78VzLgeV63Z9Znb4t7V5yTvceYQCw3INJDczODB/+D8yjpyDr+Ioh+ooNkgO+5gNr3iLJogHc7FvkWy51IU8lJ4PWjfh/BBs03XdYOoISvzXim0+INUfS9Z6L+QsiaJy5OtQlhifa30NIHBT6x0H2S3a2YoAIl5U7uGleDCqAy5qc6hGD5buAnvXvhZwc2LDaPG3xz1/hVgtu1gWRjJvmNezQP5qGSnkLqJbiCRPJQhj1ux+a5GJ//BQBt3gYu74WakBGPjyCs4IOapgK0UdiJhOOzZAAk3clU8EdgP9zYA/oUPChPWKN98i1S9NbCT5SBOdB+dz7M8fjPUH+YKvoF353CriS9irA4NAlPqOX8uSBRcJquoXOi27Q5AB0NSyand2mttvtnddbfZZm5QFnrRAQjABOq4uHPluSn6TezlmfzzxOqGxCo8LOXJ2kXrQuS28zswFQvhicqxuSdYl1DbYgbFTLm3wqPaZ7FjhKa5JzrGXZKgfyZ+T0Nw5cA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oljLyuOXxRTwKYX7vPq/tGuGrCwbEx57jfY0R5JLhSmCQRKGq4bIcAvScqsVAVpPS+gAtCaifuGDl+ew3+hDVMHCfh+l+Icl62SV100jJnNsXtTWwHwUxX4709ESMPiRCfsp6qgtiCdeaO4Lfdz+0yRr7LOQ6IJWdx3LaxX8a6orfSH7LOHP765O/zDqy0M359fgkQWoEEtmhVKOXMUVO9PhBi3YV24UdvXPtCs8tJQKnn+vtwnI8KlDV1Nt1mGXi7G3GqPGXwijx6pbdOqIR+znnzbF042/WL/eEvIiYqKVH1+kc1HauTWWG4Ued9PZqlOWPyAoM1WlqrXro+7vX7+KNZBpjwdxcFJ/mVrVaWxNUBnCQKHKivi+1+njBREQK/UmlG80t+eXvddSTI19dEUYog7aM7ItNsXmmD6uZgWVzEuG89DPMFbW3qnVuf7O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:30:35.6847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb3e295-f40b-4bc2-4518-08de8bd2bcac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
X-purgate-ID: tlsNG-720697/1774596640-BDA9CDB8-CF96DBAB/0/0
X-purgate-type: clean
X-purgate-size: 6255
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
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: D66B434072B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 26/03/2026 20:03, Oleksandr Tyshchenko wrote:
> 
> 
> On 3/26/26 18:50, Orzel, Michal wrote:
> 
> Hello Michal
> 
>>
>>
>> On 26/03/2026 14:15, Oleksandr Tyshchenko wrote:
>>> Xen fails to construct the hardware domain's device tree with
>>> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
>>> (e.g., numerous reserved memory regions).
>>>
>>> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
>>> required for the generated extra /memory node. make_memory_node()
>> Where does this extra /memory node come from? If this is for normal reserved
>> memory regions, they should be present in the host dtb and therefore accounted
>> by fdt_totalsize (the host dtb should have reserved regions described in /memory
>> and /reserved-memory. Are you trying to account for static shm regions?
> 
> 
> I might have misunderstood something, but here is my analysis:
> 
> The extra /memory node is generated by Xen itself in handle_node() -> 
> make_memory_node() (please refer to the if ( reserved_mem->nr_banks > 0 
> ) check).
> 
> Even though the normal reserved memory regions are present in the host 
> DTB (and thus accounted for in fdt_totalsize), Xen generates a new 
> /memory node specifically for the hardware domain to describe these 
> regions as reserved but present in the memory map. And since this node 
> is generated at runtime (it is not a direct copy from the host DTB),
> its size must be covered by DOM0_FDT_EXTRA_SIZE.
Yes, but the original DTB should also have these reserved regions described in
/memory nodes, thus taking up some space that is already accounted in
fdt_totalsize. Are you trying to say that in host DTB, these reserved ranges fit
nicely into e.g. a single /memory node range (i.e. a single reg pair covering
most of the RAM)? I can see that it might be possible but the commit msg needs
to be clear about it. As of now, it reads as if the problem occured always when
there are multiple reserved memory regions. That's not true if a host DTB
generates one /memory per one /reserved.

Another issue is with the static shm nodes. User specifies the regions in the
domain configuration and Xen creates *additional* nodes under /reserved and
/memory that afaict we don't account for.

> 
> For the instance, 10 reserved regions:
> 
> (XEN) RAM: 0000000040000000 - 000000007fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000043200000 - 000000004330afff Xen
> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
> (XEN) MODULE[2]: 0000000042e00000 - 000000004316907f Ramdisk
> (XEN) MODULE[3]: 0000000040400000 - 0000000042d2ffff Kernel
> (XEN)  RESVD[0]: 0000000040009000 - 0000000040009fff
> (XEN)  RESVD[1]: 0000000040008000 - 0000000040008fff
> (XEN)  RESVD[2]: 0000000040007000 - 0000000040007fff
> (XEN)  RESVD[3]: 0000000040006000 - 0000000040006fff
> (XEN)  RESVD[4]: 0000000040005000 - 0000000040005fff
> (XEN)  RESVD[5]: 0000000040004000 - 0000000040004fff
> (XEN)  RESVD[6]: 0000000040003000 - 0000000040003fff
> (XEN)  RESVD[7]: 0000000040002000 - 0000000040002fff
> (XEN)  RESVD[8]: 0000000040001000 - 0000000040001fff
> (XEN)  RESVD[9]: 0000000040000000 - 0000000040000fff
> ...
> 
>  From make_memory_node():
> 
> (XEN) Create memory node
> (XEN)   Bank 0: 0x50000000->0x70000000
> (XEN) (reg size 4, nr cells 4)
> 
> 
> 
> (XEN) Create memory node
> (XEN)   Bank 0: 0x40009000->0x4000a000
> (XEN)   Bank 1: 0x40008000->0x40009000
> (XEN)   Bank 2: 0x40007000->0x40008000
> (XEN)   Bank 3: 0x40006000->0x40007000
> (XEN)   Bank 4: 0x40005000->0x40006000
> (XEN)   Bank 5: 0x40004000->0x40005000
> (XEN)   Bank 6: 0x40003000->0x40004000
> (XEN)   Bank 7: 0x40002000->0x40003000
> (XEN)   Bank 8: 0x40001000->0x40002000
> (XEN)   Bank 9: 0x40000000->0x40001000
> (XEN) (reg size 4, nr cells 40)
> 
>>
>>> aggregates all reserved regions into a single reg property. With
>>> NR_MEM_BANKS (256) and 64-bit address/size cells, this property
>>> can grow up to 4KB (256 * 16), easily overflowing the allocated
>>> buffer.
>>>
>>> Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for
>>> the worst-case size: NR_MEM_BANKS * 16 bytes.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Just to be clear, I have not seen a real-world issue with this.
>>> The issue was observed during testing of limit conditions.
>>> With this patch applied, Xen successfully boots the hardware domain,
>>> exposing 256 reserved memory regions to it (using a synthetically
>>> generated configuration).
>>> ---
>>> ---
>>>   xen/arch/arm/domain_build.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index e8795745dd..7f9f0f5510 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -100,9 +100,11 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>>>   /*
>>>    * Amount of extra space required to dom0's device tree.  No new nodes
>> This comment would want to be updated because since its introduction things have
>> changed. Even the 128 came up as a result of adding /hypervisor node.
> 
> You are right. I suggest the following wording:
> 
> Amount of extra space required to dom0's device tree.
> This covers nodes generated by Xen, which are not directly copied
> from the host DTB. It is calculated as:
>   - Space for /hypervisor node (128 bytes).
>   - One terminating reserve map entry (16 bytes).
>   - Space for a generated memory node covering all possible reserved
>     memory regions (NR_MEM_BANKS * 16 bytes).
> 
> 
>>
>>>    * are added (yet) but one terminating reserve map entry (16 bytes) is
>>> - * added.
>>> + * added. Plus space for an extra memory node to cover all possible reserved
>>> + * memory regions (2 addr cells + 2 size cells).
>>>    */
>>> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>>> +#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>>> +    (NR_MEM_BANKS * 16))
>>>   
>>>   unsigned int __init dom0_max_vcpus(void)
>>>   {
>>
>> ~Michal
>>

~Michal



