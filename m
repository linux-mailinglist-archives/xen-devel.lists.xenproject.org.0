Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4941D5A5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199613.353785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrj5-0000RF-Tn; Thu, 30 Sep 2021 08:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199613.353785; Thu, 30 Sep 2021 08:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrj5-0000Ob-OX; Thu, 30 Sep 2021 08:47:35 +0000
Received: by outflank-mailman (input) for mailman id 199613;
 Thu, 30 Sep 2021 08:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVrj4-0000OV-64
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:47:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f74e1c9-0d57-4488-ab17-4aeefc265fce;
 Thu, 30 Sep 2021 08:47:32 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U8dKGv016584; 
 Thu, 30 Sep 2021 08:47:30 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bd9wmr3m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:47:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2660.eurprd03.prod.outlook.com (2603:10a6:200:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 08:45:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 08:45:38 +0000
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
X-Inumbo-ID: 0f74e1c9-0d57-4488-ab17-4aeefc265fce
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKEY/RYjZb4OROWnDF6mY54uza0dZmHjo+xUdM3ZYZt1K1Sh0ebI13HE+v4SmN3N8eQTb9dUKiazpCI707QBFMVQmFrHYROLtaMnyIAVl5m3oh8cEXumy/Hd18bIFD41vg5GAb1MhiSNSSTjNMqpT2QcivRp7Xe5w1SCfQyjgw5bNyEIGSk3/q3Izc2nEYR3RIRSXEePxzveoDo8s/9IvjdIJp2cv0eHhoxKCscGcNxD2vYGMO6tGWFOV1uZTDmrks3o7ItIgYlcbXQtAM0DWqJeIJX/Pc99IfOXwhPpXtOdbJ0J8Fij9l9/Yt2H6YUu2tCvoLb4uvVVyZx1Q0IeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lyunuClZk8k0l4m5JL36m3Pi8UWDE4GqKGkuRzdRpgM=;
 b=ABe1GXdaLxRFcS5Joe4sSxn9Z8Ym51m7SfX/ayp1KSZTQ+Ohv/B8SkkFcJlyw01SUyTQ3XAAzcBLosQFjwrXsKS+BLp2ZofZ+WW0odSpAyIbPFbN/8RJiNwQP1umwf1HSCklyiSfg3pIfTg9J+3rSUbwGw6ASsCdjk7e0rlsjco4zu7CUHGGL/xf5XPGb8Fcc3GcVG30gi6aUI1blyEeAjYztthSIXlQVKiGrqLjE+naKnJqb1AuTKj6J/GdM71zlz1JQIBIt+1SYfxmAQ0+pFRtbvtrCSXLAoCPyaQso0wraIG6xk8E9jpAlWL1gSbuqy2agqJWHrXOr2t/ScClhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyunuClZk8k0l4m5JL36m3Pi8UWDE4GqKGkuRzdRpgM=;
 b=WkuRcIFMbwpYQ5D4VinOdJct7UuCQhj9pslcUPoRtEQW/o7HzSbVp7MYQM254zGJCGfZMlidfWRhieG5NvE9E9R519QZLaZGyGMXqufZq0ADHh9N1EclAzlT33wWhemJ64S3tZrPpnLmlTlkcuUKiACuFfgfcxRvIi24HHRj5U83N/i+MDn1t4mOzMJ6l8ANrZuXXgC1rPVaJZOpixDVLBW2hqE8PKU5d723TvWy6Rhk+z6eMXx8ofop6nriN3T/8DNcu/vSlomPZK0vLfKx3MoHZqRbB2v45JVSqxVWfmVYsCxbglB3DNRAy1BigzpyuowK9Qb/9Sginvk7p9ZGgg==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Index: AQHXtdAg2qzxZ1hIP02wGTFUbQtoPau8PLsAgAAGuIA=
Date: Thu, 30 Sep 2021 08:45:38 +0000
Message-ID: <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
In-Reply-To: <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82f6ccf0-ec68-49e0-6a24-08d983eead4a
x-ms-traffictypediagnostic: AM4PR0302MB2660:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB26605ED06EF9B770B618D46DE7AA9@AM4PR0302MB2660.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uG8PYGPPJpGTGFV+grXzArpTq6YquiJuz9W9cOWH2ZshRtuRyHmC1nqsNnkRweHniDkN0jrplv9pOTwcI9uSWKnXGVFByOAPNrxqr6bhEIGwG1c4GLyBPU+Vjdu9xSvL0Xrcy3HO4MHy22ocLsohegNCTBpk6KkRk/GzVIWN0OUDJpb3+zdOH4AXXZ94+y8s/JHyadWWdgGr7cIVztRtyZTdMpJy1igBqJAg6IpkZAODDm0oCrHfcR8e+50cYAJu2TbL+XJ4pJMF3S8ZWxlAui4ZmptS8GVUsexCXJToX9gA9e9c9G/VBANp3PqsKG1HQwON32+DgnzylZZFgneJTX2MMI0fqmsAOO58FaskBnLuCQhNOeO1AKvzkuEFFAt1XPXyZsulFZX+7Y+Ol+5JU0fwTTJA4Zu1FR64m4pb1YFKQIcQfsKO9FTYWBxH/GTiBQfmtyYj2Dnlw/pl/WdNwJbEhy2QXhGkEhzWX6A86KzG5bfU/Rkl88cXMtmzxHy+q+K6qxLITN20fsV6pxFqhmJvY1rKPyCFKVWkp5Y8R7JFjgM2QPqgVg66g+/b1+10hlBUocw5D0ewEqcSck4Vp9WL1Ba3OzJYtyZX36ev+fIHDwEg+VS7VlYrhwsXkuKNVbK2XF7pnaPxsd5guiyFCht4MlKZLk2EqlQixKtMwbNCveW8l3Kh0+iFNsuf/qw5o7U/zON33ecjyDiwKALzL8/WjWJFs4GtTmKA1I3IeZ3F9U/HQj2Ln9YE1ihlECfv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(66446008)(26005)(38070700005)(31686004)(66476007)(66556008)(64756008)(38100700002)(122000001)(2906002)(8676002)(83380400001)(4326008)(86362001)(55236004)(36756003)(91956017)(66946007)(76116006)(8936002)(6506007)(508600001)(31696002)(54906003)(6486002)(316002)(71200400001)(53546011)(186003)(6512007)(2616005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aUxSWTRIcFBLSlYrc1lHamxxWUE1TDlWMGVnYlpwWmY4emw0bStuNUtXRi8w?=
 =?utf-8?B?NnhpK3NmLzJ4aWZueGE1Zm53OW9ydGpCb2VISVd4V0V3azBMR0YzU0xLcFVm?=
 =?utf-8?B?VjdyMzBCc2wwbDJKYzk0SmJ4bExIdk92K2VYc2h2UkMvVGFvOEpKYVBFWFpn?=
 =?utf-8?B?R0g2eUlsUlZudHY4RmJtelJERE9OeEZOeDA3TlNxdlQ2UHg5TXlUU3F5VlNl?=
 =?utf-8?B?T2pNVlFhLy9CQ3JnSGFWMHcrWTdxZ2hQczkyNmEwR3NSZmhSRmhmSWdPMk12?=
 =?utf-8?B?cExVYmRSUDZKc3lIZURVYnF5SkpnaStRNHduOEh1V3BDYkQzR0drQUZ6c1FX?=
 =?utf-8?B?bVFRdkxxRWZid3hHVFY2d20wMTIxYWFtR2Uvdk1HYzhXd3hLelJFSEZCYlBF?=
 =?utf-8?B?M1VCRGJuMXRSazRHQ1U0WHI2djlCNzhWYjY1S09iVWVNN3piRXRkY2hwNVYx?=
 =?utf-8?B?bDhkMjNsd2R2YXBlOHB2V1VGaTZ3N0NiaS9wNUdDcHd1MkJBZHVUK0FwMGo0?=
 =?utf-8?B?RWluZmczWWtSVXo1V2p2WHFhZjhTWmVuOVZQUjNMS1BxWGQ4NWRNU0VqQ3lN?=
 =?utf-8?B?MVZjclVlaEFDUFdCY21LZ1pFSXROYU1TOVBDSXdkWW1KTVdsNzJVNmxxUEh2?=
 =?utf-8?B?dzFaN1lPVUpQMndVeUhtTnY0dTJoSWplVUdoM3RoT01zTmN6ZjlydVg4SmlT?=
 =?utf-8?B?VnJsOGwvSm9RQTZNMHFHVjRDNnRPaTExOXRzdVNjRmFreXJuOVgwdkxFMlZL?=
 =?utf-8?B?NUx3MVdGNGthZk5SNjhHUzNkTHdhWThWRU1hdE9hMXJrL1RCQTlSdlRaWnN2?=
 =?utf-8?B?TTVWSTN4N3NBdTlLREFwL2wrSTJzNHRCK3Q1aEo0SHYzQ1NReGNjZFM0RVV4?=
 =?utf-8?B?N2hyR0VaclpBaTcrRXBlSmpnYmdveHFHTHNLVkRQRlFSM254ZUU1UUl5TXhS?=
 =?utf-8?B?QW01N25jbVNON2cvblV0VTZ2SzRFd1dYdkdsaGxBTnBmUzluQVA5cDliYzVU?=
 =?utf-8?B?NW45WTZJblYyeFdrdWltZHR4bUNIZlhJaFZxb1dXTkxVYzlnTDNCcmZhZTl2?=
 =?utf-8?B?NnJkdEliTFVKWXpEd1RDWnI3Y204SUd1SWFVeWtsamYwM0h3OFdtc2V6VXJT?=
 =?utf-8?B?Z0g3Zk9LOEFDYkFaTGR6WnZ0Z3ZTTmp3eW0vWE5DL3YrWTIzMEdWNU0rS1Ja?=
 =?utf-8?B?NXZFMnFBbnJnM0cvVytKaFc2M2hrOUxVV0t0VzFJM0FOOVRrdm5BdGVJL1NO?=
 =?utf-8?B?SUg3anhwQWs2TDFnM3J3VnhjQjVUcW5IYUVoSFRvZTdBczUzcTRadHlhV0dh?=
 =?utf-8?B?TytDWGM2anZjVUlJa1gzaW9TSzhEWFNxNHdkYTFPVEtyeUFWTUF4bG5XN1lj?=
 =?utf-8?B?cUk5Y2JBYlNWMlFIek0xY3NoTTUrbGdWb0dIazBUL3pOMDRqM3YrTW1sbm4w?=
 =?utf-8?B?R1YyQUVyQnBFNzBLVVMzQTBLYjBSeE9XQ3Z2SWNqQU9ZTWl0MGZidDdxSkw4?=
 =?utf-8?B?WS9SOXlwOHdlSUE1eXVKd1hGVHM5NWd6RnhjZFBNMkRJN0VQK25ZS1ZucDJv?=
 =?utf-8?B?cjd2UDNRc21ZZUhPSm5TaW1URGJmYXBlZHBBVzhIdWJLVDBGb0gxTlFzVmJI?=
 =?utf-8?B?dUp6QkZFNTVwM3hLNGR0SDVFVEdkMVpYWk5wQitXOGIzeFBFK1pWaXMzNXNJ?=
 =?utf-8?B?cjYrcUs1ckZhYWVLVmtFZC9IWTR6c0NSZTQ5YzRRaVo3cmNhOGJFTjZEbXRO?=
 =?utf-8?B?ZTJuRFBoRTJ5NWhVMGJLMmJuTUdieldPQWtmbjNWRzNqUEptTDVLVEJkendo?=
 =?utf-8?B?c1NlRy9kVnpKRXlXN2lBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8BCE7796DF9E843ADB37C71D2FEB20F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f6ccf0-ec68-49e0-6a24-08d983eead4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 08:45:38.0534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qehk+1uJl1I+qWdCvbGI/ZrVq1Jbu/qjViXai3ZGWIJaySkOzOHk6RrDzfsDDApcYu5hG8CzD9M7DJY45f/8bt6VEicJFEt/gcGW/wdf5Cl4v6tNDR0wrP3/YX/G77Qc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2660
X-Proofpoint-ORIG-GUID: 0moApjGEPA1Hn9YA62cbriQPpcDAi_Y-
X-Proofpoint-GUID: 0moApjGEPA1Hn9YA62cbriQPpcDAi_Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_02,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300053

DQoNCk9uIDMwLjA5LjIxIDExOjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAwOTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gV2hlbiBhIFBDSSBkZXZpY2UgZ2V0cyBhc3NpZ25lZC9kZS1hc3NpZ25lZCBzb21lIHdvcmsg
b24gdlBDSSBzaWRlIG5lZWRzDQo+PiB0byBiZSBkb25lIGZvciB0aGF0IGRldmljZS4gSW50cm9k
dWNlIGEgcGFpciBvZiBob29rcyBzbyB2UENJIGNhbiBoYW5kbGUNCj4+IHRoYXQuDQo+Pg0KPj4g
UGxlYXNlIG5vdGUsIHRoYXQgaW4gdGhlIGN1cnJlbnQgZGVzaWduIHRoZSBlcnJvciBwYXRoIGlz
IGhhbmRsZWQgYnkNCj4+IHRoZSB0b29sc3RhY2sgdmlhIFhFTl9ET01DVExfYXNzaWduX2Rldmlj
ZS9YRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZSwNCj4+IHNvIHRoaXMgaXMgd2h5IGl0IGlzIGFj
Y2VwdGFibGUgbm90IHRvIGRlLWFzc2lnbiBkZXZpY2VzIGlmIHZQQ0kncw0KPj4gYXNzaWduIGZh
aWxzLCBlLmcuIHRoZSByb2xsIGJhY2sgd2lsbCBiZSBoYW5kbGVkIG9uIGRlYXNzaWduX2Rldmlj
ZSB3aGVuDQo+PiBpdCBpcyBjYWxsZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHYyOg0KPj4gLSBkZWZpbmUgQ09ORklHX0hBU19W
UENJX0dVRVNUX1NVUFBPUlQgc28gZGVhZCBjb2RlIGlzIG5vdCBjb21waWxlZA0KPj4gICAgZm9y
IHg4Ng0KPj4gU2luY2UgdjE6DQo+PiAgIC0gY29uc3RpZnkgc3RydWN0IHBjaV9kZXYgd2hlcmUg
cG9zc2libGUNCj4+ICAgLSBkbyBub3Qgb3BlbiBjb2RlIGlzX3N5c3RlbV9kb21haW4oKQ0KPj4g
ICAtIGV4dGVuZGVkIHRoZSBjb21taXQgbWVzc2FnZQ0KPj4gLS0tDQo+PiAgIHhlbi9kcml2ZXJz
L0tjb25maWcgICAgICAgICAgIHwgIDQgKysrKw0KPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyB8ICA5ICsrKysrKysrKw0KPiBUaGUgQ2MgbGlzdCBkb2VzIG5vdCBtYXRjaCB0aGVz
ZSBmaWxlcyBnZXR0aW5nIG1vZGlmaWVkLiBQbGVhc2UgbWFrZQ0KPiBzdXJlIHlvdSBDYyBtYWlu
dGFpbmVycywgc28gdGhleSBoYXZlIGEgY2hhbmNlIG9mIG5vdGljaW5nIHRoYXQNCj4gY2hhbmdl
cyBhcmUgYmVpbmcgbWFkZSB3aGljaCB0aGV5IG1heSBoYXZlIGFuIG9waW5pb24gb24uDQpTdXJl
LCBJIHdpbGwgZ28gb3ZlciB0aGUgcGF0Y2hlcyBhbmQgcHV0IHJlcXVpcmVkIENjOiBuZXh0IHRp
bWUNCj4NCj4+IEBAIC0xNDI5LDYgKzE0MzMsMTEgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNl
KHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0K
Pj4gICAgICAgICAgIHJjID0gaGQtPnBsYXRmb3JtX29wcy0+YXNzaWduX2RldmljZShkLCBkZXZm
biwgcGNpX3RvX2RldihwZGV2KSwgZmxhZyk7DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICBp
ZiAoIHJjICkNCj4+ICsgICAgICAgIGdvdG8gZG9uZTsNCj4gIEZyb20gYWxsIEkgY2FuIHRlbGwg
dGhpcyBpcyBkZWFkIGNvZGUuDQpCZWZvcmUgdGhlIGNoYW5nZSByYyB3YXMgc2V0IGluIHRoZSBs
b29wLiBBbmQgdGhlbiB3ZSBmYWxsIHRocm91Z2gNCnRvIHRoZSAiZG9uZSIgbGFiZWwuIEkgZG8g
YWdyZWUgdGhhdCB0aGUgd2F5IHRoaXMgY29kZSBpcyBkb25lIHRoZQ0KdmFsdWUgb2YgdGhhdCBy
YyB3aWxsIG9ubHkgcmVmbGVjdCB0aGUgbGFzdCBhc3NpZ25tZW50IGRvbmUgaW4gdGhlIGxvb3As
DQpidXQgd2l0aCBteSBjaGFuZ2UgSSBkaWRuJ3Qgd2FudCB0byBjaGFuZ2UgdGhlIGV4aXN0aW5n
IGJlaGF2aW9yLA0KdGh1cyAiaWYgKCByYyINCj4NCj4+ICsgICAgcmMgPSB2cGNpX2Fzc2lnbl9k
ZXZpY2UoZCwgcGRldik7DQo+PiArDQo+PiAgICBkb25lOg0KPj4gICAgICAgaWYgKCByYyApDQo+
PiAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIiVwZDogYXNzaWduICglcHApIGZh
aWxlZCAoJWQpXG4iLA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBAQCAtODYsNiArODYsMjkgQEAgaW50IF9faHdk
b21faW5pdCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgDQo+
PiAgICAgICByZXR1cm4gcmM7DQo+PiAgIH0NCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19W
UENJX0dVRVNUX1NVUFBPUlQNCj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBhc3Np
Z25lZCB0byBndWVzdC4gKi8NCj4+ICtpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21h
aW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+PiArew0KPj4gKyAgICAvKiBJdCBv
bmx5IG1ha2VzIHNlbnNlIHRvIGFzc2lnbiBmb3IgaHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0K
PiBDb3VsZCB5b3UgY2xhcmlmeSBmb3IgbWUgaW4gaG93IGZhciB0aGlzIGNvZGUgcGF0aCBpcyBp
bmRlZWQgaW50ZW5kZWQNCj4gdG8gYmUgdGFrZW4gYnkgaHdkb20/IEJlY2F1c2UgaWYgaXQgaXMs
IEknZCBsaWtlIHRvIGZ1cnRoZXIgdW5kZXJzdGFuZA0KPiB0aGUgaW50ZXJhY3Rpb24gd2l0aCBz
ZXR1cF9od2RvbV9wY2lfZGV2aWNlcygpLg0Kc2V0dXBfaHdkb21fcGNpX2RldmljZXMgaXMgbm90
IHVzZWQgb24gQXJtIGFzIHdlIGRvIHJlbHkgb24NCkRvbTAgdG8gcGVyZm9ybSBQQ0kgaG9zdCBp
bml0aWFsaXphdGlvbiBhbmQgUENJIGRldmljZSBlbnVtZXJhdGlvbi4NCg0KVGhpcyBpcyBiZWNh
dXNlIG9mIHRoZSBmYWN0IHRoYXQgb24gQXJtIGl0IGlzIG5vdCBhIHRyaXZpYWwgdGFzayB0bw0K
aW5pdGlhbGl6ZSBhIFBDSSBob3N0IGJyaWRnZSBpbiBYZW4sIGUuZy4geW91IG5lZWQgdG8gcHJv
cGVybHkgaW5pdGlhbGl6ZQ0KcG93ZXIgZG9tYWlucywgY2xvY2tzLCBxdWlya3MgZXRjLiBmb3Ig
ZGlmZmVyZW50IFNvQ3MuDQpBbGwgdGhlc2UgbWFrZSB0aGUgdGFzayB0b28gY29tcGxleCBhbmQg
aXQgd2FzIGRlY2lkZWQgdGhhdCBhdCB0aGUNCm1vbWVudCB3ZSBkbyBub3Qgd2FudCB0byBicmlu
ZyBQQ0kgZGV2aWNlIGRyaXZlcnMgaW4gWGVuIGZvciB0aGF0Lg0KSXQgd2FzIGFsc28gZGVjaWRl
ZCB0aGF0IHdlIGV4cGVjdCBEb20wIHRvIHRha2UgY2FyZSBvZiBpbml0aWFsaXphdGlvbg0KYW5k
IGVudW1lcmF0aW9uLg0KU29tZSBkYXksIHdoZW4gZmlybXdhcmUgY2FuIGRvIFBDSSBpbml0aWFs
aXphdGlvbiBmb3IgdXMgYW5kIHRoZW4gd2UNCmNhbiBlYXNpbHkgYWNjZXNzIEVDQU0sIHRoaXMg
d2lsbCBjaGFuZ2UuIFRoZW4gc2V0dXBfaHdkb21fcGNpX2RldmljZXMNCndpbGwgYmUgdXNlZCBv
biBBcm0gYXMgd2VsbC4NCg0KVGh1cywgd2UgbmVlZCB0byB0YWtlIGNhcmUgdGhhdCBYZW4ga25v
d3MgYWJvdXQgdGhlIGRpc2NvdmVyZWQNClBDSSBkZXZpY2VzIHZpYSBhc3NpZ25fZGV2aWNlIGV0
Yy4NCj4NCj4+ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSAp
DQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0K
Pj4gKw0KPj4gKy8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGRlLWFzc2lnbmVkIGZyb20g
Z3Vlc3QuICovDQo+PiAraW50IHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+PiArew0KPj4gKyAgICAvKiBJdCBvbmx5IG1h
a2VzIHNlbnNlIHRvIGRlLWFzc2lnbiBmcm9tIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+
ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiArICAg
ICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKyNlbmRp
ZiAvKiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCAqLw0KPiBBdCB0aGlzIHBvaW50IG9m
IHRoZSBzZXJpZXMgI2lmZGVmIGlzIHRoZSBsZXNzIHByZWZlcmFibGUgdmFyaWFudCBvZg0KPiBh
cnJhbmdpbmcgZm9yIGRlYWQgY29kZSB0byBnZXQgY29tcGlsZWQgb3V0Lg0KV2hhdCBpcyB0aGF0
IG90aGVyIHByZWZlcmFibGUgd2F5IHRoZW4/DQo+ICAgSSBleHBlY3QgbGF0ZXIgcGF0Y2hlcw0K
PiB3aWxsIGNoYW5nZSB0aGF0Pw0KTm8sIGl0IGlzIGdvaW5nIHRvIGJlIHRoaXMgd2F5IGFsbCB0
aGUgdGltZQ0KPg0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gQEAgLTI0Miw2ICsyNDIsMjYgQEAgc3RhdGljIGlubGlu
ZSBib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICB9DQo+PiAg
ICNlbmRpZg0KPj4gICANCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kpICYmIGRlZmlu
ZWQoQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQpDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhh
dCBkZXZpY2UgaXMgYXNzaWduZWQvZGUtYXNzaWduZWQgdG8vZnJvbSBndWVzdC4gKi8NCj4+ICtp
bnQgX19tdXN0X2NoZWNrIHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2
ICpkZXYpOw0KPj4gK2ludCBfX211c3RfY2hlY2sgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4gKyNlbHNlDQo+PiArc3RhdGljIGlubGluZSBp
bnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50
IHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+
ICt7DQo+PiArICAgIHJldHVybiAwOw0KPj4gK307DQo+PiArI2VuZGlmDQo+IFBsZWFzZSBwdXQg
dGhlIF9fbXVzdF9jaGVjayBhbHNvIG9uIHRoZSBzdHVicywgb3IgZWxzZSBwZW9wbGUgb25seQ0K
PiBidWlsZC10ZXN0aW5nIHg4NiBtYXkgbm90IG5vdGljZSB0aGF0IHRoZXkgbWlnaHQgYmUgaW50
cm9kdWNpbmcNCj4gYnVpbGQgZmFpbHVyZXMgb24gQXJtLiBUaGVuIGFnYWluIEknbSBub3Qgc3Vy
ZSB3aGV0aGVyIGluIHRoaXMgY2FzZQ0KPiB0aGUgYXR0cmlidXRlcyBhcmUgbmVjZXNzYXJ5IGlu
IHRoZSBmaXJzdCBwbGFjZS4NCkkgd2lsbCByZW1vdmUgX19tdXN0X2NoZWNrDQo+DQo+IEphbg0K
Pg0K

