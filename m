Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJj5J8p5oWkUtgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 12:02:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF401B6523
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 12:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242640.1543010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvbr-000886-EF; Fri, 27 Feb 2026 11:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242640.1543010; Fri, 27 Feb 2026 11:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvbr-000861-BK; Fri, 27 Feb 2026 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1242640;
 Fri, 27 Feb 2026 11:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH+Z=A7=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vvvbp-00085v-Tn
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 11:02:14 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4f9c382-13cb-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 12:02:13 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by DM6PR03MB4923.namprd03.prod.outlook.com (2603:10b6:5:1e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:02:10 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:02:10 +0000
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
X-Inumbo-ID: c4f9c382-13cb-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoyvckcqgRfGy+eKCF6V4kk5EdBMEFzc/BxgWCY24RFD+5xaAXVBWcwwIeLopFi0fINRs00drUPnRArJPrEN5LAhhGxPmaoimQqK1S1jRypbe2gOkRHrdLXQmBrl3t56CPuLXQUerZpxoECPAbEVO0a+QakSi9rTgLVRExbPV/Ke+0knMK5PdmNychDSU9M/pOUdUae4RRZq+qRvRuJVbsJ2aNBFlBx9M26mD/DZSJ46E83DCA1nd6SnIsthUAgIMet8izUJqymszoXPt2QInSWWQFM3Z4cr8kP3ZxQUpScwDa3zyvyO/zkcNdUAGez6ZdoufgIf6KSE8Dp6h+mb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VieBk6WB2QifDcprt9gfEyDWJb8rsVZCdEIdAij67CQ=;
 b=gTKNM23UFdrPAhOQAPkkPGYCh11M4TOvTbw/CpMiLhljZ3/TTILmsBy3+GbxuuHAzwJiZpGpOP+BNZtJVddJm4S9Vv2RMV5ohCb3GMT2vRKSHXYMUkHFmen5gZaOn2AroQpcvnD/HzwdwctIGhMKG0U7no+dKXYazuTHg6eyyteNhD5REmXi63Iem08uBaYLsCewYLyeXlEsIo6AlbgeMH6W1FxUcxLUGdUegTEFwTn8M5tjqv5akELoYrtuyvj1OctsvQbkEGcbTaUhnvnMdJZBYT+GL3cKN5qrSXB4ZOl4H1DP3QX/ljTXWMTMZb9SdHCvj9gyeyJMzfYMkEK12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VieBk6WB2QifDcprt9gfEyDWJb8rsVZCdEIdAij67CQ=;
 b=YNqJV66NgqJcEL1gZ9lTVUYujsCYKcJb42lmrA5WSJH7pY/VAGKFJ4n+AjFNBNypbZbAdnC2KhJ9KZqDQ0H3Xa4epo34Ua2yTjljgUIij6eU41qfH+npSREn89Wm7CPciqBrIW4BLhvDutPW3xfSUV4odNDv92Kj/fgfH6M64BM=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on clang
Thread-Topic: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on
 clang
Thread-Index: AQHcpKvkOO1o8Mk+1keRFSkNkxjvgbWQdKUAgAEjoACAAAPdgIAEy4EA
Date: Fri, 27 Feb 2026 11:02:10 +0000
Message-ID: <10B1B7D9-352F-4203-AC30-88EF674114F5@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
 <7f6cca68-f681-41ce-8d2c-2f4854510759@suse.com>
 <E1E1F4B3-C0FE-4077-A6E1-738056D5B370@citrix.com>
 <72f6e508-c75a-4aaa-a727-8cfeaa204d8e@suse.com>
In-Reply-To: <72f6e508-c75a-4aaa-a727-8cfeaa204d8e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|DM6PR03MB4923:EE_
x-ms-office365-filtering-correlation-id: 823aad22-0360-45bb-09f1-08de75efa7b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 SgkZ84s3taDzBU8E6DSq/38HF63mi1CRfh/V0n6Wztqn596nfhLga3Doa5mR5wNWJw2mQmoB/lEvqnH939acAXhS3uoy6xUeAtveKP9Wj4KZ/PyHuk2aldwhN3KNrFNQx2gankmh73tqCGVx4MOkGEu4zd5TQ4k8JGijleveHlJrCcuYZt3eKhTgZ44WkYL6Us9B4aEDsfek9XsKQjU1rDLNfDoR0glEeHe+TUS7QqNUC4FK7lro9RHwYEiDAAiq0GSyyucGzdJQrF7+gJS6JI/WltjJQEjbsSfV/69i0mknGP+9Y24fVxXwe6Y6CqJ/ZrMV0s7UyRbHGxoX+zdbTZiSGnVgNNElCn+kNjxI2paTUa7aXf/L3RWAPIKJSfedmWWJjyMys/kutwBEuAH+B9664IUV+aaiQmOWAn9D+lDroyoiXahz9yDQJikbItrZkrXJD5rixQb+apwJJ8t3OkLsRN2T+Mcg7jSj2vppNrTOSecC6NGtHQ9sq/78iHy0sY7suPz2K8TR0FeQzrixrN05tmSj3oGNbTKiGqY9bMlUtZh4J3j5Qq76KIbKdgoD0e1kOcrpz78wd5QZF4ItRWnHs5NW2vp77qOOESuIH9z1M10GTfgKAdQ80Lb5KmGvJeM1vRg9aml19Ra8bFO9/NaDjk0bUoLdwysv/QyJJebMZbPGZ3ZVeAU33XMOXbxVMNNsP5l3gniZHJb2lQ0N21kmGN+RbBLMjceJZrbfD/ANlHged5F6D5sQwQWk9mXF4ge0e0Iv0HOKeRlr5ym0s8CrEowbBTBxhfOy8u6yt+Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnFFSGpxQllyUzdWbXMzcWdDQjhqQjFxaW5GS3BGNWZXMXFLbFJBbWlRREdN?=
 =?utf-8?B?M1MyRDVDaVZkOTg0U1RjNUJhQVVUNlZ6Z2x0aGF3cXR4SnNaRlJBcnVMdmUy?=
 =?utf-8?B?M2QzK0hQYXVrcEMwQys3ZmVSZHZmZGVaZEpJZlJqNnExR1FrL3JXM3orU3VC?=
 =?utf-8?B?RC9TSDNBV08zaHNZODRwdGsrcCtXZEdFcnN6WSs0eUZCb0cwcmUzcUNqSWsy?=
 =?utf-8?B?MUU5cW9QQW5JSjl4OHVZZHpxZWZna05iQlhpZTR3ejFRY2c1eEhnRW52ZE5t?=
 =?utf-8?B?TUtXWXdvVUNYSWdva0ZwTkx5SE1WWGNUU3Z5Uzg3NjJ2WHV6bkc0LzNtNngx?=
 =?utf-8?B?b2Zxam1mL3dLK2NwSnF4eUh1aVlOSTUvMU4wNUJXSUlWQXgvWUY2RDVTeE9G?=
 =?utf-8?B?YzZyVnF0K3lINmVoRW5wdUZZZGRVaHVuSFFnUGJoRGhRcThmWVdpS0RCQ3J2?=
 =?utf-8?B?c1JxZzVEenRSa0NMaGp0QTlDQmFjZFV1U2NYWERLdHp5NXd0WGFha0JjTVBz?=
 =?utf-8?B?T1J4Q21pK1BrQlkvY0JPTVZ5d1ZoVExSWEFNcUlxdUI4VmVBN2tjTW5vQlI5?=
 =?utf-8?B?WnJHYXJybmFsbFlqWnhzMDR6TmRnU3pCMTVmQUZJWk15LzlBbWx5a3UrQXJN?=
 =?utf-8?B?dHdaU1pSbksycHdQOTY5RUFJQnlTeXJpN05HOVB0anhxVWx2TVkrV1dSMEU1?=
 =?utf-8?B?QWNONm5qZ29Jd2FwdExpc3kxanZoc1J1ZzVYbGNTNXgyMGowa1ZsWVVyL2tm?=
 =?utf-8?B?dzg4dlYwOXhOeS9DU2xkTkEveWFzRG5uUisyYzVVek1Qa2RqMUo3SHlaYTE3?=
 =?utf-8?B?WjVmcTc3ME1KSHFWRnhGRkJIUmhnYXpXaEt1MjdDL3pOdlE1MWVSSnFFVmJR?=
 =?utf-8?B?MGtHdkNHNDljZmcyMGtOTTlEV2J2QklxYUU2V0RGZ0RRemI2eWhFNHR4ZE1B?=
 =?utf-8?B?ODc3TVVIMzFEdWthM2VwQnlnakdEUjNudjFEMGVJcFg0VnBiK01HK2lWYmZa?=
 =?utf-8?B?Mjh3cm1PVmptWHZuU09kay8vNlV0R2oyTmZJaTRsYnVvb2lmWWlKN0x0YXJN?=
 =?utf-8?B?bzQ2N21Mdi9VYVptVnpQY2VuRXhOamJsMjJHaUFpUHlGN1JHaHFXZWdsVFFF?=
 =?utf-8?B?bUk1Wk80QmdPTHdNLzBqS2E4SzBzNU5VcHc5Zk1aTERrR285WklJdGxpWkJ6?=
 =?utf-8?B?YWI2cEZsdHZjRGhueHg0MDJlOElkYXdrVlpvbFlRaEowYUpIdVFhY1UyQ3NH?=
 =?utf-8?B?MnRKL01NQ2R6WWFaNVlBZVJjYmpaMk1KWUtKTWUyRW93ZGRpM2ppVEVNb2pJ?=
 =?utf-8?B?RXhMR1FSNXFycEd0QU9nalRCZTlzY2FkemMwMzMxbE9iNktnZVFPRlpvTmJD?=
 =?utf-8?B?b3ZDamxvcVZyV3pmTkNaYWJod3FGVDh2M1Nkd0F2TEhJODMvc3I5WmVlbjBH?=
 =?utf-8?B?NXZ4ZE8vaWNJbDdRa1VIQ3hwdWVLd3JPTUMrOHNsOTRpYUE3R1VGa014eHBp?=
 =?utf-8?B?VG5CbnpQL3puOG9rRk50MU91M1l5NUxDdjdSUUk4eEVLVzc2ZkdZVXRYQ2Uv?=
 =?utf-8?B?NVNqVkNkTHZIS1Zqb2ppVmYzS3ZuRUVpVWtJZFdxUUlJeFEvRjYzMk5ya2w2?=
 =?utf-8?B?Z0t5V3N3N1BaQjFieWdHcC92cVU2aFN5YTRsOWdyYk14T3NLL3ZFZkVJK0NG?=
 =?utf-8?B?dFhtOFBaTEtTcHZJZld2QWc1aUs1VG5NaHpQWHFMOU1EblY4YXFmb2s3VDBE?=
 =?utf-8?B?VjdhSXhPcTF5cFRHL29FK0ZNclZwQzY1cUN6b3pHWjkydnFxOVRzNStmYytN?=
 =?utf-8?B?aG5RZUZ4YnN1bGxnQy9td2xSZGpwVkl1QjE0TVkyYmN4blpCSXBQbjdBdFF4?=
 =?utf-8?B?dFhWZWRka3hkZmFrMzd4dHhhZGgvUW0wVE1RRFBySTNjZ3YydWlzc0hJVG5U?=
 =?utf-8?B?T0hJcFF4RnVCd1JLREhuZXVpaVQ1ejFWMm9oNjRSd3h5YkNpZU1ZajRmaisx?=
 =?utf-8?B?ZEhwYnlOVDMrZTdCdXpvMFhMQXFuK3EwY2wwR3BZd2RrVHg3VmdpWjFvQjJV?=
 =?utf-8?B?cUh2VjJZc0JTVkdyeksrcm8xL28vWXpRVnVnaDR5Mi9NOXhkUDBCZEszRSt1?=
 =?utf-8?B?LzVIb3lXUm9laWVzMmo2MFFZcjVGVW1leVZ6VlBWZU03Y3hRQkRTVDVKMjhR?=
 =?utf-8?B?T3Y1QUZ6ZEMvdHNqbHl0ZVhGdGJ4STlmWm00ZnRDNElpcWNkQnF5MXFla1VD?=
 =?utf-8?B?cjFyZTJTaXJYelc2ZklVY2s4Z2N2Mk5IMUZ1RnV3ZkJkMVhWT3FFUkk0M0x0?=
 =?utf-8?B?aXRaQWdTcndneDJYcGx5TXpNN2FaNjNjeVFSL01oWTdZU1lVclRCSGptMFY4?=
 =?utf-8?Q?P80ZTXCnb/59nPvA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <040FC6131E204442B5D6EE2C6981211F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823aad22-0360-45bb-09f1-08de75efa7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 11:02:10.3690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bu+WrIbO5AbdaefZg+Ivs5XeI+i2uoRr2wsrY6B72s6NNHsm0uQT14O1Bd7P4axGj6pH5WYpU7WPBKDiv3pLbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4923
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: BFF401B6523
X-Rspamd-Action: no action

DQo+IE9uIDI0IEZlYiAyMDI2LCBhdCAwOTo0OCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+IE9uIDI0LjAyLjIwMjYgMTA6MzQsIEVkd2luIFRvcm9rIHdyb3Rl
Og0KPj4+IE9uIDIzIEZlYiAyMDI2LCBhdCAxNjoxMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+PiBPbiAyMy4wMi4yMDI2IDExOjA0LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4+PiBjbGFuZy0yMSBkb2Vzbid0IHN1cHBvcnQgYC1mZml4ZWQteG1tMGAsIHNvIGAl
eG1tMGAgd29uJ3QgaGF2ZSB0aGUNCj4+Pj4gZXhwZWN0ZWQgdmFsdWUuDQo+Pj4+IERpc2FibGUg
dGhlc2UgdGVzdHMgb24gY2xhbmcuDQo+Pj4gDQo+Pj4gSSBkb24ndCB0aGluayB0aGF0J3Mgd2hh
dCB3ZSB3YW50LCBhbmQgbm90IG9ubHkgYmVjYXVzZSBvZiB0aGUgY2x1dHRlciB0aGUNCj4+PiB2
YXJpb3VzICNpZmRlZiBjYXVzZS4gV2Ugd2FudCB0byBiZSBhYmxlIHRvIHJ1biBhcyBtYW55IG9m
IHRoZSB0ZXN0cyBhcw0KPj4+IHBvc3NpYmxlLCBzbyB0aGUgZmlyc3QgZ29hbCBzaG91bGQgYmUg
dG8gZmluZCBzb21lIGFsdGVybmF0aXZlIG1lY2hhbmlzbSB0bw0KPj4+IGFjaGlldmUgdGhlIHNh
bWUgZWZmZWN0LiBBIGdsb2JhbCByZWdpc3RlciB2YXJpYWJsZSBjb21lcyB0byBtaW5kIGFzIGEN
Cj4+PiBwb3NzaWJsZSBvcHRpb24uDQo+Pj4gDQo+Pj4gRnVydGhlciwgaG93IGRpZCB5b3UgYXJy
aXZlIGF0IHdoaWNoIHRlc3RzIG5lZWQgc3VwcHJlc3Npbmc/DQo+PiANCj4+IEkgdXNlZCBnZGIg
dG8gbG9vayBhdCB0aGUgMiBtZW1vcnkgYXJlYXMsIGFuZCBub3RpY2VkIHRoYXQgdGhlIFhNTSBy
ZWdpb24gd2FzIGRpZmZlcmVudCBiZXR3ZWVuIGVtdWxhdGVkIGFuZCBhY3R1YWwgd2hlbiBidWls
dCB3aXRoIGNsYW5nLg0KPj4gVGhlbiBJIG5vdGljZWQgdGhlIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0
byB0aGUgbGFjayBvZiBmaXhlZC14bW0wLg0KPj4gVGhlbiBJIGFkZGVkIHRoZSBpZmRlZnMgb25l
IGJ5IG9uZSBhcyBJIHJhbiB0aGUgdGVzdCB1bnRpbCB0aGUgd2hvbGUgdGVzdCBwcm9ncmFtIHBh
c3NlZCB3aXRob3V0IGZhaWx1cmUuDQo+PiBJIHRyaWVkIGFkZGluZyBzb21lIOKAmHB4b3IgeG1t
MCwgeG1tMOKAmSBpbnRvIHRoZSBjcHVfaGFzX3NzZTIgc2VjdGlvbnMsIGJ1dCB0aGF0IGRpZG7i
gJl0IHJlYWxseSB3b3JrIGVpdGhlci4NCj4+IA0KPj4gQWx0aG91Z2ggSSBtYXkgaGF2ZSBiZWVu
IG1pc2xlZCBieSB0aGUgb3ZlcmxhcHBpbmcgcmVnaW9uLCBzZWUgYmVsb3cuDQo+PiANCj4+PiBJ
IGRvbid0IHRoaW5rDQo+Pj4gd2UgcmVseSBvbiBhbiAiZXhwZWN0ZWQgdmFsdWUiIGFueXdoZXJl
LiBJIGRvbid0IGV2ZW4gcmVjYWxsIHVzIHBhc3NpbmcNCj4+PiAtZmZpeGVkLXhtbTAgd2hlbiBj
b21waWxpbmcgdGVzdF94ODZfZW11bGF0ZS5jLg0KPj4gDQo+PiBZZXMsIEnigJltIHN1cnByaXNl
ZCBpdCB3b3JrcyB3aXRoIEdDQy4gQnV0IG1heWJlIG9ubHkgYmVjYXVzZSB0aGUgZW11bGF0b3Ig
b3ZlcndyaXRlcyB0aGUgYWN0dWFsIEZYU0FWRSBhcmVhIGNvcnJlc3BvbmRpbmcgdG8gWE1NLg0K
Pj4gWE1NMCBiZWdpbnMgYXQgb2Zmc2V0IDE2MCwgYW5kIDB4MTAwIC0gMHg4MCA9IDEyOC4NCj4+
IEFGQUlDVCB0aGUgYWN0dWFsIGV4ZWN1dGlvbiBzdG9yZXMgaXRzIHJlc3VsdCBhdCBbMHg4MCwg
MHg4MCsweDIwMCksIGFuZCB0aGUgZW11bGF0b3Igc3RvcmVzIGl0cyByZXN1bHQgaW50byBbMHgx
MDAsIDB4MTAwKzB4MjAwKS4NCj4+IFNvIHRoZSBlbXVsYXRvciB3aWxsIG92ZXJ3cml0ZSBzb21l
IG9mIHRoZSB2YWx1ZXMgZnJvbSB0aGUgYWN0dWFsIHJ1bi4gDQo+PiANCj4+IFRoaXMgb25seSB3
b3JrcyBpZiB0aGUgZW5kIG9mIHRoZSBGWFNBVkUgYXJlYSBsb29rcyBsaWtlIGl0cyBiZWdpbm5p
bmcgKGkuZS4gaWYgRkNXL0ZTVy9ldGMuIGhhcHBlbnMgdG8gbWF0Y2ggTU02L2V0Yy4pDQo+IA0K
PiBBcmUgeW91IHBvc3NpYmx5IG92ZXJsb29raW5nIHRoZSBmYWN0IHRoYXQgcmVzW10gaXMgYW4g
YXJyYXkgb2YgdW5zaWduZWQgaW50IGVsZW1lbnRzLA0KPiBpLmUuIHRoZSBvZmZzZXRzIHVzZWQg
aW4gc291cmNlIGNvZGUgYWxsIG5lZWQgdG8gYmUgbXVsdGlwbGllZCBieSA0IHRvIGdpdmUgb2Zm
c2V0cyBpbg0KPiBtZW1vcnk/DQoNCg0KVGhhbmtzLCBub3cgdGhlIHRlc3RzIHN0YXJ0IG1ha2lu
ZyBtb3JlIHNlbnNlISANCg0KQWx0aG91Z2ggdGhlcmUgaXMgc3RpbGwgYSBsb3QgdGhhdCBJIGRv
buKAmXQgdW5kZXJzdGFuZCBhYm91dCBob3cgc29tZSBvZiB0aGUgb3RoZXIgZmFpbGluZyB0ZXN0
cyB3b3JrLg0KRm9yIG5vdyBJ4oCZdmUgZHJvcHBlZCB0aGlzIHBhdGNoIGZyb20gbXkgc2VyaWVz
IHRob3VnaCwgaS5lLiBsZXRzIGZpcnN0IGdldCB0aGUgY2xhbmcgYnVpbGQgZml4ZXMgaW4sDQph
bmQgc2VlIGhvdyB0byBmaXggdGhlbSB0byBhY3R1YWxseSBydW4gc2VwYXJhdGVseS4NCg0KQmVz
dCByZWdhcmRzLA0K4oCURWR3aW4=

