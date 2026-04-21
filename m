Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMePK0s552no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:46:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FE438545
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288650.1568900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6jv-0000Ba-Ir; Tue, 21 Apr 2026 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288650.1568900; Tue, 21 Apr 2026 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6jv-00009c-FS; Tue, 21 Apr 2026 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1288650;
 Tue, 21 Apr 2026 08:45:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wF6jt-00009W-OI
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:45:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6js-00AFjC-Dj
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:45:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e73938-5cb7-0a2a0a5109dd-0a2a45089ae4-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:45:48 +0200
Received: from [40.107.162.101]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e7393b-63b5-0a2a45080019-286ba2652c48-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:45:48 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB4PR03MB8708.eurprd03.prod.outlook.com
 (2603:10a6:10:380::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 08:45:42 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 08:45:42 +0000
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
 b=hYQ/Qwwi1t8plz5Yuy/jQHtRfhnmtA+C6KA7Q1PxQKuquUqoR5oNa3j2864vuhYUvk+GD1ahYwWFIwHEcjR1EWwkkmot+3+2B4PvcvQO2NVYHE2QnMr7QUBGCm8ouRWbUDaOnpGrCVipxR01CHykZOFwwIJm98sFGBF81D3e9GoZtVlZxavgDtGY9YlKfwCYiojv81jZ4zx9wr5+OaPNSh47oiNBSqnMihJ4CAPvpT+c8W2Bfc7NACx4Z/cZzEed7GLfrRV2R/y54oPlV2ez4HcKYBLkcGz6wWPgyyoYAGlzVzykQGM9vohVb7WN24ZlT+tcEnMHbcNBfnK92r/bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cofZ+DTZgf2xCrx+s7v116PQNXWKMFUc4tYRgJePiqo=;
 b=hGtqY780biWLxoLpinkSo6saf0McXzlCOLHoVGVopfUASHLLRC4M1xce/B6HFQd+l82v2174pIE7WM68KNBKAbJuGmH8zxSEwZVrPtuINDUFw1uR7Wwxi+nz2kZXXm/tgmCxJdioZXmWwtFVkTsYARiOLUtxWuKQUHRU7ZlzaHNskNLLPJd419rB+5ba06jxsXffTGZF4oWbAqq9/OfR1P3SwpHvLYsOU3yz1JZjbABg3Kgd+iEiUIA5F17qtrz1dwIJKRBsGCmgTkPVNwI5Dj0sMC/bXjQhtRgMCSYglefhPL/pi7m+5TzOjU42x89/GEO2R4r7hwglOOPJV5tp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cofZ+DTZgf2xCrx+s7v116PQNXWKMFUc4tYRgJePiqo=;
 b=ZCFyNTOAtddBVPMvFOs0U4ZS02NnXno8NmX4jB9yesB6KZHda06cM3zQ5153GN6/smm/74mfuiex6v9AP78bju0y5D9yNaiPywD5f0Mj6Btx8RzKCtRQ2iHSAOuBxddMYHlUcKC1+r5KkBqRn+3Z9De04Z4ETyRHmkyeOj6TJXOyPkOTmtR6xyXh8CdIkjzmFqZnPqJI/9njTMAW48+s2PyjNds8laWwS76P1ko03raTaa6vPGZU8KRCx/bxJ9U1pehEjYpH6uYaCCAN2yUuiIe7BV9WKLkTMGVGQzEZDJO8SlrKkL/kGOo6ekYghIPyp53uW/cp1c9YYELz3mzzYw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
Thread-Topic: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
Thread-Index: AQHc0WR3HLVfDHqP50KPW64J7aGgdbXpLwMAgAAEq4A=
Date: Tue, 21 Apr 2026 08:45:42 +0000
Message-ID: <4426640a-8567-4ffa-8667-06fea9e2ea54@epam.com>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
 <cb1b4892-7a7f-4ed9-bb73-d43d72db99c8@suse.com>
In-Reply-To: <cb1b4892-7a7f-4ed9-bb73-d43d72db99c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB4PR03MB8708:EE_
x-ms-office365-filtering-correlation-id: 1d5a0e62-04f4-42df-b5ce-08de9f825f2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Hn/LSY7Yi94lWdj+aKPH4ceaFb8L7OfDFUioqmV9VbWVfgkRH6LCZnC90ejbLokRf6kq+/vWA3TpvMspYlAF78uNVwAom9AXK8ctM7ArxEVQFfkK+xOdX+QDCgjqDv/aiyRfvzox4X31od//DEfQ8E/3cNpmxEOYBBcgjUyN+25R6B26vKKqWrTImkwpzaqU8zoFCkaAEvbbwZt+JQ4s4GbF4WXmngWXsX8JKgcNgsobFOdBFkJ7I1e+y4TEf3JWr0qY/faNyHQzYyP7VJr++XFfqKLNInEGTkZewVq9+1kc7X2ZdT7ekXoYjveH8v1zp3pn+enUexX3yExceLxvJZUMhpsiJMysT/whigE1zMhS5nFw0Al/7puSp3qrfgqH9m85dhKYAM5j30ZxCevjqAsoGjhtkgO1y1EEvtIuL5XyNtaCfCzDwO4JmBJ55JBh5R3B3RWfjku5/2oY6hAmLaSEPv0q70widld44rAfZmOpF3Tbj3Hqvs42/Xje0DLBlDz+UglOuE4z/WEjexKxyz9H+fHMz2RQ8aI1XaSHjguKAg1BizrXqmpK4j6o4ZzJVTjWic9+gHo4cYVO1GJbektGZN9JpIZ/4f1VpCJwe0WVVivCvjAh4V4GlKpbrFMeT9mN5LOv7asbiYYj/ZipYm/LbU8Sk/p9CAYAvUumm5g3bDHotTDn/y6SK4BKh9msBmqD6fZNf9CG/n3nkRZ9zmYG8IHv9+YciPj2YIkxrW8dT6Piq9vSyBPr06yHprmM+Oeu1b1ZnA8rn9pDD8CE9xLAum49xhoHBLvcYK1QmZQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0pQQ1hpa1l2RWZNaGRVaWIzdXBsazZZWWdHbythT3ZHMVhaMk1XYzJFaTdH?=
 =?utf-8?B?RkNoT0hZeG1OY20yb2FoTVlSMDlQWHJDZ3RLdjJyWklyTUZOajZDLytBcmsx?=
 =?utf-8?B?b3lyMXFrWklIZ0VhUU41ME5yYm14K1hsWUU3SUJhaTUvcDAzSzgyUlVxLzVk?=
 =?utf-8?B?NXhmZ1JMT29KWXMxeGNQWEdONEJrRzhoVHlzR3liSnNwVXVFT1QyeHp2WHNt?=
 =?utf-8?B?dDN0VVo5UUVXV3IrV0dXZ2xpNW1YQW5pdWM3ZGh5ejMyeXAvbjBZbkRObzkv?=
 =?utf-8?B?T2JLSzR3ckl5SWtZQmZKOXF4ZmVDKzhMaTloQytVT1lDbWlKbW9pTlNwOFhq?=
 =?utf-8?B?MGptRXRCQ2JQd1hoOUNJYlBRRFJBa0tUaHlYZjFiUktkQno4OFdPekVSbmM5?=
 =?utf-8?B?Rm9kUTVRMW1CN1JtM0NRQVB6N1h2eE5zdThRV0dEYnMyTlpNaTR1Znd3RmJF?=
 =?utf-8?B?Kyt2MDdYS3ZxN3lVMy9YY0VnYjFQMk5aUnRCczNyaTltYlNqQ0FJdEZ4QnVh?=
 =?utf-8?B?VGpoNjUrais1OVVwK2FuSlZzU3lTbENBdi9hU3hlME12QXJXMDF5ZnNlQ0FJ?=
 =?utf-8?B?eldSRVZOcE9HQVptMHpWdTUvbzVlc3lXYTV3SFlDWXNPQjhIci9iaFJRMXRV?=
 =?utf-8?B?SFJJMzc5SkM2M0pmd0RTbUhrSEV1R1R1YXpWd1ZMQXc4bm1EK1ZBVkVFVGZL?=
 =?utf-8?B?VFZhNGZteWQvNjBzdE1yd1dqWGNWNFNnWElSTHpaWVhYMVR1eEx4cS9mNlJC?=
 =?utf-8?B?azZGT3BSdTlPN3pMY3FYOEZ1UWpRcmQxMmpvUVZhaDl6SCtBVktMNXdMbHVO?=
 =?utf-8?B?MEIwQnFBWW9ScElpVkR6UE11NVkrTy80Zzd2QU1xTmNLMUI0NDhvY3lobGJq?=
 =?utf-8?B?OFRGM1Y1VXF1V2lZODJYbFEydXpKVjkzWm1tbitKTzloZnZoKzBMVlAvdFFM?=
 =?utf-8?B?RmJxQzl4QldVamFpVmZJM2FEWmRkV1h4OVdnRXJTeFluZGMyZ2pDcCtUd0oy?=
 =?utf-8?B?bVpZRkhJZ2JLNCtBVWxMVUVuUWs3S09kN2hNbGxueEF2R2gzdThwY1lWejJp?=
 =?utf-8?B?alAwWWpYdHdVWjI2RG9YYVJkWlcxTWMrZDVNeGlaYmFkcTFtMlU5c2pBa3ZG?=
 =?utf-8?B?VVpKamUzaEQ0aGlLSm1wZnc0WkRoeHpjOXJKZWF6WFhpMXNmNzh6eXNsbVRt?=
 =?utf-8?B?VU0yN2I0b0kvY2VkRFp6VjJoSC84aTZZblNRbFk4RnI5Si9MalN2a2o4R0Vj?=
 =?utf-8?B?VkkvdTI5cFBwMmhvWGx0eTU0MUpxMjhZZzlqOVBVeVhRTWNFTUcweGlOVkpk?=
 =?utf-8?B?eEdLZ1BtRlVGN1lzN2dIcWZhazlWcHNNaUNKeC91WVFrdW1KVllSYmltNldH?=
 =?utf-8?B?WS9OSE1rVnNQWVBleTA0Y3NVRVBzbHpyWngxRkR1c2VvWEN6NDJXYXM5djhT?=
 =?utf-8?B?aUpneEhpbjU2OVYxckVWa0gwRVZUTHRndlpQOWZselBSUE9OUFRXdlhwRHZU?=
 =?utf-8?B?TjNycld3bFFzV3FrNlZYUnVrdUJZMlZMVGxDNWRncGNNdDc3TDZzYk1kMHZz?=
 =?utf-8?B?NGN3Ykx6NEdSTXVoaTBkL2dsd1pENHhUa1VYclBDd3Z1THR4TFNkU0wwZzBQ?=
 =?utf-8?B?WjNDcWpsTk14Y05TeTBWSENkMGhINVk2cjJrSGlMMWxUdWZxWlJRdmlNWHQx?=
 =?utf-8?B?c1pGSWcrbTVXT0FMMHNNTEIraWtpZ3JOSGc1L2lzWlYrdW5ITkhPOWlUWVV2?=
 =?utf-8?B?M0xpZ3dsTWh3WEpHanZ0VnJ1SGxHaTZGelRKeFhYRi82b2s5UlNUaDZ2RHk5?=
 =?utf-8?B?b1ZNZktSTGFUaTZlaEVNSHhrSFJiODRTcCtCL3VXek1ELzNxMTM4TXNOZnRu?=
 =?utf-8?B?cE9EUm9RWnJQNjFhOEZFM1BobG5za3VobGd1ZHpPYzV6ZmV3K3Jmb0ptZDQ1?=
 =?utf-8?B?Q3FuSGt2VVBKckR4TXZwbW1IYVZQb1RZQzQ4THFBMVIyclJDSUtPQkVKYlpB?=
 =?utf-8?B?SkJxNUdZNjVja1YxZnZQUHlPVmROYXUvaURvajZuTnE5azltb1EvTk1KWU9x?=
 =?utf-8?B?MkQrSDVFVkpCSUM5aFZha1BaSy9SNUFmVmN4WmtYUEdYamtxcSt5ZXBzbU0z?=
 =?utf-8?B?YkVVOS8rWUhocnlvdjNRNitpcWNEWGJmajZiZGdLZnhleis4SzlmWlBvYVlI?=
 =?utf-8?B?emdRaUoxMHBKS2sxdUd1M2NVQitVTGRzazRkTlA2d3NjN1ZJazhIanpHK0hB?=
 =?utf-8?B?aU9DR0pJbi9JWXZuZnFLZENTZVdCTGFOTzJRQitxbXdrak5iYkY4ZGVuRlZk?=
 =?utf-8?B?SjVsRnZuQnZWZUp6djVsa1BZODVhWTdTbTNmcXZHeUdTcDJvKy84eERoU2lq?=
 =?utf-8?Q?fFDDeebhnearr0uo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADCD9321F965464EB0338FF9440EDCC0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5a0e62-04f4-42df-b5ce-08de9f825f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 08:45:42.4195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2eKGvrTJ2gULP/Vr2PToSHm5X4PnRzz+K3APpO2DoJHyq+frq3b5VUx6LkfQC/6Tpd4JGB3OW2yc1si1ZHx9zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8708
X-purgate-ID: tlsNG-c1860d/1776761148-38567DB1-40760364/0/0
X-purgate-type: clean
X-purgate-size: 826
X-Spamd-Result: default: False [-1.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.707];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 221FE438545
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8yMS8yNiAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjA0LjIwMjYgMDk6
NTcsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gV2l0aCBSZWdpb24gSUQgZW5hYmxlZCwgYWxs
IENQVSBtZW1vcnkgYWNjZXNzZXMgbmVlZCB0byBoYXZlIHJnaWQgYml0cw0KPj4gc2V0IGluIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzLiBUaGlzIGNyZWF0ZXMgYSBwcm9ibGVtIGZvciBQQ0kgQkFSDQo+
PiBhY2Nlc3NlcywgYXMgaXQgd291bGQgcmVxdWlyZSBhbGwgQkFScyB0byBiZSA2NGJpdC4NCj4g
DQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLiBDUFUgYWNjZXNzZXMgb2YgYWRkcmVzc2VzIHJl
YWQgLyBkZXJpdmVkIGZyb20NCj4gQkFScyBjYW4gYmUgbWFzc2FnZWQgaW4gYW55IHdheSB0aGUg
T1MgbGlrZXMuIFRoYXQgZG9lc24ndCByZXF1aXJlIHRoZQ0KPiBCQVJzIHRvIGJlIDY0LWJpdC4g
QXJlIHlvdSB0cnlpbmcgdG8gYXJyYW5nZSBmb3IgUkdJRCB0byBiZSB0cmFuc3BhcmVudA0KPiB0
byBndWVzdHM/DQo+IA0KPiBKYW4NCg0KWWVzLCBtYWtpbmcgaXQgdHJhbnNwYXJlbnQgdG8gZ3Vl
c3RzIGlzIHRoZSBnb2FsLg0KDQotLSANCk15a3l0YQ==

