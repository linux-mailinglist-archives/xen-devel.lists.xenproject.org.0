Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMwyJB8w1WkL2QcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:26:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085DA3B1D03
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275166.1561128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA9Er-0007nH-0O; Tue, 07 Apr 2026 16:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275166.1561128; Tue, 07 Apr 2026 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA9Eq-0007kr-TO; Tue, 07 Apr 2026 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1275166;
 Tue, 07 Apr 2026 16:25:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA9Ep-0007kj-5b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:25:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA9En-004zDx-Hc
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 18:25:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d52fdc-e002-0a2a0a5209dd-0a2a450ac31e-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:25:13 +0200
Received: from [40.107.208.35]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d52fe7-ee98-0a2a450a0019-286bd023c176-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:25:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS6PR03MB989138.namprd03.prod.outlook.com (2603:10b6:8:368::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Tue, 7 Apr
 2026 16:25:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 16:25:09 +0000
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
 b=Sw3n8lrI6aKmaGbrirCUhckpE0MqOtT4Gi0BFdmWzlCrx9ipTgeCCsrhUK5tA98ilEu8Zhcz6IsLiqaCCBna3nEGpxT7CFDow6eyYRtsoAcrtONQLeJUEZw0J97MmFPVfmgZtW/oLmKkBC0k9+hYqVlInapkO/tbxccsYCPN4J+OBYdo8wbkDIFnW5OugMrLZ8mLGuTmdJ/bi8kd4qaFqPz7STARRgfo5FHP9GMMhN7VWhe0ntPWst3GigrR1XqhN+i9K1fThc4crket+9IvPlALbE39BJ0QY5OKXF41LHsDlr27qFlr3PAlfLsF35IRs2/tdsTb/5gxtsPJclHjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZ/xf5DEBUxtzmm1/FDTwz6hEYJLWEaVwzn+F+MvuQg=;
 b=J1jrNG5g1k3ZQV+FyrZ9NsOG6IvonWfxMBDhPaeyx1wbzbROQWvQZ95PhHHXBsD2PyN3WDOY6lilq5bAm9/+a85dRCOrTP6mA28zM7g52Kk/8ugRZtP83HZVY/KlZSu5czIAHXR5TZ4CDWu8rIz4mkwqpLuipc+tpt7OjlVOLI1+J1ihryyTwTiiJcm0wbQuURB88YmtDFvD0jnB+8Fv5QgkbdjWKSPDlf8DHWI0iyxEa3EMPPRBe2yep9DiIRKNaUzoJTI25SUjL1aOUzR7SUPRS0A+9xbmmZUo+6cyjoNXV626oM4B37on3GKqTvmidTJ3h33NStTWpiLW33uiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ/xf5DEBUxtzmm1/FDTwz6hEYJLWEaVwzn+F+MvuQg=;
 b=NtKyKIrpv3W7Cesmj1VhlCvzHGifTc3lgK6NViqhK8xInoy7PoB006S+QWMIvhQdVYG3Te8Smukkq5xOKuGBjYwF8CHwyORefh+AJYgXg4j93TZhqQJWLTAtsJbHj20rP28keSEzAdHRr5qpH/bnSysTZCWnI8iwaMPgyKHmYBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1437d989-4b3c-42c4-8857-8f6f42288de1@citrix.com>
Date: Tue, 7 Apr 2026 17:25:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/emul: Remove fallback path from SWAPGS
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260407142351.73049-1-andrew.cooper3@citrix.com>
 <e9056cab-09a8-4874-bcb6-5b39091722cc@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e9056cab-09a8-4874-bcb6-5b39091722cc@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS6PR03MB989138:EE_
X-MS-Office365-Filtering-Correlation-Id: b214fa24-6601-4d52-a168-08de94c23c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mJrZ01CqhXwmHc+roXy6XTKwHCVGLgWjsFxy1n7u32DHz7NQDrxvT5A0z2YDVY617RX7oWn197Avck4DKwhiqk70zuNo8zc4ULJoSjY3g+PY3KQMreY2I37dTMIhPas7MIBUmSTpLvJA4Xm5jcCd1QDYlDDqEAxRkNjiHYAH4Te7vDSZYPrbwhz2/ZCOKsV08w5rM/62BzpYjBZR0AE4XFB4mNm41FO6f7tFIQxQQKFkgTVhiRP8DWmEcj93knI8eXMoePhOlGn6ExcCAkkhIEFc6Q0hNjpo8lW5FOdYhfgb5IMVodNp8rqm7WwSu65eiSmwbz29PxtGq7NT6Klw7wvkSGEJEu7RdDg+w8FJBW3evSgw5LMeUkOWc3PrCibDUuBdWfwb39mcsIYxxBhQcPpvUqkR4zMoHOHYuouFBHF+D5bEAs90PHwEKAyD3uta6I7myX1UQ1OyWSiNX1NipKXi4H0mhQe3iO6rTYizovBW+ZJ/zFL3rqVY1AXGiDG+W3RZ4mvtFE3ecRrc4+ZNysWbdCPz8a4FyscaggSeqbopUq2HshDaHRIyz0s1oYTVBJk7uCIgFew4Ae3zcFSZXtfudHfa45nr2nlqW8sYgUD1tx4z+tA9cRVAIj88rT0G0A2LD3X04r/wMupueP9mlX26bnLe6kIUm2VcixoMUnAhVH4pCVRr0unGbnbDhRLHT3x1qFJm1wN4YX0hQUDI23TbpPIs6mIy28lrNWsvdGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0lEVlNZcjBZVmI2WmpxNklhaDQrWHlsWnl4SFhxY0d4U1d0T1F2U3BUSGRr?=
 =?utf-8?B?cnRKRHBtU0JmRGVJbFJTb0RmeloxTGVRZlNXZGZNbG8vRXFLTksxNkp6Ykdi?=
 =?utf-8?B?eXZpYllBTHBJdENyUmJMYmVXQXIyUU53TkRrMHEzaUJHZ0ZjM2thTkdtWDFw?=
 =?utf-8?B?OXQwM0FtZFN1SE5WVm5icm1kTnJENHNORnQzNzIrcEFpZGoyRUFpZXEycDdB?=
 =?utf-8?B?RHY3Zjh5K0xVclMxUnMrVkx4TUh1cEw3SFI5dlZiOFJ5Lyt5RXRHUytrOUpk?=
 =?utf-8?B?T2xMRFZoZEc1NkhQcmt5c3RQZGRvU3dLNy80NEs2dWFUc0VQb1ptU0ZEZEQr?=
 =?utf-8?B?VEVWcUwra2ovKzVabGl6N2JqblRkQmtNcllhd2cvWFk4RG80bVpJTzdkWDN6?=
 =?utf-8?B?S1U3eDcrckxJVzRVazl0eGsyaUc0MkVMelFwZlZGUjdreEt2U0ZVYlhUVVg4?=
 =?utf-8?B?SytneVhlcG5sRmFXWFVEdVlJYnJWOHArY1VBY3pMWVNWcE5CQnV4SjYwK1dQ?=
 =?utf-8?B?dS9yc1J6RDRBZnJZMFZMZ2FzeFlJRktvS1Q5MnlhbjV1cDdZOHhqWm1vRk5F?=
 =?utf-8?B?WmF3MzJDNDBPU2djMlNicTltd2tuUXF2aGg1bXJyWkh3TVMwNlNGOVZKUFIy?=
 =?utf-8?B?ak1BTmUwWTJ0N3pVVnVSK2Zlems2WFN6OGFFRE5mQVUvZmZQV2FqWmNDWXZX?=
 =?utf-8?B?UVRaZzhKc25DVC9ydDdZLzFFb3YxUk9HSEQyWUlHWGlIaC9UNkFwU0R2RU9r?=
 =?utf-8?B?SnVmUERVTTdVVFlrZzk3N3BrRFQwSEtHRWk4anJhaWxWaDBDNWJ3VzMwUm8z?=
 =?utf-8?B?Wk8zZW1RdG9nMkNqc00vc1JwNjY0cHFNMnJ4TENHd0JkVDlxUmpzYmhJTUo5?=
 =?utf-8?B?ZXdNUzdnTys5SjNRSVNjSzF0K293eWR2cklEU1ZKQVNQWmNJVFpsc1ZCT0hk?=
 =?utf-8?B?WW1UbEY2VldLNzA4L2ltdm9qaTRCN203ZXRhWEJBWXNGM2p0STlDaHZLQVhr?=
 =?utf-8?B?UGliYlhVdVo3allaZ0JuTHJxQm5qbFVNQ1k1OUlHYU5jamhjS0g4ZTVDcFJn?=
 =?utf-8?B?T0dYbDB1bU0zTU11YmZuNEtRREU5NVdPSzNXMS9hU3FtY05qQXRXdldrbllu?=
 =?utf-8?B?bnByZXFiLzhsdjduWmJkbnRsZ2ZaS29weU92SE5sa090VWdnSmJKN3ZXL2xs?=
 =?utf-8?B?dnhsUUxGNXdmbDdrcmwrSkxLRTFMZ0lFWTlpK3RkZlZWQ1MrMkJiYThLVlVl?=
 =?utf-8?B?anVUanJPZDN5NmFqeklRV0lxVHhzUXpKTGlLQ3VFSEJtc3BWVW16eUh5b2hI?=
 =?utf-8?B?Tzl0Rm9VaFJaV3FzVUNOUjl2c0pTeUJlaHdUSldGck91YWFTRVprL1JZRTV4?=
 =?utf-8?B?TUhxRHcwK3pWcGxoQTM2N2NmL0pQTWY0b2RVcnVDR3ZRV1dpUHc1ZEtrUDRK?=
 =?utf-8?B?SGtIKzRXUVJ5Y0h0QlFVa1pncEEvZHcvRFE4VTJnNXdpaGJkTElEbUtoT3Vy?=
 =?utf-8?B?UlN2d2g0UklnUmozNy8veVBYb2pqVzdpZ1VIYXhzL0tkRWNHWHIydVNRMFZR?=
 =?utf-8?B?UUx0bzhxNWNNZ0txOHMxOXljaHV2aTZuUVhBTEJQMTYyUG9oeDJURnppTjJz?=
 =?utf-8?B?c2VEVWlYZ1QxNFpwS3RNTVBmcDZPNDh3THFpd1ZMSHRsaXpPUkdzWVFzR1Ba?=
 =?utf-8?B?NGlKd1BzYVBXYThtMENaSVZLZmhyQjhjSTBGNlRhbUU1eGpaaExxY0psTmtn?=
 =?utf-8?B?em5MbnFjMnRGRTQvWkdQN3FIZEd1VmVKSTBMeFJSRS9oeUI5M2t2UmtqZXk1?=
 =?utf-8?B?VElQTGQ3NW9UR2NvS3VkakRQZE5Xam5WT1pJYVU3VkpHNUllRUo1WGVCblds?=
 =?utf-8?B?MkxUUEFtcVI4VEx6MnRFdEFab1kxUk1FUlh4Q0N1T0JvRFVxU0NVNzluY29I?=
 =?utf-8?B?YmlvZVRxaGpncUFLK2JwdGdXZkVOOVRzSS9pbG4ySmw3cHhIRFlBWmFlbVlB?=
 =?utf-8?B?YkQwQlNzaGJsaWdoRkZ6bE11bFIrbXdsWkg3S0ZMWnR2UE1SM1l2em9Rb2ww?=
 =?utf-8?B?QmprcWRtQUI4WDN1eUN4UW5vWGJ3Y1h3dUlFVEhXTDhQWUtmallBUStsNEYw?=
 =?utf-8?B?RWwySm9VSzlNQk1MQTZNa2w0MmYwOFR3TmNGYU5DdE1oVU5jdjNBRTR1TFox?=
 =?utf-8?B?aHpQMDZvOHVOcDE2cEpQREx4WmdqS1VKbGpIUFQwenBZWnFuSVhwK29sRWg2?=
 =?utf-8?B?alRzNkhXdUlLeGE2OVJtYS8xZDdYTEI1WnZaT0FidzYrazI0OENiTXVZRTVt?=
 =?utf-8?B?R3ZmMjJCd3ptU1BsTGR1MTFoV05pblYvQ2VKeVMzRDkxeFhzUlp5TTlYeFVh?=
 =?utf-8?Q?g2idtlRo8verxSuk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b214fa24-6601-4d52-a168-08de94c23c8f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 16:25:09.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85I5AjJWlKcSm/UiVS5gbba42Z9gsZHiRrPsPwqWO/P6uI6pdddqqiCONsRXEZDoqCwLMs/FK/cj1sH/6OYMxCXSG5OHbDbmq6eKEIjfH0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989138
X-purgate-ID: tlsNG-4011c0/1775579113-0ED4A0B1-26249608/0/0
X-purgate-type: clean
X-purgate-size: 1981
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 085DA3B1D03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 5:00 pm, Teddy Astie wrote:
> Le 07/04/2026 à 16:27, Andrew Cooper a écrit :
>> In real hardware, accesses to the registers cannot fail.  The error paths are
>> just an artefact of the hook functions needing to return something.
>>
>> The best effort unwind is also something that doesn't exist in real hardware,
>> and makes the logic more complicated to follow.  Instead, use an
>> ASSERT_UNREACHABLE() with a fallback of injecting #DF.  Hitting this path is
>> an error in Xen.
>>
>> While adjusting, remove {read,write}_segment() and use {read,write}_msr() to
>> access MSR_GS_BASE.  There's no need to access the other parts of the GS
>> segment, and this is less work behind the scenes.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> v2:
>>   * Retain x86_emul_reset_event()
>>   * Pass an error code for #DF
>>   * Drop goto done now that generate_exception() is used
>>   * Use 2x{read,write}_msr()
>>
>> Tested using LKGS's extention of the test emulator for SWAPGS.
>> ---
>>   xen/arch/x86/x86_emulate/0f01.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
>> index 6c10979dd650..54bd6faf0f2c 100644
>> --- a/xen/arch/x86/x86_emulate/0f01.c
>> +++ b/xen/arch/x86/x86_emulate/0f01.c
>> @@ -189,22 +189,24 @@ int x86emul_0f01(struct x86_emulate_state *s,
>>           generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
>>           fail_if(!ops->read_segment || !ops->read_msr ||
>>                   !ops->write_segment || !ops->write_msr);
> Do we still need checks for ops->{read,write}_segment if we're not using 
> them anymore ?

Oh, yes they can be dropped now.

Please send a new patch.  I've already committed this to unblock some of
Jan's work.

~Andrew

