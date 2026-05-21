Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF/EFSskD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:26:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AF5A84CB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315396.1585215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Hv-00063r-PM; Thu, 21 May 2026 15:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315396.1585215; Thu, 21 May 2026 15:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Hv-00062G-LG; Thu, 21 May 2026 15:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1315396;
 Thu, 21 May 2026 15:26:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ5Hu-00060n-Ov
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5Hu-00H43E-4y
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:26:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f23f3-e002-0a2a0a5209dd-0a2a450bad44-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:26:18 +0200
Received: from [52.101.48.68]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2418-212f-0a2a450b0019-346530447c9a-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:26:17 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 15:26:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 15:26:14 +0000
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
 b=L4Ti85FG3rj7xjj+CLLZtCMecxheqSTowyPd4tQHu0KFAWSkyYQeiUgoKkDdrigzYe3z89v2yuIA9vBmbgYeItHUULEra9YQHsw6kaQqnVuzJZ93KCx7JLXIPKx0YijQXhfmFmHzYoqaMBHq+83MD8ym1ahr7EFr/PnfffA2+sOrerR8L9w7X6pV3+5AIDOd2cZxopU5uEbPp2ZK2DoJEDdMye6gNwAKsd2en+nZitj9awbY4mPHAonvs9Fm+oVwodcgqLNBkTYJc64+Elst7K8sdRLSGA00pdPjtTCu4JQoDWSfX0bO948VzQGKQBm+3/AYBOKhRpBQfNGbp8CKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ApBicLxDhow1FO95wpPaiAUAK2bU1Lk0OBA+35qs98=;
 b=N21FzIdp4+K03uoOOOYCyJi7Eqm7B1mCYZHksbrarCrXTF+dr9oMck1EfAKG2M3InLXR9p8vZgFrQyin+sDSIeAiIFWp3O2Vlax6fBaSlL4UvJnf47Y0pgCIDIQeZi8vwrw7Jn+QJvPHA0x/Eklk1o1QNt2TRiakHwyiuAVZAHV5QVVoXQxFBEe5BQliPFFoWYdLLC5ovlyQEu8ZSt5Jwt8DWdO40i7yJrPZXQruLrg2Fyh3hjPke7uqG0RzphDmq+iwDWo6E0TTHGmxZ/g93TfALLDDsgdhs4A25R3tchNfCXz8GrsXiWANbL8h+NLLSeXASH+jmKBqgCaR495oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ApBicLxDhow1FO95wpPaiAUAK2bU1Lk0OBA+35qs98=;
 b=wwfhr1vFKKA3iTNnNSIbhXBVIH9Ce7LOp5xf5JStRH61w4s6OfIdah6XaYaHeyvj+ZI1QLmhziCadbvYP3I9b/SfyoJGcFon3A6ILx3qaCfQ7DihQBA9uCKltANWsvvfdb0ed+u4Wpo9bq8NnDs8bd0rFoow7XbWz8eiOkhmfUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <745d33a4-11f4-4000-a8d5-219f9617eab6@citrix.com>
Date: Thu, 21 May 2026 16:26:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] tools/tests: Fix paging-mempool xen_pfn_t format strings
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20260521152344.2050899-1-luca.fancellu@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260521152344.2050899-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 40490dd7-dc79-4541-3c87-08deb74d4bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Bl1nYt5Nd6YcO4aDnsHdFvH/SRDzw854kkadbLpnXxl0Tzfv3aEbnVNPu6nhhM8qjbwWHwGqag/gibEJiav8rp3rcuCpQ9goUiwaPtQ6rlbUDKzHMOL84D/JIpo0+dDBtg7whSdJVLIQXT8nZBymsR1xBZJRsafabIraTqtMuTGDW6txEouu9JzGLAb0n6QxmK8A7d3MFo9kRpOynlPwLq57tFMtZBQvV4SrdZPejZowM6T7mGwTraMO/LLt4J51uHHNvBr35X2bf4L+3KCUhx9vlOTgS9BrFvO1T+5fYpMw5uow3CVj0ebi4ypsPrlQYebRBVJPy+7m2T8z5kZB01X3Y7xk7W3qXUdjWASCr+sufqXIMIbWv2bfAj9DImh/QWtiBAcvB4zPSvHzwuYVCH1avikpw1RZnfUOVouQ+6gqMsZLcVXgzP4uigChB01km2d6gF2kBwHxbQuMCOu+NDZK/exuYzOcgq4jHNmgYK3NhkZy1SqtM8jOEo0r1tB7R4aKrH0MnqfBp3TeBhQ25PW1+MnA/N76hdF6KeS7ZV5g4WFytyxWlxqBqhD7Y/gYyvGukXzA3vrN2D/LNw89dEGyqS8qsCgoAhebmlyi8IyM5KS75I4Q7GXzi9YpzaiAhtKri4F/kk2gUZsvk4TI88b34N0ME6gIQzRsLpTkOMBnLWfLqkK48IwJpzmCm5wX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU83QVpQUnFnaXRUaXMvYmwwKzBpMjhrQlVMRTR3Y0hWdnJWZmhPekVmMXY0?=
 =?utf-8?B?UktHSTgxOVRyNm80UnhreFJKVC80ZEpnZkpmT3BiYnJMTk01UkF6VWExMXBY?=
 =?utf-8?B?cDZ4eHpBeVVlUHdYVHNiQmUrRlArZksrWHhDQ3IwSTVrdE9MN0hmOU85ZXV6?=
 =?utf-8?B?andnZFpZdThzYnUvZC9HMUg4VWNQVm0yZEJBbHhHSUlEZ0diQjdEWnByTzZ5?=
 =?utf-8?B?Nk4wMXBydVBudTNkL2tyNHJUM0U3b3ZRSFNsL1A0RU55TmFTYWU1UjFWRXhX?=
 =?utf-8?B?RWhaY2pKT0lJUVB4bzJvQ1lvOHE3bXdLcHlUeEZZZk1wWEZSV0h6NkFIWVR0?=
 =?utf-8?B?ZjZTU2Q2NWFuTmYwdmVLU1BRNDVyekFjN2ViUUpPenBBU0QyaWpBbStOa2xH?=
 =?utf-8?B?TlAwT3k2alBrWWlIUWVCWFA1KzlLSDMyemxQamlwTnNFQjEzSzE2M2pWL2pY?=
 =?utf-8?B?MmNqRndqOEpSWHJSbndIamRJVlJGU3Q3Y25hSDlXckF1Z0ZMYS8rSkRzNEtj?=
 =?utf-8?B?dTJoQWc5TTh2QThlcElQZEhoa2NuR2RVQmd0T0l5MitJUDVxWFZUL20ycVdW?=
 =?utf-8?B?OWI2RjRxUDVWYW9JNWx6SDZuUXQ1S3JSdzNnOEZjVnZ5ZS93akVSaGtWblBj?=
 =?utf-8?B?Z25EaXZxOUdvUHBqQWtHTG1SKzVpMXpicGtUZ2JKQWFBN0ZNcXh3Y1ZhRllL?=
 =?utf-8?B?eGM2YVJwWFU2dHBtVXd5VGU3elBvcDlWVUZwYmkxeXV5UG5VeUM1OEJvZ3pt?=
 =?utf-8?B?cGFMRkZhSkFOUDNDMmZydDBKM0tFZWxxUFRkdjVmam1HNjB5a1Z4QytDWnkw?=
 =?utf-8?B?REphd3NQdGY0STVZTlJ5bDkzRnh6dlJDanNxRS95cUc0QmVrSHRwZ2hvS3NS?=
 =?utf-8?B?N3lqTDBnUGVCWmhER1ZNaXNOck1wTGxUQ25CN3RpeDZtYThBTWpkZWpOZ0c4?=
 =?utf-8?B?MFo0Qi9hcmJGeWpZY2tMUmoyM2EreWZqMGlWSGJxMVR4bmtUdjdOMk4rNGhW?=
 =?utf-8?B?ZkpJYmNwUWRFUzY4ZzFSQXMxcUNHNjNwVS9oeWpVa2pGR0xWeHpBcmJDNFJF?=
 =?utf-8?B?aGxoZktTRlVXakZnM0lGdTY4dG1tb3pMVFE0dFJ1cEJhTjJXaTZxVEgxaEdF?=
 =?utf-8?B?OTVQbXpkY1ZrS0xCQTZXL2ZNNXk3MU5EWDg4dmRxVnhSMm5vaHhaU2kvblJ6?=
 =?utf-8?B?cXcyUW5JaEd6aW1HKzE3bVZIeDdLV0hSMkc4RnVqOGNpUVZTRXJNNWNnbXBu?=
 =?utf-8?B?Y1FVL2JiZmtnS0JKbCtFbDFVa3AvUzVYUWdDL1AyTlk0d25iWXZnWFQvUGZW?=
 =?utf-8?B?aTk4WTdLL1BzWFhacHJJb29OS1RUdStvcjBTR1BVVkVXcXU2bEtUbVlpaEtn?=
 =?utf-8?B?Ky9NeHpINEJrekk4NVVuZzJYODVSL2EraHJSTWUyeDBiQy9lVmRrM0cyaTFJ?=
 =?utf-8?B?M1haMVNxbjVsdDdxUG1tVDBGUnAzQXRuaWJMNFZ5M2IxcVRWcHByMm1Kd3ZP?=
 =?utf-8?B?VjRuckJOQTJSM0k0VTlGV3BmNnNVL0dyZENQcFREOFZRbHhTaEFsM2lyekVx?=
 =?utf-8?B?cG84UUs3amhJRHJkMUJpOHVFOGdQeVptVUpPa3JFVXBRTVpoQXBBWEhWRlZz?=
 =?utf-8?B?clFNLzJ5Yjd1QjdVUGtWTmlvT0JIQ2g5UUVPb2ZGMGtMbFoybVNVQm1CMWlk?=
 =?utf-8?B?NzBBeVE1RDNKaUJIT0pWWnQvTG5GYyt4a21vZzI3L3JuL1Z1M1pSMmRvcDR4?=
 =?utf-8?B?ejZ6QjRaUEdNcU5uN2wyYlZxYTFFS1M4bXlHWE10UE5KeVdSODd0ZWdnY1pK?=
 =?utf-8?B?TVRJMzhvVUFBU0JOd2pwL0xVcThpblNBZERMcFdrdUNndlRwNFlDTVh6ZEYw?=
 =?utf-8?B?QytlSGovVG1CK2s1dUdUcUtOV2s1ZzJBaDVLbUxPU01BOXB5aHgvOFdPMCtS?=
 =?utf-8?B?bHFUTGhhOG14eXVaK2dYK1dicGw5VC9MNWxmbUlDZS9VRlZaSkgrVmZnMGZL?=
 =?utf-8?B?R1lPNW5zMkZ4TmRUek40WmRaZ2tsdUpVVWN3a0M2dWhqMEZHTGt0RHJmbFcx?=
 =?utf-8?B?aFBMWDRrZTViYldGUFdya1dLZTNyYmF0bzQwQldJU3RSaDRWcjFaS2p4c29N?=
 =?utf-8?B?RTBmRXFYajFNdDF0UWFvbkNPbzlQN3NaOG9NNTAvek4zSVFOSnMyQ0NJRG4v?=
 =?utf-8?B?T0RxYlNYdGxMYmN6aHZaS0thVTFwTlZDVnVraTk3aU5Kd3ZPSkE1TDFVa0RT?=
 =?utf-8?B?Q0wxZ1F6WDJRdjZNZThQVEpSa0JYNE9jamFqbm1DM1hDUmxsS2tZL1NZY0ZP?=
 =?utf-8?B?ZWk4QStNWWdjTWxXbnFsV0JUWXRSc3FwMjFEQTUvNE1XYTk4SXQvam1mTGlP?=
 =?utf-8?Q?OLU3VPJZNrzvPxNU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40490dd7-dc79-4541-3c87-08deb74d4bb2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:26:14.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0MyCuMVEichUhmMvBPjkA/sebsD0hD3LVUuTH1dGKR5mdsxLIYFwFnYOQxJHSi4eI6HT+rVWGCEv7QZWaGjPfpSe+fqTdyIAN+C+Twf9S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-purgate-ID: tlsNG-42698a/1779377178-18762F3B-23331E4E/0/0
X-purgate-type: clean
X-purgate-size: 480
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D32AF5A84CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:23 pm, Luca Fancellu wrote:
> xen_pfn_t is not an unsigned long on all architectures. In particular,
> Arm32 builds see it as a 64-bit type, so printing it with %lx triggers
> a -Werror=format build failure.
>
> Use PRI_xen_pfn for the GFN diagnostics instead.
>
> Fixes: 66c982a5d3614 ("tests/paging-mempool: Extend to test P2M relocation")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

