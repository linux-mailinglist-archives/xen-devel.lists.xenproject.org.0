Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAF+E1UO+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26084D8E22
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301470.1575754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYr7-0003D3-Be; Wed, 06 May 2026 09:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301470.1575754; Wed, 06 May 2026 09:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYr7-0003AE-8v; Wed, 06 May 2026 09:47:49 +0000
Received: by outflank-mailman (input) for mailman id 1301470;
 Wed, 06 May 2026 09:47:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKYr6-0003A8-CN
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:47:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYr5-00FW3M-PI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:47:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0e3e-bab6-0a2a0a5309dd-0a2a450a9ade-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:47:47 +0200
Received: from [52.101.53.42]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0e41-56b3-0a2a450a0019-3465352ae8b5-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:47:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6529.namprd03.prod.outlook.com (2603:10b6:806:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:47:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:47:41 +0000
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
 b=JuXmW/zWwQYzqP5eQdeszZJ1dd7ptukDalZPpLMvprLam9uTq7idt0DosmbCZY+yP+BGNVdoaJ91nFJEU8U+dIfD23X5K106hlCOhoo667YfUpZhSZ++NIejSAF96queHH8W+7vTvJkz+5cxg1MOpnpKV4AZzKncJuRVB+PUUhZcSDMiSdavE8d5XLD9JdX/d9GbussrQwM0NUMb2FvenpG5+8SI0DkkSq3bBYTtMN1MqVhsXaaOxkd8mRd0xu8hWLZLRiTYqbFEEvfpymRVoajLlniTF5niSLFcvO/b+dpXSE3SCFSo1IRz8c5459s4AeaiiLnjhRfFO2myL0C1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3862DNWhPz6+26s4MisG040VMGxUMaxeDHkmR8grFlQ=;
 b=Il+X4oeA1R14S5SvyzrLEOd0FXNs7GXGG+42bPTNL2Wz6U0BHU5jtvHLFSJnQgerx81ypDQ5Nu+vCO0Ta87hfp4CXiwbsBnLyWWz8BWktnPZKvQkM8SS44czz04ZYtxd4CAATeb7j6RnttpMKvqcTSVyCBkdiql4wLG+a2hl3SjqFJBcSXS7iLgzJ7zOf4AlrzsPA/cg6hOIK58Ib1qPxVk7qWF+kadFIhxEQHcrfssSbmZjQSqmrxbW3SVRKu5oJ3IXlTCFqKvvGNGGnNhi1en31eZI4vbYrTsSuAxvKD2K7gQDRJoONtm7bpx4nV/N7qKiAMIFpxLPgvcJTHjIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3862DNWhPz6+26s4MisG040VMGxUMaxeDHkmR8grFlQ=;
 b=jWtTbEAYZtKvZk0crq49VRnujL0FWCgNqFV1f4isWAmBjQycndIfQ8iHPoKZo+H9AGXPUgz/MuJgzL1/EIJVF+T5oMXKfPyj8691UQJjIAHyGdrVbZT1xgDum5Plp7kOlHQjyxodiZu+2qvsVpHZHIXBeWfR6dG8aML3Bh9QMP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b47302bf-50a0-4535-b5b2-42d8de3f6dc6@citrix.com>
Date: Wed, 6 May 2026 10:47:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: c83e1868-c1df-4119-0b62-08deab548422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wZ1bgUbwtuwA2Vb3SKFeRqU+fWFlvv88gYlEl0UVp4akDlg1kx+FtXA/GA7+2VJXwWkgGFRI7/cjuLQJ9aI7sQU7zv0z2rgqsq9Vs4mPNK7rNjVRD10Q4MDF1KY5PaawZ0uzHr6X+t9BQ6LInMkr3m+rAcanQdZs07PPWZleKKmftqhbujjnDqY+HbttyMv9wO3hXqVnwJbVU6sGGgO+B2GRiG/WDpr94onyZ3q6v3jGgZPnqhZihjtl4WwhL3j499ihJNLd7WPXRBGJ0jStxLPXkMHwz0+qv6j34e+gHPmI4TXZ78pbmKsBz+SrJ8VzMeySOdc5qsp/UupdRAsv0Lqu5ay8y2l7JRuvseTRN6vQEz11PTOOfz787L//SVnHG/Jt0bXg+63ByJK5JAl6pehlKR1K58E7cAZGWjVpdk4tXAtl2RDyYEZfi4Cfh8RMGI262AYx1vM8xA0NSMTDMW8CmMh1AFykpz1kCtw6IGwyLR6jlIzCObaEfsLL1HoCgxuwPjdsJjvof6pwUJXsBfIz3xTzv8sD03v3rNU3Llmyik86waTNfH0DIYE9z0YHQzwP+WB/bJTT0KJfUee+4W5BFHQpv7vt+DjnIboiFQv7rm2x02cvUCQ+p9N+AyA3fO6c5Py/RGj0zLgShRHvkeIWftvyEmjVdtFvYUaDqmUmM2w9COqF/XjmjKp38Efd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVljZWtKNGhTRU1pZ3dHYVZvdlRvblgwc3R5UDJ5Mi9HTWl5amJSTDlSU0RT?=
 =?utf-8?B?ck1aWGtLMFZDc1RNVVZtRUxpV3kyc3VoejFkZ2p4aFJuTFJBWGR1Z2ZJejZp?=
 =?utf-8?B?dzV4dVFJVnhxSENpZGh0QlZ4aVZuSzZUMDFvV3liMjZNUE9HUWJGYTN5WSt4?=
 =?utf-8?B?Vnhhb0dYbjdxaHhsd2Z6NE1RWFg2VnMyR0ZBZHQxMWxmVExaUzBRd1A5RzdN?=
 =?utf-8?B?RTIyR0ZtakRuQVRPdWtBOHVYMGV6LzhEVEZ6eDNONEJjL3FjNml1Ri80UmQy?=
 =?utf-8?B?WGFuZzNOc0FMMy9LYThTaXRUNlhkK3lJUENLN0R6cTRpNlZSNkpCZFpVaWNh?=
 =?utf-8?B?eHRkTW4xUXFtamhoUFkrQjZhaEM0K2QvdUN2emQ1RTFsRE1rTWNIVGtNMGg5?=
 =?utf-8?B?R1pnd05vUUU1UDR0RXVTQ2hvY1ZPaFlqb2MrWmV3M2xudHJ2WFh1TVVGeWta?=
 =?utf-8?B?NXR3czNBdFIrY1hCQkF1MVpIM1ZNengzUGhoQkM2Q09idWo3L0VYMWpJU29p?=
 =?utf-8?B?a1lJZ3NISzhSMG1ZTUFiZVVlcDNtQUpLTjk1RElyQjArdHZhRzZNYkpwdjBu?=
 =?utf-8?B?WVltTlU2ZnpCNmpQUEFyblZmUXBBMnRpNnpUTmJETDJaaG5UNXhiNFNSc3h4?=
 =?utf-8?B?a2JxR05SQ2VDU2k0aTJQb0VLbFBodWw3QkxIekx3Q2FVWjRpNkxZclVBUU1L?=
 =?utf-8?B?d1NxL0lHQVA1Nk1Tb1RqVGRFM05waVdxN0R5b3JoeEZrMFJmVUNaREFnVEZD?=
 =?utf-8?B?S3BQQ3FtWG43bVNLdGxkQkoxVzNCWG1vMGpoOWlWQlJlSDBtajBReUlESnA1?=
 =?utf-8?B?SGhXMmdMamlVZVMwQUxLOWJhblRNK0taKzdLT0RYSXk2eEtrOCtNekxZZnFS?=
 =?utf-8?B?MElkTmFGOENBS3U1RkFsVVBSZWVDdkJRamh2Z3lTd01WbkhmWm1iVDh3WC9a?=
 =?utf-8?B?UklXTEIwLzVab0U0ZGltUStzcEwyWmZWbS9oTzJsOGVzSmxCeXlEbWtVc2x6?=
 =?utf-8?B?RUsvZG8vMEl3SVlzd0dGbFRheFRqSkl6cGZUQU1YaWppbGRMUmk0QitWRnR6?=
 =?utf-8?B?V3M1L05SSlQzbGtyZmlqWVVXZlVwbjQ5NW5ja1pJWXFaU2diSVBuRDNqSnNN?=
 =?utf-8?B?aGVkMkFOTnI5bUxLRElSVXV3NnJQbEFZa3ljUjZOUStJOVFpMHlhVGt4NU5D?=
 =?utf-8?B?cE8wMkJYSkF5anRBaEZ6OWthZXN4QUlCOThYQk5SU3dxVUFFdksvN0o4MGVL?=
 =?utf-8?B?Y0NiejVER2diL2lMM0NreGozU0JqR0h5cklqSEVMZW1YQmkvd0pJV0p3UmNE?=
 =?utf-8?B?a05Sa0dVZWRKMnh3OWdDRDlra2c0Q0U0eW0ycWlRTEJoSm8zZ1JFdmppMUpq?=
 =?utf-8?B?SExRQU5HNEt5TldsYW95OHp2MzkwZ2Y0Z3EybjJUTGdlRVJHY3UwV3QwV1VP?=
 =?utf-8?B?T2I3bXZxaU9Td0hZSGJiTm8rVFEwTkZsSFc4Wm5iK3VKSlp2SGU2VHBuWGQx?=
 =?utf-8?B?Q2QzOE5VTFNEd3ZGYW85UGpFbWxLK1VxNzZGTFFtTjcyOXlTQjNBUW4yYldp?=
 =?utf-8?B?TDV5TC9ZSEMwYmhwVGpmNnk0QkNCL09Ca01NM05zSWE4UVl2NXpSbVpFWHo2?=
 =?utf-8?B?a1IyUnVkRDhFR0kwU1YvTGcyanl0MGk2K3luM1hZdDZ0OUx2dVI4MituMkNv?=
 =?utf-8?B?bkRpMGRKcGtzVXZENW5sMjkvbmJKMjY1RmRmZEYzVlhFRTNTYVhjeTVxNDF6?=
 =?utf-8?B?UzhJdWpyenJsMXdHVThNbk1RYWNyMkI4QzIrTzVSOHE0bngrK1JIdzE1eWMx?=
 =?utf-8?B?dWRFSnJvYi9DcE5HSVZncXZjRkxPZ3VaaWVZNEtvUWY0Vnp5eklyVjBpY3dM?=
 =?utf-8?B?dktnVFB0RlFzZjdvMWFpWlBDVXRlYzRzeUp4TGRYUGNqQS9QQVZZdXBaVXpY?=
 =?utf-8?B?UFZCVzJmV1BuQlFLRG1iaGcrWlNocWozNk9xSy9DMGVtTU1Ia28vRDhob002?=
 =?utf-8?B?WEo5ZTJacjV0YUhHOXlyMnRTaWNaQ3UrTjg5U01tQ0FWWWFia2hsQy94YXJV?=
 =?utf-8?B?MHcybXovWnVMYlM3c0ZGZWVkaFhjOStrbU1LMDcyU2oxTDhwajY2WkZUenFn?=
 =?utf-8?B?OFdFcUN6RFVIZTF5TnFGbXQ3SUFuRll1YVdyckN6NnMrSWV4ZUZXUUtKSE5V?=
 =?utf-8?B?R2VTYTZWblVXNCtXbzI3TVFDbzRNQUFmSFVVZTJjeFRBUk1LY1FPSk1IN2Vl?=
 =?utf-8?B?aVZpRmFJNEt2bjdKYTExR0dkbGY0VlFlbUZTUTEybkRCb1NoQ2g3V0lRejRV?=
 =?utf-8?B?NVNjWkZON2NqNW1xSlY1ODYxL2FnTkg3Sy9MMTJ4dzRDZ1VqcnpKMEpTN1NZ?=
 =?utf-8?Q?F4MZxF6MCA9VQV0w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83e1868-c1df-4119-0b62-08deab548422
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:47:41.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cuVtP3BCiyTMFVUGuhfJDmywN65Y2cOLEomEV1arW+I1PTsYwPGZ0NQxE/ppA0ktNaiunaMEJPK0oN2+AWjdJkvJ3O34QcxHfgrOJq8cvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6529
X-purgate-ID: tlsNG-4011c0/1778060867-7DF838B7-8DE43AA8/0/0
X-purgate-type: clean
X-purgate-size: 1751
X-Rspamd-Queue-Id: A26084D8E22
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06/05/2026 10:35 am, Jan Beulich wrote:
> As a comment next to one of the invocations states, get_wallclock_time()
> can take over a second. The order of evaluation of function arguments is
> in principle unspecified; in practice at least gcc looks to be evaluating
> them from last to first. Hence with NOW() invoked first, the respective
> value passed to do_settime() can be off by over a second (which is in
> contrast to __get_cmos_time() attempting to get the time exactly after an
> update, i.e. [pretty] precisely at a seconds boundary).
>
> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
> and its persistent side-effects shall be the same under all permitted
> evaluation orders") violation each.
>
> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course the time it takes to do all the CMOS reads (or whichever else
> wallclock time source is in use) also results in an inaccuracy. For
> __get_cmos_time() this might be solvable by having it latch NOW() before
> doing the 6 reads, but in particular for efi_get_time() there's hardly
> anything we can do.
>
> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
> find any deviation for the two instances fixed here. What am I missing?

From deviations.ecl:

-doc_begin="The following file is imported from Linux: ignore for now."
-file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}

I've said before and it bears repeating.  This claim is false and should
never have been put in to start with, and time.c is not impacted file.

~Andrew

