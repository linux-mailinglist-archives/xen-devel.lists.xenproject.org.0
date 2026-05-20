Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNe/Ai/hDWod4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:28:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F0591FA3
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314156.1584146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjly-0005Uc-EI; Wed, 20 May 2026 16:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314156.1584146; Wed, 20 May 2026 16:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjly-0005Rw-Ad; Wed, 20 May 2026 16:27:54 +0000
Received: by outflank-mailman (input) for mailman id 1314156;
 Wed, 20 May 2026 16:27:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPjlx-0005O3-5R
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:27:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjlv-00HKOS-UT
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:27:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de0d4-5cb7-0a2a0a5109dd-0a2a4504d4e4-32
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:27:51 +0200
Received: from [40.93.196.39]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0de105-1dec-0a2a45040019-285dc427bb27-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:27:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5108.namprd03.prod.outlook.com (2603:10b6:408:db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:27:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:27:48 +0000
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
 b=swmtJ01WLr6N44cMzLGp9WvEf2oTmEexDD2HJ+T3IC93JYIcH31aY7KRvLqrKzLqIg0Hx/90JTyU7EzCQP0bK5irV8ORDuNy5A4DC/ResQcoKayMn/hTX3vNm40IK4E6zCK1oZS6EEO1X4FgDwcu0D8kcMuUhnfWzz3yGXnlQOxdnC9mPXtF51BbBd027h/PTORnRYYd7y8MfSiXTqaV+wta1E5nIEn3BFk4VtrktMGDan8naChvYB5hV5N0idx4NYus7ccb/DdcfKXnVIebvr3x4Nfc+HcsyHs1aWcmM5zHELEzUJ1ZsNKycuk0e2Ko8rXgvPks/Dumqkdh2rmBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R2qmBAcouqsQoKHolYONzObX2TpYVolAq5+aiMBpbA=;
 b=SUr0f8lIxPSXKkLblz7yOG/l8Z/wQ297cbe0G4XMO+Xo15uKYMuMMjq9JZ0U8Wa+P4owDPFdz7HDe/J4OKtG3B/c9JrVGfdq/PKvMPDdTo1td7RGycEKOtHjubGu764zn6Mc78NYuPIZWBJxIdYNj5mxzsePVJzjyRgx3gb7sb79m4ie4Dy9Pg+2RvW/o7DuJcOuc4+NcKrUZrX4pJxQajPFPLEewA1zzk0Vz3tyHuPyiHeH+nuw+plGLymI4LXD0DMDUOCSzk3fw3oSnx2llUgIjai0scToM2e+Lk4DzdoNciQ8f5u20PFPHIBVXbdkN3qP4Q0Q+w3eId69Qoevfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9R2qmBAcouqsQoKHolYONzObX2TpYVolAq5+aiMBpbA=;
 b=SzQ/I4ZfpUjOV0sqkqDSefTCu3T6+X9TUvQfMXKMohxOhhen3r7XibFPol2gqlJTrhIBEnb9bLdJVZYJqfb+/8A31kx7nQWcF8UzN8Q31JnbZNwEtrFxMihCUNLoC1o96E2/mhEbnvvaQyi+vfaAIKzNUDxhHnxg++fzgGtQLHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
Date: Wed, 20 May 2026 17:27:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: e74fd248-5729-40f4-caf1-08deb68cbaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xRf37mXqBnA969/SFab2DilKw9dryVNiaKR+zAJWh/XGcyQ6xXQ791VzPrt1MOFbXO3hWGo3QdMW3OXdtcdec882HwHy5NFv4QzPrJXdLjAVBFTl/izABnFzXGOtDtJAvqlnMPrXx706Yck4BZhNsvPrgtCh78sz8VlZJ1LneiRSRlV3C3UR7o7xiBbLpNzp/xeRH5EL0Qxq2e/bUc4APGfJFPUrao5R2Nf5UFr88H2bczki0oCKvcL48TNK8u7nyRLSD3O0FgICZ9aozfdPQ/hpkSPv/59X1UZaqNhsxW14rATOYY0YZwnoE3yRXW90bijfowid7vJWfFEr5v2/lmpxYxmHRcLXQZZ4ajLdMVfWkn12JM3OyfukKHxv5H2Oo94+3MqZDVvGIeLP/8xQ5zC5joAVlq4uoRghbTv3nPoTtp8ZA6KatJL+BGoSc+GCywMiQsaRUC1InHk8qIi0w7hbyPp9IKz99R95J+yqSdBxu2FJEwCZJbso+K3CxIv/W8/5ATrlbTkOIBtcqsAjgDgSHcHBYnaNXxGQZPhQZu+eLtHbRKLLMpI+eLor/eultKtUxWyDd4lSIVT9ZFqtV8cT3MLP+OUDNnB3DT3tdiHwVlG4Ir375wvM99BIAsrmgyGHj0znoHJwPSgr0mm5CT+I+4fEqC6WJDUJqrBQWf5I3W/vs9OqMcn7lvCMjYKB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2xHdDRGZG15VDhUTSswWE0wcDNBS2o0bjlwU1ArOVlxSndMTlJuZHRCbnA4?=
 =?utf-8?B?L1dzb1BNQVhmMzI2ckN6RjFaY0w3WWZ2YXhlVE9MR1BGWEplMGlDd05vdmJm?=
 =?utf-8?B?MUR3aG1lY1NBTGRiRVhudnluUUI1aXpNVnoxMUlVblBDdFFQMlBMNXpmT3U2?=
 =?utf-8?B?enVtQkUreDNmdFljWXBYajJXc0hpajVpU21tdmtVZTk4VGJ6S3hiQ0RRNGw2?=
 =?utf-8?B?djlTVVMrbmllTG9hQ3N0UTZ2RlI4c0ZPWHR2YnE5Vlg0ZDRtd1BXenBYWWFj?=
 =?utf-8?B?ZDYvMmVWM2VFalpORWhQVlJEZU11aTNTbFZZT3FRQm5JaWFPclZKTkhBZDk3?=
 =?utf-8?B?SWRQcUxzdGNQL3I4M29JRVFwbDRFYWJkN0hRbG5yZWxWcVFsSE5DNWRDNEh4?=
 =?utf-8?B?aFdZL1hMMlJWUVJyOWdFT3dTeDRXcXA5bm9JY1pJL3Vua2NVY3VYQ1ZYcEpI?=
 =?utf-8?B?aWtyaG9tUVk5dlFGbzZUZFF4NjhOc2pCQkhBd2NLajdhbDFlc01OcFU2UnpW?=
 =?utf-8?B?NmdLZVEzZHFVNmJ0bzcvV2lubS9IaHIvd3NUL2t3MXYyQkdlb0VHRk9CSk91?=
 =?utf-8?B?Y0dLa29uYkNNVDBpSkk2dVlSTW5admVNSzFvUUx2WWZnQ29BZXA4S2p3S25F?=
 =?utf-8?B?a1NDZm5ZS1J0Z05ocVFOTVJqRW5YaENzaXFyUURLWDlpeHV1b1UzOXpFTUp3?=
 =?utf-8?B?a3VKbE9iSXJYQ3BialNLSXU5Y3llaXh5SFA4bUR3eFM2YnFabDhpNFRkV2Y5?=
 =?utf-8?B?YWgxZVZGVzBNK2VkQnpnaXNtWmRWVGZmY0VqcnpjQTlZcTZBNng1cGpJMVdH?=
 =?utf-8?B?RXhBaEFGcThyTFRxM2pPL2VtL2hHUll3QUVlZ0JaaGZ2eWx6a05GTDJLLzk2?=
 =?utf-8?B?bUJYaGZvOVF4cUFpSkYrdG01SnRoQ2loa0kzVVFMU0JBNkEwTnNZc2RERmJR?=
 =?utf-8?B?VCtCWTlWYkNPcTZjTllkUXB4YmJDd3pMSHpqRis4UzRDbGU3M3NwcFg5azE4?=
 =?utf-8?B?S3huMmRoK3BybXliWTQ5d3FrbmlwRGNWYVE5eHhrbzc4dVBjOEhlUHhtZmZ6?=
 =?utf-8?B?L052ZUFkZEFQRmZZM05DZEhJMlFSQVVZU1NJVnB6QUFoQ3NJbXlEVnZEMnNE?=
 =?utf-8?B?alVaRis4clBPUWt1WU10UXE2eGZkdEF2a2ZYYjhTeXpLMHpuV3dMZUl0STdT?=
 =?utf-8?B?dDE5UUE5YVRMNVA5a296ZEZaYmIvQ09LSk9TbDBUSHlGaGprZDdPSTFIU25a?=
 =?utf-8?B?SkZWL2ZyWEllODZXSklZK3NNM3V3bFNSR01icWRiZE90YTBVWHNaVW9CbU9w?=
 =?utf-8?B?ZUcwVHZWTVpWcSt6QWtWa2kybXR5OXhYMEg0K1oxNlYvL20wc2pkVk11SFRh?=
 =?utf-8?B?ZWJwQzZwckJqMDhqR0V0Q1M4ZDNjSTExdTFUYU1DTlVuanNkOWc5YXk4UlBL?=
 =?utf-8?B?QXgyTUpjS0lta0xwZnRxSDZGcnlsaHB3ekNLQlZaTVpLbnF5NmRKbjAyMXg0?=
 =?utf-8?B?MmU1bXRqRWpmRFlpNi9oa1hUOEpxUXo1czd0b1phV013ZUJ2NC9kSWZOTWw5?=
 =?utf-8?B?dys1bGlpZmNkeEJZcWdQM3AveDIzVDAzOG5QR1BLVkRxREJxKysxaklsMjd3?=
 =?utf-8?B?Ty83UTdBalFlZDViNjZPdGNwc1F4a3VCK05TNWpGYjlteXpMYlJubnRUQVRu?=
 =?utf-8?B?WGdLRDkxYVFJb2wrMmZNclFPcWRrRWFiVVdZV29CWG10Nkg1UEdTeU1ZbzFt?=
 =?utf-8?B?NXJZY0FqeVM0SjRYY2pnMzdpbjY5YkJ2WVdmL2UxWVFNK1VWalgyZDFtRFlD?=
 =?utf-8?B?OENkYWppOThxNTZhbHlKOThjNERwMEo0aS8zVEtmK0JRZFg4S1M1Z0RzTE9o?=
 =?utf-8?B?N2tJY3NQSXZGUkplRnlBcFAwa1NGOTlOb2ZtR3ZSTkdGSjJDTmREWlYySTAx?=
 =?utf-8?B?R1JJaEs3TkgzbGc0TE1OTFgrZko2ZmdHZk1GaE0yOUYzRUZSTm1kVmQ3KzMy?=
 =?utf-8?B?dS82aXhORkVyMnRjUnN4NFgxSmFtaS9MbUgzODNtMGtCYnI1OHVwOXNpZzdC?=
 =?utf-8?B?VVdLY1hya0g2VGN5UjJubFFBUXo4aTBWdjkyN3lZbXBzS1hqR01INEFadkh0?=
 =?utf-8?B?TXR6VTAwN29sRkIzM3BvWTVHQmxBaGN4NHo2SDhhei94eUJscisyN1hLb0Zy?=
 =?utf-8?B?c2hUOS9QS2I5RjRjb2xRaXNnWStWVG5mclE0Wm9xOFlnQUMvNnBWc2hjQWFj?=
 =?utf-8?B?eXFmeGV2MjJqT0EvL2JtKytjR3haUXlQTi9GdWhFS2ZBbWY3VDZBUkN5bVc0?=
 =?utf-8?B?dWdva1VaaitFaE9ybi9kM0FsU0l6cGJaTWIyNEMyUUtxQ0dwMHdHOEU5NDRY?=
 =?utf-8?Q?f2lYBnQLVyfEDE5E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74fd248-5729-40f4-caf1-08deb68cbaba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:27:47.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs4OPMVz6cF1ov9gFQsnCX7bWtpGQjj82owAmfBTh7axjshGFJJUxmLYZSyYx96kJXOYMw2Vhx+WJpQvXqNr49uo9vMWdzUVO5oDQH3q3sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5108
X-purgate-ID: tlsNG-ebf023/1779294471-405703FF-D6098164/0/0
X-purgate-type: clean
X-purgate-size: 1097
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 996F0591FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 4:51 pm, Teddy Astie wrote:
> __{put,get}_guest returns -EFAULT on access faults which causes
> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
> incorrect.
>
> Fix the computation by relying on copy_{from,to}_guest_pv which
> reports the number of remaining bytes instead of a negative errno,
> such that we can compute the offset properly.
>
> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Given it was __*_guest() before, I think we can use the
__copy_*_guest_pv() variants.

I can fix on commit if you're happy?  Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

Jan, this wants committing ahead of your MISRA change, as it needs
backporting.

Strictly speaking, gate emulation is all PV right now.  It does want
moving behind CONFIG_PV32.

Also, with these two callers dropped, all remaining users of
__{get,put}_guest() only care about success/failure rather than the
precise value, so there is probably some cleanup which can be done.

~Andrew

