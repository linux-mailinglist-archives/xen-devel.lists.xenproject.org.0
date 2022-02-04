Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE94A9B1B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265661.459085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFziK-0005FK-Ex; Fri, 04 Feb 2022 14:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265661.459085; Fri, 04 Feb 2022 14:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFziK-0005Cj-BY; Fri, 04 Feb 2022 14:37:28 +0000
Received: by outflank-mailman (input) for mailman id 265661;
 Fri, 04 Feb 2022 14:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFziJ-0005Cd-Jr
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:37:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7c5fcad-85c7-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:37:25 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214EOI1c024817;
 Fri, 4 Feb 2022 14:37:23 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e15va81y2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 14:37:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6996.eurprd03.prod.outlook.com (2603:10a6:20b:2da::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 14:37:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:37:15 +0000
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
X-Inumbo-ID: f7c5fcad-85c7-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bn0sB43IEpZzbkGpRf4lRal/TYMRrUUUkwQiyfKAF4530hi3B6iNXbts5xZa5bT89NoSqMUkPB1rGIkuU9R3HeHPuPPN+t57BLe8aEa6iaAKubYleGYQxx++lDjs5W+J6RKzoNo9NBN6gdYFpf77Ivi4yg6Z3JW7idNGGUarDnf4NdN5vfRIoUCFsfrN6+kXBxHRvxdgLhPkchvAh9HR9z1V05IULapHfUmZJHYh4qPWGsWYCAHLqj1gvL6qr+USkH67gXHYUqysWd8awXTq9Yo7GTkR7P/c88Pf47ygblyyAZe/y6CnYFfcUVV+ABi8Ou6EaeDJP9ZBJybADDiC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnR7WvusOa8NAdWCqsvd5ZNFf15QvGL54Y7S0D9pVe8=;
 b=C8xKvJQ/MrDBD67bptoxSGPgH1bGN8LWtciX4Ojhax3oFHcb2kp22003nhRe//GdpkGZdtt3Bp6ubo3R8OJUnPU+/rA8SZ+DBUR/tM4QId4RvKrpETnut3R6INswRH/oUAzbA8ImrB7eimW3IoM/CSq2+iRbboZRpaJ088Dwa8PIEIArUdxklc+ZIcRyAPTuZdcL5phfLx7S8K/QogxF0tvva0xZVXTMxYm3pMj6x04N6bQDRGuTLqvAyWF8DDWv36CNMZIp7dHZxSp5Ue9gKeOX/aZOhf7jUKEr/+15wBAHs6eAjMJtoLzAjoXaVzoBDpUy3xB/WPQ71lGfqF2WwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnR7WvusOa8NAdWCqsvd5ZNFf15QvGL54Y7S0D9pVe8=;
 b=LaJbnzpRVftc68n0aXptJJFR7LRla1S3lpzbNOarQZR4lPrOLGQg64KTmjqwA7IkZzagQ4TP6qEbqApSHwRVNqLj7fBVXKXI8eOWAVqw2U1eyhaBs6wTmVp9t6EsT4OcbFsSRHEdFp2VTMh5MPkIQlnonvbAKlnjKIZSymMSn2UXkoo9FV0yT0pxzEtKoF58acamW1frkeQD/EujeqHZWX4Ygv8oEPUi2qmp4BFk4UTS0cAGJ07Ok8IAISPFkOeJrzaFrJ7CSuqKv9lr7oBYlyqeFEffMPq+Dv84Dvo/jF7tAlSS+kzsp5U/Cs6PLIQ532DSQ6rOvcc8+cVNqG/sMA==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wA=
Date: Fri, 4 Feb 2022 14:37:15 +0000
Message-ID: <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
In-Reply-To: <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce362a6a-e7d1-48f9-22e5-08d9e7ebd6ad
x-ms-traffictypediagnostic: AM9PR03MB6996:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB69968072D27ECCD10883D439E7299@AM9PR03MB6996.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6Tob70LnFD5yt5UQMV/sJd1tH+PIHMLC1ts9yxivEb7SgZR0FjPJBMQrRZLcL3J2c6pcVWTxWU19EiM/er6w0lTaZE5byUQcs9887ak6xv5EIqInC0mq07zBXlA2g9NSedsQ6fgWvT/LZYnDnbiTRWp767x6pWeTwVFipT6Al69sxQJsuMaBdWhPyPN1H0II1UYMQoHJ6F0they1saIxkq4iMdQiTsRYc+eQi+Sa79x6ibPdqKbaJ92qdg060PXFQYp0lBdXx1+WWBfbYyNTCAXVX7Giyqy/ym/iQyTjkHD0rlO28kqOD7Z1Vug7VJk4GVwsnvh83KPYRkKHLTunkgxtmBdv5xIOxbUb8qkV0LnPXmeYgL3nsDTFEvkPWxSPaPwhQUVKGFWjsxMKVAuzQ4LI3wRNMGZ/dG4BCKGhI4BSUgk4ZXIlIDCWnV+LjJS2VCOTd2yx3P5//4QEMKgqMFGMD5f1W887SzLSxXifuT/U7ISxjT+ZMJGJ56ns9nYAlgh9DKf9ylJ9td0NDF6vRZkfnI7xC1UqY1FpT7hZCqhMknf4Y+uoiE955snFe18BItTTMu87NZc/ESbVErVW/2gDUBzi4STNW70BRK0nIZqJM1f6B8U3kJSWP9+87ge9+NetvavDp9IMZk1N+bpfZsGIUHJOoMizFSbCFmtj2/LECNoLoRR9fi8GvFIGFaZ1OddzU37JwI1M6cuWlsdHgIPrkwXN/z7AksUQJZOlifuY8uN+bJN8SSNb06ZIXjPa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(2616005)(66556008)(71200400001)(6512007)(31696002)(6486002)(8936002)(2906002)(86362001)(26005)(186003)(6506007)(53546011)(107886003)(64756008)(66476007)(66446008)(36756003)(6916009)(4326008)(8676002)(38070700005)(5660300002)(7416002)(38100700002)(76116006)(66946007)(316002)(122000001)(31686004)(83380400001)(54906003)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVVzeWNCMnVFYktGR2Zya09NN3YxUjJPZ0Exb0RkQ3ozN1lIMlV6SStMMjIw?=
 =?utf-8?B?bE5rZTlWUTFFbTVrclRYV0FGSkVJL1NwamJwQys0M2FiR0hPekRNcjVNVGRN?=
 =?utf-8?B?YXpQOW9RRnRNY3M1TWhrZ0lFaU9XU3ZnL2k5bHJrdW9OMkpvL0YzSUxPNGdv?=
 =?utf-8?B?aWZHTmZTUGp5UlZ2aTlqMndOUGc5aGRDT0Z6Z0RUV0pHRHk0VHloYnhLbVdY?=
 =?utf-8?B?bUh1WlJoYUxMa0YyWnRhNEx5TVZhZVR0TFdhQ2xteWh1ME9LcExCMm5KTVM2?=
 =?utf-8?B?MzY1Q0FTcjQybVhacFdyUytDYmJTL3RaQ2NzSTQyUmdKVmtZOFg5S0JrVXE3?=
 =?utf-8?B?TWRjcUxydmp1NlJ6NDNrNzhBK3F4YnRjbmRuZG1MNzg4eExISmNzRFNma0Zs?=
 =?utf-8?B?RUZpaUh2NTExSTc3RTZUK0F6OHk1YlQvMEE0MjJXREJDcTh5U1lReDVGMVF0?=
 =?utf-8?B?UnRQSjZ4N1lMaWswQWxCaEVKRGRjK1p6QlkwdVVJb2FHSWtnQkp4T0ovRDdQ?=
 =?utf-8?B?M1Nzc2JKZWQyUlBxWFpyaTVRdlBlTCtlek8xd0FuSzQ3Y0Z2eHhWYnhTdlRZ?=
 =?utf-8?B?bGtIYXVGQzNwMy9oWmxrZU1XV2EzZFgveGZ6ZVJOOXU1SnQzYkxGMVNrallW?=
 =?utf-8?B?bk5PYlR6Tld5WFNxWTJDYjFKWVFKODlPNUVSVWpkL3NYWFVJYWtldktZbUYr?=
 =?utf-8?B?bkZQRVhSazl2cFNHbUoyZ25PbVcxT1dSeGZiOUY2SmFsTWxSY29EdEw0TlQz?=
 =?utf-8?B?RzJET0huaUFBc1J4bDFNZHRkTVpyM0pRb3lvZUlWMkkySk9SeHIxbjhjWDdN?=
 =?utf-8?B?UVorTHZwK2psdGx2bVZHUFpSd2RqbWF2RWZPcjRQRVZYL2JxSERkbjdEZ0Zv?=
 =?utf-8?B?d2hLdXpnSXcxSnV0MVg1R1hTd2VqbmRFMHZCdjlVOHpldTlpNEZsYUNFNkVM?=
 =?utf-8?B?cWpVTExhckJHb0w4S2hLKzdkQnVzSU1ITzF5dHA4ZWNtNXU0eTBOUE5Gbkpr?=
 =?utf-8?B?Y3VIVlJzR01NYXkxZmdXOVpzZzBrSnpzZmFUOGFqbmxnQ3RTUE5RcisxeDM3?=
 =?utf-8?B?UEMyc0I1ck1XVlhkYlp2T0ljRjNETUNLQ1NuQm96OW9tTm1FSW95b3RJMEg3?=
 =?utf-8?B?cFU5cDF4NkxwVU5oeWR5eWU1cURNYVlVaEQzaklrazFjYnVSYUdOWlZyZVB0?=
 =?utf-8?B?cU1scUpyekZ2bG1ITTMvR2ltd1pWTTh1WUdJV3FxZGlMUzl0T0JKM2hNdkhF?=
 =?utf-8?B?eWR2blpaVDY2a3pwM08vK3grVFNiNHlvZmYya0x5UElpK3VEdThNY0FuSHVZ?=
 =?utf-8?B?YUtOTG95Vm1YMmR2bDZKYVRWSG4wWUpNTmlkemE3cUwzU094ZXhqSDVDUlJG?=
 =?utf-8?B?M3JOL2NsQllXbUxDeFE5bWNXSUswMWwxbzl0QzMwNkRBVEZtanNRWXY4L1pK?=
 =?utf-8?B?MnhLcEtzSVpOK012ak8rUEpiNVgwTHllNFFNcmxvMW4yaDhRYTZWRnpxdUJY?=
 =?utf-8?B?Y2twcG5xN0F5b0Fxa3RLRlpJSnphVjg0WlRzVmF5WUdVOVJDKzd3TXFIQzcr?=
 =?utf-8?B?dEhKU0lSaGhSWXFaR2dRWVFvOEFacG42QlFUR2RkNjlEWFhZK3EyLzZicjdL?=
 =?utf-8?B?NXBBV1l0OUYraEQ1NS9LQVQrUll5RkZYQVZDTmJpYUlOajBRN3lmK0dHakRH?=
 =?utf-8?B?bnhNQ0gzQVZ1SVpyNUczWmtYR2RjTW9oWjdsZkxTSWhsV1dMUlVyL2Q1d1BD?=
 =?utf-8?B?MHdPcHFMc3NJZjA0VFVRUCtZelRaRzduRkhuRVVBSk5sd1p4bXhIOXhVbWZW?=
 =?utf-8?B?RXA5TzYxdFFLWndnMDgxR01CajZVNlFoTkZCTjF3RzlaZ3Q3NFZnNXJFU1JU?=
 =?utf-8?B?bjlrNXFTNndPZEE2WlA1MytsdmtyM1h0L2RKanBkY3lMcTdMK3M2YW5Ld0pn?=
 =?utf-8?B?V3VkUXRQcG1ub20xeHlFSDZZWlBZNUVtUjlEeUhqS1dhOEI2dkZ5Y1hYaGFs?=
 =?utf-8?B?akJhT1djdXczOEREU1YzaTExNUFjTWdXSGdlem5jdjgwdzJPQnpWdDFUT3Ax?=
 =?utf-8?B?VHloUGhPWWllbzhWRkZhNnNCWThYTEdhNGdkUUpQb0hlaGcrTEdCc0MyVkdM?=
 =?utf-8?B?eS8zUFg3UTl2TzVmUStOR0l1SkdLK0kvQWIwNkVFcGZkUFR6cXJuWHVZY2FD?=
 =?utf-8?B?SDcwVFc5ZHJnUTM3U3dBK08yS1NQVkRDMkhlc0tJOUtQU2NYdHUxSStPSXpr?=
 =?utf-8?B?OGJUUzVHVUdWZ25vSm55QVNsbWluMVdSWkgyMEZkSHpPL1dwN0V3Wnk2Z0pE?=
 =?utf-8?B?eFBodlVJUmRybDdpamg0OGRoS2RaVDZoNVBoYndjQURwa2VMa0tHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CD2D325CBC8B3478FC96AD288F26088@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce362a6a-e7d1-48f9-22e5-08d9e7ebd6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 14:37:15.3217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ShTghwaMRSep1puLxAMCrS+2WDrjAl3ClyCRDsoM+M8VbgxpomFRwpkCYBj4as2xmcud56CXqooqWkpZ11kDRhzWgexmFtffg7QKXt8twUzC4myudZ9A2kO7QtD4XEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6996
X-Proofpoint-GUID: 51Azaai7dErBnr6YVqIAwGhFni-CwdA1
X-Proofpoint-ORIG-GUID: 51Azaai7dErBnr6YVqIAwGhFni-CwdA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040082

DQoNCk9uIDA0LjAyLjIyIDE2OjMwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBSZXNldCB0aGUgY29t
bWFuZCByZWdpc3RlciB3aGVuIGFzc2lnbmluZyBhIFBDSSBkZXZpY2UgdG8gYSBndWVzdDoNCj4+
IGFjY29yZGluZyB0byB0aGUgUENJIHNwZWMgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGlzIHR5
cGljYWxseSBhbGwgMCdzDQo+PiBhZnRlciByZXNldC4NCj4gSXQncyBub3QgZW50aXJlbHkgY2xl
YXIgdG8gbWUgd2hldGhlciBzZXR0aW5nIHRoZSBoYXJkd2FyZSByZWdpc3RlciB0bw0KPiB6ZXJv
IGlzIG9rYXkuIFdoYXQgd2FudHMgdG8gYmUgemVybyBpcyB0aGUgdmFsdWUgdGhlIGd1ZXN0IG9i
c2VydmVzDQo+IGluaXRpYWxseS4NCiJ0aGUgUENJIHNwZWMgc2F5cyB0aGUgUENJX0NPTU1BTkQg
cmVnaXN0ZXIgaXMgdHlwaWNhbGx5IGFsbCAwJ3MgYWZ0ZXIgcmVzZXQuIg0KV2h5IHdvdWxkbid0
IGl0IGJlIG9rPyBXaGF0IGlzIHRoZSBleGFjdCBjb25jZXJuIGhlcmU/DQo+PiAtLS0gYS94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQo+PiBAQCAtNDU0LDggKzQ1NCw3IEBAIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgICAgICAgICBwY2lfY29u
Zl93cml0ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+ICAgfQ0KPj4gICANCj4+IC1zdGF0
aWMgdm9pZCBndWVzdF9jbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGNt
ZCwgdm9pZCAqZGF0YSkNCj4+ICtzdGF0aWMgdWludDMyX3QgZW11bGF0ZV9jbWRfcmVnKGNvbnN0
IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBjbWQpDQo+IFRoZSBjb21tYW5kIHJlZ2lz
dGVyIGlzIGEgMTYtYml0IG9uZSwgc28gcGFyYW1ldGVyIGFuZCByZXR1cm4gdHlwZSBzaG91bGQN
Cj4gZWl0aGVyIGJlIHBsYWluIHVuc2lnbmVkIGludCAocHJlZmVycmVkLCBzZWUgLi9DT0RJTkdf
U1RZTEUpIG9yIHVpbnQxNl90DQo+IGltby4NCkdvZCBjYXRjaCwgdGhhbmsgeW91DQo+IEphbg0K
Pg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

