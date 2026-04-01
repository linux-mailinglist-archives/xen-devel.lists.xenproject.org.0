Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDLEDkXHzGn5WgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:20:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B21375B99
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 09:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269807.1558700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7psE-0003Oz-TE; Wed, 01 Apr 2026 07:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269807.1558700; Wed, 01 Apr 2026 07:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7psE-0003MI-QC; Wed, 01 Apr 2026 07:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1269807;
 Wed, 01 Apr 2026 07:20:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w7psD-0003MC-8Q
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:20:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7psC-00ArYF-KP
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 09:20:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ccc72f-e002-0a2a0a5209dd-0a2a4501987a-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:20:20 +0200
Received: from [40.107.209.39]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ccc732-6fc9-0a2a45010019-286bd127dfba-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:20:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7134.namprd03.prod.outlook.com (2603:10b6:510:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 07:20:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 07:20:15 +0000
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
 b=Iq229BkR8fIaGeBdz0G4OIj/ItFu5p2hWg7DS6ATW++p6CTVEpkxI0XM/hqs4s7KuIVvoTFcaFo44isbuI0Cop+PBDEUq0MQa44k+W8J8kPnwrQ+TwDqHxZafxvvjLnTnChAqDOXwpCSx16KnzxISrFbEb2ZB/ZrdTRUExbFXyIXlweSA3DnsJIpqNLdEJjOJmgKwoo8v+YUfWf3FliJIpTe5Jx9V8rt18TkhCmduaKlUBc49Oa2F0nxCk7q0kiiY45hivER0DsS+OQ3WGeVECbX7mY70jlC4W0ycRZ8u/IDKP9Ua4IITXVyh39yt8WCuVn/Y0bS5ckujKeXvLJuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TvI/S6RtBZqmLJ0w11DVE6SnvpoilniE8POxdbT4gY=;
 b=TLnifcEFEkg6+DHFemNMlcvq7yLym0vZFKHI5RpyqzPNsK/aNzcTC3dXfUMFZoMFjcL4kjMI/yvrMi61QHDxkT5HFfZT5pxjtWB49flcP+PbqYKszwYS9xuKydIuheKsdfC4Tj7rW8TpseYWyG2s67MMqLQ6JWJiZ5DIv3ijuJ/lJ8jOiK9gCDeSGtBtfFdgJ1r1aqezMAR4Ha4Gy9UsCfgkgAPQJYrCYequjA0w/eFbfQwuphZ/f9YcDcpcSfhURJyeCuzkxMOHZT71fN38nKHjMsKcta2GqnCtlXh7OdqIs724MmpF+tlCUWQnPcBKxnP7iE1UzfbHsoyWx+31pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TvI/S6RtBZqmLJ0w11DVE6SnvpoilniE8POxdbT4gY=;
 b=uqijB5NQ/GgIO6wxLytixbciT30hnYnE1OhK/a3VFQtOCHOqeAnEjhL5tKO/clyHb6WPkOYJVGE8kaS0mCYM3dVxr9WjTexNtlFEFsicrXfXxWC21Xb0gzw9hWbyZDPrlFv0Ut+6pWB83NgZTb/6BmK1Z+7tIOzE58de1mlRGH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <913f75e3-0039-4a7e-9884-7564c329557f@citrix.com>
Date: Wed, 1 Apr 2026 09:20:11 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: f936505c-45a4-4348-8c7f-08de8fbf1eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pK87DdFqyDhK9cQ58VHzx6dzwJGja5CI5Txy/qq76rC2NQ5Fl51rjD8502QduSD/LtOSWj8SgUDQrTMg52IudItA5oigEN51+9arcB5oqkh11gx8O9n2IBwjrw9XfPCC8zFdsIDmSI/rQgPaoQSsb2TvKz4Q6sKD7izwRBjk7p1RiMQWwOoUDXyf7nMVXYpS8gdROzDQSo2gfkY+CbOUPHtNk0fvCJF2LuJgESzICUeAWXhGrQrXnINZTj2Vod34z0UjfgSgBDL/9Knmm0383hr4HvYX+atEN1qULtdzPh6jwcB4eAYJ1AIo+F63H5VHiJYVhCI9wk1KlEUJyvjlcFxoIXUI/aZcg18PBDHGy7DACyDUcfdy/laRbJHEmzrnz8mZATgLSuJ5I9oWEKGJYLAN/2B1BDb56dZtJaqq+3rYL9IgH094paC1fT7qNSDnCNUiAeOjlNr/UMUDUB0rGH9zrnGVerdKEAANbOhbK3g8o5GnldTRA754ie/Kmf3jldXIefOzY9Vq50DCRhiu9PwH/1Ux65MlhjflJXRsfd6B4p1uo+ceFRAe4MMNd3dD77dYQtiJgqJGy1uqqIQjptTw2KrAjmuTN0qhHtSFrEFhsZ5VwTDeNUqOxSTsYmpL2vv4YgP8NJhZhGzTh8CcCPcawTiL1aHyLWogEAwOT04DbFLcMMkiXxFMFVjrLkiHjfZ6UVs/A4SJcsQ8wFS0iek/+jx54QAEkRfKznhS3UE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dytheGRkd3hXaEsxdWFNVk9ZakRqNXVid2JuVlVhMm1ONFlSLzg4T1cxVnRE?=
 =?utf-8?B?ZkdKdTd2bitPTjJxVEt6SE9xY3d3dDhMWUF4TG9ERTZidURNZTRFaUhCWVls?=
 =?utf-8?B?cG9yMHdySWErV1ZhRCtlWldWZVUwRXpieTY2MFNxK25ESUcybDR1MldVVmZv?=
 =?utf-8?B?Z1dJODdtTUpsSFMyN2lxUDJLTDRpL1JQS0s1cGZ3TU0xRVJYcTVLcEVEZ3RF?=
 =?utf-8?B?b0pYMG9TdUhXN1I5amdTTlQ1aGVVQldraERndm5nSzZSSXc4Q3l6ZFJ0M2Z5?=
 =?utf-8?B?RHpCSS8xWDdCVlEyMTQydHo3dFpDUFNaVzNFQ01uYkVtRHp4VEVLaUU5ZUxP?=
 =?utf-8?B?TW9oU3crQkNUUE9ndDJwZ24xcUdzVjRvUFRwTURDbm83akdlMGw3UXQxZG5H?=
 =?utf-8?B?d0dTZ3VocHFEQjNHcW1pUGpWS25JRk5JRlI4ZXI0T0E0bUN4aVlFcDh6VG9Y?=
 =?utf-8?B?NTUxcDhrenM2QS9xTjFkODJCaDZHK1owaGo2eWZxcHJyd2hZUjZ0ZzVEd2Iy?=
 =?utf-8?B?dlVLdHk4RG1zSTZyOCtNOEhtYUNzV2dPT0NWN0JFNWpSRXFaWldXVjdRcDhn?=
 =?utf-8?B?SStzNWZyOGZwNEFLQ0lKOHNhdXB1Mm0yVWlrdVczYnVabXBjVHhCeHpsMlhy?=
 =?utf-8?B?ZnJ4SmdEZndZR21YSlpGRDVZU3g5Rm1vbjFKc09henZnQStCaDMzSjJxYU1p?=
 =?utf-8?B?R0NWVVpEYTR5TDJvSHdHV0tmZjlUSS9jejRXM20rZmFldjBqZDZXSVh5YUdL?=
 =?utf-8?B?UFVPU1UzS040QjFvNkw1dm84TklCeDVMYlBmNVZxZS9BQU9uWFpHbEtPazNx?=
 =?utf-8?B?eUlmaTZDWEwxSSs1bi9qTHRuOWxyYUxZQ215a21jUXZTb3ZKeDljREdBWi9k?=
 =?utf-8?B?bERJVXB3c1RvMVlDOGs0dUdxcmJMeUIyNDVKQk9mOHV3Q2UwMGxvNC9TS0Ro?=
 =?utf-8?B?bVFTQWRPOEw2VXBqNHBwUlRQQzllTGhvS1p3MXJ5SVdJeVRDNW5SL05CL0g5?=
 =?utf-8?B?dFM0UEJ6Szg3OHpMRVJLVkIrcXpVUzQrSGMvOGR0cW9qMGsyK055VldMNmQw?=
 =?utf-8?B?d2xxcDJ2MjlPZ1NEN2sycXBianZheTAwZG12VXBqVnZJa0RrdXFURVVKUFZs?=
 =?utf-8?B?K2tFdEY0Rk1sanh1S1JuMWppbk9KNEdpY2psazlwQUQwMEZnWDBjdHNpaUsr?=
 =?utf-8?B?UFI2UStmUWhqbGF3TXRvaGxSOXFobnJjNmhCUkhUNTlha2s2OUUzSmdzdkZq?=
 =?utf-8?B?M1pORHpYYk9nUWJpNHpzYlYzczc1UVoxWjFQRlg2Y1FmVWlmSGlYUVdjNHJw?=
 =?utf-8?B?VFpMdUwvQS9UKzY1Y2tycTkvV1htSmxCYU1XaFNvejdhcC9Ra2E5S0tCMG1H?=
 =?utf-8?B?VEM3ZllQOVA1UTdMT244cm1YM3QzQUpPM1IwTEdlanVQR0NSRm5Kb2VUeDB5?=
 =?utf-8?B?VzNNSGJtWE16VEpCSmtuQjlGNmxEQmw4WFpTRDVUdHR1eWxDcDdsWUhRcEJD?=
 =?utf-8?B?eDVPR2ptQ1RmNGhmZWUzYlRaMkJsQ0xKd01mVHJERHMvNFZvUjV4dXFZRGRC?=
 =?utf-8?B?US9ZZGRqS1R1SGhGYmtsRHR3ZDV6UEVzUGFUN1lFbXltZnk4SlJqOFdyRXZu?=
 =?utf-8?B?STBxS3l4bjB3cnp4dTM0K3NTYTQzMDVvRWRYUHllRnlOZGVDdmx6OVhYMTNC?=
 =?utf-8?B?U1IxTkVHWDhLVWJ0K28xSFprTFlqYThLdUxrcjVpVHdralJqZy84QUVEYkNW?=
 =?utf-8?B?TUZ0WXRWZVc5aTZ1dmZoMVNJc0c1VVB4VXE3UldRSWRxWlNZQ1RSUjZiM3pT?=
 =?utf-8?B?WHE4WlZTbTh5VDcwUmZGMFhtWmRIZUpYY3huZkl3eUtkdm1QK3pZbC9LVFFJ?=
 =?utf-8?B?N1FKWGhjaFRZYm8vN0ltLzM3dmxaczc5V1lGaXVDbDZEMTFrSVB5SURkK0Q1?=
 =?utf-8?B?VUtXaE5ka3lkWjhqRkN0WGE1c3E0Yk5vOGQ5NFpyMGFocENOb0kyZVRad051?=
 =?utf-8?B?UC9MYjg3R1l4eGphRkNUaytoY2orV2U0ZWdxcDBsVUQ1MlBQcjJuWk5CMVFm?=
 =?utf-8?B?M3UxN2ZjeGRFYXI1QTFDNlJYOUtQbGlvc3NuaHFMQkVBSFN4Vm81UDJpNjRn?=
 =?utf-8?B?ckFUVTVwMWJEcHgvcVpLNGlXeTVWR1AxYk9UV1F0Tjg2dDUxTGhNNE5VeHh6?=
 =?utf-8?B?T0dnOWFadCszbEp0MkdCQVdrOWdFT3NvZ3UrTzVmODBzVEFIVEZpemhLS3dN?=
 =?utf-8?B?ekZSak1KRG5wV3pkS0FneVBkSE1rM0ZQUFdrY1BTQTJTUGFoMG0zeExXVGla?=
 =?utf-8?B?QTZ4NXhOa2VtViswL0pVS09DS2pRdElQdUptR2VpY2c5T2VDR0IvQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f936505c-45a4-4348-8c7f-08de8fbf1eb2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:20:15.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzqrul5kkMgWVL1gUDwdUIiEGAvZyLOebla7j72nLuMf1GOugIlIifE/LDg+RaRx+IlazAn61CUubqybe+DPN8SETFGuO9zkfWK1On9leH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7134
X-purgate-ID: tlsNG-d62444/1775028020-17AFD185-A41EB87E/0/0
X-purgate-type: clean
X-purgate-size: 2115
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A2B21375B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 9:14 am, Jan Beulich wrote:
> On 27.03.2026 11:19, Marek Marczykowski-Górecki wrote:
>> I noticed that on some systems, there are a lot of IOMMU faults after
>> S3. I can see it also on a laptop with MTL, but it affects also the ADL
>> gitlab runner:
>>
>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>
>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
>>
>> The issue is present only on staging, not staging-4.21.
>>
>> Bisect says:
>>
>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
>> Author: Jan Beulich <jbeulich@suse.com>
>> Date:   Thu Jan 22 14:13:35 2026 +0100
>>
>>     x86/HPET: drop .set_affinity hook
> Looking into this, I find several things I can't quite understand (yet).
> First there is
>
> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
>
> which looks to only affect clocksource selection, but not use as
> broadcast source for CPU-idle management. (This may be an independent
> issue.)
>
> Then there is
>
> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
>
> which should only occur on ARAT-incapable systems. That should only be
> older hardware.

I'm not sure that's a reasonable assertion to draw.  The number of HPET
channels is down to the HPET alone, not anything to do with the CPU
capabilities.

>  (On my much older Skylake I don't see this line, for
> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
> is purely featureset based, and hence doesn't expose info about that
> leaf.

xen-cpuid -p

That will get you leaf 6, but there's no human-readable decode of it.

~Andrew

