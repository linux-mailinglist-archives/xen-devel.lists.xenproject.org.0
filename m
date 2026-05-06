Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAouCPwV+2lGWgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:20:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829904D9428
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301520.1575798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZMM-0002Yk-PU; Wed, 06 May 2026 10:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301520.1575798; Wed, 06 May 2026 10:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZMM-0002V7-MH; Wed, 06 May 2026 10:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1301520;
 Wed, 06 May 2026 10:20:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKZML-0002M3-JA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:20:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZMK-0098XT-VU
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:20:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb15c2-bab6-0a2a0a5309dd-0a2a4502df70-42
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:20:04 +0200
Received: from [40.93.196.68]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb15d3-af86-0a2a45020019-285dc4442a6e-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:20:04 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 6 May
 2026 10:20:01 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 10:20:01 +0000
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
 b=hlIiS/NQf0C8FsA7reIX9p8SMakBsIs0mV7wHjn9l5EGY0f4VKiAwrlKfzcE03frgQUqzuaKC29zqiDSTyIX19MJGmXReUiJ95Q6HZIkiD8DgFBFZOaPJb0xT2IQSw1zdSJ4NJdV8pWmeynH7etjQYiBD/JPDB/CYk5dosNTD7Br5Qzin8rY+rAZadrzi9bNh650icpi56bylHp3mQij9abwqYRYgEcRP9YVQL8xCdkwsPmF18dof9eiDqA0Dale17zIDtEiIhRGz923oMTPDRyOgoIIzrVwhQ4rfM69toRP7WAMAPsqkXMZkMM/AuwMYSvrDaMtEmfjCBDHoHsEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bomuz7Ql487bedmZHLAWUDdodoQqu6QO9+uxzpPiEkA=;
 b=OYku3PiJVfz4F/ETXm5ibIVomM+sPeRPJRePCkEqlW2CIYcLxpEtao9+DKNyUhTqVKJ4MCBcsvkVz+bAbTNDbRkPvA8zSJ7uWZ+ODceLykQM1CcpWXG9WXt9eho7dHlDTLmXSikYjQcw0xgLjMguJ6OJ+tGEgFDrs0iD9HvnblJ8RW0nGa9H3VC7HZwkWKCzl/x0+hx8EOPGteXyqELWyCmnY40kJL1Oxrh5URtaFnsEfUpmT1IiGIxvCUZZ7b6I03WZn1eBGrU4iLuEiLis/WAej3TRQGFgUBkwpXEfJ96jBREK1k/TQnJ4utlmeqRFQWR00ZTYPkEFtuFfljkjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bomuz7Ql487bedmZHLAWUDdodoQqu6QO9+uxzpPiEkA=;
 b=eiOTos4Sc5UgAo6noOwtXVe5WfAjumRopHKqPE4wtt/u09+ZDFZuluNUtDRqwY2MccC3QfJtcD9AMPQiEjRy0ff44F0szfamhux3vRKR1Ft3XZNa/olnDVxQhFuF+dl/+AZAx5zIFPYdUljWOgpunaiX9/SRD6oM0TP7IiF557w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 12:19:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/time: make early NOW() uses slightly more precise
Message-ID: <afsVzRWJkO6u77XB@macbook.local>
References: <95a2bc5d-c551-42f1-8f65-9f8db4100fe6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95a2bc5d-c551-42f1-8f65-9f8db4100fe6@suse.com>
X-ClientProxiedBy: MA3P292CA0044.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: e5edbe31-9463-47af-97c1-08deab5907ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CXfhqZuhk/SDaWroUoq2GHzD9IQQERQ2dgdYy87+c6lP8J//Ls4EuPGG1vqSplAwjmCTrTGsdErEXSmnboKQf2Mt38QxIUFih10S13+0oSrdTzNWVAsbW+rmbotcv1eaIryCKc4GTUYfVoCY84Kcaubx/k40aGR3fIe15t6ltRk2g9xNPLYFfb9LOJrw7KKBSKSQ84xmaO37dWHcP2wA717kaA9p9hQfWcz5No6hIIvD9M33gPD00Z2JvO29ZiePqlhvyGTF9bt2u5ITZ6QGhK4kLW6pXzOUD10h2KVjhGx9cJyrvhLV6daBrhOqHqt2IpNJcGH94HQ3B1UqnLuxAK0nRpJnAILiULST+HBU+u7YgYe1pGxNXC3mTs0FnwfyeyGjgfiRXCvte3jBKtlsjmG0975usfEHOe/xUXuopGnuQLOdANOisM3vnU1Wd+fwpMQWWt5e1y6IHQ76V7psXDTrQryncNTlq4vKsrnAW3iNX3hcUSiM7V1nJE4nUUcAqfCl5PSbqhRWL7V/d1pXUK8O0Vp8LEHvsAjXFEq+yCyXs2oFqs5Z6Ovrfk/JN2G+1wDsyO3PBIWwBSMIVsYNSat/vXD1SX2lxTYnizbSlmkZ1p2lb3rYHqULANLpSYrt85e6g0fxAVaByDWSdEEFbEWDcsCxHt+UTcQjWNhurB7mtFRUJSwLNBeNdkZ+v7H1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXdZNGx3dFFDdHdELy9saG03N21GZmF6T1piblE0b2hCZXEwSVhYcXBFOVph?=
 =?utf-8?B?c1l2Z01nNk53bjRMZVdxMkt5MFdpNTk0cE9qR1VOUXdCQ1BzQ1R0NE02Sk94?=
 =?utf-8?B?M1Z3aTFCUTlPTUovSElRbE51Z0ZvNDBPcXBxeTBIMlBJSHpoTkVzZFVZamZv?=
 =?utf-8?B?Q3YyTy9KR0Z1SmcvVTJ6QzRKQTk2cEZDWkNxSHh5R3NudCtEU1BBTU52ekw1?=
 =?utf-8?B?SGVGbmNNRERpdlBqYjFFVlVpczk3MC8rZFdtWGNBeHdueHhWZ08zbHlzSTlk?=
 =?utf-8?B?ZW1NUHJVbkd0NnNNTzYxK2Y3RFEzMjdQVU9kOUNLSExoc3lVVHNjNzZGOTRN?=
 =?utf-8?B?NStRRzJBakJEbU5LNFAyM3p2aEVQWE9FbzFJbXZpRG1xTDNKalJ2Uno3RHQr?=
 =?utf-8?B?VDlpM3ZYeDhqc2gwckt4SDJtRjUzNGZNclduSUgwTW01QjljOHc1aFQxK3hk?=
 =?utf-8?B?eGg5bkFtL0lUeStHWHJJMGpueWJNRVN4bk40WURSUExYckF5M0xvRGc5SFU2?=
 =?utf-8?B?MVVTczhQMk9FdmIvS3lmeXIybTNPRlVOc0N4dktzWkpWOWxhUTdiYW5hbVMz?=
 =?utf-8?B?SHgySHlYcWZaRDZWdnYramYvUHhuUnQxcXFBSE1rM1V5MHVsTVViMmg0dkRP?=
 =?utf-8?B?dkIxR3g0OUdsS1NTSDFKdFpDSjhFN1FjQmExRkRxaUhnbkJKSGRMemw5QzFG?=
 =?utf-8?B?M2oraHJack81T3hMY3VHRldDMkE2bzdZZEVDcENxS2NKclh6Z3lPZlRjalh4?=
 =?utf-8?B?M1A3dldaeHBKOGpiajk4VndQVmVzN090MlplMUVUTUZ0UkZldGozZStWQjM4?=
 =?utf-8?B?c2t5eTNETWJFNmtqWmFDa20rUUlJWEdNVHFhZUdZYVFiU05ITmg3Nzc2RkhJ?=
 =?utf-8?B?OVE1cVZtOVl2MkVRMmEzcWRkRXg3eitFdmh6enZ4VnAwc2lITzcwUUZQcnVO?=
 =?utf-8?B?U0hrM1hGcEY1SnhjQUJmTUc3NEw1Zi9HcXhoUGZ5aDRTRnFieXN2OURVQzJ0?=
 =?utf-8?B?a3FKd0VkbzhsZHAwblZFVHpkbXpGYVhFUVVwaEQrNkwyN2M5a0VuaUhYc2Fp?=
 =?utf-8?B?YkhTdHZyNFVnL0tXMENYbWJSaVJmVmpsMkNnM2dUWjlndTkyNWJLazJPNG9K?=
 =?utf-8?B?aEI2b0NIWmFoRlB1cXVKSUJFRmxqVGNLeDVGQ1IrWVUwa0JYWnZ2MDFaNkVC?=
 =?utf-8?B?L0xvd0NvS2pTeDJaZDNISWxVWnRkdjJnTm9nZ3hJa0xVQm1tU082T2MwcVZH?=
 =?utf-8?B?d1JXNjhmNTJ4VTM2U0twb2RPY1dES0FESkZJQkNHNXVudERjS3JURERQN0kw?=
 =?utf-8?B?SVJhVnpqWFFTTm94Y3pwMXZ5ZFFocU0xM05YTEs5SU1BbGNLNFd1ZEs0RERD?=
 =?utf-8?B?RE13R2pTTkprdVZkUTZYcE5qTy9MSGJrckVqZnQ1T2V4YU1wVjM1TjBLK2pw?=
 =?utf-8?B?QnMzbW1NaUJUOE16NllNZ2NxNGtqKzliVk13MkhwTnhZWUNCalNickVVMWo1?=
 =?utf-8?B?V0pvdGp3ZjVTQUwya0pxSkhaNEhpWXozUlhNeVl1SUlJeUVZMVBtcGdIdnpM?=
 =?utf-8?B?czcxRmNpQ0lhN2dLdHc3TVlKY2JIY1lFaGgra1Q5b3B0YVZvT0RzelFTSXQv?=
 =?utf-8?B?anl4S3JuNiswbE1JQ1FLN3RsT1h1aytnSXBlZ2ZlNTMrL0ExWmU5K2J5UE1Q?=
 =?utf-8?B?NXduYVVuRlBwQ1pVNGVzaFhRU1N5d2gzUUNmdEVWN01kL0xJTG9yWmUyaFpP?=
 =?utf-8?B?Z0dwREE1YjRZdUM4bTRQSFlwRUNBV1Y0Si9QU1dCdVBPVndKRXNoaXM1a0Jl?=
 =?utf-8?B?dEJwNEJKQWhxWTkzaEN1ZHRVK2xndlpNdEwyc255VEdhVHd0QjRkbFovZ1ZE?=
 =?utf-8?B?VXBrMU5zSUsvOEJBKzluQU96V2dmckVIZDZDUFVZekNiazBrcW5PZkowMTZT?=
 =?utf-8?B?a0FmQ1hOL0pyaEYvVVRnbEJpOTBXZTJ2cTl5SmtBSDhBQTRNTTlueEc3ZGlI?=
 =?utf-8?B?OTY3K1ZUbWNlWlhSMm1tVHNPbDZpV3VqRndUNFp4M1pNRnl2dVZVY3BYVWdW?=
 =?utf-8?B?bjBYOGlZSlR5WTlJMkFrM1lPYVFEeEN1Vmk4RTBBWjdBZHVuemRpajJaV1Vk?=
 =?utf-8?B?RUZZVXljOG9lNkRGc1Fvc1JTdXhrVmJtQWEyYURTazhNeUNORkh0b1BOWFI4?=
 =?utf-8?B?SHRiN0p5bWtidlFHWjdtU1VRZzVWSXY3QVkrNDdoQ3d5UkFibHJQTzlTeUsv?=
 =?utf-8?B?N0RlRytaVzNvU2JXZDQ2L0xXdFZyM3ptd1VoakVxajhKamxEeFlQZDkzRDUz?=
 =?utf-8?B?aHdwdTdYUzloR094QjJpNDFQaElSbkdUWE9KMGEweFQvQnlGWldrUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5edbe31-9463-47af-97c1-08deab5907ec
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:20:00.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aFaPJf/w6Wyb/fprT3dCT/uKJEWA6hZ7Nh2/ezrDxGVYYKS2Ez1qZIBnr0QRhkWbUe6TQ5zQgQJVEbKjStgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-purgate-ID: tlsNG-720697/1778062804-AAD6F161-94A82929/0/0
X-purgate-type: clean
X-purgate-size: 1085
X-Rspamd-Queue-Id: 829904D9428
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,macbook.local:mid];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 11:33:55AM +0200, Jan Beulich wrote:
> For early NOW() uses to yield sufficiently precise results (scaling incurs
> some error, which grows with the delta being scaled), init_percpu_time()
> wants to have run as early as possible. With 93340297802b ("x86/time:
> calibrate TSC against platform timer") having moved the invocation of
> init_platform_timer() from init_xen_time() to early_time_init(), this
> other call could be moved as well.
> 
> Moving, however, has the unwanted effect of then growing the gap until
> time calibration runs for the 1st time. Therefore keep the present
> invocation, and add another from early_time_init().

Yeah, keeping the second init_xen_time() will make sure the BSP
doesn't diverge too much from the platform timer during boot.  WE
migth as well skip it and wait for the first rendezvous, but this is
likely more accurate at the cost of doing the extra init_xen_time() in
the BSP.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

