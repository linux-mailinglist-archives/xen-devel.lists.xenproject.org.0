Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O6LIoS742lgKQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 19:12:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1477421C20
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 19:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285096.1566402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wE9CT-0002Bw-VD; Sat, 18 Apr 2026 17:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285096.1566402; Sat, 18 Apr 2026 17:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wE9CT-000296-Nt; Sat, 18 Apr 2026 17:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1285096;
 Sat, 18 Apr 2026 17:11:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wE9CR-000290-Sb
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 17:11:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wE9CR-007yPY-9U
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 19:11:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e3ba27-2eae-0a2a0a5409dd-0a2a4504e012-46
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 19:11:19 +0200
Received: from [52.101.85.65]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e3bb35-1dec-0a2a45040019-3465554174b3-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 19:11:18 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by DS0PR03MB8247.namprd03.prod.outlook.com (2603:10b6:8:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Sat, 18 Apr
 2026 17:11:15 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9818.028; Sat, 18 Apr 2026
 17:11:15 +0000
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
 b=reIPMoSYwyR+vXWlGX0tm7dhgeuq8VsMWYsTrAx4GDGuXVINYYII3taYA5vEmFXkx6v+skVRmZgRzrM77sNqmL/NzaU+qaDfoRwa0wHW7210tJZwkiOAKCRJSDxoaiRuLnjFlfJ3uCpWVLrylyOCAN1TBBzK247+rAXVEspc/tpj2n+RxEI/LcRFFFOGZ6x0yrQmwoo8tiRongZzWoxWMEBYgTx8C95ADcUnrx6XWZdVLnw5H6XTuEKa91IPhLTvjdBG3Vn7ZjUJ9QUDUnsJ5mePDLwz4mzhAVOuPqtybYOjI8/nQFy9/gTESl5QMp9fXPsHwCPoAeygRHnZX2L41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afwbcq+12hEaHn7NZlYlJDax7EJaA6PgpiZ9Oh2qgg8=;
 b=Da459KAnRztAzEzQazvQBYyX2D5VnGI0UgVdmKGFBqf0bbbwMsr8Pz2d5/8BIQKmeEzViln0H9+XNoYI2bLBYnTp6nvR0l+Vcrx9qEPcB5xpTeWzTQWatsb1hyNySz/HSl8j9SYAeJJ0knW6w2osWaPnWWkVjml6zPvkMd5rMWhK8KXZvM0282Qa86408L4XePA14SZt7tl+SGh1hC/xjcI26390tUdLeFtzWMainLhMPxJWtgH6Y0eDA+vK34j4xTeTV+yyIQXqguqP5J1qwW7VXvtO32j6edKktfRB2Rbl3uz/FLj3JL7in0g9gBpe7/K9+4y4wa6iVevyBpBDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afwbcq+12hEaHn7NZlYlJDax7EJaA6PgpiZ9Oh2qgg8=;
 b=aWHtF+wn/2Vt5qIINQ5xYGStXGb7DlQ5ijVgN8iHDdJMOgiI2WrfHD6/IshWg7zDyYr5rYuJd1avdtzf2CRDl5hZik6Nv2M07b+3vYpANk6f46GRndyM956SpjZdK9lttYlnP6Lgr9XLktF0Hji8WLj0Ld8Ke73jRk10V3vrqZw=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/4] tools/tests/alloc: Unit and Integration Test
 Framework for page_alloc.c
Thread-Topic: [PATCH 1/4] tools/tests/alloc: Unit and Integration Test
 Framework for page_alloc.c
Thread-Index: AQHczP/wsJouZWgAtUaG6dmfkksoe7XhTlkAgAO9yqA=
Date: Sat, 18 Apr 2026 17:11:15 +0000
Message-ID:
 <LV3PR03MB770785652CEB68F3B52C01C287212@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
 <bbd242400a624465bebae0fa2b7591acd37c7236.1776273656.git.bernhard.kaindl@citrix.com>
 <15fa364f-03b1-433b-b759-9f87da338cac@suse.com>
In-Reply-To: <15fa364f-03b1-433b-b759-9f87da338cac@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|DS0PR03MB8247:EE_
x-ms-office365-filtering-correlation-id: c5c572e7-9ef1-4547-0860-08de9d6d7fcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 l+43AwnFSdZe91aRmDagSlrBgOfgicr/Sy5mKh6QmyvKND3k8gzYyv/1RoQ0DsyGTnRhNoXIXIicp3+UQjNqnSC7g9b1D9t3Hc6LPrYud6WTFFbxoYZS7G9zxpB3ui7kL6du3Wc5d5B1gOxxCFBkOzzK979YIBi4rn36bBIle8s86UtrGOGeLrj9VcOvJY1WLX4bErWpZDnhqiGbKMdBS/duFWtc1w4wCAWR1JAT932Bu1uji0R2++2A+2tMIhaREZCnPflAA3AIWJRKBeYK0Cz6cnmeQpdsNjyyek5R4FFFSBXBpGtQdT+Ovqi0Y6NkmRGTtGWLYJceCPerI85j21mYbO5aN/BXTwP2Pln8zQIfmcm24nZx1/ginQNnxnyuUpBSNykAeLB8fKgSwHdNZkm7MAVpgBaBnUI/2AnlVt/7nitFT2E3QgbSs+gicjrbDfNU8OlDqUxuuA3NIYKkxG/PvfWM7YQKvGuRbpIcTIDfA6a4GW4hzWO2UtnpHpK6xvi6k5asHx7CHpfw7G/K7yag1h3IUEOUqf3edLD+fJnM50s1WwVl4blAmO1eToUMPFfryffdke3ZUCLHJ47Th6oc/Jz1OwA0xuCN1rNk4iZoyYsrgMg/pRuoSMRnu7koMgGuvZ87Zxf5xSRXBa+xSG/8+nrFGp4LCGzPN+zYs2y/Wx1NkDhGigUNSfwk3hsXjOiIN6Z7Uofez+mQoM+0ClJgGgqgUBCSZSIDr5Y3wYYs8ZAqEj7/jFxcm7qgisEK7Qqeag03Eni1Gk5hF5a/9EV/MJG5JC5KmhTCzNKwmJk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tm5QRTZyWU1wS1JiaGJwUHZoV2pGZ1B2cnE3ZG4rL1Rwdjl5UXZMMWc0YU5q?=
 =?utf-8?B?YS9vTkIrdmtFb0Q1cW5qMEdHWU1Vc0pQcVM3bHVHYVhnMy80SHM3UDA2WUVB?=
 =?utf-8?B?ZUZpaWRiY0g5bytHMTR6c1g3NWFyS0Q0dGhCelpWVjlqZEwvdHlUV2QvMGcz?=
 =?utf-8?B?d0hnbFhsNDFML0ZxSlo2dDVEak90WmRRK0hnaWMraE9Oc2l0a3BDbEF2c1lr?=
 =?utf-8?B?bUFNMzRmRDM2elZ0MWlCMVQrcmpWcjVxWk03SDBHa0JkTDF1UzFqbWVkdjY3?=
 =?utf-8?B?ekdmUmFVaEpPRlQ2QkpDYmR3Z2xLaVVpM1VkSGN2ZHlwRlBiMFY3SFJwMXJ5?=
 =?utf-8?B?eDIxbEU0cldOK3hJR1dnUTVQeU9FVmVTM0N0a1IvY2x4SEtXYyt0THNzajlU?=
 =?utf-8?B?N2FKUnUrbVRobGhMVXRzSnZvay9RTFVZanBBY2RGdmswa0hSUDkzYzdJamJr?=
 =?utf-8?B?a2lTQzBJTm5HZmo4Vm9hMnVvTWNNODRoU0o3aHh4ZWVGeHNieWdVVzNvQkI5?=
 =?utf-8?B?cGJJazhtejhGWnFWeFUxeTdaYmtpV0Zyc1hsZ1JiQno1QjU0ZEdOaWZ0STJ6?=
 =?utf-8?B?dHdzYWdpZGRJSlcxSklrTG90MXF4VFo1WTgzTjVIWXlWN2lKTENqVEZIU05t?=
 =?utf-8?B?SFlGSjQ0emQyWUVxZVBtWjNzaUx3Uk9xZHhHRXNXTVJtby9ocWF3UUNZbWtj?=
 =?utf-8?B?Y3V6WXFBY09vcGg1V0tENWk4Q215QlBTb0pQUmgzQlZtbERVdTlLN2Y3dHIy?=
 =?utf-8?B?V0RTMHFHbWswZExCbHNKWFpaQUsxc1d1SjBvRkhRQXFEZGJaTll3SWpOQmZ5?=
 =?utf-8?B?MVhhTzZpeXFwY2lldm5rTXZLMjBRdmg4SDlhVlFVbm40YWZyTUtnQlJFdzQ2?=
 =?utf-8?B?TWc2WCs3dE05UWR5LzVhaDN0UUtqNEgwVDFaVzUzVFJIOFVjaFNjR3g5OGla?=
 =?utf-8?B?Q3RJTmhPeHNOV2N3eWhjSWl1U1ltK1hzOFNLQ2I2SS9COEZtQS8wSGRtdEdz?=
 =?utf-8?B?SjlhTXJ0OUZGUUI0MVZNdHUydWs5UjMrL0M1UzVlQVY0Zk5KZWdxak9YTDBD?=
 =?utf-8?B?cGNqV1VQZno1N243aWc2d2Q0NXI5RlFOUitkWHBpdGhSL1ZuRDVoYTVKaHZa?=
 =?utf-8?B?WGdtTVFaa2R3TFl0YkJUbHFMT0NtRXhpcEFmakE1Q1lPMUpMMDBjd0cxVi9N?=
 =?utf-8?B?UHZnWjFkcHA2ZitpSkZkNSsvdGQ4WjdsREozUWU1dG15cGlyeEFaTDJFZ2da?=
 =?utf-8?B?cGgzU3krNVFYVDc2SjdtY0QzWEk3UktUaGNsQ1BWbWs5TGJ0Zk5Vd0pKZjVu?=
 =?utf-8?B?cmRURlZSS0lPQ2VxUnYzYmIvZGNmZ0VMd2R4bWtVbGhQMlV3N1pmT2d4b0xr?=
 =?utf-8?B?WXA2dFlkUVNUMUduMW5LZmdwMzF2clR6UW0vZFVEdGdxbXpOUEROQ2JlYURV?=
 =?utf-8?B?SW03amFoNFVXckltMUM2RzdOS0hDaFU1Nnh6TzNKUnVoc0xYaFRCU2FhYkdN?=
 =?utf-8?B?b3M1a09GZEZTbG5xdG9mc0pXKzdEYkh2ODFTVmIrb3dmTmM3RjV0WUVDd1VC?=
 =?utf-8?B?cWdtNXplN05QVW5menY5ZVVyVnlZTC83SXY1N2tDMGR5Mmg2OVlXcDg2ZzFX?=
 =?utf-8?B?SDhxM0Fpd056cUVZOFp0WmRUSGlPSytMTE42eEFpYkRVOXEwNkRDaTZmSVgz?=
 =?utf-8?B?eXcySzduRFlIN3drYi9abVJaM2dTN29LY1NnTXpIcC9XbkQvZm1odzREa055?=
 =?utf-8?B?U1Y3UEJNa2FoWEo0WkZaQ1ZDN3VKeGs3ZUhlZ0N1UU1FRmVpU1l6alJuTHhE?=
 =?utf-8?B?MkdCaEZYbW53US9DM1VnOTdMRkJtWnFYMGNtdjN5UmdyUzJYUE14L1d4Uk41?=
 =?utf-8?B?akwzVVVYSzU3dVFLTmZLUi8vd1kxZHZVbWhqdlZFcUJsRmtIeTU0cDZsUjNl?=
 =?utf-8?B?OEVaNU9KdnpucnI5QWlrK1dGTHg1YnR2MUdoOUVGSDBtSlg2VlAxMk5TOHRy?=
 =?utf-8?B?SkFqLzVDN2NUK3ZYKzIwcit3dTVaemJPNmxqU0kwOHgrNzRqR01ReVF1SWhm?=
 =?utf-8?B?aDBIUGZzUW9iM0w1SlBreXNLTEh2TWpJUHNvNVA0cjd1c0JKUHZGN3JtQmxx?=
 =?utf-8?B?YkMvTDBpYkN1ZjBLVkVsdjBydHUzTnRuNnF2aytQVDFRYXN1Q1V6dHY5alVD?=
 =?utf-8?B?L1prUWhmbFRFVmVidk1JVTlLMFU3Z09OYndoWmE5ZEp4REZPUDVDZTdpWE5X?=
 =?utf-8?B?K1NxUlFsdzR4aGdrQ29EWUtJbEt3Q0daRTFCUzNEUnR1M2pEWklQQzUwQU5X?=
 =?utf-8?B?VmRzVW5DTERPR2dSODBxbk5BV0N6WGdLbmZnelpzYWpkb1RlNVlib3JHUkhP?=
 =?utf-8?Q?5mnDQvdhmIjUQPY4iKOyh2yj6sNig9oscGkJxHvPNl/Xu?=
x-ms-exchange-antispam-messagedata-1: TYJZ4O/g1W8BkA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c572e7-9ef1-4547-0860-08de9d6d7fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2026 17:11:15.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DTNdYcrZaziOGf5KEKf4TZtu2VQ/U+HbBcez9a2mmQJUUzPr9iirkTKgkzsOv35FUJJsPIujq7lytaF/AVbOQ8I/sx48dBx8CzHa5o3z1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8247
X-purgate-ID: tlsNG-ebf023/1776532279-324733FF-4A380A2B/0/0
X-purgate-type: clean
X-purgate-size: 1400
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1477421C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQo+ID4gQWRkIGEgdGVzdCBmcmFtZWZvcmsgZm9yIHVuaXQgYW5kIGludGVncmF0aW9uIHRlc3Qg
c3VpdGVzIHRlc3RpbmcNCj4gPiB0aGUgWGVuIHBhZ2UgYWxsb2NhdG9yIG1vZHVsZSB4ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYyBpbiBpc29sYXRpb24uDQo+IEp1c3QgdHdvIHJlbWFya3MgKG5pdHM/
KSBmb3Igbm93Og0KWy4uLl0NCj4gPiAgdG9vbHMvdGVzdHMvYWxsb2MvaHlwZXJ2aXNvci1tYWNy
b3MuaCAgfCAxMDEgKysrKysrDQo+ID4gIHRvb2xzL3Rlc3RzL2FsbG9jL2xpYnRlc3QtcGFnZV9h
bGxvYy5oIHwgMzU2ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgdG9vbHMvdGVzdHMvYWxsb2Mv
bW9jay1wYWdlX2xpc3QuaCAgICAgfCAzMDcgKysrKysrKysrKysrKysrKw0KPiA+ICB0b29scy90
ZXN0cy9hbGxvYy9wYWdlX2FsbG9jLXdyYXBwZXIuaCB8IDQ2NSArKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIHRvb2xzL3Rlc3RzL2FsbG9jL3BhZ2VfYWxsb2Nfc2hpbS5oICAgIHwgNDMz
ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDExIGZpbGVzIGNoYW5nZWQsIDIyNTcgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gVGhpcyBpcyBhIGxvdCBvZiBuZXcgY29kZS4NCg0KQWNrLCBpbXBy
b3ZlZCBmb3IgdjIuIEl0IHdpbGwgYmUgcmVkdWNlZCB0byAxNDExIGxpbmVzLCA2MCUgc21hbGxl
ci4NCg0KQ2hhbmdlcyBmb3IgdjI6DQoNCjEuIFJlZmFjdG9yIHRoZSB0ZXN0IGVudmlyb25tZW50
IGZvciBtaW5pbWFsaXNtOg0KICAgLSBJbXByb3ZlIHNlcGFyYXRpb24gb2YgY29uY2VybnMuDQog
ICAtIE1vdmUgZXh0ZW5zaW9ucyB0byBsYXRlciBwYXRjaCBzZXJpZXMuDQogICAtIFNpbXBsaWZ5
IGNvZGUgd2l0aCB0YXJnZXRlZCBhc3NlcnRpb25zIGFuZCBjb25jaXNlIGNvbW1lbnRzLg0KMi4g
Rml4IGZpbGUgbmFtZXMgdG8gYXZvaWQgdW5kZXJzY29yZXMuDQozLiBVcGRhdGUgdGhlIGluY2x1
ZGUgZ3VhcmRzIHRvIGNvbXBseSB3aXRoIENPRElOR19TVFlMRS4NCg0KQmVybmhhcmQNCg==

