Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C7389D06
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 07:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130581.244513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljb7W-0002Dt-Am; Thu, 20 May 2021 05:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130581.244513; Thu, 20 May 2021 05:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljb7W-0002Bq-5z; Thu, 20 May 2021 05:21:18 +0000
Received: by outflank-mailman (input) for mailman id 130581;
 Thu, 20 May 2021 05:21:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSyT=KP=epam.com=prvs=5774c33267=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1ljb7U-0002Bh-FD
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 05:21:16 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b75f90d-76a6-4770-949d-7d15dee536a9;
 Thu, 20 May 2021 05:21:15 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K5Fs4L024003; Thu, 20 May 2021 05:21:13 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0a-0039f301.pphosted.com with ESMTP id 38ncmfre6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 05:21:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 05:21:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 05:21:07 +0000
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
X-Inumbo-ID: 1b75f90d-76a6-4770-949d-7d15dee536a9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOi7XQjODKaEs61Z+COwJ17Q5Ibzksfrmw/B1kQvJ+4GAw78gQftNv/bnklcbJHPK6imicOABJP/7CnISKW6KQLZaCvJyaWPO4jgnlxIFwo7yCQfiM3w830z13ZwEnfoW4nnDDj6vHu7j2BMP4eP1bRX7dXOpl5VgehiKocMqwEgh7Z6sSU284C9x/imZzLsQEfDkKMckTkTvrUM/FErR0zjkY8boojv0XKmfJRbHoS0fiM8pYDYpjC2IDAeZh5I6L2uzZ9vvgruH73Zam3610UL8u2Qa9gf5umvrjBBzEWucKGWm4koLsBHI2ccffs9rG5C1i8ofS3+yjSdVmDqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZBvgqB7Vhd+FeUtcnz5ilvqhUOlcnvgkCl4OvW/oNA=;
 b=ZXi2TwHTuE4IUxIEC/lvN5xnn2F+NrpKkoF49gwo6czuNk/i0yz1Anz2Y4c9AYxwGk2fsk/LIjzDcSSOf/vryS3yTyOh9kIaFobWG4M4ttnRtuYXTI5cYr6/jOr4mnIpOjh2SN5jwlKJiAs9r1RrtALpeOiY3b35k7bURwAbUjA090Q3PD9rrsu9UpkXAdsC3Qu7DZWmuIWLFcT8cDTMqRV8m+CdXsNSFZJgbeN+UbKcPsUERQ/q8lw7QPDq7h9nxU88efVEkT/C2CHVlahEzrpnLw7AYwP24NDhJuTDEaTMWrXrWaqycdgNj55MIRl+PvjG8pYn/B5IUKNAQBL6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZBvgqB7Vhd+FeUtcnz5ilvqhUOlcnvgkCl4OvW/oNA=;
 b=qT96nyfhZqrN0tTa4IRrtBDzTLKwp3lRfykMGL5+/UTPzpUXIb3sDlP7u/+pMEC+mDObCRbI5K5nu14cMQ6eSWzz4qGj7zYLKv833T7tdQp6sWkGU9FwniQZljJOoFWTkBCzA9ZwcJFcFm6hShjuH0bK/KPW9oYcgqAN/kdi9HVdFpAUE0tbM56c6VsZ/7eyfuV8bwfxCv8kXXRQoXkoV3So/IIpa4DJDvFOl2xOALV/+NHYsax74apz2glNDXp4tGG6T0TVfn7MCWifyAWk3RdAON5jX+4f/UotjxtRpK8K8rek0IRqZ8h82XBwfmwU+5YmImshC3Qu1z2v5tsgIQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrii
 Chepurnyi <Andrii_Chepurnyi@epam.com>
Subject: Re: Hand over of the Xen shared info page
Thread-Topic: Hand over of the Xen shared info page
Thread-Index: AQHXR86B8dxtD5lx60CgXee9ciHSoarhFtmAgAGmygCACItDgIAAMAgAgABnUwA=
Date: Thu, 20 May 2021 05:21:07 +0000
Message-ID: <4b686071-3260-87b1-d240-8d3c2b48f1f8@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
 <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
 <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
 <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
 <alpine.DEB.2.21.2105191604130.14426@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2105191604130.14426@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d834b328-cec1-4455-6fc9-08d91b4f1247
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB60680FBFF562EB5E1EE87442E72A9@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ayvm0qfb2TVfXyFWsA+ly+bpRGRvcJUwnBXL0SWSHpXCvjgTsmjKsxa9oZTVM8J3rbqd7anX7I2clAR1OPcR8sBmHNNDyYv73oC1YcAjyBX0D7L0sBhe2Lyb8FYwhn0M4gceZxQgoqMDhm5z4NAIwMC/2uIQwQKvag80fI5X2AQBRdrPd88ZPZ6161rnzwjR3HeoYO6SUHxrjyo3dFZ8mvuc5VKIKRqiP4V7/95X8ZiB2USmXJ4xuVzOAi6XXbM2Fv7lXMUUcecQUBkzuiuVm84rOGuZqy26+7GrvT3algVs4704KO2PUpDgDIN6G2DCpUubzy+huBmFDRKxwQJiq66jU/4wkCWjVPGeiZ7qywHI2XIRevq9CHNVClVPtdsDyb7cCpRqtAhAvE/q71I+Y48ZtVOaC4rjHhKDy8+rAQJFlqsiIN1jexGoWGpuVNPjhlBxQ7wwQdiKEtU0emc9veNRgYdNXV02qHDr5EF9wxAaJnT23z3dYXCf7jufowHoecvct+ZIs07JIafemHGZbgCWhyAzo80J1eEdP4r0SqHnrapc3Qu2OMtlRmy47FIpS+FGiNu/6SszD1+rFYvQeVPfpLzkt5WkQoK7JlUiNKrE87yMEF0fPL71ORO6wiIwgOFRxkx4DpSbo8/6p+8SpY7f8d5CRfuPfjlysEQoEhU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(66476007)(83380400001)(76116006)(66946007)(66556008)(66446008)(64756008)(316002)(31696002)(4326008)(5660300002)(110136005)(54906003)(186003)(2906002)(8676002)(26005)(86362001)(478600001)(6506007)(36756003)(31686004)(6512007)(53546011)(107886003)(122000001)(2616005)(6486002)(38100700002)(71200400001)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?emR6WDl3QXZUelg4clhXQXkvcHhQZ3RTallMSFJGa2ZZMmpnVmtycXRuVHIr?=
 =?utf-8?B?VlFKa2VJbFVMTkpBK2szcWluc3RmT2xveStjNHBjS1dtcDUweFJWS2lUbkMy?=
 =?utf-8?B?Wm1vVXJ5MkVjOXkzQVBuR0xaaWFndjc0U0VZQ3B2dnZaQkY0WjRoUWFvb3pa?=
 =?utf-8?B?UTNIYW93V2dmTG03UkJPQUJXU09QR085S005WlMzaHlLVjFYR1BrWXdzZmNs?=
 =?utf-8?B?WWx2Z09aS0tGcHNPYmFBZklvdnlHbTFjZTlNb1lDR0tBeHYveUxmTTVMc3R1?=
 =?utf-8?B?NGlXY2NQN1U1cmFVbVlJbS9jMVRIcXQ2NWFGeXpJYnFrOVJOTmovYjBCN3g1?=
 =?utf-8?B?bWMvTVNQRGRzcGNtejR1WGN5dEJFdnpHZ0RmTEpQUVF5WjdHeUdtOXBzanNn?=
 =?utf-8?B?S0dRT0xSVlhzeTZrQ3NFK0tkTHZVRmxHR0NEUlE3ci8vTlB2NjF2Q1VOMmFM?=
 =?utf-8?B?QnllblltS05RakthRDdndzBmN3ZqNGVhU0pMTVRaK2dmcWVpMkNFM28zRG5X?=
 =?utf-8?B?cGJtYkw1K00xL0tWMkwxZEN4Mk9LWkdtS2dEdmR6amFCcG5IQnJjYkJkY1dJ?=
 =?utf-8?B?NHY4dXpTVHViV0JUNGNVV2dpcEd0QUNGNmZWclRjMzJzZEg0ZWRyYS9yK1hJ?=
 =?utf-8?B?a0srcldWNkJxbjRvSXVZRUZHT0pGb1BKeU8xbCtwR3RKZFRhS3NMclFBbnhn?=
 =?utf-8?B?VU5ZZUJtcVB1cHhVZ1gvRVRoTW1QeFNjVURxeUVuREhyUlZDV0VBNzdOcXF5?=
 =?utf-8?B?VjlIREd4NWJRWi9ralNZMUMyZENPYjlENElyTTZRZnhEbklsN3ZzRmpWR1Ix?=
 =?utf-8?B?dmRMQ05vYWhPUDlvTnMyRERIb3hxUk9WK0Y4S0Z2aXRxSUhzRmFpOU44dVdI?=
 =?utf-8?B?MitOWFZaTG11QkVjVmxmNkFpbHl1WlU3eDZENUh3dVU1MDBhK2R4Y0ZJQ1ow?=
 =?utf-8?B?TVNMemhNWXk1WW1XUktIcXQ4eElXbElZSy9JdlVqZ3lHZ0hTZVRIS0xzQ2xG?=
 =?utf-8?B?cEZZUG1XR21ZaEU3ZkhnNVFzdDBrS3NPRExVQkx0VHRQZy8vNENmcnRrQlFz?=
 =?utf-8?B?SENRUHBVUHd4Z2Q4NFBRVjJjMEtNUWZmcHY5amtOVkRwaUxpK05JaHlySVBu?=
 =?utf-8?B?ZmFPWGorekt6TjhSblRad0xzbmQ0MFNZeUo1Y0xjSFRWbGJ1UEcvQzZ4aUdz?=
 =?utf-8?B?L1NIZnk0V05BS3VZUkNRQVZNWTNDWlhlalNZRnBtRmJiWVRWZmpuWHJUWkM0?=
 =?utf-8?B?N3hQUmQ5NU5vL042bWpFTk5tb3RSUVZCWmRhbU4zb0YwcUdTWWtkNWF2K0Jy?=
 =?utf-8?B?eGxFTHZpZXA0SkdnOGdldDBwOU9CSnNuSHRiUWg1Vyt5OHlobFlKSjdDUmJy?=
 =?utf-8?B?ZGYzWUZYSjA4ZmlLc013SlNiV29FTXpJUm5TMkJzZHNleWFhTndzUWJoKzlv?=
 =?utf-8?B?Zy9xRkJvSUZBdWJBZHRlVTlNRWI5R1ZvSUNQN0tsTEVCMzFGdWFDRUZUYlNF?=
 =?utf-8?B?VG41TjA3Y01DWWVpNks5aEpySS83MER3b0JjS002cTE4SWdJdGVWMmFPOW9R?=
 =?utf-8?B?eHZyS21uR2ZxdWtZVjBDNEFmeTM1RVl5dkJ5SmY2QURTR1ltUjFRL2lXazVn?=
 =?utf-8?B?Zm1DQ0tkMkJKU1RWMysrZFJzOFA0anhrMWpuSWFaSExiRmh6SkNySWpPeCtP?=
 =?utf-8?B?SmxhOGM4UzRQZmNqM0lBZ3MrV044b2ZoNFVUOTVURlIzdXdIeDlpbVZVNlNt?=
 =?utf-8?Q?8Pn3AJe7DKam1UeoKy0o7GLJNg4tvRCyCGGws/u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D971F2542783948A363FB148D6E212B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d834b328-cec1-4455-6fc9-08d91b4f1247
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 05:21:07.1578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w3eDM/Ks6ydlwtOw5VsWttx0m3jXW8VvHHr2ulXNOimNbPYyrorddAk66rkA9izWQrLcQ4Nnno2altjbAc51joaUhZgeYdliCfUpzv3no3dRkCrzK4Nb5xn8vt3WCPw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-GUID: pX_P9yJp3pktZXxINP1X-JDBCgFVU_Oz
X-Proofpoint-ORIG-GUID: pX_P9yJp3pktZXxINP1X-JDBCgFVU_Oz
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200042

SGksIGFsbCENCg0KT24gNS8yMC8yMSAyOjExIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
DQo+IE9uIFdlZCwgMTkgTWF5IDIwMjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDE0LzA1
LzIwMjEgMTA6NTAsIEFuYXN0YXNpaWEgTHVraWFuZW5rbyB3cm90ZToNCj4+PiBIaSBKdWxpZW4h
DQo+PiBIZWxsbywNCj4+DQo+Pj4gT24gVGh1LCAyMDIxLTA1LTEzIGF0IDA5OjM3ICswMTAwLCBK
dWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IE9uIDEzLzA1LzIwMjEgMDk6MDMsIEFuYXN0YXNpaWEg
THVraWFuZW5rbyB3cm90ZToNCj4+Pj4gVGhlIGFsdGVybmF0aXZlIGlzIGZvciBVLWJvb3QgdG8g
Z28gdGhyb3VnaCB0aGUgRFQgYW5kIGluZmVyIHdoaWNoDQo+Pj4+IHJlZ2lvbnMgYXJlIGZyZWUg
KElPVyBhbnkgcmVnaW9uIG5vdCBkZXNjcmliZWQpLg0KPj4+IFRoYW5rIHlvdSBmb3IgaW50ZXJl
c3QgaW4gdGhlIHByb2JsZW0gYW5kIGFkdmljZSBvbiBob3cgdG8gc29sdmUgaXQuDQo+Pj4gQ291
bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGhvdyB3ZSBjb3VsZCBmaW5kIGZyZWUgcmVnaW9ucyB1c2lu
ZyBEVCBpbiBVLQ0KPj4+IGJvb3Q/DQo+PiBJIGRvbid0IGtub3cgVS1ib290IGNvZGUsIHNvIEkg
Y2FuJ3QgdGVsbCB3aGV0aGVyIHdoYXQgSSBzdWdnZXN0IHdvdWxkIHdvcmsuDQo+Pg0KPj4gSW4g
dGhlb3J5LCB0aGUgZGV2aWNlLXRyZWUgc2hvdWxkIGRlc2NyaWJlZCBldmVyeSByZWdpb24gYWxs
b2NhdGVkIGluIGFkZHJlc3MNCj4+IHNwYWNlLiBTbyBpZiB5b3UgcGFyc2UgdGhlIGRldmljZS10
cmVlIGFuZCBjcmVhdGUgYSBsaXN0IChvciBhbnkNCj4+IGRhdGFzdHJ1Y3R1cmUpIHdpdGggdGhl
IHJlZ2lvbnMsIHRoZW4gYW55IHJhbmdlIG5vdCBwcmVzZW50IGluIHRoZSBsaXN0IHdvdWxkDQo+
PiBiZSBmcmVlIHJlZ2lvbiB5b3UgY291bGQgdXNlLg0KPiBZZXMsIGFueSAiZW1wdHkiIG1lbW9y
eSByZWdpb24gd2hpY2ggaXMgbmVpdGhlciBtZW1vcnkgbm9yIE1NSU8gc2hvdWxkDQo+IHdvcmsu
DQoNCllvdSBuZWVkIHRvIGFjY291bnQgb24gbWFueSB0aGluZ3Mgd2hpbGUgY3JlYXRpbmcgdGhl
IGxpc3Qgb2YgcmVnaW9uczoNCg0KZGV2aWNlIHJlZ2lzdGVyIG1hcHBpbmdzLCByZXNlcnZlZCBu
b2RlcywgbWVtb3J5IG5vZGVzLCBkZXZpY2UgdHJlZQ0KDQpvdmVybGF5cyBwYXJzaW5nIGV0Yy4g
SXQgYWxsIHNlZW0gdG8gYmUgYSBub3QtdGhhdC10cml2aWFsIHRhc2sgYW5kIGFmdGVyDQoNCmFs
bCBpZiBpbXBsZW1lbnRlZCBpdCBvbmx5IGxpdmVzIGluIFUtYm9vdCBhbmQgeW91IGhhdmUgdG8g
bWFpbnRhaW4gdGhhdA0KDQpjb2RlLiBTbywgaWYgc29tZSBvdGhlciBlbnRpdHkgbmVlZHMgdGhl
IHNhbWUgeW91IG5lZWQgdG8gaW1wbGVtZW50DQoNCnRoYXQgYXMgd2VsbC4gQW5kIGFsc28geW91
IGNhbiBpbWFnaW5lIGEgc3lzdGVtIHdpdGhvdXQgZGV2aWNlIHRyZWUgYXQgYWxsLi4uDQoNClNv
LCBJIGFtIG5vdCBzYXlpbmcgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGltcGxlbWVudCwgYnV0IEkg
anVzdCBxdWVzdGlvbiBpZg0KDQpzdWNoIGFuIGltcGxlbWVudGF0aW9uIGlzIHJlYWxseSBhIGdv
b2Qgd2F5IGZvcndhcmQuDQoNCj4NCj4NCj4+IEhvd2V2ZXIsIEkgcmVhbGl6ZWQgYSBmZXcgZGF5
cyBhZ28gdGhhdCB0aGUgbWFnaWMgcGFnZXMgYXJlIG5vdCBkZXNjcmliZWQgaW4NCj4+IHRoZSBE
VC4gV2UgcHJvYmFibHkgd2FudCB0byBmaXggaXQgYnkgbWFya2luZyB0aGUgcGFnZSBhcyAicmVz
ZXJ2ZWQiIG9yIGNyZWF0ZQ0KPj4gYSBzcGVjaWZpYyBiaW5kaW5ncy4NCj4+DQo+PiBTbyB5b3Ug
d2lsbCBuZWVkIGEgc3BlY2lmaWMgcXVpcmsgZm9yIHRoZW0uDQo+IEl0IHNob3VsZCBhbHNvIGJl
IHBvc3NpYmxlIHRvIGtlZXAgdGhlIHNoYXJlZCBpbmZvIHBhZ2UgYWxsb2NhdGVkIGFuZA0KPiBz
aW1wbHkgcGFzcyB0aGUgYWRkcmVzcyB0byB0aGUga2VybmVsIGJ5IGFkZGluZyB0aGUgcmlnaHQg
bm9kZSB0byBkZXZpY2UNCj4gdHJlZS4NCkFuZCB0aGVuIHlvdSBuZWVkIHRvIG1vZGlmeSB5b3Vy
IE9TIGFuZCB0aGlzIGlzIG5vdCBvbmx5IExpbnV4Li4uDQo+IFRvIGRvIHRoYXQsIHdlIHdvdWxk
IGhhdmUgdG8gYWRkIGEgZGVzY3JpcHRpb24gb2YgdGhlIG1hZ2ljIHBhZ2VzDQo+IHRvIGRldmlj
ZSB0cmVlLCB3aGljaCBJIHRoaW5rIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBpbiBhbnkgY2FzZS4g
SW4gdGhhdA0KPiBjYXNlIGl0IHdvdWxkIGJlIGJlc3QgdG8gYWRkIGEgcHJvcGVyIGJpbmRpbmcg
Zm9yIGl0IHVuZGVyIHRoZSAieGVuLHhlbiINCj4gbm9kZS4NCg0KSSB3b3VsZCBzYXkgdGhhdCBx
dWVyeWluZyBYZW4gZm9yIHN1Y2ggYSBtZW1vcnkgcGFnZSBzZWVtcyBtdWNoDQoNCm1vcmUgY2xl
YW5lciBhbmQgYWxsb3dzIHRoZSBndWVzdCBPUyBlaXRoZXIgdG8gY29udGludWUgdXNpbmcgdGhl
IGV4aXN0aW5nDQoNCm1ldGhvZCB3aXRoIG1lbW9yeSBhbGxvY2F0aW9uIG9yIHVzaW5nIHRoZSBw
YWdlIHByb3ZpZGVkIGJ5IFhlbi4NCg==

