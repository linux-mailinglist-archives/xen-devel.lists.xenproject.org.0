Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B640B08D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186800.335543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9ME-0007qZ-TN; Tue, 14 Sep 2021 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186800.335543; Tue, 14 Sep 2021 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9ME-0007oP-QI; Tue, 14 Sep 2021 14:24:22 +0000
Received: by outflank-mailman (input) for mailman id 186800;
 Tue, 14 Sep 2021 14:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQww=OE=epam.com=prvs=98919bdb76=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQ9MD-0007oJ-Kc
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 14:24:21 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7363ea56-1567-11ec-b43a-12813bfff9fa;
 Tue, 14 Sep 2021 14:24:20 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18EDwUrC018725;
 Tue, 14 Sep 2021 14:24:14 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b2qp4sbbg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 14:24:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4577.eurprd03.prod.outlook.com (2603:10a6:208:c1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 14:24:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:24:10 +0000
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
X-Inumbo-ID: 7363ea56-1567-11ec-b43a-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd5jllhtNaGZPhYrqBKLXsTRdsj3StCRczJeXlsurJUYNp9NXtMId6KcpMZH9DHuVhv0/n46ExxKDVVaJW1S0+H5TGcgXbDg6rPJ7VNhw6acXIJFuEa1VK62CxXY5aLeFYE+d7NGyRmYbWcjOTTw9GRWEqTTa/ffEtCm24dYfZsmSzlFlNgFVn54XFnQeZFtKM5d/1Pv9NC8UmdVw5Dxbf++A8Klv4M5Jdi8EcVJz+V/IN7zviwZyGYH++4FEm4C8HSx5L7G8MHjVzRIiR/ei4mwiC6yJZ3+S9SVqJIbZdAAHrnmzaPunHFAJwS75lO1q/tybIbeW44dRuG7VxkMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FZ8QhArfeYPBGE9lk/pv9xQcsubY+TFE+qbmLG6HSek=;
 b=CpiHIatoFmxR3k+0D6DSJHj521RjvncNlB6mzGQ0qFkOxkm0AeynWRhlju1il3HVfTyuHgGIuqKXYEvqwzV17TEwuuks5Zqw9YeFerREUFm0hdLMRUk00hjVIIUMEMzPMMvXn6/Q7bHJjyPGntAGHAzaKlv1p1riaBoV6CZCKSMJmBAgFAnvsh5hhJVeelfBwRWL9+SCOy2tFd42Mbv8IdWbnbBGJw9il2orPMJRaOG/BnAl2+nYXxAKZRKfg9TGHXB23K6FZ+HHFTVBIO8cXwmALw2/ZSkl/KhZZ/h8RJn+agholICk+DAZxhxiS8V2dUILHSNk5fctwi+VVnj38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ8QhArfeYPBGE9lk/pv9xQcsubY+TFE+qbmLG6HSek=;
 b=0ETvuKK+AptJF4bG9lfMS2o2zE3wNheb0bxnOCwUbLPjeMNOpn6WD13ZY8SzX5DpvpYuhn5THbuYr59jQdx4YIB13TcQ+mYj0mnEnBb//5sdlGc9//X6U9unogyoA9e5EQHn6zeLZyYthU8F7xUX7YAZeW5+3vusCvx4DXNEeqNBK7p4DBqsTCshm+j+89lAG+vq+gl7PkkdFcxfzjGwrqldz4UPD4RpNtPpDcfEHsLaq7bWTIzt1ikW3GKHy+dkh1cJ+HsJ9LpkHSgzViOEsNudG+YfIkXZroKidc4QE4yQJknBiyfANGjVEu12D79Of/70Dm3OxfHLYUTqCHBe1Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Rahul Singh
	<rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKudvyQAgAXn/AA=
Date: Tue, 14 Sep 2021 14:24:10 +0000
Message-ID: <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a004ef87-ac4b-429a-7985-08d9778b51ee
x-ms-traffictypediagnostic: AM0PR03MB4577:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4577A73FD229484106A42C21E7DA9@AM0PR03MB4577.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Hl4VbB50cC2oV+4PzMe5ex2Q/vRR63KeYhqMqP1s1qStz1MBhaq3g6T+VPbOgz7570EEYuRJb9bXvvV65lXHhHaDig2nhv1ILlv+QZX08eD+46Sq7XTl5AMfAa8G74Ob8tGT/kkzC+jidgd0YQIGeKKWkOl1VpbSMh5zhq3/gQ1zWtV0k63qETolN2ikvOJ98QWht2+5SiwB/nV1l2QSOpFXF1/P9uRUsMo2TN/2fIc8MskKHCb4jKj3fSyGXpYgf8yaKQkdGwAlfblyiGTu8xVvhPaYPEgwX9i7aepCRST9EVwUXfvF0+rCMxbh6qN1AZEpJA/YEl5B69/4NQToZS2hdzqGbIHbWgWjyrgFpJvrgF5JtIUSjty2LmCcH8YAKlT9mgKFCE6p5ne7F27fS+EPVSTyO7z+AHilOnLafgURU8tcXH4dZY9GzWAEltkB33l6wyqHhs+Y/u5mGEoOFKCruxhkJaG+JTECJPfxPnZ+0OSIy/s+mHUSVD7RegV8+Ql4Fwb7jXLjqGOGC+6lfCIryUoHTsQiAkNadVuQ7s76xvcais/bZmZxQepMXSyWOzbmr+J4vglMmCA4mEZYeEOPnsofGPUzTAljDZZwfrEMjFxAN28M4sTW1JUzsx4WtG6QMTa8U53y229Joyeq6mXuFHR4/iX2Ywbhgy3RAclMEpzNOrHhC9S93OKyTrSHyv1csEb9q93N/3QDkxpoGYf/vuOjv6D5dhuzMJsk4SmUgj/0f6+F9X96o0bGvgle
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(31686004)(478600001)(26005)(86362001)(5660300002)(31696002)(4744005)(2906002)(4326008)(6486002)(71200400001)(122000001)(6512007)(66446008)(66946007)(8676002)(76116006)(6506007)(64756008)(91956017)(55236004)(38070700005)(110136005)(2616005)(316002)(36756003)(186003)(66556008)(66476007)(54906003)(38100700002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXhCS2kxWG5uWUN1eHdabXlYZHZxb1hmenBoSkRhN0s2MlhGK0hmc3JTRmNC?=
 =?utf-8?B?TzVFV1pacGxBdzloS1BXbytDZXpST0hSdXp0N1phNXhuNmhDQmFFL3FXcnlt?=
 =?utf-8?B?enpsSUNHaldJY1J1NHIzYWd6TmZsdURCaWlMTzN0YWdacmxncDFsTVpYb0k3?=
 =?utf-8?B?QXAvbmFRbStYeFQwc1NFWmpLeWc0VXVaWHAybG9wNlM5VkdLNnV2elRPeDdt?=
 =?utf-8?B?azNJVkZzdVJmZ01YZzdMcS9oSElJNURDQThBQUNFckpLYWlVdlVtUmtFcHRu?=
 =?utf-8?B?dFJDZFJYaUxpbStjZDE4d09Sd0JYb2NVV0hwOC9reUtOcVY1R0ViMENvcjRG?=
 =?utf-8?B?NmNSU001c3ZJeWZSVXFJaHRTcTdsaWRuVzRtcklkbWd6NVlLNks1eTNvVHpT?=
 =?utf-8?B?SGlGWTlIZXQ3NTNSZEdidWthSkF6NFp2Q0hHbXhaQXhLYTJJSWVPQWdBc3Bz?=
 =?utf-8?B?OFJNSUdEd1d4a2VTNkg0MDYyYjZPT0ltY0hNa20wQ21RaHQzVDNkVndEZEVi?=
 =?utf-8?B?azdnVE1qNFpNbWoxcVo0bG43bDZJVGVBU2dtV09ZK1VhbktOTmNIWjFqeEJo?=
 =?utf-8?B?enliM3lqcElTZ3lwTWNBdGNEWkREVFl1WjBlOEZhdDBRRFRVK2JUc3NEMjBm?=
 =?utf-8?B?b3p0M084bklhK3JvSWV5UHg3QUs5RjN6bXlRWVJtdGxVRS9iRzBZVDZwL0du?=
 =?utf-8?B?RmpwRlBNU3doclp2c0twT0tzd1dhRHlybGdLOFh5ZjI3aG9FaExJbE0vMFpz?=
 =?utf-8?B?dmw2cTc0MzRmVzE4Y3BUSU45NXJ0UWorano5eFNiWG4ydXRyY1YyWW1WM2dr?=
 =?utf-8?B?Nk0yWTRmY1BIU1djR3psVDlPUFhyYTFtSU9Id0VGa0tyNHFjZERKOG9NNWxl?=
 =?utf-8?B?NXhHVThlaFNTWjBlRnhrRm5wNVBWMHg1UHhFczN6TklmQ3hyUzBPc2lrNmxm?=
 =?utf-8?B?ZUFJM1YvNG5oQndsNjhHZlAvZlAyT0VBYWdVeWV1VWxOWVdHWURCQW4zSXov?=
 =?utf-8?B?Yk8vNlVDSWpNRWgwY3k0YkltQVFGNHBISkhjMVpyWVd4VjhzeS8yclVCcURG?=
 =?utf-8?B?ZkR2eDJnVHBvenVuUHNqVTgxUHFRZSt5eXBQSzVKckppRjcwYVd2SkdHV3R0?=
 =?utf-8?B?MjJvdnJkZFBFSEp3SGFGNEp3VkFUN1JGLytocDRqNUg0TFo4RmM2VEs5TGRi?=
 =?utf-8?B?TlZoOSs1WEtJc2VaT015anc3WUZSUjBHNm1FVjBUL1hKVVlDeVl1YWJlN3RL?=
 =?utf-8?B?aHQxdlZkZjZ4U3J0UHVGVWZWVWYzeXE0MEpGaWxRTE91QVJHSmVCbGxWaWtU?=
 =?utf-8?B?UDV4R3pWNk9RcDJta0dGTG91NGpLa2xWSEZPNVNmN1Q2U0pkdVFwclByNklS?=
 =?utf-8?B?OS9xSlRzSkpqV0cyQkc1REsxV2puN29yL0FCaXFSS0hpNmFJbDBBL0RWR0Y0?=
 =?utf-8?B?UkhaTDhERGdmTXFEQXV4Z2RVTy9oU3c3UWdqSmZZVWNIb3J0c1RLY1gwbktN?=
 =?utf-8?B?enJMaXFoRlNVSDR1bWpRcFF0Wm5Jam9IeFZxN0NUK2o1MWgvalJmVHpIWTZa?=
 =?utf-8?B?Y0lEQVVlTUpMOU54KzAycWFyeDZVZEhxVVpiUjk1cWU5anpkRXE3bjBMU0JH?=
 =?utf-8?B?TUk5cFAyQmJaOWpmb3RYSGMrOG9lMXRMTFAyQUdNanRhUndVU0FMMXBUYW1N?=
 =?utf-8?B?ZW5udXJaMDZXbnFSL2Fka1RHbW95QkpqTlp3SEZUNGM2SGZsMnh0aHJsNFBi?=
 =?utf-8?B?NEJqQWlQNG9EdGIwR3JpcUc5emhpZTFlZmVneGNpV1dIRjd0T2NFTGh6RUx6?=
 =?utf-8?B?dCthYTd3S2pHWXY0RWt0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDE03ED3F5F89A4A8F5C97D4FFA4D04C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a004ef87-ac4b-429a-7985-08d9778b51ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 14:24:10.7143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLVWpVT5ABBx7rnkeAeIN7F6yfdU+xjVoQuFiQJbgDVY2xWkZOAijFGpIhISKZlojKXZnEWEdnlAng1JZe+iheQ/2gKDOvJrxpOzKJkPzPygal2gIdldP/nacq5ZdNCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4577
X-Proofpoint-GUID: UAg8ZOV1Amfvid24SK2wHPVkF-z6c9YM
X-Proofpoint-ORIG-GUID: UAg8ZOV1Amfvid24SK2wHPVkF-z6c9YM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140089

DQp9DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgcGNpX2VjYW1fcmVnaXN0ZXJfbW1pb19oYW5kbGVy
KHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtbWlvX2hhbmRsZXJf
b3BzICpvcHMpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9
IGJyaWRnZS0+c3lzZGF0YTsNCj4+ICsNCj4+ICsgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQs
IG9wcywgY2ZnLT5waHlzX2FkZHIsIGNmZy0+c2l6ZSwgTlVMTCk7DQo+PiArICAgIHJldHVybiAw
Ow0KPj4gK30NCj4gR2l2ZW4gdGhhdCBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgaXMgZ2VuZXJp
YyAoaXQgaXMgbm90IHNwZWNpZmljIHRvDQo+IG9uZSBicmlkZ2UpLCBJIHdvbmRlciBpZiB3ZSBl
dmVuIG5lZWQgdGhlIC5yZWdpc3Rlcl9tbWlvX2hhbmRsZXINCj4gY2FsbGJhY2sgaGVyZS4NCj4N
Cj4gSW4gZmFjdCwgcGNpX2hvc3RfYnJpZGdlLT5zeXNkYXRhIGRvZXNuJ3QgZXZlbiBuZWVkIHRv
IGJlIGEgdm9pZCosIGl0DQo+IGNvdWxkIGJlIGEgc3RydWN0IHBjaV9jb25maWdfd2luZG93Kiwg
cmlnaHQ/DQoNClJhaHVsLCB0aGlzIGFjdHVhbGx5IG1heSBjaGFuZ2UgeW91ciBzZXJpZXMuDQoN
CkRvIHlvdSB0aGluayB3ZSBjYW4gZG8gdGhhdD8NCg0KPg0KPiBXZSBjb3VsZCBzaW1wbHkgY2Fs
bDoNCj4NCj4gcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsIG9wcywgY2ZnLT5waHlzX2FkZHIsIGNm
Zy0+c2l6ZSwgTlVMTCk7DQo+DQo+IGZvciBlYWNoIGJyaWRnZSBkaXJlY3RseSBmcm9tIGRvbWFp
bl92cGNpX2luaXQgPw0KDQpJZiBSYWh1bCBjaGFuZ2VzIHRoZSBBUEkgdGhlbiB3ZSBjYW4gcHJv
YmFibHkgZG8gdGhhdC4NCg0K

