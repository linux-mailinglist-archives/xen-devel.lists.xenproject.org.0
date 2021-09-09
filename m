Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236B404ADD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183042.330975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIXj-0006BZ-SG; Thu, 09 Sep 2021 11:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183042.330975; Thu, 09 Sep 2021 11:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIXj-00068W-Nj; Thu, 09 Sep 2021 11:48:35 +0000
Received: by outflank-mailman (input) for mailman id 183042;
 Thu, 09 Sep 2021 11:48:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOIXi-00068N-34
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:48:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db7f4de0-1163-11ec-b1ae-12813bfff9fa;
 Thu, 09 Sep 2021 11:48:32 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189BRQMo001867; 
 Thu, 9 Sep 2021 11:48:29 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayhdp03f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 11:48:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3585.eurprd03.prod.outlook.com (2603:10a6:208:47::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 9 Sep
 2021 11:48:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 11:48:27 +0000
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
X-Inumbo-ID: db7f4de0-1163-11ec-b1ae-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqMXMPEkV/Rrsj++2aJXCuJYgnZiRKmUo0YIv5f5WB84SXcn1mSiX8Gkw3rw/zLDm5sIzvIClFOgdInzBLeNxcfsHtEj7ByQd2Rudor8fFdhoKGK4jOJXYDI8yKcu8PoHAEOnUJMfmMxwgPiD0iegORFZ/uSfVwL0+qHOFy851zHX7PUS1RqTyCvFylO8z7tS727wtQR5uhxwRHCv+vKe1Wxpyd+UXP1sRDyH518EFdzPWgkQDK6+VSHk/hHIk0zzAksGOoZq1EP0h9idW8SrfsnHWg9fQC8fAscrXnuBMerJnhFzhB5k2CupzekyU7SBRrf+hB6Jc0gzu778SFDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1zGTQpWCzk8h/3mKJTKON4qYNgPUrpaZOdxoShTFzZI=;
 b=hD+4YImy3J7I9ViElKXip4liyjdHyPl2J4kA5B9r4GrLXxSlc6Hcd6+VJQ0HWkjt6bfpYRii99dezQyBLwaq4hfd3hyMgQhFOaNcb+8pAiIfviBsAE2NXb8w87tZFYY1tVNBmEN7dfU93rX0nRVajzrXC7RMSenDVavfvJGhCw0CbWixpX59Uf273iVt0mKh5uhy4JcynPqur/HQeUzbdJZd6GaQhxAKSLNPEj5Z+hSfDBMNZxnjGKNN4wREeMeno26M12DqzTWSpmc37Bk6qNmrosxlhyRivfOtBQcecUt1W2tdyJcZjg1NPXRdLc/Esc4TwUZAFSyhWXaWybbKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zGTQpWCzk8h/3mKJTKON4qYNgPUrpaZOdxoShTFzZI=;
 b=rylZDow9hebjCpYn2TU6PfY/lWQQFgBTM/Fm4rRAYH/Vkn/UFgTIuAclreLnE4uGFpOwX9QjHeps6YzP7mWXtF8+gFk2TjPb60bxAd8RrydkyRmIUOD51qK6eGpxWqu1vREIkYlWe+D4biNYcXTjTWp6yauFiNBwgAva+VzeQR2+pCr3Ew2Fgkv1YnMooWe1NSYeKc7S+KAZL9o8SMekcmBa67Myay2YbUOVNq8FIV/ot43AE2GXk/NqGEBlYdASRYbvksb0lUw0kErQrOPkL+n6POICLU5VkgwzH480ppJFieysFnKlEEn9YZC/4HfdXSZ55OtOPsbJqXhyPW9hSg==
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
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuAgAAA+ICAAAH/AIAACKGAgAApFAA=
Date: Thu, 9 Sep 2021 11:48:26 +0000
Message-ID: <38fac37c-a4ec-a1dc-ea5e-37ad77cb115a@epam.com>
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
In-Reply-To: <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 730ad81d-9511-4b7f-dfb9-08d97387bc8b
x-ms-traffictypediagnostic: AM0PR03MB3585:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB35855D7EA7C258DAF4FE47ACE7D59@AM0PR03MB3585.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 naFP23+ALlS5uA283g/UwysXEX9E+rcbqvlKOFz22PIWArwD+pFPChDRvm1qrsM3kxLKC/c79cHjmYYGTSuvXQV6CywVaOS+9o2X5yc7j23uNRnH19AJIz08pvFMEIhxkomePlGGndryiqHxUpLmf8m1LbJdREzubAvohBWIwpbHIcga+6cebtJmbPcm+ELkbwrJ/WGFbbqhkUfCfJyHh92J1dFxNMxMgi1+kvz5aCIAziGtWQa5qV+lCD8OexqE1sCi4kS1MU3jQCt9MjHcVG0eauksyPRJoPvSq5pEwSTxqoYZi4/qYHScMdEPbj2ONGGylzxqjIyKZkAeeSFwHkYTB4Lrk09F6UnL6U2CHyC/ZOZWTe2hO5BRSZ+83v3PL5YxKYn8W9ho/unfYjHecaNiPKMC5/GHGg08XZ80SguDEYnqzHGsZ/pkn6ntX+51QaLq15HWb0Wf/HpWHchf1WhjVv4aIW8HKHFNZtwMaq7yvLTTYUvD1WwP/KYcY8F7Aw3WUPaZusuUAmAbF2XXHJ6LxPUPRutlQodvZDdChbMd1ShaFbzt1ftLKm4gji3wANIfyfCxm+I/Vz2ZC2C0qpeOjTKurM+EYicW7Prs9mK2f9HS6TZbSHNtYCB4sF04hudSUTj+rgl0tMQUJelsw/YENWjKdPU0w2thx285SmP2vIviu6GGAbbIhYsq6iBCeHPnht6iov/gUmHVvOqUwnUu36OMtVQhNazk0qtzgtk6dSvGnhkd/Nal1Y50Pr/J
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(8676002)(71200400001)(5660300002)(6512007)(76116006)(38070700005)(66446008)(478600001)(6486002)(53546011)(86362001)(2906002)(83380400001)(6506007)(38100700002)(122000001)(66946007)(2616005)(66476007)(4326008)(64756008)(66556008)(316002)(54906003)(8936002)(91956017)(26005)(31686004)(31696002)(186003)(110136005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WG1jL0kvTHNLSW9DNFVXenJNaTZnZEE0VWpueXZ2dmRabkZHWFlQSjdPYVBU?=
 =?utf-8?B?UVFSdWtPbUk3bTIzd1VHdUhyS1hGL2lkV3VnRE1NYjNPc3p0UHB6cjRCS2Fr?=
 =?utf-8?B?aGhqakRyQ0drMWVIS0NxVnRFNkhyc1ZxL2xmT2xFVXB4Z3d1UDlaVUFEMHA0?=
 =?utf-8?B?WWZmOCsxakJUUEc1VVgvQ2laUVNRcnZOVEliZWpuUDhleEIrWmFWTXNsek8w?=
 =?utf-8?B?bnhKakRXSGtUQW1UWFlackVPaDg5eUF5Wm96blJxZXlUZXpIdkxPbGtBTmI5?=
 =?utf-8?B?U2VhN09pcmFZSU9BQjdMbFFqazVpRFBVNkFtZnB3OEEzYkYxRnNodENRSERz?=
 =?utf-8?B?a01TOGhBakZJRE1JQjZuNWNxbkRKKzFreEYzR1BvSENyMy9TSFVjOSsrR242?=
 =?utf-8?B?eFNBZlhyK1VFUmlRdDNkMksyVHppaFpkcnNRZHNQS1lncXhySTN1MzI3VnJy?=
 =?utf-8?B?VmNQSC9qSDBWN3NRQ1pRdFdyakx0ajV1am5vaW9adEx6MjBmZEk0ekE1dVBt?=
 =?utf-8?B?NUlibjhiVjZjMGFzU2gwVERYV0dacjRsd2ZoR0VGUEUyRXpwWGE2SEVuWXZJ?=
 =?utf-8?B?dXRMSXZWUUs0SXZnUmdGU2VBL2RMbXhkZ3hxYmE1eG9ZMFZPQ2wzZ2R1dkFu?=
 =?utf-8?B?RmhGcHhLWkJidWpXZkFOTzBRTHFFcmhqYkZ5anE2eEVPN2xBTnZQS044Wmd3?=
 =?utf-8?B?K0ZPM05tQjFFVWtNdGRtS3dTMENFSXdQdWVxWDl3L0tNTkJyTGFmb0RlVEpY?=
 =?utf-8?B?R1lGOHpZNDRZcnVwYlk1RC8wTmdVL01ZOXVha3lYOXNnYUc5MW5vMkJieklX?=
 =?utf-8?B?aU5pWGNFdUQ3UDRjZGdjL3d5SVBtVjhvZmNGQUNIOFprQVl3aVA5Zk40RjN3?=
 =?utf-8?B?Q0haYUlHTFdiTmN5dGlVa3RkbXBUQUZza29ON1Bqc1FDb3R6c2MrN3lRSG5G?=
 =?utf-8?B?Lzc2T0oyMkN5QkQvMTRLY0d2VXJvRUlNOTloV3V6T2VBeno0VUxRd1RMdTJO?=
 =?utf-8?B?RDlsdWhQZElzdUxCTS9NdlFHcksyMEc4T0N4VEJ3WFpXRk9kVFQvQnFnWWVK?=
 =?utf-8?B?ajVET3RtdkJ1NWhrYURnUmo5SXlRbjlUcHJHOFFZSGhhT3c4VTVQYlNRQTRK?=
 =?utf-8?B?TWw4VmZYVVVrUUp0WU02cjhKMVRWdXZvcmdnMWVMUFhjenRmNlJIYmlpYmhH?=
 =?utf-8?B?S1gvRjB4M2VONXdPNVl2NHFiTjFPNUpVSlp4ZU9XR1g1ek4xeUd6S0drbC9t?=
 =?utf-8?B?WUsxVlUxRlAzSGJTKzdVNnlXZzhXbDNNRXpuYnhoQzVpamZZQ0JCME5HdXZS?=
 =?utf-8?B?MVQ4QXcyTXgwK2l1THFXbzBNZllQanJabXdENGV3VmhMbEdSc1daSWI5T0ZL?=
 =?utf-8?B?cStwZlU5ei9CMUFwa0VlZVk5MTR3MFljQ0ZSKy92aDJVVzZZYXVvQktVQ0FW?=
 =?utf-8?B?ZC9VL0tuWU9EYkJhOXQwdjBtSVY5enJMbUVQUHR0VGNjcXQxTlJ6QWdNdThW?=
 =?utf-8?B?RUxWN1BMZm4yb2tXeTRTV2xxSG5jdUliZVlBM0pvblptM1lDcTNQTjdGM29M?=
 =?utf-8?B?YVJ1U1hDci8vbXhQUzNTSkp3WW5kdjZwMGZFUnoyUzNqYVZZOERCa1VyQmxO?=
 =?utf-8?B?eVg3ZDZhYytDdmMyRjVqRTFsM1FFQkZ5VG8xRkpsKzJWand0dERUSW5SMkor?=
 =?utf-8?B?bk1pVnowYjB3QjhZT3Z5V1pRYjVKTzN6NWNYNXpLOExGd3h2NktyQ3BOSkJl?=
 =?utf-8?Q?DH3poHOfAogHQfu/iex85Oam8mj9c+iHcMKIdDu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14AEED8C150B9D4F89F3D240F7905DB4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730ad81d-9511-4b7f-dfb9-08d97387bc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 11:48:26.9334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xBtjYI5hEfExW3QYcFlhvUYFMM302t4P/9UxFmNm3bKDjw55RoSTky8SX7XjiyY5A8eSMkfm0QRPN5GIP8p1jdKDulzyM1lPqeBOZ/jJF0niT+lvlEfV3EsN2eGtkA6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3585
X-Proofpoint-ORIG-GUID: AvavbyhBflWFDuIbN8i3fW-JILBYT4Pz
X-Proofpoint-GUID: AvavbyhBflWFDuIbN8i3fW-JILBYT4Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090072

DQpPbiAwOS4wOS4yMSAxMjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTA6NTAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTE6
NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjA5LjIwMjEgMTA6MzksIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wOS4yMSAxMzowNiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDExOjUyLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDA3LjA5LjIwMjEgMTE6MDcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gT24gMDcuMDkuMjEgMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+Pj4+IE9uIDA3LjA5LjIwMjEgMTA6MTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+Pj4+PiBTbywgaWYgd2UgaGF2ZSBhIGhpZGRlbiBQQ0kgZGV2aWNlIHdoaWNoIGNh
biBiZSBhc3NpZ25lZCB0byBhIGd1ZXN0IGFuZCBpdCBpcyBsaXRlcmFsbHkgdW50b3VjaGVkDQo+
Pj4+Pj4+Pj4+IChub3QgZW5hYmxlZCBpbiBEb20wKSB0aGVuIEkgdGhpbmsgdGhlcmUgd2lsbCBi
ZSBubyBzdWNoIHJlZmVyZW5jZSBhcyAiaG9zdCBhc3NpZ25lZCB2YWx1ZXMiIGFzDQo+Pj4+Pj4+
Pj4+IG1vc3QgcHJvYmFibHkgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2lsbCByZW1haW4gaW4gaXRz
IGFmdGVyIHJlc2V0IHN0YXRlLg0KPj4+Pj4+Pj4+IFdoYXQgbWVhbmluZyBvZiAiaGlkZGVuIiBk
byB5b3UgaW1wbHkgaGVyZT8gRGV2aWNlcyBwYXNzZWQgdG8NCj4+Pj4+Pj4+PiBwY2lfe2hpZGUs
cm99X2RldmljZSgpIG1heSBub3QgYmUgYXNzaWduZWQgdG8gZ3Vlc3RzIC4uLg0KPj4+Pj4+Pj4g
WW91IGFyZSBjb21wbGV0ZWx5IHJpZ2h0IGhlcmUuDQo+Pj4+Pj4+Pj4gRm9yIGFueSBvdGhlciBt
ZWFuaW5nIG9mICJoaWRkZW4iLCBldmVuIGlmIHRoZSBkZXZpY2UgaXMgY29tcGxldGVseQ0KPj4+
Pj4+Pj4+IGlnbm9yZWQgYnkgRG9tMCwNCj4+Pj4+Pj4+IERvbTBsZXNzIGlzIHN1Y2ggYSBjYXNl
IHdoZW4gYSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlIGd1ZXN0DQo+Pj4+Pj4+PiB3aXRob3V0
IERvbTAgYXQgYWxsPw0KPj4+Pj4+PiBJbiB0aGlzIGNhc2UgaXQgaXMgZW50aXJlbHkgdW5jbGVh
ciB0byBtZSB3aGF0IGVudGl0eSBpdCBpcyB0byBoYXZlDQo+Pj4+Pj4+IGEgZ2xvYmFsIHZpZXcg
b24gdGhlIFBDSSBzdWJzeXN0ZW0uDQo+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gICAgICAgY2VydGFpbiBv
ZiB0aGUgcHJvcGVydGllcyBzdGlsbCBjYW5ub3QgYmUgYWxsb3dlZA0KPj4+Pj4+Pj4+IHRvIGJl
IERvbVUtY29udHJvbGxlZC4NCj4+Pj4+Pj4+IFRoZSBsaXN0IGlzIG5vdCB0aGF0IGJpZywgY291
bGQgeW91IHBsZWFzZSBuYW1lIGEgZmV3IHlvdSB0aGluayBjYW5ub3QNCj4+Pj4+Pj4+IGJlIGNv
bnRyb2xsZWQgYnkgYSBndWVzdD8gSSBjYW4gdGhpbmsgb2YgUENJX0NPTU1BTkRfU1BFQ0lBTCg/
KSwNCj4+Pj4+Pj4+IFBDSV9DT01NQU5EX0lOVkFMSURBVEUoPyksIFBDSV9DT01NQU5EX1BBUklU
WSwgUENJX0NPTU1BTkRfV0FJVCwNCj4+Pj4+Pj4+IFBDSV9DT01NQU5EX1NFUlIsIFBDSV9DT01N
QU5EX0lOVFhfRElTQUJMRSB3aGljaCB3ZSBtYXkgd2FudCB0bw0KPj4+Pj4+Pj4gYmUgYWxpZ25l
ZCB3aXRoIHRoZSAiaG9zdCByZWZlcmVuY2UiIHZhbHVlcywgZS5nLiB3ZSBvbmx5IGFsbG93IHRo
b3NlIGJpdHMNCj4+Pj4+Pj4+IHRvIGJlIHNldCBhcyB0aGV5IGFyZSBpbiBEb20wLg0KPj4+Pj4+
PiBXZWxsLCB5b3UndmUgY29tcGlsZSBhIGxpc3QgYWxyZWFkeSwgYW5kIEkgZGlkIHNheSBzbyBi
ZWZvcmUgYXMgd2VsbDoNCj4+Pj4+Pj4gRXZlcnl0aGluZyBleGNlcHQgSS9PIGFuZCBtZW1vcnkg
ZGVjb2RpbmcgYXMgd2VsbCBhcyBidXMgbWFzdGVyaW5nDQo+Pj4+Pj4+IG5lZWRzIGF0IGxlYXN0
IGNsb3NlbHkgbG9va2luZyBhdC4gSU5UWF9ESVNBQkxFLCBmb3IgZXhhbXBsZSwgaXMNCj4+Pj4+
Pj4gc29tZXRoaW5nIEkgZG9uJ3QgdGhpbmsgYSBndWVzdCBzaG91bGQgYmUgYWJsZSB0byBkaXJl
Y3RseSBjb250cm9sLg0KPj4+Pj4+PiBJdCBtYXkgc3RpbGwgYmUgdGhlIGNhc2UgdGhhdCB0aGUg
aG9zdCBwZXJtaXRzIGl0IGNvbnRyb2wsIGJ1dCB0aGVuDQo+Pj4+Pj4+IG9ubHkgaW5kaXJlY3Rs
eSwgYWxsb3dpbmcgdGhlIGhvc3QgdG8gYXBwcm9wcmlhdGVseSBhZGp1c3QgaXRzDQo+Pj4+Pj4+
IGludGVybmFscy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gTm90ZSB0aGF0IGV2ZW4gZm9yIEkvTyBhbmQg
bWVtb3J5IGRlY29kaW5nIGFzIHdlbGwgYXMgYnVzIG1hc3RlcmluZw0KPj4+Pj4+PiBpdCBtYXkg
YmUgbmVjZXNzYXJ5IHRvIGxpbWl0IGd1ZXN0IGNvbnRyb2w6IEluIGNhc2UgdGhlIGhvc3Qgd2Fu
dHMNCj4+Pj4+Pj4gdG8gZGlzYWJsZSBhbnkgb2YgdGhlc2UgKHBlcmhhcHMgdHJhbnNpZW50bHkp
IGRlc3BpdGUgdGhlIGd1ZXN0DQo+Pj4+Pj4+IHdhbnRpbmcgdGhlbSBlbmFibGVkLg0KPj4+Pj4+
IE9rLCBzbyBpdCBpcyBub3cgY2xlYXIgdGhhdCB3ZSBuZWVkIGEgeWV0IGFub3RoZXIgcGF0Y2gg
dG8gYWRkIGEgcHJvcGVyDQo+Pj4+Pj4gY29tbWFuZCByZWdpc3RlciBlbXVsYXRpb24uIFdoYXQg
aXMgeW91ciBwcmVmZXJlbmNlOiBkcm9wIHRoZSBjdXJyZW50DQo+Pj4+Pj4gcGF0Y2gsIGltcGxl
bWVudCBjb21tYW5kIHJlZ2lzdGVyIGVtdWxhdGlvbiBhbmQgYWRkIGEgInJlc2V0IHBhdGNoIg0K
Pj4+Pj4+IGFmdGVyIHRoYXQgb3Igd2UgY2FuIGhhdmUgdGhlIHBhdGNoIGFzIGlzIG5vdywgYnV0
IEknbGwgb25seSByZXNldCBJTy9tZW0gYW5kIGJ1cw0KPj4+Pj4+IG1hc3RlciBiaXRzLCBlLmcu
IHJlYWQgdGhlIHJlYWwgdmFsdWUsIG1hc2sgdGhlIHdhbnRlZCBiaXRzIGFuZCB3cml0ZSBiYWNr
Pw0KPj4+Pj4gRWl0aGVyIG9yZGVyIGlzIGZpbmUgd2l0aCBtZSBhcyBsb25nIGFzIHRoZSByZXN1
bHQgd2lsbCBiZSBjbGFpbWVkIHRvDQo+Pj4+PiBiZSBjb21wbGV0ZSB1bnRpbCBwcm9wZXIgZW11
bGF0aW9uIGlzIGluIHBsYWNlLg0KPj4+PiBJIHRyaWVkIHRvIHNlZSB3aGF0IG90aGVycyBkbyBp
biBvcmRlciB0byBlbXVsYXRlIFBDSV9DT01NQU5EIHJlZ2lzdGVyDQo+Pj4+IGFuZCBpdCBzZWVt
cyB0aGF0IGF0IG1vc3QgdGhleSBjYXJlIGFib3V0IHRoZSBvbmx5IElOVFggYml0IChiZXNpZGVz
DQo+Pj4+IElPL21lbW9yeSBlbmFibGUgYW5kIGJ1cyBtdXN0ZXIgd2hpY2ggYXJlIHdyaXRlIHRo
cm91Z2gpLiBQbGVhc2Ugc2VlDQo+Pj4+IFsxXSBhbmQgWzJdLiBQcm9iYWJseSBJIG1pc3Mgc29t
ZXRoaW5nLCBidXQgaXQgY291bGQgYmUgYmVjYXVzZSBpbiBvcmRlcg0KPj4+PiB0byBwcm9wZXJs
eSBlbXVsYXRlIHRoZSBDT01NQU5EIHJlZ2lzdGVyIHdlIG5lZWQgdG8ga25vdyBhYm91dCB0aGUN
Cj4+Pj4gd2hvbGUgUENJIHRvcG9sb2d5LCBlLmcuIGlmIGFueSBzZXR0aW5nIGluIGRldmljZSdz
IGNvbW1hbmQgcmVnaXN0ZXINCj4+Pj4gaXMgYWxpZ25lZCB3aXRoIHRoZSB1cHN0cmVhbSBwb3J0
IGV0Yy4gVGhpcyBtYWtlcyBtZSB0aGluayB0aGF0IGJlY2F1c2UNCj4+Pj4gb2YgdGhpcyBjb21w
bGV4aXR5IG90aGVycyBqdXN0IGlnbm9yZSB0aGF0LiBOZWl0aGVyIEkgdGhpbmsgdGhpcyBjYW4g
YmUNCj4+Pj4gZWFzaWx5IGRvbmUgaW4gb3VyIGNhc2UuIFNvIEkgd291bGQgc3VnZ2VzdCB3ZSBq
dXN0IGFkZCB0aGUgZm9sbG93aW5nDQo+Pj4+IHNpbXBsZSBsb2dpYyB0byBvbmx5IGVtdWxhdGUg
UENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOiBhbGxvdyBndWVzdCB0bw0KPj4+PiBkaXNhYmxlIHRo
ZSBpbnRlcnJ1cHRzLCBidXQgZG9uJ3QgYWxsb3cgdG8gZW5hYmxlIGlmIGhvc3QgaGFzIGRpc2Fi
bGVkDQo+Pj4+IHRoZW0uIFRoaXMgaXMgYWxzbyBjb3VsZCBiZSB0cmlja3kgYSBiaXQgZm9yIHRo
ZSBkZXZpY2VzIHdoaWNoIGFyZSBub3QNCj4+Pj4gZW5hYmxlZCBhbmQgdGh1cyBub3QgY29uZmln
dXJlZCBpbiBEb20wLCBlLmcuIHdlIGRvIG5vdCBrbm93IGZvciBzdXJlDQo+Pj4+IGlmIHRoZSB2
YWx1ZSBpbiB0aGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgKGluIHBhcnRpY3VsYXINCj4+Pj4gUENJ
X0NPTU1BTkRfSU5UWF9ESVNBQkxFIGJpdCkgY2FuIGJlIHVzZWQgYXMgdGhlIHJlZmVyZW5jZSBo
b3N0IHZhbHVlIG9yDQo+Pj4+IG5vdC4gSXQgY2FuIGJlIHRoYXQgdGhlIHZhbHVlIHRoZXJlIGlz
IGp1c3QgdGhlIG9uZSBhZnRlciByZXNldCBvciBzby4NCj4+Pj4gVGhlIHJlc3Qgb2YgdGhlIGNv
bW1hbmQgcmVnaXN0ZXIgYml0cyB3aWxsIGdvIGRpcmVjdGx5IHRvIHRoZSBjb21tYW5kDQo+Pj4+
IHJlZ2lzdGVyIHVudG91Y2hlZC4NCj4+Pj4gU28sIGF0IHRoZSBlbmQgb2YgdGhlIGRheSB0aGUg
cXVlc3Rpb24gaXMgaWYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFDQo+Pj4+IGlzIGVub3VnaCBh
bmQgaG93IHRvIGdldCBpdHMgcmVmZXJlbmNlIGhvc3QgdmFsdWUuDQo+Pj4gV2VsbCwgaW4gb3Jk
ZXIgZm9yIHRoZSB3aG9sZSB0aGluZyB0byBiZSBzZWN1cml0eSBzdXBwb3J0ZWQgaXQgbmVlZHMg
dG8NCj4+PiBiZSBleHBsYWluZWQgZm9yIGV2ZXJ5IGJpdCB3aHkgaXQgaXMgc2FmZSB0byBhbGxv
dyB0aGUgZ3Vlc3QgdG8gZHJpdmUgaXQuDQo+PiBTbywgZG8gd2Ugd2FudCBhdCBsZWFzdCBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUgYml0IGFsaWduZWQNCj4+IGJldHdlZW4gdGhlIGhvc3QgYW5k
IGd1ZXN0PyBJZiBzbywgd2hhdCBkbyB5b3UgeW91IHRoaW5rIGFib3V0DQo+PiB0aGUgcmVmZXJl
bmNlIHZhbHVlIGZvciBpdCAocGxlYXNlIHNlZSBhYm92ZSkuDQo+IFBsZWFzZSBtYXkgSSBhc2sg
dGhhdCB5b3UgY29tZSB1cCB3aXRoIGEgcHJvcG9zYWw/IEkgZG9uJ3QgdGhpbmsgSSd2ZQ0KPiBz
YWlkIHlvdSBuZWVkIHRvIGVtdWxhdGUgdGhpcyBvciBhbnkgb2YgdGhlIG90aGVyIGJpdHMuIEFs
bCBJJ3ZlIGFza2VkDQo+IGZvciBpcyB0aGF0IGZvciBldmVyeSBiaXQgeW91IGFsbG93IHRoZSBn
dWVzdCB0byBjb250cm9sIGRpcmVjdGx5LCB5b3UNCj4ganVzdGlmeSB3aHkgdGhhdCdzIHNhZmUg
YW5kIHNlY3VyZS4gSWYgbm8ganVzdGlmaWNhdGlvbiBjYW4gYmUgZ2l2ZW4sDQo+IGVtdWxhdGlv
biBpcyBnb2luZyB0byBiZSBuZWNlc3NhcnkuIEhvdyB0byBzb2x2ZSB0aGF0IGlzIGZpcnN0IGFu
ZA0KPiBmb3JlbW9zdCBwYXJ0IG9mIHlvdXIgdW5kZXJ0YWtpbmcuDQoNClRoZSB0aGluZyBoZXJl
IGlzIHRoYXQgd2UgY2FuJ3QgdHJ1bHkganVzdGlmeSBpZiB3ZSBjYW4gbGV0IHRoZSBndWVzdA0K
DQpjb250cm9sIHRob3NlIGJpdHMgb3Igbm90IGFzIGl0IGFsbCBtYXkgZGVwZW5kIG9uIHRoZSB0
b3BvbG9neSB0aGF0IHNvbWUNCg0Kc3BlY2lmaWMgc2V0dXAgbWlnaHQgaGF2ZS4gTm90IHRoYXQg
d2UgdGVjaG5pY2FsbHkgY2FuJ3QsIGJ1dCBub3QgaW4gYQ0KDQpwcmFjdGljYWwgYW5kIGVhc3kg
d2F5IElNTy4gVGFraW5nIHRoYXQgaW50byBhY2NvdW50IHdlIGNvbWUgdG8gYQ0KDQpjb25jbHVz
aW9uIHRoYXQgd2UgbmVlZCB0byBlbXVsYXRlIHRob3NlIHRoZW4uIEJ1dCwgYWdhaW4gd2UgdW5k
ZXJzdGFuZA0KDQp0aGF0IGZ1bGwgZW11bGF0aW9uLCBpZiBwcm9wZXJseSBpbXBsZW1lbnRlZCwg
aXMgZ29pbmcgdG/CoCBiZSBhIGJpZyBwaWVjZSBvZiBjb2RlDQoNCndoaWNoIG5lZWRzIHRvIHRh
a2UgaW50byBhY2NvdW50IHRoZSBwaHlzaWNhbCBQQ0kgdG9wb2xvZ3kgZXRjLg0KDQpTbywgdGhp
cyBpcyBteSB1bmRlcnN0YW5kaW5nIHdoeSBvdGhlcnMgZG8gbm90IGltcGxlbWVudCB0aGF0IChR
RU1VLCBBUkNOKQ0KDQphbmQgbGV0IHRoZSBndWVzdCBjb250cm9sIGFsbCBiaXRzLCBidXQgSU5U
eERJU0FCTEUgKERpc2NsYWltZXI6IGlmIEkgdW5kZXJzdG9vZCB0aGVpcg0KDQpjb2RlIGNvcnJl
Y3RseSkNCg0KU28sIG15IHByb3Bvc2FsIGhlcmUgaXMgdG8gb25seSBlbXVsYXRlIFBDSV9DT01N
QU5EX0lOVFhfRElTQUJMRSBhbmQgbGV0DQoNCnRoZSBvdGhlciBiaXRzIGJlIGNvbnRyb2xsZWQg
YnkgdGhlIGd1ZXN0IChwbGVhc2UgYWxzbyBzZWUgdGhlIG5vdGUgYmVsb3cpLg0KDQpJIGRvIHVu
ZGVyc3RhbmQgdGhpcyBpcyBub3QgY29ycmVjdCwgYnV0IEkgY2FuJ3QgdGVsbCBob3cgdG8gZGVh
bCB3aXRoIHRoaXMgb3RoZXIgd2F5Lg0KDQo+DQo+IEZvciB0aGUgYml0IGluIHF1ZXN0aW9uLCB3
aGVyZSB0aGUgZ29hbCBhcHBlYXJzIHRvIGJlIHRvIGhhdmUgaGFyZHdhcmUNCj4gaG9sZCB0aGUg
T1Igb2YgZ3Vlc3QgYW5kIGhvc3QgdmFsdWVzLCBhbiBhcHByb2FjaCBzaW1pbGFyIHRvIHRoYXQg
dXNlZA0KPiBmb3Igc29tZSBvZiB0aGUgTVNJIC8gTVNJLVggYml0cyBtaWdodCBiZSBjaG9zZW46
IE1haW50YWluIGd1ZXN0IGFuZA0KPiBob3N0IGJpdHMgaW4gc29mdHdhcmUsIGFuZCB1cGRhdGUg
aGFyZHdhcmUgKGF0IGxlYXN0KSB3aGVuIHRoZQ0KPiBlZmZlY3RpdmUgcmVzdWx0aW5nIHZhbHVl
IGNoYW5nZXMuIEEgY29tcGxpY2F0aW5nIGZhY3QgaGVyZSBpcywgdGhvdWdoLA0KPiB0aGF0IHVu
bGlrZSBmb3IgdGhlIE1TSSAvIE1TSS1YIGJpdHMgaGVyZSBEb20wIChwY2liYWNrIG9yIGl0cyBQ
Q0kNCj4gc3VzYnN0ZW0pIG1heSBhbHNvIGhhdmUgYSB2aWV3IG9uIHdoYXQgdGhlIHNldHRpbmcg
b3VnaHQgdG8gYmUuDQoNClRoZSBiaWdnZXIgcXVlc3Rpb24gaGVyZSBpcyB3aGF0IGNhbiB3ZSB0
YWtlIGFzIHRoZSByZWZlcmVuY2UgZm9yIElOVHgNCg0KYml0LCBlLmcuIGlmIERvbTAgZGlkbid0
IGVuYWJsZS9jb25maWd1cmVkIHRoZSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91Z2gNCg0KdGhh
biBpdHMgQ09NTUFORCByZWdpc3RlciBtYXkgc3RpbGwgYmUgaW4gYWZ0ZXIgcmVzZXQgc3RhdGUg
YW5kIElNTyB0aGVyZSBpcw0KDQpubyBndWFyYW50ZWUgaXQgaGFzIHRoZSB2YWx1ZXMgd2UgY2Fu
IHNheSBhcmUgImFzIGhvc3Qgd2FudHMgdGhlbSINCg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwN
Cg0KT2xla3NhbmRyDQo=

