Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPonAK/u2GlLjwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:35:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AFB3D7511
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279024.1563674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBB4n-0006Jj-U3; Fri, 10 Apr 2026 12:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279024.1563674; Fri, 10 Apr 2026 12:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBB4n-0006HN-RM; Fri, 10 Apr 2026 12:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1279024;
 Fri, 10 Apr 2026 12:35:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wBB4n-0006HG-36
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:35:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBB4m-00EWok-DK
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:35:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d8ee78-5cb7-0a2a0a5109dd-0a2a4502d3fc-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:35:08 +0200
Received: from [40.107.209.26]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d8ee78-42fa-0a2a45020019-286bd11ad033-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:35:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6083.namprd03.prod.outlook.com (2603:10b6:610:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Fri, 10 Apr
 2026 12:35:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.043; Fri, 10 Apr 2026
 12:35:01 +0000
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
 b=gBoBSXP8EvoBXlBfevzM1SrZRTI0bk0vIYmbqwlkTgF+yIHkpzrpfYFd5zxtquXlEwRZQgA2vP59MZZE4ZNgMCMXr7F0IJbDVRIFsMflmzqC97OHAC3hk6L198NCBytuoMoNNBRQXYOP9tCCiDAfj/v5GN2zbHghuaow0U55ZZx/1pMBljbgOZKwXh3q4+ZophvULhVVxW3jwUH4KEoH4aBCbqtfTUOSc3t9XF7PuWV42tMc+YIkE0G/RlDCpru7WwQce5SCzMH+pi3SGZJjiAFNJ9pgjZQIF4fC+/14ApzEWlMRZVNGEm5/5EaIx7jWPJnsBX96W1SB0CFGIY6q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l58eyZBdQYE1wiJggwLEnMNNUGQcCZw7PVZqOmMmsFE=;
 b=lBmO+Aud8VnTqyY9JkB0nit2mt0rIJwJ+wshaZkl/eXW5oRMiqRtykr4I7/TXoSKNLCcTMTWEUNdh5tvB7/apyVH7lJx9d6ClOf9Dij4wXSEorYRH0H7N+1N0xgHLi+dFI4uVxzQJCNI8cKhI0xrF+7I+5ozHwul4xfV1MlSHVV/4BRHabyNitnU0Z9XekcFKikJLyiQcyHl6EFmSar/kasWcqS1Cg2cbwLL2PpKwOIUfMfv+5Dt11RB0YMHo89U//qoXUheFFJVlvNazvj/hJOW1blfgtytqEhdRDqKr8Y3lAhYSzEMamLZqtEfWt3fkcBI71SGBvBCpSuKh4DXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l58eyZBdQYE1wiJggwLEnMNNUGQcCZw7PVZqOmMmsFE=;
 b=t6jj3PHxj0t0kVVg1zXb49KHAyzJScAe8UVdAf3BJL/W+ZybllZNJxb0GOe2c/njJkRyT6BiAQ5HhYX6dGR9aaLq/xbN4LkHtsHFmdTEqNv/UhGMgFxY2tQ+OExwsRv5AUOpb0TwC1rLhIe7hHsWQRRSrNNqFu/3WEIPLBLDd3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Apr 2026 14:34:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: avoid multi-message-MSI check for HPET
Message-ID: <adjucpWVe8jl-uNc@macbook.local>
References: <1903a57a-524e-4e6d-bd47-a87fadda4aa0@suse.com>
 <adfjn296dde_RQYE@macbook.local>
 <c1b2ab3c-7d4e-4f1d-b830-dbf1c933178e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1b2ab3c-7d4e-4f1d-b830-dbf1c933178e@suse.com>
X-ClientProxiedBy: MA3P292CA0071.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 2153eb33-968b-4b25-08ff-08de96fd95b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DZpuBQYsR77G/DKR6R1hqNd6BV3c+a7L3tKfs1U0XwLNW+HeM7FtY2m11vcwixE1FKj/rbqd0LSDTDa1EQUsTk2OTPd9bHilozPAwtNDUPVdobQsA2gX3jk/Sid4SWVrZP6ueGAprcJaYAuXNQtDtBnIo1khu5zf6AaC4sVjasDQa/SNsTOFtf6m3AmCiYXTj0ZwtlBU/eNtJTqMTo88EKxbGID5Dg01jKbid9SMXoB2vSFHZFMpuTsUAqXAOljjv6AvMHZl+Tf+vcFXQt4UqoL0ULSzadOUUy8xT3sCBk5KlEQUtX9iY1r60cxHWE6lOjuN/TXmjZ1ZtmYcPac4ChPYLl+zG5QYPid6R+sSgZ8DrmjGjPeOBCHqr8BcB53rUM2/A7NnCSq0XiKwL0q5eBBTSHvyCoIeZLuTRqYZKaUti6UA4oFlhx1yJT/boNy7Er2g/lNLbdL6SDncVsDgjCY8VJmtlbRSvLRIgUK6IOTAhtWd1+q9SWAV8H63mdRqEwzjP4emOAsXScYCUbhP+3L9AoE5ys/MxeVCkLKk+l2Ek3hU/N+jVOOsc/YIsatUsr+j7XwYi24FZH7Io71nh05xzXtls0E0RlJ/it/aYRWR1qzNJOp2uZLlY+ZdYlr8tjDhyT5c/nF5g4cyYOwxj+65iyBTpIQNx0qIGlxLF7XTs7TVq//MxRrqA0+wJ+s5j2hDqGQpOSr+Yv8/2UAwy2oOASIoiuEda3Z6q8mnH0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xpY0lBb3NGcElxeVA0dEU3bXVTcHFFVFdmODljYkd4QjNMUEthSm54aEJQ?=
 =?utf-8?B?TXhwYU0zQlNvOWpvNnlxU09kSVpKK0RtTVlHSDErMTduMXRKMlhxMjh1YXJp?=
 =?utf-8?B?WXhyYnpDb0I5dW5CUzRVdlJicUJhUUthbTlnd2VEeFh6TFgrd2dhbVp0Wlpw?=
 =?utf-8?B?T1MzN25oUlhtdlNBdGllbTAvbGVGNk9UYVA4cGhMNEJIT1VvMWc2OUVrVlJX?=
 =?utf-8?B?V2YwWmJFd0R0SEV6a2hWRUpvcWNGQmRySzhRbUpKSjRidWNNcldUOGFuS0hH?=
 =?utf-8?B?Nk1RN1B1NmJBejNESG8zYkVZa3JCMm5oRzlUekF0M1dYdTJaZnBMY3YxdlpJ?=
 =?utf-8?B?YnJBSldiS3RSd3V3MG5Ed1hFaSszbERWTzB1d2p6bFlrTHR5QXp3VUpJdDU3?=
 =?utf-8?B?MWtyK245cWNDNWdFMjdkOVpMUVNneTducWRaQkhmTjM1eUJmV3d0OVZsb1BP?=
 =?utf-8?B?MERWVjFHMlF2M0xEaUx2dUZGWHkya3hrZEFaWmNmTUFmNGFzUjFIcTY2YVc3?=
 =?utf-8?B?SFU5c0U0YkRUMnhjc0R5L3FlWEJMU29aMVRQUVNlSlYwUXZmOEQ4RmhvVlpo?=
 =?utf-8?B?UzNicUlhMFdFanI1ZTUrcG4vTDQ1U2xJVVEvZzhFOFo0Y083K0srQWZBRzEw?=
 =?utf-8?B?NmRzZmlocWNRQ3g3RW1TVlhMNEcvTUhpM1pHY3c4WHV2bVgzYnZ1VTlibkd1?=
 =?utf-8?B?VE9wMVI0cnYyRElaajlJbDNIMC9weFV3VjJXS29sV0hWcGtOUUQxQUQ0anJQ?=
 =?utf-8?B?M20zOU16YWV3dStEelJTSlZFQ05oVlJURUlmWXNsd3RCcTJLdmxwc2Z1cDhP?=
 =?utf-8?B?WjNuWk83aGlObTZNbzJickMwU1VFQnFYNFdtSzVwa3VCcmdkYU9IaFFsZm43?=
 =?utf-8?B?QS9ZeTRPdnlFM1pLcnd2eEVhL1FCVkZsNlpSbTFOL0MwYkQveEJycm5qUC9K?=
 =?utf-8?B?TVhqSHphZG9OZkFmdU8ya2wxSFg4Zi82ZGhzckdMcFFOWWwvb1BGeGYyUGVH?=
 =?utf-8?B?VnBGQUNUR20reEVXeWprSXUrQzFqNjV1UlpCcUgvSk9FblhlNG5xbi9yVnI0?=
 =?utf-8?B?REVUbHRic3J2TEQ2RjVITWxacytSMCtxa3JVbVl0L25mUGpreFZKNHZ5YUd5?=
 =?utf-8?B?bC9yZTdKUTZoMkNKYXh5N0R0S2lUd0E0cFVOMzhLdFk3THVUTWFDWWRML0RN?=
 =?utf-8?B?U1hXWmZoU3lJMEhpZzI5U2VSTFA2M1JHNzd1bEJ2SWw2VS9MY2MvTmx0NVVH?=
 =?utf-8?B?OXRWWG9JL2lHcHhtOWVtRGZEWG5pcnBGenpPeTRIOUFFSmpzc1dVUFpYMEdX?=
 =?utf-8?B?L1VyMzYxVHVudkpHNnFWMzh1ZTF2SFVVcFp0V0IxZ0JueXptT0IvQkFmSGJx?=
 =?utf-8?B?em1aWXZyVnlqdUYvZ1pobCt0VTFOc2I1T2J1ajZicXVHaExuaW1VRklBQ1d5?=
 =?utf-8?B?d2hqQ3JNRjlaa3hXTlZRRjNpT3dYNnUyNU8vMzlkWVBQZmQ2NXpkb09LZjBE?=
 =?utf-8?B?QTJTWWFwQW9PcStyQWhMYzZWdEhFcFZRaVBuWENuSGZzQ0hsUzVxOXNHNVBv?=
 =?utf-8?B?bDBPcmNVWk5rdGVmMFl2bUljWDhTbCtyckxFRHQ0eVNCV2h4YUE0aFV0TjZ0?=
 =?utf-8?B?QjEwR0FXVnNHU2FRZ2JSMGNiOWx5WXRrYldJRVo1TytNdjUydS9FWko1MWxp?=
 =?utf-8?B?U0JwT2RqWjYwemdCZmpYUzBIVFVzVWlOUFZCNHNRQzN1NkdMcGtCc09EUTBt?=
 =?utf-8?B?SlFnbEk4SGtjdDFVeVNpdTNsTXNxNXh3NEdodjNLaDJDR3hVY3lFdjlrQS9C?=
 =?utf-8?B?UFVYUzVnVWNzRGk3Y1BZT3lEYUJyb2JEVU1IYUdCdWFqOHhqWUYwaXovOHFz?=
 =?utf-8?B?RzZWa1B2NHVCanBwbENnQzIxRHlOUnp4Vm9CbkI2ays5MU5wTVVwMUVYZWEx?=
 =?utf-8?B?UE84ZjU3ZFV3SFpFaWpKdlBwZFI4Y2kyUFF6VnhHSEx1cW1EVldyaVk0d2N3?=
 =?utf-8?B?MkR3VTc3RTUyWVo4aG9KV0hXOVhIZlhIdHdmRG11SC9FUGlYWGlFR2J0ak56?=
 =?utf-8?B?WHFmN1I5NFRDU2hDOGE2S0xTdDU4a3N5UUlNT1FvWENuOVdaOXIrUEl6QWVK?=
 =?utf-8?B?VWtuUU1EWnZsdERHZEpnVzBNcjlmUGxablkyem41bnFoZS9VWWRiN29pR3Z4?=
 =?utf-8?B?SnZndFRwaUdoRWowMnFuUzdXcnhaQkxpeWdXNE4zNzlDaGR6Skdid3o3amh3?=
 =?utf-8?B?cVU0U1dIQVBvNVU5T3FRaW9EUGljQ2JrVEZ1UC9pRG1GdG5LN1ZvQVBheDBP?=
 =?utf-8?B?YnV2WFYxdERBeXJwUnRtNFJmYU1uOWZxOVpxOFR5cXVoVlJwYnRCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2153eb33-968b-4b25-08ff-08de96fd95b1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:35:01.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra7l/M1B+0k+gBFCLODf5bEItR8CTEqOLIWSIR2AqA79fZ7uDlb4VQ8FRWOldkWgLN9zKtJy8IcRBqu72ffoVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6083
X-purgate-ID: tlsNG-720697/1775824506-AE13ACD1-2E90A1FC/0/0
X-purgate-type: clean
X-purgate-size: 1449
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 60AFB3D7511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 07:51:45AM +0200, Jan Beulich wrote:
> On 09.04.2026 19:36, Roger Pau Monné wrote:
> > On Wed, Apr 01, 2026 at 02:47:48PM +0200, Jan Beulich wrote:
> >> Having this immediately below a PCI-dev vs HPET conditional is (mildly)
> >> confusing. Move that if() into the body of the earlier one.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/drivers/passthrough/vtd/intremap.c
> >> +++ b/xen/drivers/passthrough/vtd/intremap.c
> >> @@ -513,13 +513,13 @@ static int msi_msg_to_remap_entry(
> >>  
> >>          if ( rc )
> >>              return rc;
> >> +
> >> +        if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> >> +            nr = msi_desc->msi.nvec;
> >>      }
> >>      else
> >>          set_hpet_source_id(msi_desc->hpet_id, &new_ire);
> >>  
> >> -    if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> >> -        nr = msi_desc->msi.nvec;
> >> -
> > 
> > I'm not fully opposed to this, but maybe it would be good to add a
> > small comment to note that HPET never use multi-vector MSI?
> 
> That aspect doesn't change - HPET code simply doesn't (and never should)
> set .type to PCI_CAP_ID_MSI. That field should reflect reality (and HPET,
> iirc, simply leaves it at 0).

Hm, I see, HPET is a very special case which have been "adjusted" to
fit the MSI generation logic.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

