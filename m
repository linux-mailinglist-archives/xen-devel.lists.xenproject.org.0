Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF441C3F3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 13:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199028.352841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYCR-00063w-MX; Wed, 29 Sep 2021 11:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199028.352841; Wed, 29 Sep 2021 11:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYCR-000622-JF; Wed, 29 Sep 2021 11:56:35 +0000
Received: by outflank-mailman (input) for mailman id 199028;
 Wed, 29 Sep 2021 11:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVYCP-00061u-Ra
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 11:56:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c49f5cb7-6ad7-4af6-a3a9-ae886a1f8102;
 Wed, 29 Sep 2021 11:56:32 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TBnKju020531; 
 Wed, 29 Sep 2021 11:56:27 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bcp1crbsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 11:56:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3472.eurprd03.prod.outlook.com (2603:10a6:803:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 11:56:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 11:56:24 +0000
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
X-Inumbo-ID: c49f5cb7-6ad7-4af6-a3a9-ae886a1f8102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxwMfsNziAeyefWfP6oI6n+OafV8PRc8Yzks1LtnJ0yCNKeGixebGW95bicuo4D5MSSu5UoA8czk9y6ERFAAc6Y1wIWcBh1HUOLvxxf3U8tUxwSdwD2157OxfHSdiUXkfSkVv2w2m2JuTG0p0D8aLv59AiaPzXduxB1HheSL7m3iB5xqTvcnfigrQpZNnF9tjDOBXay0y6RhkVZz8daFR6X1diu2CYTdzVkeC9RBgFeo//03etAzdqkBpyfWSIhsatKdrQzTaxgDT/0xI/wO8p2688jRy6HebhlyVom+hRPPmnlZe9Bcf9TRFMqLHnbHmjAVzUU6uUL9dc49Z0ec1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WkZ3YPW1QEUhLOUhvyxRkmwjv6LmF2TOVLG0kFX4W5U=;
 b=N7NJT0HkaMLLeL87GeIoAVV4JZqaqzhBE6lIjCoXNZ97crS0Ocf8322I7oOJxA9pP1JXyWoksLEnk3Pi+KPEKtt1xxwsdIJ3cz5n5zZbWohXGHZ7Ac4iuwPrR5LplefM2Luty6y6Yq/7VThkfLEpPKvRHeVXAKQPpK7vQXboDLoYmXjRIexxAZefkdX9IjenCR6KxIhGSpo0EXVUgxJ8RUN/1TuqnAGrJIwFrne9//WNR44qPg5yQCxKzEm8LJXPR6e4IA8dhUN1SlXIL/jki5wd2aOVLnM1Uw2dUDQONE6rr6VZlWAxljlUl77Ywpzv4Cd/+COHdE5lXzX8U9eLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkZ3YPW1QEUhLOUhvyxRkmwjv6LmF2TOVLG0kFX4W5U=;
 b=4PtrdQdM3ICJ/KcI+RxcXFaSfvWTvBh0S2DM5tTTlaByBX9lj/76pISNFVreIZEHwOw2htuhau7KhcXLdl8FuWJ2Z2tk6R4EuvgS5jxxeuhjS+atksRhADqA8kMUPOW+O655IJh7krqjw0ZbJufU+2Je+4B32JObV/pMDVvIjUphVK8ljqfKlGMDCjfTCEX2MSGMryKu0h8u+llgc42mfVS+tVg53ZPvrzW1j2Qrp0pzs5eAdq/5I0PykhegnvU5t2NAwNLfxIQaY4m48ZTEtAT6ETfR7yy7LGSwZMmsEEFsn6MuHk9ChemwyuJO5fMEPcQIBW7+3o7ZcuGHjJ+QRQ==
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
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Michal Orzel
	<michal.orzel@arm.com>
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: 
 AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyAgAFQpACAAAGzgIAALsGA
Date: Wed, 29 Sep 2021 11:56:24 +0000
Message-ID: <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
In-Reply-To: <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ce2ffc4-4be3-4304-27c0-08d98340292e
x-ms-traffictypediagnostic: VI1PR0302MB3472:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB347292C981ED42A0DC6512DFE7A99@VI1PR0302MB3472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LZ8fc7/f5iPS0BfovvIwYCas9hB71dGzKCPH+ScXa5/ZqYdqUV/ONAJf8U/5hWxH4KDrhSeUw18gYiYB5to6iX9xD2j2hkP5KlUEIWnASYstEsXZO/qwnNLR+u1Zu1WtbCxrsqTjRsOgu0g4q8n8hePjAv9w+nOJO/jcXOxAFVFJsGWp4VfCNrdic2U3G1bbNLw3Y1quGIrHtGl1+y5jUAowcN5iQrf+tIjAn2ow8ulhsRIwb1ZDs+Twr14LCoaVtZG3QffhhaVXlxeI9cMCaZarvg4ADoeZ8zv+UAukUD+SneT23zIkzUzFUIX5eJBsmIVrpLcuGpLeDalhsMvzE/fowMjt7gLe+MwtD0tbQf2VI8f5/+X43vLoJK9lXYw6AVDk7TB1lKiLF6oScXx3E92/OUKO7qMV49ps4rbrD1e1w/Wr0r7v+UYhKOkXCXCWcl3JNpyHkMnJ4HxL6hVD8644aQYyQW79HRfTrZ/tCPEgANWTiCUUvrBEpP4ce0/aIzOAKpeKjvXMZr8y0ziEaleHltG7DHEyh0XpWxe08oVwssX2zYdeiaEExHMMi4BP9DXeKMeSNqMq1ceX9F4XV2+gVXQg0qPTk0Hp7gHVgKIRV5tt63SXOywLnISh3cf7uy9VGqRHDnDT0AyxkQ7eZJaL9LUFyNGsaiKAOTfT89rixwFTsFhw6pbzprjguyeQoFmc4BrfQYG8N88CGKPkV8OqUqJqbA/2pVjJh0JV/PcQry4KlxYHpIFyVDgmNk0G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(38100700002)(38070700005)(2906002)(6512007)(71200400001)(8936002)(508600001)(31696002)(5660300002)(186003)(55236004)(26005)(6916009)(66476007)(91956017)(54906003)(36756003)(4326008)(31686004)(8676002)(6486002)(2616005)(66556008)(316002)(76116006)(6506007)(66446008)(66946007)(64756008)(53546011)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnJMeUVnblBVRU04TU5NSTVCMGVCeUpuVjNDK3kvelFkWXY5TjRWSjVOYVc1?=
 =?utf-8?B?VHVPY1FtWWIzbHNOZ3pVSFYzWkJhSWl4L3FDbDBWenNDN1dXZlZRY3MybXN4?=
 =?utf-8?B?TVlRVFpkRG8rOVl2RzFkL25xNWYrU2FhcGdheDJyWHAyTHhwTFByQTFzeVp3?=
 =?utf-8?B?MjNUQWp1WEdqcGtuRjJPMHUzWkVjRDNrbVY4Z3diWXFsS3BLT3hmdnNndmdo?=
 =?utf-8?B?UzlRTFFSeTc3ZjNxbHN6anA2ZmdXeWV3QTJGcWhJSTdlSm0rbTgxMC85VDBt?=
 =?utf-8?B?UmdrT1F4dFpwOHJQdWlkSVBRVDVLZER6cE04Zzc5V0hkUlo0ajVBdmtyM1lR?=
 =?utf-8?B?MU9wdC9YRkx4Z2o1RGVFUDU1cUJUdG15UlphL09aSm1maDdIZHRReHB5UGZo?=
 =?utf-8?B?TGcwUXN6T0dPdFZacnFkZzI0TElyT056UzhjQ3YvY0NPVTc3UW9SVzg0elRG?=
 =?utf-8?B?VzRTZUtmYXFxWmdrckVxZ3daOW83aWYyTGoyaExXbTR6NmFJck1ENjYzd3Fm?=
 =?utf-8?B?b0g0L3F6TVFaWmlDcDhuT1grakE4OU9wdmM1U2Vya24yQ0hoSGFoOEFoWkJL?=
 =?utf-8?B?OG9EcW9oTlNxaDJETk9UM2MxUDZZTmdpUG1rQW9SK29Na0hJd1FtRFJTcXFE?=
 =?utf-8?B?MXk0a3FDWjEveVF0YUxYQS94UGp0ZkVHSkRmVmgydkVUajRDa1FralB0WUYz?=
 =?utf-8?B?NHNGakZqWUowQml6cldES3VIZkRWVzZDdmJjWWxKZmsrNEhHZnQ2ajM0UlFv?=
 =?utf-8?B?YXZTaFpsejdHbkRJQUdVYXFyTFVhUXBDZ01kckY3S1A2Y0p2aEEzT0cybTFp?=
 =?utf-8?B?V2FZZm1JaU9HWnh4cHVsRWowRzJldERmTFlWbEV6TGVmK2szaW13M2cxSHRJ?=
 =?utf-8?B?YWJBdis3VlBJb2p1UXZtak9CVHZGbWIrN1o3WVBKTmJLTFpTdXJNeTUxenNW?=
 =?utf-8?B?UEVmV2ViKzdQcG5wTnRFWll3UFpsb3VYV21KaGt1dzRCWXlKbU84TFdpYnAv?=
 =?utf-8?B?TWJobGFyV21iU1QreTcrby9NaU9XZFhqN1pJOU5QRkxQeHU3KzR6UWJPTWFT?=
 =?utf-8?B?Uk5laVZwWC9kbHBxZUhSQjdQaTlPdjV3N0VMU3M3QjNyaFNwN0NGVE5iVTVU?=
 =?utf-8?B?MDM2VWNGUzFremNwcHdTZEhLOFp1YzRMUjN2QWNoMFF6SWZIU1QrY1hqTGc2?=
 =?utf-8?B?N3RVRnc1QnVzNXRWMXRXL0gyQXUyZS9CNm9DR1FJL3diRU5jQnU4Tm5QRzc4?=
 =?utf-8?B?UTFiNzhZTTlMMzFoZkdNM1h6UUJRajJvcFN2UFkwUjBnU0FZTWM4NlFJeHJK?=
 =?utf-8?B?b0QwVHZuWHlrMllUMXdwQjZSSklWbUxKUnFmTUtUSHJKSmlXSlFlUmFHL2lK?=
 =?utf-8?B?NDZpeXZzdkh6NFRyWmM1MUFCRXRuQmVKbDdPVXJSd2d3NER5RG1IcFN1Um8x?=
 =?utf-8?B?SWNDejRqOGpmQUFxbmw3UEZZRFMyZ25OaUVtOTVjK0Z0bENRRmYwZE5SRGxV?=
 =?utf-8?B?dVhsK1RlQStRenViOUpEZjRGY0dIVHh4T3B3YXpPMzBCV2FDbVpxaVdMbU9P?=
 =?utf-8?B?Q1pIN2VTRDBhNU5mNjhQUFdieGxiY1hlVWN0ek9CZU1KRkUybDhWR3dFdEl2?=
 =?utf-8?B?dWw2Sm1ZVFN1T1ZlSkI3U09hSmJtRXZwMzVCTkVoZUw4Y1QyQUFRRFZDeXlu?=
 =?utf-8?B?U1dVZmhjQld1cTJhdHRUT2V5TGZkVVJYR1BHbWhPalQ0cEgycWJwZmozT2lh?=
 =?utf-8?B?UWxZTHpNNGZrbFh0dXJNQXIveWJYbjA1enlSUCtxYm5pbFU1MlB3OTY5T3hV?=
 =?utf-8?B?Ty9zWDlSUTI0V0dEVmJudz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9F507F76FDF2E4297A2B70503E6B1CB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce2ffc4-4be3-4304-27c0-08d98340292e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 11:56:24.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBQwLEK3Q4ftzjvf3sE+kSAiIlfqV0OadPHyAi/8X1Uho0HX2MAt4vGrvZDqp2+dMvV8vvJFaSF+QxEJ7TY6F4aDUS3h73jpUmAS3srKRms5tkOBgt9Wl6V0OBtt/YZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3472
X-Proofpoint-GUID: V25B-ehXs9yaE_ysZvyYdqIWU-jskfeq
X-Proofpoint-ORIG-GUID: V25B-ehXs9yaE_ysZvyYdqIWU-jskfeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_04,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=875 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290072

DQpPbiAyOS4wOS4yMSAxMjowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI5LjA5LjIwMjEg
MTE6MDMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gU29ycnkgZm9yIHRvcCBw
b3N0aW5nLCBidXQgdGhpcyBpcyBhIGdlbmVyYWwgcXVlc3Rpb24gb24gdGhpcyBwYXRjaC9mdW5j
dGlvbmFsaXR5Lg0KPj4NCj4+IERvIHlvdSBzZWUgd2UgbmVlZCB0byBnYXRlIGFsbCB0aGlzIHdp
dGggQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+IGFzIHRoaXMgcmVuZGVycyBpbiBz
b21ld2hhdCBkZWFkIGNvZGUgZm9yIHg4NiBmb3Igbm93PyBJIGRvIHRoaW5rIHRoaXMgc3RpbGwN
Cj4+IG5lZWRzIHRvIGJlIGluIHRoZSBjb21tb24gY29kZSB0aG91Z2guDQo+IEkgYWdyZWUgaXQg
d2FudHMgdG8gbGl2ZSBpbiBjb21tb24gY29kZSwgYnV0IEknZCBzdGlsbCBsaWtlIHRoZSBjb2Rl
IHRvDQo+IG5vdCBibG9hdCB4ODYgYmluYXJpZXMuIEhlbmNlIHllcywgSSB0aGluayB0aGVyZSB3
YW50IHRvIGJlDQo+ICJpZiAoICFJU19FTkFCTEVEKCkgKSIgZWFybHkgYmFpbG91dCBwYXRocyBv
ciwgd2hlbmV2ZXIgdGhpcyBpc24ndA0KPiBwb3NzaWJsZSB3aXRob3V0IGJyZWFraW5nIHRoZSBi
dWlsZCwgcmVzcGVjdGl2ZSAjaWZkZWYtcy4NCg0KVGhlbiBpdCBuZWVkcyB0byBiZSBkZWZpbmVk
IGFzICh4ZW4vZHJpdmVycy9LY29uZmlnKToNCg0KY29uZmlnIEhBU19WUENJX0dVRVNUX1NVUFBP
UlQNCiDCoMKgwqAgIyB2UENJIGd1ZXN0IHN1cHBvcnQgaXMgb25seSBlbmFibGVkIGZvciBBcm0g
bm93DQogwqDCoMKgIGRlZl9ib29sIHkgaWYgQVJNDQogwqDCoMKgIGRlcGVuZHMgb24gSEFTX1ZQ
Q0kNCg0KQmVjYXVzZSBpdCBuZWVkcyB0byBiZSBkZWZpbmVkIGFzICJ5IiBmb3IgQXJtIHdpdGgg
dlBDSSBzdXBwb3J0Lg0KDQpPdGhlcndpc2UgaXQgYnJlYWtzIHRoZSBQQ0kgcGFzc3Rocm91Z2gg
ZmVhdHVyZSwgZS5nLiBpdCBjb21waWxlcywNCg0KYnV0IHRoZSByZXN1bHRpbmcgYmluYXJ5IGJl
aGF2ZXMgd3JvbmcuDQoNCkRvIHlvdSBzZWUgdGhpcyBhcyBhbiBhY2NlcHRhYmxlIHNvbHV0aW9u
Pw0KDQo+DQo+IEphbg0KPg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

