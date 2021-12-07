Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591D46BA89
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240997.417812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZ6B-0001xK-8U; Tue, 07 Dec 2021 11:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240997.417812; Tue, 07 Dec 2021 11:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZ6B-0001vV-3W; Tue, 07 Dec 2021 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 240997;
 Tue, 07 Dec 2021 11:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKah=QY=epam.com=prvs=2975342c15=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1muZ69-0001ku-3v
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:57:29 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79fbde4-5754-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:57:26 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B7Bd3Q1010756;
 Tue, 7 Dec 2021 11:57:24 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ct6x101hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 11:57:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5555.eurprd03.prod.outlook.com (2603:10a6:208:16d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Tue, 7 Dec
 2021 11:57:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 11:57:21 +0000
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
X-Inumbo-ID: d79fbde4-5754-11ec-a831-37629979565c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ar7EG6UD5wfpmWeMTL/fP7BdvRH1V8BeB3CV98V3Ae0WPOi8z4uEW3XLr30l+iM6zJcfzNmU6Xe/JvbU9eKGw4Yv76nGokocnRUgKYWrKcuW6u0ZIpnFiUox/rvZ72nYN10GsITrL2STYB/BNePBIWdw76fTIAKx7PKBSziaRM29DUslNn6T3Gf/DG4XryzsmsYwON5eK/vBySOwCcyYVMzOqZ9y0/+IZbDqn2VVp89+f3/LrPF1KHoTvl2mZs72cKrKL9Zrgoom2uYJ+W4C4JiG2RL5w/WVFU83RHlboR6yGKpwL7zsjdCNMuQc44T2FfMc5nOD1zT0aAYxIZYDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+uVZrKrMoJQNPYI7pEcBjSwj1UO9ayYaPE3qsnRnV0=;
 b=gU8j1qbnnZiYueGqcpg7ixwHm1u1prXRSEWnVOdN1BJIpnsMHEu7RPuvExzmX/m6DmiiO36pJliiiJuHkyX6XxNuYY8pCI5x9g2vz3shzQcTkAuIf9zlRFyPCYCdv1cU1G1gj/u0GYOQK1dKS9il+kXLdyeb/NWv7P7i81n40XHJ4zsoes+Nmfv3SRTedqdHm8oChJw79bQhDn7JTk0qQxTQ+WHzQjtt/q3LHlUw0V1WWa2rnNU8qZpwpPBr5KsfOicdW8lMT+PPCzkdG0MG3p8gOpeGlgEFftjetHkdhmsNdRweQgR3YoLchEXO4t5KbaDMEHM4G7/9CNkRu6Haog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+uVZrKrMoJQNPYI7pEcBjSwj1UO9ayYaPE3qsnRnV0=;
 b=V9pzz+AJB6Ox6UJ85IBI3+pHS+B898uWW8bvYwpHJtmQNICdsc8WUkFFep4tXKT+I/6nVJKBgvAoB02ome3T9A8iHN+vnc7Vtyzaq280yDDjX3k3oV+KTCIH9TveaTq8MIcYhmF9X71/bl0+aYG0id076WsqEWYxaaNnuSkJC9IpaXlFVvvPk8LE8q1fzT6ZEPBGHw2u538glH62M+440msNanTHPfUO+1+2eausr57hhA5O1y4eEGf1uiC13u6i/KnNzAwx4n558GEalmfwPyqMJLcj1+1s66jpxj4RYWzWtvnzkJ90svxYVNezbmOf7n8hAg+uruRuTDGk2L3fQw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "paul@xen.org"
	<paul@xen.org>
Subject: Re: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
Thread-Topic: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap
 operations
Thread-Index: AQHX4QlHq5TbYMxegEi8AUrpiX/8ow==
Date: Tue, 7 Dec 2021 11:57:21 +0000
Message-ID: <be0d06fc-f024-73c3-8b0d-59bc8791312e@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-7-andr2000@gmail.com>
 <9647b586-e325-0d3a-3369-e3b13e45af9d@gmail.com>
In-Reply-To: <9647b586-e325-0d3a-3369-e3b13e45af9d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59cbc017-bb30-4873-0fae-08d9b978ba1d
x-ms-traffictypediagnostic: AM0PR03MB5555:EE_
x-microsoft-antispam-prvs: 
 <AM0PR03MB5555309144CDC3079531F1D6E76E9@AM0PR03MB5555.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xv6ew6+BTuJS7eu2Rj5GhUNROHr0eBR4Xc/MYZjJZUa/a6CgVoosrpcHwT4JypQv+c5GMmpq7/4DYpzvFVbPJXzGTrwEXnB7/6s8a/x+otNptl8VOcwBAyxnb5CNLzSoS8YQwuHETwD/sC2INP5vNyt4tVJVIXG0ipSWFAe09PRiKZ7/4O29lsw6uZ0Qm0a5HbRhjCRcEfriFzB7yEoMxTXNxnMNr61v9WKsDkxbZI+hORST1TMjvmySqVwWVaLQSqp7ESszbJ0J6ekTKxnKZCYQaKUihqT+jksm8AYs4cc8lnY1mCHWoj0E401AYY4FqyLncjUfhPc2L/kfB2JBX1oThgA3C5L5VwHHV2ZSYUhTcXEn/GPkGQbAgfnsWQWrVsOKKhQd3htWV2ZJ88nqWlqkY0qFr/5diRzoeEFEECjgnNCwkyC6QRYFYTVz9lYuOK+TZO9taL0my0Gbxoii5bX/efx+ZcA5rVf3RobSplh7ALF028oPUYBtESSmXopXk69bI6rI2XVLX8n+2k679jG1ji+aeGAudOXvIx/mt6Dthqh+N27tIoxtmgPGNRSOh+yaaRrxD5vpA2+i9m+UcqdoYV+9q9R91J1sx69G6zaOQPlMzpM7aN7nG1O7ViACJb/lZA+ghAZwCuBooDFicVKXR2tBQjK1coaAbrUFWx3nNmMQ5s/ez5TQMIuCZr1jPYcXFIeXfXUA4kVY7i38RgG98TBGxeB92TNP37ro3ffbZRLoJ/QljlCAJJX5cHWB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(5660300002)(316002)(66446008)(508600001)(31686004)(6506007)(36756003)(66476007)(76116006)(91956017)(122000001)(186003)(64756008)(8936002)(55236004)(66556008)(8676002)(53546011)(54906003)(26005)(2906002)(38070700005)(83380400001)(71200400001)(31696002)(86362001)(2616005)(6486002)(66946007)(6916009)(4326008)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a29mbzdSdmpiNEZoZVkyazU2dUtHbjFhVUtCdmh1Zklsc1hvblR1eXNtUEY4?=
 =?utf-8?B?V3BueTNoeHdIRmlHT3AwMUlIajB6UDVRbEhXcEpUcnh5R0hqcHJYZFY0ODk2?=
 =?utf-8?B?OFhVZGMrZnZVSjJ6emJCRFkrS2N2dERld2g2ODIyMVdpYk1PZEJteU5oY0NL?=
 =?utf-8?B?SjNuRXdKTFc3TjJDbXc0NzhvSXJYTnJZd2dTUU1XUmoyVVhReU1iR1F6OC9j?=
 =?utf-8?B?WkRrWHlQRG1VejNDU3dHMnlaemhZVFV0RDA4Wm1DNGdub1VkemdVZTl1Ym9K?=
 =?utf-8?B?YkhmQlpIM1hiUmZBMkc2OTEvckVUOXV6M0lkbEZ0bTFxNHd6TVd6SjUyQnls?=
 =?utf-8?B?Y2JmNWcxQzdiV2I5N3BRSkl5UExwMHJ3MFR3Q2pLRjNBc2NnVGxJT0lJMmp1?=
 =?utf-8?B?bVB1UFRJSVlTVDVFdGRsY0Q5b09VUm9xTUVMU1lDWDBTNmVDY0wveFhEbkl4?=
 =?utf-8?B?M3NxdkhBalVTWnI2S1J1bnFIYW02Q1NmZmlPUzRFRFY2dmdiUkhzTFdJelZC?=
 =?utf-8?B?Ty9zTjUxRHlpcUYyOUpzS041MU1sdDd3ZXZqOU81RVJ5QUFQM1c5K3RJdnhO?=
 =?utf-8?B?VE9uWXpxYlQ0a04xRm8xTW1TK3NUUlc0eWZXSnBZdFlpNlN2d2ZnMU5qUEJs?=
 =?utf-8?B?TGp6eUx2M1c0bmVaSjR3WWUvekNFRVNiT0FKbDdwQW1vZ0pyN2R6aEVMSHB0?=
 =?utf-8?B?d1ZrT0ZKQnM1SS8zUmZrQUovOVFZK1RqbUF2RWVwOGI5Vmd1d0JFbTZXa04y?=
 =?utf-8?B?VXpNdkNkcnpDaDdwbVltNS9GanphRHg2YTJoK2Q5dDhSTHhCdHVjbnpoZkN6?=
 =?utf-8?B?OEttN0FNRHVhZnQyQ3FDYk4wblFSN3pYUkNuM04rNTR2aTEvdW9ZTkhJNHBL?=
 =?utf-8?B?UXNFWldGL1RmWUE2OUgxWC9hV2ZGVzJjQzRsOHlBbndLcUZwR1lhUTRNQ01L?=
 =?utf-8?B?OVVMRVhubmo2T0RmMFFCbG9sdUtKWE5RNnZUZXRyWmVlVjdJODMrVzQyUU1r?=
 =?utf-8?B?T0RRaUFzL29Ja1JDQUJwYU1sQm5lRFFyMkJNdzVsRGxJSnpyb0VmeTZFVkJp?=
 =?utf-8?B?dTUyYTNrZVhZMmF4MHR4cm9SbnB5eDh6YmhDbEZIZ2hkUEpwT3lJMWxFaWlX?=
 =?utf-8?B?RUFURm5UTFBqamNEMjg0MFo1UWx6VTZIMGNsZno2SHNBcE04TlVLUFNydnlp?=
 =?utf-8?B?SEF3TFZpY2hObmpNUzJXSmFlMGhlS05tOWFPYThEOWZSWDYzQkorZGozSGov?=
 =?utf-8?B?L1dFaGlOVkx0TTVGZGwxMU5iRlQyWEhDZ2svazJVNDRsOGxSL2FIWitwQWV0?=
 =?utf-8?B?VHVVTUQxd1NmK3poRjhiTnhJN2RZZTRUTFp3Q0RpUW5CczZ1SklJQUllQmx4?=
 =?utf-8?B?YkNZSExSUmR4U3JRaXI3SkhJejk1ck1BWVRuNjlsa2psM09KeldLRVdkcFR3?=
 =?utf-8?B?VEdmTStJYmp1UTJvSWhrQnQreU1VZVQxckZXNG0vUVExakdhNUtHVnlWcDFq?=
 =?utf-8?B?K2dkdzJ0OEhRem9ISmVCZEFGOUlpa1p5dVpWbURnVkg2c2t4cXg2a0RyOUxl?=
 =?utf-8?B?cy91MDVLSmlPbWVIa1hPaWRCUTNUakZqOTY3U1VQa0M2NVZQSjZocHlsVDI5?=
 =?utf-8?B?UVE3V243L2NPOVVvRjQ3bmgraUxMWWk2SDFTYk5OYnRqK0RCUDJZdEl2YmFS?=
 =?utf-8?B?bTNGQ0wzb1Y4MWpyTzNucjh5MjEwdnhWMUYvQ1BIQWVaLzlzUFBPeDlScHdK?=
 =?utf-8?B?cFFwWlpoOVBITFhHVFlDOGZza0hEbHBaOXVTWVh3czNuMHh3ZDhGR3NwUytU?=
 =?utf-8?B?U00yYVB3Z3YzUkZFUG03eFppSWhIV0dJd3pJNzJXeUNUNExjZWFqL0JhWGNN?=
 =?utf-8?B?Q2Z0dkx1dTlHc29JUFRlbml3eWJjRFE5L2RtMXFqdms0dCt3ZEo4ckYrbGZz?=
 =?utf-8?B?NzU2NHI1ZGpxa0RzU3p0WFZnZW1QZUZyMEFWZmc2aGtoS2I3ZEJtd1RGaUR0?=
 =?utf-8?B?RXFsVlk4WSs2QjV3Zi8yaGlua1FsSDF0aTZnNkFKWXFrOTFSY0dwVmQrQlR5?=
 =?utf-8?B?a1RzS1dEUE03Y01QWEF2V2NXU2FQZEZSdXR1em9pcFFiWXRrVCtQQk1XSVV2?=
 =?utf-8?B?ZXpZcGJxeDlCTmxBeGZPWHAzSCsvTFlxbUcydGZhdVR3Zm52RHdFMWtDbHJm?=
 =?utf-8?B?M3dPby9ZTVJ1bDJWSHpQQ25RSCt3VDFNbXlwN01DRmt2dTN2SUFOaE8wblhL?=
 =?utf-8?B?engxa0JsbUxvNzJXZW1SRVFHQ0xvQkNhemFiYmtMZ0JhbE56cFd5MWNWekZT?=
 =?utf-8?B?Uk9zNHJ4c3pGNkRocnkxcDNucGhqdTlhdnAvaTJLejE5bDdLdnJqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33E3C92516B21547827CE9D67DA315EF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cbc017-bb30-4873-0fae-08d9b978ba1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 11:57:21.8691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XX325E9csOg5Z/nb4/X/RfeQFPJHXkQMCenC6go8UvsZRVVWe2KCC35bYkknzwMzMTnT6IpY0sBSUkH8sYU81bIoGrJvHQSQEWkojMeuULbhvHEsNkNFJvZgTguXHPCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5555
X-Proofpoint-ORIG-GUID: QqFuxuJKViYa3ziMlkfxv92aWIwzVazk
X-Proofpoint-GUID: QqFuxuJKViYa3ziMlkfxv92aWIwzVazk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_04,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=709
 suspectscore=0 adultscore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112070069

SGksIEp1bGllbiENCg0KT24gMDMuMTIuMjEgMTg6MTAsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+
IE9uIDIzLzExLzIwMjEgMjM6NTksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPj4NCj4+IHZQQ0kgbWF5IG1hcCBhbmQgdW5tYXAgUENJIGRldmljZSBtZW1vcnkg
KEJBUnMpIGJlaW5nIHBhc3NlZCB0aHJvdWdoIHdoaWNoDQo+PiBtYXkgdGFrZSBhIGxvdCBvZiB0
aW1lLiBGb3IgdGhpcyB0aG9zZSBvcGVyYXRpb25zIG1heSBiZSBkZWZlcnJlZCB0byBiZQ0KPj4g
cGVyZm9ybWVkIGxhdGVyLCBzbyB0aGF0IHRoZXkgY2FuIGJlIHNhZmVseSBwcmVlbXB0ZWQuDQo+
Pg0KPj4gQ3VycmVudGx5IHRoaXMgZGVmZXJyZWQgcHJvY2Vzc2luZyBpcyBoYXBwZW5pbmcgaW4g
Y29tbW9uIElPUkVRIGNvZGUNCj4+IHdoaWNoIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgcmlnaHQg
cGxhY2UgZm9yIHg4NiBhbmQgaXMgZXZlbiBtb3JlDQo+PiBkb3VidGZ1bCBiZWNhdXNlIElPUkVR
IG1heSBub3QgYmUgZW5hYmxlZCBmb3IgQXJtIGF0IGFsbC4NCj4+IFNvLCBmb3IgQXJtIHRoZSBw
ZW5kaW5nIHZQQ0kgd29yayBtYXkgaGF2ZSBubyBjaGFuY2UgdG8gYmUgZXhlY3V0ZWQNCj4+IGlm
IHRoZSBwcm9jZXNzaW5nIGlzIGxlZnQgYXMgaXMgaW4gdGhlIGNvbW1vbiBJT1JFUSBjb2RlIG9u
bHkuDQo+PiBGb3IgdGhhdCByZWFzb24gbWFrZSB2UENJIHByb2Nlc3NpbmcgaGFwcGVuIGluIGFy
Y2ggc3BlY2lmaWMgY29kZS4NCj4+DQo+PiBQbGVhc2UgYmUgYXdhcmUgdGhhdCB0aGVyZSBhcmUg
YSBmZXcgb3V0c3RhbmRpbmcgVE9ET3MgYWZmZWN0aW5nIHRoaXMNCj4+IGNvZGUgcGF0aCwgc2Vl
IHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmM6bWFwX3JhbmdlIGFuZA0KPj4geGVuL2RyaXZlcnMv
dnBjaS9oZWFkZXIuYzp2cGNpX3Byb2Nlc3NfcGVuZGluZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+DQo+PiBbeDg2IHBhcnRdDQo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+DQo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4NCkRvIHdl
IG5lZWQgYW55dGhpbmcgZWxzZSBmb3IgdGhpcyBwYXRjaD8NCg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

