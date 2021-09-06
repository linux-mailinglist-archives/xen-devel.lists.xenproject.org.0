Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999D401971
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179560.325891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBWF-0004Uu-Uy; Mon, 06 Sep 2021 10:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179560.325891; Mon, 06 Sep 2021 10:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBWF-0004SG-R7; Mon, 06 Sep 2021 10:06:27 +0000
Received: by outflank-mailman (input) for mailman id 179560;
 Mon, 06 Sep 2021 10:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykgp=N4=epam.com=prvs=9883458851=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNBWE-0004P7-Fq
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:06:26 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17d65e08-0efa-11ec-b09c-12813bfff9fa;
 Mon, 06 Sep 2021 10:06:25 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1867BWMK005392; 
 Mon, 6 Sep 2021 10:06:22 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3aweck0jve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:06:21 +0000
Received: from DB8PR03MB6329.eurprd03.prod.outlook.com (2603:10a6:10:13e::9)
 by DBBPR03MB5366.eurprd03.prod.outlook.com (2603:10a6:10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 10:06:19 +0000
Received: from DB8PR03MB6329.eurprd03.prod.outlook.com
 ([fe80::14ca:2f6f:15bd:3470]) by DB8PR03MB6329.eurprd03.prod.outlook.com
 ([fe80::14ca:2f6f:15bd:3470%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 10:06:19 +0000
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
X-Inumbo-ID: 17d65e08-0efa-11ec-b09c-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nki9kBPfoIcBa6pHODa3MDHY7fGTSDiXP1DWGAPLPTRrf1MZO9rcmSUOCT+i7VenlULQNKKy9DmRGC87uwmXyGjSDN46rtJcT0Ix2NcRpD2AFfRYZ51m1DpTVR8WfeL8c3QkgLqnJ3+50iiA9yVd/+240ps0THXrpgk9JXil+fhS8Kc0dRnSbIOvlVaR+qe2wIdGhxe3kkX6ZdTo6HsP0d1NHmmHKpI/E2rdOmyxrNZQiHANaibsybuazQADGaik1qM2BsKkeXKFBlwMZ6HWG5kmEENxAPUub5Ig43kHBBbdNNLfulta9EUNCKgt0hRfwMqQJKmyz7TA+3r4Ea36VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GlvqxbD5b03wI0GYjnBPDqAcfMokceyjdbHCD/df8wE=;
 b=X5SFxg04p/sflxga31oA/OmwDp0ia+WuoiaCMBGSdMhb513W35Kaz5TNMAYnGlUNZeH9wDzuuk1MsHSOpX3VeSUG2cq2ZIJSShAaikaCBjvOaMs3ZZeMV00xcIWK5t03QA2Au3NU6uGYoP1Ks7IqRUogBTcG1TQjxXvsqkIpwyUsxtl6SRwmMbbLP9sA2Bthc6iQTm0eKg3nom5BRt1RYetOReEKCgi45KO+gS4MSgSFrKpazNZNMdDOFXDx/PlRiq0kx+a1PF77D8jvocqEfGPFofWMR3BsY/6/hMN5JPpaMipaAE6gNS347ts2EjiZRp9NDtwRDW4JaUzkPBUdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlvqxbD5b03wI0GYjnBPDqAcfMokceyjdbHCD/df8wE=;
 b=bOQ8XheyxwU4+FRV4/hXnpJr1ujFkxHLj3lj9RS+k8vYgmgRuFzQhATkLL9imaVzYld4Uws5NXLITjo64cgp1wA0/HUKY+GWdcARPUesxBRz6DBdunBLq0uhghixEuU5gNTaVKwP+uCwrPbYBh345klD0USRQfdolvww+/ehXIRisVXtjnVilQka0Z1a0OMcrfLsL+gIkItmKFfHmJp6PjN7QDudgdFkI3fMIOD9b5ZJNjyyAjJTbUyfC1WEpcQvo0wooRTsuZKS6V+WOAKHpVr4UgnSrSiMrdJap0+2KbrhcywRCiImqvc5CVVNZzAQhLFbxRsJC7Cosy7lL7MOow==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Topic: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Index: 
 AQHXoJ51zxJWpxhHEEGXNqYYBqazw6uSBESAgASU4wCAAB15AIAABzeAgAALJQCAAANyAA==
Date: Mon, 6 Sep 2021 10:06:18 +0000
Message-ID: <71e0a54f-da69-5712-f826-9c38eecfa244@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
 <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
 <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
 <b5b761bd-f5d7-34e6-691d-735af7c8b0ae@epam.com>
 <f950a37d-2773-fce5-9e77-163a64925d7d@xen.org>
In-Reply-To: <f950a37d-2773-fce5-9e77-163a64925d7d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f6b2752-80c3-4351-2437-08d9711df8c6
x-ms-traffictypediagnostic: DBBPR03MB5366:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DBBPR03MB536604ACC49EA83F4E241861E7D29@DBBPR03MB5366.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rH2AO/pSY6cTQPn6n+wtAAItbeiAPYCzlKvw5fXWbGeh+Wpr+DJmjtp4EmLK4eDdQmFWvgZPSbKhTJSrrrl5lP6bFl0nk6Y7UGGYJCCvCoZRPTzSWmVPyVT1me//G8EPsntMwVdiymBS4JcLj/LnI8Ml/1kvmPb5+vErFuNa1NBPYSmgSt0HU3dZYcdebfJopIlnMDmJyXSEsUFumGHG38icPsBK/9aLSniBrwmOORW9CsTFFhq138YkenBvp6i54IXZVFQs18L+BB+rU4ZyBfZfK4Si5cORVj7Hy2NjXSa4PK+gZkQ1BwrtBjwkDbaN6ciL4fDu5e/MSOz0IoPseXfK0TTNTkN/6eA2c7zM8gTT1aBMZMgtjng9BY8VzlkBz8wWRAJ7qviJ06wyO+IqAmCLo1hea2c+OsWvVmy7//j4L+44mKOQKB1p73vOQxrJVYEMW2dJb66d4/MTgumumvl9oO3BlmHXquf1glLYAVSUNbvH9/pIRdbjqiVig1K0xBgjpZQk+T2DwXh3qjO3WtWTPem7ycrTqHSNFw3ldnqgKa4iqjr50kFr6fdq5KGDjJ1NTX+59UXN2NWk4a3Ew8H4K6DLS1AEMXndjmNYJuyskKAxQAIrpN8/VU6ScmJMw9dus9IJCGQt48ZnvoUn8wXmilkgjTBzAS88fpVxUw70C7Nu3y+vGDOT0TkVV70c6/QPnQ9ppW3aOTx4k7oDaeKE2udFOSG4K11IMwXaVG38mmsOb1G/I8H4ip5KmUtV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6329.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(83380400001)(38070700005)(8936002)(4326008)(2616005)(86362001)(31696002)(8676002)(38100700002)(36756003)(31686004)(122000001)(2906002)(6512007)(71200400001)(6486002)(6506007)(54906003)(5660300002)(316002)(110136005)(66446008)(64756008)(66556008)(66946007)(66476007)(76116006)(91956017)(26005)(53546011)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a0N3Rzc4eHRqdFR4WVpsR2gzT3BaUklxS0dzTitNUCt2Tnc0clVRbjRWaEN5?=
 =?utf-8?B?ekN6K3g0Y01QTVhzaC96NUdjZ1dOeEo2SHBoalkramJOSjhFWmF3ZTJQODk3?=
 =?utf-8?B?ODJmSUp4UkRXMFNKT1VYVm80MytyUUFXbHlGNGRTNG5tdnFtRDFqNzdzN2tJ?=
 =?utf-8?B?YmtFa0tzMTQ1UkhUVWtmTlJ3UWJkYlNkdlA0ME4wZ2padSt4ejBhWUl3d0gv?=
 =?utf-8?B?c2tzbkVkOVl6L1J1QW1PQVpRbGxqOGZlUXBTYjRuOHdneUxWMGtTWm1ickZ1?=
 =?utf-8?B?LzBWeDdKL0lLb1drT25IS0pzVGt3bUlweUU5c0JQZ3BFb2pHWmFycGx1Q0lj?=
 =?utf-8?B?SnMrdExldDBTcFRCa01wQ3pkN1B6UXRZMWs2bHY0U0VXMksyK1ZuVU1SU1Ni?=
 =?utf-8?B?eEp3VXp1bS8rdTB2UmdQMmZKcXFjSkpuT3l6NW5qZi9NclQvanJwQ0JwanA0?=
 =?utf-8?B?SHlDU0wySEpFc0E4RVNoRGNHUmZXNnV4TnV3QTJsRjJid3pDMk1wRlBqOWE1?=
 =?utf-8?B?ZW05UVcraHkzT2dCUEYvYXZoUUJVd2E5QkZHR2twek5RWS9PSkZWU1FaUG5X?=
 =?utf-8?B?d3k4OElvSWRUZHh2R25GNHp0S2F1SWFRMGU2NXUvTEZ3a09TRkx0bE56ZVF3?=
 =?utf-8?B?bTdGeGxmcWE4ZWFVdENtTWFHbi9idUZiTndtODRZOUYrNnRvNldqbmZGcmZq?=
 =?utf-8?B?NGMwV2NrRlNRMkJoSUtNWlp3dEMwYVp3MU04U1RKL3JQS2tCV0tVdlJXZUx1?=
 =?utf-8?B?bk52TUFpRkJ4eFZlaUswYVdiUW1HUGMrN0U2Uk5JemZ5bnZhV1BQN0FyZkdN?=
 =?utf-8?B?bTFsVlRwWk12YXJqL0crYmtwR3hHMnkyZFpLejlsaVNxRnQvNXlMczY3dmNX?=
 =?utf-8?B?WGVZTXpFYzRObEc3cmwyZlBtbXVPams1dHFlWkdwVWlFcVBCOEdhK2VJTmVT?=
 =?utf-8?B?ZzJ1ZTBrcGJPMmplaW5TRHZibmxnaGR3YUFyc3NBTkFBN0xKSis5SjBGdlVw?=
 =?utf-8?B?NHlEU25jUGZPb1RQTnoxUHNYTHh1VGJZcmt2VTFrNmpmMWpZNWNEK3JySVJm?=
 =?utf-8?B?Y1F2Zk1ZdXZ5WFFvWHFxMXF6TmFncVJ5OW9INHZBUm1MKzhhYVozOWZSemxx?=
 =?utf-8?B?Qi9objBnWlBMbCtHd2VsTFJyMHlDSmQ2OXNMZ2tCclcrQUltL3pZeThRL2lB?=
 =?utf-8?B?WTRPaHV4YktENnZJdVlnUE9LbWRTd3B4OFd0dlhTWkxhYng0OGdYNTNnaVND?=
 =?utf-8?B?US9TZTd6RzY5RmtwQVltZWx3Y0pBaW1JY0RwVlNDaGhHbHBYRHhhclFJL3py?=
 =?utf-8?B?dXhKeGhFWDJ4bDJyUFl1Qy8vUW5hSTZoVjVpdGJWVEk3WngrUkgxdURUbXNw?=
 =?utf-8?B?cmFmN3dWMVZ4aHQ4aEdRTHJaR2NSSjV3UDBkTG1ZT2xoemhoQWl2U2p1aklo?=
 =?utf-8?B?alRyRXZsdWNCSFZQMU9vTGpEem9OcDJGM2pFcjROZDhCQmhrL2xqekN4c2hD?=
 =?utf-8?B?MWxtYW93QkVMSHBNYnlLUE9pRFkzZXQrck11TzQvWnhFcTFKdkV5V3pxaGps?=
 =?utf-8?B?d0Ftb3hzaFJicGNpQ2lRbWUydTBmQXFSNUJTUEsydUZyazNYSVdlN2t4YWl0?=
 =?utf-8?B?TjlYNE1mRy9tSDBHUDNDQldhN0diM3pTcmU5YjFLNVJZMUtNR2NoRmVmOFdh?=
 =?utf-8?B?c3k0akVjRHlPUUUrNnZrTW9mcmRmUXQwdUhMRk5vdWc1VzNaR2tMbHVXWUY1?=
 =?utf-8?Q?RbQq4dqvpEw/OrG7Q4h9z5uMjfps4MGffoSKHjm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10D4F8D17A2DC44C89797B5ED8F2E223@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6329.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b2752-80c3-4351-2437-08d9711df8c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 10:06:18.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4jDX0tMJfe32pxZLPB6sD1KiNKqNNY7yTsfZBYPIKqrFrxShzxBcFSjOB8ZD03k2m9ve12KvbxOd8BcQkgwL3BSYveWGyNmvWWUfuPX3uU0BGBVr9KVqbqG69182n2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5366
X-Proofpoint-GUID: vkyPgN_bW_Kr5Lq7MUtFzHKsC0Ni8Sm0
X-Proofpoint-ORIG-GUID: vkyPgN_bW_Kr5Lq7MUtFzHKsC0Ni8Sm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_05,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060064

DQpPbiAwNi4wOS4yMSAxMjo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBPbGVrc2FuZHIs
DQo+DQo+IE9uIDA2LzA5LzIwMjEgMTA6MTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4NCj4+IE9uIDA2LjA5LjIxIDExOjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24g
MDYvMDkvMjAyMSAwODowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEhp
LCBKdWxpZW4hDQo+Pj4NCj4+PiBIaSBPbGVrc2FuZHIsDQo+Pj4NCj4+Pj4gT24gMDMuMDkuMjEg
MTI6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+DQo+
Pj4+PiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToN
Cj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiB2UENJIG1heSBtYXAgYW5kIHVubWFwIFBD
SSBkZXZpY2UgbWVtb3J5IChCQVJzKSBiZWluZyBwYXNzZWQgdGhyb3VnaCB3aGljaA0KPj4+Pj4+
IG1heSB0YWtlIGEgbG90IG9mIHRpbWUuIEZvciB0aGlzIHRob3NlIG9wZXJhdGlvbnMgbWF5IGJl
IGRlZmVycmVkIHRvIGJlDQo+Pj4+Pj4gcGVyZm9ybWVkIGxhdGVyLCBzbyB0aGF0IHRoZXkgY2Fu
IGJlIHNhZmVseSBwcmVlbXB0ZWQuDQo+Pj4+Pj4gUnVuIHRoZSBjb3JyZXNwb25kaW5nIHZQQ0kg
Y29kZSB3aGlsZSBzd2l0Y2hpbmcgYSB2Q1BVLg0KPj4+Pj4NCj4+Pj4+IElJVUMsIHlvdSBhcmUg
dGFsa2luZyBhYm91dCB0aGUgZnVuY3Rpb24gbWFwX3JhbmdlKCkgaW4geGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuIFRoZSBmdW5jdGlvbiBoYXMgdGhlIGZvbGxvd2luZyB0b2RvIGZvciBBcm06DQo+
Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIEFSTSBUT0RPczoNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogLSBPbiBBUk0g
d2hldGhlciB0aGUgbWVtb3J5IGlzIHByZWZldGNoYWJsZSBvciBub3Qgc2hvdWxkIGJlIHBhc3Nl
ZA0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgdG8gbWFwX21taW9fcmVnaW9ucyBp
biBvcmRlciB0byBkZWNpZGUgd2hpY2ggbWVtb3J5IGF0dHJpYnV0ZXMNCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgICrCoMKgIHNob3VsZCBiZSB1c2VkLg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiAtIHt1bn1tYXBfbW1pb19yZWdp
b25zIGRvZXNuJ3Qgc3VwcG9ydCBwcmVlbXB0aW9uLg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKi8NCj4+Pj4+DQo+Pj4+PiBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSBhZGRyZXNzZWQgaW4g
dGhlIHR3byBzZXJpZXMgZm9yIFBDSSBwYXNzdGhyb3VnaCBzZW50IHNvIGZhci4gRG8geW91IGhh
dmUgYW55IHBsYW4gdG8gaGFuZGxlIGl0Pw0KPj4+Pg0KPj4+PiBObyBwbGFuIHlldC4NCj4+Pj4N
Cj4+Pj4gQWxsIHRoZSBtYXBwaW5ncyBhcmUgaGFwcGVuaW5nIHdpdGggcDJtX21taW9fZGlyZWN0
X2RldiBhcyBvZiBub3cuDQo+Pj4NCj4+PiBTbyB0aGlzIGFkZHJlc3MgdGhlIGZpcnN0IFRPRE8g
YnV0IGhvdyBhYm91dCB0aGUgc2Vjb25kIFRPRE8/IEl0IHJlZmVycyB0byB0aGUgbGFjayBvZiBw
cmVlbXB0aW9uIG9uIEFybSBidXQgaW4gdGhpcyBwYXRjaCB5b3Ugc3VnZ2VzdCB0aGVyZSBhcmUg
c29tZSBhbmQgaGVuY2Ugd2UgbmVlZCB0byBjYWxsIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkuDQo+
Pj4NCj4+PiBGb3IgYSB0ZWNoIHByZXZpZXcsIHRoZSBsYWNrIG9mIHByZWVtcHRpb24gd291bGQg
YmUgT0suIEhvd2V2ZXIsIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgYmUgdXBkYXRlZCB0byBt
YWtlIGNsZWFyIHRoZXJlIGFyZSBubyBzdWNoIHByZWVtcHRpb24geWV0IG9yIGF2b2lkIHRvIG1l
bnRpb24gaXQuDQo+Pg0KPj4gV2VsbCwgdGhlIGNvbW1lbnQgd2FzIG5vdCBhZGRlZCBieSBtZSAo
YnkgUm9nZXIgSSBndWVzcyksIEkganVzdCBrZWVwIGl0Lg0KPg0KPiBJIGRvbid0IHRoaW5rIGl0
IG1hdHRlcnMgdG8ga25vdyB3aG8gYWRkZWQgaXQuIFdoYXQgbWF0dGVycyBpcyB3aGVuIHRob3Nl
IGNvbW1lbnRzIGFyZSBnb2luZyB0byBiZSBoYW5kbGVkLiBJZiB0aGV5IGFyZSBhbHJlYWR5IGhh
bmRsZWQsIHRoZW4gdGhleSBzaG91bGQgYmUgZHJvcHBlZC4NCj4NCj4gSWYgdGhleSBhcmUgbm90
LCB0aGUgdHdvIFRPRE9zIGxpc3RlZCBhYm92ZSBhcmUgcHJvYmFibHkgT0sgdG8gZGVmZXIgYXMg
eW91IG9ubHkgcGxhbiBhIHRlY2ggcHJldmlldy4gQnV0IHRoZXkgd291bGQgbmVlZCB0byBiZSBo
YW5kbGVkIGJlZm9yZSB2Q1BJIGlzIHNlbGVjdGVkIGJ5IGRlZmF1bHQgYW5kIHVzZWQgaW4gcHJv
ZHVjdGlvbi4NCj4NCj4gTm90ZSB0aGF0IEkgc3BlY2lmaWNhbGx5IHdyb3RlICJ0aGUgdHdvIFRP
RE9zIGxpc3RlZCBhYm92ZSIgYmVjYXVzZSBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBvdGhlciBU
T0RPcy9GSVhNRXMgYW5kIGZpZ3VlZCBvdXQgdGhleSBhcmUgZmluZSB0byBkZWZlci4NCk9rLCB0
aGVuIEkgbGVhdmUgdGhlIFRPRE9zIGFzIHRoZXkgYXJlDQo+DQo+Pg0KPj4gQXMgdG8gdGhlIHBy
ZWVtcHRpb24gYm90aCBtYXAgYW5kIHVubWFwIGFyZSBoYXBwZW5pbmcgdmlhIHZwY2lfcHJvY2Vz
c19wZW5kaW5nLCBzbw0KPg0KPiBSaWdodC4uLiB0aGlzIGRvZXNuJ3QgbWVhbiBwcmVlbXB0aW9u
IGlzIGFjdHVhbGx5IHN1cHBvcnRlZCBvbiBBcm0uIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkgZG9l
c24ndCBkbyB0aGUgcHJlZW1wdGlvbiBpdHNlbGYuIEl0IHJlbGllcyBvbiBtYXBfcmFuZ2UoKSB0
byBkbyBpdC4NCj4NCj4gQnV0IGV2ZW4gbWFwX3JhbmdlKCkgcmVsaWVzIG9uIHRoZSBhcmNoIHNw
ZWNpZmljIGhlbHBlciB7LHVufW1hcF9tbWlvX3JlZ2lvbnMoKSB0byBkbyBpdC4gSWYgeW91IGxv
b2sgYXQgdGhlIHg4NiBpbXBsZW1lbnRhdGlvbiB0aGV5IGFyZSBhZGRpbmcgYXQgbWF4IE1BWF9N
TUlPX01BWF9JVEVSIGVudHJpZXMgcGVyIGNhbGwuIE9uIEFybSwgdGhlcmUgYXJlIG5vdCBzdWNo
IGxpbWl0LiBUaGVyZWZvcmUgdGhlIGZ1bmN0aW9uIHdpbGwgYWx3YXlzIGRvIHRoZSBmdWxsIHss
dW59bWFwcGluZyBiZWZvcmUgcmV0dXJuaW5nLiBJT1cgdGhlcmUgYXJlIG5vIHByZWVtcHRpb24g
c3VwcG9ydGVkLg0KT2sNCj4NCj4+DQo+PiB3aGF0IGlzIHRydWUgZm9yIG1hcCBpcyBhbHNvIHRy
dWUgZm9yIHVubWFwIHdpdGggdGhpcyByZXNwZWN0DQo+Pg0KPj4+DQo+Pj4+DQo+Pj4+Pg0KPj4+
Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IMKgwqDCoCB4
ZW4vYXJjaC9hcm0vdHJhcHMuYyB8IDYgKysrKysrDQo+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jDQo+Pj4+Pj4gaW5kZXggMjE5YWIz
YzNmYmRlLi4xNTcxZmI4YWZkMDMgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3Ry
YXBzLmMNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4+Pj4+IEBAIC0zNCw2
ICszNCw3IEBADQo+Pj4+Pj4gwqDCoMKgICNpbmNsdWRlIDx4ZW4vc3ltYm9scy5oPg0KPj4+Pj4+
IMKgwqDCoCAjaW5jbHVkZSA8eGVuL3ZlcnNpb24uaD4NCj4+Pj4+PiDCoMKgwqAgI2luY2x1ZGUg
PHhlbi92aXJ0dWFsX3JlZ2lvbi5oPg0KPj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3ZwY2kuaD4NCj4+
Pj4+PiDCoMKgwqAgwqAgI2luY2x1ZGUgPHB1YmxpYy9zY2hlZC5oPg0KPj4+Pj4+IMKgwqDCoCAj
aW5jbHVkZSA8cHVibGljL3hlbi5oPg0KPj4+Pj4+IEBAIC0yMzA0LDYgKzIzMDUsMTEgQEAgc3Rh
dGljIGJvb2wgY2hlY2tfZm9yX3ZjcHVfd29yayh2b2lkKQ0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IH0NCj4+Pj4+PiDCoMKgwqAgI2VuZGlmDQo+Pj4+Pj4gwqDCoMKgICvCoMKgwqAgbG9jYWxfaXJx
X2VuYWJsZSgpOw0KPj4+Pj4+ICvCoMKgwqAgaWYgKCBoYXNfdnBjaSh2LT5kb21haW4pICYmIHZw
Y2lfcHJvY2Vzc19wZW5kaW5nKHYpICkNCj4+Pj4+DQo+Pj4+PiBMb29raW5nIGF0IHRoZSBjb2Rl
IG9mIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCksIGl0IGxvb2tzIGxpa2UgdGhlcmUgYXJlIHNvbWUg
cmV3b3JrIHRvIGRvIGZvciBndWVzdC4gRG8geW91IHBsYW4gdG8gaGFuZGxlIGl0IGFzIHBhcnQg
b2YgdGhlIHZQQ0kgc2VyaWVzPw0KPj4+PiBZZXMsIHZQQ0kgY29kZSBpcyBoZWF2aWx5IHRvdWNo
ZWQgdG8gc3VwcG9ydCBndWVzdCBub24taWRlbnRpdHkgbWFwcGluZ3MNCj4+Pg0KPj4+IEkgd2Fz
bid0IHJlZmVycmluZyB0byB0aGUgbm9uLWlkZW50aXR5IG1hcHBpbmdzIGhlcmUuIEkgd2FzIHJl
ZmVycmluZyB0byBUT0RPcyBzdWNoIGFzOg0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8qDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBGSVhNRTogaW4gY2FzZSBv
ZiBmYWlsdXJlIHJlbW92ZSB0aGUgZGV2aWNlIGZyb20gdGhlIGRvbWFpbi4NCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIE5vdGUgdGhhdCB0aGVyZSBtaWdodCBzdGlsbCBiZSBsZWZ0
b3ZlciBtYXBwaW5ncy4gV2hpbGUgdGhpcyBpcw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogc2FmZSBmb3IgRG9tMCwgZm9yIERvbVVzIHRoZSBkb21haW4gd2lsbCBsaWtlbHkgbmVl
ZCB0byBiZQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICoga2lsbGVkIGluIG9yZGVy
IHRvIGF2b2lkIGxlYWtpbmcgc3RhbGUgcDJtIG1hcHBpbmdzIG9uDQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBmYWlsdXJlLg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICovDQo+Pj4NCj4+PiBZb3Ugc3RpbGwgaGF2ZSB0aGVtIGFmdGVyIHRoZSBzZXJpZXMgcmV3b3Jr
aW5nIHRoZSB2UENJLiBBcyBmb3IgdGhlIHByZWVtcHRpb24gdGhpcyBpcyBPSyB0byBpZ25vcmUg
aXQgZm9yIGEgdGVjaCBwcmV2aWV3LiBBbHRob3VnaCwgd2Ugd2FudCB0byBhdCBsZWFzdCB0cmFj
ayB0aGVtLg0KPj4gUGxlYXNlIHNlZSBhYm92ZTogYm90aCBtYXAgYW5kIHVubWFwIGFyZSBoYXBw
ZW5pbmcgdmlhIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+DQo+IEkgYW0gbm90IHN1cmUgaG93IHRo
aXMgaXMgcmVsZXZhbnQgdG8gd2hhdCBJIGp1c3QgbWVudGlvbm5lZC4NCj4NCj4+Pg0KPj4+Pj4N
Cj4+Pj4+PiArIHJhaXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSk7DQo+Pj4+Pj4gK8KgwqDC
oCBsb2NhbF9pcnFfZGlzYWJsZSgpOw0KPj4+Pj4+ICsNCj4+Pj4+DQo+Pj4+PiDCoMKgRnJvbSBt
eSB1bmRlcnN0YW5kaW5nIG9mIHZjcGlfcHJvY2Vzc19wZW5kaW5nKCkuIFRoZSBmdW5jdGlvbiB3
aWxsIHJldHVybiB0cnVlIGlmIHRoZXJlIGFyZSBtb3JlIHdvcmsgdG8gc2NoZWR1bGUuDQo+Pj4+
IFllcw0KPj4+Pj4gSG93ZXZlciwgaWYgY2hlY2tfZm9yX3ZjcHVfZm9yX3dvcmsoKSByZXR1cm4g
ZmFsc2UsIHRoZW4gd2Ugd2lsbCByZXR1cm4gdG8gdGhlIGd1ZXN0IGJlZm9yZSBhbnkgd29yayBm
b3IgdkNQSSBoYXMgZmluaXNoZWQuIFRoaXMgaXMgYmVjYXVzZSBjaGVja19mb3JfdmNwdV93b3Jr
KCkgd2lsbCBub3QgYmUgY2FsbGVkIGFnYWluLg0KPj4+PiBDb3JyZWN0DQo+Pj4+Pg0KPj4+Pj4g
SW4gdGhpcyBjYXNlLCBJIHRoaW5rIHlvdSB3YW50IHRvIHJldHVybiBhcyBzb29uIGFzIHlvdSBr
bm93IHdlIG5lZWQgdG8gcmVzY2hlZHVsZS4NCj4+Pj4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIHRo
aXMNCj4+Pg0KPj4gSSB3YXMgbW9yZSByZWZlcnJpbmcgdG8gIkkgdGhpbmsgeW91IHdhbnQgdG8g
cmV0dXJuIGFzIHNvb24gYXMgeW91IGtub3cgd2UgbmVlZCB0byByZXNjaGVkdWxlLiINCj4+PiBU
aGUgcmV0dXJuIHZhbHVlIG9mIGNoZWNrX2Zvcl92Y3B1X2Zvcl93b3JrKCkgaW5kaWNhdGVzIHdo
ZXRoZXIgd2UgaGF2ZSBtb3JlIHdvcmsgdG8gZG8gYmVmb3JlIHJldHVybmluZyB0byByZXR1cm4g
dG8gdGhlIGd1ZXN0Lg0KPj4+DQo+Pj4gV2hlbiB2cGNpX3Byb2Nlc3NfcGVuZGluZygpIHJldHVy
bnMgdHJ1ZSwgaXQgdGVsbHMgdXMgd2UgbmVlZCB0byBjYWxsIHRoZSBmdW5jdGlvbiBhdCBsZWFz
dCBvbmUgbW9yZSB0aW1lIGJlZm9yZSByZXR1cm5pbmcgdG8gdGhlIGd1ZXN0Lg0KPj4+DQo+Pj4g
SW4geW91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB5b3UgbGVhdmUgdGhhdCBkZWNpc2lvbiB0
byB3aG9lZXZlciBpcyBuZXh0IGluIHRoZSBmdW5jdGlvbi4NCj4+Pg0KPj4+IEl0IGlzIG5vdCBz
YWZlIHRvIHJldHVybiB0byB0aGUgZ3Vlc3QgYXMgbG9uZyBhcyB2cGNpX3Byb2Nlc3NfcGVuZGlu
ZygpIHJldHVybnMgdHJ1ZS4gU28geW91IHdhbnQgdG8gd3JpdGUgc29tZXRoaW5nIGxpa2U6DQo+
Pj4NCj4+PiBpZiAoIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkgKQ0KPj4+IMKgwqAgcmV0dXJuIHRy
dWU7DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4NCj4+ICsrKyBiL3hlbi9hcmNo
L2FybS90cmFwcy5jDQo+PiBAQCAtMjI5MSw2ICsyMjkxLDkgQEAgc3RhdGljIGJvb2wgY2hlY2tf
Zm9yX3ZjcHVfd29yayh2b2lkKQ0KPj4gwqAgwqB7DQo+PiDCoCDCoMKgwqDCoCBzdHJ1Y3QgdmNw
dSAqdiA9IGN1cnJlbnQ7DQo+Pg0KPj4gK8KgwqDCoCBpZiAoIHZwY2lfcHJvY2Vzc19wZW5kaW5n
KCkgKQ0KPj4gK8KgwqDCoMKgwqAgcmV0dXJuIHRydWU7DQo+PiArDQo+PiDCoCDCoCNpZmRlZiBD
T05GSUdfSU9SRVFfU0VSVkVSDQo+PiDCoCDCoMKgwqDCoCBpZiAoIGRvbWFpbl9oYXNfaW9yZXFf
c2VydmVyKHYtPmRvbWFpbikgKQ0KPj4gwqAgwqDCoMKgwqAgew0KPj4gRG8geW91IG1lYW4gc29t
ZXRoaW5nIGxpa2UgdGhpcz8NCj4NCj4gWWVzLg0KT2ssIEknbGwgYWRkIHRoaXMgY2hlY2sNCj4N
Cj4+Pj4+IEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIHJlc3Qgb2YgdGhlIGNvZGUsIHdlIGFscmVh
ZHkgaGF2ZSBhIGNoZWNrIGZvciB2cGNpIGluIHRoZSBjb21tb24gSU9SRVEgY29kZS4NCj4+Pj4N
Cj4+Pj4gV2hpY2ggbWF5IG5vdCBiZSBlbmFibGVkIGFzIGl0IGRlcGVuZHMgb24gQ09ORklHX0lP
UkVRX1NFUlZFUi4NCj4+Pg0KPj4+IFJpZ2h0LiBNeSBwb2ludCBpcyB3aGVuIENPTkZJR19JT1JF
UV9TRVJWRVIgaXMgc2V0IHRoZW4geW91IHdvdWxkIGVuZCB1cCB0byBjYWxsIHR3aWNlIHZwY2lf
cHJvY2Vzc19wZW5kaW5nKCkuIFRoaXMgd2lsbCBoYXZlIGFuIGltcGFjdCBob3cgb24gbG9uZyB5
b3VyIHZDUFUgaXMgZ29pbmcgdG8gcnVubmluZyBiZWNhdXNlIHlvdSBhcmUgZG91YmxpbmcgdGhl
IHdvcmsuDQo+Pg0KPj4gU28sIHlvdSBzdWdnZXN0IHRoYXQgd2UgaGF2ZSBpbiB0aGUgY29tbW9u
IElPUkVRIGNvZGUgc29tZXRoaW5nIGNhbGwgbGlrZQ0KPj4NCj4+IGFyY2hfdnBjaV9wcm9jZXNz
X3BlbmRpbmc/IEluIGNhc2Ugb2YgeDg2IGl0IHdpbGwgaGF2ZSB0aGUgY29kZSBjdXJyZW50bHkg
Zm91bmQgaW4gdGhlDQo+Pg0KPj4gY29tbW9uIElPUkVRIHNvdXJjZXMgYW5kIGZvciBBcm0gaXQg
d2lsbCBiZSBub3A/DQo+DQo+IE5vIEkgYW0gc3VnZ2VzdGluZyB0byBtb3ZlIHRoZSBjYWxsIG9m
IHRoZSBJT1JFUSBjb2RlIHRvIGh2bV9kb19yZXN1bWUoKSAob24geDg2KSBhbmQgY2hlY2tfZm9y
X3ZjcHVfd29yaygpIChvbiBBcm0pLg0KDQpPaywgSSBjYW4gbW92ZSB2UENJIGNvZGUgdG8gaHZt
X2RvX3Jlc3VtZSwgYnV0IHZQQ0kgaXMgb25seSB1c2VkIGZvciB4ODYgUFZIIERvbTAuDQoNCkRv
IHlvdSBzdGlsbCB0aGluayBodm1fZG9fcmVzdW1lIGlzIHRoZSByaWdodCBwbGFjZT8NCg0KPg0K
PiBDaGVlcnMsDQo+DQpUaGFua3MsDQoNCk9sZWtzYW5kcg0K

