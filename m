Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKwRHyRSqGnUtAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:39:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543F202F1C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245653.1544998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoJN-0007Pm-8R; Wed, 04 Mar 2026 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245653.1544998; Wed, 04 Mar 2026 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoJN-0007OB-4r; Wed, 04 Mar 2026 15:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1245653;
 Wed, 04 Mar 2026 15:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxoJL-0007O5-QT
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:38:55 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fcf1a75-17e0-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:38:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6354.namprd03.prod.outlook.com (2603:10b6:806:1b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:38:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:38:49 +0000
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
X-Inumbo-ID: 3fcf1a75-17e0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLRIeppK4R45mskrmzkA0YT9Sl6xcEXicRxy3vI/4veyc/DLgc+fccfcIHF5Fi6qTOU4gduBGNln4WhKcJNqo2saftxPBauzn7IYJrUhKan0oY8tjAx9uh8gfJzkl6PUPbxiSI+jhRfVD8P2Whof5PqoajcUqTZd78Duhe9nRnXyLxo4V0IA2WiEL+A0JSr+5E6ZAnuVtIni/6LtIy/rRLZCsArWuZJoVuFJj3Hge0y2RNDutaRQOyUHXDOeAREyF9fowgap+PjYh3D5SayqHd/eDpjAOPvu+gtdsocidZfogRW+YGT3kwhqjZwwnFPvmrbTyOO1zbAolRFjSGZgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JXynPD0+Hi+BE1VZ+yaXhtAgc15KDOeqO9w/iTbPH8=;
 b=RO0oR8kkEVew0/JBy5KYFnt4c5gnubRXfDRZG+FxG/P+aDpyR1IyVNLGXu2zKg29Z0KiEucMSodeAbDQmM74FPlIysuk+xfrR5u1c3NEXTp9AUB4HsaonFKcWxGbR22y9HZbB622SQx6UXpkzfBWfw0kX3YVB9BOoTyorZ6wN49D2GwFaxtZlNZwPYAJnWuLwWGv6+tt3XLV7L+nluiQzu7a7dLwm/KhzuIEdGP19BXqdRe272ZH6c6b1JuI1mYae+s0IVff+eq3ye834FVfT4oDHZTt9Y1XQhYPvwXX5qYKIN5mEF5e9IhzJnoD6jCCwt8kEqVaiZnmrDzVPv2PlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JXynPD0+Hi+BE1VZ+yaXhtAgc15KDOeqO9w/iTbPH8=;
 b=lBDHPwThgt37ozDuAQvf/DejlxEq1rk68rFE/xRGhA3rq0fI2P4ZW4t/NYhlzPNyuE/E3SurRZLO9LXCrTw2/OZdBdzh7m6HC38ewbullETeIETIsC09ahBxNU+oh8uia/8Y1D406D7Z92sotFlUttDrNEEX4CO1wda58jrZasQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:38:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
Message-ID: <aahSBk--J_xqEzOq@macbook.local>
References: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
X-ClientProxiedBy: MR1P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d1fb2e-b4e6-4c5f-d603-08de7a042170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	YL0N+R7IC9+I+ocIDRHt7jWW6icF4RrWZlD/ZnMEPFCcmYU7sc0Am0Gbsm4YG/XXqnkTodQg9jYKSRhYsfKRi3LKWIWR5KwlUzojESwipQnQ6v2eZp6g64y9DCkmA6uRaNsr8CFj1YOxF4TzUbiPpHS5aNdAOjuRxQ6Ngz7Ppq3DYk9tvN3ftHfYdJIYk3uEPqp8D2LhdwLzHeE3BoZ3kIKf/Tg2SwiVzo/0bUm+WqQl2cYCxFCQ3UHaDshAY/JPF0I06xj6mWqCdcd510QCgMV2GQeTNyA8W5IJP7K1vl/OlR2uBwxKaxKYsdmNFQvN/z8SSUE3YCIdV+kGHX3h3PsnP8b00uPIaeDZ88LukW6Nflf7utbCPOIMd5OzS4/7N1dnDapACbVZxLTYaPU6cOPQmwleyO/o60/Xk+by+KMIItAV/ev09u44Npl24LuYSKF3e7WiVX2IWIMywTickqb/tqSMxkJvLM7PkHTTOM6ATZ/kOt2kQ5ysTkqg4hGZc8BTwrh/WHcB/wNklvtuQpCUGEcKOQB+wwnVoWXIzn41EwcHmIH9Hz4KSKNBQOum03jhrTmEael1PCrQAOEBtgglPdqVTWBTldq7N92a8Vp8XULC6m33d+xV3m/73sg642Ta5782bCuI+9x9IfFDNrSUWJ3agCuLhysihoeW2FENqnxh8/Oh+6HIoXtiXkycodAVowE+gvOvwpsICxG4ed9Siaoq/TejQtkVjjopDFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENDbXViYWYvQXdoQXNySHNqWHZRanM3TSsvSmltRlY3WEhudHR1aUwwVVZY?=
 =?utf-8?B?OTN5UTJGR3RCSGlrUUk3VnJ0T0luVnFZSlBGOWNvMUpYMjZ1THltZTVPOTJ3?=
 =?utf-8?B?ZHNpcEEzMkpidmh2MElJM2U4ZCttTnR6Y3puQXZEZjZ0dVlkN2RkbTdkaXQ5?=
 =?utf-8?B?VGhQSUdqTW9rZCt6OXMveTFHcGVPQmFaZCthWmdxWjBSWkhFdzVMVnNkVWlS?=
 =?utf-8?B?WlZhamk1NmhwZ0NEcThRSzBFbnNSakMvTUlxNFdzdWkrR1BVc2ZvT2YrVDVn?=
 =?utf-8?B?RXpZL05UQzZCQ1JlZTM4K2EwTTR3LytWS0tJNHZKNjlDZi9EUjlOTUg2VjVM?=
 =?utf-8?B?SXBZTld5L1JyL241NUI3VlhYV1NkTm1sRngvQ2p4NmZwdnZOSUdDanB6RW8z?=
 =?utf-8?B?Q3BJdlEvbWRlb0hHUUVvNlBsaWR5OVZHT2xxb1RMb3k0N2RyZzdGRTVqdFFF?=
 =?utf-8?B?VUJPNE41emFYOE5jSUFHZzAyQ0VzLzZkcUVTcTJXdXVXR1BJYTBPb2hCdTcr?=
 =?utf-8?B?ek1Ub081eTZIN2hyUDQvZ3RTM1hFWmNPOG4yT1dKTmNtOHdSeDhGVVV5a3dH?=
 =?utf-8?B?MG1LMlRIZ002QzluOWNzM1hZd3QrQldWTXBrMUJNcVZXQS81NkVaK2NXaGxQ?=
 =?utf-8?B?VWxHdE9LT1JQMGc2SWJ5VXlUYzRmYm9mRGlPTDFaTkswM0VUL0svckNzUVNk?=
 =?utf-8?B?V1oxWmdjK1FIbkIrYjBVTklDL1ljbzMzZzRsZDUvclVzMHJPaU40YlNSNVJZ?=
 =?utf-8?B?T2tBMWVNSkN1OXBVTzBJVE5UOXZabEVKWWl2dzZuZnN3WTZEdlVTMUZVa2ho?=
 =?utf-8?B?Y3R4MUJQYWVjdUVTVWxYWXBUeFo5OTlwTitpcmcvZWg4eEJMUWI4Sk9NNU9n?=
 =?utf-8?B?eGtWcHF4MHVjRTFIMU84NjFLWUlqdFhXbGVBVXNYZnlwb1BkemVScThIV25n?=
 =?utf-8?B?QVpUK2F4cXp1RGE3YmpKaCtCYXRzZnA4bmpRMXc1bUV5OUY5OFdmYTU5QlJN?=
 =?utf-8?B?dXgrbjZYQjQzSHU0RjhBQXRUbXpqSmlCTlJYbXdYNjZ5TmxXSXgyN3FnanR3?=
 =?utf-8?B?UVoxVFZOZDlwSzRwRlR4VkFRM3BkYUlnblJkanlrUVZoT2F3MzNIajBSTnVM?=
 =?utf-8?B?MWhQeUoyYWl2VXIyYWRBenBHWkdhbFk2bjhmUmdHemNxOWl0RXM4OEtFVWVi?=
 =?utf-8?B?T1hKL0hvODdPRlN4ZWJQdXZmc0QrZzNhc3N6d1UwcnJpbCsyL2xEUTlrV01T?=
 =?utf-8?B?S09ISitWSjNZQUlydG81aHZkdXB4NjRQMkpBWHhkNFZaVHkzRVBkRFBWbnF5?=
 =?utf-8?B?OGtVSm1GK1lZM1lSV0QzQ08wZEwxTlZMZUs5bmtWeTNub1krelJLNGtRNUNV?=
 =?utf-8?B?bGViOTlGQ0w1RkgySGwwQ0U2d0lWYWZWK0pCaGIwQ0t3MEdFQjBwVkN4a2lP?=
 =?utf-8?B?c1dhcmdRd0VwS3p4SlQxSXI0RFE4THpMOGN5eTRjeXJ6YzZtVjFPSHFjTUQr?=
 =?utf-8?B?OEFLV1pDaFVKc081UUN0Uys5emVPZXYzTjJVelp0bVZmeFhpOW1rdzhKbURR?=
 =?utf-8?B?VE13VXJJUVNYVGg2bS9pbjJIN1lPOWYvajZVdGF5UldTWXM2UThDbUord05p?=
 =?utf-8?B?ZG1zMWhDWjdDdDBreDJQTXJ1ZHcvRmM2NStlaWJzSGVxbC94SGdvWFhFbnNy?=
 =?utf-8?B?Q25OamJTSmtwMkZiV3Z4eVdKZWRxUE5taG9LTGdKRHlGRkRZTWg4dTgvMm5a?=
 =?utf-8?B?M2lUR1lVYWlyalZOcFdkdU9NQmR1L3pTTVgyTDBuRVAwYmd5U05aNVh6ZmRr?=
 =?utf-8?B?ZkU5QUpsYng3TlVjTlMrSHROcWhmOVBDcy9PeDZsSHVsTnVMYTJlSjQ3ZGFW?=
 =?utf-8?B?SnBmRktnaUthWU1DQzdMQVljMGw0ZHpyU01nZFBDZzV3OW5ySi9GSzh0bzBI?=
 =?utf-8?B?OUlpK1JIZHdVQ2F6eUVTRVNmcWFMcmFwd1pOcndaS0J2WHBoRy9MTG1XSVJw?=
 =?utf-8?B?bVdGYVd4NkMxcXFQU1RvdHZDU2VwNG10RjVZZ3pHN2pWSlk0Y2RJeGFzbkFO?=
 =?utf-8?B?amZmZTV4dFRmS1JadEFhR0VDOG1QWmxtOUtLQ2VVMVY2Q0s1aUtWOXRQUjFG?=
 =?utf-8?B?SWNBbFhNV2NDNjR3S1JSb1B5SWV5d3FCTnFHQ2xXOVZ2NHh3TEdzRXZEckpq?=
 =?utf-8?B?MnBRR1dHWUxmMkFPNk1GQlpScFZkbGtXSGc5OGx6R0NJdUV4aEgyTjhpalFJ?=
 =?utf-8?B?TFhzZW5QZEpBdlZNYlFwdnl0UTkxclN6RXhudG1xcTVnV1dSR0M1V3EzNXFa?=
 =?utf-8?B?amtBUjIzbzE3Tlg3bzhsVHV0UkF2V25KVFIybVJoKzF2anpBYU9jQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d1fb2e-b4e6-4c5f-d603-08de7a042170
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:38:49.5400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuNxWUF2qlPOak7o0fUdxf3j29TJ07GxQSaXwfSZhAAyJ6Z3eaTLR6F5SUfi19M2N2p1E6ADJNh0/LMG8rtPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6354
X-Rspamd-Queue-Id: 0543F202F1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:01:45AM +0100, Jan Beulich wrote:
> Using plain (signed) int variables as array indexes can be unhelpful on at
> least x86, where the compiler may see the need to insert sign-extension
> insns (strictly speaking it should be able to avoid that when the loop
> continuation condition says >= 0, but that's not generally the case even
> with gcc15).
> 
> Observed effects with gcc15 (will of course vary with compiler version and
> level of optimization):
> - on x86, one less preserved register in use, yet due to sub-optimal
>   choice of register variables still a small code size increase (%r12
>   isn't a good choice when it's used for base-without-index addressing, as
>   it requires a SIB byte which other registers wouldn't require),
> - on Arm64 code size decreases, albeit that's eaten up by padding which is
>   being inserted ahead of a few labels,
> - on Arm32 code size increases for a reason I didn't fully understand (my
>   ability to read Arm assembly is still somewhat limited).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
>  {
>      struct domain *d = container_of(head, struct domain, rcu);
>      struct vcpu *v;
> -    int i;
> +    unsigned int i;
>  
>      /*
>       * Flush all state for the vCPU previously having run on the current CPU.
> @@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
>       */
>      sync_local_execstate();
>  
> -    for ( i = d->max_vcpus - 1; i >= 0; i-- )
> +    for ( i = d->max_vcpus; i-- > 0; )

Is there any reason we need to do those loops backwards?

I would rather do:

for ( i = 0; i < d->max_vcpus; i++ )

?

Thanks, Roger.

