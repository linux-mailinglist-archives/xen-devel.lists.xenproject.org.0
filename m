Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LbxnJgUm92nfcwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 12:40:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A44B5244
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 12:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299307.1573911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUDg-0003cd-Tv; Sun, 03 May 2026 10:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299307.1573911; Sun, 03 May 2026 10:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUDg-0003a1-Mu; Sun, 03 May 2026 10:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1299307;
 Sun, 03 May 2026 10:38:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wJUDe-0003Zt-MR
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 10:38:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJUDd-002KpM-Ka
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 12:38:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f72592-2eae-0a2a0a5409dd-0a2a450ccd5e-26
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 12:38:37 +0200
Received: from [52.101.70.99]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f725ad-62f1-0a2a450c0019-34654663c12c-4
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 12:38:37 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 3 May
 2026 10:38:34 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 10:38:34 +0000
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
 b=mMfFRqoqGHLB6yzkJ1vg2m3Cg3gAsz+4Fj8sPNkKnm+Z13SMGZWY+V5y7Z9oXmH3Eyt7eTeb6XKkOVaKSUFd4jxJAZIIWjhmwH3Mn61eUGZV8w+7TCneypa42uv6giO3YTr09EOIl8f8WgxPl1ZzZhRVwSb+ucYAXMNoIZ95ABrbdImEi6yO2ZgvGtcOmrgwv8kZMVZW55lzsGyvaLoCfe3OUzQOeBBSb3f3Ggw6uBzX4UB3fi3SS+P9/1SQum0E7yACQM/h7eUYK72EFGxZqBTnqRwhDAFL6JT58mY5qTRfvEfK9YD+GbFrCS7lcmHtecwsXTJYt+WqwXVIZPXgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOiPT3jRF1eMPh/hdxWJHGEFbDNmd8Of8OktvXY2qu4=;
 b=FwMRFRoL7/xqIyTJvdH3/ZCTVtRC+8GLEnkSByUJNMwFWORfn3pOWWaP+H7e5Nvib6rTB0WHZnzYcQj5NEKGP2S5vdn+UeEgD9nSC3xf06c7QlGgtMNZHozo7yc/sIBnA437Kl+6u+WbkMYvspGRj6/3L5hq9H/BRlJFJkPthgAtq31AaavvebkKXkMqEP/rUHWe1L+Jl1Tc138VBkOCMvVn5C6cQ1lmWkB8mGxywD86rXyL8WbJ1fqq+xlMBYIUsaYaN0sgpdx5OBuUskl6dvdSRKOQknOUtVlVt/EiAq9/f6Wkh6GP3f9iKR9kkgKz/tsxtu40tBD+dyEDavg+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOiPT3jRF1eMPh/hdxWJHGEFbDNmd8Of8OktvXY2qu4=;
 b=J0b0qa/syFNES+EpofEIymFGxdRAWV/NeVUnhJzmSeZzDjcVTswBRV6gJUlVgYzHqwdxsuoPc7pVqnXK9NE+8Afd5XaSFccHIzEZ4ivrdnpnZg8qtIsVuRjdmYyGoittvYlIbMeZacOM9X+gG1QadFr4dwHMWGIYNTNeAv5j767bHgarzPEFWqrMOURy319TqnUKBJSb7iXHbS/nyjg/X8rRmVIPQMFjOEdLReXda85xHxdX49hmKHY+ZREtOlIaAaP3CDli1ElF3EUapW/JFSgTsoiYUbOdpq6YgEczrMuTzl2+JkPPf51sSh51SuBXoIaglGeN8WVLyR9XlMUpoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1f498863-d07b-4013-bcef-d178376a4693@epam.com>
Date: Sun, 3 May 2026 12:38:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
 <A7C7C3F0-7359-4851-9325-B65C289C02CF@arm.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <A7C7C3F0-7359-4851-9325-B65C289C02CF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0025.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::15) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d89dc2-7fdb-4610-c279-08dea9002065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WfFkbJkwbCCUmYzW7ohzzf+JE+8BnSp0TtXjlZZMx7wgnVNFJIsVjFbHEFTlTJFGbXh8HcgmxVZ6bQFR4/yy4IOOxCkIUkl/mNi09TetgcJO6yeLXK2lYgnH3olY78Sf6HdkVxavNdpolvAglukJVYWJPEudENyP+8jIRwHfiWej/CrpCMn1QL87p9My9dfLWl7VvuoXInbt9E6GnqdWjwaaHovDUkkI8P1r1LWyMXWYufa2918ajO0pxor1KLbT7xZd7OXM2JcUNCb4tybNeFdx22xhMwmeEWJmBen+wQAXnuBczWGYyS5SUkuU60xwwGKuxFQLT/+GJm8h/tP51LprLLSxQYz0M13bFMreqrAhhWrGznn7hzpqU9h9Qd/thz+Pjf4WpNxHcYAqH00fpzo6ynP/CvB06opDU9UJ7AiuwC9A9SfpB6rhdKuKcxwhghDFT8RHrNhkWVtKYOvuK129hy0fLhi8OzEJ0kExeU17Zn5eHotLk0SPNSK/U9/hktvxGtxmax5iwfbOcGv0YbGj0q38CBQcsfRHp6f6nnxhwWCxB5pyytw2W0gxGvP56xzqgISUsk5efJaNhVyl0ff5jqWkfSZyK+EH4TsQ7k1xkzdjTTGowo563uBhvy12rJpYU8bqlXo/HcHl/19AxSfoJEAmBOP20CJwtc51ntBGvB7uaOxOd72xmVuqPeAA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My9KQ2lFRG5FYmpDcnBSdG5RRUxLZ3FLUDZiTXVxMlhXZytZY0h0T1FOTDdV?=
 =?utf-8?B?T1g0Z2pDOFRMV0hmaWVqQmpxQWdtczM1T21raTBiMWdENU00MjZxRjVSUzBE?=
 =?utf-8?B?WXA4Rzc4U1d5eXl5aHBINHhYWUFmVTFvVmFkRXhyekR2cC96aTRhajVVcUlP?=
 =?utf-8?B?ajBrZ0NJK2w3a3pRdFpJb1o1ZnB5S2prM1JDRE5OdkFwWlROakFGOUF1SGdN?=
 =?utf-8?B?UTRHaXlPQjUyVjRwOGpIMVpPb29FejUrWkxnc1pzK2xDSmZhRTBsaXpzQmk5?=
 =?utf-8?B?Q3U4dlVrZGRkVzdnclo5SlhYOWxFTFYwejkzVmdVMWFuaFV3SXd1T3l0ZS80?=
 =?utf-8?B?RGhBcis3S0JKTUJUeU5YQnVKMjFWRE8yeGpCOEQ1OVZNQ05neFY0RUNFV0Jp?=
 =?utf-8?B?L3daSXBkbmI4N1JsTFJoSmE2eVhERVRlV3ViVU9UWW43a05WNG9YdkFKSGZy?=
 =?utf-8?B?eGtlS0hWQXlqSytlc3JlbUdWbFFDYSsxcmNZSDZyN3FjcHR3SXkrdkJwdXd1?=
 =?utf-8?B?RGU5RUh0WEt6RDRLWUxwRks3aENrOWZuOEU3SVdEc2s4NzZmcFFBUUt1UW5B?=
 =?utf-8?B?cU45aWQyeHduVyt1Z2VIcm91Vm41MDRGcGJMNkVzMlJFKzNCUmdNUW11TnJM?=
 =?utf-8?B?bFAybVA4MWd3RkdTTTYvdWdhOEdMcy83UEk2Wm9seE14ekNjakRSdUJJT0c3?=
 =?utf-8?B?blJkTEhpeUQzNGVNRVc4cGNSWFVPZU9zQzArQ3R4Z0RWbTRSRlZFQ2hjbzR0?=
 =?utf-8?B?OGMvK3pRaHhzZysvNU5RVzVtd3A4UDRvd3hWVFdRdnV2ZVZlMjZnQ0U3Zk5Z?=
 =?utf-8?B?RXEzcFphZ3FUZzBtQ3NDOFlsNFRRRnNOSXFIR0ZkdXR4QW9nQWRleEFiVXk5?=
 =?utf-8?B?Q0YxY3NCZnRiamp5SVNPQ3lIYUJKdzVldk1ldzg0Qytnc0lNaXpBajZKNE5U?=
 =?utf-8?B?OGVvbTZ4dWdyc016VGVEem9mN2h3MDFLdm1HdTdSbmtXbFg1ZUsyTU12Nkx0?=
 =?utf-8?B?c1JTZmU0Kzl3dUVTVE1hL2NCV1RTcGdETnZqSEhEU0RLUkZuZWl3QjhTOVc0?=
 =?utf-8?B?V2RJbmJjWUMvQVVuN0VWRkxLOW1BNXIxUUVaS3dkWnFFN1FXYng1T0pkaXdk?=
 =?utf-8?B?OEhTdkRMb2IrZzZQTlpKYUdzQjMwSjFDeDRKNUt5eVZqQlprU3B1NjdDMjRU?=
 =?utf-8?B?SWM0VVlDbzZuYWlVcHk3QS9UK3pEeUx4WGpQbG5nUW5Ua0lWMjlOYWRhcU5t?=
 =?utf-8?B?akRWZlNUakN3YlI2UTBqK2FSZzJsWlBNeUpmdi81ajQ5TDc1V2YvOWhOQzJG?=
 =?utf-8?B?T2pwdGkwM3p5WWUrdjNCY21qQW5RM2ltZXVYY3p6dmI4Y3hyS1I4VytaNkpQ?=
 =?utf-8?B?cndXK0Z6eXVuZlBxYWYzVkNpZERoTjRHd3UyMG1sbnBRNWxNK0NxYk1lMGNl?=
 =?utf-8?B?T1lBRUVXaTR4d1pRSzZFeFVCMkk2Q0dHYW5DQk1jY1p5NUNKM3B3L0c3ZUti?=
 =?utf-8?B?OGhhSHAraGtTQTEvaGk3VEt6MUVPM0p6elZmYVkxVnEvRkZJVWFLcUcwQ05x?=
 =?utf-8?B?c0VLcVdMRWdIK1IvTUk2c2paM2hWN0k2VmZqZnJnY0lTclRqTnRsQm91bnFU?=
 =?utf-8?B?VS8zNk4xSFFxNmNEbWt2Mlk2V0J2VVIxMmM4TVNrVXU4Rm1KVWkvajZWN3Zo?=
 =?utf-8?B?WCtuL1BwSHEvazBNRDFCYXA0U29xcVBJMm9CSFQ5bElHaDZPemJiMFRRSXVq?=
 =?utf-8?B?RGp0OG5jSG8rSjYrTkpJUkNKNlc1RTFodTYzc25hb1lJbVR1c0ZhMmw3ZmJG?=
 =?utf-8?B?L2F6NkFCSi9Nbitlc2taN2I3ekVtVUJhblAwckhsM0o5RmpZR1NzRnZzaENK?=
 =?utf-8?B?ZWVQeElMckJyQng2OVVlRks5SEpOdUlsNUZkMTlNRmc1Q3V5Nk1BMXhTTTdL?=
 =?utf-8?B?SGRyOTlJZXFLeG84OWJQcHBsTE9wQU5OT2owRUUybjlETzhEUkh1OHloRnUv?=
 =?utf-8?B?TlBubVhYS3dKbHVHUHo3dTNYZytTbEd3alFwb1RXWlUzTEVYcG9IZzZWSGhN?=
 =?utf-8?B?QndFT09oVGp1L0JaUS9tRHRtYkNEYlh5Z00xbCt3ZjRlcWtjMzlQZnpFM1lx?=
 =?utf-8?B?NEo1aUtkTlk2bmVFMEtNYjEvZmVSbzF3VXp1U05aZG5DQ1BBMDdoODZCdHM5?=
 =?utf-8?B?ZnZKZ1dWVG1iWUpEeU1EbFBwRHBRTlE4akRKcTRUZFc1TG56NGs0MFRydlJ4?=
 =?utf-8?B?VjhaMWRpZjNPOGxtUDkrTEZJcFNQMjZEYkFUdGlwekU5OThZMFI3WWFsclMr?=
 =?utf-8?B?VjhUaHV1UVBYTzI0OWwvVVovbU9MRzB6SGdiTUNZMDBwMXFBRzQyQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d89dc2-7fdb-4610-c279-08dea9002065
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 10:38:34.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSgkTrXSSMwfYrqG+Abe90za1IqVbas6XGD6JCGH3+zTa5usEgGDl/YLRr/rhfvK+ls/IGWpn4DwEeWU+MsVng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797
X-purgate-ID: tlsNG-d25034/1777804717-6CB64CF5-4A076ACF/0/0
X-purgate-type: clean
X-purgate-size: 615
X-Rspamd-Queue-Id: ED3A44B5244
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Luca,

On 4/10/26 13:39, Luca Fancellu wrote:
> HI Milan,
> 
> apologies I missed one bit in this patch
> 
>>
>> @@ -721,6 +745,9 @@ int arch_domain_create(struct domain *d,
>>      if ( (rc = sci_domain_init(d, config)) != 0 )
>>          goto fail;
>>
>> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
>> +        goto fail;
>> +
> 
> Here if this fails, we call arch_domain_destroy(), however in that function we don’t call
> viommu_relinquish_resources()
> 

Yes, this is missing. I will add it in the updated version.

> Cheers,
> Luca
> 

BR,
Milan


