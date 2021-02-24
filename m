Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD64323785
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 07:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89177.167769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEnyT-0002BL-Da; Wed, 24 Feb 2021 06:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89177.167769; Wed, 24 Feb 2021 06:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEnyT-0002Aw-9l; Wed, 24 Feb 2021 06:48:41 +0000
Received: by outflank-mailman (input) for mailman id 89177;
 Wed, 24 Feb 2021 06:48:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tmjC=H2=epam.com=prvs=268986b58a=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lEnyR-0002Aq-7O
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 06:48:39 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60d5a160-565d-4da3-8b38-51e9cdb542bc;
 Wed, 24 Feb 2021 06:48:38 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O6jYkN015264; Wed, 24 Feb 2021 06:48:36 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 36w0ymturc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 06:48:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3588.eurprd03.prod.outlook.com (2603:10a6:208:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 06:48:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55%8]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 06:48:30 +0000
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
X-Inumbo-ID: 60d5a160-565d-4da3-8b38-51e9cdb542bc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlRE1MUzd9854R8VT8Wbfkwlp5SrQY54nSCqIhFID6bM8p2gbPJJkNAxQaU+nSRfXABol3tNxgx/WIIvNumm75WnN2yIJCCxwNyD1FYyoXSvYMgCMM/B8wcUB8evQV1AApPnUil6kXEdMZpHthMT8wLhxjvexUeUaNjO2ej0q7rHj7MRM6r16QzkQ1GnherrLA7iJ/9nv771SwjKFfMNG9WhF0fD/sr1gPOaeSCRFzW9SqZjhK4m/zUAnarydj7hKe4twQjhiTrzPEQ1JpFQWMY25XNabvvAeHi4kn6VYYpXYImid2LAxywKfKiq/drspTIi2bKNStDIm4chBn0wsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N37LfyqeB/Y7Hov9jr3gImj5owT3IzbTNE6qWyTXww4=;
 b=E664vYgd02Fte/UoAZsMysx5Z2CvsI9eSnNCN462ughM2Cs0VVvZIeaKaJK3sekYfccebw/JDezVO+PJxaTa+NAk3kj5p0lXSRSOpCMZE4L1StFFNjLXHqKyoHml5vO+NmG7cG05W13E799azFfPEDmcWiwKqkL0K5TtDo7aPlnrYmcku9UkjhdozrTRPYexAxLTazff7hDv3q+Gc4qWg5266DHQVTXhsqpFyP2HtXYuygKqz5jaIznHBYX9ELcs3SBnfpZBonJWju8OqQ9wWQ7a6gxsTzWb/pxYb9CkYKKo80kzkBtYK81dVaKWk7rE88rcdM3rEMbgznbFf/tMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N37LfyqeB/Y7Hov9jr3gImj5owT3IzbTNE6qWyTXww4=;
 b=uJl8u93Cp0ebGS0legVVEAaU2ec4K6n9RnR39UtMM5AsJETjUaqlZbzTa79fV7VIL4pmpRTx3v58HBn0BxDu0lnoyzQcXdapj8q1k+5m0LGtLxVO9FmJ90eBMzohwdQVaizK4AnSw7NKxvhoMKxqtQMwD4fxdAfAuUEacrLRFTy1+L2jtrCzRfK1IydBi1pA1a3eOrLQeoKEYMHedOTKSLIjlLTO00Zyo8Uu7tMN0iUa4LXbxldyCw7x6U80tNM+RxHRP/TQN8zptH766xIsH6nqp2hRAGLWDZBdDaakrz42zd8OIFz33TxuZ5HZM5YosGd2jBQO+2ICLF/WN17lCA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xen: adjust Kconfig
Thread-Topic: [PATCH] drm/xen: adjust Kconfig
Thread-Index: AQHXCgKuZuE2hAvl4Eu58Fslz5uDM6pm3hiA
Date: Wed, 24 Feb 2021 06:48:30 +0000
Message-ID: <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
References: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
In-Reply-To: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32ca0dee-2568-4c6d-6088-08d8d8903248
x-ms-traffictypediagnostic: AM0PR03MB3588:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3588CDE7EBA6038AD0B0D461E79F9@AM0PR03MB3588.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dYyI48JUuw3EBXEsQei+n7tSAq0RXBVfEqyGDjp3skOEm6pGPNvEL8g44mAogvsJdV4fidqk3brXxLHCHv3ld6wdiN0BvV/pJTseuUNMr/uzQlbxJNuACoz4DrDj6NQpj9wP34nd3KNUGUZ22MaugXUhVXoO3gGObsi4YcRnJlu5I03SR5oy1LePS8SlrdgEMr45PJHAbwOBZHRAB4ikCZdFFA4qm5nhXWpk8NqsQucao1nC+UdosorsrmE5lZ9oRZ0OxZhvDEQQK4TH55w0I2EGmepwyUoLHXzLp0LbUx48lUJ8+0mTJL6AjlBChcF1VyQ04bJSdjXkXKOsSRnbK2XGpNEg9qkxT0RPl7vMLiEDkT9XsDZFDfWIufCVvz4W5JCHhANwNcNk1C2wqR4yUZ49NdVTogOMM2zbZatVjUziH4aDiA4oaHdbPs4vJl0owPwMSeLhBWYwTdDcaP95kq4pGTfVKrNdOkcFZzYUq2HM0JDp/NX1H9moRheMW/ZLh/3hOlehlnaTCtZrEbc9n+CQ2VCxa+SYFOTNfiAa1Cm5aNagWKVS8seBCOswHd3uiVstR+aZPN35YE6SyDVyPw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(26005)(5660300002)(36756003)(6512007)(54906003)(8936002)(186003)(64756008)(76116006)(66446008)(4326008)(478600001)(71200400001)(86362001)(83380400001)(66946007)(316002)(66556008)(66476007)(31686004)(31696002)(8676002)(6486002)(2906002)(6506007)(6916009)(53546011)(4744005)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?R21ZdVFobFFoWUdFcGJvN2RJb3RjWFptdnhueXRVRTZZdFhsdUxIYkV2OUNX?=
 =?utf-8?B?T3dTbDJ5MFJXZXlwcmt5RDVTdVBMTHJoRGVZL0t3R2w1OWl0RlJucE5FNnRG?=
 =?utf-8?B?d0hJVFY0bFgrQXFGbWJVQ2huWmE1ZmxmUGxyMUt3M1UvZHo1dWFWQUtyWVQr?=
 =?utf-8?B?Qkx1THp0aXkyNVdNN3RndCtDTDBqZjZQWmR4WW0yMDUxVk16SXhkYkdDS2cw?=
 =?utf-8?B?ZE9PekJBbSthWGRyQngvQXk2M2ZMZ2s5TGIrQzFlVEE3YU5nTVM2WFg5SjMz?=
 =?utf-8?B?S2NiQmJwQXF6RGMwOENYT2pzdCtNdEg5VUtRaVIzVW12QzZ2eTRHNjVGM2Fv?=
 =?utf-8?B?OWJzaUFSV09nbTdzYlVZakxkeFY0NlFqY1N3SmE0dlA2S1RuTHI4SS85Q2w5?=
 =?utf-8?B?L0x3Y00zZXlzT2tjeEF5QjVvcTdxd1pyMFJMdlBKd0xHWFQ2Y0RmUXBuckNU?=
 =?utf-8?B?SUZvUndkRmdoUVpGUm1ZMVJiMUd3c0R4ekltYUlreXdBWG53YUpwa3kxWHFz?=
 =?utf-8?B?b0pHRkJYUlZ5WEtXOW5ma3R5ZGxIK3hNdlBpREtBdko4MWdLN2Fjc09MUlZr?=
 =?utf-8?B?aCt5eDYrTVorSjd4aDh1a0l5ekRTZFkrVnNaVCtFb2Z0cU04SUFNcE9hOTF6?=
 =?utf-8?B?UDBNYWpVU2c3N3ZQQ1JFTkN4UUFoeHdXNWcwL3JGYW81MDduS29FOHQxekpE?=
 =?utf-8?B?dXFDZVRVSWQxWjNPV3hGMTVXYkFUOVg1bnZMaCtwNmZBNU1iSDRCQUpWT3lV?=
 =?utf-8?B?Z0YwK2FIenZuZUZRK0loNXFrNm9SdUZSNk5NWnBnZUduRjNkNmswR2x0eTRJ?=
 =?utf-8?B?UU1Bd0tBeWUrOFlGM0VrMm1wODRNck8wTGpwWkVxUFNrVFdFWmVlTm1wL3RV?=
 =?utf-8?B?ZVdLQXByWG5mYkdmWkJwSVhUaXlGSWZOb0hTS01RS3l4eUo5Y2ZZN3N2SEt6?=
 =?utf-8?B?ZE4rdUcwREJrTWo0R1NudzR1V3JQbUpzYWt1T2hFaTBZMDJhVElObms4WWhG?=
 =?utf-8?B?R1gyQmFmRXZTdUJOUzBqL1JLaFRjYUxMd2tVeGVXbUExMVhLUUlDU055ZFRq?=
 =?utf-8?B?Tk91cWxYaUswTXR1UVkxUk5GTzUrOW1HTW5zbEFoc0lKemFhVGlSM3VMdUdU?=
 =?utf-8?B?OTJWckRsK1JSK0I3V0JGdlRRcUN6d2hVakpLaXpwNHpVL1NuN0NjQThkbE9S?=
 =?utf-8?B?UUJpRlVPMGw2bGUwSVlKaE9uVUgvdVgyYnNlQ2J6NjJNdzJJVklpVW10Q2M4?=
 =?utf-8?B?NHlaQjB4dDd2cGpObVNJU0RMWGJqVk9NSkFDS3RrM0hDR0U3aTh6dndpSklQ?=
 =?utf-8?B?QUVnMmpKVXV5ODQvWExPZUJsSWlCY1dqL1RDUlpmcUpJVVB6OVQxMk80MllN?=
 =?utf-8?B?aksyZ1lTdTRLdTEyZ1l5RHdMN25uQTBRa0ZCSWt1d015VnZUTStRZVBEYzEr?=
 =?utf-8?B?dTN5YkFjcmZ5UFhibExXdXNWTFJHYkQyTjhxZkZLYWlyVU9YLy96R1o4YWNl?=
 =?utf-8?B?cnYzYlVMc3FOOGhkNHp4dnNFaHA3TmpTbFdOUkFHem1kcWJ6QktEckVCRno1?=
 =?utf-8?B?MDFocXNvT3N1b0ZVWkRxZC9Yd1ZvVW1ubnJkUWdQTVUzc0xoa1hzdThiLzl2?=
 =?utf-8?B?N1dlOWlIVS8xVHFSTUliMGlvTGZ5WWVoVWNEZGpxaHBJZkRaaFBlMHVHU2Jj?=
 =?utf-8?B?OHN6QWVBUEMxRTF2WkxHbXFPMWFVdHdnUHpJM3drTGxWemNJNklaeXRiRUxK?=
 =?utf-8?Q?5pcj/TMM05u8WVzlS649VF58P9Gm89dzLOpC1W2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CE83E0FC65F6A4C9D0C37EA96107146@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ca0dee-2568-4c6d-6088-08d8d8903248
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 06:48:30.1975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLzEbpxFBAPZQfLE7uYk7NfEybKbxHwztu2T1HVUMSF/SmztboX8BnUJ+0AjkRun0w0IrJ+rIwjwxCkV+dEblbINrdZGKG8wD9lbL30gNHhCo3mtx6CXa802pvqNXFst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3588
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240053

SGVsbG8sIEphbiENCg0KT24gMi8yMy8yMSA2OjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
QnkgaGF2aW5nIHNlbGVjdGVkIERSTV9YRU4sIEkgd2FzIGFzc3VtaW5nIEkgd291bGQgYnVpbGQg
dGhlIGZyb250ZW5kDQo+IGRyaXZlci4gQXMgaXQgdHVybnMgb3V0IHRoaXMgaXMgYSBkdW1teSBv
cHRpb24sIGFuZCBJIGhhdmUgcmVhbGx5IG5vdA0KPiBiZWVuIGJ1aWxkaW5nIHRoaXMgKGJlY2F1
c2UgSSBoYWQgRFJNIGRpc2FibGVkKS4gTWFrZSBpdCBhIHByb21wdGxlc3MNCj4gb25lLCBtb3Zp
bmcgdGhlICJkZXBlbmRzIG9uIiB0byB0aGUgb3RoZXIsIHJlYWwgb3B0aW9uLCBhbmQgInNlbGVj
dCJpbmcNCj4gdGhlIGR1bW15IG9uZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlbi9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4vS2NvbmZpZw0KPiBA
QCAtMSwxNSArMSwxMSBAQA0KPiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQ0KPiAgIGNvbmZpZyBEUk1fWEVODQo+IC0JYm9vbCAiRFJNIFN1cHBvcnQgZm9yIFhlbiBn
dWVzdCBPUyINCj4gLQlkZXBlbmRzIG9uIFhFTg0KPiAtCWhlbHANCj4gLQkgIENob29zZSB0aGlz
IG9wdGlvbiBpZiB5b3Ugd2FudCB0byBlbmFibGUgRFJNIHN1cHBvcnQNCj4gLQkgIGZvciBYZW4u
DQo+ICsJYm9vbA0KPiAgIA0KPiAgIGNvbmZpZyBEUk1fWEVOX0ZST05URU5EDQo+ICAgCXRyaXN0
YXRlICJQYXJhLXZpcnR1YWxpemVkIGZyb250ZW5kIGRyaXZlciBmb3IgWGVuIGd1ZXN0IE9TIg0K
PiAtCWRlcGVuZHMgb24gRFJNX1hFTg0KPiAtCWRlcGVuZHMgb24gRFJNDQo+ICsJZGVwZW5kcyBv
biBYRU4gJiYgRFJNDQo+ICsJc2VsZWN0IERSTV9YRU4NCj4gICAJc2VsZWN0IERSTV9LTVNfSEVM
UEVSDQo+ICAgCXNlbGVjdCBWSURFT01PREVfSEVMUEVSUw0KPiAgIAlzZWxlY3QgWEVOX1hFTkJV
U19GUk9OVEVORA==

