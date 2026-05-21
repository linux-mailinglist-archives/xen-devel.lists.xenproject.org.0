Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFiJBJLaDmrmCgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:12:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215A5A3095
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314989.1584891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0Nx-0007i9-8o; Thu, 21 May 2026 10:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314989.1584891; Thu, 21 May 2026 10:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0Nx-0007gi-5t; Thu, 21 May 2026 10:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1314989;
 Thu, 21 May 2026 10:12:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wQ0Nv-0007fo-PL
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 10:12:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ0Nv-0074Mx-54
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:12:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0eda76-e002-0a2a0a5209dd-0a2a45048692-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:12:11 +0200
Received: from [40.93.195.69]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0eda79-1dec-0a2a45040019-285dc3450e15-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:12:10 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB5089.namprd03.prod.outlook.com (2603:10b6:408:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:12:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:12:07 +0000
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
 b=MKTRDEIRK6Cekh7RMhU6hB0FRePzyCV36FwlNMyWy1gZBJOo6MLdRf+SFrnMMt3fQ4VXYsmpD40IDiXQSMmLULE5LWV0c963m6Dh4dDBxvVsf4LVMxucpBoyKzT2xQVhldEqptqHTqGTyWxLASlTsoa1f70QZjEEL2iJzOr0ovKkVRlbDBBzTVg1YZRTaZWW75wp2xrTqFbQMzsfWICYGp/ewVanVo6xc1KRPUQLTgjEUYlyYbTw+udKp9CeilONxFHJjpI3gMGHUDk6EgHJzbJi04yGpPOMFBpEk86D2Gq18n0rAjryleIPBmoSH7xDs/8xc+xb1atkMXfPNamqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyo8tMZPDiMI4BhMgaPK7WwQBjL+2b/LtntTFfBi/kg=;
 b=TM5CAF9Y85c6LrXsWkWIDVDsHIg8UMayv7rH5l5CUCOLJaxaVogRoGxrUIOBrL+hD79ZRzhzcjNvCINZbShNIyMWAOYAnY/1/RdSbLQCoRQyBwnQJyFAFvw1IgzPrQkIR3dpE0Wio9336pDDAs3QV2L8mYkZlrZnGy8GheOj5QHJ62+ofPqIN1zmThWrUVMbYT0//QriIBW8U1YST3LR8i2G9i2GY3tnjbrGyGXfJC9zI1NniMYeayITx7q8Tpq7r2K1iPCR4xonjeItL7DnwRDVuJQXDxVsKwMnaiBz9lkhliG1Zqbd9aK5KSy+TrxJeUiuHFLZU+AX8axIP4WWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyo8tMZPDiMI4BhMgaPK7WwQBjL+2b/LtntTFfBi/kg=;
 b=rcN0djlqaCFMVmmELUxoWz5oJGAt2NdIwXpugIWlLLGI5dvAs9CwYkCCMRHCJEMxmYAdXNtYnkA30KKcYH2jL8p3Q7e/CWsgN5WuuD/bshF/iK+mSndTmv7iD/ScqEldoUyPGGSavuqRcVLOzenGMEDJP2VLzyXm73j1BlOnFvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a6dd703-cb9f-4a13-b0da-ff1a9d841bc5@citrix.com>
Date: Thu, 21 May 2026 11:12:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
 <a5b2561f-0225-4f18-bc74-7f66227bc807@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a5b2561f-0225-4f18-bc74-7f66227bc807@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0587.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b141d71-1075-45ca-a1d2-08deb72169f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|6133799003|3023799007|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KtJ3MzaOEfpr4FBBv5b7G88IDAMI6URkBtWzp2+KD5uMg/7XcNdumBPL6Wk0M/5U5B1cbK5Bvaravs0S4WxwqAc3JCRR25lcsieR0jsEDMPZ3aaNNimFo0aR4cKFHRWOX/Uw3Fsmd8nUZV18vFTWt1O69XX0C6psHzD9IG1F2OoXCHvTtR711Whyvd3BxTVIpuYFHlal3kS2GM+K+SInrpeLuo1Nv3mYVMLqAgiQJJjA0grq89rOU0/k8oK8G8ho9M8wz5/eKGNj3ktOeds22ZUf6Q9CN81wIqVrO5/F7/TY3qOdVFhasgncQSEKZoopsPgQMxqbC1zLpBz3H6Bya3vc3f6kDKXy0LDib74zobex6wAb7gX1biiNY1lz7cvwZf0VN2AvW9A5UqYXjqx6v1rIzXRd403seE9OMQoVE5Utv/bEHLLLdlCJ2MtLiCmyvhX5gslGpKg4VUf5Y3reoF+BbZC7W7kxuaukrhhPF8NmvOSAlbD20YvcqvUVa0wVO5Qj+C3+HBF2W5mD90y+PCwCyAwF6sBvzFoZLABZDflZZjrv3zqTcCGWXAf6UEfJx0SCDLfREIXigtmGU9E2j1M78Sy/cuGUo2ZiE5e0R/m25pGpMdZsZfoGprIyvQ2ei4PAn3N4b504SJ6rQhqsiKJ0BBJBVJ5ZXOuPQBizkZIE7pDwdS0uTJhLG/2jFyof
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(6133799003)(3023799007)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXZKSW5GdVIvNTh5UWtTOVNTem1qRi9tVHI2YU9uU25OdTFBd3BQa2VNcW5F?=
 =?utf-8?B?VWhacTZrRG5hTHlBZXM5MFZObjE1bElZL2ZDU0N3OG05N3JvUmlIOFJtN3VD?=
 =?utf-8?B?TUJaZEdCVkZaN1Q0VElCSHhyVGljbStrbVZrSlhFbE52K1lNRzNzZ0duODRY?=
 =?utf-8?B?ZTZxQ25XYmFOQ3JUUlIrZDFSRVFmZElka29kUzRDQWE5RHEvdzZoQStDV3hP?=
 =?utf-8?B?d1cwK0VDM21UQ3U2UmtpdldueUlodGJ3TG10TS91WURQQWpMWlI3bVBQdFZv?=
 =?utf-8?B?TEk5QkNSN0pUQ1c3eGJSM09objMvWTJOeXE0V0Jld05XODNCMkZud3M4cG44?=
 =?utf-8?B?RWtaZ2lYSHhwbVVHRUs3RGgrT3hQbjFzeHByNzNKdjNwbWVmNUtqc3JjN1Bx?=
 =?utf-8?B?ZmJqRStTM0JpK0I3NzNKeDdGdi81VUhTRnA5NnhkRFlKTCs2VFhiM2U4S21v?=
 =?utf-8?B?NVZqWUkrSmV5ZFpzTFY5eGtwZFF3TEhrajZncUVEY2I3UFordXArdzRYbnFD?=
 =?utf-8?B?YkpXelR4cjNrVTY0Z0N0WmVNR2lCQVRuMEduelZvUTBGQlVFbGNWUXcrVS9p?=
 =?utf-8?B?QzBERXJ4T1RiT1Q3alE4K2Q0cWJHaEY1WmttL09GbURyWWFjS0xtVnBnNTVY?=
 =?utf-8?B?MnpZWVY3RUNHMjhWRkJ3MFpOSDQ1SHQrd3ZUSDdSa2RBN0ZkT0gwRFVYam45?=
 =?utf-8?B?OFZEL2swV1hSZW9DZDJPWDZHK2tsZkxXSmJucFhUL0lKdit3OWxjRytHZU5Y?=
 =?utf-8?B?cHV0RGhsN0RYcnRLayswTFlXaGFtUm8zSjkwMUJ6aC9pWnlXNVd6QWtTblp4?=
 =?utf-8?B?UDZiN0g1TXBNRmtrMStPMjZHQzhPaUc0Z05ZSGFHdStHNjBBNVVlWmtoNXNn?=
 =?utf-8?B?ZHlmQWNyc1p0a3ZSL1dkb1AzR1k1cHFlS1p6UnM0WlRCZDFiOEZucDcrSm5q?=
 =?utf-8?B?Ty9kemNCb1JSamZwMnhLYzFBcFhjbzI1Rzg5RDhpMjJjY3gvZEdXWWNSLzIy?=
 =?utf-8?B?TUthVkVYTkdxdlV5NWhMVnE5UkJMTi9FM0VIc05qeHg5QXdlR1B5dXl5S2tQ?=
 =?utf-8?B?OHh1dVVCb3dFbmU2VW1XaU9KWGNkVDFxUXJpblRZWmFvbkR4ZWdoU3IvNm9J?=
 =?utf-8?B?OGo5MnRmb0lsTkVoVkh4OG5leVNPMVdpRnZGdUZlZ0dPQkExMnZxS3J4MGRU?=
 =?utf-8?B?V0w1WTZKdUN1TUkxbTY1SnYyTGRabzhodXhqMEI3RnpBNDkrNlliZE9HeVJ5?=
 =?utf-8?B?amV5ZmhnRWpCcGEwMlZqaWFCL0k0cWVYSGVOR1NGQTQvN0dpV2Y0MnIvS29Q?=
 =?utf-8?B?dFhwakV5T0ZWQlA0YnUxUldVRnFIcFhYMzFhYW5wWFE0TnprVmk3MlNPcUow?=
 =?utf-8?B?eUNEWXdzeHNCMUZzOWNReFVxWmpnN2JURmJCYy9PNGpQU29Pa0xhcC9oUzlo?=
 =?utf-8?B?aDM3U0JqNXFtQ2VFVnFsRnlnOEhITjJ1dkp1bnhvU2l3Q01sSkl0NVhWY0xK?=
 =?utf-8?B?VGMzd2xmSzNJa0Q4TGNMYXRGY0VGNkZoMk1oQlhFV0VKTlN2UU1yQ1d4dUNi?=
 =?utf-8?B?aTBqK3JJdklHbzJ0NkNEdVdLeTZnWGx3VmlGMkFERWxhd1h6NWlrcFFWTitO?=
 =?utf-8?B?VTZtZUJvMDNyeW9zZi9kcUdCWVFaeFZuOUxjRUJnbW5VSlVVcDMzdzduQThO?=
 =?utf-8?B?cWI4S0xLRU9hdm4vSEppeWs1SmViVWVsMGJuN1QrdzBwdWdrOFozbDk3UDlY?=
 =?utf-8?B?RGt2OHIvcDZ6QldVUWZQYTVTUU43T2hMZVgwTVBjSCtCSkg0TUs1Y2VCbFhK?=
 =?utf-8?B?ekJiWCsxR3JxOUhodTlDaGxKWWtTc2NTNlFhUGpWM0EvTW9lMDZvenNpdndB?=
 =?utf-8?B?UHNuc0VNemdTWjZteGJhRVpVTnd1QVBQYk5iSktqdnJ2c2o5dDVBVDJmb0xY?=
 =?utf-8?B?MDhVNHF2YlpMd29nRmFzdk1IblpmdnhMayswaGF6TkdESkhTVW9tMXMxcmlx?=
 =?utf-8?B?M2NYOWpxelZUQWdWUWt5bkE3TkRVa05KdWxNN0QyeVdnV2JJTmhINGlSeTd0?=
 =?utf-8?B?QzFlVDdkaW9UMnhnNW50NGNDZkVMV0JhUXJDdnVKUHMxZDVVcDF4TnFsVi81?=
 =?utf-8?B?NzNUVll3dFpySnhoUEVTQ3MwZk85RS9sVDB6bVdSeHp2RFQ2MDhRdUlIM0FJ?=
 =?utf-8?B?eXppaVd3TkpXZTRpSUUrTzZzSWRFWXFETU5TcUg1Q2NKNDJyYlJpTjI0bld5?=
 =?utf-8?B?UTJTbG9pUkZKdy9OSU9URHlNa1RBSWtoTjZUSjY1ZndxcW15eit1ekpJVUlQ?=
 =?utf-8?B?Y0czVm5qQ2VQa21yNFZneWRHUzkraUJ4RXk5ZDQ5SGJBWnVJVTVlNTNGYUpG?=
 =?utf-8?Q?tAwAV9gPPXs5oEMk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b141d71-1075-45ca-a1d2-08deb72169f4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:12:07.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ec2gjru6lsk8fsyYkBBsCGjFegyHgDdfSVcxvHxSokgNOMrXUTLpBHIgBIrAR9H+go8eoyPluxtWyC2qqNT4M7ftspF/eCw/+jl8QaeFff8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5089
X-purgate-ID: tlsNG-ebf023/1779358331-42B633FF-7F735B02/0/0
X-purgate-type: clean
X-purgate-size: 4531
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6215A5A3095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:49 AM, Jan Beulich wrote:
> On 18.05.2026 15:14, Ross Lagerwall wrote:
>> These aren't specific to SVM and will be used for emulator fast path so
>> move them to hvm.h.
> 
> Some are SVM-specific, e.g. ...
> 
>> --- a/xen/arch/x86/hvm/svm/svm.h
>> +++ b/xen/arch/x86/hvm/svm/svm.h
>> @@ -36,35 +36,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>>       asm volatile ( "invlpga" :: "a" (linear), "c" (asid) );
>>   }
>>   
>> -/*
>> - * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
>> - * opcode, shifted left to make room for the ModRM byte.
>> - *
>> - * The Grp7 instructions have their ModRM byte expressed in octal for easier
>> - * cross referencing with the opcode extension table.
>> - */
>> -#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
>> -
>> -#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
>> -#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>> -#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>> -#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
>> -#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
>> -#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
>> -#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
>> -#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
>> -#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
>> -#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
>> -#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
>> -#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
> 
> ... the 7 ones above.
> 
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -851,6 +851,35 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
>>           alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
>>   }
>>   
>> +/*
>> + * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
>> + * opcode, shifted left to make room for the ModRM byte.
> 
> With all of this moved, the comment wants adjusting, at the very least by
> putting "e.g." in front of the function name.
> 
>> + * The Grp7 instructions have their ModRM byte expressed in octal for easier
>> + * cross referencing with the opcode extension table.
>> + */
>> +#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
>> +
>> +#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
>> +#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>> +#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>> +#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
>> +#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
>> +#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
>> +#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
>> +#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
>> +#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
>> +#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
>> +#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
>> +#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
>> +#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
>> +#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>> +#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>> +#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
>> +#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
>> +#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
>> +#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
>> +
>>   #else  /* CONFIG_HVM */
> 
> I further wonder whether putting this in hvm.h is a good idea. Is there
> anything wrong with using a brand new header, e.g. instr-enc.h?

No objection to that. I do wonder though if using the instruction encoding like
this is the best way of passing through the instruction to the fast path in
hvm_emulate_one_ctxt() since I think in some cases the instruction encoding
may not match the actual instruction that triggered the VMEXIT.

Ross

