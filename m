Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMWpLuGe+GnlxAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:28:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE24BDE21
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299911.1574470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtKI-0000RZ-Oq; Mon, 04 May 2026 13:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299911.1574470; Mon, 04 May 2026 13:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtKI-0000Pd-LH; Mon, 04 May 2026 13:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1299911;
 Mon, 04 May 2026 13:27:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wJtKG-0000PV-Go
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:27:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtKF-0096Tr-3I
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:27:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69f89eaa-2eae-0a2a0a5409dd-0a2a4501bd48-2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:27:06 +0200
Received: from [40.107.130.113]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69f89eaa-c1f2-0a2a45010019-286b8271bc38-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:27:06 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DBBPR03MB10342.eurprd03.prod.outlook.com (2603:10a6:10:52d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:27:04 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:27:04 +0000
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
 b=eSdQmT42pIeuHixXFF/RQ9AdONHNB/TMmsww45CThuduq5CS9+lCSf/31ZmNjs2T1LISVgiQktBvS6E6UfW2EKcTZL0Tdlp0ZZTULWg6D+1atPOBFusYmf1FPPQJcBwiU3taheLbYzDqu7ZwARaCboFkiraUvLhBRlXsGpRfMooMAstI140XXUpGP1AYOS18MaIhyOx9fyEUQ3fDonH+k+asdjp+qM4c+vyfcdc3zyqfb2d3k/yvxTs5TrJfJARKyJFx2MoNYliPKryD4Das04Gu0IEQPirxUjvljKOHdwf5eZp8aSnYkOXWaQkrnDZ/NWEMIlFbS+F1ZuKMavVWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pO07kbOLrBNf+2yh/pHl7wgNCy7tM4/oLXNW8eAzfo=;
 b=HnrktoUAKy6Ri1HhdJA1JwkkgqMwd+5iSps456MVgXJEU96s0WIQqGZ+4JA0dlK070CqbnZKV7yTZD4j5QrfTnVb7702mJejK2f+aCzvxi/xygpqYQ0G+Xn2fmt5a32xgoFcHxJ218rlTULyZUa7CU30g9juoJnb/by3czsb+C4Z8faKfEX/QSouAt4Zoxzx2rXJ+YFaL81CvtkWccDw99NAbbnYIRV6AbxALPQczRKMZqdCjYJ5SZdwMBXk9vnj6EF9x8yTQIeR0kGcjh0ZnJTFuo0Wfb76TWscHHxCERJ/HCg7qElbStew4nr+ESMf1HIUrIPD2RO06vIK6mi3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pO07kbOLrBNf+2yh/pHl7wgNCy7tM4/oLXNW8eAzfo=;
 b=WyZNJJ3Vdmim9gvwByFpz3SCHEag7MPAndrnxQ6Zir0foTyODKETE8pWN+OJGJl9uisNtaYrCUr95m74gXKWSUfVrzNhsO4cFf/3/Pun2mqIA73qf36VIC8lrevDOuDH91C7hFj0bIXrAE/yx4NGlHx4bshWEko+1zSIl8pvk2kFz9LPzKiVtHBPPTCU8vdXMUmhfizzsSaZVwdEtkwtZQgUtKx8XHdlTaiQleN2vCus+ZwkYC4NYkVfdUoiyAUldNdnpUmTgdPnOUi3cFs3GgS5w4diLxYg5h8Hd6MQjOJaxqyuJtiFOo2x6vDbm4lHsOkc7SRLhnni1USgOLnBpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <85710400-d4bf-4c4c-bd3a-7f6929e37fe2@epam.com>
Date: Mon, 4 May 2026 16:27:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
 <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
 <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>
 <ac3e1b58-3f81-406d-824d-4cdae7c7a76c@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <ac3e1b58-3f81-406d-824d-4cdae7c7a76c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DBBPR03MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 086d9219-3169-4557-1572-08dea9e0d4f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RO1dqWJz+N/fTQ/8scMYu58D9xM/qafsoQpPzqgr4Nl/yanyXM/KXDiu17hDvXICXQej0oXRnY2FzI8ksntCjVpTIMIn5nY9sudxt3p11iHpyx3fL+Ia9Ua6uzHW4GUgE0LI6se7zvoXxq6oLvxCnN8zkYpDue7pWS/0ZimBUllu6ZVdhU1G7ul2Sf2jVQrzsTzum2uqZHNMgWHzQBBIsRk1crU667OMKhc3H3jZPltbwB7jhDM3P0OLyz7aOxTelqYnlt4ah7VLRwSz9sfwM8eABaZwBIG1n5RQLCPZNZL49/YwEJKbeW0dq2K5Newj9TJ18nlKpVRerIRcMZD3d0SVg70+sVNzmsbbnxD3vAfXhDmgu8qZzdYKF20K+w8KxoNVy+PiVJuN3dOtyWDVFfYS4c+j8rFKYVnFETbI+Kmd4qTyhadbi0onosI4yz8YtErUg9ApMbwoY2qjVNi19NTlNgY2JiZQ16qsKtTStXVhhWBu6hjZsVmH9aVAFYzjsYNMEjCrijhhpm7zUwiZfuoaoo4Chkv/Z8ZW77M1Dn2X9i0SsCtsfkp75tPwldd4H8pl7pfLB+faD06A+WITrYKkE25ccxQrM05b2TiudWbqJGz4Cao9qIxGVNmoSnhrf/5nMPyp93HcP2Fbrlcu2KTYpijjJDT3XJNcouST36fN7DQWYYH+jLASNOwUat/k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXdzcGRVbUVKekFFc3FpNWRVd2lRNnJwdnV5V2oyNXY1T2dGdUEwdnZzazBx?=
 =?utf-8?B?c2IvbUxuRGpLVnR5YXdFMjQrUDdHaHN4bEQ2c3FzaXZ2VkkyMXBzeDM5ZStJ?=
 =?utf-8?B?WlkzY2NhOXdYTFpuM0VTUW9sSWlvZmFOaFhmNEw0TytaZVM2ZE1VYzVJdEJy?=
 =?utf-8?B?ejdlRWNFczNZM2dUL2IvYlY2V2NJSEpIWWx6ajhVNm1xbFFNVkdvaG5wTzFs?=
 =?utf-8?B?bC9yc2pNbEJwY1gzWlRDc2NtbjRHdWI5M2RmdFZPbS9UdzErNTdIelZCVWgv?=
 =?utf-8?B?TU9ZSUxiR0orZUNlRGlpd1k4N0RqZjFJMjRNOFkyTy9Ja2VKRUY0OERLdDhI?=
 =?utf-8?B?M04vS1FGTWg3OWZGSFZJZ1lZN3FBaTViRWsvTDUrRWFHb01uTi9PcnZvQjN4?=
 =?utf-8?B?UUVVR1ZMeCt4VWt0c3Z2eUJDQVNGZUpzUjk5TUdqTDhKQWVWc2lUSGxPYVY1?=
 =?utf-8?B?bVlCMlZJNmJ0aUFGaHpLRXprV0FwcGpNLzNNWmkrYlBGTGNBR0hvb1pBckM2?=
 =?utf-8?B?OENTd0h5eW9NQmpOWFRDdHdoUk0vdlRFRW93bDJVdk0vL0JDZkRndVlqdzV5?=
 =?utf-8?B?RUdxR0lOejJ6Qm9Sbks2UzBqTFlmUldjUWNmcU40bCtETGhzcEVkbGRsK0dn?=
 =?utf-8?B?RUx1M3p6dWExbWlOY09kRjQ1cTYvRFkrb1Q3ZDhPUDFaazh5ZVpDVVc1WE5K?=
 =?utf-8?B?U2dKS0JsOE5XYWJ5Uk1kVExQbjA3Tzk3UTJBMlNPL0puTEw4QzV0TzNISldt?=
 =?utf-8?B?T2VHbDJMUUI2OVdyc2RaS3JHVVBEbE4wRFNzL0dGazdmNEQrU3A2WlFtY3pD?=
 =?utf-8?B?cnYwRFQwc3FCcjdqOTVVUFlwVlJyVUlTOHlDTlBJMnArQkUwT2VhT0I2SGR3?=
 =?utf-8?B?dFJmVnI3UUs5ZnJTQjNPQ1prTjlPVnVNSnRQVkNIS3drTUJOTjlvaTQ1Z1JY?=
 =?utf-8?B?K2VMRmMxZzdtZ3Qyb1BnS3RRVjgycUNPVXh5SlpUTHpKdU1ZejNTNEFJaUxB?=
 =?utf-8?B?bGVZbERKcWpYWTRITWZkTVI1VkVuNzBvNVRBbjhiUHRvQnpLR1JUTWxDaU9T?=
 =?utf-8?B?MWNBbXhUOFRrSWptZHFCU0dPTEZ2Y3prd3RvbXJrMWJDVVFLbGZxaUVXWXVw?=
 =?utf-8?B?ZWhqYWZRMUN6UU1waXppMmkyU01mU0dvaUUxZXVKbmQyZ2RjN1ZKNnhQR2xZ?=
 =?utf-8?B?UXNQRmxlK010V21tUklMSTlBcnFWUzZhUk5KZWNoZ3AzRllCeTN4SWVpYkx5?=
 =?utf-8?B?L25KVmFLNHhFbUxtWDBXUmdScnY4YjV6QnFCWGszV2tSRERSOFJwTkxSaVg2?=
 =?utf-8?B?KzJlNFdoTTU3Rkx5NTg1cG1PRnhZRlNVWGtnL252Z1lqV2tHK1dkWUJyT2lJ?=
 =?utf-8?B?dklEN0NiTDNNV2NHeFI1cEcvbVBzdmRkWnRVR3BZQnMyTFpWcWJINGhHejRI?=
 =?utf-8?B?OHNaNGlvZ1d0eEpOUVdaeitvNHNQeTNHSEd0d0NtV1BuMjNZWHYxMHFwNEpa?=
 =?utf-8?B?MExwNHZPY1VKYmxIcXBxbUxjbUFVREZ5YU4zRkU1K2tLcEVuT0ZSOE9MU0VB?=
 =?utf-8?B?ajdoV0M0RjZOUVJtOFc4QjVrU1E4LzE4d2gyNHFoWlVDWW5abklkWmJqMnFC?=
 =?utf-8?B?eDh1bEl5aUJEOGpVYSsrWGhYb1dWWjB1TVZ1UTF4dVNPS3B4eDVOUWlLL2ZF?=
 =?utf-8?B?ZzZJUU1jdDJ5MG1KUE1FWlhUbmd2cE5yYVdqLzhRUmRSQlMra1pOU2JzTWkr?=
 =?utf-8?B?VXY4VUxzWlp2cDNYQVA5Vk5Ga3lxcjI0Zm5lZXN1eDZjNHhVVmU1Y0dEY1F4?=
 =?utf-8?B?V1J4dlpNTEFRVWoxamhQRTJSQmlyUFhnbWswYjFCbUhTTXZJVjF0MmhlSEZn?=
 =?utf-8?B?UjBkQU00T2NWRURMcXBEbWdWblg1SWxvZ1dtdXZNOUxJdjhCaWNXd2hJQkor?=
 =?utf-8?B?U3g3ZVpLQ0JTcDhSWGVxa254Wm5SVnZqNExYYXZUby9UUWJlWmxTT3lsK2lK?=
 =?utf-8?B?cjAxMzJlMFRMcys4b0VIcXZacUFPQUxVOUNVRkVDMGRxSnVqc2EzMjRWekRQ?=
 =?utf-8?B?Z3ptcTl4Y0NxMkpyMmtYTTZ3bXFZZVFkV2E5YmU3NHVzU2RjVUFxMUFOWTlT?=
 =?utf-8?B?MzJwOEE5WW9XaDczUnU0VTZqeXR6bjVhWVhGblg0anJyckppcldacVV1QlRM?=
 =?utf-8?B?cXY1dDZERE1sdmRFbkRyMm45SDBTMHNXcWlkYUQvdy9jWUJsSXRLc3gzWDhl?=
 =?utf-8?B?OC9tdVFKZENUcW1xL0xTK21hTGcydXVHenhNaWlMc2pwSTA4SWs5YXN1K1RR?=
 =?utf-8?B?S2RzZWlWN21MN1kzQWlVcDIwdFZtTnQ5YmlVRE5rZEJyb1JiTmFLUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086d9219-3169-4557-1572-08dea9e0d4f0
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:27:04.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiCX4igb1gF3zKwaopBdgLxAz5NmYClZPKMN3zqQeINdK/IiKyZjI1Ec8VlgCjYCzdOjVDi1SxeszQ7uqUv3n4zwnJJStZ0Mp3XeBQtWJVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10342
X-purgate-ID: tlsNG-d62444/1777901226-B787AFF4-CFFC35C0/0/0
X-purgate-type: clean
X-purgate-size: 2834
X-Rspamd-Queue-Id: 14FE24BDE21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid];
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


On 10/04/2026 18:19, Jürgen Groß wrote:
> On 10.04.26 17:12, Oleksii Moisieiev wrote:
>>
>> On 10/04/2026 15:16, Juergen Gross wrote:
>>> On 10.04.26 14:13, Juergen Gross wrote:
>>>> On 10.04.26 14:04, Oleksii Moisieiev wrote:
>>>>> Hi Juergen,
>>>>>
>>>>> During our safety certification analysis work, we identified this 
>>>>> as a potential
>>>>> issue. While we haven't encountered this problem in practice yet, 
>>>>> it could occur
>>>>> in the future, so I believe it should be addressed proactively.
>>>>
>>>> For being able to occur in future, the handling of removing a cpu 
>>>> from a
>>>> cpupool would need to be changed. Considering the refusal to remove 
>>>> the
>>>> last cpu from a populated cpupool is on purpose (this avoids leaving a
>>>> domain without any cpu to run on), adding the code as you suggest 
>>>> would
>>>> just be an addition without any benefit.
>>>>
>>>> It isn't doing any harm (other than adding code without purpose), so I
>>>> won't explicitly NAK the patch, but I won't Ack it either.
>>>
>>> One further remark: I would ack the addition of an 
>>> ASSERT(list_empty(replq))
>>> instead of the conditional set_timer() call.
>>>
>> You're right: with the current cpupool semantics, when the timer is 
>> re- initialized in this path, replq is expected to be empty. In that 
>> case there is nothing to re-arm, and the timer can be programmed 
>> later when a new replenishment event is queued.
>>
>> Now I see that it would probably be better to update the cpupool 
>> logic to prohibit removing the last pCPU from a cpupool. In that 
>> case, this fix — even with the ASSERT — seems to be no longer relevant.
>>
>> I think I'd rather post an update for the cpupool semantics and drop 
>> this patch. Or I can send a v3 with the ASSERT if you think that is 
>> still reasonable.
>
> The cpupool semantics are already existing. I have written it this way 
> when I
> introduced cpupools.
>
>
> Juergen

Hi Juergen,

You're right, thanks for the pointer. I went back and re-checked
cpupool_unassign_cpu_start() in xen/common/sched/cpupool.c and the guard
is indeed already there: when n_dom > 0 and the cpu being removed is the
last one in c->cpu_valid, all domains are moved to cpupool0 first, and
the call returns -EBUSY if any domain is still alive while the system is
active. So by the time the last RTDS pCPU is actually unassigned, no
units remain in the pool and replq is guaranteed empty when
rt_switch_sched() later re-initializes repl_timer.

That makes the conditional set_timer() in v2 unreachable under the
current (and intended) cpupool semantics, so there is no need to touch
cpupool either.

I'll send a v3 that replaces the conditional set_timer() with
ASSERT(list_empty(replq))

-- 

Oleksii


