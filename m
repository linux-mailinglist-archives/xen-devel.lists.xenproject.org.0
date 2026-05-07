Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBnQF9WM/GleRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 15:00:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B24E8AC9
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 15:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302707.1576513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKyJj-0006Jf-KE; Thu, 07 May 2026 12:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302707.1576513; Thu, 07 May 2026 12:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKyJj-0006H1-Hc; Thu, 07 May 2026 12:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1302707;
 Thu, 07 May 2026 12:59:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wKyJi-0006Gv-3O
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:59:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKyJh-003oOG-EI
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 14:59:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc8c90-bab6-0a2a0a5309dd-0a2a4507d20a-22
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 14:59:01 +0200
Received: from [52.101.57.57]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc8c94-229c-0a2a45070019-34653939f3a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 14:59:01 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS0PR03MB7278.namprd03.prod.outlook.com (2603:10b6:8:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 12:58:57 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 12:58:57 +0000
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
 b=dw52WRgRlWYJv8nmjnmBNLG0/13yTXiURKZFlXtZnJmwUnKeksff7kh5/s3hfYqzPDCSauVkbGb5AuWMoc/zF+pOnOvtpKI4vZ0SaEj03QUr5lRCjLMGYvWvmEFUpSA+u1cz451T7aOdZMTY3uJFEiQbkecd/FgAiKJqrH7wUEIYymebPUVqOlcAGyuk43h0lycqPEnlnJ50I5VCCcF47FbzlwB1BMIP/HVCmtc/VPfzqlLbCDgN1iP923/yCeQhDxuUHrEDv7Dxab9V71y2zXqZ2ELq5r6yb8cdVJVxXQVgNvZUVT8QDUm0i3oiqHGM+S5nFqIfDNKVHza0MDHHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fE1ndgcG6sObWdvpqSARqeoeNhyfQzanNO6vhQPI4k=;
 b=mBeRv3NaZ8SmX8l3rNxlh/BltXn5VVBgxaCpmaEPu4r6F/GPBcCkhPoIUFqQmtRogyCRnOYLvIAGLrs+dZtRAJka4Sw2ycu0Qv3yoIAfDXHbdA2nD8n6kOTYLKc4rtWAF/WqAfEMCl/xFFJmiTzLP4HFmQjtQtvXmxIFI61T2d+peUQSCvw4Wg2LKnc7hWmdLkoNYZ9oqZXUpZxlyuyvRFE1wWfu87PTkzu5/n7X8lm7mEgC6WBb7Lh/HsDrkgq+a+n3PK1b+4J9RgI0va3rUVtdINidbpWd+QFVMHMf3kKl8pqUD1bgGGg+owo7hRgOJTU27ynOw/FRDBJuXZUAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fE1ndgcG6sObWdvpqSARqeoeNhyfQzanNO6vhQPI4k=;
 b=htlkmK54gemu/4+XKCTqRG3FoEz+rmCTSoGhHyiXaERVhyM0D795tyzzgYSuf0I02qA4I36EAwd9ylYoCmvyklnl89u+wV71uMXZN7p9m/2BI8w90aRWCIGlt41awSqx73329MlYjoifwmKYQdpUh36HifNqx5Mc22yTIUSj+FY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>
Date: Thu, 7 May 2026 13:58:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
 <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS0PR03MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: f892d064-6cc6-4614-53c7-08deac386668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	888gcXp1WPhgJj05sKcMopLvdFjsp5YTYylhNJ4ygQF+hyqwKCUsd4guyf9fXc1KUf7CF57gcZ+8WkPsNJ76SVSMVd7vp9Rojj56vn5HpO0mce09l+qSr+R8pDXmNAnuUd54CZrgZrkUoeaz6Fyim7RDA7H2JXpxXMaQg7mqvOkFb1fGK3WCI0So/YyYN6GC/ul4bvEFPqhAJA8AutvnMhriwFpDhjA9BI0r6x6VQEl69VgrpcrzLzZWoEF+8qTpWeM48XCEb5g65kcEDZ0rnSI2B9ck6JrMBNEon0XkQaerlnW58mHO0boYGf3L8zI7FOWtUKR87n+WYjRmiXoqBYNj1sYRNxcnUb1ej/XwxGVQ7rlkuzJAvDMQ+lORWbzIxJlP20HR3BebIPvwe33k0Ag9xWou1vpgYpZ6512/BkXl8FeieJh5ds5DdfubS7uqopt0DEQn2sX5ynx/EJI1Fx4AoyF1Jd4GjIUBM7+2dAGSvuKwvW6X33otjGqFfol+IytANVDt/07BchCwHtL9YnCAeolGD5ESW98DlVyuyXzHDZJC7j5abse1f+NRAeqUlMhrPTaI/GAo1c/RG1cKcZGE+dLBG9szaV6Q5BEGrne+oGexJWBGxQwtLLQUCai5aU2jtthC3cWv9pJuftnJFYv8Viz7D0Q3h7VFa7OZkOdvJdqN3TGjz+LBk1/VhudD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OSszUmxSbUFMcHVRRno1QmFTVkIvUmZscEh0MitGVVVjbFNidWJYdTVGQXQ5?=
 =?utf-8?B?UzRpN1h1T3M2bDNNRDk2Uzdwa0NyNlp5Wk1BZ3cyYzJOVTRDSzlZMFBFUHlo?=
 =?utf-8?B?alhpZDZHQ1BoeWg3WGR4L0hSVVFhbDhxUjVBNG45cHdURDlRQXh6OVMySFJQ?=
 =?utf-8?B?R002RkJYdmxXbVJ6Q0lBODFxc0tJOEg1UU1XZUJRa1dDTGZjb0hDU3NvR1Rx?=
 =?utf-8?B?QXJuK3FpZEd3NEpCZEhoUVBacTFvd2ZNMytpOEJ0eVBpaVRwSXoxN0VOZSt0?=
 =?utf-8?B?T09IcjBkNVQ2THlRMThkUjlYd0VkNXEzVFFmUU5iRFh2czVPajhOeEE2SVR0?=
 =?utf-8?B?Ry9SdlZuSHVDU21PRmNUTkJ1NnFzZzQyUk1PZHE0ZHhDUk5Vd2x6dFJydHB2?=
 =?utf-8?B?bHVDYkpTeVovOFBIbjJVYUZ3VVRnWkY1OTUvMkp2L055Y2x6MTJsNmU5SkxI?=
 =?utf-8?B?dUlaMmpLOTkwRXZBdjRCb0JkU3ZJWVJweVdzNWR0Nmo3QkJFQWZLaEE2SDFE?=
 =?utf-8?B?ZVlaVmZPcUZyMkxGZ3ZVRXJXclZtdGxoYTM3amcybmVGTzdhVC91SWxJUnAz?=
 =?utf-8?B?T3ZvOTJLaGNqYlAvMDRRczZhcEMyVXp4VEo3bWlOTWgvcXIwUGJnY3QvdUo2?=
 =?utf-8?B?STZYdVNwQStaWmo4SENGWjFHRkJlUzF2bWErYWIvaEhzSk5NTVZueDJPYUdw?=
 =?utf-8?B?enBQN3d2MGdyaERpeU43L2FLUWt3UWtsaXk2bFBGYjlQTzFocGduZHRRcHlS?=
 =?utf-8?B?WXVaKzRHMjNqcm9rNDZmM2ZYSGJydldIb3FzOGNYeVJHZ3YrL2hiekN6RXZo?=
 =?utf-8?B?bVR4OU1PWi9kV1hSZ1hnbGhzbkJhTm1Yc09PWGlZWVFGNnQ3Q2tjY0NqYWE4?=
 =?utf-8?B?ZWxxa3RTMzdJSjVPNmFBN3diSXpNazY0T2thb1VzazBwcHlQL2g3UzhDUDAv?=
 =?utf-8?B?dXh3b25ReGo5TDhRdmpyYlI5ajhzQzlodlU4YzJsUWI0RTFnK0ovNExVMzFy?=
 =?utf-8?B?a1p1M2d0dHZTS2NuVWtBN2N3MzUzekh2T0NSdXZhUGdXLzJvYjNGeFNpa3hY?=
 =?utf-8?B?NXFYTVIvTm9rRXpUUnRsY0tUSFNUN2xidUN5OUQ5MWdNMSsrOHBXSjZPRU5M?=
 =?utf-8?B?b25NWmkyN1dRaWlXeCsvZnQzQ0Qvb3pKZ0lEbCs3ZS85RTRINks5Ym5YQStJ?=
 =?utf-8?B?QjUvVE5uODRIVnRJUHllODVDRHFGcGdDQ3NnUHJhL044cDlDSTBjZjRsVENJ?=
 =?utf-8?B?SmtyRGF1NjFtTkRYMmNzK0pOWGRmcFdsKy9WUHVKVklnKzNKTWVRODRDelc1?=
 =?utf-8?B?ZGMreE05QmhKeE00dG5EVFJMeG1QSlBuaFVROHNWRjV2eG4rK1dpbHdKWHdi?=
 =?utf-8?B?eG8yVkNDSDVIcVEwNUpDZTh0SWYvYzUxYysxR2ovY09FYklybHdQL0JYNUlY?=
 =?utf-8?B?L280bXAwTGdMSjE4VDdpWWpOYW1QU0FwemxETndtTWd6eDVaOXkxby9ueFRv?=
 =?utf-8?B?a28yL1ZFN0pUQmtTL0tUQjBnVlFRWFZVdHlYSjhnRG9XaElpV1RnTkVoN05v?=
 =?utf-8?B?a2ZKL29ha2pBZlRtNlRUQW1lYWZKYVdYaW1taFNOYkxxc0dlRGpBenpOTnpi?=
 =?utf-8?B?bFJxS1J2akM4c1ovRGFOcXlKUTdRb1RGVFZNUW4vQ0xaN3Z1OGQ5RFphRHc3?=
 =?utf-8?B?TzlHR2oxMlVnQkJpNFBaSXdOL2ZzQVlNRkplNE5IeE9ON3kxOHhRa1lEUW9F?=
 =?utf-8?B?a2dZR05zUjhDNVEvWUl3Q1Y3Ukcwb3lmVllxU0xjUFI1YmNzaDdPWUxRVW4w?=
 =?utf-8?B?eFJpdzdUVVlZTEVQN2phVkZXZWZGV016RFJFWDB0NFhFREdRcHIxT2l6ejlI?=
 =?utf-8?B?c3hxMFZzY0JJbzhRWnBGT3c2YzUvNjNRbnVlcHZFZWhWaGlySUxsY3Z4K2la?=
 =?utf-8?B?TGFjUE1uN3hXamM3Ym1CUFY5RldyM2N6aXQ2bCtXVVBPaEVrbDZGU1pTVUpm?=
 =?utf-8?B?dU1BeHdYUXJ6azJpK1Z3VkdFYlJBNlhOSmdwNE9IVVY3V1J0TnVlNTBtaEpZ?=
 =?utf-8?B?VXVrUnhuaHJDSGp4SnFYTXl6eVdaMjVIUjRWbHd4YlVueFR0cTMzQUtid08v?=
 =?utf-8?B?YkdTeGNMWkR2VHpyZ1pnb2FvdVpvd2p2b3BKSnRrT3IwdFBsL1VFWHI5Njcr?=
 =?utf-8?B?bHI2TTErZnFVckY0ZkpRdTFUYmhZS0lFcGtUbm1aL3ljU050ZEloWUFWd1By?=
 =?utf-8?B?bkJTWUpMOXI3di94UEROcElYV3ZLb05IaCswUW5xNU8rbGpRazFueWFmbmtK?=
 =?utf-8?B?QWRKdVZZd0M3RW13VmFJS3VLQmt4TUNjNjRKRWs3QjB5bzI4QTlqUytHeWNC?=
 =?utf-8?Q?DaxtrwduLQnFPwbg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f892d064-6cc6-4614-53c7-08deac386668
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 12:58:57.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnmcPDaL3yVrdR8AX+3zSHwp7tio/S9AClWqDivBVf3vUEkGw4h+5y5Iunf+JUtV7N11/YjXL7J0YSR9kQxwpPIRA06qcC4fnqPiAv0Zar8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7278
X-purgate-ID: tlsNG-ef75cf/1778158741-08F66C48-27139D7D/0/0
X-purgate-type: clean
X-purgate-size: 1911
X-Rspamd-Queue-Id: AE0B24E8AC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 4/29/26 5:54 PM, Teddy Astie wrote:
> Le 23/04/2026 à 18:13, Ross Lagerwall a écrit :
>> If L1 executes VMRUN with the GIF set and it fails consistency checks,
>> Xen will inject a VMEXIT and fail the assert checking the GIF is cleared.
>>
>> Instead, clear the GIF when injecting a VMEXIT to match what hardware
>> does.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>    xen/arch/x86/hvm/svm/nestedsvm.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index ef6fa5d23b67..f89b087a1155 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -733,9 +733,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>>        struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>    
>>        if ( vmcb->_vintr.fields.vgif_enable )
>> -        ASSERT(vmcb->_vintr.fields.vgif == 0);
>> +        vmcb->_vintr.fields.vgif = 0;
>>        else
>> -        ASSERT(svm->ns_gif == 0);
>> +        nestedsvm_vcpu_clgi(v);
>>    
>>        ns_vmcb = nv->nv_vvmcx;
>>    
> 
> Looks good to me, though I think we are here looking to make a "guest
> CLGI" (clear GIF), so the vGIF specific logic should be collapsed into
> nestedsvm_vcpu_clgi() instead of having it as the non-vgif-support case.
> (as IIUC, vGIF is a hardware accelration for nested GIF handling ?)

Not 100% sure I follow your point here but v2 of this series removes
nestedsvm_vcpu_clgi() entirely. Does that address your concern?

> 
> (also making me notice that svm_vmexit_do_{stgi,clgi}() seems to lack
> vGIF specific logic)
> 

Isn't that by design? If vGIF is enabled the hardware should handle
STGI/CLGI without a VMEXIT.

Ross

