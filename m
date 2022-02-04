Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA64A94E9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265144.458440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtjA-0002CC-Ol; Fri, 04 Feb 2022 08:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265144.458440; Fri, 04 Feb 2022 08:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtjA-00029i-Ku; Fri, 04 Feb 2022 08:13:56 +0000
Received: by outflank-mailman (input) for mailman id 265144;
 Fri, 04 Feb 2022 08:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFtj9-00029b-7H
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:13:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63983dc3-8592-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 09:13:53 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21436JU8021943;
 Fri, 4 Feb 2022 08:13:49 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e0p4fh9wn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:13:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB4862.eurprd03.prod.outlook.com (2603:10a6:803:bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Fri, 4 Feb
 2022 08:13:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 08:13:34 +0000
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
X-Inumbo-ID: 63983dc3-8592-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIK8eS5VsmHVQ2whW0y/U8htxqiyAH5l/TcGPjK8QHWktTLmTPUsTlu1XdOPlVPatT4UiSm+5h1TQJqV/77i0WDxhyvMANjxVgkOfUfRCpd5PWxWFdcO/8uxGJFwdVEyny5+o8CLY/WJi64DNNKNd57XbPBC3uf/JQ/3TNDNiOInVMqWEgvOyk6g3K9EnDV2Iss3DhZ2/5DSYqP5XIKIDeIIiyeKcKIZOPMaYeDcIEbMHfZePZ18NhbycARR4aoaOhQsm0z/0Rwhdn4Vr63y8xjZksC1j4x7k+b1Pa3HBjd0i9PV8/U0EvHIJ78BlGjFE/lqR8XgPYX89Z8jbncZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jnDkrI0D3kmmFAeSdC/dWBGDjEkOMEKL6SWkS2Vmvw=;
 b=Zs2bzZu7YTpVcOqZznxZ2XPx7vswgOHO9i26oCkpJR3kNGTNa/LRqTkQ3+MovNyHVZj9GtmJ8d34EakAXLiq9nKXSb/oKbgLxU0aH/vSt/w3ThowOK1joWuXf8RMSP46a3CBrzObwmcYO+2qzADX7d0k4O0S7hHUl4XVfAPSoZLvO7+8zdZEB3ccTrK33MoEH2NFS/+xIv1zGaE8EQGLY+kyVaGbJbPrugvrGBsl6H/RsMnAzGPF1YA0gG/jmKvQ2SlorvTSzAUHPSrBhc62L7MO/ofdKNM22YR5cLEjrhQuIorlcS2t8Fn4ZlJaE9DRGzHSZ0XeBKhfKuhbrMdjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jnDkrI0D3kmmFAeSdC/dWBGDjEkOMEKL6SWkS2Vmvw=;
 b=m/YpwoOgPb104LwIwP86qsuBjeipYUPYi7VrI6zpGnDqQmlrAbO8X7O3yfaQMCydG2oNSe7cZh8GAbeH5z4F7kGU/vuNU/nt5x2SnKpEfWFKSOLjPTAmhapwCUG3gPX0hF70tLIGW7Wcx+oChL1pN7LM1GkfBNUDkGTI+k4jJQ45PXvZChIkyBfNv2rldoMPRjwFpoLkc7+hitfFvmbM+vRFH1v5DCU4+labU8aQ+1mXM6NG+PNkIDQkNVUDONzCoZOwujRApuxEpw5UgpHV5Cu7n49ubp4RHejCgg/NZNzWZN17ZnGJ70bTBGDCPYnDu74P3uibN6zKZwKhcKx0ew==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAAFx4A=
Date: Fri, 4 Feb 2022 08:13:34 +0000
Message-ID: <fec9b8f5-05d7-8d0c-2ae0-0224318dfd13@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
In-Reply-To: <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5c59d8e-3e6a-43fa-3de1-08d9e7b63d13
x-ms-traffictypediagnostic: VI1PR03MB4862:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB4862C7525474F0FE34EFAB8DE7299@VI1PR03MB4862.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MyoUxVNRePmUyIF30//bcjeWL+RwFJizIjAI+GOCtdV+p1D1tqEHtYnEy79+pxGXY/kIKJB2J2brjtcajIV40NNYXxaR1rvahS/vYcO8U7/Xl3B29v+BzK9BxC/VqL1osxHY/b7GXydV2d5eNVb95D7j2Dk98MfplUtDNajJ1hEtug5XGXAyaS5SUaO21PUNVkZ99J3ro7ICCK+TR8Id5j0YeAHZl0C8fSlzafADNY9GwSkSi8o/hWmVel6A+KFBONcZCW/vfcPb48hgeJoBU6o6xRHCWp7MW/sW1HBqXc+Ymo6N179dcJ+8ogA0euQz3002WOaDWUU4n3E1okGcYTwLgloehtD3lvabZ5rX0wTV71Cllc9QsDihylUB40fqSBBsHpKlalmn8qQFzpkmbjcnUcW8d2yYjzqxE0BJBYu/VBeixTprqJ6zHOA4M1zzupY1XeZ7TCb85YWL8gV+EmrlfAwoX7wKMsDKG3bc6Q16UVThDYmQ9jcc59Z3MMb715Xi1W4JD+4VabV7uThRKCgxi1xheT5kPh4w4vcpxeLmCRE+LzkR1a0Xo5rNkeE9+am347/VQ4tW946pNZ8SmCqe0Wh9RPAa77jFgm6naq4fz4e8/asympKzZg2n8TSHVvpP7ZgPCOGfgvsAi9H408TNKnnspJfPd889SMn40wUF2VW1/P1EIMRNjGXh2zC7qzcyLm/aQ+0trcrSqtXz/W7Gagemf5aOf4AO6eonmEM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(107886003)(122000001)(6506007)(110136005)(86362001)(186003)(2616005)(316002)(31696002)(54906003)(31686004)(26005)(38100700002)(36756003)(76116006)(4744005)(66446008)(66556008)(6486002)(83380400001)(91956017)(8676002)(8936002)(38070700005)(7416002)(508600001)(71200400001)(2906002)(66476007)(64756008)(5660300002)(6512007)(66946007)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SDh0Z3lOYzhkandoOXdNbXRsNnN4Z1Q2YlpCejQ2NmxJN1NYYkV3b21nek16?=
 =?utf-8?B?VGE0ZlQxaEV4Z0NkUTVMMzBiS0pKbFo3MEVpT1ZEOFMzRXF6amU3ZnJQVzc3?=
 =?utf-8?B?RnFLZ2V6c0dDOUluWkVxMWFNa3JXQmJoQ3ZxZWI5UUtJaE1WYXF6aFNINDFO?=
 =?utf-8?B?bi94UzRMc0h0dmpTR1luRW9rVGRNYXBHUjJHbTlhM29sZjFMbXNXN1NHTTZw?=
 =?utf-8?B?azFaaVFvN1V1dGJtL0h2cXdPazU2M0lsa01DMjhNeldvYy9ma2dHQ1V3azRy?=
 =?utf-8?B?WDBzWGtnbnNLT3QvdnJ2N2R5YmpXbnVFckNUcitjQ0VLenBQc0JVbTIwd09k?=
 =?utf-8?B?dEoxUTY2ME1qbndUWlhaOWpSRlhxMVNoNUJvRkUrRExReXAybzRkRDNMZFlM?=
 =?utf-8?B?bkE1WHFPdDZlZXVCYVYwTnRVZnZIbHdNOEhtd0w5Q1JOOUdhdVBUbWVXaG84?=
 =?utf-8?B?dXZtTFVjSjRZQU1qMlpmNi95cU00QnpFdks4akhIMTk2ZjY4L3NMNmxMc1Iw?=
 =?utf-8?B?aEVmQk1ZbjNIRDJLaUZpZ1hNODVQTmR3eW9sLzY3akt6OEVuS0ZXdkljQ3NG?=
 =?utf-8?B?UENMZzd6SjJOMmFTKzY4dFdLb05mNUlCbitXL0xLdmF2NzRlSHd0SzE5VHB3?=
 =?utf-8?B?Yms2OGlCZVg5S2dUSDhrcC9JM0lZMm5PekxyTEthcmNIN2xic1AvVHVxNEZP?=
 =?utf-8?B?QTdiQVl6aGx1bVFoMGk5ak95eG96N00wbys3UHdRTU9iQkpjR1dFeSszd3Rz?=
 =?utf-8?B?T2xiK00wSVAzS2k0TWVGMWdiZTMvVDFmNDB4K0JjNDh1RlEyZ1grQXhWMjlP?=
 =?utf-8?B?ZWNSZ0tTa2NMZUhObzQrWWxJSmRwVUg1N3QyUko2L3VVcE53VzgyUUFQcUZn?=
 =?utf-8?B?TGd2RFErQnlFbGZ6dklFeWtJLzN3cmR4N2VFRGdpRHlLUnd4NVZ0TlNWTms3?=
 =?utf-8?B?OFphdEszNzNva0lQbCt2R3o4R0dPcUgvZkJIZVJla0ZZOWNnOVA4SnB4eWZi?=
 =?utf-8?B?dGIzeGxHZjg5NjNERmZsWUZ6c0lUYVNUM2lpWTZ6a0FCSllYek0wbkU1d0xq?=
 =?utf-8?B?YkJiOHZtR0lqQVhUTnZDd2lLMjJFTUFhbjM2VGhKRmZxYmxMdTFxVitnMnE2?=
 =?utf-8?B?RUJjY2xmK1BqcTVDWW8yMEtKN1REeHBKSGhBbmMyZTUvRHIvcGgycnh3WEpw?=
 =?utf-8?B?WDJCc24vcE8wTnc3UkY0RUw0YURBcDVwK3l0TnFhV00vVUJqdS9hYVZUVElv?=
 =?utf-8?B?MDlqM3N0MVdLTkUrNGtXdzdTWlFOWW5Kc2djVWY4MWxzTzBUb0lROU5BclJp?=
 =?utf-8?B?L1ZlWXcxL2k4TGdPcUJQL2dWK1RieXJXV0FhSGNVcUlKQnIzWHJGeVFCL1pt?=
 =?utf-8?B?ekpSWEoxQmZVbWZRNjJRZW5UcXlsbEhBaWtqQkZiQWNaMzI2Zzk0WlBsTExh?=
 =?utf-8?B?eCttUThDOVdpdWFrSGpDaUd1clo5ZUMzeGtOMm56NzM0QXdjeU9DVCs5MUhz?=
 =?utf-8?B?Qnc3MzdiMXFRT0pNV3VIVW4yR0pVN052UHNaK1lxd2Y2U0hHeWJwMmMzNkpn?=
 =?utf-8?B?TDdzOE5HVlNOUEY2Q3dOMHpxNStMRG0zNFRSK0gvY2l6cjdSWWpaSm1ucEkx?=
 =?utf-8?B?NThCWCttN1RsMHpZQjBoUDhNQndieEZsdm9WZ3VWdzJBZmc2TllNakFHbW1l?=
 =?utf-8?B?NzdGeitnT1BST24rVmx2T00yZFU2bys5S01ob2o5bXUzNUxOVStRWjJTZzYv?=
 =?utf-8?B?ZnBvUTNOOE5GczhFckY4eWpwdlVzaXpGbXE4cVFnTkd2Yk9oNkVkWWRzb0tz?=
 =?utf-8?B?ZTR3VFIzUEhnekZtck00MDU2TUN0WkFwdWpBMkNBQmh5a1ZCUjNxS1dIeEhU?=
 =?utf-8?B?N3RzL0pBTUs3WHVodWpLVWh2WHEyS0R4TzZtRGI2dnlFNnZGWmNkRnBPQXhI?=
 =?utf-8?B?MmlqQlpqcjJ4L0FscThTaElsaU9OSGhzNGtZcmNCejhBQzUwSWJNR2ZaSXEv?=
 =?utf-8?B?VDAyV2JKV3dJazJxQS9FR0RoTUZ6bzF1TkVQMGlDdGNmRU96aDd1OUY1OWNx?=
 =?utf-8?B?eG9Uc2gxaVFtVEVnNVd5SzdpS3UxaWJkUTB3ZjBmMDJ4a0Z2VDQ3ZW1TZllQ?=
 =?utf-8?B?VHQrWGx6d082ZDZyTWQvdjNnOEhiMmJEenZQRi9aWjhpcWlHcHEyTTBaT2FZ?=
 =?utf-8?B?aDVRblJSUjZkOVJCV0ZWUjZsYXBTdUFGMit2aEpFeUJOdjE0cG1JYWVoWmtF?=
 =?utf-8?B?a1ExWHVMNUR3a0o5V0JQS25kOWRWOFhleVlvMEVYK2Z6eGRmTjY3STlZaDdl?=
 =?utf-8?B?SDJiTFlLSWVyalBoZnpRS1FUSGp1Skk4Y0RERjRVUlRxUExOdVF3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AE8686DD902FA4A906BBE4E6612A8AD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c59d8e-3e6a-43fa-3de1-08d9e7b63d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 08:13:34.2953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIHQDV/uKI3t4E45t6lqVO9ZeDwfzuOGcQ0817zFbJGWPWVdNkWL5/hUTvrH7UeSH4GbmdL4cyT4O9tJK0rfXMKsFgn6eT60LP+2y+LPqImhpecuA2T9ek70ZFcE2cUI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4862
X-Proofpoint-ORIG-GUID: RyaM6txvstSeaV86uLCI8Ecg3cB72muG
X-Proofpoint-GUID: RyaM6txvstSeaV86uLCI8Ecg3cB72muG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=750 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040043

SGksIEphbiENCg0KT24gMDQuMDIuMjIgMDk6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
NC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4NCj4gQXQg
dGhlIGZpcnN0IGdsYW5jZSB0aGlzIHNpbXBseSBsb29rcyBsaWtlIGFub3RoZXIgdW5qdXN0aWZp
ZWQgKGluIHRoZQ0KPiBkZXNjcmlwdGlvbikgY2hhbmdlLCBhcyB5b3UncmUgbm90IGNvbnZlcnRp
bmcgYW55dGhpbmcgaGVyZSBidXQgeW91DQo+IGFjdHVhbGx5IGFkZCBsb2NraW5nIChhbmQgSSBy
ZWFsaXplIHRoaXMgd2FzIHRoZXJlIGJlZm9yZSwgc28gSSdtIHNvcnJ5DQo+IGZvciBub3QgcG9p
bnRpbmcgdGhpcyBvdXQgZWFybGllcikuIEJ1dCB0aGVuIEkgd29uZGVyIHdoZXRoZXIgeW91DQo+
IGFjdHVhbGx5IHRlc3RlZCB0aGlzDQpUaGlzIGlzIGFscmVhZHkgc3RhdGVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIgdGhhdCBJIGhhdmUgdGVzdGVkIHR3byB4ODYNCmNvbmZpZ3VyYXRpb25zIGFuZCB0
ZXN0ZWQgdGhhdCBvbiBBcm0uLi4uLi4uDQpXb3VsZCB5b3UgbGlrZSB0byBzZWUgdGhlIHJlbGV2
YW50IGxvZ3M/DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

