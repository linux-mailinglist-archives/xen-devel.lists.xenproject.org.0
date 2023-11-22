Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612A7F53B6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639260.996366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w2n-0007N3-L3; Wed, 22 Nov 2023 22:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639260.996366; Wed, 22 Nov 2023 22:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w2n-0007Io-HJ; Wed, 22 Nov 2023 22:50:05 +0000
Received: by outflank-mailman (input) for mailman id 639260;
 Wed, 22 Nov 2023 22:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5w2l-0006wv-Ri
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:50:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a45472-8989-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:50:01 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMMcJYf030777; Wed, 22 Nov 2023 22:49:48 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uhet1afc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 22:49:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6354.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Wed, 22 Nov
 2023 22:49:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 22:49:45 +0000
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
X-Inumbo-ID: 77a45472-8989-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dy9+GtYdotcK8R99kCm2Y0VI5qkAVti2L9sUzcXLjWyoHEJwYJVBe5ALA2zf7RUG0Fsr2WT1Gd3OeA8LnV/yncoN101r9IZXVQxnwphazh6Dve71QI5hsOt2lmE7oIpiOZiNa4QIioXLwG8HaehgQIaUdOkjTcHsuL6zGPVsYxFbpWPx2riliOEwQuFJOrbANmiBbT63xWWjYkOH4VKDkcI98Ht7iULopb94cbmj2cEIHFVnRSBPAVD9vPLWgouH9/8aK/IjRzuRRh3EKF9jt20aUZVqyVPR9S00CVr+M330zC2U1VgVyGQ2WX6KPN2f0eE1lvCKDeEYlnwahh81Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GALFRJg55jt6JiEZfRw+xo/FTGLqR3bGnHTe36biIuQ=;
 b=HWgPgDVATnlsc9nOB4BveR24O3Lfowm4PHvkY2WdWXNW/raxqLbt8qeMSae16WF3MgEm6GXDOIkqKxAuksJFX8smikeqseKM6yzJ+1B/jdpHWB61hCI6aKn/t337j0zX1ruVpJM3dKzzmVFYICIi5JL13Mwmhc5KttYHFLtpQvgJoHhZshtXg5tYLhcORWgJVXiQzzyOECQN7mZMBxDdQrnKG/04vVYhn9UGdfYT3KQE6+t85X/YhDjDAh9EceNig1ppNDmbircNl8jimdwrND5PMAraL8IBuL0ASv3M4YykdHjDMHOBEx/2VGPpSfVLfRq6WZnMsvUwWshBzs4zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GALFRJg55jt6JiEZfRw+xo/FTGLqR3bGnHTe36biIuQ=;
 b=JJKlnFpihG6vcggTa0SPNYDLBGqg0Vdy+4s0yAh/zuT6GRebndVuS1qlaPtyPxi8whwk3P01MHLL1r5LykzA8QUV1VaGAJZij6HZ/I9r2P4Rl6XTAjoTHmiUlOwIzQL/p5PDkkIMvyoEvhmshCWrgYGBCaAfr8iYCAPMMQpV8RmpVs4svjKgOces6C1XWoB+McKD5Gme74dB3CoLlbs73I/xYRJBWtDsyN77SvAPBzg1l/6Odm0RwBjN9vRx89z20YnApsEyl+TLs5kS/gIrqfiL8G/A1JLKIe7VYL5ECnYRAYQbwpbmXDm+WaqT8zI2/pkZ4Zpmffd5RWXvtL9vQw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        David Woodhouse
	<dwmw@amazon.co.uk>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>, Paul Durrant <xadimgnik@gmail.com>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf
	<kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "open
 list:Block layer core" <qemu-block@nongnu.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Topic: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Index: AQHaHMeI7KczK4z02kGE/beB6udNwrCGLpiAgADDwYA=
Date: Wed, 22 Nov 2023 22:49:44 +0000
Message-ID: <87msv51jzu.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-3-volodymyr_babchuk@epam.com>
 <19f6fcaf-ac2b-4cc3-b226-27ec659d7478@linaro.org>
In-Reply-To: <19f6fcaf-ac2b-4cc3-b226-27ec659d7478@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6354:EE_
x-ms-office365-filtering-correlation-id: 747e80bf-822b-43c8-b85a-08dbebad5286
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xpAdNMpjfOIlWWe/YfCvFf3oFiLkbpqrb2RD97fYyxqGH5tpRM0SGBq25KFR1z9pfuRC2oTLtZcHo5t5kRVR5T/VjCU0O6tY24dcpPEyRYrqsFAsrxhe211kNe+tP6c7TMbLGgilezluRfxTCQQ7MKQO2wEMRAwOFSmthKY7HNg6OmJSbex4Sj10cbryycUB5ANI0Np194tL93jxC/gBucAUbTmsQEGaXp7q4FUC0QnRb88qvPIhu5+DmWwi5SuSyfB3IFfKboihi44WRpZtRi84Ypp1gq2ClT9DQuBbUciKbnWapHMcmWonBcOJqMvoyE/sZomA9scuzbXOk2oAtOhY3oIT5m4vmHZx5JPL8WQ5JqktaYhIUCPI0MoVLL8Zexp2di4vxKfCQ9190FsYrHKiGJ3g9HfQDQv6o6Kwp7gHBHL5ntj35NN6jFIpA+Pkv/CevS6cCTnpNfns3drquDIpCQeXj5MmRKTtMBhCZ/AoI2nPNaz7HypBvWoN6j+Mw6mFDfKMamdzD9wpIqo6HskJfNUXFd53l86gb0hCbhtqIsIc6OdS/XVE7/XRitPauPgQG/m+pgZ7syIjUhEFZoggApTxG0/QIlbdaMSSD/CHPHrMu2yzEhMZUiy6Bgcz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(7416002)(2906002)(4744005)(71200400001)(86362001)(6506007)(478600001)(2616005)(26005)(55236004)(53546011)(6512007)(66556008)(66476007)(66446008)(64756008)(316002)(54906003)(6916009)(8676002)(4326008)(8936002)(36756003)(66946007)(6486002)(91956017)(76116006)(122000001)(38100700002)(5660300002)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVZqQWR5SEpFcE1HbHdsZjdDek81MEh6eU8zV01zQTRiRjZhbi9GbFpWblRo?=
 =?utf-8?B?VEFDWll1M3dmT1Vha1MzbTBXUjROYWJTbXFTdzNodjdoZzcxWGkzZHNZWC9p?=
 =?utf-8?B?TTEycTUyZG1OUUgxUFppbFlNcnBJY3pod0h6aml4MXFpZjBQYTdOcjN4ZTU3?=
 =?utf-8?B?WUdiMlNOSUZOUmpib1VNak51SC9SVGhzVWduR3BPN3ZkV3cxZ05lZ051RDEz?=
 =?utf-8?B?REl5bzJJM05YSndsamJnelRGMHdaV3JZVVUzYjBQN3ZUTDRBTFNHZHYxQ0I0?=
 =?utf-8?B?NTBFdnpGYUMyeFcvYnRMdE9Kd05kb1JmRGd2OUszRDZPNWFXL01BL3QvYWV0?=
 =?utf-8?B?TE5VSkFDOG02cmhEdmxJUEtkWVdoZ1A4K0luTDRjQ2E0am5CaUJYN1F3dVpQ?=
 =?utf-8?B?UFVkYUFwd1QxUDJBNjJxOFVXVUwrL1ZLcXdiWUZBelV1VjZML3Y3KzlzVnJK?=
 =?utf-8?B?Yzd2OFRWY1BKcFYyZ0xoVXhSUGsxVGg5N3hCQTNtdHl1bjBhdWpIVk5OSkRt?=
 =?utf-8?B?dUtlSk9KQW5FbFNYRmVibjJpZjVqUmc0bEs5L24xQllnb3ZKNng0dHZUUHA3?=
 =?utf-8?B?TWpjRStpV2lkdEliR09PczQwY2ZOUWxoaXZLRS9BaEhxTEhnWUZ3d3hlL0tl?=
 =?utf-8?B?VVJ2d0dESElRaXhvV1NtdFFxWUk1MTQ3L2pmUjNJOWlKQVZBSk5hZ1NsQ21L?=
 =?utf-8?B?bWVoOUExK1M0dkpUVkVMeUNyK25uK3h5SzJwWFdjV1JFb0dmaTNNREpwNEtH?=
 =?utf-8?B?bG95TkhLRzZQYUp3bXJMcG95WGxpSDdPTCtxZDIyaWNNT1h5clArUDJwelI2?=
 =?utf-8?B?Tld3dURpMER5aVZEUGF3MXgyS2h0endzZmZqWVprVmlrK1pOaWZvUUxkTzdH?=
 =?utf-8?B?S1JpdC9FRVlUK1lwdTZLNDJGMC9tanRWZWZnTkVQZkZoOXg2YWVDcmg3NFdv?=
 =?utf-8?B?NERNeGlmWjhSUlUvZkp3TFJ3N3gxMEd1S2ZpeFZsYWxhNWlXcXBMMHp1Umg2?=
 =?utf-8?B?cWkxSEUyNVNSUXVYWE56U2haU29UTlR2V3NHTkhiSmdMUmw5Q0NqVFJVcmNt?=
 =?utf-8?B?NVJiZmpZZVZ3RFBFYWJZdjVrNHlRQkVldlBURDlha2JiUk1aMWJSTTJ3WHh5?=
 =?utf-8?B?L04rdDhYYTNzcndZMjliSXZRa3hRTG54emc3a3podGxrTS8wYXJjU3d0a3Iy?=
 =?utf-8?B?OWU1aFlNMmlLOW01UmFkWmFQZFJXSGZHaEZBQ1VCclNzamx3ZExIOFJDWndl?=
 =?utf-8?B?WWZoV1haWnp6aG92Sm5SNmlsc3pWbXM4T25xZWJMSi9oUFUxbitaVjRBM3RU?=
 =?utf-8?B?NnFKWjl1c2RHK09NOEFBNGVaOFBZNHlSSGYyTWtoWUxLaHEwbG9FeGhGNXZ4?=
 =?utf-8?B?cDhjb0QyRjczNnpvMUxiMWZnclNsQ2tWaDlpZVRlL2F4K2g3akVCK2xpRXp3?=
 =?utf-8?B?TDF2bStjTTAxbXZSNS9mOEZKS3ZHajBzc3BOazVSd1MrbEJscDZZQm5YbytZ?=
 =?utf-8?B?Y25DRml5SHFTSFZGanlkQVRkc3V3bUU1S0J5OVl6Uk5mejYvaUltNDZTbnN3?=
 =?utf-8?B?bTBGSUo3a1ZFRFFRcmlOWGZXUE9LWGQvamkyanU4UmcySU0rcW5HZndkcFpt?=
 =?utf-8?B?MXdWSGEzTURPRGdwQUg1clppeEROYXpnczAvbTR6TVlmNDFQOHR2Sm5jS0dS?=
 =?utf-8?B?RVgvT3p4SkJ5bjZtV3ZEM2VtOWsra3Q4ejAvOXdIYlY5UG4rZEEzRjBocVNr?=
 =?utf-8?B?dXU4M2dCdWNoTkRTa1NacXNZVVI5YVBDOXg4ZW40OVhIVzFTMFJQb1BQdnlS?=
 =?utf-8?B?Qy9YSzFhWHN5ZnRUQjNORi9RRHQwTnpWaCtCNXRKMU5zMlNORkprSkpocWZT?=
 =?utf-8?B?QkxmclMrcHRLYzhJNFdDVVVJSUFhZHZFd1h5WSswRW9qLzlCOXdxZGZiUlNv?=
 =?utf-8?B?NnBqZXo3UUFLcENYS1kzZGZzWkllYmlpL0h6T0lEZlAvMDQ0cHdoOVRqZms2?=
 =?utf-8?B?UENqcUhBVlNiSVp3Qlh6dzBsSGU5eFBDOE5TeXhOOE9oOFprNHp6M1hXQVpx?=
 =?utf-8?B?OUZ6RmUzR3dwQVRmMmNUbVhFVEZUTHFxL05vSWNxZ2VtT3YyM2dsbm9rWHJ6?=
 =?utf-8?B?bEFmbUFBb0hKWEFFM2dwQXdWaVptTFVTakRBaTVENi9OSFV2Y0I1SVJQd3NF?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <558673417E63B54794723FA5361A733C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747e80bf-822b-43c8-b85a-08dbebad5286
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 22:49:44.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Upao47tIkFHEI3P5cGQ21Dw7lyxI4iEgB4ivSdhWjT1dfdNkqUDHiroo9yvJvbZapRd+91IaH8nX6Y97pWdKWtfXTgPP4mBhXu/soD6B+cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6354
X-Proofpoint-GUID: dz3GyM25Aie6dJIaASEcMMoHQf1dbo_-
X-Proofpoint-ORIG-GUID: dz3GyM25Aie6dJIaASEcMMoHQf1dbo_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=935 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220167

DQpIaSBQaGlsaXBwZSwNCg0KUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8u
b3JnPiB3cml0ZXM6DQoNCj4gSGkgVm9sb2R5bXlyLA0KPg0KPiBPbiAyMS8xMS8yMyAyMzoxMCwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiB3YXMgY3JlYXRlZCBieSBRRU1VDQo+DQo+IFBs
ZWFzZSBkbyBub3Qgc3BsaXQgbGluZXMgYmV0d2VlbiBzdWJqZWN0IGFuZCBjb250ZW50LiBSZXdy
aXRlIHRoZQ0KPiBmdWxsIGxpbmUuIFByZWZlcmFibHkgcmVzdHJpY3QgdGhlIHN1YmplY3QgdG8g
NzIgY2hhcnMuDQoNCkkgdHJpZWQgdG8gY29tZSB3aXRoIHNob3J0ZXIgZGVzY3JpcHRpb24sIGJ1
dCBmYWlsZWQuIEknbGwgcmV3cml0ZSBpdCBpbg0KdGhlIG5leHQgdmVyc2lvbi4NCg0KLS0gDQpX
QlIsIFZvbG9keW15cg==

