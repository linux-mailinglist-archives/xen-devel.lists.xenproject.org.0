Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D227403B91
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182117.329558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNybm-0006ys-Eh; Wed, 08 Sep 2021 14:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182117.329558; Wed, 08 Sep 2021 14:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNybm-0006w9-9m; Wed, 08 Sep 2021 14:31:26 +0000
Received: by outflank-mailman (input) for mailman id 182117;
 Wed, 08 Sep 2021 14:31:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iEI=N6=epam.com=prvs=98850bb71f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNybk-0006vr-58
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:31:24 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70f75e52-10b1-11ec-b15f-12813bfff9fa;
 Wed, 08 Sep 2021 14:31:23 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188E42Gu010308;
 Wed, 8 Sep 2021 14:31:20 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3axxky841j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 14:31:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6689.eurprd03.prod.outlook.com (2603:10a6:20b:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 14:31:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.015; Wed, 8 Sep 2021
 14:31:17 +0000
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
X-Inumbo-ID: 70f75e52-10b1-11ec-b15f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCq4+k/jbsTJofAybHa3ZA1NyoNoHykUhwtfRHe9b3+MRoJuYQ5D9VPs3yibzUs8aC+jS+G69Q9QE9xqhUVJ5J52MVaLdLskg/AC5BzYTiyiJcWb3IIyxUzgoqGUTq3OwjcRiLHElOis+XrN5x+a8s7GYsBIFaBTGlGDrWfP+a51h6w6tD0z6+ALvaopYO4otWaiRBqfufhJei1SJdN9nC+6/yU1CBilC7j9NzG8wElNTqtvJ11tuIjXPy4PYCpkytZaRFkY/LpjjTjoM+slXc+SvLmH6gXmJLhEfygbUQQQO5aqgg6Z6hfJ8cxphgW5P740reQ0IsTu317KgzYszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=s+J8jXTMhPTDJuhVNF/qQX5QGCTBsoadplJY/1/I5rg=;
 b=HxtEkXgGQprarekDnNpTj8imXSdqg3u47DrUrwesMibRT2bK1aAHI33At8d8bcEseIrvldGnOMMbqX84PCpYWLnjSoV9kKB6P7ccsUsSvCdIlrfgCgURZHrky1W/c1CB0pH7tOq9TFGe8b0DgGdIdpZZGQeYkQWa+UWWL3hDjCNU2OskAkzyFdoVcY+dKYc1uNpFPhV6tsa5ARLyUkW3KQ6S1keCYI9GUc+atWgSS86hdwdIl4i9j52fDINacGwLfoSmHkualHwIW/m2FKeRO93oVfegOWQd+LomPxO2cC4LWTK94jUKHRpPt98YEOdzxftlZjCz4ogcL0XuEjb1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+J8jXTMhPTDJuhVNF/qQX5QGCTBsoadplJY/1/I5rg=;
 b=GXeY/ZIDd5Z1gUTslVSrZjDfFA9D0PODmCqXlPuqgVxuxUVjFHWNkdxgrUosyBj3PPXssweR1gC46Hr7YX+8wWBMhQL/gsr05GM9UHHHOxDL4FoIYV/ER8qCo9SiKWt11rovnDNKfX9cVFR2PKfYQweRbuqZn2VFgCIcFKZZMHSb8UBVNg4Xszu97BlV7hfNz5aBg8UfZSv5+rn7eAbzKCc28Ls3GizeaiuWpeiKYije8IjqOwunE9xZd04RSa28BjOEQ67e0q/jJ73kCxbMAZ5nbTg1rX1AsildzAu0XUGze/YQwwq4ZLETDlgPA2PL27z8hAlN8gDCQlj2vYDzdg==
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
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Index: AQHXoKxjXfke7B20QEeo6YjlfUMhlquXGvYAgAMgDgA=
Date: Wed, 8 Sep 2021 14:31:17 +0000
Message-ID: <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
In-Reply-To: <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88493270-bdbb-4d6d-a6aa-08d972d551c3
x-ms-traffictypediagnostic: AM9PR03MB6689:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB668990F75822E25E80BB00D1E7D49@AM9PR03MB6689.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NyDj4D1q5llDhKckMulHrIJJ78iqnz0yZlZPj2s/Oz9/LbeiYCQNO9Y+dcDmj+1MOxd0f3wh2s+o0PISkGWUo5pgKv3px3LgO3csIvWaLUQX/vLfho/z23D3T9ZanQL/J/2OerOFuw3+9bj7LdyKi7rtNSoT7NMBp9Rbzhvhg5t92vU/ZZ+PLmgSo2gFQdasnIR9jGhf5goklpRHp+78mtuibVpo4zYWBz3wVBtCxYvrriAApIqzmekdWa8AmofJPefOgjBCAyaxYQ9KZtY+WJZtY9ILXtjpNwQiZKbsaEJAWfM1T/1ToiozJ3tDImrQ5G8jTzlmckYyQ9Pvm3YGHeaXhreJtgdsrhkPoxosZ0y9Qr2phqsIDFocid83hJHdpZ/511tc4yc592G+gs3gsdg/s2aj4XhHfiiRdt+FLneg+7yhNzaHHdi3NO3Zqj5MQzK/desbZk9rKqqWt1ZvGwo0G4+dV6wQf+6jSTBeMKVqgmdHaSwCc1Vf69Ki3D7axTm6u1XZEIDxpuJAv8n2xD6jPEnKp0hpJGy9Yk8H4Fjs8RxH9UaGrcwVrj5ugHck53swbMMM9bRifbXuwuEVkx3cktQ4shTa7gaNJh8hf0HeYXeR3bSfln4GTeQ9ynDVHtToVj65BR4ROQpW+o47zWeLBzuU+MhMNGlmwpl9wcN7eroeA3R+sFap/X+ZDAZT03iwp0VFCHBN1O5vbm8tUC2wkTrW36bIEtHemJfZ2FAONhNbHLNYDdrA0juLLpon
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(186003)(4326008)(110136005)(26005)(71200400001)(54906003)(2906002)(316002)(53546011)(6506007)(38070700005)(122000001)(8676002)(5660300002)(31686004)(86362001)(38100700002)(66946007)(8936002)(76116006)(36756003)(66446008)(64756008)(66556008)(66476007)(83380400001)(31696002)(6486002)(2616005)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cisyaGtrS2VCS0RPdittSW1nN1dXSitKYUxPbkFzNVpyMFNLT3ExSndwd0Jt?=
 =?utf-8?B?Ni9WcW95NlAvQmhhNWNPdGtPajVLdWtKRjhVeTJBdlRMS2FFK3g2c2dIVUFV?=
 =?utf-8?B?VDMyclNKeUFjZVdIY25qTFBjOXhNYlQ2QmJ5QzRxUndUcVdHekFjcXRCeStk?=
 =?utf-8?B?S294QTE3WDNvNjJ4M1hlajllMTVwRHIzdFFEZlk0QXBBVytnRzA0dXp2UHhB?=
 =?utf-8?B?UWRSTU1lQlNsY294Qnl2UTBZVjZkdnRGZSt4cll0cEhnMG0yckRCNlhVcW1a?=
 =?utf-8?B?SElLNnlIWkduNndEZ0pkTnhDVzFReDduSUx0dWJRWUw5Ry9iTkEvSWNhTzB0?=
 =?utf-8?B?UTExTVNjMjdRZSsyOU8vaFRVZ1JWSDdLdkJmaFA3bTdUa3VISGl3SjRUSXE2?=
 =?utf-8?B?c1J0Yzh6VG8wWExDbmNhNUdGZjB1eGI5OHhFbGNVZmRKbDFJNjd1V1NKd3B5?=
 =?utf-8?B?alo4VjY5dGo4Z3owQVNWa1RHb1lIbGNoMDE2OWlENlpxYU9wRjU3cm95T2NH?=
 =?utf-8?B?UEhYZS9pWTJWb3NIZVg5UmhNSVBmamhleVcxTmlqREFvWlBZVTBYNGJzQzJq?=
 =?utf-8?B?ckdRRFZYb1lmUTRva1lhZGJvamw2SjUyVE9jUHBOWHBWZlV6cnB0dlMzaDhm?=
 =?utf-8?B?RlhPVjk4ZWpPOGFqTExJU2tBR3JjUk9PSlhiQ0ZLZUU1M1l4bzNYc3hDS1U1?=
 =?utf-8?B?OXdlVU9NNU5Fc01sbk5RM0xQb251dVhxdjcwUWFDTWJsL1ZoYnhidStSS2Z0?=
 =?utf-8?B?YVJQL0w5dXpXY1RuZW0xYktaM29JejNNTm0ySWYwMkl4WHNLMWVoWmRwVnVw?=
 =?utf-8?B?R0thTnBLbWJDKyswTit1V2FGbjdYelNLZlBoU1FrOE1NT01MaWdSYnd3clhk?=
 =?utf-8?B?RjRnVmRYRVFxa3dhN0FJdGJHSXU4UHZHbGdMRHZqNnhiSWJtSXpNYjFGMTRk?=
 =?utf-8?B?UnhuUnI0UkZGWGdsVkVqdDlBaGpZSU5Wcjl4UjM5dWJSd0hzL1FWN3J6aXFK?=
 =?utf-8?B?NGlpbFdGRG1GL1ROd2RIUWdlY3Y5SjRBR2xnMXQ4ZmtXZ1JnTUduN29QVjBI?=
 =?utf-8?B?L0Z2dEVpQkxqalBBekg0akk0ZkFGS0RKMUE1UzJMNitXZFB1eEpMQXA2eDM1?=
 =?utf-8?B?UXpNN3JGeVl6UGZMc3pSM3lHUUVQdklwMmFsM1Y4VE5tRjhtcFRzQVV3Ymt5?=
 =?utf-8?B?UGtjekljcm1HU0RWempVcERQUzZYWUZGMGFjZ1RSdU9HVUNibzR6VWR1dmRE?=
 =?utf-8?B?NENlMjQ3ZW1sZzVQZkNWbXQ4TFBKam03SmQ5ZVRSTFVVNUlCT0xTd2RYcnFy?=
 =?utf-8?B?TXRhSFVRaG1vUXhjWVE0RzR5dXIvMjVjLzZhS25tUFFsRmd2R0tSOGdyQU1z?=
 =?utf-8?B?bitySW5kWTc4K2w5b2g4NE9BSVRBNURXeHRxTE1EaTUrYmZFa3VMVDZxU3Y5?=
 =?utf-8?B?S0lFS2I5RkNhRkhWZDc5NGN4aEtVdzYzYU8zMm5tYXdZckQrMU5tUUloK0FO?=
 =?utf-8?B?N3dHSDdPYWZoSlI2THVCVWF5eityU01Nd3hkSkJHY3RldGFCVHhnZzVWR2Fa?=
 =?utf-8?B?WHVXd1kxbnAvWkJoNzJ5djhSNllYbjAvSjhsNjVTN3o1dkFvMXhQdHgrNyt0?=
 =?utf-8?B?VERqVTlqQzNtcUlYb0ZVR3gva2dxMHJSeGg0M0RnY3IrbC9wM3grcGFTT25w?=
 =?utf-8?B?OG84QWhUSnhwWXJrV3JaRmNPdmsvdGl2bHNVNVRVUXpaZjBvZkZ6SUdKUmJk?=
 =?utf-8?Q?hBSmnfFLk+tkpGp1BXbhMrOVuREfDdh3tE4H1wi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C204A37F9BFE61479255EC5544474337@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88493270-bdbb-4d6d-a6aa-08d972d551c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 14:31:17.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oo0ipHk4Q44Jfb89JSsDqhyt3AnU8XG63UYdbVO7G71fjWrhfpmJo4pZ9SmjPhnXBe3SDW8l2vWTznCiACEQhxNyk5ITC+ofsZswL3k6awXfAxIMYZSWW65GlZzcuww/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6689
X-Proofpoint-GUID: yVyAGTPpKiaiegS4wgjflsqDfMdwZlcy
X-Proofpoint-ORIG-GUID: yVyAGTPpKiaiegS4wgjflsqDfMdwZlcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=975 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080092

DQpPbiAwNi4wOS4yMSAxNzo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IEluc3RlYWQgb2YgaGFuZGxpbmcgYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGF0IGNvbnRhaW5zIGFs
bCB0aGUgbWVtb3J5DQo+PiByZWdpb25zIG9mIGFsbCB0aGUgQkFScyBhbmQgUk9NLCBoYXZlIHRo
ZW0gcGVyIEJBUi4NCj4gV2l0aG91dCBsb29raW5nIGF0IGhvdyB5b3UgY2Fycnkgb3V0IHRoaXMg
Y2hhbmdlIC0gdGhpcyBsb29rIHdyb25nIChhcw0KPiBpbjogd2FzdGVmdWwpIHRvIG1lLiBEZXNw
aXRlIC4uLg0KPg0KPj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiBvZiBtYWtpbmcgbm9uLWlkZW50
aXR5IG1hcHBpbmdzIGluIHAybSBmb3IgdGhlDQo+PiBNTUlPcy9ST00uDQo+IC4uLiB0aGUgbmVl
ZCBmb3IgdGhpcywgZXZlcnkgaW5kaXZpZHVhbCBCQVIgaXMgc3RpbGwgY29udGlndW91cyBpbiBi
b3RoDQo+IGhvc3QgYW5kIGd1ZXN0IGFkZHJlc3Mgc3BhY2VzLCBzbyBjYW4gYmUgcmVwcmVzZW50
ZWQgYXMgYSBzaW5nbGUNCj4gKHN0YXJ0LGVuZCkgdHVwbGUgKG9yIGEgcGFpciB0aGVyZW9mLCB0
byBhY2NvdW50IGZvciBib3RoIGhvc3QgYW5kIGd1ZXN0DQo+IHZhbHVlcykuIE5vIG5lZWQgdG8g
dXNlIGEgcmFuZ2VzZXQgZm9yIHRoaXMuDQoNCkZpcnN0IG9mIGFsbCB0aGlzIGNoYW5nZSBpcyBp
biBwcmVwYXJhdGlvbiBmb3Igbm9uLWlkZW50aXR5IG1hcHBpbmdzLA0KDQplLmcuIGN1cnJlbnRs
eSB3ZSBjb2xsZWN0IGFsbCB0aGUgbWVtb3J5IHJhbmdlcyB3aGljaCByZXF1aXJlIG1hcHBpbmdz
DQoNCmludG8gYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGVuIHdlIGN1dCBvZmYgTVNJLVggcmVnaW9u
cyBhbmQgdGhlbiB1c2UgcmFuZ2Ugc2V0DQoNCmZ1bmN0aW9uYWxpdHkgdG8gY2FsbCBhIGNhbGxi
YWNrIGZvciBldmVyeSBtZW1vcnkgcmFuZ2UgbGVmdCBhZnRlciBNU0ktWC4NCg0KVGhpcyB3b3Jr
cyBwZXJmZWN0bHkgZmluZSBmb3IgMToxIG1hcHBpbmdzLCBlLmcuIHdoYXQgd2UgaGF2ZSBhcyB0
aGUgcmFuZ2UNCg0Kc2V0J3Mgc3RhcnRpbmcgYWRkcmVzcyBpcyB3aGF0IHdlIHdhbnQgdG8gYmUg
bWFwcGVkL3VubWFwcGVkLg0KDQpXaHkgcmFuZ2Ugc2V0cz8gQmVjYXVzZSB0aGV5IGFsbG93IHBh
cnRpYWwgbWFwcGluZ3MsIGUuZy4geW91IGNhbiBtYXAgcGFydCBvZg0KDQp0aGUgcmFuZ2UgYW5k
IHJldHVybiBiYWNrIGFuZCBjb250aW51ZSBmcm9tIHdoZXJlIHlvdSBzdG9wcGVkLiBBbmQgaWYg
SQ0KDQp1bmRlcnN0YW5kIHRoYXQgY29ycmVjdGx5IHRoYXQgd2FzIHRoZSBpbml0aWFsIGludGVu
dGlvbiBvZiBpbnRyb2R1Y2luZyByYW5nZSBzZXRzIGhlcmUuDQoNCg0KRm9yIG5vbi1pZGVudGl0
eSBtYXBwaW5ncyB0aGlzIGJlY29tZXMgbm90IHRoYXQgZWFzeS4gRWFjaCBpbmRpdmlkdWFsIEJB
UiBtYXkgYmUNCg0KbWFwcGVkIGRpZmZlcmVudGx5IGFjY29yZGluZyB0byB3aGF0IGd1ZXN0IE9T
IGhhcyBwcm9ncmFtbWVkIGFzIGJhci0+Z3Vlc3RfYWRkcg0KDQooZ3Vlc3QgdmlldyBvZiB0aGUg
QkFSIHN0YXJ0KS4gVGh1cyB3ZSBuZWVkIHRvIGNvbGxlY3QgYWxsIHRob3NlIG5vbi1pZGVudGl0
eSBtYXBwaW5ncw0KDQpwZXIgQkFSIG5vdyAoc28gd2UgaGF2ZSBhIG1hcHBpbmcgImd1ZXN0IHZp
ZXciIDogInBoeXNpY2FsIEJBUiIgYW5kIGFnYWluIGN1dCBvZmYNCg0KTVNJLVggcmVnaW9ucyBh
cyBiZWZvcmUuwqAgU28sIHllcywgaXQgbWF5IGJlIGEgYml0IHdhc3RlZnVsIHRvIHVzZSBtYW55
IHJhbmdlIHNldHMsDQoNCmJ1dCBtYWtlcyB2UENJIGxpZmUgbXVjaC1tdWNoIGVhc2llci4gVGh1
cywgSSB0aGluayB0aGF0IGV2ZW4gcGVyLUJBUiByYW5nZSBzZXRzIGFyZQ0KDQpnb29kIHRvIGdv
IGFzIHRoZXkgaGF2ZSBtb3JlIHByb3MgdGhhbiBjb25zLiBJTU8NCg0KRXZlbiBpZiB3ZSBnbyB3
aXRoICJjYW4gYmUgcmVwcmVzZW50ZWQgYXMgYSBzaW5nbGUgKHN0YXJ0LGVuZCkgdHVwbGUiIGl0
IGRvZXNuJ3QgYW5zd2VyDQoNCnRoZSBxdWVzdGlvbiB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgaWYg
YSByYW5nZSBnZXRzIHBhcnRpYWxseSBtYXBwZWQvdW5tYXBwZWQuDQoNCldlJ2xsIG5lZWQgdG8g
cHV0IHNvbWUgbG9naWMgdG8gcmUtdHJ5IHRoZSBvcGVyYXRpb24gbGF0ZXIgYW5kIHJlbWVtYmVy
IHdoZXJlIGRpZCB3ZSBzdG9wLg0KDQpBdCB0aGUgZW5kIG9mIHRoZSBkYXkgd2UnbGwgaW52ZW50
IG9uZSBtb3JlIHJhbmdlIHNldCwgYnV0IG5vdyB2UENJIG93bi4NCg0KPg0KPiBKYW4NCj4NClRo
YW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

