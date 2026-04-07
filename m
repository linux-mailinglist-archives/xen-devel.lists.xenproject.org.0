Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM1wHqfW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:04:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148583AC7C5
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274788.1560788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3I7-0001H1-6d; Tue, 07 Apr 2026 10:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274788.1560788; Tue, 07 Apr 2026 10:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3I7-0001E6-3M; Tue, 07 Apr 2026 10:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1274788;
 Tue, 07 Apr 2026 10:04:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA3I5-0001DK-OD
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:04:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3I5-001ACJ-3f
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:04:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d697-2eae-0a2a0a5409dd-0a2a4505d2a0-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:04:13 +0200
Received: from [52.101.48.15]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d69a-3760-0a2a45050019-3465300f749a-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:04:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7133.namprd03.prod.outlook.com (2603:10b6:510:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 10:04:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:04:03 +0000
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
 b=fJi44973kh7rni6tp+NpNZJmWkx0Vxw+LMLUqDdnrB1rAmPT6oVmjO+Vy4T3rvn90NA5ZoiimTORLXJgbdrJpvAJZxXH4dnBqel9QQZkLaF5/gSxvan0KK4Hr/jfjadrU1V7CcagDmfrFJ4/mO6QqmeEPI+M+/SVQpFNxOKAm2gUQhsusLY/3OYCfDC7a0R6Z/tomi84kWdwdF93pXAxLYi/1wXmzjUH7teZwVifS5OKAAJsq5rsXMTkQDYUp7oK8+zonazUokUD8DabOCGnOroqlMldVO9c/g8f/xF8EYtucl4Jsdgnc2pYeAEDDgSANQDr0YdoaK/1cME1Nwb4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7T8hHk1Lbv1tOM0HJV8Q4BYS1ZDiC5/oa/yiFSRvxk=;
 b=FiqWJ+O1pvcgrsFU7wI90VLC2VyOeSn9MyWEBZUGquQRsxgdXTAlI6CWuBLgAA+VypjXcK6DvD6DXoaj4jcy6h3WBaaESU8sjCeDxVPSh/w+PlSNxOrA5bJWidr+IhyW7jZVTIFFd03sWvhC78KmyOUZ795QysKKKZsSurdhnatA/EMCDuICVbF7g66YrJDjB/Uk6ArCit0/PA5LJtQi3C3z5hmG+0Wgnp/WdAwh6EXQCQjbD7eq+5bIryS9CErC9GFeuQAK6g2tHjjwvZEMsDyUDofC81q2TFDhCip+LEMFh0ltRWyj9klXiLhiGkwyezt0806IWczzQmgQjnNGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7T8hHk1Lbv1tOM0HJV8Q4BYS1ZDiC5/oa/yiFSRvxk=;
 b=RSr0DYKq4bTXSDR1ohKhxyzZO5p7Ts7mvlJTw692fN36QHUrXYHEshmhSSksCchNpPBXnef18wsP2k/uwPN2T5cJVNwLwp1KUmmaedYOg32Vehd31AQughtXY59EMV08tBe42zo3WryZaHnNG+IisOBsSDAoYKAsxoEVHHKjfMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <89973687-51e2-4ea7-bb8a-091d3b811942@citrix.com>
Date: Tue, 7 Apr 2026 11:03:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 5/5] video/vesa: harden font height parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <5e8b4faa-5540-4406-8706-d546e3d2c46b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5e8b4faa-5540-4406-8706-d546e3d2c46b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0495.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 1013cccc-ef2b-415f-fbf6-08de948cff72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tCtvYOLfI8osyxc9YRo7ikcT+8C1/K5GdWcBHti3y3NpPuQckLhhNmQ3gKHsGiHyhARCtnF7lWpO67Ljt46nW9XnVyrZzrzjZ8NrDRNuNJ5OljBcKU3IskOkZnftLcP8tOMqQ7Drx8h8d1Vlt1/wWld3r6xgQQSngwXX8Bixum2R7tnHdKqkOCbdjHNVUuY9w2GDIWpHEXDJkU8SMhUmQFz2JGqY2RMMn+iQoB0xzSLY9G2SfetxjpmddTBQ0J1SX53aY3BrMv6lz2eoxOAoridpsfJUmMziBfZYQXFZiBtxkWwaVnTAzU/1ygebIN/XnER3pF6BdLKl6mAuhDIrr/Dk8PeY6YrPLPS6v0ZQVPER5+PJClc2RdOR5Ujh+KK3zB1N2dinDVVeH2zq3u6wOv0enUtBlTpc+zzfmIB15UREl+TIazeodlb6kANdxbiVMN7n7YGWLrKLHIZuGaY0is9Bg6Z2mtG6USmaL/tHJcJNTDtw75lrYVP03e4cRSlqjBD7wPRDH5v1Z4z5f5rNxfDG9+iNZqvRecujLZYJsg4O2hlQ5aS+BcqEvex72dMv/WdtjiNkVV7lTtLnfNZudWMjEvLAxdeA6gOLWErYKYCXAmD6G0E2QLzlv4YNcJ8Fi9LXOUcekmKT/biL2MQoTByHJOeN1fuverJxv5me7AuUSb16t/AgMqwfk1rAoWVQMxhKom13JAQPU+OHJoRKjM6JZVn/NwOPvF1Vgp1KNbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRUTDFhRTd4M1BrTTFnYXZxZDZ2YUlqREZQa2R2dmREMlFmTVBXMFZiRlBT?=
 =?utf-8?B?c212bWxBK0NFT29uZzR5VXNFdWdtSWZSeVBDc2IyQllpbjFWNGFMd3JEaWgz?=
 =?utf-8?B?b0thUXFqbG4vQ05ZTGhnVFZkVHZ0NjdLRjVJZmg5ZWJLbTlUTjJYMzFFT1dw?=
 =?utf-8?B?TGZWb2hpWU5lVUgyM1JNbGwwNWxGampCN1RMRjc2OVZRNkJOUEZqYmROVnNJ?=
 =?utf-8?B?NEcxRWU4eUJZT0w1UEtSTTVNL1JJSzhVMnJKeU5oU3Q1WWVYbEEwWXN2cm9v?=
 =?utf-8?B?czNmSlFZTFh4TjFkbjRPWFZkb0U3anV2SkRtOThMbTkzTTZZWDREQ00ydmpR?=
 =?utf-8?B?ODUwK1IvRXRabHBYVFlqSGd6Z0lieGJZbWU2dURTSnk0Q2c4MkF4dDBNVFdI?=
 =?utf-8?B?SUJWQUF5V1kyK3Z2RzVWSUh1cWIySUswRkdHdXAvTVdZSGM4bDlIa2lLb2lX?=
 =?utf-8?B?TDJuc0V6S3hlMEFjNjRicmxIS2RCanl3YVZGMXRwTm40dktqTGp6eFIybGlh?=
 =?utf-8?B?NWVYYlNoYllCM3RxOTAvSmFjWVNRMWxqUXp0eS9qb2Vic1ZPdkErKzVPeVdq?=
 =?utf-8?B?ZVNlRkZlbGlpTkNWcFFrcG9LTGNDTTExc2o0dlZqL2cvWFRsT3A4Rlh3cnk2?=
 =?utf-8?B?eWlIb0FkOEprRTZuRW95UXB2bVZJN01nbkNTVGpLZS9SN3BSK1NlV0t0VlhP?=
 =?utf-8?B?bDlEQ2FKdXZuNzlXYlIvRmRpMUhHdHc4bWkrMFRqYXZIZ0wrU0tSblg4bzNk?=
 =?utf-8?B?SlluNXQwSXIzR0NGRmNsQkw1N3dwa1hwT2Y4QjNBNDJlWnp2QmlZRjN0ejFq?=
 =?utf-8?B?bDE4Y3BvODh4MnhTYjkyMFR5VTJBSGpCdWVydUFTemtQeVdyNlFjeHBaWTIv?=
 =?utf-8?B?WHp0alcwWCtOOEd0Q0ZTVG9WK0tJRURETkl5VGs4NHJweHFPZXRkRVBCdzI2?=
 =?utf-8?B?VXlmS21sRXBtdU0yZ0tOVzZidjJ5K2w3ajY1SkN6a05EcVp6YUlNVG9PcUJh?=
 =?utf-8?B?bm00STF0aGpjQUR1M0cvOUVmZzh6Y0JUVWJ1U2xBY2IxclZqY2Y2anZYNEo0?=
 =?utf-8?B?ZUpMM0ZJMWNxWkdabEp5eW9ON0xRbnczWTlVUmN4dXU2UkJRcEtDRXMwNTFY?=
 =?utf-8?B?by9HdDA3bTRkSXAzc0VoR0dVR01nQTBQUDRValJjWHViZ0NvSXVGMUxNSXdk?=
 =?utf-8?B?aWR6dVdRbVB0UEgvR1ZaNnpGb2VMSUJpTmNwb2h4T2ZLUEN1RU5CeERyRTRC?=
 =?utf-8?B?Zm9ha2pFZXU0TFlzbEgwSG9zSURXRzJyNHY1YSttMGl4aW4veHZWY1ZQdDZq?=
 =?utf-8?B?c1gxRjNvK2V2bGZqUTJvQ2ZnMjBzYmpHenpwSHp0NWU4OWFvenI0Qnd6a0px?=
 =?utf-8?B?ZG5PVkJ0R0dQN01RbXZJZTQzbUl2SFRDV1JxL1R4RFphVmNSWnBaZHduaEJP?=
 =?utf-8?B?Tk1zbHNkajdmWllJb3owR0d4bmVzVS93ZlltanFlSk9UcnRYMkNUT3hROE5q?=
 =?utf-8?B?MFk1UXJQMFEyL0xIQXh0UzFXYTdQVjREczBtclNtWDRVRy9GdlA2QW9XN00r?=
 =?utf-8?B?a2pxYlRkMGZZbU9abzVLaE9iK0ZjREtFSW14ZnA1TEc1blZUd2cwSUxFdEpB?=
 =?utf-8?B?dmZGQTMxejJrNkhKWU15MU1qRFhoRDV1MEZWK0x4cVNoQTBMYjBJODRTdEt2?=
 =?utf-8?B?a0lkYnpka1ZZbzZXbGxVZU81RHJLZi9SaHRhcnRwOENvbjJIZ0w5eWswWE5W?=
 =?utf-8?B?RHBoWThrM0ExS1ZuZVRsd0Q0V2FzbXdMaSs3TE1paXN3TUZZaWl5b1JST1Ja?=
 =?utf-8?B?VmVPakFUeHR5RGlKSG9CbHVMbzhPbjk5aGRhTTZWSVRFKzhQWmRZU296MHpv?=
 =?utf-8?B?UjY2Y1lsaU81cUNRV2V5Sk9MSkZxV3FhUlhpeVN6NmtGVEFZT1UwOHI4aFAw?=
 =?utf-8?B?SnJoVEVFM2Z3aW9hbXJmaGF5SUpjbFljdm0zclRBTHhkWXpZdHhNSGNScEpN?=
 =?utf-8?B?aTdLZStDVTR1Um0xMGo4RjYxN1hicGwvM05iYXhoY2xFdk5oU1BoMTZuaHpy?=
 =?utf-8?B?TlAwM1AzZUZzeUxqbWdQMWtpeFQ0NFNKYXkvTmNOcU1hR1Jwc0lDUTVXYURL?=
 =?utf-8?B?eno2Y3FqSXJiZ3pZUUI5NGp0a2J5elkxUHF2SU1iWmxxOGc4dGU3b2ExNUlT?=
 =?utf-8?B?WGFuZFlYTXU1RUhsN2w4czBia3dpZVFzelpid0dZYk9ta1l3ekxtSHJCVXdm?=
 =?utf-8?B?UC93QWR0WjdGU0Y4VjJrQW4rWWd6d0ExRHJHRkdXR0NEc1BaUDBxQVVNYmV4?=
 =?utf-8?B?U3Y1QUh3ejdWZnZUSGVhWitBU0JZL2Zkb1MyeS9MaDdvT1VwejZxZFdueFJs?=
 =?utf-8?Q?YA58Rr+urvn7RJ2Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1013cccc-ef2b-415f-fbf6-08de948cff72
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:04:03.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyzO77qihcbYjCo5U8IZnQ7BWouqLgYW1VGnFSaSxO6/u7u2hRmW6nLhHH0vR1VImelJFI4nPBQHwIFFKgfnBP92ZkBHLJ/ArLQoIiRXG24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7133
X-purgate-ID: tlsNG-c201ff/1775556253-3372A96F-449B13E3/0/0
X-purgate-type: clean
X-purgate-size: 399
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 148583AC7C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:39 pm, Jan Beulich wrote:
> We should not prematurely increment the pointer, to avoid inadvertently
> skipping the NUL terminator.
>
> Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

