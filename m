Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LsLAGUBtGnCfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:21:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60079282DE4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253638.1549778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11WR-0004fh-NK; Fri, 13 Mar 2026 12:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253638.1549778; Fri, 13 Mar 2026 12:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11WR-0004dn-KN; Fri, 13 Mar 2026 12:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1253638;
 Fri, 13 Mar 2026 12:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N2jY=BN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w11WQ-0004dZ-6E
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 12:21:42 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5675ef-1ed7-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 13:21:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 12:21:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 12:21:33 +0000
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
X-Inumbo-ID: 2f5675ef-1ed7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THaHTbPQnVM8ZAiTSEUwbBrhi93tnM0lZX+pkyD6keDehngevAEMjjZDyL3Y0zm+BFmy7wZIQEnJqOaocBOTRpIwo5f7Vg2ViX57dZzO/u+keXF0AGrViKdWdn2UEFeaphMdQDgWpgFZkAmQYKvQlREu9qnxs8UblsuQYutoSvWcUAZz+auhaX/R0raGeRFdZpn0Ql6CkOpIxsdqGnjuwC2QwpRmawtCg6dhG0VL5fvS3cNH24bLhCKjxdccQYHLNM1caB1e51lFFd4hoi+RX6hc+Axo2Wjr7xys/FcJA7jbvHYLzM7LQitVgT0MqW6P9jFEDxaom2JGVvr17owZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fplFEIvjjDKQQLDpehSWu+MTWPuXT2/3nbAlnqn4e2I=;
 b=PJnK/AXXPaH4h1V1df8sIVV+veknbAps3tQ2wbUdQtj4HAeUkjlYkkERVVhP2J2ly1kdV9KxhpZHCPOpaaPVHqJyWaD3pklCnCyqEeEq3JLpmSY4c77PCnHoTJ+tG1Qv/HD5F60eAHjBEDusp9wta86JaIFO/HpaHORyDlgW1ZQHFAdqByZkRy7AZdzlidHnE5jThB0taI9e78qOnthyEewNZD0HNYhUDDaLs57agNreR/VtNdbmO0UOK6geJKq50PO43tgaSTJuDuOYVsy7D90TjFAaMuqhQ9mOji6TH6l3RhYHfQcn5CBeNn+QxzeJltBZucdho2b04c9jo/8vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fplFEIvjjDKQQLDpehSWu+MTWPuXT2/3nbAlnqn4e2I=;
 b=VAjh7pab2SVZZQJHuGY1fRNCIgvu9pYSNfu6Vr/m362gxv/BGkMbDaoQtS/8Drw0b5laAoISjmYc79XcEyUM14APQpOMwpE+W05tIZDyE3LjOZ0oi2nkF5a33JWNOTs2HtvpiS4L6vGC8y1mJmP17U6aohDwxz//MkkMRx6SpNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f1b8985c-cb61-47a1-9ecf-28c7cbb9cf63@citrix.com>
Date: Fri, 13 Mar 2026 12:21:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 0/2] Address violations of MISRA C Rule 20.7
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5530:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b01b4b-cb48-4251-6a56-08de80fb1092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lTdjj46xZLl8LgIMYM2dwqJLSazNihH6aYlO11vggu6HrX7qQ30E2mvJnrw+C+a3blzYcU5BHnsXEIF1vAh0LwkthOL03XimnvDnk3PkiXK2aYrBhgaaYAmoTtSwNF5KjuKly6g8YCl3VHEKocLq9u828/OXGIY/XLTpqvUwyPjXigdzb07LLmW+kLQkceogXnGu55GPdhut/ZWkT/dD9SIkhtCLflYxJ8CfFVo4UvWtuRSKqppKOKA4UvklLmaCQy94Y4eBHwGBjwy6pBKxUVEug02mRvie0cW7+cc36Pyk+xGKN2X3lnxYM39t94crRQ8cV00gf3nDyWhuPSYfVOoktLFUHMePfuC4V2fUWZhC8jPOzseAvvgOOlV4wtGAssNRkpYjwrikCuPyepkbQOqC9HDrKG4k5MUl729qDX1u8s3iwKio6f9Jt2Ubx/+tpGr5O3swh/QvUFxIXXDgRl5QzVLcP+Oloik/cmNj0pvuuIZy2vCKaZMmSvaqIOxsFfncraRrNogGCE/G7w+rn14xts4oMrr/0oetBQMBjbAnpU1h0xXVkZSIEYq0tlBpdiWUs4KEQCRwMcFi3oeYU50jp2AeJDgD8V2oy7qKLagoXRa3haPB9XlsQtA2zRIlmeaMCt5L+/+SOvjYT6XzP5o2YpfWQm/CQZb3L7S6DfTeOWkfGjuKR9OQLgVeIDIXijvN1u7BzgcHFzglWIRE6l5vzU5fWbhEbe8LuL6snuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzMrZ0dUbTc1TzRqc2UwYy85UUVpRWx3MVMzQVUvQnQ1bGV3MjNYSWMrRzI5?=
 =?utf-8?B?VGZoV1VvK0hZNUhRM0NzRjQvTXZ4K1graHlVKzNzVnhyb2ZZTE9MNzh3cjRY?=
 =?utf-8?B?MS84c0xFelJTaHJ6Z2JFdDJob1ZNZFBKY3cxNm5pNGNSTFkrMklGYjBDcXYz?=
 =?utf-8?B?aTVtY0FBVSt0bURXcVpOdFZtTU11aHNEMGszbEpVWmxWb09vdW5lRXZkZnQw?=
 =?utf-8?B?MktZanVsYzQyd1FnMWpPU3JIZkl1TGJ6T2RpdkVCUXdHUE1Nb2pvSDJRcTBF?=
 =?utf-8?B?U0NxUVF5SStmMmVheXMvSE5WM09CSHJDdG8wdlZGclB5RXVsZTJndG5DKzlu?=
 =?utf-8?B?aVdHSi9laEJyaUJkSnFpYTF6bEhMZUFHMVRJL2J1UGFmMVRzZnZPR3hTV3Zn?=
 =?utf-8?B?OW9zTFRqVDBsc3o1ZW90YktCMnRuejZoYnNmSTI3cU94ei9EWEg1Zys3RGYw?=
 =?utf-8?B?ejIyNzVUNVY4aWV1eWw5cGNJVWxqTWsvYy9GSU5paTFBNG9vaHM4L3BOT1pC?=
 =?utf-8?B?ck4rUnJLWlkzZTBENjJmcUgzMVVNUmV0SnJMUkRvV1ltd2dlVzRVUEsvTWtH?=
 =?utf-8?B?Vkc1dFM0WHV4bnN4ZUYzVkJ5VjgvRmlRRHZIdVJTS2QxK082ZEswb3d6SVhC?=
 =?utf-8?B?WW9zNVNJSjczWXp6NUhBTThibENoZEN6K0VWWEF6cU81K0RHOElCMC92Y3pN?=
 =?utf-8?B?VGQ3a0hjbVF0eHNGZ3VVSEVrckczZE0wSDhxOVBaT3NMem44RGhVSjkxRTlN?=
 =?utf-8?B?OVdVeXEyeW9CWTBxOTh5OHh3UVBocG5yUHJJbXJYN0lIRk05M3o2Y0h6RjVB?=
 =?utf-8?B?Y2NrM0RzdFdZek9od3ZTcUpqQnZFOG85SXhMUkY1OTFKRU9OdjJDYXNBa1Vr?=
 =?utf-8?B?eEFxVjhUaXRyUUdkMmlGa2hCZTdHQmhPSUlhSlZ2SzZ6a004QkQrZUxjQllN?=
 =?utf-8?B?Y0xMU21wTS9uVDZaRmNidlpWSGZSelNMWGJsN2FldEdIdll5WDZuWXlWMTl2?=
 =?utf-8?B?QnlwbkorLzRvd1U1TSt6VHZuaW11MVJHZk1TZWVub2JEZ3VyWmtUMXNyT3hH?=
 =?utf-8?B?VjgxR1pkU2grZzhWeXZhSlJuRGxsYm5GYmQ2Y013RnkweTZPYXRoVzVqeFZs?=
 =?utf-8?B?WGNwQUtocmliaXZFVDgvbWxTeXd2ODJOd2VuY2E4dVZ5VldyRTBQNzZUNHVr?=
 =?utf-8?B?MEJrSlcyUUNtUEtPV0Z3OTFEalNhcFlxMHdVaUpQckhCSXY5UXJvYVNOYlZw?=
 =?utf-8?B?RkZEbHNlRE1LOE92ODZUWVlWMklWZ04vWVhCMThPT2JLSE9CUW9mb3hrbEt2?=
 =?utf-8?B?ek0vUUR0NUZhb2tSY05ZdldCOXZpcW9hWDU4d1N0T0UweDlrcVdsNUJNL0RM?=
 =?utf-8?B?WWlHMksrS0ZtRENwTGwxVW5RU1FuTUNFdUZuYVVtVXdsaGtqSitkcGdjZ0lm?=
 =?utf-8?B?dXZwSncrZXI4ZCtTTE9za1pDNGlhWlJmM21KcmRENEh2VFo2RGIwS1ZUa3hp?=
 =?utf-8?B?VHV0WkdKUmJYbFAvYjMxYmoralhUelB4MzNWVmQ3Nk5yaUgrTTRDcTB1QXJZ?=
 =?utf-8?B?aGJrUnlEY0ZYbytOdjRoSHZTbEVGbXBYeFlVQVovNW10OVVVQ0pvZ1ZCblll?=
 =?utf-8?B?QTlKL3NoWTYyUWxCeWxBVXJuZVdRRXFkYUNVNU9nd2U3NlVGVFRsb0RyYXpw?=
 =?utf-8?B?UnN1RHM1b3RRaHJyUVhZWVhHb3NLZzI4WVRtT1M5KzhYbzhjQ2NKTVVESXVz?=
 =?utf-8?B?Z1I0djE1SE5EZ2o2Y1pKN24xN3UzOTdTYmFzaDdoWlZLLytnVDlnUVVmdmtj?=
 =?utf-8?B?UGw0Y3BjR3VJYnIzNHduc05ic1VFNmQ3cllZZnF0bVBGTnFYcndyZ01PanZJ?=
 =?utf-8?B?cU9vNHZtdVNrb3FXRy9CZHVZNWQyUFJuNTVJREFjVVNzZXRycHlsWEhPWW1C?=
 =?utf-8?B?N3FnM2tESTM0ZnJWTzdTNHNWUWtLb2pSYTlrZDgrb1BRODJrNEN0L0h4RDlR?=
 =?utf-8?B?Z09YeHdhN1VuSWpVMWVZTEhOZFdyUVlBKy9sNU83QjZSajgzZWxaVDBXWVND?=
 =?utf-8?B?RG1ENmVXUWNIdzgweG9vb0pRSWRtaGhBc2dCZFpDUE05TDRnbGxRV1p2Y3ln?=
 =?utf-8?B?YmtxSm1BV3lLeXQ1R09nWEdFbk5uazh6VCtRSEdqeVZ2RWhRM1JmU2RKL1ZV?=
 =?utf-8?B?TmJuNDZRMnZ3QnIyb2o4WnFhQVNZbVFzZlVlLzZMaFdNYktVQTdLSG93TXpi?=
 =?utf-8?B?d1B6anlUU2Q3aEQya3Mzam9aVHpjOEgxcFdaNW4vbXZ2MnhGUDVEV2h4UnUr?=
 =?utf-8?B?OWdFZ2lxdUJYZGR1T1NoKzZRbWZISnNVZ1dsUDl3REg2ckwwbTdKL1MzQ2pz?=
 =?utf-8?Q?OdbalNir92eIohnc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b01b4b-cb48-4251-6a56-08de80fb1092
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:21:33.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXneJKbEZ0SIaVyhKJz24teI155B6InI+AkfEmKryTWOreb9AADg6GJmzHAjozJQXfBfpkq7HD0AMD3etrWYD2Ki5QyGBS2zTwv7dplztc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 60079282DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 11:44 am, Dmytro Prokopchuk1 wrote:
> This series fixes some MISRA C Rule 20.7.
>
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2383264392
>
> Dmytro Prokopchuk (2):
>   arm/pci: address violations of MISRA C Rule 20.7
>   livepatch: address violations of MISRA C Rule 20.7

I already have patches pending for these and more.

~Andrew

