Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CD4191F4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196639.349566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnV5-0002rY-Oe; Mon, 27 Sep 2021 10:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196639.349566; Mon, 27 Sep 2021 10:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnV5-0002ol-KP; Mon, 27 Sep 2021 10:04:43 +0000
Received: by outflank-mailman (input) for mailman id 196639;
 Mon, 27 Sep 2021 10:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUnV3-0002oV-Su
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:04:41 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53fa8056-9d09-4c6c-a12b-509460984814;
 Mon, 27 Sep 2021 10:04:40 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R95F0o025045; 
 Mon, 27 Sep 2021 10:04:38 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbb1107y2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 10:04:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 10:04:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:04:33 +0000
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
X-Inumbo-ID: 53fa8056-9d09-4c6c-a12b-509460984814
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CErWoN0gcqYMvW8iaX/sBLW3GSu19hkHKT9IcFOYoAQWGKNHiKEgblFzYNnyFLPJLi/KOIrw2bFoY2TAN6IFzRBJXmsgj5cVZ2+7QSM3Y0zPBFqjGg6F8JjDZSkUoUpYfuzG1HrONc9lt2NQDu4hUj++ptp+2bg3zLPtdd1OK2+jOXHpqSJ0LOYnaLM0qthPe+TcpcI1AXPFXk7N1TCUmsLIWHIb9GzeKR3CuWLqiJIbxLhLf7OYZ72zE1OcmCy8UButgQ0n6501vNjLoMmN6bXyLzkwBASbYI4rIx+NYftSqYFTvui4Pmgs8Wau0f60oYR/HI+IIg1dW4PmpoKVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gPYe77LdkDEmNrinKE2WVBUO6bpsOy5UdR7i9kPst/4=;
 b=CnpyjtaufdKACAS2M56cdjlFZjd37C1CJaiGN4QJuqllLaSsQlSLed4uQCD9ImNDRhnCpLdfuW/pUVEhSZ5UEz/C9odHkvjG5empW55xWSaIV6HCPIQcFrLx35Rzc/EiuVcLXCKvj7APk/TX+N4okB/u5kLVYmJEhBGwnmyyr2J+pMa1KA+ORt2F+ZshHeJLStRKJ/tjO/AZBV+nAmFHUYUws+zZBEeifV+QvtydvqCl/8VxVPZHfjcxUIp8Z/1GNu5YxchYpmop8l5iI8fun1yIVE9WqXxsiY6Sl9FV5hUUBPs6fjq1dKU4/+quANbdaa1YmFoxML/PdYvO6ml1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPYe77LdkDEmNrinKE2WVBUO6bpsOy5UdR7i9kPst/4=;
 b=ET5h4+3voaHqnc051TMps7jchu4hBsJPOyrOLzEs3OHl2J0SveGwWYrvLK1i53CQJUfmvIOL1j3wrG2Cr4/TvcHKSNv3fdE4J6ymvy7ee5VNijdFUm9sP+Btxh+RGDvOhJJ7WEno3gabjnmaMSVO0hay51J8cbabKLWkUTgDGwIYflGjsCwDsQNpkqJzH9ZoUE5G3KD70WcN/leq0LdAG4yvbl/Fnuhb/RVBcRPUi/uJTYjCTetUaPxMObsrBXARohEUTuWj2qKoqbckHZL9GaL/BhatcMzRAHSh/IzDBTYazaSYhglRCECyc5c6UIVm7W3bSH1gVJdXFRJJOZp6Iw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: 
 AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrICAAAldgIAABLUAgAAG9wCAAAEGAA==
Date: Mon, 27 Sep 2021 10:04:33 +0000
Message-ID: <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
In-Reply-To: <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0686b6b9-2656-4607-871b-08d9819e3486
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB69631F820B096A31C987A3A0E7A79@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GZy7ZieUQuZxlpBNJykbm36ivZR9b1+2TgQSw6Rv0FpsRLQqEp1hbdnhqqxAQqSSYEXx7cIltZbuBFXIlOPWi0xqDJePMLZ4iWUQGNgMsmFMGmbzYekK4z0imYCT6i3BT/jURDodkpHlF218Z84BEMBCGdkFMDi837O0TYzrANh7XH4uCnZMELoYYAlDlF0YS0mSmCIzDnniwWD4cQS6b7ffyP8dyRqZU2JHdh/beBJCjKD7R8Qe7XWcIv0xIAvuh1hRni1Nqcm1wYp0+eq8JqOfFSqEl/3Lr27YGt4EPjVaXHW7GfDuava5dhg4xiOKJ5OBaS7SluUrikZW3S33OoHvLg7RxME5oLFL84OBvCGV5lwTfC9OO8IlElK/2FSK4DS/KzONbKqAkZHFxpflkx2pTqxSEFqGm76oZ9pmQlxO1Zjhij5yGIEoLqr/LAEG8itGLTUkU+XTK31dI+/LtNmEEQ9tvAmlKBXe/KCj462/UFRvq2jUqiUvVutCv/4/CguYrNAwyUIa1j2ccCKemB6+MTGsIiPc7uNRWnuSlmKy9JYgsRx3aSVq13MHK5mm6AWc1ZOvBCJT0DK/8AfBFKapEyzz9V7TZsJByHiHt+ZiLpYe7nd6/SWoQMXpiMPY3Ptlk99emIFZmh7sQqft1i1ybT1dWCV23/6U44y/+pDT6334gNXGP+BsYJMjF4Sfj4BBx8nT2hi3jVSXJS+h660l85OPrTNG6niVRtelJQbWrmMSu8Ad/mXpqOz196HE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(86362001)(316002)(64756008)(31696002)(66946007)(66476007)(53546011)(6506007)(31686004)(66446008)(8936002)(2906002)(38070700005)(54906003)(6486002)(91956017)(76116006)(66556008)(4326008)(8676002)(36756003)(5660300002)(186003)(6512007)(122000001)(508600001)(2616005)(71200400001)(6916009)(38100700002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXJhb21nOGx1NGZNWmZKbnJxVnlvV0d3bWRTT1l6dFgxb3NQT05uUkNXSWtP?=
 =?utf-8?B?T1l0c3dza2VKYmEreDRmVG95Mk0xdldKVU94WUZ1VlQ4Z2phc0JCOHpmSjAr?=
 =?utf-8?B?UU5SS0tIZWZ6Q005ODMwRzNtMUFqVG9GNHdhYUdsd3JqdUdVdEJobmxZbzRk?=
 =?utf-8?B?UTFGZk9NNEcrZnRUTFdac3pTOFZ6QzNNTXpnUTFMU0M0b0hDU2hoWFlqV0R6?=
 =?utf-8?B?aXBYQTR1aGpSZFovSjIwUkJpc0c2YnhrYjJ1clAwRUNGQnJ1UmFMNGFaYlRN?=
 =?utf-8?B?N3pITm9WY1R4ZWR1c3E0WWtvR3dLZis3djQ1OGlIdncwTTgweHZhallraU1n?=
 =?utf-8?B?LzN5WjlCS1Zuam9HeVl4N0hVWnZGRElhR283M3JSdnppVGMrWWkxR2FvcnFQ?=
 =?utf-8?B?d3YvZ3hNbXdFd1VGM2drR1gxY3BzTUZ6WjNaM2tqeXFYOGZUVm1NcElnUHQ1?=
 =?utf-8?B?cGdFZmJoUkNtZWtBY2gxUVlpVVRzYzNUcTlTVDhCa0ROelBUQ2poOGhQSW90?=
 =?utf-8?B?S1lYNFozNVdNMHB0aXRON3dLS3ZNbVVPdTVmVG84WkxrNWVBUmprRU9yWnp0?=
 =?utf-8?B?SlYzQnRLbUN3MUFPdG9PTmI0T1crclBOYXV2UFpBU1U5c1VHY2tkalJWVW81?=
 =?utf-8?B?WDY4U0VDRWxaTFMwdjVIb1YzaVJ1NXBPMGNkdktJcFFBS1ZlWDRKeGUwTnBj?=
 =?utf-8?B?eitZaGxhRlRyRUFNWGpoUjBRL1BsVnlWOXlQcGpsRXphbjBkRXI4TVZia0p1?=
 =?utf-8?B?YnpYOWlMRW9OK2VyKzhlZWRvTUpwUTJHSFo0dHd5N0VMMjFCTzZzS3drbjlZ?=
 =?utf-8?B?UWw2WENDMUQ5d0VyR2ljWXRrV0xSMksvdE5yVlBRdnRtaUxNUHc2WG03dks3?=
 =?utf-8?B?dDBaOUZ1OFcvZjVHN2RicFJUVW5ocUZBRFA5bzN4ZnhtVFhtWkY5VXYxTXRl?=
 =?utf-8?B?ekd6bTBmUXdGUm42U25YZ0Jpd0pzYlY1M0FhVmFqUVU5N1g2RFk0VDhpYi9i?=
 =?utf-8?B?VjRsbk9udmdZdXpwb0RHS0NGVGRISmdpZ0JteVBmM0ZLQnNaS2tzakIrMjZO?=
 =?utf-8?B?Znd1WHo5UmxkQ3M5TEl6d2tSM3NseENiREdoZlhhV3p1ZmFuVnM5QVN0ay9X?=
 =?utf-8?B?ZUtHN1RIak5RYUEyUW8xOStPaml5QWJKTUQ4bTZSSE5pV1RzZUdCbHN4MkZv?=
 =?utf-8?B?bERINEczaEhBbnlyckxKY0FicXRJMnlxVFdKS2Y5TnRRRXI5aDgvZjEvK2tP?=
 =?utf-8?B?SlJ4Y3JWTHBEeS9hSll5SFYyaW1RLzFIUGZHaEcrQ1ZUeWVDYzNkNEc2MXlj?=
 =?utf-8?B?L2xEUzFLL2pJUUtkOTBNQURzblh4RnF2TlNKWUo2a0x0bk5NSkVOVTFHSk5v?=
 =?utf-8?B?Nm1DSnBWZzl1Nm9BK0ZRNlQ3Rnk5OEpFazVERzlPOFcxYmtQa1lsczZQNW9V?=
 =?utf-8?B?VVhrdzlVOHVCaGZ5aXphREFoRnA1VzVvT1Y2N0xGTDA4cWNEREMxd0Q5QzYx?=
 =?utf-8?B?Ni9sK25mcWlxQm54UkhoTXl1K0Q5NnIxREtuc05wSTRwSmI1QlJjRXpzeHRY?=
 =?utf-8?B?dFNGNHFuYllLZEhGNzFoRkxXNDREQ1NJRVZlVnlMWFV6U3FreVFySHlnVzQv?=
 =?utf-8?B?VkdZRTRvYnpLZkJBYlhqaFhZUEFDMjU2Z1h1UE5ibytJcjQ0OUJ1YTdoWkc5?=
 =?utf-8?B?c1pkZFN3NlN0QVdKUlZJZVduOXB4L0dkTHZ3cTVFWHhJdEJ3NlFnQkFNN1V0?=
 =?utf-8?B?Zmg0R00xWkYvdjk2Q0xVbW9EQld6akJJOGU3MUFLNTN3amRnOXl5UDZEcFNp?=
 =?utf-8?B?bHN6Qkk0c29qUCs4aERVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C35164A63C1B44492B0AC55A353AFEF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0686b6b9-2656-4607-871b-08d9819e3486
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 10:04:33.2079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtSxvaKixPVCEC/gGuQbwyugjojAjG4aYAK3TscgeepNQnBVnxJ+hHdAmFZhY1zEjPvEMVT6K9FZwFdXAfUlnqKCy/hWkZTL2UtuzknMuLco+g4c3B1rdLHWl841LqM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-ORIG-GUID: efGINWN45lJvf-s6W0_Mab-6ofKi4Bp-
X-Proofpoint-GUID: efGINWN45lJvf-s6W0_Mab-6ofKi4Bp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109270070

DQpPbiAyNy4wOS4yMSAxMzowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTE6MzUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTI6
MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIwMjEgMTA6NDUsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxMDo0NSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyMy4wOS4yMDIxIDE0OjU0LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0K
Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4gQEAgLTMy
OCw2ICszMjgsOSBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBj
aV9zZWcgKnBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+Pj4+Pj4gICAgICAgICAqKCh1OCopICZw
ZGV2LT5idXMpID0gYnVzOw0KPj4+Pj4+ICAgICAgICAgKigodTgqKSAmcGRldi0+ZGV2Zm4pID0g
ZGV2Zm47DQo+Pj4+Pj4gICAgICAgICBwZGV2LT5kb21haW4gPSBOVUxMOw0KPj4+Pj4+ICsjaWZk
ZWYgQ09ORklHX0FSTQ0KPj4+Pj4+ICsgICAgcGNpX3RvX2RldihwZGV2KS0+dHlwZSA9IERFVl9Q
Q0k7DQo+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5vdCBo
YXBweSBhYm91dCBuZXcgQ09ORklHXzxhcmNoPiBjb25kaXRpb25hbHMNCj4+Pj4+IGhlcmUuIEkn
ZCBwcmVmZXIgdG8gc2VlIHRoaXMgZG9uZSBieSBhIG5ldyBhcmNoIGhlbHBlciwgdW5sZXNzIHRo
ZXJlIGFyZQ0KPj4+Pj4gb2JzdGFjbGVzIEknbSBvdmVybG9va2luZy4NCj4+Pj4gRG8geW91IG1l
YW4gc29tZXRoaW5nIGxpa2UgYXJjaF9wY2lfYWxsb2NfcGRldihkZXYpPw0KPj4+IEknZCByZWNv
bW1lbmQgYWdhaW5zdCAiYWxsb2MiIGluIGl0cyBuYW1lOyAibmV3IiBpbnN0ZWFkIG1heWJlPw0K
Pj4gSSBhbSBmaW5lIHdpdGggYXJjaF9wY2lfbmV3X3BkZXYsIGJ1dCBhcmNoIHByZWZpeCBwb2lu
dHMgdG8gdGhlIGZhY3QgdGhhdA0KPj4gdGhpcyBpcyBqdXN0IGFuIGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyBwYXJ0IG9mIHRoZSBwZGV2IGFsbG9jYXRpb24gcmF0aGVyIHRoYW4NCj4+IGFjdHVhbCBw
ZGV2IGFsbG9jYXRpb24gaXRzZWxmLCBzbyB3aXRoIHRoaXMgcmVzcGVjdCBhcmNoX3BjaV9hbGxv
Y19wZGV2IHNlZW1zDQo+PiBtb3JlIG5hdHVyYWwgdG8gbWUuDQo+IFRoZSBidWxrIG9mIHRoZSBm
dW5jdGlvbiBpcyBhYm91dCBwb3B1bGF0aW5nIHRoZSBqdXN0IGFsbG9jYXRlZCBzdHJ1Y3QuDQo+
IFRoZXJlJ3Mgbm8gYXJjaC1zcGVjaWZpYyBwYXJ0IG9mIHRoZSBhbGxvY2F0aW9uIChzbyBmYXIs
IGxlYXZpbmcgYXNpZGUNCj4gTVNJLVgpLCB5b3Ugb25seSB3YW50IGFuZCBhcmNoLXNwZWNpZmlj
IHBhcnQgb2YgdGhlIGluaXRpYWxpemF0aW9uLiBJDQo+IHdvdWxkIGFncmVlIHdpdGggImFsbG9j
IiBpbiB0aGUgbmFtZSBpZiBmdXJ0aGVyIGFsbG9jYXRpb24gd2FzIHRvDQo+IGhhcHBlbiB0aGVy
ZS4NCkhtLCB0aGVuIGFyY2hfcGNpX2luaXRfcGRldiBzb3VuZHMgbW9yZSByZWFzb25hYmxlDQo+
IEphbg0KPg==

