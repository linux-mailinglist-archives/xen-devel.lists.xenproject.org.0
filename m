Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC841E897
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 09:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200462.354984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDQ8-0001OS-9m; Fri, 01 Oct 2021 07:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200462.354984; Fri, 01 Oct 2021 07:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDQ8-0001Ly-6e; Fri, 01 Oct 2021 07:57:28 +0000
Received: by outflank-mailman (input) for mailman id 200462;
 Fri, 01 Oct 2021 07:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22t+=OV=epam.com=prvs=09080f3fa0=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mWDQ6-0001Ls-Oc
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 07:57:26 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374f499c-228d-11ec-bd96-12813bfff9fa;
 Fri, 01 Oct 2021 07:57:25 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1917YHZJ013384; 
 Fri, 1 Oct 2021 07:57:23 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bdx2702ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 07:57:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 07:57:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 07:57:18 +0000
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
X-Inumbo-ID: 374f499c-228d-11ec-bd96-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vht6sfeNUOEv61EmalB08Bfav3VJZLlJBv1G3+CMv2rzWpKXk7gFN7tg+WqEhQziC1p5Cn9YabI4WbHKVNRJYVYTnGx5XcBmZo8NQaKBzpUkHT1YTGPIMykWgxEKzHzJBPAIY/JVxwxHBZ1v5C9ajUInpuM888t5ngvAz8PHh6LVhkROZcT8irDFHSKWbYMWExZr8cSaPq1k660DQ0kk4YaDH3O+/zdECxHdz1ycSQ+w95hZ7sQQujdaLzxlGR8ASNuQecOBkjTbkcpaIPf2/ANypaF84I31FDeUjC5Oud9eVzWGVBfvlYfqS6fPQkYalFDYgBVV/Ez8yf45q1vIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oul6kvddgGmqeZvIIOQ6ekwdrkDx2Bt8XLV61qriklE=;
 b=l/1j3ILZF2o6BgTJDPdt4E4KbRNMri+aCogkkky+wlnVZ9bOvueePMQ8NUm2Fl5AzT3Fgm/4l86A+1g/v30zZRWBYMYKeVTdP2dX2XWRGvmeaDqiVLBkc933EuU5voMD/PbM/lMQiGDi0m0BkTajyj9GFRjRfSn9odBNB+yiak9SH07dkH++qWaOYrYSe+tklPCfktM+Mk0V3fB+jefrD2DnA3hE7/wotz7kByl5CqPR7ukuyXFp93jKWjqVnKGl4fwq4x9x9HmRZVrzsMi3Y7AGXyP8nxz6Goo5FgpVaBtcFqPOPiAJ3Ef7zh/iIR0NK4jRjEX2fSj8Bf+0/tvSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oul6kvddgGmqeZvIIOQ6ekwdrkDx2Bt8XLV61qriklE=;
 b=066QraXEP8R7Syh/bvX25W2QtOl6oS2yf85ZezZwmaKTtYiX91n2IqbGF16ee+Zh6kRZJFub8Hi/qp30yJ+gJdgDzKkmCtE7TO+cYBQhsc3qCpn0W2QnoHGUzsuVh1g8R9GvJBW//tyI+kRAtCG+QHjVCyFuUuR3L8vP4pAj6+CryVChxSFjj3UWt3lYgsK+eDgnwBgOVuTYibDd88VNYsiGtVt0rhIl8JtD2+tHLUWF9GKF1D6cb0RD+Kk1m2UIaESSHb4rRz2r1/nbEjiwJWd7Gz6uAc64uBKsANtWScksNLYx3mDgGQ5/4vpkqs/2sMYmRyp7lsjMYUNZtzxM/A==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXtdAlBwDHpaYUBUq6q0PlsxoTp6u8Ra2AgACHPgCAAPdBgIAABBwA
Date: Fri, 1 Oct 2021 07:57:18 +0000
Message-ID: <5a8d1ad1-c10d-16ea-4ab9-5c0e1600b3b2@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
 <68a608f5-4159-5734-4c08-5a70ae9d3ff4@epam.com>
 <062c2801-26be-ef3b-71d1-70c598705b94@suse.com>
In-Reply-To: <062c2801-26be-ef3b-71d1-70c598705b94@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ed33cd5-43fd-471d-9edc-08d984b1178c
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6963084B727DAD7108EC2644E7AB9@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tmayT1ceZC4sqhYrWFyKggUeoCkjD9meC8nHRo0PbG5KldiHvPjn6stmbv6C/ekvXWUrDMb9U1Szt8Z2nOIzHNfap9TTqEP7O0zoRKn1ZdB1O4+x7EflgwaTHrjPVejfmx+5Tc7LB//HoKBV3+MuyOVN43f5G5WRVYEbfPrIJS1wXLKenZ3E/Ctj35d7o216Rjp5RanqdlcZkN06/JGBid/VbipGeY36Z28x0znltNY3VAKEdpFGFKrjEbqq9hNsvK6R2l0oAjZlZIgOu+1ky1OKXGGfoktM0znkFtlB0JEfCGGzkQrefvlOZvBJILmUoHTxrh4W068AXwu2tbuVii5Nr1CcLfySxNDPOvZBfLOS/1CenSlWzZv617+4xS5FgwxWQMPPg61uz7w8hlVp1qkG28voLdrCU8NscZN/0eji4dZkIkdVmXt0H5itfFAQ8XITyt5sNk8abgdA7FyAZC0IUD86QW1MlKbYjiBQTzFfP0y+0XHzdD9MKGcimHo+oQzcQEtFWp0cgSxN0JaIdtQYYO80Gjt8Qz67GHmwISCyza5rbQ75Q7CJmbxaK8E1ENJUYIKNUClOkXu9jLcVadD+26uF5i8ZR6KcnYP9MaWmfDjX5abkAgN1CzXtXmIrKm149XNsKurhjGPV5B3AMaXCFFHjzGKeN3n4CJOCSYrQ225tjdf2I2mZt0B1sbgmLRitybUD91ouBSWNlrK/ORH1p1WPL4Cz7IecnNYIU4S7nN3jFm5ty04WbuyPJck/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(54906003)(5660300002)(31696002)(8676002)(6512007)(83380400001)(26005)(36756003)(53546011)(6506007)(186003)(122000001)(38100700002)(2616005)(71200400001)(4326008)(64756008)(2906002)(107886003)(31686004)(66946007)(66476007)(91956017)(76116006)(66446008)(38070700005)(66556008)(6916009)(508600001)(86362001)(6486002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFZWeHRmdWt0QzNaakhaNktzUzIzd2RRRUFRV29rbGhDY1NsQ3NXU0swSGxB?=
 =?utf-8?B?dE9pYXdHbzhzTlJjdTYzMU9jdzJRTHZhZ1dxTHMzVTh5TG9qWVJZWnNvOWtW?=
 =?utf-8?B?MWZKR3dMWGNYeUNVMDBiNElHODNsc2R2NHpCdGVPNnpudlMweENxMWhyY0FV?=
 =?utf-8?B?aFVvbjhqM1NibGkyR0hFNENUVm1sRHdsMlVPRjBNeWdrRnRTMVY4NEp1aWFx?=
 =?utf-8?B?WlB1cXZKakJuV01aMkpLVVB1RGVnN3hjcVFuZmhCYWQ0MGs5TTdOZjYwTTN1?=
 =?utf-8?B?TUpVRmNXdGJIUjY1Z2NCb0tSdVZ4Q3RTcldsYnpvT1h0WHIyU3gwcVZsS1Nh?=
 =?utf-8?B?SllkRFNqZzZiQVJVQlVCditLSEFDSFVoQklDcVJ2VmJiN01VU1JpS0pLdDd2?=
 =?utf-8?B?ZjZrU0hhcUhRd3V4OGRyT3A5TFNDcHU0czU2RFNta3U3dGlGRVp4My9jdklF?=
 =?utf-8?B?ZTdXY3IxQ1hXdEZ3Wm5abmFaU3FCTGtVQ2sxanBrclp6M2JUc1Z2c2lJMVZW?=
 =?utf-8?B?UkQ5b0VHMS9UM1N1c2VTVE83QlYzdnBkTHZSVXFoakxaNHN6TDdJS3ByVXdF?=
 =?utf-8?B?NTVUNXN1RUJrZjBsN2Z1TGx2bmczd2dYbFhiMjdEZm9RTE9EeVBhVG1YeXJF?=
 =?utf-8?B?ZWYxUzN3T1d5WmhiQXIzWW5CT2wwQ3JtZGxoa3NjMHJiUkFrOXl6ZHl4cUo4?=
 =?utf-8?B?ZmVNRTJ0SkpIamFrRU5Ybjk5c2x2SE0vdi9EaVpEZzVHSnRRb0k2MG1lVnBT?=
 =?utf-8?B?VHJGQzBiL2RXS1NOMEMvVzVyRDJDaFVXKzJ5NzVtNE5hYXhKWi95RWNzZFUv?=
 =?utf-8?B?aWJLekM1MmhqeStja2RXZEUwYjlBdTB3cWc4elZEeGsxVE5mNWhYS1BHdTNn?=
 =?utf-8?B?QXp4eDh3a2o1bVBHTndnVmo5MEpSQjRqN2F6SitGUDRIWnpmTmsvbWRmdGZE?=
 =?utf-8?B?WGVzOWlFSUZ3YUN4T1JTeW9uOS96eitybDFkbzVRdktWVm51RE0zOHBFQkNn?=
 =?utf-8?B?VzdMRmowRks1OWhNczlzY1NUQWZ3bS9RSmxsdTIzRXNCeGF2ZVRkajFWa2ls?=
 =?utf-8?B?QkthdnRodExLczNzVDF3eDZwU2tqTm13K2c5OC9IT1pQS0hrM05EVElXZW0v?=
 =?utf-8?B?bUlobE1PQlBOSVZyV0wvN0ZWalJmOWF2TUlRdlFBYUlYblNVakVSbHEwUVE0?=
 =?utf-8?B?UHM0RWYrWitpMGZGa2lweEpQTWFnWnRySkowNFFuK3ZpS0JPaHhoYUxwcUhN?=
 =?utf-8?B?WG1LTCtoWC90K3hFbmZPR1d1K0pkdkt5R0pUbjlHV3JqdDBMZmtaL2tveVhQ?=
 =?utf-8?B?RnU0QnhVdmVuN3NQSmpVQjVTNnhPSVF5QTMwbVU4M1J5UTQzbjM2UGxFamd3?=
 =?utf-8?B?ZkljY2FpUGpIUDlyc2tTUUVzSzZoeTZSeWhFQlNmMW95TmxOUk1GM05YOUtL?=
 =?utf-8?B?OWt2Q2h3c1lIWUF6elgva2dzK2VrK2tKaDd2WlBtbmRpcmx2KzRDVitDbFJT?=
 =?utf-8?B?SElGVDFRcXNHYW5CdXg1ZXExRk9PbTd6R0d5R2c3VXJwbzZvdjA4Z2ltbDM4?=
 =?utf-8?B?dlZSeG1XUTJiQUpzcUF5aC91UkZxVWxJWXE5c1NEdUtNOW9zMkJSR0dzRHlU?=
 =?utf-8?B?TGxMRmZTbVlYaTVyMzJaVjdkQWJOT0RobVV4b2hlbzdFSlZXUzY1MldFTUNP?=
 =?utf-8?B?YU5RM0VmaVJqbnVQcHFGc2dtVnNPVGRnY1VjaStoTFJrblp2NnpDbEt5Ynpn?=
 =?utf-8?Q?8TY5nEZBIyfKntzZ4Vdfaew2HWxIyFCvwCU9fb1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB380916FDA97549AA06335376921C02@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed33cd5-43fd-471d-9edc-08d984b1178c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 07:57:18.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPl3COCLCqJL3NugTzwqCcniVMNu5HY4p2EqsAZjK8WnAM/H+WjRssI5QtwFYeWjzQLSDjCE/UUCEvbrTDIUlb4XQ1Bp58cwqNfq/xoPqJepzKDntQ8wZ3O/bEeAEJlL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-GUID: GQzY6pUBPlENbikOFZpMDjpZ5kmS4dOZ
X-Proofpoint-ORIG-GUID: GQzY6pUBPlENbikOFZpMDjpZ5kmS4dOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_07,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010054

DQoNCk9uIDAxLjEwLjIxIDEwOjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAxODo1NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBbc25pcF0NCj4+DQo+
Pj4+ICsgICAgYm9vbCBmb3VuZCA9IGZhbHNlOw0KPj4+PiArDQo+Pj4+ICsgICAgcGNpZGV2c19s
b2NrKCk7DQo+Pj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2X2xp
c3QsIGxpc3QgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgaWYgKCB2ZGV2LT5zYmRmLnNi
ZGYgPT0gc2JkZi0+c2JkZiApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIC8q
IFJlcGxhY2UgdmlydHVhbCBTQkRGIHdpdGggdGhlIHBoeXNpY2FsIG9uZS4gKi8NCj4+Pj4gKyAg
ICAgICAgICAgICpzYmRmID0gdmRldi0+cGRldi0+c2JkZjsNCj4+Pj4gKyAgICAgICAgICAgIGZv
dW5kID0gdHJ1ZTsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArICAgICAgICB9DQo+
Pj4+ICsgICAgfQ0KPj4+PiArICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+Pj4gQXMgcGVyIHRoZSBj
b21tZW50cyBvbiB0aGUgZWFybGllciBwYXRjaCwgbG9ja2luZyBhcyB3ZWxsIGFzIHBsYWNlbWVu
dA0KPj4+IG1heSBuZWVkIHJlY29uc2lkZXJpbmcuDQo+PiBJIHdhcyB0aGlua2luZyBhYm91dCB0
aGUgbG9ja2luZyBoYXBwZW5pbmcgaGVyZS4NCj4+IFNvLCB0aGVyZSBhcmUgNCBzb3VyY2VzIHdo
ZXJlIHdlIG5lZWQgdG8gbWFuaXB1bGF0ZSBkLT52ZGV2X2xpc3Q6DQo+PiAxLiBYRU5fRE9NQ1RM
X2Fzc2lnbl9kZXZpY2UNCj4+IDIuIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNlDQo+PiAz
LiBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZQ0KPj4gNC4gTU1JTyBoYW5kbGVycw0KPj4gNS4g
RG8gSSBtaXNzIG90aGVycz8NCj4+DQo+PiBUaGUgZmlyc3QgdGhyZWUgYWxyZWFkeSB1c2UgcGNp
ZGV2c197bG9ja3x1bmxvY2t9IGFuZCB0aGVyZSBpdCBzZWVtcw0KPj4gdG8gYmUgb2sgYXMgdGhv
c2UgZ2V0IGNhbGxlZCB3aGVuIFBDSSBkZXZpY2VzIGFyZSBkaXNjb3ZlcmVkIGJ5IERvbTANCj4+
IGFuZCBkdXJpbmcgZ3Vlc3QgZG9tYWluIGNyZWF0aW9uLiBTbywgdGhpcyBpcyBhc3N1bWVkIG5v
dCB0byBoYXBwZW4NCj4+IGZyZXF1ZW50bHkgYW5kIGNhbiBiZSBhY2NlcHRlZCB3cnQgZ2xvYmFs
IGxvY2tpbmcuDQo+Pg0KPj4gV2hhdCBpcyBtb3JlIGltcG9ydGFudCBpcyB0aGUgZm91cnRoIGNh
c2UsIHdoZXJlIGluIG9yZGVyIHRvIHJlZGlyZWN0DQo+PiBjb25maWd1cmF0aW9uIHNwYWNlIGFj
Y2VzcyBmcm9tIHZpcnR1YWwgU0JERiB0byBwaHlzaWNhbCBTQkRGIHdlIG5lZWQNCj4+IHRvIHRy
YXZlcnNlIHRoZSBkLT52ZGV2X2xpc3QgZWFjaCB0aW1lIHRoZSBndWVzdCBhY2Nlc3NlcyBQQ0kg
Y29uZmlndXJhdGlvbg0KPj4gc3BhY2UuIFRoaXMgbWVhbnMgdGhhdCB3aXRoIGVhY2ggc3VjaCBh
Y2Nlc3Mgd2UgdGFrZSBhIEJJRyBQQ0kgbG9jay4uLg0KPj4NCj4+IFRoYXQgYmVpbmcgc2FpZCwg
SSB0aGluayB0aGF0IHdlIG1heSB3YW50IGhhdmluZyBhIGRlZGljYXRlZCBwZXItZG9tYWluDQo+
PiBsb2NrIGZvciBkLT52ZGV2X2xpc3QgaGFuZGxpbmcsIGUuZy4gZC0+dmRldl9sb2NrLg0KPj4g
QXQgdGhlIHNhbWUgdGltZSB3ZSBtYXkgYWxzbyBjb25zaWRlciB0aGF0IGV2ZW4gZm9yIGd1ZXN0
cyBpdCBpcyBhY2NlcHRhYmxlDQo+PiB0byB1c2UgcGNpZGV2c197bG9ja3x1bmxvY2t9IGFzIHRo
aXMgd2lsbCBub3QgYWZmZWN0IFBDSSBtZW1vcnkgc3BhY2UgYWNjZXNzDQo+PiBhbmQgb25seSBo
YXMgaW5mbHVlbmNlIGR1cmluZyBkZXZpY2Ugc2V0dXAuDQo+Pg0KPj4gSSB3b3VsZCBsb3ZlIHRv
IGhlYXIgeW91ciBvcGluaW9uIG9uIHRoaXMNCj4gSSd2ZSB2b2ljZWQgbXkgb3BpbmlvbiBhbHJl
YWR5OiBVc2luZyB0aGUgZ2xvYmFsIGxvY2sgcmVhbGx5IGlzIGFuDQo+IGFidXNlLCB3aGljaCB3
b3VsZCByZXF1aXJlIGdvb2QganVzdGlmaWNhdGlvbi4gSGVuY2UgdW5sZXNzIHRoZXJlJ3MNCj4g
YW55dGhpbmcgc3BlYWtpbmcgYWdhaW5zdCBhIHBlci1kb21haW4gbG9jaywgdGhhdCdzIGltbyB0
aGUgb25seQ0KPiBzdWl0YWJsZSByb3V0ZSB0byBnby4gTmVzdGluZyBydWxlcyB3aXRoIHRoZSBn
bG9iYWwgbG9jayBtYXkgd2FudA0KPiBleHBsaWNpdGx5IHNwZWxsaW5nIG91dC4NCkkgZG8gdW5k
ZXJzdGFuZCB5b3VyIGNvbmNlcm4gaGVyZSBhbmQgYWxzbyBzdXBwb3J0IHRoZSBpZGVhIHRoYXQN
CnRoZSBsZXNzIHdlIHdhaXQgZm9yIGxvY2tzIHRoZSBiZXR0ZXIuIE5ldmVydGhlbGVzcywgZXZl
biBpZiBJIGludHJvZHVjZQ0KZC0+dmRldl9sb2NrLCB3aGljaCB3aWxsIG9idmlvdXNseSBoZWxw
IE1NSU8gdHJhcHMsIHRoZSByZXN0IHdpbGwgcmVtYWluDQp1bmRlciBwY2lkZXZzX3tsb2NrfHVu
bG9ja30sIGUuZy4gWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlLA0KWEVOX0RPTUNUTF90ZXN0X2Fz
c2lnbl9kZXZpY2UgYW5kIFhFTl9ET01DVExfZGVhc3NpZ25fZGV2aWNlDQphbmQgdGhlIHVuZGVy
bHlpbmcgY29kZSBsaWtlIHZwY2lfe2Fzc2lnbnxkZWFzc2lnbn1fZGV2aWNlIGluIG15IGNhc2UN
Cg0KQW55d2F5cywgSSdsbCBpbXBsZW1lbnQgYSBwZXItZG9tYWluIGQtPnZkZXZfbG9jaw0KPg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

