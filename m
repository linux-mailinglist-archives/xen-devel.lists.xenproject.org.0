Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INqaGlqnBGogMQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 18:31:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE553716F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 18:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308299.1579807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCTz-0008Pa-BK; Wed, 13 May 2026 16:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308299.1579807; Wed, 13 May 2026 16:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCTz-0008N9-8c; Wed, 13 May 2026 16:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1308299;
 Wed, 13 May 2026 16:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNCTy-0008N3-8h
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNCTx-00Aw6h-Lf
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 18:30:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a04a729-5cb7-0a2a0a5109dd-0a2a4508caae-30
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 18:30:49 +0200
Received: from [52.101.46.61]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a04a737-63b5-0a2a45080019-34652e3d8fe9-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 18:30:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7004.namprd03.prod.outlook.com (2603:10b6:510:12f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 16:30:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 16:30:40 +0000
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
 b=PHAgzclBOy0KiY8/NskGUTS6+l8ybIEgcIR0BG73MZ0HvisoQZ5at28cpW5jems5iAfgJ+RWhPRd7MbRfCTeXu+eU3kD672Hp94HhUXEuZ/nIj0ip0m/wiNGwK2n2+UAM9jhD9YBF5E/2f+tnjHpfnTX+Ks+5ohPL7dPEtvIiAxOLaPY7NS15eIgKf7EIwOM0tjxoEjYIYEcBUjyjVDWTgVZ2lQNGDjefP/Wb2FzlmmqVx3PWC8+XWz8ZqpLaFN1Z12swpCidEgmM0pAdF2Kgi4Y4B/5r3LBTcwvP1EDaCaUraPjJSZ46W/P19i1dekuIUNW22Sp7a19E+EobA1W0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyPWBg0WNkDbUmYtGEKxrmSMSV4aYAy/myxnGMI0bIQ=;
 b=cSN7DH2JVmprOcOSChUTw+c5c3WZ7qPi93x6tIIM7bV1dhbp8NLUN1HLa39d8mJofye+2R6LHIE/3Q71M85hsQ9HUu/TX356jqS0f62zh1YkIwNhpP8ycQ1VKEeDtgpaLyBc+kng5j5PPLBqPJqssYf3rdWSTsKPi67iANTNa4Wtjpr6qZxuu7lPZQjx7486aLQv6NgbU7GpFm0tVj3PW/1r1Y87s5S7179m6T4V94Z8i3gEV9D9IvohR4FYcucoban+JsRw0tjhMb5+8+q8YHwi+bJYGQ5UX6MGpyao0Ct4npJzh/ZEpoXhF4HJLA0OlHDRIkr4wwIDaNlPat+kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyPWBg0WNkDbUmYtGEKxrmSMSV4aYAy/myxnGMI0bIQ=;
 b=qHRslhtKNopAGB2f3sVWQ5nqAToNo2p00NUYxX1b83Z1A3Zy2wvei3EXQfSuGWAdiSwa0SZWzEHw4yWb/hN/aNCNi3Lw5KukvSA8G1eq0di69gu58BJ+HKv0FyEh9pfLS0NT45nlcXnVVc6tipjr+2pUm/T8h8y5V6E6OPi3a1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c82c5255-f2df-4822-b03a-c90ad3759e9a@citrix.com>
Date: Wed, 13 May 2026 17:30:36 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shim: adjust for Misra C:2012 rule 20.12
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ed512e2e-a3ff-4fe3-8847-80985722c4d3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ed512e2e-a3ff-4fe3-8847-80985722c4d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b5019e-b0ef-4bfc-5a6a-08deb10cf8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Y96Bnq40mPg97ufRTG7RszDIlS14oYifS0TDFRamE/vBt1bReG4p9zBSEf81RcdEp5vAP2lco+9sq+oi9Lm4Uu8RCGsO20xE2T4klHHuXgzYj45Aa4d8nmvyGyu427P/Iw4Y38RJYaaAbG+FDvGM50+bQdNSnkfLb5PnmB8oLNTMIqoX4RAl1t1W61B4pZCYDC6FdnfezBQPwgUL21oxq/XY0RRTUbS/imarYwqanijoahBYD6dJe/BYdI30z/KogHWsQL9VB9ZgbICimrX2l/nAESqY45OlxmRn5ozr/+C2bBtAFDb6pQj9QRIjn5UYjgy6WspqnQj+SVRtnuSQu5lleagYxzBd+f4ehYkcZ0ZqBkiSrfwSKgt/HeqzNs7CfDrQ3s8pTUenbuJTXdIyy4MEtPRDiMEnnBmwLMhgyHGqiHdHrLZuivBLI5ybu4rdVe9nkDuKM0n4i06D0qlpDoIPMEJjFSFqU/RudPAGmQL4WkzpbUrQ7UFYiO9f0GOaCVAi/lAe6Z1BVyjGXQcc81/ZSGuH5ZnWmsMEu15E0AOdtoH492DWB74GObnVCiDbo+UK/Fj/WtjdTGTRBMZvSZqXwP8FQ4+YGMTyckYLPm4g7fPsI/2Y0cMad3tE4uXQdN8CGaH+S+aNEuuqx/n1/Axp0AMqAFf1lVOAphLHfT5dJGz4jyrxfNkq2/BJtNelWlxXBb1b7ugYLgwAysGSSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzBTT0ZmVDk1UUsxZytWNi9sak9MZ0o5eDdGWFNtZnFTcFBTcTJmTjZYbTJK?=
 =?utf-8?B?YW1pZDRFRzNvUDg5MjV4VFpIT3ovUW1wN1k2eE0ydFVSMzBUbEM0QmpIdmlj?=
 =?utf-8?B?TlVkNEE0RWpZYVk4SHI4dit4VFZVS1lYRzU2Y1ZENCtjSEtuWlgvOW80MVl0?=
 =?utf-8?B?SzI0RjJqTmx4UnhrVlJLaVdvdW5yWjdXeXFOOWV4bE0rVDBWdVhSamozVHp4?=
 =?utf-8?B?ZkQzZUdyNmRhNFlDTGZvOTE4bysxRmpYWUJxVWZUSjZsZXk4WDcvZmlLUHh6?=
 =?utf-8?B?NFh1Zlc3eHErOEFNdHEvSEdHTDJBMzRzeWNrVGZ4OXlmQWMrYzFJV0JjS3Nw?=
 =?utf-8?B?N1JjNit2UEV1WDZlUzNXTUpFZFpEbEFpYithUDFwQktISzM0NnJ3NVBsNWdR?=
 =?utf-8?B?QTgvMk5MK2dzdFpWMnkyVG1kSmJaMnJBUnovZ045ZnVwZ0h6NDMvWFZrNGxD?=
 =?utf-8?B?d01wZ0F2WUJ1OEJuNTQ5K2s4akNJaTRyWkpWK2VZcHR6ZjZpbVBTdmg3Nzg3?=
 =?utf-8?B?ZkVoZGVMRGx2bWgrNVRFUVBQTTBDREdEZU1vNVE5VVVxNFFaQTA3QXgvYlpk?=
 =?utf-8?B?ZU5hdk0zZ1ZwSFBLSEJUS0s3ZlhxSkVEZmFwb0VUdE0yYXA4OEVPMVlkVWwv?=
 =?utf-8?B?bngwd2hCTlkvYXpPWDVUMnRJUUpiRlpaTGZZWkpKUkxqQlJOUk5qSlN2T0dt?=
 =?utf-8?B?dXQrWGFUV1lkNHRYOE1zeGFvcUgrUzN4bExsai9SaHFUcmRSZjhBOGZQOVNP?=
 =?utf-8?B?Qk9Kbm9zZ3JRclBKR2NHSi9lSStZQS9HaGdNVUNreTlRTWxkT1lSeVoreTRu?=
 =?utf-8?B?VldnSGxFbVgxV0cxN3gza1BkaTJEeDRWd205MDdVNGM3Tk90aXI0M08wcG1O?=
 =?utf-8?B?aExIVVFyV0xZVmc3Ri9PZ2FQcWRHSis2RVlyQWVkVTl0eHdtYVljNXlhMWxY?=
 =?utf-8?B?cldPaTZHMFRkVkNNQVczb2duejZmY29ZMVlGenZLczBVdmRVNXh0OWpiNzJI?=
 =?utf-8?B?dnh1cWh2WDF2SmdHRWZ6YTlwMXNDVWlMbXRLUHBoVHFZV0drMkhNRi83Rm9r?=
 =?utf-8?B?WjdPME9CQW9ZeER6ZzdJMFkzMUpTYnhGdmU5dW9tOVZ3TmN0L0dnaElIaklh?=
 =?utf-8?B?bElkTHJ5MjNQWHBsN0FQSXVMMGtXWlQxSnNsZE10bjV4SGU5b0tKTGZDaXU2?=
 =?utf-8?B?dThIL2VpalAvSGhFSUorWjlQb295MFNFYnJDTFJSSHRIc09xT21iRE9qN0F3?=
 =?utf-8?B?MlFuR2hneXNUanRCWDRiNmNMbmVvK0ZtdFMyYjFZZkZvYmZhNzhONlB4L2h4?=
 =?utf-8?B?a0djTERTb1AxL25zMGxyNnhYdmNZVDZLbDBwU08rREtic0dDTmlzRG42NzRB?=
 =?utf-8?B?ZWh6Y2YxSGVkZDhob2NpbnptUHBrZXcvRHJzL3lIZ25HZ2ZFelUrZGI1cTR2?=
 =?utf-8?B?RkRqTTZXeC9lRSt0UFVqVDlMNUJwNmJnTTVWOURuUHg2SnBEYlNmdWc5YUdm?=
 =?utf-8?B?dU9BSU9iZCtiTCtVU2NjMTY5ZnJoWThpN3NvTCt3NlZqWXJ6Qi9Pd0d0d3VD?=
 =?utf-8?B?R0FlQXlTOXEyUU5kQ2pWdzF2ei9XZlNhNFNQS3R6QnlRUXZoN2FEMmdkcHRV?=
 =?utf-8?B?SjV5cTZxWHpZRzR6R1ljZlI4M2hYbFN0UzMvNmlnRGtEb2JZMnRuaG9FR2ZB?=
 =?utf-8?B?L2xGZFp5K3ZHTmtobmNGWkZ0NnZ5T1ZmTVdXNFdIWmRJaFl0RGMxNW41YVdw?=
 =?utf-8?B?Q3VHcnhtL0RQVlNkZEZrUW9oSG4xdUUzWHFOSTBjUTVhazlINk9EUTkxYVc5?=
 =?utf-8?B?MGdCQWFQZGt4Q0JUaU1pV2pBOVJyU2prSEVzZGRoYWkxc3J6WU1jeWt2ekpH?=
 =?utf-8?B?NmwwL05wa0wwRG1GdFhrdlNaZ2Rlbm94dUFKcno1TkE2a09HQk9CV25mTHov?=
 =?utf-8?B?V01Oa3YxSUpUZm9hS0pOTklxMFN0bFFZUVFOY3R3WjJwOCtFUzdrMzBCdDFr?=
 =?utf-8?B?MEZkL0g5bEUyTitYZXVscjZ1QnN5ei9WWWp1TGswMFdKTm5tU0tpL1puTHlQ?=
 =?utf-8?B?dzBySjJyYjA2MnVTOWIwaGJqdTRWcDhWUmE2bzc4L215M2podjVkZmZSN3Rz?=
 =?utf-8?B?TVUrRnRFd010ak4wM1VmTkpCeEE0TVFoaDVYbW1zY2g0aDMzZlhoT1Q5RzBs?=
 =?utf-8?B?cjVaNW5oZUwxVW9vVTN4bWdFdDhzV3UwWlBmdzBKT0thcnBRM1NlYUNFK1hl?=
 =?utf-8?B?WFlhR0sxYVFFcWUwYllwaDdRbFdSRUJOcEJrSmo5d01mYUF5VjBYcnhzMVJ5?=
 =?utf-8?B?TWFOWEg3M0hnR25Hd1A2MDVVbnZtaGJBRGxhaC9MNDdwMkRIaWdzTFNxeUZh?=
 =?utf-8?Q?t5m/0ZwR8w2lqiG4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b5019e-b0ef-4bfc-5a6a-08deb10cf8bc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 16:30:40.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+CRFR5XfCoMVmR4G8V+e9eKtbiGK/3aQuZcFfpu+DCDCCsgBhbP5b1CqJpraNUPcwpYY6Z7cRfEcEsbRQiGMxJQhSxtUcZWp2kjGlRQqy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7004
X-purgate-ID: tlsNG-c1860d/1778689849-B596DDB1-2174A34C/0/0
X-purgate-type: clean
X-purgate-size: 1068
X-Rspamd-Queue-Id: BAFE553716F
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:mid,citrix.com:dkim,suse.com:email];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 4:52 pm, Jan Beulich wrote:
> ... ("A macro parameter used as an operand to the `#' or `##' operators,
> which is itself subject to further macro replacement, shall only be used
> as an operand to these operators"). Move the HVM_PARAM_ prefixes into the
> macro body, to use ## on the 2nd use (each) of the macro parameter.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I understand that this "absorbing" of prefixes isn't liked by some people,
> so I'm all ears towards alternative suggestions.
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14354119193
> (also covering the 17.5 patch)

Yeah, I'm a firm -1 to absorbing the prefixes.  This is simple
obfuscation just to hide it from Eclair's eyes.

The ARM folks fixed this by using a SAF-6 annotation.  e.g. 195d754170891

Although honestly, the more I think about this, the more I think we
should just globally deviate.  I don't consider the concept having a
well-named constant be used both as a value and a string a confusing thing.

~Andrew

