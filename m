Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDkXFxq512l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:35:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDF3CC134
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277607.1562764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqT8-0007gp-Sz; Thu, 09 Apr 2026 14:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277607.1562764; Thu, 09 Apr 2026 14:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqT8-0007ds-Q6; Thu, 09 Apr 2026 14:34:54 +0000
Received: by outflank-mailman (input) for mailman id 1277607;
 Thu, 09 Apr 2026 14:34:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wAqT7-0007dk-IT
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:34:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqT6-0098kY-Qt
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:34:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b904-5cb7-0a2a0a5109dd-0a2a450686e4-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:34:52 +0200
Received: from [52.101.66.125]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b90c-0df0-0a2a45060019-3465427d3ae0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:34:52 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM7PR03MB6516.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.43; Thu, 9 Apr
 2026 14:34:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:34:47 +0000
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
 b=hMcoqb4UuOTb7ZoY+kzXKRypqYxB+J6LyGToejFBdsGxPz6vBzxF8/YgqIvSa1SL/5eJZBRc5K16XxYLogBob8D4+I4N5U6g9jA6jp/LoYk7aNk46Vt6BssmCXYleqRXbYVV5yAvhRjohduCMBSIynlyCN9PX/eMJnXYqKQT7klI8UZyr6F8n1xl+n/KMyGrwPTb9uuY8XYbGU7Q9A7ivQ8QquQQvBKHSmgnegwVzntlIVA4w1lQbSPfrij59+uEZVCub31q39xUBMOmkgSHHlrJCJi1ZoTJ62B8Pqc52FQtY+WJEe+txKjmSiUXPvHGavpNZ/0vLgnbzP6ZU/ZWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4HiwftaM/EHeLjeEkA86c9XaItelNEGdBAgRO06JP4=;
 b=QNvPksEvlZqSX9fkc8Tft6R4VFAiV/RE/cXT3+HRIj9tJx+7Vsb6e9IlHY4/4PpXj7SwELDGxZ3m5zXmAMuMcFKhZiFN2JYdzIIWD+pVi+VfjPWrtzDDVu7tzQdxe5fIp6nE2e+x8ybvEPF8Kt871exu0pr5vOrlUpZ9qWATfooJWAE1AGFxy9i+RcbWRhKzLkeZ1cHJ56+UnfAOyn/+p/kEdqdoLICXukUGygQ8+8bg/+V6R5q5uOgiqjNXF2a5UJmYMhzEr1kYyRRg3OLkL9r59thmrkI6LQ1bhNqiXq+XUkNmR7lgIlMYgCQ6ZXTx8EWFjP8JuVrSXth/NV+9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4HiwftaM/EHeLjeEkA86c9XaItelNEGdBAgRO06JP4=;
 b=jKAhq0mHnqfxYs9a6rnWqjLugQbRz11o6+UDXuud69ChrYI81h2476r6gW8DcABOrsm083DZ6AkV99YDLGgxTx8+AyfjRN8/LlbTSr6nyMfZqzoWifuAHfmVJOvRdSyGKrtCGkSIGg2+7lVxN1DxiabqYnMNjaopfMu8YOeXEBYO7prWTVfTrcpEKl1hTIxwqFoVrjs0zkQbj5aIvot1TOE8FBXUErGLo1YW5gLurSnF4NGbR0oR9gprN9mXjeztk1Bg7V1TxnRZZBp/5DpA3tvmX5JfSXivlHWuayq3ov1krQS41R2Ys666l4mEt5VzAJOT+dma0JQXoAEDW+G0Ig==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcwDy3jsTaF4UzaEqMI3x4mLb6EbXHAQSAgA/aiAA=
Date: Thu, 9 Apr 2026 14:34:47 +0000
Message-ID: <b320e53c-f794-43fc-8095-d5b4b92d7362@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <9ac96559ed00257f347bd61b1e074fc3f6ce8a32.1774871881.git.mykyta_poturai@epam.com>
 <d8622bdf-9ccf-488d-af9a-3eccf6fd3226@suse.com>
In-Reply-To: <d8622bdf-9ccf-488d-af9a-3eccf6fd3226@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM7PR03MB6516:EE_
x-ms-office365-filtering-correlation-id: ab203208-a738-45e9-f36d-08de96452655
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 eeDZeFUSMBcRZhnOJbc4TRa8PXJvGcEEqFsYsH81VjNy5l9v9QSkM9B/UtRynsAjsTqwR0FCf/ms8U3dfa70j0BmDR9i/CNioBlp0nvRP/NHve6Yv9/Tsv7mCElBi6dXUdxa8hOtXJuZwM45EvJmgZ3tkheL+MvZ94sMWTswtLubec+zf6QXMRZ/XVM9LsN2J6oyaLGQrUjgbt5sHy1PZavLh9iFs6nkxCZLkH6sTZ13v2cFgZxzcniLxjDg0H2GEXtLliiljDwyqU/3JpOk0oKIvp29H4oYWZsCfYzm+541EveG7beHkaQbMxxEiDWaGNJbtaHjc6LdwIZTRkUKCxx4m4kxy3RLXMUCJTqnqmUtVtktMsxiS6Q3CkomAM2F31yARb+QSxQF9AuoSI8SJsbuE6BjYMyDIX1QMpNEcDKRvLdkYb71hOj8ZyUZdnRhw/upnVPyAJKDrFjzTTFMXrx8Q9paL67MAK4NVPSooHr0b2n3dzdCXWJk9kpPLG9qGZ3KhM9IOpYr08MaR9w/lhyLtU7qw6g6UXtGj77MJxEP4FzUHu0iHXr17W/qNc98xgvqRPd8g3LZxBc1WkOkkb+lURkdBWK+BX/2YHfzjZxlySr55/F67U791Enep7Pzyd+cCJsNzxOb0zfNJc4eCnyH0TRymGUg+q4almwSfbxZxs90eMFwtB5um0jplQT6KHW2DA2aHZ/DU+F9l2okYBtzXv64tOopGIM8em9sfCvjwmH18PZB45GeuOkjJ5VzIbPRu68jD9OKPGwqGRUnyvtd03+RxQ57I8t96P5kahE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3l0SkxKUlIzU2x6eEcwSW53dW5MUjVXZ25YbDUvdFAvTHgyTEFhVjc1aHR4?=
 =?utf-8?B?WUk4cCtUbTBWVklCSUR0VXYzUzFqckd1d0hacmE5dlJSemk1aGVaRzd0V1Js?=
 =?utf-8?B?Skg0b245Y1c4N3dBczVsUElLZ2dLeklldExjcVJ0OHpxc1Jsbkxwd25xYmNo?=
 =?utf-8?B?N1ZWSGtnNnZmRitRYS81c2lhQ1lWZkpTUzVOam5UaVpQRmF0cTBZWlF2c2VT?=
 =?utf-8?B?bjZ2b0Q5amNiWWZnenNQWkhwTndLOVpEMlB4MEkweldXVDRtby9OSzBJMVpm?=
 =?utf-8?B?ZWxsdWFpQk05SWNlMEhRRk9aY3Z1M2JMZlNoV25kMmNlMisrRkdNS3lzOG4r?=
 =?utf-8?B?Mi80ZXVyMlVyaHVYNmdueXNHN0hmWVJKSytTdm4vOEFSMzFtUnBnaUZKSFo5?=
 =?utf-8?B?SVpsV1lKTG1MZ1J1NmUzQ0p2NUNqZUhyRVdkRW5Wd2xDQnNtWHVDQWZtWFBp?=
 =?utf-8?B?TEFMdFAxZ3V3Mjc1bFV6V3ZEUmZzRFFJQ2IrR0xpdHJLamJ1R0R4RitkSGVY?=
 =?utf-8?B?M3YzdDJwa3N2ckN0MGsrQ0t1SERVTUJGamRDQU1iYU1lSUlSM1BuTHp6WEZT?=
 =?utf-8?B?K1JwNnhzVXRhbEhoYUVndnFwMGR5MjZBQm0wRWRDY2U4OTRoTWhQdkVKMFVD?=
 =?utf-8?B?R0NaQjZxOFMyZkVmNEowVFFRNVg3Y1dJeXk3RGRlc0JCK2REb3JjdTdGdU9L?=
 =?utf-8?B?c05QN3VWdTkxd1NFWmFOb1hlRTg5Vm13dm13MjZYS1NUU3pnMXRTVEpQZUNO?=
 =?utf-8?B?SmMzMWpDU01pOWVzLys5bjVJNGttMDlFMWRadXliSkxGbjI4NHhJUVdTTEpB?=
 =?utf-8?B?dHliZWhMMmFyT281VGIrZ1JNZ29QdlVjUnZDc0VRenpab0pzMHBpaHR6Vmpx?=
 =?utf-8?B?OGdYTnQvTXYxSlNkZldKeldSTXJaaUNac2k3TlNDZHI0eUdtMWhIYnlrMk5D?=
 =?utf-8?B?VktIaStlUlVSd3NQUW50dnpvN3UyWEQwR0VkNEZIcm1RdTViRWdPbHFlZ0R3?=
 =?utf-8?B?bThzVnNESEFpVEtBTGlqcml4OVhZTnhXbVhHTlR3VjgvSDZkYWJiOE13S1hU?=
 =?utf-8?B?cTJwVHZYRnZCRUZMVUM2c05ONTBnT0VVemdLL0dvb2lEMWxZNVFMcnNFTHdu?=
 =?utf-8?B?bVJJY3ZDRG1ITmU0U05zU1QvYzJMUXlLS2lqajBuYWR0UlZxVURXSEl6VG5T?=
 =?utf-8?B?WStMMHdZM2FGdTVEY1cxSVRSeHhOckg3QUdOYVpvQUtMRENHV283a3VpTnpP?=
 =?utf-8?B?OEZLNHpwWmY5dnhibHI3WnNHd0RkcGJDUlVMRko4WGxNaVQzWnBJeDZvdm5R?=
 =?utf-8?B?a2l4V0Jtc2htWVA4azF0SU9SVTVXK004dlFjdjVjaGJubExKYU1aS1k4cER4?=
 =?utf-8?B?WDdoclJFelF3TjZndWhqekZ6VlJ3YmdoTm1OL0wyeVBqK1ppMDA3QnZqQ2Q0?=
 =?utf-8?B?OHNWYUdWbVJGbWVBM0hmUXBDOXhVTVZiNkNOY01WR2VVZGRFclhFanh3T1pu?=
 =?utf-8?B?YUp1VVIybnV1RlJadVptUXNYV1VqS0s5cnVxbUxZK2hKWDVYL2NKQzJRUzl0?=
 =?utf-8?B?NmVWWGJ1SFlpV3JrWWw2ZERabUtPaEl3NmZ0dUo2TzJTWm0rQzVDNWhoQk9i?=
 =?utf-8?B?RHhzeXNIZGd2NFhBQWNKWjRSL1hkcGVibWZjRDFEZnY5NjgxMlhxQzNXMUVz?=
 =?utf-8?B?eEw3a0U2bG1mL3piOXBFaWtKbzBpeUxwUVFsRCt5eEZ1dUpId2p5QXNoRjR5?=
 =?utf-8?B?YzZDcVdEaXBhR0hMUWFVT3Zma3RISGJpV2pkL0RXQ1ZPTmRlL3FDazlWUGFq?=
 =?utf-8?B?eHRlNFF4UlRabDErYzlGbTR1SzVCdzNwRTBaZjI5RWxMVngyT1JzT2FlcEVE?=
 =?utf-8?B?d2ptZ24rZ3VwVVorM0RWVml1U1FFNElJeHcvSzVPWTJXa3ErUW5rZkQrYm5V?=
 =?utf-8?B?WFRBRU1NYXVSU28zbm8zdUE2ekNjTlZjL0JNZm1pQVFwM1FrRFFGUHd1ZnlW?=
 =?utf-8?B?VjVKNzB3cDBaQk5DZVE1Wlh1QmtxUE9yU1lOeFJUQk1rU0duZldjUHdieW1X?=
 =?utf-8?B?OGVDM0xXY29LT0VYdXRQWGFIWHZxY1hObFJua0VUWCtUd3loUlhsNFZwN3di?=
 =?utf-8?B?UEFUeDB6Y2lCU3JTYk1QTktKTXZtTXRmQmJHb1J1eDdVaGdBdmVSS1R3L2RW?=
 =?utf-8?B?Mk1SaHJPQnViR1EzUmRJa1pjbG16bkVVVmpvc0wvMEFvNzRBa0Vocmp4YWR2?=
 =?utf-8?B?S1Bzb2FydDNWbkMvOXRQaERHRmtQR2owMmE4SGp4aXArNEFnUlJmcFY1eGNE?=
 =?utf-8?B?Q0NtK3orQ240ZW9ncWNRM0hCc0xEWjBQdEV6c1JaRVpPd3R3MXVzR2ltT2VU?=
 =?utf-8?Q?U55whrPw66gYQjuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <687F4E62878DE14C9E2BA424CE2CE630@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab203208-a738-45e9-f36d-08de96452655
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:34:47.2759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xslEOua7hd2NgsYe6ibCOVufgMMDnPK6lY0r3jReA5NSDPAc5J6m+bCiu5+TBwMCHpLvCIMXZ/bUZztzaMyBIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6516
X-purgate-ID: tlsNG-16d1c6/1775745292-AED343D8-734C69A3/0/0
X-purgate-type: clean
X-purgate-size: 1812
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C2CDF3CC134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8zMC8yNiAxNToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDMwLjAzLjIwMjYgMTM6
NTksIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+
PiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4+IEBAIC02MzgsOSArNjM4LDkgQEAgY29uZmln
IFNZU1RFTV9TVVNQRU5EDQo+PiAgIAkgIElmIHVuc3VyZSwgc2F5IE4uDQo+PiAgIA0KPj4gICBj
b25maWcgQ1BVX0hPVFBMVUcNCj4+IC0JYm9vbCAiQ1BVIG9ubGluZS9vZmZsaW5lIHN1cHBvcnQi
DQo+PiAtCWRlcGVuZHMgb24gWDg2DQo+PiAtCWRlZmF1bHQgeQ0KPj4gKwlib29sICJDUFUgb25s
aW5lL29mZmxpbmUgc3VwcG9ydCIgaWYgRVhQRVJUIHx8IFg4Ng0KPiANCj4gV2h5IG5vdCBqdXN0
IEVYUEVSVD8NCg0KU2hvdWxkIGl0IGJlIG1hcmtlZCBhcyBFWFBFUlQgb24geDg2PyBJIGNvbnNp
ZGVyZWQgdGhhdCBpZiB0aGUgb3B0aW9uIA0Kd2FzIG5vbiBjb25maWd1cmFibGUgKGFsd2F5cyBl
bmFibGVkKSwgaXQgc2hvdWxkIHN0YXkgZW5hYmxlZCBieSBkZWZhdWx0IA0KYW5kIGFsd2F5cyB2
aXNpYmxlLg0KDQo+PiArCWRlcGVuZHMgb24gWDg2IHx8IChBUk1fNjQgJiYgIUhBU19JVFMpDQo+
IA0KPiBUaGUgIUhBU19JVFMgaXMgcHV6emxpbmcsIGFuZCBpdCBkb2Vzbid0IGhlbHAgdGhhdCB0
aGF0IG9wdGlvbiBsb29rcw0KPiBtaXNuYW1lZCAoSEFTXyogc2hvdWxkbid0IGhhdmUgcHJvbXB0
cyBpbW8pLiBUaGUgZGVzY3JpcHRpb24gc2F5cw0KPiBzb21ldGhpbmcgdGhlcmUsIHllcywgYnV0
IHRoZW4gYWxzbyBtZW50aW9ucyBGRkEgYW5kIFRFRS4gWWV0IGZvcg0KPiB0aG9zZSB0aGUgb3B0
aW9uIHJlbWFpbnMgYXZhaWxhYmxlLg0KPiANCg0KSEFTX0lUUyBjYW4gYmUgbmFtZWQgYmV0dGVy
LCBidXQgdGhpcyBpcyB3YXkgb3V0IG9mIHNjb3BlIGZvciB0aGlzIA0Kc2VyaWVzLCBhbmQgZm9y
IG5vdyB0aGlzIGlzIHRoZSBvbmx5IHdheSB0byBleHByZXNzIHRoaXMgZGVwZW5kZW5jeS4gDQpS
ZWdhcmRpbmcgVEVFIGFuZCBGRkEsIEkgcmVtb3ZlZCB0aGVtIGZyb20gZGVwZW5kZW5jaWVzIGJl
Y2F1c2UgaG90cGx1ZyANCm1heSB3b3JrIHdpdGggc29tZSBURUUgT1MgY29uZmlndXJhdGlvbnMs
IGJ1dCBub3Qgd2l0aCBhbGwgb2YgdGhlbS4gVGhhdCANCmlzIHRoZSBtYWluIHJlYXNvbiBpdCBp
cyBtYXJrZWQgYXMgRVhQRVJUIGZvciBBcm02NC4NCg0KPj4gKwlkZWZhdWx0IHkgaWYgWDg2DQo+
IA0KPiBTaG9ydGVyIGFzICJkZWZhdWx0IFg4NiIuDQo+IA0KPiBKYW4NCg0KR290IGl0Lg0KDQot
LSANCk15a3l0YQ==

