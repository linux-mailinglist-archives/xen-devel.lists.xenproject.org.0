Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD93405154
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183202.331238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJO0-0002xn-KL; Thu, 09 Sep 2021 12:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183202.331238; Thu, 09 Sep 2021 12:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJO0-0002vi-Gk; Thu, 09 Sep 2021 12:42:36 +0000
Received: by outflank-mailman (input) for mailman id 183202;
 Thu, 09 Sep 2021 12:42:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOJNy-0002vc-Lt
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:42:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66efb642-116b-11ec-b1b2-12813bfff9fa;
 Thu, 09 Sep 2021 12:42:33 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189BRQbA001867; 
 Thu, 9 Sep 2021 12:42:30 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayhdp0bpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 12:42:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7298.eurprd03.prod.outlook.com (2603:10a6:20b:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 12:42:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 12:42:27 +0000
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
X-Inumbo-ID: 66efb642-116b-11ec-b1b2-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG7Bs+fz4tSWEDsPPq/ePr8a4LrZaR+bgOF45LsaUaBlDzNL7A20rw1v9YZZVkDznooTg9AjMz3QlY8XOfenRG7qeQ7y4gfJoGRLNx/IKIdQ0a3CB7ulEdHdOvTDCWAfw9m7+pTDCUq4tqmpvONE3V6PCuWR1YuTMcyaPs5qNTQHx9B6e7WsAMTyKUsJe9FxMZSRUVjuPrpri1/MJnLkNwATs/T+aN/vOn2NDMynVbJgZiaUHCav1y6oaFB56mlJ8xfeOcqQ0e7/J2BJ7RshQi/mDpc97vadm94EYfWUrKncoBMekw0Up8AgOTNq2b6l9+o7P6Swod64DCE4vHXXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dKHyWW00OiPqWRQnC1OyVPFE5xoD65yUS79ETpBcvdU=;
 b=YduDzhyaYx1IB+LPZBpRlK744qawuwpxhITlnWsbfRGftcK2tt/zXcV65ewoKPZN/80xGau8QTQmIZsZlIMzAz4kSZkFqcO+Ou38mPKAK6YzP0rIOYT/Eet3JcleFk1r1j7l9XdkHRFbu6IJuCdOXG4vrjnAFvNOfewsNzGVpZ93+GUAlwLEuE3MQfjk1o31fN/z4f5HOsOfaPGJyspYh19WJnaz6j0PJ/4Y76jU7yMkA/QaIv7WIvQ5w9eC+0yFQtB5XeKlogdOtyOKGyLpInz3WmfSoem1fcmKqBooeL8OU2z/gKMGqMMQBpu7oVxj73FyPVtZmUtpHakz8+KJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKHyWW00OiPqWRQnC1OyVPFE5xoD65yUS79ETpBcvdU=;
 b=J14nCagwaV0aAnuveTTwGXt76pOY2me4V9er5hKixDKWub9ATGsWNLQc1e+fuxoc0IROXkdtG0I6x/MFmD2HrwQrJAHBU2tLBvwmGLnIvCKaouO0Jzj5b6LGezMhJBi2itOrBFM4cRAyOaBtuLkDsqMFijHvxhSaV6klkCVNun5yd4jE1Zt2SdpIgDUAXMUQTpygIEzRW2TMwC67eg2ImqZyz6f9pR45JT/Pj010q17K1CpUhmbJLYHWtGBvrJ4sNME/lg4Ym+FieHcEf1njPo4icj09hKOdXQhjtPSqwMVg0KPLEwjjE9BOsUYvEoVl7tbuxRPNKiIZvATunPRBZw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: 
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuAgAAA+ICAAAH/AIAACKGAgAAo+QCAAAGkAIAADY6A
Date: Thu, 9 Sep 2021 12:42:27 +0000
Message-ID: <38669583-3e3a-36e2-8714-a4b6a4e10173@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
 <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
 <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
 <3ca10b3a-35c9-00b4-f736-293589d641d4@epam.com>
 <06560d04-6d71-bb94-20af-fc43cf686b0a@suse.com>
In-Reply-To: <06560d04-6d71-bb94-20af-fc43cf686b0a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f9d50f5-b2d5-4718-35fb-08d9738f4833
x-ms-traffictypediagnostic: AM9PR03MB7298:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB72989C974245E2BD6C240224E7D59@AM9PR03MB7298.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C5XUyF2a737ooqdl8l+PbEx0T40GDf/srlu7w/LX2ZT2rv2qFXhAG8x6FxBZARUjZzNkToaCfVmGyAcw5dyh09YMi4h/UegZ57PPOVeJ+EBOpRtNLYUoGGyENCwX9/kMsN5NlJa4f2nVmtuK63nwurQ0Jvdy7creP3D34FLGyoqODX90JBnFkn2gZc+x7T2pHJg8nUbyxc4NuznRAxcLE3Zz58XyGboZ4abm5SrMb78BVxviFgJDFKhdx1OqdT5hv1jN5/bWER/VJa206tAiSllSArf2NdblhG2EBDLR2hCHdnIPu+IZJ/hsAsIzx3F6g5hpwq3XcCDmkVRT90zwel2AO7hicSJ2giszV38rKFPabWNWN6QpVe7srrke+L9+PZac2zrfeyVSwU59nZoBxeyMxi8JefJC86wXBQ+pychd/2gz3D6gFy1RsKEGG/NYzn8p40hSVm8MoCiaic+28hC9HPTf9yYWS/l3sVuSHHCkqxCUsIVeSQHWTl3hSV11eb6DXq4dCu/3VS7oB2uRS04smhVPZWBHebkXCn0+dgNeE7yj4WPDGB4E2ZU31WPY1mRZ2udlQsOKprnqPBEfka2Mwv36yOwA6Om9TrwfVC5KHiNIanSL7L+8UhmVkhxrqQlpiOHX6vcWHOoSgJpSjcry+2L9ZLhQUWbXxPIwAf/7Dhtl6Aw+gt5NxMjxs2RFFRAY+pGdEB+5bWtGHHo2R0v1Fn9F96lsS7ZwSEUXaVGOUIOo8bdsFP0rJA/IsvpF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(2616005)(53546011)(36756003)(66476007)(66556008)(91956017)(2906002)(6506007)(66446008)(76116006)(86362001)(64756008)(478600001)(31686004)(66946007)(8936002)(71200400001)(6486002)(8676002)(5660300002)(6512007)(38100700002)(38070700005)(186003)(110136005)(54906003)(4326008)(316002)(26005)(122000001)(83380400001)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akhYOVpIcUZzNlBRMUJlMDZlZkhFVGlyUTZ1N1dCV1VNSXVTSDNBRG8rYkUr?=
 =?utf-8?B?R1ArSG90WEhQaThWVzIwTWgveHBTR1pyWFp5NlBuVHZscjJRQUZTMXY3N1lM?=
 =?utf-8?B?K3NIenQ4SmJKb2FCRUQ0RkMxQ1B2bnpqMHJGc0hia2ZVMXFjaTM3ZEtSb1Fx?=
 =?utf-8?B?bjRNeDJRUWpEcmpYUTh1VUN4K0dxcjRLTURwd1pvbkJpU0hWUzBpbnJYR3pq?=
 =?utf-8?B?a251VW9ObEJBRnpQVGdTYzJna0paVHZWWTNuQUNwbmJwWldNQWN2QjNNYVJY?=
 =?utf-8?B?VnJnbXZYb1dTbGdTTzBuRC9BdXpURlRwTE9GSjhBMEdkUmRIMHlUN1RIQ2Ri?=
 =?utf-8?B?dXZmVy94NU9hK1c5S1NPd2p0a0Q4blovQWoxZzNxdktXNlFrK2w0aXU4THdS?=
 =?utf-8?B?MmtLbGp3RmtXL3l0RGUwVG95R3ZQNDBLMTVwWmk5NWoyRGN1dWVESitaZHhP?=
 =?utf-8?B?N0xYK3RHak9uNUg4Wkl3TnUrTjdvWjF0V2p6VFZkRFZMNGk3c2ZiSnp0MTdo?=
 =?utf-8?B?c2ExSW1zT1AyT0xqT2lPdUJ2Mm5ZaGdTaFFZSzlyVXBXSHZCK0ZsbitJNmVH?=
 =?utf-8?B?Z3RQVTZUNzhmc2w3ZWU2WFNVd3F6emZ1MWMveGJlVEdCLzdGVUFjdmdYckJw?=
 =?utf-8?B?RzcweC9tZk9mYVNqUnhMN3Y4M04xYzkybEhyVldZREJyTWJqMGdGWittaUFP?=
 =?utf-8?B?dzd2d00zTDY1TUR4b3R5amNGNmp5c3dLNnZjWFY2QXVpbDJuelFMVGpQL3FY?=
 =?utf-8?B?bDdiT3VxQnZaYzR6Umw5NGI5NU1ZeEMxdFRGeFhXQkc2bUFubU1HcE5lblFx?=
 =?utf-8?B?U2FraThDRnUwYlF0LzRNaDlUK0FjbytNaFJMTDlLSm5mbzY1WVFhOTI2TWw5?=
 =?utf-8?B?Nndnc2NzVUNYYXdPN0NlZ3gyRU5FQWdxSnpBajJhUDFkUlE1S1hDbUl2UUR3?=
 =?utf-8?B?TytiK3ZyQS9hYjdaQW16R3J4NGpIRE50bmpqZmxTMFVOUEVyNEg0elE1MjVa?=
 =?utf-8?B?VHV3YlM1Ulo5a0szaUdncUtFQ3B6RXdBZm9ra1FhanVlSDNncEUvbTUyNThN?=
 =?utf-8?B?WnRMOTdKc3VndXRoZFVZWkNYQndXRnlUdVkxV3FJUGt0NFJJcjVqRDFVcC9k?=
 =?utf-8?B?MW1UUG5Qck84b1dNRWhKSWZob1gyYy9oeGkyTEd1M2QzRVNYMFRQWG5xN3Q4?=
 =?utf-8?B?djlqOWRYTExWZTI4R1lrL21rd3VEWmJvM1dtSDlPUHVzdUxkNWpxWUQvWjBQ?=
 =?utf-8?B?MTZoNGk1Z1JIQmhNL2R4S2ZMcytqcnhkbXdyUFVaQ2RlNUVHRXpQdjRnQVBE?=
 =?utf-8?B?ekFZczF4d2UzQ3Z4UW0zVUpCSUJ0V2YzN0tOZTB4MXp3M2t0R1lYK2NIMlBZ?=
 =?utf-8?B?djh1cWIvMkptbUYzdnRvRUkzYUt2dzdqWlRHU1Z6UVJFbmdZRlpBaHFxYXBh?=
 =?utf-8?B?NEJQTkliKzdLSXhZdWhSK3I5bFRhR0Y5R1dZbXAxNW5ZdlRHTzZJZHM3azVr?=
 =?utf-8?B?bXVkTGZQdno0ZkU5NGNWNmN5a0FwdC8yK2VRUUdnZXlnWFdkL1MwSytIZXZG?=
 =?utf-8?B?WUlQdi9PMnFkeVVlUUt6NW5hcWp5RGxmL0lERkZNSVhtK2hiOTJnUHdTTHBx?=
 =?utf-8?B?Nk1hdWsvRHppcG5rZmhVakpzT29sbm1YbURXTmtqNmsxQmVwNTV5Um9Ubmg4?=
 =?utf-8?B?OUp3ZUN1SlU0VmlrelpjNVNJUG5Xb1hDbmcxWWlLL3RCSVk1bTBEY0Q4MkdN?=
 =?utf-8?Q?FOubP0LbN7dlhz2yddLk2JTUus3iLRw3EQcsrSq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB2867363B03C847BA16045B515F6C7D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9d50f5-b2d5-4718-35fb-08d9738f4833
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 12:42:27.7443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGsVaIuUo0J6cE2ZyeSVqMi3+gg3/vzutz91rpbnxkqaZFdRYkKHLpevRtQnF1QQm5ZKnxWFISo5rBHOS7LXJ9PZFzsRGjhghBbuAbDpia0dL+IeCNSgu3P3i1SJ2mtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7298
X-Proofpoint-ORIG-GUID: 4L_o4yukpH9DqQ7v3yHKED5WGqQydk72
X-Proofpoint-GUID: 4L_o4yukpH9DqQ7v3yHKED5WGqQydk72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090077

DQpPbiAwOS4wOS4yMSAxNDo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTM6NDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTI6
MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IEZvciB0aGUgYml0IGluIHF1ZXN0aW9uLCB3aGVy
ZSB0aGUgZ29hbCBhcHBlYXJzIHRvIGJlIHRvIGhhdmUgaGFyZHdhcmUNCj4+PiBob2xkIHRoZSBP
UiBvZiBndWVzdCBhbmQgaG9zdCB2YWx1ZXMsIGFuIGFwcHJvYWNoIHNpbWlsYXIgdG8gdGhhdCB1
c2VkDQo+Pj4gZm9yIHNvbWUgb2YgdGhlIE1TSSAvIE1TSS1YIGJpdHMgbWlnaHQgYmUgY2hvc2Vu
OiBNYWludGFpbiBndWVzdCBhbmQNCj4+PiBob3N0IGJpdHMgaW4gc29mdHdhcmUsIGFuZCB1cGRh
dGUgaGFyZHdhcmUgKGF0IGxlYXN0KSB3aGVuIHRoZQ0KPj4+IGVmZmVjdGl2ZSByZXN1bHRpbmcg
dmFsdWUgY2hhbmdlcy4gQSBjb21wbGljYXRpbmcgZmFjdCBoZXJlIGlzLCB0aG91Z2gsDQo+Pj4g
dGhhdCB1bmxpa2UgZm9yIHRoZSBNU0kgLyBNU0ktWCBiaXRzIGhlcmUgRG9tMCAocGNpYmFjayBv
ciBpdHMgUENJDQo+Pj4gc3VzYnN0ZW0pIG1heSBhbHNvIGhhdmUgYSB2aWV3IG9uIHdoYXQgdGhl
IHNldHRpbmcgb3VnaHQgdG8gYmUuDQo+PiBUaGUgYmlnZ2VyIHF1ZXN0aW9uIGhlcmUgaXMgd2hh
dCBjYW4gd2UgdGFrZSBhcyB0aGUgcmVmZXJlbmNlIGZvciBJTlR4DQo+PiBiaXQsIGUuZy4gaWYg
RG9tMCBkaWRuJ3QgZW5hYmxlL2NvbmZpZ3VyZWQgdGhlIGRldmljZSBiZWluZyBwYXNzZWQgdGhy
b3VnaA0KPj4gdGhhbiBpdHMgQ09NTUFORCByZWdpc3RlciBtYXkgc3RpbGwgYmUgaW4gYWZ0ZXIg
cmVzZXQgc3RhdGUgYW5kIElNTyB0aGVyZSBpcw0KPj4gbm8gZ3VhcmFudGVlIGl0IGhhcyB0aGUg
dmFsdWVzIHdlIGNhbiBzYXkgYXJlICJhcyBob3N0IHdhbnRzIHRoZW0iDQo+IEluIHRoZSBhYnNl
bmNlIG9mIERvbTAgY29udHJvbGxpbmcgdGhlIGRldmljZSwgSSB0aGluayB3ZSBvdWdodCB0byB0
YWtlDQo+IFhlbidzIHZpZXcgYXMgdGhlICJob3N0IiBvbmUuDQpBZ3JlZQ0KPiAgIFdoaWNoIHdp
bGwgd2FudCB0aGUgYml0IHNldCBhdCBsZWFzdCBhcw0KPiBsb25nIGFzIGVpdGhlciBNU0kgb3Ig
TVNJLVggaXMgZW5hYmxlZCBmb3IgdGhlIGRldmljZS4NCkJ1dCB3aGF0IGlzIHRoZSBJTlR4IHJl
bGF0aW9uIHRvIE1TSS9NU0ktWCBoZXJlPw0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0KT2xl
a3NhbmRyDQo=

