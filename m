Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGbLDsDXAmpXyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 09:33:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45C51BE8F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 09:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306586.1578451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMhbQ-0002vA-3K; Tue, 12 May 2026 07:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306586.1578451; Tue, 12 May 2026 07:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMhbQ-0002sD-0Y; Tue, 12 May 2026 07:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1306586;
 Tue, 12 May 2026 07:32:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wMhbO-0002s5-7O
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 07:32:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMhbN-009Tbs-2j
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 09:32:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a02d77b-e002-0a2a0a5209dd-0a2a4501eb6c-38
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 09:32:25 +0200
Received: from [40.107.162.105]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a02d788-c1f2-0a2a45010019-286ba2693bc0-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 09:32:24 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PR3PR03MB6378.eurprd03.prod.outlook.com
 (2603:10a6:102:5f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 07:32:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9891.020; Tue, 12 May 2026
 07:32:20 +0000
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
 b=Q2bT+ramku/bOZvmMW0cIyU9Rn6hd7T13T2g6TIPBfOrurHQhLlXUCjjI4/DAchtBP5468XRkoOt/eYIAeoDI9I/T+GLDqZFNqYNMQdjaxzt2dY4N0v4mudpJ/zpnlTWFZUYDQ/vwOMcLETU9v2sVfjRw5KQmo3w9AHQVvsAAUlwLT4C7W7byYg+EFIWJaO7Zlm+Rhsgc2TMqK44ntstdIpwOB0TvNu32X9tx0NUxC/XMVkTEqnn22lARatAbU9LzNbcGtfmkUi/O8vdHLI1O/HZ74EDlkMPWxGaCECYChF25EFuF8+g1FykpP+t7vQTDRipw4TuWzvz5dNM4585dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x11TnGOl04orQbuqqYgUo62byMZqkXSryoufrsNuqH0=;
 b=gfsjC8CZMG/c5DKBPJxsH07hhDFrDFqBqaZQWhrY3UBZfW8gIwI9/73o/LsaeVKk/PccTu5s5ZXRgkKa1e3F6hQna496HKiIH6+0mB7ylkKQZpFDlscWQGYu+Dw4llWbO6X9fVZi7vA4Pmg34PRQZzPniBnP86OYemYx9cPciJa+0AidX9opCBexE/k+hVJI0x4XC7OQMhpVh/RGSyPwTDCNHGgaKULPIk8xOeVjJfukYNMir9BJiSI34dVMX2UqEPAa6Man3wsW1esdd/yf5e2AAHDR8q9FNRZIC1eGehtT4xfHxn0Ttm2Dux5Ash7xLKPYV99Sca3JGFCef8DEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x11TnGOl04orQbuqqYgUo62byMZqkXSryoufrsNuqH0=;
 b=JyUMKLHvAxICUBK64Ol3+C6CoPZLMjceuCEsm5FQfUQeVTkp+T3ET1SHHuXK96t6E04mT2P7eSv3NazK9SP3t9yK806AyuFerbxb/Kf9A7tjsQdOErgJTPMqc4STnweL6MYg00bR8KyAVerdggH2QE91uRilP17KxOZCZIy+1Eiw9DLEuyF+HW2t3RbbGdblfPpxE6o1NXohMLB19rnhVmEan7PRR0NIwKvKrF+zGnvS72MYvYHMcI/SMBcRqLZARgHTO3/A1GgOPrnVtvr81igYaq+YhIRKnVKxBNGBYcnLPklPeyjVvAZ+lhMIO3CaFlQNRX9V6o/CJxUVxgGevg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+srYKHnIAgAAUKQA=
Date: Tue, 12 May 2026 07:32:20 +0000
Message-ID: <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com> <878q9vt0lg.fsf@epam.com>
 <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com> <877bparq9t.fsf@epam.com>
 <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
In-Reply-To: <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PR3PR03MB6378:EE_
x-ms-office365-filtering-correlation-id: b54d0815-88a5-404c-cb42-08deaff89a53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 moT0JKLGTUiLXzglgXf5plzyX1N1VNjB0eR0H+1dy1W2oShD2r8naT7+Ks9NCBkr9zSwIRqC8YdurtEmTP4o0f0pPh6n13H1Supzff7CJIV0ksrL4pcRlWjUzm6QSFUbltqxpGTTrUFqinluVvB+140vf8WlnlUhoJ/addLSpAbslx5NRjffdUs41C7RnW6q44v5NJpJJx9faKOgBtQpqj0VKt/S4DPWL43Y4+ceBSs6OMuUWHny2uByb+66ajKQjMwCJFNvmcTjY22MUSxznOyAicpcWTrtAN+0xAF6XNHh064SaIR/yHonC0BvMkdfmc8PBHi9GTIby4Q7NHGNLLkSCU/i3O0SRpVkmurMZuKZx6jtalz0DznZ0TfKC0ZVHrkdeC5czATAINeIfm7fy3p1tzruHvnmdkWfOOwqpMITwu2OW3V2/deTfYpDlHbNJpvmCfoKZzc7/n34YXj6AQNfzX8PlvLmwHgsJJT2VSpu6gkdtEGg2oZguoXDI9MYvfwRzQ7Lj/QKazByK3WL3WxcKdlb45Rd/YxMmqCD1GXJLfej9/N1CD1kQccbbL4ztpVlezb0dij4Y60yVquMWH0L+/L4MxN26W2Tt8OKIR0FqWQk48hRq/RrxOyVBz4oQvohCCY4nzIMCK0olPSstuR9XyPMpWtZgySpioHi4LPNTjkYVW7xm4RrPJ45VoXJZUIXndlB0brVsX+FWrh7uLF0QKRgug928hzNL2tlv70n9UfSzugwA4X/Lh7VT+T5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2JncTExSmZieGtoQmxvMW1GbmErMGg3T2lVNmVjQkR4cjZDc0REQlFYYXRT?=
 =?utf-8?B?WFVwVjRWdC82b2lWY0QzeFhqcmhKckxlNXVtd0NlUk5jbjA3N240L3N1ZktC?=
 =?utf-8?B?d3ZoT0pSOTZyRjArY1hGTlB0L3YzT0Exb0oyZXUvV3NkWHowem1YaWhRcHYz?=
 =?utf-8?B?eFFqTlBGc3hVejJLemJNNVRWZjJ3MmZkdndNTVNqZjRSZ0xsTTVSWkp2OG1U?=
 =?utf-8?B?Mld1OXRxWWMvdFV3dHcrQVBFWDBNRHhFMklXNlFCaExOUHBZK05uVUJkQStz?=
 =?utf-8?B?LzV6Z2FkcjgvcUFCY1JFMWxKVHB2ekxlUzN3M0R3RVdjdjhDWWxNUnhyWk45?=
 =?utf-8?B?c090M3pnNldNNWNTVnVKd0tnZEQweFVqNCt0ci92N3VsMjVuR3NGZnBFTUJE?=
 =?utf-8?B?aXQ0SjNlTzZyL1lXbDZSZzlpMVJ3bVBCaW5hRlRwOXFHZGxEemdqcm5ocmpO?=
 =?utf-8?B?NVJrM1Vta3RETTRjQkVNTW1LUFlLL3dVbm9oUzMyb2h5UTNtNnZpZ1FBU0px?=
 =?utf-8?B?Nk1qMU5KMEErNE9QcVVoZ1lEUUlrdWhLcnB1cFEyUldpdkFGTnRsZDdhMnhz?=
 =?utf-8?B?SDNKckcwbElUQWJubUV6anA4TUZSd0pEa1ZUblhkTy90OXNoOXByakl2NmRK?=
 =?utf-8?B?TWNMaVI3bVFYaUFuRDZQUlVjZWFFN3JEZW5uanM4bEZNZlNCYVR3ZGJZZ1Bm?=
 =?utf-8?B?bzZSZ0I5bGtLL1FIM0Z3dXpyaEJpQ3V6eFdKTVZTcDkrUTJNc2h0VWMxc25X?=
 =?utf-8?B?a3h6V3VjcVVJMkpGTjI5UTMzWGZoMHVLaEpBWS92d1BYNXlYay9EaUhmNldu?=
 =?utf-8?B?U2Zzd0todjVhdlMxN3NrVzl0TGV6ZVpEQlRBSm1ZY1NCSThTWlZmNVowWXc3?=
 =?utf-8?B?Ykt3cWhYY3pRY3V1MTBMbTFGZWFjRGtxNktUb3UyR1lzUEs5OHdtcEFWRzlj?=
 =?utf-8?B?eFNRV2k1Nm1NZkJ1QlZJNFRkbmVmSUU3TlpVajZXaFkydWVrSU1KcXJJRWJh?=
 =?utf-8?B?UlZHVXJ6dWZmalYwbHVtUFgyazg2V0pxR0w1UnRYVDg2NGR0UTFJOHR1Rkth?=
 =?utf-8?B?VE9hWjdrK2xsOGkwMkdSQURrZ0JPN2s1OGhFMk4yeU9qOC8wVU90d25nR2Zz?=
 =?utf-8?B?Q3lkMDdvQWUrWnJGNjQ4SEc0QnVSNWlzeTJpbGZ3TlU2WVBsd2J4Zm5tUXVa?=
 =?utf-8?B?WW9KNnBvWVBnaCt5ZWtURW5XYlNpWkxvZEFFRzVIVHg0dkpBRGFwNTBUVWlH?=
 =?utf-8?B?QUhrOHkxUjJYVFVtYTNFUDdzVEZSR0hWbGFRK2NVVjdXbUdtRGtYY2ZjVXpV?=
 =?utf-8?B?MGprcHFDOWk4T2NscWt0K1FvOUZJTTMwYnM2dWptOXBVenFaTDFXWXF3bTc4?=
 =?utf-8?B?K1gxNXNnSkFXM3I3Q1k2TXVITXR5b2ZmNklUTTcySjliVFhacXdIcFArMVpU?=
 =?utf-8?B?Tkg3YmtDQVU5S0JvcitLNjBXbFpMSFBBSjZMWFNBZVptbWp5Ny83NG05YkQ4?=
 =?utf-8?B?REZwVE1jUlc1VGVnMTVsTFVXT2JJRlBhcHFnOHpmSzZBRENOWTdLUFA0ZGo0?=
 =?utf-8?B?enNaVW14bUFHQ2Q5UERzbGxqOHptdzhKL2p6QTVtYVoya0lPWlJXTFE1L28y?=
 =?utf-8?B?azRSV01yV29xY09MbmovaXdqWmtlQjBuUHpFUkpYVVhPSnR2WDhEdkNYTXBN?=
 =?utf-8?B?WnhCenVwYW1zS1pMaU1XV01SeVpDS3d3dUtPWGNEcEpmTHcvNFhLZWZ1WWRV?=
 =?utf-8?B?NDI4ZjEzbXFCN2NRUVpaUDVRM0hFOW8vNjV2REFsaU91SnhYZmlvLzhkQWRL?=
 =?utf-8?B?UGJ4ODFKOHhkMkdtZ0IwVjBMVUEwaHdhSUJKcGwzZ3BTQ05wRElEQlVZaUJK?=
 =?utf-8?B?QWdrOEIzcFZPNjZFM1VBeElpdS9VSVRTWTlpa0pMNjJYS0lvT3dGWXVCV0w2?=
 =?utf-8?B?dDY0SkVWZUVVb1pYM2lOMzM2U0k4RzNNbWJzc1NzdkdSc3hWOFVCejdwOVU5?=
 =?utf-8?B?ZzlVRkhkU2hnaXJ3RGFYaUxZMFE0UVpsSWlXRFJxc0xwM0FrcDJtM1NUZ05q?=
 =?utf-8?B?QVJ1VTFyNVpsMzFSWmFieDZFMTdobVhaUndpZm5lVGNQRFZ0OFU1eW85Z0xH?=
 =?utf-8?B?TWQ4WVJtNTN3OGpOWktUc1U1c3JYRWVhZ0pnaDNSRyttZEIvTVkxR3pJNTd6?=
 =?utf-8?B?eWJNd3RtaW9rVldxZmVObzJ1Um1vMThFYno4aTlRSWRlMXZYODBrNlYreWRF?=
 =?utf-8?B?WlNWZjNRUmM2TmhVcDZLcFA0TlRWOGo5ZWFGYmlYZU1QUUU2ZGxvQ01BQW8z?=
 =?utf-8?B?SWtDL0YzYkMxTk9qUnVJa2hHb3lBL0swYmt6WWRzSTRBZVNYWjc5cUZWSm1Z?=
 =?utf-8?Q?hPYs9dmuJsKqQkF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F19D3B484E81B541BA3A9DC1BB2918A0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54d0815-88a5-404c-cb42-08deaff89a53
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 07:32:20.8214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsYkt4odjHEmxKtCf+SG/216LMC37yQ4wyb0kjpasXOBnBV8o6ZKm5ikhj1aWijPkr5g/DoVNEyGmB62cr+d3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6378
X-purgate-ID: tlsNG-d62444/1778571144-AF35AFF4-1638BAEC/0/0
X-purgate-type: clean
X-purgate-size: 7460
X-Rspamd-Queue-Id: 6D45C51BE8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

DQoNCk9uIDUvMTIvMjYgMDk6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wNS4yMDI2
IDE2OjEwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEhpIEphbiwNCj4+DQo+PiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyaXRlczoNCj4+DQo+Pj4gT24gMDcuMDUuMjAy
NiAyMjo0MCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+Pj4+IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KPj4+Pj4gT24gMDYuMDUuMjAyNiAxMTozOSwgTXlreXRh
IFBvdHVyYWkgd3JvdGU6DQo+Pj4+Pj4gT24gNS80LzI2IDA4OjM3LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4gT24gMjMuMDQuMjAyNiAxMjoxMiwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+
Pj4+Pj4+PiBPbiA0LzIxLzI2IDE3OjQzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBP
biAwOS4wNC4yMDI2IDE2OjAxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+Pj4+Pj4+Pj4gRnJv
bTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4gVGhpcyBjb2RlIGlzIGV4cGVjdGVkIHRvIG9ubHkgYmUgdXNlZCBi
eSBwcml2aWxlZ2VkIGRvbWFpbnMsDQo+Pj4+Pj4+Pj4+IHVucHJpdmlsZWdlZCBkb21haW5zIHNo
b3VsZCBub3QgZ2V0IGFjY2VzcyB0byB0aGUgU1ItSU9WIGNhcGFiaWxpdHkuDQo+Pj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4+IEltcGxlbWVudCBSVyBoYW5kbGVycyBmb3IgUENJX1NSSU9WX0NUUkwgcmVn
aXN0ZXIgdG8gZHluYW1pY2FsbHkNCj4+Pj4+Pj4+Pj4gbWFwL3VubWFwIFZGIEJBUlMuIFJlY2Fs
Y3VsYXRlIEJBUiBzaXplcyBiZWZvcmUgbWFwcGluZyBWRnMgdG8gYWNjb3VudA0KPj4+Pj4+Pj4+
PiBmb3IgcG9zc2libGUgY2hhbmdlcyBpbiB0aGUgc3lzdGVtIHBhZ2Ugc2l6ZSByZWdpc3Rlci4g
QWxzbyBmb3JjZSBWRnMgdG8NCj4+Pj4+Pj4+Pj4gYWx3YXlzIHVzZSBlbXVsYXRlZCByZWFkcyBm
b3IgY29tbWFuZCByZWdpc3RlciwgdGhpcyBpcyBuZWVkZWQgdG8NCj4+Pj4+Pj4+Pj4gcHJldmVu
dCBzb21lIGRyaXZlcnMgYWNjaWRlbnRhbGx5IHVubWFwcGluZyBCQVJzLg0KPj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4gVGhpcyBhcHBhcmVudGx5IHJlZmVycyB0byB0aGUgY2hhbmdlIHRvIHZwY2lfaW5p
dF9oZWFkZXIoKS4gV3JpdGVzIGFyZQ0KPj4+Pj4+Pj4+IGFscmVhZHkgaW50ZXJjZXB0ZWQuIEhv
dyB3b3VsZCBhIHJlYWQgbGVhZCB0byBhY2NpZGVudGFsIEJBUiB1bm1hcD8gRXZlbg0KPj4+Pj4+
Pj4+IGZvciB3cml0ZXMgSSBkb24ndCBzZWUgaG93IGEgVkYgZHJpdmVyIGNvdWxkIGFjY2lkZW50
YWxseSB1bm1hcCBCQVJzLCBhcw0KPj4+Pj4+Pj4+IHRoZSBtZW1vcnkgZGVjb2RlIGJpdCB0aGVy
ZSBpcyBoYXJkd2lyZWQgdG8gMC4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBEaXNjb3Zlcnkgb2Yg
VkZzIGlzDQo+Pj4+Pj4+Pj4+IGRvbmUgYnkgRG9tMCwgd2hpY2ggbXVzdCByZWdpc3RlciB0aGVt
IHdpdGggWGVuLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSWYgd2UgaW50ZXJjZXB0IGNvbnRyb2wg
cmVnaXN0ZXIgd3JpdGVzLCB3aHkgd291bGQgd2Ugc3RpbGwgcmVxdWlyZQ0KPj4+Pj4+Pj4+IERv
bTAgdG8gcmVwb3J0IHRoZSBWRnMgdGhhdCBhcHBlYXI/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+
Pj4+Pj4+PiBTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcXVlc3Rpb24uIFlvdSBzcGVj
aWZpY2FsbHkgcmVxdWVzdGVkIHRoaXMNCj4+Pj4+Pj4+IHRvIGJlIGRvbmUgdGhpcyB3YXkgaW4g
VjIuIFF1b3RpbmcgeW91ciByZXBseSBmcm9tIFYyIGJlbG93Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
ICAgID4gQXJlbid0IHlvdSBlZmZlY3RpdmVseSBidXN5LXdhaXRpbmcgZm9yIHRoZXNlIDEwMG1z
LCBieSBzaW1wbHkNCj4+Pj4+Pj4+IHJldHVybmluZyAidHJ1ZSINCj4+Pj4+Pj4+ICAgID4gZnJv
bSB2cGNpX3Byb2Nlc3NfcGVuZGluZygpIHVudGlsIHRoZSB0aW1lIGhhcyBwYXNzZWQ/IFRoaXMg
aW1vIGlzIGENCj4+Pj4+Pj4+IG5vLWdvLiBZb3UNCj4+Pj4+Pj4+ICAgID4gd2FudCB0byBzZXQg
YSB0aW1lciBhbmQgcHV0IHRoZSB2Q1BVIHRvIHNsZWVwLCB0byB3YWtlIGl0IHVwIGFnYWluDQo+
Pj4+Pj4+PiB3aGVuIHRoZQ0KPj4+Pj4+Pj4gICAgPiB0aW1lciBoYXMgZXhwaXJlZC4gVGhhdCds
bCB0aGVuIGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgdGhlDQo+Pj4+Pj4+PiBub3Qtc28tbmljZSBw
YXRjaCA0Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAgID4gUXVlc3Rpb24gaXMgd2hldGhlciB3ZSBu
ZWVkIHRvIGFjdHVhbGx5IGdvIHRoaXMgZmFyIChyaWdodCBhd2F5KS4gSQ0KPj4+Pj4+Pj4gZXhw
ZWN0IHlvdQ0KPj4+Pj4+Pj4gICAgPiBkb24ndCBtZWFuIHRvIGhhbmQgUEZzIHRvIERvbVUtcy4g
QXMgbG9uZyBhcyB3ZSBrZWVwIHRoZW0gaW4gdGhlIGhhcmR3YXJlDQo+Pj4+Pj4+PiAgICA+IGRv
bWFpbiwgY2FuJ3Qgd2UgdHJ1c3QgaXQgdG8gc2V0IHRoaW5ncyB1cCBjb3JyZWN0bHksIGp1c3Qg
bGlrZSB3ZQ0KPj4+Pj4+Pj4gdHJ1c3QgaXQgaW4NCj4+Pj4+Pj4+ICAgID4gYSBudW1iZXIgb2Yg
b3RoZXIgYXNwZWN0cz8NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSG93J3MgYW55IG9mIHRoaXMgcmVsYXRl
ZCB0byB0aGUgcXVlc3Rpb24gSSByYWlzZWQgaGVyZSwgb3IgeW91ciByZXBseQ0KPj4+Pj4+PiB0
aGVyZXRvPyBJZiB3ZSBpbnRlcmNlcHQgUENJX1NSSU9WX0NUUkwsIHdlIGtub3cgd2hlbiBWRnMg
YXJlIGNyZWF0ZWQuDQo+Pj4+Pj4+IFdoeSBzdGlsbCBkZW1hbmQgRG9tMCB0byByZXBvcnQgdGhl
bSB0aGVuPw0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIHNwZWMgc3RhdGVzIHRoYXQgVkZz
IGNhbiB0YWtlIHVwIHRvIDEwMG1zIGFmdGVyIHRoZSBWRl9FTkFCTEUgYml0IGlzDQo+Pj4+Pj4g
c2V0IHRvIGJlY29tZSBhbGl2ZS4gV2UgZGlzY3Vzc2VkIGluIHRoZSBWMiB0aGF0IGl0IGlzIG5v
dCBhY2NlcHRhYmxlIHRvDQo+Pj4+Pj4gZG8gYSByZXF1aXJlZCAxMDBtcyB3YWl0IGluIFhlbiB3
aGlsZSBibG9ja2luZyBhIGRvbWFpbi4gQW5kIG5vdCBkb2luZw0KPj4+Pj4+IHRoYXQgYmxvY2tp
bmcgd291bGQgcmVxdWlyZSBzb21lIG1lY2hhbmlzbSB0byBvbmx5IGFsbG93IGEgZG9tYWluIHRv
IHJ1bg0KPj4+Pj4+IGZvciBwcmVjaXNlbHkgOTkob3IgbW9yZT8pbXMuIFlvdSB5b3Vyc2VsZiBz
dWdnZXN0ZWQgdGhhdCB3ZSBjYW4gdHJ1c3QNCj4+Pj4+PiB0aGUgaGFyZHdhcmUgZG9tYWluIHdp
dGggcmVnaXN0ZXJpbmcgVkZzIGlmIHdlIGFscmVhZHkgdHJ1c3QgaXQgd2l0aA0KPj4+Pj4+IG90
aGVyIFBDSS1yZWxhdGVkIHN0dWZmLiBEaWQgeW91IGNoYW5nZSB5b3VyIG1pbmQsIG9yIGFtIEkg
Y29tcGxldGVseQ0KPj4+Pj4+IG1pc3VuZGVyc3RhbmRpbmcgdGhpcyBxdWVzdGlvbj8NCj4+Pj4+
DQo+Pj4+PiBObywgSSBzdGlsbCB0aGluayB0aGF0IHdlIGNhbiB0cnVzdCBod2RvbSBlbm91Z2gu
IE5ldmVydGhlbGVzcyB3ZSBzaG91bGQNCj4+Pj4+IGFpbSBhdCBiZWluZyBpbmRlcGVuZGVudCBv
ZiBpdCB3aGVyZSBwb3NzaWJsZS4gQW5kIEkgc2VlbSB0byByZWNhbGwgdGhhdA0KPj4+Pj4gSSBo
YWQgYWxzbyBvdXRsaW5lZCBhbiBhcHByb2FjaCBob3cgdG8gYXZvaWQgc3Bpbi13YWl0aW5nIGZv
ciAxMDBtcyBpbg0KPj4+Pj4gdGhlIGh5cGVydmlzb3IuDQo+Pj4+DQo+Pj4+IEkgd2FudCB0byBj
bGFyaWZ5OiB5b3UgYXJlIHRlbGxpbmcgdGhhdCBYZW4gc2hvdWxkIG5vdCB3YWl0IGZvciBod2Rv
bSB0bw0KPj4+PiByZXBvcnQgVkZzIGFuZCBpbnN0ZWFkIGNyZWF0ZSB0aGVtIGJ5IGl0c2VsZi4g
SXMgdGhpcyBjb3JyZWN0Pw0KPj4+DQo+Pj4gSWYgdGhhdCdzIHRlY2huaWNhbGx5IHBvc3NpYmxl
LCB5ZXMuDQo+Pg0KPj4gT2theSwgc28gbGV0J3MgY2xlYXIgdGhpcy4gSWYgSSByZW1lbWJlciBj
b3JyZWN0LCB5b3UgZGlzY3Vzc2VkIHRoaXMNCj4+IHdpdGggTXlreXRhIGluIHRoZSBwcmV2aW91
cyB2ZXJzaW9uIGFuZCBzdWdnZXN0ZWQgdG8gcHV0IHRoZSB2Q1BVIHRvDQo+PiBzbGVlcCBmb3Ig
MTAwbXMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIEkgZGlkIChleGNlcHQgcGVyaGFwcyBmcm9tIGEg
dmVyeSBhYnN0cmFjdCBwZXJzcGVjdGl2ZSksDQo+IHByZWNpc2VseSBiZWNhdXNlIG9mIC4uLg0K
PiANCj4+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBpZGVhLCBiZWNhdXNlIGd1
ZXN0DQo+PiBrZXJuZWwgd2lsbCBub3QgYmUgaGFwcHkgYWJvdXQgdGhhdC4NCj4gDQo+IC4uLiB0
aGlzLiBJbnN0ZWFkIGlpcmMgSSBzdWdnZXN0ZWQgdG8gcmVmdXNlIChzaG9ydC1jaXJjdWl0KSBo
YW5kbGluZw0KPiBWRiByZWdpc3RlciBhY2Nlc3NlcyBmb3IgdGhlIG5leHQgMTAwbXMuDQo+IA0K
PiBKYW4NCg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBlbnN1cmUgdGhh
dCB3ZSBhY2N1cmF0ZWx5IGNhdGNoIA0KdGhlIHdpbmRvdyB3aGVyZSAxMDBtcyBoYXZlIGFscmVh
ZHkgcGFzc2VkLCBidXQgZ3Vlc3RzIGhhdmVu4oCZdCB0cmllZCB0byANCnJlYWQgYW55dGhpbmcg
eWV0LCB0byBmbGlwIHRoaXMgYmFjaz8gQXMgSSBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIA0K
dmVyc2lvbiwgTGludXgsIGZvciBleGFtcGxlLCBkb2VzbuKAmXQgYXR0ZW1wdCB0byByZS1yZWFk
IGFueXRoaW5nIGlmIHRoZSANCmZpcnN0IHJlYWQgZmFpbGVkIGFmdGVyIDEwMG1zLiBTbyBpdCBh
cHBlYXJzIHRvIG1lIHRoYXQgdGhpcyBhcHByb2FjaCANCndvdWxkIGJlIHByb25lIHRvIHJhY2lu
ZyB3aXRoIHRoZSBndWVzdCBmb3IgZ2V0dGluZyB0byB0aGUgVkYgZmlyc3QuIE9uZSANCmFwcHJv
YWNoIEkgY2FuIHRoaW5rIG9mIGlzIHRvIHNvbWVob3cgc3dhcCB0aGUgcmVnaXN0ZXIgaGFuZGxl
cnMgYmFjayANCmluLWZsaWdodCBkdXJpbmcgdGhlIGZpcnN0IHJlYWQgYnkgdGhlIGd1ZXN0IGlm
IDEwMG1zIGhhdmUgYWxyZWFkeSANCnBhc3NlZC4gSG93ZXZlciwgdGhpcyB3b3VsZCBzdGlsbCBk
ZXBlbmQgb24gRG9tMCBmb3IgcmVnaXN0ZXJpbmcgVkZzLCANCmJ1dCBpbiBhIG1vcmUgY29udm9s
dXRlZCB3YXkuIFdlIGFsc28gY2Fu4oCZdCBhZGQgdGhlIFZGcyBiZWZvcmUgMTAwbXMgDQpoYXZl
IHBhc3NlZCBhbmQgYWRkIHRpbWluZyBjaGVja3MgdG8gYWxsIHJlZ2lzdGVyIGhhbmRsZXJzLCBi
ZWNhdXNlIA0KcGNpX2FkZF9kZXZpY2UgYW5kIGV2ZXJ5dGhpbmcgYmVsb3cgaXQgZXhwZWN0cyB0
aGUgZGV2aWNlIHRvIGJlIA0KZnVuY3Rpb25hbCBhdCB0aGUgbW9tZW50IG9mIGFkZGl0aW9uLg0K
DQoNCg0KTWF5YmUgeW91IHNlZSBzb21lIG90aGVyIHdheSB0byBhdm9pZCB0aGVzZSBwcm9ibGVt
cyB0aGF0IEkgYW0gbWlzc2luZz8NCg0KLS0gDQpNeWt5dGE=

