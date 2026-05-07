Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDnFCAhp/Gn0PgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:27:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C524E6C60
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302542.1576442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvwc-0007SF-5V; Thu, 07 May 2026 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302542.1576442; Thu, 07 May 2026 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvwc-0007Pk-28; Thu, 07 May 2026 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 1302542;
 Thu, 07 May 2026 10:27:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKvwa-0007Pc-SF
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:27:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKvwZ-001f1s-U2
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:26:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc68eb-bab6-0a2a0a5309dd-0a2a450a9ad2-36
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:26:59 +0200
Received: from [52.101.46.23]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc68f2-56b3-0a2a450a0019-34652e178e51-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:26:59 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:26:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:26:55 +0000
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
 b=DnYf55TyDG9F0Uevte+KGwKypZgjZpV+hAVM3YjP32C/KgZxRuh9eW/JXwHuF7eMpS6UdyAQpCnciSjyKiyXAYvYJjTftjku1UGbVQjfHKu5I5CvuNTtk+46ieFFykfe5tPSbzexNQORqC0GA0lxV1tJtUKv/Fbe/uS6ZL3ZMjrWcL7hgMgUgAwXSFdwNldqOLTyYUF4xhFoCinsnmm3pAXzI7SAxFGQGeR0ajf7fwF1pBShWa1LwTTXTTJRNq3kQSVKFsciAmUc5zgHZ1nChK9YZbSnrTVIo8TCrm37CNBQPPu5Isoxi7e+qQCuyKcnj+GCkflKKPEwwcOk4qIbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/NAGs1SFXoq2ei+2M2RXSRYdHni8CX284p5v+iFM1k=;
 b=myCXqdt6BEc20s5dsIo1xxQjLK199gzlkvAQoMecSUF2TRINw/m57RNgIgoadt0TepdmJNhcaZB1hiKttl1HUCYp6IidWaytbw0yiGD14NqImdgz1okJ1rordA6mRUG815bGhQIKAUEmMZiHm2tExcbFd8nnj93rdQaNbeRUGHIDyrSHLNXvAkAM6yyIldjAeHpBWLO00+ZNI5hETVOWL5RZSA1LXXqWvmGweVZDbYN7g2ZkRe3rSEBY+JVoiZYqgvndIt0g1MvHJng1qh7ipHZRBywD43g/to1ReRqvJVhdsEVENVXMcB9FlvQ1J+B3MDd+wZfYeBoWFtav8YNfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/NAGs1SFXoq2ei+2M2RXSRYdHni8CX284p5v+iFM1k=;
 b=sZAeEU4uvkScXDVGdoObGxkolaXfMLf9xmz9UCgcozxxT6OmOF1ad8xzy1MsdHGcKcsODnynKC0KOViJvVTLBilrvczY2Onxwx/AOvOUZ4ntDsGunems13l/kNVY+hlqMmpY9dxtClsKFFAJSOarFVYiLSjLTyhvtpEufBrwND4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 7 May 2026 12:26:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
Message-ID: <afxo63Wy9en59pmO@macbook.local>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
X-ClientProxiedBy: MR1P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e82eb4-edaf-4a25-2c5d-08deac232923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gfMI+0kB3BfvBF/+0uEFS8abirraNAbqyMniYG3OWdW9I25gnQuyrZCN3gWfBcQluJoa0iWaNrLG5voPpViy+AYNBGyHgv1Uf083Z1++wgIJf29dS2oTrqW7w+2plwNQfp6PidGySve6n2jO7yzjsErWS/c7dk38Tqt/sAX4VOI06zywF8wC4Q5ba1Iu9PLJQl6PHEUS1T09/4KZNNCAWGBBBY1Ddrg/39/ieHOrc21g1tfNqwjsl35l9Wns86p8dEDgTVmJo3MuEAt4445F0PG4yhnGBqIIkmvY8p34g/enHy7jNo/1yWkHoaMZGTTOfEzzXYQzRIEhQWo+MuCKo9Esa9n6C64oS04USnhHzfUmEz/B1HotsOCL6xDGHCkjsD5T2O/aI/fyyNOQIj+zeaUz1nSYN8psPkBVMpqV0ErBaCim38xOLUKfAnn3TWrQ/Cbzc/FCixvp0ds65wbKYo/WA5XtLE8+Sn4PG25zHaRy7Ml5Tg2k+5RKB6wti4w/shktDQiS8taeyemDufebSJyKN7n1sEP2hQZpdDaRz6+iswTwshrNYUyZdZULLC5iTeQckq/0zhyfVri+5TBS+jdzLZUueJsIGTODgJOYA1QTYM5HMCk946Wx8cOAgJ9GknzGzeyU+aOgsGnNXccGvdjZXJyu44Z2gslIc72hURQjICc5cvYnP03it59FEALC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmJMWDM0bWpqRHNiOXdVRTNxajRoT2FWTGltYTZLSHVqdlFXekNxNUVZQmNS?=
 =?utf-8?B?MU1XMmVoRHNJMlVRT0dXVkRBOWNBT2x4T0pVSVExa1lQRURJL3hTSmtUamNi?=
 =?utf-8?B?NTB5angxSXhxVGhSdkdDd3hIUXRNTSt0V2ZEa3ZRTFJDV2E2WExteXZGSEpQ?=
 =?utf-8?B?MWFpdGl4Wi9GRm9YV1hjay9xSTRMWWxPZkV6ZlNkOTZINWRXdk5YRWZ1bE9j?=
 =?utf-8?B?U2VsTFlCQnN4L09VQVoyS1cxQTNMYkJhOFlUMU5Mek5VdUI5ZGhyRzk4T1BZ?=
 =?utf-8?B?c0docDhZeDlFT21VRjJ5TTIwNkt0RVFtc1hONGVuTDNYTzc0OVY5aWlmZllL?=
 =?utf-8?B?TzdDV3JwbFNkOFMvRXhGc2pWaXRVKzkrbFNVQm10N2x0dHIwek0yR3A0Z1d4?=
 =?utf-8?B?UnJhdTFpZk91U0VXUzhnWFFmZmRYQm1yWVBBYnhOd2ZlaDdmTWM4NHJKRW1o?=
 =?utf-8?B?NW8rUktnTDRsdTZSSDJseFg5cXNmQXhqWHVPUldkTVhiMnJnbVFBckJMTUVR?=
 =?utf-8?B?WC9zTlE0WWc0QmFFcUJIcmZmK29rYkN0cU8rc1YyMzc1Y1QyYXVlSlZnSGFY?=
 =?utf-8?B?b3VTb21vWUZYYzBDc2FOTFluYmZBV3NlcHFKbXlaMWJVcmZMaHVkYmNGcUxw?=
 =?utf-8?B?Uk8zUEduZ1RJQXhLSyt0L3E0dGIvaUlCaWlGV2RCRVBEaEp4Z2N3ZlNXcXlB?=
 =?utf-8?B?NlVUR3dFdkwwbTFPRzUxajVGWWhodHVLMTRmREFZa1VNeVV0akJYOXJXb0cz?=
 =?utf-8?B?VnBBdUFjR0pZcVgxby9CMmFqbjAzZWRWV2ZqM2piTVdVWlFYMFJpRFNXNXhx?=
 =?utf-8?B?TnN6VE9ZYVNMZnMzVFpKMUtoeno3Vkhwa0pIcDBiMDNtdXhnRjkrWjdxaUVj?=
 =?utf-8?B?NHlLY3VKa0d0NlVUdG5rRld2MVNKcUxXako1OVFDVXR3eFV5UGNISW5lTlFW?=
 =?utf-8?B?VmFWVHFGSFU4cTR4b3BWUkJ2NlNIU0QwaFZUL01aREpZYW5vSXRMVHpSb1RK?=
 =?utf-8?B?WkZMWHhtbXYvQ2Z0bWhPTitBb0ROUEh3d0xzdEJtbWNMeER4S1Qvc3dyelM3?=
 =?utf-8?B?TTA2TmhQYldlWEcya2MybS9KemZkK25tVVlYTGRoREh1TUtLM0FWUWlhNTVs?=
 =?utf-8?B?eUgyNjdHNk1kMkg3bytvQnk5ODRvSnF6MllqdHQwUkNiRWlhRWhSQ2cva0RU?=
 =?utf-8?B?STZaQ3VXOGJXNWdxVlJnemJjSFVzVXRmcjh2VGp0d0t1Zk9tbE5qRmVNTktl?=
 =?utf-8?B?T1VsbVZNRnd4d1NkTDZkUm1WeHg2OTNBbkZpV3J1NUxIOCtDV0NSUEhwRGxs?=
 =?utf-8?B?ZUdabzg5cFQwa1RhK2N2Ky9aNlpzZ0V4V01SNDF6VXBIbTJWWEhvcEwwakFE?=
 =?utf-8?B?WXZINmpLbFhmT0xpc1NVSUlVRjBLT21nSVQ0US9zakIyMHRMSlZOSkRSbHNz?=
 =?utf-8?B?VGxZT3lzRTBCbFpyMUhob0ZLSnliZVY4cUpqa2R2Nm9yMzhlaXhjUDA3MzJs?=
 =?utf-8?B?RFZKR3FwRjN4LzVaNDBETmdxZHczMHpOMkhhbThjek83Tmx4N1VobUVua0ZW?=
 =?utf-8?B?Z2pDaTd3MjFzcHE5U1NGUXVkQ2lpQld6VlhKcFBjbDRvTDJkYXNkM0xKL09S?=
 =?utf-8?B?L3VrZGZwRjlyMDNiVTRGWUxzUnI5NEV1VHlLeGNsbCtyQUdPdkVVT2tUclcx?=
 =?utf-8?B?RFN4NS9FdUtsRWc1cG5vY1MzdlIxeStQYzd1bmFXU2RtQWJnWGgzWXYwUjA3?=
 =?utf-8?B?aWsyWnhtQmh6MEFFY1ZnUXhqcUlGWVJqdTFUaHVSQUozREMrVXpxN0ZBWnRO?=
 =?utf-8?B?NlZMaHRUcXJVVGF3N0crZURxZkU0akdEZHU1ZGtvZWlORWdBTEZVQTMvKzFw?=
 =?utf-8?B?ZDFSazBEMTZvejdCWUNvcDI0c3NSN2NhSVZUbW11d0FrTHlydVB4eUpuRWlO?=
 =?utf-8?B?SUd0U3FUN2FMNEYxU3J0SGpVUDlYc2VzQ0MvQnc2UEgvQXRuUVcvbys3Sm5K?=
 =?utf-8?B?NTlvVEZ5WGNZMER0K1kzN2FzM0hvNm0wemU5TWplZGJRS2tlY3VJM0RGU3ZN?=
 =?utf-8?B?SVVnRnZKenN0Mm52UGExV2RuaUVqb2RLd3FXNlRrVnZuNTFjdVFSQmp6RkhN?=
 =?utf-8?B?a1Y5WEwwa0FrbWM5cWtMOVNSWDdmeDYzNE9vZFVFL1RMUzgvV0hiQ0UzM1RC?=
 =?utf-8?B?WUdiUmg2K1F3Rzl4dkViWityMHdnZTJRQVNEUm91Z3RYZDZGb2dVb1g3aXQv?=
 =?utf-8?B?NktWdlEwZ1Q3N3YvUXNETmx3MjEvWXFudmViUkRmTWlWZlJYWFh1WndwTllW?=
 =?utf-8?B?SjV4cHl5bWl1RGhhZWdoL2FjUVNJMHpVOVoweWhiR29RTmZQV21jdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e82eb4-edaf-4a25-2c5d-08deac232923
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:26:55.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HArAkjxq2V+1VE9BdXfC1zQ2g//ytOZ+ekRlwgu5P4EHaT/9mMoNXe9agzKbKjtMrQ0hlRyoPVOGRJEDtNn9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393
X-purgate-ID: tlsNG-4011c0/1778149619-7C8788B7-DEFC8045/0/0
X-purgate-type: clean
X-purgate-size: 1045
X-Rspamd-Queue-Id: 82C524E6C60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,suse.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 11:35:45AM +0200, Jan Beulich wrote:
> As a comment next to one of the invocations states, get_wallclock_time()
> can take over a second. The order of evaluation of function arguments is
> in principle unspecified; in practice at least gcc looks to be evaluating
> them from last to first. Hence with NOW() invoked first, the respective
> value passed to do_settime() can be off by over a second (which is in
> contrast to __get_cmos_time() attempting to get the time exactly after an
> update, i.e. [pretty] precisely at a seconds boundary).
> 
> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
> and its persistent side-effects shall be the same under all permitted
> evaluation orders") violation each.
> 
> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

