Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9CB41C12D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198886.352617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVQe-0001V6-7W; Wed, 29 Sep 2021 08:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198886.352617; Wed, 29 Sep 2021 08:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVQe-0001Sg-44; Wed, 29 Sep 2021 08:59:04 +0000
Received: by outflank-mailman (input) for mailman id 198886;
 Wed, 29 Sep 2021 08:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVVQd-0001Sa-As
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:59:03 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d7a7094-2103-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:59:01 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18T84kr4019554;
 Wed, 29 Sep 2021 08:58:57 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bcg0n0t1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 08:58:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6321.eurprd03.prod.outlook.com (2603:10a6:20b:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 08:58:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 08:58:53 +0000
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
X-Inumbo-ID: 7d7a7094-2103-11ec-bcdf-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgXLDAgFNTrivUDY3h1uFxMsyfKSbi19j524k8TmEQiLCobo5uCEXWpCXe/RYBpfiKRsUbZ3BueMOcj6leOfCK/cyxwn065NEPC+oMHyWkbIhSP8KVYgx3t/Im87HM+0G8DfhS02UhZGFPmKYx7NeXlfCy2yyfQGycUhmaerFtgsWpVZwAFYdTWzzqArJVCIWAQdAkvRQQtTfsnDmOkgfsX1XC2fwuGA8qxPCAceLZtPAnpkorysx3Sjb5F9tVXrdfYqL1mXTdfRvudIwkl/iKMo6sZzGgK0VJXvczATLDfAEiUl9vsvA3FJs8/fsfiFGWg17DbwDXUdzxzFqYHF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Y9yIjwUgEDjl0IhuAuptyB1XfD7qbghho+J9Lpgir7E=;
 b=O8xpdbKcKIiVw5H26FUPY+INu4TadXddB6ijbI1aGBw1WVIxgD0JjszAq8RoNoGbaJUFCTfdPn72CXk2IOnq8gMqJYtDCMBVMp+ETmxbGVyuEgf/sQrEIfqLirk1Y/SPUNGwnGZtTWz3wFR00EmGZSRi9NxPwDrb6Sir8xbP5KZVNq0pwuPOR54OcSj/bxMn8ngGQaYDdTVgDr++ng0SgeE72PEQlJ69WlMLCAa3w+pCEY0BB2TD3J8sRob9aFml97F2dhEByMHoeUSMp8hu9fA+EXp9RX1H1J9asjQPDXId43pJALsUYbxbSi3PTMW4uRNhBhJ4VZrVzzT/4viccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9yIjwUgEDjl0IhuAuptyB1XfD7qbghho+J9Lpgir7E=;
 b=Kqg0FMXGm0eBqOr9YHLfZk69D6HhEfUGPmmc1qBt2Uxpv74NwAWb0qyzWITQN83cTwD2sFqhInyxBNnmzhopWIZIiG46lU3zlF39pigiUTa/9B7RGTpZctj9WHVwlS1Qt+SX+VqC9K5WK6yE7nsCP51RA47aY0LyLgw1GEeBwjAYUhY7n/WV4r/zFpeFAi93AwCivMrdtnpFdiXnmWXldowM9o8lzeYsBZCoiFUwIlcqlXLiVhjJqpxXAYqaAK8Uqdv6ik9hO6/cL32PXz1t+icUF6d+an45i2qwCISsfwT0FNln8W6lgJAkrmaE2qpebkT5Omvq6aMt54fVsHeRxA==
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
        Michal
 Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXsHpCfe0n3k8oF0eTl7KOfxT3R6u6ssAAgAAA3gCAAAIlAIAAA4oAgAAGMQA=
Date: Wed, 29 Sep 2021 08:58:53 +0000
Message-ID: <fd611978-b6f8-3ded-5b5d-f132c8a6de5c@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
 <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
 <f59b48fd-564e-64f8-1422-fb842957f213@suse.com>
 <7ae0fad7-499b-1bda-5c9e-9313265abf8c@epam.com>
 <30b8c6b8-5dc4-6972-eaf9-76024f7e97bb@suse.com>
In-Reply-To: <30b8c6b8-5dc4-6972-eaf9-76024f7e97bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ece8db52-d26f-4b28-ed9a-08d983275cc5
x-ms-traffictypediagnostic: AM0PR03MB6321:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6321E5042F833AF29B19D275E7A99@AM0PR03MB6321.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sUq94av34TcaakcrW70YQsXEq5kIGYdkn6rjmRF7gami1O9cxHTGqU4bInhenLT9qb90zT05KmrtlKKzUzU4Ej7hLWaUboDdkngASRcIIETbdnnzd/Oicx+P0oQeSysSXQvVIc8uN3VI7LGi1CVQkBPXlKhZtPRijMNIcOjF8lprKduVNfwg0qPDarGoJIbq6mWdZbPUPNbQZvXAIHoG8QbdLcWK/sxpuepeywoMoawI/4RP2cettPdDEldvnv5ffvEidWJhRVBjMZAV9BEjJJ/zRxaPR50fDYHV0jj+wuGZM/kS0UJ4WnleO/eqJg+pC84zjR3/DFcbrcw+AFUpaZpDT0oPDn4JW8Z5W9LUnbj2c26nUuJRx/z2deQ3F2nBi+3q2+jBjql6FFFTfR6RnqJyKSJv+9oeudo8TP0tBZ5/qoeM9/4m6wkGhDmYMyY1mJ9WnXfZR9YL/KRPLky99D4u8sCRZ0isjxDpyvxmVqu6meJ9UJA+AITpvIzy43vgeN6PNB0eX/oT9AKaqXVL6gFPq2gsZ80U1S9/RSnVKRNJkOXnj4nc3luvYM1gA7lTXI4d+IpoHYSFWpZaCP8hREn6+j/ExTLkyqIZ2/oWgWf65QResA8PFteChsi58q/4nFbuwjeZks23+srt7e6s/RbCkPsBKXWx9N3o5S5cMvlMZK8sHqZ0mzysZdC3/Mx6QmvgJMhXyGx4g1Nnv0g4by6+k7AHyFNM/F6XGWq4Gko=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(2616005)(508600001)(36756003)(316002)(4326008)(6916009)(38070700005)(76116006)(122000001)(38100700002)(26005)(31696002)(86362001)(186003)(2906002)(8676002)(6512007)(66446008)(64756008)(66556008)(66476007)(31686004)(55236004)(6486002)(53546011)(5660300002)(54906003)(6506007)(8936002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmNwNjAydFFoYkpjbFhpQ3RaaWlRUnZmdWFuaXhueGFGQnJ5NTA4cFcyWTNz?=
 =?utf-8?B?ZDl3UkNhZHdUSG9TVHFSTmg5WVZNb1lCUnF3TVlldUxuMVdKMlJtWHJPSE5h?=
 =?utf-8?B?WFcyR1ZkVDBXY0g0b1UyQnBGbmVFMEdiOUpBWVRHTEd0SFRWblNScmM0dEJM?=
 =?utf-8?B?NXBJdnZBTXM0WUtoM3F1akJLcGZaQ3FPbVhSVzFDY0RCVlN5ai90N0dJd0tN?=
 =?utf-8?B?R2dLUlpWcVQ5Wktjdmg2bmFmR2tnUDA3aUtJSGJqNWVJYWZkNmsyYUpDdmRn?=
 =?utf-8?B?UThpM2UxcFcrMUFIbDFxbWs3ZGtqWml6ZHl5dWlISnovTTd2ajV3QUlLdHpF?=
 =?utf-8?B?aTBFb0JEUjRHT01kRHRHUVk2cTV1ZzVDYzZiNzRpWm1neFNSc3N0M3ZSb3FI?=
 =?utf-8?B?Q2gzdllzZHBMMXROWm9LZTIxWTdDVkJNNXhpemltTTkrSHFPL2hQaU56Ukwr?=
 =?utf-8?B?VG96R21iVUpBRHJFUU5rTkM2eUVIRjRxM1NBV2U1RExvQzBKRWQrcm03WkNC?=
 =?utf-8?B?bFZWZGRaQUc0TmV2b09keTIwOTRDbzlWQytCSWE1MjRZR2lVSkRaN3p3WktW?=
 =?utf-8?B?YndjUHE1V1RXeHRLYVpzV0lKd3BPUUE5Y0M4N3pVY3l6ZUxZMVFYd1BRTGU3?=
 =?utf-8?B?U2dUWmhqemFaR0IvQXgzMmN2NTVqWnkzTHIrdnRoeDFlbEluOE1BMWtrREhI?=
 =?utf-8?B?aHM3VXl6aU9XekxkSVBxb29mRFQzLzRkZWsvRmE0L1d4Q0FMeDE2MXFpM3hh?=
 =?utf-8?B?ZC9VVjZNdkd1RlBUNi95bVdDc3VDNzZsZURONEpIVTZFVDMzZDloMU53V21h?=
 =?utf-8?B?TEJYeFR5dHhVN1E5czl0aE9DUU0zbGZubUtuakgvcUhJQ0RSRktzWThhRG54?=
 =?utf-8?B?ZmJNYy9CTnUwQ2cwKzN6QmUzdmN3RUtRNjdyaVY1bTRIWkVOTUxvcjRlQ3du?=
 =?utf-8?B?WEo2QzZ1bDY0VEx6ZENxNWxZZUZURWxxcTEvOFl6ZElEUHRFTEZpemZVRXA5?=
 =?utf-8?B?alZ4T1BWT1VxUjhCcm81ZnI0WEp2VU9nUHFaNlgraHBMK2pRdENsVk91ZWR5?=
 =?utf-8?B?YjVqeEdra00wdkZQMGNtTGJVZjVlK09RMnBiRWxNUnc5M1ZRbHFOdVE4bHBT?=
 =?utf-8?B?V2tCOGxlQ094TmpyYmZWaHFzQk14dnJuV2N2djJPQ1dZZGdPZHFtL3JpNS9t?=
 =?utf-8?B?cFlBTG52L2pzcTIzUnNNNGlCTTZsdHcwRE9CK01HTWNlMVh0ZG1Gblh0V2JM?=
 =?utf-8?B?bnFoOGtmNXBTVXhxSFRWSWtLcFVOVDdvcXQrV0w5NXVPT2NlYWo2djJiVGJl?=
 =?utf-8?B?czAxa0k3SkRrcTJTR3BHQmRES2ZKZ0JMa05BZGN2d2tXUEVUVXdGUDRvM3k2?=
 =?utf-8?B?M1NPS2J1YmdWZEk0bmtpdUQxUmZHTFJxem9pVkRSSUp2RkF6UUZIaEh3STk0?=
 =?utf-8?B?cmdla2YxN1RkK2V1M0tmRjBWcVJIZlFQcGxkWnJOQzNDaDNuTysxVVZya2Vv?=
 =?utf-8?B?OWZldkE0aVRlWG1UNGxFbTE5NEo1ZDVXQ3drQVNSSzlZR0lDc1gzbS9zaWtl?=
 =?utf-8?B?SG9MTjNhSlEwL1VQc1g4SWd4dk95NU1BSTFDOUZUQjR4SlJqMzA0cEJwdTlT?=
 =?utf-8?B?Wkx4VkthZ2hvL2dpZ0dnOHhGR0hmZm4zRHllcFFpelJCd3FsMDg4U1k3aW5G?=
 =?utf-8?B?UG0xYlhjdEFveXB5UGtKNVN6bE1McFBaTnkwQ0FjbVhMQTZDUEptSFNKNTRM?=
 =?utf-8?B?d1ZEb3FFZXBnZmRSOTlyZUdLTUdJeldNdXJESlM3QUdOVTdLa2h6d05NZEZk?=
 =?utf-8?B?Tk9POWxRUEVZTGJFL2E2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EA9130C972C854584E84C300159F5C3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece8db52-d26f-4b28-ed9a-08d983275cc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 08:58:53.1939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YyUE0/6/PI3dzwvortDLBEjbJM4xTBw6HNVNbYBvWPK/xtNjs9ydwX0IJFIZ/m/L/BR+brD8wc6v/qKPsRz9iyj0GBAtVaz+d/t0cVjmQbx0yOqzPYxLzZcpp9yvzdn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6321
X-Proofpoint-ORIG-GUID: ALes0xBjEU6Cnxdob-dgk9DJ8l-a9hSL
X-Proofpoint-GUID: ALes0xBjEU6Cnxdob-dgk9DJ8l-a9hSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=730 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290053

DQpPbiAyOS4wOS4yMSAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI5LjA5LjIwMjEg
MTA6MjQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjkuMDkuMjEgMTE6
MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI5LjA5LjIwMjEgMTA6MTMsIE1pY2hhbCBP
cnplbCB3cm90ZToNCj4+Pj4gT24gMjMuMDkuMjAyMSAxNDo1NCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+PiBAQCAtMTQ5LDYgKzE3MiwxMCBAQCBib29sIHZwY2lfcHJvY2Vz
c19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4gICAgICAgICAgICAgICAgaWYgKCAhYmFy
LT5tZW0gKQ0KPj4+Pj4gICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4gICAgDQo+
Pj4+PiArICAgICAgICAgICAgZGF0YS5zdGFydF9nZm4gPSBpc19oYXJkd2FyZV9kb21haW4odi0+
dnBjaS5wZGV2LT5kb21haW4pID8NCj4+Pj4+ICsgICAgICAgICAgICAgICAgX2dmbihQRk5fRE9X
TihiYXItPmFkZHIpKSA6DQo+Pj4+PiArICAgICAgICAgICAgICAgIF9nZm4oUEZOX0RPV04oYmFy
LT5ndWVzdF9hZGRyKSk7DQo+Pj4+IEkgYmVsaWV2ZSB0aGlzIHdvdWxkIGxvb2sgYmV0dGVyIHdp
dGggdGhlIGZvbGxvd2luZyBhbGlnbm1lbnQ6DQo+Pj4+IGRhdGEuc3RhcnRfZ2ZuID0gaXNfaGFy
ZHdhcmVfZG9tYWluKHYtPnZwY2kucGRldi0+ZG9tYWluKQ0KPj4+PiAgICAgICAgICAgICAgICAg
ICAgPyBfZ2ZuKFBGTl9ET1dOKGJhci0+YWRkcikpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICA6
IF9nZm4oUEZOX0RPV04oYmFyLT5ndWVzdF9hZGRyKSk7DQo+Pj4gRldJVyBJIGFncmVlLCB5ZXQg
cGVyc29uYWxseSBJIHRoaW5rIHRoZSBjb25kaXRpb25hbCBvcGVyYXRvciBoZXJlDQo+Pj4gZXZl
biB3YW50cyB0byBtb3ZlIGluc2lkZSB0aGUgX2dmbihQRk5fRE9XTigpKS4NCj4+IEkgY2FuIGRv
IGl0IGFzIHdlbGw6DQo+Pg0KPj4gZGF0YS5zdGFydF9nZm4gPSBfZ2ZuKFBGTl9ET1dOKGlzX2hh
cmR3YXJlX2RvbWFpbih2LT52cGNpLnBkZXYtPmRvbWFpbikgPyBiYXItPmFkZHIgOiBiYXItPmd1
ZXN0X2FkZHIpKQ0KPj4gQnV0LCBoZWxwIG1lIHBsZWFzZSBicmVha2luZyBpdCBpbnRvIG11bHRp
bGluZSB3aXRoIDgwIGNoYXJzIHJlc3BlY3RlZA0KPiBCZXNpZGVzIHRoZSBvcHRpb24gb2YgbGF0
Y2hpbmcgdi0+dnBjaS5wZGV2LT5kb21haW4gb3INCj4gaXNfaGFyZHdhcmVfZG9tYWluKHYtPnZw
Y2kucGRldi0+ZG9tYWluKSBpbnRvIGEgaGVscGVyIHZhcmlhYmxlLA0KPg0KPiAgICAgICAgICAg
ICAgZGF0YS5zdGFydF9nZm4gPQ0KPiAgICAgICAgICAgICAgICAgICBfZ2ZuKFBGTl9ET1dOKGlz
X2hhcmR3YXJlX2RvbWFpbih2LT52cGNpLnBkZXYtPmRvbWFpbikNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA/IGJhci0+YWRkciA6IGJhci0+Z3Vlc3RfYWRkcikpOw0KSSdsbCBn
byB3aXRoIHRoaXMgb25lLCB0aGFuayB5b3UNCj4NCj4gb3INCj4NCj4gICAgICAgICAgICAgIGRh
dGEuc3RhcnRfZ2ZuID0NCj4gICAgICAgICAgICAgICAgICAgX2dmbihQRk5fRE9XTihpc19oYXJk
d2FyZV9kb21haW4odi0+dnBjaS5wZGV2LT5kb21haW4pDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPyBiYXItPmFkZHINCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6IGJhci0+Z3Vlc3RfYWRkcikpOw0KPg0KPiBKYW4NCj4=

