Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127DA4018AB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 11:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179530.325837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAhl-0004hA-OT; Mon, 06 Sep 2021 09:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179530.325837; Mon, 06 Sep 2021 09:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAhl-0004di-Jw; Mon, 06 Sep 2021 09:14:17 +0000
Received: by outflank-mailman (input) for mailman id 179530;
 Mon, 06 Sep 2021 09:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykgp=N4=epam.com=prvs=9883458851=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNAhj-0004dc-E4
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 09:14:15 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd8057ca-0ef2-11ec-b09c-12813bfff9fa;
 Mon, 06 Sep 2021 09:14:13 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18664TJi010446; 
 Mon, 6 Sep 2021 09:14:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0b-0039f301.pphosted.com with ESMTP id 3awdcp0hpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 09:14:10 +0000
Received: from DB8PR03MB6329.eurprd03.prod.outlook.com (2603:10a6:10:13e::9)
 by DB9PR03MB7243.eurprd03.prod.outlook.com (2603:10a6:10:220::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 09:14:06 +0000
Received: from DB8PR03MB6329.eurprd03.prod.outlook.com
 ([fe80::14ca:2f6f:15bd:3470]) by DB8PR03MB6329.eurprd03.prod.outlook.com
 ([fe80::14ca:2f6f:15bd:3470%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:14:06 +0000
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
X-Inumbo-ID: cd8057ca-0ef2-11ec-b09c-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxJo+4xILY1PE3eZqZCVGaGq+uaQznYVxCBenToiXsKsRTzu3ugXq0n+zrztyOQ1D43m9/vCBl3ARXd1m6LHkfI/gr2y/HxeQxVAURGyh73e2bnNaHzmCEFhi10QTJ3RZtxozP/k8KClb4PET7q24ElXrLS+yEvtJBzTTlMSYSzNkdcrtGti1CN18UjuTj2k9VIk/kgrQc+LogGdo5AFsuWgd7c+1+DrjkuPnzw/jF9gg+FTNcfMCQYWiYJw37GtgMiEWhLHBPREkYJ2oOi7Je90N3tp7DREh+syRXfW5vjz2R/qJk3+UTnUZRDfsGmdMidB/TvpJuqrhNp0vnuGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6req6beNU/YGZj4m82FSm1lkYHxl5L6WrIjISmnzq9I=;
 b=JnAad68rzEAwhiClHf6VKuhwnr2kvoYijPnUOadXRysC5mBo4JzEPgj1bkvMD4jQclsYaroXv4EzH+tAw8OqFVT817YLm+b8w8AnsmzAj8W/Mr94/1lojJtwKP6Pi6qWRqT385Jzj3EQO2/nfCxEtybAse6dWX1rQRzL0B1bIBxXICO0cRaVpV62HxiPFIBuw9/M1uK19/7SwkOD2bMws62nAyYhwjF3lTEuC/R3EkZql1g9EWjJKaaS0CPcf7NnWm6OXBK9+JDizQkb85DMiBmqBFNG26T6Ppk3r6sUiN4TvsFdZd2FZZNFkVcPlUQiktWPISkGYnhksodKgfIhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6req6beNU/YGZj4m82FSm1lkYHxl5L6WrIjISmnzq9I=;
 b=3yrcfv8bhJlnIwF7513v/GukUl9eLosHzIoso61ax11LmBE7RF0JJRFMPxyyhJEwAK0I18aZPbshPRqk0a1GJUdkuL+EhhAyam6ujDq9+8bScOWHvzNc5o+BQQIGcxbMMRTJ3K9e49Q/8pAGQs3vi002VVS6U0SdO40E6e++iaM5r6WztUO3s9S4OSSo0Nxx24PNBD1QCHUSv3T7ndDoLYAqekcNq9yywVyQj+XUl6VXauvuEQheOzLn2V4GcZa50AaQrK1g0HgwljGXeYGGQAQjR4Xo4mcp7LmwPhE959NmvMFjFT+o7eYOcq2gAeo+1MyMBvn/U9LP3hviaxS8Pg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Topic: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Index: AQHXoJ51zxJWpxhHEEGXNqYYBqazw6uSBESAgASU4wCAAB15AIAABzeA
Date: Mon, 6 Sep 2021 09:14:06 +0000
Message-ID: <b5b761bd-f5d7-34e6-691d-735af7c8b0ae@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
 <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
 <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
In-Reply-To: <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20f18d5d-4b87-4d45-d5d6-08d97116ad77
x-ms-traffictypediagnostic: DB9PR03MB7243:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB9PR03MB724317053005879A689405BFE7D29@DB9PR03MB7243.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MgKIuLBizgFk/yy+aaCHwtitXP0QG48p7ikmTbZlXsQQNRxUZVkifJzOF4cvvIEq3u8nKPbj8x7JY0aX2rbkYmKS1pa2EPpEiAUlbem2xntnEoPz50lZjeJlktH2fcUqAmZsZULCes9DMfySPoQsWyrEtdI9HtiQ/vqVdeXYNgvMncvidzT6i7SSPgtZDLr2iDS7pN/0sWMsH4vhwW5M7+anheMt3JjyQwgsCpmBiazbrrHuW/OGvEBCqUlxJbFi8fBkM8KHQPcBVNOKuetmvB8LhOF6j4ZgOul9vK6AtRQPhn/HItrEBG8nes8081E9liW9vnhylfCTJHuBfBYwqdqNtni38/nnyBquCDFCBf1CPq7hvk8KABw7S1xZtEcHRT4durDenKGTaL0j9/HXdmDNMKvGMVAsHlmaQHqxJZLXWr8EJ1nw1MIIbSVipA+vhCz2pjCXJP6hSZj3wYyGieAf4B2RHxD2ggAytG5PB8f9WnWWRNYJZ54MeBqdrbLqXgvCky1y1TyU2rLVf4AwjRS2JCM1TEkm6e6J0QSxRwYoQRnKV3/KZj25tQA2Aspyu+OAOI+Q5WbIl0BK2s4SentuH7iSeJtMUIwGn3wXIi5RN1yLnWlP77XeCAxspb7xCf2X/z3fdM63C9TjwFDiamG3wiBgD8aeOHG0fJPvW8OYKglUK+V3uxQMrqwaASITAEWPHjlaufdIoa7SfZO/QcU8RWoaWR2vMFIEB4ERtFDqx1ZfXAWHLmlCP4sbaJHd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6329.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(8676002)(31696002)(64756008)(2906002)(66946007)(66446008)(478600001)(4326008)(76116006)(8936002)(38070700005)(91956017)(71200400001)(316002)(31686004)(54906003)(110136005)(26005)(36756003)(86362001)(53546011)(6512007)(186003)(5660300002)(122000001)(83380400001)(38100700002)(6506007)(6486002)(2616005)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFFudVVDT2JxYVhoTm9YUWVkU2dYWDE3aHZSLzlWRmx0cUdFRUYxOEQ5RTNG?=
 =?utf-8?B?dDJwVzJobFFmS1UvL0NzV3ZEQ1I3WkVpSFRPdkN1QXowUCt3ZWxzOCtDWG5j?=
 =?utf-8?B?em9saVgreElQY2lIdGxTL1VGT3NtWXR4NkZOcDBFaFdzeTFBemRJSWMxUHhY?=
 =?utf-8?B?dUowTkdlc2lLejAvcm1tbGMrVlpONUtTUURzUnVERlFabCtxczFhRTFUS05h?=
 =?utf-8?B?d3NmUjk3WXJocjg1Q3I4SGdwRTFET3UrV0FyUTJuQ1JFWHdWM3NieHdwOG5L?=
 =?utf-8?B?MDAwQ2pIVk1YVGFUczI1VEdJdUF1ZVV4SEhXaStBL0JnUXN6N1JCQlZuQzlm?=
 =?utf-8?B?UGk2Y0dBSm9SVXVOdTRXOVBOejFpQ0xRQW1aTFlkZWdvcTVRTjdYTnNtaGRC?=
 =?utf-8?B?WGJXREpGZWFiMDdBcmtmQ0FuQ0RCZElJUHZsdjIycWpYdnlrbENuZURYSkRR?=
 =?utf-8?B?YVdnSnFhcDRpbVV5L3UwL3JqNVgxWERaNWtUa2tCVDlVSFlXay9XWERtdlZ6?=
 =?utf-8?B?WkI5Rk82SHV3RWVtNWNqa3RuajF0M21INFIzdWpKMERGODBTUnVOckhvQ2lC?=
 =?utf-8?B?Wk52VjlkNkFFcWxtbEtYRnFqb0p1ejlUZE1xTHJUc0R6MC9BREcwWTZGb2FP?=
 =?utf-8?B?MFM2N1BLSHhYcGV3cE5kazJpZ1ppVTlLRlFHamRYeWsrRXcvbllwWmlxN1Ez?=
 =?utf-8?B?UWFYQUZXSUZlSVNLaTlBUjNHMUs3SCsyVnNjSzE1WG00VU5FNHdkMmZBRWZn?=
 =?utf-8?B?RXZxWEt6RTI2RGQ4dmREYVBoVXhnSEZ3RjJsSWEvRUpsUzhzUTBzSUJHN1Rm?=
 =?utf-8?B?S21jdTQzRnEzQ0xIYWs4ZmFYUkxZWWZoNWdjMmcreHZWSFlOQWU2cDluUDhK?=
 =?utf-8?B?NVZybEVBbWt6Q3pVcWRUQzNVOUVNV2k4WXJEUnBsK0IwdEZuWHJHemptRElp?=
 =?utf-8?B?eitoZDk2OHphSU16UkVkaTVDcU5zN1dxc3pxUjhKanhPZzV0WXNuYyt4SDc3?=
 =?utf-8?B?RXJnVlFBMGhJY2ZNNDh3cS81MndEenFsRE9MVkFHRTkya2dubFY0RXNoUXlQ?=
 =?utf-8?B?Y2JDUDJ0MjI5UUo1bnhrbTZqazZqN1Y4TDBMQmhuRWxYU25UOUd2NDBiYXZJ?=
 =?utf-8?B?QTR1Y1I4T0MwM3R4WGlBL2lOV2l3RTB1VzBDN3MrOUx0ZDVzMlppc0sveThp?=
 =?utf-8?B?VDdabEhVb0pCaUZGRG1vQ2c5dUIrdG82QnVUNzlVZXZwcUp0ZlBmU3NPTm5o?=
 =?utf-8?B?UlhBeHl3a2t0SktibEtxU2FiZXNxN3FiTFVjOG9yaDRxaXkzY2V4RGg1NWMr?=
 =?utf-8?B?enRXMkJNNVB0WjJ0cTJTMWJCWmh2TDRNd1YybHdrOEx0SnBxNjloTU54d2Ra?=
 =?utf-8?B?Rk4raGp6d0EyQ1I4NGhlQkkrMUJvQlJnbys4MGRXMFFLYXlWUHlQNUd5WTEw?=
 =?utf-8?B?ZUROZFJ0YzBxWDU2TjlJdHVXTit0WHlBWXJ0OXNQajNOcTgvZFYzYnNLL0dU?=
 =?utf-8?B?N2JkUkpxQ0VGbzIvTDU3WFpkcEp0dVV5aW44a2NtTmp0c1VXb0dPS2JhSzZp?=
 =?utf-8?B?YS9rdlNVNmNNRm9ZNGF5b1E1RWV4SU1kRUJSQVhod25mdnJhU3BCVHhYTGpa?=
 =?utf-8?B?VUJ0T0F2Qm1hejltYzh2NUxUOU9EcGhBNUtjZnlwaDk1WjZZRnAyNDY2dFpt?=
 =?utf-8?B?L1lKWXNJdWVIREJtVTVKWVRObm5IUXpwcGFXdklMWEU4Tzh4czhsbHUvaXgv?=
 =?utf-8?Q?/usaBxQ7b5SpCYvzENfJkpOaf05gUa4O8ykePfz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1A72FC2385BAF40A9FFB33EF81D11A8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6329.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f18d5d-4b87-4d45-d5d6-08d97116ad77
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 09:14:06.2041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FatD2sSPMF/bjlKo/M2LPmR1YETF4+WMxSv6B/UJFgOHlVNOznciCizzbXEMIvrD5sc7+Nq7ObaAY/Xv4ENYzZMTb3Qkl44S12ThFlK+bZHrDzduox13wDCoeMjlJ4Sy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7243
X-Proofpoint-GUID: TRDYvTpmQRXsf1pZnLJxxhhY9FGGApxx
X-Proofpoint-ORIG-GUID: TRDYvTpmQRXsf1pZnLJxxhhY9FGGApxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_04,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060059

DQpPbiAwNi4wOS4yMSAxMTo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiAwNi8wOS8yMDIx
IDA4OjAyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLCBKdWxpZW4hDQo+
DQo+IEhpIE9sZWtzYW5kciwNCj4NCj4+IE9uIDAzLjA5LjIxIDEyOjA0LCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4gSGkgT2xla3NhbmRyLA0KPj4+DQo+Pj4gT24gMDMvMDkvMjAyMSAwOTozMywg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4g
dlBDSSBtYXkgbWFwIGFuZCB1bm1hcCBQQ0kgZGV2aWNlIG1lbW9yeSAoQkFScykgYmVpbmcgcGFz
c2VkIHRocm91Z2ggd2hpY2gNCj4+Pj4gbWF5IHRha2UgYSBsb3Qgb2YgdGltZS4gRm9yIHRoaXMg
dGhvc2Ugb3BlcmF0aW9ucyBtYXkgYmUgZGVmZXJyZWQgdG8gYmUNCj4+Pj4gcGVyZm9ybWVkIGxh
dGVyLCBzbyB0aGF0IHRoZXkgY2FuIGJlIHNhZmVseSBwcmVlbXB0ZWQuDQo+Pj4+IFJ1biB0aGUg
Y29ycmVzcG9uZGluZyB2UENJIGNvZGUgd2hpbGUgc3dpdGNoaW5nIGEgdkNQVS4NCj4+Pg0KPj4+
IElJVUMsIHlvdSBhcmUgdGFsa2luZyBhYm91dCB0aGUgZnVuY3Rpb24gbWFwX3JhbmdlKCkgaW4g
eGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuIFRoZSBmdW5jdGlvbiBoYXMgdGhlIGZvbGxvd2luZyB0
b2RvIGZvciBBcm06DQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgICogQVJNIFRPRE9zOg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIC0gT24gQVJN
IHdoZXRoZXIgdGhlIG1lbW9yeSBpcyBwcmVmZXRjaGFibGUgb3Igbm90IHNob3VsZCBiZSBwYXNz
ZWQNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgdG8gbWFwX21taW9fcmVnaW9ucyBpbiBv
cmRlciB0byBkZWNpZGUgd2hpY2ggbWVtb3J5IGF0dHJpYnV0ZXMNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgKsKgwqAgc2hvdWxkIGJlIHVzZWQuDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICoNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgKiAtIHt1bn1tYXBfbW1pb19yZWdpb25zIGRvZXNuJ3Qgc3Vw
cG9ydCBwcmVlbXB0aW9uLg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+DQo+Pj4gVGhp
cyBkb2Vzbid0IHNlZW0gdG8gYmUgYWRkcmVzc2VkIGluIHRoZSB0d28gc2VyaWVzIGZvciBQQ0kg
cGFzc3Rocm91Z2ggc2VudCBzbyBmYXIuIERvIHlvdSBoYXZlIGFueSBwbGFuIHRvIGhhbmRsZSBp
dD8NCj4+DQo+PiBObyBwbGFuIHlldC4NCj4+DQo+PiBBbGwgdGhlIG1hcHBpbmdzIGFyZSBoYXBw
ZW5pbmcgd2l0aCBwMm1fbW1pb19kaXJlY3RfZGV2IGFzIG9mIG5vdy4NCj4NCj4gU28gdGhpcyBh
ZGRyZXNzIHRoZSBmaXJzdCBUT0RPIGJ1dCBob3cgYWJvdXQgdGhlIHNlY29uZCBUT0RPPyBJdCBy
ZWZlcnMgdG8gdGhlIGxhY2sgb2YgcHJlZW1wdGlvbiBvbiBBcm0gYnV0IGluIHRoaXMgcGF0Y2gg
eW91IHN1Z2dlc3QgdGhlcmUgYXJlIHNvbWUgYW5kIGhlbmNlIHdlIG5lZWQgdG8gY2FsbCB2cGNp
X3Byb2Nlc3NfcGVuZGluZygpLg0KPg0KPiBGb3IgYSB0ZWNoIHByZXZpZXcsIHRoZSBsYWNrIG9m
IHByZWVtcHRpb24gd291bGQgYmUgT0suIEhvd2V2ZXIsIHRoZSBjb21taXQgbWVzc2FnZSBzaG91
bGQgYmUgdXBkYXRlZCB0byBtYWtlIGNsZWFyIHRoZXJlIGFyZSBubyBzdWNoIHByZWVtcHRpb24g
eWV0IG9yIGF2b2lkIHRvIG1lbnRpb24gaXQuDQoNCldlbGwsIHRoZSBjb21tZW50IHdhcyBub3Qg
YWRkZWQgYnkgbWUgKGJ5IFJvZ2VyIEkgZ3Vlc3MpLCBJIGp1c3Qga2VlcCBpdC4NCg0KQXMgdG8g
dGhlIHByZWVtcHRpb24gYm90aCBtYXAgYW5kIHVubWFwIGFyZSBoYXBwZW5pbmcgdmlhIHZwY2lf
cHJvY2Vzc19wZW5kaW5nLCBzbw0KDQp3aGF0IGlzIHRydWUgZm9yIG1hcCBpcyBhbHNvIHRydWUg
Zm9yIHVubWFwIHdpdGggdGhpcyByZXNwZWN0DQoNCj4NCj4+DQo+Pj4NCj4+Pj4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gwqDCoCB4ZW4vYXJjaC9hcm0vdHJhcHMuYyB8
IDYgKysrKysrDQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4+
Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0v
dHJhcHMuYw0KPj4+PiBpbmRleCAyMTlhYjNjM2ZiZGUuLjE1NzFmYjhhZmQwMyAxMDA2NDQNCj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Ry
YXBzLmMNCj4+Pj4gQEAgLTM0LDYgKzM0LDcgQEANCj4+Pj4gwqDCoCAjaW5jbHVkZSA8eGVuL3N5
bWJvbHMuaD4NCj4+Pj4gwqDCoCAjaW5jbHVkZSA8eGVuL3ZlcnNpb24uaD4NCj4+Pj4gwqDCoCAj
aW5jbHVkZSA8eGVuL3ZpcnR1YWxfcmVnaW9uLmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL3ZwY2ku
aD4NCj4+Pj4gwqDCoCDCoCAjaW5jbHVkZSA8cHVibGljL3NjaGVkLmg+DQo+Pj4+IMKgwqAgI2lu
Y2x1ZGUgPHB1YmxpYy94ZW4uaD4NCj4+Pj4gQEAgLTIzMDQsNiArMjMwNSwxMSBAQCBzdGF0aWMg
Ym9vbCBjaGVja19mb3JfdmNwdV93b3JrKHZvaWQpDQo+Pj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4+
IMKgwqAgI2VuZGlmDQo+Pj4+IMKgwqAgK8KgwqDCoCBsb2NhbF9pcnFfZW5hYmxlKCk7DQo+Pj4+
ICvCoMKgwqAgaWYgKCBoYXNfdnBjaSh2LT5kb21haW4pICYmIHZwY2lfcHJvY2Vzc19wZW5kaW5n
KHYpICkNCj4+Pg0KPj4+IExvb2tpbmcgYXQgdGhlIGNvZGUgb2YgdnBjaV9wcm9jZXNzX3BlbmRp
bmcoKSwgaXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgc29tZSByZXdvcmsgdG8gZG8gZm9yIGd1ZXN0
LiBEbyB5b3UgcGxhbiB0byBoYW5kbGUgaXQgYXMgcGFydCBvZiB0aGUgdlBDSSBzZXJpZXM/DQo+
PiBZZXMsIHZQQ0kgY29kZSBpcyBoZWF2aWx5IHRvdWNoZWQgdG8gc3VwcG9ydCBndWVzdCBub24t
aWRlbnRpdHkgbWFwcGluZ3MNCj4NCj4gSSB3YXNuJ3QgcmVmZXJyaW5nIHRvIHRoZSBub24taWRl
bnRpdHkgbWFwcGluZ3MgaGVyZS4gSSB3YXMgcmVmZXJyaW5nIHRvIFRPRE9zIHN1Y2ggYXM6DQo+
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogRklYTUU6IGluIGNhc2Ugb2YgZmFpbHVyZSByZW1vdmUgdGhlIGRldmljZSBmcm9tIHRoZSBk
b21haW4uDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIE5vdGUgdGhhdCB0aGVyZSBtaWdo
dCBzdGlsbCBiZSBsZWZ0b3ZlciBtYXBwaW5ncy4gV2hpbGUgdGhpcyBpcw0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxs
IGxpa2VseSBuZWVkIHRvIGJlDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGtpbGxlZCBp
biBvcmRlciB0byBhdm9pZCBsZWFraW5nIHN0YWxlIHAybSBtYXBwaW5ncyBvbg0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBmYWlsdXJlLg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ki8NCj4NCj4gWW91IHN0aWxsIGhhdmUgdGhlbSBhZnRlciB0aGUgc2VyaWVzIHJld29ya2luZyB0
aGUgdlBDSS4gQXMgZm9yIHRoZSBwcmVlbXB0aW9uIHRoaXMgaXMgT0sgdG8gaWdub3JlIGl0IGZv
ciBhIHRlY2ggcHJldmlldy4gQWx0aG91Z2gsIHdlIHdhbnQgdG8gYXQgbGVhc3QgdHJhY2sgdGhl
bS4NClBsZWFzZSBzZWUgYWJvdmU6IGJvdGggbWFwIGFuZCB1bm1hcCBhcmUgaGFwcGVuaW5nIHZp
YSB2cGNpX3Byb2Nlc3NfcGVuZGluZw0KPg0KPj4+DQo+Pj4+ICsgcmFpc2Vfc29mdGlycShTQ0hF
RFVMRV9TT0ZUSVJRKTsNCj4+Pj4gK8KgwqDCoCBsb2NhbF9pcnFfZGlzYWJsZSgpOw0KPj4+PiAr
DQo+Pj4NCj4+PiDCoEZyb20gbXkgdW5kZXJzdGFuZGluZyBvZiB2Y3BpX3Byb2Nlc3NfcGVuZGlu
ZygpLiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gdHJ1ZSBpZiB0aGVyZSBhcmUgbW9yZSB3b3Jr
IHRvIHNjaGVkdWxlLg0KPj4gWWVzDQo+Pj4gSG93ZXZlciwgaWYgY2hlY2tfZm9yX3ZjcHVfZm9y
X3dvcmsoKSByZXR1cm4gZmFsc2UsIHRoZW4gd2Ugd2lsbCByZXR1cm4gdG8gdGhlIGd1ZXN0IGJl
Zm9yZSBhbnkgd29yayBmb3IgdkNQSSBoYXMgZmluaXNoZWQuIFRoaXMgaXMgYmVjYXVzZSBjaGVj
a19mb3JfdmNwdV93b3JrKCkgd2lsbCBub3QgYmUgY2FsbGVkIGFnYWluLg0KPj4gQ29ycmVjdA0K
Pj4+DQo+Pj4gSW4gdGhpcyBjYXNlLCBJIHRoaW5rIHlvdSB3YW50IHRvIHJldHVybiBhcyBzb29u
IGFzIHlvdSBrbm93IHdlIG5lZWQgdG8gcmVzY2hlZHVsZS4NCj4+IE5vdCBzdXJlIEkgdW5kZXJz
dGFuZCB0aGlzDQo+DQpJIHdhcyBtb3JlIHJlZmVycmluZyB0byAiSSB0aGluayB5b3Ugd2FudCB0
byByZXR1cm4gYXMgc29vbiBhcyB5b3Uga25vdyB3ZSBuZWVkIHRvIHJlc2NoZWR1bGUuIg0KPiBU
aGUgcmV0dXJuIHZhbHVlIG9mIGNoZWNrX2Zvcl92Y3B1X2Zvcl93b3JrKCkgaW5kaWNhdGVzIHdo
ZXRoZXIgd2UgaGF2ZSBtb3JlIHdvcmsgdG8gZG8gYmVmb3JlIHJldHVybmluZyB0byByZXR1cm4g
dG8gdGhlIGd1ZXN0Lg0KPg0KPiBXaGVuIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkgcmV0dXJucyB0
cnVlLCBpdCB0ZWxscyB1cyB3ZSBuZWVkIHRvIGNhbGwgdGhlIGZ1bmN0aW9uIGF0IGxlYXN0IG9u
ZSBtb3JlIHRpbWUgYmVmb3JlIHJldHVybmluZyB0byB0aGUgZ3Vlc3QuDQo+DQo+IEluIHlvdXIg
Y3VycmVudCBpbXBsZW1lbnRhdGlvbiwgeW91IGxlYXZlIHRoYXQgZGVjaXNpb24gdG8gd2hvZWV2
ZXIgaXMgbmV4dCBpbiB0aGUgZnVuY3Rpb24uDQo+DQo+IEl0IGlzIG5vdCBzYWZlIHRvIHJldHVy
biB0byB0aGUgZ3Vlc3QgYXMgbG9uZyBhcyB2cGNpX3Byb2Nlc3NfcGVuZGluZygpIHJldHVybnMg
dHJ1ZS4gU28geW91IHdhbnQgdG8gd3JpdGUgc29tZXRoaW5nIGxpa2U6DQo+DQo+IGlmICggdnBj
aV9wcm9jZXNzX3BlbmRpbmcoKSApDQo+IMKgIHJldHVybiB0cnVlOw0KLS0tIGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMNCg0KKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMNCkBAIC0yMjkxLDYgKzIy
OTEsOSBAQCBzdGF0aWMgYm9vbCBjaGVja19mb3JfdmNwdV93b3JrKHZvaWQpDQogwqB7DQogwqDC
oMKgwqAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Ow0KDQorwqDCoMKgIGlmICggdnBjaV9wcm9j
ZXNzX3BlbmRpbmcoKSApDQorwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCisNCiDCoCNpZmRlZiBD
T05GSUdfSU9SRVFfU0VSVkVSDQogwqDCoMKgwqAgaWYgKCBkb21haW5faGFzX2lvcmVxX3NlcnZl
cih2LT5kb21haW4pICkNCiDCoMKgwqDCoCB7DQpEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSB0
aGlzPw0KDQoNCj4NCj4+Pg0KPj4+IEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIHJlc3Qgb2YgdGhl
IGNvZGUsIHdlIGFscmVhZHkgaGF2ZSBhIGNoZWNrIGZvciB2cGNpIGluIHRoZSBjb21tb24gSU9S
RVEgY29kZS4NCj4+DQo+PiBXaGljaCBtYXkgbm90IGJlIGVuYWJsZWQgYXMgaXQgZGVwZW5kcyBv
biBDT05GSUdfSU9SRVFfU0VSVkVSLg0KPg0KPiBSaWdodC4gTXkgcG9pbnQgaXMgd2hlbiBDT05G
SUdfSU9SRVFfU0VSVkVSIGlzIHNldCB0aGVuIHlvdSB3b3VsZCBlbmQgdXAgdG8gY2FsbCB0d2lj
ZSB2cGNpX3Byb2Nlc3NfcGVuZGluZygpLiBUaGlzIHdpbGwgaGF2ZSBhbiBpbXBhY3QgaG93IG9u
IGxvbmcgeW91ciB2Q1BVIGlzIGdvaW5nIHRvIHJ1bm5pbmcgYmVjYXVzZSB5b3UgYXJlIGRvdWJs
aW5nIHRoZSB3b3JrLg0KDQpTbywgeW91IHN1Z2dlc3QgdGhhdCB3ZSBoYXZlIGluIHRoZSBjb21t
b24gSU9SRVEgY29kZSBzb21ldGhpbmcgY2FsbCBsaWtlDQoNCmFyY2hfdnBjaV9wcm9jZXNzX3Bl
bmRpbmc/IEluIGNhc2Ugb2YgeDg2IGl0IHdpbGwgaGF2ZSB0aGUgY29kZSBjdXJyZW50bHkgZm91
bmQgaW4gdGhlDQoNCmNvbW1vbiBJT1JFUSBzb3VyY2VzIGFuZCBmb3IgQXJtIGl0IHdpbGwgYmUg
bm9wPw0KDQpBbnkgYmV0dGVyIHN1Z2dlc3Rpb24gZm9yIHRoZSBuYW1lPw0KDQo+DQo+Pg0KPj4g
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGZvciB4ODYgaXQgaXMgYWx3YXlzIGVuYWJsZWQsIGJ1
dCB0aGlzIG1pZ2h0IG5vdCBiZSB0aGUgY2FzZSBmb3IgQXJtDQo+Pg0KPj4+IFNvIHdlIHdvdWxk
IGVuZCB1cCB0byBjYWxsIHR3aWNlIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkuDQo+PiBTbywgaWYg
Q09ORklHX0lPUkVRX1NFUlZFUiBpcyBub3QgZW5hYmxlZCB0aGVuIHdlIGVuZCB1cCB3aXRoIG9u
bHkgY2FsbGluZyBpdCBmcm9tIHRyYXBzLmMgb24gQXJtDQo+Pj4gTWF5YmUgd2Ugc2hvdWxkIG1v
dmUgdGhlIGNhbGwgZnJvbSB0aGUgSU9SRVEgdG8gYXJjaC1jb2RlLg0KPj4NCj4+IEhtLiBJIHdv
dWxkIGJldHRlciB0aGluayBvZiBtb3ZpbmcgaXQgZnJvbSBJT1JFUSB0byBzb21lIG90aGVyIGNv
bW1vbiBjb2RlOiBmb3IgeDg2IChpZg0KPj4NCj4+IG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdCBh
Ym91dCBDT05GSUdfSU9SRVFfU0VSVkVSKSBpdCBpcyBieSBjb2luY2lkZW5jZSB0aGF0IHdlIGNh
bGwgdlBDSQ0KPj4NCj4+IGNvZGUgZnJvbSB0aGVyZSBhbmQgSU9SRVEgaXMgYWx3YXlzIGVuYWJs
ZWQuDQo+DQo+IEkgYW0gbm90IGF3YXJlIG9mIGFub3RoZXIgc3VpdGFibGUgY29tbW9uIGhlbHBl
ciB0aGF0IHdvdWxkIGJlIGNhbGxlZCBvbiB0aGUgcmV0dXJuIHRvIHRoZSBndWVzdCBwYXRoLiBI
ZW5jZSB3aHkgSSBzdWdnZXN0IHRvIHBvc3NpYmx5IGR1cGxpY2F0ZWQgdGhlIGNvZGUgaW4gZWFj
aCBhcmNoIHBhdGguDQpJIHNlZQ0KPg0KPiBDaGVlcnMsDQo+

