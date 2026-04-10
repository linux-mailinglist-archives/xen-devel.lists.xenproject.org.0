Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOmkHQyh2GnegAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:04:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7413D30EE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278381.1563242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5up-0000G6-GF; Fri, 10 Apr 2026 07:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278381.1563242; Fri, 10 Apr 2026 07:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5up-0000D0-Cy; Fri, 10 Apr 2026 07:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1278381;
 Fri, 10 Apr 2026 07:04:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wB5uo-0000Cu-CU
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 07:04:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5un-00EZiw-JQ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:04:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8a0f9-e002-0a2a0a5209dd-0a2a450b9f04-14
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:04:29 +0200
Received: from [40.93.194.46]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8a0fb-bca8-0a2a450b0019-285dc22e9992-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:04:28 +0200
Received: from SJ0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:a03:39f::21)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 07:04:21 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::5e) by SJ0PR03CA0226.outlook.office365.com
 (2603:10b6:a03:39f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 07:04:20 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 07:04:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 02:04:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 00:04:19 -0700
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Apr 2026 02:04:17 -0500
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
 b=rzoeCWKqzdwvQbXcDVFL7pZpcB/VTklR0iUShNLwVIpIVVNoDQw53ayLmjIYRdJKAhnT6n5nKmDsioK7oskA4VdnZQe0NmfM55qQh+MZN1aBhe9KCLpOjR4miTEfonz97qfJRpxY4P+hlbXEejCsU2K8bI0s2LX4RS2y3nCt5zPyJrCs2hUQX2wvY1MPxEGuOQmXkL6fdHDop/wozFBL1EJMNwBKwdz2FFCfioIjPfbKgPX6r40ZCXu1e4bfyxERm5Dwx2KOMy6GFCVoGbvq5xj64ynieMZ9sB9lctU9CWVpJ8J/dBcErCmndzsfIuTM+zxKjEl9e3sTWMUz57ikNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZn7ErxUd+DKabZl6OfftNVf6LgBJtkKHdjlFuA8pTE=;
 b=y1kly0zvrQkvNgs+zGXIQAy87tRLNnTKD5wq4DrOG/yKIXoS/ElKshqRpp12PMKXlbUZ98lHje0/VuDbVe8A2wIOK3kPAjhV677Kb0p9ICNd8oyrPHst6cakxmAzJNgJi4mqKvxxr1W+UJS+9djIUne+AVw2PLKK6RaHcYmg2kkLtq2aHf9hwMsvqqpfzQfOOetQXhBRCGxjz8a1JBPu8TK2WvE5GfS+7dxT/VKPdJ+I78LOFMYUiUFXs5dSMLZjpPS1FjshBF17aMbcRySHdK8BWELM2qGMHoMKYR7hQO2PDn344x091TCpJvfD2aNF6pDb4gR7/W0+ZkngVe7dZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZn7ErxUd+DKabZl6OfftNVf6LgBJtkKHdjlFuA8pTE=;
 b=39pUHmyaoZG+uBQCSphzg7JYNwTWFz6WDOy4grsF09Un96un68SM6WAeh3Sqy2ALIOmm/uPOxG44aw0UvinBSpJgW1WU3tkbVlRMO5Pmwi1dH6xZqBE7EZUq4l8C08Fm14E3QD2rXaszPWb5+vQ4d1kku0GtMiwpKUY8fcqKn2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3ec5c89b-6429-4bb5-a2b4-585e2feb1685@amd.com>
Date: Fri, 10 Apr 2026 09:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
 <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
 <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
 <6093D2A3-1823-4587-BB81-4593AD060D71@arm.com>
 <f9874489-5692-4735-8db4-d320142af9f7@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f9874489-5692-4735-8db4-d320142af9f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d886fee-1334-4249-bd0f-08de96cf6375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pqb0krf4wKE/7N6dn99hZw1HIi7BXbtVBb8mLQgsuPNqqvlD6ciMmFughRToODiYqUTjRuD3JiSveavz7BIt76OMfrrnIpTkJb4IrTGB4HqoplTsXMtxKnfUFVzXl9VQhhIjPNHUqdz6jlrFsQMeRIwMXPzpuHLbS/yGzuzTYQh5/6lHPOJsUne+4Ld6sQE4zhP0O7qh80l8e4gy1x9/dPYMsaz/9aHyVEGp6g0jbaBhPdAigoSkg1PNoTonryDVOW//lSYYYsezRM6A0U5oMlZM/yRiw98bB2H+ENKHZL/a+Dw+4QWcMjWxteqQvQEPg4KSJcQsfkGm+N75k12OLPahMAApg5yXsKs4aQTf+/h2LjMQz6ZgNLeW9S6s9+A8IgYVgvcJ50fLyqWxnnCYdisvPG27673YDhy86z04g2WGMjlw3XV9IvuEkFWqsLYZqW4ZRHfkYDWcN9N4Mfrd+9P4QMRWcLGriIJtKuI2oHiKEz0cZHdMDlgL0o3+/qhvG1DInxEewBAls5O8gG66EfFMfmGT11bA7Ot80UcsDMRyIE5vfbgM6v5cT95jfzr5Qg4KNBI4kKTskOUhMZVR6ZfRo/yjnkK2lJ33tfrF/r3oFBYzRazQrnNcF+Ggoy4sMZDxqsnHHMxsSNKBR5WkkuP/2tgRoJ06l5S288zCf+nutPzZv6NaZUI6kq2P1S1Z8dQM9k13QNE7YNc0/roxwZ1DXde87R+1DfMkWshy2TiOTD4cPdMGRwaZPmFthCUccwrlmelT7YC9i+9vQ3bOlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AsAkDY0EjTIkSg8QRK2LKWMFSjScM1oQOOELzfoK5dHQFbhgpXPJeT6XXNEr5N0mOGcEr1YLiRW6KF6eple6s/UFisEF9azQjLY2jY0ssSgAxGUXnLqmOADHaIavrYjAQSYXGyefJt6flZwXOEPoxyDMhs1ilO5SVVJTh3j9Z//DbTPgq+Nih/1Z8zYnbSnjkhUYS5Y/rKd1G2iyHDTEYoCXs/DFKSBQZmoz8loXUU3h3S2p27JaX3nmXSoxowMuDiL12gDpqM82F53ZotWUDZMUpvnB3pqO/rxbNz0WqWo+iR/ubRJWryFLOV2x8wEzPUoGiIA4O+u5Lg6+eOSdartHJcXsS8SX6plz9zQlYZlVPSkPuYjXKd7Un5drYshcbwO+3DAvfEiwnFEkPgEt8CISqjx5rZond0HZbyhkqADgrQtpbgeH1S6bxs/sqgS6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:04:20.3443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d886fee-1334-4249-bd0f-08de96cf6375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
X-purgate-ID: tlsNG-42698a/1775804669-1734C2A1-0F8E0ABF/0/0
X-purgate-type: clean
X-purgate-size: 2928
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,arm.com:email,suse.com:email]
X-Rspamd-Queue-Id: DA7413D30EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 10/04/2026 08:57, Jan Beulich wrote:
> On 09.04.2026 15:34, Luca Fancellu wrote:
>>> On 9 Apr 2026, at 13:52, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>> On 9 Apr 2026, at 13:48, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 09.04.2026 14:22, Luca Fancellu wrote:
>>>>>> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> The check uses >= to compare the total number of colors against
>>>>>> max_num_colors (which is ARRAY_SIZE of the colors array).  This
>>>>>> incorrectly rejects input that would exactly fill the array.
>>>>>>
>>>>>> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
>>>>>> for dom0 would fail.
>>>>>>
>>>>>> Change >= to > so that exactly filling the array is permitted.
>>>>>>
>>>>>> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>
>>>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>
>>>> Did you see Andrew's reply? If that earlier (recent) commit was wrong, I
>>>> think a 2nd Fixes: tag may be needed here. For now I can't help the
>>>> impression though that there might have been a re-basing mistake, where
>>>> that re-base may have wanted to result in this patch dissolving into
>>>> nothing. Yet of course I'm all ears to learn otherwise.
>>>
>>> Oh, no I didn’t see that! Thanks for pointing that out, I will have a closer look.
>>
>>
>> I had a closer look, I feel that the patch is ok and commit cba8a584de171c8c4510709c2edc9f1cf86b21ab
>> was missing this corner case.
> 
> If anything, that part of the change there was outright wrong (and hence, as
> said, a 2nd Fixes: tag [actually, see below, simply another one] is needed).
> With overflow excluded,
> 
>     (*num_colors + (end - start + 1)) > max_num_colors
> 
> is the same as
> 
>    (*num_colors + (end - start)) >= max_num_colors
> 
> i.e. the state before that change, isn't it?
> 
> And yes, now that I look again I think I agree that I screwed up there. Yet
> then the (imo) better fix would be to undo that change, rather than switching
> from >= to > . That's one less calculation overall. Michal?
Yes, I do agree. This patch can be modified to just do:

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index eb7c72b24023..6dc614739a98 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -78,7 +78,7 @@ static int __init parse_color_config(const char *buf, unsigned
int colors[],

         if ( end >= NR_LLC_COLORS || start > end ||
              (end - start) >= (UINT_MAX - *num_colors) ||
-             (*num_colors + (end - start + 1)) >= max_num_colors )
+             (*num_colors + (end - start)) >= max_num_colors )
             return -EINVAL;

         /* Colors are range checked in check_colors() */

I'll do that later on.

~Michal


