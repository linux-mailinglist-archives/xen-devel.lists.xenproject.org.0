Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGFzAmVqnGlnGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 15:55:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BC1784D2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 15:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239094.1540527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXKP-0003No-KP; Mon, 23 Feb 2026 14:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239094.1540527; Mon, 23 Feb 2026 14:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXKP-0003Kh-He; Mon, 23 Feb 2026 14:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1239094;
 Mon, 23 Feb 2026 14:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTyZ=A3=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vuXKN-0003KZ-P7
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 14:54:27 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af1287b-10c7-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 15:54:25 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:54:21 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:54:21 +0000
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
X-Inumbo-ID: 8af1287b-10c7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inl/TyyvKgqb8mcZUeEZycZQSQTvlK3kLwOI9piNqTUsqGXpSh00U8l8b3MnPsSeQLG5q8zZUP8Rdywao0qOYLCr5YC68AHTiUum3Kwd0/XohpX9KRtaiLbfzrR9okx2Thp1RlLEFYjkmZKYFON9wVVDfiIXAgBJ9TKiEACoubdQFjjX3qDiht39bzsp1gIUqJZDAH2YIhVZ7rHOXPM+ShEsCYCvcjePvIJFNAMEHQFSEi0N+Ps+tQXoSV+3xwe2T0M2r7yVyIUVecTxRwMAyOc6uf8j0TW6S1UJ6b3WY9BFjOlJqmru0XaDzrCtrKZXSVL5+kGJTGA8BE51MOJHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgevt+JNIHEf4sqMGVBsmtuPZIiHU7WMQlfaHHEPSN0=;
 b=bNmzFhchHg/fjLpYA+Zz1u54sZLdrfFvtQc40zSH6bSKIp4wvHYXGmvQQOLzu3VnuNhr3JtAkdBJLpUMTmecj7n2ksRL6C1kUSgpR9xT9KxgTpTYoVXz/RwRIhQ1CmnZeyRkYe6C1amoRCNfpgjmai4thS8GIZdFoCKTqlrbUuOkHqgXHLFHs8iEqGyqwOG8z2iJ6sCKm2+UOLeHzdU8OdJ3JOKqwlEf9aqkqRsdCeL0AgZial17u2nrkoBi01E/I5ZJ3ytpxrW9E1znL2RIJgPjGCqxuLHts45gYKtWAxh3zrRNGEL+FLv3lSKYiGGJ2tiMVosfbcG88EClpXSSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgevt+JNIHEf4sqMGVBsmtuPZIiHU7WMQlfaHHEPSN0=;
 b=0nZn6vRnJymI38NlRslTe22tGJ5/xwFMPApFo+HN+S2qX4PHZwKK2+Ay44tVzRlHtNxTwpaPH1sbs9gLvXxqWg+l+8V8lfiuAkfokXfwATAPL1DC6IjFRfLxstgJ2Uhsav47OWXzlswTr7mhMTvhWaZB/l5nNR6Q0KiXUb7GC2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Remove x86 prefixed names from cpuinfo for common.c
Date: Mon, 23 Feb 2026 14:54:58 +0000
Message-ID: <20260223145458.438621-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|MW4PR03MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 223d8c33-7d8d-4db7-ba06-08de72eb6d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M7NWn3j6Tc9jelY661t8vhYGUhEX4nNyir6/27BschqOyajGVb755QuGP+Ng?=
 =?us-ascii?Q?4J/Bu+7HWTHqO1Lo/amRiWY0MIqrWpc75dITrxAEaq/n16JqnFC5Yijs8t1p?=
 =?us-ascii?Q?6Pc+reO6vxIdaIjTCySJXdRER5pVje2YpKIbReN98O2FDhR6BjRYXLY/b8YF?=
 =?us-ascii?Q?KbQSiJALN5b4CVKyG0Rs0daDN2V0CSr4IBv9WcRMSaQOLUWlvn3WqkMRwfKN?=
 =?us-ascii?Q?OT1g0mk1lxZFIBzc/XOJvFry6C0uEMVt/PvWfndu44e4AXMzDQWLHZLLMrsx?=
 =?us-ascii?Q?xOFgfwD2mSFCbhLUQ2Xmlo1LLLQDSbPMxw8wZgB6B80b4RsDu1wWZdLHwDlp?=
 =?us-ascii?Q?tTv+HdQwqTr6o84R54rYzVSb/qyhGe+w2ky2VPZe2nPdtbvk3iB39IvcbB0w?=
 =?us-ascii?Q?ZVhYMqyk1959MYLvsuw0QSAedjwi6e7ozfWN3qVtt++lPLmW+EyITOy9bCOX?=
 =?us-ascii?Q?JkKhZrvc4EY/iG13jsPdrTHZ/sqaZDqiAewKwnjWelu6CliP0ggMwrcOtsLA?=
 =?us-ascii?Q?23xST1yMPd9GBkQ979xxQdlZSSl0OeYBuBhISlHZnpPIwd/WIZK4tjqPnnW9?=
 =?us-ascii?Q?WFCjL0QstJkhZNv0e4FMSQKhyYocb8J1Qgxn6dd4SbujgFsDB8/rH6H6HLku?=
 =?us-ascii?Q?uiorfPSFtDvJhUfV6GtrMshMDO9olhmcFVt0i82WNRROUnmVNsbJClkyus6A?=
 =?us-ascii?Q?quTQezF5N/AroJ6HE8gnY3z0CwPkNdeaHu3rTVij9M1q05ft9LiLcVNox89S?=
 =?us-ascii?Q?JDVz4xxiUNQ9YkCjWURc6ZDjFPV4rYwNn/pvtcN04RaLw5SUr8kRmwPkB9rF?=
 =?us-ascii?Q?rqlNH/tXarvFwlTkNPC3AV8Tu43sOllKuTlwpVvpcKetBfDB2OImH/wLnsJT?=
 =?us-ascii?Q?cvXgB+ka9iu+9E9Yrn2NnN9wg91O6/i6AEtuNHpw1SujR0PHv3QyH7u6ii8U?=
 =?us-ascii?Q?JfW59lPuH40nOPY86okAWJvtZV+w8PUzKdRHdD7f3awmRiY8Ryl3XMEQsKo8?=
 =?us-ascii?Q?hvvDelEg4WGpMFKxV0QE73O2Te9hp9gT9VQftf7pfg2dwDlUIbcpHAv5FB7M?=
 =?us-ascii?Q?0NZDfMQBPUCEGmNwJgaTczLETMj9UVk9MmrFKKZa1a0o4Va7FWQZOHZbz5P1?=
 =?us-ascii?Q?+5xpfX2CRqlUpokep4qeW+XAtCq1V9MdBZJVKooH+Q4N6RBK6qhQGyivyjn1?=
 =?us-ascii?Q?fMvxQFykCGGmrZfj+s/7Bj/jl9QNK9gt8rR9am3EOraoNS/qc4L/wILCxXEK?=
 =?us-ascii?Q?HmfwCyPJk2RV3nPbEeuwhP+2D+tyMo7kAYIruVIz7Nh90ZbX2XXhDdsxhjcS?=
 =?us-ascii?Q?/7uc1ND1jBOZNQ2RFrLr4D/YlclEtshw5GDL7W/nRPrSfHtDhHNQMLJO6NV7?=
 =?us-ascii?Q?EO9brEwI5QQ13WwvbIfyOjnZ4gf5Wntsx9/adJG9++YoVAOA4B2JoNiZp8IF?=
 =?us-ascii?Q?HyDS9BIton4CDy6+I3ICg5BWwmJvfd6gxi8XYhZSmtLOQoUcE89Krva1Zivz?=
 =?us-ascii?Q?0XLdop94jqdX00iriXzGT3726OmijxVCxcuLOFm2Ayd4r9wguHxsvJgywcRa?=
 =?us-ascii?Q?pl4AF6uQExKZKa0N9ZQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZM0vRHCH2Dak130QVLC0BC9YiR6Lgc15KmThTELL14bQdQaL/fquf4I/tjp5?=
 =?us-ascii?Q?u2tGCqrCtrRGYQrfsX8KGS5XkwXctG8gu0zpAGn8P5ECAIYI6q6iiaMlekzr?=
 =?us-ascii?Q?u1Q2fU/3xqAp+9jjRNfT5MB6YT1ic76BzJTnS8TwKS0HxlPRY6BD9uNJ9hfG?=
 =?us-ascii?Q?ZX/QT4TsRQGh1HwG5b6n1xKpMro88fNfe7a6sj1OFeAcggcU64HfNDrLrBmf?=
 =?us-ascii?Q?KLWPznwfbEEqUl9qCa38Us04WfcVkmw7CAA5wPV/+3sKyNGdjSfDzrEBJS8M?=
 =?us-ascii?Q?94GVBwKYOh/gkmQlLbirbwiON7YHOrZgnrF36+DvTw+OPHHGsiLAFfM9S6JM?=
 =?us-ascii?Q?mxliFhcDbQtPIkKoW9EwZR1n9zaISLgyi/AXectSanMUhCVr+ZrndCDEB3Q9?=
 =?us-ascii?Q?NytHBjsfCvj0wwTctVm7MgcYT9zLrBNd5DpfWjdqS3F3feonT8Hf6XUwuHdU?=
 =?us-ascii?Q?XiywyEHIMobTVKm1kjTqBwvpP0O4Cohc/gbttHI+7DKvRQK3ayvrgoxmhpo4?=
 =?us-ascii?Q?mu5nFxhdMt4LtjLLjE0XEmsU9KVmlGuy2w4ejEHW1jATtioXAwoNRK1QrJ6o?=
 =?us-ascii?Q?bMChFYBtAa08CHeEGHzIzBRX+xWVIpFEiJsfSyr8UKpSypbHv81UMPMQJ5Kp?=
 =?us-ascii?Q?YSKMUE74xLu1Ac0x3ifSsQAs5bPbxAAOeqO0r3WyymvVcd+kxQNfS5gRTrVH?=
 =?us-ascii?Q?TKRTzreIv0Va6WNp2yVL9NlQ9Iz8IWfolrJD/hKs+pUUhlgF8wjfUtxysXcF?=
 =?us-ascii?Q?UdfHGN9z1UEIgNlUMQp65wOgh6V7gckvPWHICc7BJLmw0mnACvGT5+EhCnjG?=
 =?us-ascii?Q?B1fBsLCDhNKteSeQBXip3fNgtWRe0/vZOrlufb1mq7x19AevNKtBL/3ocEwc?=
 =?us-ascii?Q?c3gJubM0l+OmaF7D9cZF7+73unXxv8hbXgD861r+lk32HWDP9+Y/g6BQ+eoS?=
 =?us-ascii?Q?IMs+A1aKXtfFTDmiYzADXkX4+3SCn/p+sMGcN3rl73NKF+WzIb7PfGVAwzPv?=
 =?us-ascii?Q?0VLlej+ogyUaidpETPojf47Slv0shI8rLEbH4GjOQ4sW2vFywYRbBcSw+mlD?=
 =?us-ascii?Q?BQge88kB24s2XoNHlhkUeMHTCknjmcPr+kPeC7f+8CQYHv8ttMNz4CgIFPTd?=
 =?us-ascii?Q?T/K6R4tPh82iBzviPXoYvtSazdSyVk083Sq2cwNW/qBsX8/nVw6/x5yeYcbB?=
 =?us-ascii?Q?O4hu6G4ZmdH7Xk2z2UNvdQ8bGDnGzq2pr99Ygfug7CzinUc10dS1ZMk+5GyG?=
 =?us-ascii?Q?QGOsjz+PCVdc2WtLVl+umiX7jttVGAFy2IdxxgCewUTz5cmgrn/k7CAv+22B?=
 =?us-ascii?Q?m0/tQfbFa3wM8LBcikXuzQpYvGiEjw/BaI5bUU1u7Cp7uHfqOn3ciGhl/W1V?=
 =?us-ascii?Q?zqzX8ErGXP58HGfdJNhQm5QGn0U4YFAEURWrPp+6zgWr/cpNGbz+MDlQrxq3?=
 =?us-ascii?Q?LOAo3iwvrpx5Tku60cvKWYOgzybPr14K6w7bOZ4OBCoWn/vOPEdr/C0huG4M?=
 =?us-ascii?Q?xa3pPOjaqCWsqgEWZsWXG4GexFosrp6ryeUF42Fwu2rpXL8FblrUqRK35PDm?=
 =?us-ascii?Q?E35IapXdRN9Oofir15O/1iXUzmV5y2S4g+J06peQn1xOYO0JfzuHnmj4oObO?=
 =?us-ascii?Q?5rwo9mGBLsnNZjZiWASBM3xOAI95joiH+m7dgNlOkwDHWNl07TjZhohhiAqx?=
 =?us-ascii?Q?gOqcptbWhecTe+F7ZapiLw7fk4A+QTrbgenUmmMlGJ0EqT9rNmyl9zdLBYmy?=
 =?us-ascii?Q?kwLqZLPdDA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223d8c33-7d8d-4db7-ba06-08de72eb6d71
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:54:21.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+hgHoUUB5sa69vZgrtiwAYUbxBNc/1tztNfnbmuxPvH4PELBUn8fWdG0ou7cOAImx96ks365V2H6jV5/3kPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5B6BC1784D2
X-Rspamd-Action: no action

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/cpu/common.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ebe2baf8b9..bfa63fcfb7 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -327,8 +327,8 @@ void __init early_cpu_init(bool verbose)
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
-	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
-	switch (c->x86_vendor) {
+	c->vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+	switch (c->vendor) {
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu = intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
@@ -345,7 +345,7 @@ void __init early_cpu_init(bool verbose)
 	}
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
+	c->family = get_cpu_family(eax, &c->model, &c->stepping);
 
 	edx &= ~cleared_caps[FEATURESET_1d];
 	ecx &= ~cleared_caps[FEATURESET_1c];
@@ -389,8 +389,8 @@ void __init early_cpu_init(bool verbose)
 		printk(XENLOG_INFO
 		       "CPU Vendor: %s, Family %u (%#x), "
 		       "Model %u (%#x), Stepping %u (raw %08x)\n",
-		       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86,
-		       c->x86, c->x86_model, c->x86_model, c->x86_mask,
+		       x86_cpuid_vendor_to_str(c->vendor), c->family,
+		       c->family, c->model, c->model, c->stepping,
 		       eax);
 
 	if (c->cpuid_level >= 7) {
@@ -432,7 +432,7 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
 
 	initialize_cpu_data(0);
@@ -442,10 +442,10 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
 {
     if ( !keep_basic )
     {
-        c->x86_vendor = 0;
-        c->x86 = 0;
-        c->x86_model = 0;
-        c->x86_mask = 0;
+        c->vendor = 0;
+        c->family = 0;
+        c->model = 0;
+        c->stepping = 0;
         memset(&c->x86_capability, 0, sizeof(c->x86_capability));
         memset(&c->x86_vendor_id, 0, sizeof(c->x86_vendor_id));
         memset(&c->x86_model_id, 0, sizeof(c->x86_model_id));
@@ -465,18 +465,18 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
-	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
-	if (boot_cpu_data.x86_vendor != c->x86_vendor)
+	c->vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+	if (boot_cpu_data.vendor != c->vendor)
 		printk(XENLOG_ERR "CPU%u vendor %u mismatch against BSP %u\n",
-		       smp_processor_id(), c->x86_vendor,
-		       boot_cpu_data.x86_vendor);
+		       smp_processor_id(), c->vendor,
+		       boot_cpu_data.vendor);
 
 	/* Initialize the standard set of capabilities */
 	/* Note that the vendor-specific code below might override */
 
 	/* Model and family information. */
 	cpuid(1, &eax, &ebx, &ecx, &edx);
-	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
+	c->family = get_cpu_family(eax, &c->model, &c->stepping);
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
 	c->phys_proc_id = c->apicid;
 
@@ -605,7 +605,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	if ( !c->x86_model_id[0] ) {
 		/* Last resort... */
 		snprintf(c->x86_model_id, sizeof(c->x86_model_id),
-			"%02x/%02x", c->x86_vendor, c->x86_model);
+			"%02x/%02x", c->vendor, c->model);
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
@@ -824,16 +824,16 @@ void print_cpu_info(unsigned int cpu)
 
 	printk("CPU%u: ", cpu);
 
-	vendor = x86_cpuid_vendor_to_str(c->x86_vendor);
+	vendor = x86_cpuid_vendor_to_str(c->vendor);
 	if (strncmp(c->x86_model_id, vendor, strlen(vendor)))
 		printk("%s ", vendor);
 
 	if (!c->x86_model_id[0])
-		printk("%d86", c->x86);
+		printk("%d86", c->family);
 	else
 		printk("%s", c->x86_model_id);
 
-	printk(" stepping %02x\n", c->x86_mask);
+	printk(" stepping %02x\n", c->stepping);
 }
 
 static cpumask_t cpu_initialized;
-- 
2.51.1


