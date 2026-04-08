Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB7wLIAs1mkUBggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:22:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E863BA790
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275636.1561404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQ3Y-0001l5-22; Wed, 08 Apr 2026 10:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275636.1561404; Wed, 08 Apr 2026 10:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQ3X-0001j8-VH; Wed, 08 Apr 2026 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1275636;
 Wed, 08 Apr 2026 10:22:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAQ3W-0001iy-77
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:22:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQ3V-005T45-JM
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:22:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d62c6d-bab6-0a2a0a5309dd-0a2a4509ce74-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:22:41 +0200
Received: from [52.101.56.51]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d62c6f-bf79-0a2a45090019-3465383399bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:22:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7773.namprd03.prod.outlook.com (2603:10b6:8:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 10:22:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Wed, 8 Apr 2026
 10:22:38 +0000
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
 b=myhzkVZIL0XH6MDHQSA/xJpx00FIlEJLPQb7guRa+cHuXUTKg4x1JLNW2pO75/VIcNb7qT8jHJgAyY7jOCkEhJFKtWglMQgM3Vm2LW6Eqz8UVt8rcT8Z06Fdo7ffwqWauYcuxPIuO/PgZt+TK/aVcXe4F8kJgnbFR5NaJLZI2SKCrDBV8+cP4oHaLlw5doNLOfFOzCVO0IxZGAlzD+Q1EEjQM020KtpFCROGapgpn91YiVnsmJpCMCCZoWwCDuP1rHSNtmmuliSqkzJvWxb13eD4g/Rr+diMt6BYbMbYrtS0seWk5typxfJNb7CYwKpoGMekZHYQPGPRff+rXiZZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pypoFiR1BMj15sMVCp71mL6bnFBZjzvQYbP1C4FeNSo=;
 b=vt3hsTKzo+ueCge9Fb5TZiCr/BWUhsh4hLjuZSE3ZICF1mAw/0g1w2rziRvdBwT3crnSfB0vg4kaT266j6p4UeYACsonZoQz1qwCXRl0H8LStRDiCuurtSfPmQzxySTKvqyzsP5Qyfl57Z4tuvPql/lzgbxd8kCplC0ZV3kvPTAs8LQeOJUMnEgKfTrUZkTtLKz2Qh9fCHcCOVpoDg3MPqEoxuPAjGe6VqqnNTChy8XtLnpa27r2fd53BGo6Mzp5W4KGVU66iSRwmzJUlaXoLpEbdiO/a+Yo3pplxERY5KTnf8UEmApFU0PPil9TcQBaW5sd8Y8SXl164DWXhYZttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pypoFiR1BMj15sMVCp71mL6bnFBZjzvQYbP1C4FeNSo=;
 b=f0+ufB+JhrZ9cnz2cskytCV1AGT262bmlZccckaQ3XtERh9UoWH3Z6oDrRGxAhlczPxTNcwmCEmptkBLTMbGUC6p8XaM9dx9A4OMPoDtSEqbgmZYlrgdZHzRXXQFpSk9+/D2uuluQXHG7B3toUKx848HmFZ/zgVxjDIGRdff8VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Apr 2026 12:22:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
Message-ID: <adYsZsPP8HOLeY1g@wifi-campus-l-10-3-197-236.u-ga.fr>
References: <20260402155512.80170-1-frediano.ziglio@cloud.com>
 <eb6e0314-423b-412e-af29-c423463d78dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb6e0314-423b-412e-af29-c423463d78dd@suse.com>
X-ClientProxiedBy: MA3P292CA0033.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 16350384-0cec-4950-2c12-08de9558c1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t/smzvvdxkebFJj2NcApirnu0SZ0r5G+7TK49jB28qkjAoFTnqnGmj4tlgHkccpQLZbj+ZZdt4EVwBantIIDKm+kfRjHb1mQku2iq369QLpHbkoO5N2QMnLgPPWHI1tI9ACDMiIbPTTqu5CEShYfd+NuQ16lhGezTf0C0od7LJ2gW17Zdk1BFXB40VmrKy5GM+2EON5hf85PXyBr+oYOWknv5Pr0WZicwYk0H4BtdvGEc5CYeAUjtejrmcFNwS3T3+VUFgm+/oU+rUny+8H5ouT3Zvd8M7NL17ZKEx8HPPVAGL0HoK9Pa/bDaehORmMPhS0px7MMMv///D+WcAQo3adV+j6Y3UeLxEiBiyIyEs3yVfN/6J65/WaKaLTpCuI7HupAUuiydZBLUoxWfteE0DIdaf8yZ/SXQlEQQ8XBvC3d8BJyaABNTuKVeKJQra8ZTIDCfmWIJYMRG93ldAqUieDv61orYV8pcWhhoRrkHYh0T72KGqcRcpUZ42whv7hFAvgwZmUtLuf2KrSjvwG1MVcwdA3LsPxquNVHrW+FSE+fLjpV+ZW3Xnq2FNhtdED/aHLsk/PkztP0uxJpNKeFsQBnjtgNxva4iZYGqbEpT3Jbuc7oIomLd+IgctWZ1XyHQmZMALgo+OXw07HQPOnUofmwnIPasTtKEcAGYAoiVO53EUIcrYpghxzpZc28WpgiIwrlAOExdnmlH85nPP8koNL7JUd8QEeP7aINrTg7H5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNSeWdxZ1JiRXRGN0dqbUVGcitGT1RRWVZ1ODk1ZzF1YnZYTUVLSk91NDFE?=
 =?utf-8?B?U1ZTaTh2L1FLdFNzcUc4Yk93bHpFTkJwWk5VWTM1TkJ5eEVzeUFXb21iQmJZ?=
 =?utf-8?B?N1Z6Tyt1OVJCNjZRT1lvTnJMSnIrbGErTTJ1Tkd5TDlpaTIwZFEybE0vdVds?=
 =?utf-8?B?S0Ira1Z3bDROV1VFVFNIL2I2US9oOWdwWlpoK0tDT0M1RWpGMkpUNy8yUndj?=
 =?utf-8?B?WDVvcnh5RXNZY25PWVBmSkpQTERBbUtxOTltRlFEMzE5WHE1NDdNckIvSVBm?=
 =?utf-8?B?UzR3cTdpc3h5aDRQTzdxMmNDNFdlVmx2MTFRUEZRUmVQL1Z4ZHdHZDRaaTI0?=
 =?utf-8?B?c0hiMjlmTkwxM2hBRllKVlBCU1JNNW0xQTNTcW10L05mTVRVeHlXZnBrWWV3?=
 =?utf-8?B?VzVtSUxaYzQxT0dMQXNwUFNWc2h5bDh6bk1zQXdLQ3pyYTNLWVB5SHBYL2hW?=
 =?utf-8?B?aGVxcEU0YXZFWUtXMWdFK2dtSE1qVGZtcm1rbVVJWEJmaElHMkNvbXBzazZy?=
 =?utf-8?B?U0V5a1BQK3RTVjBJdTBReFN2cGUxajlMdVdLa0FZWEo1WUx1TWZ3Um5mRm50?=
 =?utf-8?B?UXI0Q1M1TG9jZm9Va29Ed1F0eWp3S0xTU01WVEdkRWNLYStIMzA1UVRKUTcz?=
 =?utf-8?B?dGJwVFZHL3JyUXBrWVBoNTNFbGZlNFlqTDljZTBhV01OSHlHcG5naDhuWXNO?=
 =?utf-8?B?U2FrNGZpUVY2QlNjYVYxUHpwMENYSmEzTkJ6RWZhMlV4RHlhZDNkV290VjhK?=
 =?utf-8?B?cWR3SVBzOTNXYk9yS3JVNG43WngwTDEybGdMWmVWVnllc0xWdlpvU2FyOFVv?=
 =?utf-8?B?MWVJNHdneUthd3VrelZCT3hkWXdUcFoydXl2UWk3WThtMHdUNTY4TTN5NmZI?=
 =?utf-8?B?aU5DMmg3NE9QZXZkM1lHZlcyWWRnd3JTalNRdWVOby9ORzRkVmVNRG9uaDhv?=
 =?utf-8?B?UFdYcm4xRTk5aDZNRUZqajJWZzlueFpoVUd1MmZTZmRYeWZEeTNlWGFXbXI0?=
 =?utf-8?B?SGRKajhNZFdsak4vVFdiZlpwY2FDU0tEMnFJcmFoSU5uc0RqRTB0MFRlZFdr?=
 =?utf-8?B?QnQ0UHRKamVtTTUrY05HZ0VlUUtQOUJOM2ppQWNuaE5qWk1aL2xJekdrMlRh?=
 =?utf-8?B?RHpqSXNINWxtQVlwNzlTOFdTckszcWRiVEVXdjFpR3pLcjROYlhnWWxNdGp3?=
 =?utf-8?B?TGNSa2ZkblhLeHBlR2VQeW5DcjJYQWt5bmo3dlB4QWNKZTZvT3M3NUxQUWxz?=
 =?utf-8?B?enJpOGE5N245UWdOWGE2RzBnVTlXRWxUb2tmT21XK3R2UzBSZ2xrV3Y0Q3Jn?=
 =?utf-8?B?d2I5YWlUdTJScHdFNDdrM2ZJYjNiQUNHS3p2SU5VN3lDeXFKUWdHWnBJc2JJ?=
 =?utf-8?B?cXVlYVdmWHVqRmhPS2djZWpzRXpxaURhODg5cXZZSEN5cFV5SmU3VFdJOWcw?=
 =?utf-8?B?dHBqTlVNWGZCS0RZUG1jRFFxb0o3TFN5ZG55UUlWT1ZZSDFsN2xJd1VKd3RL?=
 =?utf-8?B?RjNOWit3amowKzRJd29VUUFGSWpvQVpBdzBFNkRxeEphajg2VFQwMGVjZWY0?=
 =?utf-8?B?VHVLU3BZQy9zVTBlMWlzZnFGeUVYVHBwZWVzVFBZeGZIYmhXbUFQeUV4Z0Vt?=
 =?utf-8?B?Yy9Dbnp6U0tsbkI4RFlXYnBNbjdob2lGTXBidHd5Ky84VnBnTXY4VFRtTGJL?=
 =?utf-8?B?MHU0RjNPMTRRZEo1OHdCK01NUzZaTld1K3VTa044YU1CQVdid0I5ZXRNemwz?=
 =?utf-8?B?T3cyVlhvdzZwN1d1RU1sRmdDY3ZxVXB2aThOUkUwVnIyOVo0cWRkenQreW1o?=
 =?utf-8?B?QXA3OXE0NFZkRG5vTmlkNDd2R245a1JHOXpEdDdRWnBLSVA1VTJTYXNiMFlV?=
 =?utf-8?B?d2EveVV1Wm12M2J1MzZjT3ZJenR3c3F6RjRTcXNUUW5NL1hUQkZQSFc2WkdQ?=
 =?utf-8?B?eTd2cHhxVFZYaVJEaGxUU2VTS0U3Rmc2dXozaTZveEszU0EwSDAxNzVVaHhV?=
 =?utf-8?B?Tm1iVThzR203RERNVU14VW9aeldoQmRZaVNTUHM3WG5KcDlQOTVTWXNUZXMy?=
 =?utf-8?B?emtLSHllK3VUUVVmNkxlWE9uU0p6WWJ5YzJaQng1Vml0YjVrUkYwVjRocnNl?=
 =?utf-8?B?ZHFteWhmZjVvTnFHcW5WTFhFWXZFRHpuU0M0WmJRRlo2RGRBSm81QUZEdjJ0?=
 =?utf-8?B?SS9YZk1wU2gwZ1R3Qlk0dzJ5L0pIbEdqUm11bFE0c1VWODBHdSs3SFBzcjlG?=
 =?utf-8?B?Z2QzdHVKaUJvMXN6ODlKaHArL2RENlZta2lIcU1JTTFjYkh6Ums0VXhjdk9l?=
 =?utf-8?B?SDVIdms4c09YekFKeUFUV0NIMTBIdC9GdEpjek1MYnVzWUhRbGMxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16350384-0cec-4950-2c12-08de9558c1f8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:22:37.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Olu10yMaudjdanPpHDZUCHMClD4L7AoQa7Rl4na/tWHtaKVURfbjUJjkmHJerkDfXhQw4RZ4A6oqoIxUxdEZnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7773
X-purgate-ID: tlsNG-bad1c0/1775643761-2EF4E152-A65E2D12/0/0
X-purgate-type: clean
X-purgate-size: 1325
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,cloud.com,citrix.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
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
X-Rspamd-Queue-Id: 25E863BA790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 08:56:03AM +0200, Jan Beulich wrote:
> On 02.04.2026 17:55, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
> >      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
> >  }
> >  
> > +int __init dom0_check_parms(
> 
> I understand the "dom0" in the name is owing to the filename and perhaps
> adjacent other similar functions, yet ...
> 
> > +    struct domain *d, const struct elf_dom_parms *parms)
> > +{
> > +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
> > +        return 0;
> > +
> > +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
> 
> ... if this was about solely Dom0, no is_hardware_domain() should be present
> here. Maybe s/dom0/initdom/ ?

I think the naming of the feature flag is not very useful TBH.  What
is the kernel really advertising when setting XENFEAT_dom0?  I've
assumed it was the capability of running as a hardware domain, which
requires a different set of functionality inside of the kernel to deal
with hardware devices.

We might want to take this opportunity to clarify in the headers what
XENFEAT_dom0 means.

Thanks, Roger.

