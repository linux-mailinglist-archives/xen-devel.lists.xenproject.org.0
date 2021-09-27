Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF94195E2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196913.349820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrEz-0008Sx-Mn; Mon, 27 Sep 2021 14:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196913.349820; Mon, 27 Sep 2021 14:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrEz-0008Qq-Ig; Mon, 27 Sep 2021 14:04:21 +0000
Received: by outflank-mailman (input) for mailman id 196913;
 Mon, 27 Sep 2021 14:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUrEy-0008Qk-OF
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:04:20 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf077c54-1f9b-11ec-bc4c-12813bfff9fa;
 Mon, 27 Sep 2021 14:04:19 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RDvg4q026454; 
 Mon, 27 Sep 2021 14:04:17 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbf7b81xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 14:04:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7348.eurprd03.prod.outlook.com (2603:10a6:20b:269::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 14:04:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 14:04:14 +0000
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
X-Inumbo-ID: cf077c54-1f9b-11ec-bc4c-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTbzCzfH0B2P2OMk3QsNQzUqqM6vmglFhskXtKdnE2qmJ+pICWreVS2oRbEECvY7ag5MvUQWX048MnveN0MSQ5GLad3maEmu1HKOCMxN/cP9EqRir6NBLpOrbFi7PPktuaKTrWt1gauJtzc7PiR4UdGQGjWJ7M+QJlNBr0+txy4MVMg/2ru1LPi1LyeIE/7WHGmS4TtJ2H/LjyKJRLRmu6zB1zrRLPuSybqqmo+NEro6j9ArsuEIg2nICQF/QjK7gjt4r1ApcgVgBM0ro6gXIo5NJUOupnWrzzV6oA8u+HkeXPiL2ivz9W/7UevDrbEw2DG7f1kif7NW/0UmLAU2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+DEs6HovYwf86RRm/8PDLsyZPeEeRbHRTAHLb4SPBZQ=;
 b=FvsG56pTBqRRhZghITKVYxOUMSjT9vkvHm7UJRVw6UAkIw8elsIDeB9DLM92dJgts8H+FEgz62GQ1SMYkhwPHFkKYyC9V8Ert+1x5BU76G9iQ1Qd9ZQ0V9ZRic2psMKumH1eHKGTpSSd3WGJjS8BXe1n+lrrwbkdviuBPkwxD1fdaM8R1uapD+PBC5ubZulCTei3c7sKlu5cvy5sVT+fYcT8dsokdSbixOEoM6kZHOViy8Xplvqap+dZ43rlWIWz4WJIb3age3jqV3QGZn6B+cfMI08xdlvWyt7Fvu3WYKjyurBmZthEAIouKWwWkkyzfjPOQRJFm7uez0n5isl0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DEs6HovYwf86RRm/8PDLsyZPeEeRbHRTAHLb4SPBZQ=;
 b=1CNPyVtw5JmAZj/6rOwbu7aWP8EQYiEZhYXUSeSJoHRYo9IQSKSVYKwuZnyeC3RN77Md9+k3kcksPJpVxiQQ6pi9fFhF1CqWh6H7xaDN05vRxRJx7tUrpfcXmWgOlRkfUZdw43DyCMWwauVGfBOBj5lH4okGtyhoHbhCxonzk4f15hPLz3oWpDsdW0tkpFcNiRMuHAjQEiu3eRdgeGFusym5xaGs8e1TipxJ3B0rYjlWy1xhdKWiQWRtYsyxSKfS08s9w5GK9j3keX/mVdF+RjvvL88CZutcvCAotQecabT2BgYK5k835pqpMzBYPZOvMkUvqLXJLbKsMbry3HnXVQ==
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
Thread-Index: 
 AQHXsHpEqeYVqdD8fU+X35KPuXAnA6u3xY6AgAAKMQCAABgZgIAAAowAgAACGoCAAAOoAA==
Date: Mon, 27 Sep 2021 14:04:14 +0000
Message-ID: <e0ee94e4-4076-ac51-f5a8-d895220d1522@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
 <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
 <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
 <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
 <299f330a-3a99-e87a-d182-762247371e3d@suse.com>
In-Reply-To: <299f330a-3a99-e87a-d182-762247371e3d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 515fe925-83d2-4b8e-600f-08d981bfb06d
x-ms-traffictypediagnostic: AM9PR03MB7348:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7348E848C5A76FB6578D66BAE7A79@AM9PR03MB7348.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tCbsHXhCDwNuekN6Hfb+76Jvl4IKvCFtC7hJcLnABhZthkgXlq6DtOJ2USVtYyuoUoaKziVY3Ed0DqLssxnanhPqk6ZNzk3ZONORce7StyeqqCL6FOLrUzKNXAaksnxxKQfIGvCvwH93KlAKv8CpJ5yQxuUXolxWpD6kEyh+xELvmKMgtFNn6htTVHpb0x8K8rQt52XaMKKNCliegAiz8GH+FqfU9dWTXbwvivuww2/8+cutXzfhmj801/+FBFaNJKkTR4tOwp0p3HW+IgYmOcWsAgSVLFO27g6HHJWOU5NFsZlRZM6D/arYrX+EgpEXcTphijM5rZXdmr9MRr8dllgTlXKexu77YqeHsvfRt5AB59rt3wTeADhX8v20I+QrD72JlX6X7TCC2tP3eLG/ybOEwir1NMmRRfnfYw8LlOAmpN7n1vTWGQrQRT/q/042yU/Atk00xPc+BtC7Ia0ZBekHKKAbtFORk1p24RsVDsPlUZW0VCIO6dQ/bmDBdEa/fbrrDQwCVxsbCXikF9tCYY6duyrD2calrjrGK9d7KTc+Rl4FFvM+7n0wTBRITC8zYZ2Cjm/La3kZgmiEjk4xSIAW2xmQ46MNG8IY864JI9XWe7HDJs3SdBZO1Kyb1lJH2cQ+Gj3uVqBd/QZd8LGCMg1kbK9kMNngFzmaFsZ/n039ufZIrFh1KJ1gU4a/yTJz0bSJa4cT0UoHz+SrVf6CcYO8lECC5mkRQU4ErB/uDqVXqKSv8M1tTcGQ2IsEKLrY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(31696002)(54906003)(508600001)(53546011)(4326008)(71200400001)(31686004)(36756003)(66556008)(64756008)(86362001)(66946007)(66446008)(2616005)(6916009)(66476007)(91956017)(2906002)(76116006)(6512007)(38100700002)(107886003)(122000001)(8936002)(5660300002)(316002)(83380400001)(8676002)(38070700005)(6506007)(55236004)(6486002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjFWR3JlUElMam9yQ3kzaWNHYSthRUhzR3NPRkNQY3FaUTdlZjl6V1RRSWVY?=
 =?utf-8?B?S3Y1QmlZWnMreDVFZG5PVmdYbGw4MDNtY3FUZi9NM1A2Y092Q3MxNWhPb21K?=
 =?utf-8?B?M3RQM1hmelVRV2h6dGc3REc2R2tESGk1Z21DbFRTdTYrU2RrenBuaU1idU5p?=
 =?utf-8?B?ZWpEZXFMVmp6aWJwMFlaWlMxZ3RYQUl2eHJCUklzbFBZR2lGd1l3cUxoT1VF?=
 =?utf-8?B?SnV2K1BYQURHZzlzakc5QlRWMnJoMURPTTYwREdpMXFHb1F0NVJwdlorc1ph?=
 =?utf-8?B?bXh5WEpPTjJ6dUc4R3gzVEtPR1pDeWY5bEpCeGMyK0JlZXFHUUpiOUI4am42?=
 =?utf-8?B?TjBRZHlkOXlBMzdJaytpUEhHVjZjdXZQNFA0ZzJwMlVVZjdLbW44a3dIL1lI?=
 =?utf-8?B?OGFjWUl5TGlwMEY3b3IrdkpGaDQ1QURUcDR4alVQWktzU0NHSjN2dGRRQksv?=
 =?utf-8?B?Tkd0cFR5MzhML0xVRVZ5OERoSGQ5SGh3bk9CYnZrQWw4aUp0UXF1NksvcDBC?=
 =?utf-8?B?c1NMU3o4T1ZkeCtvN1hQeEtJYWczUThjYWxxandMSm5pWEwvUkZTTWhPVE9a?=
 =?utf-8?B?VVlDbmRKNDA4ZDBxQXpuaDNpNEx4UkZhZTJ6YS9iQlYyVGxZbHhyWGQ0Q1hF?=
 =?utf-8?B?WTdYV0RySE80Rm5LcjZyclJqaW94RW5FczRhTkZUU3l5N0thRlpKcVk1VWR5?=
 =?utf-8?B?Rjc0dlNPMTZwVUhZT0hFNjcyczZQUHRydHRaT1lwc1NSNlpDTzQ2ZVJvOUR2?=
 =?utf-8?B?dEdIcTJEd1BMSzVwR0lSRmdlK2FHMktWV1lDR1FQTUxOUDFSZUdMckZDaGZ0?=
 =?utf-8?B?dHB0UDhvTU1wYXRubERnazQ5eVFaR2Jzbkp2bEFER1UzNWRheUZUR0oyNVNI?=
 =?utf-8?B?VkRsRkNvZ3dTQ0t6dGZNTHhEWjRwUW9xZ2dnVnlhUTNqY0xGWUdlWUJSaENL?=
 =?utf-8?B?L0tLTTVmV0Jxa1NxSU1NS0ZKMkRoeVI1WFpMRTJxaW9DeWFEc0ZRc0hsMXNn?=
 =?utf-8?B?NWpNOVk5MVlqdFNYZ3JBa01BdVFvMTBydWlja25RL0VnZHFVYkVKUUR1clRD?=
 =?utf-8?B?T1NwQUVIU2lSd1NpRkNrUjFocW5udjdXTW4xcnBDT3Q3ZGQvTGlhMDlyZG1m?=
 =?utf-8?B?TXhkOWlvSVM1c3Z4ZlZaRi9PbjYxM2lGMlRXQVBrdytOUTI2ZnpwaEVtYlk4?=
 =?utf-8?B?Y0tKb2lQODR5aDFNVkVzTjhoT1k0blVpbHE4Unp0YTc3aWtFQVBvNlBzSXZD?=
 =?utf-8?B?aUFoRGpPeENSRnBieUxzWmJqQk1NSVRmNHM0dUhZcVE5enFkeTNUVXhEd3RZ?=
 =?utf-8?B?WEZiZ25yRE81RCs3SEtoUHdXQmNSRGRSRXlMTWxFMGVFdkYxS3JsRmREN0tQ?=
 =?utf-8?B?a1lzMnoydTNoRHVvYW8xOUl2WGtuTHk1WDVkZHlYOG5XS0p0d0ZCazlacWlz?=
 =?utf-8?B?bTVFU0xJKyszUnVOT3RCMlRMb0JDbFlvZTl1SXZmWUhaZmRFM0FMN2FUV2tu?=
 =?utf-8?B?c2JVM09vczR5c1pxTEc2UjA3SE15cG1KY2haSk1RYTFpUW9MeWsvaktQT015?=
 =?utf-8?B?a2RiNmNONkhNblR5cDZZOUI4UitCT1c3Qkthc2JseGJObGZmb0tvU1AzM0w3?=
 =?utf-8?B?cVdVeXhIbUc5QXdKRFZpNytCdGpWM3l4WHBrYmlIMzdieDRTWlpsMHlNQzdp?=
 =?utf-8?B?MFcyYXhDdnF1cHBoYjlqR3MxYTlXdjYyZU1RT2c4b0NDWEE1THQ4ODJKQkkw?=
 =?utf-8?B?L2I1anErdWtSektFVlU4c2FpUllLUWJqa2FQZlV6TFRhalIxbkRrcWZiWDFB?=
 =?utf-8?B?SklNSElnYXdXY1B4UmhVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBAC5BFC898A714C806343DC845CD875@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515fe925-83d2-4b8e-600f-08d981bfb06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 14:04:14.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFb2n9PcnEufTmnJrtwoU2eFWvb4uHMkuP77R6tmqK2AZlNszy6ZcZkJ1Jsbmo6daSsQkJOwBGYGr4fY9dnWfUSVZsRgWi2bdhz1AkE3Jq+kBnDhY7LOrrNzH0LxIL0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7348
X-Proofpoint-GUID: -y-eHXSI7zKmulu6792kg_uQ7YbC-Uo8
X-Proofpoint-ORIG-GUID: -y-eHXSI7zKmulu6792kg_uQ7YbC-Uo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270097

DQpPbiAyNy4wOS4yMSAxNjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTU6NDMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTY6
MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIwMjEgMTQ6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxNDozMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyMy4wOS4yMDIxIDE0OjU1LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0K
Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4gQEAgLTg5
MCw2ICs4OTAsMzEgQEAgaW50IHBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4gICAgICAgICByZXR1cm4g
MDsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICANCj4+Pj4+PiArLyoNCj4+Pj4+PiArICogRmlu
ZCB0aGUgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0byB0aGUgdmlydHVhbCBkZXZp
Y2UNCj4+Pj4+PiArICogYW5kIHRyYW5zbGF0ZSB2aXJ0dWFsIFNCREYgdG8gdGhlIHBoeXNpY2Fs
IG9uZS4NCj4+Pj4+PiArICovDQo+Pj4+Pj4gK2Jvb2wgcGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2Rl
dmljZShzdHJ1Y3QgdmNwdSAqdiwgcGNpX3NiZGZfdCAqc2JkZikNCj4+Pj4+IFdoeSBzdHJ1Y3Qg
dmNwdSwgd2hlbiB5b3Ugb25seSBuZWVkIC4uLg0KPj4+Pj4NCj4+Pj4+PiArew0KPj4+Pj4+ICsg
ICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsNCj4+Pj4+IC4uLiB0aGlzPyBJdCdzIGFs
c28gbm90IHJlYWxseSBsb2dpY2FsIGZvciB0aGlzIGZ1bmN0aW9uIHRvIHRha2UgYQ0KPj4+Pj4g
c3RydWN0IHZjcHUsIGFzIHRoZSB0cmFuc2xhdGlvbiBzaG91bGQgYmUgdW5pZm9ybSB3aXRoaW4g
YSBkb21haW4uDQo+Pj4+IEFncmVlLCBzdHJ1Y3QgZG9tYWluIGlzIGp1c3QgZW5vdWdoDQo+Pj4+
PiBBbHNvIC0gY29uc3QgcGxlYXNlIChhcyBzYWlkIGVsc2V3aGVyZSBiZWZvcmUsIGlkZWFsbHkg
d2hlcmV2ZXIgcG9zc2libGUNCj4+Pj4+IGFuZCBzZW5zaWJsZSkuDQo+Pj4+IE9rDQo+Pj4+Pj4g
KyAgICBzdHJ1Y3QgdnBjaV9kZXYgKnZkZXY7DQo+Pj4+Pj4gKyAgICBib29sIGZvdW5kID0gZmFs
c2U7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgcGNpZGV2c19sb2NrKCk7DQo+Pj4+Pj4gKyAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5ICggdmRldiwgJmQtPnZkZXZfbGlzdCwgbGlzdCApDQo+Pj4+Pj4g
KyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgaWYgKCB2ZGV2LT5zYmRmLnNiZGYgPT0gc2JkZi0+c2Jk
ZiApDQo+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+ICsgICAgICAgICAgICAvKiBSZXBsYWNlIHZp
cnR1YWwgU0JERiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+Pj4+Pj4gKyAgICAgICAgICAg
ICpzYmRmID0gdmRldi0+cGRldi0+c2JkZjsNCj4+Pj4+PiArICAgICAgICAgICAgZm91bmQgPSB0
cnVlOw0KPj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+PiArICAgICAgICB9DQo+Pj4+
Pj4gKyAgICB9DQo+Pj4+PiBGb3IgYSBEb21VIHdpdGgganVzdCBvbmUgb3IgYXQgbW9zdCBhIGNv
dXBsZSBvZiBkZXZpY2VzLCBzdWNoIGEgYnJ1dGUNCj4+Pj4+IGZvcmNlIGxvb2t1cCBtYXkgYmUg
ZmluZS4gV2hhdCBhYm91dCBEb20wIHRob3VnaD8gVGhlIHBoeXNpY2FsIHRvcG9sb2d5DQo+Pj4+
PiBnZXRzIHNwbGl0IGF0IHRoZSBzZWdtZW50IGxldmVsLCBzbyBtYXliZSB0aGlzIHdvdWxkIGJ5
IGEgcmVhc29uYWJsZQ0KPj4+Pj4gZ3JhbnVsYXJpdHkgaGVyZSBhcyB3ZWxsPw0KPj4+PiBOb3Qg
c3VyZSBJIGFtIGZvbGxvd2luZyB3aHkgdG9wb2xvZ3kgbWF0dGVycyBoZXJlLiBXZSBhcmUganVz
dCB0cnlpbmcgdG8NCj4+Pj4gbWF0Y2ggb25lIFNCREYgKGFzIHNlZW4gYnkgdGhlIGd1ZXN0KSB0
byBvdGhlciBTQkRGIChwaHlzaWNhbCwNCj4+Pj4gYXMgc2VlbiBieSBEb20wKSwgc28gd2UgY2Fu
IHByb3h5IERvbVUncyBjb25maWd1cmF0aW9uIHNwYWNlIGFjY2Vzcw0KPj4+PiB0byB0aGUgcHJv
cGVyIGRldmljZSBpbiBEb20wLg0KPj4+IFRvcG9sb2d5IGhlcmUgbWF0dGVycyBvbmx5IGluIHNv
IGZhciBhcyBJJ3ZlIHN1Z2dlc3RlZCB0byBoYXZlIHNlcGFyYXRlDQo+Pj4gbGlzdHMgcGVyIHNl
Z21lbnQsIHRvIHJlZHVjZSBsb29rIHRpbWVzLiBPdGhlciBtZXRob2RzIG9mIGF2b2lkaW5nIGEN
Cj4+PiBmdWxseSBsaW5lYXIgc2VhcmNoIGFyZSBvZiBjb3Vyc2UgcG9zc2libGUgYXMgd2VsbC4N
Cj4+IEFoLCB3aXRoIHRoYXQgdGhhdCByZXNwZWN0IHRoZW4gb2YgY291cnNlLiBCdXQgbGV0J3Mg
YmUgcmVhbGlzdGljLg0KPj4gSG93IG1hbnkgUENJIGRldmljZXMgYXJlIG5vcm1hbGx5IHBhc3Nl
ZCB0aHJvdWdoIHRvIGEgZ3Vlc3Q/DQo+PiBJIGNhbiBhc3N1bWUgdGhpcyBpcyBwcm9iYWJseSBs
ZXNzIHRoYW4gMTAgbW9zdCBvZiB0aGUgdGltZS4NCj4+IEJ5IGFzc3VtaW5nIHRoYXQgdGhlIG51
bWJlciBvZiBkZXZpY2VzIGlzIHNtYWxsIEkgc2VlIG5vIHByb2ZpdCwNCj4+IGJ1dCB1bm5lZWRl
ZCBjb21wbGV4aXR5IGluIGFjY291bnRpbmcgdmlydHVhbCBkZXZpY2VzIHBlciBzZWdtZW50DQo+
PiBhbmQgcGVyZm9ybWluZyB0aGUgcmVsZXZhbnQgbG9va3VwLiBTbywgSSB3b3VsZCBnbyB3aXRo
IGEgc2luZ2xlIGxpc3QNCj4+IGFuZCAiYnJ1dGUgZm9yY2UgbG9va3VwIiB1bmxlc3MgaXQgaXMg
Y2xlYXJseSBzZWVuIHRoYXQgdGhpcyBuZWVkcyB0byBiZQ0KPj4gb3B0aW1pemVkLg0KPg0KPiBK
dXN0IHRvIHJlcGVhdCBteSBpbml0aWFsIHJlcGx5OiAiRm9yIGEgRG9tVSB3aXRoIGp1c3Qgb25l
IG9yIGF0IG1vc3QNCj4gYSBjb3VwbGUgb2YgZGV2aWNlcywgc3VjaCBhIGJydXRlIGZvcmNlIGxv
b2t1cCBtYXkgYmUgZmluZS4gV2hhdCBhYm91dA0KPiBEb20wIHRob3VnaD8iIElmIHRoZSBjb2Rl
IHVzZXMgdGhlIHNpbXBsZXIgZm9ybSBiZWNhdXNlIGl0J3Mgb25seQ0KPiBnb2luZyB0byBiZSB1
c2VkIGZvciBEb21VLCB0aGVuIHRoYXQncyBmaW5lIGZvciBub3cuIEJ1dCBzdWNoIGxhdGVudA0K
PiBpc3N1ZXMgd2lsbCB3YW50IHJlY29yZGluZyAtIGUuZy4gYnkgVE9ETyBjb21tZW50cyBvciBh
dCB0aGUgdmVyeQ0KPiBsZWFzdCBzdWl0YWJsZSBwb2ludGluZyBvdXQgaW4gdGhlIGRlc2NyaXB0
aW9uLg0KDQpBcyB3ZSBkbyBub3QgZW11bGF0ZSB2aXJ0dWFsIGJ1cyB0b3BvbG9neSBmb3IgRG9t
MCB0aGVuIGl0IGlzDQoNCmNsZWFybHkgc2VlbiB0aGF0IHRoZSBjb2RlIG1heSBvbmx5IGhhdmUg
aW1wYWN0IG9uIERvbVVzLg0KDQpCdXQgYW55d2F5cywgdmlydHVhbCBidXMgdG9wb2xvZ3kgZm9y
IERvbVVzIGlzIGVtdWxhdGVkIHdpdGgNCg0KYSBzaW5nbGUgc2VnbWVudCAwLiBXZSBoYXZlIGEg
c2luZ2xlIGxpc3Qgb2YgdmlydHVhbCBTQkRGcywNCg0KYWdhaW4sIGZvciB2aXJ0dWFsIHNlZ21l
bnQgMCwgd2hpY2ggbWFwcyB0aG9zZSB2aXJ0dWFsIFNCREZzDQoNCnRvIHBoeXNpY2FsIFNCREZz
LiBTbywgd2UgZ28gb3ZlciB0aGUgbGlzdCBvZiB2aXJ0dWFsIGRldmljZXMNCg0KYXNzaWduZWQg
dG8gdGhhdCBndWVzdCBhbmQgbWF0Y2ggdGhlIHZpcnR1YWwgU0JERiBpbiBxdWVzdGlvbiB0bw0K
DQppdHMgY291bnRlcnBhcnQgaW4gRG9tMC4gSSBjYW4ndCBzZWUgaG93IHRoaXMgY2FuIGJlIG9w
dGltaXplZCBvcg0KDQpuZWVkcyB0aGF0IG9wdGltaXphdGlvbiBiZWNhdXNlIG9mIHRoZSBmYWN0
IHRoYXQgRG9tMCBtYXkgaGF2ZQ0KDQptdWx0aXBsZSBzZWdtZW50cy4uLg0KDQpTbywgaG93IHdv
dWxkIHRoYXQgY29tbWVudCBsb29rIGxpa2U/DQoNCg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwN
Cg0KT2xla3NhbmRyDQo=

