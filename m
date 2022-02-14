Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DE4B4CAC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271408.465831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYzT-0003Ij-Go; Mon, 14 Feb 2022 10:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271408.465831; Mon, 14 Feb 2022 10:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYzT-0003Fk-De; Mon, 14 Feb 2022 10:53:55 +0000
Received: by outflank-mailman (input) for mailman id 271408;
 Mon, 14 Feb 2022 10:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJYzR-0003Fe-Tc
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:53:54 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64e27ca2-8d84-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 11:53:52 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EAmMg4016074;
 Mon, 14 Feb 2022 10:53:47 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7mwur7ka-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:53:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3860.eurprd03.prod.outlook.com (2603:10a6:208:79::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 10:53:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 10:53:43 +0000
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
X-Inumbo-ID: 64e27ca2-8d84-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbKXZKdCEpO0QFYxE3WdyTm72oEWknf95vUrWMy+PUiPHQnChIFBqCapbLOeV+Oo+oASzhueJ3Z1IynqqOg61+bC/M6RtY7GOIygcyhbSRFQYmvqiCMx6JtNBm5NKdrLDvdNSVzz7/0yZJ0cKQ9hmmOxhdkI/GLOGMYPqHhY8ac4XZE3pZ2cFbaCs/70y0eM+Jo1mrkyKYASGuBbpvGqkSjxbqkQ9VlOnivFOXCBmvcShHvxTjxe4b+eQhAvGHwwFcYQ03X82t1Km5N1gb1aVS8Xizb/3wTlmpWtHA2iER+9p9k1/cp86Lwzdzxsplm1nEOKGgfoLarT1OPkjgd4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e0SPBZ/4O04i3G7vZZBM9Qi708rujy5qWRFWriiu/0=;
 b=UC3PvHeOMRUJSfGZV9LJyPcX9gV05pBw9QLrO66I7ohtSp67LZ4tQrow5ex/kV1FvUl3CZWFrCLwN9LNm/iF7nuEUP6bj77blRXpBdyLymOXeP36mk+pccJgfQMP0GW6VBMaKR/OeiAWA8aGIypOXBwZeiFgEspWukY0jrj7CYdJvsYk86KysXo43iX4jUnvIJaP9oXyuYf2pqYXxo7FcblxBS1xbmVmdqhHvkuXB6kI2il3sRCfDKquvCl92R/YnfV/qVXoJpxHYi7m5DD2QqLHQ6bPmw+4UpfjUW+wWXxWe1hmOwsAugYvPZqHunw5Ft5UE4Su51K3QKGlgqeDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e0SPBZ/4O04i3G7vZZBM9Qi708rujy5qWRFWriiu/0=;
 b=AUbpdbE/GXsjI+d6582NlgZ5yQAuUrXWw30LNm8tSLzBJVJ8wKvpRyi1wIR5+je9L1J87HFnU9CZlE4V8ZjmDjFwYexsoFBSxD1yHEkxQ2+DK8QBoHRsJEBfEGXPEcing7O5QJG3KmX/N5nq7ZO64tP9n+Xip3buCtIGpwCSK3LOi6sXZD1uL8I5sWjtP2hKLJPTIMBBYVumw5PClw/WIKkpzOyMZAZwU/dhQJH4beTYjzAQTTpaOeBZv1dB3nm1xUop+QHCkpDNyCEeQxoy4r95qpvWUv1ecq2AMn8SNjC/DjxP5F4JRDrvziLwt+TPSRyuT1X2XLni7kfJ+pAhWw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AA==
Date: Mon, 14 Feb 2022 10:53:43 +0000
Message-ID: <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
In-Reply-To: <YgowIg5MvTaf2zsR@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92e56870-3ede-48c8-b151-08d9efa8447e
x-ms-traffictypediagnostic: AM0PR03MB3860:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB38605CA4943FC88238A460DDE7339@AM0PR03MB3860.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PRP3/BAFchDuq3yL+W2lWrz5sSP8Hawt0oRlKjSNqrwNYvUzQeI1sH5kazN56yPpHRfGW5pW0tQX/p377FwEBiLmBW4GOOcnNs6tYDlls2vs3yzknR25M8cuWGdMuo/QcUVK+lgWDk9pdw9fU6wmPxfid6L3GDdjO4WHHtKDS/TWkFQTUCPYJK8K1ewkx2exRFdH2a9OiKmZWUzm4uI+uZcD5dc7qsajTj3SBSzV2IuoqYTpWAc2z5e8vTEr6LpwPAvt5u0Vx2LC2FlIVpz5WpNt75zQGe7xo400Lbi6348kPOmJM2PI4Jr2z6sc13bqy5vWqQrlr2lZMQHuzcrv2o6ugC9Ufxy9K71FyKcSX0txF+PvS2V8nyCahtoe/CCVziPZES3ilnJ7Yu3pPLsB3ZxIbDuJA0r9qlRK/GRlds9Umn+QCb+UoJGia+wvu8u0XLHy38eNoqQQZn4kSeVv4qMJvn17Fw1PzNqKTIJ86/KDb76gimhSKft+uipXpylLxKuE94pMIr7xpmL8IizXaH9g5VcueqMKB5s4kZm11ja2A+Q4OJAkH854DjnX5xNuaNcBBpnIjal3/t3kdy2EzfQEQqUQbHKA9YdeJQ6NqakAgsgqrKUB4cFB6XyvE8lSwgSHUZcgB3LPlya1QhroPLYRrTnegp52UolI4qB8bX86k0yzfHe7lluNu2yLrbi/i2qF0mHb5m2h0lqhzVBvk6U75d8JrYKpLub7BtACAVBdVltfhWhbIWYSbjHm4j0C
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(66946007)(66556008)(107886003)(76116006)(36756003)(6916009)(54906003)(91956017)(38070700005)(316002)(64756008)(4326008)(8676002)(31686004)(2906002)(66446008)(66476007)(83380400001)(31696002)(5660300002)(186003)(26005)(86362001)(8936002)(6506007)(71200400001)(53546011)(55236004)(38100700002)(122000001)(6512007)(508600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1U1NTdGNmVtdE0vOVcrYnkxNDZGRGgxQmw3TGZJQ3J4ekZia2VYRUxUREtY?=
 =?utf-8?B?NTdsUitMN3lvWnpKMmhGdVUvbXE2ZXRwV1NkWHpETW12YU45THFmclRmalZH?=
 =?utf-8?B?alVDM1Y5VVp2OWdaYklsMmd1RitnWVpVaXcvazF1YTVTeTNGUGVPaW5yQU8x?=
 =?utf-8?B?Q2pwSmR3ZnlKaUJQRG5VQjFoZTlwaDJzMjFCMG9YWGhDVHdBZDNyM3o4Zkph?=
 =?utf-8?B?aVNuR0EzUXordFVFeDhzLzFRNFJJbStSOU5tWGxCY2taWFE0LzFmMExlY0Rz?=
 =?utf-8?B?WnN6Q0lkNHEwZ3g3YzhxUEF2TVNsaW42dTFxS0FSLzI5OU8xejZmZXIwOTd4?=
 =?utf-8?B?MytmeWZVeWpFY3duTWpkaW81QlcvWjJ6U2pKWE5qYzhYT3ZscDE3WXRWZ2Vp?=
 =?utf-8?B?bUQ5RUUxN283SEtvb2R6WmpKcVozMEU4WDd3c09QU1cwNFN4RFIrbDRMbXda?=
 =?utf-8?B?RHVVOG10dno2UEl2bDZydDdjSDk3RTF2czZDN1pzS3d5UVNEUW8xMGt2TEhC?=
 =?utf-8?B?NzR6bExHU0VSbVprQm5XS004VXBuWWZoQStvQTk5Mi9kMDd1MGIyMHMxNnk0?=
 =?utf-8?B?K3FJL0k5aTZWWlRJd1RIaWdrcW8rQStpQXY1UGJrZ0p1R1VFUTBlNlVSYVIy?=
 =?utf-8?B?K2Zoc3VYT0s0M3JLZ3ZxRHJPOTNpcXY3MDUxOHg1R2RWcVA2MjhLQVZVd29v?=
 =?utf-8?B?cnJWYkZOd0w3RmxySXkwUkdPMzJZK0NaSk5xb3N3L2JjU2syVWVScjdlemhk?=
 =?utf-8?B?cE5yYnVHeUxqWkRFU0tUcTRKZkNxWHpSVjlaY2NUN1NBL1VYSGV1RE5XWnMw?=
 =?utf-8?B?ZEcyaXJtODNLcVRiUmgwNkdmeXo0ZTZSWm5yeUd6bURjdVVSMlZpRmJoTERs?=
 =?utf-8?B?REFGWW4rQ20rK3VkbytxL0FpbVNzMEl3VWt0dmZaNnhDcUR2UGpVMnJJSFhs?=
 =?utf-8?B?VWUzWnFJYWhRQ2Fud2JmaVNuQnNVQmxVcDJkb0l1WlQ3OHFuRVVpdkMrWllW?=
 =?utf-8?B?V0lEa0hON0NWWkgzNW1OVTRaaHBia3hJSEU4RUY3UUlGYkJUWGVvd2J3dEk3?=
 =?utf-8?B?eE56RnpoelYyaENsKzU4YUJKUjZkOEFieXZKb0REQzMvSlZsUU9kNmlUVHBi?=
 =?utf-8?B?Tk5ZMnpKVkNRWGprWENydHcxNW40akVwTjlOOHBqZzcxOCtld2JGZE5qV1lD?=
 =?utf-8?B?R2NOTFRRYUdQbjR0SUNUUVI1TVQyZUFVaEYvOHZKcThyODhidFJwbG5uWHhV?=
 =?utf-8?B?VHlmbjlOeXBMTFIrWTJyVWU1N2JrMmxVZ2FDTU13cEVzeEp6S2FLRndHRE9j?=
 =?utf-8?B?T0h5QktyMExZRjNGWXZuSHB0VTFPRDR4RHdnT09lK0FUbTlYRXZJUklvSFgr?=
 =?utf-8?B?WllWbVRSb0Y2R2pOT2RFSUpRdHk5eUtBVFhSMGxUQ1RzUmxENmJzWDgwWEF0?=
 =?utf-8?B?V25TTjRZOVVpRHdsRWk1b3FSQmZFeWJFUS8zclNwKzRpZTNaZVZnWk9mRnVv?=
 =?utf-8?B?THphRC9YZjdsYWVQWEtLSnN2clI4UE9WWFBwVWI1UkJFMUhrR056MjROZU04?=
 =?utf-8?B?MVdQVGFaQUZBQlZ5R29NSzMyVVBtL0Zvd2phb25NMXZsTmJCQkpJRit2Wit3?=
 =?utf-8?B?aDc1R2phaFBqNWpmckF5bG93VkFuQmRHdDRFenNNSUVkRXZ1aVlLS1ZXa1I2?=
 =?utf-8?B?b0pkYUNZUkltMG43WXlYcG40eTlDclp1STBsd3pJcStVVjlpNnljSUdUZjVD?=
 =?utf-8?B?dk1LN1JWYlZQcm5JL2xrN3FDbTF2SGNNSjY4ZXk5ejRYRXFWZ2JzY0cxVVVy?=
 =?utf-8?B?RlhxQzRRalc4aTBMNU1ZcVJ2T1FMMFNxUS9LOFJKRHVNUmIwWDUrV0MrYXd4?=
 =?utf-8?B?REg3U25UdWlOUThhV1RjS1V2ejU0Y1hZVjgvbittakxLcjFISy9TMjRoZ0ht?=
 =?utf-8?B?NWM5S2VWa3JQWEVjV0ZSeU0zcWdmcE5PRU5ZZ1pMaGYxYzM0T1dCTjcydTIz?=
 =?utf-8?B?Z2YwdHlYbVJ3K2xkYm1NMEp1SWM0VzZ1c21ZRmRtWTZqUjYycS83MXdHLzJX?=
 =?utf-8?B?M01jejRvTlgvQTR6eXpFSkJZSUVPVnlMZHQ1TkhJTkIzbklKRHRWMWRDSitr?=
 =?utf-8?B?dWxQaXd4Wi9XbFBVbDlKR3AwMHFTa3E4RTMzRjdqcWFnU29IZzI4bjBiWnF1?=
 =?utf-8?B?N3MyaHpNZy9kU2hoQ05QMHdrMXVYT0doU1dlMWdJVTVGZ0U2aFUvT21TbkRL?=
 =?utf-8?B?dW1Xbm54OVNtaXIwYnVhQWdmVzExZDZVVXM1bFloeXFsVG9XYXJWVjl5ZmZV?=
 =?utf-8?B?eURjOFhoQnVEUHByMzE0TElaT3U3NVh1Q1QwOHVsYXNYNjJzVTlnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94F3639C60DCCA45B538EE0628EDA5DA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e56870-3ede-48c8-b151-08d9efa8447e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 10:53:43.0927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrpP6txCwt+LDQQTNUhCVUbvaAjZ+8GCbQNgj7hy9F94z8kXc297IXbxslRbs39KycrvGPSbnHI18vjWhOHv7WPIC7UuXeR/VOd88/Na0cNsZySawN28TGL9IrHY0WML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3860
X-Proofpoint-GUID: CRa2E2hxtvhmDkdP038gemlglDfiZUZN
X-Proofpoint-ORIG-GUID: CRa2E2hxtvhmDkdP038gemlglDfiZUZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140067

DQoNCk9uIDE0LjAyLjIyIDEyOjM0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAxNCwgMjAyMiBhdCAwOTozNjozOUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxMS4wMi4yMiAxMzo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiArDQo+Pj4+Pj4gICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG1zaXgtPm1heF9lbnRy
aWVzOyBpKysgKQ0KPj4+Pj4+ICAgICAgICAgew0KPj4+Pj4+ICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB2cGNpX21zaXhfZW50cnkgKmVudHJ5ID0gJm1zaXgtPmVudHJpZXNbaV07DQo+Pj4+PiBT
aW5jZSB0aGlzIGZ1bmN0aW9uIGlzIG5vdyBjYWxsZWQgd2l0aCB0aGUgcGVyLWRvbWFpbiByd2xv
Y2sgcmVhZA0KPj4+Pj4gbG9ja2VkIGl0J3MgbGlrZWx5IG5vdCBhcHByb3ByaWF0ZSB0byBjYWxs
IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0KPj4+Pj4gd2hpbGUgaG9sZGluZyBzdWNoIGxvY2sg
KGNoZWNrIGJlbG93KS4NCj4+Pj4gWW91IGFyZSByaWdodCwgYXMgaXQgaXMgcG9zc2libGUgdGhh
dDoNCj4+Pj4NCj4+Pj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIC0+IHZwY2lfcHJvY2Vzc19w
ZW5kaW5nIC0+IHJlYWRfbG9jaw0KPj4+Pg0KPj4+PiBFdmVuIG1vcmUsIHZwY2lfcHJvY2Vzc19w
ZW5kaW5nIG1heSBhbHNvDQo+Pj4+DQo+Pj4+IHJlYWRfdW5sb2NrIC0+IHZwY2lfcmVtb3ZlX2Rl
dmljZSAtPiB3cml0ZV9sb2NrDQo+Pj4+DQo+Pj4+IGluIGl0cyBlcnJvciBwYXRoLiBTbywgYW55
IGludm9jYXRpb24gb2YgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+Pj4+IG11c3Qgbm90IGhv
bGQgZC0+dnBjaV9yd2xvY2sgYXQgbGVhc3QuDQo+Pj4+DQo+Pj4+IEFuZCBhbHNvIHdlIG5lZWQg
dG8gY2hlY2sgdGhhdCBwZGV2LT52cGNpIHdhcyBub3QgcmVtb3ZlZA0KPj4+PiBpbiBiZXR3ZWVu
IG9yICpyZS1jcmVhdGVkKg0KPj4+Pj4gV2Ugd2lsbCBsaWtlbHkgbmVlZCB0byByZS1pdGVyYXRl
IG92ZXIgdGhlIGxpc3Qgb2YgcGRldnMgYXNzaWduZWQgdG8NCj4+Pj4+IHRoZSBkb21haW4gYW5k
IGFzc2VydCB0aGF0IHRoZSBwZGV2IGlzIHN0aWxsIGFzc2lnbmVkIHRvIHRoZSBzYW1lDQo+Pj4+
PiBkb21haW4uDQo+Pj4+IFNvLCBkbyB5b3UgbWVhbiBhIHBhdHRlcm4gbGlrZSB0aGUgYmVsb3cg
c2hvdWxkIGJlIHVzZWQgYXQgYWxsDQo+Pj4+IHBsYWNlcyB3aGVyZSB3ZSBuZWVkIHRvIGNhbGwg
cHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzPw0KPj4+Pg0KPj4+PiByZWFkX3VubG9jaw0KPj4+PiBw
cm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4+Pj4gcmVhZF9sb2NrDQo+Pj4+IHBkZXYgPSBwY2lf
Z2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+
Pj4+IGlmICggcGRldiAmJiBwZGV2LT52cGNpICYmIGlzX3RoZV9zYW1lX3ZwY2kocGRldi0+dnBj
aSkgKQ0KPj4+PiA8Y29udGludWUgcHJvY2Vzc2luZz4NCj4+PiBTb21ldGhpbmcgYWxvbmcgdGhv
c2UgbGluZXMuIFlvdSBsaWtlbHkgbmVlZCB0byBjb250aW51ZSBpdGVyYXRlIHVzaW5nDQo+Pj4g
Zm9yX2VhY2hfcGRldi4NCj4+IEhvdyBkbyB3ZSB0ZWxsIGlmIHBkZXYtPnZwY2kgaXMgdGhlIHNh
bWU/IEphbiBoYXMgYWxyZWFkeSBicm91Z2h0DQo+PiB0aGlzIHF1ZXN0aW9uIGJlZm9yZSBbMV0g
YW5kIEkgd2FzIGFib3V0IHRvIHVzZSBzb21lIElEIGZvciB0aGF0IHB1cnBvc2U6DQo+PiBwZGV2
LT52cGNpLT5pZCA9IGQtPnZwY2lfaWQrKyBhbmQgdGhlbiB3ZSB1c2UgcGRldi0+dnBjaS0+aWTC
oCBmb3IgY2hlY2tzDQo+IEdpdmVuIHRoaXMgaXMgYSBkZWJ1ZyBtZXNzYWdlIEkgd291bGQgYmUg
T0sgd2l0aCBqdXN0IGRvaW5nIHRoZQ0KPiBtaW5pbWFsIGNoZWNrcyB0byBwcmV2ZW50IFhlbiBm
cm9tIGNyYXNoaW5nIChpZTogcGRldi0+dnBjaSBleGlzdHMpDQo+IGFuZCB0aGF0IHRoZSByZXN1
bWUgTVNJIGVudHJ5IGlzIG5vdCBwYXN0IHRoZSBjdXJyZW50IGxpbWl0LiBPdGhlcndpc2UNCj4g
anVzdCBwcmludCBhIG1lc3NhZ2UgYW5kIG1vdmUgb24gdG8gdGhlIG5leHQgZGV2aWNlLg0KQWdy
ZWUsIEkgc2VlIG5vIGJpZyBpc3N1ZSAocHJvYmFibHkpIGlmIHdlIGFyZSBub3QgYWJsZSB0byBw
cmludA0KDQpIb3cgYWJvdXQgdGhpcyBvbmU6DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KaW5kZXggODA5YTZiNDc3
M2UxLi41MDM3M2YwNGRhODIgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQorKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQpAQCAtMTcxLDEwICsxNzEsMzEgQEAg
c3RhdGljIGludCBfX2luaXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByYW5nZXNldCAqbWVtLCB1aW50MTZfdCBjbWQpDQog
wqB7DQogwqDCoMKgwqAgc3RydWN0IG1hcF9kYXRhIGRhdGEgPSB7IC5kID0gZCwgLm1hcCA9IHRy
dWUgfTsNCivCoMKgwqAgcGNpX3NiZGZfdCBzYmRmID0gcGRldi0+c2JkZjsNCiDCoMKgwqDCoCBp
bnQgcmM7DQoNCisgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmcGRldi0+ZG9tYWluLT52cGNp
X3J3bG9jaykpOw0KKw0KIMKgwqDCoMKgIHdoaWxlICggKHJjID0gcmFuZ2VzZXRfY29uc3VtZV9y
YW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkNCivCoMKgwqAgew0K
Kw0KK8KgwqDCoMKgwqDCoMKgIC8qDQorwqDCoMKgwqDCoMKgwqDCoCAqIHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcyBtYXkgdHJpZ2dlciB2cGNpX3Byb2Nlc3NfcGVuZGluZyB3aGljaA0KK8KgwqDC
oMKgwqDCoMKgwqAgKiBtYXkgbmVlZCB0byBhY3F1aXJlIHBkZXYtPmRvbWFpbi0+dnBjaV9yd2xv
Y2sgaW4gcmVhZCBtb2RlLg0KK8KgwqDCoMKgwqDCoMKgwqAgKi8NCivCoMKgwqDCoMKgwqDCoCB3
cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KIMKgwqDCoMKgwqDCoMKg
wqAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQorwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9j
aygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQorDQorwqDCoMKgwqDCoMKgwqAgLyogQ2hl
Y2sgaWYgcGRldiBzdGlsbCBleGlzdHMgYW5kIHZQQ0kgd2FzIG5vdCByZW1vdmVkIG9yIHJlLWNy
ZWF0ZWQuICovDQorwqDCoMKgwqDCoMKgwqAgaWYgKHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwg
c2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKSAhPSBwZGV2KQ0KK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCB2cGNpIGlzIE5PVCB0aGUgc2FtZSApDQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gMDsNCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
DQorwqDCoMKgIH0NCisNCiDCoMKgwqDCoCByYW5nZXNldF9kZXN0cm95KG1lbSk7DQogwqDCoMKg
wqAgaWYgKCAhcmMgKQ0KIMKgwqDCoMKgwqDCoMKgwqAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsIGNt
ZCwgZmFsc2UpOw0KDQpUaGlzIG9uZSBhbHNvIHdhbnRzIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJx
cyB0byBydW4gc28gaXQgKm1pZ2h0Kg0Kd2FudCBwZGV2IGFuZCB2cGNpIGNoZWNrcy4gQnV0IGF0
IHRoZSBzYW1lIHRpbWUgYXBwbHlfbWFwIHJ1bnMNCmF0ICggc3lzdGVtX3N0YXRlIDwgU1lTX1NU
QVRFX2FjdGl2ZSApLCBzbyBkZWZlcl9tYXAgd29uJ3QgYmUNCnJ1bm5pbmcgeWV0LCB0aHVzIG5v
IHZwY2lfcHJvY2Vzc19wZW5kaW5nIGlzIHBvc3NpYmxlIHlldCAoaW4gdGVybXMNCml0IGhhcyBz
b21ldGhpbmcgdG8gZG8geWV0KS4gU28sIEkgdGhpbmsgd2UganVzdCBuZWVkOg0KDQogwqDCoMKg
wqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCiDCoMKg
wqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCiDCoMKgwqDCoMKgwqDCoCB3
cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCg0KYW5kIHRoaXMgc2hvdWxk
IGJlIGVub3VnaA0KPg0KPiBUaGUgcmVjcmVhdGluZyBvZiBwZGV2LT52cGNpIG9ubHkgb2NjdXJz
IGFzIGEgcmVzdWx0IG9mIHNvbWUgYWRtaW4NCj4gb3BlcmF0aW9ucywgYW5kIGRvaW5nIGl0IHdo
aWxlIGFsc28gdHJ5aW5nIHRvIHByaW50IHRoZSBjdXJyZW50IE1TSQ0KPiBzdGF0dXMgaXMgbm90
IGEgcmVsaWFibGUgYXBwcm9hY2guIFNvIGR1bXBpbmcgYW4gaW5jb21wbGV0ZSBvcg0KPiBpbmNv
aGVyZW50IHN0YXRlIGFzIGEgcmVzdWx0IG9mIG9uZ29pbmcgYWRtaW4gb3BlcmF0aW9ucyB3b3Vs
ZCBiZQ0KPiBmaW5lLg0KT2sNCj4NCj4gVGhhbmtzLCBSb2dlci4NCj4NClRoYW5rIHlvdSwNCk9s
ZWtzYW5kcg==

