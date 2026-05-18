Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AyGEuZTC2qYFgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 20:01:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8229571D73
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 20:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312198.1582357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP2GV-0000O1-Ls; Mon, 18 May 2026 18:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312198.1582357; Mon, 18 May 2026 18:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP2GV-0000MH-J1; Mon, 18 May 2026 18:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1312198;
 Mon, 18 May 2026 18:00:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wP2GT-0000MB-Ot
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:00:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP2GT-00FLJN-4m
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 20:00:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0b53ae-bab6-0a2a0a5309dd-0a2a4507a520-44
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 20:00:28 +0200
Received: from [52.101.52.43]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0b53bb-229c-0a2a45070019-3465342bf2aa-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 20:00:28 +0200
Received: from PH1PEPF00013305.namprd07.prod.outlook.com (2603:10b6:518:1::17)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 18:00:18 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH1PEPF00013305.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 18:00:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 18:00:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 18 May
 2026 13:00:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 May
 2026 13:00:15 -0500
Received: from [10.252.225.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 13:00:10 -0500
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
 b=VjaDPc1IDKbNvn7Lf5dBLOyA5RwRDqB9h4NejAp3IHd98is7Im75WDRRLxnaS+KcY5GWf64Q9zTHsv0TNMrfFT581vC8OA8nj8w58DYPHV8DqNhQxEZnZA/4M5+SCYFLr9byj9pUvHtMPIjkohjyN7fCAOuOlG6dU8X0fwTSLDniPoWHvM6PV/HRN4dUhrxuHFgJVFS++4zydR5s/5FO9LnDBejZnUZzSLO+5wxzFqdmhJHOP1nc6lCxZKHRSeSq3EU+xNd211V24FI/VYjPInNaJrcMjC/zvqOiFiBwdsKu0s5QsFj12YklNcaYuQKcTwFDwOxuflsccPKx8ueAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3KZXaEvl/iWr8NiuIWntoPtBXfNjIoGDvr8DD4eLN4=;
 b=KTlWmN7VHEWk8/dlP6RzB91TP4AHlil7QuulZ6lEd6Kfi5sqrkB2nNiK903nyOeQgX97kN6RTHxTOPpx/SDy5kZtJ73jYktJbsTs3FvXU52xS76ImRZigfHkfaIrvk1T1vW57R9b5tZfqYQaO9/0dbTmJqUNzry7B+PQ/PJ/+eh0egEHMHeiDm7s1CLHip7GTJF9rJ5ayOlNpMf+4pKimlD3Q/mS1e9HO5cAonghdn7aaMvF+tB2kwYhvMms3b0pOHsZGtDeZ0/xCG+VzLWw/W+MEiQvgemYNXKblcphM7LJvsVymJPxMX+S5xCWhNCsGVamjJIQu2fJNsYIPkzVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3KZXaEvl/iWr8NiuIWntoPtBXfNjIoGDvr8DD4eLN4=;
 b=ItyfJ5DSmXOt6ixUMhN6dAoxuvnT4RjRgCuJTkpytpTE5tXqkS1aCse5EMNWP2q6pZFmU95qYXX14PAzDfm77pKzMa9VcC4LP0NeKVzxVhNi2Kg+Ur8Prbp1p2WMS0NGxGGg8HLG8oyndmJBuzEoJDrTRnbIUFhDzvJRI2bcOTI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <93e15ff8-a313-4f19-84f1-2906cb2ade1b@amd.com>
Date: Mon, 18 May 2026 20:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) v2] gnttab: simplify (really: drop)
 gnttab_set_frame_gfn()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef4b2fc-257f-4ea6-c40a-08deb507526e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SyO6tIeRbFWA7v8pohKru9lefmu65TOVKv+DwRWnrIOneukgkMnaDfoR2RHmwlPrahq1SMwYUNa0oZS1IDnijGaayRW7VJSOlVcmywU2PSWIkmU8tdk0jQ8DRTg+sy+y3l+BtrsC6Fpbo49tyDM0x3iJ+5jyAtPx88Y9imfA47LzTxVtu94fLDtFLD9CYWY+adiLszJ9cAvaTM97GjijKyIXpz6zJ33H2FfkWsE4IA1CwvfLjz3oxCnUAnVBqOsUks3K7Y+YO+fEfpGIuKExhBO5Pt6/9nHoexQFyHJB+21msEeb3h3g0y0syzGzp4G1vK3oDMPbshXupNqMKxo4SfQt6qpiDDNSy21I8TIyqDvde2rgXto+3BOHrtuEaJyrRLeKPwbJXbPhK+sEiBVGZc0WUL5zsno6UKSyHFFsrT6KvwsXWLr6OHvULikPqzv1NrSTkpe1Qz/UlbNi5E3mzdRdAsAV73g0W9VfdYv+HmJyeziKnVBa1FfBsWxVKGwH6Ayt4dA/ayy6xXB4ySQnpR+kZ3pw33M/V1IbsNJIDr8/8pF1BrED7/gTpjvQuLljn8lRnubBIRBPI7aqs7kGnYts52+gYU29DYsTh4LChzDDo+3H1C9ycmAaWnEcfIpEpPNe1HaYlE9v/hmLEAwkZ901AJslwiKh187yG7awaWfD56yUyv9hN9gh9Os2wQ7ssfgkTuu/3w8GH4oBXbdrlJY+bgpd1gnW1zagg+IuVdg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IFTcY4BtDlLg23cDFlld26jxelyI1kXZEtx6UuBc7Uuecq0bkJiySmwQcSvrbbQ2FGTbCIiTNLsF7ZwSPAcKnGJcidsDgKcCMI2yBNNWUAKzCz7lHgTbcrXRjIsFq6mgbcQui/P7Q5xkwfymbSa9SFjlCMvmM+6kcCAuebI88d3f+kinR2/Y9VIL1/j8EX+804Si814FFpH3UEVOQe0QvGs3xxVCKQgHEmao/9uMU/YMXV3QCK7UhNGr5IGxBVI1KjFI0KtvjCk8TL+t7/UWajYtfw2miozteSsPtAWmbULZ0glajrEfosI94X+mkuX+Slz6W146Pv9awKwHWElRzZwGvduZ70CKGia/EI7m5UGrmf978tfRVJjc9e3kH74vGOYljHhUW+S+oP01ad8D+xL84nBUheihjYYgqnHefoX4Cvf14wZSKHGEogB9jjyL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:00:18.4696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef4b2fc-257f-4ea6-c40a-08deb507526e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
X-purgate-ID: tlsNG-ef75cf/1779127228-0AD77C48-E6836939/0/0
X-purgate-type: clean
X-purgate-size: 3526
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,citrix.com,vates.tech,7bulls.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: A8229571D73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 12-May-26 16:46, Jan Beulich wrote:
> It's not really doing anything for valid GFNs, which renders its one use
> site pretty pointless. The other isn't so much about setting anything, but
> rather about clearing.
> 
> The main point here, however, is about Rafal spotting the double
> fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
> again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
> in the already fetched GFN, while dropping the no longer used parameters.
> 
> As the result is a mere wrapper around guest_physmap_remove_page(), drop
> the hook altogether.
> 
> Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Drop hook altogether.
> 
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -50,13 +50,6 @@ int replace_grant_host_mapping(uint64_t
>  #define gnttab_dom0_frames()                                             \
>      min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
>  
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> -    (gfn_eq(gfn, INVALID_GFN)                                            \
> -     ? guest_physmap_remove_page((gt)->domain,                           \
> -                                 gnttab_get_frame_gfn(gt, st, idx),      \
> -                                 mfn, 0)                                 \
> -     : 0)
> -
>  #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>     (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
>          : gnttab_shared_gfn(NULL, gt, idx);                              \
> --- a/xen/arch/x86/include/asm/grant_table.h
> +++ b/xen/arch/x86/include/asm/grant_table.h
> @@ -32,12 +32,6 @@ static inline int replace_grant_host_map
>      return replace_grant_pv_mapping(addr, frame, new_addr, flags);
>  }
>  
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> -    (gfn_eq(gfn, INVALID_GFN)                                            \
> -     ? guest_physmap_remove_page((gt)->domain,                           \
> -                                 gnttab_get_frame_gfn(gt, st, idx),      \
> -                                 mfn, 0)                                 \
> -     : 0 /* Handled in add_to_physmap_one(). */)
>  #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>      mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
>                        : gnttab_shared_mfn(gt, idx);                      \
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1844,8 +1844,7 @@ gnttab_unpopulate_status_frames(struct d
>          {
>              int rc = gfn_eq(gfn, INVALID_GFN)
>                       ? 0
> -                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
> -                                            page_to_mfn(pg));
> +                     : guest_physmap_remove_page(d, gfn, page_to_mfn(pg), 0);
>  
>              if ( rc )
>              {
> @@ -4285,8 +4284,6 @@ int gnttab_map_frame_begin(
>           */
>          if ( !get_page(pg, d) )
>              rc = -EBUSY;
> -        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
status is now a variable that is set but never read. Remove it.
With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

