Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKTdEFex12mxRggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586923CBB4F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277478.1562712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwz-0005b7-GI; Thu, 09 Apr 2026 14:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277478.1562712; Thu, 09 Apr 2026 14:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwz-0005Rx-8k; Thu, 09 Apr 2026 14:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1277478;
 Thu, 09 Apr 2026 14:01:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApww-0004el-Qr
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApww-001xza-6e
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13b-bab6-0a2a0a5309dd-0a2a4508c900-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:38 +0200
Received: from [52.101.84.113]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b141-fab6-0a2a45080019-3465547115da-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:38 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA1PR03MB10891.eurprd03.prod.outlook.com
 (2603:10a6:102:485::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 14:01:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:32 +0000
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
 b=FNTXwFEwd1sibsZV9q0cfArb7KsR+MNa57Q4OlYE3eYUKK0okCnJwn8xwXBGk6ZOYVg4i6qPDdOsJAeQrTRFhsJ/FQVyB8MiTxGUlJT9CxtM38wC0vpYntwPnEk06YwNEI660UjSg0bmqYgNiGmAFPj5RZO6Tfm/ictW8ay09Qjeuaf6NFYrwC/VlxSybALCTuURmnX4G02c04ikMg3OQBQyOYB+loo951ai/1TG0zFQvhuGFijxIaDqtqkC8bsOvUlknnFjxNFCE5gD/KCFdTKGJXw45OGWbmXvq4eWKXLwjHp/oqwKlsKOkuDI9szMUqqxl4kYqLIogGioS1Uqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNhpqQV4Elddv8NpcHEijEkuM22dMa82qo23nZdgrfk=;
 b=f6MlDiIQiZ6n9jfuAogBQdgBUFR1tn8iLTSNUaAVhpZr2/EIe3LNsAirLJ0FUwFY7XU53e5Zqu1P4mRdPXJyIHke3qw1mL7JKan+poHYOie2e+KytEp6mBl3+2RISPXALQX2DOAHkGHl8t2GyQjjgV+io76ct60SLRkyRQmTAa1zCAKKJF84lWWtzmW8ukqjyA4aB7VuoEbdpofZAmIA7QsP4xbjRPCvoLh8GlxBHHCy6dFpz3Sty0tOHLgFIdzxcP18FGxT8qpnc9rwDc8wGp74eVS9JCS7DXtaS8M2Eym337cMR7dGLoXZxB3kLstwe/CjlGMA/QWdsZJ1Gi0x1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNhpqQV4Elddv8NpcHEijEkuM22dMa82qo23nZdgrfk=;
 b=nyHpOgi91b/a2ZYYxHkSPKhBdYXTFZVoAev7XX1YgeJYEkoeLPV7Fvyr0CUWmkCV0PEHQl3Vj3eBwtCOTxRUXaqz/6i5N0LSLRfHIAhNR7qAZbkod2d0gprUDDkq5FFCYYkcxmLrCESxRhS7mN1Pxtbadsu6IqWBeKerKwBtcDyZrxqLlMfdfNr0w1UuQ/qCdQ+Wy5GKGatqxnt1aFlwA7cOqCOQ2ag2MMDRnFxZeJXqBD6PxR3I/v1YtDRpKHF0nsf3N7iyAKFLOTdxYSrinwEf22Hy8IAazQqfiAch36mcaoZYF5zO7Id5gimFoGwncWKivFjuUFtNow3YoZOehw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 0/7] Implement SR-IOV support for PVH
Thread-Topic: [PATCH v3 0/7] Implement SR-IOV support for PVH
Thread-Index: AQHcyCleot7eiSMfSk+JzvPQ8+rmCA==
Date: Thu, 9 Apr 2026 14:01:32 +0000
Message-ID: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA1PR03MB10891:EE_
x-ms-office365-filtering-correlation-id: 77a8f854-1928-4339-627b-08de96408129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 uBe+Z3UgvREU9MZeJ9BZopXwO6S8+fpghFvaXF98wammBpjMTM8BsL+9nSspAQhM1rwIf+Hbf2wZMc/5GkOV6OxIFXurxvGZpWLzNCdb6o7uA6LgNQvB2p2n+pCwcCwKoDjH+82LZ7LuFs7sy4hzONPf9IrsmsZHyECSphfJCT0l3oiK+rqA3zzB3EvAJU5lD+QDBdKG7/zpPJERKLvp7Jrrdn0raRJgjs8UOpGPrgmcj+bIiMqIT3+6gq5Or0vwBteaHlMVY90KfGvLA2n8NM5dqzsLvQlGW44nSWeHL0cbcNfCMM698j8m+2f9F/rW9cjgWOdMD9CW24Exm+CpOV4No5HNmls0deCiVLxfKsC+FegW/2/IoQXa73ttDsOMfmn70pIywIQmNBprh0FTvj1eci4FmOfmiiungj+j7EKGHlTCEHBI4l2HNGMDgYYD9LOM7cTvKD9fSYZuwLndd0SipACkQ3Cyy/Ld4u60cKhQIWbeBVWWPvZopKKHebuAKXVu/EEDcSzs1hfmCq+oAKHmVWY1CWLs/jaW8ifJ3YsjbarlgutITWmNTgoDJrGpKKYIAB8SSemxjzQjIfc19ogYYr2gpdKq9BP9E/pxJ37JCsSqQO1y7O/zfRbCJ18HQJC0HyaIV5Nj6edHfB2gHdbEeE4pEbkQQo5IRYn8D6XttIYh1MH+F+xtpHFD/EXIC+7D5w0gs2tj8xElA52wFoQNbscsAj2DXJD2qFhdew4ZwZQGwW/2T3pTspNXsYI0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0d0ZGlnNVF6aFM3MnpvNjhNTVVvbTJuSGd1T2pYZHNTMSsyMkRMYTNyWG9o?=
 =?utf-8?B?eTdtTHB6bDk5UW1zU3ZjeTc3VStrV1N6TEp2Nlh2dnBqbE1tWnZIeGc2L2ZC?=
 =?utf-8?B?dGlJMFZ5OVRLc3ZiY25IUTlqSkpEckNnTFBGa095WjlsV2hKU2V6VW4ycmRz?=
 =?utf-8?B?WWhpQW10a2t5NmVudlZ4YVk0SXQzbmlBcThYd2VIck1BZVdxcHl5endaK3Yx?=
 =?utf-8?B?eWFqY29iQkNXM0VORGdxb0NYQmNiaXppeFFCUG8xaGt3Uk1wRmV0SDQ0bHh0?=
 =?utf-8?B?clg2N1NaU2srb2tROVBWaW9Cek1KOURmSnMvUW40a0JEWVBsS3YzeldQM0FN?=
 =?utf-8?B?RlYydTR5dHhRa0xwSFd6enJ2TUUwWVJSY21BbjdHaEtnWm5QMmRnRkl2ajZt?=
 =?utf-8?B?c2ZIYmVaTEJiaXpQc1JmSmxDZHZLVUxKRUJod2d6RzF5Y0hUTW1meDYydWxY?=
 =?utf-8?B?ZDFqTm1ZeWVnWDYybGRaaWh6eit0NHR3cXRXMmdLaU83ZVFoaVR6QzJmU2Ns?=
 =?utf-8?B?VlpNWkowS3RTdTZqdHNucGZJbUsyaDgxQzNic0gwU1lic1FCa1RhWEdIM0lU?=
 =?utf-8?B?T1FTZzJsOWxGMnRySmE2MjRTeXFBVnFSQit0aWJMcS9oZE5KZXdwWFdZcWdY?=
 =?utf-8?B?bDBJeHk3Q3FCRnllMUtlNlBrRXRUM2QvR2hUcjBaWjY3OG96RENKeVdJVG5k?=
 =?utf-8?B?QmRzU1pSRkhWYzlzTVlHY2ZGTnRNeTNrOGM1elcybXg4eFgwb2lHcWxSYjZO?=
 =?utf-8?B?WnRxRWFpdW9zdTZneUJ3enl2VjlsS0U2WlFOQ0cyTE1XUU5LU2ozSS9zVENq?=
 =?utf-8?B?U0NxY2tvbWtTdUU2VUFVem1FV052aU41dDZReUdSWjVvU3RCTlppeTdOOHpQ?=
 =?utf-8?B?UTdkdmVneG1NOFNUVmFMNnRmdmhSZ3ZMVElvSHBTQzZ5MVc5eGEzQUpXaVJ5?=
 =?utf-8?B?VElRaVlScTFlKzRZWDZBdVVJTXhNdkhVKzdiRk1xanU1TkxSVTJzNTRkaWEx?=
 =?utf-8?B?Tm50RUF6ZzUwcVVxWGVRK2Z2ZjYrV3pNZzI4WU1tRGU0SVlHTHEyeXAxY1hj?=
 =?utf-8?B?MElnMWFwaEQ1OWNjWW83Y1VpRGdMd09jUWI4SnpueHhsY0VDWmRIKzV3QU1a?=
 =?utf-8?B?dXcvb0F1dDlRNGtGMGE5cmxUbGdyaVZKVzNLZStneGc0ZE5JczVHcEhnQndD?=
 =?utf-8?B?VEpMNm5QMmNZamYwNjJkRkhjWldLRUh6ZU1jMmlPbGNjcWtVaTZUUmxsMVdh?=
 =?utf-8?B?cUdWL2g5Y0hDbm9YT1AvUTB5akc4YUw4azNVZmdWak9DMExxcHg4MktHYnlp?=
 =?utf-8?B?U3U3b2hiOHVTQjBEME44MTBXcnZiTTNLMWpENDljdUxLblZYMVMxOStYOGFy?=
 =?utf-8?B?SGE5VTVISi9OSzBObkJrQkl4VEVRYms4QUIxcnBqUlkweUZRT0RDMXlEVk9a?=
 =?utf-8?B?UTcxWUwxcnRmM2ZRUkR0Sys1QUcvVERLV1RRaFpnL2pZUlNDc1d4NmI5dE10?=
 =?utf-8?B?MDFWeUFla3ZGc0VUOXVXOCtWSU9uSk9Hd29scW45UW1jeDR4QU1nenowMk5y?=
 =?utf-8?B?MDV3WlNJdm9yK2hxbHB1T1hDWXQ2azZqVWZTaC90am1OLzRENUY3eXd6d3dN?=
 =?utf-8?B?Ujhac2ZKc2ZhQjZ6WTFLU2YyanFuUjRlVHR1enlRdkllMk04WnpSL1JBVlBC?=
 =?utf-8?B?WTNiZW5IcWhMS3pQeFkxOThWS3pta0FCa0d6L2NXWVY0K05pRzdLMTBmdnpP?=
 =?utf-8?B?UGp0QnE3Vjdvb1I3REpiR2ZLYnIvN1dnYkx5OGZvTnN1TkE5VXoxeWVZR3Vu?=
 =?utf-8?B?WXhsSFNHcFlYeGMyUE5uSjBLcWw5TUNmczRNZjhnUzFTQ2Z6N2dBQm40RDht?=
 =?utf-8?B?dE9rejJYTkI4VzFaOUt1eG1YM1VtNUhtUjlSbllNZW53QTlSSWFONGgwSUNF?=
 =?utf-8?B?Vy9KaGo2QU93dkZtRjVZN3NpU0VoNXpNZjZQT0VyMXRSL09nZk9lZlFLbGlH?=
 =?utf-8?B?Zk5XZHZ4Qnc3OWQ3NDBVMHNuSmZqYnBaeEpvN2ttbVFLZnhSckZTNGRHY2ll?=
 =?utf-8?B?cUIwcTRCb2FZSHdNa0hiRW13ZjF3em1KQytGaHBweUM1YkRTMlZTRkJSQTgr?=
 =?utf-8?B?akJhaUMzZ1pBQ1dJYWxqYjNXSEZmMkNzUzE5cGoxU3NqK1dQeVBCWHB0aFFD?=
 =?utf-8?B?ekJQVFgweDhoblVOdWFGeEZZOTNZMjZIVXF6bHFhWWR3L3YxOW9TakxsWEFX?=
 =?utf-8?B?Yjc3dXg0VjcwdzNaUmtXMEJkMEQvOHBvcWN2cVZBbjFqdHN2RnBtbFZKSWVT?=
 =?utf-8?B?SzJiR1o2aWdnWGI5VGg4UjBPSDFJMWI4aEVYK0FEd21xT1hkaEhrQjFxTDRL?=
 =?utf-8?Q?O/wI8/UHNDRtHV4E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23BC6686812C7349AA8E09C0B1C5C013@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a8f854-1928-4339-627b-08de96408129
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:32.1698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cP5x8kFrbSYTwg5RTSXsrrsodjhMJrrDxX6jVrsgKAHRGOdk1xCR2mBcUUB/eKzT60JvbKgvap8GbDI9rAdJ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10891
X-purgate-ID: tlsNG-c1860d/1775743298-F7547497-5D390FE7/0/0
X-purgate-type: clean
X-purgate-size: 2702
X-Spamd-Result: default: False [-0.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,support.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 586923CBB4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBQQ0kgU1ItSU9WIGNhcGFiaWxpdHkgZm9y
IFBWSCBkb21haW5zLg0KSXQgYWxsb3dzIERvbTAgdG8gZW5hYmxlIGFuZCB1c2UgU1ItSU9WIHZp
cnR1YWwgZnVuY3Rpb25zIGFuZCBmb3IgdGhlc2UNCmZ1bmN0aW9ucyB0byBiZSBwYXNzZWQgdG8g
Z3Vlc3RzLg0KDQpUbyBhY2hpZXZlIHRoaXMsIGFkZCBoYW5kbGVycyBmb3IgU1JJT1ZfQ09OVFJP
TCByZWdpc3RlcnMsIHNpbXBsaWZpZWQgaGFuZGxlcnMNCmZvciBWRnMgaGVhZGVycy4gWGVuIHJl
bGllcyBvbiBkb20wIHRvIGVuYWJsZSBTUi1JT1YgYW5kIGNhbGwNClBIWVNERVZPUF9wY2lfZGV2
aWNlXyogdG8gaW5mb3JtIGFib3V0IGFkZGl0aW9uL3JlbW92YWwgb2YgVkZzLg0KDQpDb3JlIGZ1
bmN0aW9uYWxpdHkgaXMgYmFzZWQgb24gcHJldmlvdXMgd29ya1sxXS4NCg0KVGVzdGVkIG9uIFIt
Q2FyIFNwaWRlciBib2FyZCB3aXRoIFNhbXN1bmcgTlZNZSBTU0QgQ29udHJvbGxlciA5ODAgYW5k
IEludGVsDQpYNTUwVCBldGhlcm5ldCBjYXJkLg0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3hlbi1kZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0xLXJvZ2VyLnBhdUBjaXRyaXguY29t
Lw0KDQp2Mi0+djM6DQoqIHJld29yayB0aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgYnkgRG9t
MA0KKiBkcm9wIHBjaS9pb21tdTogQ2hlY2sgdGhhdCBJT01NVSBzdXBwb3J0cyByZW1vdmluZyBk
ZXZpY2VzLCBzZWUgWzJdDQoqIGRyb3AgdnBjaTogYWRkIGEgd2FpdCBvcGVyYXRpb24gdG8gdGhl
IHZwY2kgdmNwdSBwZW5kaW5nIGFjdGlvbnMNCiogYWRkIHZwY2k6IGFsbG93IHF1ZXVlaW5nIG9m
IG1hcHBpbmcgb3BlcmF0aW9ucw0KKiBtaW5vciBjaGFuZ2VzIGluIGluZGl2aWR1YWwgcGF0Y2hl
cw0KDQpbMl06IGh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2E1OWMyZGEwZDRjNzJkZWI0Mjk1MGU5
YThlMzk4MmZiZGVlNjA2NjguMTc3NTU1NTc2Ni5naXQubXlreXRhLl81RnBvdHVyYWlAZXBhbS5j
b20vDQp2MS0+djI6DQoqIHJld29yayB0aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgaW4gWGVu
DQoqIHNlcGFyYXRlIGRvYyBjaGFuZ2VzIGludG8gdGhlIGxhc3QgcGF0Y2gNCg0KDQpNeWt5dGEg
UG90dXJhaSAoMik6DQogIHZwY2k6IFVzZSBwZXJ2Y3B1IHJhbmdlcyBmb3IgQkFSIG1hcHBpbmcN
CiAgZG9jczogVXBkYXRlIFNSLUlPViBzdXBwb3J0IHN0YXR1cw0KDQpTdGV3YXJ0IEhpbGRlYnJh
bmQgKDUpOg0KICB2cGNpOiByZW5hbWUgYW5kIGV4cG9ydCB2cGNpX21vZGlmeV9iYXJzDQogIHZw
Y2k6IHJlbmFtZSBhbmQgZXhwb3J0IHZwY2lfZ3Vlc3RfbWVtX2Jhcl97cmVhZCx3cml0ZX0NCiAg
dnBjaTogYWxsb3cgcXVldWVpbmcgb2YgbWFwcGluZyBvcGVyYXRpb25zDQogIHZwY2k6IGFkZCBT
Ui1JT1Ygc3VwcG9ydCBmb3IgUFZIIERvbTANCiAgdnBjaTogYWRkIFNSLUlPViBzdXBwb3J0IGZv
ciBEb21Vcw0KDQogU1VQUE9SVC5tZCAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KIHhlbi9jb21t
b24vZG9tYWluLmMgICAgICAgIHwgICAyICsNCiB4ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlICB8
ICAgMSArDQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgfCAzMTQgKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvcHJpdmF0ZS5oIHwgIDEwICsNCiB4
ZW4vZHJpdmVycy92cGNpL3NyaW92LmMgICB8IDM2NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgfCAgMTAgKy0NCiB4ZW4v
aW5jbHVkZS94ZW4vdnBjaS5oICAgICB8ICAyOCArKy0NCiA4IGZpbGVzIGNoYW5nZWQsIDYwNyBp
bnNlcnRpb25zKCspLCAxMjYgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9k
cml2ZXJzL3ZwY2kvc3Jpb3YuYw0KDQotLSANCjIuNTEuMg0K

