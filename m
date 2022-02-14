Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33DA4B5367
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272370.467184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcQf-0005nr-VB; Mon, 14 Feb 2022 14:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272370.467184; Mon, 14 Feb 2022 14:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcQf-0005lY-Ro; Mon, 14 Feb 2022 14:34:13 +0000
Received: by outflank-mailman (input) for mailman id 272370;
 Mon, 14 Feb 2022 14:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJcQe-0005lQ-Q5
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:34:12 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5d91c4-8da3-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:34:11 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EENPcg000662;
 Mon, 14 Feb 2022 14:34:07 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7pbw0n4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:34:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4732.eurprd03.prod.outlook.com (2603:10a6:10:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:34:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 14:34:00 +0000
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
X-Inumbo-ID: 2c5d91c4-8da3-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOPGNlz6dSyam11sigDBRakRIVCkK7ICkRYPqpKHKhJS6p2Q7g+eBodtHdx3e6hjlWMhwsg/5whyln7Zp6PV1nOq8qz9Ubhm47EqqzWNdolFMIdjNZmsC/5ImHTTaQ+AgiJImpZL+taNDSAzRdz3pmniBPkE5QCT8CyLhyn1IsgBMIrTsTFBgWNBIpwtbIZJghM1Y8ddpKhUSLZBzVPA72vIWS0pRIfQhTLDYmM/toK0YOyTVJ6K/RuxvzBj7xsNMJB85QnB4hX88r/Mvop3xP02UyZvjYxLbDiYSNVltQOmvzPZy58395iQ/HvXQlVsQ0Zgmh0MJpPxlsmquUS9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTCJecP4i3IZaqOPE/2k9vTMhudYuakj3LcaND1YHb0=;
 b=hl9FY6ayft8ET6Q4BW2+OOmPdxrHwRm4sUpJEPC3lDf4EHHMOCnFYWRxgxL8LF6tKIGAQ5D22+sAwb3AX+S6jDNPekBwreJsXFvGF2Vf3ncWCJZORnPKAAJwkflI9z2VeXJ1J4c31ZFqYgJogV+Im++9OxCkdeWMdJfNA+qIJAD3W23n6hN5H/Zdh+feWxo9n9wXsuKeuZIcPOSEe9cMzCJKZFctOXlVQp6Hq6QaPhcmodxxB9ln7XruQW0B7j6LRGxR0GYYP7sfoyaqhtIScNRID/z2Azzot/ZGccvVy7nSwcldJhTHrCMylLqdAKB3MgyStgHcopLIDK7Nxl4kxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTCJecP4i3IZaqOPE/2k9vTMhudYuakj3LcaND1YHb0=;
 b=T17obt2jLfGFJZCdiabSExM0OJX6qlNIUOJO5/HubjxeVcI4iDFrYt0Owv/dgNBEItWE5CJR7zG+oICVibDXjImBMs3xWWgwU0aemU3NYKO1wCXnTzF5oNHll9ia1jEsYEys1zfIbMiOc6aFkYSc6Dp/Dixk6HRhEmRpZ9lXw7Elce7h2VsKtL/hL9oD09J4RunZuSoLFaGagctNhQOPg3UdQQs4AT4duR0nC3rLactxJEBlTWoU6ED2hU1pXqSdhq9qSkzuJ7KwSB8ndIwrkL3k8X8Ez45sR64xEg9rrwJUOfWpfqpjXnjevnhfAmPW7PXZo064WH7l8cFukGK1kA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYHboQT3cBWYI1/EGunE7hOwop6ayTIGYAgAABuQCAAAF7AIAAAMCA
Date: Mon, 14 Feb 2022 14:34:00 +0000
Message-ID: <3afcee6e-221b-e3b2-2f7e-c7e9566d5dd1@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <77f818a7-fe8a-20e5-3f1c-8fb7aef7984b@suse.com>
 <40feb747-c459-2a2d-6ca1-ac9f8fea47e3@epam.com>
 <7a9c9ed1-3c10-247d-ee7b-c2f47dee1f38@suse.com>
In-Reply-To: <7a9c9ed1-3c10-247d-ee7b-c2f47dee1f38@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e5915f8-3072-485c-5743-08d9efc70a76
x-ms-traffictypediagnostic: DB7PR03MB4732:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4732E7625BF5BABFEB1185E0E7339@DB7PR03MB4732.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 94ZsI4q7fOg8dLLfMBRRzR6iSIz813cEd38dO5tz+wS5XZ35+lTHLf03oYZ4aGwXFgOIHE+t08CkMYkApZhIbdUTS/22bMnKA6g8Qz16FyOgvJHN2llPZveUenyqC/URYYV9m/2Lvs8leGoEfLZxnlaLhP3oZHNlFTcBB4AREaE7Mb6dUi2b0sPrN7EHDmHX4mupaItCwnPlWNOBhx265ApKvq1WnQxZTAwIlOCv+Qp5nJ2JTLUwHkE2W6CcE/A8DkBbrdjByG7/8ToOCaho/KECBC2PweoXNes3DaROoPAg9fGid3BArNa/ZIGJpAObsWFnbwz2HrAGp9EfPppj2jIegxpVeoohO8iboyQJ7j/c8ngVQCUQ5ZKqF8E5fU4SX740BeMBTSkKuEgK0UZRzBvhUMm7YIYNsB0KSPR0MybJ5dwfVZfwQsD/dYDulw7NdBFizY/3comoSrM3EDhSETZSQOPMfZs3TQw3D7FEMarQ2kDYYn0zOwFCLcReo4X8JA21HzZPU8BN5LmsM5qGxFytNwZ/NEKsF0KaAWYd7Ls7EW/DUwMhV2BGiRRz5V9X973uVLLTkYGMumfN6d6jci/6LNvVuuSz6IBumyx1zK3aFsVw9JKRegpg9Z0Ch5zeh2wyUJZWWOWv0QMpEIbyUYafVtKqXwvl/R6LO7VzrHFWySMkATg+agqHOtCiB+ZO152rkoJymiVGrblBRsjidPvemkpYGz2wsJtMhR7BqewaPRBq/VwgvGtLnLmQ6E/h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(71200400001)(6506007)(36756003)(83380400001)(6486002)(6512007)(508600001)(316002)(55236004)(6916009)(91956017)(31686004)(54906003)(31696002)(2906002)(122000001)(8936002)(38100700002)(86362001)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(8676002)(26005)(186003)(2616005)(107886003)(38070700005)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NW1Uck9TeU5rQ0M4MWVpK0lLcWh6QWE1WnZ4MGtJRWxEKzJmc3QrSCswclAr?=
 =?utf-8?B?L051dkFHM3FWTVFIVklCTUJreHVCazE2QTlIOU5YSkhIbG1zVkY2Vjh5NXJX?=
 =?utf-8?B?dlhaUlhYb3FVWGdvM04zM1FoT2dJam04VW8zd3NUOFU3NHAzU1BLTk5xbVpi?=
 =?utf-8?B?Y3ZnYWx3Vkd1T2VhQm83RC80dURSeEdUMU1ZOTlobG9rM0xHWmJCdDIzRzIy?=
 =?utf-8?B?b0pMQWc4TEszZkdQM3RFSitwQTZVc2VFQVNHdU9YOHM3cEErVlZjL3BvOVhU?=
 =?utf-8?B?WTIyRWRJTzRGa2FZNXZqZlQvYWY1QkkrVWZlbjZoUjVhQWNaUzNyZkc5eUFy?=
 =?utf-8?B?NllnNDJSZ3R1YW1Ka2JjcEJMTWJCbzVleGJCVUdYV3B4a0x6eGtuQkR1Qi9l?=
 =?utf-8?B?L1pjMUtHNE1UcHNCZHBlWFp0enE0QUdTVC9xTW8wbCtwb3RrNjhVUTdQU3FL?=
 =?utf-8?B?ejVVY2pnRmdGNXo1VkZJb21NUWdwNUpFQkFxZno2YkVNbWFScjFEV0thanNM?=
 =?utf-8?B?a1grcERGVVN6TW9xTG1uZ3pQQzNoQ09rOFl0QW45bUJuMFdEakVodHpKcUtM?=
 =?utf-8?B?M0V4L2htOGdGVnlRQlgwVkFyelBZSG9lM290VTl2bXJtaldPQTlILzJKTTVD?=
 =?utf-8?B?WlpGL1hWRitvbUpuRTQ3QlZiQXQ4VktSQzdoMXZXdjBuTkZHNjg5Wjd4MzBi?=
 =?utf-8?B?dzFvNEpzRXJRTlcwMDJ6UUcrQW9raFU4Sjh4ZmtYWk1KUlg4eklSWFJRK0Fw?=
 =?utf-8?B?V0dodGkxTWZMdGY0N1ZYV0ZwOUlHZDIyd3RwaTFiR1J3eUNwNDMwUGVMMVlS?=
 =?utf-8?B?c0hvS2g4NWlmbVJaUkZWcEtrVGZQbW0vbVhPcXpWOFpZa2FtRTNGUmFySXEx?=
 =?utf-8?B?Tys2L2pRbmE2N1h4WTJBbnlzVGs1NHJhNi92R1NMSzYxdXRVdzdhQmZOaUxG?=
 =?utf-8?B?SWY5NnVQWU9GTnFXdFlyZUhkUkZ4UGVhSU02ZDEzcVJWNEU1M1ZmWkFPcFAr?=
 =?utf-8?B?aWhZMWN0VlphN2tzUlJhTnMyaWFqTnpWdkRaTXlqSFRTVFB5T1FVZDJ0Y0VK?=
 =?utf-8?B?RG9ST0xEVEx4ejZrYjd4aFZ5VGIzSlR1ajdFanhNcFY5bVdENGlCZytLTUZz?=
 =?utf-8?B?RUt5VWhaandSSTFBeEtpTW9LSUduckdzdDJJMVQrRFYraHpML2hTZmJSVXlQ?=
 =?utf-8?B?b1oydkU5NEE5VVFsdGZ1WTdzYU5wSy9iV0NDcy9URjBPdldrdEtIdEdBYzRh?=
 =?utf-8?B?MnphQnFzTjNLK3Bib3NtMmlzcVZaM2JyMHNTSm1qd1N5N1Y5aU05YlFjSEdm?=
 =?utf-8?B?OTVqTC91c0FRWUIyZ3BaSzc5RWhGNnlkcVBCbVA4L2RxWlFzNzdYejVuVVdX?=
 =?utf-8?B?RGVhMU9YamlWSmtjWW5QTWdwVHhHSHJ4ZEpGVnpWdWFyNnQvaHYzREJhSWZ5?=
 =?utf-8?B?bWFGcjluTGM3c0RpTnBmUW9mTHV4dVRybnJYaWp5bG1LUzZNYytHcVN3MTFU?=
 =?utf-8?B?VjkvSTFLWTVtNFpSR3ZFUjY5TmlOelAvYVNXNkwrSXp6RjQ0amNXYVVqVjIx?=
 =?utf-8?B?c1JkY3pwL1g5bUtJYjd0WFZxZHZIUjJlT2xtOXp3ZFB2V3BFUVJmcHJQUzNJ?=
 =?utf-8?B?VG96b0lzOEk4NTdZNzFoQktWWUQ4aEpkeW9UNXdPeWZBU2VhTHNBVDdROEVm?=
 =?utf-8?B?WkdOT3VTbGtUWjZmMWFhYVlLd0xXNHJJcko2SHhmdmpWV3FzMy9IM2VvKzI5?=
 =?utf-8?B?Q3lLTTRvZ2lKa1JBSG9wOFVzTFhxZFZ1WjNXMkpoUldWZDBRR0R2RVFlS2R4?=
 =?utf-8?B?NHVNMG5tZkxFRzZZTkFncUNVQWJ2blpKa2NDRlJPTExvMFUzVFJ2bWtRWCtm?=
 =?utf-8?B?WFVvQy9JY0ppeWt4em1yMXEvZUZzdmx1MDRMVVZpTGl0NUo3bUNQbnRyL21P?=
 =?utf-8?B?NUowbks2NEJ1azkzSExoNnRVZ2JTNUpmUTZCaTJSZi9xb0pEd0ozYW43MnU3?=
 =?utf-8?B?NGZOY1ZjMmhoMU9JN0lLeDZ3YnFCRVNiRFJlTnZpbXczcmg0WE1TSjB2VjVH?=
 =?utf-8?B?VEFKN3BQcXdhS293UjIwRVdZK1lTazlCMUh3d1F0d1Q3MVU3YnJyK05tSmlQ?=
 =?utf-8?B?RWd3dG1LTlAyVEZiQzFJQkV4VlcvUVhJcHA5ZjhtRWZoM3hwL1VrS05wWWs2?=
 =?utf-8?B?b29FZlRpT08wallxaVVkb09ZZk9Ddm53ZFUzR1ltZ2dCV0FaL2NtN0YvYWx3?=
 =?utf-8?B?SDc5ZTV0cUtUL0JnNmNtQnliTFBTM3BVVHFWc1lrSlVKUHplczZadndNZXhC?=
 =?utf-8?B?NUdZRXJGR0JYZ1hPVUVCS1NKd0lYdkVBWXNZQ1ZRbGpyUHQwaXZ6OXFyNUxp?=
 =?utf-8?Q?aSYVZ1mhflNL75+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE552D9021B8C40AD3A12031F5F945B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5915f8-3072-485c-5743-08d9efc70a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:34:00.1600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgaWNVFnG2h/ZzZutkXaX55Rg1ItcVcd0SgwJ69gwzSVSp139CXH0cvqko1piaA4EwOsugxJp8h+Pic54KcPBpy5XQppopkiHyqwtSHQWanCItuZfBvSxBODs3GWu2Sw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4732
X-Proofpoint-GUID: WE-Scj8UjJGvEIQO-GGcRoEJg_UAaiOn
X-Proofpoint-ORIG-GUID: WE-Scj8UjJGvEIQO-GGcRoEJg_UAaiOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202140089

DQoNCk9uIDE0LjAyLjIyIDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDIuMjAy
MiAxNToyNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTQuMDIu
MjIgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjAyLjIwMjIgMTQ6MzYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBAQCAtNDEwLDE0ICs0MjgsMzcgQEAg
c3RhdGljIHZvaWQgdnBjaV93cml0ZV9oZWxwZXIoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYs
DQo+Pj4+ICAgICAgICAgICAgICAgICByLT5wcml2YXRlKTsNCj4+Pj4gICAgfQ0KPj4+PiAgICAN
Cj4+Pj4gK3N0YXRpYyBib29sIHZwY2lfaGVhZGVyX3dyaXRlX2xvY2soY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBzdGFydCwgdW5zaWduZWQgaW50IHNpemUpDQo+Pj4+ICt7DQo+Pj4+ICsgICAg
LyoNCj4+Pj4gKyAgICAgKiBXcml0aW5nIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGFuZCBST00gQkFS
IHJlZ2lzdGVyIG1heSB0cmlnZ2VyDQo+Pj4+ICsgICAgICogbW9kaWZ5X2JhcnMgdG8gcnVuIHdo
aWNoIGluIHR1cm4gbWF5IGFjY2VzcyBtdWx0aXBsZSBwZGV2cyB3aGlsZQ0KPj4+PiArICAgICAq
IGNoZWNraW5nIGZvciB0aGUgZXhpc3RpbmcgQkFSJ3Mgb3ZlcmxhcC4gVGhlIG92ZXJsYXBwaW5n
IGNoZWNrLCBpZiBkb25lDQo+Pj4+ICsgICAgICogdW5kZXIgdGhlIHJlYWQgbG9jaywgcmVxdWly
ZXMgdnBjaS0+bG9jayB0byBiZSBhY3F1aXJlZCBvbiBib3RoIGRldmljZXMNCj4+Pj4gKyAgICAg
KiBiZWluZyBjb21wYXJlZCwgd2hpY2ggbWF5IHByb2R1Y2UgYSBkZWFkbG9jay4gSXQgaXMgbm90
IHBvc3NpYmxlIHRvDQo+Pj4+ICsgICAgICogdXBncmFkZSByZWFkIGxvY2sgdG8gd3JpdGUgbG9j
ayBpbiBzdWNoIGEgY2FzZS4gU28sIGluIG9yZGVyIHRvIHByZXZlbnQNCj4+Pj4gKyAgICAgKiB0
aGUgZGVhZGxvY2ssIGNoZWNrIHdoaWNoIHJlZ2lzdGVycyBhcmUgZ29pbmcgdG8gYmUgd3JpdHRl
biBhbmQgYWNxdWlyZQ0KPj4+PiArICAgICAqIHRoZSBsb2NrIGluIHRoZSBhcHByb3ByaWF0ZSBt
b2RlIGZyb20gdGhlIGJlZ2lubmluZy4NCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBpZiAoICF2
cGNpX29mZnNldF9jbXAoc3RhcnQsIHNpemUsIFBDSV9DT01NQU5ELCAyKSApDQo+Pj4+ICsgICAg
ICAgIHJldHVybiB0cnVlOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCAhdnBjaV9vZmZzZXRfY21w
KHN0YXJ0LCBzaXplLCBwZGV2LT52cGNpLT5oZWFkZXIucm9tX3JlZywgNCkgKQ0KPj4+PiArICAg
ICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiBmYWxzZTsNCj4+Pj4g
K30NCj4+PiBBIGZ1bmN0aW9uIG9mIHRoaXMgbmFtZSBnaXZlcyAoZXNwZWNpYWxseSBhdCB0aGUg
Y2FsbCBzaXRlKHMpKSB0aGUNCj4+PiBpbXByZXNzaW9uIG9mIGFjcXVpcmluZyBhIGxvY2suIENv
bnNpZGVyaW5nIHRoYXQgb2YgdGhlIHByZWZpeGVzDQo+Pj4gbmVpdGhlciAidnBjaSIgbm9yICJo
ZWFkZXIiIGFyZSByZWFsbHkgcmVsZXZhbnQgaGVyZSwgbWF5IEkgc3VnZ2VzdA0KPj4+IHRvIHVz
ZSBuZWVkX3dyaXRlX2xvY2soKT8NCj4+Pg0KPj4+IE1heSBJIGZ1cnRoZXIgc3VnZ2VzdCB0aGF0
IHlvdSBlaXRoZXIgc3BsaXQgdGhlIGNvbW1lbnQgb3IgY29tYmluZQ0KPj4+IHRoZSB0d28gaWYo
KS1zIChwZXJoYXBzIGV2ZW4gc3RyYWlnaHQgaW50byBzaW5nbGUgcmV0dXJuIHN0YXRlbWVudCk/
DQo+Pj4gUGVyc29uYWxseSBJJ2QgcHJlZmVyIHRoZSBzaW5nbGUgcmV0dXJuIHN0YXRlbWVudCBh
cHByb2FjaCBoZXJlIC4uLg0KPj4gVGhhdCB3YXMgYWxyZWFkeSBxdWVzdGlvbmVkIGJ5IFJvZ2Vy
IGFuZCBub3cgaXQgbG9va3MgbGlrZToNCj4+DQo+PiBzdGF0aWMgYm9vbCBvdmVybGFwKHVuc2ln
bmVkIGludCByMV9vZmZzZXQsIHVuc2lnbmVkIGludCByMV9zaXplLA0KPj4gICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcjJfb2Zmc2V0LCB1bnNp
Z25lZCBpbnQgcjJfc2l6ZSkNCj4+IHsNCj4+ICAgwqDCoMKgIC8qIFJldHVybiB0cnVlIGlmIHRo
ZXJlIGlzIGFuIG92ZXJsYXAuICovDQo+PiAgIMKgwqDCoCByZXR1cm4gcjFfb2Zmc2V0IDwgcjJf
b2Zmc2V0ICsgcjJfc2l6ZSAmJiByMl9vZmZzZXQgPCByMV9vZmZzZXQgKyByMV9zaXplOw0KPj4g
fQ0KPj4NCj4+IGJvb2wgdnBjaV9oZWFkZXJfd3JpdGVfbG9jayhjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzdGFydCwgdW5zaWduZWQgaW50IHNpemUpDQo+PiB7
DQo+PiAgIMKgwqDCoCAvKg0KPj4gICDCoMKgwqDCoCAqIFdyaXRpbmcgdGhlIGNvbW1hbmQgcmVn
aXN0ZXIgYW5kIFJPTSBCQVIgcmVnaXN0ZXIgbWF5IHRyaWdnZXINCj4+ICAgwqDCoMKgwqAgKiBt
b2RpZnlfYmFycyB0byBydW4gd2hpY2ggaW4gdHVybiBtYXkgYWNjZXNzIG11bHRpcGxlIHBkZXZz
IHdoaWxlDQo+PiAgIMKgwqDCoMKgICogY2hlY2tpbmcgZm9yIHRoZSBleGlzdGluZyBCQVIncyBv
dmVybGFwLiBUaGUgb3ZlcmxhcHBpbmcgY2hlY2ssIGlmIGRvbmUNCj4+ICAgwqDCoMKgwqAgKiB1
bmRlciB0aGUgcmVhZCBsb2NrLCByZXF1aXJlcyB2cGNpLT5sb2NrIHRvIGJlIGFjcXVpcmVkIG9u
IGJvdGggZGV2aWNlcw0KPj4gICDCoMKgwqDCoCAqIGJlaW5nIGNvbXBhcmVkLCB3aGljaCBtYXkg
cHJvZHVjZSBhIGRlYWRsb2NrLiBJdCBpcyBub3QgcG9zc2libGUgdG8NCj4+ICAgwqDCoMKgwqAg
KiB1cGdyYWRlIHJlYWQgbG9jayB0byB3cml0ZSBsb2NrIGluIHN1Y2ggYSBjYXNlLiBTbywgaW4g
b3JkZXIgdG8gcHJldmVudA0KPj4gICDCoMKgwqDCoCAqIHRoZSBkZWFkbG9jaywgY2hlY2sgd2hp
Y2ggcmVnaXN0ZXJzIGFyZSBnb2luZyB0byBiZSB3cml0dGVuIGFuZCBhY3F1aXJlDQo+PiAgIMKg
wqDCoMKgICogdGhlIGxvY2sgaW4gdGhlIGFwcHJvcHJpYXRlIG1vZGUgZnJvbSB0aGUgYmVnaW5u
aW5nLg0KPj4gICDCoMKgwqDCoCAqLw0KPj4gICDCoMKgwqAgaWYgKCBvdmVybGFwKHN0YXJ0LCBz
aXplLCBQQ0lfQ09NTUFORCwgMikgfHwNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAocGRldi0+dnBj
aS0+aGVhZGVyLnJvbV9yZWcgJiYNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIG92ZXJsYXAoc3Rh
cnQsIHNpemUsIHBkZXYtPnZwY2ktPmhlYWRlci5yb21fcmVnLCA0KSkgKQ0KPj4gICDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+DQo+PiAgIMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiB9
DQo+Pg0KPj4gdnBjaV9oZWFkZXJfd3JpdGVfbG9jayBtb3ZlZCB0byBoZWFkZXIuYyBhbmQgaXMg
bm90IHN0YXRpYyBhbnltb3JlLg0KPj4gU28sIHNpdHRpbmcgaW4gaGVhZGVyLmMsIHRoZSBuYW1l
IHNlZW1zIHRvIGJlIGFwcHJvcHJpYXRlIG5vdw0KPiBUaGUgcHJlZml4IG9mIHRoZSBuYW1lIC0g
eWVzLiBCdXQgYXMgc2FpZCwgYSBmdW5jdGlvbiBvZiB0aGlzIG5hbWUgbG9va3MNCj4gYXMgaWYg
aXQgd291bGQgYWNxdWlyZSBhIGxvY2suIEltbyB5b3Ugd2FudCB0byBpbnNlcnQgIm5lZWQiIG9y
IHNvbWUNCj4gc3VjaC4NCkFncmVlLiBUaGVuIHZwY2lfaGVhZGVyX25lZWRfd3JpdGVfbG9jay4N
Ckkgd2lsbCBhbHNvIHVwZGF0ZSB0aGUgY29tbWVudCBiZWNhdXNlIGl0IG1ha2VzIGFuIGltcHJl
c3Npb24gdGhhdA0KdGhlIGZ1bmN0aW9uIGFjcXVpcmVzIHRoZSBsb2NrDQo+DQo+IEphbg0KPg0K
VGhhbmsgeW91LA0KT2xla3NhbmRy

