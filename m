Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9E3A2A92
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 13:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139851.258513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJ8G-0003Hj-Lc; Thu, 10 Jun 2021 11:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139851.258513; Thu, 10 Jun 2021 11:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJ8G-0003Ef-IP; Thu, 10 Jun 2021 11:45:56 +0000
Received: by outflank-mailman (input) for mailman id 139851;
 Thu, 10 Jun 2021 11:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVv/=LE=epam.com=prvs=679567fbaa=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lrJ8E-0003EZ-Jc
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 11:45:54 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6465ebd6-8b62-4a5a-b90a-652ccf693416;
 Thu, 10 Jun 2021 11:45:53 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ABj6SJ001593; Thu, 10 Jun 2021 11:45:52 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 393hssg2ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 11:45:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:45:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%6]) with mapi id 15.20.4195.031; Thu, 10 Jun 2021
 11:45:49 +0000
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
X-Inumbo-ID: 6465ebd6-8b62-4a5a-b90a-652ccf693416
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhqrhdYaUPaW+ow0rsceObB6ictU+dh6LpdNdQRAacEwyzxifTMdrYcbR5a8K/59odhSCMG7jBUdC8s3/ORrTwWjZ1g+llf5uLJJyJ8W6LBpjwpQiotOUxySt6kmW/AVpRPYAkOzsns2RRN82kNnOL7W2E/koKN0zOwguLN0GYv5yk6NUPPzMcwJrWd4uz1iRvAEXgfYNeryJ9zN/2Unl7QVoaN5JNCvc/FJYJI5NfDxMD8/oqj+WOjoS+2ydgWRkZ/UdEBD23J6TAWrGpE7nvbQizjPa/ci6kGOuK8SO6md3NaBtEHLYaeZAARGs0yV0y6IxoYfK9x98Un5ipQQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/N4AyG+ggLqAnnE4jf4eKZl3woG/+VJJvDtn5NUYZw=;
 b=JR5BKLhgpszKVFx758xLIztac/fVxYo/uv7KBirkp4BOPhsp48B5pVz2v+5STgHdov+4XX1rHVCQyOfB9oz+UAS+RV8dyekdReMlpD2xOo9ZljsGc+rPMYz6GU3oJb4iEU+s15h2lgFnMyCGC1VDjlhV6ooLgnEOW6JFBlxnKD9sGQ6OPaALSL0qFV7fDP6uOTK5lP3NU8w7mYTJHc3o7Zp4MP+bFoQ5BX/oJNQf7NgEuczaon2U6Ami4nuDR8MzEJrucZnHP8FHxywrxjA5THuJa6W/eMz4fxyAnr7pYKnYxLd9J/BkNCxJneb3M3xYCIpdjcL9uTpCrOoa+SWw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/N4AyG+ggLqAnnE4jf4eKZl3woG/+VJJvDtn5NUYZw=;
 b=AgUyMSJgOPIPsQRhabrZ6j/T+DLKoFlwGAxbO3MwQLyCNQvwONYostlrFXLqaO0lIjwmC4qfhE++gLLm7Kw66oltl7sj456ilwrWnFlQN+z3eF3J+Og/NtCvCgndW2MyJUsfItSskwGp2UOpCt718XiIt/yJlrC3R3TAkyauBpB9ADmBLHIm63UI01u55c6sJT4o3io9yTFIpUCLE8Pz2THyFkj2imc/FKZl2ub5+txsEVu9G8Ewnn0B1Q93bntv1INytjubB+aEMvBPq11mYFno1qlE9UmWCZszmSclX8XRsPaPbneCipYEofQOfvqN+J0yp+Fc6/3qT5aDB27wHw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: AQHXWQwW/O3obtZgqkmpGRvt7ZNDkasM6aMAgAAjXoCAAA0jAIAAEBMA
Date: Thu, 10 Jun 2021 11:45:49 +0000
Message-ID: <38cfe7b7-e5a3-2216-f52e-fdebfc7af517@epam.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <0aa4bf61-e08f-6da0-1cda-48e61bf876af@suse.com>
In-Reply-To: <0aa4bf61-e08f-6da0-1cda-48e61bf876af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aa696ec-f5be-45de-3a79-08d92c054b10
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-microsoft-antispam-prvs: 
 <AM9PR03MB68814DBD98BAAE900DC91761E7359@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hKnGr3G9E23PjvCVzAeWedcA0n7Rf6ik2TuBOeZ8vTv9fO7Z5mBwom6NZRd4ej7LFmtq3RqoQ3iY/cbWxOjfVb2NKfY9MALLSqhtIsDmNM5j0Bi3/AdN7+qfb7eFRQVH4wLAde8K9MWptHNLz8ZCSo1cLNxGj0qZjBzEKwHSzbvwBB95jaoNqFTpECBD4mYx4LJOsMYP1NPcOSNre/8my0bIDaNX/+ma92EDgm8LZzQVvtEN4g+QyAuVc4EXuB3qGH77oRyF8ymLBoXl2NQANimmZOfsDQW8EjxqJwOTW6eIbc/LhVTpQKEyBkSfrm649+/NmeTvDnsGj3/u03juXp672UkSikpkWFBVZcuHv7QYg2vqPNeKQ0Tt/bVb5yPOMlryoUB2PAEsOPWbN/b1VAHVxQ9+wbx/Sd5uaKIAhckrmzKe06HTn6fdGAwtCqQr1Lz5jPNz1/NAyY1HLu4HNanbQsD+QBXrInVK0xNuQnpV7WgCz5sKRckN49uUzbYBl4iGOwpyhwb8wSwMhXB5jMalvu16Q85QCMII0JxQdbwNSOERvOosKm+NinayPSFspDJ2SikTExOTtEI9LonSennRXNMiwlDY7wcKxvzVsuL6Ec0mm9pZEp1TGlGh7TVOEc2L50Nr9eKvzoWnCKFZffHiPWToSv49Mo7vWWIYnS/4+PynNh3Rw/ZEga/J8SqZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(6486002)(122000001)(6512007)(8936002)(53546011)(8676002)(38100700002)(36756003)(71200400001)(83380400001)(6506007)(2906002)(66556008)(76116006)(66946007)(31696002)(2616005)(66476007)(86362001)(31686004)(6916009)(5660300002)(54906003)(316002)(64756008)(478600001)(26005)(186003)(4326008)(66446008)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?VE1FZlBVVGRrakZoZ1pMbmxUZk9LKzloTlJ1NkR3SFNxT3RPZWNUMlk5cXMr?=
 =?utf-8?B?eFdqN0xKdmZtMWt6Y21LZmVlQ1A0TmdqbCtJQ2NBcGtEZSs5eERVWG5KN0w4?=
 =?utf-8?B?NFo0K05zQSs4OWYwMTB1NGJGVEwxYUJZUzNOREVnajYrSWxxRk5UaEc4QUdp?=
 =?utf-8?B?V2E5SEs0Um44ZEV6dWQyYnlrZjNua1k5SkNHSDNTcS9IeWtlc2M2MithQldU?=
 =?utf-8?B?WUpSa0w5aG1oM2tVd3pFK3F5MjE2VFpIQ1VKbllETzMwVDBXenkveHAyWlM4?=
 =?utf-8?B?NDVSNlhSME1HcnVjOUtNVVJRc1BLc2R4QS9mZGE0emk3eHRPVlZMbFhJREpz?=
 =?utf-8?B?MTM1YjBncWd5eVhpVlRJaUMvZVFQcFZoQzB0TnNKaHNDVU8zWmc5WDJ3SlQ5?=
 =?utf-8?B?M0pQeDQ1QWFRbkhMN3dwR2I1ZlBmdVFCQkIveUkrcCtsTFMwcHg3N1NqWjNS?=
 =?utf-8?B?MERmbnpsUlJQM0kvaVZpdExnSnZ3YmhVUHJyRHA1YXJvNjNlWVU3eWMzRjd4?=
 =?utf-8?B?K0JRWk5qblRlL1BmTFNtS001R1RuT2dNVWk2SW8yeGlNMC9FSU5GK2Rud1FV?=
 =?utf-8?B?S1RWM2VtSnZzbzcwRXJtS3RGb01EZFUwcTBQdmNEcEpoZEI5WmxpYUpqK3Rk?=
 =?utf-8?B?NCtMRFczVFdXVUttWkxNeUVqYmo0NFJlOUlKN0hxWkpEVWV0NjhWT2tvdFlU?=
 =?utf-8?B?L1E1MFFqYlBsc3NST2NCakliMHN6dDB0cEdKdGtDRWJGM1RZTG1oeGVOd0Jp?=
 =?utf-8?B?dGlBMkhmbmZQU2VDaW9ndWxUVTVwYUdKS2FtcXlTSGtWb05aeUFGSUFpa0tK?=
 =?utf-8?B?VC9wSEpta3VhUkJhNlZvV1ZGZkNLZm5GUmJaeUYzcmxreUY1Q0J0NmU1MEwr?=
 =?utf-8?B?TnlSMm1uS2NxcUExNWtMTTdmWERRZWx0eXRBcGE5WjhRT3JTZnNDSWh1TXhM?=
 =?utf-8?B?aThXKzBSbHJGVnNHYzdJdnFCTmwzSXJiNStCQ2dySE9aMXA0UlV1VkpudkVI?=
 =?utf-8?B?UFZLYTZFRG0xWkZGTUg5VDZwSk4ydlNxVENSd2lIYU1WS3VkVnRCbnQvbTBa?=
 =?utf-8?B?Zmxoc3YyaDVJU2JJWk9FVGxiZzRreGhjeTg2QlNpSHRiRDUyOW1KbHpqUFhs?=
 =?utf-8?B?aHVvSTBqaTVtUWdXS3hiWEk4eVFwTzNnT3RXNlN2S2g1RytEUTFod0tIMm5m?=
 =?utf-8?B?WjJ3UkVLZVBaUkFkbHBNdlVsWUdTQXBaTCtsakVveVFhNStWRVhQMCttY24z?=
 =?utf-8?B?QVh3eTduSncvMEV5WEdhMjlLMnUvQUlncEt2UlRoUmN6REd1ak5qM0QycUNF?=
 =?utf-8?B?b1E1NGp6VFRtZzFmWmdjOHFKdDl2SVh4Q1g5MjViVmJlS2ZDSFloTHNxRC9P?=
 =?utf-8?B?dGJKYjlqaXRmQzBLelFlbCs2OHBvTllpaGcvamdhaEN4K1FiaklWcklsWjhy?=
 =?utf-8?B?bU1LSTFwVFJkTG10VDdxYnlneVZDMzdCNnE2Z3BleHlja3JqMHpDL3h4Qjhj?=
 =?utf-8?B?RVZ2S2YzTmtJZVNXZ09VQ2VIbWhSdTUyb1VXeVkwTHFFWTl1YjVoNXNwYnlh?=
 =?utf-8?B?TllUSWNiUGc5VWIvL2Z5R2xqWkRhM05BSnhpVjBhSXowVnQxRGVoSk9ZNDdY?=
 =?utf-8?B?b1cvcWtHeDlaSmQyT1dBY29pUHRDeUVESGorTWdQUWpYR05GNGpoaG5jOGt0?=
 =?utf-8?B?aW0zZEMvL0t1Y2hQNmRObHJlcHZObEhmeS9wU3ZGMWZaMUxxYnlVc0k0cnht?=
 =?utf-8?Q?M/ji12Tg8B1NNot4rb3i1YdJgUqs2FBIXa9tXP7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <43DA9A3E26C8704EB70E6C98AC139036@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa696ec-f5be-45de-3a79-08d92c054b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 11:45:49.4513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0eTbNu5aIwxxh9su4R8oC1835FDVgg/aQ7KC31rM/rBlH5eVaRt+ujV4Ax4DfYANyuo+RmEHI70wWPLfITepsuD6vIWbijBcAPHWrf2s1V/f7k8dmLtFCuTy+3arE39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-GUID: 5s0JJGMc7zdHYUD8MqZEAPfqohBDW5y0
X-Proofpoint-ORIG-GUID: 5s0JJGMc7zdHYUD8MqZEAPfqohBDW5y0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=802 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106100076

SGksIEphbiENCg0KT24gMTAuMDYuMjEgMTM6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAx
MC4wNi4yMDIxIDEyOjAxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDEw
LjA2LjIxIDEwOjU0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9UT0ggaWYgd2UgcHJv
cGVybHkgdHJhcCBhY2Nlc3NlcyB0byB0aGUgU1ItSU9WIGNhcGFiaWxpdHkgKGxpa2UgaXQNCj4+
PiB3YXMgcHJvcG9zZWQgaW4gWzFdIGZyb20geW91ciByZWZlcmVuY2VzKSB3ZSB3b24ndCBoYXZl
IHRvIG1vZGlmeSBPU2VzDQo+Pj4gdGhhdCB3YW50IHRvIHJ1biBhcyBoYXJkd2FyZSBkb21haW5z
IGluIG9yZGVyIHRvIGhhbmRsZSBTUi1JT1YgZGV2aWNlcy4NCj4+IE91dCBvZiBjdXJpb3NpdHks
IGNvdWxkIHlvdSBwbGVhc2UgbmFtZSBhIGZldz8gSSBkbyB1bmRlcnN0YW5kIHRoYXQNCj4+DQo+
PiB3ZSBkbyB3YW50IHRvIHN1cHBvcnQgdW5tb2RpZmllZCBPU2VzIGFuZCB0aGlzIGlzIGluZGVl
ZCBpbXBvcnRhbnQuDQo+Pg0KPj4gQnV0LCBzdGlsbCB3aGF0IGFyZSB0aGUgb3RoZXIgT1NlcyB3
aGljaCBkbyBzdXBwb3J0IFhlbiArIFBDSSBwYXNzdGhyb3VnaD8NCj4gSSB0aGluayBSb2dlciBz
YXlpbmcgIndhbnQiIG1lYW50IHRvIGNvdmVyIG9uZXMgd2hpY2ggY3VycmVudGx5IGRvbid0LA0K
PiBhbmQgd2hpY2ggd291bGQgaGF2ZSB0byB1bmRlcmdvIG1vcmUgZXh0ZW5zaXZlIGNoYW5nZXMg
aWYgdGhleSB3ZXJlIHRvDQo+IGJlIGVuYWJsZWQuDQoNCkZhaXIgZW5vdWdoLiBEbyB5b3UgdGhp
bmsgd2Ugd291bGQgYWxzbyBuZWVkIHRvIHJlLXdvcmsgdGhlIGV4aXN0aW5nIGNvZGUNCg0KaW4g
WGVuIHRvIHN1cHBvcnQgbm9ybWFsIGRldmljZXMgKG5vdCBTUi1JT1YpLCBlLmcuIHdlIGN1cnJl
bnRseSByZWx5IG9uDQoNClBIWVNERVZPUF9YWFggYW5kIG90aGVyIExpbnV4IHNwZWNpZmljcy4g
QW5kIGV2ZW4gaWYgU1ItSU9WIGlzIGltcGxlbWVudGVkDQoNCmluIFhlbiB0aGlzIHdvbid0IGFs
bG93IHRob3NlIE9TZXMgdG8gc3RheSB1bm1vZGlmaWVkLCBpbmNsdWRpbmcgRnJlZUJTRC4NCg0K
SXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0Pw0KDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0K
DQpPbGVrc2FuZHINCg==

