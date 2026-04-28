Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCPqEPC28GlwXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:32:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A041485E6A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296210.1572630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiXR-0007Yp-JO; Tue, 28 Apr 2026 13:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296210.1572630; Tue, 28 Apr 2026 13:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiXR-0007XJ-Gj; Tue, 28 Apr 2026 13:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1296210;
 Tue, 28 Apr 2026 13:31:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHiXP-0007XD-To
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:31:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHiXN-00Gr2C-O3
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:31:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0b6b8-bab6-0a2a0a5309dd-0a2a4506d85c-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:31:43 +0200
Received: from [52.101.62.13]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0b6bd-7371-0a2a45060019-34653e0d2b89-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:31:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB6026.namprd03.prod.outlook.com (2603:10b6:408:137::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:31:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:31:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezPRx3UZpTagyyGin1n98Cmlq07ipkJi9/p5pfWMNFD33Ic6mfIOa06MFRm8j01aECfdWBF+m6oBNz732UdqWV4GoLVVTr77jOMCIAFPdk01/BxfjV9YoO7/4K/AW6L1pOYGK17CkBzJWQd3LosBR9PbWBAAy0jZg2w4jlMYaXIBya8/CqsT8a/swbUzZ5FCUIFZR/KHrizz3C780L0C54HIE8K37NyTFso44Q1ZxkFtn4TCNKQxdQzF1eGfb7kqWdtjiQWSva1G0S+qvtNAaoS+S6sTBvZOHmn5QSbwMcb4jw3RIqGUOUkhROyOHC8vQnOcs+Pt37F0BCIJyw+vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31I9KliPwarqsMtduuJqI6avfy5jhWWz7P21c+ayWnA=;
 b=YOjjGOrTR0GdntShpi6s6hOQy3xnHL7nIErbzbrqsG+h9NlIu7Dn9IpQi8z9BPfEGXIPnHo/KTO1UjDA5ZRJyPNJrVsb8LpIk8jteoF9JlDx/8Voh754ZWcwxkfGIJaJxW12UAuNQRmr7RjuhPNSyHoAD/QADwrcwRR9BZpZGDMAog025mo6J/c5MbTEPUZmEA3XfxSvOQ/sQ0kzLBn8UC88npyLrx727pHVPFUHrko65xo8lkE5b/8hhIXZA9Zcab7kMRgZIOWN9SXrm11FtoeaqeXXoivDTesFd1JLeVPdUJ5xWlDqn+62PsxJJ80HL2hisohghpy/bqD6HaDo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31I9KliPwarqsMtduuJqI6avfy5jhWWz7P21c+ayWnA=;
 b=mx3TeLGZpd0VpDYE8DzITR9W2jd82yZLV/SzA1Gfs3zADN1MMeJL2+OYolIrKz6KxdsGRx3zVHgeOfNd59C6Ucb7TT/5Or6I7TwnO9/Z4fZ1L/gMOev3NDRt3XB6E/g856nQE+V8uxNsSg3/yOsJJusYO1Zyxby55K5l75n5ZF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 15:31:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 08/17] hvmloader: Extend PCI BAR struct
Message-ID: <afC2uLj_fD2qPPsT@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-9-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-9-thierry.escande@vates.tech>
X-ClientProxiedBy: MA3P292CA0038.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: dbee1e23-d5ce-417a-c42a-08dea52a7a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aDqEwSBy4yxpvIwxx+QbyDEM4ZJ9nAmI0SuZwccCBwFlow0f5ULvaKkiCUS/3XuLC0oWpdkkNXVzUgrlICrHtXuHgX1K/C+WfG4lsKzoiVkzuuTy19keTWaepSUFJCIPlUfQoPA9j1Dq9t8jdsMf9+cx4WwVmTeRMrzEYtq+PAyKMSpP7OGXmeVwbTdcQZRO1rEhhG/BAByyS5pdlmMEqai0RMi3d61jAkPtl7UF2xJeepk6lZJCtG/Wu/DgXgvHfurhhifQJjehZyyiXQZy+dxOHfymqf56nDMQwqgaY6nDZlRCDTkIYS4lGPKzme6ojpaIZ6h5In8eTWMMzhr6LAleoP5q8L6lB+5jsePeApSx3sIZfLPjrOhvF2h0hQOhH7Fgp0jKldjGVZme0yNaHQyu+nFIioX/UwlnweQ3tgqk0t1fyv39yr2bjgr5SgK6C2+jXRd1SFKBGVlcGTk99eOkQhQVW/9V4DqVNXbjXn0E4r+1uKuUzg0GLDFtieishQk1o/cHbbbtIW0cLZI3bSfJwMOj14boDIPIaTqOLLB7HyVlxHMjZqvoVfL6mF+jMIcJGx0Hr2ZjXmxN4SuoH8dB7QG99vri8qhnQ0jwJ0QTrUpZsikCg7EUaEvpDzD4+fK/+voP2XSnYA0VyVWB4F6XVeKwXSeTHolcxWOIP/JiI0g3hTdvUvqqUcUjjgrogLa72SU35rUu1iSBeMh/noOgv1HK0B9tCQ1ghzv8qHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVkxczgrRzB6TUNBd3VvWWFFSGY5YytCdmc1d0xkQjhTdnRqMGxQdTVaT3FD?=
 =?utf-8?B?ZjNSb3ovbDVjTmFqbFVmaDZEWkVQMUtsYUZwcVdleFJxR1VxUXdyTEtUVndV?=
 =?utf-8?B?Q1VXMmxXZzJVbkF3Rmwzc0MrZVY5dE1TY0h0UUwwcng3SmpLZkE0cnp5Q2VP?=
 =?utf-8?B?SDVuU29neHkyazBiWlJiUGUzaU10K3d3STZad0t1a28yZjZzVTlkYVRHM2Qx?=
 =?utf-8?B?TEpQZWM3Z3RDdE9MSlNEMDRzVEEwWWpHSUI1LzNxK0ZBbWhrUDZBamNzVzZo?=
 =?utf-8?B?WnB2MVRZOTZxV1hOWGhRSlhEaUJMTEtZWkFlc0VBaythbmY2L1A0QUU2QWM3?=
 =?utf-8?B?QlJMT3U3TjkvSjhVNEdHM3Q1ZVZhNjd6ZDhtNjh6MGo5RVBXWGV0R295ekJS?=
 =?utf-8?B?L0swMUtSV0wxSnQvRkRUNzc1NDVtOEI3WFhHYUVSK0xEZG5kcTJ3STY5aHhD?=
 =?utf-8?B?RlQveEgvT2p2UUZJSlptUGZHUFlqc0UwYjNtR2k4MHhwdGpySDZVTmY1RUJ2?=
 =?utf-8?B?RkhQZWd0L3YrZWU5Y1k1RXMwNzdvY2lXT3F2ZmhkL1hiNUJjUnltMVBiOWdY?=
 =?utf-8?B?dExqOG1zTU5DNTRyc0liN1N1RGpCTmF2Uk80WVFXemc0ZUY3dlM4M1FFcmVL?=
 =?utf-8?B?SVBzV1ZKcXNsNW5BemdXL3RWTWVuVVFKSGFNVDN1N2tCcmpvNjJCTzRqNWJG?=
 =?utf-8?B?R1VXckdKMTBWdlA0VEkzRjB3NzgvdEhZTjdRYTlET2hUS1QxVmsvdGdwMDZz?=
 =?utf-8?B?OHFDV25SZFN1bHhBekorNXQ1LzZWMm1DdUJ2K2FBaTVyMHhWWkV2ZVcySXFj?=
 =?utf-8?B?RG90bmgrTmIyUmtDYWNVcmxsNXRiL1oxU1NIUVpCTkxBaXF3ZmVHTS9TZTBG?=
 =?utf-8?B?S2daRHI0UEpZYTZ3NE1XeURCa0RoSE94NVliZVByRjVBM0tuUzM0MUhhVjRa?=
 =?utf-8?B?QkI4b3JOc2pveUg3OUhEZ0ZwNm9DUXBuU0tnSkcvbmU0SmhqTG5oVDEzSnpn?=
 =?utf-8?B?WWYwZ0pIZGJ3VndmeEFFWHZxY1RwbzduUGhLSytrS0RJNVN0UlRUQ1BoZnBN?=
 =?utf-8?B?VGo2alE3L3FDck0rQ256QzJZZ0ZvRFhUZ01rZVk3MTdreDhXUHlmWFRRYnlm?=
 =?utf-8?B?N2RTZjRMYkRmSXRiZWRmWU1GQllGWHVGRXZNUlREc2t2WDlaeTd0VmJEMnE2?=
 =?utf-8?B?MXA2WEJTcFBtd3FJdkxVWFlQTy8rUVZBRnlndTdpRVZHc1pQaXI4aEFUZHJ1?=
 =?utf-8?B?dGt5aDJGYTFnY0haRU0venIvMERLMjFrZmFVcDZUbXd5R3FtdVprRXNNbEs2?=
 =?utf-8?B?VFNmczRIU0xGbHBxc2dCZEdaQVdCSTZJUFB3L04wczBuY1hUTHVrWmVQNTlS?=
 =?utf-8?B?NStOcUdFU3ZSTUNiWk9GcW9jSTJHdmlkVGlQSjhlUHp1K2lMUmlTQllCRE94?=
 =?utf-8?B?dUwvTTV0TTF4NnF0Tm1MY0VHWkptQ2JhTzY3YTE1UFV4TnYxNjFsVUZTNkxR?=
 =?utf-8?B?bVYvWktrS3ZqK0RIR1ovbkxRVVNBeWhkRk0vbVM0QUZFcHFycXVFT1R3NUpm?=
 =?utf-8?B?UW05dHNDUytGVGRoelYvTHZ0TTE0VFpsekRnZm9meGpYbUVsSEF1cEJVNWNu?=
 =?utf-8?B?S2lscW9yUkI1YXd1anVPOVYrTmR6NjVzUU5kTzR2Y2MwYXB6eVpITFJFSWsz?=
 =?utf-8?B?ZzRYL1lmVDViUjR6Y2FYaXhRK0lwUmxOckRTaG5udDNlcHFyZUkxb1pnTWpn?=
 =?utf-8?B?SEt1Z3gzckRWK0pPR2N2Lzc5VGc1UCs5dHBFdWdzUTBmN3Axajh3cUdmM3lG?=
 =?utf-8?B?OE5nN0hQS3NUVWFGRUVjWTJ3SFdSSzRiV1RLS3kzWmNaTGVOK3BQNWdLUGVH?=
 =?utf-8?B?OGRGdE15emNWVGFVUGtHZUxIZWM1RUxlZEZtOUVCZFRGRmFaYVZNQzFVUHI0?=
 =?utf-8?B?NUdNK0xkMGtyZ0N0OGIvSzdYNmE1V0V3M1V6Uk8xK2xSRXpNZFNta1RVUkdm?=
 =?utf-8?B?TXBOZFdyTXlsMkRPYnpHcEp6d1ZNWkRrL096Yk9GYWladEpWK21xYkNGK2U3?=
 =?utf-8?B?b3hqVFVnT3gxVnpMdURTTDdFQjZpY1JyeW4zQzhPanNvaUtPS1lSWEJ4eDRB?=
 =?utf-8?B?VThQaUdDYm9tNS9LT0RNNGZIWHFRSEpVU3pMa01xUnJoWCs3L1Z1bThWU0NT?=
 =?utf-8?B?OFgrTldMTGw4VkVRRmc1N1o5YUs0V3FLdGoxemdVZHRFd1drL2ZVN2JObWFY?=
 =?utf-8?B?Wm9tMFRKaFNyTkhKMTA4NlZSUzlxU0twTnl2Z1B6VjBDazdIN04wRGJFUi80?=
 =?utf-8?B?aVV0ZGZsK0pGcjMrRnJHVTUrbDd5c1ZBVFZrS1d0UWNsZmk5cU9aQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee1e23-d5ce-417a-c42a-08dea52a7a69
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:31:39.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiS4AeLlB1+eOZUWRNID4c30UC826f6OqE91+/S8pFIJapzFXT1sPWQ/x+i6J5mpT8nqFu5DY/BdSzCWpZ/yeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6026
X-purgate-ID: tlsNG-16d1c6/1777383103-90A7ED75-3B28D6E9/0/0
X-purgate-type: clean
X-purgate-size: 8053
X-Rspamd-Queue-Id: 7A041485E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mem_resource.base:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.849];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
> For the upcoming allocation of the MMCONFIG range in MMIO hole, this
> patch extends the 'bars' structure to make it universal for any
> arbitrary BAR type. Either IO, MMIO, ROM or a chipset-specific resource.
> 
> One important new field is addr_mask, which tells which bits of the base
> address can (should) be written. Different address types (ROM, MMIO BAR,
> PCIEXBAR) will have different addr_mask values.
> 
> For every assignable BAR range we store its size, PCI device BDF (devfn
> actually) to which it belongs, BAR type (mem/io/mem64) and corresponding
> register offset in device PCI conf space.
> 
> Also, to reduce code complexity, all long mem/mem64 BAR flags checks are
> replaced by simple bars[i] field probing, eg.:
> -        if ( (bar_reg == PCI_ROM_ADDRESS) ||
> -             ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -              PCI_BASE_ADDRESS_SPACE_MEMORY) )
> +        if ( bars[i].is_mem )

I think this is also supposed to be a non-functional change, just
adding new fields and adjusting the code to make use of them?

> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/pci.c | 58 ++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index 91c7fd2171..6e6720adae 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -160,9 +160,10 @@ static void class_specific_pci_device_setup(uint16_t vendor_id,
>  
>  void pci_setup(void)
>  {
> -    uint8_t is_64bar, using_64bar, bar64_relocate = 0;
> +    uint8_t is_64bar, using_64bar, bar64_relocate = 0, is_mem;

The newly introduce fields want to be booleans types.

>      uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
>      uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
> +    uint64_t addr_mask;
>      uint8_t vga_devfn = 0xff;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> @@ -176,10 +177,13 @@ void pci_setup(void)
>  
>      /* Create a list of device BARs in descending order of size. */
>      struct bars {
> -        uint32_t is_64bar;
>          uint32_t devfn;
>          uint32_t bar_reg;
>          uint64_t bar_sz;
> +        uint64_t addr_mask; /* which bits of the base address can be written */
> +        uint32_t bar_data;  /* initial value - BAR flags here */

Hm, that's just storing the flags of the BAR, given that you already
store the 64bit and memory flags, you just need the prefetch and ROM
enabled booleans to have the full set, and then you can remove the
bar_data field from the struct.

> +        uint8_t  is_64bar;
> +        uint8_t  is_mem;

Use bool types please for the is_ fields.

>      } *bars = (struct bars *)scratch_start;
>      unsigned int i, nr_bars = 0;
>      uint64_t mmio_hole_size = 0;
> @@ -278,13 +282,21 @@ void pci_setup(void)
>                  bar_reg = PCI_ROM_ADDRESS;
>  
>              bar_data = pci_readl(devfn, bar_reg);
> +
> +            is_mem = !!(((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> +                       (bar_reg == PCI_ROM_ADDRESS));
> +
>              if ( bar_reg != PCI_ROM_ADDRESS )
>              {
> -                is_64bar = !!((bar_data & (PCI_BASE_ADDRESS_SPACE |
> -                             PCI_BASE_ADDRESS_MEM_TYPE_MASK)) ==
> -                             (PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                is_64bar = !!(is_mem &&
> +                             ((bar_data & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
>                               PCI_BASE_ADDRESS_MEM_TYPE_64));
> +
>                  pci_writel(devfn, bar_reg, ~0);
> +
> +                addr_mask = is_mem ? PCI_BASE_ADDRESS_MEM_MASK
> +                                   : PCI_BASE_ADDRESS_IO_MASK;
>              }
>              else
>              {
> @@ -292,15 +304,16 @@ void pci_setup(void)
>                  pci_writel(devfn, bar_reg,
>                             (bar_data | PCI_ROM_ADDRESS_MASK) &
>                             ~PCI_ROM_ADDRESS_ENABLE);
> +
> +                addr_mask = PCI_ROM_ADDRESS_MASK;
>              }
> +
>              bar_sz = pci_readl(devfn, bar_reg);
>              pci_writel(devfn, bar_reg, bar_data);
>  
>              if ( bar_reg != PCI_ROM_ADDRESS )
> -                bar_sz &= (((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -                            PCI_BASE_ADDRESS_SPACE_MEMORY) ?
> -                           PCI_BASE_ADDRESS_MEM_MASK :
> -                           (PCI_BASE_ADDRESS_IO_MASK & 0xffff));
> +                bar_sz &= is_mem ? PCI_BASE_ADDRESS_MEM_MASK :
> +                                   (PCI_BASE_ADDRESS_IO_MASK & 0xffff);
>              else
>                  bar_sz &= PCI_ROM_ADDRESS_MASK;
>              if (is_64bar) {
> @@ -314,6 +327,9 @@ void pci_setup(void)
>              if ( bar_sz == 0 )
>                  continue;
>  
> +            /* leave only memtype/enable bits etc */
> +            bar_data &= ~addr_mask;
> +
>              if ( !xenpci_bar_uc &&
>                   ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
>                     PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> @@ -359,16 +375,17 @@ void pci_setup(void)
>              if ( i != nr_bars )
>                  memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
>  
> -            bars[i].is_64bar = is_64bar;
>              bars[i].devfn   = devfn;
>              bars[i].bar_reg = bar_reg;
>              bars[i].bar_sz  = bar_sz;
> +            bars[i].is_64bar  = is_64bar;
> +            bars[i].is_mem    = is_mem;
> +            bars[i].addr_mask = addr_mask;
> +            bars[i].bar_data  = bar_data;
>  
>              if ( is_64bar && bar_sz > BAR_RELOC_THRESH )
>                  bar64_relocate = 1;
> -            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> -                      (bar_reg == PCI_ROM_ADDRESS) )
> +            else if ( is_mem )
>                  mmio_total += bar_sz;
>  
>              nr_bars++;
> @@ -531,10 +548,10 @@ void pci_setup(void)
>          using_64bar = bars[i].is_64bar && bar64_relocate &&
>              (mmio_total > (mem_resource.max - mem_resource.base) ||
>               bar_sz > BAR_RELOC_THRESH);
> -        bar_data = pci_readl(devfn, bar_reg);
>  
> -        if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -             PCI_BASE_ADDRESS_SPACE_MEMORY )
> +        bar_data = bars[i].bar_data;
> +
> +        if ( bars[i].is_mem )
>          {
>              /* Mapping high memory if PCI device is 64 bits bar */
>              if ( using_64bar ) {
> @@ -544,11 +561,9 @@ void pci_setup(void)
>                  if ( !pci_hi_mem_start )
>                      pci_hi_mem_start = high_mem_resource.base;
>                  resource = &high_mem_resource;
> -                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>              } 
>              else {
>                  resource = &mem_resource;
> -                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>              }
>              if ( bar_sz <= BAR_RELOC_THRESH )
>                  mmio_total -= bar_sz;
> @@ -556,7 +571,6 @@ void pci_setup(void)
>          else
>          {
>              resource = &io_resource;
> -            bar_data &= ~PCI_BASE_ADDRESS_IO_MASK;
>          }
>  
>          base = (resource->base  + bar_sz - 1) & ~(uint64_t)(bar_sz - 1);
> @@ -578,7 +592,7 @@ void pci_setup(void)
>              }
>          }
>  
> -        bar_data |= (uint32_t)base;
> +        bar_data |= (uint32_t) (base & bars[i].addr_mask);
                                 ^ unintended space?

Thanks, Roger.

