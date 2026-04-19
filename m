Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SzxABXIR5Wl1eAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:31:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC5424E27
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285335.1566411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEVyB-0008DO-Af; Sun, 19 Apr 2026 17:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285335.1566411; Sun, 19 Apr 2026 17:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEVyB-000889-4B; Sun, 19 Apr 2026 17:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1285335;
 Sun, 19 Apr 2026 17:30:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wEVy9-0007uB-Ga
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 17:30:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEVy8-005XQL-L6
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 19:30:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e5111c-2eae-0a2a0a5409dd-0a2a4505ddf2-0
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:30:04 +0200
Received: from [52.101.84.79]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e5111c-aaa8-0a2a45050019-3465544fd213-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:30:04 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 17:30:01 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 17:30:01 +0000
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
 b=fEOIXXZZcIgqM2hbT4eETdSPwfs3MbBET2sMGCiygZoxxXWT9Z9mYyKgNDRypkeBzfweMgN0pjDrmpwxEKORnl4jkyV04aQz3ytqNE7vhTYyhGGUx1zbDE9zbpRG0uyn1zgfE9gT3VIbYMieb2MryCZnFZyG6ohxVeteUoke4WXuS2uPJaK/7Lap3pf+Wn/N5OBk26OZFJQmDoMLDrAHq1F+HT90GOkM396rPdC2q/iNJfcDnOJCicjPdFCzKUxejNWDlQLi52J3yxSDJ+POrznuPdEnvlA1D9B2NdO6MvAkMTTxfg05xdc/vCcQvdsX4qSvtXLOk4rxuTqilVJ8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtTykqEOeQLfkooX46gCFuKoex9ftn19RXS6tLDgz/o=;
 b=oVwesZyK0rNjoKvOij9TL1vodpW9ulZfSE/UXz/5uRy85yDvKa07qPJGNC124K1WmKy5hIRFPGeADXeTrBt6DgnJQl3SaVQjITmEZm8f9Ll71cN6n4QGOv0g2oT1Pq7hjjb9HDBd0MYXOO1+dqdCki3dVXxbUOPKC7wHVOX6GTHV+XggSp8OqNNlIcJfHcZq8Hdk4zOzmPsUXPPCGevOJukU52CG2w4opEjej4t0CLA5zOwKpzgu/9lo/VJOOAKFu0fdwx3GFaC59ZNB87rbwzRK+4HEpgareWBTzbMFNI1JBcIVbhNd2p5fz5+b/wVmNNC8iNm3QNvkFNnj64CBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtTykqEOeQLfkooX46gCFuKoex9ftn19RXS6tLDgz/o=;
 b=Y+igc3sih0h0qa9HqZfj+85tnX2ZEwVVpXD/GwGedsejBND/6FYtcNKZfsOgZ+nsg7yx4amheEMlpZ8QzFAAz6465a5xGHAT7Zx3iDD0afhbepu3Xgxi2ZyVQENGjVOZJVeF1wlYT/KA6hfZsFMWvf5HcYmbdbuwOoL/TTb4/AqaFv3EI2iLTcQCtcNdntcY/ga6vDKqSUrpLvAI7JNP90GnZYm+jntuITWDVfK7Cw13FSAq1Z28pj0o9F9N5TXF1GDNQEnbTfvtHtjepw+cGTfcKZQlZp3ogXD9uN4M03jyx9it1I/jNZUiTrMaaEVo20Hbqvl5VpcxWc07yelFxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <09ffd0b5-4124-4333-873a-d3c356a83085@epam.com>
Date: Sun, 19 Apr 2026 19:29:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <jroedel@suse.de>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <4fd154cc1d76972d85df6c426320555d6894adfb.1774918270.git.milan_djokic@epam.com>
 <54FF0879-2DDE-4BE1-9BFB-363AFEBBB294@arm.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <54FF0879-2DDE-4BE1-9BFB-363AFEBBB294@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::15) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DB4PR03MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e595c4-0523-47ae-263e-08de9e394934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v8uGABPKss6SLYGze7sl7snWI4sd1vpr+NN2WjmEWWKPP120ucnDebUis3mbMazyJJFz+9lTvopialJzcrpiJzreyRMTE9Zr/5069fH9ZysHG2kGHz+tEQG53B7vRPYtPfBKr4o+221QRqb9kc+Iv4hczJEWLiwckWZKpKtz9SBYuEzYermpsTOLP1TZXTTwk/12T10+nhl+dFF+YZmsZAk0uUxOnjxl5Ukq0fw5sXLeIksqzKBc8Ip9+VPo/G6kLW8JVORlF9ZPUHKUragWXTwhAwjJHZpK1W6KTgJaZjtU+EXDUUhEmcH5wDM+CRZskHzhQsSBqLAuLFkQV/hkMbIFJorw66Yilrjf4osQpGX3dEDA23WV+fD1dsLwRwzotIE+ZEmrup8v5vBU98jSC4J6F6gFK3dGf2PO2ev24phkKvDpSlw8uMGrOrUz8qURHvgoGvQJh98UrIqXxRtZvA3TQWojIpdcwMbRKMXmt1UVXEj6WBE41Id27oxVxtC3l7dTEDf+eEwEfK7zHdvkt17l5du5zpqGQRuBUv8j2mIPGdmwZdLcfMYH/RCjE53t+pYwwtEKidwL95qSkVgsNlHDqrFLmYY/dASB+jOGwhJXHQoNXfgSzei9nxIn0hwylfT19ixo09uVwUae11zd0K/oNOG+04jCI4TAcs3kQZcWHo17GNz50sHv7zoh7Uz8jrAYEo6FBUAU+Lqq69Jw0pNrw12EoPMxUdjqT2EWvQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akg1Q0ZLUEVvajlZRnlTYmg1SWZvcVl6UTg0VW96ODVNanhucWI2SVdUS2Zp?=
 =?utf-8?B?YXlJL2JsRk1kZVBYVjlZNE93YVh0RVFTTlBudTJVZGZNclIzZUtzK2dPSXdF?=
 =?utf-8?B?aklkdjBYTWU0ckdEVG9WZ0hCOUc4cll6RFU1RGh3YkNkZ3MraG8zVkQ1ZnlP?=
 =?utf-8?B?R09LckhaZjk3UUwvNTEyT2lQc3AwbG1pbTFvTnJsVEl5Q3dNbk9DN0ZJZURz?=
 =?utf-8?B?NXhjOHpIQjhYRnVXMTBKNHRZREw0alpqZ1JpRnhxM1FreTVUamF4K3JKUXFo?=
 =?utf-8?B?MEdvaEJjZjI2SGFYY1VDWHpEQ3RpVkZQQTZZdlpiWW92STNERVRXMm84SUlh?=
 =?utf-8?B?Y0Z4N0pYdnlIdGtBZ0FmQUo3SlVTc3k1TitndVlaczZjUGJUN1Q1QVdOQ2hY?=
 =?utf-8?B?ak1XQjlPZzlOMTdvL21xYmJqWDVSNS9CdVJteWdqbUlIcS81R1JGOVhaK2x5?=
 =?utf-8?B?SncyNzlnSG5KOTNweHRpSnM4NVF3S1M0RmJIbHBhTWQ5SlhtRHRLZU1wam9C?=
 =?utf-8?B?c1BYMmxGMXpmR0xtVUsveDlNSjU4eDhBa3I3YTZhcWxTUm1TNFo3cGJEbVBS?=
 =?utf-8?B?bk12VHNZTlJJdkVCczIrWHBBYTJxcCtpRUZBc3pIL2p1Z2hBaWYyb0tUV0Zp?=
 =?utf-8?B?TUhSWDVhV05kUkIvMUx1N28vNjRjTjNndGlKd0NnLzNqNHRCcTRtSktIMUEr?=
 =?utf-8?B?b3ZrY1oreDYxb3V5VUthWWR3ZkN0T3kzY21GUVB2UXBpLzVaWVpEOUx5aEFq?=
 =?utf-8?B?eUhVbUpRczd4SzBhem5Ca2t2WjRDa3oyZEtlZEFsMi9vMW9HZXRjL3BuZklZ?=
 =?utf-8?B?UmxIMy9XSmZaejdZQ0N3endHNUJIR2t4bEZBaVlLTEJJdXNZa2x5aEpNaHpx?=
 =?utf-8?B?KzZoZkJYRjdkRHpCR3Vjb1I5a1JvS3luSnB6djdyeHIzSmc0ZE5LSERTcVdp?=
 =?utf-8?B?ajZ3UER2aExZd0FFN3ltbDFvSi9HcFZ1bWhHcUwrVWQ5Y2E3cmw0emY2d2VX?=
 =?utf-8?B?L0pVZ3IvVHQ5L1pKQ0lGeWpsYXF0OURsZU9DdHpTUlVyZHoxWVhzMENYNFhI?=
 =?utf-8?B?R1B2b0QvZnV1ZytoblAzakNRNFh5ZW44TW5tdDgycWczc1BBUkNNUUVzT0V4?=
 =?utf-8?B?aDdwdU12ZWJPV2g0OU56c2xvMkhDeGhRaUgwZ0pJQjU0VEJJdUFSTVZyamwx?=
 =?utf-8?B?SHBna05oYTFnM1MyVzN2eHRoVHdhVUFNUFlaR0x6N3VsQ2c5UUJtc0pyL1lP?=
 =?utf-8?B?WGU3NUdvYW10NWUyZldGR3FpTFpZTnR2L2pQaWRIQ0NFMDFSdVpCbDVHTzc5?=
 =?utf-8?B?bm8xMTFsVnZta29vcHBtUTdrb0RpWGhZZE9ULzBzY1doYWFhSlR6NU9raEk0?=
 =?utf-8?B?eUJ5cklwUnF2VmR5R2VjbHc0eWo5SmJRdVFtUjYwNkc3bHJmV1hYa1hPUGxG?=
 =?utf-8?B?SDdzemRsUVg5bXMyZXhrMGJpak9JZ294RzlURlREY29oY3hkait1cm1yTElj?=
 =?utf-8?B?YVlIekluMzJtQ09rKzFsOHV2UUpkL09FN0VDSzdrTW5hU2tsd1U3UmZsUmlL?=
 =?utf-8?B?dGthVW1za2haK0h0ZDhIMTZjUEtyM1E2ZDdBWkJLVHozdzhIaDJWZHpuMm5l?=
 =?utf-8?B?NXA1a25GK3ErNy9xcEcxNlJja0RFNHRkd1E4eXFVTWQ0ZVp0bnlpTE1PcUJm?=
 =?utf-8?B?TW5FZ3RETVZGb0RPVGY1QlY4cHpzRGEzYmlqNjBldFI4bytEekxLV0swajQy?=
 =?utf-8?B?Z1NFU2JXRVVrSmc4N3ZOTXN0MkdjOTB5cUplMURhODZvOG5lVU44ZXNBbm56?=
 =?utf-8?B?Yml0ZzIzZlJlbnFRVlJOdStQZHFnMjVTdzFKVmZkNk80Z0RRRjRlV2Y4SGhI?=
 =?utf-8?B?elVhd3BzazJKY0VQVjRzenJYTkM4V2hrNVRFbkFOUEloR2tuUjZManRUbnBG?=
 =?utf-8?B?RFFIczZxMnQzRUkycUY1ckR0bGkzSWRmWXE3cTRlVnpUSUZrZnBVMHB4Njlw?=
 =?utf-8?B?K01LRVVEM0V5L0hKZmx5SVhtaEdoL2FobmlBb1VuWHJ0WWsxcWJKV05BaHRM?=
 =?utf-8?B?ZlI1RjdPK1BjaFNDbUE5OEdPSG5iQjlTcnVMQzk5U1JTY2NnekRoUldHcmhR?=
 =?utf-8?B?NCtHZ3VXcy9zYVhnTkNCM05XMzRMM2tyajd0bjBsS3JmYkdpQ0w0Qk50UzNr?=
 =?utf-8?B?enZCTjRkWDQwK25CN2RKL0QyT3diTFR0RHVoQWpkUlJvYm11S0pGUGdrT2I2?=
 =?utf-8?B?TEdMVExZVEJLNHk4eXoyR09WcVdqTy9jMU1wN1haMzZ0VXhEbXB5VjM4WE56?=
 =?utf-8?B?UVdBc01DTk5qR3NvUHgrcEQ1MmhUYnU2WTNEUVVseHlmODFweGFTdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e595c4-0523-47ae-263e-08de9e394934
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 17:30:01.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixUtmoMfdYfatwBGLP6hVnLA5O1hNb3ABfYFDe+HFBvjUjLn/arOi/w3MXN+YMWbeGcpMGKM3hMO+ttm852ZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-purgate-ID: tlsNG-c201ff/1776619804-2A374443-1EB74818/0/0
X-purgate-type: clean
X-purgate-size: 1758
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:jean-philippe@linaro.org,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Jonathan.Cameron@huawei.com,m:eric.auger@redhat.com,m:zhukeqian1@huawei.com,m:will@kernel.org,m:jroedel@suse.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 5BFC5424E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On 4/9/26 16:59, Luca Fancellu wrote:
> Hi Milan,
> 
>> On 31 Mar 2026, at 02:51, Milan Djokic <milan_djokic@epam.com> wrote:
>>
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> Backport Linux commit cdf315f907d4. This is the clean backport without
>> any changes.
>>
>> When handling faults from the event or PRI queue, we need to find the
>> struct device associated with a SID. Add a rb_tree to keep track of
>> SIDs.
>>
>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Acked-by: Will Deacon <will@kernel.org>
>> Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linaro.org
>> Signed-off-by: Joerg Roedel <jroedel@suse.de>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cdf315f907d4
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
> 
> I think that by only backporting this one we are introducing a regression for which
> we don’t allow anymore duplicated stream id, have a look on this linux commit
> that is fixing it: b00d24997a11c10d3e420614f0873b83ce358a34.
> 

I will backport the logic from this commit also

> P.s. I was able to apply only until patch 3, I think this serie needs a rebase, do you have
> an updated branch or can you point me to the staging SHA to build it? (hope it’s not too far
> from now)
> 

Yes, sorry for that, it's conflicting with the couple of recently merged 
commits, rebased for the new version.

> Cheers,
> Luca
> 
> 

Best regards,
Milan

