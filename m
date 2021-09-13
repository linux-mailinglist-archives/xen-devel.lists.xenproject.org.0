Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE064095B8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185739.334451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnE1-00026x-O8; Mon, 13 Sep 2021 14:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185739.334451; Mon, 13 Sep 2021 14:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnE1-000254-Jg; Mon, 13 Sep 2021 14:46:25 +0000
Received: by outflank-mailman (input) for mailman id 185739;
 Mon, 13 Sep 2021 14:46:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuNF=OD=epam.com=prvs=989052e8b7=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mPnE0-00024y-2K
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:46:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf11b7a-14a1-11ec-b3b9-12813bfff9fa;
 Mon, 13 Sep 2021 14:46:22 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DE0unP011291; 
 Mon, 13 Sep 2021 14:46:21 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b273drfp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 14:46:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3715.eurprd03.prod.outlook.com (2603:10a6:208:43::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 14:46:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 14:46:16 +0000
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
X-Inumbo-ID: 5cf11b7a-14a1-11ec-b3b9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm2fDld+3YyqFYlnG6d/pZ9zVP08axbBU6+u6rmByVCyh5vWc2nt8UruYPRKpTiK7yZGms00bM9+uezrOuTGgJ8ls/Nh5SJnw6q8gDyhAwtNjICf6YNf5MQezo2RW2A7v4eU2yVvgRpy25HCLoh513lAq4iuQYbPXC6tGfqKWKCI2nQSoU9/Qx3gD5cNky4uAPJzQOVhGHJjsHxIxSuxN0lnPd84yAZOVNa6fAJbI8rf77EOUYvmSBB0r8ubZKWCEoF54WV8co9nBM9DdEwyH8ylTIR2zbg4lSJ2IGqKfoF1/yQllhkb5BuioamTtbul65WiktxBSoO7YNyzlFOXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bCDrP9hgMnLG8V3dh06tN85ppNhw5CwR/2mQUbPas7E=;
 b=kxpOW9NJzCoNIQZSiAIyZLs0NJQnMQoHihl34mGCwqRWmeIkzg9qlzEF4UryLyodkOzcBG0n5XqdASJwZneBPQXU+PaRkXgUESx5k431AoaOPCebpUgtRTSqsr+N2Xj0sQIHEwKAYG/vrsi6pnoi3kKvMw0gYQ62OtZKyGgDHnyWnNAYbGmQ86WwcIOjyPhtwt6dkYDBH0htNGaQLZ94Qipr8tU9Z/FDYxx/WlnSjp7Enxi/miPsEDJpQrCkCJ5v2m/ndz79yhSmG4mE+suDBO1P3XtNOKpM9mAQ1u62fjipLWMtM/rP1fcZWpgvCcyXZzQFUcYwgf66OLFC6oOong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCDrP9hgMnLG8V3dh06tN85ppNhw5CwR/2mQUbPas7E=;
 b=jS1zGFfwBYvEbxRelNS2XyYHGGrefpphTt0OwMXvzVTtq1dcN9uKs5wp3pN4C0iJ8smNKBLVtGFTLorQf9luFEXqQa3VUV2f7ghWnIpE9p7BFL25zq60/lVkGxJriB02eGk/4ySBdd9RwQ8tcG36lsaWnNt56aLHElb4s5K3ehDxld1pNcfQpjkRnF/usmkuOIP9buPd384D/TGexaVdEtNffpGkRRfix8y/m8G9RtIxCFhZsD4LNfk4JiJYZxG0bymuXCZQoD4OShvrxZcXGeD0mWOOJ0G19sPfkELGcz6EQInFG/Yu763OVw0ZXg2R/oqjRMKmLWRmj1+k8ow97w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Julien Grall <julien@xen.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXlPK8ZsFWc1idT0uR0zIe97lMvKucfJAAgADQqgCABOUWAA==
Date: Mon, 13 Sep 2021 14:46:16 +0000
Message-ID: <aa251354-3e5f-e1ae-2647-3a112ad5d12e@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
 <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
In-Reply-To: <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e06da1be-a0f8-4508-e1c4-08d976c53de7
x-ms-traffictypediagnostic: AM0PR03MB3715:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB37156709146B0DD5B01BEDE6E7D99@AM0PR03MB3715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XZZvzTAbJhvAaJAfDcux8mpASosFNsv73D5siU8p0WiavO9kptoB8FAcok4T/OH5LwiGPiJRaHXpvP+m0AkMV7WeWoP8j7l5zQiknc7wVRhOOhRtyNJW/sA4sCH8Z2QuYG+v6qdeyyey6bgLLgHb+srzg4VUx9Bqa/iUVJYMz8DcaapyfPEWpKxmei8R3BHlWsLsbD9iHKSjNWqdGXw21HC6+vlm7vaAFB7UcU1kWWOyNahDYG4Dwzs6aiK21yFF0uK3YLiJ1YYjsrAJxv4XdiT/BmdfSg46G71MzhXB2L50B9icBA8JJAxaJbyg9lbM0ZTePgs12kOqeVHJsdvTFlUj60oGb9G7jxIcUYeieVvah/yIET2GRgdVzGaWKySsw2oEWzDx3pjSYU/unWrf0YUwB8m+jU62wUgpEF3/QuuOhoQ9Y8bLrtJpzXjQ8BdRvziJ9ENo+N82//16hXpoVxLcW6Nk/v+88RaXO5DPkepmiXQ01k2ySDaQGi14JlngnC59aCXJUTax75+tq0Dx9Lnv8B4jLi1xULlKmTfdvVhdXDX4AYX2yxDRYxPdA9s0CFl6fgLhWPtKOlvpzjSNzSD8bZNXGCOvA69CqDGLhoHpHB+/SiOWecC5UogbJoF5b5fJaHW5IU45qP37eieLvk0fEXl66pw8IIxL36q2YmV+Zs2WCEiMLTni5RnVcaJNJjMWp8X44qAxsmXazRsBRJBpcmYFzY2Jsuq8ettKxKFtHQRbs2/FCpN0ooI6wnXtgAsLsWXJtqiNE3Ek2+J3N5tvWZHVZKgPJErEUHkNp2xlNBQqT8/dJlqyzWX30v3zVymcoF5z+b+1/aD36zbXAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(38100700002)(76116006)(26005)(91956017)(54906003)(5660300002)(66476007)(66446008)(86362001)(71200400001)(2906002)(107886003)(316002)(31686004)(6486002)(53546011)(6506007)(8936002)(83380400001)(8676002)(31696002)(6512007)(55236004)(122000001)(2616005)(4326008)(38070700005)(66556008)(66946007)(64756008)(478600001)(110136005)(186003)(36756003)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MGFTNHVnRzBRS05ISGhjY2VEL3pLaUk4ZE1UUStEM2hmeFp3dEUzRVFBUlE5?=
 =?utf-8?B?RWxaSDVnMVprV2dVc094QlNYTXk4dVIveHUvN29CcE1wVkRXRUpFNlpmdi9I?=
 =?utf-8?B?RUlaMEJqSGszTUFPSG8vQkhDWncyTWFick4xeUtVQUU4LzkxZlh3bVlaUDlt?=
 =?utf-8?B?d2tSWDdRcmJDbnFwcEVSMDVCdGNlNktBR0hyK0tWNnJtTFh4RUthZDloWEd1?=
 =?utf-8?B?cjlka0lsRW5HdXlyNGZSTzdQKzJuS2lSbDFHMlVqTTRabFZhdHpIbzJua3kw?=
 =?utf-8?B?VUxScFQ0YkZNaW1JNzFWYzllU1lDbytnb1J6RnZHeG40a0FkV1p6ell6bWJZ?=
 =?utf-8?B?TE5lQWN5MzJTSDN1WEQ2UlVXV2xVcjVlbjBiMWtwSUtzV2ZzWWlaaUVJRVgz?=
 =?utf-8?B?bjZsOUZLK21ZRTNFUGdxQkxWS0J0NUpaWEl0KzMySklFMTFWbWxVOTdiTzdw?=
 =?utf-8?B?QU54NDRyYjQ2bDhHMTJMSUNSdXhjaUFGMGQrV0hyVWt5RWZjM3NWcFl5a3Rl?=
 =?utf-8?B?U29GVUFFcmhJOVBpOFo5MTQyY283MHJEbStXRXVYNkZhRG5NYUw4MDg4cVpk?=
 =?utf-8?B?WmxFcndZZVA3ZDNKNjBxZElaWWtJL204dUVOS2NObjhiSHY1TXJVUTVNSG1C?=
 =?utf-8?B?bGZjQmRVNmY4RExVVG04K29ROGQrNU9uY2FvWEE3TThTR2pYMTZSejdmTnM5?=
 =?utf-8?B?U3IwTVdmMzRQd0QrdVBYOHZHV2Z1ZkZWZnN2VG96dmdISjJHVmdrdDQ3aDRs?=
 =?utf-8?B?N3VoWHkwTm82RnluekR2Skdad1RUblNVNWY2d0pCTjJZQ2ZWdUJMOUpCam1S?=
 =?utf-8?B?RmdKcWJEL3lXQ0Z5Smlla0pmRlVLRlNHY3BuM3BTb1Jab1VtYVhiMHhpZkFP?=
 =?utf-8?B?STRaKzZ5UHlaTms1K1NkektjRFBibFMwTUdEcGJVclpmNU95WmtudDRVYnF4?=
 =?utf-8?B?M25aamlkZmVZdWFrWnA1aWhpeVNsSGRiRVFGeVF6R0JBV3NwblR3Q0J4Ylhl?=
 =?utf-8?B?N25DQTkzUm44cHBUTC80Q3dNcG9Jc2V6Mk5uK01MTWE5czRkZEYvTGN4VnN0?=
 =?utf-8?B?S0NXSGtsa2E0eE42czFGWGxweUMwd0VFdHg2R3lOaW1ldHQzNTNKbmpMQmVB?=
 =?utf-8?B?ZS9ORnFpS3pTNXpjRU85SmdpY3JxRmdFWVh4SWlablAyWEVSdHhNek9WYmZV?=
 =?utf-8?B?QWhJeHRmVUJoZmlDUnNUUkdGQVV2VDc3dE5tU09TTkhoVjYvRjVQNFBxVWdX?=
 =?utf-8?B?K1c5SjZHNUxudmRpWlNWcktKdWtiTjRKSmdZcmp1T0tEdi9SUDNVQWg0U0Zp?=
 =?utf-8?B?bzY2WElPZTZRNFErSjNlczFVTHdTdTBXV0ovNGdWeHptSU1pSWN4cDNWS2Rk?=
 =?utf-8?B?RE9kcWNZdDYwczF2SFN6NUdQVFRvZzVmam81SDBrM1h3RkxkdlhUVHA2SVNT?=
 =?utf-8?B?MTNzcFRxN1ViNzNBSW9JV1lMYXBxQzc4NUQzeTV2dmM1TDJiV1BUak9WeXRz?=
 =?utf-8?B?M3cxMVpjcnAxT0RMd01oQnIwc04xY2d4RE52eTJjOU9mNGxuZ0lUYThYYUF4?=
 =?utf-8?B?ZFl1bDcwMWlVaTRSenpNM3BNcWI4VGY2VG9wNURWZ2dpODNUQXdvclhVYVBx?=
 =?utf-8?B?VHc0dmI2RWNLVEpldk44anJZUzE2ekNkWkkzdkE3RGFhajUvNSthWkxyV0ov?=
 =?utf-8?B?alRYOVgrWWloNW1HM3FGTEcvMFIwemhxdllxdHJPenZZRUFVTnpRWTZTUVJR?=
 =?utf-8?B?bU9VaWNlVWtiQ1RMZjVYR2FvMUZkSUxWbzR5ZFYyN1ZCSG11MmtKV2F4MnJK?=
 =?utf-8?B?RklnUCtMU1pwU2tDMnhCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E91386C78129024C8804B7A0ADB233C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06da1be-a0f8-4508-e1c4-08d976c53de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 14:46:16.8090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2vBonkwRt2yVX0Z+ChtETxIPCOkxAFJGFNI7oewfDnoAvrk8draPNm3N3hUBK/6Fj76mAoDnvOTOLhiTFo4Ik4k/HwUJAE45qrCezA7EGAUlF4F0jNHA7HnJyN+30XU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3715
X-Proofpoint-GUID: GbaD7ypfiHtdr5s7ogZXPd9cQdkEJTa4
X-Proofpoint-ORIG-GUID: GbaD7ypfiHtdr5s7ogZXPd9cQdkEJTa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_07,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130098

DQpPbiAxMC4wOS4yMSAxNTowMSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+IEhpIFN0ZWZhbm8sDQo+
DQo+PiBPbiAxMCBTZXAgMjAyMSwgYXQgMTI6MzQgYW0sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pg0KPj4gT24gVGh1LCAxOSBBdWcgMjAyMSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+DQo+Pj4gQWRkIHN1cHBvcnQgZm9y
IFhpbGlueCBaeW5xTVAgUENJIGhvc3QgY29udHJvbGxlciB0byBtYXAgdGhlIFBDSSBjb25maWcN
Cj4+PiBzcGFjZSB0byB0aGUgWEVOIG1lbW9yeS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+PiAtLS0NCj4+PiB4ZW4vYXJjaC9hcm0vcGNpL01ha2VmaWxlICAgICAgICAgIHwgIDEgKw0K
Pj4+IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtenlucW1wLmMgfCA1OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+PiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykN
Cj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC16eW5xbXAu
Yw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvTWFrZWZpbGUgYi94ZW4v
YXJjaC9hcm0vcGNpL01ha2VmaWxlDQo+Pj4gaW5kZXggNmYzMmZiYmU2Ny4uMWQwNDVhZGUwMSAx
MDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNpL01ha2VmaWxlDQo+Pj4gKysrIGIveGVu
L2FyY2gvYXJtL3BjaS9NYWtlZmlsZQ0KPj4+IEBAIC0zLDMgKzMsNCBAQCBvYmoteSArPSBwY2kt
YWNjZXNzLm8NCj4+PiBvYmoteSArPSBwY2ktaG9zdC1nZW5lcmljLm8NCj4+PiBvYmoteSArPSBw
Y2ktaG9zdC1jb21tb24ubw0KPj4+IG9iai15ICs9IGVjYW0ubw0KPj4+ICtvYmoteSArPSBwY2kt
aG9zdC16eW5xbXAubw0KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0
LXp5bnFtcC5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC16eW5xbXAuYw0KPj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uZmUxMDNlMzg1NQ0KPj4+IC0t
LSAvZGV2L251bGwNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LXp5bnFtcC5j
DQo+Pj4gQEAgLTAsMCArMSw1OSBAQA0KPj4+ICsvKg0KPj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MjAtMjAyMSBFUEFNIFN5c3RlbXMNCj4+PiArICoNCj4+PiArICogQmFzZWQgb24gTGludXggZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2ktaG9zdC1jb21tb24uYw0KPj4+ICsgKiBCYXNlZCBvbiBM
aW51eCBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1ob3N0LWdlbmVyaWMuYw0KPj4+ICsgKiBC
YXNlZCBvbiB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWdlbmVyaWMuYw0KPj4+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMTQgQVJNIExpbWl0ZWQgV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5j
b20+DQo+PiBPbmx5IG9uZSBDb3B5cmlnaHQgbGluZSBwZXIgZmlsZSBpcyBlbm91Z2ggOi0pDQo+
Pg0KPj4gQnV0IGFjdHVhbGx5IGFsbCB0aGUgQ29weXJpZ2h0IGxpbmVzIHdpdGggYSBuYW1lIG9y
IGEgY29tcGFueSBuYW1lIGFyZQ0KPj4gbm90IHJlYWxseSByZXF1aXJlZCBvciB1c2VmdWwsIGFz
IHRoZSBjb3B5cmlnaHQgaXMgbm90ZWQgaW4gZnVsbCBkZXRhaWxzDQo+PiBpbiB0aGUgY29tbWl0
IG1lc3NhZ2VzIChhdXRob3IgYW5kIHNpZ25lZC1vZmYtYnkgbGluZXMpLiBJIHdvdWxkIHJlbW92
ZQ0KPj4gdGhlbSBhbGwgZnJvbSB0aGUgbmV3IGZpbGVzIGFkZGVkIGJ5IHRoaXMgc2VyaWVzLg0K
PiBPay4gTGV0IG1lIHJlbW92ZSBpbiBuZXh0IHZlcnNpb24uDQo+Pg0KPj4+ICsgKiBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQ0KPj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPj4+ICsgKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbi4NCj4+PiArICoNCj4+PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3Ry
aWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+Pj4gKyAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
DQo+Pj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZSB0aGUNCj4+PiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4NCj4+PiArICoNCj4+PiArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEg
Y29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4+PiArICogYWxvbmcgd2l0
aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uDQo+Pj4gKyAqLw0KPj4+ICsNCj4+PiArI2luY2x1ZGUgPGFzbS9kZXZpY2UuaD4NCj4+PiAr
I2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+PiArI2luY2x1ZGUgPGFzbS9wY2kuaD4NCj4+PiArDQo+
Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIGdlbl9wY2lfZHRfbWF0Y2hb
XSA9IHsNCj4+PiArICAgIHsgLmNvbXBhdGlibGUgPSAieGxueCxud2wtcGNpZS0yLjExIiwNCj4+
PiArICAgICAgLmRhdGEgPSAgICAgICAmcGNpX2dlbmVyaWNfZWNhbV9vcHMgfSwNCj4+PiArICAg
IHsgfSwNCj4+PiArfTsNCj4+PiArDQo+Pj4gK3N0YXRpYyBpbnQgZ2VuX3BjaV9kdF9pbml0KHN0
cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LCBjb25zdCB2b2lkICpkYXRhKQ0KPj4+ICt7DQo+Pj4g
KyAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoICpvZl9pZDsNCj4+PiArICAgIGNvbnN0
IHN0cnVjdCBwY2lfZWNhbV9vcHMgKm9wczsNCj4+PiArDQo+Pj4gKyAgICBvZl9pZCA9IGR0X21h
dGNoX25vZGUoZ2VuX3BjaV9kdF9tYXRjaCwgZGV2LT5kZXYub2Zfbm9kZSk7DQo+PiBUaGlzIHNo
b3VsZCBiZSBzdXBlcmZsdW91cw0KPiBBY2suIEkgd2lsbCByZW1vdmUgdGhlIGR0X21hdGNoX25v
ZGUoLi4pIGluIG5leHQgdmVyc2lvbi4NCg0KSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3ZSBuZWVk
IHRoaXMgcGF0Y2ggYXQgYWxsIGFzIHRoZSBtYWluIHJlYXNvbiBmb3IgaXRzIGV4aXN0ZW5jZQ0K
DQp3YXMgdGhhdCB3ZSBjYW4gcnVuIFhpbGlueCBRRU1VIGZvciBaQ1UxMDIuIEJ1dCwgdGhlIGZp
bmFsIHNldHVwIGlzIG5vdCBnb2luZw0KDQp0byBiZSBmdW5jdGlvbmFsIGFzIGxlZ2FjeSBJUlFz
IGFyZSBub3Qgc3VwcG9ydGVkIGFuZCBJVFMgaXMgbm90IGEgcGFydCBvZiBaeW5xTVAuDQoNClNv
LCBRRU1VIGFsbG93cyB0byBkbyBhIGxvdCB3aXRoIFBDSSBwYXNzdGhyb3VnaCwgYnV0IGF0IHRo
ZSBlbmQgb2YgdGhlIGRheSBvbmUNCg0Kd29uJ3QgaGF2ZSBpdCB3b3JraW5nLi4uDQoNClBsZWFz
ZSBjb25zaWRlcg0KDQpJZiB3ZSBkZWNpZGUgdG8gcmVtb3ZlIGl0IHRoZW4NCg0KaW50IHBjaV9o
b3N0X2NvbW1vbl9wcm9iZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgcGNp
X2VjYW1fb3BzICpvcHMsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaW50IGVjYW1fcmVnX2lkeCkNCg0KZG9lc24ndCBuZWVkIHRoZSBsYXN0IHBh
cmFtZXRlci4NCg0KPg0KPiBSZWdhcmRzLA0KPiBSYWh1bA0KPg0KPg0KVGhhbmtzLA0KDQpPbGVr
c2FuZHINCg==

