Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD1412EED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191367.341353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZlm-0007KF-UV; Tue, 21 Sep 2021 07:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191367.341353; Tue, 21 Sep 2021 07:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZlm-0007Ht-Qy; Tue, 21 Sep 2021 07:00:46 +0000
Received: by outflank-mailman (input) for mailman id 191367;
 Tue, 21 Sep 2021 07:00:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSZll-0007Hn-CV
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:00:45 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a38a8842-1aa9-11ec-b89e-12813bfff9fa;
 Tue, 21 Sep 2021 07:00:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L64ZHY007744; 
 Tue, 21 Sep 2021 07:00:42 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b77eyrduy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 07:00:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5011.eurprd03.prod.outlook.com (2603:10a6:208:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 07:00:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:00:39 +0000
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
X-Inumbo-ID: a38a8842-1aa9-11ec-b89e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1MwUlmkvIQ8upGAfqnvvqjWkf3nc8H985l2bk4UwqzUwxMTuniCBfxtslZ+Vg59sPsGhJw5A6LG6u26NITS4PNBAgrUWkBdmWzK9aBpapjyUlMTBy5bnuv1sotYCBarNh0PyZAw2QuF/dgCWh76rVu+jLLugFp0lnYdeS5yfFEn2KcD8gSv12o7Lqid5mU4p2ehnKOo5ua82ccsdYS2vkjJFE8QqDYXqmEuJGWxhYSSNnXiHkZdn+zsDWCYn2TA+VJ0hqN//WOKG327YEqL+8vvPJIblMSO5cp0+DPAuaa6bzCkEdokVXyzsEcI1up7WTzoWOU9AjZ4pXN5Sa3fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=armrUEo1vMEssjuJiia6IZ1nZsZE7fL6+asrzL9lEG4=;
 b=Qm75susJezlVxqJIhLDD2BMtGeiUb5JpYV00LiE0bzicejjDPw1USgCb275OhbEDRwodI/6EYg73DtspO6LrNuQ21txNg5Stz7XtWurd2qBxYd64X+dC86pXeqcujjm1vG6XI0R+RY1fJBcpnl/YYhi2S4BnR1qJn1Pg8/INHSus3ux6kCtHpMGOPB//WjvDV0qBdcEHMktUQJoPkwefrAWSHuIF8Z7AWV/3vpsnEm0K3C19rZlaabrpWesuzpDss08LEeruNJ6ikowjx0fMSCACj/EwTQVpUYXQu8S19O/uHTBtWxtG6qG3vu7usspgc5x2zvThPS/hYp2hUVEJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=armrUEo1vMEssjuJiia6IZ1nZsZE7fL6+asrzL9lEG4=;
 b=aPEyMV6rIZSQKKHzmAKMvEP/yYhK5LlOUzYHuvclhIKUNnAq4ekjfpgoqlhjS0Q6b8nXiQnfm+a/HUka2Op+yEQJK504aHuluGmp496df3fgFitf1CenUb/3Mmv1KzMVuvd2RjQvTb+FrKI6DOnp/MbovEjZK0ieRmdtnbqyp71IEJmDAswvrw/H9rvQ2uP4BLMXrKUypoyZby741tWUuFaoJALYJlggdpw5TWyvTp1649bZlbOaZ9Ihc7dHWE7kruRsalRkh80QJ2mclLMLv9jAD983q/5kPuaPRSGEZBgaydcokvBAOHvmUtWKCW5SVvCQN4Zjm88Jf/bQfXCV2Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAGXhAIAACLuAgAAEUwCAAAi6AIAAAxMAgAADDgA=
Date: Tue, 21 Sep 2021 07:00:39 +0000
Message-ID: <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
 <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
In-Reply-To: <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75c8071b-86c6-478b-bc79-08d97ccd8507
x-ms-traffictypediagnostic: AM0PR03MB5011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB50116608BDC2835D18AB7D7FE7A19@AM0PR03MB5011.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8bf6Pe5oo87kO0Mgipy3gl/HMYXWSXk7kqD1bWcNchBhtXwxvJ8IKAJ6r9W/LIpYQjzjcgrWBZc2hpesxZFsAd20pLEind8RbAflsOY1/tGuuuBTVnnxv2D9Mcb9H5m89BaviQyMXZpOU6WfCjBcaYHqFPpBtxX5G3Feo6Oyx99dPm2WNgFQGvilr7hWyLeaC7YFO+HuO4+bZG8W5Jb7t/7T0M6dN51SgnAHVZkiKYXUUDyt5xT7huK5MMEd0gQLnfpQdsim+5r1cKPNCavQ71o+eDK3VUg4GxAKNSM8zCaAYt4QBrCAURhCp0XMeXOKlq1eNi97spwKJgdFNz+NUHvQc8F5kxWPEpXtkFY/VjaJAK2igz8bVjTb/633cy86lTxpTRU2exDfR2TCpT3E9hUb2zz0GWW+HWMQxEPgIvQl8QFtW2r3iRzC6Bc0yalsgEh+fNht7+YpzovSXzTyM7njwEXqEk2qw/AAyj1pdwdxeM6E04igQdoZrcXu0I1SclTIVcIJ9b/fhTuJoGPJAEYqvImB0cJs8gHKGKl1ALiFToNNQO8XMsqwS8pbMo5qilrsWiLq5F1XBl1+diS7B1dGtaWXNG7EJi+8TzRSdSYJaVuqcBVcNOyYpsla5zx3ymChWFl5iL/A5JsX+hgb8C4jIrG3fXyHNQm5kpbN+gdcF4ibUD8whTSyWK4I5hRHL2DJtZB31Mi5SZ0r0Smm8H25N9KDGAdGr4FCzgdi0rj46GD7+cIGKko0P/3u6tN9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(54906003)(110136005)(31696002)(2616005)(71200400001)(6486002)(38070700005)(8676002)(55236004)(66476007)(83380400001)(53546011)(6506007)(5660300002)(36756003)(316002)(8936002)(66446008)(66556008)(508600001)(6512007)(66946007)(91956017)(76116006)(64756008)(122000001)(86362001)(38100700002)(186003)(26005)(31686004)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ejBrUE9Jd2N0aGZ0SWtCZmliM3NLcUlPTi9DcExwN2V5NnNTRUEvRzFvSy9s?=
 =?utf-8?B?WUlBWS94czUrWWJYYkgvNWJINEIvdS9HUTdvM2NFSzNLc05CSE9XMDV3Sk1z?=
 =?utf-8?B?R3BwSGh1T0tPNENVbi81RDFQOWZnNG5VMjlPVkxYU2JjY0xvcUp0cXA3eHJv?=
 =?utf-8?B?QjA1ZVV2TnM4V0I5WHNBV0k3aGxZK2pjN01LbDZ3aGhvVVFPR3ErZlNTSVMv?=
 =?utf-8?B?aVQvUVlidWZqci94RGFZendSeVRkZHdkSE05RUU2T1EraFE0enZMYTJVbzlD?=
 =?utf-8?B?Q3BwUjl4QyswaGJiajdzN3p1YkpyZlBZV2ZxQ2hjLzVVU25rbzk1NlVxOFlV?=
 =?utf-8?B?L1cxTDFqQllySlZ0U25GamVNOVRqRk53UCtsODVkdmticEFhbWJFdXJucEU0?=
 =?utf-8?B?N25TNnVkOHZJeDJtNlhCU2FKMlFYR1F1RVdFdXNGY1YvcE81UkJYblpISzVn?=
 =?utf-8?B?WEc1QzZqV2xtK3BvUktOclR5R1dzNHRQUEZzOWhBL2lDMStSeVZSZWx6ZVZq?=
 =?utf-8?B?RkpETUFZQmEzL3ppYmpnMWhyWkg4M3g0ZmRhRjA5cHhXaWJ1VTE3TXZPM0FJ?=
 =?utf-8?B?NUg0Rm9xMHU5R051S1pUWjV1Nld6c050RXBVVXVwQ1lqY2k4Wjg3ajZudVcx?=
 =?utf-8?B?SDlMMmZvM3FZbERoZGFPSnE4KzVvSUpNQk1qZ010RWJUdnhuTDU4SjNTYXlv?=
 =?utf-8?B?WEVaODdBTTQ0eDZSU0xtOWtLN0M4TjNNeHEvTlZwd0p4SnFrRWQzZ0VYUW8v?=
 =?utf-8?B?TStiNGNhVkREcGhCem1qMmZSQzFSbTU0SXpVMGhYY3lHYlc1QUF6R1pxRVJz?=
 =?utf-8?B?eDVqYWR0c0pqdWRxTmdpcEFXNVRmaThhZ3IyRWRtS3BsKzlnZ09uL3NBUGZL?=
 =?utf-8?B?OFAybGpOblp1SFAyUHpNWVhPdWdkcXJqV1JlMEU5TmdCWk9WMjBybWxtUzI5?=
 =?utf-8?B?ZFJMSllJYnBGRjU5bjhQdkVRZWh3ejJ4dkhQellrVWF0dENPL29mRGlEODAv?=
 =?utf-8?B?YTQ3OGJIUE9MaEswb0htN1NNL0VnYUdQWkg2K25uUXM0L25NT3VEOVc0N09o?=
 =?utf-8?B?dk5ZWGNleG5IYTl2LzRjWnhuNDVmNlJQaEdIeUFXQmU0NzRWbFNJMnZ2Qjg5?=
 =?utf-8?B?S2lJeWgwYTlnSFE1alpQSytNUFI1OVlYaTViUE9iVlIvbVJxSlFEMkplSGYz?=
 =?utf-8?B?d2txWGl1YzZ6cmljT20vVTFzVWV4bHkrZ0o3K1pxcldqNGM1dkRhUXdwbkdD?=
 =?utf-8?B?bDNWR1hHZWNrWVBHSEtuZk10dWNtbXJIRGxXWDJoN3hVNUVRNEVpa1N0bnJT?=
 =?utf-8?B?QkZCTnN3R1lvbElJaFUvT3dEOWNwdUJkbWpEOWtzcUVVMlQ5MCt2YW80eHZR?=
 =?utf-8?B?eStyNHZwY2V5V21TSGFZMmFBS09UQnNNaDNBQmM2Rm0wT01BcEsxeHdpeUIz?=
 =?utf-8?B?bHNESEdFM1pSdmM4ZUlIKzZBQWFOMXZLcWNUZGJmREE5TWJNdUdYZ3FJWW1T?=
 =?utf-8?B?M3p5WU10a3FWeHMxNE5yZFU1MFlsSTZDYW9aUjdRUkx5NHN6T3QvS0J4Z3R5?=
 =?utf-8?B?NERYT0pqKzZ1elFDd3F6cGNOZjhKa0UwcVZzMEhURTdvajdvcldjMUw4WWZj?=
 =?utf-8?B?MkI2Z3UwNG92SThiK0Z2aUdzR05xT04wQis3WUtrbXZMWU1mYmYzQ090UUNQ?=
 =?utf-8?B?MDJTK1Fla2doeS9KVGpibEc0WklVMGYzOTZEaTRKVVYxWkhZd2ZUOXl3a1Bx?=
 =?utf-8?B?eEJaeUR0UmhrSkhnM0pKa0Nyekl3QWI4V2hxWGZwdjMrZ2xxU2JSakMwcnFr?=
 =?utf-8?B?YUlKU04wZ1BMT3FkTkgvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3187AAACD18CCD418C0763966CBD457B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c8071b-86c6-478b-bc79-08d97ccd8507
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 07:00:39.0706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMmce2+uVHXgTDry9GiCD1ojKOL7QAPG7gd/NE003Skz5xFezP/eSKnlLlHO4yTwPwqPQ7cZu5MbeAjNave7IImIgXLXiQRA4RMGpPV+R4tB8BBbQFglkHmhILVMF1c8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5011
X-Proofpoint-GUID: 2KKReqwGrWqsba8d7_sj25Y1vQ8Js6u0
X-Proofpoint-ORIG-GUID: 2KKReqwGrWqsba8d7_sj25Y1vQ8Js6u0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210045

DQpPbiAyMS4wOS4yMSAwOTo0OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjEuMDkuMjEg
MDg6MzgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDIxLjA5LjIx
IDA5OjA3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDIxLjA5LjIxIDA3OjUxLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMjEuMDkuMjEgMDg6MjAs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+PiBPbiAyMS4wOS4yMSAwMToxNiwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+IE9uIE1vbiwgMjAgU2VwIDIwMjEsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+PiBPbiAyMC4wOS4yMSAxNDozMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDIwLjA5LjIxIDA3OjIzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+PiBIZWxsbywgU3RlZmFubyENCj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+IE9uIDE4LjA5LjIxIDAwOjQ1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+
Pj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gV2h5IGRvIHlvdSB3
YW50IHRvIGVuYWJsZSBwY2liYWNrIG9uIEFSTT8gSXMgaXQgb25seSB0byAiZGlzYWJsZSIgYSBQ
Q0kNCj4+Pj4+Pj4+Pj4gZGV2aWNlIGluIERvbTAgc28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFz
c2lnbmVkIHRvIGEgRG9tVT8NCj4+Pj4+Pj4+PiBOb3Qgb25seSB0aGF0DQo+Pj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4+IEkgYW0gYXNraW5nIGJlY2F1c2UgYWN0dWFsbHkgSSBkb24ndCB0aGluayB3ZSB3
YW50IHRvIGVuYWJsZSB0aGUgUFYgUENJDQo+Pj4+Pj4+Pj4+IGJhY2tlbmQgZmVhdHVyZSBvZiBw
Y2liYWNrIG9uIEFSTSwgcmlnaHQ/IFRoYXQgd291bGQgY2xhc2ggd2l0aCB0aGUgUENJDQo+Pj4+
Pj4+Pj4+IGFzc2lnbm1lbnQgd29yayB5b3UgaGF2ZSBiZWVuIGRvaW5nIGluIFhlbi4gVGhleSBj
b3VsZG4ndCBib3RoIHdvcmsgYXQNCj4+Pj4+Pj4+Pj4gdGhlIHNhbWUgdGltZS4NCj4+Pj4+Pj4+
PiBDb3JyZWN0LCBpdCBpcyBub3QgdXNlZA0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBJZiB3ZSBv
bmx5IG5lZWQgcGNpYmFjayB0byAicGFyayIgYSBkZXZpY2UgaW4gRG9tMCwgd291bGRuJ3QgaXQg
YmUNCj4+Pj4+Pj4+Pj4gcG9zc2libGUgYW5kIGJldHRlciB0byB1c2UgcGNpLXN0dWIgaW5zdGVh
ZD8NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IE5vdCBvbmx5IHRoYXQsIHNvIHBjaS1zdHViIGlzIG5v
dCBlbm91Z2gNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFRoZSBmdW5jdGlvbmFsaXR5IHdoaWNoIGlz
IGltcGxlbWVudGVkIGJ5IHRoZSBwY2liYWNrIGFuZCB0aGUgdG9vbHN0YWNrDQo+Pj4+Pj4+Pj4g
YW5kIHdoaWNoIGlzIHJlbGV2YW50L21pc3NpbmcvbmVlZGVkIGZvciBBUk06DQo+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+PiAxLiBwY2liYWNrIGlzIHVzZWQgYXMgYSBkYXRhYmFzZSBmb3IgYXNzaWduYWJs
ZSBQQ0kgZGV2aWNlcywgZS5nLiB4bA0KPj4+Pj4+Pj4+IMKgwqDCoMKgIMKgwqAgcGNpLWFzc2ln
bmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywgd2hlbmV2
ZXIgdGhlDQo+Pj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoCB0b29sc3RhY2sgbmVlZHMgdG8ga25vdyB3
aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2ggaXQgcmVhZHMNCj4+Pj4+Pj4+
PiDCoMKgwqDCoCDCoMKgIHRoYXQgZnJvbSB0aGUgcmVsZXZhbnQgc3lzZnMgZW50cmllcyBvZiB0
aGUgcGNpYmFjay4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IDIuIHBjaWJhY2sgaXMgdXNlZCB0byBo
b2xkIHRoZSB1bmJvdW5kIFBDSSBkZXZpY2VzLCBlLmcuIHdoZW4gcGFzc2luZyB0aHJvdWdoDQo+
Pj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoCBhIFBDSSBkZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3Vu
ZCBmcm9tIHRoZSByZWxldmFudCBkZXZpY2UgZHJpdmVyIGFuZCBib3VuZA0KPj4+Pj4+Pj4+IMKg
wqDCoMKgIMKgwqAgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcgaXQgaXMgbm90IHJlcXVp
cmVkIHRoYXQgdGhlIGRldmljZSBpcyBib3VuZCB0bw0KPj4+Pj4+Pj4+IMKgwqDCoMKgIMKgwqAg
cGNpYmFjaywgYnV0IHBjaWJhY2sgaXMgYWdhaW4gdXNlZCBhcyBhIGRhdGFiYXNlIG9mIHRoZSBw
YXNzZWQgdGhyb3VnaCBQQ0kNCj4+Pj4+Pj4+PiDCoMKgwqDCoCDCoMKgIGRldmljZXMsIHNvIHdl
IGNhbiByZS1iaW5kIHRoZSBkZXZpY2VzIGJhY2sgdG8gdGhlaXIgb3JpZ2luYWwgZHJpdmVycyB3
aGVuDQo+Pj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoCBndWVzdCBkb21haW4gc2h1dHMgZG93bikNCj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IDMuIERldmljZSByZXNldA0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4g
V2UgaGF2ZSBwcmV2aW91c2x5IGRpc2N1c3NlZCBvbiB4ZW4tZGV2ZWwgTUwgcG9zc2libGUgc29s
dXRpb25zIHRvIHRoYXQgYXMgZnJvbSB0aGUNCj4+Pj4+Pj4+PiBhYm92ZSB3ZSBzZWUgdGhhdCBw
Y2liYWNrIGZ1bmN0aW9uYWxpdHkgaXMgZ29pbmcgdG8gYmUgb25seSBwYXJ0aWFsbHkgdXNlZCBv
biBBcm0uDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBQbGVhc2Ugc2VlIFsxXSBhbmQgWzJdOg0KPj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4gMS4gSXQgaXMgbm90IGFjY2VwdGFibGUgdG8gbWFuYWdlIHRoZSBh
c3NpZ25hYmxlIGxpc3QgaW4gWGVuIGl0c2VsZg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gMi4gcGNp
YmFjayBjYW4gYmUgc3BsaXQgaW50byB0d28gcGFydHM6IFBDSSBhc3NpZ25hYmxlL2JpbmQvcmVz
ZXQgaGFuZGxpbmcgYW5kDQo+Pj4+Pj4+Pj4gdGhlIHJlc3QgbGlrZSB2UENJIGV0Yy4NCj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+IDMuIHBjaWZyb250IGlzIG5vdCB1c2VkIG9uIEFybQ0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IEl0IGlzIG5laXRoZXIgaW4geDg2IFBWSC9IVk0gZ3Vlc3RzLg0KPj4+Pj4+PiBE
aWRuJ3Qga25vdyB0aGF0LCB0aGFuayB5b3UgZm9yIHBvaW50aW5nDQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4+IFNvLCBsaW1pdGVkIHVzZSBvZiB0aGUgcGNpYmFjayBpcyBvbmUgb2YgdGhlIGJyaWNrcyB1
c2VkIHRvIGVuYWJsZSBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4+Pj4+PiBvbiBBcm0uIEl0IHdhcyBl
bm91Z2ggdG8ganVzdCByZS1zdHJ1Y3R1cmUgdGhlIGRyaXZlciBhbmQgaGF2ZSBpdCBydW4gb24g
QXJtIHRvIGFjaGlldmUNCj4+Pj4+Pj4+PiBhbGwgdGhlIGdvYWxzIGFib3ZlLg0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4gSWYgd2Ugc3RpbGwgdGhpbmsgaXQgaXMgZGVzaXJhYmxlIHRvIGJyZWFrIHRo
ZSBwY2liYWNrIGRyaXZlciBpbnRvICJjb21tb24iIGFuZCAicGNpZnJvbnQgc3BlY2lmaWMiDQo+
Pj4+Pj4+Pj4gcGFydHMgdGhlbiBpdCBjYW4gYmUgZG9uZSwgeWV0IHRoZSBwYXRjaCBpcyBnb2lu
ZyB0byBiZSB0aGUgdmVyeSBmaXJzdCBicmljayBpbiB0aGF0IGJ1aWxkaW5nLg0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IERvaW5nIHRoaXMgc3BsaXQgc2hvdWxkIGJlIGRvbmUsIGFzIHRoZSBwY2lmcm9u
dCBzcGVjaWZpYyBwYXJ0IGNvdWxkIGJlDQo+Pj4+Pj4+PiBvbWl0dGVkIG9uIHg4NiwgdG9vLCBp
biBjYXNlIG5vIFBWIGd1ZXN0cyB1c2luZyBQQ0kgcGFzc3Rocm91Z2ggaGF2ZSB0bw0KPj4+Pj4+
Pj4gYmUgc3VwcG9ydGVkLg0KPj4+Pj4+PiBBZ3JlZSwgdGhhdCB0aGUgZmluYWwgc29sdXRpb24g
c2hvdWxkIGhhdmUgdGhlIGRyaXZlciBzcGxpdA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBTbywgSSB0
aGluayB0aGlzIHBhdGNoIGlzIHN0aWxsIGdvaW5nIHRvIGJlIG5lZWRlZCBiZXNpZGVzIHdoaWNo
IGRpcmVjdGlvbiB3ZSB0YWtlLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNvbWUga2luZCBvZiB0aGlz
IHBhdGNoLCB5ZXMuIEl0IG1pZ2h0IGxvb2sgZGlmZmVyZW50IGluIGNhc2UgdGhlIHNwbGl0DQo+
Pj4+Pj4+PiBpcyBkb25lIGZpcnN0Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgZG9uJ3QgbWluZCBk
b2luZyBpdCBpbiBlaXRoZXIgc2VxdWVuY2UuDQo+Pj4+Pj4+Pg0KPj4+Pj4+PiBXaXRoIHRoaXMg
cGF0Y2ggd2UgaGF2ZSBBcm0gb24gdGhlIHNhbWUgcGFnZSBhcyB0aGUgYWJvdmUgbWVudGlvbmVk
IHg4NiBndWVzdHMsDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGUuZy4gdGhlIGRyaXZlciBoYXMgdW51c2Vk
IGNvZGUsIGJ1dCB5ZXQgYWxsb3dzIEFybSB0byBmdW5jdGlvbiBub3cuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEF0IHRoaXMgc3RhZ2Ugb2YgUENJIHBhc3N0aHJvdWdoIG9uIEFybSBpdCBpcyB5ZXQgZW5v
dWdoLiBMb25nIHRlcm0sIHdoZW4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gdGhlIGRyaXZlciBnZXRzIHNw
bGl0LCBBcm0gd2lsbCBiZW5lZml0IGZyb20gdGhhdCBzcGxpdCB0b28sIGJ1dCB1bmZvcnR1bmF0
ZWx5IEkgZG8gbm90DQo+Pj4+Pj4+DQo+Pj4+Pj4+IGhhdmUgZW5vdWdoIGJhbmR3aWR0aCBmb3Ig
dGhhdCBwaWVjZSBvZiB3b3JrIGF0IHRoZSBtb21lbnQuDQo+Pj4+Pj4NCj4+Pj4+PiBUaGF0J3Mg
ZmFpciBhbmQgSSBkb24ndCB3YW50IHRvIHNjb3BlLWNyZWVwIHRoaXMgc2ltcGxlIHBhdGNoIGFz
a2luZyBmb3INCj4+Pj4+PiBhbiBlbm9ybW91cyByZXdvcmsuIEF0IHRoZSBzYW1lIHRpbWUgSSBk
b24ndCB0aGluayB3ZSBzaG91bGQgZW5hYmxlIHRoZQ0KPj4+Pj4+IHdob2xlIG9mIHBjaWJhY2sg
b24gQVJNIGJlY2F1c2UgaXQgd291bGQgYmUgZXJyb25lb3VzIGFuZCBjb25mdXNpbmcuDQo+Pj4+
DQo+Pj4+IEFzIHRoZSBmaXJzdCBzdGFnZSBiZWZvcmUgdGhlIGRyaXZlciBpcyBzcGxpdCBvciBp
ZmRlZidzIHVzZWQgLSBjYW4gd2UgdGFrZSB0aGUgcGF0Y2gNCj4+Pj4gYXMgaXMgbm93PyBJbiBl
aXRoZXIgd2F5IHdlIGNob3NlIHRoaXMgbmVlZHMgdG8gYmUgZG9uZSwgZS5nLiBlbmFibGUgY29t
cGlsaW5nDQo+Pj4+IGZvciBvdGhlciBhcmNoaXRlY3R1cmVzIGFuZCBjb21tb24gY29kZSBtb3Zl
Lg0KPj4+DQo+Pj4gRmluZSB3aXRoIG1lIGluIHByaW5jaXBsZS4gSSBuZWVkIHRvIHRha2UgYSBt
b3JlIHRob3JvdWdoIGxvb2sNCj4+PiBhdCB0aGUgcGF0Y2gsIHRob3VnaC4NCj4+IE9mIGNvdXJz
ZQ0KPj4+DQo+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBJIGFtIHdvbmRlciBpZiB0aGVyZSBpcyBhIHNp
bXBsZToNCj4+Pj4+Pg0KPj4+Pj4+IGlmICgheGVuX3B2X2RvbWFpbigpKQ0KPj4+Pj4+IMKgwqDC
oMKgwqDCoCByZXR1cm47DQo+Pj4+Pj4NCj4+Pj4+PiBUaGF0IHdlIGNvdWxkIGFkZCBpbiBhIGNv
dXBsZSBvZiBwbGFjZXMgaW4gcGNpYmFjayB0byBzdG9wIGl0IGZyb20NCj4+Pj4+PiBpbml0aWFs
aXppbmcgdGhlIHBhcnRzIHdlIGRvbid0IGNhcmUgYWJvdXQuIFNvbWV0aGluZyBhbG9uZyB0aGVz
ZSBsaW5lcw0KPj4+Pj4+ICh1bnRlc3RlZCBhbmQgcHJvYmFibHkgaW5jb21wbGV0ZSkuDQo+Pj4+
Pj4NCj4+Pj4+PiBXaGF0IGRvIHlvdSBndXlzIHRoaW5rPw0KPj4+Pj4NCj4+Pj4+IFVoIG5vLCBu
b3QgaW4gdGhpcyB3YXksIHBsZWFzZS4gVGhpcyB3aWxsIGtpbGwgcGNpIHBhc3N0aHJvdWdoIG9u
IHg4Ng0KPj4+Pj4gd2l0aCBkb20wIHJ1bm5pbmcgYXMgUFZILiBJIGRvbid0IHRoaW5rIHRoaXMg
aXMgd29ya2luZyByaWdodCBub3csIGJ1dA0KPj4+Pj4gYWRkaW5nIG1vcmUgY29kZSBtYWtpbmcg
aXQgZXZlbiBoYXJkZXIgdG8gd29yayBzaG91bGQgYmUgYXZvaWRlZC4NCj4+Pj4+DQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy94
ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMNCj4+Pj4+PiBpbmRleCBkYTM0Y2U4NWRjODguLjk5MWJh
MGE5YjM1OSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5i
dXMuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jDQo+Pj4+
Pj4gQEAgLTE1LDYgKzE1LDcgQEANCj4+Pj4+PiDCoMKgwqAgI2luY2x1ZGUgPHhlbi94ZW5idXMu
aD4NCj4+Pj4+PiDCoMKgwqAgI2luY2x1ZGUgPHhlbi9ldmVudHMuaD4NCj4+Pj4+PiDCoMKgwqAg
I2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+Pj4+PiArI2luY2x1ZGUgPHhlbi94ZW4uaD4NCj4+Pj4+
PiDCoMKgwqAgI2luY2x1ZGUgInBjaWJhY2suaCINCj4+Pj4+PiDCoMKgwqAgwqAgI2RlZmluZSBJ
TlZBTElEX0VWVENITl9JUlHCoCAoLTEpDQo+Pj4+Pj4gQEAgLTY4NSw4ICs2ODYsMTIgQEAgc3Rh
dGljIGludCB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYs
DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3Ry
dWN0IHhlbmJ1c19kZXZpY2VfaWQgKmlkKQ0KPj4+Pj4+IMKgwqDCoCB7DQo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgaW50IGVyciA9IDA7DQo+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgeGVuX3BjaWJrX2Rl
dmljZSAqcGRldiA9IGFsbG9jX3BkZXYoZGV2KTsNCj4+Pj4+PiArwqDCoMKgIHN0cnVjdCB4ZW5f
cGNpYmtfZGV2aWNlICpwZGV2Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIGlmICgheGVuX3B2
X2RvbWFpbigpKQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pj4+PiDCoMKg
wqAgK8KgwqDCoCBwZGV2ID0gYWxsb2NfcGRldihkZXYpOw0KPj4+Pj4NCj4+Pj4+IFRoaXMgaHVu
ayBpc24ndCBuZWVkZWQsIGFzIHdpdGggYmFpbGluZyBvdXQgb2YgeGVuX3BjaWJrX3hlbmJ1c19y
ZWdpc3Rlcg0KPj4+Pj4gZWFybHkgd2lsbCByZXN1bHQgaW4geGVuX3BjaWJrX3hlbmJ1c19wcm9i
ZSBuZXZlciBiZWluZyBjYWxsZWQuDQo+Pj4+Pg0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmIChw
ZGV2ID09IE5VTEwpIHsNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1FTk9N
RU07DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5idXNfZGV2X2ZhdGFsKGRldiwg
ZXJyLA0KPj4+Pj4+IEBAIC03NDMsNiArNzQ4LDkgQEAgY29uc3Qgc3RydWN0IHhlbl9wY2lia19i
YWNrZW5kICpfX3JlYWRfbW9zdGx5IHhlbl9wY2lia19iYWNrZW5kOw0KPj4+Pj4+IMKgwqDCoCDC
oCBpbnQgX19pbml0IHhlbl9wY2lia194ZW5idXNfcmVnaXN0ZXIodm9pZCkNCj4+Pj4+PiDCoMKg
wqAgew0KPj4+Pj4+ICvCoMKgwqAgaWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAwOw0KPj4+Pj4+ICsNCj4+Pj4+DQo+Pj4+PiBVc2UgI2lmZGVmIENP
TkZJR19YODYgaW5zdGVhZC4NCj4+Pj4NCj4+Pj4gVGhlIHRpdGxlIG9mIHRoaXMgcGF0Y2ggc2F5
cyB0aGF0IHdlIHdhbnQgdG8gYWxsb3cgdGhpcyBkcml2ZXIgZm9yIG90aGVyIGFyY2hzDQo+Pj4+
IGFuZCBub3cgd2Ugd2FudCB0byBpbnRyb2R1Y2UgIiNpZmRlZiBDT05GSUdfWDg2IiB3aGljaCBk
b2Vzbid0IHNvdW5kDQo+Pj4+IHJpZ2h0IHdpdGggdGhhdCByZXNwZWN0LiBJbnN0ZWFkLCB3ZSBt
YXkgd2FudCBoYXZpbmcgc29tZXRoaW5nIGxpa2UgYQ0KPj4+PiBkZWRpY2F0ZWQgZ2F0ZSBmb3Ig
dGhpcywgZS5nLiAiI2lmZGVmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkRfU1VQUF9QViINCj4+
Pj4gb3Igc29tZXRoaW5nIHdoaWNoIGlzIGFyY2hpdGVjdHVyZSBhZ25vc3RpYy4NCj4+Pg0KPj4+
IFNvbWV0aGluZyBsaWtlIHRoYXQsIHllcy4gQnV0IEknZCByYXRoZXIgdXNlIENPTkZJR19YRU5f
UENJREVWX0JBQ0tFTkQNCj4+PiBhY3RpbmcgYXMgdGhpcyBnYXRlIGFuZCBpbnRyb2R1Y2UgQ09O
RklHX1hFTl9QQ0lfU1RVQiBmb3IgdGhlIHN0dWINCj4+PiBmdW5jdGlvbmFsaXR5IG5lZWRlZCBv
biBBcm0uIFhFTl9QQ0lERVZfQkFDS0VORCB3b3VsZCBkZXBlbmQgb24gWDg2IGFuZA0KPj4+IHNl
bGVjdCBYRU5fUENJX1NUVUIsIHdoaWxlIG9uIEFybSBYRU5fUENJX1NUVUIgY291bGQgYmUgY29u
ZmlndXJlZCBpZg0KPj4+IHdhbnRlZC4gVGhlIHNwbGl0dGluZyBvZiB0aGUgZHJpdmVyIGNhbiBz
dGlsbCBiZSBkb25lIGxhdGVyLg0KPj4NCj4+IEhtLCBwY2liYWNrIGlzIG5vdyBjb21waWxlZCB3
aGVuIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkTCoCBpcyBlbmFibGVkDQo+PiBhbmQgd2Ugd2Fu
dCB0byBza2lwIHNvbWUgcGFydHMgb2YgaXRzIGNvZGUgd2hlbiBDT05GSUdfWEVOX1BDSV9TVFVC
IGlzIHNldC4NCj4+IFNvLCBJIGltYWdpbmUgdGhhdCBmb3IgeDg2IHdlIGp1c3QgZW5hYmxlIENP
TkZJR19YRU5fUENJREVWX0JBQ0tFTkQgYW5kIHRoZQ0KPj4gZHJpdmVyIGNvbXBpbGVzIGluIGl0
cyBjdXJyZW50IHN0YXRlLiBGb3IgQXJtIHdlIGVuYWJsZSBib3RoIENPTkZJR19YRU5fUENJREVW
X0JBQ0tFTkQNCj4+IGFuZCBDT05GSUdfWEVOX1BDSV9TVFVCLCBzbyBwYXJ0IG9mIHRoZSBkcml2
ZXIgaXMgbm90IGNvbXBpbGVkLg0KPg0KPiBObywgSSdkIHJhdGhlciBzd2l0Y2ggdG8gY29tcGls
aW5nIHhlbi1wY2liYWNrIHdoZW4gQ09ORklHX1hFTl9QQ0lfU1RVQg0KPiBpcyBzZXQgYW5kIGNv
bXBpbGUgb25seSBwYXJ0cyBvZiBpdCB3aGVuIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQgaXMN
Cj4gbm90IHNldCAodGhpcyB3aWxsIGJlIHRoZSBjYXNlIG9uIEFybSkuDQoNCkJ1dCB0aGlzIHdp
bGwgcmVxdWlyZSB0aGF0IHRoZSBleGlzdGluZyBrZXJuZWwgY29uZmlndXJhdGlvbnMgb3V0IHRo
ZXJlIGhhdmUgdG8gYWRkaXRpb25hbGx5DQoNCmRlZmluZSBDT05GSUdfWEVOX1BDSV9TVFVCIHRv
IGdldCB3aGF0IHRoZXkgaGFkIGJlZm9yZSB3aXRoIHNpbXBseSBlbmFibGluZw0KDQpDT05GSUdf
WEVOX1BDSURFVl9CQUNLRU5ELiBNeSBwb2ludCB3YXMgdGhhdCBpdCBpcyBwcm9iYWJseSBkZXNp
cmFibGUgbm90IHRvIGJyZWFrDQoNCnRoZSB0aGluZ3Mgd2hpbGUgZG9pbmcgdGhlIHNwbGl0L3Jl
LXdvcmsuDQoNCkkgYWxzbyB0aG91Z2h0IHRoYXQgImNvbXBpbGUgb25seSBwYXJ0cyBvZiBpdCB3
aGVuIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQgaXMgbm90IHNldCINCg0KbWF5IGhhdmUgbW9y
ZSBjb2RlIGdhdGVkIHJhdGhlciB0aGFuIHdpdGggZ2F0aW5nIHVud2FudGVkIGNvZGUgd2l0aCBD
T05GSUdfWEVOX1BDSV9TVFVCLg0KDQpJIGFtIG5vdCBxdWl0ZSBzdXJlIGFib3V0IHRoaXMgdGhv
dWdoLg0KDQo+DQo+IFRoaXMgaXMgYW5vdGhlciBzdGVwIGluIHRoZSByaWdodCBkaXJlY3Rpb24g
cHJlcGFyaW5nIHRoZSBzcGxpdC4NCj4NCj4gQnV0IGFzIHNhaWQgYmVmb3JlLCB0aGlzIGlzIG5v
dCBhIHJlcXVpcmVtZW50IGJ5IG1lIHRvIHRha2UgeW91ciBwYXRjaC4NClRoYW5rIHlvdQ0KPg0K
Pg0KPiBKdWVyZ2Vu

