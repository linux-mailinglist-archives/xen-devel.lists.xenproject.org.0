Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152640268C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180708.327470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXmF-0006PK-88; Tue, 07 Sep 2021 09:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180708.327470; Tue, 07 Sep 2021 09:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXmF-0006Mf-4l; Tue, 07 Sep 2021 09:52:27 +0000
Received: by outflank-mailman (input) for mailman id 180708;
 Tue, 07 Sep 2021 09:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNXmD-0006MZ-9e
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:52:25 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac617ce9-c16b-4a33-9cd1-aeeaca2b86fe;
 Tue, 07 Sep 2021 09:52:24 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1879h5nS030224; 
 Tue, 7 Sep 2021 09:52:21 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ax3d2rker-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:52:20 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM7PR03MB6327.eurprd03.prod.outlook.com (2603:10a6:20b:137::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 09:52:17 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:52:16 +0000
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
X-Inumbo-ID: ac617ce9-c16b-4a33-9cd1-aeeaca2b86fe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK7A8sAL19CiTLD3ZU6JXJHyA2iHkaS+uQeSNQi0nDL/oyZSmdhku4rxDffaQyY/EcxelDcXiE7h0DU8H+6m1I3HvzXvbbMPsucKSUt3WwbWz+KiFojcErDaOTnDZw5yBPnD+rFWfmtTUNQU4DlbFty7ok2XJSjqHBEIt2P1MCq2o8rezPzapNlwgc7GFK3lA9Dt+P/S/y5CSLSOtU+tiv5/K9YzhT8UKicyNo/iwUsv+WfmMGUqGbu38DyoZqgjAae9/N6U/JUinPkrg6xP5MoDWY7wlwwGRIES4bx9D5cXh7PtaUiOrGZgZo1DVtXh8soyGIqInh/IJ6mjxFIyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+ol761Dc91+0hUI/Jo1B4DDOAwiNGaIXzUP1n4/xJDE=;
 b=Sd2oFJsoJrYc6fz9/hrKGBWkdnTvscWMMZ6dPyztpbqnZmImNdwxjm4LEbbRBsQYOgke7W0ndt9p6ZmCS+uff+SG8cuYzMTVOK7Hlz/+A4cP3xcMQJQZu0o1DVYbZtU2GFA6o8AkKfLM7oAQW+W5DVlO5gC4kAxbUmzpGGKAbHiE9LSEhiYdXRuS5bZ6IwIrU5Xb/dsLHbKYmC1m3gFreN5aXpBWkOxKmGj2vGThNsSKz0wKB5RnyCVbYiUR1akSFiFLPTFH5i1bm40bUZkhW707oWDCGimO9du1SIAj/T27heUYOsjqY4RCrmRhaAOT95UAE0f919zm/YA/TRvqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ol761Dc91+0hUI/Jo1B4DDOAwiNGaIXzUP1n4/xJDE=;
 b=NSnbO4ohcGGbWE+3TOU1Gqlv4LAnWL2jt2px9mYqCXsyXyAYlnlIszf+Ct3wBfJz3QXLmJFO8YmbV1w6bddBMX8f48sKllLuEwMFmf5JKkK44SSOvtnvenmuDp6UM/GCy7TkrAmhFxb5QD6WPtNdo8sjd+/obczV/Okp0omiIlhYZ+84IIESm9VImoKDBO37n8BdiHr4UF123XmWBYoZKBCQHvqOoNfXFao60hIScKDOreKoaBeelj5tfHUh+mLceGn5wFa8tMHfBE5H0MD7he+FfaBob+1WAPJN4DCg26oZUS5hEVicFoX8k3rRUsfZHSiy6e0G69ae3QIb/31Nhg==
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
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYA=
Date: Tue, 7 Sep 2021 09:52:16 +0000
Message-ID: <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
In-Reply-To: <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47fbaf89-b629-4a2c-c6c6-08d971e52cfd
x-ms-traffictypediagnostic: AM7PR03MB6327:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB63275072D29C6387071D780EE7D39@AM7PR03MB6327.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PYuXB+pwgV16n1NQeQQHDt2Kc1yitg8csf0lx4VNEaLkXosO5IzY8yAHr12wvtVEgC985gkUG/iFdVVozG6EV4dnKkKboLze6IsQb6BTHJiiOcQnAFzhZkepTef8QAkslMqqv7cXGaUK2/0TPzppWFYX+JLTg9/dOA7nkHjcadagzm8s33q73kPmdzU6dEjjPE7uhp6acHe8lhgI+Ce2vkWnr4/2fORMv0pXn6lYDIfdlRf+S7gtUWLRoveCYqiUllM8BqwTbTaM1ncWvFwB2FAkQgrK/+kREaIRWQXW4BaYjyjhY02BcVqsSJtJVIcjIOWTXdifanzXsh4Rz7tsFcbRuUBacFGKV0uhh/5yoE/yEbfy8uACeC1YrOogNEyccoIsn0uraIDa9lXqsmv2qvotHd/CcU1Bl+QAu+tDLDL8ufc1Cg/GMBnQLAsfkICnyFseTKQI2tyHQ+VMdUJJs+WfGPqWBGyN9NmC161kVZ5b89mR1DYYO4gjHN1ge7i4qEbwYaAc6Beqi6usBZNYtAX0l7JfGnZ6BtoxLKU10sb3aH7MuMO/krvnUzl9OvuHZjCyicSKr2FBzxJ6PIwcL3j77wpmdq6LTBbegsOElmbc/tnhiKhqT5Ti5LfPp4Z5JCSKXv/Jh0p44B2FylrXCQY7PDNtDVSuKFqBfcZT5Gokhf3tShD1YVpFJzA0jdOJzxzQJh2Gt7eh3xIacNoDbe4N+FpH2428HCAvu0XCAf8HsKztIvt/CKp7plgj1eRu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(86362001)(91956017)(6512007)(26005)(31686004)(66556008)(76116006)(66446008)(36756003)(4326008)(31696002)(66946007)(66476007)(6506007)(54906003)(110136005)(316002)(83380400001)(53546011)(122000001)(2906002)(71200400001)(38100700002)(478600001)(8936002)(186003)(6486002)(38070700005)(5660300002)(8676002)(64756008)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SEVJcTNFV0V5bTBOSDgrOFlMOXk3Y0ViN1BzMTI3Rm5FeUF3dE43UzZ1WXRp?=
 =?utf-8?B?MEpYLzY0VGozMGxlelVzNEI0dGtObTdQUEVySnR2ZTFBYlIvbXVHUUhVRUtP?=
 =?utf-8?B?VDUyeldabWlUMkRqdXB0L0dIcjlYOHZnUzJRK1BVSjlLVkJ5S2VBQTdwcm85?=
 =?utf-8?B?L1lDWllLWW02V0svYjZjenlQQzIzYm5CdkgwL1ZwRlVzMU9DWC9vbEUrQ2hS?=
 =?utf-8?B?cGZkUHBsT0pRaWtsZWptWDZ3dCtINTNyVmVCb0R6YkdXcE05dzYxeFNmcjhS?=
 =?utf-8?B?L2RubDU4aGlRWEdIU2N3N3puNGNGRFZMa1d6N1gwbTRVWUVWM1J5SlVtSTM0?=
 =?utf-8?B?RnF3ai8wUUJvUjI5SysrSlYyV29teFN6UUlLaXNnbUpnVjJucVQ1MjdwdFps?=
 =?utf-8?B?RTdwZGFkN2Y0cWE5ZFlvbE02YlZHd2JVWjNkUnZrdlZWaWJuZ1JDWW9zTGhT?=
 =?utf-8?B?dGFQYS9UVCtXZjJkL1BvZzRJYitrODgvM0N4RkdqOXNlVnhQWnV2NFRpT2hR?=
 =?utf-8?B?RlBEVjIwRzRrK0hIYmhNckFoWnFvcGtyZndDaTY5Y1Q4aFRzQUxERkFzVnR6?=
 =?utf-8?B?RytFZC9lNnJmcHdYY3Z5aFdSMXBqUG1Hdlk0bTcxeXh5UlNMby8rNUlTUGtC?=
 =?utf-8?B?MXFTS2xFcFV2N1BzazNtR1dFWm96STRRU3g5UDRBeWwyeklyejdIVG5PMzND?=
 =?utf-8?B?K3Z1c1I4bHFrYjdWdm56Nm40ckFVSFBwOW5oVDNhSW9RemNTWitmTnVhL01w?=
 =?utf-8?B?MzBPUGEvQ0FxYnV3dDVNMFBGOTg5OWRCTHZRT1I2V0FsOUxHblA5a3hzektk?=
 =?utf-8?B?aGgxUkw5enJaYlZrYllMMWtyVWkyQkU5aDdTL3BXTzdlNVFJb1U5Q2gzWlhI?=
 =?utf-8?B?dnJWMTc4Wmk2dURMZTY5UkxTSjkvSVVudWFOaUM3d1ByMUY5aGpKWGlmT1VJ?=
 =?utf-8?B?RWU4b1JjOWNhSEN2cUFpdmlBVHdUZERmSDFxcG9jNTZpSS80RFRNNVdPZk9O?=
 =?utf-8?B?NkVrRjU4NW9wMnh4RTQzcW9YWkZIS2J6YUZkQ080ODJFTmM3MjhRSGR4UVpm?=
 =?utf-8?B?c1NTR0J0Y3R6dytMZU5JTmFva1Yyci9IVXZRL1QrWFZneSs5QWY3ZlJndDV3?=
 =?utf-8?B?VzJoQXhiL2gzWTJ2bGNva3g4ZTcvSE1DaWQ4cE43YjZsTDg0WEFRZXFzY2Fm?=
 =?utf-8?B?cklGZytyT3FVN1VYVnZPZWlUNjBBTFFhTGxsa2M4eENjbzdWdlZaaGcwNHQz?=
 =?utf-8?B?NE9wNWV5RjVLY0RGc01tYi9wenhxS0w4OG1wRGVOL2I5OW50STEydENidy9y?=
 =?utf-8?B?bUxtOXdSTDhMNksySUVXQnZpWDc3UXlLTHZRdVpQUmx2SW9zNmxrdlNKRU5j?=
 =?utf-8?B?aFIyWWpEZ0NNdGJMb2JSOGtDNFJST01QczN6YmFGNHZXSEY0MlVrZ1NhMW16?=
 =?utf-8?B?RndmVEtzcTcrQ2E1NTJsWXZyaFYxTUloU1dneWJjYjZtRkJrK25sZ2ZTbkZU?=
 =?utf-8?B?TTlUai9PYmVOaFF4M0JibkF3SzlPRk83clhVOURCZ3ROQ2VvS2FFKzd1S1Bu?=
 =?utf-8?B?YUJ4UmpOckR1cE5LdnR5QU5SYk5MTHlEeHlsVXUyb3IvQjRiZVlKS2tQWDV1?=
 =?utf-8?B?M3c4ZEFDUURTQkd3SlN0cERPYmJhV3VQa3Jiem1ZTXNZVnJUcGlYSHZxbWtL?=
 =?utf-8?B?eFlXTENKdmpWUUhqTVY1WWxlMWsydEhUSkY2ditpQXltcXRPVEtJNzlUcGgv?=
 =?utf-8?Q?EZnJBRRwOWekLxsQUwU9i5yf58AW3cTMmbz3+v0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1AC6BD172CC76429FEBDB55999C5EF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fbaf89-b629-4a2c-c6c6-08d971e52cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 09:52:16.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0Aiqn7dKBW2mZoOWh6C0jmvZajLWT1aAjsup6G65xR6duyNsIdJciBjVHD3+bOQh90E0GBMIENqC9hZbyyxu/A8Bf42vrp5vqCD7o/OvvNNJ7W7XaeG0wfMaDTWA5EZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6327
X-Proofpoint-ORIG-GUID: YLtnS5ThGfSCc62F1oTtxLjhQ7D_RJJz
X-Proofpoint-GUID: YLtnS5ThGfSCc62F1oTtxLjhQ7D_RJJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_03,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070065

DQpPbiAwNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTE6MDcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTE6
NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTA6MTgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBTbywgaWYgd2UgaGF2ZSBhIGhpZGRlbiBQQ0kg
ZGV2aWNlIHdoaWNoIGNhbiBiZSBhc3NpZ25lZCB0byBhIGd1ZXN0IGFuZCBpdCBpcyBsaXRlcmFs
bHkgdW50b3VjaGVkDQo+Pj4+IChub3QgZW5hYmxlZCBpbiBEb20wKSB0aGVuIEkgdGhpbmsgdGhl
cmUgd2lsbCBiZSBubyBzdWNoIHJlZmVyZW5jZSBhcyAiaG9zdCBhc3NpZ25lZCB2YWx1ZXMiIGFz
DQo+Pj4+IG1vc3QgcHJvYmFibHkgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2lsbCByZW1haW4gaW4g
aXRzIGFmdGVyIHJlc2V0IHN0YXRlLg0KPj4+IFdoYXQgbWVhbmluZyBvZiAiaGlkZGVuIiBkbyB5
b3UgaW1wbHkgaGVyZT8gRGV2aWNlcyBwYXNzZWQgdG8NCj4+PiBwY2lfe2hpZGUscm99X2Rldmlj
ZSgpIG1heSBub3QgYmUgYXNzaWduZWQgdG8gZ3Vlc3RzIC4uLg0KPj4gWW91IGFyZSBjb21wbGV0
ZWx5IHJpZ2h0IGhlcmUuDQo+Pj4gRm9yIGFueSBvdGhlciBtZWFuaW5nIG9mICJoaWRkZW4iLCBl
dmVuIGlmIHRoZSBkZXZpY2UgaXMgY29tcGxldGVseQ0KPj4+IGlnbm9yZWQgYnkgRG9tMCwNCj4+
IERvbTBsZXNzIGlzIHN1Y2ggYSBjYXNlIHdoZW4gYSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhl
IGd1ZXN0DQo+PiB3aXRob3V0IERvbTAgYXQgYWxsPw0KPiBJbiB0aGlzIGNhc2UgaXQgaXMgZW50
aXJlbHkgdW5jbGVhciB0byBtZSB3aGF0IGVudGl0eSBpdCBpcyB0byBoYXZlDQo+IGEgZ2xvYmFs
IHZpZXcgb24gdGhlIFBDSSBzdWJzeXN0ZW0uDQo+DQo+Pj4gICAgY2VydGFpbiBvZiB0aGUgcHJv
cGVydGllcyBzdGlsbCBjYW5ub3QgYmUgYWxsb3dlZA0KPj4+IHRvIGJlIERvbVUtY29udHJvbGxl
ZC4NCj4+IFRoZSBsaXN0IGlzIG5vdCB0aGF0IGJpZywgY291bGQgeW91IHBsZWFzZSBuYW1lIGEg
ZmV3IHlvdSB0aGluayBjYW5ub3QNCj4+IGJlIGNvbnRyb2xsZWQgYnkgYSBndWVzdD8gSSBjYW4g
dGhpbmsgb2YgUENJX0NPTU1BTkRfU1BFQ0lBTCg/KSwNCj4+IFBDSV9DT01NQU5EX0lOVkFMSURB
VEUoPyksIFBDSV9DT01NQU5EX1BBUklUWSwgUENJX0NPTU1BTkRfV0FJVCwNCj4+IFBDSV9DT01N
QU5EX1NFUlIsIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSB3aGljaCB3ZSBtYXkgd2FudCB0bw0K
Pj4gYmUgYWxpZ25lZCB3aXRoIHRoZSAiaG9zdCByZWZlcmVuY2UiIHZhbHVlcywgZS5nLiB3ZSBv
bmx5IGFsbG93IHRob3NlIGJpdHMNCj4+IHRvIGJlIHNldCBhcyB0aGV5IGFyZSBpbiBEb20wLg0K
PiBXZWxsLCB5b3UndmUgY29tcGlsZSBhIGxpc3QgYWxyZWFkeSwgYW5kIEkgZGlkIHNheSBzbyBi
ZWZvcmUgYXMgd2VsbDoNCj4gRXZlcnl0aGluZyBleGNlcHQgSS9PIGFuZCBtZW1vcnkgZGVjb2Rp
bmcgYXMgd2VsbCBhcyBidXMgbWFzdGVyaW5nDQo+IG5lZWRzIGF0IGxlYXN0IGNsb3NlbHkgbG9v
a2luZyBhdC4gSU5UWF9ESVNBQkxFLCBmb3IgZXhhbXBsZSwgaXMNCj4gc29tZXRoaW5nIEkgZG9u
J3QgdGhpbmsgYSBndWVzdCBzaG91bGQgYmUgYWJsZSB0byBkaXJlY3RseSBjb250cm9sLg0KPiBJ
dCBtYXkgc3RpbGwgYmUgdGhlIGNhc2UgdGhhdCB0aGUgaG9zdCBwZXJtaXRzIGl0IGNvbnRyb2ws
IGJ1dCB0aGVuDQo+IG9ubHkgaW5kaXJlY3RseSwgYWxsb3dpbmcgdGhlIGhvc3QgdG8gYXBwcm9w
cmlhdGVseSBhZGp1c3QgaXRzDQo+IGludGVybmFscy4NCj4NCj4gTm90ZSB0aGF0IGV2ZW4gZm9y
IEkvTyBhbmQgbWVtb3J5IGRlY29kaW5nIGFzIHdlbGwgYXMgYnVzIG1hc3RlcmluZw0KPiBpdCBt
YXkgYmUgbmVjZXNzYXJ5IHRvIGxpbWl0IGd1ZXN0IGNvbnRyb2w6IEluIGNhc2UgdGhlIGhvc3Qg
d2FudHMNCj4gdG8gZGlzYWJsZSBhbnkgb2YgdGhlc2UgKHBlcmhhcHMgdHJhbnNpZW50bHkpIGRl
c3BpdGUgdGhlIGd1ZXN0DQo+IHdhbnRpbmcgdGhlbSBlbmFibGVkLg0KDQpPaywgc28gaXQgaXMg
bm93IGNsZWFyIHRoYXQgd2UgbmVlZCBhIHlldCBhbm90aGVyIHBhdGNoIHRvIGFkZCBhIHByb3Bl
cg0KDQpjb21tYW5kIHJlZ2lzdGVyIGVtdWxhdGlvbi4gV2hhdCBpcyB5b3VyIHByZWZlcmVuY2U6
IGRyb3AgdGhlIGN1cnJlbnQNCg0KcGF0Y2gsIGltcGxlbWVudCBjb21tYW5kIHJlZ2lzdGVyIGVt
dWxhdGlvbiBhbmQgYWRkIGEgInJlc2V0IHBhdGNoIg0KDQphZnRlciB0aGF0IG9yIHdlIGNhbiBo
YXZlIHRoZSBwYXRjaCBhcyBpcyBub3csIGJ1dCBJJ2xsIG9ubHkgcmVzZXQgSU8vbWVtIGFuZCBi
dXMNCg0KbWFzdGVyIGJpdHMsIGUuZy4gcmVhZCB0aGUgcmVhbCB2YWx1ZSwgbWFzayB0aGUgd2Fu
dGVkIGJpdHMgYW5kIHdyaXRlIGJhY2s/DQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9s
ZWtzYW5kcg0K

