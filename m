Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE4598DE8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 22:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389762.626878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOm3R-0002Wp-BR; Thu, 18 Aug 2022 20:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389762.626878; Thu, 18 Aug 2022 20:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOm3R-0002U8-7r; Thu, 18 Aug 2022 20:23:49 +0000
Received: by outflank-mailman (input) for mailman id 389762;
 Thu, 18 Aug 2022 20:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20Zw=YW=epam.com=prvs=0229c131d9=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oOm3P-0002Tz-Ll
 for xen-devel@lists.xen.org; Thu, 18 Aug 2022 20:23:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a686cb8c-1f33-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 22:23:45 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IImXVk014445;
 Thu, 18 Aug 2022 20:23:38 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3j1g2cbu2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 20:23:38 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DU0PR03MB8390.eurprd03.prod.outlook.com (2603:10a6:10:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 20:23:34 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::f575:76e9:4a40:7387]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::f575:76e9:4a40:7387%2]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 20:23:34 +0000
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
X-Inumbo-ID: a686cb8c-1f33-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFV0Y8B1cDu7VZtXlCnxAJt7liSEatxK/rQG+e3VI/PQLspBY2x1tfGdj/tyv/eTQqLQQbN1gBpFudITFTSCIiCXZjBr12Owb7n6Zk4bIT7hSoGV1bPYPdHj3IlXg/OG8T6fPu/wBQPGh+LLq01isLYdmDNHQ/NWAPX4kg+xMPxXbkjPK1bKCFcDSMF6BfTy163KUupkOTLvtbg3pt9l2R6qxdWCy7F3f9evMxhY3wX7VFtWvNH6h6mOgXDkn3p+3IxFI8OkljjIqtF9/A8SHz1X9Jjgi8tizAXgAhoomqqFLLqy2Wi5wel7cXDMCRmNSZS1BMT4s+VGZOqR3xv4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9DWcifWU+G3Zh2A62u8zbbaWoeAyndDyjxsBaQK+ac=;
 b=nsDJslhGaClLUdOGexBKtnifh4e53WLJzTSEjniPWN0MCcZCsRAwfK3XTiJf3geKDV5PAfs/1XXCUxyWe9UyR+tZuSmBTT1zTWoYBzl5KesntJ3XOCP+Ze+OpyaZu1Wbsqd5mCapfr5EMVbOjk8x59djMy16hVMeBsnTeYVQoTVOAYvqLGD9BFotRwOA2CWHv5oZypeNDLS0IGghzJw6Y9m7YmmhlVPTCXC77Wvt1N9Vru8tuzN+XDZYvuQKHUVhZx9buzcyC6ZFqFQsHytOHTLle5mcvveTgYElP5mWWLlEUZJq+VQPxSIp2zOUYAEC725hgVj6h8URVyYvZ5l7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9DWcifWU+G3Zh2A62u8zbbaWoeAyndDyjxsBaQK+ac=;
 b=cPGP9JBeSlXvKu6bt+wHBZ8H3Lv3Il9K7SaBN9i3yFivJJg1IthwnAG7Ok5xeJMwOj+gyqhFCq6l1zd9qZC75LXKWzlwyOxBWr4PsUqq0dSWM06UMCMAKBdTQczmiTppZ5Upcdy9MQJAWdjce4SG3kxnm7cbC5i2j3vjmAnj5yQNZqgSqUoIhzwuMVG7SQweC2kq1dS84BV8RDYZvGRE/hvShRi9poB37Ee9Q1+yIHfOdjLpmplQiyBfOtsTjmQxLP0J3zYUFwfVXVxIQU8lbaU4r9fa0aW3L7AZtRvhRTl4O4d5wQGRA3JjLIAhOhe7nVW/l8PSrS5r46MWBnAONg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Stefano Stabellini
	<stefano.stabellini@xilinx.com>,
        Mathieu Poirier
	<mathieu.poirier@linaro.com>,
        Mike Holmes <mike.holmes@linaro.org>,
        Oleksandr
 Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
        Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V4 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Thread-Topic: [PATCH V4 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Thread-Index: AQHYq7HHxdH3vCIKzUyor6bJAooA4621KSKA
Date: Thu, 18 Aug 2022 20:23:34 +0000
Message-ID: <24144a91-3047-158b-39fe-a201613c778f@epam.com>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
 <9a382501b425f4248e071e93db7c213025f402e6.1660023094.git.viresh.kumar@linaro.org>
In-Reply-To: 
 <9a382501b425f4248e071e93db7c213025f402e6.1660023094.git.viresh.kumar@linaro.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97100882-d11f-473d-efb8-08da815786b9
x-ms-traffictypediagnostic: DU0PR03MB8390:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /xJsSfG1Pr/Di5XUCO0SMLRyw3CMw8AvZ/AURovU7OumoVH9dsKIY5dShzibFe5n8xrtecNNxwGsaZSuaEoB15r2gO117Jdf1CTDi4a8vIO1iDQJW8+7gQV3iwO+xuAsz6KZyA4GQiThfALQyOWEdrJlZv4DW/zQWyX1CR+W4US2XmZSETOVzEe9GrCzE4QcwPNxdGcl+bvm/Q28VWO4mS9fG7inGHfpVTIZXFMtRM3W1JY5NSL5YhLWNVSe+SLk4HTqE+eU1eKze3rosNMnIs4DovgFDDkM1VqB316dkaZhED2tK6d3mGIDu5iSxrex5zxOtNUteag+FMde/FZyt9ksrGxDaFUuywNP+3OLyhsadKxERWQJGBw/t7t9XVPZA72RwWv6Q0HpMt2vhB3+5bjtmt4SSYZFShE3zGuWMWDo8e0UtTBADiRA/ctmCZgViy5mqEhnptUNp510q4QmzoIwkWeRoN1BaseL6ARJnE5qtfesHCzdVTsUIk4pYAZ29vPTOxdCT+Tce8MVUN7xIvpg6YdlZKffIrBVqfGpo+1G+nVGCZ3rR5hhzAm4ghrPo5Uzj3DmrB+lZbRkXOansaBv1FBjNeaEUBn0zfJ9fiwE5HvERIQqL58huNcUtS/ZAT72aNs2xXA9xaJ+Kf4Hz9h+uPdNGXnXR7qrLVDekvu46SOj8dkDHgv5dXcEpYwJPYXVWgm2mW9HFotXk9nZmEFB91AXC6D028SEoxXu4nEcQtNkuAqgQmplOiSa2yhqzEphVgdcNSGFsneUX2weabgOu7F/kZraoSVJrCgKTcM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(71200400001)(36756003)(41300700001)(6512007)(38070700005)(26005)(6506007)(53546011)(6486002)(110136005)(478600001)(86362001)(31686004)(2616005)(55236004)(83380400001)(31696002)(66946007)(54906003)(64756008)(5660300002)(4326008)(186003)(122000001)(66446008)(8936002)(8676002)(91956017)(38100700002)(2906002)(66556008)(7416002)(316002)(66476007)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFVIOEh3LzhnaFZvbDMrWHlNbDJrM1ErMi9jQUh6KytjdHU5cHhtb05OQm13?=
 =?utf-8?B?THMwWjNQRW5WOTJDSE5zYk9jUkxnSlNTRDBhZzlPUHgralNyMzF5UzQ4bDZX?=
 =?utf-8?B?YXprSFlQMEFKTWo0Tzhtc0E2VVNlb2lTeG5tNjJHWWlYaUtXdnk2VjdHcGUw?=
 =?utf-8?B?SUZxQ0pZdU9BOXd4RzhvQVV2cEs5VGpDL3dlcGxmTXRWYjlCTXRrUzhLVkE2?=
 =?utf-8?B?VzVRd2VVZTJUdEpBRGVNKy9DMnByc0Z1OGlsbGdjOFNZeW9ndWlnRHNUblla?=
 =?utf-8?B?R3lPZHBwRjM0Q3dhblg3WTU3cXZ3VWRuRHNJbFVXTElodFRMak5HVS9iV3Jp?=
 =?utf-8?B?eWlOZEw2cGVmMlNCVmtuUTJrVHVEZ0lyM2lqMkI1blFSWVliRWdSMTA5QURN?=
 =?utf-8?B?eDhUaGdjNkVVRW9tdVRBTkZxWjVHYlNLMTkvN3ExaENkdzIzTXpoQWJMbi9u?=
 =?utf-8?B?RU05eEdYQjU5VEplVmh0akJJMmZhYWVUMzl5WVFXMGdMazN5eTVXKysveFBn?=
 =?utf-8?B?Qk9PU29PL1lrVCtaZ1dQSDdWeFZ5NU9SczNneTkvWll1M2l5ams4MEk5R0FL?=
 =?utf-8?B?dEFWWjNDQi9lbEJNdEVYdStyN2VZYTJ4NDJPM0ZwNitOZjRVTnkyQ0tVYW5X?=
 =?utf-8?B?V1hRL3VMUkZ0RERKTVh4NVBMUWtlSHdVMkNiTDFVa2tLU1kxWHhtbkxIaFpm?=
 =?utf-8?B?SW8wMlRVRjF0WGhtNkNYZzM4Tm1ya0RjeDZXT3c2dWwzQ3RhUW1McVNsRXFM?=
 =?utf-8?B?U01TT3hjeG0rbTRBR3JrMFp2eFBqejNjSy9oSVh2STl5ay9EenAzbFpsdTRm?=
 =?utf-8?B?bkNEbkZHVVBKdG9FVjkrY0I2dFdYQlNyZVB4VVNNdHJ2bWhaYkZLZzU1TTRi?=
 =?utf-8?B?cGsxM0cycGNWRU9RWHVBUzBPVWVoMFU4SjN4amlCVTBhdFQreDFnS0tKTnlk?=
 =?utf-8?B?NlVZbWNIZXFsUjZoQ25pVk9YNXJ0VFVDVHZOZ1d2cWdkRGF3MjRRVVlvQUFq?=
 =?utf-8?B?OUV3MkRaRUhiTWx1cnEzWTI3WStsZHRuTXZJdXpGYWcyKytKTHRCY1N6M3N2?=
 =?utf-8?B?eGFVMjR0am9DQjVVSkI0dHVNYkFRSWJJZkx5anovVFZGbW5HR1RUeTRRWGJa?=
 =?utf-8?B?L1NOcHQyRHFjR2VuWmw1RUhCRVJYWFY1V21CT0JEczFTVlpHQzFldG9MU2Rj?=
 =?utf-8?B?aXIxWEVkZ2Q2TFgrYXcwN05qZm9ZU0pOZmRIYWhaVURPSGZnZDVYNWtnTXBm?=
 =?utf-8?B?VTY2SGRuTkFXYnVjTEt0TGVTbnNxRWNYWVN5Q0w5Zi9KdUNONEIrUWtIYmpZ?=
 =?utf-8?B?b2d2WlFKWXdvNkV2NnBDemw1K1J2T2tCeDduQ0l5OXIrOXBKV2t1ZFI5TzFI?=
 =?utf-8?B?S0pidHluOUxOd0tOeHlKQWp5eXZjSjA5R1Axc3ZkM3FkSE9LOHdWUVhRL0Nl?=
 =?utf-8?B?QUk1eXZiNGZoUHp0N3BiRzVoNjdWS3F4aVI2MnIwbjZtMWsvMm5DNnNTSjZC?=
 =?utf-8?B?NFZyWmpuS0MxTis3UUhlZEkwRHluak81QXFkWTVvcmZOOHppTWJXYURXTlRw?=
 =?utf-8?B?SkZraUdsQi9GSzl2d1c3ZUF3dkNaMTdhbG5zVElnM0ovM3grcVM2aTFKeFpl?=
 =?utf-8?B?RVBnaUN1VDh4b21VOFRFMFZMMW9kTkpNb3FMeEtDSnZFV2JLcy92dndSeEc5?=
 =?utf-8?B?Ym5Ra2hxV3VtdmEzbEpwQXNrdDdFalcyMXVxNGhqWnhHOWVHK2JXb2lvUGhn?=
 =?utf-8?B?SUpZUTQ0V3VrWDllQWNPNTZzZENDWGo3RGx3NnRPQk02RGFCUDlqeGp5cTRF?=
 =?utf-8?B?VUpDY0FPWG90aURESDQ5Y0hLdEdpVzdDRmpqODNoWWdzMkdzUG83Z0xqN3Nx?=
 =?utf-8?B?L1hxdkI3Q3pkQjdoQmJiQmRGVWc2T3BiR1RxSHU2dFdhSjFYZWlWRi9BTWNt?=
 =?utf-8?B?UFpqNVNQU2tvdUJFL3VDZ1NXL0ppM29FZ3ZoNU5waGpHLzdtSy8rU2w3bkJy?=
 =?utf-8?B?SGZJdGFYU1hmSUJ3OGtQRzR6TWZ4QmRjdUgwcTdEM21Oai9JOEZycndtZENJ?=
 =?utf-8?B?c2JscVMvWHpPekNYeElWUmM2ZXd6SFVZL2JGOC9EeEFhK3R1M1ZvcmoxcjVv?=
 =?utf-8?B?L2dtYVZDcWprRGR4eVZqbUlhaU51UnVTRWRiZXZ3Ny9DRGlvakloeEdERUNT?=
 =?utf-8?Q?jsax73m82/AygBZsaF2KUIE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EE2C686C1C7DD4BA096452C6ED5603B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97100882-d11f-473d-efb8-08da815786b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 20:23:34.8504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKr7nCInqW1eCZ14R0g5y6BvlTA4eqqY2DHIheCEjQOfcNKhmA2ft+FE1YsdhO6RKwL43BmlR/aYAh9wjEBww4+clmzmZdtKo9MFcWD07b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8390
X-Proofpoint-GUID: a4mMura66dFu7OUwyyg0PS3yVeL7tpz2
X-Proofpoint-ORIG-GUID: a4mMura66dFu7OUwyyg0PS3yVeL7tpz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180074

DQpPbiAwOS4wOC4yMiAwODozNCwgVmlyZXNoIEt1bWFyIHdyb3RlOg0KDQpIZWxsbyBWaXJlc2gN
Cg0KPiBDcmVhdGUgYSBzZXBhcmF0ZSByb3V0aW5lIHRvIGFsbG9jYXRlIGJhc2UgYW5kIGlycSBm
b3IgYSBkZXZpY2UgYXMgdGhlDQo+IHNhbWUgY29kZSB3aWxsIGJlIHJlcXVpcmVkIGZvciBlYWNo
IGRldmljZSB0eXBlLg0KPg0KPiBTdWdnZXN0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxv
bGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVmlyZXNoIEt1
bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9hcm0uYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgYi90b29scy9saWJz
L2xpZ2h0L2xpYnhsX2FybS5jDQo+IGluZGV4IDFhM2FjMTY0NmU5NC4uNGE3NTA4NTJiNjcxIDEw
MDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+ICsrKyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4gQEAgLTQ4LDYgKzQ4LDI0IEBAIHN0YXRpYyB1aW50
MzJfdCBhbGxvY192aXJ0aW9fbW1pb19pcnEobGlieGxfX2djICpnYywgdWludDMyX3QgKnZpcnRp
b19tbWlvX2lycSkNCj4gICAgICAgcmV0dXJuIGlycTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW50IGFsbG9jX3ZpcnRpb19tbWlvX3BhcmFtcyhsaWJ4bF9fZ2MgKmdjLCB1aW50NjRfdCAqYmFz
ZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICppcnEs
IHVpbnQ2NF90ICp2aXJ0aW9fbW1pb19iYXNlLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgKnZpcnRpb19tbWlvX2lycSkNCj4gK3sNCj4gKyAgICAqYmFz
ZSA9IGFsbG9jX3ZpcnRpb19tbWlvX2Jhc2UoZ2MsIHZpcnRpb19tbWlvX2Jhc2UpOw0KPiArICAg
IGlmICghKmJhc2UpDQo+ICsgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiArDQo+ICsgICAg
KmlycSA9IGFsbG9jX3ZpcnRpb19tbWlvX2lycShnYywgdmlydGlvX21taW9faXJxKTsNCj4gKyAg
ICBpZiAoISppcnEpDQo+ICsgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiArDQo+ICsgICAg
TE9HKERFQlVHLCAiQWxsb2NhdGUgVmlydGlvIE1NSU8gcGFyYW1zOiBJUlEgJXUgQkFTRSAweCUi
UFJJeDY0LCAqaXJxLA0KPiArICAgICAgICAqYmFzZSk7DQo+ICsNCj4gKyAgICByZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBjaGFyICpnaWN2X3RvX3N0cmluZyhsaWJ4bF9n
aWNfdmVyc2lvbiBnaWNfdmVyc2lvbikNCj4gICB7DQo+ICAgICAgIHN3aXRjaCAoZ2ljX3ZlcnNp
b24pIHsNCj4gQEAgLTg1LDIwICsxMDMsMTAgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9wcmVw
YXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KPiAgICAgICAgICAgbGlieGxfZGV2aWNlX2Rpc2sg
KmRpc2sgPSAmZF9jb25maWctPmRpc2tzW2ldOw0KPiAgIA0KPiAgICAgICAgICAgaWYgKGRpc2st
PnNwZWNpZmljYXRpb24gPT0gTElCWExfRElTS19TUEVDSUZJQ0FUSU9OX1ZJUlRJTykgew0KPiAt
ICAgICAgICAgICAgZGlzay0+YmFzZSA9IGFsbG9jX3ZpcnRpb19tbWlvX2Jhc2UoZ2MsICZ2aXJ0
aW9fbW1pb19iYXNlKTsNCj4gLSAgICAgICAgICAgIGlmICghZGlzay0+YmFzZSkNCj4gLSAgICAg
ICAgICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsNCj4gLQ0KPiAtICAgICAgICAgICAgZGlzay0+
aXJxID0gYWxsb2NfdmlydGlvX21taW9faXJxKGdjLCAmdmlydGlvX21taW9faXJxKTsNCj4gLSAg
ICAgICAgICAgIGlmICghZGlzay0+aXJxKQ0KPiAtICAgICAgICAgICAgICAgIHJldHVybiBFUlJP
Ul9GQUlMOw0KPiAtDQo+IC0gICAgICAgICAgICBpZiAodmlydGlvX2lycSA8IGRpc2stPmlycSkN
Cj4gLSAgICAgICAgICAgICAgICB2aXJ0aW9faXJxID0gZGlzay0+aXJxOw0KPiAtICAgICAgICAg
ICAgdmlydGlvX2VuYWJsZWQgPSB0cnVlOw0KPiAtDQo+IC0gICAgICAgICAgICBMT0coREVCVUcs
ICJBbGxvY2F0ZSBWaXJ0aW8gTU1JTyBwYXJhbXMgZm9yIFZkZXYgJXM6IElSUSAldSBCQVNFIDB4
JSJQUkl4NjQsDQo+IC0gICAgICAgICAgICAgICAgZGlzay0+dmRldiwgZGlzay0+aXJxLCBkaXNr
LT5iYXNlKTsNCj4gKyAgICAgICAgICAgIGludCByYyA9IGFsbG9jX3ZpcnRpb19tbWlvX3BhcmFt
cyhnYywgJmRpc2stPmJhc2UsICZkaXNrLT5pcnEsDQo+ICsgICAgICAgICAgICAgICAgICAgICZ2
aXJ0aW9fbW1pb19iYXNlLCAmdmlydGlvX21taW9faXJxKTsNCg0KTml0OiBTb21ldGhpbmcgd3Jv
bmcgd2l0aCB0aGUgaW5kZW50YXRpb24gYW5kIGxvb2tzIGxpa2UgdGhlIGJsYW5rIGxpbmUgDQpp
cyBuZWVkZWQgaGVyZS4NCg0KDQo+ICsgICAgICAgICAgICBpZiAocmMpDQo+ICsgICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KPiAgICAgICAgICAgfQ0KPiAgICAgICB9DQo+ICAgDQo+IEBAIC0x
MDcsOCArMTE1LDExIEBAIGludCBsaWJ4bF9fYXJjaF9kb21haW5fcHJlcGFyZV9jb25maWcobGli
eGxfX2djICpnYywNCj4gICAgICAgICogcHJlc2VudCwgbWFrZSBzdXJlIHRoYXQgd2UgYWxsb2Nh
dGUgZW5vdWdoIFNQSXMgZm9yIHRoZW0uDQo+ICAgICAgICAqIFRoZSByZXN1bHRpbmcgIm5yX3Nw
aXMiIG5lZWRzIHRvIGNvdmVyIHRoZSBoaWdoZXN0IHBvc3NpYmxlIFNQSS4NCj4gICAgICAgICov
DQo+IC0gICAgaWYgKHZpcnRpb19lbmFibGVkKQ0KPiArICAgIGlmICh2aXJ0aW9fbW1pb19pcnEg
IT0gR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUKSB7DQo+ICsgICAgICAgIHZpcnRpb19lbmFi
bGVkID0gdHJ1ZTsNCj4gKyAgICAgICAgdmlydGlvX2lycSA9IHZpcnRpb19tbWlvX2lycSAtIDE7
DQoNCg0KV2VsbCwgaGVyZSB3ZSBhc3N1bWUgdGhhdCAidmlydGlvX21taW9faXJxIiBpcyBhbHdh
eXMgdGhlIGhpZ2hlc3QgDQphbGxvY2F0ZWQgaXJxLCBjdXJyZW50bHkgaXQgaXMgdHJ1ZSBiZWNh
dXNlIHdlIGluY3JlbWVudCB0aGUgY291bnRlciBpbiANCmFsbG9jX3ZpcnRpb19tbWlvX2lycSgp
LA0KDQpidXQgdGhpcyBsb2dpYyBtaWdodCBiZSBjaGFuZ2VkIGluIGZ1dHVyZS4gU28gSSB3b3Vs
ZCBwcm9iYWJseSBhZGQgYSANCmNvbW1lbnQgaW4gY29kZSBhYm91dCB0aGF0IGFzc3VtcHRpb24u
DQoNCg0KPiAgICAgICAgICAgbnJfc3BpcyA9IG1heChucl9zcGlzLCB2aXJ0aW9faXJxIC0gMzIg
KyAxKTsNCj4gKyAgICB9DQo+ICAgDQo+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBkX2NvbmZpZy0+
Yl9pbmZvLm51bV9pcnFzOyBpKyspIHsNCj4gICAgICAgICAgIHVpbnQzMl90IGlycSA9IGRfY29u
ZmlnLT5iX2luZm8uaXJxc1tpXTsNCg0KDQpXaXRoIGFib3ZlIGZpeGVkOg0KDQpSZXZpZXdlZC1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0K
DQotLSANClJlZ2FyZHMsDQoNCk9sZWtzYW5kciBUeXNoY2hlbmtvDQo=

