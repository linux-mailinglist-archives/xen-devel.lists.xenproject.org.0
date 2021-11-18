Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA045576A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227214.392915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndBW-0008JM-D4; Thu, 18 Nov 2021 08:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227214.392915; Thu, 18 Nov 2021 08:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndBW-0008HQ-9p; Thu, 18 Nov 2021 08:54:22 +0000
Received: by outflank-mailman (input) for mailman id 227214;
 Thu, 18 Nov 2021 08:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mndBU-0008Bb-6D
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:54:20 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9c6ba0-484d-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 09:54:18 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI8n6if027124;
 Thu, 18 Nov 2021 08:54:14 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdk3n8408-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 08:54:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5697.eurprd03.prod.outlook.com (2603:10a6:208:176::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 08:54:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 08:54:09 +0000
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
X-Inumbo-ID: 1c9c6ba0-484d-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XINk84ylUMP7cwhHQ7XQVrH170b/IV6j1jCS90VvwAyt4Gqg6KvVTCiuwdUbm7is34fVvO8S04m0r1Ws8ZzgBavm45eA65QJwSZY5SaRsKn8nStFDWavs7ermbEtRLTb9gU6zMQ0IewPpId8W0dWkiqGZnlPRqzDvTjSFbOXMx3kvHv930yXGkY6V3UvDilsuntfgdJYlNswc8RkhtO0BaOVxzzrQ4Ko7KVUH9+l8UoNw13pIkI1+3ldFM34ToIApRn+TODvhO5k4bY0qHOtXrQi0Rm9NAL6RzcKgg7/KEdINSrV80uaRVB/WSiSC/3IA0I6/v0CtShyvqLj+TPfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj/uIIKXU/s44WxEWtoUbWliQGdPaL8j3VVnLTC5qAo=;
 b=RrcwMucngMjD6lCT6UEVXYuY0iuUqVGAv4qCo0pZ9arIXVIYu2xlrpoKiNzf1KXunNpFddS9Z0kSHzizpRVcFDEj2YQe/bXIakDsTEJBUTRAvDclac7wkHsyQSWU3hgINa2lOQVBcfIJk3doyEMbliOPgAkKIgSbcZMeg6pGir4KomKd4ZEoDySRAIqR4rpYZRxQZ5jUN7Hb2WQEi3b6ftzMtG7C3U8YMm4mw7ixWMoMBWNVXgvAiTbu0s/uCezEq5Fpah2At2cjwN3GY6Rafa0xp7nj404MhYcL8ERBHenV4PJuJ34aqM6mmmd/KpT+LI8+mW5Ebgtg8rwqfKE1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj/uIIKXU/s44WxEWtoUbWliQGdPaL8j3VVnLTC5qAo=;
 b=Ca+pCc/7D2mqiiJfB4aaTGSIhckQNfo3ATRBlb/npeol4jVhDN0TUvB2F+1edcWLM4D+t0umzDaQij+wDC0DELoJbqg1cLlYhHteZ+rNnFgG/VEcwbvj2i5VsS0SWjsP+59rBxw7PoGY4SJNwOzAGXMKVXNUGHurvuQNQ66ME7L+s1oThuirnAcXgPRUDCV5IpMRzSwvwumFBk+qC+vZAu6NjUH9EEukOXjFTZPQrF7wn9UO431Fxjia/IKEK4HNHLxRGtM4RuKg+LadUNFp4T2yPFoEUk9gm1J8t/yBLdGvSe1O7HY5LZ2Oq5aMfWlQO3/mfMVLGMMlYTEm8RLZlg==
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
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkA
Date: Thu, 18 Nov 2021 08:54:09 +0000
Message-ID: <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
In-Reply-To: <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0635d2f-8584-47aa-f84f-08d9aa70fc4b
x-ms-traffictypediagnostic: AM0PR03MB5697:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB56973BE0F1E8747037531873E79B9@AM0PR03MB5697.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uRaRTiEOGLHcZ+huUSumwdDBlllxdTYpGESx/nkJTXfjxBUY62bZM1GLE2beTQ3aS50glVohmaXgnYnGPi29jcFB925TRd+Uc4Wi3XgSm15+GRY9JDjL2Zi2qhYYeS+OZZjl3QurDO10HjO+vEfhqv6V/m2tek1LGSKuqu3p2PGCOD1+L9J8oigOymz4PMW8tWaDqTUTXC4QRAl7gO3Da/NF6eeaLjgqNlX0jPcOYnT7nAbU5bCsPuxcJZuhoVy097h29NnWvOlwOJaW7AY7yPPWX8AOpRILEJsazEGX3G6wSayObmrMPQBkeqUXkcEEflZQvogk3xzC8Y7KD0O3Dfwufa0sFfp5sU3RM8zJrFgrWR8t47V3ZbTGHbbR5Uqai9dKF1+caTZz0ZDj1w+CGrI2on3slvHEkr7yYv83UA12jlT537UuLl+kLVxaRLxnGeQX57BRWg21QPyl1/Z3uP3oFMvGN3OstnFDZs6rv5ekFsBNa8MPYz6y6TkkuwwlSvZpX0g4wATZcrzcJSJ2pNTCjrFTT/42ediBUMzAiQrrZD2hR/qw8LVJ4aZUKCcjp/lLj90nLdqJXrKZ30j7xj3dxZSa7pufbJlvRwfGCVg9Amt6oTLQ1UHTlTYYVYG2hlyTU3luKRvPgRtp7oGaStJItVtkH4jldjZx+ghlcwm/jcL3HpA8kTE786NRBtVuUAfAZ+rwnqWrcz4VbE04mVFVIkQbmPL911DnASgZwZIFEcVf6SkMl3Xbfk9IUnQt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(6486002)(71200400001)(66946007)(186003)(31686004)(2906002)(38100700002)(316002)(7416002)(508600001)(6506007)(54906003)(53546011)(26005)(6916009)(6512007)(66556008)(8936002)(31696002)(8676002)(76116006)(86362001)(66446008)(5660300002)(66476007)(83380400001)(4326008)(64756008)(91956017)(107886003)(122000001)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TTFWNmVzZytoTXVVN0NsUHpkS3dhY2NJRzdTdXB4VmtKTE91ZXhnS1VuMXh2?=
 =?utf-8?B?aHMwWTBxMDV1YVRXL3VVY1lsNURtS1JSelREMitBaHB4VktOMGp5RU1QN0ZO?=
 =?utf-8?B?eXh4bUQ3OTFCU0xGbW1SakMyYzdJdE8vcy9KSGlJN2tkSDNYOHI0MDBwWXpk?=
 =?utf-8?B?ai84UDVEZEIzVmhnbTNxeDc1c2dZZUpRZzNQSFpxVEFhUUROY0NIb05rOTdS?=
 =?utf-8?B?WGR5L0IxY0J6K0RlY2hkMGN1L0VRc2hKQ1doWFNpS2ZrNW5QNnV3SStiMmox?=
 =?utf-8?B?VTJrTkZjZk4yMVdDa2RjdkFkWHJWZHN3dzNtalNFbW5EUGxtNUZRckhaZzFx?=
 =?utf-8?B?b1ZZdHBUZ2xMc29BR21oZXRqMHVYbTE1UGd4dkx4cFJUKzBMaFR6UVRyajdp?=
 =?utf-8?B?NkdZL1hpRGJ5QXRpY2piaVpxc0Fpa2hVSTlyOHFnYWxDNm9VRTR3Q2dLTTBJ?=
 =?utf-8?B?TlZ6aFR0THdRaER2L0ZYRjNqdDc0L0I0eDdtUEM4RUp0Y3FBTGlPUHI3YVJj?=
 =?utf-8?B?S1Y2RVc5S2JsU2Y0c0laRm95Z0duamZNaWZvbk5CT3NuRUlSZkNuYkczQnRE?=
 =?utf-8?B?MVdnVWE4NUtUbjEzUjNTR0FXMTFadjBFVDFoTjJIYjU5aW9WVFVHT0h4NTFj?=
 =?utf-8?B?V1hkWDZCV25nMWczQmpPYk8xUWR4WFkxS3M2clVLVXBHeXN6M0Y3RDlIeHZU?=
 =?utf-8?B?ZkVBR2x2TC9nUEJHR093R2lXRVZOckRtMnlsa3lFd1E4OHJnWEY0YWlidHRN?=
 =?utf-8?B?Y2pId1FVbmV6N3hPYmdqM3BzNklGK21BQjcyUm5oZ2YrZEliTjZzQmF3Z1pN?=
 =?utf-8?B?c0VlQXYrMnYzTll6RHBvbDI2S2Ryd0NESWloVDJVNDhvSGFaL0ZZZzZ4V0d2?=
 =?utf-8?B?SWJsU3J2dzgxRlNRRkNQNWRnQjZrSGkrTDRPczI4K2dLNGxDd1R1enNPUEJl?=
 =?utf-8?B?ang5ZTUyUHhKYk5rTDhTWGFDazNkT3hXaG5vb2JCOFQ2QVlnOVlIREQwMGhS?=
 =?utf-8?B?NGRlZFhFV2c2cmkyWDNkTTVzZ3JudEd4TElMbmhhMlhZejQrZW5na25sVXEv?=
 =?utf-8?B?bG4zQmRKeUJ4cEM5RlBNQmhuZEdjaWpOcWplU0xXVEFaZHFRa3ExcXNXaVQ3?=
 =?utf-8?B?cmpObE5oNmpPdWhBUGl3NmI4cE5TaVdIN3oyNHIzbmF1a3N3dzdxQTF0U1FV?=
 =?utf-8?B?a1orbXFmZ0ZNcEIzZTh5Z20zMVZCSi95WHdpQUFoV3hEN1JwQUFsK0VpMHN0?=
 =?utf-8?B?ejlhVUhPRXQ4TUdXVnJvbVU4WmExVVJYMTRadzlxRnBqMTJ0Sk1WTTNSM3Rv?=
 =?utf-8?B?cXJEY0xOTm1pVTcxMVU1SlI2NzJsNVgreEJ2VTRWN1N3MkdEeS8vTmVLUlJX?=
 =?utf-8?B?UmFRZmljaEJuanR2bkQrVTBZeENEWElZd2xzb1c2blA2bm1sZk5IT2EzSFIr?=
 =?utf-8?B?c0xXRGc5S0Q0Q0txU1l6YUVzMDBxMFYydUlreEJoaDVySGJwb0prV2RHWGwv?=
 =?utf-8?B?UzZQK2hZYXhtZjB6S3kvenlSZGc5Q09Sc1FidXNsMVFaazRNa3JGVURGRktL?=
 =?utf-8?B?a3ZmNGQ2MSt5RHFRejVaTGFZYWVlaW5WN01XaTFVOGRMUS8wMWZrRU5tV2lj?=
 =?utf-8?B?b3lnZjNYaEZOaHlrY05LdlkrZjB2cGcyYTVUNDBMWUxWd1JwNE5IT1RRRmxQ?=
 =?utf-8?B?RTdqUGQ3UHlpYkFoV1JLK0s4SlJjNmtUK2FOVHJQVC9KTmJZd2RCbGp4TGNM?=
 =?utf-8?B?UFRoeE5EUXRwa3V2NlJ5bncxYzNoa2JZa2lDS2ZEYWZ3elNZWkdwTzFRV0FV?=
 =?utf-8?B?dTA3VFpzQythdS9HMzRzU0RwVFVGVWNkcjNsMGh1VHR0OWdCOHZtRys5Mi9v?=
 =?utf-8?B?T0I0ZVZqcmpRQkx2anNabUUrdnk2ZnJLNFJoTGxxM3B2TEtmc29zbk9mdUFX?=
 =?utf-8?B?cElpVEZucEpsaFNHNG96a1ZnQXdZc2U2dTlVbjlKNzVmSFVZOFhoOTNvQkt3?=
 =?utf-8?B?ZEdZMmRZZ3ViYXVUTFE2enhxR0ZaOGsraU85L3M3SmVtb3ovVmhrNVlLRGRl?=
 =?utf-8?B?Zi9DYjQzYzAvLzNkbi9PbUpRazBETUpmYjFPeWVDeW16WjVObkszUnNZTU5Z?=
 =?utf-8?B?MlJmZ200ZWhMa1NqbHExZG1sa1ZJd1NnTkxIZDBIWDh6RUZwaUlRSnp1K01u?=
 =?utf-8?B?MVMwT1VUQ1FtR0VyN2J0Nm1FV1phN2ZhOGQ5OHgwdGJwM0kyRGRpM2lRbjYx?=
 =?utf-8?B?dzNhaytOWDBLNGtzeTFzUEZIREw0T0RwRExjSkFORUQ0aUtPdGhocll1c1g4?=
 =?utf-8?B?Y09Cd2w5dHVrR3dBVkdlVGhqZnhTU2FVQmc4Y2VUWHVmYitJcFdYUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5376CC192A65B488A88F7E75EBD0B76@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0635d2f-8584-47aa-f84f-08d9aa70fc4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 08:54:09.3799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFhRwX2tmf+Pgimjdv9y/baE8o+EhswFn06PcPLPqml4rZowLZDcSUpUc4nFuT6TZDj6zcQ+mxqsEyZhd8BKmEPgZCgjYznR5re+ovEaRmA0heb1rqrePvDRcJT0PzYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5697
X-Proofpoint-ORIG-GUID: D9XOwTWYKYjgLA29ti3U8ZpEhsRfuQvY
X-Proofpoint-GUID: D9XOwTWYKYjgLA29ti3U8ZpEhsRfuQvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=939 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180052

DQoNCk9uIDE4LjExLjIxIDEwOjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAwODo0OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTcuMTEu
MjEgMTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IFdo
ZW4gYSB2UENJIGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmljZSBpdCBpcyBwb3NzaWJsZSB0aGF0
IHdlIGhhdmUNCj4+Pj4gc2NoZWR1bGVkIGEgZGVsYXllZCB3b3JrIGZvciBtYXAvdW5tYXAgb3Bl
cmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+Pj4+IEZvciBleGFtcGxlLCB0aGUgZm9sbG93aW5n
IHNjZW5hcmlvIGNhbiBpbGx1c3RyYXRlIHRoZSBwcm9ibGVtOg0KPj4+Pg0KPj4+PiBwY2lfcGh5
c2Rldl9vcA0KPj4+PiAgICAgIHBjaV9hZGRfZGV2aWNlDQo+Pj4+ICAgICAgICAgIGluaXRfYmFy
cyAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9T
T0ZUSVJRKQ0KPj4+PiAgICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4+Pj4gICAgICB2
cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+Pj4NCj4+Pj4gbGVhdmVf
aHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+PiAgICAgIHZwY2lfcHJvY2Vzc19wZW5kaW5nOiB2LT52
cGNpLm1lbSAhPSBOVUxMOyB2LT52cGNpLnBkZXYtPnZwY2kgPT0gTlVMTA0KPj4+Pg0KPj4+PiBG
b3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB3ZSBjb250aW51ZSBleGVjdXRpb24gYXMgdGhlIHdvcnNl
IHRoYXQNCj4+Pj4gY291bGQgaGFwcGVuIGlzIHRoYXQgTU1JTyBtYXBwaW5ncyBhcmUgbGVmdCBp
biBwbGFjZSB3aGVuIHRoZQ0KPj4+PiBkZXZpY2UgaGFzIGJlZW4gZGVhc3NpZ25lZA0KPj4+Pg0K
Pj4+PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFpbnMgdGhhdCBnZXQgYSBmYWlsdXJlIGluIHRoZSBt
aWRkbGUgb2YgYSB2UENJDQo+Pj4+IHt1bn1tYXAgb3BlcmF0aW9uIHdlIG5lZWQgdG8gZGVzdHJv
eSB0aGVtLCBhcyB3ZSBkb24ndCBrbm93IGluIHdoaWNoDQo+Pj4+IHN0YXRlIHRoZSBwMm0gaXMu
IFRoaXMgY2FuIG9ubHkgaGFwcGVuIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGZvcg0KPj4+PiBE
b21VcyBhcyB0aGV5IHdvbid0IGJlIGFsbG93ZWQgdG8gY2FsbCBwY2lfYWRkX2RldmljZS4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUgbW9y
ZSwgSSdtIG5vdCBjb252aW5jZWQgYW55IG9mIHRoaXMgaXMgcmVhbGx5DQo+Pj4gbmVlZGVkIGlu
IHRoZSBwcmVzZW50ZWQgZm9ybS4NCj4+IFRoZSBpbnRlbnRpb24gb2YgdGhpcyBwYXRjaCB3YXMg
dG8gaGFuZGxlIGVycm9yIGNvbmRpdGlvbnMgd2hpY2ggYXJlDQo+PiBhYm5vcm1hbCwgZS5nLiB3
aGVuIGlvbW11X2FkZF9kZXZpY2UgZmFpbHMgYW5kIHdlIGFyZSBpbiB0aGUgbWlkZGxlDQo+PiBv
ZiBpbml0aWFsaXphdGlvbi4gU28sIEkgYW0gdHJ5aW5nIHRvIGNhbmNlbCBhbGwgcGVuZGluZyB3
b3JrIHdoaWNoIG1pZ2h0DQo+PiBhbHJlYWR5IGJlIHRoZXJlIGFuZCBub3QgdG8gY3Jhc2guDQo+
IE9ubHkgRG9tMCBtYXkgYmUgYWJsZSB0byBwcmVtYXR1cmVseSBhY2Nlc3MgdGhlIGRldmljZSBk
dXJpbmcgImFkZCIuDQo+IFlldCB1bmxpa2UgZm9yIERvbVUtcyB3ZSBnZW5lcmFsbHkgZXhwZWN0
IERvbTAgdG8gYmUgd2VsbC1iZWhhdmVkLg0KPiBIZW5jZSBJJ20gbm90IHN1cmUgSSBzZWUgdGhl
IG5lZWQgZm9yIGRlYWxpbmcgd2l0aCB0aGVzZS4NClByb2JhYmx5IEkgZG9uJ3QgZm9sbG93IHlv
dSBoZXJlLiBUaGUgaXNzdWUgSSBhbSBmYWNpbmcgaXMgRG9tMA0KcmVsYXRlZCwgZS5nLiBYZW4g
d2FzIG5vdCBhYmxlIHRvIGluaXRpYWxpemUgZHVyaW5nICJhZGQiIGFuZCB0aHVzDQp3YW50ZWQg
dG8gY2xlYW4gdXAgdGhlIGxlZnRvdmVycy4gQXMgdGhlIHJlc3VsdCB0aGUgYWxyZWFkeQ0Kc2No
ZWR1bGVkIHdvcmsgY3Jhc2hlcyBhcyBpdCB3YXMgbm90IG5laXRoZXIgY2FuY2VsZWQgbm9yIGlu
dGVycnVwdGVkDQppbiBzb21lIHNhZmUgbWFubmVyLiBTbywgdGhpcyBzb3VuZHMgbGlrZSBzb21l
dGhpbmcgd2UgbmVlZCB0byB0YWtlDQpjYXJlIG9mLCB0aHVzIHRoaXMgcGF0Y2guDQoNCkFub3Ro
ZXIgc3RvcnksIHdoaWNoIEkgYW0gZ2V0dGluZyBtb3JlIGNvbnZpbmNlZCBub3csIGlzIHRoYXQN
CnRoZSBwcm9wZXIgbG9ja2luZyBzaG91bGQgYmUgYSBkZWRpY2F0ZWQgcGF0Y2ggYXMgaXQgc2hv
dWxkIG5vdCBvbmx5DQphZGQgbG9ja3MgYXMgcmVxdWlyZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGFs
c28gcHJvYmFibHkgcmV2aXNpdCB0aGUNCmV4aXN0aW5nIGxvY2tpbmcgc2NoZW1lcyB0byBiZSBh
Y2NlcHRhYmxlIGZvciBuZXcgdXNlLWNhc2VzLg0KPg0KPj4+ICAgIFJlbW92YWwgb2YgYSB2UENJ
IGRldmljZSBpcyB0aGUgYW5hbG9ndWUNCj4+PiBvZiBob3QtdW5wbHVnIG9uIGJhcmVtZXRhbC4g
VGhhdCdzIG5vdCBhICJiZWhpbmQgdGhlIGJhY2tzIG9mDQo+Pj4gZXZlcnl0aGluZyIgb3BlcmF0
aW9uLiBJbnN0ZWFkIHRoZSBob3N0IGFkbWluIGhhcyB0byBwcmVwYXJlIHRoZQ0KPj4+IGRldmlj
ZSBmb3IgcmVtb3ZhbCwgd2hpY2ggd2lsbCByZXN1bHQgaW4gaXQgYmVpbmcgcXVpZXNjZW50ICh3
aGljaCBpbg0KPj4+IHBhcnRpY3VsYXIgbWVhbnMgbm8gQkFSIGFkanVzdG1lbnRzIGFueW1vcmUp
LiBUaGUgYWN0IG9mIHJlbW92aW5nIHRoZQ0KPj4+IGRldmljZSBmcm9tIHRoZSBzeXN0ZW0gaGFz
IGFzIGl0cyB2aXJ0dWFsIGNvdW50ZXJwYXJ0ICJ4bCBwY2ktZGV0YWNoIi4NCj4+PiBJIHRoaW5r
IGl0IG91Z2h0IHRvIGJlIGluIHRoaXMgY29udGV4dCB3aGVuIHBlbmRpbmcgcmVxdWVzdHMgZ2V0
DQo+Pj4gZHJhaW5lZCwgYW5kIGFuIGluZGljYXRvciBiZSBzZXQgdGhhdCBubyBmdXJ0aGVyIGNo
YW5nZXMgdG8gdGhhdA0KPj4+IGRldmljZSBhcmUgcGVybWl0dGVkLiBUaGlzIHdvdWxkIG1lYW4g
aW52b2tpbmcgZnJvbQ0KPj4+IHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkgYXMgYWRkZWQgYnkgcGF0
Y2ggNCwgbm90IGZyb20NCj4+PiB2cGNpX3JlbW92ZV9kZXZpY2UoKS4gVGhpcyB3b3VsZCB5aWVs
ZCByZW1vdmFsIG9mIGEgZGV2aWNlIGZyb20gdGhlDQo+Pj4gaG9zdCBiZWluZyBpbmRlcGVuZGVu
dCBvZiByZW1vdmFsIG9mIGEgZGV2aWNlIGZyb20gYSBndWVzdC4NCj4+Pg0KPj4+IFRoZSBuZWVk
IGZvciB2cGNpX3JlbW92ZV9kZXZpY2UoKSBzZWVtcyBxdWVzdGlvbmFibGUgaW4gdGhlIGZpcnN0
DQo+Pj4gcGxhY2U6IEV2ZW4gZm9yIGhvdC11bnBsdWcgb24gdGhlIGhvc3QgaXQgbWF5IGJlIGJl
dHRlciB0byByZXF1aXJlIGENCj4+PiBwY2ktZGV0YWNoIGZyb20gKFBWSCkgRG9tMCBiZWZvcmUg
dGhlIGFjdHVhbCBkZXZpY2UgcmVtb3ZhbC4gVGhpcw0KPj4+IHdvdWxkIGludm9sdmUgYW4gYWRq
dXN0bWVudCB0byB0aGUgZGUtYXNzaWdubWVudCBsb2dpYyBmb3IgdGhlIGNhc2UNCj4+PiBvZiBu
byBxdWFyYW50aW5pbmc6IFdlJ2QgbmVlZCB0byBtYWtlIHN1cmUgZXhwbGljaXQgZGUtYXNzaWdu
bWVudA0KPj4+IGZyb20gRG9tMCBhY3R1YWxseSByZW1vdmVzIHRoZSBkZXZpY2UgZnJvbSB0aGVy
ZTsgcmlnaHQgbm93DQo+Pj4gZGUtYXNzaWdubWVudCBhc3N1bWVzICJmcm9tIERvbVUiIGFuZCAi
dG8gRG9tMCBvciBEb21JTyIgKGRlcGVuZGluZw0KPj4+IG9uIHF1YXJhbnRpbmluZyBtb2RlKS4N
Cj4gQXMgdG8gdGhpcywgSSBtZWFud2hpbGUgdGhpbmsgdGhhdCBhZGQvcmVtb3ZlIGNhbiB2ZXJ5
IHdlbGwgaGF2ZSBEb20wDQo+IHJlbGF0ZWQgdlBDSSBpbml0L3RlYXJkb3duLiBCdXQgZm9yIERv
bVUgYWxsIG9mIHRoYXQgc2hvdWxkIGhhcHBlbg0KPiBkdXJpbmcgYXNzaWduL2RlLWFzc2lnbi4N
ClllcywgSSBhZ3JlZS4gVGhlIG1vZGVsIEkgYWxzbyBzZWUgaXM6DQotIGZvciBEb20wIHdlIHVz
ZSBhZGQvcmVtb3ZlDQotIGZvciBEb21VcyB3ZSB1c2UgYXNzaWduL2RlLWFzc2lnbg0KPiAgIEEg
ZGV2aWNlIHN0aWxsIGFzc2lnbmVkIHRvIGEgRG9tVSBzaW1wbHkNCj4gc2hvdWxkIG5ldmVyIGJl
IHN1YmplY3QgdG8gcGh5c2ljYWwgaG90LXVucGx1ZyBpbiB0aGUgZmlyc3QgcGxhY2UuDQpEb3Vi
bGUgdGhhdA0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

