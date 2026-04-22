Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJt6FlDZ6Gl7QwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:21:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E774472F3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290665.1570211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYRf-0008Ps-31; Wed, 22 Apr 2026 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290665.1570211; Wed, 22 Apr 2026 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYRe-0008OO-Vb; Wed, 22 Apr 2026 14:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1290665;
 Wed, 22 Apr 2026 14:20:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFYRd-0008OI-BH
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:20:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYRb-00FbSC-6c
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:20:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8d934-2eae-0a2a0a5409dd-0a2a450a8580-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:20:48 +0200
Received: from [52.101.61.25]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8d93f-56b3-0a2a450a0019-34653d19e217-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:20:48 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5791.namprd03.prod.outlook.com (2603:10b6:a03:2d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 14:20:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 14:20:44 +0000
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
 b=JMp9Pgpz6ecvM+2c9QzDLLI2dH/oqVDwFavNeTQYmCuYHu/vXZqsdhJvPCMKnusEJQwgw5QpNTV3MhjDgTKa6Adx4l7/th72SLi8CZyvSxNygQC+MbAWex6RNGdTBZsQJMVOigMD9LN/bS7Bxk7XX7+lEQTvTjUWaM93n7ud7JTZiNo7hU5gAGX0MO3KIaQSvzqiP2myVKfsnJT5TMcPnp7a0WwRSYxhHKMM50V1ja9km+JxaVus+Zujlfor4kfF8VFIOrJq+vcTn7NJlVYEyXsMrV59P2MT0xms1RpJykiZ04aUHA5Lp1XX3wJCMEVDJxFYtAWM+2Tda7ZR/EqFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99OiKGDnxp4LBctIajbTg5YIo2P4crnt3EVyBBz3HMo=;
 b=sXtzLHZ05NspeuLJ3TBJ1e2ldD8NE0bgGW5HdGnQagaP77ebhI61PHMW+d2JJBz4Ib5EpwrgIiwmMljKb+ePdfz+E2hXKQkprlreEmn7BycAO1+y21/y31LS45AY+6glZhtjJzpJkz89wzAYclLVnWg7vQbbwF1VWgQAv4FsSL8ESMAi/HcQZPSmz8nwZkW3iCHCj9XIquwXYSB0e/h1W2SBDITeM/e2YgiNNlLmqoYLmWtSYawLyRU+WEIoTYvzh0mRW8ZmQd9YnUZatA3LsqKFH5up5nlp8WTm70ZXzIXjDLv4oNmSdEG5zt/SrZxF7Syl+WlAVe+e4icJZdyhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99OiKGDnxp4LBctIajbTg5YIo2P4crnt3EVyBBz3HMo=;
 b=c5zuqbxWMjp8wzUPim/ONEwMTy2hMdFd+0ANclevlnFwJrIU80/8EDsvEgaJguW9RadVL+u5ivFm1HSbMLGPq3YkNkL/0S8uQZ4iFSdktCKia5DhVY0K/SuXfSWeWf8h6A2RN3HOJJYpL+rKCrpwJ4QwwP51PFo738/V1/x+FTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 16:20:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v3 3/7] vpci: Use pervcpu ranges for BAR mapping
Message-ID: <aejZOaUsoN3n6CMb@macbook.local>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <51223761a1f2b8f1e901062d1e59dad934300f0e.1775742115.git.mykyta_poturai@epam.com>
 <aeiqayUd4sLNEPGG@macbook.local>
 <5854f2f8-21b6-4462-a9bb-86345a436f6f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5854f2f8-21b6-4462-a9bb-86345a436f6f@suse.com>
X-ClientProxiedBy: MN2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:208:23c::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa9e5d1-a5ee-4383-8670-08dea07a572a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+zDj51+Nw5ANI6mRX6B3RhhmpeX0M7nR50t1ePu4Tb6ykBCgJKyE81R0A39uNk4LEOFInljKnvDNgzvrQCkjV7aLKj9YxhIgJgYoNUvfDNthU05Z6IG5Q3g7lBN9//XJs7eTOiWlXdjJS/8pIqnaL0xu+xxOq3KVExU8p42Xz/NfCxZEGl/4sGkB6/5Z0KV+YAjMNLQj6Lzm/JvUlOS32Eg/Wmm2t98JHkGdA26pn/gdZpgkAmN9gJPYwOd0D91VgC2Ki1yK7Duwg7OxDRwkhGv3ju/d+KDbmJFWlEyxOHcKIC+farH8ORbE9eDFDw6fiGxK/l04XfvkbcL+wKpzN4XWsGPNWQOqeQPCrckrAeQ2Ld4IHYmbI9+mHlFJ3DgC85ZRylIuiIqQ+rkP3xrQJeQRwCan1bBLiNrVPiD1U8cUcEb5d1bPbXdCzAiBPpVqRqgz/mHhQPwYmPuaWuVM2aRZb959xguQAKXf0IxksR4HdJWS+DQpzs1X0zTufMN9o4Sl66tT2c9DfbhF1HZ+QoL8AHu3ajyoSMzTaPmRUQIr97MJKQg7oZeA76fKkaoaV6SqtB9/YCPe4IqmodtY7AwCDt52BS9+iDhvRNg+YhHvcDwK4tTaTMw7P3H/pGpFXe7/5ejrBWSxeooFuP3uPnnhhKWg1bk6MaYnZu1GgJ7uvHOQI5i3njrNkb/bIzA/ny7uJzfJrJDqJwPn0hoRcmqlCYSWD25BEJPrH5K7hP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFJeHNWRjR0eUwzNXFnQVFMZHU5Q0VoSW4yb3B3b3MySHhvZFJaaDUvWVpj?=
 =?utf-8?B?S2JSQTRmOHVTWm9NNWpidXdEWWJDM0pWQUhmbFppanpXdTczZnNUR3hGb2FQ?=
 =?utf-8?B?bTVDYmR0K2pOZGxwMlR5ZW5MV1BlTnFTMy9PZXF1RHRKTFFRMS9wZzFqRWR0?=
 =?utf-8?B?RWFMaHNwWGl0cHNKRkRUTUJiNFpnUEVQWm1rVHZvb2JlaVhjelNDQVdvQVRR?=
 =?utf-8?B?aUw2aTNlREVxS3N0MEtzZlJsVlFSeGVjTU1iTzlEbkV1V2pKbjNRNHVuMjR1?=
 =?utf-8?B?M0FudEdFR0RnaFhqMEw4elhyUVBVYmJUb3JiM3NVWmcyMTYya1FRT3RMUXFG?=
 =?utf-8?B?YXFuSmlETHNTT3BSS0g3QjdYUWpiTTNvSlMzSzBDSzBZSUt2SGhzL2Fnblo3?=
 =?utf-8?B?ZUU3Y1crTXVwWmtzNUR6N25BL2l2UHB1NlhFdytNdTdJdUoyRUlCenZSdmJz?=
 =?utf-8?B?QWRaWHVnVitpcSs5QWpHa0pRaGNGT1AvR0VLS01GYUt5MWcybldhWFBrL1pF?=
 =?utf-8?B?NzIyN0JQV3A3Vm5ZQUwwSDRtY3VwSlM5UjVlbkxENGw4dEdoMVdPOTJSaDc0?=
 =?utf-8?B?UGpxN0h3TXlZcDRXbDhOemt6OXJzZVBpaUpNdFQweldlMDJldGVraXljWGJi?=
 =?utf-8?B?SGFMblVBaEtOWitxMjRNNVMwK09XaGp1QXhvWVBlR3BITlkweFA1S29rS0ha?=
 =?utf-8?B?bm9IVjRkU2Irc0ZJdktUV3NDVzlSN1AwdnBITmJHQTVkTm0wS3l6T1hsS0Zz?=
 =?utf-8?B?RWg4MEpYMUZSN2paNWc0ZzVIK0VZSHNadUMvYk80Y2NRNHBqdzV4Z3hUVWtp?=
 =?utf-8?B?NFRPZU9laUpUS0JLQWtvcXhwRmlxYXdMSElOU0VYQjFyWTBTSHEvdjBlRHJz?=
 =?utf-8?B?ZVMwcjBPWnVyaUptMTJrTC8rdTkvRTZSWE00Y0ZyUVI4STVxcFI5N0ZCMHRx?=
 =?utf-8?B?YldXSTZLbUpWSnlkK2JYVmVIL3pWK1pEK0lNQ1MxaURjbngxSXhMUFN1RTdh?=
 =?utf-8?B?S2VlU2ZpM3BRNUVHWFRkU3Q1aFZwSEtkMTFoK0xmNGRZVWJIZ0YybXJzdzZy?=
 =?utf-8?B?M0lrTlFFbzVZYUtHdWJHcWFUOHF2Mk43Nkt5Mng2RWorMWZLcFRlYTR2OHM2?=
 =?utf-8?B?Y2xqSllwUVgzcHlhbkhqdWx1ZnRndmxkdWkwQytkcWJ2eVdCb0VQdGFDM212?=
 =?utf-8?B?dEJQQTYzdEZ6dEd6OHRGc1VscnR4TkNocXVQREp4d3hBN3lmVGdOazJEbG12?=
 =?utf-8?B?ZVN3SnpVakNTWUZlOHJ5RVRqQ0xjLzhRcjBWOHdDd2xidm1vTXl2aDdHNzYz?=
 =?utf-8?B?NDZEaVVjT09KRUFDU3crWlFhZVJnU0dHNWJnVXB3SVhtdHdDVEUwRGFFampv?=
 =?utf-8?B?TzRSMzZuemJKWVpaUmNERld5bkJQZ3JHcDM0UzR1OHRCMVRIazNSL1dLSzhJ?=
 =?utf-8?B?cjBFcXVxcG9tcWUyUDdlSkJMVGhOb1hLSzlJN2hCdU1OcXNtYnhrUUhmTXNx?=
 =?utf-8?B?ZllIVk5DYzI4U2UvS1hEVVRmaUhoQ1FXQU1lUE1RNkdEZUlaRXFETGNmOXdM?=
 =?utf-8?B?dlhTTVpYaitsc0h5a1ZuT2pIOU1YKzJCSFFQck9qbTZ3TFpTV1o3QjFwcXpk?=
 =?utf-8?B?b0YraUdjdzR4S0tEdDcyZHdyR0JFYVQvKzd2ZnFQR1hSazFrVzZKcms5bXJs?=
 =?utf-8?B?bTRzaExXbHhZaEZqbk0zQWNsTERCYzE0L2pPNEgwbGNJQlhteFlpVzQ2TWxo?=
 =?utf-8?B?cEg3V25uUDZhWEh4aEZJT3kyVEU0YU5TRllwZ0xJQ0s2TnRmYW1raGJJdnBE?=
 =?utf-8?B?K213NkVERUpxa3ovZzdHaXJ0ZCtVYjBUUWU5T0c3ajlTTDBhU05sZzNBalo5?=
 =?utf-8?B?ZjVRdnh1eTFWeTlhM0p0Rmh1N1dlRTZnR0xjMFV3ekVnNjhRNFAxUTUzRkts?=
 =?utf-8?B?UHRCQlZwVHRiK2luSERyQmVHQTdrZDFmQnVuN1lUVlJiZjk2UFA5TEcwSVVI?=
 =?utf-8?B?ZlVPeGRHVzRsbTlDa1E3Nzh4ZGxhb0VUL084VlBCZ0VDcEhzejZGK3NtSVMy?=
 =?utf-8?B?L0hGN3AwNlVGK3ZlUTZ1cTRra1ZmeVRxbWVwQXkxYTFPZ0ZuTGpTNksxTTJu?=
 =?utf-8?B?emJqOUpkdjAxSE5aL1RNTDdHSjBQbHRYdTJ4ZjlBb2Uvb24rQ0VZYWlMSGZS?=
 =?utf-8?B?VlNZazFWQjAyZGZ6S0Z6Wm05SlZFZExFYndueTkvQm5JbTBaM1hCQ3ZELzRa?=
 =?utf-8?B?b2E0eTI0WmRsOFZtcGFHRVNXcDl4cmVZSTZEQVY0cUdUTlVFM0cyVXFxVUJ0?=
 =?utf-8?B?TmFHZkxENWt2dGIxc3BPejlGYnkwYkhmbmt3TnI2Ump2YURWeGYydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa9e5d1-a5ee-4383-8670-08dea07a572a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:20:44.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PDWbmGsGNd+pUuyUnl12HrzF6U74pT54dDt6KDCtlcnKnopAIMWoRODPlwnHk6UbIkpCiG3ZGKePEjo7UQ17g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5791
X-purgate-ID: tlsNG-4011c0/1776867648-8047C8B7-186E1E90/0/0
X-purgate-type: clean
X-purgate-size: 1187
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 89E774472F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:04:59PM +0200, Jan Beulich wrote:
> On 22.04.2026 13:00, Roger Pau Monné wrote:
> > On Thu, Apr 09, 2026 at 02:01:33PM +0000, Mykyta Poturai wrote:
> >> @@ -412,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >>                                       vmsix_table_size(pdev->vpci, i) - 1);
> >>  
> >> -        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
> >> +        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
> > 
> > You make a non-trivial use of current in vpci_modify_bars(), maybe you
> > should consider introducing a local variable for it:
> > 
> > struct *vcpu curr = current;
> 
> Without any intention to negate this, ...
> 
> > current expands to a call to get_cpu_info(9, which is better to avoid
> > doing repeatedly, specially in the context above which is used as a
> > loop upper bound.
> 
> ... I'd like to point out that "current" isn't evaluated when used by
> ARRAY_SIZE() (resolving to two uses of sizeof()).

Oh indeed, this is just for getting the type.

Thanks, Roger.

