Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEvyHF2c4GnokAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:22:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39340B782
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283084.1565381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHzl-0008LJ-0C; Thu, 16 Apr 2026 08:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283084.1565381; Thu, 16 Apr 2026 08:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHzk-0008J1-TO; Thu, 16 Apr 2026 08:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1283084;
 Thu, 16 Apr 2026 08:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wDHzj-0008Ir-GU
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHzi-00Fofh-RY
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:22:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e09c46-5cb7-0a2a0a5109dd-0a2a4505bba2-32
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:22:38 +0200
Received: from [52.101.69.117]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e09c4e-aaa8-0a2a45050019-34654575b95f-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:22:38 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB9478.eurprd03.prod.outlook.com
 (2603:10a6:102:305::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 08:22:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 08:22:32 +0000
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
 b=SQ56SlUlDhD6Vku9RvhKluP0JXUCySGwvhUoGHG8wBYnVxJEHjrAlOs0kMHhW1lmI1Riu2iKQYUYDR8WkhLcpGQuilc1mV+eIzEkx69HsvVRQH4f7nwow5E2AjqQgWTRSKkiOMcXU1GzsJ4an59ewHTQaCwcKGEIPg6Hz/j0DzAWSDtpm9JK05aJP/9SSrkcMZHw3AiGPvqCeJpk1aHZAMdzJdY7YBrE3Ft4J/LLStjt5rT6BjLXb0XpOXyj2oNZS5nBPguI6aypm5dp7RaTLmfbUXAAk8GzDTgwq38pHHyq/sQ3KDmTyW0G4uRSxP0hNh6Qp6mEujeLJ291l0/dzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOdlTcrJXzFiibxdFJRgpXKFhxgyJoch+FjgdX+thX4=;
 b=s2sLCGf2k1gpUqqzAum5vclawyU0XzYlXXyGA7lpg/nUqOjXYApLyg6y3w5suS2eDhs7P8AD8qmpvPmv10DPSvGW0J78BZYkFOVBIE75/qXwnPiQ2HG/rzqQZ/J4L8pkxyiGiawPexaAwr3cDeLz26Zby53B+7Di52/cU4tEag0c59nQBB72UjZrxEHoHAG2m8srWPjM7Tn4K5FvKwAN5U8wKDrfgjMaLh9rPhWQ7nhqvkBJgXAFzok3VPPmkijuXbep3HBOvyX+OLt0c3IIh5bk4BEKkCbuLwi7hCgt6f7aRZSUHorptIiSfla4SbX7yhPSX4ljDCb+A/9gXqe9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOdlTcrJXzFiibxdFJRgpXKFhxgyJoch+FjgdX+thX4=;
 b=DziRUbplZ4Bw9ZjPgU/H/5igOpdISllGKFhLWkb8hzQhj3Kk/9nMbkq5JJqXoAyJnb07DZqnp71I71N7Yn31uhcD8w6Dx3PhbSnxnpDOjUJUBm5r32Gd5YzSPGutONPvqhYdHCz5ee/vOkhMrobmDjOeNJRAq9zWujpJw0hR4KnG70OUBdTOkWXnvmtyM6Nuj1DwRbApU6rPB8yCuvw/P9+F7PpCFLtmFY7A/NyaX7MM/89a8LQaFw1xjPR7Hagt1Oelw1Hm3MqIDeXxMJTNcRWnJ6G/V1ybVeAf6g3Dk609GSzQvk7Uec/r/C4p0qm6XkmmaTSGggwm5mMUJcLhxg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcwDy3LJnr4T20vUWAas874pXmi7XHAiYAgBlL+wCAAQu/AIAAGf4A
Date: Thu, 16 Apr 2026 08:22:32 +0000
Message-ID: <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
 <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
 <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
In-Reply-To: <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB9478:EE_
x-ms-office365-filtering-correlation-id: 46116a25-ae80-4044-511c-08de9b914ee8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 wXgIgIhneSGymzCOQ1aQHoFZ422tqf/RwJD8vRmHzsfCwDFjXECufk8ucirbGF7wHEeCw4w8sajLEQo8sFhRou8rViM8vc7QGxl1j8dYnKewdbrsj8KqtTZFZzJK3L0dVTkkBSy7IiIYmf8DDVLH/z0+/08eUbcQnC7wRwc8IwJKmOAMq0CNXeMV3rMIV2+ypz3SGOoW+XNju2xU/hmfyRH1QEmWQyZUVokYKY7jeJvu6bjBoLm4M9jzIxKAoKrhvVRlgHQiNDjjjcv38hd3v4rYQY1+lh1pCJk3Hl1tRjerQOpz2V+7z1gQERrijAva6+lnBXKiAJWMfv2fTvGjLdY44o8SSZYiMBGmxDUJ77OuaRN0KDeS8RAfuVTT5Pyif6ova1TlWANTxBG25kyUwD9MN3/REG5yZd7b69Wr0s/esGHMrfRRlJNyqPHn5L1JNn05U2xDtmbvf/K7aHvS/znp+nSRLqi8TC31UyHUTv4Fi53QqNGfUQyuROQlhawBJ/psQ11xkXWBurS9chT535LGYFL1i/Me4IE5eQm3Acglqjo39e788D01Jo5PkYMVjXoffn9ezdR1S80L5lcQbJ3CEP0Ic0BwpyuYD6aJkSZbg/DiZT0f80GwrcitZ7+O5YYh5QTF/So93fw1CSCQf1K+bx6ZkdpMW87+cjQ0WAyk9wPXwg+JdZJGFdD7O5Tkam5L+NECshhbQek7QXN9F1gjICJ5mzXsLJ6aOCLpUjCZerOO4UVN0RxnnyM71ypgDNbT7SMyUbMhobiz/L3fVBdZW2Ex0uMHGDEPU92DVyU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXM1QzNteHRHdFJRUlorWkdrMW1yWjFNeVlQOGgwUjZmeDVEUzM2OU9JQldG?=
 =?utf-8?B?NG9BTXI2NEZvYzMxNzVvM2Y0RHZEZDl0eUwrRzl4WGdiRXdxcndENy83Y1By?=
 =?utf-8?B?UGlwenI2TktJOGtaQlJXeTRtbUpaMUQxdFUxZWIyc2xhbEQ4UXpMMzF5SVhU?=
 =?utf-8?B?RjlueWdSTGVBaVNwR2xlM1BHVXl1SExUSDRWVk5sWUZCVTRWTHg5aUt3V2Vv?=
 =?utf-8?B?YUhVajNFUDVtRDlUWXFFa2VPRGY0d25YSG9sWkZDczhYaDgyQmorS2E2enZD?=
 =?utf-8?B?QVkxREREbWZWa3NGWTFFbHRkM0dKTDE1YzEvTmwwODdCWkl2WXY3Y0xOWStr?=
 =?utf-8?B?b1Z4R21yeGdhSm9ieElPNWthVko5cVJKbEFZbm9EOTFweUVCSjlDUndvVHlV?=
 =?utf-8?B?WENLb1JSMlluUW0vZ1dKenV5Nk1VRklFbFl1SjlYQVVTVGNlN0FEbDVCbi81?=
 =?utf-8?B?NDZCSUR6NVRCWVl6b0d1UkwzNWd4NGZya1JKOU9CcUp0eXEwSzJnSXAxL1V5?=
 =?utf-8?B?VGRxRUlPTmg3cGJLWUNIaFRlc09zM01sRW52UHVxaGhobVVaMnlmbDcyRDZ6?=
 =?utf-8?B?MWxheDIyQTR6NFo0TEdheklJS2JHYUwxNkc3SjRZck9tMnREbm9UdGhwNU5X?=
 =?utf-8?B?T3lFRVlmbmdLTEF4K1hoUlJTdjJJVXJyL1dhWURXellwdEdwa1oxbjFQOWJ4?=
 =?utf-8?B?Mml5Q0pwYjRKTHZFQUczOUUyOVVCR3FXMVdrNkNyR1JpbE9hakZJS0Mwbkdl?=
 =?utf-8?B?eVNpYnZ4dEQ4TUYzcVFEVTBVUDI1bWR2dEJYRG15cTNaSHBXcUVPSUhhZDFN?=
 =?utf-8?B?bWdzdWNDNXpucDkzbEZ0dnBpMXBaZ3BzNVkrdmtXK29KV05mdWwyd3A1Mk16?=
 =?utf-8?B?aTJORFpWdnVJcXhrYzZLRCtUMWJWRmxzQVFaeGJKUUFYR1owNlRTWmJPb2hz?=
 =?utf-8?B?ck5JVnp3ekxLK0FkdkZXVkNoY1RTOGpDMHUvRy9BS2RYNG1BK3MrdlE1bEZB?=
 =?utf-8?B?azFFYXptelVQeTlnNm5rSnZFNWljL3IvVU9sQVVWakZoYnpyQ092emxYcUk0?=
 =?utf-8?B?KzVBa2UxNW4vdUR3ZDg0SkRZMnJ0R0pwWW5Ta1BtdlZHWmJ2VVNCWFVpNC9z?=
 =?utf-8?B?bkh1ZUluMk9GZXhWcnU1MzZ0TnFwWm4zbFdscWpNV1cwak9jcXdkdTZwSjc4?=
 =?utf-8?B?RGpsaGJUU05VK2ZvenpNREJuVzIxWlI1aUFqeVVkbFI2bGQ2ZGlxMmtXTVpH?=
 =?utf-8?B?TStIbTRlbC9HY3JReUszaUxhZURVQ1lEUmpXYmRsdXo4UEo4bExMd1dUSldx?=
 =?utf-8?B?aVloOGpkTkRXWHNEbXRvWVpJeVRwVG9TQ2pLVWxUVGZrRnNNTzB5a1g4RjQ1?=
 =?utf-8?B?OGIxb091VzN4Z3VrVHZBWmV0MHVpaDVUU1lYOFE2ZXh2a0J0N2hNSG1JUmI3?=
 =?utf-8?B?NWdnNkF2YVp4c2FwTXRMZC9TYkg5aS9KUkJzbGhWcFFVVllxMy8reHhuU3M0?=
 =?utf-8?B?MFJZamxxL0RzRDdVWllFMnM1SG4xUFIxVDhkWHZ4akFFRm8wZ1pzRjlZV1Jh?=
 =?utf-8?B?TTZKaDVlSzdpQXRDTjh5R2pCT0N6dUphb3Jwem1XVFlCNUVsL3JvYjFrdkRp?=
 =?utf-8?B?YWgzR2kxRUlTZjFrdUF2YU5CSXpUSVdjNnh5SUFteUhqNXM5UjB1Tlp3Wkx5?=
 =?utf-8?B?RWREYU5tVUNRd0FDZERDbjJRODNsY1QyaXFkTlZPQkZRZmV6YVBrTCs5TTdN?=
 =?utf-8?B?R3YxK05hQlhlQktOVDZEUXBnY3pzb0xhY0FoalI2ZDE2WjNhU2JCcEVYRmJM?=
 =?utf-8?B?bWhxc2hZWWE1Skk5SzlrTk9XemVObmtMMEZBYlIrMlFMUm9CaEJxZGk2N2hE?=
 =?utf-8?B?N0taMXplRkIydDVOd2p5VTFYWjJPb040OWQ2RTVGWWUzQnlUS004Y28rZTlQ?=
 =?utf-8?B?Um5qb3E2T0hPQVRuQnpZcm9pdTA1UkpKMDYzQi8zVkI4TGNSQ1pubW1WM3pM?=
 =?utf-8?B?QSttZVpKQllvNXhTaDkxaVdJS2F1RnBtMzdldGo0S0p0cUZQZzRHVjZnVGtZ?=
 =?utf-8?B?aWw0UHRMamhuZ1pQNjhBWW5rQnFuLzE0TTU1cFdTdElhMG44U0hKc21ud2Zz?=
 =?utf-8?B?Q1kvc2hxLzl5N3B0bDFPZ0F1MHkrR2FOZk43cXdFaHk0SEgwNjRSOUVpWXJ2?=
 =?utf-8?B?c1RSSTFXODIvU0FUQXFIQkhLZ2tOcHU5T3BPNnkvOTFPMHN2NFpVbzBsNUtQ?=
 =?utf-8?B?VS9lL2E5R01LQkhwbWVyQjZBY0NPbkRvZkhYdEtxamZRbHNqdVZtUUxJU1A3?=
 =?utf-8?B?NG91Ky9sYVpDd2tIaFdCam5PcmF6cDlSTGtmcnlITUhDKzdLUHVGaDRERkU3?=
 =?utf-8?Q?L35onvDD48PV0CHw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A00936AB8666A4FAEE79DA8E29C1124@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46116a25-ae80-4044-511c-08de9b914ee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 08:22:32.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlr4yIvfbwqE5ICYkfVTooJxAX+zM+MSb2Aa5/pi44yfwcuw7k7CH1wHsYfBKeYsEwN3ftv+qlfxF6BOCEiPGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9478
X-purgate-ID: tlsNG-c201ff/1776327758-2AB68443-C60B5887/0/0
X-purgate-type: clean
X-purgate-size: 4160
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C39340B782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xNi8yNiAwOTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjA0LjIwMjYgMTY6
NTEsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gT24gMy8zMC8yNiAxNTozMiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMzAuMDMuMjAyNiAxMzo1OSwgTXlreXRhIFBvdHVyYWkgd3JvdGU6
DQo+Pj4+IFdpdGggQ1BVIGhvdHBsdWcgc3lzY3RscyBpbXBsZW1lbnRlZCBvbiBBcm0gaXQgYmVj
b21lcyB1c2VmdWwgdG8gaGF2ZSBhDQo+Pj4+IHRvb2wgZm9yIGNhbGxpbmcgdGhlbS4NCj4+Pj4N
Cj4+Pj4gQWNjb3JkaW5nIHRvIHRoZSBjb21taXQgaGlzdG9yeSBpdCBzZWVtcyB0aGF0IHB1dHRp
bmcgaHB0b29sIHVuZGVyDQo+Pj4+IGNvbmZpZyBNSUdSQVRFIHdhcyBhIG1lYXN1cmUgdG8gZml4
IElBNjQgYnVpbGQuIEFzIElBNjQgaXMgbm8gbG9uZ2VyDQo+Pj4+IHN1cHBvcnRlZCBpdCBjYW4g
bm93IGJlIGJyb3VnaHQgYmFjay4gU28gYnVpbGQgaXQgdW5jb25kaXRpb25hbGx5Lg0KPj4+Pg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5j
b20+DQo+Pj4+IC0tLQ0KPj4+PiB2Ni0+djc6DQo+Pj4+ICogbm8gY2hhbmdlcw0KPj4+Pg0KPj4+
PiB2NS0+djY6DQo+Pj4+ICogZG9uJ3QgY2hhbmdlIG9yZGVyIGluIE1ha2VmaWxlDQo+Pj4+DQo+
Pj4+IHY0LT52NToNCj4+Pj4gKiBtYWtlIGhwdG9vbCBhbHdheXMgYnVpbGQNCj4+Pj4NCj4+Pj4g
djMtPnY0Og0KPj4+PiAqIG5vIGNoYW5nZXMNCj4+Pj4NCj4+Pj4gdjItPnYzOg0KPj4+PiAqIG5v
IGNoYW5nZXMNCj4+Pj4NCj4+Pj4gdjEtPnYyOg0KPj4+PiAqIHN3aXRjaCB0byBjb25maWd1cmUg
ZnJvbSBsZWdhY3kgY29uZmlnDQo+Pj4+IC0tLQ0KPj4+PiAgICB0b29scy9saWJzL2d1ZXN0L01h
a2VmaWxlLmNvbW1vbiB8IDIgKy0NCj4+Pj4gICAgdG9vbHMvbWlzYy9NYWtlZmlsZSAgICAgICAg
ICAgICAgfCAyICstDQo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9ndWVzdC9N
YWtlZmlsZS5jb21tb24gYi90b29scy9saWJzL2d1ZXN0L01ha2VmaWxlLmNvbW1vbg0KPj4+PiBp
bmRleCBiOTI4YTRhMjQ2Li4wM2RmY2VlN2ZhIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy9saWJz
L2d1ZXN0L01ha2VmaWxlLmNvbW1vbg0KPj4+PiArKysgYi90b29scy9saWJzL2d1ZXN0L01ha2Vm
aWxlLmNvbW1vbg0KPj4+PiBAQCAtNyw2ICs3LDcgQEAgT0JKUy15ICs9IHhnX3ByaXZhdGUubw0K
Pj4+PiAgICBPQkpTLXkgKz0geGdfZG9tYWluLm8NCj4+Pj4gICAgT0JKUy15ICs9IHhnX3N1c3Bl
bmQubw0KPj4+PiAgICBPQkpTLXkgKz0geGdfcmVzdW1lLm8NCj4+Pj4gK09CSlMteSArPSB4Z19v
ZmZsaW5lX3BhZ2Uubw0KPj4+PiAgICBpZmVxICgkKENPTkZJR19NSUdSQVRFKSx5KQ0KPj4+PiAg
ICBPQkpTLXkgKz0geGdfc3JfY29tbW9uLm8NCj4+Pj4gICAgT0JKUy0kKENPTkZJR19YODYpICs9
IHhnX3NyX2NvbW1vbl94ODYubw0KPj4+PiBAQCAtMTcsNyArMTgsNiBAQCBPQkpTLSQoQ09ORklH
X1g4NikgKz0geGdfc3Jfc2F2ZV94ODZfcHYubw0KPj4+PiAgICBPQkpTLSQoQ09ORklHX1g4Nikg
Kz0geGdfc3Jfc2F2ZV94ODZfaHZtLm8NCj4+Pj4gICAgT0JKUy15ICs9IHhnX3NyX3Jlc3RvcmUu
bw0KPj4+PiAgICBPQkpTLXkgKz0geGdfc3Jfc2F2ZS5vDQo+Pj4+IC1PQkpTLXkgKz0geGdfb2Zm
bGluZV9wYWdlLm8NCj4+Pj4gICAgZWxzZQ0KPj4+PiAgICBPQkpTLXkgKz0geGdfbm9taWdyYXRl
Lm8NCj4+Pj4gICAgZW5kaWYNCj4+Pg0KPj4+IFRoaXMgbG9va3Mgd3JvbmcgdG8gbWUuIFRoZXJl
IGFyZSB4ODYtc3BlY2lmaWNzIGluIHRoYXQgZmlsZSwgd2hpY2ggc2hvdWxkbid0DQo+Pj4gYmUg
YnVpbHQgb24gQXJtLiBBbmQgdGhlIG5hbWUgb2YgdGhlIGZpbGUgYWxzbyBkb2Vzbid0IGluZGlj
YXRlIGFueSByZWxhdGlvbg0KPj4+IHRvIENQVSBtYW5hZ2VtZW50Lg0KPj4NCj4+IHhlbi1ocHRv
b2wgcmVxdWlyZXMgeGdfb2ZmbGluZV9wYWdlIGFzIGl0IGhhcyBib3RoIENQVSBhbmQgbWVtb3J5
DQo+PiBob3RwbHVnIGNvbW1hbmRzLiBXaXRob3V0IGJ1aWxkaW5nIHhnX29mZmxpbmVfcGFnZSBp
dCBmYWlscyB3aXRoDQo+Pg0KPj4geGVuLWhwdG9vbDogc3ltYm9sIGxvb2t1cCBlcnJvcjogeGVu
LWhwdG9vbDogdW5kZWZpbmVkIHN5bWJvbDoNCj4+IHhjX21hcmtfcGFnZV9vZmZsaW5lLCB2ZXJz
aW9uIGxpYnhlbmd1ZXN0XzQuMjIuMA0KPj4NCj4+IHdoZW4gdHJ5aW5nIHRvIGRvIG1lbW9yeSBv
cHMuDQo+Pg0KPj4gSXMgaXQgYW4gYWNjZXB0YWJsZSBiZWhhdmlvcj8NCj4gDQo+IEkgZG9uJ3Qg
dGhpbmsgc28sIG5vLiBUaGUgdG9vbCB3b3VsZG4ndCwgYWl1aSwgbG9hZCBhdCBhbGwgdGhlbiBp
ZiBidWlsdCB3aXRoDQo+ICJiaW5kbm93IiBlbmFibGVkLg0KPiANCj4+IElmIHNvIEkgZ3Vlc3Mg
d2UgY2FuIGJ1aWxkIHhnX29mZmxpbmUgcGFnZSBvbmx5IG9uIHg4Ni4NCj4gDQo+IFdlIHN0aWxs
IG5lZWQgdG8sIGltby4gQnV0IHRoZSB0b29sIHN0aWxsIG5lZWRzIHRvIGJlIHVzYWJsZSBubyBt
YXR0ZXIgaG93DQo+IHNwZWNpZmljYWxseSBpdCBpcyBidWlsdC4gSXQgc2hvdWxkIGF2b2lkIHJl
ZmVyZW5jaW5nIHhnX29mZmxpbmVfcGFnZS5jDQo+IGZ1bmN0aW9ucyB3aGVuIGJ1aWx0IGZvciBu
b24teDg2Lg0KPiANCj4gSmFuDQoNCkFzIEkgdW5kZXJzdGFuZCwgdGhlIHVzYWdlIG9mIGFyY2gt
c3BlY2lmaWMgY29tcGlsZSB0aW1lIGNoZWNrcyBpcyANCmhlYXZpbHkgZGlzY291cmFnZWQgaW4g
dG9vbHMuIFNvIEkgZG9u4oCZdCB0aGluayBpdCB3b3VsZCBiZSBhcHByb3ZlZCBieSANCnRvb2xz
IG1haW50YWluZXJzLiBEbyB3ZSByZWFsbHkgbmVlZCB0byBvbWl0IHRoaXMgZmlsZSBpZiBtZW1v
cnkgb3BzIGFyZSANCmFscmVhZHkgZ2V0dGluZyBibG9ja2VkIGJ5IFhlbiBvbiBBcm0gYW55d2F5
Pw0KDQotLSANCk15a3l0YQ==

