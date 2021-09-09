Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1594053CF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 15:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183255.331326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJvW-0002oe-AW; Thu, 09 Sep 2021 13:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183255.331326; Thu, 09 Sep 2021 13:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJvW-0002mb-6q; Thu, 09 Sep 2021 13:17:14 +0000
Received: by outflank-mailman (input) for mailman id 183255;
 Thu, 09 Sep 2021 13:17:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOJvU-0002mM-Ke
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:17:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d94dc78-1170-11ec-b1b4-12813bfff9fa;
 Thu, 09 Sep 2021 13:17:11 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189CwTca010184; 
 Thu, 9 Sep 2021 13:17:08 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ayjph855y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 13:17:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4884.eurprd03.prod.outlook.com (2603:10a6:208:fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 13:17:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 13:17:04 +0000
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
X-Inumbo-ID: 3d94dc78-1170-11ec-b1b4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iicYcw7F1T4KQqYrXxWe1LIP9eWg9IUCdVgo9bZ6vzAZ2IdPHgJ/gSxEDgvBmlDFHR1t8Gn/e/kwTCBnosB4squxgDLX1gvsLRHdvdx9mGOhoZMVvDDGnjR1xsLe3mxEs4h3TEwbLlWdgyMijJ+PomOtif8V4AFZLu6e42ZXpVMgmIirSmLsqwAXBYjR+wsvGmsRAnN0kK9e0+mCP7kw/gzJyey/YJOx55wC9Urh/2KETdbN+E+aYA2nY1fhZjBiZ85yQF22orH7LMuY2JDqyJoxCmUDOLwn5HuA7yikazCz2HL+zt6mC30uCCtchi3/Jp2AYDWr+zSRhS1RA1mavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zbY9fevbrbh0e0i2EJEENxq9Ol5M7fZa4MJBTVyCm9U=;
 b=GmuCMFza04Re25bHBD22F5j5LgEGiIfoEDkdCQWIFiKlm4g01k9sJRcqSs9v851vajqIo2M/3vh7AMberKDwq5fO/LgmY1Azo21EqeuKrhwUkJwqYLe47hdIHUc7W5SMiE1M7XFvaMikKwLKcTaanUc9HcaMTC6JOyCg4MhWK9kc7pLwG/IIeU1CTQ0T2HTQHrupgzDXHWCaBK+DyJAIoW2fri+EMbMmO3pV0oURPHxDuCT6suwAmNZd2eTJrHGGMLMXpnti/ECIF6ewoXbI4zqgEYXqHPGXEs6bdCvn3Hp6LA4wGPgApyCbHZDcKZFHehBuUvDwyU6pQsDsXPOSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbY9fevbrbh0e0i2EJEENxq9Ol5M7fZa4MJBTVyCm9U=;
 b=RKj7XFKl4bfyAegIpMkDTmrl5RQ4OPbX25PoPRCzX4X1uG/Map3Hn3Hr+NISKCwTuCE79Op0sAzCAjn3jV4WuC5DH+H3uGKLCZxlSK6KUch3KcKKmZeFF5BW9fIohmccazu7cqxf/5zFcdCba1bTj/37omlwf2tyb4DPJRyuTQ0O9VgeEJWcadoE6ZVUJhPdvPUvIB4CSi+hVTmuPHy74FHchEAL+8JYUUVyK5hG6MXU6Zh3zh1G5i96nVSgfq/2rFvrGo9fPdQXeBpTNKJCiG4NpEckiQes+V/2QrQUdy0uVXzkFAVFzM5llPPxvVM7k2JJeYA++K6btEZJT3TTBQ==
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
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuAgAAA+ICAAAH/AIAACKGAgAAo+QCAAAGkAIAADY6AgAABTQCAAAhegA==
Date: Thu, 9 Sep 2021 13:17:04 +0000
Message-ID: <47bc8652-54af-f6f5-42a9-88adbbf0eb57@epam.com>
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
 <38669583-3e3a-36e2-8714-a4b6a4e10173@epam.com>
 <d2ebd8dc-0dc1-80dc-aa15-45a02b01004f@suse.com>
In-Reply-To: <d2ebd8dc-0dc1-80dc-aa15-45a02b01004f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ee3861b-a540-45b1-6352-08d973941e0e
x-ms-traffictypediagnostic: AM0PR03MB4884:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB488453E1907DF738068A29F4E7D59@AM0PR03MB4884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TqP9ikD0nEyeZq/ZZE8RIIg2rp9fPMA/vQoRdozTXev2TZ3KDXRiUzIOaJKbEUuSXZ9JelZlmLkI/Z5rEhuDr9dT1lCWhJig6f1gFjN68APbz7RLO/8pgw9Ou7EInZbnIUXoa1PjcdHbQfu8rY7QVwbCO6bqIGHG34Oz9gZpdqHU17PJ0ABcDJ6ARwvczJpA+UtGfbRT4ZhFJg2SwthmzZrK6RWnKBwLRznRitz98jInz8vHvE1YMmH5MEdWdTWifVVtCOxvQPNYLHlhZJcBGvHElyLpnEVi8/+5aAks3F9TgkjF28+cqMdB7ot3we3Cteg1bPcs7FpZ0pLXv9N63QMt1sJbhbu1+Rl6dfqJM/+fsLQw5a7CwaPWT/QGDxdYJF35GZV1F/cunuBUtOEpX8gHZcZ2fSGWHrAzR7yovjLeOetJF8hFIpoj7cTi+qkVdTrZEoTVejXtDPixBHyMREm/Ml1JGlAW164zHfQ8qkJZMFPN/IH4Sf/HCmqUEgGB2lTdG7aWjJ4Yjix9ivzjqkKICUoi4uOOWH4980wigC0DE+rbuJtMj2keswF1SpAtimN8ZAplrN9P/0KNiu5wyiw6XIleeFqhHIYdLYhR0ZobTDXEpkJOZlSrcDCPG5ABaEntBo91BrDuGPngzVSrooZaMQbNFt5zCS/kKC2TBMzaemImCM7QR5bbqYCTqbXiA1xPA1Jua5BWF6xrJAf8rKGK9ZZ2oz8r7z3oQnTF0Ha6xkVNsNoX1CMpz5TvLFJN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(122000001)(38100700002)(71200400001)(86362001)(186003)(6512007)(478600001)(6486002)(2616005)(31686004)(110136005)(5660300002)(66556008)(66476007)(66446008)(2906002)(91956017)(26005)(76116006)(54906003)(64756008)(83380400001)(66946007)(31696002)(38070700005)(53546011)(6506007)(4326008)(316002)(36756003)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmRoa0gvVXcySjdhSlVOd2hyT2VFYmluNlVDVXhQNkkxMk5ham14M0I0T1pC?=
 =?utf-8?B?bzlrNS9rYXNMYjgvN3lhTzhBSHlvWkFxM05WWmdGRHNCcVdxUkNlMEhpT3c0?=
 =?utf-8?B?UUw4RlU5VDJxRWh3VmoyL1VRN2VtaFFyWXY3bkFFdkc5L0FEYXk2cERlV3JH?=
 =?utf-8?B?RGg5NFRNVndwbzk0VjFZM1Y0cUR1bEoxWlNFWDhMSjJkeTUrVTZPRVRoMmNH?=
 =?utf-8?B?ZkRmay9sbkU5cmt4YlNGaytOK2hiQW15TnNDRkdWNWRhcUNuS1R5cUxPRVZF?=
 =?utf-8?B?bGRrbzdxODFFMWVLNlVDMkhncXlPY015Y25ZSkVSNmlNMXRTdzhYdVhzT25S?=
 =?utf-8?B?UFd5bDRqUmtYdzJYRWxUbUVoczREV2hPNjlhMG9LRzZDRHAza0VCeUUvMmNK?=
 =?utf-8?B?ODBOK2tseUpDZGxXcnY3N2VlUmFqcHN2ZkJvTjZxT0J4QWowZThRMXBHeHVR?=
 =?utf-8?B?T09jVGlsUVlhRkI1YVdGU0UxczhsUkdxZmowMy9ZRnlsRXFtUGhPY1lNNXlk?=
 =?utf-8?B?VTAvWHJPK095VjRrT0kzWENIS1M5RUl6aE9UaTdrdHVxSjFheUd0Zm9OZ09I?=
 =?utf-8?B?WW5YZnh3SkRlOUV6MDZsNzBlUVlBbXlKRzlLK1U3YWtLeXQ1eVkxVjFUaEZU?=
 =?utf-8?B?b2grMys4a2NqRDZ3VWRkL0xseHVvVkdoY1Q5cVFvQXRsWW5TcUlheU9QZjJQ?=
 =?utf-8?B?d25KS3hIMzBySUtRNG9WNlpqRnBBb1pZenFaQWZ3anF3S0FQU2t2UjlhZzNv?=
 =?utf-8?B?bXU2eXRoV0R6OUlMZ3Z1MEJlU2xsRXlQaWIrZ1JGRWNZdWFMcHhmY1E1eDlu?=
 =?utf-8?B?cFlaTEc5LzI2VEdURzVSQnNWWXJoVUpjMGhZN2dZRFpyc3ZJTm5XaDFJcWNG?=
 =?utf-8?B?WDZkQkExWElSekpFQlUrcEttZDVTUnVHa3k3b0tJanFtREVwRjR3K0xJTVJL?=
 =?utf-8?B?R1UrOWVNSURRdzdSeEJQMXZ5eTNITFhHQ0k0cXhOZ1VYYnAycCsvdDFpSWVx?=
 =?utf-8?B?QzZTdVZVVlhNYmpVL0cvRlVNWnJkWFB5bHBmeTVJWU5HckV1ZlNtZDVlY01T?=
 =?utf-8?B?c0w1SU9TOU95R0FIVXF3ZlF6dFRtdVNvaDFYSkxTOEMxQTVrTGh2ajErWkpC?=
 =?utf-8?B?czZtK29ONnpna1FqU29yNHpRVmNkSnZiTGNRUXJlVDl0NG9wb1hNSC9ZUE1m?=
 =?utf-8?B?cGtZcEN4T3dqV0dZRkFndytweHVEd3FJQ3I3MDhRYUdkdE1iSmNKS2QzVWRl?=
 =?utf-8?B?MmFVQmpFMW9mZDg2bjNBb3dzY25aVkJrbHU4UUZXQ3ZRVVcvcEFrQ0d2UDll?=
 =?utf-8?B?WncwVmNFZzZlRW5LTXBaSmVXbGlqRFQ3dkhmaUV5dnBXblFla3dRdWI4dEVL?=
 =?utf-8?B?YXIySTl5RFlJdnBnOEpZdnJCSmZ6MVZ6alduMG1wU0FmblRVaEkzUG8rTmE3?=
 =?utf-8?B?azg0SVFYVG0xNE9NSEpOMFhYS0lXVDJiUkJHY3VMRmZSQWJxaFlYK1UwWDNs?=
 =?utf-8?B?M0JVbVNHdUJaMHFhdVIxT01jN3QwZWJCRmdtQWtoSlRGcnpuMTdMSnk4SndU?=
 =?utf-8?B?ZlRXRlcrYXN0cXBXbkluSUMvQjQwYzBMRHVkTGtFN1VuTjJ6YXh1Q0RqNlU4?=
 =?utf-8?B?cmQ4QVVUTjFiWTFHY0E2RGhpZ01LbHJyMmZSQnY5Um9oVmtaM3pOellQRG9h?=
 =?utf-8?B?ZDZ3N1RReE9sM3hINnk3VCtaTGwxeEtpd2wvVjNvWm5QOE1GVys0UUhjNFhG?=
 =?utf-8?Q?wDN8AJer9aFER2D0E/5vv/m1Ne2SNshm7mBr/o6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E849FA8469BD7741B5A8693A822429AA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee3861b-a540-45b1-6352-08d973941e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 13:17:04.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j/udZa7qljCsN/QsZA9HK/ubwU2aw5exiD4bMAJRLWE3Gykkz4+Vg97HwAyObjjecS3y7U17ArpPq1JkWOTjfuFnGntv73+SNmXKXAq0Ooa5dHAUGJDjzDd2Tis92Box
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4884
X-Proofpoint-GUID: PwO0NC4BRDLtFhrCqug9hdOv3NSGYd4j
X-Proofpoint-ORIG-GUID: PwO0NC4BRDLtFhrCqug9hdOv3NSGYd4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090081

DQpPbiAwOS4wOS4yMSAxNTo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTQ6NDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTQ6
NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjA5LjIwMjEgMTM6NDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwOS4wOS4yMSAxMjoyMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBGb3IgdGhlIGJpdCBpbiBxdWVzdGlvbiwgd2hlcmUgdGhlIGdvYWwg
YXBwZWFycyB0byBiZSB0byBoYXZlIGhhcmR3YXJlDQo+Pj4+PiBob2xkIHRoZSBPUiBvZiBndWVz
dCBhbmQgaG9zdCB2YWx1ZXMsIGFuIGFwcHJvYWNoIHNpbWlsYXIgdG8gdGhhdCB1c2VkDQo+Pj4+
PiBmb3Igc29tZSBvZiB0aGUgTVNJIC8gTVNJLVggYml0cyBtaWdodCBiZSBjaG9zZW46IE1haW50
YWluIGd1ZXN0IGFuZA0KPj4+Pj4gaG9zdCBiaXRzIGluIHNvZnR3YXJlLCBhbmQgdXBkYXRlIGhh
cmR3YXJlIChhdCBsZWFzdCkgd2hlbiB0aGUNCj4+Pj4+IGVmZmVjdGl2ZSByZXN1bHRpbmcgdmFs
dWUgY2hhbmdlcy4gQSBjb21wbGljYXRpbmcgZmFjdCBoZXJlIGlzLCB0aG91Z2gsDQo+Pj4+PiB0
aGF0IHVubGlrZSBmb3IgdGhlIE1TSSAvIE1TSS1YIGJpdHMgaGVyZSBEb20wIChwY2liYWNrIG9y
IGl0cyBQQ0kNCj4+Pj4+IHN1c2JzdGVtKSBtYXkgYWxzbyBoYXZlIGEgdmlldyBvbiB3aGF0IHRo
ZSBzZXR0aW5nIG91Z2h0IHRvIGJlLg0KPj4+PiBUaGUgYmlnZ2VyIHF1ZXN0aW9uIGhlcmUgaXMg
d2hhdCBjYW4gd2UgdGFrZSBhcyB0aGUgcmVmZXJlbmNlIGZvciBJTlR4DQo+Pj4+IGJpdCwgZS5n
LiBpZiBEb20wIGRpZG4ndCBlbmFibGUvY29uZmlndXJlZCB0aGUgZGV2aWNlIGJlaW5nIHBhc3Nl
ZCB0aHJvdWdoDQo+Pj4+IHRoYW4gaXRzIENPTU1BTkQgcmVnaXN0ZXIgbWF5IHN0aWxsIGJlIGlu
IGFmdGVyIHJlc2V0IHN0YXRlIGFuZCBJTU8gdGhlcmUgaXMNCj4+Pj4gbm8gZ3VhcmFudGVlIGl0
IGhhcyB0aGUgdmFsdWVzIHdlIGNhbiBzYXkgYXJlICJhcyBob3N0IHdhbnRzIHRoZW0iDQo+Pj4g
SW4gdGhlIGFic2VuY2Ugb2YgRG9tMCBjb250cm9sbGluZyB0aGUgZGV2aWNlLCBJIHRoaW5rIHdl
IG91Z2h0IHRvIHRha2UNCj4+PiBYZW4ncyB2aWV3IGFzIHRoZSAiaG9zdCIgb25lLg0KPj4gQWdy
ZWUNCj4+PiAgICBXaGljaCB3aWxsIHdhbnQgdGhlIGJpdCBzZXQgYXQgbGVhc3QgYXMNCj4+PiBs
b25nIGFzIGVpdGhlciBNU0kgb3IgTVNJLVggaXMgZW5hYmxlZCBmb3IgdGhlIGRldmljZS4NCj4+
IEJ1dCB3aGF0IGlzIHRoZSBJTlR4IHJlbGF0aW9uIHRvIE1TSS9NU0ktWCBoZXJlPw0KPiBEZXZp
Y2VzIGFyZSBub3Qgc3VwcG9zZWQgdG8gc2lnbmFsIGludGVycnVwdHMgdHdvIGRpZmZlcmVudCB3
YXlzIGF0IGENCj4gdGltZS4gVGhleSBtYXkgZW5hYmxlIG9ubHkgb25lIC0gcGluIGJhc2VkLCBN
U0ksIG9yIE1TSS1YLg0KDQpPaywgc28gSSBzZWUgdGhhdCB3ZSBjYW4gcGFydGlhbGx5IGVtdWxh
dGUgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgYXM6DQoNCnN0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0
ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3Qg
Y21kLCB2b2lkICpkYXRhKQ0Kew0KIMKgwqDCoCAvKiBUT0RPOiBBZGQgcHJvcGVyIGVtdWxhdGlv
biBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQoNCiDCoMKgwqAgaWYg
KCAoY21kICYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFKSA9PSAwICkNCiDCoMKgwqAgew0KIMKg
wqDCoMKgwqDCoMKgIC8qDQogwqDCoMKgwqDCoMKgwqDCoCAqIEd1ZXN0IHdhbnRzIHRvIGVuYWJs
ZSBJTlR4LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmOg0KIMKgwqDCoMKgwqDCoMKgwqAgKsKgIC0g
aG9zdCBoYXMgSU5UeCBkaXNhYmxlZA0KIMKgwqDCoMKgwqDCoMKgwqAgKsKgIC0gTVNJL01TSS1Y
IGVuYWJsZWQNCiDCoMKgwqDCoMKgwqDCoMKgICovDQogwqDCoMKgwqDCoMKgwqAgaWYgKCBwZGV2
LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kIHw9IFBD
SV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCiDCoMKgwqDCoMKgwqDCoCBlbHNlDQogwqDCoMKgwqDC
oMKgwqAgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3QgY3VycmVudF9jbWQgPSBw
Y2lfY29uZl9yZWFkMTYocGRldi0+c2JkZiwgcmVnKTsNCg0KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCBjdXJyZW50X2NtZCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSApDQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7
DQogwqDCoMKgwqDCoMKgwqAgfQ0KIMKgwqDCoCB9DQoNCiDCoMKgwqAgY21kX3dyaXRlKHBkZXYs
IHJlZywgY21kLCBkYXRhKTsNCn0NCg0KYW5kIG9mIGNvdXJzZSBoYXZlIGdyYW5kIFRPRE8gZm9y
IHRoZSByZXN0Lg0KDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

