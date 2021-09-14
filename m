Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AB40A8AE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 09:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186200.334923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3G9-0001MK-G0; Tue, 14 Sep 2021 07:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186200.334923; Tue, 14 Sep 2021 07:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3G9-0001KJ-Ct; Tue, 14 Sep 2021 07:53:41 +0000
Received: by outflank-mailman (input) for mailman id 186200;
 Tue, 14 Sep 2021 07:53:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQww=OE=epam.com=prvs=98919bdb76=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQ3G7-0001KB-Bm
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 07:53:39 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de58f810-1530-11ec-b402-12813bfff9fa;
 Tue, 14 Sep 2021 07:53:37 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E7e5jJ015214; 
 Tue, 14 Sep 2021 07:53:36 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b2m9x0jjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 07:53:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 07:53:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 07:53:32 +0000
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
X-Inumbo-ID: de58f810-1530-11ec-b402-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpdJe9EgWa7qxdPijNACSixn5e2pNqf2OisONkqSzs7Cje7S0Z+CLbh6+1NRqXbv6VIwbbqDExKaDHgDOhDSkPqtUHlGJXpps0qpmveOiQvscCtULgaAsjVqKR1N/GAe8tDwabFFyWOqvA8ja1K485wJkcmK99GYZo9ZvLxPdnEBbRGuXTgr5euCwJkDwBulS4Z3IWcG0n7hZe/DL5ku1E6bSUt9fCVx5quuKbtB40yHkOeTvH3Pih8Sgrw0ILuctp8RnDO46pmH3VHbUzEiYAGzyIrYsZKTIVWDh0cgtuFlrtKMiHyQ6Ra8J/ou0ztVzF19WSzMGX+z8x7TJLRPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wlmZPGeXN4ZuQgFXCANZ+TPGqQoW8sCwPr77bYDd17I=;
 b=ZkMMu8H04bEYBmQB6arFwwgDfQBaX0aKfZYkkLUaiS7LwvM+/WW1ZiIqiei1BXcjVTN47VY/iWO1JeIRNQCSRLs+kLq2bqhgCK+3OzJcin5I6Z2dztQEAUGzg1wN3VKSkXamzgvq3whjyaUN+DaiOz+N9YzMFWd6BF86l7Io3cK9pfmBP8gHk13x8LYInTVMsDWE4CB2+bAYJxBexMathyU7lN/QWYsERIiRTRPqXdXNeY6mceQm0XNxFddvTmPtO1s1Br74ehrzpmBSDKOm0bWlEy7icqcKXgCO2JfvaY3nk3rY6mNIpPIqPxGFZUlXfe2oMNlnEMl2MoDJFYn7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlmZPGeXN4ZuQgFXCANZ+TPGqQoW8sCwPr77bYDd17I=;
 b=4wzQc7xUM9mCt8a4YEpgaPr5WuDX4BoApRdUi0sZ9y4UUVvyYCzeZ7mWhJl2SkVln1aOPMHHaCm0slWesUaI+9J1L1RdozR89fiQVoyM1g+11J1ju2pEgRSRJsXI2W3+tFFFcN6FBkDKlhL+wSQJEPmH91ig+RVIewdjrvoVl+QXb6kJ14sEE8FWnxxPal5x4EecikvjN6atlpwhoH2Zdx380IKRryCIX5HD+W2P7DN/OfVkhsbXCRVTBeXUyoDDqgXnV6tz0uDGeRfhUlyS585sii53xL3TsulEpHxRcsUcg0AoEsOjN0qINJZOdyCgEwPZ5DEoxuituHkohpkfEQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXqT2cTKPAnBLuBkixTqpTrxO8Dg==
Date: Tue, 14 Sep 2021 07:53:32 +0000
Message-ID: <0053165a-7adc-5f93-4715-1ff888a533cc@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
In-Reply-To: 
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48a73d50-1f5e-4d00-cb9e-08d97754bfac
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33743EDDCEE7635D3FA68C8EE7DA9@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yd9U1XD/Pi2zRXhGFwFsCoRLOjTFTjuFyekBpiaTUwzGyN8YbEUAWqWNtIsonVK5FwsQ60DmJT7vOfqwcfvhqSdeSk1BXK/1b/m1QzWojhDaNKA0Xu3sE39ss9qruefYOnnuNSbFWFdCTaX+1QBqy0qgtSOYoiEyZ9M18AXK9NPFbKUHVWQW1DsJ5A4HvX9GonGTvfhtHu9evybZ7aXCmuKBrEU0HI2k4N3gtta1qg12YUlhzEA0D3rcrN49YNrSyRfMN7ngRi0bRiRKLcgR/iULed+fAbWgqzkTMetBNvZIlsIWeW855VLtBFpyhgG1QcTisBxFXCqETEEdLFIG2DcgSLEJbj5Hw/NQxkVh+6jqfEj83Fdfdf4iUAcMsHyOYRO5kZFEYui/8xsjZApvqH1f2y4Hqvnqwe4OkgS+sS4sVq7ZCBBgWU9suoZM1TTpyKT/4vFe5Czokn65Dr2tM8XogLjv3qWPJiD/PxRZKGXx4sb4+q3Mm6E3NFguUj/eAEUr37Tv7Dx3RtuxEnX+ybi/obSvwXGA9HYSqOPZTTOL3OAMxFjiJuxcUGGCG55t2dKvGfpAazFy/FDjz4N5JQhztLpUG7z5MgVFw7TTbVRQ+pgBRMhKeZzL8w58sfZk6ONmaNfu2568/Gr12IpFbfNhEIZRsSoaz+DaoC71lHHv/Y4nHM0jD0mrtURBUjVqgSZuXU6igcKm4MzyxNwowEMBRJeIO5L/64c2RfNwvleZvg/6w1R7/J15P8q6Iu+c
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(8936002)(31686004)(5660300002)(55236004)(186003)(2906002)(66446008)(4744005)(6512007)(91956017)(66476007)(6486002)(38070700005)(36756003)(66946007)(122000001)(86362001)(71200400001)(54906003)(38100700002)(316002)(110136005)(6506007)(64756008)(508600001)(8676002)(53546011)(26005)(76116006)(107886003)(66556008)(2616005)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWlrTG00eXMxVWFob2hIbzd6WGJWQzhBc2wxdzZJZ29nanptMnpjTmdiL1ZI?=
 =?utf-8?B?K2lJMjZWUEFvZENQQ3NQaTlHdnN0QU8rMTNrMU83WlNIbXh1ZmxxY1p1WGtE?=
 =?utf-8?B?dm4rTGNxOWNNZHlLQnpmU08rVzgzVkMvRmxtWmVtOGpzeVF5K3dvbUUrSzd0?=
 =?utf-8?B?ZVdLM05CTm01SGJuMnJQbGo1aEhBTVpBWkczYXZCQnZsazBNaTFZWEx4NjA5?=
 =?utf-8?B?dE5XZkd0d3QyUFpUMEx5RDVlU0w5aVVhKzhOZHBMSTJTSnVaemw0UU1OY1cy?=
 =?utf-8?B?NXduZ09BM1o3bmsxb2tBUVViTG9PVGh1b2o2Y2NIWEdZWms0WXVSQXN3cU9M?=
 =?utf-8?B?UWc5R2N3aVBDdGt4RFdtTW5NQmg2YlJnOWxvS1hVN3ZubkNuOEJqWnlqT2U5?=
 =?utf-8?B?a0tIay9MV21kV1htVW9IcmpQUy9sNytKTXc2NkZka3BwVW40UGJ0WmtpMk4r?=
 =?utf-8?B?aE9kZ211OG5KSEdWd3pleW1NS2U2S2JvK2dJNFdKLzRYZ2RjVUxZWGt3aWd6?=
 =?utf-8?B?QkFhd05DaUJmczNKU1FyWEVaLy80NFhSbW5leHVWeHpIbXNWYkw4aEhQazJs?=
 =?utf-8?B?S083aVFZYlJNR1JzcWJYRkljNWczMXMzRXJRQzFGd2V6WmNROTZiSFpEQ2l5?=
 =?utf-8?B?d2ZhdW5NNFpFeW8xd1EvL1dZTmU0cFZPRndXaHJLR21vSjVLMEc2eGJQOVJ2?=
 =?utf-8?B?SUZkaWozYnV4WGZqQ2xLcFIydlkzQm44Q3pWeXhCZEgrVkE3YkpNOGdXTjdD?=
 =?utf-8?B?a0lhT3RYM1lwMzZzWXQzZmZPZkc2UlE1YmxacFR6VEozQ0V6WTFzWFVUTlpS?=
 =?utf-8?B?dWJmdUNZUThrQlE3NHhSelZ1d1pKQTNBS2JpWmhJTDcrQUZoa1lzMUJnWE5X?=
 =?utf-8?B?S3doYVRCRi94MlltZWJTOHVWM29aUVdLRC8rZW4xR0lKbytGVVJ3ZDRJK2hK?=
 =?utf-8?B?MGtOelNjVU95clNHTDZoL2lxU1hiOFpwSXdXZU4vdGd0T1d5eCtDVG4vbDJu?=
 =?utf-8?B?NGVncncxWGZ1REJRRXpqQ3RuZHo0MXd0R0VGRG1kTnA5MzU1ak9YejljaGta?=
 =?utf-8?B?UUp6MGdjUjN4OWNaMUlpbWl6YVA0cXp1bWpPMmZxSFlVWHpvbTBPdE1hcEtF?=
 =?utf-8?B?OWcxUEJrSWZwdlRrb0dZaXl2YU9tS1AyYml1amlzMFBuaDljcW9ZcGQ1ejBw?=
 =?utf-8?B?M0szZDM0N2NJTDBrRXNGRVdkU1RSaDhtcFN6b0h5aTNkcWtocFY1cksvWTVr?=
 =?utf-8?B?SkYzdmpMbGVSbkpyeFVXS2pYUjd1Nm9jMnNna0pPMnB4Y3RINDk0MThZaHVM?=
 =?utf-8?B?VmtyVDJFWUNrakNISk1ITko3b1NLUFN2KzVWa0FNclE2Mlozb1Y4UUVVUi9F?=
 =?utf-8?B?S0pKK215TG5RMTNiNElZM2E4c0ZQRnpmZmMwVlJWRW50cmVtOU0yc0phZFRt?=
 =?utf-8?B?U0VFYno0Y1VEbzdMZ2RiL3J3U2wzYkx5cmcrditJVTVkTGg5dFdHQjYxMGJF?=
 =?utf-8?B?MTJKV0Z3SEZUczhaOHF3WVFzajlVVkFOV1ZnOGN4bStCalQ3Q1I2OFZiTHdN?=
 =?utf-8?B?cnNQT0haWmZib2lQMStXck1SKzBPZ3JDRURLR2J3UlBCWWRIeGlsWnZaY0E0?=
 =?utf-8?B?OGgvUjFSRHg4bkZmRHFiSEhQZTE2Ky9tS2tiMmxWYld1UVEzeFdnakZLaEtE?=
 =?utf-8?B?S3F5cit2cmVKa1FyT1g2dzBTV3BLOHoxck4zdmRDbTNUVkZXOGJ3a25memx1?=
 =?utf-8?B?amtwK2pwenZjNEJ3NHJZWTU2d1pQVTdYZkJuRFNDVFAwRUNnNHY3OXRJWWU2?=
 =?utf-8?B?cGEwa0sxdGIvaHlqbStNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <016E1436C005B34EA075979FBE1F3B50@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a73d50-1f5e-4d00-cb9e-08d97754bfac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 07:53:32.5400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZcTP7lFl6lGJb8bKhYdXCp5fBjtiqpMPmaKniSI6F+jOHu15hyQFdgt1zDB4RhfeG9/bq/fRq9iNrOmMiyxgq7N5DYweiIBFCa7ZK0YdjDTFY0O9XZzsbYBUH5d6stX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-ORIG-GUID: n2sYSzv3i6TQ5i3KW59qKzxQsDKT9o2S
X-Proofpoint-GUID: n2sYSzv3i6TQ5i3KW59qKzxQsDKT9o2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140046

SGksIFJhaHVsIQ0KDQpPbiAxOS4wOC4yMSAxNTowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+IFhF
TiBkdXJpbmcgYm9vdCB3aWxsIHJlYWQgdGhlIFBDSSBkZXZpY2UgdHJlZSBub2RlIOKAnHJlZ+KA
nSBwcm9wZXJ0eQ0KPiBhbmQgd2lsbCBtYXAgdGhlIFBDSSBjb25maWcgc3BhY2UgdG8gdGhlIFhF
TiBtZW1vcnkuDQpbc25pcF0NCj4gK2ludCBwY2lfaG9zdF9jb21tb25fcHJvYmUoc3RydWN0IGR0
X2RldmljZV9ub2RlICpkZXYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBlY2Ft
X3JlZ19pZHgpDQo+ICt7DQo+ICsgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlOw0K
PiArICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqY2ZnOw0KPiArICAgIGludCBlcnI7DQo+
ICsNCg0KU2hvdWxkIHdlIGNoZWNrIGlmIHRoZSBicmlkZ2UgaXMgdG8gYmUgcGFzc2VkIHRocm91
Z2g/IEUuZy4NCg0KIMKgwqDCoCBpZiAoIGR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KSAp
DQoNCiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCg0KVGhhbmtzLA0KDQpPbGVrc2FuZHINCg==

