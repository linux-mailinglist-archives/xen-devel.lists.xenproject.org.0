Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGkoA3N3/Gm3QQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:28:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E704E7764
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302619.1576486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwu6-0001Tj-IA; Thu, 07 May 2026 11:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302619.1576486; Thu, 07 May 2026 11:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwu6-0001Rg-FT; Thu, 07 May 2026 11:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1302619;
 Thu, 07 May 2026 11:28:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKwu4-0001RZ-W8
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:28:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwu2-00AnK1-RB
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 13:28:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fc7757-2eae-0a2a0a5409dd-0a2a450982d8-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:28:28 +0200
Received: from [52.101.85.3]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fc775a-2497-0a2a45090019-34655503a22a-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:28:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5001.namprd03.prod.outlook.com (2603:10b6:5:1e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 7 May
 2026 11:28:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 11:28:24 +0000
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
 b=s0c1vwn7UrTQ4rDe5fu9IsFR24ORURSjX5o8wDIVuIR2Z5JCNdsU73r2l0qGGRN0kuvdUlVUWttQ3xZUuhVUQnusbvvTOGfJ8T0N6gEjbo+9LzbjLN4a53AtLPnueSeNqh1r+bFfg9auBv6rOTPAiELuFcuBNO2f5UAf8AwInRp0JCLYo5Q5dO0T2f1ljm3zXpgYc8XvrDsEAOxwWFuwCgEFLC0YHVME7js/plxWS/ElBhVxo9WGid9/gsKT0Q1di8maJPMcyx8Ni9D0HpUY2LbDkNIAH+FtQpnAzStysZU8j9Wa4xg7Sc4Gsbz6n08vioekLIirXi4XVyj9gC9GXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bkVjjm1VQR00x4Hy014oaB6kZ7y40f5Ye9OUxVcjdU=;
 b=Kj8r++pW/AebWnoj47gl1GVuXaDe62VQwaoJMm15xbQZP1qsq9JZhm2YOPgAENT8v1TXeDyHH64RTqy94gbDEWCuySLiqAjfrp7eYr5c2m2RlF4pPXlKS37GN9vVSUUTpMrjn0EtnmfURvvqAf10k7JBKkdxe2jaZBzzr77edNDL2Va1udJ8xH3UM0WU0lfyJopdRLtT8JXEtp19QnuQy6hmkGaas2HOQxsKvXxl3mx/tFmrw35UOlAajPXuABKO/dZS57VfqVpG5qqeeMXrNMMQp0970KuRTyTFTNPrEsVecmRb2aPtUMk4tcbO8u9gvFkhM621CT6pa7ZosgiEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bkVjjm1VQR00x4Hy014oaB6kZ7y40f5Ye9OUxVcjdU=;
 b=Wp68GO7Uu7vspwDN+bB1JDnQjp8U/h1AIBYAJnB3U/oL6v+vd7j7WIhr+VTrh4mdoTn/AyPZjk30Hsh01JBjsa4p8yAXCDeaD/OxHaoIjtbzA+7T1DqkrihxsXT3esBvdiLLhgtjliIUslDLNB/1fnZy+L+5RWJUn1CcBDXwy0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c62cd90a-0325-4a65-a1a2-a29aaa912200@citrix.com>
Date: Thu, 7 May 2026 12:28:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [cross-arch mess] [PATCH v2 1/2] x86/svm: Don't toggle local
 event delivery on stgi/clgi
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
 <20260507105507.2078971-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260507105507.2078971-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0017.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcd653d-9de8-4979-1b2c-08deac2bc00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4a4ecLhCv8pvMJXea7lzAMRVq46rN3JTYNGWlRlH+/c7cI2wVQhp7z2UaaUs1LVauCnsbYhQomegr9XL7VNPPOcjA0eULAN67kNV8ZiFcbHV1JDqVbYhLFqbSb9nJIDhYqno0snM3q2znT7wwQAX7bn2psJEl58eI96ZiP8E+evDeN625vPPKolO5BmLt6cyeD5A+OyUqcv/2NheHOBimUSdKb2qaW1rHSd2V8/vqSQ1JjlbeKHzyL94Lo0lPgLhAgY1cm47VCcNGthyBrwvE9oUr6kgujZ/h3asxFMvcUFyQJ0lESAoTrr+Ltt2frkQzvgmn+jLVoEKQuU1AVWBGwtQCXAYKmY3FjBfJemEFYYbwqU35ASAJqkX+Lt0poJbh7c0KERQhY13poA30Rky5V343fF0AF4CiJrmais9c7R5rkBLrCBm/AzRa+MSv5teqLDE/F0k403pRw24jPmLAwyjAnW8qPdRf6RxlYEnf19yGPODGVADG0JAApoOE4bzcsWzJ1DS9h6qnN12QtE6OByIINGzoOuFsu1Sh3QD259YZOaJ9934NgSL8Xotmo4Cji53zgwVkKWjRr4qAUcRfQMmIhrwTbmMCTIwT1kn7u99wNvodpjvqRe+K15fjsBOMcD1jjChzOU6KB33v8he5hIMtOdbb/fIdKQcv0dUMZvUbgfCNfjzmyw7MN2S+qOx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVYzQjNaMDlPNnE3VEJCWlQ4SDlZSGZXaUhXVXZocDdweXcweWorbUlxKzdM?=
 =?utf-8?B?NHlrcnl3RU9DOVRRaFpBTlFEcE03N1FBOHpzTVE0eXl2eW10S3BmZlk4ODc5?=
 =?utf-8?B?YWgrTXpiYUlGOENaUkk3bWVuQXFvbjZycnJVTGMrNTA4L2NRS3FacTdZN29a?=
 =?utf-8?B?R0N6MFlENnA1MW41OXFGSTFjWHlPUDc1Qk9jbEM0dUFVTUQ4UzZXNmw2TUp1?=
 =?utf-8?B?N295czVabzRWbkF6dHhuOVRSaFR4UDc1ckpUeU91d0JMdFBzR1FNQUpyeHdq?=
 =?utf-8?B?WmlvNkFRVFhFZFo5a09yWTJIQXRLOW1hNkhPZXhIQnkzZWtZWTZxRkZacHdH?=
 =?utf-8?B?VnhINXMyRTJmTzd2ei9pL3ZGVW5na1k3SXp0RGdnL0pSRXF3UjZRdFFjMzln?=
 =?utf-8?B?YjNSK0dpY3ZmQ3ZzNXVrcWtaSjdkVlJ3bUJ1MUJtZUQwcU95MGVCRzlhZ1Bs?=
 =?utf-8?B?REE4czFJTlg2Y3FWZENoakIzQmZzWGhjaVpzTU43R0NMRzN1elJIV1EvTWUr?=
 =?utf-8?B?QnhaVXAyckJJQkkxbmZLaGZUSGttSlZLRm5UWTVIYVEwTENabGdVMUV3UTNM?=
 =?utf-8?B?eHlHT3B0OFBpUnBhRmszSG9EUUNQaVVrZld5ZkdneW4vNmVCc3hqNnhtK1B3?=
 =?utf-8?B?ZHV1Rk5CUEc3Tk9pVGwvdzk1YU13TkVvb0d4YVhPeEpQbUFubkRhcjVTUXR6?=
 =?utf-8?B?cE5HdjR2QUl6LzZwcHU0Ujl3SWlzMkNOZmNaRE1kVlhGTFFhZFFPb3R2ZUtJ?=
 =?utf-8?B?ZjQ1UEYrcEVkYlpQUFBOWE1VRlRyZFBxQlozczMvQ3kzekExNmxzOWFXbUxI?=
 =?utf-8?B?L1JkR1dXQ3J3RUQwMzlsVG5pSWswSThKQS9nYnhiZ1NxcWFMVFV0RmJzemtm?=
 =?utf-8?B?ajlsdWtMNFV4a1ZIK2FSMWpCVU5JUjd6M3F2OHA3UjJOK0JnV2JwRFJHMUdy?=
 =?utf-8?B?NVdYWnlVSGYzQVd1dE1UYUdZSmdqM2NhVnd6WUJNeXc0ZVE5T3BUUEMvcjhw?=
 =?utf-8?B?enlLZk8rQ2djVERsclg3WjhpOVk5Z09wMU0xS3ZFeXRXdDRZbnNKVWlrVloz?=
 =?utf-8?B?ODdiZ25weWxqMlN3ZFp1ZTBoVGxZUXBSdmFmWmpSS2pSNGtJQnNDb05MV3Ju?=
 =?utf-8?B?Q2dvVWl6MWE0MFFkdGd2LzBjZHc2NVN0dythbHkxNFc1TitIZThnNElUcW50?=
 =?utf-8?B?eHVOOE1BajQ2bVJTL2h5SjdWd09ENDhWeXpUNHl5eExRREQxdnFidjFsZkZC?=
 =?utf-8?B?dXdDT1NuOWprUU1kTjNvczBFQzAvVG1RODdJZ2dtVDlOenlGVkN0UU15SytX?=
 =?utf-8?B?KzdJVGFXWm5vaFBNVVFsbjh0RUtmV2dCZGRRekN1REhERXhLeDBDSjRWdzJS?=
 =?utf-8?B?WG1teHE5THVWbDdTQjUzc3AyTlhadE03d2wraTlDVy8rUzJsY28rOFc3aisx?=
 =?utf-8?B?Ym85TWdUQXhnbk5iN2dRaTYxaXpHVFI5ZjZXN1NxUjlLTzQ4WnRHVGRBQjJZ?=
 =?utf-8?B?NE9qanlwaDdUU3lEQ3Mrc0FKNVFCUkZkMzlaMkhZUCs3TmJDUGU1WUdDZ25K?=
 =?utf-8?B?eUxqcmJGb0g4MjR1c2R0N3hoc1BoQmZKWnhQTy8zaHVaR0Iyek5VWjdrS29l?=
 =?utf-8?B?NmZiQjBqdGNnQTl3bVBZak5mTlMwUHBCT2R2cHlWS1VzWGVyaHVGYUk4MDl0?=
 =?utf-8?B?WlVzL2Q0RDVaSEhVSVo0LzhkaFA0ZVNMWlN4cVZDeENQMlBLRVFpdXNuWVFX?=
 =?utf-8?B?cnFOY1NoTmlyNjZ4dFgwTmlhd2JHU0dGaUp5WmMycXZubXpFQmdUQ0dOWnZl?=
 =?utf-8?B?ekNPcjZ6VlZyNGhDNEQyN2tsclI2Myt0TzVhVS9WQkNLK1VFbUgwU3BRakxI?=
 =?utf-8?B?NzR3SUlxOG1NWXo4VFNoM1BoeFNxM1FNajhyTVVpMXRRQkdaZzZvcnNETDMy?=
 =?utf-8?B?a0cyOWllNXdKa3VKa2F6V2pHRlZpYjFtRHJWbm9xS3A0dUFOTFlweFo3TFFI?=
 =?utf-8?B?RnNvbkRLZDc4aENOOHZnTzk1MDd1SVhIQ1BPZ0M4M2ViQkxvVU8ycHp0ZUxZ?=
 =?utf-8?B?K0tRQkpZTWhKYzNZcGlhNFI0YitOL0J0OUR0MDhiSWhyMzJZRG5qLzBjYm1T?=
 =?utf-8?B?dWh6b3BVK2tHOGdRbEpPWXdsK2t4bHViL2ZRNW9tNVZ3MTZtYlVlRVAzbHkx?=
 =?utf-8?B?T0syaUhaeXJ6a2h4ejVZVlJtbTljRWxUL3NET0JTeUVmb0dKZG5zNVYvcFR0?=
 =?utf-8?B?c1o2ekdNaVY1U1Bad25jc0JkOVJLbko2UFp2Wit1RGRTUCt4MFYrT0JSYnlZ?=
 =?utf-8?B?SFZoRzd4Y1lIVlh2bWxEbUorQ1gwd3phYWwrNWJpbjV4RnVzSUpBZlVkTHNS?=
 =?utf-8?Q?1DtAvchMi7VGp7tM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd653d-9de8-4979-1b2c-08deac2bc00e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:28:24.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3dgaGMqL7usNA49PsxWQmrBu2shmqTO8ZYyCua3t20OLJBvQ1xKgY60yeGzJGtsgox6ZyFIkkrP1mg+fUfOZpwOi+hDYUN/FS0mYZGDBHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5001
X-purgate-ID: tlsNG-bad1c0/1778153308-41B68A53-2B38A61F/0/0
X-purgate-type: clean
X-purgate-size: 1733
X-Rspamd-Queue-Id: 69E704E7764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Bertrand.Marquis@arm.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07/05/2026 11:55 am, Ross Lagerwall wrote:
> There is no need to explicitly enable/disable local event delivery on

While the name of the function is local event, I think this needs to
state evtchn because "events" have a separate meaning in this area on x86.

Personally, I'd phrase it more sternly.  The masking (or not) of evtchn
has nothing to do with GIF/IF.

> stgi/clgi since HVM event delivery already takes into account the state

STGI/CLGI.


> of the GIF (and IF). This ensures the behaviour is consistent regardless
> of whether vGIF is used.
>
> Fold the functions into the callers since they are now only a single
> assignment.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

For the patch itself, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

However there's another can of worms.

This patch deletes the only user of local_event_delivery_disable().

It does not delete the only user of local_event_delivery_enable() and
pulling that thread shows up a mess.  The other caller is
vcpu_block_enable_events() which comes from SCHEDOP_block (probably
legitimate; enabling events is at least documented for this hypercall)
and hvm_hlt() which is definitely bogus.

It needs deleting, but we may want to instrument that path to see if we
ever clear the evtchn mask in practice, then run as many distros as we
can find.

Furthermore, while RISC-V and PPC have BUG() stubs for these functions,
ARM implements it as clearing regs->cpsr.irq_mask which is equally bogus
mixing virtualised evtchns with architectural interrupt handling.

That, equally, needs deleting but I'll have to defer to the ARM
maintainers (CC'd) on how to do it safely.

~Andrew

