Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFS1HtTc6GnOQwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:36:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7379447503
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290710.1570237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYg7-0003SE-OO; Wed, 22 Apr 2026 14:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290710.1570237; Wed, 22 Apr 2026 14:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYg7-0003Q3-Lk; Wed, 22 Apr 2026 14:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1290710;
 Wed, 22 Apr 2026 14:35:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFYg6-0003Px-Qe
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:35:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYg6-00GD5h-3G
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:35:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8dcc0-5cb7-0a2a0a5109dd-0a2a450ca41a-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:35:46 +0200
Received: from [52.101.61.31]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8dcc0-62f1-0a2a450c0019-34653d1fd212-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:35:45 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SJ0PR03MB6520.namprd03.prod.outlook.com (2603:10b6:a03:394::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 14:35:42 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 14:35:41 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcGhqvLGqw9PrYMqIw+FsI7o5KYHUaQMuJNT1TbjjUgI23nfNGNWUhNarNMeYvLLgvOoggSi7YLaOK5jVSWumWhXzf9Fy+TRdEuZM+tRo6ZaRmTfMyILm1IW57v0E0VjeXb2+Aivre8WyYMuEccBhnDo8B1Kb9tCwGIQ/v+fA9yA/7x7zgjiKNHNqzKSx3WjS/S/WEU8KIq4n4wtws2rfPyLH3yDkzf9ysujN38wO3lD68du/HIgJ4TaIX7HZDap0jQlngN4HtWq8KQX1Hz0+wDDVhJSMmtYHr3EtagrWVQBM5KmJBAZ2h97pe6jwerr6mWO1TGbHhOgF2aN9ZpfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ktO3UcHswmV91HJ+wET0XHDvqR95Tm/WaYN8IWe+J8=;
 b=liGVhZsk3C1davACBE41mn5RdL2gF3353HfVaoyFnkKBM0MbrzsT/xXZng0uDV3kpVy2rrSOCQlTMjzgJeYMHNnh58f8GdRKIHeLG8+17zPW/ZQIzMVTXQAvD5Aqc5fV+l63HCVHOzQMxdoDfmBhP3/QrpoZpE97nYHVQq4v0BBXZjXP0exDOt3QR1PDcbsX/Qtc3QiEU7PsOjnWlERDrYKivzgXzjkUQ9VRv72vF1r9JPCc5glS6b6Xt6ciyB57D2xjhwzgpvI9haNrpNK0xWB1uf2y3F19qQ8cw9qELz629pg3Vgf+AjE6dmPDRUGT4YC2VfiPscU3FZbI1b8dDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ktO3UcHswmV91HJ+wET0XHDvqR95Tm/WaYN8IWe+J8=;
 b=MvpkTki/2o/4dbNX906gpn0l+SwlIkvueAYKj4uUmT56kYAw2HombN+QSNr+uIcUNIHyeoGPUg2unJT9Om4w7NR7XHDsdaLNOe1spDlvvKgeB309J5DX9DZ83ZMmT26EJS3W3sM/LfNLw/FFMpv59yqvpR+nBg1zjwewB6A3ADk=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Topic: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Index: AQHczBIVjQaUKhelwUCYpZQxzVcChrXqzwoAgABXiPA=
Date: Wed, 22 Apr 2026 14:35:40 +0000
Message-ID:
 <LV3PR03MB7707C0637B5F73CA26E3F4D4872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
 <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
In-Reply-To: <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|SJ0PR03MB6520:EE_
x-ms-office365-filtering-correlation-id: 85f0d846-0f21-4e4b-a669-08dea07c6db6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 JvIZXYrrhwm0+kVatlFFLT8f/xFXuEj2VcXMW9qfX9pYYLlE6MaOR1WAU1w3Js7e3MvESuNGrbToy6WZkAGPrJzJfj5jXaaU2BO2D5HG5Ti0B58Yp7NksSUJ5RIh55RTSlCmlK+UXu+jolAkUkNCt5sFeK+pVX9fiyJ0+RecjAU2EcMLuwQB3CYUZxTdMFF1RL6WYUOSBIfvpZa8/3aENr2Pw0Q3N6wx44xr2P9JDRQV9teKyPC/JPNtrGboDeutsFCnVHL+t5MxigvqjUWJESxqAFNQp92HcS7/qMUSepNIOaligZ1fXfl36wEygtuylUY6sBJbZx0diXM2bkzj8f8nuIL0ugKI+om5DyNem1mkge1PRmTypMCMBfDooMaxxVdKQMbnrEvWIgbia0qdue7G3UEhh9xEz5z4H8Sl9J0JlGoLCHnEoYjZeAQX9GzoETvWjgNcWVBa2dczKsUy7rsBP8SgOe6ojEM1qlmgua/l9QU94CDWsxYpMo0rKT4hyDgOjAwe8XRgs5l1yfhxiMDpORCUSdGptLZ+q8XA/YDucl/i62fHH9MO/B/fAkZ0nui37Z142hpXvmg4IGisowp6J83tjKKlxfHuMuet0Ea6xc6TphLiE3HUBdWRWkmGIL0gSdYYwttbTeeSeMyqG5E/JcrmL/mQ1Trze14P5TNFUbUnNwrO8f35hYZDzYCIQbUArNHzNewlfotwfxoLvNC89BPE+8sTbNYzhQnatAhIdZfs/1K90GAWpZBBBWZbHLvLTlnRebxgUBrdk5LxNjwHBpVmJ4e3XOR0W74POCc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVZkSlhlc3k0WTZ0blhNRW01NFc5KzQxUGVhNWlZZmVOT0Uwbit4c2VjNUpR?=
 =?utf-8?B?N1l2Z21hUm9aa3lIRjd1TjlSdTNpaTVoYmNLTmxkQllvRjBJbmdKS0E1c3V5?=
 =?utf-8?B?Tm1VQTB5b3V3S0xUazB6Ym9tdFE4U0dSaDhrZXV5TnJTR2lFV0ZWOVEzN3RO?=
 =?utf-8?B?MHczTjZhYUQ0UklLQ3pIZjgvYWJ2YXJPWHF5NmFmTncwTVdxeWw1NzBxcy9u?=
 =?utf-8?B?SkFVc1RkamFSMGF2UjF4bXk0UHN0RHFQZGhDVkdXM3NpaHcrR29kYW94YUFo?=
 =?utf-8?B?N2N0SjNDbVQxKzc3d0k0WkJpYjM0RUduaUcvTnRRdUk2N3UwSUlhUm5IdFNX?=
 =?utf-8?B?R0xRcWNnOEUrUkpiYkY2WExNUFQraHAxMjRsMEVIYjErdDJkS2o2UFpYb29l?=
 =?utf-8?B?Mkg5SzV0V3ppV1dXRHNKbUYrTE41dDBDc0swMitUMVJZelhBN05rTEtYVHVI?=
 =?utf-8?B?enFLdmlrZ2U2ekR3S3RsWmEwZUhzTlJuM21KKzJLME0yNGI5bHVLNU1wQXNz?=
 =?utf-8?B?NHNMYzBTUTdvakRseDVaM0dORXhweDJkR2YwZGhja09jclIzNjYvd3BWazlz?=
 =?utf-8?B?WG51TFFWYVRmU1IrWS9OMytRbS9GTXpJUHFhWUdaU1V5ZDlxYWdvQWdGd2Ir?=
 =?utf-8?B?M1ZacDVhdUFHanJkZzU5cEdzTFJMbklndWxNMTRCYzAwR3V2UE1rM3JyZ3F5?=
 =?utf-8?B?QnVKWUp6MFJtT1NhL2lYbTF2NDRjSmpKZEZSUlhLeCtKUnREM1NtNkE4SjBV?=
 =?utf-8?B?NThoc2syYjlmL3VXMDE2S1YzeHU0V092NnVmaEFMTk1MRlFjMnlydGZMNC85?=
 =?utf-8?B?a2NjL3phVUlheWFiM2xWTURFNG5HOE4rRHRDRlM1aFpTRWxCU2dGaDVsSVR5?=
 =?utf-8?B?RFNCU1lSUGlNTUp1VDZtTTlQOHdMM0YvRXBXeTNSK1JkT25KKytVNUsvcVF1?=
 =?utf-8?B?WDVKbURDYTI3RWlYNUNkbkxoaWp2d1FSYkI0emJnOEJ5ZnVBdXdIemhmNHht?=
 =?utf-8?B?cHdMaVRYZXhNbVlzN3hWMXM2NENEOEpjay8vSGsxUDlKWGdJYmZkVlB1anZ6?=
 =?utf-8?B?SWFpbVFHMDM1U3JwcEwxc2JLSE43WWtJaUJIUmw5bFRMZHpSQU43cGRWVWs3?=
 =?utf-8?B?M2pCVGhRUlNtVjhrdzYzKzBhWFUvTmF3ZVJZUm5NWDBqS2R3YlcvdFN5T1N0?=
 =?utf-8?B?WTB3VWhqRFZMeEZTblgva3dYKzdjZmJkbDB3MU9mMERvdERNcGZsQXJYMnla?=
 =?utf-8?B?ZzRwaytSeFIxSm5kNjlxRW9PWHRTQ3k1cWVIZ3dETG83YlVIYWNpc3ROWEdm?=
 =?utf-8?B?RGxpY0lCWlcwVGtyaDZuR1BKcTFuNnN0cHRtZ2JHWWk5aHdkaWZyVXJ2SHUx?=
 =?utf-8?B?MjNrMnVubjcwNUgrQXg4bitTZ0c1K29icmZiQzJrYVpKYy9kcE9nclZYYlkx?=
 =?utf-8?B?bER5VWJZRHhxKzhWelRweTl5b1BrYXNScHVYa0pxS3pnMHZaYlM2NXNxbzUy?=
 =?utf-8?B?WVJhTUlOb3JyRysyYTlEUXBUekU5eHk3SUtaRHNQT2ZVNmtVRTd2L1FYYWJD?=
 =?utf-8?B?TzZRWml6OUNKM3djNitEOUZOb1orS2hSQlN0eW9SVktkczJMdGYrdFpJUVkw?=
 =?utf-8?B?VDFhSjNlZEJ1S1djTHhRNmFyQjdHSWJXenJUdUgycEdDY0JBTGdMZ05jTk51?=
 =?utf-8?B?SEhNVGtIc1FDNHhnTWRCNjdvVFZIci9GbjQ1ZlhDeVdsSUhrNmhETjROdnZD?=
 =?utf-8?B?VnlwRlVMU3NEVEluTFRiV1lWUzVFckJpS0N3QWVYTVlubVFIVmlPc0JPemNN?=
 =?utf-8?B?d2U4Ryt4QXZQd0ZiSWtSRVBuTE9USi9zeFluNmNFaGI3Y0c5ZWhKenQvQUZl?=
 =?utf-8?B?M213MHFEZGFPbVBiYzBPam5MSTNsR0ZTdXNRVmk1M2hUa2JWcG11RDB3bWUz?=
 =?utf-8?B?aXFiRFBjSHpMaE1FWjdGaGNkdHZOREpmUnk0UnVFcGxWaTVZYjhEajJocEFP?=
 =?utf-8?B?NDZybHVWTEd6MzM5dGRHNmN2dTVkV2N2Mit2dndaZHZIb05vdXFhZUs3TXlr?=
 =?utf-8?B?KzV5YWVhUXFhbDZRcWVBTkZidVZaYVdNVjYrbDE2OExCV0MrTDN4eE5WNERw?=
 =?utf-8?B?aG83bVUxelI1RFlPZlhoemNqeGRpZGhnaUNnNmtTUUlYRy96OEcvSlI1a0ww?=
 =?utf-8?B?Wk9MSStaaFpmeTZvdWdiMmtoczdHRVNXRDIxblJZaDZ5MHVMaXlnYk1DdlpL?=
 =?utf-8?B?WkIrUXp4Z2pUU1BEYnhjVUFaWDJ0WDVsVlVic2lKWmJLOVNnbHhkVWZqRlhN?=
 =?utf-8?B?cnZNc1dDMVZYUmNYb3ZpeWJUbkdrMGlqNDE2SEdSa08rVlpvNEVndkp1S2hh?=
 =?utf-8?Q?V4xNDN0Q1AHHgMETr1ufRjQvS5/QkudlvYoR9AKT1HGCP?=
x-ms-exchange-antispam-messagedata-1: I8XBDSYidSO1Ig==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f0d846-0f21-4e4b-a669-08dea07c6db6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 14:35:41.0099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZ/Zhm3f6ybzpqnvMcnQBd4itPzdnimUn4e1Snm7aoAkaaRz17DjR6iMYA1P6IGT7lvPL4OpXiM2TLFQRvqmKY+6ms8fYwJvb1PUaZRYvv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6520
X-purgate-ID: tlsNG-d25034/1776868546-6E776CF5-4CA3A4F4/0/0
X-purgate-type: clean
X-purgate-size: 3384
X-Spamd-Result: default: False [-1.08 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.653];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B7379447503
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQpKYW4gQmV1bGljaCB3cm90ZToNCg0KPiBBcyB0byB0aGUgcmVuYW1lIHRvIGRlZHVjdF9nbG9i
YWxfY2xhaW1zKCk6IFdpdGggdGhhdCwgd291bGRuJ3QgaXRzIDJuZA0KPiBwYXJhbWV0ZXIgdGhl
biBiZXR0ZXIgYWxzbyBjaGFuZ2UgdG8gImRlZHVjdGlvbiI/IEZ1cnRoZXJtb3JlLCAiZ2xvYmFs
IiBpbg0KPiB0aGUgbmFtZSBpcyBhbWJpZ3VvdXM6IEl0IG1heSBtZWFuICJub3QgcGVyLW5vZGUi
LCBidXQgaXQgbWF5IGFsc28gbWVhbg0KPiAibm90IHBlci1kb21haW4iLiBUaGUgdjQgbmFtZSBk
aWRuJ3QgaGF2ZSBzdWNoIGFuIGlzc3VlLg0KDQpJIHNlZSB0aGUgcG9pbnQgYWJvdXQgJ2dsb2Jh
bCcuIFdoaWxlIHRoZSBzdHJ1Y3QgZG9tYWluIGFyZ3VtZW50IHByb3ZpZGVzDQpjb250ZXh0LCB0
aGUgdGVybSBpcyBpbmRlZWQgdG9vIGdlbmVyaWMuDQoNCkluIHRoaXMgbG9naWMsICdnbG9iYWwn
IHdhcyBpbnRlbmRlZCB0byByZWZlciB0byB0aGUgb3Bwb3NpdGUgb2YNCm5vZGUtc3BlY2lmaWMg
Y2xhaW1zLiBXaGlsZSB0aGUgbGVnYWN5IGNvZGViYXNlIHVzZXMgJ25vLW5vZGUnIG9yDQpOVU1B
X05PX05PREUgYXMgYSBzZW50aW5lbCwgSSBmaW5kIHRob3NlIHRlcm1zIGFtYmlndW91cyBmb3Ig
dGhpcyBuZXcNCmxvZ2ljOyB0aGV5IG9mdGVuIGltcGx5IGEgIm1pc3NpbmciIGFzc2lnbm1lbnQg
cmF0aGVyIHRoYW4gYW4gZXhwbGljaXQNCiJhbnktbm9kZSIgcG9saWN5Lg0KDQonTm9kZS1hZ25v
c3RpYycgYmV0dGVyIGRlc2NyaWJlcyB0aGUgYXJjaGl0ZWN0dXJhbCBpbnRlbnQ6IHRoYXQgdGhl
c2UNCmNsYWltcyBhcmUgdmFsaWQgcmVnYXJkbGVzcyBvZiBub2RlIGxvY2FsaXR5LiBUbyByZXNv
bHZlIHRoZSBhbWJpZ3VpdHksDQpJIHdpbGwgcmVwbGFjZSAnZ2xvYmFsJyB3aXRoICdub2RlLWFn
bm9zdGljJyBhY3Jvc3MgdGhlIGJvYXJkIChkZXNpZ24NCmRvY3VtZW50YXRpb24sIGNvZGUsIGFu
ZCB0ZXN0cykuDQoNClNwZWNpZmljYWxseSwgSSB3aWxsOg0KDQogICAgUmVuYW1lIHRoZSBmdW5j
dGlvbiB0byBkZWR1Y3Rfbm9kZV9hZ25vc3RpY19jbGFpbXMoKS4NCg0KICAgIFVwZGF0ZSB0aGUg
c2Vjb25kIHBhcmFtZXRlciB0byAnZGVkdWN0aW9uJyBmb3IgY29uc2lzdGVuY3kuDQoNCiAgICBV
cGRhdGUgdGhlIGZ1bmN0aW9uIGNvbW1lbnQgdG8gZXhwbGljaXRseSBkZWZpbmUgdGhlIHNjb3Bl
Lg0KDQovKiBEZWR1Y3QgZnJvbSB0aGUgZG9tYWluJ3Mgbm9kZS1hZ25vc3RpYyAobm9uLXBlci1u
b2RlKSBjbGFpbXMgcG9vbCAqLw0Kc3RhdGljIHVuc2lnbmVkIGxvbmcgZGVkdWN0X25vZGVfYWdu
b3N0aWNfY2xhaW1zKHN0cnVjdCBkb21haW4gKmQsDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZWR1Y3Rpb24pDQoNCldoaWxl
ICdnbG9iYWwnIHdhcyBzaG9ydGVyLCAnbm9kZS1hZ25vc3RpYycgaXMgbXVjaCBtb3JlIGRlc2Ny
aXB0aXZlIG9mDQp0aGUgYWN0dWFsIGxvZ2ljIGFuZCB0aGUgbm9kZS1sb2NhbGl0eSAob3IgbGFj
ayB0aGVyZW9mKSBiZWluZyBhZGRyZXNzZWQsDQphdm9pZGluZyB0aGUgcG90ZW50aWFsIGNvbmZ1
c2lvbiBhc3NvY2lhdGVkIHdpdGggJ25vLW5vZGUnLg0KDQpGb3IgY29uc2lzdGVuY3ksIHRoZSBj
b3JyZXNwb25kaW5nIHJlbmFtZXMgYWNyb3NzIHRoZSBzZXJpZXMgd2lsbCBiZToNCg0KKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCnwgT3JpZ2luYWwgVGVybSAgICAgICAgICAgICAgICAgIHwgTmV3IFRlcm0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KfCAiZ2xv
YmFsIGNsYWltcyIgICAgICAgICAgICAgICAgfCAibm9kZS1hZ25vc3RpYyBjbGFpbXMiICAgICAg
ICAgICAgICAgIHwNCnwgZC0+Z2xvYmFsX2NsYWltcyAgICAgICAgICAgICAgIHwgZC0+bm9kZV9h
Z25vc3RpY19jbGFpbXMgICAgICAgICAgICAgICB8DQp8IFhFTl9ET01DVExfQ0xBSU1fTUVNT1JZ
X0dMT0JBTCB8IFhFTl9ET01DVExfQ0xBSU1fTUVNT1JZX05PREVfQUdOT1NUSUMgfA0KfCBkZWR1
Y3RfZ2xvYmFsX2NsYWltcygpICAgICAgICAgfCBkZWR1Y3Rfbm9kZV9hZ25vc3RpY19jbGFpbXMo
KSAgICAgICAgIHwNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoNCkkgYmVsaWV2ZSB0aGVzZSBjaGFuZ2Vz
IHJlc3VsdCBpbiBsZXNzIGFtYmlndW91cyBsYW5ndWFnZSB1bml2ZXJzYWxseS4NCkphbiwgY291
bGQgeW91IEFjayB0aGVzZSByZW5hbWVzIGZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBzZXJp
ZXM/DQoNCkJlcm5oYXJkDQoNCg==

