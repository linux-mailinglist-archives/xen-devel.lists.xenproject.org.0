Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePWCHi6exmnrMQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:11:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD23467DE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265846.1556593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68pi-0002c2-96; Fri, 27 Mar 2026 15:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265846.1556593; Fri, 27 Mar 2026 15:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68pi-0002Yz-6Q; Fri, 27 Mar 2026 15:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1265846;
 Fri, 27 Mar 2026 15:10:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w68ph-0002Yt-3L
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 15:10:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w68pg-00D2BO-Dl
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:10:44 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c69ddc-2eae-0a2a0a5409dd-0a2a450192fe-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:10:44 +0100
Received: from [40.107.130.78]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c69df3-6400-0a2a45010019-286b824e97f5-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:10:44 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DBAPR03MB6392.eurprd03.prod.outlook.com (2603:10a6:10:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 15:10:42 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 15:10:42 +0000
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
 b=kI0n9VT5yqoUt+quJM1BvoPMBRLenfrW7vlEQqNO9jv0HlU+uZw/PfUgumSxJrbdqx0sN+Lz+eJOvoY37XeKwgC+oQHUFdtsAYSLloQbuVeb69BgIAQF9W4HJRvhGPrc8hAn/uPRbd2yL02Xks9ZaQaqH6qHn7f3rFQAiq5hN0jfd7CBH9hdFftACPvt0c58IPa8+tkAgShnufQoTToZv9RwdrEGkrqr0OnCffzoaaHyTZJEQ0C8b8Rk8HjzZXm3o5HW+eT6Kz8xP+9YZxP4WqBptlenlJlVHaCWVSnryZGgIUws5O/VBlspUbCT/OP830XVEqQTLM2s1bz3s03hUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyE7EWmKuzN9aNOOfrcmBtZ9Fgo2lRaTMao1kbNldko=;
 b=vSK5PSXnjx4PMXpmn8TGL0Oz6W0IX9oPzlmfEjdqh9OOMgulEKZBVwBk9/93oIlzfXhXKwaPuY20WwwESB38u+Z7WJVRvsdAG60bCzZ/hK1xsU35k2qlBtBcU+qcy4ZFXCe0b65WF4PVBNbelPR9sSeEJarXtb8DwGvkjoS3LkNWu/2NqCLsKdiATq6Elq8p9W9GivLFOjDz1MsLelTLwRSyIGi7DyujFw/rwYAHNM9z/HJImHiNKFoDKdAp/9URjXxksTE06IWSfTuOC6xfDIukZs+KokgaUxHJAhIIYSTJ5hcbmJ8bC05Hx5fSxiZ28EAoo2D6bVGuRyX2w/jYAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyE7EWmKuzN9aNOOfrcmBtZ9Fgo2lRaTMao1kbNldko=;
 b=ornsokGPMMRFFntiSxXhBvrxX6l6aYFGHNUuWti8aN8pK4svjOFp/pACcdc6hLApLYJ0gRDCn4/x29EQWNYxurq20RsiqINo9Hpf5ABia7F3nCvzj28JvSDFL09RE7bkJHPgAhPKgIGN0wtv3aPib1vjaUljiqWYW1o0VSiOGZDFUx55oS/rMfmGN5Aj1i6XGwMZ5H0AFgHnQx2hmUTJHpPKJL+ajl36DvBE2ZWSXsDBgn5rA9CDUML/rexT8m6yPd5+EtJrUxMaF3xXR9Y2LCYbVv4UzKyi2vizR7YEFHP1pQLTtLrGTjk6gG9GPrNxUkwNLD1JLbaUqOICC0H3QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <232076fe-2a9c-48da-8969-0ef63e971a20@epam.com>
Date: Fri, 27 Mar 2026 17:10:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
 <7e21c108-f747-4805-8904-b116bf04be89@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <7e21c108-f747-4805-8904-b116bf04be89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DBAPR03MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 819724d9-efc5-4466-647d-08de8c130377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ver4D+mQ10Hcy6y8yUkkHUlThOTzkyfzCOLohQHUQwiyjk7cjqSsKV2YB2rdrAaCyRlZ4UA35E9Hw5mUdgxUbDY45zovcOHaJCXGgA3/7sOSMfHb6Gw/JMDESM8nc2t7c9e2AQLiyz58QR35U50ZghD9HvrKl3jocWhYsXJpWIAjWDkJfgKo20xQuvwKNl//0qHetsqhWTAuYjTCIM9Wu5l335X+Lg1j4V5k1bwQ8ZnwYunYce6du/lueWCjfS6TB03oYMIasQvkLtd7NeC3GszMH5DKNeFVrOsMYw1H6efY5B7l81xbq1xohyN/J+8lK0WgxFEs3ILugzh6kacnWaj8/69TQV6rr4b6wqpUrjmye6HQd4l/lIQG9+FwBH0MqaQrPIPptO0POIJZpjc8//R/LYv8LKtYNdknFYeYk89OuMNOyJBqhyjQrsgw5pvJ6iXm9XQbWkwT8PG0k5j9dR30X7JOFrukqYzLPSe1XV7tB2krz4yZMs1LJ70+vpPwxxNAk4wQOYS8pk4c6lr3eFv7ELAx07NIswsaFx5cNR5kyvL74hgs+kTEducWnSaqaNPEiZ27ZHnxB5s8LliQM9ZyGgz4wpbhPQNqIApkzStidF+N5PSEjBGgNqiFdFjGXhfCfyiorlBNuYkBovdM5CekQrKlevjXNkKgqonihAhIUsPduKn7aMHjMwI6LCqsFwlt33PcyaP31heu6L9CiL84Tr7QmzC15FyQkYSYtd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WS9UUWhpTDc0dmM0YW5adHNQcmg1NHdqeUNsZitJaThMZGF6SkQyOUFVWHZ4?=
 =?utf-8?B?OXpJRWZMRThMSzBRUzVhYUpHMGFCNUZrMklZaHNpbHZ6Ty84NTVlemFpNStS?=
 =?utf-8?B?ZS9LalAxMnFCMncrQ2RucDFEbzBUbXloeXc0NkhPRW16MjhwcjE3WWVJbGlN?=
 =?utf-8?B?c25jSExVellKTkdleWF0Ukpyc1ZFdG1FdWU3b0t4cUN0endBczBpTXhnOFBx?=
 =?utf-8?B?Zjl6alJEOVNJM09JNFNqOWlHZHcrR2lkK285bkhFb3hwbHlYN3J1TVRDYk9D?=
 =?utf-8?B?WllIOWYwVTRpZUdqTnhtT1pQWUFlQlZORHozbEhKYVNQRlZBQktDUkVDbHYr?=
 =?utf-8?B?czhIMWZVc2lFL2dCQnhJNGk5dXRRSE04TDQzTUlFT1o0VFBIandsVVJkMzlG?=
 =?utf-8?B?Q1l0OHo4cFpQc1MyakxwekFMT25Ed1psTHNiY01HMVI5ZFNxWUhQMURqSldn?=
 =?utf-8?B?UkJ0Mm12SnphUjYwd1hxWkF3SlY3bTZIbHQxbjZtSjVvTExBV3QvMGFvUFU4?=
 =?utf-8?B?bWhQMWVwdENPTHBIMlZUZThaajIvdDdGVDVvd2cxOVlWVXgrRmw5RGVELzZw?=
 =?utf-8?B?TDlEeURlTkRwTVNJUStWRm5PWmVqK2pGWncwcldUaE9JN1A3NkJTcGdQc3F2?=
 =?utf-8?B?cDhVUmJPTENudWxpaE9SSkVneEt6NTJOdUJrWjBzS1ZwV2hkaDhvTmRUVG1m?=
 =?utf-8?B?WDhmWGZzdnhaVndEZ1JnSnRDRTkwS0oyTmNWSzJHVjRlb0s3TldlOVA3Z0NB?=
 =?utf-8?B?bzBqNEh3SWxVQUpDT09FblhBbXBBRVBPSWlCUlVCalFZRnZkU0JOSUgxMnIz?=
 =?utf-8?B?VzZjMkVycVoyN2thdHM1WEU2UnJRdlZvQ2hBVTlRdmUyUHBqUGJWYU12UTg5?=
 =?utf-8?B?VmN1UlY1cjRDbEdWSjdsSDM0blJFc0UyVVBpRFhPZHMvR2FWaVRlcTMvNHQz?=
 =?utf-8?B?ZEtsVGV6MWhOamEwTStjZjB5NXRHbkN1bzBLRW1hZ05zMGpJdm0yekYwSnRZ?=
 =?utf-8?B?aVV6TGprYWdwRGp4cHR6UVFUdUJmcU92VnBUalVsYlNycnAyZ0tLazBKOXgw?=
 =?utf-8?B?SWdhM2xHaVp0UDdxWjRHV1gramxEaHhwSFhKNmJNYW1oSUhQVVdJQjA2Z25U?=
 =?utf-8?B?QUV6ekdXcGtoemtHV29FZ0tVMis5RHBKRFp5dEhNRWlBVmlwa3E2bUZiYlJr?=
 =?utf-8?B?RERnMEVDQlNaSmZZYmFBaXMyMDU1NXYrZVlNdlhOeHRwbEM0WFc3b2MzY3lp?=
 =?utf-8?B?cDZUKzdHSE5IY0lJNnRIczZDVHA0ZVdTU0JTSW1MZG42QVBCRVdSYzNEOUpQ?=
 =?utf-8?B?Q0dyWVdnRzErYlVDcWhlaFhpVkNLM3Z4MTZVemdmb2lVRXFYOElyRmd6c1pL?=
 =?utf-8?B?bTh1S3poZFBFcFlKZ05xS21wT1MrWndqK3FkQ2xKR0tVYjZzYzNoU3dMTjZi?=
 =?utf-8?B?dG5zYUM4OWNleldTQW96S2UwN21uYzlIeXVmSVJrOVdLK294SlJMeWpGWHZQ?=
 =?utf-8?B?MGR0ejNkOGd5WGJZZCt0ZWIzUko5YStTTWJNRHNTRVdFS3M2TEFiaENzOEpD?=
 =?utf-8?B?SExLUERCV0xrUndPR2hocGFSU3h1b3VEZlhPV3VGVTQ2eHFMUVFObEs2UU9G?=
 =?utf-8?B?MTh3b1lHTzFVTFdvcEZvUjFaTkdybS9NcXNYRXhuR2RObVR6clRIWDhRK1BK?=
 =?utf-8?B?OThjdHpTYW93RlN1VHU2UzN0MWtycUZON01pbW56U2djbmNBb2NNODZaTGJF?=
 =?utf-8?B?emI2eE0yUEtBSlhMTDJCQWIvTmJTYmhOY08xVWN2dW04dnNYbFZCREpXVjAr?=
 =?utf-8?B?RXExelJ1c1V1RVJSZTBlYjllT3A1VFN3b0g3OTVpQ2hUTEZKSUhxSGR6RFZi?=
 =?utf-8?B?VElsVy9ZcDhIbURhWnh6bzNZZFdPcVJSVllBRVJoVVhSU2lnZlhTaThMSnYy?=
 =?utf-8?B?R1NrZkIrOXVrcUJnckhsVDNlclRoMlZPSjZON0MramJyMktwcnA4OFFGaXVU?=
 =?utf-8?B?V2ptT3JtR2lsYXBZU1lSeXM0VDd6N3pRSFRXTkJSbCtHbmp1UVBzaWFDOXRL?=
 =?utf-8?B?czVtU2M3M2ZKTjlHWTg0K1psNHRwWUMrc2lkdWFKRHdkczN5SCtFUisrUnNw?=
 =?utf-8?B?Ry9GZU9wRnlMYy9lT2hRaHRPeW8rZ3MxeCt4QlMxeUxHQVd2VzFxWjJXM0g1?=
 =?utf-8?B?U3FzQ0MvK2JXRjdMcGZBdjBnOHNoZkI5bXVYWkY2bWdRN1dXVDNCK1VqL21E?=
 =?utf-8?B?VkovWkdPUUVVcDB2ZTQxSWNWSXB3akVLM3c0RVRJdlUrMUZxR01mcjg1WGdH?=
 =?utf-8?B?NjJBT0xjL0ROcXNzUFgrK3R5SmQ0YjlySC81d3RmOWU2SjAwR2hGN2hDdXdG?=
 =?utf-8?Q?LA5QfmBHhhGMUAVQ=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819724d9-efc5-4466-647d-08de8c130377
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 15:10:42.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0W3q5+G++r3wDW8QcXTTtLak02NC9uTvBPpf8B0frz5ZLQMbvwmhmVdWHKA+RqbJ/dgJX9t6OltsdCwVd8E79LixnyasT58G3ew3uVC/SuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6392
X-purgate-ID: tlsNG-d62444/1774624244-8F8EDDF3-36B98B9A/0/0
X-purgate-type: clean
X-purgate-size: 2191
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BDBD23467DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Juergen

On 27/03/2026 14:51, Juergen Gross wrote:
> On 27.03.26 12:31, Oleksii Moisieiev wrote:
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
>> Changes in v3:
>> - changed rt_validate_params input to get struct instead of
>> period and budget
>> - improved code readability
>>
>> Changes in v2:
>> - introduce rt_validate_params helper function to check period and 
>> budget
>>
>>   xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
>>   1 file changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 7b1f64a779..c161bf7f78 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1362,6 +1362,23 @@ out:
>>       unit_schedule_unlock_irq(lock, unit);
>>   }
>>   +static int
>> +rt_validate_params(struct xen_domctl_sched_rtds *rtds,
>> +                   s_time_t *period, s_time_t *budget)
>> +{
>> +    s_time_t p = MICROSECS(rtds->period);
>> +    s_time_t b = MICROSECS(rtds->budget);
>> +
>> +    if ( p > RTDS_MAX_PERIOD || b < RTDS_MIN_BUDGET ||
>> +         b > p || p < RTDS_MIN_PERIOD )
>
> This sequence of tests makes it harder to read than necessary.
>
> Could you please rearrange to:
>
> +    if ( p < RTDS_MIN_PERIOD || p > RTDS_MAX_PERIOD ||
> +         b < RTDS_MIN_BUDGET || b > p )
>
> This makes it rather obvious what the allowed ranges are.
>
Sure. Will fix and post v4.
> With this and the "const" added mentioned by Jan you can add my:
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
>
> Juergen

