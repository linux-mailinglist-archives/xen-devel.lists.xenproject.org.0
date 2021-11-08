Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0A449830
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223478.386214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6ZV-00043F-Ie; Mon, 08 Nov 2021 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223478.386214; Mon, 08 Nov 2021 15:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6ZV-00040z-FB; Mon, 08 Nov 2021 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 223478;
 Mon, 08 Nov 2021 15:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncso=P3=epam.com=prvs=1946062fbd=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mk6ZT-00040r-ET
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:28:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85df6156-40a8-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 16:28:29 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8F5sTB017325;
 Mon, 8 Nov 2021 15:28:26 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c76810413-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:28:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 15:28:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:28:21 +0000
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
X-Inumbo-ID: 85df6156-40a8-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7UEYOJ7rDHTSWoySfv96mbi8LomzXmdnJdU8CnmRXG4XDpuZBG41pJZCBmPHcQCRoS2offEPdbqLd+lIlxYRNMN31WgAhHNvCTe/BrHgTzvGE1WOKq1y2RYoSkj5izqH/UuYiET96wlxKvhRXKTM+w1pD+d+IVmQ/cgcJPi6tI62GiuX9TBscH/58/I1vs/7zB/+44TsXXZd4LjcN7voIGvG00ZiQaTgAD1LrB9oFK1k0JhcJIR9TcLGpCwOjuEy+C6LGLXYuuy/pUfbX8DGdH1aJsgC3rzWNkruleqG8zCytTn8vsmavBkkAfmRUs3haZJ5V5uk4Ap1HAEBQwm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4aawzwFePHD/BNdkoOISqVNM5WWztJ6D0nwTwZHhh8=;
 b=kSshgqsNqBH5Ua8KUkgCXa76n0iVJ62RoLe+v1ASFAoobBqDDSvu43MXGO6VBmIh0OWsdQopfILclM18XAjjr/+SG9uIMNFlO6Maq9ycGUjeutEE6cwI2wgNSh2xZMq28tzdYTZTgGO2BF2yGaC3ihmvuQw9M0LaAxSdg3sQdAHqEgqTpkWA2u1ggwbm4eYMqe3YMe+HYalJURPm2s8j2AAHnkxkn9bwYzYpKeFUJ/7sJxYsvz/P84FvEl9ZhAVFrE1p61N5n/5ZcEtK4YG6ZSpFaqoJLWBcPINwxC5mvZfO8BPfKfJpTmEqDqIdimnjX1cQl09PSU16nYjtXedjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4aawzwFePHD/BNdkoOISqVNM5WWztJ6D0nwTwZHhh8=;
 b=BGq4mZ6+LJ/a72TqTnKb8B3BqtOHi4kn44GOO7GtLA1X9h7Rax6C6nsFPIfXVxEyVMcOlqi/Y4b16EdIU7Wwpk8ZQrAkkmwvwJRNs9mSy0T/c65jBlWRs9pxbNWKn7dTTrXEM1I3wlX1sxZLxr79L/QaVYkUHbT88Xt2TTZZpLamgamUEi6NNqmGHxHaT8bs+ugofg6+Twyhhs/KyiWv/IXf18mBn64DwujTFN84SZR0/M9qYDuhp7vJV3cQfs10V05P2c0mZvYz5kKJA3Ahr3rDVz7uaJ5HuG0UMiAXfaVS0WH5uJm1v6ABL/oivdUzIkuqhph6oqCyHO4w/71amg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHX0hJP4tGfmNyDbEa0m8z5ITSeMav5fmGAgAABr4CAADRIAIAAEgeA
Date: Mon, 8 Nov 2021 15:28:21 +0000
Message-ID: <4260ad1e-0225-20c0-8208-f8e239f551a0@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-12-andr2000@gmail.com>
 <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
 <c05b3e98-772c-a8c7-d8f8-841289683a02@epam.com>
 <YYky9JSe9oMh5azh@Air-de-Roger>
In-Reply-To: <YYky9JSe9oMh5azh@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76bdeb01-7dc4-426b-47ff-08d9a2cc65e3
x-ms-traffictypediagnostic: AM0PR03MB4883:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4883AA9757A1A411A9D9649CE7919@AM0PR03MB4883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 arta/9hsJA0kTnRItDKPMYNtSKPREsd6AFgxyBdVxZuv4trdqi7RCqZ1pm3/x1IAJDm8V93sRDstqsaKy2UvVrugPxEJErNJJAjRjKkIQNKcqIuT2UdV2Df6n6/Elmx5R4RyPbiEb9S0JD7fhfP2zRd5Zw8LOBRgLstzp43KWURzZaL9oQsj7ko73atMF2vFZy/qdaZYpuYYk9V3JRLl3ClEdQS2iHO361e5C5LA4Fm7xBQ/00ILWUJqRZn89o7FT6wic5ddPHym57AluX2rf8ne4atwh/hAaoC6ITYwu9I3QZbnsAgNO+4Q2N/Fj9g7bu4vMLnVJgGw5Xt4VLsMkZ0TVRiKbNcvaM20JDozstfVpcwIrGIKn12qxpnxZXUxbLhrH+O0lVUff9FBcUd4Yedr9N1ARFrVvpHW/wKz4Dni55D0RCAckW2aZKkQnGxRoxB77OC60N919j7Y580E8lRYfZ7xxa0IkmATEc05b7Jy/sumVr8mnz3B81uUU9TjSF35Y45YVpO+hlHQDaUm9fi2SHzuQqJqkJ1pgLMX9skBSma+yBA23KeASgpOPn1iWI1tmvDmM3ytfwAzuE+XjdILxgabmGGlA5jS9AesnHPycWKH6iND8k5HP411Ohjwjy653GyAGlrnWwGK+jMZ7LJNWn6kFnYpnc/6wM4faIFJqSLZJheUGdeNvkGMTS/FXoz5OUcTtgqvKDb8yAsbdSMYlVaT2snwUMEAYXYDmMSmdtiiqPbA4x6vhy/gbicV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(71200400001)(6486002)(76116006)(91956017)(186003)(2616005)(26005)(107886003)(66946007)(31686004)(38070700005)(8676002)(66556008)(122000001)(64756008)(66476007)(66446008)(36756003)(2906002)(4326008)(316002)(5660300002)(86362001)(8936002)(53546011)(6916009)(6506007)(38100700002)(31696002)(83380400001)(54906003)(6512007)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZmJYK2FoczhYbVBFYUwwRUVLWUdSTTlyYzFwYnFyN3dJWWlsVmJVVFl2WFZK?=
 =?utf-8?B?VVZ5Q0l3R2JQaFlzRDRvYmlYY0Q1MVlpT0RUN0dSbnliRWVZWFBHVldHMlZP?=
 =?utf-8?B?YW9JWTNiSzZtMWtYM3ZVSURiWnNwNSs0RDZIZHI2cGI5WjRkaWlxa20xcjVV?=
 =?utf-8?B?ZktpTDgxam1DUEhTcFp3cHNTTktQbCtmS0VYcUdONG1oSFVzRTBYRzZVcTFE?=
 =?utf-8?B?ZDJuN1crWmVCMjBQcU1JcEdSTGlzYm1xcW9PbG1OSmZOU3BMS0paWVhpaGdl?=
 =?utf-8?B?eUZBd3l4VERqVUlxbUJlU3Nsd2czQ3dLU3A3NkRLUWlKc1ZvY2REbllxRzFV?=
 =?utf-8?B?UnlFKzFNWVlZb0hFOFIvMjdtN0NhV0lWZVFBL0hxWEpTZ2dvSW1ERmpPNG1r?=
 =?utf-8?B?emp1UjJWckpZMzA2aEZoQVVRTzhQMGJnN09tdWhBeUxwVG5zd0hVbitWeDN1?=
 =?utf-8?B?REFTajh0ZGhWelFXZ3l3WEdFNG1oRTVDQk9uMWFDcjl5K04vYlhWOGxLMkFu?=
 =?utf-8?B?dEFGaGVZbjArTlhNVVkxNjRwOVpVOUFyVG5LYzFEY216UDd6c0tpYmtEQ1da?=
 =?utf-8?B?emwvZGI1RnRYRStXMXdvUlRmdFZEUUVUMjdTODhHNG9mdW4xT2pxSVkrWWM0?=
 =?utf-8?B?RCs2aVJ2QTFicGxWbWVCTTU0RGkyRlZJUjFoOWppQTQ0MldVT09iTlFNTkJ5?=
 =?utf-8?B?Mzc4RlBDVmY2bE8yVytBUVFpL2RQSFVnTTFocDFPZENFY0k0TDlvTGE4aVpT?=
 =?utf-8?B?NzBLaE4rNGs3dGdVQUlPRWFpSVRmSHVXYlBkSGI0cWxoaEJnSVM1N1dSckZP?=
 =?utf-8?B?Zi81L1l2akNnLzJsaXlvQkRvOVFwOGdEVmpyOHJMVkpDQi9FVGxoYmFpc1Jj?=
 =?utf-8?B?eEt3SDd6bmFyV2EzYjU2bmRhVCt0NVVuKzRSTU5MOU9BOStDSm0zRGZwM1JN?=
 =?utf-8?B?T0NYb2hRVkRoSXMwNWltT0ZSWW9HSGtQZW9OZVJMM1FxTXpuWHNCKzlZTkZI?=
 =?utf-8?B?QXVyMkRFWXlOeVNyU0pCVStzVzNkUGMrUTNhbDBnVnk0U0RDbkJQMnRlcVdW?=
 =?utf-8?B?VW5YdmtPZklkM2E5MGJpcXZ6dXQ5TWlTNkR4dW10ZWFPSGVNVkVFak9QL3ZB?=
 =?utf-8?B?WUxhV1pqTHJvSzJLd09wblFNNnpvQVNqV0p3YmJYbnh6S0xla1l0amlMUU9o?=
 =?utf-8?B?Vng0bEFBOWRKdEtwLzBxV0ROOFBScTF1ZEJaQ3A4T3VqUmV5elNmUk9GNWFK?=
 =?utf-8?B?K3Y4RGY0Rk1NMTVSV0RpbFFyd29Iek01MUpXSk5VM1d6TzJwaFVaUzdXaHpU?=
 =?utf-8?B?UzBFNTNkdnJIV0t5eXo3eGl5dXpWQmJmcGcrODZPM1F2bWhYNHdOckV0UVJP?=
 =?utf-8?B?YnBIeW9HZHV6RnlsN2JqVlZJSHQ1em1EdThOZ0p3ZWd4b2pLNk9FUm83ZVp3?=
 =?utf-8?B?OXVIaTU4L0JLalh2S2NhOSsvRThNd1o0NkVRV1B4QzkxSTIrY0RZQlhNYXFI?=
 =?utf-8?B?cGpBSDFTZWg3bGZNbElYN2ZYcWxEVk5wRmVSYURhNW9PcWNCNzEzVFk3d0NV?=
 =?utf-8?B?WWZWVGlvQmUwb05JS1AzVUx2TDFwMloxT0MrcFNDb3pRR09SbEV4Z0lJSk11?=
 =?utf-8?B?bE5rWDVJTkxwOG9weUlmdE55TzArWTdvUlNLaFBnalhtMFZkT2J3alVxNkVP?=
 =?utf-8?B?ZjE4UlZJK2JUOGljQ05mc2g2a09CV1g1bXRDQUhnTGIzc3c1R05SRVJiaVJ3?=
 =?utf-8?B?WW9hT3ZPWjAvZGt0K2xqQmFSd0NmWFd0VkI2akJXRThRNk5GaDU2V0dOaUJ6?=
 =?utf-8?B?K2hMSk16OEEyQlg2QXhTT2Y0OG1jVkdRM3dmdU4zZlBmL0p6Q3FtbHJJM3Yy?=
 =?utf-8?B?UG8zMDhhdUVyRVltYWdnWlFSZGVIaFdNd2x6bDJxakJ3Ly90YXBrR0VPU0Y3?=
 =?utf-8?B?bWZDQk55eTM1WFJOQlc0NktqUXZZalg1RndHdm1RVGw5bGI3SjZ0RmY5TTNO?=
 =?utf-8?B?SXRaSlZPUW5senZoRE1GMDVUZEN3TFdlNlltVFQ4anFwYTh2T00vcHFVUDhZ?=
 =?utf-8?B?MGhNUjZ1QTF5UTlUOXpJbm9LRDRuamMyMDBRcUQ0bk9qMFRIREY2bVdiRm5T?=
 =?utf-8?B?TG9RbG83b1o0dVZPUVhGVXArb05jSFVIeTBwb1A3SW15NUxNOHl4dHNhVEI5?=
 =?utf-8?B?NGYyUDdUSHRhb2RZc0IrQ1FiYy9ub2JCTmhkLzFTSkEzVUdodWZwOFBWaU5h?=
 =?utf-8?B?NTQ0cXd5Q09tZDhLYUxGaTZVdmVKOEQ1TnNmOWNsRVlpeDlTZ0d3V0UxK2U1?=
 =?utf-8?B?TGUweWpOQXM1cDBkdTAxSktZV2UyVWZLQWh1YmpITEV0aEdOSHQyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B3B19D65CBADA4DBE5DB14944E6D0DD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bdeb01-7dc4-426b-47ff-08d9a2cc65e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 15:28:21.4644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ueiTofAiQYKQj0QO6dHH/QDLOcwT+XBEkF6cclY2gFWKOQhafPh90A+o2E9yJOt+BcfoXL+ErjozCOaNvQoHj26OTSiIGov3ilLqrnuKUZeVSfVd0CLT0Gl4Ts6SMEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4883
X-Proofpoint-GUID: gvtmS-1UkEW25NSQDKRQKxVNIs3d769u
X-Proofpoint-ORIG-GUID: gvtmS-1UkEW25NSQDKRQKxVNIs3d769u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080095

DQoNCk9uIDA4LjExLjIxIDE2OjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwOCwgMjAyMSBhdCAxMToxNjo0MkFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwOC4xMS4yMSAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Zw
Y2kuYw0KPj4+PiBAQCAtNDEsNiArNDEsMTUgQEAgc3RhdGljIGludCB2cGNpX21taW9fcmVhZChz
dHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+Pj4+ICAgICAgICAvKiBkYXRhIGlz
IG5lZWRlZCB0byBwcmV2ZW50IGEgcG9pbnRlciBjYXN0IG9uIDMyYml0ICovDQo+Pj4+ICAgICAg
ICB1bnNpZ25lZCBsb25nIGRhdGE7DQo+Pj4+ICAgIA0KPj4+PiArI2lmZGVmIENPTkZJR19IQVNf
VlBDSV9HVUVTVF9TVVBQT1JUDQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAgKiBGb3IgdGhlIHBh
c3NlZCB0aHJvdWdoIGRldmljZXMgd2UgbmVlZCB0byBtYXAgdGhlaXIgdmlydHVhbCBTQkRGDQo+
Pj4+ICsgICAgICogdG8gdGhlIHBoeXNpY2FsIFBDSSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91
Z2guDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgaWYgKCAhYnJpZGdlICYmICF2cGNpX3RyYW5z
bGF0ZV92aXJ0dWFsX2RldmljZSh2LT5kb21haW4sICZzYmRmKSApDQo+Pj4+ICsgICAgICAgICAg
ICByZXR1cm4gMTsNCj4+PiBOaXQ6IEluZGVudGF0aW9uLg0KPj4gT3VjaCwgc3VyZQ0KPj4+PiBA
QCAtNTksNiArNjgsMTUgQEAgc3RhdGljIGludCB2cGNpX21taW9fd3JpdGUoc3RydWN0IHZjcHUg
KnYsIG1taW9faW5mb190ICppbmZvLA0KPj4+PiAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRn
ZSAqYnJpZGdlID0gcDsNCj4+Pj4gICAgICAgIHBjaV9zYmRmX3Qgc2JkZiA9IHZwY2lfc2JkZl9m
cm9tX2dwYShicmlkZ2UsIGluZm8tPmdwYSk7DQo+Pj4+ICAgIA0KPj4+PiArI2lmZGVmIENPTkZJ
R19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAgKiBGb3Ig
dGhlIHBhc3NlZCB0aHJvdWdoIGRldmljZXMgd2UgbmVlZCB0byBtYXAgdGhlaXIgdmlydHVhbCBT
QkRGDQo+Pj4+ICsgICAgICogdG8gdGhlIHBoeXNpY2FsIFBDSSBkZXZpY2UgYmVpbmcgcGFzc2Vk
IHRocm91Z2guDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgaWYgKCAhYnJpZGdlICYmICF2cGNp
X3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZSh2LT5kb21haW4sICZzYmRmKSApDQo+Pj4+ICsgICAg
ICAgICAgICByZXR1cm4gMTsNCj4+PiBBZ2Fpbi4NCj4+IFdpbGwgZml4DQo+Pj4+IEBAIC0xNzIs
MTAgKzE3NSwzNyBAQCBSRUdJU1RFUl9WUENJX0lOSVQodnBjaV9hZGRfdmlydHVhbF9kZXZpY2Us
IFZQQ0lfUFJJT1JJVFlfTUlERExFKTsNCj4+Pj4gICAgc3RhdGljIHZvaWQgdnBjaV9yZW1vdmVf
dmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+
ICAgIHsNCj4+Pj4gKyAgICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7DQo+Pj4+ICsNCj4+Pj4g
ICAgICAgIGNsZWFyX2JpdChwZGV2LT52cGNpLT5ndWVzdF9zYmRmLmRldiwgJmQtPnZwY2lfZGV2
X2Fzc2lnbmVkX21hcCk7DQo+Pj4+ICAgICAgICBwZGV2LT52cGNpLT5ndWVzdF9zYmRmLnNiZGYg
PSB+MDsNCj4+Pj4gICAgfQ0KPj4+PiAgICANCj4+Pj4gKy8qDQo+Pj4+ICsgKiBGaW5kIHRoZSBw
aHlzaWNhbCBkZXZpY2Ugd2hpY2ggaXMgbWFwcGVkIHRvIHRoZSB2aXJ0dWFsIGRldmljZQ0KPj4+
PiArICogYW5kIHRyYW5zbGF0ZSB2aXJ0dWFsIFNCREYgdG8gdGhlIHBoeXNpY2FsIG9uZS4NCj4+
Pj4gKyAqLw0KPj4+PiArYm9vbCB2cGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCBwY2lfc2JkZl90ICpzYmRmKQ0KPj4+IGNvbnN0IHN0cnVjdCBkb21haW4gKmQg
Pw0KPj4gV2lsbCBjaGFuZ2UNCj4+Pj4gK3sNCj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldjsNCj4+Pj4gKyAgICBib29sIGZvdW5kID0gZmFsc2U7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICBwY2lkZXZzX2xvY2soKTsNCj4+Pj4gKyAgICBmb3JfZWFjaF9wZGV2KCBkLCBwZGV2ICkNCj4+
Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIGlmICggcGRldi0+dnBjaS0+Z3Vlc3Rfc2JkZi5zYmRm
ID09IHNiZGYtPnNiZGYgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICAvKiBS
ZXBsYWNlIHZpcnR1YWwgU0JERiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+Pj4+ICsgICAg
ICAgICAgICAqc2JkZiA9IHBkZXYtPnNiZGY7DQo+Pj4+ICsgICAgICAgICAgICBmb3VuZCA9IHRy
dWU7DQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArICAg
IH0NCj4+Pj4gKyAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4+IEkgdGhpbmsgdGhlIGRlc2NyaXB0
aW9uIHdhbnRzIHRvIGF0IGxlYXN0IG1lbnRpb24gdGhhdCBpbiBwcmluY2lwbGUNCj4+PiB0aGlz
IGlzIHRvbyBjb2Fyc2UgZ3JhaW5lZCBhIGxvY2ssIHByb3ZpZGluZyBqdXN0aWZpY2F0aW9uIGZv
ciB3aHkNCj4+PiBpdCBpcyBkZWVtZWQgZ29vZCBlbm91Z2ggbmV2ZXJ0aGVsZXNzLiAoUGVyc29u
YWxseSwgYXMgZXhwcmVzc2VkDQo+Pj4gYmVmb3JlLCBJIGRvbid0IHRoaW5rIHRoZSBsb2NrIHNo
b3VsZCBiZSB1c2VkIGhlcmUsIGJ1dCBhcyBsb25nIGFzDQo+Pj4gUm9nZXIgYWdyZWVzIHdpdGgg
eW91LCB5b3UncmUgZmluZS4pDQo+PiBZZXMsIG1ha2VzIHNlbnNlDQo+IFNlZWluZyBhcyB3ZSBk
b24ndCB0YWtlIHRoZSBsb2NrIGluIHZwY2lfe3JlYWQsd3JpdGV9IEknbSBub3Qgc3VyZSB3ZQ0K
PiBuZWVkIGl0IGhlcmUgZWl0aGVyIHRoZW4uDQpZZXMsIEkgd2FzIG5vdCBmZWVsaW5nIGNvbmZp
ZGVudCB3aGlsZSBhZGRpbmcgbG9ja2luZw0KPiBTaW5jZSBvbiBBcm0geW91IHdpbGwgYWRkIGRl
dmljZXMgdG8gdGhlIGd1ZXN0IGF0IHJ1bnRpbWUgKGllOiB3aGlsZQ0KPiB0aGVyZSBjb3VsZCBh
bHJlYWR5IGJlIFBDSSBhY2Nlc3NlcyksIGhhdmUgeW91IHNlZW4gaXNzdWVzIHdpdGggbm90DQo+
IHRha2luZyB0aGUgbG9jayBoZXJlPw0KTm8sIEkgZGlkbid0LiBOZWl0aGVyIEkgYW0gYXdhcmUg
b2YgQXJtIGhhZCBwcm9ibGVtcw0KQnV0IHRoaXMgY291bGQganVzdCBtZWFuIHRoYXQgd2Ugd2Vy
ZSBsdWNreSBub3QgdG8gc3RlcCBvbiBpdA0KPg0KPiBJIHRoaW5rIHRoZSB3aG9sZSBwY2lkZXZz
IGxvY2tpbmcgbmVlZHMgdG8gYmUgY2xhcmlmaWVkLCBhcyBpdCdzDQo+IGN1cnJlbnRseSBhIG1l
c3MuDQpBZ3JlZQ0KPiAgIElmIHlvdSB3YW50IHRvIHRha2UgaXQgaGVyZSB0aGF0J3MgZmluZSwg
YnV0IG92ZXJhbGwNCj4gdGhlcmUgYXJlIGlzc3VlcyBpbiBvdGhlciBwbGFjZXMgdGhhdCB3b3Vs
ZCBtYWtlIHJlbW92aW5nIGEgZGV2aWNlIGF0DQo+IHJ1bnRpbWUgbm90IHJlbGlhYmxlLg0KU28s
IHdoYXQncyB0aGUgZGVjaXNpb24/IEkgd291bGQgbGVhdmUgdGhlIGxvY2tzIHdoZXJlIEkgcHV0
IHRoZW0sDQpzbyBhdCBsZWFzdCB0aGlzIHBhcnQgd29uJ3QgbmVlZCBmaXhlcy4NCj4NCj4gVGhh
bmtzLCBSb2dlci4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

