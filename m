Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QINCDsfQ/GlhTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 19:49:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316F4ED112
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 19:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302952.1576591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL2qW-0004oI-HT; Thu, 07 May 2026 17:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302952.1576591; Thu, 07 May 2026 17:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL2qW-0004lJ-Ed; Thu, 07 May 2026 17:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1302952;
 Thu, 07 May 2026 17:49:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wL2qU-0004lC-NH
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 17:49:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL2qT-002uOe-MO
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 19:49:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fcd092-5cb7-0a2a0a5109dd-0a2a4502a070-2
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 19:49:09 +0200
Received: from [52.101.48.26]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fcd093-af86-0a2a45020019-3465301a1fa3-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 19:49:09 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5993.namprd03.prod.outlook.com (2603:10b6:408:132::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 17:49:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 17:49:04 +0000
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
 b=mnrWmWKpdq2TaZqEOkxs4H4xAse3jsSZnaST0CuQIHhCzL9u2svL63MBqXLJX0oiDLZ/dvji295/Cn2rugksZOkEo0ahVW1s0KRtfft5y5DFTST2IXCxFze5mmNwe3dwPjCgiFTxwczNeMozISO8fPtT9z6isPRhWk7bGyu0mkb/Y6bDEtS0gjoivVTBDPuCH/mGNkhgOSFXsV7qqKKBkFQjnSXzgnlRYov2Rx8Zb/DUbd2U+dO1k4RKOEdUeEVPy4TImCDCG1vaop5gcMgQpYHmyG7N7Rc4x+Zwal/4DycMSx0UUGL02qlnNd4o9MzyGl8fh5wy00HF57ZZIqBApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUJvHswL5hC4I7JHD2mznkJvtFeBJW0YB2Q4+MCApFk=;
 b=pj+EF7mLbQ8PypVCeRdBbEN7H4CAH9wiecfolG+wDrAxUU7W059q348cfIkZkG00OzO712Vhiu4g2c1u6g4Hbf1K/pf4tLvJyDR3kfKE/JjFe9Ci4alVh/eWuxWVs/qML78xNFA+OJzlR9HwhuXYVcHSQHduMyi3A5MOJg5k2sfTaQvVPKm3sb2awcaGwWtfNJOEAzMyjc9YXrfHKfsrTdD8pYWeuMaLK6vtJ4p7iPhuba0TBjSmh8qYfurx+Yi3eUNEgBNFhuLeCyQCWazr1fnYe6sOBqBTC2Fyy43iYRgTwEg9qAsri/S4jplEUx2KwXHIvSn/7ebPFK96QugQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUJvHswL5hC4I7JHD2mznkJvtFeBJW0YB2Q4+MCApFk=;
 b=vypwg5IWg6jFmbsf65bWsbsYqSSzKCBsWEuRZGqR11r+d1c3Vs/C+tNDZ4DC9R8AJv4ir+0y0owugeTj882KrhFZufloCPR8Xt0hXTpH45ixNshlCiR8nh1wyzeSxMT3IbQRCJ9Au97dXxzXvObBsgkiKTldnz4VK0E1uwagTak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d7e4d96a-ae5c-4438-9481-09ca1aa50402@citrix.com>
Date: Thu, 7 May 2026 18:49:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
Subject: Re: [PATCH] gnttab: simplify (replace) gnttab_set_frame_gfn()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c4ceaab7-3d5d-4923-bc27-f67d1510048c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c4ceaab7-3d5d-4923-bc27-f67d1510048c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: f46dc663-593c-460b-c6db-08deac60ee1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	/oP79IzgeNAQtGO0O6kFHrl0qXpAfcNdSWREND82cLG6FE7Vfs20pq8sN3y5BW+gokci/DtyC3nBXqzYv/t2sKZpfijSDVTILBOExkI/dRsZwrJZTlu7byEHRbnwYObQ47Ew093T5LnbcNVa3zIr5zFVJnogzYUhqphUWSzrZpoBCSojlU6j6UlCbPmQaew8GhNW//WDXAd7u96cE59ojf2Sjll9RN9vgeo636/2qEnI78ard/YH/IOsfVtFFqYzFXoNpqyKeyTmsn+dDAcJo2FJN3yR22VrTTR2B3+6YmVKfclhrnESuMhD1HdMA7DL/pGzexkZoVbnPi95gYm02qWbO5V1RBTpl862ABmDuXIywFj1odwrxKZyBDfHNXxC2KG//pLNeIaR8mkW4nZdUM0FOngP48DNNJrKoc0dNu9ZHlmXae20Q9PvzVqLR4hhyz1ig5bd1iasgMyhwJtYkmOBcAG2TwMUKk4J1Fe7Ca04BqIrG0dnFAb83niaUugQAESAM1oXHJ1dlagVxOX1kzoSjqljkZ1uFxts0efoKAmrQ3Qkg0WizEHRoymbW1qZ14WWXNXrTTrVtXKqx+ENS9p1+xQVbNoQGVnBSLxV1RcXVvkB1N0TfUj/YspaDXCZAAQNkK5ZDLGxSfmENGsPJC6F5izXpkNrdieJLjJ+B13QzVka2jcROOEjaqt8DRqL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDVDYnhsTVhjamxGQmw5dmowMHUyN1lJcUJqaEdvY0dJaXZlNGQrSkRuQ3hp?=
 =?utf-8?B?c0IwQXplekxMaHlHZTg5TU8xSlE2OW5QbTdSdEJLNGhvSndMWGpSRmNSMjl1?=
 =?utf-8?B?ZWVFMkVqK2c0TXBqTmFzZS9ueDRZcE0vRGpOZ0lsRlRsV1BYQXdKK084VUVs?=
 =?utf-8?B?cEVDL0N3bEgrQW5CdnpMOXJvS1RHdTU5cWNLTnZ3Sk8zcU15VDgxTStGMnpt?=
 =?utf-8?B?aURwSkhGVHBrcTIvQTlXUTRpOVljdFVvS3B5QjZ2cTZFWXk4emN4YUhuTXk1?=
 =?utf-8?B?cGFJT2pPdU1JSld5S1BkSGZaanFuRFU4YUFhOCsrM0FnRDc4Tldpa01vQmpX?=
 =?utf-8?B?bWpGcnE2OGszUXBUcks1alVRZGFIdUMzNWN3ZkRNUTFzenhLY0plRXFZZ3Az?=
 =?utf-8?B?Uk1ySEc4MjFzQU81THg2Q0ZUWEp0T3dBZTlpa1ZqR21FUjN0TU92SlJVVW91?=
 =?utf-8?B?UXFkYWQ4dWovT3B1ZjJiZGhDUDVyOXVndEdYNDlQc2xvdnpXRE5TSGd0UXIy?=
 =?utf-8?B?Y0tCNGppSFd1aWphdERRamVoU1l6eDcxN2RZV0xjQS9NYmhNdXJPU3lDZXNB?=
 =?utf-8?B?QWtiTUJHejZtNG0xbmEzOUlzYkgzOCtaZm5xZ3Qwa1dEL3cweXR6bnVCOHZk?=
 =?utf-8?B?TWYrc1hUbGJUY2lvL1YwV1Eyb0k4YVVzazRDYm5CRU5nSkF6YnNYT09ISVZN?=
 =?utf-8?B?alUzNEF1MUNiNTcxamxybERhQ3hxWlV4S1hxRE94bkZBMCtSSnB1OWJ2YXlU?=
 =?utf-8?B?eVhMVUJvYVA4cXpBeGxzTWRXcEFnK1NHZkF3OTZjcUhBZGJqbVdnSnBMTnhx?=
 =?utf-8?B?aG12K3dNQkdJWmdlbjYyUnErSHVqYXA0V3FZc2JHNU10MnZSVmUxeDIzYTlw?=
 =?utf-8?B?U0o2NGZINEdUVUd2OVAxQmNSRE5lQjA2ZlgvenROZ1pXUVdvcjVTQXRYTnIv?=
 =?utf-8?B?WXFDOVZ5N1UrS3VFVWIyN1hITWtMWjNNSmZEak5zblVnNzk0R0xlRmhNNW52?=
 =?utf-8?B?NDlQSXZBTzFDaERwY1F2VFZ4aE1UTlJFT3dRbkZIOVlSTmxUWVRpelA3NEVK?=
 =?utf-8?B?c2E3TDlNcjVBamh3cmE0U2piNXdmaVJ5d1hnUWplMzdXT1B0WUZlV2F1Yktw?=
 =?utf-8?B?V3pVQ2JQUlg0eks5ZDdXZ2lyUlpQNlB1RDB1bjVxdVlySUZKWUkvQjdJeDV1?=
 =?utf-8?B?ZzJUVUVyZFN5U1JvN09RRVhwVk96K2tQSmhRaU9NQjRhVE1OWUQyZlNWR2Mz?=
 =?utf-8?B?eGlEN0VrRXhhZmJyUVAxQXJubkhxTkhTblJ6WitQTjFZenVsZ1RHY2x0amJ1?=
 =?utf-8?B?dlNkdEYrK1RydTV2UHhINm5DcUN2NyswekEvNkZWTVAyRjduL0Y2eFJoTEhO?=
 =?utf-8?B?VXdJNmRtZHQyVGo4THY5U1E4QWpxd2dSRW5oaXFwQ1MwK0YrZ3dNMUJ1YlFJ?=
 =?utf-8?B?WFZzZnE5VERwUzJPMzIwdGxXMml2SUhNUVdrVXJkWml5VTU5WklUS3dvSENa?=
 =?utf-8?B?R3FaSTdYbG5DcVEwWnVaM0ZDNFcySlQ2YnA1Q2ZFTkRxRlFnRWwyS293eVF1?=
 =?utf-8?B?M0hoVDZQYnBvWGsxVFRHUjlVOVozR0J0dlNlNmlSeGkyM1ZESy9ydUlSNDlk?=
 =?utf-8?B?cFI5ck11VFZsajRqOWVMelUvWUVoZ2o4SWd1N1A1TWZvcS9jakNjWmhUd3Vo?=
 =?utf-8?B?VldxSG1BTGR5dnFub1pISm13b21YOTladThnMXZXMTEvVmtGUFB3VEZlckJi?=
 =?utf-8?B?UHZMSjJMWktJd2VlcWgra21UYUwzSWhYV2hpM3BNVFFwK0E4SFJGZTlwZFkz?=
 =?utf-8?B?SVlTOHF3T2owTkgzVURvZjBQTHFwUW5JMlRzR0ZyR2wyRyswODVhaGx5Witm?=
 =?utf-8?B?dHpYVmx2cVdxaUR3aGxSMmdZOGVqOTluNlM2M3A0QzVBc2VkMy84cFRFeFRE?=
 =?utf-8?B?Z3QraFQ4cExDakZrNHpjNFI0eDIxOHNKamp5REtiVnlOTFJBbUVXQ3VIbHFV?=
 =?utf-8?B?Q21SYUMxbmNzcXBnZTVpTXNjTVJ0Rm5MdXhlNUtqTTBQUm01WHdJbENtcGg3?=
 =?utf-8?B?R0kvTWsxSXNDZTBzKzlrN1ppYTF1WC9XaGRSSzlMYldXVlVHUkx1SjQ4NWM2?=
 =?utf-8?B?RjdZYXBFTE9LbDBnMUZzdWhPbExrRGlNTnlNMDFibmhNcTZ1TmdyNWN1OWpB?=
 =?utf-8?B?aXZteERVZVpoUlhBNU1vUGJNdkVmenMwNlU3KzAwSjNQUjFlYnFoZG9SVE9y?=
 =?utf-8?B?WjlHdTJMZWlsU2ZnTFQ3WVUxQ216eUR1WXJNMDZHajV6d3Q3bUFockZhU1Bi?=
 =?utf-8?B?ZzlObWJGZFNzdkIxYWtZZ2ZYZU9La1pSd2pFUjREdUgxT2pQTHFkOXV2c2pZ?=
 =?utf-8?Q?AO97vyuPa8QS1Akw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46dc663-593c-460b-c6db-08deac60ee1d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:49:04.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPeZ0Rbz4/4lO6X9XvQFiGdCuwi/TF+UzL+58NJADwjiMPTbq/nV+ZcVEKFghsdE1/YuWVx3td1gDmWMqnCNPEtiG+p9wI1s1Bv+baIb2k8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5993
X-purgate-ID: tlsNG-720697/1778176149-A917D161-CBF6F856/0/0
X-purgate-type: clean
X-purgate-size: 3998
X-Rspamd-Queue-Id: 8316F4ED112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,7bulls.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07/05/2026 12:41 pm, Jan Beulich wrote:
> It's not really doing anything for valid GFNs, which renders its one use
> site pretty pointless. The other isn't so much about setting anything, but
> rather about clearing. Rename the macro accordingly.
>
> The main point here, however, is about Rafal spotting the double
> fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
> again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
> in the already fetched GFN, while dropping the no longer used parameters.
>
> Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Do we even need the hook anymore? It has been expanding the same for Arm
> and x86.

At this point, I'd say no.

The macro has changed contents several times since it's introduction. 
The grant table macros especially demonstrate how poor the common/arch
interfaces are.


>
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -50,12 +50,8 @@ int replace_grant_host_mapping(uint64_t
>  #define gnttab_dom0_frames()                                             \
>      min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
>  
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> -    (gfn_eq(gfn, INVALID_GFN)                                            \
> -     ? guest_physmap_remove_page((gt)->domain,                           \
> -                                 gnttab_get_frame_gfn(gt, st, idx),      \
> -                                 mfn, 0)                                 \
> -     : 0)
> +#define gnttab_clear_frame_gfn(gt, gfn, mfn)                             \
> +    guest_physmap_remove_page((gt)->domain, gfn, mfn, 0)
>  
>  #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>     (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
> --- a/xen/arch/x86/include/asm/grant_table.h
> +++ b/xen/arch/x86/include/asm/grant_table.h
> @@ -32,12 +32,8 @@ static inline int replace_grant_host_map
>      return replace_grant_pv_mapping(addr, frame, new_addr, flags);
>  }
>  
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> -    (gfn_eq(gfn, INVALID_GFN)                                            \
> -     ? guest_physmap_remove_page((gt)->domain,                           \
> -                                 gnttab_get_frame_gfn(gt, st, idx),      \
> -                                 mfn, 0)                                 \
> -     : 0 /* Handled in add_to_physmap_one(). */)
> +#define gnttab_clear_frame_gfn(gt, gfn, mfn)                             \
> +    guest_physmap_remove_page((gt)->domain, gfn, mfn, 0)
>  #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>      mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
>                        : gnttab_shared_mfn(gt, idx);                      \
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1844,8 +1844,7 @@ gnttab_unpopulate_status_frames(struct d
>          {
>              int rc = gfn_eq(gfn, INVALID_GFN)
>                       ? 0
> -                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
> -                                            page_to_mfn(pg));
> +                     : gnttab_clear_frame_gfn(gt, gfn, page_to_mfn(pg));
>  

This is just a more complex way of writing

    if ( !gfn_eq(gfn, INVALID_GFN) )
        rc = gnttab_clear_frame_gfn(gt, gfn, page_to_mfn(pg));

~Andrew

>              if ( rc )
>              {
> @@ -4285,8 +4284,6 @@ int gnttab_map_frame_begin(
>           */
>          if ( !get_page(pg, d) )
>              rc = -EBUSY;
> -        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
> -            put_page(pg);
>      }
>  
>      if ( rc )


