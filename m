Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E1sCpMNtGlvfwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:13:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF90283892
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253692.1549796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12KP-0003Qz-If; Fri, 13 Mar 2026 13:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253692.1549796; Fri, 13 Mar 2026 13:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12KP-0003O9-F2; Fri, 13 Mar 2026 13:13:21 +0000
Received: by outflank-mailman (input) for mailman id 1253692;
 Fri, 13 Mar 2026 13:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q06f=BN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w12KN-0003O3-BX
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 13:13:19 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66ccc023-1ede-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 14:13:18 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DBBPR03MB6988.eurprd03.prod.outlook.com (2603:10a6:10:1f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 13:13:14 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 13:13:14 +0000
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
X-Inumbo-ID: 66ccc023-1ede-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wohzpw2CR+bZn+3ZQiOzxtabIFLcNQ5K+M86pxMCKilFMom1WhqUCifjHSR4ivNkk3M6OVUXbCT3nfE4PGllbjaREsdQ/kCWI9r8djVLRs81oD4VYUDZlBX5oQ/A0fiTMnOaya6Lzy2RJkyPvrvpqy2eXIUVDpD3TraLi3NEYv/YuNMPugB2BBgQjjloSrQwCPH1aT0AapMYfFivtXfLr/7RL7Cvy+KY1Bcg0qLC69jXpce1oauj0OInQaFzEjhGwwEd4xeFUHdWrZUiznAgS1Nzj5jYR2wsV5+rIk+IrfW2DVr5XsYA70ddckpxzTdUOYVx25ph2pHEobPX/uEgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzDoGlGQzT88v3W1tp3fO1drcFdstJ2VpFyyksAvniQ=;
 b=kHslB2U9ERkFAV7FneM7HDYJPIQpQS0w5dE4PBF0mag0IC9m16s1YTcr8RNYTmEBq9UZrMAu//mLVu8j/YXpgui2z75uYI+jufDlb9824M/oGz5ptvsKMn5DPnpVx7sJmEDT8yTcHgl8okpH9RtwLv0kd49zncJ/laxSAf6eeRmE+9UuqzuQleAG2sPGA7bsbBV6nlx4e3/BGddi4Oko6piW53Bl2NBDzUPBsRwSqICUwLHYTdv7f0le27000D4GqRdmHRssNp0eu9Hcu11Ue3JTqmhT0Zhf5aejgk5JkQ1NN09oD/ZfJrvzf16f9GmneVzw7i2toSDnyVgynjf9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzDoGlGQzT88v3W1tp3fO1drcFdstJ2VpFyyksAvniQ=;
 b=sWkb2ViScuq/F1hR7zBmxmmD/met8cq3oaf/rXuuZGGqJ/0eUiPfH27eTzS9hMrVX3gOEgkaWbQH3e9nAjSqnt8v+1YhC2HzDHm1kZxf7W5CBEvbiVg+kUQLfzGIjIyV5H62paMvQUtab3roJyYul2piVKNbDsHHFG+OWK9DJqM0ve+OKmdB9xhyRws95E9+osW5UQmRHFNc25ct4jy/7nHkNBf2VuCSLuuec1GedoxBTL99xX1ALoJWYWYvJ368ep5zlUdyXedeULsyeJemu7YEKQSUcrYxTaKZlkWYJezM29WpTYf5Sv88aNAdkaXTcdYEWYQNuHJ/v9LYr9Zcrg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: Re: [PATCH 0/2] Address violations of MISRA C Rule 20.7
Thread-Topic: [PATCH 0/2] Address violations of MISRA C Rule 20.7
Thread-Index: AQHcst645g7QlNxsOkmEje6S743Qy7WsYhwAgAAOcYA=
Date: Fri, 13 Mar 2026 13:13:14 +0000
Message-ID: <2632e6a3-5447-49e9-aa39-bc3ea24c908f@epam.com>
References: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
 <f1b8985c-cb61-47a1-9ecf-28c7cbb9cf63@citrix.com>
In-Reply-To: <f1b8985c-cb61-47a1-9ecf-28c7cbb9cf63@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DBBPR03MB6988:EE_
x-ms-office365-filtering-correlation-id: b95a030a-d343-4e72-4c82-08de810248fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WAJcvOYSsmOiXRZstn2UGVBWH/l7asVWEKa8ZWtUTf+ui05GWc3xV/Ha5u6cZe9XXWRFv9JVdL2B0PYTrx6XB5FATc0bR6voeqaRUHfBK96ScYmOpsKOMJJTr9H+d0EFd1h6/94wzDoMIfPoJD+Djn5bMEMPqZSlt3VsPtcUQoQ61k+O55zoUudthDqDkQlOJUfUw/lfpyaogl+IgXv9tfG3+id/aE15OV691ndMz8KPOmBL28nidbtz5HYnHh6T301Et/pUuKKlyVf6bUTGSj+1FiozGz+hVlkEJDN+Z+RRvZwsnXWj63/+MP8y3bq2Jt0+TCnDiIqg0u+xw1T8fLv6fv0G7DN4Df+0T4LcKLLs3akC72pG75zlOeLknP5j9mY139AP+A14gMTQBjeDay0Kx3/uOQLmP0NXThQS+acCrMpmiW1lWfv4ydymk1hDgjJEiYira6gRYmOsyi2FuG9Ro5PoG2mteW4ZY0ONp1RvW4ukW4YNphuPukvr1GH8ilRB+976Qwm7/tujMzoGSpKA3KOqf2/vBlBYMGQDUmb1lTRmy8xCfPLwDWkhZuRsBVtsXKxWQUetDZM2K3jlifd18QcWj5pokQP1kmldeYa11gz+xu8oq/BCbo42YH6F7iK//mMzO6QEbUxGcXUFsvpBKNDKkzNPCGwXq04Vli+YGir61GJt67WtzX4rL39jITgtT18eR4mcZYx96eg+CDVqtv8bp+Pzixn4+eEwxYCzkrAnqgH3+ZjC7ItKBcbLd1hwa0fxtc3AKiWo7NRn/mdjePdJKTq9cGgsOLzomkM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmpqUlJwNWVyNUwrWDkxcnpJTllOb21WQ2l3djAxd09CNE43TFVHYzVySFhX?=
 =?utf-8?B?K0plTlVLcjBaakw2Ri90OVdnZVdGZUJsYkNNZXdRbkx5UnFOWG9WQ1dzTGhK?=
 =?utf-8?B?Rjk4VTNtb3Y4dUdSUW16YVp6UCtTR1FraVRyT0M5b2VrOGNlSFRWQ2VOc0xU?=
 =?utf-8?B?Z3Qza1dBQTZrSHlpazQ2NndxNE1wRm1kdkxDM25KdHBuMWdxc3Vac2hOYk9z?=
 =?utf-8?B?WitIcVh3MXRnOVlZNVBlcnB4c2dGT1ZXSWYxcFlOQWF6SGc0T0I1dndqak1h?=
 =?utf-8?B?ZjBWOHNvYy9GQU5NNWRORGpMYVZ2eDd1S1BzcmIyQktrQUh5UTl5R3gwcmt4?=
 =?utf-8?B?bDFIRWhGRncrMG51dkVrOUthNzJZeGl0OFFTZitZYkptdTI3N1pReS9JUCto?=
 =?utf-8?B?WWNGUitJU3JHWXA2QjlRYmFqdFMwSEt4SkFTT1lQTVJVbzY0MEM5VUxZOFpr?=
 =?utf-8?B?cGdNR3VBUUJBZnpkOVRDajIwRFJNRlQrUG10WEYybkFYN1ZuR2dxR0JYS1JK?=
 =?utf-8?B?WU9rcEcvS3p0aWJNUFF3TWlDYzZBaEQvc3BrVERIUnF1bWMvdW5sVFk4WWFo?=
 =?utf-8?B?QWsrWkpReXBZdzJ1ejBmYjZnaTM0cEY1Z1MzanJmVlpmNXhPU2RNS3ladnhI?=
 =?utf-8?B?K0RralJGK0p1cXo2eXJmQU1uTFNNcHNMUUwreDJiSCtjVmlBZHNjVkZOeG9J?=
 =?utf-8?B?WGU1V0N4b0U0ZERKcnh0TWVRdE5jOHluM203K1hQTmk2cUdwOEhWZkFWOUtI?=
 =?utf-8?B?Rmx2bXdJQVNBMTJ5Um5nSmhUL2svZE02T2JwMVRGUmR4S24zV1o0NEJJSDBa?=
 =?utf-8?B?VVlaeTh2MzZZL0FwODVMTXFqR2ZFTkEyd21mbS9rdk9uT2xwQnlNYXZ0Si96?=
 =?utf-8?B?Yyt1YmwrTUw5ZTZLalJOMWk4STFHYldiWHVna3FMc0JvMkMvb0l2SzBSOHUw?=
 =?utf-8?B?SURkRXJuMzV0dGdLQS9ybW45emZJaTN4a2JSNU51MmxGY3FkZlhxemlZZFhz?=
 =?utf-8?B?VUVZTFNoWHN1QlpJaGxhRmQwR2hVTDNpY2MwVVdOaXJsMjVVeDQ2MWppRUhS?=
 =?utf-8?B?QXBpRzV3VUUvcGpvSjRkVElpbHFLQVYza1NmendpbHdwMTZDVlZtbWF2Wnhz?=
 =?utf-8?B?RXFiTG9lM0tITXlCbFYrNk9kUk5xb1pOTkF5SElFU2Q5NUU4VWhsaGsvYy9F?=
 =?utf-8?B?eHorMlJPVDFxZGtGM3VXZjRtNm9rajJaajhMYU85RWpqNC9yNjRDc1lOb21T?=
 =?utf-8?B?QU1OanRsbXp1TXd4SFlLdjVjeGdKTDNmczRMZUUxWVhnUkVIN2g0TDZHb3ZP?=
 =?utf-8?B?T0RiVUtJQWN6RjV2d1FWNlFkOTlFb2piY2tsOVU3UkV1OHA5dTZZczEyVmth?=
 =?utf-8?B?d3J6Wm9YR0EzNUIvTms5ZVdScWJIZWJ6aC9zTjgrUkdVWllkVlR3YSs4dXY0?=
 =?utf-8?B?TW1YUlRmRTllR2M2TUpyc2U2N2JzZHg5a2l5enI3WGFIYkowWmNpaWIwM083?=
 =?utf-8?B?Vy8wT29pRm1mVlBTTzd4YW9aUU13S215bjc3SDdGRzQ1T0h5SiswaTNmV0hj?=
 =?utf-8?B?am11NTZoaEtBbVJUWnUxUEp5NWd2RGtOcVZGOXRxQXo0d2dVVDM1RXp3c0Nv?=
 =?utf-8?B?eUxOUTFmNmJlWlFRTnFGeVU2a00vWWxqL3hJd1pWZDRsMHl0WEtkYnVzVGtF?=
 =?utf-8?B?NXkvU29TRVlkT01ubWtmU2laMEV2M1N4VG9WclVIVStRcjBIaElnS3hJMHZE?=
 =?utf-8?B?WEs5TE9pRmMxVXJua0xsbnJWOE9vWjhtQkYwZjdVY2x2aHV2eGhXdEQ0ZFly?=
 =?utf-8?B?NUN3d3IyTzViV1pLUk5hUUJVcVZWVjJ6Um41V2FSbG92U2M3akk4NXNpdlJx?=
 =?utf-8?B?WDRnS0l4QjNlbEFoOE1jYVVEa0lkVG42aDhpT3FlQnVpRWM4bTB4R29kL1Bz?=
 =?utf-8?B?cTU4VHVvbEs2YWM4ZjZCMzVLZ1hLZ2ozZXJrOGYvZStVQ2syWWtOZVZlcE9p?=
 =?utf-8?B?VndZeGVxM3FOQXNpRks3byt6TUNDSFYrZ051ZkFVODVLS2d2S1NVWCtyQTYr?=
 =?utf-8?B?SHRLVUp4ZEdvbkwrcmFwZENkTnZtSnZiMVdkRm14WXJnOE5VL0FhUmM1MlUv?=
 =?utf-8?B?M0RVK2RSVFVtRkI4WGVubXZpaEtlcWt6Y0QwZnNpVEhWcXo1cXpvVTdGbGgr?=
 =?utf-8?B?NjdYc3lreVdUdDB2YlVORElhRy9LaCtrcWxmRTBSRUZXeWxYeTBJTFloSWJ4?=
 =?utf-8?B?WmhCNHJPY3dhVExITmExMzhzY0p1TE1TL1VvYXpuUDZKNUxUcnFHUFRzWDg0?=
 =?utf-8?B?WlJYQUxxeDlXNGtlYlZ3TTZwS2s4R0F3N3pGa0RhV0pBcVdZK2RLUGwvKyth?=
 =?utf-8?Q?njN5fkraGvsTW634=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81A4E89CC1B4AD44A51871D09D371653@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95a030a-d343-4e72-4c82-08de810248fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 13:13:14.7346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gexz4L/YQ1u+3fHpdx+rTuOtGFrqQ4fIOp5xjyQtHpAYv3npF5wm2h82WDGtBS7+tiVVlZdhJvbyuZcBnrlGnU9IboW8VF55tGLsH1T5kzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6988
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7CF90283892
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMTMvMjYgMTQ6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEzLzAzLzIw
MjYgMTE6NDQgYW0sIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IFRoaXMgc2VyaWVzIGZp
eGVzIHNvbWUgTUlTUkEgQyBSdWxlIDIwLjcuDQo+Pg0KPj4gVGVzdCBDSSBwaXBlbGluZToNCj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9w
aXBlbGluZXMvMjM4MzI2NDM5Mg0KPj4NCj4+IERteXRybyBQcm9rb3BjaHVrICgyKToNCj4+ICAg
IGFybS9wY2k6IGFkZHJlc3MgdmlvbGF0aW9ucyBvZiBNSVNSQSBDIFJ1bGUgMjAuNw0KPj4gICAg
bGl2ZXBhdGNoOiBhZGRyZXNzIHZpb2xhdGlvbnMgb2YgTUlTUkEgQyBSdWxlIDIwLjcNCj4NCj4g
SSBhbHJlYWR5IGhhdmUgcGF0Y2hlcyBwZW5kaW5nIGZvciB0aGVzZSBhbmQgbW9yZS4NCj4NCj4g
fkFuZHJldw0KDQpIZWxsbyBBbmRyZXcsDQoNCnNvcnJ5LCBteSBiYWQuIEp1c3QgaWdub3JlIG15
IHBhdGNoZXMuDQoNCkJSLCBEbXl0cm8uDQo=

