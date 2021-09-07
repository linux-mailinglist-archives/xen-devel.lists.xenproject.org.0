Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED3402852
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180978.327901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa24-00049K-BB; Tue, 07 Sep 2021 12:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180978.327901; Tue, 07 Sep 2021 12:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa24-00047J-87; Tue, 07 Sep 2021 12:16:56 +0000
Received: by outflank-mailman (input) for mailman id 180978;
 Tue, 07 Sep 2021 12:16:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNa22-00047C-7A
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:16:54 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c5f5902-0fd5-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:16:53 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187BgonC004961; 
 Tue, 7 Sep 2021 12:16:50 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ax2jnh7sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 12:16:50 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM7PR03MB6450.eurprd03.prod.outlook.com (2603:10a6:20b:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 12:16:46 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 12:16:46 +0000
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
X-Inumbo-ID: 7c5f5902-0fd5-11ec-b0eb-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaP2QAgMCTDubOczWTEKnaW5lqTzjcYi8TwhpbfZshnhrNitlrieg4079WGTO27jI5vfrZBLfk709ahprnQ4DbfpczejMVD85JnWOYXWEaYCSIYZMVLivaZFVTCQbi7ED4t8/NKf/Yec6NbNu62ozbw8SmB0emavGMcwmeN5MbC3+EbGolxvnMAa01s/B+GMwvji7WqPFJm7ZXoEiLwtIj52ImqsBIJkFCoVlXQ/d2f2phwP1PGmNsLNmCsbDC9B4IbwwjmcmjrmdrFE01gpEBL9g/+/T3DquUTZIpwrGUPiZbapJAPJBAPCvYYH5TqGzNcbMi9WWovKk7XrO7dHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ommb9VYJ3nFEfnB9d/KRAz9te3a2pOZjcQ4N2qrkwOA=;
 b=isoC+O4Br4MGmrAB1wJbozl01Ni9zZ8m7SdnqSsbnS4LdnkFwjSKImIQrEbGQk7rGx+EJz6BWwPGNGhVx5WypTnGgJzFamZyvUordEF7UK7C/ou12hIILfDO0zn1Xhi3Rts4VpFaywZ08fliJxHdUi3428JJ1sSboyNHKxNJe3SWZTSZUrBPAFNZuDu01XjE6a6MX82A/GDx5L8IuNH1+/v1TzmZe7IB64SECadEGkyzgy65qd+7bWEP2vcKZTZqGfiMGzp4lbBObJDIJoEIe+xdGEdrmKAf52zM7AgpWnlRnx0k9jGhcSPdgzN1r+AGMoip21JkbXYqmLrGkPNqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ommb9VYJ3nFEfnB9d/KRAz9te3a2pOZjcQ4N2qrkwOA=;
 b=CBgam0yohhTe01AD5kNOU0JSUKfO8xLbxfX+tlR2C6jK1a086g8GIOLbP4x10tSVUQWMVpDjX237m8UZVKnQ7hq8SSeML5VPmBmRR+fYXLALZRPr3MhQ7VX5fY4JEGUD86qxe0uE9bH7WPF5g9n2n54rjcIoGuy9bE91w495FelY67I+TBbD+INMh/X7W0MMztLYoXmBv4KnVpQOvIDPAJJP1IfO446bO89x0pBxmvoBejxhnvkOn/1MLVT0pVQkbzmEVemragwohKKSHupNO3ONZ90QHI1ZBntHUu3Lz6bc3kbqL2MEkbIbWZy3wTowTLIVIFsogNQrRNOYsGS/aQ==
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
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: 
 AQHXoKusySJnLVveGkulaWKrBZdXpKuXEOQAgAFPE4CAAAkRAIAAB3eAgAALDQCAAAeQAA==
Date: Tue, 7 Sep 2021 12:16:46 +0000
Message-ID: <b4c94187-db81-d52f-0425-959fe1e9e83a@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
 <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
 <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
 <938156e7-cbd0-a19e-f09f-a41dce051367@suse.com>
In-Reply-To: <938156e7-cbd0-a19e-f09f-a41dce051367@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e21fe2b4-c39e-42c6-c929-08d971f95cd4
x-ms-traffictypediagnostic: AM7PR03MB6450:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB6450220C91BA3331A131E7CEE7D39@AM7PR03MB6450.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tx42NoX7I0FjIqitNk9CCQyO3eUWeaSvuF+pkG6la+FGTviuA3hRvR0lo1TJV+Vnak3jg2waJyf6txgMNAsWK3O5KxcLqQhv+uMH28ihy01Rj3CuNs0FLZ8XXIB57+HvPUE7lbRJ2nsslggYdVbinhEkYUB63PbB/35GPU6CHMNtOdH1oZLxx+kQagdtaweanaQSPTgN6MxK+MbUFy/SrjDDlZJG7H0DtPNUaXntncxg4hIAxRnbX1d+lQ02spoj5IU6sAPty5ZMeBtJiqDaIMMbUUyTLvFF8lBibDfsO1DLDgGScM9vFwEYlQ3omfkrYx6r9OElVdVJ/LWsU44kqE018mGEAp40Vt/haYQjr6cqDTzdYEPLYxnVV1XX27UK7AqMJh8+yK8bdMlj2IMmuY1H4rfSVFUxdveHAXleL+9o6wreJ/ffxSMjz5I41+Ikj1t0v3ONSGaBbVqy8PEx8te2GG+is4k/0NMyajM/bdYrLDHpIidBDB2Wa7GCKfdMEKg3iRL5TBbNoramyF8etsE/GmKNgEHraRLQhnlolpyoNEVW4rpRO22hfAGFQO7o8wbpVc6T1lotLsWgHkjFOypF3fM3YsvAJaxwQ+Wb+sp23lRjTcV8ty+TeCXpeVH29RCqXd5G2iqibBezeGprMrkfK0I6BC5dA2v8Gf6Msjqic2FeLxrSaR58rekzHDW52hOX5TF1SS09VHK0+zbW7EGdM9Cq0tsuixxksRFGz79ceLK+4tMZoDwy0bcm9a1ZPn9buw/WursHEgYcBAZXJg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(91956017)(316002)(122000001)(76116006)(4326008)(83380400001)(36756003)(5660300002)(38070700005)(54906003)(186003)(110136005)(66446008)(64756008)(66946007)(66556008)(38100700002)(6486002)(6506007)(2906002)(66476007)(31696002)(8676002)(6512007)(31686004)(8936002)(71200400001)(86362001)(2616005)(478600001)(26005)(53546011)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0VLLzJpd1h6bTVPaDRaQTNta1NUajhrTmcvUUFGZ2tLc1g4QWFZUlY5Qm9C?=
 =?utf-8?B?eklHT3RZVTRRQ2hTY1hzb3NBTHpUeGVTWkIyMkFOdTZ6MEl4c3QxcGhqWWNR?=
 =?utf-8?B?SHMwcE13RFh3MGw1MG9nVTIxNENjY1c0bEhGUHRoeERiM1grVzJLMUdPUHdt?=
 =?utf-8?B?dDhlN1ZvWnFGcTZDSFhOSk5vS01TZkVzSVlkTHQ4c3k3TTNheXRsTjREWERk?=
 =?utf-8?B?NTRUM0Z0aWlWSzBFc2doTDcwb2E2cmtuVmQzV1NQOGhZWW00Y1diU1Vid0x3?=
 =?utf-8?B?SURlamN6a0wyQlBqWTMvRndPSmVhellRemQyemZhcVJYYTNRcTNXeHlxN3RP?=
 =?utf-8?B?NVNjbUtYZVBQY1FMUDlzbGh3QnYwNXZ4ZjBGZzZiK0dRZjRtVGZrNWtQMEFy?=
 =?utf-8?B?WTRkTEtFbDhjb2x2ZGw5MUM4Sm11SXhKRzQvZlZFL3JXa3lPV242T2J2R3o2?=
 =?utf-8?B?Wjl4MDF3Sml6U3lUbzBFZEJKd2VwVjNYVjFSMHQ5eS9jTTFKRkY2eWEvd2x6?=
 =?utf-8?B?SmZxMVdqM1NnT0ZGbDRuMm5BWjgramFXZ1FheEx0dU5TMUlDQmhwemwvOUIr?=
 =?utf-8?B?UHpQVTBKdXg4UW9mU3lhUWMzMXpVaFd0QmVzMCtaZGErQXlFbEV1Z0Q3VzFq?=
 =?utf-8?B?S0lpQ2NsVTc0Y1c0ajEvbkpFK1J0NnorMStuK3VhNnBRZHFZNWxVQklHNFJa?=
 =?utf-8?B?TW9TRnk3YkRjYklYWFAvTmJ6ckt1enpKbmw2NXgyS3JUSEZrUzlyb1ArZFRy?=
 =?utf-8?B?anNZUWRPay83UjlWRGZsZVJ4VFFETDBnKzdxL0EzQXNMbDUvbDZzakllTHps?=
 =?utf-8?B?V0tpN3p5R2pBQlRROU1EUDNUSEpweVZRMmY2U2NzanVVdzRFYndpVjdYVnlK?=
 =?utf-8?B?L21BaHVIZGZIZUZxaXp2WjVNQUJra1psMVhwWC9QaDZPODJHWkFTcDlJbGFI?=
 =?utf-8?B?bjZja2dreGhodENWWUszOE5PdEpwRkFXcjJRdFlMYTc4Qml0c2U1elFWOTJz?=
 =?utf-8?B?dU9ZMU1qbjJsbkZqbHl6bTl1eWZDemVyYkJJa09UU1NBRHRSS2w4dUFRTXNL?=
 =?utf-8?B?WWtyakxGZlpQZTNpZzF6WmRVVkVZeDJHOGtqTVNvRmlzbnBFMk1mS2FFUlNR?=
 =?utf-8?B?emZiS0EzWXRXWDZ6NlhqczU4OWxFU2RCU2dIVlF0TjB1cEw2L0RsNDN1eTgv?=
 =?utf-8?B?bnV0SU9tRnJocEdvNmtjNFpRQ213NkFtUlZLM1BVdEcvTFhDN2I3ZlJhRys1?=
 =?utf-8?B?eXBHR2FRMko2TXhESVVHa2d1RCs2YXBVSXJWSnJEWG4weUFJbXdZcjB3TDJo?=
 =?utf-8?B?S1pGNGpaVjFFNmVOSVNnR1o0MCtEZDFQSnZJdmczVTF4dndEWmZKaTdxd2J5?=
 =?utf-8?B?VTQ5SjhQcnpCR1F5YWs1b0ZvQ0oxRFEzVEtLMkMySWYxSTZML3JWSkNPaUFz?=
 =?utf-8?B?TlNCVTBqS2ZNaW1Bbm9kMHd5M0pkTFZGbjIzMDlsUmpNaUV6cW1OQ2IvSWNI?=
 =?utf-8?B?TWxvR2Vxbk5BaDE5VUZSQUhLYlVFTEZDcDRUeW50dEJwRU5XOGFQQXFocGpV?=
 =?utf-8?B?WmptMGxuVzF3b3dqRkowWlNvVi9wVStrOFhKcmdQVWFkaEN4TlkrbEV1MVhK?=
 =?utf-8?B?NXBKNU5NUVpOWkZ0YjFBN0drbjJRZ1NYUTZibUJnWjNxSTlDZ3Z2aUJlc2do?=
 =?utf-8?B?cWJxaHQzUFByVzN2S2VPVGprK3hPSDVQVmdOU21na1ROWFBqdWtRaWZUV2VX?=
 =?utf-8?Q?/ANIPw8gohoGNQTNGcTeV92/oCJfZyOlVnbTY5o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11F4B582EC09F64BAB396447186E638B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21fe2b4-c39e-42c6-c929-08d971f95cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 12:16:46.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWcZsNY6nGUPyRO1Mr1KmrMl7MH49sFpNwOiRqHqpqp+Yy0zhlmRrGHgxtO7FizL59j6pvPTv5DwERvrpi5MzZ5INMrvV91z2U1KOPnGcZ+nwpSn3N221JHEeTZ/fFFN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6450
X-Proofpoint-ORIG-GUID: uHPeS_bhTxsLI5KWF_woXqr_7g0YftxV
X-Proofpoint-GUID: uHPeS_bhTxsLI5KWF_woXqr_7g0YftxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_04,2021-09-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070081

DQpPbiAwNy4wOS4yMSAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTM6MTAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTM6
NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTI6MTEsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNi4wOS4yMSAxNzoxMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwMy4wOS4yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBAQCAtNTkzLDYgKzYyNSwzNiBAQCBzdGF0aWMgaW50IGluaXRf
YmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICBSRUdJ
U1RFUl9WUENJX0lOSVQoaW5pdF9iYXJzLCBWUENJX1BSSU9SSVRZX01JRERMRSk7DQo+Pj4+Pj4g
ICAgIA0KPj4+Pj4+ICtpbnQgdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICBpbnQg
cmM7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgLyogUmVtb3ZlIHByZXZpb3VzbHkgYWRkZWQgcmVn
aXN0ZXJzLiAqLw0KPj4+Pj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhwZGV2
KTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRvIGFkZCBy
ZWdpc3RlcnMgZm9yIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+Pj4+PiArICAgIGlmICgg
ZC0+ZG9tYWluX2lkID49IERPTUlEX0ZJUlNUX1JFU0VSVkVEICkNCj4+Pj4+PiArICAgICAgICBy
ZXR1cm4gMDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihk
KSApDQo+Pj4+Pj4gKyAgICAgICAgcmMgPSBhZGRfYmFyX2hhbmRsZXJzKHBkZXYsIHRydWUpOw0K
Pj4+Pj4+ICsgICAgZWxzZQ0KPj4+Pj4+ICsgICAgICAgIHJjID0gYWRkX2Jhcl9oYW5kbGVycyhw
ZGV2LCBmYWxzZSk7DQo+Pj4+PiAgICAgICAgcmMgPSBhZGRfYmFyX2hhbmRsZXJzKHBkZXYsIGlz
X2hhcmR3YXJlX2RvbWFpbihkKSk7DQo+Pj4+IEluZGVlZCwgdGhhbmsgeW91IDspDQo+Pj4+Pj4g
KyAgICBpZiAoIHJjICkNCj4+Pj4+PiArICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsDQo+Pj4+
Pj4gKyAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFSIGhhbmRsZXJzIGZvciBkb20l
ZFxuIiwgJnBkZXYtPnNiZGYsDQo+Pj4+Pj4gKyAgICAgICAgICAgIGQtPmRvbWFpbl9pZCk7DQo+
Pj4+PiBQbGVhc2UgdXNlICVwZCBhbmQgY29ycmVjdCBpbmRlbnRhdGlvbi4gTG9nZ2luZyB0aGUg
ZXJyb3IgY29kZSBtaWdodA0KPj4+Pj4gYWxzbyBoZWxwIHNvbWUgaW4gZGlhZ25vc2luZyBpc3N1
ZXMuDQo+Pj4+IFN1cmUsIEknbGwgY2hhbmdlIGl0IHRvICVwZA0KPj4+Pj4gICAgIEZ1cnRoZXIg
SSdtIG5vdCBzdXJlIHRoaXMgaXMgYQ0KPj4+Pj4gbWVzc2FnZSB3ZSB3YW50IGluIHJlbGVhc2Ug
YnVpbGRzDQo+Pj4+IFdoeSBub3Q/DQo+Pj4gRXhjZXNzIHZlcmJvc2l0eTogSWYgd2UgaGF2ZSBz
dWNoIGhlcmUsIHdoeSBub3QgZWxzZXdoZXJlIG9uIGVycm9yIHBhdGhzPw0KPj4+IEFuZCBJIGhv
cGUgeW91IGFncmVlIHRoaW5ncyB3aWxsIGdldCB0b28gdmVyYm9zZSBpZiB3ZSBoYWQgc3VjaCAo
YWJvdXQpDQo+Pj4gZXZlcnl3aGVyZT8NCj4+IEFncmVlLCB3aWxsIGNoYW5nZSBpdCB0byBnZHBy
aW50aw0KPj4+Pj4gICAgIC0gcGVyaGFwcyBnZHByaW50aygpPw0KPj4+PiBJJ2xsIGNoYW5nZSBp
ZiB3ZSBkZWNpZGUgc28NCj4+Pj4+PiArICAgIHJldHVybiByYzsNCj4+Pj4+PiArfQ0KPj4+Pj4+
ICsNCj4+Pj4+PiAraW50IHZwY2lfYmFyX3JlbW92ZV9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgLyog
UmVtb3ZlIHByZXZpb3VzbHkgYWRkZWQgcmVnaXN0ZXJzLiAqLw0KPj4+Pj4+ICsgICAgdnBjaV9y
ZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhwZGV2KTsNCj4+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+
Pj4+ICt9DQo+Pj4+PiBBbHNvIC0gaW4gaG93IGZhciBpcyB0aGUgZ29hbCBvZiB5b3VyIHdvcmsg
dG8gYWxzbyBtYWtlIHZQQ0kgd29yayBmb3INCj4+Pj4+IHg4NiBEb21VLXM/IElmIHRoYXQncyBu
b3QgYSBnb2FsDQo+Pj4+IEl0IGlzIG5vdCwgdW5mb3J0dW5hdGVseS4gVGhlIGdvYWwgaXMgbm90
IHRvIGJyZWFrIHg4NiBhbmQgdG8gZW5hYmxlIEFybQ0KPj4+Pj4gLCBJJ2QgbGlrZSB0byBhc2sg
dGhhdCB5b3UgbGltaXQgdGhlDQo+Pj4+PiBpbnRyb2R1Y3Rpb24gb2YgY29kZSB0aGF0IGVuZHMg
dXAgZGVhZCB0aGVyZS4NCj4+Pj4gV2hhdCdzIHdyb25nIHdpdGggdGhpcyBmdW5jdGlvbiBldmVu
IGlmIGl0IGlzIGEgb25lLWxpbmVyPw0KPj4+IFRoZSBjb21tZW50IGlzIHByaW1hcmlseSBvbiB0
aGUgZWFybGllciBmdW5jdGlvbiwgYW5kIHRoZW4gZXh0ZW5kcyB0bw0KPj4+IHRoaXMgb25lLg0K
Pj4+DQo+Pj4+IFRoaXMgd2F5IHdlIGhhdmUgYSBwYWlyIHZwY2lfYmFyX2FkZF9oYW5kbGVycy92
cGNpX2Jhcl9yZW1vdmVfaGFuZGxlcnMNCj4+Pj4gYW5kIGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0
bHkgeW91IHN1Z2dlc3QgdnBjaV9iYXJfYWRkX2hhbmRsZXJzL3ZwY2lfcmVtb3ZlX2RldmljZV9y
ZWdpc3RlcnM/DQo+Pj4+IFdoYXQgd291bGQgd2UgZ2FpbiBmcm9tIHRoYXQsIGJ1dCB5ZXQgYW5v
dGhlciBzZWNyZXQga25vd2xlZGdlIHRoYXQgaW4gb3JkZXINCj4+Pj4gdG8gcmVtb3ZlIEJBUiBo
YW5kbGVycyBvbmUgbmVlZHMgdG8gY2FsbCB2cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJzDQo+
Pj4+IHdoaWxlIEkgd291bGQgcGVyc29uYWxseSBleHBlY3QgdG8gY2FsbCB2cGNpX2Jhcl9hZGRf
aGFuZGxlcnMnIGNvdW50ZXJwYXJ0LA0KPj4+PiB2cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJz
IG5hbWVseS4NCj4+PiBUaGlzIGlzIGFsbCBmaW5lLiBZZXQgdnBjaV9iYXJfe2FkZCxyZW1vdmV9
X2hhbmRsZXJzKCkgd2lsbCwgYWl1aSwgYmUNCj4+PiBkZWFkIGNvZGUgb24geDg2Lg0KPj4gdnBj
aV9iYXJfYWRkX2hhbmRsZXJzIHdpbGwgYmUgdXNlZCBieSB4ODYgUFZIIERvbTANCj4gV2hlcmUg
LyB3aGVuPyBZb3UgYWRkIGEgY2FsbCBmcm9tIHZwY2lfYXNzaWduX2RldmljZSgpLCBidXQgYmVz
aWRlcyB0aGF0DQo+IGFsc28gYmVpbmcgZGVhZCBjb2RlIG9uIHg4NiAoZm9yIG5vdyksIHlvdSBj
YW4ndCBtZWFuIHRoYXQgYmVjYXVzZQ0KPiB2cGNpX2RlYXNzaWduX2RldmljZSgpIGFsc28gY2Fs
bHMgdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzKCkuDQoNCllvdSBhcmUgcmlnaHQgaGVyZSBhbmQg
Ym90aCBhZGQvcmVtb3ZlIGFyZSBub3QgdXNlZCBvbiB4ODYgUFZIIERvbTAuDQoNCkkgYW0gc29y
cnkgZm9yIHdhc3RpbmcgeW91ciB0aW1lDQoNCj4NCj4+PiAgICBIZW5jZSB0aGVyZSBzaG91bGQg
YmUgYW4gYXJyYW5nZW1lbnQgYWxsb3dpbmcgdGhlDQo+Pj4gY29tcGlsZXIgdG8gZWxpbWluYXRl
IHRoaXMgZGVhZCBjb2RlLg0KPj4gU28sIHRoZSBvbmx5IGRlYWQgY29kZSBmb3IgeDg2IGhlcmUg
d2lsbCBiZSB2cGNpX2Jhcl9yZW1vdmVfaGFuZGxlcnMuIFlldC4NCj4+IEJlY2F1c2UgSSBob3Bl
IHg4NiB0byBnYWluIGd1ZXN0IHN1cHBvcnQgZm9yIFBWSCBEb20wIHNvb25lciBvciBsYXRlci4N
Cj4+DQo+Pj4gICAgV2hldGhlciB0aGF0J3MgZW5jbG9zaW5nIHRoZXNlDQo+Pj4gYnkgIiNpZmRl
ZiIgb3IgYWRkaW5nIGVhcmx5ICJpZighSVNfRU5BQkxFRChDT05GSUdfKikpIiBpcyBzZWNvbmRh
cnkuDQo+Pj4gVGhpcyBoYXMgYSBrbm9jay1vbiBlZmZlY3Qgb24gb3RoZXIgZnVuY3Rpb25zIGFz
IHlvdSBjZXJ0YWlubHkgcmVhbGl6ZToNCj4+PiBUaGUgY29tcGlsZXIgc2VlaW5nIGUuZy4gdGhl
IDJuZCBhcmd1bWVudCB0byB0aGUgYWRkLUJBUnMgZnVuY3Rpb24NCj4+PiBhbHdheXMgYmVpbmcg
dHJ1ZSBhbGxvd3MgaXQgdG8gaW5zdGFudGlhdGUganVzdCBhIGNsb25lIG9mIHRoZSBvcmlnaW5h
bA0KPj4+IGZ1bmN0aW9uIHdpdGggdGhlIHJlc3BlY3RpdmUgY29uZGl0aW9uYWxzIHJlbW92ZWQu
DQo+PiBXaXRoIHRoZSBhYm92ZSAoZS5nLiBhZGQgaXMgZ29pbmcgdG8gYmUgdXNlZCwgYnV0IG5v
dCByZW1vdmUpIGRvIHlvdQ0KPj4gdGhpbmsgaXQgaXMgd29ydGggcGxheWluZyB3aXRoIGlmZGVm
J3MgdG8gc3RyaXAgdGhhdCBzaW5nbGUgZnVuY3Rpb24gYW5kIGFkZA0KPj4gYSBwaWVjZSBvZiBz
cGFnaGV0dGkgY29kZSB0byBzYXZlIGEgYml0Pw0KPiBObywgdGhhdCBJIGFncmVlIHdvdWxkbid0
IGJlIHdvcnRoIGl0Lg0KPg0KPj4gV2hhdCB3b3VsZCB0aGF0IGlmZGVmIGxvb2sgbGlrZSwNCj4+
IGUuZy4gI2lmZGVmIENPTkZJR19BUk0gb3IgI2lmbmRlZiBDT05GSUdfWDg2ICYmIGFueSBvdGhl
ciBwbGF0Zm9ybSwgYnV0IEFSTT8NCj4gQSBuZXcgc2V0dGluZywgcHJlZmVyYWJseTsgZS5nLiBW
Q1BVX1VOUFJJVklMRUdFRCwgdG8gYmUgInNlbGVjdCJlZCBieQ0KPiBhcmNoaXRlY3R1cmVzIGFz
IGZ1bmN0aW9uYWxpdHkgZ2V0cyBlbmFibGVkLg0KDQpTbywgYXMgYWRkL3JlbW92ZSBhcmUgb25s
eSBuZWVkZWQgZm9yIEFybSBhdCB0aGUgbW9tZW50DQoNCnlvdSBzdWdnZXN0IEkgYWRkIFZDUFVf
VU5QUklWSUxFR0VEIHRvIEFybSdzIEtjb25maWcgdG8gZW5hYmxlDQoNCmNvbXBpbGluZyB2cGNp
X2Jhcl9hZGRfaGFuZGxlcnMvdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzPw0KDQpUbyBtZSB0aGlz
IGlzIG1vcmUgYWJvdXQgdlBDSSdzIHN1cHBvcnQgZm9yIGd1ZXN0cywgc28gc2hvdWxkIHdlIHBy
b2JhYmx5IGNhbGwgaXQNCg0KVlBDSV9YWFggaW5zdGVhZD8gRS5nLiBWUENJX0hBU19HVUVTVF9T
VVBQT1JUIG9yIHNvbWV0aGluZyB3aGljaA0KDQp3aWxsIHJlZmxlY3QgdGhlIG5hdHVyZSBvZiB0
aGUgY29kZSBiZWluZyBnYXRlZD8gVkNQVV9VTlBSSVZJTEVHRUQgc291bmRzDQoNCmxpa2Ugbm90
IGNvbm5lY3RlZCB0byB2cGNpIHRvIG1lDQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9s
ZWtzYW5kcg0K

