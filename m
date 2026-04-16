Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFgENM6f4GlukQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:37:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2840BA82
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283118.1565408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIDl-0002qf-NQ; Thu, 16 Apr 2026 08:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283118.1565408; Thu, 16 Apr 2026 08:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIDl-0002ow-Ju; Thu, 16 Apr 2026 08:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1283118;
 Thu, 16 Apr 2026 08:37:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wDIDk-0002oq-2R
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:37:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDIDg-00DGgA-NW
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:37:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e09fae-e002-0a2a0a5209dd-0a2a45078b76-20
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:37:05 +0200
Received: from [52.101.62.13]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e09faf-229c-0a2a45070019-34653e0d14a0-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:37:05 +0200
Received: from DM6PR05CA0054.namprd05.prod.outlook.com (2603:10b6:5:335::23)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 08:36:59 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::84) by DM6PR05CA0054.outlook.office365.com
 (2603:10b6:5:335::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 08:36:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 08:36:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 03:36:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 03:36:58 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Apr 2026 03:36:56 -0500
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
 b=l2LPIpibjWeo7+C0hwUXALvLgA3+gKBnN6bvOuEBzgL0F8lxU5d/mDA9qa7OQ0frsV+Xy5nbn4S23SW9kUh52D02QuBFMweIKf1ShB7GaRF57NBCV5H5zEoYnI1AQCmeOUzzIiZ3eVEH9t5X3hqx1HgcFsFtntowWoHICPY+8ZhXE9OUJ6l9f/3RAio7EEOjHsQIg86nzF/SGAa15CiehPkpdzbqVP+kcO+iPpZGPQJDJeMJc5fRte21LXre4JG7jlQMi7DYCtcztbuAJgYJGQw0/m0A5zgx615U5ynoB9zDXsMokhQwhSO6CdqssnkRL2kMqhlm0hdyXhxb+ZK8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MRUbZqKdvZ4HtnafZuZfQfVQ21MvGwlzSggyh3dnjQ=;
 b=dVU1rsL9K96LZBFDMA9HtX9Wbmo7oXf55QzH1iPyiUTRwpK6dmk6/U5AQ7XQh2aXfK/TLEmt4+6hwESkZSItdVBgHSXGFbTVUndhCq8r8hegTJl0ddnPQqK/4CBA0rwwNyaXQ/6qWtIbri6DQDZMwGg5gqjXOLZulyukJh5boynbj7mLXed8a6Qnh3cNeOilUjgm2rquGHtABwCqV0BdGx7l8/ntfv2LZubme2eVxpw741J2RP/wcA+gBDVtOYImX/ieyxbpEy5DgLZj6KdhwsizgG8xhdHqu0X6VN98xvJ34MHoezur2cTb73OJ0VVaaUB6xeS9czZuywmrx49+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MRUbZqKdvZ4HtnafZuZfQfVQ21MvGwlzSggyh3dnjQ=;
 b=YckIOJIltFbjLYKGfPwGMa5Ia0/5sPiuA6pvqm9uwjqcaU/wej0GKqP1VW5k3xeRGYqc7fBqF/ypS3BWedr9tBsci5MCB8WScnF1U0AjgxpBBx7BsQL6jRCbL2sX+jAoe9H3LMi+qjBdskfbMetR6UzQjVLBpwdjUNcAqXLL3Q8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <de3ed940-c788-480b-8820-66afb3c8dc82@amd.com>
Date: Thu, 16 Apr 2026 10:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-6-michal.orzel@amd.com>
 <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
 <1ab0c888-e890-490e-adad-938222f31a62@amd.com>
 <6E811F82-6F9F-4894-B2A3-03AA166E78F4@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6E811F82-6F9F-4894-B2A3-03AA166E78F4@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b97038-3789-49e1-f76d-08de9b9352df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2xiOo8eo3UwcuHhKI+NFYK25gAinl0VNkBtkz5REq7x7BHOJ2QMQDnt7RE9ebD+/01RPOyhOIh1AoyZ78NWE4YsntOueTuN3OJiQViE8xLx+yJWtwfkVGXSm5RtCf+abZX7f/Z45tEc0vWawK84imn/HJZfw38uuupo5VrKyCiXTw55AK3cludhDHUxfNP8BUGYgZzhMRT5z597XlQdthIylKm/y/B/u64OlyytyBzEDDYogl+6KG59g+EnIOokToiQHv/9XsbBpD56S9Uac+XBlggvf8DerZvsJTdEgU7+Y+yjwL3LT5fpiuzynchoziz7Ii3wxgYdWLdf3N+aPI1UmyfSQg1YBTCL/fBCN+e4LRk4w2Z13vipfLbNxH7J16w0ij5zJppRbRc95+DBflEIu8m5sx4uyHjnh+D1DbWqjJuXO4xcoIbWj6zQZ43VMoRi0iKjAm1EXResZ6kT5JLycyS4f3bgfnoyoa6QtxI2rx9Y2Hlv4boBVeJ5stmIhQOQUlJaH6lBIAsqFlNaTMdO66khJZiyERBC6T5Utpn3tQtUIFj1LUZWoIUCw2mJW6GGafzIWWHYf8xBBsH9CIpRSyOxUzkJcVl/A2TyFjKLZZrbtJPn1nPk7qGgK5hgjHSE1egMG5NuNhpxI53XwbVrDeFMUXWkhR9cRG0RU/E8i9k6f3TBq4yVB/cu5FkIaL7g+PGr/c2wxsXqUyPKw99dTUERlHbN8i7Pcdxxv5x3xfMkxsi3aFPiMGUX6TTGNZP4ZzC2F9U5dSaWgkh064Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i9RQCQvfIUnRLFg89tNkaAJDB88wzxga/Syl6zgZQuAVu6LO3OT3GUM9JdInS56YdzI/tuulcdy6C+VIz0wKmc1Ww1bUW4xOUYqmSqyC6PA9uBtXVTZzAJsi1YTJSTJXbmeewWOHoVsDowwWKHzw2mPaFEv9Cn2ZPlyPP3FwkNLTjZ2QSrKj/myuiHBEZZXTfJXDeAdjw21yYTftKgxN9X1pCRaFEIWXvhiqQH21Z69y36jtRjpQaY3nLVLUlglB55G+O8c2fHvILUHbjAAmpQ3PhqHWPxG+BCHp9yc6Ngap1CGP6L9A0MBT2Vd6aL6Uk8ktaOBBv4K0Y3AFe6NM7NUmF0qvawhRONstSBcNRv7YvBVPc9FF+yZD3HgEnCLvYeKYfh/XJH6qHWiY0Jb/vkoiIPJdnt/WQkNPRZtchma0i8LntrygVf0aPInabkEZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 08:36:58.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b97038-3789-49e1-f76d-08de9b9352df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
X-purgate-ID: tlsNG-ef75cf/1776328625-AD56BC48-363EA4E8/0/0
X-purgate-type: clean
X-purgate-size: 3257
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
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 85B2840BA82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 16/04/2026 10:21, Luca Fancellu wrote:
>>>>
>>>> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
>>>> index d3d4669718ac..a0dee7edb7e5 100644
>>>> --- a/xen/common/device-tree/dt-overlay.c
>>>> +++ b/xen/common/device-tree/dt-overlay.c
>>>> @@ -286,6 +286,63 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>>>>    return num_overlay_nodes;
>>>> }
>>>>
>>>> +/*
>>>> + * Resolve the target path for an overlay fragment.
>>>> + *
>>>> + * This is called before fdt_overlay_apply(), so phandle-based targets
>>>> + * (target = <&label>) are still unresolved (compiled as 0xffffffff by DTC).
>>>> + * Handle the two cases that actually occur:
>>>> + *  - target-path property: the path string is used directly,
>>>> + *  - target = <&label>: the label is looked up in the overlay's __fixups__
>>>> + *    node, then resolved to a path via the base DTB's __symbols__ node.
>>>> + *
>>>> + * Returns a pointer into the FDT on success, NULL on failure.
>>>> + */
>>>> +static const char *overlay_get_target_path(const void *fdt, const void *fdto,
>>>> +                                           int fragment)
>>>> +{
>>>> +    const char *path, *fragment_name;
>>>> +    int fixups_off, symbols_off, property;
>>>> +    int fragment_name_len;
>>>> +
>>>> +    /* Try target-path first (string-based targeting) */
>>>> +    path = fdt_getprop(fdto, fragment, "target-path", NULL);
>>>> +    if ( path )
>>>> +        return path;
>>>> +
>>>> +    /* Phandle-based target: resolve via __fixups__ and __symbols__ */
>>>> +    fixups_off = fdt_path_offset(fdto, "/__fixups__");
>>>> +    if ( fixups_off < 0 )
>>>> +        return NULL;
>>>> +
>>>> +    symbols_off = fdt_path_offset(fdt, "/__symbols__");
>>>> +    if ( symbols_off < 0 )
>>>> +        return NULL;
>>>> +
>>>> +    fragment_name = fdt_get_name(fdto, fragment, &fragment_name_len);
>>>> +    if ( !fragment_name )
>>>> +        return NULL;
>>>> +
>>>> +    fdt_for_each_property_offset(property, fdto, fixups_off)
>>>> +    {
>>>> +        const char *val, *label, *p;
>>>> +        int val_len;
>>>> +
>>>> +        val = fdt_getprop_by_offset(fdto, property, &label, &val_len);
>>>> +        if ( !val )
>>>> +            continue;
>>>> +
>>>> +        /* Match entries of the form "/<fragment_name>:target:0" */
>>>> +        for ( p = val; p < (val + val_len); p += (strlen(p) + 1) )
>>>
>>> what guarantees us that p will be null terminated, if a malformed overlay
>>> is passed this strlen can read past the string, we can use strnlen having as
>>> upper bound a counter=val_len? decreasing counter each iteration.
>>>
>>> Or do you think it can never happen?
>> In theory it can happen, in practice this is something not usually taken into
>> account. But we can surely stay on the defensive side and do a single check
>> right after fdt_getprop_by_offset to catch not-NUL terminated stringlist:
>> if ( !val || !val_len || val[val_len - 1] != '\0' )
> 
> Ok, do we also want to print a warning in case of malformed properties instead
> of ignoring and continue?
That's really a matter of taste. I would not do it unless you really want to.

~Michal


