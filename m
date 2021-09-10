Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D307406CC1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184368.332979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgNW-0002ad-As; Fri, 10 Sep 2021 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184368.332979; Fri, 10 Sep 2021 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgNW-0002Xa-7g; Fri, 10 Sep 2021 13:15:38 +0000
Received: by outflank-mailman (input) for mailman id 184368;
 Fri, 10 Sep 2021 13:15:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOgNU-0002XU-8P
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:15:36 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50c155ae-bbb2-4ea8-9424-023f5ed4e9d0;
 Fri, 10 Sep 2021 13:15:34 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ACp7RG005427; 
 Fri, 10 Sep 2021 13:15:32 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b0731g8fv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 13:15:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3428.eurprd03.prod.outlook.com (2603:10a6:208:c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 13:15:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:15:27 +0000
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
X-Inumbo-ID: 50c155ae-bbb2-4ea8-9424-023f5ed4e9d0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpHogWpHWdDEqW5aAatpHV/hy9bQVOxVhgaxTPIh2DGKfEoQQr+8MvY1+9wZ1eRHFVJMaIm2b0RZ9nCW15t1zpV6zXGgMZ/w204X3EUAh0DFbrCqrNgQlpTWzLBjhlYpOuL4C9imifJ9kn7uEvRgHm/0i0QinyfNBjMN+dU9O81p//mc/3luZhjJ3OSU9XxE2Ik+76oHyTjjCbf/DDk0qBopjoXdyOtYQnPG8j48gyVbKJ82bMIbZWwb1NExxcOVZ+Xww4RcCsJ90CavUELCxXbZAFJ/AOq8lJaE1EOABIDwJmUtyfsHxReIHVAb1y1NVcuOg6AUR1rZYdQKPrtcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qnXFK9J5r336VnHGmOYVR3MgZv7b7Vu+tI5JU+V9tGk=;
 b=iqrVOGOV6CgMCsIcTwS1CLkkjGdT0Qgw+INNnFc10BW0mW76Jt1ptL/xEiVaw7rJRFcL2BUlMUOSrKQ4dmtdA/25H6ypeE5HmBANSM132OFEFcYndG8eDVMsfmzkD98H91LnRXrbj8ui5hlJ6w49I0JGGZzipMy5T8Og9Kr+v0P2cG/QaBk84gSfO2PpmqRPtHqxzI9dB3D3Z0DPYW6MOPQg58D3+5M7Dm1UeePKPgdJ9I9p1oDZgtwYpgn4Dm0uzDBaedyL3zghSEE/c4U1yen59HdV113x5F3ckvGDmlFzj/8/cVub052coStaDUg/D4gn1RoBZpygjWNqOlKKCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnXFK9J5r336VnHGmOYVR3MgZv7b7Vu+tI5JU+V9tGk=;
 b=LG1PUcSxJt2VOh5scTVoWcLxY6NPtkeiQlbspN9ha+GfIzL1eyuGlMFrIfH2LOlLG1e3hShQmhrIx1BjFBvaRp2zW5QQmt6Z+rao9HolxOPjKgXSiFbdukcKdsdvlF1t5T+lF1ryY0KxH03C0u9GseGCqLSJ/SRF6/K6kzN2QLjvNyU7iRiHw2RTYP4TkZdCCv6V5J3aVlxsMZYNRT8p0XKPCyz+tqkcX2LJHEeVO6jD5u6kF5iIcX7W+xXm6KmX8dqQvSs9uY+S/xJLrepwowKAj0DpeG+B17VFLL+4xf/8mFFCx3KkN/H580ePA59TAnr7zUbu8hYzptiFnaXBvg==
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
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4ACAABanAIAAAwIA
Date: Fri, 10 Sep 2021 13:15:26 +0000
Message-ID: <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
In-Reply-To: <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b85f6c8d-e9bc-40f8-85d8-08d9745d0e51
x-ms-traffictypediagnostic: AM0PR0302MB3428:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3428BF462675C7261A879AEBE7D69@AM0PR0302MB3428.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QrGgf4ivqeWU0BVZ1gW9aeWZ1RbbnmFJmWX0adv61yUinr5s2yacVgf7mOArBAsHpVCjKIyVMi5IYx99eKyOSiIFai/8T3/OxwXxLUdMCK/i6G80VRCkjh/dEUJsz94dC9KznU7A9MWu8ZkGPNfbbUMjctmQ+6MA4uTnpNi0R0AyurKp6IObVCDDo+aYT5hFBHk7Ek65m/vQOIcxft/vIlHRYDgZh30N964ATrUiy2/8LvBdZ0i2gjpUoL2GdCFSJ+vvohFW6YaLI99X0h4SpQyJOyiuBeZFfXoCUfPCA4OASDATKkzyYPVDQFomSs/NOvlrrYzQS2gNDN41iq54tubsAiULNg7uM7k5ZKXtRo3YHrQVaIQ3Hb93Ai/fYHi86GOCGcGEWrqeIK0Gq0yjb9m6TcuBDub9kkPQL6eF6FMsMTHOi0yNs7JMfP6fVxc3QzXE766f9LiC1dBnpvXQplTuVWCqOXIzgAQw9m5oq3v1zTSbgmDwPoOTY1uh3rJleks9dM++1iWmVPGj1HZtYEkSIhdyka2bhlKfzZhE+2489zVSeonbT8Ae9l8cngtc3TH/k7pPxmTPuFyHBkxAQ4qkUIoph0XunP+BtAknsBLgi9kZsBf8OnWEe2b+Znh0XUaP7VhuUDwQrmf8qvsHKpw22dFfDOegwObfL0nbwK18cUUJO6qkU5EuU3Qk5TelM1tK/YirPAXCbokAueUFbf1JR271judHM8xMLafPeZs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(8936002)(6506007)(91956017)(38100700002)(53546011)(31696002)(66946007)(76116006)(55236004)(86362001)(66476007)(66556008)(64756008)(66446008)(26005)(36756003)(316002)(2616005)(54906003)(110136005)(2906002)(4326008)(186003)(8676002)(6486002)(122000001)(71200400001)(31686004)(478600001)(38070700005)(83380400001)(6512007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkw0UmtyTHE1aHNQNlo2ZzE4LytxUUhXWGpFQXA3cm9GN01nc041VENIeDhy?=
 =?utf-8?B?bU4zYTZOeGFUWGROQzEweHgrbjVSQlhVTmpSL1NsR2pJN3g5UkFnZE92T0Jw?=
 =?utf-8?B?dW1ndUlJak5mMXhFWElPZHZLeEJEd1RBK1VTTUJyT01hUTh3KzJiOWpVTDhH?=
 =?utf-8?B?RTgxQVorKysyRjcwWUZzR3ZHdjZuemJpZExUN2lZZ2pqQlNsNHFoQmFJY3ZG?=
 =?utf-8?B?bmI0bnNoYit6RXZXNHlFbW9iSzNVdDJWWXdJWXZNZjF6WlVrZ1dNVkhxNjM2?=
 =?utf-8?B?TGlOeER0enBKM1ZHaGNLRmhmUjNWMDBLWHYwYXROeHpoUGF2bW55MnVLRkdT?=
 =?utf-8?B?NzVLT09UcDNGdk5QaGpOSFFLSys0VzhuZWFiT05XeVlqeW0wZ3YvRTFBSjF3?=
 =?utf-8?B?TWtKMGVKeTBETEViYUtiZEtUYVozYThoTFM1d09sQlBtaC9jSThIdXJtdmEx?=
 =?utf-8?B?MmdZNDlSYXhYYzlveWNONGs2S2pXMkhLUThibWpLZGRXVlRtU3plM2tvcUw5?=
 =?utf-8?B?UlBqZm1OWGtlc2VqbnEvRit6TVViWHA1NlBFWU5tK3NscTZxbStMQUZFWGZQ?=
 =?utf-8?B?YXBLUm9zWGpPeXpZVUZwVnhOc3NNbTZLNko2WStGbjNMM1pxNjhhcmRscGN0?=
 =?utf-8?B?eHIvUmhSRDVteDlrbERDNU5nY0lTQzE0NHVDb0JvT21NZEZORXlZRWpVUzRN?=
 =?utf-8?B?clhrTE1penRGWEs4NERiS2F6aDl0aXdpNUZoaHB2ZitXSGxZZ3NqM3RkR2sx?=
 =?utf-8?B?YXVOMmUxdDFTZWRQUGxjMlpubHhwMElOSVRoYjhyTFVJbzJpbHRNelk1WXox?=
 =?utf-8?B?dmxFaFY4R0d1UERmWG1MMVBhOGwwSXlkd0NiMXhVdmJiZkM2bUhRdVN3MVBS?=
 =?utf-8?B?a3FSN253RVBSVlJBOWpiekdPY0VoQS9hRFM4VUQ4d2QwRTc0QXMyUk5jRVFI?=
 =?utf-8?B?WmJOR1YvUjgvTFR6bkI1TTZOUFJBbGtBWTlFdzJRUDl3cTZ2Y2IzRUpZMEx4?=
 =?utf-8?B?Z0tMM201bHdrOWNHTkE5dFZmSHM0L1k1SmVWWTZIVS91ZnNlMFZOeDZJQ2dB?=
 =?utf-8?B?UmRCL0tILzVwNG5oT1VKMzBYMjZlMkFwY0EvSlRuVCtHYitkcC9mbkRXMDhl?=
 =?utf-8?B?UnJ5dmwwMU9LSDRQR21ZYUVBWmJNcGxEU2FDOFlSSFByeWJZQlJINXlIU1gz?=
 =?utf-8?B?V3U0SXFMT2JVSUFCU1pxZlZkZ3pDaXF3YXgxTzRHODQ0VDNiUVFEd1dCdExG?=
 =?utf-8?B?emFiM2dwem5rN0kvNmk5dy84TjdJcXRRMC9DRzBGQXhEMm10d09kTTE2OW14?=
 =?utf-8?B?U0hPRFFhWFZOeHZ0QnB5Mkxna29kOEdnUjYrU0ppSXZ4Q1k2SkU3Z21xZWQ4?=
 =?utf-8?B?LzdzcnlxZ3dNNTNvSkp0MG1PbXYrWjViV2x2WGF4eEErL25YL1JTSklqNHZM?=
 =?utf-8?B?eWJ3ZXpMcHZoRWFiQWRkRWxrZnZUTjY3aGhETnJEOWlQcW5ySElqbCtKNjNC?=
 =?utf-8?B?eGlYYlFuRlNqZE5wRFFoeUZSamt1bXFYZkhiRkw1TlBLMTBBOGZJV0k5VGtn?=
 =?utf-8?B?ZUc0T0htdklHOG9aM01DQmRlSURCTW4rZ3FybjJQYlE0SVRITGpGQmY0ZVhz?=
 =?utf-8?B?TVk3bXBMaGQ0b081MVVCckNTSTN2TFJjR3NrampvZTBZSVJ4c2Q0THllZmx3?=
 =?utf-8?B?V0JpWUF1WXFVWC9aNGtyejE2eGI4VXljNmJtQXpmZDVCcE9aL1YwdXB3SVZB?=
 =?utf-8?B?NVU0ZGJYaFY5bk5NYnVaeTJRM1FnUCs0MFdaMkxpalA5ZkY2M3hrRW1nTyt1?=
 =?utf-8?B?a3QxeEZUZThhVi9qN3lYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A96FCB11BC4EAA408DEB06BC5EFC19D5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85f6c8d-e9bc-40f8-85d8-08d9745d0e51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 13:15:26.9793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyYqw8e3GMhqiemR1tOwDtP17Z+JpxDs87rb6hVVBNDU114rKM8iayPFdLgXV7wUcN7AifVUvEQT8GjrJ9AySZCkrkw0bI4CO5xbLd1GjRGLu+YN0QTYfBU0KrhESgmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3428
X-Proofpoint-GUID: Xt37kSfilYmwZvCTPDxB4hmXu91Mv1MB
X-Proofpoint-ORIG-GUID: Xt37kSfilYmwZvCTPDxB4hmXu91Mv1MB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100078

SGksIEp1bGllbiENCg0KT24gMTAuMDkuMjEgMTY6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4N
Cj4NCj4gT24gMTAvMDkvMjAyMSAxMjo0MywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
DQo+PiBIaSwgSnVsaWVuIQ0KPg0KPiBIaSBPbGVrc2FuZHIsDQo+DQo+PiBPbiAwOS4wOS4yMSAy
MDo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIE9sZWtzYW5kciwNCj4+Pg0KPj4+IE9u
IDAzLzA5LzIwMjEgMDk6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBG
cm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+Pj4+DQo+Pj4+IEluIG9yZGVyIHZQQ0kgdG8gd29yayBpdCBuZWVkcyBhbGwgYWNj
ZXNzIHRvIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlDQo+Pj4+IChFQ0FNKSB0byBiZSBzeW5jaHJv
bml6ZWQgYW1vbmcgYWxsIGVudGl0aWVzLCBlLmcuIGhhcmR3YXJlIGRvbWFpbiBhbmQNCj4+Pj4g
Z3Vlc3RzLg0KPj4+DQo+Pj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5
ICJzeW5jaHJvbml6ZWQiIGhlcmUuIEFyZSB5b3UgcmVmZXIgdG8gdGhlIGNvbnRlbnQgb2YgdGhl
IGNvbmZpZ3VyYXRpb24gc3BhY2U/DQo+Pg0KPj4gV2UgbWFpbnRhaW4gaHdkb20ncyBhbmQgZ3Vl
c3QncyB2aWV3IG9mIHRoZSByZWdpc3RlcnMgd2UgYXJlIGludGVyZXN0ZWQgaW4NCj4+DQo+PiBT
bywgdG8gaGF2ZSBod2RvbSdzIHZpZXcgd2UgYWxzbyBuZWVkIHRvIHRyYXAgaXRzIGFjY2VzcyB0
byB0aGUgY29uZmlndXJhdGlvbiBzcGFjZS4NCj4+DQo+PiBQcm9iYWJseSAic3luY2hyb25pemVk
IiBpcyBub3QgdGhlIHJpZ2h0IHdvcmRpbmcgaGVyZS4NCj4gSSB3b3VsZCBzaW1wbHkgc2F5IHRo
YXQgd2Ugd2FudCB0byBleHBvc2UgYW4gZW11bGF0ZWQgaG9zdGJyaWRnZSB0byB0aGUgZG9tMCBz
byB3ZSBuZWVkIHRvIHVubWFwIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlLg0KU291bmRzIGdvb2QN
Cj4NCj4+DQo+Pj4NCj4+Pj4gRm9yIHRoYXQgaW1wbGVtZW50IFBDSSBob3N0IGJyaWRnZSBzcGVj
aWZpYyBjYWxsYmFja3MgdG8NCj4+Pj4gcHJvcGVybHkgc2V0dXAgdGhvc2UgcmFuZ2VzIGRlcGVu
ZGluZyBvbiBwYXJ0aWN1bGFyIGhvc3QgYnJpZGdlDQo+Pj4+IGltcGxlbWVudGF0aW9uLg0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoMKgIHhlbi9hcmNoL2Fy
bS9wY2kvZWNhbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysrKysrKysrDQo+Pj4+
IMKgwqAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyB8IDE2ICsrKysrKysrKysr
KysrKysNCj4+Pj4gwqDCoCB4ZW4vYXJjaC9hcm0vdnBjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTMgKysrKysrKysrKysrKw0KPj4+PiDCoMKgIHhlbi9pbmNsdWRlL2FzbS1h
cm0vcGNpLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysrKysNCj4+Pj4gwqDCoCA0IGZp
bGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9wY2kvZWNhbS5jIGIveGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMNCj4+Pj4gaW5k
ZXggOTFjNjkxYjQxZmRmLi45MmVjYjJlMDc2MmIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9wY2kvZWNhbS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvZWNhbS5jDQo+Pj4+
IEBAIC00Miw2ICs0MiwxNiBAQCB2b2lkIF9faW9tZW0gKnBjaV9lY2FtX21hcF9idXMoc3RydWN0
IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLA0KPj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIGJhc2Ug
KyAoUENJX0RFVkZOKHNiZGZfdC5kZXYsIHNiZGZfdC5mbikgPDwgZGV2Zm5fc2hpZnQpICsgd2hl
cmU7DQo+Pj4+IMKgwqAgfQ0KPj4+PiDCoMKgICtzdGF0aWMgaW50IHBjaV9lY2FtX3JlZ2lzdGVy
X21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBtbWlvX2hhbmRsZXJfb3BzICpvcHMpDQo+Pj4+
ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpjZmcgPSBicmlkZ2Ut
PnN5c2RhdGE7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoZCwg
b3BzLCBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLCBOVUxMKTsNCj4+Pg0KPj4+IFdlIGhhdmUg
YSBmaXhlZCBhcnJheSBmb3IgaGFuZGxpbmcgdGhlIE1NSU8gaGFuZGxlcnMuDQo+Pg0KPj4gRGlk
bid0IGtub3cgdGhhdDoNCj4+DQo+PiB4ZW4vaW5jbHVkZS9hc20tYXJtL21taW8uaDoyNzojZGVm
aW5lIE1BWF9JT19IQU5ETEVSwqAgMTYNCj4+DQo+Pj4gU28geW91IG5lZWQgdG8gbWFrZSBzdXJl
IHdlIGhhdmUgZW5vdWdoIHNwYWNlIGluIGl0IHRvIHN0b3JlIG9uZSBoYW5kbGVyIHBlciBoYW5k
bGVyLg0KPj4+DQo+Pj4gVGhpcyBpcyBxdWl0ZSBzaW1pbGFyIHRvIHRoZSBwcm9ibGVtIHdlIGhh
ZCB3aXRoIHRoZSByZS1kaXN0cmlidW9yIG9uIEdJQ3YzLiBIYXZlIGEgbG9vayB0aGVyZSB0byBz
ZWUgaG93IHdlIGRlYWx0IHdpdGggaXQuDQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSBwb2ludCBt
ZSB0byB0aGF0IHNvbHV0aW9uPyBJIGNhbiBvbmx5IHNlZQ0KPj4NCj4+IMKgIMKgwqDCoCAvKiBS
ZWdpc3RlciBtbWlvIGhhbmRsZSBmb3IgdGhlIERpc3RyaWJ1dG9yICovDQo+PiDCoCDCoMKgwqAg
cmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2Z2ljX2Rpc3RyX21taW9faGFuZGxlciwgZC0+YXJj
aC52Z2ljLmRiYXNlLA0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU1pfNjRLLCBOVUxMKTsNCj4+DQo+PiDCoCDCoMKgwqAgLyoNCj4+IMKg
IMKgwqDCoMKgICogUmVnaXN0ZXIgbW1pbyBoYW5kbGVyIHBlciBjb250aWd1b3VzIHJlZ2lvbiBv
Y2N1cGllZCBieSB0aGUNCj4+IMKgIMKgwqDCoMKgICogcmVkaXN0cmlidXRvcnMuIFRoZSBoYW5k
bGVyIHdpbGwgdGFrZSBjYXJlIHRvIGNob29zZSB3aGljaA0KPj4gwqAgwqDCoMKgwqAgKiByZWRp
c3RyaWJ1dG9yIGlzIHRhcmdldGVkLg0KPj4gwqAgwqDCoMKgwqAgKi8NCj4+IMKgIMKgwqDCoCBm
b3IgKCBpID0gMDsgaSA8IGQtPmFyY2gudmdpYy5ucl9yZWdpb25zOyBpKysgKQ0KPj4gwqAgwqDC
oMKgIHsNCj4+IMKgIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2Z2ljX3JkaXN0X3JlZ2lvbiAqcmVn
aW9uID0gJmQtPmFyY2gudmdpYy5yZGlzdF9yZWdpb25zW2ldOw0KPj4NCj4+IMKgIMKgwqDCoMKg
wqDCoMKgIHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdmdpY19yZGlzdHJfbW1pb19oYW5kbGVy
LA0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWdpb24tPmJhc2UsIHJlZ2lvbi0+c2l6ZSwgcmVnaW9uKTsNCj4+IMKgIMKg
wqDCoCB9DQo+PiB3aGljaCBJTU8gZG9lc24ndCBjYXJlIGFib3V0IHRoZSBudW1iZXIgb2YgTU1J
T3Mgd2UgY2FuIGhhbmRsZQ0KPg0KPiBQbGVhc2Ugc2VlIHZnaWNfdjNfaW5pdCgpLiBXZSB1cGRh
dGUgbW1pb19jb3VudCB0aGF0IGlzIHRoZW4gdXNlZCBhcyBhIHRoZSBzZWNvbmQgYXJndW1lbnQg
Zm9yIGRvbWFpbl9pb19pbml0KCkuDQoNCkFoLCBzbw0KDQoxKSBUaGlzIG5lZWRzIHRvIGJlIGRv
bmUgYmVmb3JlIHRoZSBhcnJheSBmb3IgdGhlIGhhbmRsZXJzIGlzIGFsbG9jYXRlZA0KDQoyKSBI
b3cgZG8gSSBrbm93IGF0IHRoZSB0aW1lIG9mIDEpIGhvdyBtYW55IGJyaWRnZXMgd2UgaGF2ZT8N
Cg0KPg0KPiBDaGVlcnMsDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

