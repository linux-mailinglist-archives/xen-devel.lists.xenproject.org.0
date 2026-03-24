Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP2uLsKIwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:51:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A37308AA4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260752.1553961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51DT-00044Z-DZ; Tue, 24 Mar 2026 12:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260752.1553961; Tue, 24 Mar 2026 12:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51DT-000423-Aa; Tue, 24 Mar 2026 12:50:39 +0000
Received: by outflank-mailman (input) for mailman id 1260752;
 Tue, 24 Mar 2026 12:50:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w51DR-00041x-Ou
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:50:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51DR-0016n4-1K
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:50:37 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2888a-bab6-0a2a0a5309dd-0a2a4507e84c-34
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:50:36 +0100
Received: from [40.107.209.4]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2889a-fd74-0a2a45070019-286bd104bc5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:50:36 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7318.namprd03.prod.outlook.com (2603:10b6:806:395::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:50:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:50:19 +0000
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
 b=Vp6VTSAL0xbGOQvfSeA/3iupGzWES+QLMF1xGkiuNTPVcrMH2cPxWsOvN70w2qwMueTepOwCDU/5gENtsOV1PyH5QBL0yeu/DP72deeI4UnFmh8RLTmBpg7urtLHyu4eq2yyVZ/3ZB5nahJ2ZseOmXYHVbjiTI49hteDmPwECljcaCrn4U6Dkkgll/h9GLLlP5fdkVRzY1lpxa0w4RbTlPU4+dQPHmPR3vKsqrad3Xg07V8QREwS0/dz1Ir79YxczJKnG3tkyIUsJn0TQps+g3ixMUqocMOttXX6VC0ZvopGhGyBGSjAn6nCop12FN2mWU3s22IPOuNmast72KPbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=titZYvq9gVWep25ap3pPF9wgZy59OhvNTTW1t1nOmiA=;
 b=rk4bw486wCZGhWYNQzRYj619YlFGfGG+knDXgEuIEpIJOaRsN29obDVRp3zeNx4KRCN15Uau3WhUjQuYK5BJig7mx7RR78mAJQihGy6/7F5oc+e5tdkaRf3KUsJvUcyTBrLS0fkz/B46VrGE1vfskoMycrSmPq3UVEPKlJyXZSTuDDlJ/AWvzOydytY1RHZ0JiAl0sJlxpsMpgfXWvdrjW7eqUWjw6hgwx8Yy7hyIRXMsHs5qujRH++WQziSqcgqmKZCyLKWB3DGU7XcLL2bAcbGf2fBYEJZr1nBTlvsF+EsZfw4sXU/CJTH94ZG0ojAP7J7wr5nZA3sOQaml8056A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=titZYvq9gVWep25ap3pPF9wgZy59OhvNTTW1t1nOmiA=;
 b=zctObK2PTsSC2KeQAwGtf7ETwDM0ndHc6ZISaHtDGyemB6lFtgLMldI613BAslFKBDzxsWPwLIkKLEFzbWk2p4Mi2e5Q9jrT2yl6wFWjZHD+0DZIYgYr45FH9fh9BFbHp2l2OzB4HzY+MoT/YNGgm3rQ0xf/u+y8UaxLox7YRCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c64e93e-cade-4c25-b8e8-cd23028628e4@citrix.com>
Date: Tue, 24 Mar 2026 12:50:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] x86/kexec: Stop hooking NMIs with trap_nop()
To: Jan Beulich <jbeulich@suse.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-2-andrew.cooper3@citrix.com>
 <c2129389-cc61-44bd-a680-c75b05725749@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c2129389-cc61-44bd-a680-c75b05725749@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dc0659-b5c3-4edb-1803-08de89a3e7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	EgYMWE1iqrkjo6NWT2qo4YncyVoDR89D1P4yMU071PlZTXnUCP8dCBeycT+l546q6x6OeQ1Ink+ljBRdy5w/NkHXDpBAM5UjlPkG1CFZ1oqLSoT0H/+Z19TPR5GwNgzohA2xOqw/8wsPbTldHpXic1wqCegIKQiAMiMQOswFCf+UO8/gqFpkt70WhM78o1sNKKH09u4TyJnZ4Up5oghxVlzJ/+vf5PqqAPnMJgjwMrcbQPo9rRu/e/Mgi10RGDFUeDBpNTDpIAQp2TQxDsdj/2C01Eh9fGKv0rPQQzgC6i87m/qD9dOFTUdOrFJm3AGFvJ7UfB0AdzvudpcM2SyoseRbhZVxkvZFQZE90h/ztLvab7KwhHqTiXEDIxn2nF8Kg7MicLTl1egB9AetPK9lKazPPKlVLHRe5EB9HNjkTXJ0PNxv01McehHgwB/bSXn2LwXp6rahB4dCZ5MQUFxPrcq01Ut1INQhkQUkOGUg4a7Q6RPi0qPTHY/vTQVekMGL1fDL8ov8TNs3o2rWqMKw2m0q1Ucf5EEkgxQs7BTFUhmaD2SDz6Rlp0wbZb3i7CxiIlZ7MTaYUWYDhCQ40GXlMQX/AQDe9csfsmyrRItRieTK6R6czXQFsOh4uhGNDb6RoHOp+DZ7TUepv05CMVeszFrOJf736w15NjhVh5zQXuPtY3A1YDNzWzmAO274Pp6tZ9KdkDGds8Nns5sz8GtHfHgGe5Fu2BUmt7bwn2T4zLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlWRDZaNFg3OVJIbUFZQnh5Y04ybklLNHJ1UmRxTnpqZW1mYnlhY0VtNVdu?=
 =?utf-8?B?U2NXRUxuMXJrR29UdDZ6a3QwSU5OZkF5NmxnNkVVMm9KYXhTUmVFT1dwWU9r?=
 =?utf-8?B?QjYzUWdMUE5RK25EeTc1TXNXejhzRjIrTUFGQzVPYm5obzhXWUlCT2VrT0w2?=
 =?utf-8?B?OHd4SHdQZVdyTTBwcEVlbzJIV1UwZUtCdGI0VHdzL09wUmVSMmZyUUJzdzlG?=
 =?utf-8?B?YS95ZFFnSFc0bjhibXVENm51NVRmVTNoeXlwS1BoZDM1Szhsd0VSckNZUEFE?=
 =?utf-8?B?eFhHVHpicmV3YVF2WVNiNHAwZzJ1RlRDeVgxQTFVUG5PNzZNNDRGR3dzMElB?=
 =?utf-8?B?L3ZrSFlrNnpDQkZLRCs2YTllM0VBcGdHN1REbzlQOFdEYzRDUWpQclhXS3BI?=
 =?utf-8?B?T2lmeFZTa3Y2a3BWZDB4alo0ZE42RG1hZTEwQzVEbm9iK2dQSkNRWlBJdEpm?=
 =?utf-8?B?WmRaQlhXSHJUNkpPQzgwZThYckhsa3ZJUzF6M0RabXVGZVU2Mmdlb3lKeUtS?=
 =?utf-8?B?dFkwQ2o4ZkVGNnRzdjl5ZzY3T0tqV28rVS83ZTlIV0twbUhEcnlBVzdOelVT?=
 =?utf-8?B?bHNQVitDVGRWRjMvdjc2MWRIaXBqT1pPd0RiZDY0WS9EK2dWdk5ITVlWVXVT?=
 =?utf-8?B?T2tuc3RYb3VXWkZRa25NOXc0NHBSaVplL2NZQUZLN0dEeVd1U2FTOUdmYksw?=
 =?utf-8?B?OTFwakdRQmswWWFaTG1NcStFallqbkovMFEwSVVqVWw0dG5OWGpxUW1ubDJY?=
 =?utf-8?B?ZVZWOWlrZjk3RkRtQUd4MEZSRnB3ZzZqWC9EelBMR1FRZXd1eHhmODJwaDV4?=
 =?utf-8?B?NVJIVDFzU0VvVWo1ZmpYWkN2alk0WGtSbG05SktMUDRCbjN6c0NHOUdZaFJZ?=
 =?utf-8?B?d1Jla1ZXZUhRTzdSekNRd1J3WEdXdzlFaVNWYnBSTkJ1VGRTeVgrOHpCdWxU?=
 =?utf-8?B?cUxWcTk2eGVmMlhSZStQY2lZVWNSTSszUmFlb25HNFozN2JsRGl4VmlMMkxk?=
 =?utf-8?B?Wmx0VWFmTXdyMWFTZDRpY1ArdXZ5QUtIa2IvMnQzSGZsWnpRQ2dzYnFwMXZG?=
 =?utf-8?B?QlUxZVp4T1BXUGMvdVRmdzFWeVNBNjJrdmhWQjZkNUUxUkZxanYrbmFVeUxV?=
 =?utf-8?B?ZXIrYTYyWnE0NkdVSGMyOHAzUXowWGJ0ZEJHQmpnY3FxMW1SRmtjeFEwdThW?=
 =?utf-8?B?dVRLREVkYWJ2SWpCS3R0WEgxSGRhNC91OU9sTWg1ZCtRYnlEcllpWUhrNm9h?=
 =?utf-8?B?R2tMRlVLQVVGbGNvMFNNc1lLelFzemgwZUlycG41bmtHVnpYS1BzOTZtaE1U?=
 =?utf-8?B?bEF2bnkyUk13SU5TMWRnblA5SzJNVytiTERYYVhkNjhKbXVLbTg2cnB2Q1lC?=
 =?utf-8?B?TjhteGFWcldQNkNlRVVjZi84eVU3N2Z6VmZJOVBvaHJpZi90OXZXWUFXNjFk?=
 =?utf-8?B?QUh1MjNJRTJ5RXJYNmxLQmVSOWVlVDh4NXovbVVzanU5Q0hPRzRkelJTcTJJ?=
 =?utf-8?B?UzJIYVVsUUE3eHN5VzJJVTN6V0hoekkwNHlKMU9hRXFRN2pFeDgxbDVrWkJ5?=
 =?utf-8?B?eFI4czVsZzVna1h3M0VubzRCdHc1ZE8yZDZRSWpoSnF6YnA5aDQwaWIwNkJQ?=
 =?utf-8?B?VElQWWVUKzg0cTVyNE0ybjJSOWVlZGVjaTZ0M0ZCZGJ3Yi9JUzNSMFp3WERq?=
 =?utf-8?B?ZXQ1OFdwRUVHbEV1TXVYQlp1L3VRRllackdCeU8vaTZQWVhob2p4UVptVWYz?=
 =?utf-8?B?M1htM01YNUxuNkhTN0c2WDgwdlpwSzNVRVJWTjNnZWd4NkRadFI3aDhrSnMx?=
 =?utf-8?B?MTlJc3RHaHlQSkFWRnVVbk5QbEFrYlN2VWVMR3N5YW1EMjNZeWdwK3pwck5J?=
 =?utf-8?B?VE5Wd0VSQWhDcHdsaklWZXNQTmEvRjB6d0ZsdC9mTTJYUWJnUmhhOFFIOHY2?=
 =?utf-8?B?UjF3enZMQ09aZE5DT2ViNjdoQktmb1NwaVA0ZEY2Mis0bEswZnhLQXNoZ3NC?=
 =?utf-8?B?SzZhbVBoL1FFd0Y0eElCYUhwZjkyaVo5V01HYXBCdmlXU3grMytzQ09GTWR0?=
 =?utf-8?B?VUpjZzh0UTdaQU1namtFMDE5bTkrMXlDc1NrY09XYmYwWVV0ZEh6Ykg4STRy?=
 =?utf-8?B?MDNoYkJEekJCYVlPem1KYVRWUFNNZ005SUlmbCtRY2x0ZXdFZkpkN1VnYy8w?=
 =?utf-8?B?aWlxeXQ1VklGQm01c1N1eWdFRmhJZW5uUEVXaTFnQTlrK2RwdFJTOTU0dXl4?=
 =?utf-8?B?WEZaSnZtOC95eU1NTFEza1MrWVo2QXlyVkJoYS9BK0NTSCtRelJubFpNNVR1?=
 =?utf-8?B?cHZ5YWx0dEF6V0RaVHI0Wmt1M1E1Y2U5bkdDY2RLYzNYYzl0dzVIdFBvbTR2?=
 =?utf-8?Q?avDLnvQ9asywEZ/I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dc0659-b5c3-4edb-1803-08de89a3e7cf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:50:19.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/BWuPWXfNqkYgOmm4LkXEYaHTuAxbBs0PnvTptEdAh8LqDq8S3mIjOG+GdDdXNKog1yPQtAZ4FLZxQ80BFCqRdJ3OwDfGRvQZt0MZ3bjoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7318
X-purgate-ID: tlsNG-ef75cf/1774356636-4E4AE303-1CD0870D/0/0
X-purgate-type: clean
X-purgate-size: 2150
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 33A37308AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 11:52 am, Jan Beulich wrote:
> On 19.03.2026 13:25, Andrew Cooper wrote:
>> When FRED is active, it is not possible to hook NMIs like this.
>>
>> NMI hooking in the crash path has undergone several revisions since its
>> introduction.  Notably since commit e7f147bf4ac7 ("x86/crash: Drop manual
>> hooking of exception_table[]") we use the regular nmi_callback()
>> infrastructure.
>>
>> Instead of asserting that we don't enter do_nmi_crash() on the crashing CPU,
>> tolerate it and return early.  It's a marginally longer codepath but behaves
>> the same and is compatible with FRED.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> The other use of hooking the NMI handler like this is in play_dead() and
>> introduced by commit 73cb1383bf8d ("x86/idle: re-arrange dead-idle
>> handling").  It's unsafe, and the commit even mentions so for #MC.
> Why is wiring to trap_nop() unsafe?

I meant unsafe in FRED for the same reason; trap_nop() doesn't make the
NMI path safe.

> For FRED, shouldn't do_nmi() then gain a similar early exit for offlined
> CPUs, replacing the IDT editing?

That's not really good enough in FRED.  For starters it doesn't cover
entry_from_{pv,xen}().

e.g. I've discovered (the hard way) the problems of putting printk()
ahead of NMI dispatch when testing NMIs.

And there's still an open question about #MC in both modes.

>
>> On x86, we simply cannot free the per-cpu block for any CPU that hasn't been
>> put back into the wait-for-SIPI state.
> Please remind me, is there a reason we can't put CPUs we have offlined (not
> parked) into that state?

INIT clears CR4.MCE.  Any multi-target #MC (even non-fully-broadcast
ones) which includes this CPU escalates to SHUTDOWN.

Also if you INIT any CPU the system doesn't like, you get SHUTDOWN too. 
Doing this to CPU0 is guaranteed to SHUTDOWN.

One fun issue I found doing the AMD Entrysign work was that firmware no
longer hands over to the OS with the APs in the Wait-for-SIPI state;
they're typically handed over in Mwait.

~Andrew

