Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1E4A852D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264763.457982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcCF-0000cC-Hx; Thu, 03 Feb 2022 13:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264763.457982; Thu, 03 Feb 2022 13:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcCF-0000Zl-F0; Thu, 03 Feb 2022 13:30:47 +0000
Received: by outflank-mailman (input) for mailman id 264763;
 Thu, 03 Feb 2022 13:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFcCE-0000Zf-5c
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:30:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70bafa1c-84f5-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 14:30:24 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213DKLPf003532;
 Thu, 3 Feb 2022 13:30:36 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0e15gg0b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 13:30:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB3535.eurprd03.prod.outlook.com (2603:10a6:803:2c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:30:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 13:30:26 +0000
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
X-Inumbo-ID: 70bafa1c-84f5-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6ohaYmc7Ps/AZnEm2qJuGPsCwdZOYFUamjb2TInUjbXVztVMrxzHJUIEUCG+GO0U/JDbOR25lVfgJf1TV0dV5wP9/bdVqwMUzipoc8gSXMHJfH5WfNl//qwL9zcXS1l4rybB4qQ93tU7Mziybs+kQ/SMCBQzVkI1y+FvjEcejYbwrQgKj8SEreg8Ve0XTSl1sZZpDLqg9Jb6+o/6ngYBsd9TYoS7AUrVpBK6RMKN2GyeEEN1llLOe1flz0W1kDx07Ud7KNz+HK9f/Se5xZ5PRgIaJdOVyzh5jvSZpiHwkiCauTxPLlhc4TROFs/dX//2sowJiewKli8ncc2mrNwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LspjNt9xzAvYju5tsYSAbGYqPXK/3dvEtZAVgtq5KV0=;
 b=jYQBCNPHtT8/7uA8iG5Z0xhv8TzHq/HzlfJER4Yxw36YYJ2VayhrlKyjBATE2X0yU93xYezTYh6hfwjE6WVEDQKHpSzFtx3wrmPum6XVLPVrwXcJ9W6/kJ8iGxa0XZMaSVJnyJrrCswbS8+srsnKcnsfPWsD3REmKUz3JLj1gpF5laUtlvlSKA1/TWFLolHchInLStk0ARfAvKrY1q55UIqbKN7PFwuE88r5ZrxmwWYVoFKYMzX8fxuHMoxS4FmEPvUczD1LcloiJP6uyJ0Blk2rnj0XWSg18pufEFTMbjKFzcobWWuefeVj26hA5L9ShGaX6ncbHi2vE9RSHujnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LspjNt9xzAvYju5tsYSAbGYqPXK/3dvEtZAVgtq5KV0=;
 b=l/qTlX9AsvFzuNnc6iHOwF3lf0crvg3QThy305OyCpDDf9UCK27RRjTZxRqMliKzFLniLUL6URku/rR5oUifSXQMXXigN/bYIU/0gb2SYLY4xT6jToCOjyAr7VhZfzTbC7Rdh3UDpny65iS9+tku+7NcOIQuqIH4GVUN7SJmjkDEYVBLIKClaz7nCaZFeTdhKQN5YNsOIV2om1DcUy4ZkhuRvbWTLk/zK1SxG00VIPROLDUj+JX20Od+BrPz3Dm85lP5WM/giavC1IuVW5TYWD6NCPNKX0fHqBvOO6ergmYDodBucpkbYtc/MS4t0a7pP4wFEoSAXxVrhbuj2sKN+g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxf8XWAgB1bfoCABObrAIAAAsYAgAAJ6wA=
Date: Thu, 3 Feb 2022 13:30:26 +0000
Message-ID: <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
 <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
In-Reply-To: <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e10c7963-192a-41fc-e0bb-08d9e7195704
x-ms-traffictypediagnostic: VI1PR03MB3535:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB3535CE41F1754697943C5E8FE7289@VI1PR03MB3535.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sq+u1jcvUZBsn/BqCAkcXMyqYxSm4o9QkKIRoFlGcR19bcORu8sKOkThdt/9NgtEkYdDJBsIk8jqrGM/spulk2Utv5BcDBxG7aVcdJyWBR6SjPAQ56gFPu+zBEyWl9jfRK8SPOnERNo3ZJzopp9yUJhURU/7KwiydaR5tP5W8ev13m6uOC6PQxma+gVIzGTNiK0jiR6eb9TH93nRi5hs0BqGNJSv+qwH2W4W3xrbeWuLZZJ/MxzNtv8OPryMGr2LemwMZcLJUbBqeA7x3R4fnIc0+oqSbjsGC8GdBDGEDoP82ZfwHLemGPkEqrHLR2Z9OJATYx6WfPBT5QjwLLLkw8cL6MKmY2e4/m2r3SprJTGal3majTC3Lw5XCZqs7MJ+qN3zG+t1uYs5/JYubOb+pUpZ0DDerT5jIfxkc2WoP+ao7pTLz0d+2zOG8Zl0t1vdvZRjJkmbtSn9Ofq5S3MX30twsLDf2Ge3zQ6qQDGte1VBX4BaiWA5wxyyVyiVAgegRVxHYN0Z9kim6Hg6C074dMPUSc/Br40+b2Of4GPWTJgRxLk4jdVWv1dqfbaa0hxK0SS/kcSUCpbq18/4nJ7uKR/hAKKUfPbmXYQxXgGvdk98PAMsVMcBBJaZgcpagZ2khJkvENDoslihh1fKjJvmC+i9cCrEURNSDxbmuu2mvIvur2XiLMznazqoHuf504s5USgbwcInFpZM0T0ExzUPdZcB7bZIvEOoiBkuCM5k+3OfGEXLZftvn6UAKzKuNY6N
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(26005)(186003)(38100700002)(31696002)(83380400001)(71200400001)(6506007)(6512007)(2616005)(36756003)(31686004)(6486002)(508600001)(76116006)(8936002)(122000001)(7416002)(91956017)(5660300002)(64756008)(66446008)(66476007)(66946007)(8676002)(4326008)(86362001)(66556008)(38070700005)(2906002)(316002)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WG9mK2RGeGo3cC8yeXU1YVRzcnFFV1Zpajg2eFExeW5PN2thU1FNQVZVSXFV?=
 =?utf-8?B?dmRsQTBHU2FxVTAwUjZVMklodEdQK2xSWitOTFBRbU81WXVlQkJCSk1oNkh2?=
 =?utf-8?B?RHY0akJoN3B5MGhvT2xIN2tHRFFqTlMxZUVya0dDZ25DYUlGeHFOd0xlYmsv?=
 =?utf-8?B?dFpnMVBCQjFhNktpMW9jWEIrZERLd1ZkeW9NVEJqRUFZMzlSTXN0NXdtc1h0?=
 =?utf-8?B?NTF6ZW1LNHBxS09SRWhsSDBvN3krWjY3dXV1NGVmWFgxay9FTzhZSTBPdlBM?=
 =?utf-8?B?SUdiOWhKSVVFN1p6U0N2bS9wZWN0ZUVwMlgzbmZjc1N2anJhTnVVaGF3R2E4?=
 =?utf-8?B?dUVtelVSbURNNS9YdWdrb0RQNnYxL3F0SFdYd3pPSk5CVGxBWnVuODZjQk9i?=
 =?utf-8?B?QW0vOG5HMVdlOUlUQ01WRFJYb2NabjRUZTJJZ3llMFJjNy9meU43RTBabGRH?=
 =?utf-8?B?a3lxNWlubU9ETmpiTU00TDc3cDRhL2I5alVWbEdlVENSamJ5SzV3bnRvT0ta?=
 =?utf-8?B?aHRRVEVtNXM2OTFWM3gvUXhsb2huZmdmOHpOVU1jQWVOallPdEErUkc2ZmNl?=
 =?utf-8?B?ekhFQUR1TnBOU29BVVlOMkJjcWRtWFBZSWxIaitpcDdyWVNZak10STA4VlhL?=
 =?utf-8?B?b1Bia2IrVFY2WVlGVkF5bHhWdUpELzcyLzIxamZsS1RQK2V0MjgvYlJNbW5a?=
 =?utf-8?B?clk3bmFGSHN2S0ZBNWpBSlFRczFIZDBNUW9tT1ZnR3RuTkthNFp5a3pTYXA4?=
 =?utf-8?B?cGpSaTQ1OWZFUmZqSTRHaTZvNUE0WHE4SE9EazROdUNuZVdLVHBhMTdLMjZJ?=
 =?utf-8?B?SGpUOWhyNDR6cmFsanJacFIzcFN5bDVVQkRxZHdZeFlJbGRvd3FTMDVJRHRk?=
 =?utf-8?B?TUhCc2JhLzRtYXhZRTB3VFYvWUorNTJ2dzlmMm42WW1tdUZ3S0JOQ2hyQWFm?=
 =?utf-8?B?SloxVkNjSW5lWEZkRVJ2R0NrcmZzSDB6VEl5SzdneUN5Sk50dy83ckNORlBw?=
 =?utf-8?B?ZUJuWFRxMU5PNWlsT2xjVDh3eklqK08yM0cvTHZOcVo5R1d1UkdQelZpNkZG?=
 =?utf-8?B?bU9FZC9oM1RvbmJmdjJUNEJNTmQrRFR5REQ2MnFSWFpxNUUrS01xeWdxQUY5?=
 =?utf-8?B?N1dOd0RVWmZPTDdNdjZKNHp6UVlmTjdpZ1RZbnhKRmhsNWgvMWUvdkxsdktQ?=
 =?utf-8?B?NjdRQ3VaQnhFelpnWGVGNGJodkFNdXJhL1Ntekp0Z1NHZ09YOTZVZEZpMXdT?=
 =?utf-8?B?SWtIc0YreWg1bkxaSjdLRERhcTFHWWFQaS9uOGdjclYyejVKZlBXVldBS1Vr?=
 =?utf-8?B?MnY2WnVrY1dpYXhWSUpBZUxwalducHJ6ZXNtQXJ3dHl1YUNoTkR0TzVnODV3?=
 =?utf-8?B?M2JJdCt3M3A5VW9IRDY2WTRKK0F0RWp0RkVpR0h1aGI1d1NZSmZmYlNsQSth?=
 =?utf-8?B?eWNUMWJ0NXk2NGdyMkF4SlU1enNyQWVBTEVCZEJqazBRbWhhZHFvUFFUeXpD?=
 =?utf-8?B?VkhDTFJkSTczZGlTYnFHeDdBL1h0eFYwelhZL0l3aVpPT3E0Rk05VGZBa1BG?=
 =?utf-8?B?dWVyVUlmUzZlQlBzaTBLWDNOSkRMWDF3UlFVUFNzdmFaZXBGTVFMd1F3UEI2?=
 =?utf-8?B?dk9FWG9lMHhURXdFc0p0YVRXY2RUc1ZydHFoSUhlRkJsR3BCVWpOdmtSbGtL?=
 =?utf-8?B?WEZ2L2xOQ0NYTm9NNndOYWh3N2tiSmFmdlIzWUVHWjFjb1RpOUZya1F5MzZv?=
 =?utf-8?B?U0pTWFExM0xnSUNkRmYxdXJZQmcyRFhEdUk2NjNackVjOCtZQTMrM0FpYmpM?=
 =?utf-8?B?ck5zUk5oUmRtZkJ2OGNKT1dYZlA3QjI2RXpyVWJwRW9IOG1uWVhUS2huK2VZ?=
 =?utf-8?B?R3J6dENseThOVEhuQll3bUZKOGVBNkUraHM4Z2kzNWMwcjJUdmowbkdzTjg0?=
 =?utf-8?B?MUUrMitubkJ5RVZ2TmtOcmQvMGVjVEszamxNc2lvYVVZcXJEcUd5WDU5OWJo?=
 =?utf-8?B?TjQ5Q25IdVdNeHJZYkNLWlZmbGxpTkYySlVicTBsRG5OTFVMcitXY0dmUE52?=
 =?utf-8?B?ZGV6a0dQZ0xyeWkwWVFDNjZDNVBxeHZZUVBGemxrTU04bG9pVnFyRUM4QXUx?=
 =?utf-8?B?N0xzY0ZpZWtvWWlYOEdOZTA2UU9PbzNmRmZBTWY5aWNqWkVPYjM3aTRRRFh3?=
 =?utf-8?B?citRSVo4NlI3SDFTNU9oQ2ZnV0V4VXg3K1BGN1ovbFBJUnZRWjR0cllGTHF4?=
 =?utf-8?B?YTYxSTJuWFUyTXNrL1hOV1BYTDhJTGlJREk3elF5NnlmL3l5QVo0blBKcnNC?=
 =?utf-8?B?czRXL1E1VWV2ejZsd2NvckI2VDV6bG9tdDJSR2NKZzNhT2RNekNPZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31832C7A64899A4880E4664258B371AC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c7963-192a-41fc-e0bb-08d9e7195704
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 13:30:26.8522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ET0Ud20ZZE6SCvaAjvCeOcBQDvmdDQ/pss5gp+qkSwtvVUIwABcolirUbAOvIJM0GcYtVSpQT3aIXun1N9cs5hJR34YFRltcN7/wiPEiDRangzfBhiVwNH3ZfnFX6k4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3535
X-Proofpoint-GUID: 79dOpfZwELa0g0h0lZpFhq1xCL5hBoIF
X-Proofpoint-ORIG-GUID: 79dOpfZwELa0g0h0lZpFhq1xCL5hBoIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202030084

DQoNCk9uIDAzLjAyLjIyIDE0OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDIuMjAy
MiAxMzo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEFsc28gbWVtb3J5
IGRlY29kaW5nIG5lZWRzIHRvIGJlIGluaXRpYWxseSBkaXNhYmxlZCB3aGVuIHVzZWQgYnkNCj4+
Pj4gZ3Vlc3RzLCBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSBCQVIgYmVpbmcgcGxhY2VkIG9uIHRv
cCBvZiBhIFJBTQ0KPj4+PiByZWdpb24uIFRoZSBndWVzdCBwaHlzbWFwIHdpbGwgYmUgZGlmZmVy
ZW50IGZyb20gdGhlIGhvc3Qgb25lLCBzbyBpdCdzDQo+Pj4+IHBvc3NpYmxlIGZvciBCQVJzIHRv
IGVuZCB1cCBwbGFjZWQgb24gdG9wIG9mIFJBTSByZWdpb25zIGluaXRpYWxseQ0KPj4+PiB1bnRp
bCB0aGUgZmlybXdhcmUgb3IgT1MgcGxhY2VzIHRoZW0gYXQgYSBzdWl0YWJsZSBhZGRyZXNzLg0K
Pj4+IEFncmVlLCBtZW1vcnkgZGVjb2RpbmcgbXVzdCBiZSBkaXNhYmxlZA0KPj4gSXNuJ3QgaXQg
YWxyZWFkeSBhY2hpZXZlZCBieSB0aGUgdG9vbHN0YWNrIHJlc2V0dGluZyB0aGUgUENJIGRldmlj
ZQ0KPj4gd2hpbGUgYXNzaWduaW5nwqAgaXQgdG8gYSBndWVzdD8NCj4gSWlyYyB0aGUgdG9vbCBz
dGFjayB3b3VsZCByZXNldCBhIGRldmljZSBvbmx5IGFmdGVyIGdldHRpbmcgaXQgYmFjayBmcm9t
DQo+IGEgRG9tVS4gV2hlbiBjb21pbmcgc3RyYWlnaHQgZnJvbSBEb20wIG9yIERvbUlPLCBubyBy
ZXNldCB3b3VsZCBiZQ0KPiBwZXJmb3JtZWQuIEZ1cnRoZXJtb3JlLCAoYWdhaW4gaWlyYykgdGhl
cmUgYXJlIGNhc2VzIHdoZXJlIHRoZXJlJ3Mgbm8NCj4ga25vd24gKHN0YW5kYXJkKSB3YXkgdG8g
cmVzZXQgYSBkZXZpY2UuIEFzc2lnbmluZyBzdWNoIHRvIGEgZ3Vlc3Qgd2hlbg0KPiBpdCBwcmV2
aW91c2x5IHdhcyBvd25lZCBieSBhbm90aGVyIG9uZSBpcyByaXNreSAoYW5kIGhlbmNlIG5lZWRz
IGFuDQo+IGFkbWluIGtub3dpbmcgd2hhdCB0aGV5J3JlIGRvaW5nKSwgYnV0IG1heSBiZSBhY2Nl
cHRhYmxlIGluIHBhcnRpY3VsYXINCj4gd2hlbiBlLmcuIHNpbXBseSByZWJvb3RpbmcgYSBndWVz
dC4NCj4NCj4gSU9XIC0gSSBkb24ndCB0aGluayB5b3UgY2FuIHJlbHkgb24gdGhlIGJpdCBiZWlu
ZyBpbiBhIHBhcnRpY3VsYXIgc3RhdGUuDQpTbywgeW91IG1lYW4gc29tZXRoaW5nIGxpa2U6DQoN
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYw0KaW5kZXggNzY5NTE1OGU2NDQ1Li45ZWJkNTc0NzJkYTggMTAwNjQ0DQotLS0g
YS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQorKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQpAQCAtODA4LDYgKzgwOCwxNCBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJjOw0KIMKgwqDC
oMKgIH0NCg0KK8KgwqDCoCAvKg0KK8KgwqDCoMKgICogTWVtb3J5IGRlY29kaW5nIG5lZWRzIHRv
IGJlIGluaXRpYWxseSBkaXNhYmxlZCB3aGVuIHVzZWQgYnkNCivCoMKgwqDCoCAqIGd1ZXN0cywg
aW4gb3JkZXIgdG8gcHJldmVudCB0aGUgQkFSIGJlaW5nIHBsYWNlZCBvbiB0b3Agb2YgYSBSQU0N
CivCoMKgwqDCoCAqIHJlZ2lvbi4NCivCoMKgwqDCoCAqLw0KK8KgwqDCoCBpZiAoICFpc19od2Rv
bSApDQorwqDCoMKgwqDCoMKgwqAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09N
TUFORCwgY21kICYgflBDSV9DT01NQU5EX01FTU9SWSk7DQorDQogwqDCoMKgwqAgcmV0dXJuIChj
bWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpID8gbW9kaWZ5X2JhcnMocGRldiwgY21kLCBmYWxzZSkg
OiAwOw0KIMKgfQ0KIMKgUkVHSVNURVJfVlBDSV9JTklUKGluaXRfYmFycywgVlBDSV9QUklPUklU
WV9NSURETEUpOw0KDQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

