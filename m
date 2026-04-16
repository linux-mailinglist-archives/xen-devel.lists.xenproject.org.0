Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH3BB/KQ4GmsjwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:34:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988F40B137
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283007.1565318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHED-0006Ht-QH; Thu, 16 Apr 2026 07:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283007.1565318; Thu, 16 Apr 2026 07:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHED-0006GG-Mw; Thu, 16 Apr 2026 07:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1283007;
 Thu, 16 Apr 2026 07:33:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wDHEB-0006GA-HL
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 07:33:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHE9-00Bzbm-Ek
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:33:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e090be-e002-0a2a0a5209dd-0a2a450c8770-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:33:29 +0200
Received: from [40.107.209.41]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e090c7-f40c-0a2a450c0019-286bd129d959-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:33:28 +0200
Received: from SJ0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:2c0::11)
 by DS0PR12MB8295.namprd12.prod.outlook.com (2603:10b6:8:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 07:33:23 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::63) by SJ0PR13CA0006.outlook.office365.com
 (2603:10b6:a03:2c0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Thu,
 16 Apr 2026 07:33:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 07:33:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 02:33:22 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Apr 2026 02:33:21 -0500
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
 b=k+OwDvswQJ02CQ1kYV+tfGQCael/3eI4UrAx74FifOatTA/NSlOIsWiTxCFp65WW+8WuzKSEprumvIzJGq2LzP3mhsWPxm3eT8QcVbJZOT9I/D+KzxI5bE7NclsIqwBnOBr4Lfcox3elj5R9JkIkU52GvIWRdJyBREN0ckT4bYoxQgTIKEMBRs7VQTj1O26X+DPNIDEIABcxaATPaTXmhT6GEvX1WY27JyvYMufuzvEZXuzX26hjvCHGhwEW9jF6rJnoy55E7xnlKZZTcGwdw3EDctKvkaS4RfiOZcc3A+LINWCz9w2SHGRdP78emaw5Jr87embtgVJKb+Ns7/Bqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjz6lH4DBIsBQmGmwW1Sb4aKSYK3QlElRjNYFM4WV4s=;
 b=Zt8k0pTLlFZz8ekSdM2aJAl981bVuYDUmQHqDOM+yvl4WTHCSKOPvZoP0dSnIyc5BCMRTydamjIKvflFxSCdmNaaanoEuqk93z/mjXWPl/tYCyYMeiwDa/QYF6UzuZug8LK6QTABtlpW9OT9qHrGuSvEIg5DgrUMBhAkvX1VVTpuvTJrKzmiDLNlAJJtlwDSH1+Vel0MVqlOIDLLD11m/AdIngf/vQ7wep0xjzs+qh5woc8tL7oqW0SrusUoZC64gj9aq47ZTINWGXUxM34C9WU2zsR9IWfqqqY1c2Cjc5atsko9nRdQiPRDTXpjqFpgX4D+9dJTfZskU6M+VWlc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjz6lH4DBIsBQmGmwW1Sb4aKSYK3QlElRjNYFM4WV4s=;
 b=p9PaRl/icFX+x3vsnMq1BR/Sr8jyjxfCL8De18g82sTlIsoaOEd2OsUtvNG/WIdqpmsM5qVnEG6deMro2z1kWkG8SyiSJuUBRiVQAbFk+XzWl4ejoNb8J8oz0X2gev5/971TdVBSFyrJBD1A9XvVsnLdATWYURgqLxIvGSjOZzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1ab0c888-e890-490e-adad-938222f31a62@amd.com>
Date: Thu, 16 Apr 2026 09:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-6-michal.orzel@amd.com>
 <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DS0PR12MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4190388a-c2b8-4a1e-1eb1-08de9b8a70d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mFVp1ILR11HMTH8C5IBcCZ7sX6HmwafW/jsYErRrsxdl5r+KTC8rQhjAr2mYEycMKdxbmYAtj4B6cHgJ5FpX7r90rE7ZEZ9mOupZ7m22nGC15BKyGLjlk1Hj18MIiEq8k8qd1ttIF/MPhfb5+U7LSiKpY96YDGFI9YofPWlL4ygA+uffliPv6+zt+1epO5LRll6teEDZr43wiOKNyI7vr+qRNF9H3eCpF8UltmtgQFIgTkEsqbq9H6lJzsiPAsMrxS+MdxMwv3ZtetbA09PkjXsRxC827tUz+g/4h4Fe0cbYKy+aT5p/scN4gUKQLsdMC8i/omb7Sfe+/ofKPZlRp7MQJ9eVKp1tEtd1qhEQIzret4sGKauwMQQAVOqw9ymMcTrhMRNuaxNhP+imemC+RU/yvDYdDrzKeyEbC7pnNcmM0Ct8mLfeXDfQ4V7smTlUG1iIOdcuI2653RU6mriRooNh1gozj300sT2gxy46PTyPTmlFQInZWmZHCD6ahRb5foAPZHabX15XSUcE99WABIAvNJz/78HiAiF4IIFcB1btlN+TU84aWJCjrK6cqvpJ+A5ecx7AOudzRw64TK4TgRrhRwgUxqheO0SZlUvPNs/PdLqjmVEzxu9w3mQfA3FKNSE3ImZJmAgalmGGmlf0twE4Tx/Y4SvEnOurTgnstDI3rC5noxbfKGGKd74G+uZARBAtr0x2KTXjlXKDBwvda2qJfZaUCC+TVxRyGTI0YlqsXfnP+euxJD8IK2/b4k4RYYwZkbsp6I489ps7n7qP9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fytqQGQRQIUwAaucP0Y+Qwm3iJbZCM848GD13rubk9pKasYvDnuEgqCPtincLSz9lm3Fb/Y9qIIENVZpZUGEwv0iFADfVLr6VUKX7td2nzzhIAWVDVIyPWNnzmujOBKfZ9gh2YZM6GUn4JeyDw+0KCnMY55PcDKosvswomVNkLwRZv8YrD8Rofx9qlPn4dfoS47BTOdZCe8KFAJNetgdlRSydXRZtZzybsClghvFoG5vkqqkxAUXtOjQp8hOn4KRknxYYtczVqS/900FC42WNATmS8gdrOU6hnDoEUPyNe4F5KMpHqqHcp1tIoR4wegHpi08weShiDwM85pDx/x6DjumP7qvsgQ5Mi0GidpKx9CcEhyrDMZwvKPKc9KfcisghPi4/RGtpVfjiVzOKXKXR7vK+PYO3+JBllqkj0k6FoudO1A5Lds9xULymg8l9+0B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 07:33:23.2323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4190388a-c2b8-4a1e-1eb1-08de9b8a70d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8295
X-purgate-ID: tlsNG-d25034/1776324809-FF149A3D-B64F0B10/0/0
X-purgate-type: clean
X-purgate-size: 4122
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 9988F40B137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 15/04/2026 17:36, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> overlay_get_nodes_info() is called before fdt_overlay_apply() to extract
>> target paths from the overlay. This fails for overlays using phandle-based
>> targeting (target = <&label>) because DTC compiles these as unresolved
>> fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() to
>> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
>> manually modify the dtbo (even for hwdom) to switch from target to
>> target-phandle by manually inspecting also the host DTB.
>>
>> Introduce overlay_get_target_path() which directly handles the two
>> targeting cases that occur before fixup resolution:
>> - target-path: the string property is returned directly.
>> - target = <&label>: the label is found in the overlay's __fixups__
>>   node, then resolved to a path via the base DTB's __symbols__ node.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> xen/common/device-tree/dt-overlay.c | 65 ++++++++++++++++++++++++++---
>> 1 file changed, 59 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
>> index d3d4669718ac..a0dee7edb7e5 100644
>> --- a/xen/common/device-tree/dt-overlay.c
>> +++ b/xen/common/device-tree/dt-overlay.c
>> @@ -286,6 +286,63 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>>     return num_overlay_nodes;
>> }
>>
>> +/*
>> + * Resolve the target path for an overlay fragment.
>> + *
>> + * This is called before fdt_overlay_apply(), so phandle-based targets
>> + * (target = <&label>) are still unresolved (compiled as 0xffffffff by DTC).
>> + * Handle the two cases that actually occur:
>> + *  - target-path property: the path string is used directly,
>> + *  - target = <&label>: the label is looked up in the overlay's __fixups__
>> + *    node, then resolved to a path via the base DTB's __symbols__ node.
>> + *
>> + * Returns a pointer into the FDT on success, NULL on failure.
>> + */
>> +static const char *overlay_get_target_path(const void *fdt, const void *fdto,
>> +                                           int fragment)
>> +{
>> +    const char *path, *fragment_name;
>> +    int fixups_off, symbols_off, property;
>> +    int fragment_name_len;
>> +
>> +    /* Try target-path first (string-based targeting) */
>> +    path = fdt_getprop(fdto, fragment, "target-path", NULL);
>> +    if ( path )
>> +        return path;
>> +
>> +    /* Phandle-based target: resolve via __fixups__ and __symbols__ */
>> +    fixups_off = fdt_path_offset(fdto, "/__fixups__");
>> +    if ( fixups_off < 0 )
>> +        return NULL;
>> +
>> +    symbols_off = fdt_path_offset(fdt, "/__symbols__");
>> +    if ( symbols_off < 0 )
>> +        return NULL;
>> +
>> +    fragment_name = fdt_get_name(fdto, fragment, &fragment_name_len);
>> +    if ( !fragment_name )
>> +        return NULL;
>> +
>> +    fdt_for_each_property_offset(property, fdto, fixups_off)
>> +    {
>> +        const char *val, *label, *p;
>> +        int val_len;
>> +
>> +        val = fdt_getprop_by_offset(fdto, property, &label, &val_len);
>> +        if ( !val )
>> +            continue;
>> +
>> +        /* Match entries of the form "/<fragment_name>:target:0" */
>> +        for ( p = val; p < (val + val_len); p += (strlen(p) + 1) )
> 
> what guarantees us that p will be null terminated, if a malformed overlay
> is passed this strlen can read past the string, we can use strnlen having as
> upper bound a counter=val_len? decreasing counter each iteration.
> 
> Or do you think it can never happen?
In theory it can happen, in practice this is something not usually taken into
account. But we can surely stay on the defensive side and do a single check
right after fdt_getprop_by_offset to catch not-NUL terminated stringlist:
if ( !val || !val_len || val[val_len - 1] != '\0' )

In case of no other remarks, I'd do that on commit.

~Michal


