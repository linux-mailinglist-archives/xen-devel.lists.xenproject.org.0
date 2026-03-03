Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGwHOsH5pmk7bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:09:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE41F2181
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244878.1544235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRND-0001Kw-Lt; Tue, 03 Mar 2026 15:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244878.1544235; Tue, 03 Mar 2026 15:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRND-0001IM-IC; Tue, 03 Mar 2026 15:09:23 +0000
Received: by outflank-mailman (input) for mailman id 1244878;
 Tue, 03 Mar 2026 15:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwqp=BD=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vxRNB-0001GQ-RQ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 15:09:21 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3840f2e-1712-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 16:09:19 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by PH7PR03MB7416.namprd03.prod.outlook.com (2603:10b6:510:2f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:09:15 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:09:14 +0000
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
X-Inumbo-ID: f3840f2e-1712-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYb7psW1B0Kwq5gm/OC0OO6XcIZ0B9/48wosGeZapDERuZ7uNU6QupMs3xG9i105neJyjtBIJX9JTmmlrGXVW63xKOQ4587VjmR50XTrvmT+L1JWpJUdrwj2FGNaySXm+EJ1lBzuUji859Kx9pDFbwz4mjkj83+QBSlulBo73PyiRiWQdt3AA3xf14SBSskuJDfmPfU8XxKJcvOGkpi16ncqrRKanXALTxjCdtZdIumF+3fffnZ3PRgIddJqgwnNyas0hruQqc2zF8puttMnERA+/GbuuFgg8UVTPJsS+QMpqGYBrppKyHQXpLZr6c8uvJpqto3uWV4/bUi2IWT3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgbmO7zRl+U0OFXcYkuqQLUwYhfPPxpJt2W+xf5q6pU=;
 b=AdmoaKbjRXDxmkbOvLWnvnFo1Ab9OTJhlUMprDpWkK9GZ49/PgD9tPMROfh0NXJjLPB1dh40odeCCsHESWcGahTzmY68VigQvRZ/F7S7GbjgeAvNKm8VK/uRYDqGDF5mVI8/EsSUQKeYLH8An+zeYUTv8KH2zoVPaBekSWEqs8yQ6uVlOLt+XXBv9DXkU/5EgCMzi08Lz0Pr1Y1gUCjTjHhDt3H0vdYxwwsNOOT4wZZI8XuPEV9/lB2ibPQf1q2qd5z00dIvtA70KuDVa700VECL+WttEsdoMREV3qg9dDOzAkFTFVZySdDsNHrFZlTUtlay2reTLnGvMpjyqae8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgbmO7zRl+U0OFXcYkuqQLUwYhfPPxpJt2W+xf5q6pU=;
 b=tc4bA8UHyYHXh0hYpT49A+Wtvbz8z+jHOXIjiC/XJqFEbt/7/e7ciH8RiMGASCUryPPzS5ZMOOX0N6tsbu7lCqiSlJvUC8y7NepE8NgrViZvQnupt9VxLw78yVvqQ5eqmPV8i60+Jxi2ikuKmLMqNkYQgpJTIEWmpvLrUVDqDuw=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Topic: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Index: AQHcp9gBGAcR9pePk0GnYyu6dQzUZLWc3C6AgAATegA=
Date: Tue, 3 Mar 2026 15:09:14 +0000
Message-ID: <B5EFCE28-79BA-403B-8F44-C4E7606BACE7@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
 <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
In-Reply-To: <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|PH7PR03MB7416:EE_
x-ms-office365-filtering-correlation-id: dd98ad93-ccf4-4834-3332-08de7936d55a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 tslpIczhbeZZYJFmM0VDOYkaGpfJa9m7Y7x3SPHAKWlRnmalID5mkGuCDJeYegxlSKE1Sk4P82MSDjg0EIhnviGc9fmi5W871IVqKzbOn9+zlaQ8gzQWQfmGX4bzQXW2y1d/f9MAKgdQRLtpUJBoGoY1/LVT1AeAX16+x2LlXG08LJ8lPLeD0V5nVhceYfQ8iQTrMpuJTRwwG/+ZM4L6DikJfG+tUnzAqhQo8PzyNiwVlzerqwLYvpn8baakyGcg+7Ij8iGvCbt82rBDuY8a+jeSQPExWEw8TvFQHbbbXSKuyyFjpx9jG7R2+hjdX0NK9yJnjvEXh2sqyRY2f8gshL08u8BtFXbgkH0GDOfVxmRoiPLmP0WLcN5Mw45wjituSoHfkO81B9Pk/+2PCNbIgX8kDX917gzWj9n6qwIfq+7zsExTg585PXPIEvAp8p5K7K4yfiRGgf5bnTkIYF5Tbyhcf7whEyklQV/fqt/bZt96mJTbl4MEqR3POhqN1Jj9m14F0n1lrxbpmlcXJUX7+WuJvdqdXbEP1tnEM1ovWBPgJpbEZL1qn3jRbtI7/JhFaSkuC/fDGmTyXq56k0IIubOs+mPWqHdyS6Zvq2nM6/8yIuHJpCzn0xHtykF2wTkSMzKBBVK13lusVHu9EcYoK4B+8NKq0oGyGH9ulJhXNySFZW4fwwLov9wtNHMP/BIVLBgzkU7t8Oz9Yjok6cHb00SONH9qi0u+/K6FeUQx07hHXKbByjIDrRGlPgM+1lsSoK0c+mSKLN2iGZ62zZsUiuiE/VWWoyl1KTkXvmrNbt4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2F4RHpDQUN0bzZQYTJoS1g0OWtpaENpUHVOUFFQL1JlNEs4QnV6QWgvb0V0?=
 =?utf-8?B?MHN6RXlJQzdINDdSbDRkdEp5eEYvaVVLWmtib1N5UzZkTTFEUVN4VnNrRE10?=
 =?utf-8?B?eldkaEk0d1FRY1pHaGVUdVkwT1VObnFaU2xLa0g2S0Nzd1d5QUZDcFJWOVY4?=
 =?utf-8?B?dzRINlJLSmRvbWhFRWhzVkRsNDBsemRQUDFTNHpXa2FwRnZ1ZDhJVXdjRWgz?=
 =?utf-8?B?eFhMWm1NVmFBa3JNRTVLQlloUnBzMEVVUDI5OHJPSkNLbDVMY0xpMndBOG44?=
 =?utf-8?B?ZncxMkZxSk1xWUJQK21yTXVvaVhuNFRrbkFOVVlNTDJVZjhrZ0xtNnNSSWxC?=
 =?utf-8?B?alV0SSt6aFU4TW1ZODNEU094Vy90WlVGY041V0FSM2pQOEpTdEtGMDkvZXo5?=
 =?utf-8?B?dnJoMFNySHZmRGpHOXhJOHA3U0lRdlhURWE0d2s1Mnd4U1J5Q1VIN3oyd0VU?=
 =?utf-8?B?eVM0RFpoMWsrL3RLSmc2Z0JDRHN2M2xHRmJrS3JOblFYZmlrNU8za0p1U2Q5?=
 =?utf-8?B?VDNjQUMreWNvTkw0Yy9TYkZrY09pYjBTNTNDWnVGN1phMzVCcXhZc0ZqbGNY?=
 =?utf-8?B?OWgxUVM4L3ozcU5YN1l4WlhlM1VkUDdoSEdaMzhPVG5NWEZkYlNCS0hWcnVL?=
 =?utf-8?B?WVNNREh6Q2lRckcyeFJ3SVNGQkV3dDZHRDlSQUxHcmM4MnF6M2x6ZUNTdHdy?=
 =?utf-8?B?dFplK3NtZ3lMcDJpekxQS0tTUGZjd0VQbU4vWEhZeWdxR0plaXNhaGNkbEVz?=
 =?utf-8?B?SjNLZi9ETitWbWVybERRTldCN1YyUHU0dExYQXdHN2ZBNjhINHg3Q0hHYmo1?=
 =?utf-8?B?WmJYT0RWTmU3RWJaSmxGOERxY0J1NjloemI1TUFvdnM1M1RmTjlQQ3kyWGxv?=
 =?utf-8?B?TDFBbk9MV0huMC90V2FvaEFHRUg5MmNBUDEwWlRGWThwRGVHNklnL3NreThj?=
 =?utf-8?B?ZjBveXp0VjNPV2JXenExZTBLbXNTQ0hRejF2R3YxdEFjdHZsTlpFSlBtM1Bs?=
 =?utf-8?B?Z2diNUgyd2pvQnU1MGVUQUlBZlZ1cTlmZ0dCVGs2RFRlbFJPN3JUc1J0VUtY?=
 =?utf-8?B?WWRyQjl5R0dXZ1NhZWZhU0dna2JYbWZDcE1ZNUNDRjVTZjRieGpsRlIwVzY4?=
 =?utf-8?B?dGorQkExaEt5bFpkMkZjNUVMZmdiYzJ6R08xTkg4Unk1MnNsRU5ob1dYVEoz?=
 =?utf-8?B?VzF1YlN6dkljcFhXOFY5VzJQTmlLdDM3MnJlekJ6a1hHdFdoQmxjamg3VTdD?=
 =?utf-8?B?WHFQYXEwS3NjdXEya21VR0w4cXh4dk92aUdtL0RDZ1Rhdk9KeVQvbFFRM1Zq?=
 =?utf-8?B?SXJITFdXZGVwWkZFRWpmMFU2bWdXMHhRamo4dC93czQ1Sk9MTnd1MDYvMWtG?=
 =?utf-8?B?a0lxNkJTWnBOaHkxcXFqWXdaSWJzUkllWnVONkpkYUFDMU8zdVhSbllKYWx4?=
 =?utf-8?B?QmlPSVVaZXVFOVBLajM3QWR4Z3V6NklESnhUMnFtQU9JK1NEM1BsckNyb3U5?=
 =?utf-8?B?QkoyUi9rcC9sek1FeHJSSVhsVnVSWTRJdUlEamk1N2NxM1pxQXNxbTFYTE5a?=
 =?utf-8?B?TzRuaUZoWExscEJFV2hhOGVkK3NRa0YvbWU2ZUFRd1l5Y2JYK0RZSVZCVjZD?=
 =?utf-8?B?UWdReCtRRzk3RWx6WldOTEl1LzJTWllYVG92L1BiRGF5RHBKMnhHWi9JSk9E?=
 =?utf-8?B?TkFTMmVoSXpZaWJnRStaSklEa1lRR0VBR0NBMG51RVk1cmJpV1cwaVdUdURV?=
 =?utf-8?B?a1BOUnRydkcyZXlHZXNsTHhxbmwxYjdPTmZZRmJPVWk4SkhucnY0YnhaMmx0?=
 =?utf-8?B?ZzVIc3RwdE84QmJ6UURnZnlWV25HN241U3lwb3c2cmZldWFDaXU4QmV2V1I3?=
 =?utf-8?B?ZS9zUkcrMWk5VjlxOHdqL2FENkFzRG80Zlh3bGdnRFk2WGdTdnFQZzRScURy?=
 =?utf-8?B?UXhsVDlyeWl2MXJvWXBMbkx2enhjWUJNbGxoQy9rRytwZ2ltRWtLWFpNenFh?=
 =?utf-8?B?ZGl6WHlBWXlXVU82S3dmZ0pGc0ZVd3BuSzFNSkNYM1ZubGk2Y1pLVjVXTlBM?=
 =?utf-8?B?Q04wZGdDYjNxSEJLSGJvWTM2OUcxRU94M0RiZkwwM3prZitnejRlZHdGSHVI?=
 =?utf-8?B?WlQwRE8wK2xER3VubWVHd3NBdmxneWdyT2ZzRG9yVnYrR2V1T3BLNkF6cnc5?=
 =?utf-8?B?ei95K0pWTzZnbEY4amtzZkJvWEVrMTl0SVFZbGRmS09mVktuMXNuSmJmS000?=
 =?utf-8?B?cVZRVVVEMWNPNHZMOC82LzVzQ2VQcW5UdDhGKzQvRnF5bWlkekZVamVFR3Zj?=
 =?utf-8?B?KzFuVmM4RmlqaGQzZDVrSG9YOVo0OEVKSlVML25yWkEyUktEVG9qMVZKQUlz?=
 =?utf-8?Q?WX+2RsApqvsjxV44=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06488F99EFA21A4CB374663815975DE5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd98ad93-ccf4-4834-3332-08de7936d55a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 15:09:14.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKx0BYjRCgffVYKd+qoOYoCgf3AySG0gsr3fCU1/VumXt275Vot9zsoWI0DWc2kIR/6FbBrW4QVhcDeLeGjbkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7416
X-Rspamd-Queue-Id: 5ABE41F2181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gMyBNYXIgMjAyNiwgYXQgMTM6NTksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNy4wMi4yMDI2IDExOjU4LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4gLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9y
LmMNCj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5j
DQo+PiBAQCAtMTg4Miw4ICsxODgyLDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikNCj4+ICNkZWZpbmUgZGVjbF9pbnNuKHdoaWNoKSBleHRlcm4gY29uc3QgdW5zaWduZWQgY2hh
ciB3aGljaFtdLCBcDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgd2hpY2gjI19lbmRbXSBh
c20gKCAiLkwiICN3aGljaCAiX2VuZCIgKQ0KPj4gI2RlZmluZSBwdXRfaW5zbih3aGljaCwgaW5z
bikgIi5wdXNoc2VjdGlvbiAudGVzdFxuIiBcDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgI3doaWNoICI6ICIgaW5zbiAiXG4iICBcDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIi5pZm5kZWYgIiN3aGljaCJcbiIgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICN3aGljaCAiOiBcbiIgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICIuZW5kaWZcbiIgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc24g
IlxuIiAgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuaWZuZGVmIC5MIiN3
aGljaCJfZW5kXG4iIFwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuTCIgI3do
aWNoICJfZW5kOlxuIiAgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuZW5k
aWZcbiIgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi5wb3BzZWN0aW9uIg0K
PiANCj4gTmljZSBpZGVhLCBidXQgd2h5IG11bHRpcGxlIC5pZm5kZWYsIGFuZCB3aHkgZW1pdHRp
bmcgdGhlIGluc24gZXZlbiBpZiB0aGUNCj4gbGFiZWxzIGFyZSBhbHJlYWR5IHRoZXJlIChhbmQg
aGVuY2Ugd29uJ3QgYmUgZW1pdHRlZCBhIDJuZCB0aW1lKT8NCg0KSSB0aGluayB3ZSBzdGlsbCBu
ZWVkIHRvIGV4ZWN1dGUgdGhlIGluc3RydWN0aW9ucywgc28gdGhleSBjYW4gYmUgY29tcGFyZWQg
YWdhaW5zdCB0aGUgZW11bGF0b3IuDQooRXNwZWNpYWxseSB0aGF0IG9uIHRoZSAybmQgbG9vcCB0
aGUgaW5zdHJ1Y3Rpb25zIG1pZ2h0IGdldCBkaWZmZXJlbnQgaW5wdXRzLCANCiBhbmQgdGh1cyBw
b3RlbnRpYWxseSBwcm9kdWNlIGRpZmZlcmVudCBvdXRwdXRzKQ0KDQpJSVVDIHRoaXMgd2lsbCBs
b29rIGxpa2UgdGhpczoNCg0KLy8gaT0wIHVucm9sbGVkDQphc20gdm9sYXRpbGUoIC8vIC4uLiBm
aXJzdCBpbnN0YW5jZSBkZWZpbmVzIHRoZSBsYWJlbCBhbmQgaW5zdHJ1Y3Rpb25zLCBzdG9yZXMg
cmVzdWx0KQ0KeDg2X2VtdWxhdGUo4oCmKQ0K4oCmIGNvbXBhcmUgZW11bGF0aW9uIGFuZCBhY3R1
YWwgZXhlY3V0aW9uIHJlc3VsdHMNCg0KLy8gaT0xIHVucm9sbGVkDQphc20gdm9sYXRpbGUgKC8v
IOKApiBzZWNvbmQgaW5zdGFuY2UsIGRvZXNu4oCZdCBkZWZpbmUgdGhlIGxhYmVsLCBqdXN0IGV4
ZWN1dGVzIGluc3RydWN0aW9ucywgYW5kIHN0b3JlcyByZXN1bHQpDQp4ODZfZW11bGF0ZSjigKYp
DQrigKYgY29tcGFyZSBlbXVsYXRpb24gYW5kIGFjdHVhbCBleGVjdXRpb24gcmVzdWx0cw0KDQpJ
ZiB3ZSBkb27igJl0IGVtaXQgdGhlIGluc3RydWN0aW9ucyB3aGVuIHRoZSBsYWJlbCBpcyBhbHJl
YWR5IHByZXNlbnQgdGhlbiB0aGUgMm5kIHRpbWUgYXJvdW5kIHdl4oCZbGwgaGF2ZSAoc3RhbGUp
IGRhdGEgZnJvbSBpPTAuDQoNCg0KPiANCj4gRnVydGhlciwgaWYgdGhlIGNvbXBpbGVyIHVucm9s
bHMgYSBsb29wIGFuZCBpbnN0YW50aWF0ZXMgc3VjaCBhIHB1dF9pbnNuKCkNCj4gdHdpY2UsIGl0
IGNvdWxkIHBpY2sgZGlmZmVyZW50IGlucHV0cyAod2hlcmUgZmxleGliaWxpdHkgaXMgYWxsb3dl
ZCkuIE1vc3QNCj4gcHJlc2VudCB1c2VzIChpbmNsdWRpbmcgb25lcyBJIGhhdmUgcGVuZGluZykg
bWVldCB0aGlzIHJlcXVpcmVtZW50IChpLmUuDQo+IHBlcm1pdCBvbmx5IGEgc2luZ2xlIHJlZ2lz
dGVyIHBlciBvcGVyYW5kKSwgYnV0IHZtb3ZkcXV7MzIsMTZ9X3RvX21lbSwNCj4gZXZleF92Y3Z0
cGgycHMsIHZwY29tcHJlc3N7ZCxxLHd9LCAgdnBkcHdzc2Rfe3ZleDEsdmV4MixldmV4fSwgYW5k
DQo+IHZtb3ZzaF90b19tZW0gZG9uJ3QuIHssdn1tb3ZzZHssX21hc2tlZH1fdG9fbWVtLCBwY21w
e2UsaX1zdHJ7aSxtfSBhbmQgYQ0KPiBmZXcgbW9yZSBjb3VsZCBhbHNvIGVuZCB1cCBiZWluZyBw
cm9ibGVtYXRpYyBpZiBkaWZmZXJlbnQgYWRkcmVzc2luZyB3YXMNCj4gdXNlZCBmb3IgdGhlIG1l
bW9yeSBvcGVyYW5kKHMpLg0KPiANCj4gTm9uZSBvZiB0aG9zZSBzaXQgaW4gbG9vcHMsIEkgdGhp
bmssIHNvIHdlIG1heSBiZSBzYWZlLiBCdXQgdGhlIGNvbnN0cmFpbnRzDQo+IG5lZWQgcHJvcGVy
bHkgd3JpdGluZyBkb3duIGluIGEgY29tbWVudCwgSSB0aGluay4NCg0KR29vZCBwb2ludCwgdGhl
cmUgaXMgYW4gaW1wbGljaXQgYXNzdW1wdGlvbiB0aGF0IG11bHRpcGxlIHVzZXMgb2YgdGhlIHNh
bWUg4oCcd2hpY2jigJ0gYXJndW1lbnQgY29udGFpbg0KZXhhY3RseSB0aGUgc2FtZSBiaW5hcnkg
Zm9ybS4NCklmIHRoZSBmb3JtcyBhcmUgZXF1aXZhbGVudCB0aGUgdGVzdCB3b3VsZCBzdGlsbCBw
YXNzIChidXQgcGVyaGFwcyBlbXVsYXRvciB0ZXN0IGNvdmVyYWdlIHdpbGwgYmUgcmVkdWNlZCks
DQphbmQgd29yc3QgY2FzZSBpZiB0aGV5IGFyZSBkaWZmZXJlbnQgYW5kIG5vdCBlcXVpdmFsZW50
IGEgdGVzdCBjb3VsZCBmYWlsLg0KSWYgd2Ugc3RhcnQgcnVubmluZyB0aGVzZSB0ZXN0cyBpbiBh
IENJIHRoZW4gd2Ugc2hvdWxkIG5vdGljZSBpZiB0aGF0IGhhcHBlbnMgd2l0aCAoZnV0dXJlKSBw
YXRjaGVzLg0KDQpBbHNvIGlmIHNvbWVvbmUgaGFwcGVucyB0byB0eXBvIHRoZSBuYW1lIG9mIGEg
4oCYd2hpY2jigJkgaW4gYSBuZXcgdGVzdCBpbiBhIHdheSB0aGF0IGl0IHJldXNlcyBhbiBleGlz
dGluZyBvbmUgdGhlbiB0aGV54oCZbGwgbm8NCmxvbmdlciBnZXQgYSBidWlsZCBmYWlsdXJlIChv
ciAyIGluZGVwZW5kZW50IHNlcmllcywgYm90aCBhZGRpbmcgdGVzdHMgZm9yIHRoZSBzYW1lIGlu
c3RydWN0aW9uKS4NClBlcmhhcHMgdGhpcyBvbmUgY291bGQgYmUgYXZvaWRlZCBpZiBJIGV4dGVu
ZCBwdXRfaW5zbiAob3IgZGVjbF9pbnNuKSB0byBjb250YWluIHNvbWUgQyBzeW1ib2xzIHRoYXTi
gJlkIGNhdXNlIGEgY29uZmxpY3QuDQoNCldpbGwgdGhpbmsgYWJvdXQgdGhpcyBhbmQgc2VuZCBh
IG5ldyB2ZXJzaW9uIGluY2x1ZGluZyB0aGF0IGFuZCB0aGUgY29tbWVudC4NCg0KPiANCj4+IEBA
IC01MjQ4LDcgKzUyNTMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+PiAg
ICAgICAgIG1lbXNldChyZXMgKyAzLCB+MCwgOCk7DQo+PiAgICAgICAgIHJlZ3MuZWF4ID0gKHVu
c2lnbmVkIGxvbmcpcmVzOw0KPj4gICAgICAgICByZWdzLmVjeCA9IH4wOw0KPj4gLSAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCAyOyArK2kgKQ0KPj4gKyAgICAgICAgZm9yIChpID0gMDsgaSA8IDI7
ICsraSApDQo+PiAgICAgICAgIHsNCj4+ICAgICAgICAgICAgIGRlY2xfaW5zbih2bW92c2hfdG9f
bWVtKTsNCj4gDQo+IEV4Y3VzZSBtZT8NCj4gDQoNClNvcnJ5LCBzaG91bGTigJl2ZSBub3RpY2Vk
IGJlZm9yZSBzZW5kaW5nIChhIHN0cmF5IGNoYW5nZSBmcm9tIHVuZG9pbmcgdGhlIHZvbGF0aWxl
LCB3YXNu4oCZdCBtZWFudCB0byBiZSB0aGVyZSkuDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2lu
DQoNCg==

