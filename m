Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE240457C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 08:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182615.330261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mODJE-0003q8-MF; Thu, 09 Sep 2021 06:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182615.330261; Thu, 09 Sep 2021 06:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mODJE-0003nw-Hx; Thu, 09 Sep 2021 06:13:16 +0000
Received: by outflank-mailman (input) for mailman id 182615;
 Thu, 09 Sep 2021 06:13:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mODJC-0003nq-Gf
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 06:13:14 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c88fba47-1f0d-4c4a-936c-3fdd3aacba72;
 Thu, 09 Sep 2021 06:13:13 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1895FJ8f031477; 
 Thu, 9 Sep 2021 06:13:09 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com with ESMTP id 3aybxm860b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 06:13:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3217.eurprd03.prod.outlook.com (2603:10a6:208:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 06:13:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 06:13:06 +0000
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
X-Inumbo-ID: c88fba47-1f0d-4c4a-936c-3fdd3aacba72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWDJRi7F6o3sao9f/vU/EO3Gsp57Z6dTKNYBpcmPgjfAUac1sBCJqVXlH+cTGthrK9aI2wVJj/IJmx2AH7m+FNswVV0aUPHyA7X6F9LRTNTWHPiXuggsIgySOZY/ARBTW5dn8AoPCI+NH4eHoi/Xd4DaS2o9i6oMQQo5loc4f3BYXVlI+qBl/WdCWSPfePIR+yMELNeFEZ4jFXYewPSx17Dp9CQCnupCwyF7dQy6xsqL7INGv0Audu5IPcky8l4nR/JCPt/q89QQz/a5vYQ1c/r2O6tsAzQ8WHJF3stmK5l3hxCUWDfvXt6Fs/p+/xwLZ1Ar6iU/Z0wRaJnlb757nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LC4+rTwvOahb/P0W0i7gTem2KvP4a2j9bmnJIM+0E68=;
 b=Ms5y0cDgFnHp6VKr2pm6KxmD5IrnkhQkiF1VEeO5x6J6dO1MFk8tgsGAmg5kE2Q9V4SQ2u/xnCa6wdDmNLbfJPLQAaCy9YuMR50UVu444AdY8NoWuzJVR7Urlxd6ex0dC+1YEuLVnJCHxFUCzwmypNhJ0IdX08v2ym1zL5u6uYlt3esota1hDZvqg/zHD1Bx2PRIriynSX1oKBCsiciDV7cUhJk3fUkyDEA2W76BEoAicOR1cTGhxHozB3mUdyTQUGLtanjgXU6k1RnvDHKugXkhfeoIzg0v6JQq+dxJe+FuyeHI4U3Vyx2MFXCtSyWGubs2sEDwxil5Io8M1Ar+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC4+rTwvOahb/P0W0i7gTem2KvP4a2j9bmnJIM+0E68=;
 b=NeqAyeQPxnm3Pcx2JwxrqWS2+cXHAdO8tQBBU+/CQ8XG1fABvuktgYxcia9PNl+mgoXUAU2HgEiRrAXO4ESEkkUJLcCI9N7bDGsE0UqFl9QtGVdMW+q789QCsNEwF15GlB14V7cBrNR0yNp5r9d7iQ3KSjD00hKN42OHeLQEVah1ChtzfBPQtzkS1WXSpF8ahDY59ozW2UfTQU/Ut3MuMCZoPvPuMKw690NqcIPPu08DcYPWebSs84SvUUlLBrK3A0bHZCPSKDZhmBZWshlXw2bTpm9X+2ihz3STz9smdFoKdDWFD8bLlB/ob1qYctnlKZlrgt9WV4+Ow8Xbl3VHQg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXoKxowwaOW1OR4UKei+2TOBJan6uXHAEAgAQmJoA=
Date: Thu, 9 Sep 2021 06:13:05 +0000
Message-ID: <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
 <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
In-Reply-To: <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ec013c-eb7b-4640-acbd-08d97358e380
x-ms-traffictypediagnostic: AM0PR0302MB3217:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3217A85C653FBBDA32FBEA6FE7D59@AM0PR0302MB3217.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bbaUUaGclTzZAz+RwBUpMOiy0BQiIhDek0emtZoa+yPtll2rNg733gRyojr9wTMdHYYVv//3mPU5fbEAJauZUKrufEbq3+ZDMJSmOlqSZAj4H6KBneSlgdpTTVy4J6DdSLKKii/ROkST7gW7ESMafkvBnyXB0Xge8+u3Trzn3eB1u3xI6lFNcwGK8Ccx8BdZQnRsWxklEP6vDbpErdBLAnPyto1OZdFjeVNzftzGoZf16fOokdh5FxHv6oDTzQUR4jBNRahzY4Cevrjaw/mNiRs0DIHOU9NrCm2kyAJDcZ8m9gugaiqQOJOF8lZGmNQRudO3ZbudQ+it3NHvPPRhuf8IwDESGXXhlxQnPDvTlrCPu5DdBWY3wl0isaliolauychAKSh1HeB8OloXfQ0dBNYG2edQyugokHXBW2ZsyTyGE2/3zXpv97eU5SAAZVV+8FBth1fwg559QbyHqBDya5LxkKaXhslTbhhXfNCgX6QPIBGIItM9YIIqt0QiHQBwBuvYGQFwjc3nuQ8ghZXOGDQVyPpic0VIbxEmGWiDEPZbsQDHgZThuWqEXzXRgTiTDflTXpgnK4ry3oMVjLb/faIo/JCJRgP2sUTpF5eweYhxFOSP73T2EJg/CWOO19+jhd3NcGwqLyZIGLBG+w9bKG8JNJAUnEflrayeLJhIHdeyf8z+VDZutVuZ5NuCVDhYO+bfwVW5yI10pIcZr1X7MJm+O8oGkXuKSR6nkJBrVenMwsTyhv+UQzY1U+HTW/dH
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(83380400001)(2616005)(8936002)(478600001)(4326008)(36756003)(5660300002)(66946007)(66476007)(54906003)(38070700005)(26005)(2906002)(6486002)(186003)(66556008)(316002)(122000001)(71200400001)(8676002)(31696002)(53546011)(6506007)(76116006)(110136005)(86362001)(66446008)(31686004)(64756008)(38100700002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWtWaVpHY0NJYmhvM3V1YURYOXpFaDUvY09idytxRS9SMHA5ZUVkbm5QL0k4?=
 =?utf-8?B?Yk1ZblZuUHJUTlZ0QlJLNHB0TUtZcWwvbUxncFdNdlJwdUthVlJIU3JzSGhv?=
 =?utf-8?B?NFlVY29IbGkzemhFZm9PS3FIN2pyUlFYZmVOVUhaYlBiNzVtMGNIR0lDaXp1?=
 =?utf-8?B?UFBDdFRiR3dRMEd1RU52eUJYc3hPVE01VXp2blpXWEx2dHRIVURvQURBSjk5?=
 =?utf-8?B?aHFVNVlIQzduMDI1TXl0c0lvak9LWHZ0KzdJSW1qalZzekxxblVCeHFkMnVP?=
 =?utf-8?B?NmtHdWFRSUJXQVpUZGRtTDYrbnphMDlnODdqSDI3bnhQdVNJTGdDcDBMbTYy?=
 =?utf-8?B?NkVoYXpqaTNqWWVpMUptZVducTdtajVSODhKZmJST2pSayswZ1NzVXNQeEJx?=
 =?utf-8?B?UitmQlJxelRzL05ZTkdIcktVMkNDOFpCcUpYVzJZekxkOVdHOFZCNE5tZTVN?=
 =?utf-8?B?Wkt1OWxpSG5VZExYMXRDMHRzMVVkbzA4NHZWVHliQnhHNUlNcG1vN1BtUVJB?=
 =?utf-8?B?b1pCdDZsMHZTVEFpV2Q2MXNjNWNTVzhWWGp6andmSUdqaHZJWXFHSXkvUENk?=
 =?utf-8?B?NWYxQ254NGNwbjNRZVZ5dkd2OUtLN0w4RnBCZ1hpdTM1NGlsWTlmeUlXMVpD?=
 =?utf-8?B?aEg2MlBzeXAyM2NJZ1R6OHIwc2g2cmlXeUJDQjN6WTdyUVBVTFllZFZJeHdU?=
 =?utf-8?B?aDhLU1pwWml4MXd5b1Z4TjZoYlRpQS9NSk16Y3EreFQwdXNjOVNLOWJYcC9U?=
 =?utf-8?B?ZnhxZUNRZHBoS2xmbnExVHdzWUVBYWMwSEZTdFlGVUhSN2xYNzUvS3B6Yzc3?=
 =?utf-8?B?M1Njd2NLQVQ4dkZzZmFLa2EzYldBUUh2LzFpblQyeXhLMUljT3JIWXJnZVVq?=
 =?utf-8?B?bkdxQ1pqOUlBa0kwYnorMzAwMkREYlVLclU2Vno3ZitGbkNsR2ZKWnlyVmRQ?=
 =?utf-8?B?NW1qL2RIVXR1VGkyYVl1Um43U0I4VEVRT0tPR3JYbk5GSTJPdzF1WmZmU2Zk?=
 =?utf-8?B?YlZEZGFKTUV5azF3ZzZabGR6MGxBRGhWWEVsZm9yWGNUYWxqd29ITzZlS2hB?=
 =?utf-8?B?S2xHZ0dOOXlJeXdsM1JnUEFXZnJBMm8yazdpVlhmM1JmQzFxTUdoK1dMazNs?=
 =?utf-8?B?LzIvUWsrQlllTDA2a0tjQlo2TDcwNGIyQUYvOWNJczFaNHVvYWZwcU83YlhI?=
 =?utf-8?B?L0RiOTFSZUJsd3llODIvMGpWTXc4YUJkVk1wY2p1YkphNnh3N2tJRi9zVWw1?=
 =?utf-8?B?QStJOTVGYUFBY0NVenBmUGFlTCtOOFNNTHhWTnF4SlNsak9IZ3NSQXJvdkxS?=
 =?utf-8?B?dnlKSjNDemZhcVFYMDdDMWFKTkM2c3l2c3gwb0diOHVhKzNaVHBVZ2NaLzF2?=
 =?utf-8?B?TmZKOG4xOE9acUxzLzFFSlRrU21rMzFJTit1aTlGN2MvS3ltWEdEcTNJRVJU?=
 =?utf-8?B?TVpDV0p6Wld1UER4NUEwbmNucVBtR0hpVThTUEVYOGlPVDRMSnFtaTBJNUNM?=
 =?utf-8?B?WDk4YU80T2pRZmtEMHBVRlI3em5JTFJXU3k2WmFGS09GeTc3M2R2TGJhc3k1?=
 =?utf-8?B?M0FGSm5KWldJMDYvYUVuYnRrMGVwWFhZTncrdTcxczdSRDVpRUh0ZXhtcDZG?=
 =?utf-8?B?RlRmYlovRnJqWnVwL2xMeHZQNU1IeUYzQmZLOG5UN0JnVFRSSERadkNjWVV6?=
 =?utf-8?B?OTZ5a2VVVnpidEp5dUh6SC9DMDVqdXY0ckVVM2RTU3RUYy9zbWJIdVNTZEhr?=
 =?utf-8?Q?b4tIBi8eh6HodixyDNhxAW+7hmEqj15Cn9tq676?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4F3646E79C0254D869B266C87003108@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ec013c-eb7b-4640-acbd-08d97358e380
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 06:13:05.9448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2b8NzdW718EqPAxqpfwLmNL94hyOlPSaU1y6GO6fmkAVuWnQm6GNGg3SrXZ9SPcm3/9qo6fQO5HXeKum8VfYScLs6tYfxrldmHEnV0gkgqakwzSKpluUkCzfq7EyoSh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3217
X-Proofpoint-GUID: vnd7x1L48kq7i73rGbxtM6UrRlk9RU-O
X-Proofpoint-ORIG-GUID: vnd7x1L48kq7i73rGbxtM6UrRlk9RU-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_01,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=957
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109090035

DQpPbiAwNi4wOS4yMSAxNzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gQEAgLTM3LDEyICs0MSwy
OCBAQCBzdGF0aWMgaW50IG1hcF9yYW5nZSh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcg
ZSwgdm9pZCAqZGF0YSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAq
YykNCj4+ICAgew0KPj4gICAgICAgY29uc3Qgc3RydWN0IG1hcF9kYXRhICptYXAgPSBkYXRhOw0K
Pj4gKyAgICBnZm5fdCBzdGFydF9nZm47DQo+PiAgICAgICBpbnQgcmM7DQo+PiAgIA0KPj4gICAg
ICAgZm9yICggOyA7ICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNp
emUgPSBlIC0gcyArIDE7DQo+PiAgIA0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEFu
eSBCQVIgbWF5IGhhdmUgaG9sZXMgaW4gaXRzIG1lbW9yeSB3ZSB3YW50IHRvIG1hcCwgZS5nLg0K
Pj4gKyAgICAgICAgICogd2UgZG9uJ3Qgd2FudCB0byBtYXAgTVNJIHJlZ2lvbnMgd2hpY2ggbWF5
IGJlIGEgcGFydCBvZiB0aGF0IEJBUiwNCj4+ICsgICAgICAgICAqIGUuZy4gd2hlbiBhIHNpbmds
ZSBCQVIgaXMgdXNlZCBmb3IgYm90aCBNTUlPIGFuZCBNU0kuDQo+PiArICAgICAgICAgKiBJbiB0
aGlzIGNhc2UgTVNJIHJlZ2lvbnMgYXJlIHN1YnRyYWN0ZWQgZnJvbSB0aGUgbWFwcGluZywgYnV0
DQo+PiArICAgICAgICAgKiBtYXAtPnN0YXJ0X2dmbiBzdGlsbCBwb2ludHMgdG8gdGhlIHZlcnkg
YmVnaW5uaW5nIG9mIHRoZSBCQVIuDQo+PiArICAgICAgICAgKiBTbyBpZiB0aGVyZSBpcyBhIGhv
bGUgcHJlc2VudCB0aGVuIHdlIG5lZWQgdG8gYWRqdXN0IHN0YXJ0X2dmbg0KPj4gKyAgICAgICAg
ICogdG8gcmVmbGVjdCB0aGUgZmFjdCBvZiB0aGF0IHN1YnN0cmFjdGlvbi4NCj4+ICsgICAgICAg
ICAqLw0KPj4gKyAgICAgICAgc3RhcnRfZ2ZuID0gZ2ZuX2FkZChtYXAtPnN0YXJ0X2dmbiwgcyAt
IG1mbl94KG1hcC0+c3RhcnRfbWZuKSk7DQo+IEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBi
dXQgZG9uJ3QgeW91IG5lZWQgdG8gYWRqdXN0ICJzaXplIiB0aGVuDQo+IGFzIHdlbGw/DQoNCk5v
LCBhcyByYW5nZSBzZXRzIGdldCBjb25zdW1lZCB3ZSBoYXZlIGUgYW5kIHMgdXBkYXRlZCBhY2Nv
cmRpbmdseSwNCg0Kc28gZWFjaCB0aW1lIHNpemUgcmVwcmVzZW50cyB0aGUgcmlnaHQgdmFsdWUu
DQoNCj4gICBBbmQgZG9uJ3QgeW91IG5lZWQgdG8gYWNjb3VudCBmb3IgdGhlICJob2xlIiBub3Qg
YmVpbmcgYXQNCj4gdGhlIHN0YXJ0Pw0KDQpXZSBvbmx5IGhhdmUgTU1JTyByYW5nZXMgaGVyZSBh
bmQgYWxsIHRoZSByYW5nZXMgaGF2ZSB0aGVpciBzdGFydCBzZXQNCg0KYXBwcm9wcmlhdGVseQ0K
DQo+ICAgKEFzIGFuIGFzaWRlIC0gZG8geW91IG1lYW4gIk1TSS1YIHJlZ2lvbnMiIGV2ZXJ5d2hl
cmUgeW91DQo+IHNheSBqdXN0ICJNU0kiIGFib3ZlPykNClllcywgSSBtZWFuIE1TSS1YOiB3aWxs
IHVwZGF0ZQ0KPg0KPiBKYW4NCj4=

