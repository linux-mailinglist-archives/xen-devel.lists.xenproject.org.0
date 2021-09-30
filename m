Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7841DFA7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200123.354530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzNV-0007MI-AY; Thu, 30 Sep 2021 16:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200123.354530; Thu, 30 Sep 2021 16:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzNV-0007Jm-7S; Thu, 30 Sep 2021 16:57:49 +0000
Received: by outflank-mailman (input) for mailman id 200123;
 Thu, 30 Sep 2021 16:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVzNT-0007Jg-E5
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:57:47 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 600dd42f-f30a-410c-ba18-8189be2f1fbb;
 Thu, 30 Sep 2021 16:57:46 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UGt4aW026779; 
 Thu, 30 Sep 2021 16:57:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bdh63r0fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 16:57:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6851.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Thu, 30 Sep
 2021 16:57:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 16:57:39 +0000
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
X-Inumbo-ID: 600dd42f-f30a-410c-ba18-8189be2f1fbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqFP0/pJp8jOQv9eMC8HRaXrZ6AtMaICPkm7Vxw/xHxWXzJywZZO+3iUMnKWJL1WumZy1FK0Y2/cv7UG9y+/JJG9Oc/+ew1ylPve3xJ5oOgNzONBfwVhTDcmzUFlmub+8YwFcEuNTOG0IsZCNFhOqO+5rYNlhqQjZoOJM/pEy810Dyc2y64U23JAGTphpKInafoDER7YJQJmoN2voPmPvw2GsKp2Cx9J0mxzNkKFnl8PVIekTvLBBUrWUpAAZLJsEPoDp25I03/GSZljsGlUgGi+U+DkSzUi+UgZLVKkBZWCOiK2Ip7Zp5iWuCSlvPMRbOICzqrMKMU7xmEIK1Ek1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uDoYUOXlLzB4VCICsvsP6JEGGAbdMCw2O3Y2VNCsizk=;
 b=FJeWVhgTfb0OTP5PU3xlBGtAkU7kzoTmiC1prjH1n5AniGTzRks3Vh1ydDXIlH+Z1VZrZhOZ6EoDN6ZXCN42tOtmlSz9i8wMAnYAkYvyOP0QSCRzUJK/hf7EeSI+syVsEqXht5pYc8Dy2JZLyjPDM0o/Hq5r0tY8ti0TNZ8bG0uH+vThVO267tJnEN0tymCf3vr3RfIuYWBS6DGo0qAcjBn8eErK/9ZWs8RhdSjC84qIq37lZl8FmU/gzL73ZENMajthTWtvVpslynAf5/wXy/9k2BbgSwilZJreFLnwDt2xY7xXWArDVfK/56UvACsVyOvMD5vn0J41PBl1r4bBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDoYUOXlLzB4VCICsvsP6JEGGAbdMCw2O3Y2VNCsizk=;
 b=he8Ti7QNhvH2mIeyGGQzMaYppaf5Ex+f1nQ5v5SVEE7cCVgi1D27RRTasvJfYbzX4rcIoacSKvX++L9y5VLT6hZHFsTQe6mKUoLVyBxECDLeJGeGAkEdsBPBsyqHz4VM2qemSrPXxXqu/cXxuJzJD+Ll6zlpXtbycD9O9zTEM+lQ+8n2DULgD4Zct9HzoJa7UkKymWlE5OBCE9DBdqJCTvuAWmFDqmxbEyG+WvYV6g+aeDgqm5P5zwkbTWqzcZ26eH598Otm9jev+GAO4eROKzE6xP9g3hzh7RNgZXDHzEeBj4D08LfF9bWPiHfAKo18XFPH17Zsiv8J2iiviSNyeg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul
 Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXtdAlBwDHpaYUBUq6q0PlsxoTp6u8Ra2AgACHPgA=
Date: Thu, 30 Sep 2021 16:57:39 +0000
Message-ID: <68a608f5-4159-5734-4c08-5a70ae9d3ff4@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
In-Reply-To: <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac2e953a-c141-4923-0a1c-08d98433694a
x-ms-traffictypediagnostic: AM9PR03MB6851:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB685123FF346B9FA271B909F9E7AA9@AM9PR03MB6851.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1/H9gWDTrFo6Kwb50QLUmQXg96FKmhlkKYbm/e9fv0LQZXyOZxbWkyI3Pp3KuKEHOL9CgQO/Zs/3NNhN7md667jXsdsA4konJqN0f3hOPy3duQPWRiizjU6oZqPNriRHbaQ/mkaPBEhYqZftdYY7wxqi9x5dsnII/cnoGrbUobqqKwXpTOp3Z3DlbYIzvGDOAqG7kgIIi8e8URZv5YHwyZwDyjTLxje2mHttsZwYNofx8O82l1brL/1h8L8f+fYlYdamLLI6Zzsj1JFwa7iwr85QWvh0dut3bGFMp+vrCaNtx0PM+SSuUBXkbs4Uj5kAiwvh6oNzijlPKeZiiV3TkCYN92amgVXXsv69cjflSQgbdbcp/UzC+Z1inrDOiYkgeoyk5kMVsTozdOpL9O2Cj/sW+X06w9QHRvFA7VHXI37/Im0npQZFQdeDYXt3Y5oakVTpCKwJP6ArKMoirvM8XsDgs0RTu20URwmiLhc3CvInRYRatqc2ZQBxm5aMTl7GZcaJ7oHoqe6bk0F+fIOtPkuQ0aGgXeB/yiAJh5WbgpFXsDf6r9jb8Oc88lvioQoFj63CiYNmoaTVSUgUiHNcDIbukCAjFtcrsvsb3C86PZLdJUHIuSM+K84Dwvh4hcV/BvpP6qv4EkUxxrTkLPsXLMf+lFkrM5HEBiI3FHUC6wwuYhzwGZybARidW52jTtWHJz7xHHgTtZvbIA2V6wlI62rQwSIOkDtjcb8WnwpyErbbx4PHxHnBnG1XB3WdDDN2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(66446008)(38070700005)(5660300002)(31696002)(6512007)(86362001)(31686004)(66476007)(71200400001)(64756008)(66556008)(6486002)(66946007)(91956017)(76116006)(2616005)(83380400001)(8676002)(122000001)(38100700002)(55236004)(6916009)(8936002)(6506007)(508600001)(4326008)(54906003)(316002)(36756003)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y01ySHQwUnZJLzdMYiswN1NIWFhpK05sdkR5dUlLWTVBUXdtNWFLenhKWnhM?=
 =?utf-8?B?S3N0NWwycThETlpKVkJTVm02MkNmRnVuVHRVYm5YM0ZEV3AwZ05XSlNnUi9T?=
 =?utf-8?B?OGwvWklVemhZbzIza2JXbUNHMTdVOW83QnpJWjh1bHFVYVlDQWU3RlRxRDNu?=
 =?utf-8?B?M01QbHhLZUx4Y1dkZ1NITXgvNThteVpRMjgrUHVNRzZKYVArSkRCRnJIN3ha?=
 =?utf-8?B?YU5FSzdpcXcvMDFKYUNHNVVOV0VqTlJsVUhyMmZJOHlsK1cyQ2F0VDFBdnY0?=
 =?utf-8?B?V2E4RFNkbnk1cUxybTFHY09GNjd6TkZDaFdRbHNGMWJnOXk3eCtvZUd0azZ0?=
 =?utf-8?B?QXJZT3F4VnZ5ajBhZDFpNktPTEFsbTRwWmJFNnhZV2hjMVliYm9idVhlNWF4?=
 =?utf-8?B?RjVEN3JNanZpTjlqMFVhZXJPWVhpdWxOdXVEVUdiVmR2c0gwQVFEWUVzYkhi?=
 =?utf-8?B?UEd2dkxqQTV3VnR5RnJOYTZ5bWF1WHlXUlN3dlErSFRCZnZqeWpXQ0duWGox?=
 =?utf-8?B?UUtXKzVOMTlsZjFpcmFzMDVuWTRKTGhqTHVsNDRKSXNZVGJMbHIwdnNhYUNF?=
 =?utf-8?B?L2JkdWEzRk1QK0ZVRU1EWnh0eW1EWkZPVnVrOGVNdW9vQzlJRjlIQ3ptb0xm?=
 =?utf-8?B?YXpGSU4zYkdoOWVlSXJ5emswZTIvLzdLZzVuOWJqT1ZmOFhIT0ptck5lVXA3?=
 =?utf-8?B?amppMmNLTS9KRW1zdHNzMklXMmt5SHNjSTl5aVBIaklUNTBNbkR0T3J0R1Jt?=
 =?utf-8?B?ckgxdVVpU29ZOExMQ2VCMFZ4cVl4dlpTM29pc3ljaS90UDBxMktCQWdxUk80?=
 =?utf-8?B?OXk2RXZtRTN4RlB4dzJ2YzNXeHpweERtMGRCMHpRd3RpMnU4Wm1rOHJwTXpv?=
 =?utf-8?B?SGFQK0lVK0s2amRjc3VuYVdKYlBSQjhzUzJLYlA3V2VIdEVRWXMyV00xcGY3?=
 =?utf-8?B?dVVuSDVBN1l4S0RzWmhJeTVrMFgzWWs0YmtBZzVHeE5mckJ4R1RPZ291cWQ5?=
 =?utf-8?B?YXFuME5YNTY4TlpTZ1Z1cXRLZGp0UHR2N2YxR0M3NHlNZXpQbUhCcittVTZR?=
 =?utf-8?B?VkdHNWVJU1NYaTRkWXdxdGllRXlXc2tsVVdNTEkzK3JzRnFNcDFmaW9Fb0ZO?=
 =?utf-8?B?VUlwbURINmxqSGUxNFd3U2NZQmMzRnRobHNwUmdZZSs4ZEROZVVtZXlUWCtT?=
 =?utf-8?B?OTVFN2Zqb1dKU0VXNXF2TUZzeFZJam5hZU1GeVYwdUlNcXRyM1FjZkxhOVhn?=
 =?utf-8?B?RGl5Q29JZDAyeW83SmtLVjIra2c4N09KeTlhbWpQVlpTKzk1YzRTQ2xlQXpZ?=
 =?utf-8?B?cEdGa3VoM0RxdUlTRkdTMUJoSWcxenJDdmhIZW9HaEZVdSs5M3hDQ1RIMWph?=
 =?utf-8?B?UTkwdjFEUUtOOU9rYkxKOWd6bFlIcHg0ZjVnYUs4dldnTXhINWQ0aEVFSnVB?=
 =?utf-8?B?SjlLRHZqaVhuS2x1Z1hMcjlhQXl6NzdaR2tQMzNKTTJVRUc5MnY4VmxINkhB?=
 =?utf-8?B?T3FoZVdoclozY1ZWcktWckZES0xUMGhCUkFXOW9hRnRWWWkvalRQWmcxd3Fx?=
 =?utf-8?B?WUpka3pHMnFTL0s3WlpLbndyUDJaY0s4Tmp2MXp2ZENkTUp5cmFvcGRRK0RT?=
 =?utf-8?B?YjJueE1UWEZ5VUZPOG56NEhUS0I3amVnb3pkQTRqaFhaUjBTNkdOemtSMzJG?=
 =?utf-8?B?dUlnQ1VDRHFkZkJOZlJKK2psMGkwSnk2VDFzeHFpU1RHdTNuVUV4TCtncFlP?=
 =?utf-8?B?NzM3NVkxVVByK2phUklmVVV6NlNtMEhiNDJZb0FkM3FyWGxReUIrNzRmczBq?=
 =?utf-8?B?VHJkQ0FXRk0wbE1KTTZrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0A76F4966E959469E07943732D30058@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e953a-c141-4923-0a1c-08d98433694a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 16:57:39.3228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sL9PIF5Udp5/fMuDm/PKA5FdKqeFnZrs5RLoXF2MHGyhbsYxVGiELnR47rxRt6DS3yWU7gM1LTcm8Xjv/AYe5Sxy1RTDs/5g5xdWjv0UND7+F9moyOMKdEVI0mU9gPL3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6851
X-Proofpoint-ORIG-GUID: pQ3K3oxrssbiVQEjkBB8jswJS4sz_lvM
X-Proofpoint-GUID: pQ3K3oxrssbiVQEjkBB8jswJS4sz_lvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_06,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109300103

W3NuaXBdDQoNCj4+ICsgICAgYm9vbCBmb3VuZCA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBwY2lk
ZXZzX2xvY2soKTsNCj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2
X2xpc3QsIGxpc3QgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIHZkZXYtPnNiZGYuc2Jk
ZiA9PSBzYmRmLT5zYmRmICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAvKiBSZXBs
YWNlIHZpcnR1YWwgU0JERiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+PiArICAgICAgICAg
ICAgKnNiZGYgPSB2ZGV2LT5wZGV2LT5zYmRmOw0KPj4gKyAgICAgICAgICAgIGZvdW5kID0gdHJ1
ZTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4g
KyAgICBwY2lkZXZzX3VubG9jaygpOw0KPiBBcyBwZXIgdGhlIGNvbW1lbnRzIG9uIHRoZSBlYXJs
aWVyIHBhdGNoLCBsb2NraW5nIGFzIHdlbGwgYXMgcGxhY2VtZW50DQo+IG1heSBuZWVkIHJlY29u
c2lkZXJpbmcuDQpJIHdhcyB0aGlua2luZyBhYm91dCB0aGUgbG9ja2luZyBoYXBwZW5pbmcgaGVy
ZS4NClNvLCB0aGVyZSBhcmUgNCBzb3VyY2VzIHdoZXJlIHdlIG5lZWQgdG8gbWFuaXB1bGF0ZSBk
LT52ZGV2X2xpc3Q6DQoxLiBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2UNCjIuIFhFTl9ET01DVExf
dGVzdF9hc3NpZ25fZGV2aWNlDQozLiBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZQ0KNC4gTU1J
TyBoYW5kbGVycw0KNS4gRG8gSSBtaXNzIG90aGVycz8NCg0KVGhlIGZpcnN0IHRocmVlIGFscmVh
ZHkgdXNlIHBjaWRldnNfe2xvY2t8dW5sb2NrfSBhbmQgdGhlcmUgaXQgc2VlbXMNCnRvIGJlIG9r
IGFzIHRob3NlIGdldCBjYWxsZWQgd2hlbiBQQ0kgZGV2aWNlcyBhcmUgZGlzY292ZXJlZCBieSBE
b20wDQphbmQgZHVyaW5nIGd1ZXN0IGRvbWFpbiBjcmVhdGlvbi4gU28sIHRoaXMgaXMgYXNzdW1l
ZCBub3QgdG8gaGFwcGVuDQpmcmVxdWVudGx5IGFuZCBjYW4gYmUgYWNjZXB0ZWQgd3J0IGdsb2Jh
bCBsb2NraW5nLg0KDQpXaGF0IGlzIG1vcmUgaW1wb3J0YW50IGlzIHRoZSBmb3VydGggY2FzZSwg
d2hlcmUgaW4gb3JkZXIgdG8gcmVkaXJlY3QNCmNvbmZpZ3VyYXRpb24gc3BhY2UgYWNjZXNzIGZy
b20gdmlydHVhbCBTQkRGIHRvIHBoeXNpY2FsIFNCREYgd2UgbmVlZA0KdG8gdHJhdmVyc2UgdGhl
IGQtPnZkZXZfbGlzdCBlYWNoIHRpbWUgdGhlIGd1ZXN0IGFjY2Vzc2VzIFBDSSBjb25maWd1cmF0
aW9uDQpzcGFjZS4gVGhpcyBtZWFucyB0aGF0IHdpdGggZWFjaCBzdWNoIGFjY2VzcyB3ZSB0YWtl
IGEgQklHIFBDSSBsb2NrLi4uDQoNClRoYXQgYmVpbmcgc2FpZCwgSSB0aGluayB0aGF0IHdlIG1h
eSB3YW50IGhhdmluZyBhIGRlZGljYXRlZCBwZXItZG9tYWluDQpsb2NrIGZvciBkLT52ZGV2X2xp
c3QgaGFuZGxpbmcsIGUuZy4gZC0+dmRldl9sb2NrLg0KQXQgdGhlIHNhbWUgdGltZSB3ZSBtYXkg
YWxzbyBjb25zaWRlciB0aGF0IGV2ZW4gZm9yIGd1ZXN0cyBpdCBpcyBhY2NlcHRhYmxlDQp0byB1
c2UgcGNpZGV2c197bG9ja3x1bmxvY2t9IGFzIHRoaXMgd2lsbCBub3QgYWZmZWN0IFBDSSBtZW1v
cnkgc3BhY2UgYWNjZXNzDQphbmQgb25seSBoYXMgaW5mbHVlbmNlIGR1cmluZyBkZXZpY2Ugc2V0
dXAuDQoNCkkgd291bGQgbG92ZSB0byBoZWFyIHlvdXIgb3BpbmlvbiBvbiB0aGlzDQo+IEphbg0K
Pg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

