Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFSSOPIyzWlSawYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:00:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792537C993
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270584.1559222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x2o-0005dM-ML; Wed, 01 Apr 2026 14:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270584.1559222; Wed, 01 Apr 2026 14:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x2o-0005bs-Jc; Wed, 01 Apr 2026 14:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1270584;
 Wed, 01 Apr 2026 14:59:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7x2n-0005bc-JL
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x2l-001zyk-CW
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:59:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69cd32d8-5cb7-0a2a0a5109dd-0a2a4506e27e-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:59:44 +0200
Received: from [52.101.69.135]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69cd2e68-0df0-0a2a45060019-346545871af6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:40:40 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB8032.eurprd03.prod.outlook.com
 (2603:10a6:102:21f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:40:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 14:40:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClLhBAXao+AUeBJbOxOygPkF6OtiyJicGc+chwccQiovipVaY9LfkQNicMeSo9L23qXbuUu9lCUgNYAxb2qivpXNoRePBpsBvon5EJ5on6YYD6Y3D2tXnFqsE8wbSLDd3eI1SfDlaRK91C9omkA1y+1Oi9/q5yHO29Uo4Od7kCW1KsU9Qwv0wL/HK37zy7wGYWBqy8U+EbBqK+KTdo4dobAqEkBXAAzCOpugnbR2nllSJwxiAZglByTFT56AEevWr1Qqy1bKfTze0vIMV+Xmtpii+iJqVKJbEg/YVA18x+/kcXEQ0kRk3T1Di5nQWZ457jgHilwlPhBXMi9slT17EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQtJi37Fd/Vazf7qgfK12WLcM59LS8GY90I2uV/4frA=;
 b=mlsDHF9GuwdxhV6TmSpBHx0PBuijZdIXXQZsraZshn3bWhd7ELtxOxN7tfpv/eJhYslOloZozrLzm/R7YlIONihOX+AVOJMOl8d9ymnwDg9Qapaor952YFabntmte1MTrCIiFYO7z44TwhV0lmyyBw3T+AR0LQCWlevJ3NAApVZH6NqrRPRGssV2fW1R7AncWX3eDhT3i8+yDk7h89JTOleIe71f2EtSL6teOEvVdNtTx0r6XQIBBBVAHttiOtIPGPAGVn1P21yvt1hbtmpGmodDCtuu3ibzm6pI7VE4mwsLX7VJyD8Lb/wdDPeCN/kvTCALQIEN5Q+PckHsY+NpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQtJi37Fd/Vazf7qgfK12WLcM59LS8GY90I2uV/4frA=;
 b=lKxE7pXTLZw6C2jvJFCiDEiQHv9L2+7dR+0yyFFQe4WA2tLBJZGD8qOwTvd2oS5+B7wxMhsyhAQK8NMc5ZvVnJw37EletzvEqkGj01cH/BkTBCvX1pPtNqN1lORsU47LsuUNGmHlaOkhMJbztpUbQ8xoYtu3YS6zcOcOds3B1XrJoH/kYCqB7mHZ7qYw+T2Tk1kI9PYB7lnxL9yzSWPQhFJjd4ZaIiiFtdRPCWNNpMeOX1UYk3pp8U//1N5Z7A8gL65mtzVT/BFULdU2SQZhmgjS2NBvJiJvPGa2GC46X8kIQg8UWHU3i2xUCQ7aRzr01QG2YK9KJra4CTYckqDTMw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Topic: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Index:
 AQHcr7UNjpbdOXJQP0qdir/zrd85obXI3WYAgAEeNICAAAXvAIAAYLsAgAACF4CAAAc+AA==
Date: Wed, 1 Apr 2026 14:40:38 +0000
Message-ID: <e5bead4b-7187-4190-94a4-e4881f6cfa8f@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
 <f546ae19-2107-469e-847b-7a4cde2c95fd@suse.com>
 <0275be7d-d1d9-47ee-bec2-bfbbb90b4bae@epam.com>
 <46f4a4c5-cc44-47d7-8d6d-03ddaa75bb7f@suse.com>
 <13714c88-838b-4dc7-bc0b-b6ca590fd944@epam.com>
 <8856a1d8-51f7-40ee-9def-570af5c6d42f@suse.com>
In-Reply-To: <8856a1d8-51f7-40ee-9def-570af5c6d42f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB8032:EE_
x-ms-office365-filtering-correlation-id: bb9c7e88-d067-4225-7e6d-08de8ffca4a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 pwmL2i4+u8eCvawaoyBPUMkOz9IzjKCuBwGTF14d1CtdoW1hBZnXCu+i9kWxhOmzIPIooZsX8TShcnHmD1U64JjDZqaxxNRdl60serDjlw9/QWxGtoDEcYpB2tHCjfdMl/nNz1zTuqpLmDWhF30BaPvt8WXbpQNytYFAxr2+HaFQEM/4f1zhefE1xJqLHqB+bRHTjWQKPfljwWhT5mUmTiqh3+y6zFTkBiY07l2QnQThghPW/66Qp7C0aoo99xTRsj6GTqMGgDYzXBAr7O6SxxPH792ltikTVAnezuXOIzRXj4h/RLwM7z6TPdtaR2SY3qmW0DoG/FPXxsJTROzOIoJ5QhfAja2d8D7Arctrd8ybv4mUakMm9+XJX0ivDAnMnsEhGCCW1oerQ+0wKQXwf353CyMjAOLCoBmOBqN/25Xv65dxP9s7DV/w7As0OHNneD70ldmZ+5tQHFv5I3oNPDtysZ99Rnq4/HNQSYl7+AXUcIoO2AmHJTQyhigwdC8dAikXqRFYcQJbSrQaWf2gKe98x6W5NiTDi8Bh6rKWkq/aWdrAIn2qT9egYUufPuVdhls3uevHF4DO7xSPrALF7/f6gtLjoVQbdDjpC4IQCbYLzM0D7BD1yAtv4MKYTeX4y/MzUDawX7GzyUkKUlN3WhXr58nQx632j/wok5ZrEDn3CApoD2IsOO2rW1CySVv9rZfB1GLmpbtE3vw0KJCJWv1yegBStKZu3gMxt68W3psYKLpx96qxUL6dOw5Zx2hr1Zr3VtzzTsDRNeQopV2nyX4tgRX4J5/8p/OCrLEmt7s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEhkVThsRytyQzhhZ3MyTU85L0RZNi85ajJPV1FPd1JPcm84eFFwNi8yTmhI?=
 =?utf-8?B?YVViNitxRlFvckhLWkh0RzFXNThxU0ZWTjU2bnFZVGJzUHk0S2NEZ2w1Qlk5?=
 =?utf-8?B?Ry9wN1l2L1dxVW9wT0tTeGIvRzRZa3k5WGt3MWhlRjhCeUJLSk1zeUdxRmhy?=
 =?utf-8?B?WmlHKytGbUlOL0lqVDFOTWJaNUVGNDRnbUd2dW4yRkkxRGhkb1Q3aHpuamZD?=
 =?utf-8?B?cGdsWlkxZkVlUjJRaHNGLytjdU1GUXVnRVpUZXRNdlF2MThlK0gxMUd1d05E?=
 =?utf-8?B?R3grQUNuWWlmZDFRcngxOGM2Z2NTSDhSLzhSdWhabGVaZU1YVXJUeEdJSGZF?=
 =?utf-8?B?d0dPcWozTkYyR3lEZTlwWjFPRU5sK1M0RC9CTEphcmNlb3pqekFaVkduT2s3?=
 =?utf-8?B?VUNrUlIyVkhoeU41V1dUa3c5K0RRWTNNeFV6KzNyZnFUZjAyQU4wL1F4aUpM?=
 =?utf-8?B?bWNTeENUN2VaRk5kNWhnb1EzVHIwSTZja0tjZlBVbWVuUGJZTkJwRjZRZG1S?=
 =?utf-8?B?bDd4NGQxMUkvbjR6S0JwcnlLejl1cExSQlZIS2VsN3hqRWYwNlZuc0REUkVn?=
 =?utf-8?B?NjVnOWg2UEVsbUpaUnhHbGZmWmZOOXB5YVBEV1c4WGdieDZMQ09ISTlBeVpq?=
 =?utf-8?B?bStGaE94ZG1IbHlMSjRRY21UWFRzQi9JbXRTV1VCRDl3dk42R1lTcEU4N2w5?=
 =?utf-8?B?dmN4MllqQzNRZStWZDVVMUY5M2E4MG9qbStRbnE5bUM2MVhsMXlZRWRReUtG?=
 =?utf-8?B?SmtxTmVtWTBPMmg1SVozNXBvc2c1eGZYRkp1WHBtaldGUVZKT09MTGRTY3Rs?=
 =?utf-8?B?d1FQR0tCNFZQQTV2K2JDL1IzeFF4RXpRMEFLM2RRZ0IrdUNpUTVYUHRKdU9l?=
 =?utf-8?B?Skg2YkJSMFZtaUEvbmh3SUcxNzArVldKaFpZeFJVNjhsaG4vRE9rcHNvanBS?=
 =?utf-8?B?M1krNDR4ei9UN3ZLTDhvOUE4N0t4b0FEOHIzdFlibTdyQkRiS0syd0c1ZlVV?=
 =?utf-8?B?QTVZNzg4Zkp1RlNxdm1oaTlqRExPSHdUV2lqeDhsVm50U2xsU3VBVWJsQzBD?=
 =?utf-8?B?ZStlOWxZc0Zkczkrc3BrSlZGRU5INzB3b1hWdmRsc2ZKbHg3M3l5STcwWnor?=
 =?utf-8?B?VFREUXVNL2JpcjA3TldYbkdCckloc3RuUy9uVEVGMHQwcXF3dkI2UlFXcG5a?=
 =?utf-8?B?MDZUZDQ2V244aXFDQUhtQ2tSSVlHRmFuNHIxWEx2VzNPMERndnQ5dHc0S3JN?=
 =?utf-8?B?bC95WDFGT3ZORnYzOGo4djViVy90Y3plUGdDVEppY0FxcFZMN3RKbTVLMVB1?=
 =?utf-8?B?d0ZYRllLcjlzVmhRRzdOVXR4V0lPVzlUS3B3NHc1MTI1TkN4SUQ4eDZzbUg3?=
 =?utf-8?B?TWZjQ0JVbVN6UC95blFXNlZtckxiWG1VbzlaUlk2bEZubjZ2SGlQeXdJTVh0?=
 =?utf-8?B?OW9rUUFId3I4WFBsSmJvQllXUXFPTHNvTXlDS1BoMnM4ckE2ajlKdG9sNU1z?=
 =?utf-8?B?bk00QTBwbkFROExKOW90Zlhka3Q1NUxvMFA2NUpGVVNsWlRuTmp0UEJGVmlR?=
 =?utf-8?B?M2EvUXpPNVlQSGMzVHRGUjFtK0NjaXpkVktSVVdFNWNPOFNoK0R5YzE5V1Jo?=
 =?utf-8?B?TTRzRmJSN1o1U2l6K1ozbldtRW4zVUw2cTE0RGk4Q2krZ1RiWmJnVkQrMEFP?=
 =?utf-8?B?ZStuWGVUYkpjWVZ3azZBRUxWb1Z3UTYxbnF5WDFudkVoUXhFQmlNZGc2QXVF?=
 =?utf-8?B?b2I3VUR5OXdtdEZwbTVRWUFFbzBDeHpmN3JwTm4yZWZOeTU5T2VUdjZ3c1Ay?=
 =?utf-8?B?Si9mdWFXTHJiZWZ6UE8xb3pISmFkZnFhNEFDVjI1M3BtdEFDNms4aEl5Y2RH?=
 =?utf-8?B?bnFRRTBPWGhBRmd0UUd3OFVRcEYwKzFGNzBuU3k1RlZmZlMxeFpVbW9kNlBW?=
 =?utf-8?B?dndZdTZyL0ZEaDNSTnYweGl5dTNoeUhoTTQ2UlZYWnRZZ0RVSEdhTUt1YXpG?=
 =?utf-8?B?bWw0NEFNeklYd2ZPS1RROERMKytKRU1iYytsWjJlU3N0UDFETjZTcGdsdUJk?=
 =?utf-8?B?VlZwem8xTHJaUWFBNmwxZjFVS3V0bEh2Q2NRZjZkZDQ5WkhHRnV0aGczajJS?=
 =?utf-8?B?aUtTV1FTc0lXM3R0Ulp2UkJNWE1RNXVlR3J0cVYyY1ZkSlVrdTZ4N1NTV0N3?=
 =?utf-8?B?OVdOQnlVMnVrYnF4NlVXcWpOWGhNZ2NHVVlocUgvZDNYTW9OYmd2Vk5UcFNs?=
 =?utf-8?B?ZXJOTGI5RWRFSEJjd2VsZzdnL0Uzc0JhZ3NxN2I1TEI0RFZwb1FZZVZpZ1Nw?=
 =?utf-8?B?RlNvWEpJNENYdXp2ZG5hOStKclhjVkVHWEN3ckdsck93MWh1K0FpajFUVFFQ?=
 =?utf-8?Q?soopLWsvNbplxInE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F159ACCA81DD043898AFCDAF714D1EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9c7e88-d067-4225-7e6d-08de8ffca4a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 14:40:38.9396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3nhGV0SY+PXQtjiYrhb+QBDcSBjMM6Zc10UnMGBgUjeKoMP/Ysb/elr7tufoSkAKBTzR0G0ZSsX0uFOc86Tbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8032
X-purgate-ID: tlsNG-16d1c6/1775054440-AEB333D8-15FEFD29/38/8697268174
X-purgate-type: clean
X-purgate-size: 12078
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3792537C993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDQvMS8yNiAxNzoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjA0LjIwMjYg
MTY6MDcsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gT24gNC8xLzI2IDExOjIxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAwMS4wNC4yMDI2IDA5OjU5LCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gT24gMy8zMS8yNiAxNzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAw
OS4wMy4yMDI2IDEyOjA4LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFk
ZXIuYw0KPj4+Pj4+IEBAIC0xNzUsNzYgKzE3NSw5MiBAQCBzdGF0aWMgdm9pZCBtb2RpZnlfZGVj
b2RpbmcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwNCj4+Pj4+PiAg
ICAgDQo+Pj4+Pj4gICAgIGJvb2wgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYp
DQo+Pj4+Pj4gICAgIHsNCj4+Pj4+PiAtICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0g
di0+dnBjaS5wZGV2Ow0KPj4+Pj4+IC0gICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSBO
VUxMOw0KPj4+Pj4+IC0gICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC0gICAg
aWYgKCAhcGRldiApDQo+Pj4+Pj4gLSAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4+Pj4+IC0NCj4+
Pj4+PiAtICAgIHJlYWRfbG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4+Pj4gLQ0KPj4+
Pj4+IC0gICAgaWYgKCAhcGRldi0+dnBjaSB8fCAodi0+ZG9tYWluICE9IHBkZXYtPmRvbWFpbikg
KQ0KPj4+Pj4+ICsgICAgc3dpdGNoICggdi0+dnBjaS50YXNrICkNCj4+Pj4+PiAgICAgICAgIHsN
Cj4+Pj4+PiAtICAgICAgICB2LT52cGNpLnBkZXYgPSBOVUxMOw0KPj4+Pj4+IC0gICAgICAgIHJl
YWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+Pj4+PiAtICAgICAgICByZXR1cm4g
ZmFsc2U7DQo+Pj4+Pj4gLSAgICB9DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC0gICAgaGVhZGVyID0gJnBk
ZXYtPnZwY2ktPmhlYWRlcjsNCj4+Pj4+PiAtICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0la
RShoZWFkZXItPmJhcnMpOyBpKysgKQ0KPj4+Pj4+ICsgICAgY2FzZSBNT0RJRllfTUVNT1JZOg0K
Pj4+Pj4+ICAgICAgICAgew0KPj4+Pj4+IC0gICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0g
JmhlYWRlci0+YmFyc1tpXTsNCj4+Pj4+PiAtICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSA9
IHYtPnZwY2kuYmFyX21lbVtpXTsNCj4+Pj4+PiAtICAgICAgICBzdHJ1Y3QgbWFwX2RhdGEgZGF0
YSA9IHsNCj4+Pj4+PiAtICAgICAgICAgICAgLmQgPSB2LT5kb21haW4sDQo+Pj4+Pj4gLSAgICAg
ICAgICAgIC5tYXAgPSB2LT52cGNpLmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwNCj4+Pj4+PiAt
ICAgICAgICAgICAgLmJhciA9IGJhciwNCj4+Pj4+PiAtICAgICAgICB9Ow0KPj4+Pj4+IC0gICAg
ICAgIGludCByYzsNCj4+Pj4+PiArICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9
IHYtPnZwY2kubWVtb3J5LnBkZXY7DQo+Pj4+Pj4gKyAgICAgICAgc3RydWN0IHZwY2lfaGVhZGVy
ICpoZWFkZXIgPSBOVUxMOw0KPj4+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBpOw0KPj4+Pj4+
ICAgICANCj4+Pj4+PiAtICAgICAgICBpZiAoIHJhbmdlc2V0X2lzX2VtcHR5KG1lbSkgKQ0KPj4+
Pj4+IC0gICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4+PiArICAgICAgICBpZiAoICFwZGV2ICkN
Cj4+Pj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+IC0gICAgICAg
IHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKTsNCj4+
Pj4+PiArICAgICAgICByZWFkX2xvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4+Pj4+ICAg
ICANCj4+Pj4+PiAtICAgICAgICBpZiAoIHJjID09IC1FUkVTVEFSVCApDQo+Pj4+Pj4gKyAgICAg
ICAgaWYgKCAhcGRldi0+dnBjaSB8fCAodi0+ZG9tYWluICE9IHBkZXYtPmRvbWFpbikgKQ0KPj4+
Pj4+ICAgICAgICAgICAgIHsNCj4+Pj4+PiArICAgICAgICAgICAgdi0+dnBjaS5tZW1vcnkucGRl
diA9IE5VTEw7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4t
PnBjaV9sb2NrKTsNCj4+Pj4+PiAtICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4+Pj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICAgICAgICAgICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+
Pj4gLSAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4gKyAgICAgICAgaGVhZGVyID0gJnBkZXYtPnZw
Y2ktPmhlYWRlcjsNCj4+Pj4+PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUo
aGVhZGVyLT5iYXJzKTsgaSsrICkNCj4+Pj4+PiAgICAgICAgICAgICB7DQo+Pj4+Pj4gLSAgICAg
ICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+Pj4gLSAgICAgICAgICAg
IC8qIERpc2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWlsdXJlLiAq
Lw0KPj4+Pj4+IC0gICAgICAgICAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5jbWQg
JiB+UENJX0NPTU1BTkRfTUVNT1JZLA0KPj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFsc2UpOw0KPj4+Pj4+IC0gICAgICAgICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+
bG9jayk7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRl
ci0+YmFyc1tpXTsNCj4+Pj4+PiArICAgICAgICAgICAgc3RydWN0IHJhbmdlc2V0ICptZW0gPSB2
LT52cGNpLmJhcl9tZW1baV07DQo+Pj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCBtYXBfZGF0YSBk
YXRhID0gew0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgLmQgPSB2LT5kb21haW4sDQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAubWFwID0gdi0+dnBjaS5tZW1vcnkuY21kICYgUENJX0NPTU1BTkRf
TUVNT1JZLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgLmJhciA9IGJhciwNCj4+Pj4+PiArICAg
ICAgICAgICAgfTsNCj4+Pj4+PiArICAgICAgICAgICAgaW50IHJjOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArICAgICAgICAgICAgaWYgKCByYW5nZXNldF9pc19lbXB0eShtZW0pICkNCj4+Pj4+PiArICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4+ICAgICANCj4+Pj4+PiAtICAgICAgICAgICAg
LyogQ2xlYW4gYWxsIHRoZSByYW5nZXNldHMgKi8NCj4+Pj4+PiAtICAgICAgICAgICAgZm9yICgg
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+Pj4+Pj4gLSAgICAg
ICAgICAgICAgICBpZiAoICFyYW5nZXNldF9pc19lbXB0eSh2LT52cGNpLmJhcl9tZW1baV0pICkN
Cj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzZXRfcHVyZ2Uodi0+dnBjaS5iYXJf
bWVtW2ldKTsNCj4+Pj4+PiArICAgICAgICAgICAgcmMgPSByYW5nZXNldF9jb25zdW1lX3Jhbmdl
cyhtZW0sIG1hcF9yYW5nZSwgJmRhdGEpOw0KPj4+Pj4+ICAgICANCj4+Pj4+PiAtICAgICAgICAg
ICAgdi0+dnBjaS5wZGV2ID0gTlVMTDsNCj4+Pj4+PiArICAgICAgICAgICAgaWYgKCByYyA9PSAt
RVJFU1RBUlQgKQ0KPj4+Pj4+ICsgICAgICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4+Pj4gKyAgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4+PiArICAgICAgICAgICAgfQ0KPj4+Pj4+ICAgICANCj4+
Pj4+PiAtICAgICAgICAgICAgcmVhZF91bmxvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4+
Pj4+ICsgICAgICAgICAgICBpZiAoIHJjICkNCj4+Pj4+PiArICAgICAgICAgICAgew0KPj4+Pj4+
ICsgICAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4+PiAr
ICAgICAgICAgICAgICAgIC8qIERpc2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxs
eSBvbiBmYWlsdXJlLiAqLw0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgbW9kaWZ5X2RlY29kaW5n
KHBkZXYsIHYtPnZwY2kubWVtb3J5LmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1PUlksDQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFsc2UpOw0KPj4+Pj4+ICsgICAgICAg
ICAgICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArICAgICAgICAgICAgICAgIC8qIENsZWFuIGFsbCB0aGUgcmFuZ2VzZXRzICovDQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJz
KTsgaSsrICkNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBpZiAoICFyYW5nZXNldF9pc19l
bXB0eSh2LT52cGNpLmJhcl9tZW1baV0pICkNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgcmFuZ2VzZXRfcHVyZ2Uodi0+dnBjaS5iYXJfbWVtW2ldKTsNCj4+Pj4+PiArDQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVMTDsNCj4+Pj4+PiArDQo+
Pj4+Pj4gKyAgICAgICAgICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7
DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+IC0gICAgICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21h
aW4odi0+ZG9tYWluKSApDQo+Pj4+Pj4gLSAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2godi0+
ZG9tYWluKTsNCj4+Pj4+PiArICAgICAgICAgICAgICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFp
bih2LT5kb21haW4pICkNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2go
di0+ZG9tYWluKTsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gLSAgICAgICAgICAgIHJldHVybiBmYWxz
ZTsNCj4+Pj4+PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICsgICAgICAgICAgICB9
DQo+Pj4+Pj4gICAgICAgICAgICAgfQ0KPj4+Pj4+IC0gICAgfQ0KPj4+Pj4+IC0gICAgdi0+dnBj
aS5wZGV2ID0gTlVMTDsNCj4+Pj4+PiArICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVM
TDsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gLSAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2sp
Ow0KPj4+Pj4+IC0gICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsIHYtPnZwY2kuY21kLCB2LT52cGNp
LnJvbV9vbmx5KTsNCj4+Pj4+PiAtICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsN
Cj4+Pj4+PiArICAgICAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+Pj4+ICsg
ICAgICAgIG1vZGlmeV9kZWNvZGluZyhwZGV2LCB2LT52cGNpLm1lbW9yeS5jbWQsIHYtPnZwY2ku
bWVtb3J5LnJvbV9vbmx5KTsNCj4+Pj4+PiArICAgICAgICBzcGluX3VubG9jaygmcGRldi0+dnBj
aS0+bG9jayk7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+IC0gICAgcmVhZF91bmxvY2soJnYtPmRvbWFp
bi0+cGNpX2xvY2spOw0KPj4+Pj4+ICsgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBj
aV9sb2NrKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAgICAgYnJlYWs7DQo+Pj4+Pj4gKyAgICB9
DQo+Pj4+Pj4gKyAgICBjYXNlIFdBSVQ6DQo+Pj4+Pj4gKyAgICAgICAgaWYgKCBOT1coKSA8IHYt
PnZwY2kud2FpdC5lbmQgKQ0KPj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4+
PiArICAgICAgICB2LT52cGNpLndhaXQuY2FsbGJhY2sodi0+dnBjaS53YWl0LmRhdGEpOw0KPj4+
Pj4+ICsgICAgICAgIGJyZWFrOw0KPj4+Pj4NCj4+Pj4+IEFzIGp1c3QgaW5kaWNhdGVkIGluIHJl
cGx5IHRvIHBhdGNoIDYsIGJ1c3kgd2FpdGluZyBpc24ndCByZWFsbHkgYWNjZXB0YWJsZS4NCj4+
Pj4+IFRoaXMgaXMgZXZlbiBtb3JlIHNvIHdoZW4gdGhlIHdhaXRpbmcgZXhjZWVkcyB0aGUgdHlw
aWNhbCBsZW5ndGggb2YgYQ0KPj4+Pj4gc2NoZWR1bGluZyB0aW1lc2xpY2UuDQo+Pj4+Pg0KPj4+
Pj4gSW4gdGhhdCBvdGhlciByZXBseSBJIHNhaWQgdG8gcHV0IHRoZSB2Q1BVIHRvIHNsZWVwLCBi
dXQgeW91IG5lZWQgdG8gYmUgY2FyZWZ1bA0KPj4+Pj4gdGhlcmUgdG9vOiBUaGUgZG9tYWluIG1h
eSBub3QgZXhwZWN0IGl0cyB2Q1BVIHRvIG5vdCBtYWtlIGFueSBwcm9ncmVzcyBmb3Igc3VjaA0K
Pj4+Pj4gYW4gZXh0ZW5kZWQgcGVyaW9kIG9mIHRpbWUuIFRoaXMgbWF5IG5lZWQgZG9pbmcgZW50
aXJlbHkgZGlmZmVyZW50bHk6IE9uY2UgdGhlDQo+Pj4+PiBjb21tYW5kIHJlZ2lzdGVyIHdhcyB3
cml0dGVuLCB5b3UgbWF5IHdhbnQgdG8gcmVjb3JkIHRoZSB0aW1lIGFmdGVyIHdoaWNoDQo+Pj4+
PiBhY2Nlc3NlcyB0byB0aGUgVkYgcmVnaXN0ZXJzIGFyZSBwZXJtaXR0ZWQuIEVhcmxpZXIgYWNj
ZXNzZXMgd291bGQgc2ltcGx5IGJlDQo+Pj4+PiB0ZXJtaW5hdGVkLiBZb3UgbWF5IHN0aWxsIGFk
ZGl0aW9uYWxseSBuZWVkIGEgdGltZXIsIGluIG9yZGVyIHRvIGtpY2sgb2ZmIEJBUg0KPj4+Pj4g
bWFwcGluZyBhZnRlciB0aGF0IHRpbWUuIChZZXQgYmV0dGVyIHdvdWxkICBiZSBpZiB0aGUgQkFS
IG1hcHBpbmcgY291bGQgYmUNCj4+Pj4+IGRvbmUgZHVyaW5nIHRob3NlIDEwMG1zLiBBZnRlciBh
bGwgdGhhdCBtYXkgYmUgYSByZWFzb24gd2h5IHRoaXMgbG9uZyBhIGRlbGF5DQo+Pj4+PiBpcyBz
cGVjaWZpZWQ6IEZpcm13YXJlIG9uIHRoZSBkZXZpY2UgbWF5IGFsc28gcmVxdWlyZSBzb21lIHRp
bWUgdG8gc2V0IHVwIHRoZQ0KPj4+Pj4gQkFScyBhY2NvcmRpbmdseS4pDQo+Pj4+DQo+Pj4+IEkg
YW0gbm90IHN1cmUgaXQgd291bGQgd29yayB0aGF0IHdheS4gSWYgd2UgbG9vayBhdCBob3cgbGlu
dXgNCj4+Pj4gaW5pdGlhbGl6ZWQgc3Jpb3YsIGl0IHdyaXRlcyBWRkUgYW5kIE1TRSBiaXRzLCB3
YWl0cyAxMDBtcyBhbmQgdGhlbg0KPj4+PiBleHBlY3RzIFZGcyB0byBiZSBvcGVyYXRpb25hbC4g
SWYgdGhleSBhcmUgbm90IG9wZXJhdGlvbmFsIGF0IHRoYXQNCj4+Pj4gbW9tZW50LCB0aGVuIGl0
IGNvbnNpZGVycyB0aGUgb3BlcmF0aW9uIGZhaWxlZCBhbmQgcmVtb3ZlcyBhbGwgVkZzLiBJZg0K
Pj4+PiB3ZSBhbHNvIHdhaXQgMTAwbXMgYmVmb3JlIGVuYWJsaW5nIGFjY2VzcywgdGhlIHByb2Jh
YmlsaXR5IG9mIGEgZ3Vlc3QNCj4+Pj4gdHJ5aW5nIHRvIGFjY2VzcyBzb21ldGhpbmcgYmVmb3Jl
IHdlIGFsbG93IGl0IHdvdWxkIGJlIHZlcnkgaGlnaC4NCj4+Pg0KPj4+IFdlbGwsIG5vdCByZWFs
bHkuIE91ciBjb3VudGluZyBvZiB0aGUgMTAwbXMgbmVjZXNzYXJpbHkgc3RhcnRzIGJlZm9yZSBE
b20wJ3MuDQo+Pj4gRnVydGhlcm1vcmUgaXQgbWF5IGJlIGFjY2VwdGFibGUgKG9yIGV2ZW4gYXBw
cm9wcmlhdGUpIHRvIHN0YWxsIHByZW1hdHVyZQ0KPj4+IGFjY2Vzc2VzIChiZWNhdXNlIHRoZXkg
c2hvdWxkbid0IG9jY3VyIGluIHRoZSBmaXJzdCBwbGFjZSksIGJ5IGJsb2NraW5nIHRoZQ0KPj4+
IHZDUFUgYXQgdGhhdCBwb2ludC4gQSBtaWRkbGUgcm91dGUgbWF5IGJlIHBvc3NpYmxlOiBUZXJt
aW5hdGUgYWNjZXNzZXMgaW4sDQo+Pj4gc2F5LCB0aGUgZmlyc3QgOTBtcywgYW5kIHN0YWxsIHRo
ZSB2Q1BVIGZvciBhbnkgYWNjZXNzIHBhc3QgdGhhdCwgYnV0IGJlZm9yZQ0KPj4+IHRoZSAxMDBt
cyBleHBpcmVkLg0KPj4NCj4+IElzIHRoZXJlIGFueSByZWFsIGJlbmVmaXQgdG8gZG9pbmcgYWxs
IHRoaXMgd29yayBpbnN0ZWFkIG9mIGp1c3Qgd2FpdGluZw0KPj4gZm9yIERvbTAgdG8gcmVnaXN0
ZXIgdGhlIEZWcz8gSW1wbGVtZW50aW5nIGl0IHRoZSB3YXkgeW91IGRlc2NyaWJlZA0KPj4gd291
bGQgcmVxdWlyZSBhIHJlbGF0aXZlbHkgY29tcGxleCBzdGF0ZSBtYWNoaW5lIGFuZCB0d28gdGlt
ZXJzIHBlcg0KPj4gc3Jpb3YtY2FwYWJsZSBkZXZpY2UuIEFuZCB3aWxsIGFsc28gcHJvYmFibHkg
cmVxdWlyZSBzb21lIGhhY2tzIHRvDQo+PiBoYW5kbGUgcGFydGlhbGx5IGluaXRpYWxpemVkIFZG
cyBpbiBYZW4uIFRoaXMgYWRkcyBhIGxvdCBvZiB3b3JrIGFuZA0KPj4gbWFueSBwb3NzaWJsZSBi
dWdzIGZvciBub3QgYSBsb3Qgb2YgYmVuZWZpdCBpbiBteSBvcGluaW9uLg0KPiANCj4gT2RkIHRo
YXQgeW91IGFzayBtZSB0aGlzIHF1ZXN0aW9uLiBJZiB0aGVyZSB3YXMgbm8gYmVuZWZpdCwgd2h5
IGRpZCB5b3UgZG8NCj4gaXQgdGhpcyB3YXk/DQo+IA0KDQpSb2dlciBhc2tlZCBmb3IgdGhpcyBh
cHByb2FjaCBpbiBWMSwgYW5kIEkgc2F3IHRoYXQgaXQgY2FuIGJlIGRvbmUgaW4gYSANCnJlbGF0
aXZlbHkgc3RyYWlnaHRmb3J3YXJkIHdheSwgc28gSSBpbXBsZW1lbnRlZCBpdC4gSSBkaWRu4oCZ
dCBleGFjdGx5IA0KZ2V0IHdoYXQgdGhlIGJlbmVmaXRzIHdlcmUsIGJ1dCBJIGFzc3VtZWQgdGhh
dCB0aGVyZSBhcmUgc29tZSBhbmQgdGhlIA0KZWZmb3J0IGlzIG5vdCB0b28gYmlnIHRvIGp1c3Qg
ZG8gaXQgaWYgdGhlIG1haW50YWluZXJzIGFyZSBhc2tpbmcgZm9yIGl0Lg0KDQpOb3cgd2l0aCB0
aGUgcG9zaWJpbGl0eSBvZiByZWRvaW5nIGV2ZXJ5dGhpbmcgKmFnYWluKiBhbmQgbWFraW5nIGl0
IG11Y2ggDQptb3JlIGNvbXBsZXggSSBzdGFydGVkIHRvIHJlYWxseSB0aGluayBpZiBpdHMgcmVh
bGx5IG5lZWRlZC4gU28gSSB3YW50IA0KdG8ga25vdyB5b3VyIGFuZCBvdGhlcnMnIG9waW5pb25z
IG9uIHJlZ2lzdGVyaW5nIFZGcyB3aXRoIERvbTAuDQoNCg0KLS0gDQpNeWt5dGE=

