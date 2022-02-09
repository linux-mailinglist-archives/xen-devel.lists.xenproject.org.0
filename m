Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E364AF6EE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 17:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269368.463430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHpzZ-0005hx-65; Wed, 09 Feb 2022 16:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269368.463430; Wed, 09 Feb 2022 16:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHpzZ-0005g8-2v; Wed, 09 Feb 2022 16:38:53 +0000
Received: by outflank-mailman (input) for mailman id 269368;
 Wed, 09 Feb 2022 16:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GcOB=SY=epam.com=prvs=403937fcac=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1nHpzW-0005fy-GI
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 16:38:50 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfcb37b3-89c6-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 17:38:46 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219GNSKf014823;
 Wed, 9 Feb 2022 16:38:40 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e4gqk85vv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 16:38:39 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM6PR03MB5847.eurprd03.prod.outlook.com (2603:10a6:20b:e6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 16:38:35 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 16:38:35 +0000
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
X-Inumbo-ID: bfcb37b3-89c6-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frAVRGxF4aA4A+s6t3Qr4VS74twH8ZC4Pli36C+eMowVZ3SpkAQ03yFqeEZLhwkTq+pFqpLAgOdt4+UnIArnvytGU0j6xGWj0SekYLUDX42x3hz+V9A2+R7D4aUxHjWBb2UDAHDhf2m+H6CaDjCCm5rrGOxPaWwLegUcXoxe8z0DdjjdueRuIeh+e7Hh/EP3WLdJW5gW65/Nhe6xAZXKWnJwZTLMPTSXq9mZy0Co0xqOhJrB6Lz/qpCePnscZ+PI+nj1UP2B8m4HHVuTYQGOzjjYe/6KXyhLYGsK4acAVzEPT9iZ5frQv966nU0ZdXLnE8AeDi2fdr6l8o1VGY2eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gtlfx1xBURgUuVIVo8bhW2XNcBjeQcIWS44T0Hq2N+w=;
 b=aN1y21XBcBZMds5siinQDlSaUQKJG6U4JWOzvUi4NT4qaf0dq80ieg3owguKJsQfZp2cMCB3YNv4oq+2flngAaV/EFPrTyUV5zrW/a7qbnoGzXzb4rvdrsuj9fpurRgrRWo9FKndZd4GK8AXIjt3bSemj8+3YWY5vH7nqieI0gQpB2OPWnaQmBiJBgt2eScq2FyIUvYk6HtysJ7y0sWTnwbCJ5Mks5kLabuhtZ7HHHUH2H9awN+HazBgZ4Xpm2SNrkBoBWtv31fcihqJTJAUWbZLvG5Q4PFa6sIs9jOJIgnTI323u6edhXfllYc3aH2cFarxxEuwEkIVRlxKozigdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtlfx1xBURgUuVIVo8bhW2XNcBjeQcIWS44T0Hq2N+w=;
 b=mo02eEcReWqCJnu8LWsCeeugfwZgtPdW1lGhstWsuOkXApzr00FxH1/KKHci8tXAwF3mtsidLKFNUDzXpiiP96M+PjJCkqyR6UbUMcOwhg/dWWx3CYrDMwOwikBJn75IURXtS7i41UVbP4AHZnkcJTN6W3K+GUXwz7yHGIAScs9AKJm1ZM0m4TTD5CDOslOl7fv+hH6KoXT2f5sMocovw/BlGlmgK15Zth9VHxNF7d0RbDdR+qbaB2u/jHCNjNeFkfw8y0CJF5rWhySPrKzBNPpuppxAgbClRieLpY8HyymjpEKO8Fce1YQF6FVUeczK73546YPljTlNjDNnfeoTaQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bob Eshleman
	<bobbyeshleman@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Thread-Topic: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Index: 
 AQHYAomKM/4d8JNsdEqc8nNA4dib2KyIh6IAgAAs1wCAAQzHgIAADcoAgAFl0gCAAA+ugIAAXVgA
Date: Wed, 9 Feb 2022 16:38:35 +0000
Message-ID: <4a928360-b901-09c0-7a65-72abaa506706@epam.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <3629d57d-6d89-5ada-1664-cd532342fd0b@suse.com>
 <d42f0e9f-d60d-8ec4-7053-9ecd1a069925@epam.com>
 <7f81a991-b66c-41cd-5f0c-1f121446ee1b@suse.com>
In-Reply-To: <7f81a991-b66c-41cd-5f0c-1f121446ee1b@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5075fbd-4a9d-46c7-1d07-08d9ebea9ddd
x-ms-traffictypediagnostic: AM6PR03MB5847:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB5847C7319686E935B5856FAF862E9@AM6PR03MB5847.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iygKAaOzF6cds29dTRchoizfvGmpEA9PLFOZ1yoxIaG7zT7jNS6OODCHpaegKrXun0Xeo/8D5ooTc4aRmJ1wVZMoWQfyaT9rH4r+hrraY/SAwcEP7MTfVTNaGZKoXQKBL5b9fB+73Xs1AuE04HErK37jEZgN7yNn0ya/QL1LLCg7bfQrXlivIjrEzKKY4rtNtz4BmRFd9aDyFnqnyQmV0pQQj0KUFyU0Ci02M5pJTy0+J3FKSMUhjGQ18j3bbOgpW/CLKraCTR85COrin85+ZklqEdADprviYE69fy00m6ZZSh55NDh3yhR9EemoDHg++u9AD5vS6AkfURh/8fzWLNr9pvYSSpuWEXNMSmGDBLQ8stHFz30oi2y3A9YtRtGgu8Y00vxpIB9T5jGoEsnTM/19bJ+11mpglByo3V+IoSYVC6GRaEhR9+lwv1HDnYIrHxmi6n4pXn2zD9Hz7onl9Px/c21SZIW+MvA/0Dj+vp85unSl1uVFPxel9TYGO5xO9SF2gLgPlYyVJr0PPGJxLMAurM4HpYf++CMebPF7DEoKfb+W9N0oC7nj63dn1ju3Q54F0vqnwleBzbXFKvsmX40RuxohSmRW5xGCXFhZgys30z/bGWg9Xcuo9Yzc4JRTsDuy9xzfe3SNji+GUdrcXiZcam6ogG/dZNDo2riUkL/0abz20dYAYqsxOXntbn7aMTHCfMDO8XG5Eu2WbGw5bDAzPzyvoi9A1weQLosHEqkD7GlFe8LjLCW1D26HjUyR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(26005)(54906003)(71200400001)(186003)(6486002)(91956017)(316002)(508600001)(86362001)(66556008)(8676002)(4326008)(66476007)(66946007)(76116006)(6916009)(66446008)(64756008)(7416002)(38070700005)(5660300002)(2616005)(8936002)(2906002)(31686004)(122000001)(6512007)(55236004)(36756003)(6506007)(53546011)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?enhkeXZSK0ZGTXFPS3p4Zyt4RngrTit3SXQwQ0lubXo5OEg5WHhjbVBGTUpF?=
 =?utf-8?B?Mkl3b0VoSldpUm01VjQ2MUJNQ2xEUjdOV3JHQzZObVJyNjR1VitKbnBDWE82?=
 =?utf-8?B?bE5VOTJSejU5MDQxeWd5TW9VR0pQQ045U0NHWmNvQ1A0MkRaZGFPOTZOaU5Q?=
 =?utf-8?B?WDZSbEpGdVlHYkU3YnFMN3EvcFI0SU03VVZ5NmFORXg0MWMxSCtZcy9UL1Q2?=
 =?utf-8?B?OWFjS1ZFWTdEZlE0V1c2MU5DVG1aRkVLbWkzUzYxcjJSR3h0d2poMFdxbksy?=
 =?utf-8?B?S0YwbFMrR0MxVWhueW9wSzRaSTZ0a0swN0hxcDFodjNBOWdwKzdhNnlGYjlO?=
 =?utf-8?B?ZmhtYWxGVkFXY0c1Q0dyZ0YycVRtVlRvWW04QytLMElzNHd6YnFTNUovMXJ0?=
 =?utf-8?B?VHU1TEJtKzkxY250dksrZkZ3ejR3UEI0T21WYkUwVUV5c1podVltUllCWEpY?=
 =?utf-8?B?UTFPdVkwREFMYnI0dlFpYWhOTDQwc2JRekN0c0xVQk9iQWdab3lUckdrTjZQ?=
 =?utf-8?B?OWIybUR5eTdCQ0greU10U3hoRXV1eWx5THQ0WFNab2NqK2hNZ1NJSGg5MDBu?=
 =?utf-8?B?Q1BLRk1iYU1BRFVyOG9IWGJlMzdobVBwMTRYZnFWM0doTlgrZzI3TFZMNUxJ?=
 =?utf-8?B?WW1CR2kveVR1bjBUS0VPQStFSXlRaHNSL2pmMW0wZ2RoQVIwOWN0TmVqNmJo?=
 =?utf-8?B?T0N1ZmxtNldVVTc3dTk5S3lsa2l0T3ZPM2p6MnQ1VmhoY0Z0YkFBdDZhNDZQ?=
 =?utf-8?B?eStoZHEwZnJoK0FpSUZxZ2FZTVV5b3ZOSjdvZHB0Q3VLR1lJMVdKMGtjNE5a?=
 =?utf-8?B?S3JoYit0RkNKSXUvSXd5Q2lFeHBOaGxISHlnanRaRVBUQlIxendRSUpVZ3Ey?=
 =?utf-8?B?dER0RlR0U0dFdkZsMVdwdWtjV3FJdUozczI2eE1EMGI1UTAyY2lPVmVaczlh?=
 =?utf-8?B?VXFKQXN1WTFXZEtTQTZBMlI2R3pPWnVqdDBvcnZhRVFhb2pkSG5UaDJpbFpO?=
 =?utf-8?B?WkhacVpsTWNNNHVMWWZuOHZKVURPMlp3Q0NJSUNYU2ZybFJMaVpDcTN4NTZD?=
 =?utf-8?B?VGpFZjc0b3FYUTh2Z0hpVmdMd25IMnN6N1VyWlNBT0VkRjZCa3hEN3dWN01j?=
 =?utf-8?B?UVBsdEJZYyt4WTJPRGY4bFNJNThxdDZ6OGFJYVF3RHRFYU5pSHllMDNsdGpp?=
 =?utf-8?B?Ky9jVW82ZDh1NExFK2hsTUlDbnpzTmlqZXdhcWc1bE9qTFlSN2pHUHR5S09r?=
 =?utf-8?B?c0JQc0NvUlN5QXRBd20vOHBwbm1tZWhRWHpPLzlHMmE2NFJlRDRQL2NxWU9O?=
 =?utf-8?B?czdrdGdrRjlJanRabzBMbDQvOHRSTzZsS1NxQ1BYOUduUHlZalhWVlI1NGcv?=
 =?utf-8?B?bW5kZDlTTGFRZDdraFNZZDZBNG9jWlJSbzZXbTREYlI4eG93dVk0dHVJcU5i?=
 =?utf-8?B?Rm9od001bnNxeG9UVXR6YmkyOHJhQVhFRUdFYWkzMXRQdnczc25xU245eE5N?=
 =?utf-8?B?eVlLb3o1L3FaaHZoeUhjL3ZNY1RiVWJSOTNLZHJPaVdNRXRVMVdxZ0JDT21N?=
 =?utf-8?B?UVNlblpMREpRTTJWa1NLZjlTUHhoMlBQVVpQSk5lVXdYRXI3YnR5MENOWWFv?=
 =?utf-8?B?VXpFN1NHU1BaSk1tWFZVdklYSjhERm1PM0x6OEFud0dQU0xOWTU5SHRFekdv?=
 =?utf-8?B?NmdsbjFuNCtSYzR1aUJLMjY3d21wSzQza1BqelV4aHQwanlLcnVyaFFCajVp?=
 =?utf-8?B?aTNvM1lveFRYLytoQm5pTnRPM015dzNCNHVqSDBKNmlwd2YrNmF3OHZaUTlD?=
 =?utf-8?B?clVwV2loVGU2Ym85WW0xVllLa3dTbll1ZTN2TzU1RWtBNDcvV2pRUTBmdHVX?=
 =?utf-8?B?V21pSStjYytLNHJZSmRZSzRyY1NwME1hUUxiUFdQdk9TbVcvVmdYaENnUHFF?=
 =?utf-8?B?bkdqdEpHT3EzNFBQTzFHV3czeVpvdjZjUFlWNW5VZHBGUnFpNkxDL0J4WjRt?=
 =?utf-8?B?V1k3a29OMXNmTEp2bHljcEhIYU9mSXhFU0xKYkZaUTBEeldVTEU1YWFSV2tP?=
 =?utf-8?B?WEJrT0UwVUF1cXVrTEwrWlFwOHJOU0p1YzNSb0pkNnpydWdCSEVpVHhtMC9I?=
 =?utf-8?B?b0lvaWpZMExHb2REQkJ6MjhlcGQrV1IyL1lodDJtVEJtemRuQ0ZLUmt1dXJ6?=
 =?utf-8?B?UlpRbC9qUi96a1RXUWYvNmIraTlXQmRCQUY1ZGovNXFwNjZPWE9qYk4wZkJz?=
 =?utf-8?Q?8x1NDqHV+4zfYZeVIboD8czfh7zvO5NAuXaxVYgaPk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B8E5887C911C44085812081179BE23E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5075fbd-4a9d-46c7-1d07-08d9ebea9ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 16:38:35.2399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSS6FmUq615qvp7thBl1BYWJcfNIG2hCHBN0tXr+AUgp2/TqPyq2nF1ZjhMyNYwEYd659IZHuY56wfQUpvHlq2p2OQhi6GnnB6tF4rW70dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5847
X-Proofpoint-GUID: kSD05whxu_afVBlbMnEH-NlsbZAS9mtN
X-Proofpoint-ORIG-GUID: kSD05whxu_afVBlbMnEH-NlsbZAS9mtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_08,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090091

DQpPbiAwOS4wMi4yMiAxMzowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQoNCg0KSGkgSmFuDQoNCj4g
T24gMDkuMDIuMjAyMiAxMTowOCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBPbiAw
OC4wMi4yMiAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pg0KPj4NCj4+IEhpIEp1bGllbiwg
SmFuDQo+Pg0KPj4NCj4+PiBPbiAwOC4wMi4yMDIyIDEyOjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pj4+IE9uIDA3LzAyLzIwMjIgMTk6NTYsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0K
Pj4+Pj4gT24gMDcuMDIuMjIgMTk6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+PiBIaSBP
bGVrc2FuZHIsDQo+Pj4+Pj4gT24gMDUvMDEvMjAyMiAyMzoxMSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gUmV3b3JrIEFybSBpbXBsZW1l
bnRhdGlvbiB0byBzdG9yZSBncmFudCB0YWJsZSBmcmFtZSBHRk4NCj4+Pj4+Pj4gaW4gc3RydWN0
IHBhZ2VfaW5mbyBkaXJlY3RseSBpbnN0ZWFkIG9mIGtlZXBpbmcgaXQgaW4NCj4+Pj4+Pj4gc3Rh
bmRhbG9uZSBzdGF0dXMvc2hhcmVkIGFycmF5cy4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbg0KPj4+
Pj4+PiB0aGUgYXNzdW1wdGlvbiB0aGF0IGdyYW50IHRhYmxlIHBhZ2UgaXMgdGhlIHhlbmhlYXAg
cGFnZS4NCj4+Pj4+PiBJIHdvdWxkIHdyaXRlICJncmFudCB0YWJsZSBwYWdlcyBhcmUgeGVuaGVh
cCBwYWdlcyIgb3IgImEgZ3JhbnQgdGFibGUNCj4+Pj4+PiBwYWdlIGlzIGEgeGVuaGVhcCBwYWdl
Ii4NCj4+Pj4+Pg0KPj4+Pj4+IFsuLi5dDQo+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQo+Pj4+Pj4+IGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2dyYW50X3RhYmxlLmgNCj4+Pj4+Pj4gaW5kZXggZDMxYTRkNi4uZDZm
ZGEzMSAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dyYW50
X3RhYmxlLmgNCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dyYW50X3Rh
YmxlLmgNCj4+Pj4+Pj4gQEAgLTExLDExICsxMSw2IEBADQo+Pj4+Pj4+ICAgIMKgICNkZWZpbmUg
SU5JVElBTF9OUl9HUkFOVF9GUkFNRVMgMVUNCj4+Pj4+Pj4gICAgwqAgI2RlZmluZSBHTlRUQUJf
TUFYX1ZFUlNJT04gMQ0KPj4+Pj4+PiAgICDCoCAtc3RydWN0IGdyYW50X3RhYmxlX2FyY2ggew0K
Pj4+Pj4+PiAtwqDCoMKgIGdmbl90ICpzaGFyZWRfZ2ZuOw0KPj4+Pj4+PiAtwqDCoMKgIGdmbl90
ICpzdGF0dXNfZ2ZuOw0KPj4+Pj4+PiAtfTsNCj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAgICDCoCBzdGF0
aWMgaW5saW5lIHZvaWQgZ250dGFiX2NsZWFyX2ZsYWdzKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+
Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWFzaywgdWludDE2X3QN
Cj4+Pj4+Pj4gKmFkZHIpDQo+Pj4+Pj4+ICAgIMKgIHsNCj4+Pj4+Pj4gQEAgLTQ2LDQxICs0MSwx
MiBAQCBpbnQgcmVwbGFjZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZw0KPj4+Pj4+
PiBncGFkZHIsIG1mbl90IG1mbiwNCj4+Pj4+Pj4gICAgwqAgI2RlZmluZSBnbnR0YWJfZG9tMF9m
cmFtZXMoKSBcDQo+Pj4+Pj4+ICAgIMKgwqDCoMKgwqAgbWluX3QodW5zaWduZWQgaW50LCBvcHRf
bWF4X2dyYW50X2ZyYW1lcywgUEZOX0RPV04oX2V0ZXh0IC0NCj4+Pj4+Pj4gX3N0ZXh0KSkNCj4+
Pj4+Pj4gICAgwqAgLSNkZWZpbmUgZ250dGFiX2luaXRfYXJjaChndCkgXA0KPj4+Pj4+PiAtKHsg
XA0KPj4+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGludCBuZ2ZfID0NCj4+Pj4+Pj4gKGd0KS0+bWF4
X2dyYW50X2ZyYW1lczvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcDQo+Pj4+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IG5zZl8gPQ0KPj4+Pj4+PiBn
cmFudF90b19zdGF0dXNfZnJhbWVzKG5nZl8pO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwNCj4+Pj4+Pj4gLSBcDQo+Pj4+Pj4+IC3CoMKgwqAgKGd0KS0+YXJjaC5zaGFy
ZWRfZ2ZuID0geG1hbGxvY19hcnJheShnZm5fdCwNCj4+Pj4+Pj4gbmdmXyk7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+Pj4+IC3CoMKgwqAgKGd0KS0+YXJjaC5zdGF0
dXNfZ2ZuID0geG1hbGxvY19hcnJheShnZm5fdCwNCj4+Pj4+Pj4gbnNmXyk7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+Pj4+IC3CoMKgwqAgaWYgKCAoZ3QpLT5hcmNo
LnNoYXJlZF9nZm4gJiYgKGd0KS0+YXJjaC5zdGF0dXNfZ2ZuDQo+Pj4+Pj4+ICnCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+PiAtIHsgXA0KPj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgd2hpbGUgKCBuZ2ZfLS0NCj4+Pj4+Pj4gKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChndCktPmFy
Y2guc2hhcmVkX2dmbltuZ2ZfXSA9DQo+Pj4+Pj4+IElOVkFMSURfR0ZOO8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB3aGlsZSAo
IG5zZl8tLQ0KPj4+Pj4+PiApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGd0KS0+YXJjaC5zdGF0dXNfZ2Zu
W25zZl9dID0NCj4+Pj4+Pj4gSU5WQUxJRF9HRk47wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwNCj4+Pj4+Pj4gLSB9IFwNCj4+Pj4+Pj4gLSBlbHNlIFwNCj4+Pj4+Pj4gLSBn
bnR0YWJfZGVzdHJveV9hcmNoKGd0KTsgXA0KPj4+Pj4+PiAtwqDCoMKgIChndCktPmFyY2guc2hh
cmVkX2dmbiA/IDAgOg0KPj4+Pj4+PiAtRU5PTUVNO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+PiAtfSkNCj4+
Pj4+Pj4gLQ0KPj4+Pj4+PiAtI2RlZmluZSBnbnR0YWJfZGVzdHJveV9hcmNoKGd0KSBcDQo+Pj4+
Pj4+IC3CoMKgwqAgZG8geyBcDQo+Pj4+Pj4+IC0gWEZSRUUoKGd0KS0+YXJjaC5zaGFyZWRfZ2Zu
KTsgXA0KPj4+Pj4+PiAtIFhGUkVFKChndCktPmFyY2guc3RhdHVzX2dmbik7IFwNCj4+Pj4+Pj4g
LcKgwqDCoCB9IHdoaWxlICggMCApDQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gICAgwqAgI2RlZmluZSBn
bnR0YWJfc2V0X2ZyYW1lX2dmbihndCwgc3QsIGlkeCwgZ2ZuLA0KPj4+Pj4+PiBtZm4pwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+Pj4gKHsgXA0KPj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaW50IHJjXyA9DQo+Pj4+Pj4+IDA7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+PiAgICDCoMKgwqDCoMKg
wqDCoMKgwqAgZ2ZuX3Qgb2dmbiA9IGdudHRhYl9nZXRfZnJhbWVfZ2ZuKGd0LCBzdCwNCj4+Pj4+
Pj4gaWR4KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIGlmICggZ2ZuX2VxKG9nZm4sIElOVkFMSURfR0ZOKSB8fCBnZm5fZXEob2dm
biwgZ2ZuKQ0KPj4+Pj4+PiB8fMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAocmNfID0gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSgoZ3Qp
LT5kb21haW4sIG9nZm4sDQo+Pj4+Pj4+IG1mbizCoMKgIFwNCj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKSkgPT0gMA0KPj4+Pj4+PiApwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoKHN0
KSA/DQo+Pj4+Pj4+IChndCktPmFyY2guc3RhdHVzX2dmbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAoZ3QpLT5hcmNoLnNoYXJlZF9nZm4pW2lk
eF0gPQ0KPj4+Pj4+PiAoZ2ZuKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+
Pj4+Pj4+IC0gcmNfOyBcDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAoIWdmbl9lcShvZ2ZuLCBJ
TlZBTElEX0dGTikgJiYgIWdmbl9lcShvZ2ZuLA0KPj4+Pj4+PiBnZm4pKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCA/IGd1ZXN0X3BoeXNt
YXBfcmVtb3ZlX3BhZ2UoKGd0KS0+ZG9tYWluLCBvZ2ZuLCBtZm4sDQo+Pj4+Pj4+IDApwqDCoMKg
wqDCoMKgwqDCoCBcDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgIDoNCj4+Pj4+Pj4gMDvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+Pj4+PiBHaXZlbiB0aGF0IHdlIGFyZSBpbXBsZW1lbnRpbmcgc29tZXRoaW5nIHNpbWls
YXIgdG8gYW4gTTJQLCBJIHdhcw0KPj4+Pj4+IGV4cGVjdGluZyB0aGUgaW1wbGVtZW50YXRpb24g
dG8gYmUgcHJldHR5IG11Y2ggdGhlIHNhbWUgYXMgdGhlIHg4Ng0KPj4+Pj4+IGhlbHBlci4NCj4+
Pj4+Pg0KPj4+Pj4+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIG91dGxpbmUgd2h5IGl0IGlzIGRpZmZl
cmVudD8NCj4+Pj4+IEJlaW5nIGhvbmVzdCwgSSBkaWRuJ3QgdGhpbmsgYWJvdXQgaXQgc28gZmFy
LsKgIEJ1dCwgSSBhZ3JlZSB3aXRoIHRoZQ0KPj4+Pj4gcXVlc3Rpb24uDQo+Pj4+Pg0KPj4+Pj4g
SXQgZmVlbHMgdG8gbWUgdGhhdCBBcm0gdmFyaWFudCBjYW4gbm93IGJlaGF2ZSBhcyB4ODYgb25l
IChhcw0KPj4+Pj4geGVubWVtX2FkZF90b19waHlzbWFwX29uZSgpIG5vdyBjaGVja3MgZm9yIHRo
ZSBwcmlvciBtYXBwaW5nKSwgSSBtZWFuIHRvDQo+Pj4+PiB1c2UgSU5WQUxJRF9HRk4gYXMgYW4g
aW5kaWNhdGlvbiB0byByZW1vdmUgYSBwYWdlLg0KPj4+Pj4NCj4+Pj4+IFdoYXQgZG8geW91IHRo
aW5rPw0KPj4+PiBJIHdpbGwgZGVmZXIgdGhhdCB0byBKYW4uDQo+Pj4+DQo+Pj4+IEphbiwgSUlS
QyB5b3Ugd2VyZSB0aGUgb25lIGludHJvZHVjaW5nIHRoZSBjYWxsIHRvDQo+Pj4+IGd1ZXN0X3Bo
eXNtYXBfcmVtb3ZlX3BhZ2UoKS4gRG8geW91IHJlbWVtYmVyIHdoeSB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuDQo+Pj4+IHg4NiBhbmQgQXJtIHdlcmUgbmVjZXNzYXJ5Pw0KPj4+IFRoZSBjb2RlIHdh
cyBkaWZmZXJlbnQgYmVmb3JlLCBhbmQgQXJtJ3MgYmVoYXZpb3Igd2FzIGFsc28gZGlmZmVyZW50
Lg0KPj4+IEhlbmNlIHRoZSB0d28gZnVuY3Rpb25zIGNvdWxkbid0IGJlIHF1aXRlIHNpbWlsYXIu
IElmIEFybSBiZWhhdmlvciBpcw0KPj4+IG5vdyBjb252ZXJnaW5nIHdpdGggeDg2J2VzLCB0aGUg
ZnVuY3Rpb25zIGJlY29taW5nIG1vcmUgc2ltaWxhciBpcw0KPj4+IG5vdCBlbnRpcmVseSB1bmV4
cGVjdGVkLg0KPj4gSWYgQXJtJ3MgZ250dGFiX3NldF9mcmFtZV9nZm4gYXBwZWFycyB0byBiZSB0
aGUgc2ltaWxhciB0byB4ODYncyBvbmUsDQo+PiB3aGF0IHdvdWxkIGJlIHRoZSBuZXh0IHN0ZXA/
DQo+Pg0KPj4gSSB0aG91Z2h0IG9mIHRoZSBmb2xsb3dpbmcgb3B0aW9uczoNCj4+DQo+PiAxLiBM
ZWF2ZSBwZXItYXJjaCBoZWxwZXJzIGFzIHRoZXkgYXJlDQo+PiAyLiBNb3ZlIGhlbHBlciB0byB0
aGUgY29tbW9uIGdyYW50X3RhYmxlLmgNCj4+IDMuIFJlbW92ZSB0aGUgaGVscGVycywgY2FsbCBn
dWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKCkgZGlyZWN0bHkgZnJvbQ0KPj4gdGhlIGNvbW1vbiBn
cmFudF90YWJsZS5jDQo+IFdlbGwsICJzaW1pbGFyIiBpcyBub3QgZW5vdWdoIGZvciAyIG9yIDMs
IGJ1dCBpZiB0aGV5IGVuZCB1cCBpZGVudGljYWwsDQo+IHRoZW4gSSBndWVzcyAzIGlzIHRoZSB3
YXkgdG8gZ28gdW5sZXNzIHdlIGZvcmVzZWUgZS5nLiBSSVNDLVYgd2FudGluZw0KPiBzb21ldGhp
bmcgZGlmZmVyZW50LiBCdXQgdGhpcyB3b3VsZCBiZSBhIHNlcGFyYXRlIGNoYW5nZSwgc28gdGhl
DQo+IHNpbWlsYXJpdHkgbGV2ZWwgb2YgdGhlIHR3byBpbXBsZW1lbnRhdGlvbnMgY2FuIGFjdHVh
bGx5IGJlIGVhc2lseQ0KPiBzZWVuIGR1cmluZyByZXZpZXcgKG9yIGxhdGVyIHdoZW4gZG9pbmcg
YXJjaGFlb2xvZ3kpLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBJIHdpbGwg
Z28gd2l0aCAxLg0KDQoNCg0KPg0KPiBKYW4NCj4NCi0tIA0KUmVnYXJkcywNCg0KT2xla3NhbmRy
IFR5c2hjaGVua28NCg==

