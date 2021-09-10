Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93110406DAC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 16:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184495.333158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOhfm-00055E-MK; Fri, 10 Sep 2021 14:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184495.333158; Fri, 10 Sep 2021 14:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOhfm-00052A-JC; Fri, 10 Sep 2021 14:38:34 +0000
Received: by outflank-mailman (input) for mailman id 184495;
 Fri, 10 Sep 2021 14:38:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOhfl-000524-B3
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:38:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f6a11cf-0bc3-430f-8d38-68df7e31faf2;
 Fri, 10 Sep 2021 14:38:32 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ADhr7r007242; 
 Fri, 10 Sep 2021 14:38:29 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b08ebr6sy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 14:38:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6882.eurprd03.prod.outlook.com (2603:10a6:20b:283::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 14:38:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:38:17 +0000
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
X-Inumbo-ID: 6f6a11cf-0bc3-430f-8d38-68df7e31faf2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGdxlPU4yzrr6ZF3rl2eQEvoK+tdVCD/st6CBuEYRSyF/348w5w/+mFEH7TE/s4cHevCoD8eUDPsYu5APeHHc5D4xgu/N6ra6o6idhnx6s6e6ihf22TCLh43p98/xpwUT8/1nwoE3V4/L6mLHIxULCzbcalPAL4eDxlv4mSri9N0f/D8wpQWmAUjx0q1bEi7FH11Z3uKKBZsjOx3JRb51nQIk0KvB9EahD5q4T9BqAkvlJ+bCRtp9tqa1WromnG/h5q+FGAKMKfVKRKJ6U2hI/M7DKMltzDUDq1V5GOvCcHAWL1PErp4pbfdFwjZS0Mw9j03/f7wiu+Q//S4VwibNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2s9lAzxIwaxbTgLX1SzEKlDX5hXwILM8bu2ZRILhYJA=;
 b=OMiy6lP1acndZqDnX88C/QS0heeNFpWvGWmgSAJCn18j3FNIQMV8fl63gAm3ZOfo8LfCn1ys6MdY+sZ/uen54ElwvaqkuodM4VBjmkNgpavwDRkMKlvXxGxufhAvO0KOcsSwrKZQbPLnRoAjuCWfFFIc0l+iez/DZDpg9HyQ8KFN6jDEKKlQIj/nmawYE4Xod3pFRU1O/agYa4ysw3FWsK3kywZwayHKZfkCNjUlovCjfPMWxdXq975yprkdZCrMy58vZEvpjrxr46SLyNHQT7Zd7QmWHbl0ODNieCkEbsQE+h9w2emDwY0ZBie9SM+1EWCzDO007yUNM5NOEFMKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s9lAzxIwaxbTgLX1SzEKlDX5hXwILM8bu2ZRILhYJA=;
 b=vv4FlgVTL4/YBvr05G9n9o01v/0Im+ne1T8FrDnO7PxR3uNWqR6NM9CpZeV18wSFAaLqZcIQbzsXEHS9msQoDbYfH/HK8EnWnvN5lq7PrkwDSHkAhPmRzvZirlY6CU6CsvO8nCtvsbMj1S/UHdyCOih8GpYayMoefk4nvlDQDoHRhLSQG29tX8qVel8MBt1oENrynTay7CJ/K/4rQEUd+jXzRL1wSBOOpbSmTmhjIny0uItGgOVvI7eW0JWKJo/X/Yfa0F44Y/xh3C+Etceo7EflHujKi89PGy9NNszKG9+XQUruulfDnSkmmPhSQx/s24rM+MyE+fG0LCHwvZ//5w==
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
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: 
 AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiAgAAEjQCAAAWagA==
Date: Fri, 10 Sep 2021 14:38:17 +0000
Message-ID: <3c3c253c-4af7-ea25-5f73-a0f7319dab50@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <733cd423-14f5-c028-8fdd-39aed34cd352@xen.org>
In-Reply-To: <733cd423-14f5-c028-8fdd-39aed34cd352@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1ef3677-68dc-4bb5-443d-08d97468a136
x-ms-traffictypediagnostic: AM9PR03MB6882:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688254913D77F04C47959246E7D69@AM9PR03MB6882.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eHnjFcW45+iLf11ahlQIp1Er00sDRDUrOazCFX8ntX93Hi28v7NIQN/vZegYOpkx28JTxJDZCrj3isWg8vbUAoSXvwqlepg7Wefq4F6VLE4uGyCtB/O+bVjDimjX/SOSuxTOog6kQj0dFFuarwGQPs1F/nLvJHovA6PldfBdGSDYG/7q6JWvD89exxJ+9SZ2tGAqJ63vFie6T7hkr6fg0pCe/mTFK6VhpEIFKlVKZugl8tnjIWwHQBtJQ9hBrf2Qgd0DdMbNOvRUsiip0LzrcrHJV0tGlI7h+EdgI1afBYsTuUnvTny2fimm9+itaxDY9AJ7AP5+s4iJCNTyxIJ/Jo9C6ZPj6Zd5yccepHm+4rcw74khzLW5zLpBT1sWMWyjslqk67jIOL3MmlNJkhyI4stUg69lD1LMJQotRuLhpjHfXxfT5wBKzWHtRMzaYmGqd7szKsKtz/qFeKclp92QdP8Fv8Y3r7kuWMcGN79+Yisw+wnIGZ/DXaUQofqL3lwTzhpCVY/gS9g43lEyPwqykAD2PN/1puJrPmlPFH3a+Jr+TeyJKoPgV810kiCOUQbirRqDESWhZzkjFbFNgwvAWo2IWx6zVPSJkIJPRw/ew3J7GdJP6UmohNzsw4ixjFW0gAEXuMRorwXE0sz0yL0iL3akEXqACJW5EAQ4e04aKZMFHAVe5uOdR5cq0I2y0cSxTXUahSKAiKz/HqvX/NXtOrgzQUKm5Z6thHvG1QqiE6ziRHt5bOjWdO7gxa7xAQVC2d4aq40ZND/WSGhAFaL2NGgG3PpkKKRQSkEmzr40gXbQM3xaj7NNZnfzCUw196Ge
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(8676002)(76116006)(186003)(6512007)(66446008)(64756008)(2616005)(38100700002)(71200400001)(6486002)(122000001)(966005)(66946007)(2906002)(316002)(54906003)(4326008)(38070700005)(66476007)(31686004)(83380400001)(6506007)(8936002)(478600001)(86362001)(110136005)(26005)(55236004)(66556008)(31696002)(36756003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cVNoL2hva0M2YzVQV0NQeEV6dFlnWEorR05CdGlaQWJ6bjRUZ1VrQ0IxYSsr?=
 =?utf-8?B?M3o3UDJzQk9RbmdvYmRkbmtaZWoya1RPbnc0bzRCNDJnQ1dTMWF3WjJ5VGZs?=
 =?utf-8?B?UkxPbTRmck9ybWJJTDE5Sm11dHAzSGhSOFFIblROd0tIOWV3VzU5WkRnSGFG?=
 =?utf-8?B?L09zdzdKZUhzL0dpSnFwWGt1bUtVYzVnb3VnKzgxRTVQS1RtNXVUd2NUazdD?=
 =?utf-8?B?dEM4akd6M3Yrc1l5L05wOGpOUjlYQXlERnB6YWRieWQ5VmdNSnBUV2tpSTVI?=
 =?utf-8?B?MEg3c0hxQ05kR0syRFA0VHZja2VRUkxZNFJHL2xEcWV5KzI4TEtHTWcxUHFE?=
 =?utf-8?B?MmJyT2p1VGRzTVowclQxdEZJai9icW9vTk9JTjhvc0ZCRVpVTFRVY0IwOCtG?=
 =?utf-8?B?ZWtxTzJiZlBJdnczb3d6NU1SQWtsaHFLNFNQRWd4R0RsRXc0YWpiWnNVb2N0?=
 =?utf-8?B?c3hOL0NjeXRyUnVqekgyMVoxMXFFMU1yZjU0MlhJOGgzemk1dnlOSzB2UENF?=
 =?utf-8?B?cnpTNEQrS2xpMllDY2pZODVvYnpremNib3hqRUxhSVhTT0VoTmU1blRjdUpn?=
 =?utf-8?B?WkhhV21qSHB4MEh0QkYxZXltbEJZTnZxNWN2OXA5MVhzdVpOb1gya2YvTEwx?=
 =?utf-8?B?Z1EvUGo0R0ZDWmp5NVp2UnRQeFgrTTZXenJOa09STkhjK1AweGRKOXhtVHlV?=
 =?utf-8?B?bFdhOTZnQi9CUld5U3NjQThUMjN6U3psYnZLTy9hYk91bnlIb2lRd3JrVG11?=
 =?utf-8?B?ZDNFWVhuWE5aRGc2aGoxYk8xY3E3ZjR1aENxRk5sU082Zkk4eGgva3p1aTdB?=
 =?utf-8?B?ZUw5S0ZISXlvc2hIMTdVN01hSDN2OWJEc2NHUFBzVUxEamhyVk43MExyM1pC?=
 =?utf-8?B?aTlFWW1CcytDcnBWMXlmejZuZTUwMFdvdVBpM0UramRaRFIvMkMxejg1UlNm?=
 =?utf-8?B?UTYvV244YlVLZmpTVlNJaXJpWFVFUUtJT2lsczNhR1hLWHZzcUdhVEVGQVZj?=
 =?utf-8?B?TkxvVS95eHdnNmlvd3FDNG9EV2trSkc3UGljNDM5YjJ3d0h5VEU0VW01emg5?=
 =?utf-8?B?VFU2UkY0RmViK0I3Q01LcXcxWU5RVzBGa1JMelNFU3RVODdObmF4N2tSSkI5?=
 =?utf-8?B?cDYzbEFscnJ2R0hlNnA5cUV3VG1uVStZWkp1VEZnaGlqNDZiRnVyME1EbGs4?=
 =?utf-8?B?a2w0VEFWclIwTms1OW9MTURJYkE2TUdGN1JkQzdpWXpDNXMrRXFHcHV5Qkhw?=
 =?utf-8?B?bDQvcGlBaktoM2NxZVpzVStGaFY5dW1HSDFnVHpUeXJDM1dWSDFOKzlYR20x?=
 =?utf-8?B?Rlo0U1pkT201U1p3dDhDelpDU3h6YkxCQ2ZkTi9NV3lGcVE1dFgvV1EreG9G?=
 =?utf-8?B?UjFMdWxCT2tKa2tQeWIvUExHTHloRjljMFBwUUNqdzdtWWt3N0VZR2RkcVFk?=
 =?utf-8?B?ZVBXbHlYTGVSYWdrNlF2OTRTczhmN2szb0JYSmNVdnJZdHNhMG1YaGhVeHlI?=
 =?utf-8?B?UVJYQzU1Zzl5MHF0ZnhzRWJkbzA5RldRQ0pCeWxHNTFUQjlUWEVkVGpZK3pQ?=
 =?utf-8?B?TGE1WWpSc1hMdktSL09QaFpwTzk2emdwOGxranRBSnh6cVY1QnRoajhVakpy?=
 =?utf-8?B?eERkaUJ3NWhKM1V6UnM5S2xocFZDS1o5SUhvb3FXTVRNRXBzcW1QQSt2M1lw?=
 =?utf-8?B?M2ZHaTlLZ1lmYStHbUh2cE1yZTQ2MENxMlRBQ0tEWEN4ZnZ0UGpJR0pKaEJF?=
 =?utf-8?B?ZTlra3YvOHpLT0R5cFlnYlJkN1VGK1RWUHljV1RXbzhLeWF3OHJnMXpUZUUz?=
 =?utf-8?B?NnVpN3NkaVJBMmpCMG1sdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0C5D925BC4BE246B78973C164E79930@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ef3677-68dc-4bb5-443d-08d97468a136
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 14:38:17.8350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWMktcjhkn/9UDtVS9wJTpO8PJdnGfe9c7OYJOUMQ2x0lPOFajRTUPTy5DkKKu5v19BKumEDGtW0ohd13bGB7HExJlR6sxpWXPrQoVKhUjPaA5xS6ksUL/2rzftnLQv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6882
X-Proofpoint-GUID: DzURJVdPqcZ0qNS5nYH0ird1oyV4xUWc
X-Proofpoint-ORIG-GUID: DzURJVdPqcZ0qNS5nYH0ird1oyV4xUWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109100083

W3NuaXBdDQoNCg0KPj4+IFdoYXQgZG8geW91IG1lYW4gYnkgInVzZWQgYnkgRG9tYWluLTAgY29t
cGxldGVseSI/IFRoZSBob3N0YnJpZGdlIGlzIG93bmVkIGJ5IFhlbiBzbyBJIGRvbid0IHRoaW5r
IHdlIGNhbiBsZXQgZG9tMCBhY2Nlc3MgYW55IE1NSU8gcmVnaW9ucyBieQ0KPj4+IGRlZmF1bHQu
DQo+Pg0KPj4gTm93IGl0J3MgbXkgdGltZSB0byBhc2sgd2h5IGRvIHlvdSB0aGluayBYZW4gb3du
cyB0aGUgYnJpZGdlPw0KPg0KPiBCZWNhdXNlIG5vdGhpbmcgaW4gdGhpcyBzZXJpZXMgaW5kaWNh
dGVzIGVpdGhlciB3YXkuIFNvIEkgYXNzdW1lZCB0aGlzIHNob3VsZCBiZSBvd25lZCBieSBYZW4g
YmVjYXVzZSBpdCB3aWxsIGRyaXZlIGl0Lg0KPg0KPiBGcm9tIHdoYXQgeW91IHdyb3RlIGJlbG93
LCBpdCBzb3VuZHMgbGlrZSB0aGlzIGlzIG5vdCB0aGUgY2FzZS4gSSB0aGluayB5b3Ugd2FudCB0
byBoYXZlIGEgZGVzaWduIGRvY3VtZW50IHNlbnQgYWxvbmcgdGhlIHNlcmllcyBzbyB3ZSBjYW4g
ZWFzaWx5IGtub3cgd2hhdCdzIHRoZSBleHBlY3RlZCBkZXNpZ24gYW5kIHZhbGlkYXRlIHRoYXQg
dGhlIGNvZGUgbWF0Y2ggdGhlIGFncmVlbWVudC4NCj4NCj4gVGhlcmUgd2FzIGFscmVhZHkgYSBk
ZXNpZ24gZG9jdW1lbnQgc2VudCBhIGZldyBtb250aHMgYWdvLiBTbyB5b3UgbWF5IHdhbnQgdG8g
cmVmcmVzaCBpdCAoaWYgbmVlZGVkKSBhbmQgc2VuZCBpdCBhZ2FpbiB3aXRoIHRoaXMgc2VyaWVz
Lg0KPg0KUGxlYXNlIHNlZSBbMV0gd2hpY2ggaXMgdGhlIGRlc2lnbiBkb2N1bWVudCB3ZSB1c2Ug
dG8gaW1wbGVtZW50IFBDSSBwYXNzdGhyb3VnaCBvbiBBcm0uDQoNCkZvciB5b3VyIGNvbnZlbmll
bmNlOg0KDQoiDQoNCiMgUHJvYmxlbSBzdGF0ZW1lbnQ6DQpbc25pcF0NCg0KT25seSBEb20wIGFu
ZCBYZW4gd2lsbCBoYXZlIGFjY2VzcyB0byB0aGUgcmVhbCBQQ0kgYnVzLOKAiyBndWVzdCB3aWxs
IGhhdmUgYQ0KZGlyZWN0IGFjY2VzcyB0byB0aGUgYXNzaWduZWQgZGV2aWNlIGl0c2VsZuKAiy4g
SU9NRU0gbWVtb3J5IHdpbGwgYmUgbWFwcGVkIHRvDQp0aGUgZ3Vlc3Qg4oCLYW5kIGludGVycnVw
dCB3aWxsIGJlIHJlZGlyZWN0ZWQgdG8gdGhlIGd1ZXN0LiBTTU1VIGhhcyB0byBiZQ0KY29uZmln
dXJlZCBjb3JyZWN0bHkgdG8gaGF2ZSBETUEgdHJhbnNhY3Rpb24uIg0KDQoiDQoNCiMgRGlzY292
ZXJpbmcgUENJIEhvc3QgQnJpZGdlIGluIFhFTjoNCg0KSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUg
UENJIHBhc3N0aHJvdWdoIFhFTiBzaG91bGQgYmUgYXdhcmUgb2YgYWxsIHRoZSBQQ0kgaG9zdA0K
YnJpZGdlcyBhdmFpbGFibGUgb24gdGhlIHN5c3RlbSBhbmQgc2hvdWxkIGJlIGFibGUgdG8gYWNj
ZXNzIHRoZSBQQ0kNCmNvbmZpZ3VyYXRpb24gc3BhY2UuIEVDQU0gY29uZmlndXJhdGlvbiBhY2Nl
c3MgaXMgc3VwcG9ydGVkIGFzIG9mIG5vdy4gWEVODQpkdXJpbmcgYm9vdCB3aWxsIHJlYWQgdGhl
IFBDSSBkZXZpY2UgdHJlZSBub2RlIOKAnHJlZ+KAnSBwcm9wZXJ0eSBhbmQgd2lsbCBtYXAgdGhl
DQpFQ0FNIHNwYWNlIHRvIHRoZSBYRU4gbWVtb3J5IHVzaW5nIHRoZSDigJxpb3JlbWFwX25vY2Fj
aGUgKCnigJ0gZnVuY3Rpb24uDQoNCltzbmlwXQ0KDQpXaGVuIERvbTAgdHJpZXMgdG8gYWNjZXNz
IHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9mIHRoZSBkZXZpY2UsIFhFTiB3aWxsIGZpbmQgdGhlDQpj
b3JyZXNwb25kaW5nIGhvc3QgYnJpZGdlIGJhc2VkIG9uIHNlZ21lbnQgbnVtYmVyIGFuZCBhY2Nl
c3MgdGhlIGNvcnJlc3BvbmRpbmcNCmNvbmZpZyBzcGFjZSBhc3NpZ25lZCB0byB0aGF0IGJyaWRn
ZS4NCg0KTGltaXRhdGlvbjoNCiogT25seSBQQ0kgRUNBTSBjb25maWd1cmF0aW9uIHNwYWNlIGFj
Y2VzcyBpcyBzdXBwb3J0ZWQuDQoqIERldmljZSB0cmVlIGJpbmRpbmcgaXMgc3VwcG9ydGVkIGFz
IG9mIG5vdywgQUNQSSBpcyBub3Qgc3VwcG9ydGVkLg0KKiBOZWVkIHRvIHBvcnQgdGhlIFBDSSBo
b3N0IGJyaWRnZSBhY2Nlc3MgY29kZSB0byBYRU4gdG8gYWNjZXNzIHRoZQ0KY29uZmlndXJhdGlv
biBzcGFjZSAoZ2VuZXJpYyBvbmUgd29ya3MgYnV0IGxvdHMgb2YgcGxhdGZvcm1zIHdpbGwgcmVx
dWlyZWQNCnNvbWUgc3BlY2lmaWMgY29kZSBvciBxdWlya3MpLg0KDQoiDQoNClVuZm9ydHVuYXRl
bHkgdGhlIGRvY3VtZW50IGhhZCBub3QgYmVlbiB1cGRhdGVkIHNpbmNlIHRoZW4sIGJ1dCB0aGUg
cXVlc3Rpb24NCg0KYmVpbmcgZGlzY3Vzc2VkIGhhcyBub3QgY2hhbmdlZCBpbiB0aGUgZGVzaWdu
OiBEb21haW4tMCBoYXMgZnVsbCBhY2Nlc3MgdG8gdGhlIGJyaWRnZSwNCg0KWGVuIHRyYXBzIEVD
QU0uIChJIGFtIHRha2luZyBkb20wbGVzcyBhc2lkZSBhcyB0aGF0IHdhcyBub3QgdGhlIHRhcmdl
dCBmb3IgdGhlIGZpcnN0IHBoYXNlKQ0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQpbMV0g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIw
LTA3L21zZzAwNzc3Lmh0bWwNCg0K

