Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKPVDuS4smmYPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:00:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C1F27224B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252345.1549058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fdd-0004w4-GU; Thu, 12 Mar 2026 12:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252345.1549058; Thu, 12 Mar 2026 12:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fdd-0004tx-Di; Thu, 12 Mar 2026 12:59:41 +0000
Received: by outflank-mailman (input) for mailman id 1252345;
 Thu, 12 Mar 2026 12:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0fdb-0004tr-6k
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:59:39 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f973188-1e13-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 13:59:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8454.namprd03.prod.outlook.com (2603:10b6:208:53c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 12 Mar
 2026 12:59:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:59:29 +0000
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
X-Inumbo-ID: 4f973188-1e13-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui/r7KAV0bJimRvOKe2bptgvFVD74cHVooVjhgO3RmNWfgf7iOoqd/9/TkIaObsaYROtO8bK9q70Ad5qBda+wNg75irsbYrm6g6vQB5lV8zMOet7dw0S3Wh0U+RokgeEXwA5mihMvF5j/6++3ayBxF+Njza1+OzwAA16CUoKLeLbnqSUbAjbyk9nnMDUgyqkSJZx7C3cg9jihexlvSJVgb42/N2m95OqcXaVQwb3IyDKdY2mxkanBJHgp6GbsqmwUFRSeYLpTp0L6r9xorhFx5WKYpWF+K6l3ETSzXp5eYEkhdpR5z3J07Q8aFOJDprOhRZwNNEfBbYJntd07I+Wqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgODJQE2Bwj62C4efX2kvKSLrbTEHqlnrk1Ui65l+gE=;
 b=GQPypfFubIYMAMZqI/nGxHbCFGjC4Ta66jzVfuqrc4YUCgZdobmERevEw0JCVoZ4DntjZ0U8yno5snKg/FlnsFa6MlsS4fRJrSR+C1V3Kw7Jj9GBi2GqUXFRYQoMfSOh405R6pZ7X9HnEFUj4uccLagGb+TtXYPcPxKqxMr0pk1QAEjFQxc97sREVwjvuJbgX9rcoXnsV3Hm+8h5FUNnCiPicVD4+39x1XuPIVULd31YTVbShTNAh+Gu+NKIDIQvoDcneaenzQhOLawVMetN1isjIGMiUg4n3/nTeJfJWZgGfyWQHkg/Q43fcVlBbwxu7pUGgAfGeyGzp+DlKxYvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgODJQE2Bwj62C4efX2kvKSLrbTEHqlnrk1Ui65l+gE=;
 b=yHCegsqLDCGgix4H3tD3DsfZgtGLkLCnQYylKDeaw9WnWwyUvb6NvqHVfW0DiJrQARL+h+R8h6ECVZxgF2VqjXITahdinCc6LTbMz8lv+SulIKxMMXlLF30iXjqLN9LGTUesQyZCIHaYjv/VFcVZ7DCm4kHBs3fZmSfLbr6ohr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9e9b4a3c-1ccf-41f2-a846-ce855a64f726@citrix.com>
Date: Thu, 12 Mar 2026 12:59:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] docs: add man page for xenstore-list
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312122240.2784725-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a69eff-1e67-4d84-2619-08de8037325f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	mp2jx+RM/3KfZgqW4794dKxa4nJwwgLG7s6FB+I8CSmg80gMaXIpbCv/w+pGgWJlOF4d205qja40rXIgtr0Gb6Qh6VbqOELcm+msZJsaY5Ufr87GZzyKxHxuogKkyUM2uQgY8eATt+vX16e8vTMzOpfV4NskF1AHK659S6jrZXH4CTC0ry2rPzQT+u1KXoIs8HaL4cYFDqrpOtu17wMDzw9VuOePLecB1CEQC1Nr2cKHQ+Lb5BN5AtjrZp1O4Xi+W7g/CtT3JdhDEjqRZb7RZEpJvnkL3GU9JSnao4eH1t+l4UDWMtzltaXOp46qDLIhu9wVlfiWi6sDH5s00sK7MzrMaCBEHpGwkQJQTCYc7QqsLbuHvNuTxEcY1WUPApVk2CyRw2d0G3mv2ibSZM2RMNeTdq8jhdfEiTsITm99wKRIqmsDao5SaB/DfcQ1NI/7i5iF3fha5Te9DW2rBckg2mEbQDUN9DmbdcKcFzzhtla9Xngrfg0FyKEZvalvqnvekctYsCw5zYy/R2igQH5YyUMUqdWVuD9B/D+gtClNOOgXOqu5QMTfkfmcWAySTU2L3XmtQxUSfyzsPw1RduNHVhVTaeUwbE3ZnBpqHVzAQyfG69MgjYf4j2Q6+ydkQyGDil7WDu9ZRp0b2Gh0Rgr0O01EsrkotLcn/6/N3YPEJuayyhLpXXr2UrTVa+W5wlY6Q/m+9Kz0lmUpabjLyy4hVsrH28XV29iohPMYhuSFFmz+qg7ZAdXuWZU/bDWoCao2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9yV0xFV2l1cExTMTBSOWM3aTJHcFpqcDJGK1NJRk9FNk9RWGhENjBWQTFr?=
 =?utf-8?B?c2UvNTVFVlkrUnozM2FhQ0JiM0Vxd3JnUHJmTTdmMTlUQUtkOXowSmVoMC9N?=
 =?utf-8?B?TkhnT0kvOSs5SmZ6UTRCYWltYWp0QlB4cGhSVTByeTc0QzdyczRlcmVlcUJZ?=
 =?utf-8?B?M1Z3Z29DZ3RWZW1YdGlWcW1VdVVOUVVsTGJsYWdlR3ZTSVdNMUdZUk1EVElU?=
 =?utf-8?B?M0RBSG56ZEVlVlhGSjMwNHFEQ0hRdDAycVpOQjdSbjlKMnVidC81bmFlQkpI?=
 =?utf-8?B?WFhZU3YyTytJV1piVWg4TmFJVDZFNkdJTU0ycUFBckJaZmNrdlplMFFlYzNW?=
 =?utf-8?B?cnRpekpXa0IrNTYyRGd2Q3NCSzUrenNBZFducmc2S3d0eWRDMDlJN05wUUhZ?=
 =?utf-8?B?cnNYRXk1MGcyRldjRnoxWS9ZSXNuUHZBY3lYMlNLalRic040RHlGNmF0UU9F?=
 =?utf-8?B?ZlFCczZTb0d6cnNxVEhYTWU5ZlBDdUxBakpwQ0Z2MGhqbHZMWmJtU1lkUGRv?=
 =?utf-8?B?V01Dc0ZUK05wN0JOOXFZNGlaWmpCUENReXNCSFFoakFUMU43V2llaW9EY2NC?=
 =?utf-8?B?RDNvMFNaK0kwQkZUaU1kdzloWXIrc2pzWHFLMytmU3VLdWdKb2hsTUJ4Mk1T?=
 =?utf-8?B?T3FsNHUyMmltM01OL2NKSS9kelhJakIxeko0amk4d2NJSFhZRk9WZkl2Y1Bx?=
 =?utf-8?B?c0plelpIbjhNYnpKYktTTlRQUjhDNjB6NWh5VGhRWGZieStLNFN2VUtaSWxF?=
 =?utf-8?B?MEU5MVpLWVFrZUNTYmhKWUlLOVlLOGtqRjAycWh3cDJjWWFrM3pFVjdFenhZ?=
 =?utf-8?B?bERlWXRJM0Q3SEo5cVhMTUw4RjI1ZU1Nb1gxY2JzMWhVQ1FJUXlDSVZMd1oy?=
 =?utf-8?B?MFEzSUxKd0hzdDlTci9POHhOMS9WUnN0Q0E1UERkb1pEeXFaTCsrVDM0NWdL?=
 =?utf-8?B?WU5EaUI2SWFwY3lmTnk0bVBkb0VFRlo3K2JaaTRyN2FJWktBK2QvSjlualJm?=
 =?utf-8?B?RExDYVlFSkJkQjdmTHFmZVJaOEpuZ2toRHBGRWVCU2Qvc3Roc29DRm8zdGFh?=
 =?utf-8?B?TDBRd0xhSU5Tdjg0N3hwMEFYeHNDc1RhQThPcVNwc0pKT1ZBeDJNOXJzMzhz?=
 =?utf-8?B?MmpMNHZXdUdYMHhodG1lbHJzazZJUmlqdUV3eGVjWmlxaXlkL1FnTWN2ZVlj?=
 =?utf-8?B?Q1BFWkFvOXFQMGRLV1hvdzZkamFZS1NWYmZGeHp6ZWRuQ1oyTG42TDdmMGw4?=
 =?utf-8?B?SjFVSXA0RFdTNHc4emtPMWpvcEZYVGpZNWhJOWJVTXBlSWJ6Q25KWTh4ZWpI?=
 =?utf-8?B?OFIrdkUwdGtlYmNMZjdPT3BGYitNclVuZDVObXJVbEtLc1U2MkJNTWhRSjQ0?=
 =?utf-8?B?dkwxWThzd1lHVGpueWc3dHZIR0k1emQ5M1ZSTHJZdHVMNldxTGE4S3grYUp6?=
 =?utf-8?B?dkhsS1lQbXdHdFNpSmdKZEpVVWw2cXIvR2EvbFh2ZGFkUTZ6bHBxTlBIc3hU?=
 =?utf-8?B?djE1eExrQXBHcEJhc2dGTGFaSVRHbW5ObmxuQVRXaHdnT1dzNVJGNUlLZGdX?=
 =?utf-8?B?MXFSVmJiTDFGamFpd0tZQ1B3eWRjaUVDUjNTN25QYUY2cVBURXlwM2syd2Np?=
 =?utf-8?B?WjZNbisxOS9BVWtkS0swd3JmaHRialdaMUgvZlM0VWI4TE5EQ3FYYkxLOE0v?=
 =?utf-8?B?dHNZa0M3UCswZkxyWGhKRThvd3V5N0VJajd0YVdzZmF4alNkdEpQdm1aa2lp?=
 =?utf-8?B?UEpFblpCcVM2M200dFJPbUUxRUVETXVRU1ozTzBCVUgwNzB0VmJtODB3TEhB?=
 =?utf-8?B?NlYxTFBwMWhWazNObWZDVysvV3djZ2Z1aU9ORTZPamlGeWxzdy96bDlBRjZN?=
 =?utf-8?B?YkxLbTQxNG0zN2xHZDRvZUVUcytRQXNVNFM1UWdmUGxwUStSbWgxRTRtRmQz?=
 =?utf-8?B?OEp4V0kxRDRPVlhZaER3RGFhaGVkNXlUWWNGeDczT1kyb3BuRG85UERUbkdn?=
 =?utf-8?B?QUcvT1MrSFpvanJJdkhFZEhwRTEzK2hEdUJ2bFBWRUd6dmY1NVJkOGRWUUI4?=
 =?utf-8?B?bVZjRDUyTEwxMmdUS2xyWmxxTHNrSXBpb29TbVRzVjNTdmI1UENZVkxEUXVz?=
 =?utf-8?B?N056cTNoN1hjNE5FWjhsd2xPWTFsT0pmL0pxNTRZcHdvZS9laEdkVlBRdWVX?=
 =?utf-8?B?NVMvN2FTU0FxTWpyaldoWVlYZ090a0Z1K0JENUVOK2Vkb2tsM1Z0RjBENWxC?=
 =?utf-8?B?djZ4aUpRRjI5bFhTUjI1SWowcm0wTktxRkpIN3N5ZUovemF4ZmZqcG41Tm9L?=
 =?utf-8?B?elE5bFBoRWxaa2tWRy9ITDFPN29FQ1ZBQk85UFlleXV4VWFoY2krZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a69eff-1e67-4d84-2619-08de8037325f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:59:29.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvnIgGK5wGaIYdUsCN6he1/mtW8PldTR9tGApUZ19ytSUSv0nSoHco8PfpZffJMO0f9Ri1QDOpNKlwZn1hoN6rrxkEkvFrHqIOAfa9gGhIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8454
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 71C1F27224B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 12:22 pm, Juergen Gross wrote:
> There is no man page for xenstore-list, add it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/man/xenstore-list.1.pod | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 docs/man/xenstore-list.1.pod
>
> diff --git a/docs/man/xenstore-list.1.pod b/docs/man/xenstore-list.1.pod
> new file mode 100644
> index 0000000000..4bc1ff9846
> --- /dev/null
> +++ b/docs/man/xenstore-list.1.pod
> @@ -0,0 +1,24 @@
> +=head1 NAME
> +
> +xenstore-list - list Xenstore key children
> +
> +=head1 SYNOPSIS
> +
> +B<xenstore-list> [I<OPTION>]... [I<PATH>]...
> +
> +=head1 DESCRIPTION
> +
> +List direct children of one or more Xenstore I<PATH>s, one child per line.
> +
> +=over
> +
> +=item B<-p>
> +
> +List the full Xenstore path of each listed path.
> +
> +=back
> +
> +=head1 BUGS
> +
> +Send bugs to xen-devel@lists.xenproject.org, see
> +https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.

I had no idea we even had this...  Why on earth do we have both
xenstore-ls and xenstore-list, and for them to be different?

Even for the options; xenstore-ls uses -f for full path and -p for
permissions.


Having both is gross error on behalf of whomever accepted the code in
the first place.  It's a bad enough usability problem that I think we
should seriously consider deleting the binary rather than allowing
accepting it's existance.

But as I expect that to be controversial, at a minimum both of the
manpages need some kind of "do not confuse $THIS with $OTHER" warning.

~Andrew

