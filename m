Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGwMO86OxWlG/QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:53:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDA33B270
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264811.1556149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qlh-0004E2-O1; Thu, 26 Mar 2026 19:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264811.1556149; Thu, 26 Mar 2026 19:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qlh-0004C7-KK; Thu, 26 Mar 2026 19:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1264811;
 Thu, 26 Mar 2026 19:53:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5qlg-0004C1-KC
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:53:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5qlf-0006M9-Uc
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:53:24 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c58ea6-5cb7-0a2a0a5109dd-0a2a4507a94e-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:53:23 +0100
Received: from [40.93.201.25]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c58eb2-fd74-0a2a45070019-285dc919677a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:53:23 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7657.namprd03.prod.outlook.com (2603:10b6:408:291::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 19:53:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 19:53:19 +0000
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
 b=myWduz52BppqMCZw+byz23OGtj91oWzOwE1HmwLKOnl29Eabcl1SHQWCoYX+sQY3jGF88kjBGAdiA3BvMY8si2ywRPerpAt8dRg2QnBmnktSGeHGiDqjqmyhNY3UkXvEjNEIWBP/q2nsnWOz9AUOJecZBq0XatPgYFYpWAivVHTaGc1bRoLxvpkRTjprmt0uekQtRPU6wNsKSs9JrQafp1YtEiM9jYcZ6Lud/4gDkD2MIWt7iYda2pbkuktKAGT7UGJrpsuOm7t6mDB6arura+7ON0Hil3JLWlDdRZvHOFYYeF7FiFSIM9e1LBFLYQ7j3I+CuG1g0vAcWFqeoNfdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2amyyJKzVNrwfOjO9KDSBbBLdfcMa3o2+yjMt/+W8lw=;
 b=lpArVPrZKzxWnD3BJ7papyXdjvGXVLFO6v17KsEHVpUxitNDcprC1HS3QWHsPtToU5USe+IoKhkyk0fxj9ljNLHUa/4vLvSBfRak+H+V+0rqEirmHbV+1N+2D7YSQNnlqhAqAZ5VGzRSoKKAqVGMmLT9zr/UcAX4n+XesyVv+QFzbvVrx2Fl8PlosaNX7P9MnXv1/PLP8A+Q1O1NedRJUNOr6GIZXAtlD5NWFXgNLwSMQ71L9LVlvCOIAgpxOzT8vX+/e+ziCh+Gmf3pYOY3TWybeHzwM0j1fuVANLcM7E0I8Qu8oAT5y8xp4dRzKMTxLR9y5hysgY6jJzdAL1tcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2amyyJKzVNrwfOjO9KDSBbBLdfcMa3o2+yjMt/+W8lw=;
 b=aZDqPhuyFxDqC0G1aNKMd1v02aimyOcV5qKnZh9rUuPJnMQcUf1vlE3N+2H0EQmXM5v2bsRgWXlXIow29HHQAKOuMUE7AQdK+ZBcLxV+H3YegWi3RqC7hW//tMOur7gJZQlAUUk+Otjmgiek1lz+41ppQLjLCwuCyT47SjTxPHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 20:53:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/x86: Check supported features even for PHV dom0
Message-ID: <acWOrAJGKLnmyBnf@macbook.local>
References: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
 <acUDmOqvggJfmhHu@macbook.local>
 <CAHt6W4fDAPpTB5kj_TdtPa3Of=shrtOtqyh3AsEkOeaam2q=5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHt6W4fDAPpTB5kj_TdtPa3Of=shrtOtqyh3AsEkOeaam2q=5g@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: eab5a90b-8bb3-44e0-b3c4-08de8b71544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x7lpsjW1I6koZRTprMeSSyd4oX6LiWG5x5xoX0It+xlsqfMilMjjjHm3zDokxe0dzHpWU0R2rU6ey/kbo02fVji5diAGuMziMZ+etUx7rGGqvam7lR+J7jlcux3EYbfBqex38sroMc12e0pQjlh/HjrDKixTYrE0Mcb+8rUhFiNMVaII4QHE6hJxeghQSxboSc7he+Ae+O5tchsXamfAOMmBP08EDgikgoYrsxzz/Q+mnWZWbcWz3TpD7/PxyF4QdSD/QEyT61XhdjzADrOh5O5potIUTbAPYR6d/9MSBPdpweTXrc9dGpZtjQQRWZPYlFGLSILdq03p9tVrcoR2DaglpvaHgs8amjzzjBEVemhAx+MXqWjPn37bcVxOrFuy36zbPnoJjc+2NzPKyFwJ2ocTfGAsPnJVd04po/NCuDZl7mXs5ZsoMb/9Xu25zYZXViQzBUMxF/pW5xO100SEbRb7VaG6SDHHLAwLjUjjRvROPseNnhN9oh4/RRy5pAFJz63D2cI0K2EEDSA8YYJqVhfhosbKUfhV+YtWakcgmSuRPvym7m8YHkZNn6kMLUGS8+/9eouZzuYUbQoNJEtFxB+ztdPBVviNSn7us4YtL5o1E9AFWoV5wElt3mqusx2o96d81vAIVeNmwpEpIyvf/iIKoJ9S2dWG+UAE2eMZEICdonp1IqABSW1rzroBwNyN03pBaeF/sydyRbLpF2YYi6AKmNi0mYwc4XMXmQeUvVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aCt1Mis3U2tuYlhVWmJrclcxY0I4TW1kSERiTFlJS2JJVndCMHlYVGM3ekR1?=
 =?utf-8?B?UzlscXBtdWREa1dPSW5lSUlZRGVKQkl4TEJ4ZjNEdlhwVElRNkNvTVlwbjVo?=
 =?utf-8?B?ak10U0hpdnpJVGpLRlQ1bm1kNUVWSjdPbkJvVnhjYXFzZDZPdkExakUyRFdH?=
 =?utf-8?B?MnpKdUZuSys5QWMwcE5QU0d0WTBrSHhEM2ExOStYWTVIUzVLRWw1MVVoRm92?=
 =?utf-8?B?cEtzQkk1WjdJM1g2cU9GNmRmQS80U2xnZk9hdzc0S3VqcjRCdHJobENsMHhm?=
 =?utf-8?B?WSs1YXh1M3lHeWVwaWd3Ny9nOHhtSGhEdS9QdzZFQkwzNHdwYkIwbFJ5TXJk?=
 =?utf-8?B?RTJTcmdxZFd3TGlrcFJlcW9ZRlVUbms2aUdJWEUrdDNZeGhucEhEK0Q3QjNQ?=
 =?utf-8?B?Nzcya2NHUCtPTlJKbnJJU09Id0dsL1RIL3lBZUx1S01MYjhUV2Y4TXhMdDZS?=
 =?utf-8?B?YkxUMit6ajJJcEcwMThzZWlZcFVubVpzOXJNai9JZ1BvYWRYZkc0VndkN3No?=
 =?utf-8?B?K3JobW1pZHRMV05WeWFYUmhpckRGYTR5M0gzcEoyVUhtZVVwUkJCOWZiWEda?=
 =?utf-8?B?REFSSW9uTGdUbTBiNHZNTENubUdoOWZxNnVKZEozRW04dDl5a094QnZhR3Fv?=
 =?utf-8?B?Q3BldmRZS09MK1dYazVaaTdFL2prSU9CUEREOTNUTFBZUmJiMmNSVklUTzNU?=
 =?utf-8?B?TGt6SUVhTVM2VFI1QnNxNE0wT096YnVNUHFYL0x3VEk1c1NhSyt3NWsrSUFw?=
 =?utf-8?B?K21HUUVIaFhJTm5sL1RTNWNxejdGaUlKRnpaVkhDd1ZiL0xHU1BDdHNwRHVq?=
 =?utf-8?B?OGl6azlHbHlRclNJeVNoOGtJS1BzRjVJNmxQRmhscDA0bUNMYU8yZGVzMmJr?=
 =?utf-8?B?dzU4VVhsb2ZLSkpQaWFkMFo3Y2pHNGM3YUE5Q1QyNHdQdWs5TVBhT2VtVFhJ?=
 =?utf-8?B?M1hvbTFibjB1NTd5YlJ3YzlSdU9hRzRRWDR6eG9nUE9MVWVZcEV3Y2RDRzcy?=
 =?utf-8?B?Um9LM1lWN3pHa1FkNGFicndBWVkzcnlSZG9kWmVGdUdSc3A4ZWJubmpTVW4y?=
 =?utf-8?B?NzlRUEI1MStIV0EvV2padTI5K2lsRjZQN0JDTzhMTmNaR2E4aU1VajBYN2th?=
 =?utf-8?B?VXZzSm9JaTRmOTlCTitqek1UMHhySEJRMG9iOXF5NlhHYi8wWEZOTmhIOTdF?=
 =?utf-8?B?THc1WHFkZXgxWmdQZVFwa2M4MnhtTEJJU0hSQ20yQzYzQlhleW4yb3BwRGwy?=
 =?utf-8?B?d2JET1hITDFLRDdDZGtSV3hnaXdGU1RrZ2pmdENYYlFNYjU5VDhHcjFYRzJj?=
 =?utf-8?B?Z2psdE9HYzZuSXBEbDFQRW9mWE8ydmNZZHVGR1dZTjVFZmNWTkJPcXB5Tkcy?=
 =?utf-8?B?dVd5SlRmTHpSdTVzamxuVTBGa0h1dHQ5SkpxV2xqeFhWMnNNMi9ib2xEV0da?=
 =?utf-8?B?MXFtTmhSajd5eGx6VElVVnpoNzJzZmFsM3hWbEdndmk4bWxJTDhrQWdHa1ZS?=
 =?utf-8?B?dm5jRS9rRGlTTUJmWWJRRU5Hc0wwZXIzblJod2pxMlBtanpKKzBpVVZCbmRp?=
 =?utf-8?B?Zyt1L0V0SVZSRkYvM3dFQytPMVpRTzc2VERsa3BoK2Q3QUxyMUFqQjkzdEtH?=
 =?utf-8?B?OTNMYlF5aHVYeEdtWWRtamVWOHcwR1RmQ09zdWpTOXlCYmM3dFF3Yk1LY3px?=
 =?utf-8?B?aXdCNHdmZ0dMRTdpTFN6dFZqTVJORzZkSUM2R25ydUtFUjFUTVA4eEVBWWVO?=
 =?utf-8?B?T2xvc1pNN1VWVS9ZVG9DUCtHUjNLejR2M2k2S3R3Y3R3SHlHc1VQZzBRS3Ft?=
 =?utf-8?B?U3ZScjJtUFA2R29INEpWOHZMRmwxdHZxcEFjRlVORWdXVGtNMzVEdnhQcWl2?=
 =?utf-8?B?VEtyZlN5ZUFienpKcUdNMitXM0JoWVlDSHF4OUFSbjRaOUhnKytxam5wcU1W?=
 =?utf-8?B?M01sV243NEhYWWluZUhjcDdWWkhQZ3NudTVzdzFvOE43UVpaZ0FOWnBXRHN6?=
 =?utf-8?B?NzJVREJFS3gwcHNrc2hGOEIxU3lvNXMxcVpCMG9nTjJwTHNRODNLWTRTbXhq?=
 =?utf-8?B?VUdPUHZJbVNoZDc1em5LVi9jSklNZTN3MWVOUDlkY2hLU3o5MlRuekc4Y011?=
 =?utf-8?B?TXltWGdhQ2NkZ0hzaGlvT3VxMVF0ejZhUVVhQXdIUjZrOThIK0xTZEh2K1Jn?=
 =?utf-8?B?THFaWGJETTVUS01YOUMwTzJEM0J2N01HMERPc3BGRk1ySlg0SEQrdzRBa0lr?=
 =?utf-8?B?NFc0Y3FFcCsxZ0dpL0lWSjRFR1laOHArQzd0aFFhUlhabEY0aXBLR2VTcThG?=
 =?utf-8?B?a2ZIOUtoT21zUkNDQlhmSEE0VUY4dmZXUnhkMTdxaUZxSEhVYjJXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab5a90b-8bb3-44e0-b3c4-08de8b71544c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:53:19.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7Ae9NtGCr8zmRKno+eHr6e5GfaiTNF+J/s+38Igy2hsRV5HDhajCIHXHP2RJbkgDkZvsS2N8Yu2QqJYI5mZRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7657
X-purgate-ID: tlsNG-ef75cf/1774554803-5DF80303-6B3C05BE/0/0
X-purgate-type: clean
X-purgate-size: 5900
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 34DDA33B270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 07:14:45PM +0000, Frediano Ziglio wrote:
> On Thu, 26 Mar 2026 at 09:59, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > Typo on the subject s/PHV/PVH/.
> >
> 
> Fixed.
> 
> > On Wed, Mar 25, 2026 at 03:55:28PM +0000, Frediano Ziglio wrote:
> > > The supported features ELF note was tested only if the dom0 was
> > > PV. Factor out a function to check ELF notes and reuse it even
> > > for PVH.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > > ---
> > >  xen/arch/x86/dom0_build.c             | 16 ++++++++++++++++
> > >  xen/arch/x86/hvm/dom0_build.c         |  3 +++
> > >  xen/arch/x86/include/asm/dom0_build.h |  2 ++
> > >  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
> > >  4 files changed, 23 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > > index 864dd9e53e..c6bb2f8067 100644
> > > --- a/xen/arch/x86/dom0_build.c
> > > +++ b/xen/arch/x86/dom0_build.c
> > > @@ -321,6 +321,22 @@ unsigned long __init dom0_paging_pages(const
> > > struct domain *d,
> > >  }
> > >
> > >
> > > +int __init dom0_check_parms(
> > > +    const struct elf_dom_parms *parms, bool is_pv_shim)
> > > +{
> > > +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=
> > > XEN_ENT_NONE )
> >
> > The patch seems to be mangled here?
> >
> 
> email client, sorry about it.
> 
> > And the line is too long otherwise.  You might want to consider
> > returning early here, to reduce the indentation of the following code
> > block.
> >
> 
> The line is actually exactly 80 characters, so it fits.

Sorry, I didn't count correctly it seems then.

> What about combining the 2 ifs instead ? In this case I would probably
> need to split the line.

I wouldn't combine, in case more XENFEAT_* needs to be tested in the
future (I doubt, but you never know).

> 
> > > +    {
> > > +        if ( !is_pv_shim && !test_bit(XENFEAT_dom0, parms->f_supported) )
> >
> > I think you want to pass the domain being built to this function, so
> > you can do a check like:
> >
> > if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
> > {
> >     printk(...
> >
> > That way you don't need to explicitly check for pv-shim mode, and
> > would more naturally work with things like
> > Hyperlaunch/dom0less/late-hwdom.
> >
> 
> It's not clear why. Are you saying that dom0 could be a no-hardware domain?
> Wouldn't that change introduce a regression?

TBH it's unclear to me what capabilities does XENFEAT_dom0 signal.  I
assume it's the ability of a PV kernel to boot as the hardware domain,
which is slightly different from a normal PV domain.

AFAIK dom0 could be a control domain only, and delegate the
hardware management to a hardware domain.  Whether the current code
can really do so I have no idea, as I've never tested it.

I don't think the proposed change introduces a regression.  It
limits the XENFEAT_dom0 checking to it's intended domain type (if my
understanding of XENFEAT_dom0 is correct).

> > > +        {
> > > +            printk("Kernel does not support Dom0 operation\n");
> > > +            return -EINVAL;
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +
> > >  /*
> > >   * If allocation isn't specified, reserve 1/16th of available memory for
> > >   * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
> > > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > index d69a83b089..ca96f32acd 100644
> > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
> > >      if ( !check_and_adjust_load_address(d, &elf, &parms) )
> > >          return -ENOSPC;
> > >
> > > +    if ( (rc = dom0_check_parms(&parms, false)) != 0 )
> > > +        return rc;
> > > +
> > >      elf_set_vcpu(&elf, v);
> > >      rc = elf_load_binary(&elf);
> > >      if ( rc < 0 )
> > > diff --git a/xen/arch/x86/include/asm/dom0_build.h
> > > b/xen/arch/x86/include/asm/dom0_build.h
> > > index ff021c24af..a322bf455c 100644
> > > --- a/xen/arch/x86/include/asm/dom0_build.h
> > > +++ b/xen/arch/x86/include/asm/dom0_build.h
> > > @@ -8,6 +8,8 @@
> > >
> > >  extern unsigned int dom0_memflags;
> > >
> > > +int dom0_check_parms(const struct elf_dom_parms *parms,
> > > +                     bool is_pv_shim);
> > >  unsigned long dom0_compute_nr_pages(struct domain *d,
> > >                                      struct elf_dom_parms *parms,
> > >                                      unsigned long initrd_len);
> > > diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> > > index 075a3646c2..9d0310ad91 100644
> > > --- a/xen/arch/x86/pv/dom0_build.c
> > > +++ b/xen/arch/x86/pv/dom0_build.c
> > > @@ -494,14 +494,8 @@ static int __init dom0_construct(const struct
> > > boot_domain *bd)
> > >          return -EINVAL;
> > >      }
> > >
> > > -    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
> > > -    {
> > > -        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
> > > -        {
> > > -            printk("Kernel does not support Dom0 operation\n");
> > > -            return -EINVAL;
> > > -        }
> > > -    }
> > > +    if ( (rc = dom0_check_parms(&parms, pv_shim)) != 0 )
> >
> > pv_shim is a global variable, you don't need to pass it around.
> >
> 
> Okay, but in the other call I was always passing false. What do you think?

I think just using pv_shim directly in dom0_check_parms() is easier to
follow rather than passing it around.  But with my suggestion above
to use is_hardware_domain() you might not need to check for pv_shim.

Thanks, Roger.

