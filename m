Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPTDJfw462nRJwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:33:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDD45C42F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293360.1571146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCuU-0003vD-5z; Fri, 24 Apr 2026 09:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293360.1571146; Fri, 24 Apr 2026 09:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCuU-0003sy-2W; Fri, 24 Apr 2026 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1293360;
 Fri, 24 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGCuS-0003ss-3E
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGCuP-004FeC-US
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 11:33:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb38d9-bab6-0a2a0a5309dd-0a2a450be0cc-6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:33:15 +0200
Received: from [40.107.208.20]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb38d9-212f-0a2a450b0019-286bd0140e58-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:33:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB989229.namprd03.prod.outlook.com (2603:10b6:806:4df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:33:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:33:11 +0000
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
 b=OqBsug8pmh7flRmteGQ1CQdRL6P2paqj6vVyxzyxFmbT6OqLJ7VVpJsuIExfbUt0Kn/p7UfQCVVXewY4bFXNwCjV/gbjF7o7QpHl4lKjCwT8ShK1hN2yLRs8YvS/wfA2ui6Uw+5qe53+gk2VJ4Uyp083niWkByjHQjB/KvCzj7hTQPz+TbMEsz4InMT8o+lbVzkrJK1IrV0Vq9mElxPgF4KT+ZEUQjexVjte3eENFgYFO90/6RfRbzkIVYPgq84Zik+wejBUbXrNI9PAm7Q21v6e0CWWVfKcuAI0rT0xnZcPIqPZdW3Q4yVXnQVcFm0PsMfBEYfJ7TnaPaBThkW8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PkjFE5OCtlFkQQ/+7FBEENbQux1J5Go+P3YiSQzl6g=;
 b=KaM2Z8Q9pEU5Ptwq7QvdI+oh42ogjzCgqlvpNF6jUxPXIV46Fn9YT/dpSz4nrgFZZsrrlnbJNwHbo2554wIYDl4a+AEOG4JYc9+ggRCCyvUUAxFIjHTMwfJapJlZYRnc7nt8dJ5v82vzdBsrePKZGyI+y1lPFR/s/xrpZvyFaiDkRTp6iuybdQei7UQvTBabWa7rdEViUAGifmmAjiP8ax8QyJSIZfavxOMKvGMcEz1h4rUmeOWO8rcWiMBrjX1XliNRE4teSVfYoEosmQNqJQcDsfeMSqdOMbhubAOb8MONUq0MMsi42uYYm1ZzHR6+f0FvREalYMJHwd2spiUu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PkjFE5OCtlFkQQ/+7FBEENbQux1J5Go+P3YiSQzl6g=;
 b=cn0NlbJK/9GSQJU++iSwnWeMXZN7nw4ZR4rKgWZM3G5c1oueSDajmgEn2P11AurwEkOtbOMhEqRFRHffLQYcWGsypcsmoMoo5EMrbyf9i8xOO8OzgcK0Ll+60Un3bPAG8jjcjTxs7fu1e5ZZwWEwx0gPPpqW8vwiiXWRsuvomQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 11:33:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable
Message-ID: <aes41F8s1XV8soUF@macbook.local>
References: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
 <aeZQ3FcNl_EsPTdE@macbook.local>
 <18030a33-5280-4c15-ae72-159ba2a25018@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18030a33-5280-4c15-ae72-159ba2a25018@suse.com>
X-ClientProxiedBy: MA3P292CA0036.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB989229:EE_
X-MS-Office365-Filtering-Correlation-Id: 76bfaae2-69f5-48ba-ca93-08dea1e48097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lTcfrprsuf+yZb2YzJRgwLBiTycMrYOD7WCIb8odx5Dy+GlGcDpYY84MXkRIb5xgaszHNLGUJ/tJSCAG7M+W5FCjyUd838JPl2kYGeHFlfXVXeeOoC6QfRlvTzzOJOv4xyDslLhfJIIn73MPJ/O1ffPZNorCmjeyD7s1S74a4/F2A6hB+uUazY6vFJtFmVErmYgeW/WA0JOiRYUqKCjG1Q6hkrlGPKFpuGK75QqTxDxZYE6muJ+y9kIQe3h3aTnVIAp/r0uUPERa3E0M6ZA6JSNKfu+rxvQJFu5DvRkZVz+pli4F8kGkDocFMM+V6i02W56Hs5d/fXcuQq3mA5/yBdvXE2zovbOjyeX6SgZQFsEhw3YmeIZeS7ImiO3Ucn0tzGeEcbAIDnexTpqyRI2NNg05smiV0P82HudVtIxtOKjKjbtP0jlLYJpvlv/ful2lZfOvawsGAeGtng/7o+1pp1pwOx4IUezmcWwzznw6RPjUb4gGSURGbXh0039oTlctbqbKtfG414iWfVkL4GrQIh0IziGCb7196v2nClazT9ogCuWQwIKJgFEn4ch1OwWY8VniattoKaOeVXtcdfi+l62qxuAUfiJraK10vHSj0C1x3XdMbsD+TfMnZw0WtBhQ4y8/AmT/LYNaxDfxLMbrrXWaGnq1epK+20KhcFKT4RIKAEiVtL2lg/Qh3oAeFucz8TAfU6KIYWDiUPLLEvF+aYGXVsbl9iSlNk4QpI47Y7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDlmeXhPclExaU9yam03Y1BXZzdEL3RuR3FnVEUyNEQ4QTJSRGtRZjBpclNs?=
 =?utf-8?B?STkzdDI0Y1RHekJadXhKNTE5SDZGaGNpVnI1VDJ2b3MyWWNHMWRzU3NsSzdR?=
 =?utf-8?B?YWdDSGsweVpyT05zVEZWb2ZuWnloVW9yQjcxRGFMMDhudWVaeEtlTThJeElk?=
 =?utf-8?B?YTdmMnAwQUl1MUNHZy9CUFJua1F2bkl4ZjladklieHRaMXA3WFJ6VzA3aW1Y?=
 =?utf-8?B?eWd4RjVFc1ArUFNQbFRMdVZBUVFSMU9qMGhTK3ZNWnZNT0ZVL0ZRM2FZano3?=
 =?utf-8?B?SUhOb2NGOU03TlZKM2ZFRHNGek9INnNaLzROYmxRVnhDbmNSU0cweGJrYjJT?=
 =?utf-8?B?bHRBeVhoVDdldnJJQ2pNeG1MVzdoMk5LZU9jQVJzdzVoRjhKT0RsMmUxY3E3?=
 =?utf-8?B?czNLL294U3RIQzdkQmtCam5HNzZDV212aU56L0JsNWFaTmZmVWJaR0FhQkI0?=
 =?utf-8?B?QjN4MGlNNFUvQXNYZzBYY003MFdtRjJuRmQzOUJ6Z1E5M1NsYkFwdFUvb0oz?=
 =?utf-8?B?OU92enRrcEFRMzJYRU8vdjY4ZXd6Um1MTTVMSEdBN0d4UU9Tc3p0UDNCNVBT?=
 =?utf-8?B?THJrWWdSY2tLVW1HN0VWMDNlU1psNVpZZDlOeEh2UU5DVHd0aUlvMCtVZ0N3?=
 =?utf-8?B?MWpFM21qd2ZyM3R2dC9CVFREOVpBOVh1K2xiTFFmQVZPSTZ0L0YzVmYyTTlC?=
 =?utf-8?B?R3U4OUFoSUo2azU0a2hYeXJkN3llaVFiNTkrbUhqbVpWNnUrQkp2ZUhidEln?=
 =?utf-8?B?WmxYank5NTJnTDNZQW1pVmJTSm1iKzI2d0RhQnJDN0R3ODFvV0YwY1lPa3Fz?=
 =?utf-8?B?SXl2a3c0QUVIckZYOGJVQkVEdmNuTUU1M3BLZVU5SlFPMmlaMzAwSFc2c1E0?=
 =?utf-8?B?YkVaR202emNEckpSNGpLREsvVzVlMW1YUmhqUmZkZGpGNDJKSW5xaVVwakZv?=
 =?utf-8?B?NU8ybExZaDVYUWNDRkRoV1VoaEUyZGI3cFZrOVJPMWxVZXM0bGI0VHUxVVZh?=
 =?utf-8?B?SVFzOHNsTCs3UElJcDljYTVEOEppSm1pTUxQQ0VyRTIyT01WV2VQb1VqVndI?=
 =?utf-8?B?MDZ6bnNSZkRnbkZyT0pFeURMUCtqNkdkOHNXVWR6UzJTWmN4ZE9oQk8rOE1D?=
 =?utf-8?B?dUduZ21KeWtMaHZGdGdyVCs3eVFaRG16bThweTFGaWpsQ0QybXhaeEZEd1Nq?=
 =?utf-8?B?NExHYk1xdVRIOVpmYWVLWHI5blhwNWRhYW5idG13SjdSRVRIYXdrSUZPQmFm?=
 =?utf-8?B?Zjc4dFRFSWYvbzJ1THRuMEpBdWFQbEVTMlQ0ZjVYVVNJcUZDYUlmWEliSEFH?=
 =?utf-8?B?M2tVemx4ellCMVk3VzZ0NitJUUJSOVNEbG5mTmNMTkJOQ0x2dkY1T05QS2h1?=
 =?utf-8?B?eTE1TlQxQmY4allPUjQ5UVZFbTUranNPbFArbC9vT0wvWUlkbjBLYkpwMnJv?=
 =?utf-8?B?RXBqN05qVVVnMFBWM0htcThjUW81d3A5cFlSRW1FWHRZblpKeEtES1g4aHF6?=
 =?utf-8?B?cnpHbXlGVVcwMUtYMlRhZ2hsT2p4aTI5b1krMFUyVFdabS80NE1GWkVTY3F0?=
 =?utf-8?B?enhIZlA2aC8wTGNtbFNEQ3pyTjQ3WDEwOXJmcWw4TXZpT09ncUJHSEZkb0l5?=
 =?utf-8?B?U2xtSWpUT1VNeEZ0Qk4vZFc3eWdDaEpSZ1luL3ZRVUJyMWh0ak5uTlpXZjU5?=
 =?utf-8?B?RmtTSk5uQWxrQ08yUnZwN3VhYW5yRTdsWmFGL3BaanBjeE8raklBcS9UOHRv?=
 =?utf-8?B?SDZmVHprTlF6VWJhWjllL3FubUNlN2U0aFc4ZG9pMkxKOGFWWU10aVcwbHp4?=
 =?utf-8?B?ZjhoMjh2NkNSclNtTEVnd1VZWlI4VWlQLzZVZ3ZSRktHNVV5RXRMNHlmcXNV?=
 =?utf-8?B?NG5URUZuU0Y1QVI4NktldURSS0RZUFp4Q3lJc1ljWXJ3M2tNLzFUUi9lRWdH?=
 =?utf-8?B?VllNVUNodm9SMlZZaURkdmJlNFZLRDZYdkJlS01XdWxPbUx2RE9YSXFCemNN?=
 =?utf-8?B?WnZteWh3amZGQ0J2cktySUFNVXVjSGtSYUs3VzJhaGd2Z21tbDJ5R05PVjIy?=
 =?utf-8?B?aWdNaTR0bVlHdXA4SldYQWF3THdXNEkwdFgxZEpnOVNGMmIxcFhGTEViakVK?=
 =?utf-8?B?RDdyd2ZnSGxuUlk2Umd3TTRjWkZHWEcxb2lFUmNTUldrdUZsWTV0cGNqTWZp?=
 =?utf-8?B?eEhLYWJDNlRUY05la1p3VExjL1h1WUkwcDNFeFhKTFp3cXhWUEdVeWF6RzMr?=
 =?utf-8?B?UDBLdVN3TXhlekJsY29UdGhDNk1ZemxHbTF0a0NHbDRXWFI4ZmFzRGE1MjZD?=
 =?utf-8?B?Und5S3N5Q2gwelByRTZuY0JvaXpqYnQyczRkVlJmdjYzT3NRNVJ6UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bfaae2-69f5-48ba-ca93-08dea1e48097
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:33:11.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3la+NuXz10L1Uoyg+xcUr4QkT+yTVFJgXHjsTRpDx85vS9fdgVVEIERjke1qbRDxLWJD/FgyWxztHTiYkWL+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989229
X-purgate-ID: tlsNG-42698a/1777023195-7F57BF3B-EA4A736D/0/0
X-purgate-type: clean
X-purgate-size: 7270
X-Rspamd-Queue-Id: EADDD45C42F
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, Apr 21, 2026 at 09:34:32AM +0200, Jan Beulich wrote:
> On 20.04.2026 18:14, Roger Pau Monné wrote:
> > On Wed, Apr 08, 2026 at 01:34:43PM +0200, Jan Beulich wrote:
> >> @@ -690,18 +694,18 @@ static void cf_check acpi_processor_idle
> >>      u32 exp = 0, pred = 0;
> >>      u32 irq_traced[4] = { 0 };
> >>  
> >> -    if ( max_cstate > 0 && power &&
> >> +    if ( max_cstate() > 0 && power &&
> >>           (next_state = cpuidle_current_governor->select(power)) > 0 )
> >>      {
> >>          unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
> >> -                                                         : max_cstate;
> >> +                                                         : max_cstate();
> >>  
> >>          do {
> >>              cx = &power->states[next_state];
> >>          } while ( (cx->type > max_state ||
> >>                     cx->entry_method == ACPI_CSTATE_EM_NONE ||
> >>                     (cx->entry_method == ACPI_CSTATE_EM_FFH &&
> >> -                    cx->type == max_cstate &&
> >> +                    cx->type == max_allowed_cstate &&
> > 
> > I'm afraid I'm missing why this uses max_allowed_cstate instead of
> > max_state.
> 
> max_allowed_cstate is what needs using along with ...
> 
> >>                      (cx->address & MWAIT_SUBSTATE_MASK) > max_csubstate)) &&
> 
> ... max_csubstate, as both are driven by the "max_cstate=" command line
> option. Renaming max_csubstate to max_allowed_csubstate would be an
> option, but would incure yet more churn.
> 
> >> --- a/xen/arch/x86/cpu/mwait-idle.c
> >> +++ b/xen/arch/x86/cpu/mwait-idle.c
> >> @@ -1045,15 +1045,16 @@ static void cf_check mwait_idle(void)
> >>  	u64 before, after;
> >>  	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
> >>  
> >> -	if (max_cstate > 0 && power &&
> >> +	if (max_cstate() > 0 && power &&
> >>  	    (next_state = cpuidle_current_governor->select(power)) > 0) {
> >>  		unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
> >> -								 : max_cstate;
> >> +								 : max_cstate();
> >>  
> >>  		do {
> >>  			cx = &power->states[next_state];
> >> -		} while ((cx->type > max_state || (cx->type == max_cstate &&
> >> -			  MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
> >> +		} while ((cx->type > max_state ||
> >> +                          (cx->type == max_allowed_cstate &&
> > 
> > Indentation is weird for the above line IMO, you should use hard 3
> > tabs plus spaces afterwards, like the surrounding indentation?
> 
> Ouch, indeed.
> 
> >> +			   MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
> >>  			 --next_state);
> >>  		if (!next_state)
> >>  			cx = NULL;
> > 
> > Seeing max_cstate() is used in multiple places here, you might want to
> > introduce a local max_cstate variable?
> 
> Except that Misra doesn't like such naming, and any other name would feel
> odd to use.
> 
> >> --- a/xen/include/xen/acpi.h
> >> +++ b/xen/include/xen/acpi.h
> >> @@ -142,30 +142,33 @@ int acpi_gsi_to_irq (u32 gsi, unsigned i
> >>  
> >>  #ifdef	CONFIG_ACPI_CSTATE
> >>  /*
> >> - * max_cstate sets the highest legal C-state.
> >> - * max_cstate = 0: C0 okay, but not C1
> >> - * max_cstate = 1: C1 okay, but not C2
> >> - * max_cstate = 2: C2 okay, but not C3 etc.
> >> -
> >> - * max_csubstate sets the highest legal C-state sub-state. Only applies to the
> >> - * highest legal C-state.
> >> - * max_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
> >> - * max_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
> >> - * max_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
> >> - * max_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
> >> + * max_{allowed,usable}_cstate sets the highest allowed / usable C-state, where
> >> + * "allowed" is command line / sysctl based.
> > 
> > Hm, this is a bit misleading, because max_usable_cstate is also
> > command line based (plus system errata).  What about:
> > 
> > "max_{allowed,usable}_cstate sets the highest allowed / usable C-state.
> > max_usable_cstate can only be set from the command line, while
> > max_allowed_cstate can be set from both command line and systcl."
> 
> Well. While I think I get your point, what I'm trying to get across is that
> max_usable_cstate is internally controlled (bounded by command line setting
> of max_allowed_cstate, but possibly forced lower than that internally). So
> maybe
> 
> "max_{allowed,usable}_cstate sets the highest allowed / usable C-state.
>  max_usable_cstate, while affected by the command line, is internally driven,
>  whereas max_allowed_cstate can be set from both command line and systcl."
> 
> ?

Sure LGTM.

> >> + * max_*_cstate = 0: C0 okay, but not C1
> >> + * max_*_cstate = 1: C1 okay, but not C2
> >> + * max_*_cstate = 2: C2 okay, but not C3 etc.
> >> + *
> >> + * max_csubstate sets the highest allowed C-state sub-state. Only applies to
> >> + * the highest allowed C-state.
> >> + * max_allowed_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
> >> + * max_allowed_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
> >> + * max_allowed_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
> >> + * max_allowed_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
> >>   */
> >>  
> >> -extern unsigned int max_cstate;
> >> +extern unsigned int max_usable_cstate;
> >> +extern unsigned int max_allowed_cstate;
> >>  extern unsigned int max_csubstate;
> >>  
> >> +#define max_cstate() min(max_usable_cstate, max_allowed_cstate)
> > 
> > I would be tempted to drop the ending parenthesis so that you don't
> > need to adjust callers, but that's likely misleading, as then it would
> > need to be uppercase MAX_CSTATE.
> 
> I deliberately want to have the parentheses, to make sure all uses of
> max_cstate (without the parentheses) have been covered (by converting in
> whatever appropriate way). Which extends to possible backports. In a
> subsequent, not to be backported commit we could drop them again if so
> desired.
> 
> >>  static inline unsigned int acpi_get_cstate_limit(void)
> >>  {
> >> -	return max_cstate;
> >> +	return max_allowed_cstate;
> >>  }
> >>  static inline void acpi_set_cstate_limit(unsigned int new_limit)
> >>  {
> >> -	max_cstate = new_limit;
> >> -	return;
> >> +	max_allowed_cstate = new_limit;
> > 
> > Do we want to check the new limit doesn't exceed max_usable_cstate and
> > return -ERANGE or similar on failure?
> > 
> > After this change it's a bit weird to silently ignore invalid values
> > IMO.
> 
> I disagree. Those values may be valid, just not usable (i.e. they are
> still a valid upper bound, but we'd never go as high up). If people wanted
> to use the same settings across their fleet, undue (and confusing) errors
> might result on some of their systems if we did as you suggest. Plus we
> have always accepted arbitrarily large (and hence entirely meaningless)
> values anyway.

OK, fair enough.  With the minor above adjustments (indentation and
comment):

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

