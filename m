Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3034193DC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 14:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196774.349693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpQo-0006BR-6h; Mon, 27 Sep 2021 12:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196774.349693; Mon, 27 Sep 2021 12:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpQo-00068I-3K; Mon, 27 Sep 2021 12:08:26 +0000
Received: by outflank-mailman (input) for mailman id 196774;
 Mon, 27 Sep 2021 12:08:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUpQl-00068C-WF
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 12:08:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b8a9060-1f8b-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 12:08:21 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RBhAoC027647; 
 Mon, 27 Sep 2021 12:08:20 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbcrpg92h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 12:08:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 12:08:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 12:08:17 +0000
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
X-Inumbo-ID: 9b8a9060-1f8b-11ec-bc44-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR8u6GE5hrot0KiQ9FJ6faiJguBv/bu5wznLndEBANqf0FI20C/IoWO1Ussb4nmpfw+VHlhvd3mJzeB0w+FxGQkrLB/PQsZp9zk7BqYj1iqvOqjxSW3JSubwUFaTeqRbZJ3tJYR2wVxwEWvhiP0+NffasS1aMHiIRANfmAMLhyMngvzcw1JZjABwpiPoyFoBmWHWj6TDKdoA3WjUw74V4AlVVVyy9pF7Q2ISZAghuZJ88gEEztoZ42c29QwM2QjIu+BkTu/E99grM3RYpq4wxKOqJM8mY+v+NZuxAO1hmTZjyrjE1mpQyrVyz5vIYoK6z5NCFULZCLqela+u8B0C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xexl7NyoROe4qEbtFGxV28fJJnFyqcHJo+rcYlERR9k=;
 b=YiTFwaVkEFGLiLbdz/kB29Ox+4rBppehGYjmS173cFFLU6fj3dswCKZjQmfT/ghAnO68fUIm0dZ0S4H/1tHJxO/g3syWGsV8xtuoTNvSuHbFHEeQDgqa7JC7vqveS+jpwDEcKR+wy9n7byu0L9HfeeczffMQCV3/J9mFpEIHZ/PneFMbol/ZYoIMAlgUn4lZoU4idKstWOvG8iUt+TR7bPhtLzU5kwZ3GPqqajDFh1gdvly4cOEEAk6+pKje4sUaUeO17GOiGIvs6s6vtvY5LVJ/iwUUfdW7LjKYBJ1OZ6ylB9suvtdkkfxCfGqn3zE2jOO6mu3j3EtwKWF4XDA1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xexl7NyoROe4qEbtFGxV28fJJnFyqcHJo+rcYlERR9k=;
 b=fdiwhJFgrhFlyh4/Tq8CEvd9tYeOVLaHQJyWPAWD17Ra6dzvC/4S2usNfJgOPIaR5++ubJ9WKlQhB6hcx9ht0jBb8w3RV8pQZg7LViR5lBmWnM/Tm8mYIIH9CoOl4zlUHKrtqkTH4/KeOpvmfn7b8dW5HIfFDJb8kJgfSa+6KQJvOFegU1WzNUqvozJNqOk4VJ2zYdjzKLRyGFV5NR4kQB8qGY0X8Mbhtwocmwyp+H50v3Fq3YVIymI/KHrXU2lwIer38d7gzff5XNOGEDqvYjVVBmOi1YEB/sjKB50+DAaSHscbk5dk7NVePWN3u6Ya8a2etY6ysNyHNnNG9hv0+w==
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
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXsHpEqeYVqdD8fU+X35KPuXAnA6u3xY6AgAAKMQA=
Date: Mon, 27 Sep 2021 12:08:16 +0000
Message-ID: <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
In-Reply-To: <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c923dbea-d6af-47d4-73f0-08d981af7d40
x-ms-traffictypediagnostic: AM9PR03MB6884:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6884C96EFC64A844BC0E39DFE7A79@AM9PR03MB6884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uN6rgfMaT1kPldmO0Xb6aDzK8M/p3QagjsnK9qNpjOz5SQr1VcX5ZA4SA+37DCTyrsaPJA9IGeFLIffWi1tSlpCXlzll3PFXa4WcMm8oq2sKOmg5CoKgcoEDlMmZ1ktduglgODEe5ebMWfk5/5fL+bopmHSxCS4mpOsx48HdX7VWR0UjF3jveM375T2/9dtnQUOSg5dzTyDw2OYbP2S9+ku8IUk5DGQpWm6AS4chYTM89+YDd9Y9Y67Xcr56OkTXombSA80FGj/NasevOnvh0SGsxouoiPHFUSLNPW36KrRDhEgRsk8mBXUzJWhgUAPs6PiIEOBZm6HfVFImRV5JiYINAUskZ1Chg8NaAB1vq68EZK++OhBdTxUw4b3hreKiRf/TnSLZNk2u7ztr3l8mhexhKEAn+vD6eMeq+kbOhRELt/HmVIJ74OAI3rrYET8VPJ9d3rv/Du/vH7ldeENWb8QyioWySCAJnajpILcVXQhqGABjlh8UOGEgcFvZ7T0/J2asj1UJ5U8Q41OKpeJxjTi/kLxKtOjuGf4o/nqx0ePOYOKGj4QBfytdUk+Zz1aORiaeoYSnlbkSu4bUzP25vxPXUOPXggCsgMp1du2lIZys1Mf0AmOKp/ZkeywpNj3OaAPGYojVNbS5wkxx/SKt5AT6QQcXMaNs8phRkdLh5dfcKj9xCkx8Rk8w5cXTc8eJdG8vSTINbWXyp1EthZVdABuJQl6/7JEeWLrvVI1NF4RBTls3LUg31yVOZKlbuonG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(6512007)(4326008)(91956017)(76116006)(66446008)(64756008)(66556008)(6486002)(66476007)(66946007)(36756003)(2616005)(31686004)(5660300002)(107886003)(54906003)(83380400001)(508600001)(186003)(2906002)(122000001)(71200400001)(38070700005)(6916009)(6506007)(53546011)(8676002)(26005)(31696002)(55236004)(38100700002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ek43UTVnMktoakJ5NHlsamYySVpwQ2lxdlB5ZE5ScHIrWXdiWDFTYTMvbk90?=
 =?utf-8?B?Z2lCQzExSG5ZUXo2a3VTK05YSjJ5cXczaXZ5Z1JhUWhlazNJdkd6djFkWHFt?=
 =?utf-8?B?Wmt3MzFGblloUXFPZGFWeGU3TGpocVV2VXJjWDQrZUdrMXNVZkR5SXhCeUZv?=
 =?utf-8?B?TGphdFRiN3NrQVJlWWs2UnR1aEtvMDFSN3lNSkI3aXJqaFRhVFhHZ0FsSXRG?=
 =?utf-8?B?TlZzNTV1SXNrLysvSGgyR1VDSDUyazhQTmFVZ3FnWWpMSlo3TTFxV1BpWWZS?=
 =?utf-8?B?NzlwMlNkckgwR0tXRHZ1VTNmTnlTNDJVYzVPWUM3RnRxSjd6ZEgra2RucE4y?=
 =?utf-8?B?TzBjRnMwRDdIT09uWEYyUUMyNXNjejNvdS9TMS92OXd6RHBPazRKYlZUbDg4?=
 =?utf-8?B?dktzUDlkdDdLNENCQmJGUWdXbFhEOFVxMmFmSHFpZEhhQnYzNmpDWGZWQzlO?=
 =?utf-8?B?UjJRQ1hFS1Q0VkpOdlo5TGNaWGxScUVwUG9jM2UxdTFlUUFLTllyQkxXcWtk?=
 =?utf-8?B?WXZSOEwrd1VmKzJxTERiellQMzNpQTlyVGpReE1SOC90VmFMazBmelB6VDlu?=
 =?utf-8?B?Y0dwS1ZYYTVvcFVyUVNIWUlOUFl3bXpiUVc0MUFBbUtCZkh1Mm94YTVEa05q?=
 =?utf-8?B?T0dvbDYzU2FXVXpaOStZZXMycjBocjcraDFldEF4aXM3OHJlKzlXdW1saVgy?=
 =?utf-8?B?U1BtRDh3a1BHTFJvQ2NzbURYY2N0alhXeHIvRVQzblhZVGpYZjlnaWpyRng0?=
 =?utf-8?B?RHBLUTAvZk9nSGljOGJoQTAzQitCMk40SHlYS2VUOWs4dzF3MjJkQWtlNG1h?=
 =?utf-8?B?aHBqRkEyclpRTzVDU05XZXc1SjdCK0pCb2hQenBpYVIxYXpDQllxTmUvRHg3?=
 =?utf-8?B?SVpqbWdoWmgzVm1SWnEvY2VWRGo2OEZTa21LeFl5TEpONWg5WS83K0pTMWU2?=
 =?utf-8?B?Tk1McC9Gc1BLbFZLaExjRldyVDBNMmI3WXY0aEJCYlVDZnFCQlVhNWpWWmhH?=
 =?utf-8?B?WVJROGpkN29lWW1wbndYdzVYdm1oUTdydVBnenpDTThLMVl1aUEvV29vemZJ?=
 =?utf-8?B?YTd1djhUeXBIRlVPREVNNnF4eHk1ZlYxRXdrdEp6L3lnQlEvUzIwM2VmbGhL?=
 =?utf-8?B?Zlh1Zm9hcnBYOU5MZzlaWWN4ZWZaK3h6VGk2dWQ3VTdoRE14RVVkSCtCdXFR?=
 =?utf-8?B?YjAxek1pZUs4MHVpa2tQWTNRamtLN2ErSWRybWJFQm1VNExEY3lFYVFZaUlt?=
 =?utf-8?B?eEpFNFZheHFSZzhWRDkvOGhvblJNMXMzZ3JBSHZJdlNCZGl3b3c0VWlvV3RC?=
 =?utf-8?B?ck12RHYwTWRUamppdDdUQXlkcEFZU3N0VEdqdUtCelkxUTJEWGdtMHRWRWQ2?=
 =?utf-8?B?ZmNuUkN1SWsyTy9ML1Z1TmtINnNWaWhSSTZDN3F0WVRiU0ppVXpQZlJHMWJD?=
 =?utf-8?B?WnNRWXY4cEdqQmtIdlgrUURDRHl0eVNQa1dDVlhhL3hNSjh5UGdVeDdhWklC?=
 =?utf-8?B?Zlc0QlRETE5tQm1KK0hpRkp2eVRJc2dSMFcrNXFmMGp2d3pwUlgwMDR5N0xm?=
 =?utf-8?B?b2NKMnZJekpCNVVwbGY1bG02VnBxV3kxdXYvcm91S01XUHQ4c3NOQnUvOHl3?=
 =?utf-8?B?UFcrSk9RUUtpVEMxN2czbytUUXkzbE91ZDRBcHJTSGdoT2xKcmQvU25tSy93?=
 =?utf-8?B?czFJUUtCVlk4TjFtUUljY2xxcnpxVC9JUWlEakVoWExzT3VoeWZxNWdCN3BS?=
 =?utf-8?B?OWJXY1F0K3lFZWVaZHlSTHF5TFBJTTlxLy9QSUJPVjZEaEk2VmNlVW03N1FM?=
 =?utf-8?B?MGw2QjhjZ1VjQldTWFQ4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE455761610DF846B2829E74C9B7AB83@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c923dbea-d6af-47d4-73f0-08d981af7d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 12:08:16.8509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQx2cFyR9W+8pltCUqBvzNW5tWEm2PqYqVTyGsFmcqIObHDURj3fOxZ0Saip58mrC/8ayQXc7bCuUZ3sRzR2gAOfAoLwgDFq8yc+8YKPJM3mnFLTausjlb87lexv4MCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6884
X-Proofpoint-GUID: 9MuYMjv6HHzU9D-O3jUqFogSkMW3bXZ7
X-Proofpoint-ORIG-GUID: 9MuYMjv6HHzU9D-O3jUqFogSkMW3bXZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270084

DQpPbiAyNy4wOS4yMSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA5LjIwMjEg
MTQ6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IFRoZXJlIGFyZSB0aHJlZSAgb3JpZ2luYXRvcnMgZm9yIHRoZSBQQ0kgY29uZmlndXJhdGlvbiBz
cGFjZSBhY2Nlc3M6DQo+PiAxLiBUaGUgZG9tYWluIHRoYXQgb3ducyBwaHlzaWNhbCBob3N0IGJy
aWRnZTogTU1JTyBoYW5kbGVycyBhcmUNCj4+IHRoZXJlIHNvIHdlIGNhbiB1cGRhdGUgdlBDSSBy
ZWdpc3RlciBoYW5kbGVycyB3aXRoIHRoZSB2YWx1ZXMNCj4+IHdyaXR0ZW4gYnkgdGhlIGhhcmR3
YXJlIGRvbWFpbiwgZS5nLiBwaHlzaWNhbCB2aWV3IG9mIHRoZSByZWdpc3RlcnMNCj4+IHZzIGd1
ZXN0J3MgdmlldyBvbiB0aGUgY29uZmlndXJhdGlvbiBzcGFjZS4NCj4+IDIuIEd1ZXN0IGFjY2Vz
cyB0byB0aGUgcGFzc2VkIHRocm91Z2ggUENJIGRldmljZXM6IHdlIG5lZWQgdG8gcHJvcGVybHkN
Cj4+IG1hcCB2aXJ0dWFsIGJ1cyB0b3BvbG9neSB0byB0aGUgcGh5c2ljYWwgb25lLCBlLmcuIHBh
c3MgdGhlIGNvbmZpZ3VyYXRpb24NCj4+IHNwYWNlIGFjY2VzcyB0byB0aGUgY29ycmVzcG9uZGlu
ZyBwaHlzaWNhbCBkZXZpY2VzLg0KPj4gMy4gRW11bGF0ZWQgaG9zdCBQQ0kgYnJpZGdlIGFjY2Vz
cy4gSXQgZG9lc24ndCBleGlzdCBpbiB0aGUgcGh5c2ljYWwNCj4+IHRvcG9sb2d5LCBlLmcuIGl0
IGNhbid0IGJlIG1hcHBlZCB0byBzb21lIHBoeXNpY2FsIGhvc3QgYnJpZGdlLg0KPj4gU28sIGFs
bCBhY2Nlc3MgdG8gdGhlIGhvc3QgYnJpZGdlIGl0c2VsZiBuZWVkcyB0byBiZSB0cmFwcGVkIGFu
ZA0KPj4gZW11bGF0ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0KPj4g
TmV3IGluIHYyDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgfCAg
MSArDQo+PiAgIHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgODcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0NCj4+ICAgeGVuL2FyY2gvYXJtL3ZwY2kuaCAgICAgICAg
ICAgfCAgMyArKw0KPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDI1ICsrKysr
KysrKysNCj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaCAgICAgfCAgMSArDQo+PiAgIHhl
bi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgIHwgIDEgKw0KPj4gICB4ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaCAgICAgICB8ICAyICsNCj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBpbmRleCBjN2IyNWJjNzA0MzkuLmMw
YWQ2YWQ2ODJkMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBAQCAtNzk3LDYgKzc5Nyw3IEBAIHZvaWQgYXJj
aF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIGdldF9vcmRlcl9mcm9tX2J5dGVzKGQtPmFyY2guZWZpX2FjcGlfbGVuKSk7DQo+PiAg
ICNlbmRpZg0KPj4gICAgICAgZG9tYWluX2lvX2ZyZWUoZCk7DQo+PiArICAgIGRvbWFpbl92cGNp
X2ZyZWUoZCk7DQo+PiAgIH0NCj4+ICAgDQo+PiAgIHZvaWQgYXJjaF9kb21haW5fc2h1dGRvd24o
c3RydWN0IGRvbWFpbiAqZCkNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBjaS5jIGIv
eGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gaW5kZXggMTQ5NDdlOTc1ZDY5Li4wMTJmOTU4OTYwZDEg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vdnBjaS5jDQo+PiBAQCAtMTcsNiArMTcsMTQgQEANCj4+ICAgDQo+PiAgICNkZWZpbmUgUkVH
SVNURVJfT0ZGU0VUKGFkZHIpICAoIChhZGRyKSAmIDB4MDAwMDBmZmYpDQo+PiAgIA0KPj4gK3N0
cnVjdCB2cGNpX21taW9fcHJpdiB7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFNldCB0byB0cnVl
IGlmIHRoZSBNTUlPIGhhbmRsZXJzIHdlcmUgc2V0IHVwIGZvciB0aGUgZW11bGF0ZWQNCj4+ICsg
ICAgICogRUNBTSBob3N0IFBDSSBicmlkZ2UuDQo+PiArICAgICAqLw0KPj4gKyAgICBib29sIGlz
X3ZpcnRfZWNhbTsNCj4+ICt9Ow0KPj4gKw0KPj4gICAvKiBEbyBzb21lIHNhbml0eSBjaGVja3Mu
ICovDQo+PiAgIHN0YXRpYyBib29sIHZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZCh1bnNpZ25lZCBp
bnQgcmVnLCB1bnNpZ25lZCBpbnQgbGVuKQ0KPj4gICB7DQo+PiBAQCAtMzgsNiArNDYsNyBAQCBz
dGF0aWMgaW50IHZwY2lfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5m
bywNCj4+ICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0
YSA9IH4wVUw7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSA9IDFVIDw8IGluZm8tPmRhYnQu
c2l6ZTsNCj4+ICsgICAgc3RydWN0IHZwY2lfbW1pb19wcml2ICpwcml2ID0gKHN0cnVjdCB2cGNp
X21taW9fcHJpdiAqKXA7DQo+PiAgIA0KPj4gICAgICAgc2JkZi5zYmRmID0gTU1DRkdfQkRGKGlu
Zm8tPmdwYSk7DQo+PiAgICAgICByZWcgPSBSRUdJU1RFUl9PRkZTRVQoaW5mby0+Z3BhKTsNCj4+
IEBAIC00NSw2ICs1NCwxMyBAQCBzdGF0aWMgaW50IHZwY2lfbW1pb19yZWFkKHN0cnVjdCB2Y3B1
ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+ICAgICAgIGlmICggIXZwY2lfbW1pb19hY2Nlc3Nf
YWxsb3dlZChyZWcsIHNpemUpICkNCj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiAr
ICAgIC8qDQo+PiArICAgICAqIEZvciB0aGUgcGFzc2VkIHRocm91Z2ggZGV2aWNlcyB3ZSBuZWVk
IHRvIG1hcCB0aGVpciB2aXJ0dWFsIFNCREYNCj4+ICsgICAgICogdG8gdGhlIHBoeXNpY2FsIFBD
SSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91Z2guDQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAo
IHByaXYtPmlzX3ZpcnRfZWNhbSAmJiAhcGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZSh2LCAm
c2JkZikgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiAxOw0KPj4gKw0KPj4gICAgICAgZGF0YSA9
IHZwY2lfcmVhZChzYmRmLCByZWcsIG1pbig0dSwgc2l6ZSkpOw0KPj4gICAgICAgaWYgKCBzaXpl
ID09IDggKQ0KPj4gICAgICAgICAgIGRhdGEgfD0gKHVpbnQ2NF90KXZwY2lfcmVhZChzYmRmLCBy
ZWcgKyA0LCA0KSA8PCAzMjsNCj4+IEBAIC02MSw2ICs3Nyw3IEBAIHN0YXRpYyBpbnQgdnBjaV9t
bWlvX3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+ICAgICAgIHBj
aV9zYmRmX3Qgc2JkZjsNCj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0YSA9IHI7DQo+PiAgICAg
ICB1bnNpZ25lZCBpbnQgc2l6ZSA9IDFVIDw8IGluZm8tPmRhYnQuc2l6ZTsNCj4+ICsgICAgc3Ry
dWN0IHZwY2lfbW1pb19wcml2ICpwcml2ID0gKHN0cnVjdCB2cGNpX21taW9fcHJpdiAqKXA7DQo+
PiAgIA0KPj4gICAgICAgc2JkZi5zYmRmID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7DQo+PiAgICAg
ICByZWcgPSBSRUdJU1RFUl9PRkZTRVQoaW5mby0+Z3BhKTsNCj4+IEBAIC02OCw2ICs4NSwxMyBA
QCBzdGF0aWMgaW50IHZwY2lfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3Qg
KmluZm8sDQo+PiAgICAgICBpZiAoICF2cGNpX21taW9fYWNjZXNzX2FsbG93ZWQocmVnLCBzaXpl
KSApDQo+PiAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgIA0KPj4gKyAgICAvKg0KPj4gKyAgICAg
KiBGb3IgdGhlIHBhc3NlZCB0aHJvdWdoIGRldmljZXMgd2UgbmVlZCB0byBtYXAgdGhlaXIgdmly
dHVhbCBTQkRGDQo+PiArICAgICAqIHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNlIGJlaW5nIHBh
c3NlZCB0aHJvdWdoLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCBwcml2LT5pc192aXJ0X2Vj
YW0gJiYgIXBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2UodiwgJnNiZGYpICkNCj4+ICsgICAg
ICAgICAgICByZXR1cm4gMTsNCj4+ICsNCj4+ICAgICAgIHZwY2lfd3JpdGUoc2JkZiwgcmVnLCBt
aW4oNHUsIHNpemUpLCBkYXRhKTsNCj4+ICAgICAgIGlmICggc2l6ZSA9PSA4ICkNCj4+ICAgICAg
ICAgICB2cGNpX3dyaXRlKHNiZGYsIHJlZyArIDQsIDQsIGRhdGEgPj4gMzIpOw0KPj4gQEAgLTgw
LDEzICsxMDQsNDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtbWlvX2hhbmRsZXJfb3BzIHZwY2lf
bW1pb19oYW5kbGVyID0gew0KPj4gICAgICAgLndyaXRlID0gdnBjaV9tbWlvX3dyaXRlLA0KPj4g
ICB9Ow0KPj4gICANCj4+ICsvKg0KPj4gKyAqIFRoZXJlIGFyZSB0aHJlZSAgb3JpZ2luYXRvcnMg
Zm9yIHRoZSBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSBhY2Nlc3M6DQo+PiArICogMS4gVGhlIGRv
bWFpbiB0aGF0IG93bnMgcGh5c2ljYWwgaG9zdCBicmlkZ2U6IE1NSU8gaGFuZGxlcnMgYXJlDQo+
PiArICogICAgdGhlcmUgc28gd2UgY2FuIHVwZGF0ZSB2UENJIHJlZ2lzdGVyIGhhbmRsZXJzIHdp
dGggdGhlIHZhbHVlcw0KPj4gKyAqICAgIHdyaXR0ZW4gYnkgdGhlIGhhcmR3YXJlIGRvbWFpbiwg
ZS5nLiBwaHlzaWNhbCB2aWV3IG9mIHRoZSByZWdpc3RlcnMvDQo+PiArICogICAgY29uZmlndXJh
dGlvbiBzcGFjZS4NCj4+ICsgKiAyLiBHdWVzdCBhY2Nlc3MgdG8gdGhlIHBhc3NlZCB0aHJvdWdo
IFBDSSBkZXZpY2VzOiB3ZSBuZWVkIHRvIHByb3Blcmx5DQo+PiArICogICAgbWFwIHZpcnR1YWwg
YnVzIHRvcG9sb2d5IHRvIHRoZSBwaHlzaWNhbCBvbmUsIGUuZy4gcGFzcyB0aGUgY29uZmlndXJh
dGlvbg0KPj4gKyAqICAgIHNwYWNlIGFjY2VzcyB0byB0aGUgY29ycmVzcG9uZGluZyBwaHlzaWNh
bCBkZXZpY2VzLg0KPj4gKyAqIDMuIEVtdWxhdGVkIGhvc3QgUENJIGJyaWRnZSBhY2Nlc3MuIEl0
IGRvZXNuJ3QgZXhpc3QgaW4gdGhlIHBoeXNpY2FsDQo+PiArICogICAgdG9wb2xvZ3ksIGUuZy4g
aXQgY2FuJ3QgYmUgbWFwcGVkIHRvIHNvbWUgcGh5c2ljYWwgaG9zdCBicmlkZ2UuDQo+PiArICog
ICAgU28sIGFsbCBhY2Nlc3MgdG8gdGhlIGhvc3QgYnJpZGdlIGl0c2VsZiBuZWVkcyB0byBiZSB0
cmFwcGVkIGFuZA0KPj4gKyAqICAgIGVtdWxhdGVkLg0KPj4gKyAqLw0KPj4gICBzdGF0aWMgaW50
IHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdl
KQ0KPj4gICB7DQo+PiAtICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqY2ZnID0gYnJpZGdl
LT5jZmc7DQo+PiArICAgIHN0cnVjdCB2cGNpX21taW9fcHJpdiAqcHJpdjsNCj4+ICsNCj4+ICsg
ICAgcHJpdiA9IHh6YWxsb2Moc3RydWN0IHZwY2lfbW1pb19wcml2KTsNCj4+ICsgICAgaWYgKCAh
cHJpdiApDQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsgICAgcHJpdi0+
aXNfdmlydF9lY2FtID0gIWlzX2hhcmR3YXJlX2RvbWFpbihkKTsNCj4+ICAgDQo+PiAtICAgIHJl
Z2lzdGVyX21taW9faGFuZGxlcihkLCAmdnBjaV9tbWlvX2hhbmRsZXIsDQo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLCBOVUxMKTsNCj4+ICsg
ICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBz
dHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+Y2ZnOw0KPj4gKw0KPj4gKyAg
ICAgICAgYnJpZGdlLT5tbWlvX3ByaXYgPSBwcml2Ow0KPj4gKyAgICAgICAgcmVnaXN0ZXJfbW1p
b19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFuZGxlciwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHByaXYpOw0KPj4gKyAgICB9DQo+PiArICAgIGVsc2UNCj4+ICsgICAg
ew0KPj4gKyAgICAgICAgZC0+dnBjaV9tbWlvX3ByaXYgPSBwcml2Ow0KPj4gKyAgICAgICAgLyog
R3Vlc3QgZG9tYWlucyB1c2Ugd2hhdCBpcyBwcm9ncmFtbWVkIGluIHRoZWlyIGRldmljZSB0cmVl
LiAqLw0KPj4gKyAgICAgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFu
ZGxlciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9WUENJX0VDQU1f
QkFTRSwgR1VFU1RfVlBDSV9FQ0FNX1NJWkUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHJpdik7DQo+PiArICAgIH0NCj4+ICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAg
IA0KPj4gQEAgLTk1LDEzICsxNTQsMTYgQEAgaW50IGRvbWFpbl92cGNpX2luaXQoc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgICAgIGlmICggIWhhc192cGNpKGQpICkNCj4+ICAgICAgICAgICByZXR1
cm4gMDsNCj4+ICAgDQo+PiAtICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+IC0g
ICAgICAgIHJldHVybiBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoZCwgdnBjaV9zZXR1cF9tbWlv
X2hhbmRsZXIpOw0KPj4gLQ0KPj4gLSAgICAvKiBHdWVzdCBkb21haW5zIHVzZSB3aGF0IGlzIHBy
b2dyYW1tZWQgaW4gdGhlaXIgZGV2aWNlIHRyZWUuICovDQo+PiAtICAgIHJlZ2lzdGVyX21taW9f
aGFuZGxlcihkLCAmdnBjaV9tbWlvX2hhbmRsZXIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICBHVUVTVF9WUENJX0VDQU1fQkFTRSwgR1VFU1RfVlBDSV9FQ0FNX1NJWkUsIE5VTEwpOw0K
Pj4gKyAgICByZXR1cm4gcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKGQsIHZwY2lfc2V0dXBfbW1p
b19oYW5kbGVyKTsNCj4+ICt9DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgZG9tYWluX3ZwY2lfZnJl
ZV9jYihzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UpDQo+PiArew0KPj4gKyAgICBpZiAoIGlz
X2hhcmR3YXJlX2RvbWFpbihkKSApDQo+PiArICAgICAgICBYRlJFRShicmlkZ2UtPm1taW9fcHJp
dik7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgICAgIFhGUkVFKGQtPnZwY2lfbW1pb19wcml2KTsN
Cj4+ICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gQEAgLTEyNCw2ICsxODYsMTMg
QEAgaW50IGRvbWFpbl92cGNpX2dldF9udW1fbW1pb19oYW5kbGVycyhzdHJ1Y3QgZG9tYWluICpk
KQ0KPj4gICAgICAgcmV0dXJuIGNvdW50Ow0KPj4gICB9DQo+PiAgIA0KPj4gK3ZvaWQgZG9tYWlu
X3ZwY2lfZnJlZShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCAhaGFzX3Zw
Y2koZCkgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBwY2lfaG9zdF9pdGVy
YXRlX2JyaWRnZXMoZCwgZG9tYWluX3ZwY2lfZnJlZV9jYik7DQo+PiArfQ0KPj4gICAvKg0KPj4g
ICAgKiBMb2NhbCB2YXJpYWJsZXM6DQo+PiAgICAqIG1vZGU6IEMNCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vdnBjaS5oIGIveGVuL2FyY2gvYXJtL3ZwY2kuaA0KPj4gaW5kZXggMjdhMmIw
NjlhYmQyLi4zOGU1YTI4YzBkOTUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBjaS5o
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5oDQo+PiBAQCAtMTgsNiArMTgsNyBAQA0KPj4g
ICAjaWZkZWYgQ09ORklHX0hBU19WUENJDQo+PiAgIGludCBkb21haW5fdnBjaV9pbml0KHN0cnVj
dCBkb21haW4gKmQpOw0KPj4gICBpbnQgZG9tYWluX3ZwY2lfZ2V0X251bV9tbWlvX2hhbmRsZXJz
KHN0cnVjdCBkb21haW4gKmQpOw0KPj4gK3ZvaWQgZG9tYWluX3ZwY2lfZnJlZShzdHJ1Y3QgZG9t
YWluICpkKTsNCj4+ICAgI2Vsc2UNCj4+ICAgc3RhdGljIGlubGluZSBpbnQgZG9tYWluX3ZwY2lf
aW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICB7DQo+PiBAQCAtMjgsNiArMjksOCBAQCBzdGF0
aWMgaW5saW5lIGludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMoc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgew0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICsNCj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgZG9tYWluX3ZwY2lfZnJlZShzdHJ1Y3QgZG9tYWluICpkKSB7IH0N
Cj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gICAjZW5kaWYgLyogX19BUkNIX0FSTV9WUENJX0hfXyAq
Lw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IGluZGV4IDQ1NTJhY2U4NTVlMC4uNTc5YzY5NDdj
YzM1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBAQCAtODkwLDYgKzg5MCwzMSBA
QCBpbnQgcGNpX3JlbW92ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0K
Pj4gKy8qDQo+PiArICogRmluZCB0aGUgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0
byB0aGUgdmlydHVhbCBkZXZpY2UNCj4+ICsgKiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0
byB0aGUgcGh5c2ljYWwgb25lLg0KPj4gKyAqLw0KPj4gK2Jvb2wgcGNpX3RyYW5zbGF0ZV92aXJ0
dWFsX2RldmljZShzdHJ1Y3QgdmNwdSAqdiwgcGNpX3NiZGZfdCAqc2JkZikNCj4gV2h5IHN0cnVj
dCB2Y3B1LCB3aGVuIHlvdSBvbmx5IG5lZWQgLi4uDQo+DQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
ZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiAuLi4gdGhpcz8gSXQncyBhbHNvIG5vdCByZWFsbHkg
bG9naWNhbCBmb3IgdGhpcyBmdW5jdGlvbiB0byB0YWtlIGENCj4gc3RydWN0IHZjcHUsIGFzIHRo
ZSB0cmFuc2xhdGlvbiBzaG91bGQgYmUgdW5pZm9ybSB3aXRoaW4gYSBkb21haW4uDQpBZ3JlZSwg
c3RydWN0IGRvbWFpbiBpcyBqdXN0IGVub3VnaA0KPg0KPiBBbHNvIC0gY29uc3QgcGxlYXNlIChh
cyBzYWlkIGVsc2V3aGVyZSBiZWZvcmUsIGlkZWFsbHkgd2hlcmV2ZXIgcG9zc2libGUNCj4gYW5k
IHNlbnNpYmxlKS4NCk9rDQo+DQo+PiArICAgIHN0cnVjdCB2cGNpX2RldiAqdmRldjsNCj4+ICsg
ICAgYm9vbCBmb3VuZCA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBwY2lkZXZzX2xvY2soKTsNCj4+
ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2X2xpc3QsIGxpc3QgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIHZkZXYtPnNiZGYuc2JkZiA9PSBzYmRmLT5zYmRm
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAvKiBSZXBsYWNlIHZpcnR1YWwgU0JE
RiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+PiArICAgICAgICAgICAgKnNiZGYgPSB2ZGV2
LT5wZGV2LT5zYmRmOw0KPj4gKyAgICAgICAgICAgIGZvdW5kID0gdHJ1ZTsNCj4+ICsgICAgICAg
ICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPiBGb3IgYSBEb21VIHdpdGgg
anVzdCBvbmUgb3IgYXQgbW9zdCBhIGNvdXBsZSBvZiBkZXZpY2VzLCBzdWNoIGEgYnJ1dGUNCj4g
Zm9yY2UgbG9va3VwIG1heSBiZSBmaW5lLiBXaGF0IGFib3V0IERvbTAgdGhvdWdoPyBUaGUgcGh5
c2ljYWwgdG9wb2xvZ3kNCj4gZ2V0cyBzcGxpdCBhdCB0aGUgc2VnbWVudCBsZXZlbCwgc28gbWF5
YmUgdGhpcyB3b3VsZCBieSBhIHJlYXNvbmFibGUNCj4gZ3JhbnVsYXJpdHkgaGVyZSBhcyB3ZWxs
Pw0KDQpOb3Qgc3VyZSBJIGFtIGZvbGxvd2luZyB3aHkgdG9wb2xvZ3kgbWF0dGVycyBoZXJlLiBX
ZSBhcmUganVzdCB0cnlpbmcgdG8NCg0KbWF0Y2ggb25lIFNCREYgKGFzIHNlZW4gYnkgdGhlIGd1
ZXN0KSB0byBvdGhlciBTQkRGIChwaHlzaWNhbCwNCg0KYXMgc2VlbiBieSBEb20wKSwgc28gd2Ug
Y2FuIHByb3h5IERvbVUncyBjb25maWd1cmF0aW9uIHNwYWNlIGFjY2Vzcw0KDQp0byB0aGUgcHJv
cGVyIGRldmljZSBpbiBEb20wLg0KDQo+DQo+PiArICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+PiAr
ICAgIHJldHVybiBmb3VuZDsNCj4gTml0OiBCbGFuayBsaW5lIHBsZWFzZSBhaGVhZCBvZiB0aGUg
bWFpbiAicmV0dXJuIiBvZiBhIGZ1bmN0aW9uLg0KU3VyZQ0KPg0KPj4gK30NCj4+ICsNCj4+ICAg
LyogQ2FsbGVyIHNob3VsZCBob2xkIHRoZSBwY2lkZXZzX2xvY2sgKi8NCj4+ICAgc3RhdGljIGlu
dCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3Qgc2VnLCB1aW50OF90
IGJ1cywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBkZXZmbikNCj4g
U2VlaW5nIHRoaXMgZnVuY3Rpb24gaW4gY29udGV4dCAod2hpY2ggcGF0Y2ggMiBhZGRzIHdpdGhv
dXQgYW55ICNpZmRlZg0KPiBhcm91bmQgaXQgYWZhaWNzKSwNCg0KSSBiZWxpZXZlIHlvdSBhcmUg
dGFsa2luZyBhYm91dCB2cGNpX2RlYXNzaWduX2RldmljZSBoZXJlDQoNCnZwY2lfe2Fzc2lnbnxk
ZWFzc2lnbn1fZGV2aWNlIHNlZW0gdG8gYmUgbm90IGNhbGxlZCBvbiB4ODYgUFZIIGFzIG9mIG5v
dywNCg0KdGhpcyBpcyB0cnVlLg0KDQo+ICAgd2lsbCB0aGlzIG5ldyBmdW5jdGlvbiBuZWVkbGVz
c2x5IGJlIGJ1aWx0IG9uIHg4NiBhcw0KPiB3ZWxsPw0KDQpJdCB3aWxsIGF0IHRoZSBtb21lbnQu
IEJ1dCBpbiBvcmRlciB0byBhdm9pZCBpZmRlZmVyeSBJIHdvdWxkIGxpa2UNCg0KdG8gc3RpbGwg
aW1wbGVtZW50IGl0IGFzIGFuIGVtcHR5IGZ1bmN0aW9uIGZvciB4ODYuDQoNCj4gICAoSSBkaWRu
J3QgbG9vayBhdCBvdGhlciBpbnRlcm1lZGlhdGUgcGF0Y2hlcyB5ZXQsIHNvIHBsZWFzZQ0KPiBm
b3JnaXZlIGlmIEkndmUgbWlzc2VkIHRoZSBhZGRpdGlvbiBvZiBhbiAjaWZkZWYuKQ0KDQpTbywg
SSBjYW4gZ2F0ZSB0aGlzIHdpdGggSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCBpbiBwYXRjaCAyDQoN
CihIQVNfVlBDSV9HVUVTVF9TVVBQT1JUIGlzIGludHJvZHVjZWQgaW4gcGF0Y2ggNCwgc28gSSds
bCBtb3ZlIGl0IHRvIDIpDQoNCkRvZXMgdGhpcyBzb3VuZCBnb29kPw0KDQo+DQo+IEphbg0KPg0K
VGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

