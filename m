Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNUQJNm+zGmYWQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:44:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A033755AA
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269743.1558656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pJS-0002zr-9P; Wed, 01 Apr 2026 06:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269743.1558656; Wed, 01 Apr 2026 06:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pJS-0002yM-6J; Wed, 01 Apr 2026 06:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1269743;
 Wed, 01 Apr 2026 06:44:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7pJQ-0002xE-GR
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:44:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7pJP-00EawQ-Rn
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:44:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbec0-e002-0a2a0a5209dd-0a2a45099824-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:44:23 +0200
Received: from [40.93.194.19]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbec5-e484-0a2a45090019-285dc21359e3-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:44:23 +0200
Received: from CH0PR04CA0008.namprd04.prod.outlook.com (2603:10b6:610:76::13)
 by DS4PR12MB9634.namprd12.prod.outlook.com (2603:10b6:8:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 06:44:16 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::b1) by CH0PR04CA0008.outlook.office365.com
 (2603:10b6:610:76::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 06:44:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 06:44:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 01:44:14 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 01:44:13 -0500
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
 b=Q0YPOWUSnG5rvvhGd33hvMqUcMaMYsmUtrGJdsdFIHsjN8NWlzUrpd+18LP/nKlsKiosw0V3TY1XEHFcDO8d9s19jM/UXSjuIs0XB1XvRPCIMGwm0QFLIPJRBr/Xr1gVoGrWg/wY5jE0fa1tpXS2+ubS+X5yxJdQDYj3m2HVcw3ux4bzovoJ5GjXiGbuWwwrNf9VdGg6VzCNqyn+6P2hsQoo/1MJ/ZcjYJHttiABOPdGkAsZzz74K2P4QZ97CeHj3BreIT5/qWxFM8mN+AUEmXjdVU+c2wDSdCwBZhteoB9aPOF0cdRpfLKVVYvLeQmLnl7ZorCioz20QdR1z0CVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MuEpbxuwR2u1gjamX8XTr2+INk4ugZ4MvjwJIDYpG0=;
 b=jfLl1LTtmL1r/z976SH6yloobFJr5ed6XO9K4WECb/DrXrP5Pd/OX0hqCeEJoZZ7uZwq+ybkuim/RrBmJtD/SR+Gpa/3DcWo+5RMadP4bRNlh5fkuR++68jW92D8iWW+Oajwozklw6GbuV87mH61XXkdjE2t98B/LNnGX4ngKVhRsPv//TAArRXr9ILwUcIqwTQRCmIwQ2X9aTxqZiqHlEzaWJWbdvoVdl5oKIKCp5XdvyMcGN7FkE+gknDevX8CF4HlrKosQc4DOcNgOrjTkI7ZB5CIz4d9zyEWaoQlV97tNo/xJB/QFBwae6GtIzqc/KOE7PrdKeFgqoWmF1jCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MuEpbxuwR2u1gjamX8XTr2+INk4ugZ4MvjwJIDYpG0=;
 b=QZVg5Zzlb+PDz6l5H8qmVEbo0xztBaxh4XdvJU6jGsHYANR/YUJFzlPqaDK+7zRW7dGWrJ9m/TsOuWwO8y39/OCvrqok6CgBtt05Pjs5NSusVeiZD1M94rlLUzNm2AEXZOlZTYOhm7EQ1jfH5Z0hVdKTfKpyyj8tkpy5OfHQh9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c9ef48ef-dc41-434f-be00-664712d070c0@amd.com>
Date: Wed, 1 Apr 2026 08:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260331154309.2921483-1-oleksandr_tyshchenko@epam.com>
 <7d4791ee-05cb-490a-a209-a84a6531f0ca@amd.com>
Content-Language: en-US
In-Reply-To: <7d4791ee-05cb-490a-a209-a84a6531f0ca@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|DS4PR12MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a802fa-ebaf-4aab-ed74-08de8fba177f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	urSWsfOlUcCWRjX+pQxwy4hShek14Y4alX8FVhEhlwfit40oM1lZGVsemCTeYs7fjgswfxORbRKaVCKZki2KfHyufCWr/35f9CktYY5pArEkgD8Vbvs0PSn76BfSgruxK3r/hCBJ2G69tDhhIywbPChrdimczN4E7SaeNGoR5IDbls8ekjCfcBQ+HoRmKgmF5xgcLCEraj2sV0XfEIX1WC/LsWUP2P0nLztEl/L8VrN1bVfiLX4YNIgg/bnuM4bPYYLdZXIgh79szZ0YhNBLfMDSMd9pEKpwZHpdSxY/g92+dd3GfneWvBruarC2yjRU+f4kBYsRu5RGTeBYXQs/RTnP/SAoYHvDxpMsI1usAtdDRza8jRibJPFa3wjdWbAQMt2i9hGdbUnM/zwaek0CdMVCEs+C2sGfv22jAJ06j7GuzgBYP3LEjH0cIeLrPqW0sXjwsIt9EXf3mDkmFZFuboaU4mnbW5ZKRR99PGfuHqVA0vzlL2PeDFSZ+ArppBmz5J4vEOZVRCQunb0LsMxOTjngWca/xDgZf4bhWr/oeqfRH1H3C5ZadVvaKb9Jr5ra/9Nk73xtOyLNwfN0vobSinp3Hdf/I2uDCH6gf7usyMk7ugtDZsvpRB9uQyesrmVK1rqdV3VJJtngMwVBEWl7ZzKWCdMD1wqXcfC2gurSzGB2w+JnHyP14Nlq88dMb2OSl2BGGSCTHBzbj53Xb1j2D+0O0LXvk6Y2bJYVij5c//JgsXCDHwDuKFStvYZZ/arzhSyQYpn6bVpHYZCChtWM7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZiNp6qcXxS7/WLJqwbEy6Z60boiUJvTMXPh7WybokqWrPmWNtASG/08ocJk7mY1hNgWflOZ2oYylKO4lG55vCDeTQlxPp3D/a5trMfuQZHhK0WkE/ELYNbDvMLab6T+G8wNehwBswL3phPHmqRXYzMi70/oGQaIZTizugkrgpddIOeAiiF+TIjqlMKpFuGJafN9LL57J88jsM7M5pVyBpTivVyIGOkCakIGQ6SWul2HugHDmLBA7I4omZpb0mclshpGrBHjFKgMYE2AwqBECPXIJpVOeKHQrHyY7iobV84h7YCt6C5ppngJ5G3dai6jBVYQR1DVnCQhmR7hq7gFXgIfElInlaO33w9TPjiOG3X+xV86TY+1vYH3aziPjybb7nxvolvsNzQtaO3jYXl0822fy0C86YK3pBRAPpEK2LJdheKzKaTCITYL8LXOgRk6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:44:15.3673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a802fa-ebaf-4aab-ed74-08de8fba177f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9634
X-purgate-ID: tlsNG-bad1c0/1775025863-69D44A73-921CC7FD/0/0
X-purgate-type: clean
X-purgate-size: 3593
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: F3A033755AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01/04/2026 08:41, Orzel, Michal wrote:
> 
> 
> On 31/03/2026 17:43, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
>>
>> Xen fails to construct the hardware domain's device tree with
>> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
>> (e.g., numerous reserved memory regions) and the host DTB represents
>> RAM compactly (e.g., a single reg pair or just a few).
>>
>> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
>> required for an extra /memory node. While the host DTB might
>> represent RAM compactly, make_memory_node() aggregates all
>> reserved regions into a single reg property. With NR_MEM_BANKS (256)
>> and 64-bit address/size cells, this property can grow up to
>> 4KB (256 * 16), easily exceeding the space originally occupied by
>> the host DTB's nodes plus the current padding, thereby overflowing
>> the allocated buffer.
>>
>> Additionally, the SHM regions require space for discrete sub-nodes
>> under /reserved-memory node, as well as an appendage to the
>> main /memory node. Each of the up to NR_SHMEM_BANKS (32) regions
>> triggers the creation of a sub-node with properties (compatible,
>> reg, xen,id, and xen,offset). These runtime-generated sub-nodes
>> require approximately 142 bytes each, while the appendage consumes
>> an additional 16 bytes per region.
>>
>> Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for fragmented
>> reg properties (NR_MEM_BANKS * 16), the discrete SHM sub-nodes, and
>> the SHM appendage to the /memory node (NR_SHMEM_BANKS * (160 + 16)).
>> The SHM overhead is conditionally evaluated to avoid over-allocating
>> memory when CONFIG_STATIC_SHM=n.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   V2:
>>    - update commit description
>>    - update in-code comment
>>    - update macro
>> ---
>> ---
>>  xen/arch/arm/domain_build.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 3cd251beed..07f331eac8 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -98,11 +98,21 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>>  #endif
>>  
>>  /*
>> - * Amount of extra space required to dom0's device tree.  No new nodes
>> - * are added (yet) but one terminating reserve map entry (16 bytes) is
>> - * added.
>> + * Amount of extra space required to dom0's device tree. This covers
>> + * nodes generated by Xen, which are not directly copied from the host DTB.
>> + * It is calculated as:
>> + *  - Space for /hypervisor node (128 bytes).
>> + *  - The reserve map terminator (16 bytes).
>> + *  - Space for a generated /memory node covering all possible reserved
>> + *    memory regions (NR_MEM_BANKS * 16).
>> + *  - Space for a generated /reserved-memory node with discrete SHM sub-nodes,
>> + *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160 + 16)
>> + *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disabled.
>>   */
>> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>> +#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>> +                             (NR_MEM_BANKS * 16) +                    \
> NIT: alignment. I'll fix on commit
Never mind, the alignment is in fact correct.

~Michal

> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> 


