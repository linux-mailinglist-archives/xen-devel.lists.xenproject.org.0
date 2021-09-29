Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3E41C67F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 16:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199191.353096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaNa-0000iv-DY; Wed, 29 Sep 2021 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199191.353096; Wed, 29 Sep 2021 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaNa-0000fY-8o; Wed, 29 Sep 2021 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 199191;
 Wed, 29 Sep 2021 14:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVaNY-0000fS-Gb
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:16:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc0aaf5e-212f-11ec-bd06-12813bfff9fa;
 Wed, 29 Sep 2021 14:16:11 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18TE2qAn015422;
 Wed, 29 Sep 2021 14:16:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bcqkg8kpv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 14:16:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 14:16:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 14:16:03 +0000
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
X-Inumbo-ID: cc0aaf5e-212f-11ec-bd06-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9Jo1yfEUNgUGWpk6aXN3zRd3Pi3A24Y+phgANmvl7mTdBLckPGI0Mfa/4O4mkvngEyw7r7G7Wlq6FAO12lsW1m39gBp7qNqnkTxu26jXapFmIxD8U8vHpISDXkQI++qoZi0NEY6DixtFGpleDrV32OZq66/LT9ydm4EAnGYO7nQGqLAWxE7/2w/DpDTSOHKxTZQ3eIGhlMpa2z3BhHw8dfV4wLdNweciUCC8tNq0S0MLD3okQl6xpQ07X0K1fNejsxh6eQYpBSJwFgZqhKa2vkfXhOyB25WeHUKfA6109M9np575SrRXmBFBgtvr//64g3cvB29Q8327Bdv/D4i7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+4u7yU/MZDWTYXQR8WvZ7C+daVkSYKblBrIWXy9kAhg=;
 b=k9TQRDTF2L/MF+5ZZ3Kd/L80cdoJ1Ao6NGYMbdz0nqzLm2px4eyz16fOwV4xy2iXvGnCsOOqGveJb0KTVKQ5za6QFoP0r9J1HU0QKFlY6jHhT2tgHFYcPRLOvPyvI3YB5a2OHMQm5KxadbJjyB6UaPPECQoP2ZBDQ+jfhUlmrgllJ99GjMKPiMSkASfdJl2gvtOkjYcbgIvedVuaFut9dqMHWHgoh8JH4hwBqPnhqzixVGGqlQBuLetMLeJYjBII2+j814oppFO04qc7bf+ZSmnhLdbUW5gXMr54iG+JLmmQDRhoRpBBDaHHZkAxA4DeEqt36i6AOBc8bp4njo0bvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4u7yU/MZDWTYXQR8WvZ7C+daVkSYKblBrIWXy9kAhg=;
 b=YF4hF3JOceYsRHd5r8eF9FqRrox+Hesqzr5iiLVkmkdmDecAsr2i2sO2ly9YsudPyq9vHR7C9sBfkke64rJgdCp9mQq+FhrKjAuxrFSuqQR8aGwl60Gco6O0x8+5UYSu89a2QwUOTfQ9FpDcWpjc0ofRX6sd/mKJf6e1iVcoMOQb8lVW8kpoFKMkbKCW8xNLV50T+yASEG98aW5pvZJhWExQSE5+OhPKxbSlkzijfHcCpV2w0+dGnKjWJXcawkzAnhpDRL67ohu1SkJnbde5JUxWF8hw2bW0ceGzWXb71jTYjR5w6bniZN8T4tPRt8SsrfUSK5DxlIHkkGlo6aNG4Q==
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
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Michal
 Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: 
 AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyAgAFQpACAAAGzgIAALsGAgAAQSwCAAAYBgIAAAhkAgAAHPoCAAAUeAIAAAkQA
Date: Wed, 29 Sep 2021 14:16:03 +0000
Message-ID: <bcc2446a-8384-fa49-d628-63085082d765@epam.com>
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
 <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
 <548561a6-f878-cacc-cda2-30508a43072d@suse.com>
 <5dad2004-f507-3610-cdec-cbf26f77cd5a@epam.com>
 <3f9850d7-9d48-de59-56b7-fe3202f1764e@suse.com>
In-Reply-To: <3f9850d7-9d48-de59-56b7-fe3202f1764e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e034e1b-6e6f-4dcf-51b0-08d98353ab6f
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688104605C5E312E2FF455A5E7A99@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oAj+ymJCRA90DRNYuG+cJdZNa9z1OmJD5MKiUR8R2yzeIoqNtwXJaQzRxrH6jcjG7cBRfZKKXZo+Ep07BQnIT1zd8/gOuon1ApnpOKfLURApfJO9Vv9JwYYBUT68aKwFY3oTG0QMH4tdhfPNe18xulZUBgdhuPpKNP0Pjxkrq4Ys9Cpe1o/mhKo1ZdRK31dcNWOlwJtTx64121h2ZoPPy4BWBdEnrntPU9nLHDAQuC5sOI5oiIHChlUK/Y1J6L6wKIl+8ftgrk6ZBil9QXeaN6N2CCJTiXtpjn2KLNfEmfjCT3QCZCEp6cGhBIwxC2rXwDbVlOS3MGh2l84tr7LtkulnwLMQMtH3ujeRYIZK8hIknBYcLOoZMTH20vBZ6feEHILEa4MZsa59/C1QdG7mhRaaWIyOqukXaKskdXTe6b2xnzcPMb26Pant/SuOt1+Yglpsx7KalSI7ZTSNMo0p1JbeXQ9hcYX3WY6K9WnOuuvxSe79mDcorjZAVVekxLL52nUQzgA2oXPxu+j/mm8NuEXlcqQ8Jplo+z4EH4ODxUlcbA6f6MTPW55hZfaUbzcI/+xc4i28JEA0utzR0l0vuwaAkO3Dfe3EqLWR/9rgwU0DSOrLCu+sLmrA0A3gUDMOW6o58o5ETCJs3WtBPpeB01md8K9rK+aGs+cdCi8QNd+u6n48/grEkbNZhIcocv5XwM6JV/AvgeqaVsKSnjfQDHxBfSDJFfCO/kxXdXNAR+GIv01vREn/Vh6Hc6O5WchF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(6512007)(6916009)(8936002)(91956017)(38070700005)(8676002)(26005)(53546011)(6486002)(66446008)(66556008)(5660300002)(66476007)(66946007)(6506007)(86362001)(186003)(31696002)(71200400001)(64756008)(316002)(122000001)(4326008)(2906002)(36756003)(83380400001)(38100700002)(2616005)(76116006)(508600001)(31686004)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWd3amZrMEJLWmIwc3cvQWZ3KzBULzI1QmVRbENodmM1dnF2b1JwaEcvdllr?=
 =?utf-8?B?NTBQQVhCa24yNnErU3JjZGpoNFRrdElZSE9wZ0crY0RCd3dlbzQ4TUlKNVBB?=
 =?utf-8?B?cEs5QWNoQm9URExiUTFxenZtZlBlUi9IUVAzMklGWGNqVitiVnorZHczdjBR?=
 =?utf-8?B?MzlTTVdYOWkrRTc5UUdWYk1MVjg0M3h3TDFxSXJjR1hkYTdjeVdJR3NyKzZH?=
 =?utf-8?B?ZUpyV0t0RkNacSt3L3lFNmNWakcwd3pNYVk2YXhHMldwTVRDSXVOSmRwWXlC?=
 =?utf-8?B?YXd3RWprSWZqTkZKTW1JTldTRG5rNzdNVkQzMXNBWmV2MDlkWW52SFVLUmc2?=
 =?utf-8?B?bTNEQVlQS0E1VUJ6MlRXN1VmbTZwYyt0MklqNWtqcloyclZha3JRdDExbEFM?=
 =?utf-8?B?YUw3R2JVYzFmZG8zUG8rYTExUE1CN1lka3ZmOTBaa0J2TU9obHkwaXQ5WFhJ?=
 =?utf-8?B?VExEbFhlVWxwMWZmVEtpTGU5SldlRFBEOGswUDdsU05CM0VxNDlOeC9GbGF0?=
 =?utf-8?B?aXpwaVFXeWNDZENnTEJsbHI5cS9ncjErbjcxdWlBdDRKUjJjTVFPMzJyTElC?=
 =?utf-8?B?Z3dGcXpWQVRqMGVzTUpxQUdpMFlDdjROblh4WTRVd3Z6ZlZDbnBST29ieWRn?=
 =?utf-8?B?L1VHaFdGV01yRUpHVitYZXhWSW9yK1pTVGo0bERFRWU3OWp0SnhNMkJ4VmlZ?=
 =?utf-8?B?V0VDQWM2ZWp1WTVhVzBHWGYyS1djcGxNaWRsVEZYcFpGUXkrT3JvTHA2T3lB?=
 =?utf-8?B?a29PM0JWdml5RE1jbVJjNlZ5R3BSVjg4ZUJuSjVyOXpFd1QyUmE1VHVRTmJ0?=
 =?utf-8?B?UTBURDY5VEJCYW02QTRzaW1RRm4xWGdvbkZtL0ROMVRvWkxYOFdxVk9RTGlP?=
 =?utf-8?B?QTUwL3RjZXZaR0FEYnJzV04zY0N4VU9QWFZoaU1sQVBrRVRoeC96dWZHN1N6?=
 =?utf-8?B?azNjM3FEdzNaNlg2LzNlcm9QcWhSMkUrWnNYM2MybENOMGlmL3p0bkN4MENW?=
 =?utf-8?B?Wk80Q1oxL1VzbTQ4ZWNHVEJoV0dMV3hOSlpPTHo3cGF5blBaT2VOMkFrdU04?=
 =?utf-8?B?aGMxY2FPb04ydzJMQTRMeVpST3RTT1lZV2pwbWtEQTRHbms4elloamVXN1pm?=
 =?utf-8?B?bXJMUzRsTXRsOEJodThLYko0dlQ0UXRuUzBvelIreGFWdjJQclpzeWxxTHJp?=
 =?utf-8?B?WVV4ZE9JL3BiTm9KOGNSWW1qMTlWNXpkLzkwM0ZpcUsvbDdFMEZWbEpCcytC?=
 =?utf-8?B?OVBiMnY4MmR5RlZSMjhEV2ZvSzh5cGRkRmZmMzlUMndNWDh2R0F5cU5mTTFk?=
 =?utf-8?B?ZkVtRlQvdTd1L25VOTkzRGRSQzU5MkZrT2c4SXVQT2RsMlFJS2QwQUhDdlhY?=
 =?utf-8?B?Mm5GRWRVb2VraGs0NUFzM2ZyR1lVbE5pdlB5eXZlL0w5Q2dUa0tveFA5NUd3?=
 =?utf-8?B?bkY5TDloa0xUTzFQZlJ2QUpDdHMyMUttbXNocmhZbDQ3Nm1GVlQrUUtyK1BW?=
 =?utf-8?B?bzlKMW9JNkpNek54dG5WZEJEZnpnUGJYZU5LZStMOHUyK2hmUzlqTmZiNFp3?=
 =?utf-8?B?YXhvYUtxUGhyaGF0SmlkRjRGbHZSQ3NSOXhHWGVENkhpSThNRWpudEI1cmVV?=
 =?utf-8?B?OWU2SmFuRzl6ZEcwbHpKMUVxRlFEUktqQXV4bXRvSUpLREJjRENVcG94Ujlq?=
 =?utf-8?B?cnNPcklySFJiUnZaK3diVDAxVC9KMzl6Uk5QakZJa0RoWEd0WmZGeWE0QXBp?=
 =?utf-8?B?U3pDK2FKUFdXejJCUkVhTXVBMzlCWmcvV25rZk1vZE9ZYkViOWxVWmJzN1Er?=
 =?utf-8?B?cjNaNzBDN0cxVC85WDk2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77F4102B0E3A0948B184CB7E99708958@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e034e1b-6e6f-4dcf-51b0-08d98353ab6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 14:16:03.0134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdDcPzqs1jfknWrqbFuIRJhiPYIrNzxHkq6Iq3etDaru1DL07RvXCo8gvysHNA3HF0ey2SDaBI3vLqJ4+oY+fCvKnDsFCC2O4CFw7gRcaQkDvyWbCbmNyxw5GIV21htu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-GUID: g8gUl5e4e60CbtPbB2TrDBRoSquPX8Fl
X-Proofpoint-ORIG-GUID: g8gUl5e4e60CbtPbB2TrDBRoSquPX8Fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_05,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=748 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290089

DQoNCk9uIDI5LjA5LjIxIDE3OjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMDkuMjAy
MSAxNTo0OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMjkuMDku
MjEgMTY6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI5LjA5LjIwMjEgMTU6MTYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyOS4wOS4yMSAxNTo1NCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAyOS4wOS4yMDIxIDEzOjU2LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyOS4wOS4yMSAxMjowOSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDI5LjA5LjIwMjEgMTE6MDMsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gU29ycnkgZm9yIHRvcCBwb3N0aW5nLCBidXQgdGhpcyBpcyBh
IGdlbmVyYWwgcXVlc3Rpb24gb24gdGhpcyBwYXRjaC9mdW5jdGlvbmFsaXR5Lg0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IERvIHlvdSBzZWUgd2UgbmVlZCB0byBnYXRlIGFsbCB0aGlzIHdpdGggQ09ORklH
X0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4+Pj4+IGFzIHRoaXMgcmVuZGVycyBpbiBzb21l
d2hhdCBkZWFkIGNvZGUgZm9yIHg4NiBmb3Igbm93PyBJIGRvIHRoaW5rIHRoaXMgc3RpbGwNCj4+
Pj4+Pj4+IG5lZWRzIHRvIGJlIGluIHRoZSBjb21tb24gY29kZSB0aG91Z2guDQo+Pj4+Pj4+IEkg
YWdyZWUgaXQgd2FudHMgdG8gbGl2ZSBpbiBjb21tb24gY29kZSwgYnV0IEknZCBzdGlsbCBsaWtl
IHRoZSBjb2RlIHRvDQo+Pj4+Pj4+IG5vdCBibG9hdCB4ODYgYmluYXJpZXMuIEhlbmNlIHllcywg
SSB0aGluayB0aGVyZSB3YW50IHRvIGJlDQo+Pj4+Pj4+ICJpZiAoICFJU19FTkFCTEVEKCkgKSIg
ZWFybHkgYmFpbG91dCBwYXRocyBvciwgd2hlbmV2ZXIgdGhpcyBpc24ndA0KPj4+Pj4+PiBwb3Nz
aWJsZSB3aXRob3V0IGJyZWFraW5nIHRoZSBidWlsZCwgcmVzcGVjdGl2ZSAjaWZkZWYtcy4NCj4+
Pj4+PiBUaGVuIGl0IG5lZWRzIHRvIGJlIGRlZmluZWQgYXMgKHhlbi9kcml2ZXJzL0tjb25maWcp
Og0KPj4+Pj4+DQo+Pj4+Pj4gY29uZmlnIEhBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4+PiAg
ICAgwqDCoMKgICMgdlBDSSBndWVzdCBzdXBwb3J0IGlzIG9ubHkgZW5hYmxlZCBmb3IgQXJtIG5v
dw0KPj4+Pj4+ICAgICDCoMKgwqAgZGVmX2Jvb2wgeSBpZiBBUk0NCj4+Pj4+PiAgICAgwqDCoMKg
IGRlcGVuZHMgb24gSEFTX1ZQQ0kNCj4+Pj4+Pg0KPj4+Pj4+IEJlY2F1c2UgaXQgbmVlZHMgdG8g
YmUgZGVmaW5lZCBhcyAieSIgZm9yIEFybSB3aXRoIHZQQ0kgc3VwcG9ydC4NCj4+Pj4+Pg0KPj4+
Pj4+IE90aGVyd2lzZSBpdCBicmVha3MgdGhlIFBDSSBwYXNzdGhyb3VnaCBmZWF0dXJlLCBlLmcu
IGl0IGNvbXBpbGVzLA0KPj4+Pj4+DQo+Pj4+Pj4gYnV0IHRoZSByZXN1bHRpbmcgYmluYXJ5IGJl
aGF2ZXMgd3JvbmcuDQo+Pj4+Pj4NCj4+Pj4+PiBEbyB5b3Ugc2VlIHRoaXMgYXMgYW4gYWNjZXB0
YWJsZSBzb2x1dGlvbj8NCj4+Pj4+IExpa2UgYWxsIChvciBhdCBsZWFzdCB0aGUgbWFqb3JpdHkp
IG9mIG90aGVyIEhBU18qLCBpdCBvdWdodCB0byBiZQ0KPj4+Pj4gInNlbGVjdCItZWQgKGJ5IGFy
bS9LY29uZmlnKS4gSXMgdGhlcmUgYSByZWFzb24gdGhpcyBpc24ndCBwb3NzaWJsZT8NCj4+Pj4+
IChJIGRvbid0IG1pbmQgdGhlICJkZXBlbmRzIG9uIiwgYXMgbG9uZyBhcyBpdCdzIGNsZWFyIHRo
YXQgaXQgZXhpc3RzDQo+Pj4+PiBzb2xlbHkgdG8gYWxsb3cga2NvbmZpZyB0byB3YXJuIGFib3V0
IGJvZ3VzICJzZWxlY3Qicy4pDQo+Pj4+IFRoZXJlIGlzIHlldCBubyBLY29uZmlnIGV4aXN0cyAo
ZXZlbiBmb3IgQXJtKSB0aGF0IGVuYWJsZXMgSEFTX1ZQQ0ksDQo+Pj4+DQo+Pj4+IHRodXMgSSBj
YW4ndCBkbyB0aGF0IGF0IHRoZSBtb21lbnQgZXZlbiBpZiBJIHdhbnQgdG8uIFllcywgdGhpcyBj
YW4gYmUgZGVmZXJyZWQNCj4+Pj4NCj4+Pj4gdG8gdGhlIGxhdGVyIHN0YWdlIHdoZW4gd2UgZW5h
YmxlIFZQQ0kgZm9yIEFybSwgYml0IHRoaXMgY29uZmlnIG9wdGlvbiBpcyBzdGlsbA0KPj4+Pg0K
Pj4+PiBjb25zaWRlcmVkIGFzICJjb21tb24gY29kZSIgYXMgdGhlIGZ1bmN0aW9uYWxpdHkgYmVp
bmcgYWRkZWQNCj4+Pj4NCj4+Pj4gdG8gdGhlIGNvbW1vbiBjb2RlIGlzIGp1c3QgZ2F0ZWQgd2l0
aCBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVC4NCj4+Pj4NCj4+Pj4gV2l0aCB0aGlzIGRl
ZmluZWQgbm93IGFuZCBub3QgbGF0ZXIgdGhlIGNvZGUgc2VlbXMgdG8gYmUgY29tcGxldGUgYW5k
IG1vcmUgY2xlYW4NCj4+Pj4NCj4+Pj4gYXMgaXQgaXMgc2VlbiB3aGF0IGlzIHRoaXMgY29uZmln
dXJhdGlvbiBvcHRpb24gYW5kIGhvdyBpdCBpcyBlbmFibGVkIGFuZCB1c2VkIGluIHRoZQ0KPj4+
Pg0KPj4+PiBjb2RlLg0KPj4+Pg0KPj4+PiBTbywgSSBzZWUgbm8gcHJvYmxlbSBpZiBpdCBpcyBk
ZWZpbmVkIGluIHRoaXMgS2NvbmZpZyBhbmQgZXZhbHVhdGVzIHRvICJuIiBmb3IgeDg2DQo+Pj4+
DQo+Pj4+IGFuZCBldmVudHVhbGx5IHdpbGwgYmUgInkiIGZvciBBcm0gd2hlbiBpdCBlbmFibGVz
IEhBU19WUENJLg0KPj4+IEknbSBhZnJhaWQgSSBkb24ndCB2aWV3IHRoaXMgYXMgYSByZXBseSBy
ZWZsZWN0aW5nIHRoYXQgeW91IGhhdmUNCj4+PiB1bmRlcnN0b29kIHdoYXQgSSdtIGFza2luZyBm
b3IuIFRoZSBwcmltYXJ5IHJlcXVlc3QgaXMgZm9yIHRoZXJlIHRvDQo+Pj4gbm90IGJlICJkZWZf
Ym9vbCB5IiBidXQganVzdCAiYm9vbCIgYWNjb21wYW5pZWQgYnkgYSAic2VsZWN0IiBpbg0KPj4+
IEFybSdzIEtjb25maWcuIElmIEhBU19WUENJIGRvZXNuJ3QgZXhpc3QgYXMgYW4gb3B0aW9uIHll
dCwgc2ltcGx5DQo+Pj4gb21pdCB0aGUgKHF1ZXN0aW9uYWJsZSkgImRlcGVuZHMgb24iLg0KPj4g
SSB1bmRlcnN0b29kIHRoYXQsIGJ1dCB3YXMgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB3ZSBkb24ndCBt
aXNzDQo+PiB0aGlzIG9wdGlvbiB3aGlsZSBlbmFibGluZyB2UENJIG9uIEFybSwgYnV0IG9rLCBJ
J2xsIGhhdmUgdGhlIGZvbGxvd2luZzoNCj4+IGNvbmZpZyBIQVNfVlBDSQ0KPj4gICDCoMKgwqAg
Ym9vbA0KPj4NCj4+IGNvbmZpZyBIQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiAgIMKgwqDCoCBi
b29sDQo+PiAgIMKgwqDCoCBkZXBlbmRzIG9uIEhBU19WUENJDQo+PiBhbmQgc2VsZWN0IGl0IGZv
ciBBcm0geGVuL2FyY2gvYXJtL0tjb25maWcNCj4gQnR3IHlvdSBjb3VsZCBhbHNvIGhhdmUNCj4N
Cj4gY29uZmlnIEhBU19WUENJDQo+ICAgICAgIGJvb2wNCj4NCj4gY29uZmlnIEhBU19WUENJX0dV
RVNUX1NVUFBPUlQNCj4gICAgICAgYm9vbA0KPiAgICAgICBzZWxlY3QgSEFTX1ZQQ0kNCj4NCj4g
d2hpY2ggd291bGQgcmVxdWlyZSBhcm0vS2NvbmZpZyB0byBvbmx5IHNlbGVjdCB0aGUgbGF0dGVy
LCB3aGlsZQ0KPiB4ODYvS2NvbmZpZyB3b3VsZCBvbmx5IHNlbGVjdCB0aGUgZm9ybWVyLg0KSSds
bCBwcm9iYWJseSBsZWF2ZSBpdCBhcyBJIHdyb3RlIGJlZm9yZSwgYmVjYXVzZSBpdCB0aGVuIGxv
b2tzIGxpa2UNCmEgc3ViLWZlYXR1cmUgZW5hYmxlcyB0aGUgcGFyZW50IGZlYXR1cmUgYW5kIGRv
ZXNuJ3Qgc2VlbSByaWdodA0KQWx0aG91Z2ggaXQgbWF5IHN0aWxsIGxvb2sgcmlnaHQuLi4NCj4N
Cj4+PiBQUzogVGhlIG1vcmUgcmVwbGllcyBJIGdldCBmcm9tIHlvdSwgdGhlIG1vcmUgYW5ub3lp
bmcgSSBmaW5kIHRoZQ0KPj4+IGluc2VydGlvbiBvZiBibGFuayBsaW5lcyBiZXR3ZWVuIGV2ZXJ5
IHR3byBsaW5lcyBvZiB0ZXh0LiBCbGFuaw0KPj4+IGxpbmVzIGFyZSB1c3VhbGx5IHVzZWQgdG8g
c2VwYXJhdGUgcGFyYWdyYXBocy4gSWYgaXQgaXMgeW91ciBtYWlsDQo+Pj4gcHJvZ3JhbSB3aGlj
aCBpbnNlcnRzIHRoZXNlLCBjYW4geW91IHBsZWFzZSB0cnkgdG8gZG8gc29tZXRoaW5nDQo+Pj4g
YWJvdXQgdGhpcz8gVGhhbmtzLg0KPj4+DQo+PiBJIGZpcnN0IHRob3VnaHQgdGhhdCB0aGlzIGlz
IGhvdyBUaHVuZGVyYmlyZCBzdGFydGVkIHNob3dpbmcNCj4+IG15IHJlcGxpZXMgYW5kIHdhcyBh
bHNvIGN1cmlvdXMgYWJvdXQgdGhlIGRpc3RhbmNlIGJldHdlZW4gdGhlIGxpbmVzDQo+PiB3aGlj
aCBzZWVtZWQgdG8gYmUgYXMgZG91YmxlLWxpbmUsIGJ1dCBJIGNvdWxkbid0IGRlbGV0ZSBvciBl
ZGl0DQo+PiB0aG9zZS4gSSB0aG91Z2h0IHRoaXMgaXMgb25seSB2aXNpYmxlIHRvIG1lLi4uDQo+
PiBJdCBjYW1lIG91dCB0aGF0IHRoaXMgd2FzIGJlY2F1c2Ugb2Ygc29tZSBUaHVuZGVyYmlyZCBz
ZXR0aW5ncyB3aGljaA0KPj4gbWFkZSBteSByZXBsaWVzIHdpdGggdGhvc2UgZG91YmxlLWxpbmVy
cy4gSG9wZSBpdCBpcyBmaXhlZCBub3cuDQo+IEluZGVlZCwgdGhhbmtzIC0gSSBkaWQgbm90IHJl
bW92ZSBhbnkgYmxhbmsgbGluZXMgZnJvbSBjb250ZXh0IGFib3ZlLg0KPg0KPiBKYW4NCj4NCj4N
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

