Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCf9AVemBWrGZQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 12:39:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC22540795
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 12:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308787.1580138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNTSt-0000G5-GI; Thu, 14 May 2026 10:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308787.1580138; Thu, 14 May 2026 10:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNTSt-0000Cs-Dd; Thu, 14 May 2026 10:38:51 +0000
Received: by outflank-mailman (input) for mailman id 1308787;
 Thu, 14 May 2026 10:38:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNTSr-0000Cm-Sy
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 10:38:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNTSr-00A1OQ-66
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 12:38:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05a636-bab6-0a2a0a5309dd-0a2a450ba464-10
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 12:38:49 +0200
Received: from [40.93.196.17]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05a636-212f-0a2a450b0019-285dc4114b11-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 12:38:47 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB5965.namprd03.prod.outlook.com (2603:10b6:5:39a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 10:38:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 10:38:44 +0000
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
 b=mCfEfXeFlS6nd3JHnZrPtLoaDl49BHuGVCCsKpAtH/Dx0fO2OD3yxypQfaJj9JKPiuQm/CaKpOQvLcC8hYk12eig4oB1fr/VM4Cx1ygcda0+eqOFOnulSCzJ0yFVTfb5NMJ+ca1G1jcds/4lexoH70Gdxru3jhXl4HO8m7mFCN17hor/yuws7czf+fsl6uXmMEif3x9uH8dHK1qEAYCUni2vJaDbUTInvI4jNu5jrlx09vX1V/ZyzGs7quilc854DcYX9rv822sDrG8P16UuuunQ1oGGdgUz5N5VXqYzv2gn0T6wejBPOtSHga6o7rdY5RmAY6Cu/PL0+/Q5lV4v7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvKsE00aIjSM2diGKzncfksoJDNZ4AyyUuAv4Odga0Q=;
 b=vd4U8My1iaMQdap4D+oAPM61I5FN3nvBxGGTsehgAsusH/bmdE54IAtb9wxgx+fexjwYDh7kg6k2zqPf0Fy6TpxY3BGtx4wqQebOpoJY+e0Z2DZoU+GnMZUWg8SoQxshJgsei4lQJ2DQ0/UFlvCYmrjGLnPUO7J0PVu09LB7V7hVeClsg/2QHUZGKnVI5ZNPewSPx7O0M3iieS1b3ey/0Zk7m+wd593S8qvXW5iLM5KWNvcZ62CcM7X80vtMIkTqwf+vQHvXdwyzrIRAveQhoZDZi1Q/fkAeSJe20px0+96CIvjzKCynhc9YWU+Vq3BVgw5xluYawmm4KGs6mkI6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvKsE00aIjSM2diGKzncfksoJDNZ4AyyUuAv4Odga0Q=;
 b=Lq05hRFdz8dcCXYeyhjbUSj+pCpm2FIXhkoUwX+Def1AfRH3ULEBYVs/VlALytFG87Fk69p1r347UR3JC3hDc/cJvukoAtVFpaIvv3ak3eJwRv6tR1kkTifVgPSFIMpY/UghzkL4CFkUqPHSAWW6WSSr+x2pY2an5O7xVoNvOno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fbd3768e-1245-409b-b1d4-b27978367a7e@citrix.com>
Date: Thu, 14 May 2026 11:38:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, consulting@bugseng.com,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] ci: ECLAIR: avoid intercepting intermediate linking steps
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
References: <edd4d992a269dc45b4a41f1c8277ff0d04995dc6.1778753597.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <edd4d992a269dc45b4a41f1c8277ff0d04995dc6.1778753597.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3c1464-3b16-4b14-d960-08deb1a4f8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	thQHFynTeWq9IFS1wGTUEEKtKqQGZcGIf9dxcZMs3S8rCk1EItjhqdr1UUXTdLHPS+5sy3jLyt+T1lzCiPzkKjJCoqgmSentOTxVvIGzVyF5IpziH6cAnNxEoskEDYhBZNeWzewMeY5W5Wm2e7Jcjiz8VCUXXdUZzVaXy/xYjnIlmAAYHya5uiWLdX8BeGCtAdBiTB90R4QDqtrRIgEFl13mT2JBLYX9bNMsoSQGoTl2z/YStHyXh3OnprHCId2dQE8x2UMllErkIeDFqIHz5wYNAD9+c08ma8GBbApXlgN4Qub/rr5T0tbIvrCv1eL8IhEVJ5FsAQiK4fPzjIMcHkTupIMsQ+0hPDWWld3NSU5hwuZ1P581+nMij9v71km/UgQ0MrdFHpNAYNI+v2RHlwX059FVN77Jl8E9WWvGV74RSUwBsCOyE4CJbmaZ5apd5yjlNY/75oDTXcUFsyWNkHbH5uOXQoEWPnQP3otQJzOpF9Ii+zz4u/Orhf2uikBzG1J1p/Jl9zWNaxTNmYkBGxis8BBk+xbCODviTXX8JWmTvm10K0UDxyOm3Ka5Iiaqw3sYSHE/wJpA1mYpBk29h4MzDZe6sBuH9KyZQnCm5qs/WGKf3Mml6/ILp9R8+ipj8ceFRV0N/nWMiTCHdKE4gzHnLKA5zaLVqDLRrcU4jH2p4A0t2peJcjVv3ap2Dw/b9ZzfmZkRpb1Amjo6iVSJ1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNndUZlYWRIQmFvckhKYlhUL0N2ZEI2SEZhVzBNeWNySUNrMHBMUkYrRmZh?=
 =?utf-8?B?cFBWa25kb2tnaU50U1VDZWQ5QjdQQ2daNm9URUNWUUtzM1NIelAwdEtnSFIw?=
 =?utf-8?B?RjMvVG1UQm1oM0tWcnNyMDltZkZaVDEvaFdvNjg0UnZYZjF5ZklsU3lUcUFP?=
 =?utf-8?B?eXpaSS9pNktjT1FZTnZLWHI1M2tPb1M5R2RiSGhUZVplaFlWTWtMRFhaZXVP?=
 =?utf-8?B?MU95MzJhTWZ1aDBKakRDZWlUQ0p4Sk1wbitVUU93dU83c09QWW1seUlTMXpH?=
 =?utf-8?B?MTRFekplV0VrTFVLRUNJdThYMW9wWVB1bExURkVxODgwU0NqeE0za1BUTjRr?=
 =?utf-8?B?UnFDYTBKWW9GWjMxS0t2cWhkWU1VTExLZ2JUbjJQeHJiVnA0bE0ySzdKYWpz?=
 =?utf-8?B?NFpnN3BmRkhSRFUxWTI2VlNEanB0SGlzUmZyYUE2QzhzV01IL1NuTXdtTi9t?=
 =?utf-8?B?eC9NdTRtZHE3WHNxSXBQTnFHaHMxdXVIMko2RDdGU2tTWjlQN29TUzB4ejFR?=
 =?utf-8?B?M25oeE5OQlVJQXdiN0pTNVRqRFRsMkQ1TlVNd2xjZkdidjVIR3RwK3k3cE9B?=
 =?utf-8?B?M0tGK2xzOXF6SlJZNjhDSEdudnFKYThZM0NtUG10a01kazByMTM3bmM0OFN4?=
 =?utf-8?B?ZVFyRDYrRCsvbnJrK09SakxzMlNaYjVWbXRMLzlkVUV6L0svcXhaNmo0N0Yw?=
 =?utf-8?B?eUV6ME5nbzVVdVBlZjZHRmMvbUhSbmJwRlNaNU1lL1Z3MS9kUE9XNllxWkhH?=
 =?utf-8?B?L3ZHYUxBRGtyYUtWQ2duVlRnVjhrT3ROSFo1RFNVQUppSkpNdTd2NEdldWwy?=
 =?utf-8?B?SXl1TkE4aVNaNmpjcEs0Wnp0UndyTUpEeG9CZW90b0pENVdpV3VyaTBCNFh1?=
 =?utf-8?B?aDhpeWNCNzcrSzdqNVVlR3l2c1U3WXUxbndDNUp6dEIzUzV0cXkvcmc1ZUk3?=
 =?utf-8?B?a0dLa2wrRVc0OUxPeGhqeXNJOHhxUzVDVmNNSUFCVXl5QWxUMXlzNUpQZHFS?=
 =?utf-8?B?VWM2UEJvaUZQNS9pb3NFL25RdmhBczBTZFdiZEFCUnYvZGJWR0JVQ0szQnJo?=
 =?utf-8?B?TXJnUmJoRlVrWE9mbTVHQ0ZFN2hBYUkra0dIV3BTRHBmVUkyTTFUM1R2V2Ro?=
 =?utf-8?B?VmxYK3dQWk9nRjdSTHRMS2tCcFhuclFJd2ZzbGpGQWkvckR5cjZ1RFpGQUln?=
 =?utf-8?B?ekV3QlZjWE55dXJJVHNTeksvMUVpaVJRMDFCOTNiUkkxVEd0Mzg5WW96Vnhl?=
 =?utf-8?B?d0F2Uk5SZ09Ka0pINnhmVURieENHRzNYQ3RMeFZwWnYrLzJVcGdlbjQ2dXB0?=
 =?utf-8?B?VzhJVWdiR3ZrMTIrV256R05TZmU3YW9Ha2p6cWVqVHYyb1doQjlYeFdHU3dP?=
 =?utf-8?B?RjlnaVVodXp1Ni9LMnJGWERXb1g0NlJjYzdZUEp0alRIVlZ6TUJDbnFKTVFw?=
 =?utf-8?B?a1ZIUS8zOGEyOHpmdDVidTd2Qnp6RktIUVF0Mnh3VXZNZGYwTkZQZE1qZmhu?=
 =?utf-8?B?NllQNnBvWW96L3F3UHBUcTh2WWpJUUFIc2s3ODBQeUJBTWoxTE44T1VoV05T?=
 =?utf-8?B?SVNyamNac3JjWnRMMXdkRHJvK2I1QUIvYWhNTkk4bnNQVTZWaTBhZW9VNlhK?=
 =?utf-8?B?K2ZTdWQ1eThYSUorU0lRU2hFUjYwWnlES2NHQlNIM3NXTUFGbGIxUS9pTDVq?=
 =?utf-8?B?c21pT2wzaUwzVzJlUjZDdmhTbzdpeWNUNGRGZzZBQTZiWUdvVDVHdGd1VEdC?=
 =?utf-8?B?QWlYUlpBUWJybGxoTkk4QU5XclluL0drRmMrZmpTL3VzdWIzSkRkeHZBNUNG?=
 =?utf-8?B?QzQvS29EVlFZa1Zjc0Z5L054QS9wb1VwLzhYWFdkVEdEbG53blRoUnI2eVFI?=
 =?utf-8?B?VUhFNnE0RE0vbWVwNnlYRVlUTkEraXpHNzl6MHNBY2Foek1OWEVWZmorZXJh?=
 =?utf-8?B?alZ3VU94SVQvd1NybGZKMzkxck1kRGl5enpxQmYzcjBmK3BHU0ZIVmRiSUha?=
 =?utf-8?B?VHdQRTYxOWgzQnZuamZDakJ1TEM4YWpReFd1SHJnWlJQWlFpdmNGNUpLNzB6?=
 =?utf-8?B?dGk0c1pEQ1I0WU1Mclc0d1dseVZMWjBCRnlvVUlaMUhKcFlXc2dWMGVZQXFs?=
 =?utf-8?B?N210V2Y3cUUvT0NvRFo2ZUR0TmJ0c1FvakhZQjdPc1R6RmV1aW14RUJMWEhu?=
 =?utf-8?B?K1VlM0prZm9oT2VlR2lsVDhORndYUEttMjM4d01XS29aWDYzbGhiM1YvZnlQ?=
 =?utf-8?B?Nm5zLzd3UjlVRGdwZkNoVWh0SG1sYjErSWlDOGdvcTdxaFhXOFhvWnVHcWly?=
 =?utf-8?B?S1U4TkRUWVc0Sit5Z1lJME5OSnZBa2FTaHkzMEdJRmtITmhjd2E4S1dUditO?=
 =?utf-8?Q?EP887if6uy3+kJ4s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3c1464-3b16-4b14-d960-08deb1a4f8f4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:38:44.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Mw+UsOhJZu+/b51Mq1i7TBMndcbyvE8/k59Kvd2QsC9ZxAHwTdAZgVg2M5AX2THktqs3Sjfwpkcde4pUPKcfomR5SF3UB+xnVVTBy1agZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-purgate-ID: tlsNG-42698a/1778755129-1357BF3B-328D497A/0/0
X-purgate-type: clean
X-purgate-size: 1935
X-Rspamd-Queue-Id: 6CC22540795
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email,bugseng.com:email,citrix.com:mid,citrix.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:nicola.vetrini@gmail.com,m:xen-devel@lists.xenproject.org,m:nicolavetrini@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14/05/2026 11:16 am, Nicola Vetrini wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> These do not add any value to the analysis other than duplicating some reports
> in whole-program analysis, as the intermediate linking steps are only used to
> build the symbol table.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2524548198
>
> A significant reduction in wallclock time can be seen for both arm64 and x86_64 jobs,
> with no impact on correctness as far as I'm aware.

Yes, a very nice improvement.  I suspect this wants backporting to
stable trees too?

> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index 399099938f..ec37f7eff5 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -34,6 +34,13 @@ their Standard Library equivalents."
>  
>  -doc_end
>  
> +-doc_begin="Do not analyze intermediate linking artifacts, as they do not differ from their final
> +counterparts for the purposes of MISRA C static analysis."
> +-file_tag+={xen_efi, "^xen/\\.xen\\.efi\\..*$"}
> +-file_tag+={xen_syms, "^xen/\\.xen-syms\\.[0-9]+$"}
> +-frames+={hide, "kind(program)&&target(xen_syms||xen_efi)"}
> +-doc_end

Why the difference in suffix in the regex?  Slightly rhetorical because
it's the full link address so includes an x for 0x.

But, the two regexs for suffixes really ought to be the same, so I
suppose we should exclude .* for xen_syms too?

For the sake of clarity, do the names xen_efi and xen_syms want a _tmp
or _intermediate suffix, just to make things a bit clearer?

~Andrew

