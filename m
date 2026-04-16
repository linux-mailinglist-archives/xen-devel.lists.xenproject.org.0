Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDosC9X04GmInwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:40:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDC40FAB6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283598.1565779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNsv-0001Ul-4a; Thu, 16 Apr 2026 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283598.1565779; Thu, 16 Apr 2026 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNsv-0001TJ-1h; Thu, 16 Apr 2026 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1283598;
 Thu, 16 Apr 2026 14:39:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wDNst-0001TD-I6
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNss-00ENrZ-V6
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:39:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0f4bd-bab6-0a2a0a5309dd-0a2a45049916-2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:39:58 +0200
Received: from [52.101.57.67]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0f4bd-1dec-0a2a45040019-346539431d2c-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:39:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6549.namprd03.prod.outlook.com (2603:10b6:a03:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 14:39:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 14:39:53 +0000
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
 b=Dw71vAar2EKnna1hiHQ5DBl9dwllhTpfABD2S6OxxtKJEv4qIyHWvyxqDqPQi9wX1CSq9VjlSBuGvAnW0xGHPVOiq6moTfE63Uq0I0gV8EsyOKWf+x9laff8H6edWWwpHuvQ9YXMuKfk+BnSUqUi4tR1bSOraPDyOAiuxoOEClvt/NCdlQli7E2q5O0C7ZPF4FVHNELkLn7jZ1o4IBEGU7m3Bsmo9KU2Y9Tue2DoKvMHJkFTKepUyjB5ffGquJl4Dld+WO+Ngh9czzGRNfxXocjcFXTms5o2ZlNIJ0EaH/Dzo9s3fLa5aTjI4lF95MFS+1ixDdR5Ya7w5PBn3HzGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCexuXcnCPR6FD9OUkYshKxyTvIRaUTsQO9BnYK2Gxw=;
 b=OvyMFWxyWpLrOp9POE8hNN7jyn4hYF8vc6UWgB1BIuw+wQAcdxUgBPOSYJ9gitSHj3AUfW1S9rtBBEGT3lNXS/uP0gHpmomoGhNH68InLmexOnsGZUqt9eDEe7YbTucgL2m5qquyz96PNIoAA2EDgDYEG23Z2QSSeJ0IY/kmWqHxV55viNi9aj0j6Jt4Rjj14QACsaLHhDsWmXwlZCxsI7Y48b2yWJ61xJnJ5ZiXvHhMLZy2YtCBX4IYZ/FbQXmKVj42FK4620G5VZZzJcnYsWKxAitfsAN8s3SnDAH2KRvx4gEVJrlDTDaC8HM44bKnd49WjL7KAFOJ6IqEE+BGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCexuXcnCPR6FD9OUkYshKxyTvIRaUTsQO9BnYK2Gxw=;
 b=fQBC1GMSm0E86+7bLp5JZgtI4iOmlRTpxM3vAsqldD/q/t5hWatEhHc584Vm8ITSfsPMmXJ7f/idWpr5GH2F013g5EEGuuMaO+WG6mFH1NHdCu2nwlBrLd84MJBe+blu7gUwNDhIbQSjZcDUQEkGS3cmP+TCcvI4/WygenMb3Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Apr 2026 16:39:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xvmalloc: adjust XVFREE() ordering
Message-ID: <aeD0tZVMC-LD5FMo@macbook.local>
References: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5bbbff-7e88-452b-f4f4-08de9bc60592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zAj/ZNkE8OUy3PNEGKNPb3mC3CPJ4kLPnzs/sEelNcBWz503ekxdiYd7YX12EsB/nJcFjGCWZ/vOBTOs8g1mZZAo6qeqwIjOSFwldNzOxzEegWC+EU5Tl5FvZpOM00tdzA4FX3vVlN0vrcH3FAEUDDLxaIY60gHo2TM7DSCQ1Go1IUYusbZn+cFHN2tsufXiehGU5KNMAow36c+zFs51DIUfg4gkb6pDo3kKOeuUbpQ94dbLXxn5Br2UOhEhMPxNINC4f6lmPEDs15UzIoVOspfTdDoJHW3tyRdO4o6/A7dVFyYBr/zV6BzuoxmGXvR7RY82DNiZGwWPx8Vvt3fj+s3eJDu3LxOItW3Q4HRN0SW+MaLLNZWu0Q1xdOn8FSC7Yb56cdBZyE8npw5tkmrLDgilk5NKwI0qBjy3p53LtgU+et6ynTreneH2I648V1IozioWW5S/6ZR9aaNTEt8qPL9JeRcTqIGSbPzE7L3t401Wgr/bwr8XLwayLpis86yCSUOKhK4qdGI/terI01KVDk4htLmddGwXPuAPkQ4skg3pa2KP6Z4BUOUvxVwLxItT1jbHRfob4k+PG2V3zVGmUeUnAYEw2necgviST/7MoBsWZY/UaB8BOQD7qecMuFNPqKh76QnZ9SU0/JmN0TRZ/QdDwjIc1mB33CWZAUZ5sZdVXN3HwGDj1yhuZTQX3P/JLmirjBOqI86x2OR0xBrH8a5ejCERhb3tNcpsRTZvsEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxtSWtFczhpQnMzODY4TDBGeFpZWGNtdjFLWmh4VlhMMi9JMFNsemVacmpS?=
 =?utf-8?B?UHNuSnVQaGl1WDNSREpUbmlNZE9tNHQxYnp3NWZrcWU4VmNhS0hrNnROSlF0?=
 =?utf-8?B?aUVkVk52WUJ5R1BRb2NZdWs0VTN0ODNjdzJMZmV6WUVXYmdSV1BaZmdxb3pt?=
 =?utf-8?B?NFhKeC9rQnduZS9tcjk3VHBFOWNVNXJQNWlQckFmVHpuTmg5Ky85a2F4eXUy?=
 =?utf-8?B?bUZyandpdnM1QlB5TE0ydGlxNllZMWVFQ0RkMW41bDhrS090aXhxRlQ4Mkp3?=
 =?utf-8?B?eFcvenM1MVhYWkpueEkwZW9zSXp6K25VZjBLVUF6aGJZcnNVekIyeHNMbE5N?=
 =?utf-8?B?Mlk0T3MvZFRZbU1mWUFHZXhGYTFKOUlNSXJzUTk2d0dSNUlsSEtyUnJheDVG?=
 =?utf-8?B?QzJNQTBON0wwQkgrTVVwYlRNeC9EWmlyeU5YdHRRU25MQlVjazVkQkgvQzU1?=
 =?utf-8?B?bUFVd0JMcGx5QUZPL0NxSkdwdDk0eURhc2RBWXFJcFpDVzJ6ZTVodFZWVzND?=
 =?utf-8?B?OTkwcno1QWJ1SHAweGs5UDhBSnExMWdYbDB1ZHVpWG92amtpMjZNMDlxNVRr?=
 =?utf-8?B?Umw4amRkYlEyVFhrdVZBMytRT2ZkR2x4RjQ5UDNjRTl6NkZYL0lZRWhOZVVF?=
 =?utf-8?B?b0hnblZZdWM1SnNhbnhWS3JRcTV4bDhlYTlaLzRZS2lwVWQrdWNhVzlyUkdN?=
 =?utf-8?B?ekVlY2U3cmdmQ2dCZDBpNXBuZ3hmZzBTdHZwT2JYUitHbkN1NEU2OXdEdk9x?=
 =?utf-8?B?REZ2KzBPVXpSbXJIQkwzb0VrazVXNEZzemFzNUJmYjV0QTc4QUcwMnpOQVdP?=
 =?utf-8?B?QjdiblAybCtaZk4rNEwwbjU4bXhzekdqM3VHT1FsWUMwSWh0bUFZMG9KT3dz?=
 =?utf-8?B?aUN4MnFhWGk0WTY5ZE15WjBhNnNXN0djaEYyc2VNSDdLbjdGcjZ6TG50cE9I?=
 =?utf-8?B?NVhpNDQ5OGxhMkdyVWxMMVhhaTNSR2VsNm9kYkpTVWgrLzc1SldzWGx2L3dD?=
 =?utf-8?B?N2RQK1lwUVp4TDdmNkNGZVduZXJyZnJyV21wL21TTlJzUXVwS1pCMnBQRVEr?=
 =?utf-8?B?alFGaC9TTFBRbXZZZmVMYUMwRjhoRE1JVWhmV1ZETVZDcDJwR09vQjBKZUFY?=
 =?utf-8?B?Q01KSVNrd0MzZEdPR0VLUG80ZVc3NVcrMDNrN3ZoR1N4a1RLM05sdTBSeXFu?=
 =?utf-8?B?OTFJNlBDOGpLMjJTOWwzVHR4V3hjM1ZNQXBCb05QWC9kSHV2NFZmVXlyR2pZ?=
 =?utf-8?B?QTUvQ0twMzFXZW1tem9ibERBeE1RaXhHM0FCbDFLckQycVErcm5LandDSEUz?=
 =?utf-8?B?SHJYSVl6WkJCd083Ujd6SDlqZitmNjVmYXNKam90QWQ4eDlYcC9KZUNkVGts?=
 =?utf-8?B?TllQNVVVT0RabUdMTHQxczE1eXJ3YjlNazhWdnF2V29hRnpyZUxjV0V5TG84?=
 =?utf-8?B?bkpFYTl4MXFGWDZjRC96em80Q0JzMVRDanc0WVdhdUlNZVBoYjh0MC9MV1FW?=
 =?utf-8?B?RGlIUDY1RmxoVFBxOE9xZ2o3NDlRVjdZSGNZbUVMYU03OUFzcTdQSVVvbVJS?=
 =?utf-8?B?c1ZzVzNHR0d0cVFHZWJvTkkrZ3hGdEFkNit2N0ZsV0RUUXJBTS9jTC9uNFNM?=
 =?utf-8?B?aWtpWUNVZmpvSGZGU1FnTWVjNC96UDBIQStHdFFoNXdma3B4TkFkQUQ3SEpR?=
 =?utf-8?B?NkkxNVdmRTFTakZOdVB1d2QwTG9CVmhDS0o5bE5PMEE1dXlFVi9hWFVxRTMr?=
 =?utf-8?B?ekJtcVVWMENoY2VGUWxnZ252elVXOTVpMWhpOFZZdFBFZGdpeEc1NUl0MFdO?=
 =?utf-8?B?S3VyaDJ3a1hyL05xSU41NHRqU2lvd0MwWUU0UVdYVm5DUk02V3g3QlBDLzdF?=
 =?utf-8?B?UzdCQlVTcGZHcXJZcE1FWWpDdEl1bW9QVTFvTXZWM3NreDhITFd0N2g5dGJi?=
 =?utf-8?B?V3VFZk52ZWtVVlAwS0tVU2V6KzJvVnlQbjQvd2NYNGNNSXFvdFBkanpReWkr?=
 =?utf-8?B?Qk85TW9BcTlCN1V0SnZyQ3MzSTJkR3ErTHkwU1I2YmNRcEhTdEJORHhuZkFK?=
 =?utf-8?B?VisrUFFFQVpKaEdPd2NpWE5nOUVITjcxTENJM3ZhVGJTU3pZbzRCZEFwdjB6?=
 =?utf-8?B?dWE5ak5rMkYwV2QxMFpQbFN1VnlCOHRadElNc1FySlN4MHNWTnh2TEpiQyth?=
 =?utf-8?B?Wm9Md3dZYmF3MTFNaUZhK0lua2hRYVZHbjkrYmZ5SENVVis1WUp6bzVGUWQ2?=
 =?utf-8?B?RGdDa1FLWFpnZk5SeHVqVmdxREgyeWkrZUw3NG5VMjJpeFpJYkpNdldzenQz?=
 =?utf-8?B?b2c5L2JpU045VytOZW9hS01ucENDS2lYMUdqYTJaY3Zhd0I5ZkgwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5bbbff-7e88-452b-f4f4-08de9bc60592
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 14:39:53.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bcBEr52G6y4UgWQgZOD8o0s/dSQ13zdGcCIqyvoKkbB82ui8+l2OgWXZkxf39WLRrsoenO/u2gROgXVpNgbKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6549
X-purgate-ID: tlsNG-ebf023/1776350398-2B96A3FF-F0DCF419/0/0
X-purgate-type: clean
X-purgate-size: 568
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7EFDC40FAB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 04:32:54PM +0200, Jan Beulich wrote:
> What c4f427ec879e ("xen: Swap order of actions in the FREE*() macros") did
> should have been done right away when XVFREE() was introduced.
> 
> Amends: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

No intention to stir controversy, but I feel like this should better
use the Fixes tag, as it's not an omission or similar, but code fix.

Thanks, Roger.

