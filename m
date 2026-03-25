Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOe/J+/7w2lXvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C8327A96
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262583.1555035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Pw7-0000WN-4E; Wed, 25 Mar 2026 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262583.1555035; Wed, 25 Mar 2026 15:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Pw7-0000UW-1O; Wed, 25 Mar 2026 15:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1262583;
 Wed, 25 Mar 2026 15:14:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w5Pw5-0000UQ-4R
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:14:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Pw4-005Qki-1Q
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:14:20 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3fbb9-bab6-0a2a0a5309dd-0a2a45079af0-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:14:19 +0100
Received: from [52.101.72.108]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3fbc9-fd74-0a2a45070019-3465486caf9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:14:18 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7026.eurprd03.prod.outlook.com (2603:10a6:20b:280::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:14:15 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:14:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDhswLNuQU6AJ+o4ski3QweA7WDK411SbzAITywOgaHlapE0ccdjB8kVIEBZlo2SR27ANnePFoRxSUbVSAt9Pu8HIa9/VWo5rkDGH3BhStiOawiaecrgm3aEoCpGXyzY2c3OZP2nJ7th7CW4kdJX9QZUqEHgFYBiOX4pKWRDSQnrKJPUDttmf1lDBU8l6hXKkjIna1jGvfgfftkhkSthE+uREynDUkNTyZQ9jXnI1qJTFMBle7eplIEWLd9mqdtZD3bA3UQ7S8CUrOR34nbff+fxfG3apjG2SVX79ZsFE6oIQKIp6z8jQniPAVcVFvh0VuOgoc2FVdvSDYDvKcwNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CL2YapEIHWElPPtkTCLPLMf2g8TP4z6plQvXNazHVs=;
 b=G0oXmeow/N217h/SR/7J3yTAwZCEvb19qjAm2uY11ysyDsnYEmLjErmTYG7afH0j5ThJTrnxMKfvm751pnsCAzaQl3d2ys3v2Hok/XTskrZi+sLj2vMhYjemLRKp7GxnGqu1K284BNe4nmMqbsW2HBYJCMT0t9NnW9bnuql4uKgmICuCJAYEwFNB9teG4qVnKaSvPWCFySxAeguudxglJT2s7FZr85V4fQLAHl9zk/CS2S4fw2/T9NU24qNG+HIyeDbU+e98uZ65euyW1dLItShguAeqgatfwsYUynxzAMElCC29xZ84F1qB7jEn39wIXKfh4CJZhd2Pj7upztsX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CL2YapEIHWElPPtkTCLPLMf2g8TP4z6plQvXNazHVs=;
 b=K53luWZGSrOtOp3a6Sk7rgmradDq6urH82BiHig0jdnnvaI8TbTKoiw8nmWmvS9aTqS3hTfThJQ6xe8at4UsaiCSwPWUI8PsLH0fe+tbsF79gMs6qZPw0rgbZyMuRQI5F2ewqEqwZWmF+vK/SpcbYjNfv0a1Dk0V0NNdayrJspelEmeqHjbZ7bY2Cn0wu/GIbCCifjfT9MnVCJPQMVBZou73h/8xQdfZ9dtlVwbqoOThAtSMKSjsGlx1dv1v/onrnvpRYR0PpnWpjwLBP9Z7qsSuku8AtUD6C1tTj/A09NnCwxhmhv/ViCslhRrnMgbo85rBtGh1SqiArB98TXaVKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fee2fb06-f9ef-4bf3-ab79-89dec28ab2f5@epam.com>
Date: Wed, 25 Mar 2026 17:14:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: validate RTDS putinfo period and budget
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1a235cca6f37ee3d3f03132675247edfc19953cd.1774431761.git.oleksii_moisieiev@epam.com>
 <f49dcd5e-d905-4f43-8143-afd7209a1300@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <f49dcd5e-d905-4f43-8143-afd7209a1300@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::6) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|AM9PR03MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e34d03-2eac-44f9-b73c-08de8a812d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FoKzt2snUbl1KDJ2y6w2QPWeqEi65qPYqa1sZf7qBTufM5lihwsQCSszi11ws2Qxtc6lvZDe2Xk+W5MrHCzzkS1LGKSHdjilRWoDvEoYAzXJKduopiUi/2sTAsMixBnNt6AlRybnBxyIXhI9d2CxiOVwiSJKJH3cCnpap3RRq4VFPyyxw7ZPI8kI87DIMCYBDpCiNa3KeYrxVMBGD+/V2uk3OSlFk5f/RNR7fo19VLSaJVPB4qBxf65WoLyAjCXaVnBicQeyJR6kfXl8XIjlNnCs2ecYp3isbx9E1l1BA9YrU/XhwkjavXqWODbmCoi6uTDUDBOtUqZq1TpEzP9ghkNZx0fk7jUvgzLFjnYF7K6xBjme8fsWRTYOsm98I2gPMTRmNSqpYon/yJqGBbhY30ulaIdjaMacrEWGo4Zj2hfNhzQzOFSnMGRS5yyONrlw5SZ8wdyz3SPaS3lO5aIM9E0WxRWIrMgzzi+UrUqhGaGEhJEIti+VaxJHQtkKNwfFlo3U9+us9VxcvqAqDd3tW9rxUemdj7L9QU7+eBBFC62b3haHFZ/+Mh+BFVZVDIDlzIZjbWDwHwGPQH0VB1Ye+cBM0E1x7099qVRmfJ/VCYYFwY26h6+HKPwsZQZrQVMyptADy2knkxePuFJ4ATY3MNw9iFQISuknvtUSb0JJh+wWHhzRvz6Y6V59MH+yY7YYwxyZqPJ7CLuWBu/vKvtOUJ7jPXqq6T7THp/Z8TpkvBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZrY3JKWEsyU2IzRzVsV0puV2RBY0FXNFc4Qk9kakZ6RVBDb1gxMjVBSlJH?=
 =?utf-8?B?b0FTdFVMYnBjcnJpV1BMdkdwRjBEV1F1bkkyZDBKRUcvZEZmY1dpVGIxd2Fm?=
 =?utf-8?B?Qkl2TzlLQ1lVSDM5NEhDZTRsNmwrMWZtd1lqZTNnUnBMZFhHOHl5UnJQKy81?=
 =?utf-8?B?dVZXTkhZbTk1UE5jRUt0VXJ5ZVRsRUV5MFJkVDBJa3QzbHRheFVNSEFMYksw?=
 =?utf-8?B?RURYNU5pK2ZGS3VsS0h3Y1ZUOTFuY25IU3k5dVljUFpJSmRhSXhwUWR6SEhR?=
 =?utf-8?B?MnJKcy9lNG83T3lXWXNWaG0zeDJVUTV5RVMyYU15Z3MvRytSZkdTdWxmSXd5?=
 =?utf-8?B?cnhuK2RtU0F1TnBua0Q1eXJTbVdrdGFRVGZpRENlbzhhS3c2cytWT1g1b0Z2?=
 =?utf-8?B?Tk5UcVo5L3I0YnJzTXV3RHVnQnBhUm5DVkdTUjVlODlJTDJ6SDMxcUtwRklC?=
 =?utf-8?B?UVdNYk9WUDZoVldPNFVVaWdhTlhnS1ZOVXJVRmJVbXpJSXpDc25jU0g3cU1K?=
 =?utf-8?B?TzFsVVFnUnN4Slowa1FCOGE1UmdOMGNWSjNpMnhINGk0aTJsaU9UTmM0KzZX?=
 =?utf-8?B?ODVQOGZXajBKZ09jVGhscGp1NWtFaEorOW5MUndKTitmbUxiMDFtdVJkWmR1?=
 =?utf-8?B?MTBXeGtBL1lxZGFxYkxxOWRxbnFZcVFjZERZVUgxRjU0eDl3clh0M0xEUVY2?=
 =?utf-8?B?d2ViN2plWmlFSitENU9McTdrMWNaSmQ3ZE5qMS9YMG8vakUxWWRucXV5cTdF?=
 =?utf-8?B?V3hDTUN2NXIyZlFCS1pSK28xWUM2eTh4VFpYVWVxYVhKbCtpT3B6STlsdVZ6?=
 =?utf-8?B?Qk1QME1MSEM4RHIyZlUzeDlvdFNIRDlWL3Y0clkzTjV1SWI1RWFvVHhVNXlZ?=
 =?utf-8?B?WGtveTRWVlBuZE5yUU5lR2dYUXN2K1JUbUltUGQ3U1N4RXZnN1dUTXNqZVZG?=
 =?utf-8?B?MzZqcjcvc2VKemNIbHpjd3Q1MjRraFMySDZqUkJnVWVpLy8wQXA2M0wySVVu?=
 =?utf-8?B?UlYwL2RrMy94bDhKSDNWOERCSkZkL2dFOUhaR2pEcnVNQTRGa1dpQ05lZlp0?=
 =?utf-8?B?dTFVM1cvYVYvcGlicEFhOEx1YTJxeFNmcHVzVHNkM1dGWWRkL3Azb3JZcnNU?=
 =?utf-8?B?K1FQV3Y3dWZlSjZsQm5UaG14bVF1N3lZV1VaVmVxN1ZXUzJ1cFFqUGx0UHVO?=
 =?utf-8?B?RkdobDZqQmppQUZBTm8renE3NGJBR3NhazNKT09DaWU4Y3NOOWFpZkpqK29X?=
 =?utf-8?B?WXdRc0l4VEM5STNmRmxCOCs3NkhKYzhSQVRVYXVDR3kyT1lWQWhkYXZ4aXpV?=
 =?utf-8?B?QktoZVFvemtQZi83dXpwejV0ZXdGUGVqQ2pGaE00aE9qQ3JDUWJJNVBVbW5t?=
 =?utf-8?B?L0R2VFFhQ2UzdjNQYnFkZTA3K1lHTm51NC9TaUxJZktFWUp5elJOTzlFU3Vu?=
 =?utf-8?B?ajdLSzlTbmpyYUc3bHR0OHI0MFlOcEpBL2Urc3RvU093MER3c0dwN0grU2ts?=
 =?utf-8?B?N2dZZS9lSklkRWNxcU1wYnRaTWlLd1JkMHFOWUdsUjN1a3J6UUtoSnhaT0xl?=
 =?utf-8?B?RU1xcy9acDFHb2RkYjFGZVAxdW1VRVZLeDQ3bGlmcTlSNnl1R0NFWEFrU3BX?=
 =?utf-8?B?R1NwM2xjcXEvY3pRaXY5azNDMm9YQmlJTkNiNTNiRXdPT2I0MGVscTZwMUxq?=
 =?utf-8?B?N3lYZFZSeE5nbVJrcXY3TnNJcHVqcnV3NGNXYkd0Q0ZwTEJvS1VWZmNQcnB2?=
 =?utf-8?B?OEMwbDIyeTBJcXg3U1RJT1RYUzJjNWNTZVdZN1k4cWF2S0pMeXI3TGpEaWRr?=
 =?utf-8?B?OWJOWGJjRGt6OFpIWUpTZENiN05Wa0p0Nm44WVN6dUE3U2xVM2hlV2xKdlFa?=
 =?utf-8?B?VllCTkpQK2NRdUpxWDdkK0lXUzdsTWVPVVAvcnZYUmZheTNKV2k2TGxhdTEy?=
 =?utf-8?B?aGViQXMyMXd0VThHOGo3RDJ6b0ZxTnRKVzJvM3lUYmpIUGUxRk13TS9IMjQ1?=
 =?utf-8?B?YjVHUzdwZ2wzZGtCRE1xdkREZlJ2bEp3OURCWWpnY1d4bFdLYTJrR1Z2Q1Ni?=
 =?utf-8?B?WmNVMUE4emZNdHFhd0JmZDBpYi9acThlQ25Sb0FlUnNIbGJJTUFwbUZuOWpF?=
 =?utf-8?B?dEtUVzI0RVEyaXZ1SFpSbTBWWDRQNmZEeDRYM2YvanFCR09WVWo0N0pjREtv?=
 =?utf-8?B?TGNiK1dqV0gwaXVPYkZRSk1QR3E0RXlBallOaitpc2drWERaZkJCMkUyUnYr?=
 =?utf-8?B?ZUpXZUh1YXVVekR1UmV5TVR3VVo3ZklaZHdCWHR0ZzlQaWl4UjM1c1dPL0Fo?=
 =?utf-8?B?OU8yaTIxbUQweng1eXBhQVloYjlESDlSZmtLR0hHTFZsVndlQ0laYm5MZldh?=
 =?utf-8?Q?WpRU/J/rgv5/wFAM=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e34d03-2eac-44f9-b73c-08de8a812d4e
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:14:15.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izLsoKNZYE+tfPBtzFvJrY7MJnBlYiKq9ghazJtBDTnmJhblGvPfGUjyy1SHZWoWIzRKEHQSkK2ehAgEQCcl82pGsq8D/IpIKiDN93XAHNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7026
X-purgate-ID: tlsNG-ef75cf/1774451658-566AF303-82FC127C/0/0
X-purgate-type: clean
X-purgate-size: 1936
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 124C8327A96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

On 25/03/2026 13:50, Jan Beulich wrote:
> On 25.03.2026 10:43, Oleksii Moisieiev wrote:
>> The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
>> zero values before applying period and budget to all vCPUs in the
>> domain.
>>
>> This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
>> which already rejects values below the minimum, above the maximum, and
>> cases where budget exceeds period.
>>
>> Use the same validation rules for putinfo as for putvcpuinfo, so
>> invalid domain-wide updates are rejected with -EINVAL instead of being
>> applied inconsistently.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>>   xen/common/sched/rt.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 7b1f64a779..62188f37c6 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1388,7 +1388,10 @@ rt_dom_cntl(
>>           op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
>>           break;
>>       case XEN_DOMCTL_SCHEDOP_putinfo:
>> -        if ( op->u.rtds.period == 0 || op->u.rtds.budget == 0 )
>> +        if ( op->u.rtds.period > RTDS_MAX_PERIOD ||
>> +            op->u.rtds.budget < RTDS_MIN_BUDGET ||
>> +            op->u.rtds.budget > op->u.rtds.period ||
>> +            op->u.rtds.period < RTDS_MIN_PERIOD )
> Besides there being an indentation issue here, are the inputs of putinfo
> really in different units than those of putvcpuinfo? The latter first
> applies MICROSECS() before comparing against bounds. Assuming they are
> using identical units (actually, they do, as putinfo uses MICROSECS()
> when storing the values into the internal structure), I guess you'd best
> make a small helper function used by both.
That's a good point. thank you. And sorry for the intendation. will fix.
> Jan

