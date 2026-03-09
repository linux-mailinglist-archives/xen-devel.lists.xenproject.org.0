Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKv0Jzb7rmnZKgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 17:54:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781423D23D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 17:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249589.1547057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdrT-0003Hx-Rp; Mon, 09 Mar 2026 16:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249589.1547057; Mon, 09 Mar 2026 16:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdrT-0003Fc-OX; Mon, 09 Mar 2026 16:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1249589;
 Mon, 09 Mar 2026 16:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzdrR-0003FW-VX
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 16:53:42 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85c5d2df-1bd8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 17:53:40 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5123.namprd03.prod.outlook.com (2603:10b6:408:dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 16:53:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 16:53:35 +0000
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
X-Inumbo-ID: 85c5d2df-1bd8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PARbB9A8D3wjK8vqrWnQXsWp8l0xWpoiC/i/g7dyMed7/JTWaRYUdwwhrYiKM8HkCCul3kd7Vgx2A7B1PXmFkmChDshbSFTKyW5Tn262ruJcsx8Tq8V9sYDWWghBZRn2aDUCZpPzjAjimxpA9i+QGvxdFQy2rdafUHx4NqHo2nQA04LZpwTg2mzfOe0dn9opHw+zFD1GbgA1YThDD8EvB28Sfv6BxLjNAFkJjPtdIpNWIzjlaIDUuzAkyWy0/3K1uKtwds4+CiIIVEQx0Xe/xDtUUwwwDG+ezjHbDc6cfUeDCAmHdFIoPO6AqPU2MHc/TQmKimybDP3ACwWhtaas+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0Bh42TUjZTh+rzACCZYpg1BDDBu4U+CqxHDb9ejKv0=;
 b=Wzy00+5THPCxsawqjE1H1CqLZImIfLpxGa/ugXlNLPXHio3mtgImS67mkaDWPtJtJMCKTnb1YAmp2Qw9Hoy5zJ+1pFj1KsNg6uwBRZ6gpHqHKod0Bd5p3QVEj6IoY3bpeU4FWdTQzfYxlD8Ps3YwBT/uXxnyuHD2PHZSKPT80Pfjya0Clz5+jPeVvmLGY90lSugFEKL4wy2SqhAAnFbVO0Wnikkp/zKt16rzEY5vZ30BczLUFzDD6sSWW7+eR7E5xmjw2qjPn97XjqS2aUQesjz0ReY8X1Xw3K1NcOMVR5+vmAddTujnJLG3XX9XZHZIcK5682euaTJq3sijin0lAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Bh42TUjZTh+rzACCZYpg1BDDBu4U+CqxHDb9ejKv0=;
 b=CMvlyCVpHg1aM9ndNPib4in4LtvDqh7fNOJDTy1kengx9fPzuZvj9692Kj3/4uCtVzUgw/AA6nkM4yVOUG5JiasA/bhwP14gvW6IVLlu6ODxbobrl3hAax16EOl2Vs5FmPbZIKMRF/zeCcUNU4vE8OrLlJ6DuN6uN8vnc0Lhq0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Mar 2026 17:53:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
Message-ID: <aa77DGTIv_6S6H9K@macbook.local>
References: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd6619a-803b-4dc5-c71e-08de7dfc6775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	/ENrw6PcIIU3IEhQxWxFZF5IB25cuHwBGPWVSiKoIpcYPqeWxFDoGaTpaMjoSyj758cSFtyT4prdVYlWWVZDemvvadfoK+Pux9gj+9ZTAcosgRraMLO+ZU59YVFpWIXT/O4KJ9TKZM8gM1rBb3qEcr35zqY7LGEA6Cxf3lRn74upxKRoUsL2bqQJohwBn6vJPwucTHoqbpA1dOkPYvImMeFulawq3yWyLeqcAQi2vJDCMGfIIMvcoyAIeF287yukhYWAcV+Sd654mz/1ZMsk4pdLXrdV3JcU1yx/6AlfIEYTrldcNOebM9Fw9ts/rUCyepLUBP4OGZ3tWJN0EV+4B+ubtPMKxCw8SDJwu7XHYa3WamoQBI7C4FsJsVB+Hbzt0B+UQ1+d1kAQGsWU/9bs5TokIrnA4iWdWGrC338F/xugD1R5qOD1Fc0fRiVBIw92Jp4tpzKwEMUvd4TPoTI+Z0p7qxugKXY+5+rRg/VSyYWCW5oIRSNTC2rvw35mxzut/HInGDNfErNgqbCiikM7jeS3XmzAwXNYJe2LaMRDxXhVFiM3Goxz9ZCXRl3Zr65oTl3kxX4ZFPxNaVtTDGN6T17VcOsagIBM1oBmpd3T1zL++5EgWjBLJ0uC+LraNv2RUWlD+w+2pxjN+9lsEa9oafGhB4femm4B5i75+yEXM4CeoA2kweTTpXvQWa5tEK+j9FVoSd1sB+K3qEGjORZtcCGJaqP1jVkvaounKzMaL7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdMWjEwTWU2ZG00aFkzWUV1WWVGWUlTYzFQTDJETjlmdFJpbEJ3MFpTT3R6?=
 =?utf-8?B?djBoWSswYUpZVU1jRXZqOTR5K01KajZnRTMzSUV6UmpPVzdwS3FhNm9hejhr?=
 =?utf-8?B?MUZLUEFhZklOb2RpbEg4U1QxQTR1NDVOcW1iTU5lNXNYSklHSXliZUJGVGVm?=
 =?utf-8?B?cm8zS2tweTZZTExFdzcvNlBNM0QvV1huU053cElrTStvdjFhaVhrQWhEQmpP?=
 =?utf-8?B?TVNGbDdOM0dIYndraldZb1g0L1BFQUczVThmU0VjdmdOQlFpd09FZXZuSmhi?=
 =?utf-8?B?YkFTd21OaWN6VWtsMy9aT3FydW5YeUlHb1M0V0MrclhVUnlHTkt4b1dJa0VC?=
 =?utf-8?B?VUFKVlVOTkhOZVRhR2NhMmJQaW45M0ZDRUdjaU5uVEJWMk1IemY0UFEwVGJC?=
 =?utf-8?B?VXo4bjlrMXpFOUVyeEdqRHk0Nlgybzkxcno0bkRMM2NQcUxrR0N6b0Nxblc1?=
 =?utf-8?B?SDNWQVV0NFFQa1BjbnkvaWFHQnNOWlEyNHNzcEgyRWd4TjF6U3hXbDNCVG1R?=
 =?utf-8?B?NDlhV1E3Y0VGcFcwRXgwNGJYUloyQW5heXIxaTkrWnhlQmE0ZldWZTVzMEhn?=
 =?utf-8?B?S2FUalM2VmZPR1RoNU1zZVlMQU5GaFpocmt1aU40b1YyTStQSzA5L0pvaFhE?=
 =?utf-8?B?dVdocGVnU3ZPRzllV2gwM2E2QnpJLzBDYmFDUUZBK1c0NGx2V0Y5WlRSL3FS?=
 =?utf-8?B?Zm5GeUw5eUVhN3lQM2JmVUF3YmhvSm9jODNoaG44RG1Dck1GS3ZiTC9Pdjdq?=
 =?utf-8?B?SVNjMCs5OVBGZDByWWk0UlZyR09KZ25XbmZiUUhEUlRHOXlZbndJZm1RRW9x?=
 =?utf-8?B?RGtHNXJ4RzBpaFo1azkrL0VQSU84dWtYNGZ2QmFuSmlHNlJjL2YydTk1UjNv?=
 =?utf-8?B?ajRrdDhRTlQ3Y2hxcGJaQkRoQ1NUdkY0YVFVR3JCL0J0ZGxUVUdsK2VJRkxt?=
 =?utf-8?B?Yy94SXYxS1pFOW9oVmxDc3VmRVBZN2hsU2FMWUtMblc0U2dLTGlURTA2dWk5?=
 =?utf-8?B?NDgvNkZySkY4NSs1Mk8wTWJlV1lrWENXZ2ErK21QWkxhVmpTajVTYU9XVm54?=
 =?utf-8?B?bHEvL0JNdjgzb2FXQ3dSY1c1ZnJxb243ZWFUTEhwekJCUVdKSnI0eXRsT3lZ?=
 =?utf-8?B?UTdlcDdJRllJSW1kVE1rOGgyT00wYlhDK0Fjb3V1c1ZpRWxxQ0xRR2N4bUU0?=
 =?utf-8?B?dDBBanpiWEtMMVFiNzI5cUxkNDVhSWFVSGFJRU81VisvVUZrdE9SZys1Z0hi?=
 =?utf-8?B?MjdPYlFhaElCZkNORSsyR3hiTFBuY21TdElJazk1RUVMeXBpODhva3k1SDJJ?=
 =?utf-8?B?OHB1bFYwaThsQ3R2RENrWjRLeUg4dDBjc0FlTlZVVGFORVRaZDJlQXhtN0Nr?=
 =?utf-8?B?WmR1OUVEM3lnK0pneE8vN3A1Mml3MVd3NHR3bFFrNUdVOHdoQW9nTGp6VUdZ?=
 =?utf-8?B?c0xORUUrVG5ISVptSlFTQmFqVElXZTJlZm5FcUtRWXZMVy91YmZuSVlpd1l0?=
 =?utf-8?B?ZVRkZmlHSG5URU9Jc2d4dkd1T1N6TWZuQjllRy91R1MweGliaEJCS1AzMitr?=
 =?utf-8?B?aG0vSTZYWUhWZjlFclZNUHMxcjc0T1JKMDJSOHRsODVtazZGcStQY241eUlq?=
 =?utf-8?B?WnlWdUdGd0FCWXZYeFlHMVZONkVHbnJhd0RwdFA1YjZNTW9UcmZJb2ZzaVhB?=
 =?utf-8?B?Qzc3emIrSnRGY1JkYm5aMm1BVzFJL1JsZkphWHJZeEREUU53ZjFyTm9MSjdZ?=
 =?utf-8?B?VXV1MFBPSS9kTkJNNzI2ejJmRDBKMmovamVyQUJ2QlQyNVNaZ1RzcUlEclRy?=
 =?utf-8?B?WjBGS0NGMzZjanlZWTgrazBDanpzbTFkdlV4WFhpUVlFclVFcy9NNURTSWpL?=
 =?utf-8?B?K3JWa1BsWmdsQ0EvNngzeVRsV2xBd1R6aksrbzd5TkJaR1B3bjdSQ2RhL3hi?=
 =?utf-8?B?QmZtcFpDNzhBQ2UvSFJDVkFIZWkrZnhNWVR6SjZsZkgwT24vL0FhaFR3YUlV?=
 =?utf-8?B?ZVg1SzNud1hUSmhZYWdpaVU3ejlzanBNL2hrWEprNTFiZXYrNXNGaUFPdUZi?=
 =?utf-8?B?MFhRMVdpQ2tOUzlOQVJ1ZVBJeUNRV2ozMThRd0NaemhvMVdIeVJUZXhTSXBK?=
 =?utf-8?B?QXFMUk01NS9KUkcrdFJuLzFyU0lwWEc4MkV3NFkxcGwrTzJPTkh2MXZYb1Vx?=
 =?utf-8?B?V25wejRZYU9MRnNFamV1UGx6OTM1UG9FVFBSWEl3WkxrUzZUSXhQRVJoM1d6?=
 =?utf-8?B?TGwxSjkzL002R0hpMWYrMXhSMFVnRGdBeW9YTHVtZE5XL2E5TUk0MHB1NS82?=
 =?utf-8?B?ZnNUUFFyblNUaVRQNmpzWklKY29BaXR3bnNFTUNkNEkyeTNwWXFRdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd6619a-803b-4dc5-c71e-08de7dfc6775
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:53:35.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPA8VpYQfpACSe0Y4dPJBrZd2KLAathyhFqg6QQPl0Uv4iM3HyQJSjrt7pPc1mPoV8yEi3HNI7Xvs7vK7pEmDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5123
X-Rspamd-Queue-Id: 0781423D23D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,macbook.local:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:51:53PM +0100, Jan Beulich wrote:
> The label used upon the function failing is wrong. Instead of correcting
> the label, move the invocation up a little, to also avoid it altogether
> for the idle domain (where ->vmtrace_size would be zero, and hence the
> function would bail right away anyway).
> 
> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

