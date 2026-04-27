Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJp0GaDc72l/HAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:01:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D373E47B0CD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295345.1572010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU06-0002li-LK; Mon, 27 Apr 2026 22:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295345.1572010; Mon, 27 Apr 2026 22:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU06-0002iw-IY; Mon, 27 Apr 2026 22:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1295345;
 Mon, 27 Apr 2026 22:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wHU05-0002iq-Dj
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 22:00:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHU04-006dwt-0N
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 00:00:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc69-5cb7-0a2a0a5109dd-0a2a4501c80e-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:19 +0200
Received: from [52.101.85.60]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc71-c1f2-0a2a45010019-3465553cdfee-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:19 +0200
Received: from SJ0PR03CA0248.namprd03.prod.outlook.com (2603:10b6:a03:3a0::13)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:00:11 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5f) by SJ0PR03CA0248.outlook.office365.com
 (2603:10b6:a03:3a0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 22:00:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 22:00:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 17:00:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 17:00:09 -0500
Received: from [172.27.93.19] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 17:00:09 -0500
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
 b=tcoVvySt6iVEb2Nc2STQ1skH4BGuMwwvmiL9Q9xNM/+5D+QsE2XE8xdAOhitOIQm4taI6KNabTcHAJ7vEWcz6NqUYF7+pU+YJS1jL8WufyxHpDR8OVeP8clWMNRCwacdodueyhASgQvThYV7mmmeqqSq415BdD/d9uhwe0X8mAvxa1TCR/7yQg+AuLHnMsgVh5l35HjXumYkXK9d5dYCZjaLtskE6UD4rC4yZ2FRGWSl4w4Ag4IaaP8dpuGI47Eh+mCDgXYIUtdmQOn7vGv4/G4f7W+rHw4zM1o59fTqa0SlTJwsbiZD+fwFHaHdpzTZfCAIoCqN6S8l6kbfa+XYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp6/FWz1a5puLHn8CGPGlRAqsfFYZZX5kVcgGcN9B/0=;
 b=vvN8OCoiCiImVuOtszqZD14gINRAzxaYpiRueIlyqv/yyzQBS0fR/ii3NIgOwtr3yU5X34Yz3nbv1n4VlEf8dSbf3ZAk5zDiO7ivxuCavNYfryS86DJRyAvG6p8vCGeOjD6QVl6Zib9jGOA818qwCaprO2yXcEm4GRM1bnsj/oV0N4XSgmPXdppbTQxwqzvNDyuIpCaiPPniBOfmDcz4t0uZim9IhB9vboPNm9OcLur5eNl7rVbMYEo6C+7TTf5ufmrKbCr0q5yyADntTe/Ox8/EGdakKlayNvC8uFb3v0jICrxaa4TrRS/E26cMOYjNkmSgoVT7zPIRgITdmxeHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp6/FWz1a5puLHn8CGPGlRAqsfFYZZX5kVcgGcN9B/0=;
 b=ZsciGWovePVsJugXHwQShFwF91A5QScKdzKoQqSeq4LkA//sRPdcb/xZYC/pxLlLikkTXz3coxDAX63uPOUGhmXbLESnYv4vXRrP6Z4sG2k7fpLgkTWvwbPkZJtFQI2FPcAxlmE+k3d3mhJEgdq4imJXquPprJgMkNMaS2jA0Tw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
Date: Mon, 27 Apr 2026 18:00:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/public: introduce DOMID_ANY
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: <dmukhin@ford.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260423080840.530547-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e673d9-ac56-46a4-df56-08dea4a85a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	juc+D2F1MjZX3AYWSBrc8zsgk4R3j1gXbFGsAHOUJcnfeTqo3CN5OtJTFrD96L5oaDvlYgqdoOqxnkSzOjktHjjuBlh5SgyXHTX4Nr6yv5937hogPhBjkpF1fruvTMSLkwEECxeMXF8KV0/a/H3xrM7Tq9WnIGKHxCOrRRy7gLwNCJGtjzb0J8SFt9K3jLmDtcwF6tycFLAizLus9V5pI0HLAEf+a1m5zlIWdAFuE2C72WNY/tLXHciH0Mwmwm0e1/puPC15gj2ZbU833gjVOJQcdwlhwchmtLqWipUTAPOfjpeLBOnqrA7cCuFOUvaGuZFDVLxeE5ggpOizqXNBIdS8fkTd7M1j/WZgQlJ7GG/VWmGSuDKCTD/sTp1uQ6NA82KOWs8FtnwcLF5v63hqsCqqHwNPM2GOU/06c2HuWH5aU4JWuOQ5sTHpTenGB4uwSaJkTXdoAMMMcZSUluPiF9aeCq9pbmIjoTDmTcWpYtxJcC7xOWusc8dB2N+6MUhmURZp8NfezNV1TO+Q3uMhcHMm/8u43Jon1mnmWXDNdu8RvtHTU7dKE86REcB9eHlhWBH2CKnWpz9INi4QifgLVw3lFmUARE8SN8XCDdTRnSMZDksAxMv8WBBjaFrk69Fq8f3udy/FkyPhuvCvTIyRxwFYT1S2evbZTcHgq6vA4wkgE7nlicfpVMP59qH7EcGNWshUvR0i0RQT51VaXYhQ5rivv1ufPr3QmTJUni61aP8nitKpa6dfr/Zqnz/VH/lY+5ouHpD+BmDnURD+ca1GaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6qhYfyLJqKV6/ElPs6ZtHz7Xm/2UW8PToSmuV3GWJIo00VoYNZ3WT2+TBtSuMw7UusWFOAkybMpTVvNA3FUwCETWT32G+3mwSyZ0vgoS6EB3i1+uOsbvPrrD1v9KxbZUG7inLqzDhFuT+thUNtUrunzPx+gsl/MzIgD04PMNOPegM6KA84U6uo4MiU+7UwiIZWZlPmMMJc2j0PVKjuuhkgHANu60w7eeKTAZTtfCPbBM7eED5wCCAgvMKeaAYPSk48fUtioGD8B1xTaqdeAXNRvEQsoY76t96Yh9MM8SaHtJhhhfmi92HEVkiJDm+jOF4q4Lz9H02WyE9I/TVPNuG9Iq7w31EOETzSKMr6kOxhZG+dwi7WuNyGFgfMp6xbPlqM0JcVfOHr0NCt5jbbTk10PDVGlayVDPVouAYNDlxIznWH0nHhjoGOPho/ynfCz0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:00:10.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e673d9-ac56-46a4-df56-08dea4a85a47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
X-purgate-ID: tlsNG-d62444/1777327219-BEA61FF4-B9284E80/0/0
X-purgate-type: clean
X-purgate-size: 1311
X-Rspamd-Queue-Id: D373E47B0CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]

On 2026-04-23 04:08, Juergen Gross wrote:
> Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
> domids.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This is based on Denis Mukhin's patch "xen/domain: introduce DOMID_ANY".
> As my series is another use case for DOMID_ANY and it is a backport
> candidate, I've split out the definition of DOMID_ANY from Denis'
> patch in order to make progress for my series.

I think we probably want Denis as the Author, since this is an 
unmodified piece of his patch.

> ---
>   xen/include/public/xen.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index b12fd10e63..f35a6f21f0 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>   /* DOMID_INVALID is used to identify pages with unknown owner. */
>   #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>   
> +/*
> + * DOMID_ANY is used to signal no specific domain ID requested.
> + * Handler should pick a valid ID, or handle it as a broadcast value

Maybe s/broadcast/wildcard/?

Either way:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

