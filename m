Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNKcLPcr92mjdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 13:05:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FA4B532A
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 13:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299330.1573930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUdD-00089B-6q; Sun, 03 May 2026 11:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299330.1573930; Sun, 03 May 2026 11:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUdD-00086I-41; Sun, 03 May 2026 11:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1299330;
 Sun, 03 May 2026 11:05:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wJUdB-000869-Vx
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 11:05:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJUdA-00FgdB-Sq
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 13:05:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f72b9f-e002-0a2a0a5209dd-0a2a4502ccbe-22
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 13:05:00 +0200
Received: from [52.101.72.110]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f72bdc-af86-0a2a45020019-3465486e8925-3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 13:05:00 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DU0PR03MB9080.eurprd03.prod.outlook.com (2603:10a6:10:467::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:04:57 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 11:04:57 +0000
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
 b=HsAENn8+C/70MlembmHeiCdPgwJpRofQmJIXpWmikOtpLGbxJ4cDvfRQ6v4nWXWijrCkvbK/kCX/azlud7zhzl1cNQNQCuQ61k9Irjqjzcn7vw9Fbh4MslI8NFGOwrysAA+xytNlRyPs7mp3NcG4wef35LRyj/cqwYdrzG21ySUocf0yF+XpAEvDvlpyOZfpWTl3Lsa9pEHYCnJF6x03Cm0uROc/s69aLirLNKYcVB9BXBaHxMdDfhUTuARc3PTS+SXXdPGSCv9jpcEXNXBA8TP27foI3Ao7I+yUCxxTAxhZxuWOGQ2d4encDRb0CYwewPxuBnL/G3Gy304CYawmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0mlhXQDrnEd0jGP34J37YE6/XNOg5kxp8uDHpTU51M=;
 b=MjXeOST2jzPLQr+tZdAMVfwhn6Zj59ZRcmc5VnV9fYPK6OTTrv4z0QjH0OEPM21r0zcCYctjoFxl+owdNlPKFk+Rl9NH2+3/Vd7MSgM8yKEhmI0/Cg3hBkDAxF1IaPHfoKzJ2Emm3i/uWKArH/Ir0CurBVNZom0x80JsaNfNTWdD/HS+VRyjau/yYFwjzkNGTXdTbvbh3EN5xLjXDLGjp+RjiZkGGY6LcOKTCY2lJCCQjt05c8HiYL0MY9zbeme8ASEzmiNjKQHigNY/dPFRRA2g5FHs1K6CLsH7P8YlTeU6lDp+nc55emiW0m0GOCKhmjHqTE3fbfM6BFBIj4j4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0mlhXQDrnEd0jGP34J37YE6/XNOg5kxp8uDHpTU51M=;
 b=PyCT7AeDqFq+Lyi8+1qQW8z03aN6jLCz7cXl9S84/GiIvY3R/v4ZDhEDD+kXh/yMZI5nUW8mlBLGdg/U5kY4iB9U1exCFbZ7kx4n2tZ4Ka/DzV2PC4YleKxFfPylPkbFPDnYMP3hhrryjf6LcpyrR1A+gq8dgqtA1dpEvISiPCgSdueMf3A6YWIvOzlX7uF9NOcoiThEoK7c9TfIV1qOpTB6Ps2CDLVm6RkcbZ3HM7jXDvE9ZUJ1V/9/qprhSJEndWaJFwVkY8mKKrMavRjpwc+gCIP8z8WSfLdiZpPkGHTf2LTbZXGM1E/ThuRP8ktlihiH4hrLTwizMZ5hf626kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <25bf16a0-0462-484b-8ce0-690315d8a36f@epam.com>
Date: Sun, 3 May 2026 13:04:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
 <B816D34B-290F-4C1C-A66A-9124A26AE07F@arm.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <B816D34B-290F-4C1C-A66A-9124A26AE07F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0241.eurprd07.prod.outlook.com
 (2603:10a6:802:58::44) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DU0PR03MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e4ae87-08c7-49e9-cca6-08dea903d01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	54M5urPuLyAq/KCNSm2b7g8sipkPxL+BotrtYG7hOcvsm+A5/2o6aGQMALfzQyqAkVZThBFZSSk+HsTLk9r/0dzpRng9XU5Vsuec3PsjZ2YPisSJAVqT53nTKDCHePiZNpTL0l3l39akGM5rugugcoz7lDW2X2QwM3H5C8Bj7mGJSFv30+F1sdw8bub2pLK6YUoVBG1CMDmblFhGQsmaFmXpp8z49DMjQRNsArjk4qlTGxH/SK9zyFQLO3oCWA83NH1zGkXFmHrcBUxCySuyGEBRjCkSFz8YdzBa7lth06HrKPoXS17yt13X499fGZvw+siG2pFSOUYhagckyiF6GuXRczvRfw+rfSTDJNIo2cGOK9/9mYU/QzFzGD+5qqE+TK+1x7TYS1uAYS264GXTqpLknpUEYH1ccyvfxYd9gNvAWmf2DVp9xiKfhbLRBvZYvtzC3faloZjH8X+vGnzafSTTZDe0EfKmwq+G5MHOWTRL6DqpJsdEu101NzFzvyv+WAs3bQ+YaGkudBL5VMTqnbHNsBH57FYBL60fVGpt24511PUETasZuVaAyFLE/NcfPGjjaXP1E+rFoIZjRDRqMCvXRaOTDjILJXczMYMy2LLVWASRBlstQE2Xu64Ei5khMAZ47flF54dYWJrMnTKIcpx+IYJQ3kHCshyBI/NeGY+niiB9GhSQ7QxXhi3CBWbw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTBTL1lBMkZMUUJjaGZEUVdVcnBsVUJFR1JlanRlUFFKV3Fnanc0a0NBNCs1?=
 =?utf-8?B?bW1NUy9NeUFjemg3b3lhNTVURkhhaHFaY2JhRjArWU1nSVFxeFdMQ0txOGk2?=
 =?utf-8?B?MEtFRUpaTGZqbkZRZmR5anVncUFpdjRLVGVFbC94cEx4OXJiTjN0azU2Z1Zw?=
 =?utf-8?B?YVhRRXhrblJFZDhjVTVLa2tKSGhwMSt4dEdVcUlGNW4zOVRiODg0M1QyVHI4?=
 =?utf-8?B?VFhQNThYQjJreU4ybk9oTXZDNm1QUlQ2S3dpRXhtRFhMTEZ3RklzbG9QalBl?=
 =?utf-8?B?dUNxNXBzSVpTYllaRW9XVExaV29QZzJURUFzd1kycmhwQ0prSHZuTTY0bTdP?=
 =?utf-8?B?RUJEbzNnTmQzby9BY000KzBPekMxTGJvWlJwMEpVdlpaVXBaeTlSbGp2Z3BC?=
 =?utf-8?B?WnBab3o1bnhYU3V3VlVzUmprOXU1QW8reHBaSVlqcVBPT0VPaFJUd29BUXFj?=
 =?utf-8?B?NXY3TGNNaklGeExCL0lRRUpuWmpZSWNRK05xR3JHYjFOTWpFS0dFOGhwdzhC?=
 =?utf-8?B?S2pNdlQySWNzeCt0c0lXVWZwMkRKZW5EM2t4eFdRbG5mRndsbG9DeURkamlI?=
 =?utf-8?B?emdpWEJQOGNzTTZOY3JCSmRLb3F5UHRqT3VVbkMxRjlQVHZEdHJNdmxSRFhl?=
 =?utf-8?B?RnljRjE1Q3l3VEhENnhzWk01bi93SnJoNXA5QThTaG4wQVNxSXJhTGZQb2RG?=
 =?utf-8?B?RDh4UFpqOFFqRVdlbi9oei9uUkpDZm1YK1pQcmdEc2lyNWFpM0dZb0JLUmVr?=
 =?utf-8?B?Ukllc3ZGblF0KzVHSEFmemtnSTFaR0pwOFRuaWFLbTQveC94cnRrcVg5TUcy?=
 =?utf-8?B?QTEyK1BHTzcyVEVEZmpyUEx3OSt0bHZRYnBmdUg2QzBrRGxmQUtTeDRpcllW?=
 =?utf-8?B?RWE0dVdWSFNPNlZXK0hkSk9JaHllTnZOSkpVUkszellpS3lSQUlSODlySkdO?=
 =?utf-8?B?dmJIL2s1OW4xUFBzVTFUUUJBakNjMmNScHlFYm9TL2ozbU13Y1I2NG1PNWZK?=
 =?utf-8?B?eGsvejZMRFVIZERucFkrcnhrTTV5NkNlODMrcjlqMks5azRkRmxXOE5wVWZ2?=
 =?utf-8?B?c3dITGloRkkzWTdaNWE2M2RZVHRSVjZ5dk12N2ZYTVozVVFVaEQ2TkZqM25P?=
 =?utf-8?B?V2VUcDhHcStVRjNqY3ZVaVFxdzArS1k0R0JtcHc0S3dSQ01abzBuQVkxdEE2?=
 =?utf-8?B?c2VyWWlzRmkzc3VyWWp0NGZGbjNvWlpXTXlXeEZsUnJFYzlYU1BNNEQ0MmI5?=
 =?utf-8?B?bEZMTmJ6ZHRMUHVsam9YSnBCcUhYWGEvV1ZWSW01Z2ZBQzJ1TlBUb2FmZ3FO?=
 =?utf-8?B?SXY0QnI5N2RtWGhJcDZVYmJkZm5FYzlmYTlOYUx2K1ArL1pDRC9NUGtsWEFP?=
 =?utf-8?B?aERWcDY0amtKK0tXRU0xWXNwMlQ1emdQOFRDTkhuYkNNR3dtczJTZXR4YXRP?=
 =?utf-8?B?K1JnSk0wT29ZeXF4R3VEa2hxNUZaQnR0YmRPQnlSdlNManRYVmJPZDN2QjAz?=
 =?utf-8?B?Q0E1T1BHdWFHRGpsMDBrN05aUnFNOTJnQyt1bkJleDY2bEFsM1d1TDVkMzdF?=
 =?utf-8?B?OEZZMUJLUGR2ZjhiUWViSlJ6TkJtVjQ1Z21SMTR1RzdvSnFBWW9EcytvNWRx?=
 =?utf-8?B?dk1BdHhwRVFwdEYzQzN5d3YzcGY0M3JHbEJJcUJHYjZVTGlHK2xqY0R1S1U0?=
 =?utf-8?B?UVpjZkwyVlBiSDM3eFlldFVod2VpZjVhVHd2RGpHODgrRmd4VmNqQWI0eVg2?=
 =?utf-8?B?b0pnZklXeHFONG1FVFFuMUw2SnJ3ZlRBN2xvaWpRN3JKeWI0VUhQcWZxRnE4?=
 =?utf-8?B?bHJoazF5YnVsV0FRbk84VG9PaFkxYmJiVy9OOW5BbHRhbnpRTVFhcTRma2hh?=
 =?utf-8?B?NGdPWEYycC9IeTUvdEZhNG44WStaYTNvaSsyMUxhckRjM0FERzBMOTFWYnB5?=
 =?utf-8?B?UCtsd1VSNnhmZ3ZFQi9sNGJBb1h1ZGJXQkt2cnBKSTlkTVpZbkZCa1UvdENC?=
 =?utf-8?B?MmE0TjhlTVlXc3VNVnBpajZMMUhyNUdaakJYaVMxa3FzU0V6a1VLaWFubFNj?=
 =?utf-8?B?aFlpWHlOUjZsOHNPM09EdFVCdmlrZzBkRllXakFqMndtRnBFZTAxekVIK3h1?=
 =?utf-8?B?OTVOTjE0K3pGa09BOWRuVWtsSXBtQ3BTQllzL2phQi80ZllqTDlKYm9PV3Fp?=
 =?utf-8?B?aFBnTlJwS25KQm55RjVJZFRsbno1ZUMvNkFlNzFtcGkxclZSTm9MTzVpN2tM?=
 =?utf-8?B?ajBJUUdFQnArM1lTSnpUQThLMmluY3ZaYVdid0EzRE9JcjJiczdyQ2h0TFhX?=
 =?utf-8?B?VHFud3phZTYyUVRDL1VFZTA2Mkd2aHg4Y2F4bmZWaW93R0FZUU43UT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e4ae87-08c7-49e9-cca6-08dea903d01d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 11:04:57.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hG/yqsVV/2bYUVEjJ43x/0yNylNTLeZ4Ig4DT0V9zTD88DI4/eWj4336mxjf+vN2hlPLJY94IxxNyUWaMBrEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9080
X-purgate-ID: tlsNG-720697/1777806300-89CC1161-3C275D95/0/0
X-purgate-type: clean
X-purgate-size: 4556
X-Rspamd-Queue-Id: 286FA4B532A
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Luca,

On 4/10/26 13:59, Luca Fancellu wrote:
> Hi Milan,
> 
> 
>>
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index 7ab6061e34..53ae46349a 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -2,12 +2,42 @@
>>
>> #include <xen/errno.h>
>> #include <xen/init.h>
>> +#include <xen/irq.h>
>> #include <xen/types.h>
>>
>> #include <asm/viommu.h>
>>
>> +/* List of all host IOMMUs */
>> +LIST_HEAD(host_iommu_list);
>> +
>> const struct viommu_desc __read_mostly *cur_viommu;
>>
>> +/* Common function for adding to host_iommu_list */
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node)
>> +{
>> +    struct host_iommu *iommu_data;
>> +
>> +    iommu_data = xzalloc(struct host_iommu);
>> +    if ( !iommu_data )
>> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
>> +
>> +    iommu_data->addr = addr;
>> +    iommu_data->size = size;
>> +    iommu_data->dt_node = node;
>> +    iommu_data->irq = platform_get_irq(node, 0);
>> +    if ( iommu_data->irq < 0 )
>> +    {
>> +        gdprintk(XENLOG_ERR,
>> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");
> 
> We need to free iommu_data here
> 

Yes, will fix this.

>> +        return;
>> +    }
>> +
>> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
>> +
>> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
>> +}
>> +
>> int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>> {
>>      if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> new file mode 100644
>> index 0000000000..6b4009e5ef
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -0,0 +1,124 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <asm/mmio.h>
>> +#include <asm/viommu.h>
>> +
>> +/* Struct to hold the vIOMMU ops and vIOMMU type */
>> +extern const struct viommu_desc __read_mostly *cur_viommu;
>> +
>> +struct virt_smmu {
>> +    struct      domain *d;
>> +    struct      list_head viommu_list;
>> +};
>> +
>> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>> +                              register_t r, void *priv)
>> +{
>> +    return IO_HANDLED;
>> +}
>> +
>> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                             register_t *r, void *priv)
>> +{
>> +    return IO_HANDLED;
> 
> If this has to be treated for now as RAZ, being a dummy implementation,
> I would add *r = 0;
> 

As suggested in later comments, I will insert BUG_ON("unimplemented") 
for functions which are not complete at this point.

>> +}
>> +
>> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>> +    .read  = vsmmuv3_mmio_read,
>> +    .write = vsmmuv3_mmio_write,
>> +};
>> +
>> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>> +{
>> +    struct virt_smmu *smmu;
>> +
>> +    smmu = xzalloc(struct virt_smmu);
>> +    if ( !smmu )
>> +        return -ENOMEM;
>> +
>> +    smmu->d = d;
>> +
>> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>> +
>> +    /* Register the vIOMMU to be able to clean it up later. */
>> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
>> +
>> +    return 0;
>> +}
>> +
>> +int domain_vsmmuv3_init(struct domain *d)
>> +{
>> +    int ret;
>> +    INIT_LIST_HEAD(&d->arch.viommu_list);
>> +
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        struct host_iommu *hw_iommu;
>> +
>> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
>> +        {
>> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
>> +            if ( ret )
>> +                return ret;
>> +        }
>> +    }
>> +    else
>> +    {
>> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
>> +        if ( ret )
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int vsmmuv3_relinquish_resources(struct domain *d)
>> +{
>> +    struct virt_smmu *pos, *temp;
>> +
>> +    /* Cope with unitialized vIOMMU */
> 
> Typo s/unitialized/uninitialized/
> 
> 
> Cheers,
> Luca
> 
> 

BR,
Milan


