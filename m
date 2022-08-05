Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648D58A8D3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380934.615388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtgq-0006MZ-Ar; Fri, 05 Aug 2022 09:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380934.615388; Fri, 05 Aug 2022 09:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtgq-0006Jy-7P; Fri, 05 Aug 2022 09:32:20 +0000
Received: by outflank-mailman (input) for mailman id 380934;
 Fri, 05 Aug 2022 09:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXlD=YJ=epam.com=prvs=0216224003=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oJtgo-0006Jq-1f
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:32:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d86275f-14a1-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 11:32:15 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2752wsAq010871;
 Fri, 5 Aug 2022 09:31:30 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hrr5vs8m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 09:31:30 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM6PR0302MB3366.eurprd03.prod.outlook.com (2603:10a6:209:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 09:31:26 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 09:31:26 +0000
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
X-Inumbo-ID: 7d86275f-14a1-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIDqF0CLwWzsccpCq9WVw2pyYiVNEtImuKfLlq06Z30vkHTLGq5GN/edzPeFJfIKP0fGfxtips1JNe4SoP7Qt726/Rg56hVAmlUL/eYUagxWEm3dz25wL7izWFokgRZ/RFHo7wZ4X0IbaObylUKNJP3yAFH0MoNZcVmGsLRwFSnYlJmL6knWJ8fqMGgoDd4F+VW8rUsRtO1jXd7jDFslUvSuPf/VEl1I2AOUsmEaICLlU2UL5E25UIE5+BQkxJ2d4OWpjDgSHr5Jz4Bzn7NVbHAYB0Aqce6MxxpGtqUFxhr8NYkXAufxZHUXj1Z9RG1OlFZx/O+gLQveDYSVaMGf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ygLQKAIvWL8iDybhhhVj0qW2imS7PtuXrZ8GGK6ufo=;
 b=G0KdHVDfXu2hFOaQYKx1aZbQCgTjzgxso3Ekp65Ps3/ucel1FYk9/n+BHI+mz3pdW61NMTzj/eC5q2YKZOMKviAxOb7S7m+6MmffJZERp9nBV+2/oA7jovAVxZ9AzYStHauffA3IoXjrIw/o1nt4wVhO0hA9ywcegvCOM7LZs7eFSU4bW2Jqg4zhvJPCMhneAR8Se6yZkziB8f6vJ7Ae+JHzxjmfMgNU1y6YWijojq4b1tPEOtxpvqcX98Fz0AIPKu8P6tbVg9B71pegknE6ctPgfTnmpHXZuufcQyLLwhaxlpUvobed2ldU4KTe6MLjv6fVGqW//azPz2Os7BXeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ygLQKAIvWL8iDybhhhVj0qW2imS7PtuXrZ8GGK6ufo=;
 b=gV3Kp9cxRCUaODl5yme/QiLho88WZwncZliUYcN+DYM7ZVMWev5aUuh6NA9xX8kuCc8XgV47f7splx3slUkhk3z9JPjmEPSyCs7j8ohwrLQRUYu27Sb+iqjj8VW8OGA0hU3u8yrHM0l23iVA93ew0g4N1LeHjZ/B8J6MkDgGSxaY07f6Fd6gp+NiGa0sgf1NuKc6F6duX91W/9jJFYQAQroczGmQ0x+aWm2BQwpQkRlzj0YhhLucs3U87GizBPue0piQhPZqZN2I4SKV7meMiAJCIHyeATyi47Jtij9oP9M5X9UWxvEi6vnIv2p8XZTfmqF0rcw1kw4kNnobaaWgVg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Ian Campbell
	<ian.campbell@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Bastian
 Blank <waldi@debian.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/xenbus: fix return type in xenbus_file_read()
Thread-Topic: [PATCH] xen/xenbus: fix return type in xenbus_file_read()
Thread-Index: AQHYp9GEZ0chDohme0ithoOevS/GFq2gDJUA
Date: Fri, 5 Aug 2022 09:31:26 +0000
Message-ID: <5162a6ef-1d68-108b-cc1d-a2846ae2cf7e@epam.com>
References: <YutxJUaUYRG/VLVc@kili>
In-Reply-To: <YutxJUaUYRG/VLVc@kili>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ff0b520-fdde-4a55-1f91-08da76c544dd
x-ms-traffictypediagnostic: AM6PR0302MB3366:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hrDyMI8Bx5NiKhm6A6z7+ahbQRy8dORgZUopgkCDFSxAmEk6gZSliftCEwbCAaRNWIb2SJdSp2P/l9l8FhTnnuCQsSgFPUNfGGV6VQ6njJh2m+Mkj5Cv9D2D4DuPqqIgx1xfCwkJJObiLmt4PqJMGSeHhtjjBFDsujsXQLXtzALPIPks2PG78P2MsuaHIgJiSXjOrrc35zMOiIET/ZIM7pn9phGtmA9EMs1GsDH6kGbVmtgMk3xAHwC5l8wkb5T1Chy+fF1sv2p+mILP18RwUOEJw4VP0IN+8cEh9a670Z/OMj2MQEHYFnMDptyhLvHsv0PGaq3MWkYUXcv4lKoCVWsgKK+rvL2mTE5QeBqeH9L7nJ8R9afKa6i3b1RtrBj6JjxJgG7mJ0315hrebzWuzlMzKJ5IlvcW0q8qc9Ws+1+r50S0UW7/11MnNn+EKTTAQpOhOq8FHrwN/JNMGiVL8GkUO7lxicNCXpobpDfSW4iikjUnqBcLUnChlGczQLXPSNAPPClXguQXu67xpj0vAebHpmX2buNib1uIqNshmP1xbtEbVr5CqcpRjjPwis5/EuePjCZPLnIFM3ovFm23k7ceqcDhQaIEYF5IabtMIahK87MwvOvawc4dlQVAWnuJkyEO690rHF1aFNUd/CnQQUMGM837mfO3r5cBsStp5pJKJ1FWEGboQ0jxXvME+kbqZ22ppM2anp+QDxzaEfVe6/B91YPHGgXwiG7UY7oSP258LNuC8WxDcGqs9rhoEClpf9uXrBROlXMaKYEJiFJ+xFKsiVc0htdW9pnetxc9glG04/dPyidY377VdHMqtv2fccYN3c8EwENbaeXQPa+TuA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(5660300002)(91956017)(8676002)(4744005)(66946007)(76116006)(66446008)(86362001)(4326008)(64756008)(66556008)(66476007)(8936002)(122000001)(316002)(31696002)(36756003)(38100700002)(26005)(6486002)(2906002)(41300700001)(478600001)(54906003)(2616005)(6916009)(6506007)(38070700005)(186003)(71200400001)(53546011)(6512007)(55236004)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YktjV2N4WU80eTBOUjdQVjBNcVNUS3Fqd1VqODZobU8yYXhrbGRxWDFjQVVX?=
 =?utf-8?B?KytyMXdxRWgvT1hYNlVTUVJOTzZqTnN0a3ZMaW1LV3k3YWUwMHVwb2NNR25X?=
 =?utf-8?B?dVNMM2lpbjA3SzU2K2VueG5PalFlUzB2cmpXT2xSQi9YeEpqZnlJanJXd1By?=
 =?utf-8?B?Zlo3b1dDcXlCWm96d3hlSlgvOGNFUTdJOXNtMmhoUkxwMDhEa2JRYXhmTXFj?=
 =?utf-8?B?c1VyVUJBTnNEM1V5TTIvdEkzZHRmUW9UeVVQSmlHL2R4L1QyUWpha0UvODRw?=
 =?utf-8?B?S3Z0RUJjcmFCM3RsTVE1M0FqNFB4SlRJYzcxTDg3RDN0QjE2dE1nOWNocjhE?=
 =?utf-8?B?SHhCZGU2VVZpditMbGdTVG1ZcDlBS3Vud3h3aWZyanE0ZS84eC9henZlRmhr?=
 =?utf-8?B?VlRadUdMK2RObVhRM053V1BPUU9rWlZEbUtDQkJveWxXSC9pNFpTODVuMFlw?=
 =?utf-8?B?enRsRHNLZ0lXR2tiTldEQUZPNGZlRzAxUGF6amZZUzBmeVo1aWlsbFliVytt?=
 =?utf-8?B?a0ZYMWV0eU9vdjc2ZExxNEgxUnVWcDUvNUdTNXhVMlN1enVFMys1UEhzU2pq?=
 =?utf-8?B?VElHNHNvSCt2MXppME8wZ3FaUlFCOGcycEhUWUU2Rit0YmFncVdWY3FwS1Zx?=
 =?utf-8?B?UnRCYWRTYmxjQk53czlhaXhseU5PVGIrbzFPblBJUS9LK05rS1pjaXBoeUtG?=
 =?utf-8?B?amV4SDZ3NkZZa1ptQmUvcmFQKzdqZFExbCtGdURrcFFick1uYmdreFZxTWZG?=
 =?utf-8?B?R21mU0syNVpIRi9wZUxtZHVxRm1BZTA0d01QWmNqSGV5ZnIwVWdIdDBVRThp?=
 =?utf-8?B?WFFXTFNDWkVPMG5hazdIRnNycmEvRWMrRkhxVS9yc0xDQUJveGtDeXVFRE1t?=
 =?utf-8?B?d0xZVW9pcW1RNXBDYS94aURFeVMvMXhnVWlxTW1WZ3dtWjZLRFZrNzY4OEFq?=
 =?utf-8?B?Ty8vUldQY0NtUERLdlhBbTd3UzJyZERXdmo1WGlFWHdwNVd1cExjWjZvcW5y?=
 =?utf-8?B?MWpHdHZWeVhiNHNkcEZPYTlaRU9nazhYdGRyZXdzY2RPSHJRSVdJOXF2YjVx?=
 =?utf-8?B?QWh2bDJPUDBudVZqd3haYVl2WmNvcGJQUDdUZEt6S0hwcmwwejRWQjk0Q0Ux?=
 =?utf-8?B?a1lVbHhIZHhSem1Pb3VtQzNKckxIRHN6SklnQjhpRy9KUnJlRW1NSzRpWU42?=
 =?utf-8?B?aWNtWExEdERoSUM0MVdUdFZhNWFoMWlDYStDQzFtamsxMTR1d0duSGdjc1dY?=
 =?utf-8?B?ekowWVJ4K1NRcW5MSXkyLzNDV3hsaE1VcFBHbHlPV0xLNytPSHpmMXNQbVUw?=
 =?utf-8?B?Y0R4L0dpb0RHaVB3NzIxVTJXZEcxZDdGd05iTDFkYjF2QUVLMDBrLzMwTUl2?=
 =?utf-8?B?YUJCSXRSWUo4UVRTL1pBNXFZQ3N1VXFWWVpUeXRBdzczTCtxVWdrVFZIUkNq?=
 =?utf-8?B?YkZHNGNveWVBZ3dYR3N4SDRGUkhEU2libWphOWl1MVRkTUpGWU5wOFhwRGRR?=
 =?utf-8?B?WXp6bm45N1RUSWJjeWRNT0tFd2ZJOTM3UlZReUpuUThQSUtFYUxlL3llUHhm?=
 =?utf-8?B?TWNpNm9FYnVmekNGdUhCWm5mSUl5TThIZFYySWowWHBHNGtVeVVKNktDa1cv?=
 =?utf-8?B?eVlmTGU3cWhZaFZJbXZwRHo4ZlBqWTZ3R1BUNkpoYVBsdjdyTXVFK1YyWDA5?=
 =?utf-8?B?Q05Xc3pMZnBlUC9TK013VEw2Tjd1dzAzUlBRc2NqMVErbmNRVmNCUjJrNHhs?=
 =?utf-8?B?dTRiOXRTVm0rTWpYTkRpb1luWk4yWmlDMjNFL3pYNENEaVV2dm1qcXZ0SnJS?=
 =?utf-8?B?TW1wQThSWkd4YmsrcWI2MG4zUmk5L1pBOXk4RVUrbkFDL2JxRUE0b1ZsUUM0?=
 =?utf-8?B?a2RMOS9FaGViK2h3cEVPWnVEa2h6b2Q0TDlkNStJQmMvSm5qNzB1alNlM2JO?=
 =?utf-8?B?VkpJeE1FYW1XWnR3Tm9md2p0Q0lNMmVxL3JvcHNiNEUzNW0zWTJ0djhzc1lN?=
 =?utf-8?B?bWQyRVBXVW9oOXAzUGRzWHFqaFJmYnlmN3drTW9nSXlYeHgrVGFkYnNxdWhj?=
 =?utf-8?B?a1pXTm8vZ0htTmwvd1NrMkd1UHAvYUFJNFllYWpjV2JiM1ppWHR2dnl0VWtZ?=
 =?utf-8?B?ZG1nK2UrWG1DZXE5ZDZvcDlyUWw2SzJ0Y3N2WUt3WjcxUFgxYnNjQktwalJt?=
 =?utf-8?Q?yAMZ3cnCTXqPka85bknMU/k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E93EFA2ECFF1D04F8D3369F136A7431A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff0b520-fdde-4a55-1f91-08da76c544dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 09:31:26.2167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAiXNKd1WmWg/RAvFMhJ+TUc/k5ePTqVy70RXZ8/ZXavj63ZQuNKfL557EQioJAiTxmZDsA2gH10tdkRX1M89D4kDVnbrYaxtJ+EFVFjPBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3366
X-Proofpoint-ORIG-GUID: zkfXll1RaxVMrSrpW03yEj170XKUn1mN
X-Proofpoint-GUID: zkfXll1RaxVMrSrpW03yEj170XKUn1mN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050046

DQpPbiAwNC4wOC4yMiAxMDoxMSwgRGFuIENhcnBlbnRlciB3cm90ZToNCg0KDQpIZWxsbyBEYW4N
Cg0KPiBUaGlzIGNvZGUgdHJpZXMgdG8gc3RvcmUgLUVGQVVMVCBpbiBhbiB1bnNpZ25lZCBpbnQu
ICBUaGUNCj4geGVuYnVzX2ZpbGVfcmVhZCgpIGZ1bmN0aW9uIHJldHVybnMgdHlwZSBzc2l6ZV90
IHNvIHRoZSBuZWdhdGl2ZSB2YWx1ZQ0KPiBpcyByZXR1cm5lZCBhcyBhIHBvc2l0aXZlIHZhbHVl
IHRvIHRoZSB1c2VyLg0KPg0KPiBUaGlzIGNoYW5nZSBmb3JjZXMgYW5vdGhlciBjaGFuZ2UgdG8g
dGhlIG1pbigpIG1hY3JvLiAgT3JpZ2luYWxseSwgdGhlDQo+IG1pbigpIG1hY3JvIHVzZWQgInVu
c2lnbmVkIiB0eXBlIHdoaWNoIGNoZWNrcGF0Y2ggY29tcGxhaW5zIGFib3V0LiAgQWxzbw0KPiB1
bnNpZ25lZCB0eXBlIHdvdWxkIGJyZWFrIGlmICJsZW4iIHdlcmUgbm90IGNhcHBlZCBhdCBNQVhf
UldfQ09VTlQuICBVc2UNCj4gc2l6ZV90IGZvciB0aGUgbWluKCkuICAoTm8gZWZmZWN0IG9uIHJ1
bnRpbWUgZm9yIHRoZSBtaW5fdCgpIGNoYW5nZSkuDQo+DQo+IEZpeGVzOiAyZmIzNjgzZTdiMTYg
KCJ4ZW46IEFkZCB4ZW5idXMgZGV2aWNlIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCg0KDQpJIHRoaW5rIHRoYXQgcGF0
Y2ggZG9lcyBjb3JyZWN0IGNoYW5nZXMsIHNvDQoNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQoNCg0KW3NuaXBdDQoNCg0K
LS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

