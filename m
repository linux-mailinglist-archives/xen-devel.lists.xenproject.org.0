Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCAB418FC7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196373.349188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUktI-0005Mp-M7; Mon, 27 Sep 2021 07:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196373.349188; Mon, 27 Sep 2021 07:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUktI-0005L2-Iw; Mon, 27 Sep 2021 07:17:32 +0000
Received: by outflank-mailman (input) for mailman id 196373;
 Mon, 27 Sep 2021 07:17:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUktH-0005Kv-CS
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:17:31 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9a85070-1f62-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 07:17:29 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R5wZwQ021746; 
 Mon, 27 Sep 2021 07:17:27 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bb7x2r8vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 07:17:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2196.eurprd03.prod.outlook.com (2603:10a6:200:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 27 Sep
 2021 07:17:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:17:25 +0000
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
X-Inumbo-ID: f9a85070-1f62-11ec-bc42-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAa8K3EHsKHN/X7bEYwkQWe3FDlbaExopjU2vAQ2fpdCmVAzkyh6l1ANMLAV4Cx6sj/YIFaAJ8SwHhJv4Y4X8L+p1ZasPF/TTjURsBPrmTFCQx3bsRk5RctGJ1ADz0tmWqvyTT2gwVfj0/e76nroMXNdyJ+FgGshDLVHg8QL2HpPlvPl3iDc9JYabSFqY0kHQQRjsd9bz3TA6Qn9ofKxYJFyAUU543S0ZugiQWGsQg0UCsfMdJXBeQUPciRFt+DcAh3jL2EzI4DKzkO9/LYmr0Bzzqt9s3wiSza//mjxWJHmi1NUeWcymAcQg4lViQmHWT+vfc+jVQFzuhnLHE6CrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PmU+17d68n/+dmGiPuNg9noukYa/3K2MoitkwNtDdVQ=;
 b=dTw+f0uNDwdljl7BXytdiNO1BDj+GCkJS9ReVhCrOpMW3S2dMjn2vEm1w3vVn+OJeis2NaNMNcbECZllhILjHew0LcI0TUTxMIvPa8L1bVq3eL4up0Vd3Yrf88BKwOn1RjRHNW1SukIDcUHllM8Dhmq0bKE9xgC864xNewmLcTExWCYNA9529zqg7LN4yrqitUpo50+zx6qCCaV86syqRZoKmCuP/AACXHtkkgjbjKniJ6Cih1LnVzYqMLY1w0nlWeb+g/Nwp4fttdeFgJ/XGjyC+F2cotMlT2t05ZuMgtJa0hYwaQJWHFCFuWO7nl9tJqvfYqzCA4USNWqc373Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmU+17d68n/+dmGiPuNg9noukYa/3K2MoitkwNtDdVQ=;
 b=q4Mqa5zXRZYI3yQrEyDvBescQw5n5vnSCWVpAgfHcnRUFHwGiJMltoEm/3QXCX83OHQFS4zkZBUsUcIxL3jy1Fhfd+nMhIFVttv9pwJZ1jTko9DNsejNB8EID5yOmNujJ61noL1BkEO0tmFabU2Ot5Pq3fN3uPJDadnP2OACU4Zxl5jLrQ4wSUmsF5/N2ZewAfpLNrPMbuVpucHaBbFrNzRHxlBKrXBZJ2CkXr1/+GM0/D+eNo+XIH+72GjsQhk03gmtCOPfO+lSMN/RoZmGN6Y3QK4moFL7ydgKOcF13Lh69E4Gz0lx/38VX0gWesgFftdRNk4Er+ZnU80lyttZ+Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Ian Jackson <iwj@xenproject.org>, Juergen
 Gross <jgross@suse.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/11] libxl: Allow removing PCI devices for all types
 of domains
Thread-Topic: [PATCH v2 07/11] libxl: Allow removing PCI devices for all types
 of domains
Thread-Index: AQHXsHo0SAN7/ZEcjkCS11geMNuE5quz35wAgAOe3wA=
Date: Mon, 27 Sep 2021 07:17:25 +0000
Message-ID: <f08a2fda-4148-d439-c4cd-575be8922764@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-8-andr2000@gmail.com>
 <alpine.DEB.2.21.2109241658350.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241658350.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb31dc30-dfda-4b1c-9d20-08d98186db35
x-ms-traffictypediagnostic: AM4PR0301MB2196:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB219617D803C0D3DAA40B9EDBE7A79@AM4PR0301MB2196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cPrDYLOfkq/JzPSlgA0rGkHvcgmRLruyidqMBqC9ArEtqnWsTp1lDPMssoPjQpapDPntkafXy6j2B0BNF+eJOvUjZqFrOErSv4Vt9x00WFRGKcVcHD//etObqZRwEcHkXMJDRtsucBa6yaZt9Cd49ib+j1L3ADWNVBc4iS0i8VDjcQt5zUNkKbUpgytcwIbQGQ/IMTlwInedCiJP6GEFcCN28XrUqu05dYRW5zYwJKgx0QoXjMtLor/WykEZeeohXz74yKP0l5snptA2RsflSqO8xqNMGrTQAHWnx4Bb34sEcjvlfhx4QLWT3JBgJ3YMcqj7TD3+U/lOtq1775XQ+mg91us3pzctpgoezjEYxhjwvsFC2+rUflbV35HGZoBZ+CGPZ0HB/iIt1e0kQMeJ4oK+JFE+wN3oM4FXND9ueOh5GTZpRO+lZDmSKo+JrUxc80ru0tpdHZ7Ks09579THLz8BOU5bW8Yj5PsVH/KjNkVveP0wFzuF5UpseHBUMKTNtdjfTDfT3ixHqLSed1Ewz6gKv4LOkpZdBpY05HWHImswHZbYbIInTFaRzjIoSWck88TtFinEO8CsOtLOYQ3CjNj3E7zP1cQUcCowQvibiChn64no3Br1ncytiX+mVgrOizhzqo9wK33s+q2gpqnfWqmN/hup73chQvGaVSb/iT65Dyp5FATGqPDbBPfpIhfjGabI65Gk1gPXy+agM4YVZmgg729bAsOn9lHEUtKgPiurLjq0hvMcoLvt1geiUQ28
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(66446008)(110136005)(38100700002)(71200400001)(2616005)(7416002)(6506007)(5660300002)(31686004)(6486002)(66946007)(86362001)(66556008)(31696002)(8676002)(64756008)(66476007)(53546011)(316002)(76116006)(4326008)(36756003)(2906002)(26005)(508600001)(54906003)(38070700005)(6512007)(186003)(8936002)(83380400001)(122000001)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHcxT25GSGVFM29Vakg4ODNMZTNsU3hENmkvdXBNUDl4Z09ybFQ0QmtMYkpi?=
 =?utf-8?B?Vk5FM0NkVENZYTh5SHF5ZnRTYms5MFFZbUFZV0JDOHdmWUFWb0lxUVo3bFFL?=
 =?utf-8?B?MkNqcnlUVHBoajVUWTUvbjRiK1RWVXlodjV3R1NsK2Mycy9nYmhnT0tybWdD?=
 =?utf-8?B?OXNpTmorWVZSdHdUbnlLQXhjaTF0cXlCcU4yaWhMMSs3WFp0eUU1aEQzUkR0?=
 =?utf-8?B?d2xVY1BxTGxuaFdWZUd2eHZRZmhWR1VPRXNDU2JVV1k5VDVHN003Q2pHTTdq?=
 =?utf-8?B?WWx1eS9mY2UxS0IvcnBUNCtueU4yNitIWVlFZi80M2tNWmdkUHZ4NGdFZWdt?=
 =?utf-8?B?Skk0cHk0QndxdTh3eHZqWW9pdkZvbzFKMVZtZHZIRmZKcWYxTkZ0aHBhcXVY?=
 =?utf-8?B?dHBJZ25TQWlmMFJaa2VYcS92Yng5bjZVRkoxNnJhaTJsUnRkM0kybmFYL2lU?=
 =?utf-8?B?a1BIa1BBRjR5QmpMN0ZaNHBCTU5xT0RuNEpqR3oydGdoMnFVZE0zQlEwUG5T?=
 =?utf-8?B?TGZEcjhoM1VVZklmRHFaT1ViTVcxNmJqZG9mUGUrY2hnNkp2TDdiaXhtRmxS?=
 =?utf-8?B?K1RUMTlZcmhyVm5GSGZxUzl5RFdFWkZpd0htUXgzQ1VQQXkrdTMzVkFwMzVG?=
 =?utf-8?B?WGtvMU9MbG9ZbktxSUFyN0ZPZG14WjlaaWtpcWRnTjJFSnJjQURwRlBzNGJa?=
 =?utf-8?B?aXB4VE5pWUF5aXBraE5NNXJ2VjZrcjNaU2VWSjY2M3FJelVNOEJGcitkTXlX?=
 =?utf-8?B?a0NEd1N5NC8yZ2hsWFdwV1Z2WFEvZ1ZUQU9YSi9tL0J5c0htUjZmOG9YeTg4?=
 =?utf-8?B?WHBkdUthK2FMNGRoRjF3bStFOXJwaDRrck9tcFpzM2xPSHJrWWk0a1dBVE9Z?=
 =?utf-8?B?U2txNStBN1JTY2JZVTJPWk5UUVNhRG9pTEZkdVZQYk8zaTdQVGl6VVZWNnI0?=
 =?utf-8?B?elpaYUp4NlpxdXRoRXpkQmtjSUVZY09GNVZ3Qkg2NHVBL05pTnlzdkY5d0pD?=
 =?utf-8?B?cWNYR3N1QStpcnVmbnczQUE0bjkza3RlaksrY0VBOUp5SUVjc3RqTlNncmUr?=
 =?utf-8?B?TEl5KzlRZjFzcENQdjl0VnFRTEtkc1loSzVkT3hZZFVvcWI2Yk9JV0sxc2dP?=
 =?utf-8?B?NzBVNDBNd1EzTnVOTy9OY0MwTUpqVkk2Qzg2amV0TDRBZ3o0b0pkU2V0NzRr?=
 =?utf-8?B?c1pzY0wrOG02TjYrNGNodE5lN2hqZnZ4eWNtdThJSEFlalVOWVMvRFdhem9i?=
 =?utf-8?B?eG0wRG96QlFWL0tkbVQwYUZscldtYmxUVnlManVic3NCNmNScG5Gc2NFc29R?=
 =?utf-8?B?L01CRENISjN4RE0zdkEwMDU3a255L1dDQ3d1S1dZS1Z4WnVhazhMaThPWExP?=
 =?utf-8?B?UzNvb2NBc2dYdURqRDFRYWU2bHZqeGs5ZVQ1Zi9XSnZJbWtpVytvUThLZ0R6?=
 =?utf-8?B?Ymp2cXhFdHFseVFEekd1cEltbzlvc0hzNjFHU0VPYTFBTWhoOGw3ZkJJRDhx?=
 =?utf-8?B?WmkrQVdkWGp5eTdoc1BTQ3FnVy9aTXBCK1FQbFQvMGYwVjFtUmNtWCsxeEdm?=
 =?utf-8?B?M052bE9rYkVVbTRxVHFIS2R0MHBLMkprMlBuQWVSazRwTVlPcElnSWhRUERM?=
 =?utf-8?B?NTFjajVJV1FzWlVzQVM3cWIzRjlxNDJQYUxUcnUwQXlkQklxTzhPZ1NicGNi?=
 =?utf-8?B?LzVOKzI2L1pSeDZVVUh3NHliUlBUbUJ0MndFT2VCTjgrejh5RStRbEpQM2pR?=
 =?utf-8?B?R2Jxc1kzb1pINlVEZGZJNHk5YmpIaW9PV3VBV2Q3N1JTeTc1S2tmYll4dDg2?=
 =?utf-8?B?ekIrWnQ0S001UDN0R2srZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E6F13F6B3EA124B9273677FFD4A55AC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb31dc30-dfda-4b1c-9d20-08d98186db35
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 07:17:25.2134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6eRBJCp4V6g2G3undPBWDNbDOv90+8Dmak3gi7fBNafnik2mshmerHWPW7x6uG43yCsQVYXi8l0E5zwXAE1pDJxZ1mwjZqfI3QS0jJxaAPmMDE7Oh54VCBeSXEmXafgT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2196
X-Proofpoint-GUID: bB9NqoRiobZFn5KSZFlJDZurNcUTEhVB
X-Proofpoint-ORIG-GUID: bB9NqoRiobZFn5KSZFlJDZurNcUTEhVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270048

DQpPbiAyNS4wOS4yMSAwMzowMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiAreDg2IG1h
aW50YWluZXJzDQo+DQo+IE9uIFRodSwgMjMgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IFRoZSBQQ0kgZGV2aWNlIHJlbW92ZSBwYXRo
IG1heSBub3cgYmUgdXNlZCBieSBQVkggb24gQVJNLCBzbyB0aGUNCj4+IGFzc2VydCBpcyBubyBs
b25nZXIgdmFsaWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gQ2M6IElhbiBKYWNrc29u
IDxpd2pAeGVucHJvamVjdC5vcmc+DQo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4NCj4+IC0tLQ0KPj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIHwgMiAt
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMNCj4+IGluZGV4IDFhMWMyNjMwODAzYi4uNTlmMzY4NmZjODVlIDEwMDY0NA0KPj4gLS0t
IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9wY2kuYw0KPj4gQEAgLTE5NDcsOCArMTk0Nyw2IEBAIHN0YXRpYyB2b2lkIGRvX3Bj
aV9yZW1vdmUobGlieGxfX2VnYyAqZWdjLCBwY2lfcmVtb3ZlX3N0YXRlICpwcnMpDQo+PiAgICAg
ICAgICAgICAgIGdvdG8gb3V0X2ZhaWw7DQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgfSBlbHNl
IHsNCj4+IC0gICAgICAgIGFzc2VydCh0eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX1BWKTsNCj4g
VGhpcyBpcyBmaW5lIGZvciBBUk0sIGJ1dCBpcyBpdCBPSyBmcm9tIGFuIHg4NiBwb2ludCBvZiB2
aWV3IGNvbnNpZGVyaW5nDQo+IHRoZSBQVkggaW1wbGljYXRpb25zPw0KDQpMb25nIHRpbWUgYWdv
IEkgd2FzIGFza2luZyBSb2dlciBhYm91dCB0aGF0LiBBdCBmaXJzdCBnbGFuY2UgdGhlIGNoYW5n
ZQ0KDQpzZWVtZWQgdG8gYmUgb2ssIGJ1dCBSb2dlciBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0g
dGhpcz8NCg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQoNCk9sZWtzYW5kcg0KDQo+DQo+DQo+PiAg
ICAgICAgICAgY2hhciAqc3lzZnNfcGF0aCA9IEdDU1BSSU5URihTWVNGU19QQ0lfREVWIi8iUENJ
X0JERiIvcmVzb3VyY2UiLCBwY2ktPmRvbWFpbiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+ICAgICAg
ICAgICBGSUxFICpmID0gZm9wZW4oc3lzZnNfcGF0aCwgInIiKTsNCj4+IC0tIA0KPj4gMi4yNS4x
DQo+Pg==

