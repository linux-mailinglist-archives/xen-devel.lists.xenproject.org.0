Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1B41C559
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199106.352963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZRm-0003y1-Kh; Wed, 29 Sep 2021 13:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199106.352963; Wed, 29 Sep 2021 13:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZRm-0003ve-Gi; Wed, 29 Sep 2021 13:16:30 +0000
Received: by outflank-mailman (input) for mailman id 199106;
 Wed, 29 Sep 2021 13:16:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVZRk-0003pX-Me
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:16:28 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aaaf67c-707c-4d58-9bdd-4c6db898ded2;
 Wed, 29 Sep 2021 13:16:23 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TCYjvd027853; 
 Wed, 29 Sep 2021 13:16:18 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bcnhnru2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 13:16:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5939.eurprd03.prod.outlook.com (2603:10a6:208:15e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:16:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 13:16:11 +0000
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
X-Inumbo-ID: 0aaaf67c-707c-4d58-9bdd-4c6db898ded2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM3dmphBoB1ny7yVlImfhSWZSIlwK7Cqa3WoGcUMbt9u8Cq+punH5opiQcpmHZ9rbkh3w6mscMiM3482RDP1GsdyRLAOunVLD1cLWF+RVRd/S0vu9ia9fFKTlBFKH/Ebgtu5+98YZAJo/ak/7GbvmpIur6hqtjMlbRKeO4zRBS6QSooxXVN35FlGvLo6GWqnAbm/uMbmLeddmbTDv16895pW3C+QksjvvA3P++mV5IPFs7IFwmjfkC8ZfoQsKvvzmjWPqYPG4Lk76pd0x6lPAiaTy96JtbaqTUKBAWoe7OVUn0fVaQxNVGQrOXA46uk2wDvXyicQQA5sce5xX7Tdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xul+tKc9Ri+hyTebX1TzVUIGgFxYiU4G3VIfMrQDQJg=;
 b=ZFNFreQTGVqY39Gu9EfSHjHgt60jdETfldX0hTQmk395FLZ5gELsNVPYfs67Si8Kl58zu8GHfp2X8s2zVwsVj4Tnpt3Ntqs/XsOnM0h9M9X9n8GrXLMsvk48Fdwh52BUvjK1fzTjoG+EfYd17biKmb8xzOipQqbFa6hgK3F+2n6dbdku5QXn9eZ/9klW2HOYtN8jmMRfWXAVHkxs34TUHB49pUiZbgI9jm7zkROxbpU2SbmK3PBqI3htX4Y7IRzxSNNHpYG8h8WKIvVGf7nnuSGnqEB3fQMh6F4U4HuEX9HRtbMqftsB3VsXGS06YLqBuVJOYbs3RE6i7sN6pGYlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xul+tKc9Ri+hyTebX1TzVUIGgFxYiU4G3VIfMrQDQJg=;
 b=aOB2h5rFOD7MpK1rPLkpPr96bEnqy4jhri9nONCSxF8vQ8EG5EhrI2sDksRZOa9H41JeAu8Q6us2+HndVithzACZ/eOv9/zZQ79nDT8ckYBl3gzaXPxWmIPJ5otveruZ/3C4Os+gDgO/nt2f0gwonvcGKqSyLBIjLkxsAleqx2LDOjM83HBcEBY+86y47v/DARaBIPK/Ox5k7wllL0E6MDAA4/fdMGXG4w++bQwgEYCb18OzlZ4kbe666QffxTReAiUF0aJc3GPkWsXzSDkroP6QQy4Jp8KeDWPOJDtMcsVnoYjMj4ouq805mcoA9zhQkvPGMOFy9KKNERsZfhc2lQ==
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
 Orzel <michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: 
 AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyAgAFQpACAAAGzgIAALsGAgAAQSwCAAAYBgA==
Date: Wed, 29 Sep 2021 13:16:11 +0000
Message-ID: <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
 <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
 <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
In-Reply-To: <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a123798-a3e4-4cc0-6fa5-08d9834b4edb
x-ms-traffictypediagnostic: AM0PR03MB5939:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5939635D1C0437D51256C25BE7A99@AM0PR03MB5939.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QWTfi83xE3jONs9fIP3Cp157WsgQge0xK8sl0Nv+m6aoxijyrogELsUMDCSE9qApyJCPGnYNlBrPFKTdajwBgtYlpsKq2OjHIyol67gsiRjVS1lG6z0TrD3c3MiYZPIE6PNQ8HtdIH4tC7u0BDNLyTBOkl29cheky7L1URr+HHuO1nL0Y/gJSoColpMWovBgMt+HAGZQeXqnnA4KsH7k+n4JwxM6RhI0nJRY1W1Sj+dtkBbAurCc2u0SoHrjcBt8/cN4Yptrjq3VTrKeymbPLItB4IjH9Jy3Z0NyoDEr7Oe7EbfN0QL/61KtAcG9w6MZfpCIlhFlDaMyOyo6N4uG6jISs/xBtpLipfoHM9RAhEO1ewOUDVyGYPdOSVniiLU8JbCrWUdUxkvvPHbck4ea9gfrk+lWoVv6FtVElLvOy5K3tlBhgWWn3QIJHkBZCcyPvLdKXhYCD9chECNCBAE9ClEddiKm11wH3y7R/+5H04OHgFeOVS6YOLo173G4t7+xkn9PKqya0a0sgVlZwKv5g3M+vO7oq51ZoxFFrWjX+0pygwhXkBhiUmJCjx6lIo0OmiAP9c/rOMwyR+rW81BG9GGZj7HgDPR/fUF6YDEGKD/mWTh/Rh+P4Qh3is4xIjC1886hvPoH1wo1ylsRuw7gkFpTZEDKcrvD06krhZ9/hyHXaUWqEGZeHQplcRb+ULe/sAZRw1jZybemRLbEwnHZDPCpt7ObzbmL49MrIB/3WTM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(53546011)(54906003)(2906002)(55236004)(71200400001)(316002)(6506007)(31686004)(38070700005)(66946007)(31696002)(86362001)(64756008)(66556008)(66476007)(8676002)(38100700002)(122000001)(66446008)(76116006)(91956017)(6486002)(6512007)(4326008)(36756003)(8936002)(83380400001)(107886003)(508600001)(186003)(2616005)(5660300002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1VSZE5VMm9hQmZTVEdoQXdyVXA1aXJMT2x6UFZGbjYzKzQrRm9CM1Z3SUZQ?=
 =?utf-8?B?aVZxMmFFWWtjc0wwSksyZlp1OFMyRk5oa1hlUzUrZWJxMGN6cE12anQvZUdp?=
 =?utf-8?B?NnBrQ1RBRUNZZTRSOHYyL1o2NkppQ0FJTDNrWFRBa0RYN3J1NXRBOFdBSDU4?=
 =?utf-8?B?Tk5naHFqbHBEUTRSUDdBQXdia3ZJMDJqUUswRHZ3UjNHanMwRlN5cTBWWkwr?=
 =?utf-8?B?Q2hGT1hTa2RJNFFZQkZhQkhnSjJ4OU45ZVZCa29RNFFPWlVMTFRmMkdhZWJF?=
 =?utf-8?B?RFhuWDJKSWlPa1Q5OUlnUEpsTkxITk9ONTFnOVRNNnFRSEdHZXRNNzRQekFV?=
 =?utf-8?B?NjhURXRMa2hkN3RzR09pR3h1OG5rd3VSZmMxc1JEUWt2dTVteTA4VGt1ckNw?=
 =?utf-8?B?dTBaMFh5YmV3YXRMYW1ZQ0R3SkxhMVNjQXVWTE0rcUJ2UWdFZjFYTTAydll0?=
 =?utf-8?B?cnNoZ0xxQVA2ZS8rRjNsM3hmK1U2bUhUSzBwSFYxNEpYazJHQTZrOUJuK280?=
 =?utf-8?B?RFF4dFRBbExUYWdpcWowR1ZxR1JlamkxU1lTblo4NTFMSUh4SmxZY0puRjNG?=
 =?utf-8?B?dzg5Q1oxbnd6TkNvZFJSbXg3Sms0akZvNTRtWmpaNXM3bTFvQnBJaXl5elVK?=
 =?utf-8?B?TDNvenJXQzlsTEgrMFZ0UGtEYVgrMFZhY0h6MzRObVgwUk9zM1FCaGs5NDdG?=
 =?utf-8?B?ako2bDM3VE1rQ3FHM1NVcEZ3ZnM2WjUwWkwyTXlGNnd3SENIOUhMem81aVc5?=
 =?utf-8?B?bGdYY1hTbUJITXZNMjdjdFN5MWc3MjFVUUpsTktvbFpmQy83QkFZbnV0WlY5?=
 =?utf-8?B?QkhDdjJuTUxDZFJ4cDcxUmJhOUJOYnlZd21jWnFRbEtiSkdXTUg2NUtEMUQ3?=
 =?utf-8?B?Sm9TNkliWlRtbC9iZ1Z6Z1pYam9DbHErbDVZNWlwcEhjd2NOVy8rNFJ5d08v?=
 =?utf-8?B?QVNCdFExanhwdGl0MXd1Q1NYK0k4QngzZGd2QXY2dkF3eTFhSVZFRmtTaFJa?=
 =?utf-8?B?VllmVExhcVhpOXBMc21RbUFPVlNnYmtmQUFQdmlLczlxUFBoZlFKQVdxU0hZ?=
 =?utf-8?B?a05NQWQreDdVaWdrR08xVnJabDRIVFhqcjhGVUpGRG9QUUhrbjRaZmlRQS8v?=
 =?utf-8?B?aS85QTM5elRyb2I4ZEZtWmg0VHE4UFdOSlB1ZnRoQ1U3NlVVUDFqRW5SMWtN?=
 =?utf-8?B?Q3lpSmZCclBVb1Q0M1VuUTBXenE1ZWFBdERJVkFkYXVHTll0NUg2Wjd3Z284?=
 =?utf-8?B?NjdjaytGM24zNWVnRTVCd1JzV05EcjBVSGZDS1ZvTmZMSVF5dkprNlFZbTB4?=
 =?utf-8?B?Q2xyeC96NDZpWmZFZkJYcnNFNmExMG1XcEQwbVBVL1ZjWHRBTjUrVW1rSHNv?=
 =?utf-8?B?ZEh3S1ZhVU1tQWJzRkFxaTRDaFBpd1JWanBjQkJRRitUSWVvbWRJZUhGbmNt?=
 =?utf-8?B?NzNUNFhZSEhsbEJiUDViOEhrUklEcEtma3hTZXpUWlVDQ3NTcjgyN0FXNFBq?=
 =?utf-8?B?WUI3dTBDN3dkeWtpaXRBNkNwZlJPZ0F5UmhBS1NDWi9kcDlZQ0MzUUs0WXVs?=
 =?utf-8?B?aGpOcXY3VFRmN3A5V0FIM1hNSURqKzZkL1IyM1FSaDZQbXZ2VmFMRWdIL3Ar?=
 =?utf-8?B?elo1NiswQSswUVZWNEdJNXp3T0ZlanYvejdlQXpNWko2U2J2UnRGczRHT1Nj?=
 =?utf-8?B?OGtLOFNob2U1N0pjaFdTd3NTanJIV2ppMXZRYklsQ3FRL2tJTTA2T1hOY05n?=
 =?utf-8?B?WG1Rb2pra1VCSE1wWmtUNm85Yjd0WUhrY3BCMkxsNGV6VnFGM3VRRHh4bFpO?=
 =?utf-8?B?Qko3bnBGMzFoYllETlVYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23D11C7B88ED394A9DA60A83B71581E7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a123798-a3e4-4cc0-6fa5-08d9834b4edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 13:16:11.7001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fA1zQQ0pYrVLV4KlHH29AIyUptQSri3g354c1mQN4J+/lvrUj9rfw+FMGmvTKpGFIdRpySW6fZmY8/DmAW0jYM+IAFYlSDUu5fPlAIU2CVLyTDzZa6MTbl+YMJp980Ea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5939
X-Proofpoint-ORIG-GUID: gWf2HQS8KXZANbUgU5u_z5etfw3S1_VP
X-Proofpoint-GUID: gWf2HQS8KXZANbUgU5u_z5etfw3S1_VP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_05,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=669 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290083

DQpPbiAyOS4wOS4yMSAxNTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI5LjA5LjIwMjEg
MTM6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjkuMDkuMjEgMTI6
MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI5LjA5LjIwMjEgMTE6MDMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBTb3JyeSBmb3IgdG9wIHBvc3RpbmcsIGJ1dCB0
aGlzIGlzIGEgZ2VuZXJhbCBxdWVzdGlvbiBvbiB0aGlzIHBhdGNoL2Z1bmN0aW9uYWxpdHkuDQo+
Pj4+DQo+Pj4+IERvIHlvdSBzZWUgd2UgbmVlZCB0byBnYXRlIGFsbCB0aGlzIHdpdGggQ09ORklH
X0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4gYXMgdGhpcyByZW5kZXJzIGluIHNvbWV3aGF0
IGRlYWQgY29kZSBmb3IgeDg2IGZvciBub3c/IEkgZG8gdGhpbmsgdGhpcyBzdGlsbA0KPj4+PiBu
ZWVkcyB0byBiZSBpbiB0aGUgY29tbW9uIGNvZGUgdGhvdWdoLg0KPj4+IEkgYWdyZWUgaXQgd2Fu
dHMgdG8gbGl2ZSBpbiBjb21tb24gY29kZSwgYnV0IEknZCBzdGlsbCBsaWtlIHRoZSBjb2RlIHRv
DQo+Pj4gbm90IGJsb2F0IHg4NiBiaW5hcmllcy4gSGVuY2UgeWVzLCBJIHRoaW5rIHRoZXJlIHdh
bnQgdG8gYmUNCj4+PiAiaWYgKCAhSVNfRU5BQkxFRCgpICkiIGVhcmx5IGJhaWxvdXQgcGF0aHMg
b3IsIHdoZW5ldmVyIHRoaXMgaXNuJ3QNCj4+PiBwb3NzaWJsZSB3aXRob3V0IGJyZWFraW5nIHRo
ZSBidWlsZCwgcmVzcGVjdGl2ZSAjaWZkZWYtcy4NCj4+IFRoZW4gaXQgbmVlZHMgdG8gYmUgZGVm
aW5lZCBhcyAoeGVuL2RyaXZlcnMvS2NvbmZpZyk6DQo+Pg0KPj4gY29uZmlnIEhBU19WUENJX0dV
RVNUX1NVUFBPUlQNCj4+ICAgwqDCoMKgICMgdlBDSSBndWVzdCBzdXBwb3J0IGlzIG9ubHkgZW5h
YmxlZCBmb3IgQXJtIG5vdw0KPj4gICDCoMKgwqAgZGVmX2Jvb2wgeSBpZiBBUk0NCj4+ICAgwqDC
oMKgIGRlcGVuZHMgb24gSEFTX1ZQQ0kNCj4+DQo+PiBCZWNhdXNlIGl0IG5lZWRzIHRvIGJlIGRl
ZmluZWQgYXMgInkiIGZvciBBcm0gd2l0aCB2UENJIHN1cHBvcnQuDQo+Pg0KPj4gT3RoZXJ3aXNl
IGl0IGJyZWFrcyB0aGUgUENJIHBhc3N0aHJvdWdoIGZlYXR1cmUsIGUuZy4gaXQgY29tcGlsZXMs
DQo+Pg0KPj4gYnV0IHRoZSByZXN1bHRpbmcgYmluYXJ5IGJlaGF2ZXMgd3JvbmcuDQo+Pg0KPj4g
RG8geW91IHNlZSB0aGlzIGFzIGFuIGFjY2VwdGFibGUgc29sdXRpb24/DQo+IExpa2UgYWxsIChv
ciBhdCBsZWFzdCB0aGUgbWFqb3JpdHkpIG9mIG90aGVyIEhBU18qLCBpdCBvdWdodCB0byBiZQ0K
PiAic2VsZWN0Ii1lZCAoYnkgYXJtL0tjb25maWcpLiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGlz
bid0IHBvc3NpYmxlPw0KPiAoSSBkb24ndCBtaW5kIHRoZSAiZGVwZW5kcyBvbiIsIGFzIGxvbmcg
YXMgaXQncyBjbGVhciB0aGF0IGl0IGV4aXN0cw0KPiBzb2xlbHkgdG8gYWxsb3cga2NvbmZpZyB0
byB3YXJuIGFib3V0IGJvZ3VzICJzZWxlY3Qicy4pDQoNClRoZXJlIGlzIHlldCBubyBLY29uZmln
IGV4aXN0cyAoZXZlbiBmb3IgQXJtKSB0aGF0IGVuYWJsZXMgSEFTX1ZQQ0ksDQoNCnRodXMgSSBj
YW4ndCBkbyB0aGF0IGF0IHRoZSBtb21lbnQgZXZlbiBpZiBJIHdhbnQgdG8uIFllcywgdGhpcyBj
YW4gYmUgZGVmZXJyZWQNCg0KdG8gdGhlIGxhdGVyIHN0YWdlIHdoZW4gd2UgZW5hYmxlIFZQQ0kg
Zm9yIEFybSwgYml0IHRoaXMgY29uZmlnIG9wdGlvbiBpcyBzdGlsbA0KDQpjb25zaWRlcmVkIGFz
ICJjb21tb24gY29kZSIgYXMgdGhlIGZ1bmN0aW9uYWxpdHkgYmVpbmcgYWRkZWQNCg0KdG8gdGhl
IGNvbW1vbiBjb2RlIGlzIGp1c3QgZ2F0ZWQgd2l0aCBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQ
UE9SVC4NCg0KV2l0aCB0aGlzIGRlZmluZWQgbm93IGFuZCBub3QgbGF0ZXIgdGhlIGNvZGUgc2Vl
bXMgdG8gYmUgY29tcGxldGUgYW5kIG1vcmUgY2xlYW4NCg0KYXMgaXQgaXMgc2VlbiB3aGF0IGlz
IHRoaXMgY29uZmlndXJhdGlvbiBvcHRpb24gYW5kIGhvdyBpdCBpcyBlbmFibGVkIGFuZCB1c2Vk
IGluIHRoZQ0KDQpjb2RlLg0KDQpTbywgSSBzZWUgbm8gcHJvYmxlbSBpZiBpdCBpcyBkZWZpbmVk
IGluIHRoaXMgS2NvbmZpZyBhbmQgZXZhbHVhdGVzIHRvICJuIiBmb3IgeDg2DQoNCmFuZCBldmVu
dHVhbGx5IHdpbGwgYmUgInkiIGZvciBBcm0gd2hlbiBpdCBlbmFibGVzIEhBU19WUENJLg0KDQoN
Cj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

