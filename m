Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A274A49B2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 15:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263140.455741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEY1z-0007V4-RA; Mon, 31 Jan 2022 14:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263140.455741; Mon, 31 Jan 2022 14:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEY1z-0007SH-OD; Mon, 31 Jan 2022 14:51:47 +0000
Received: by outflank-mailman (input) for mailman id 263140;
 Mon, 31 Jan 2022 14:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEY1x-0007SB-Vx
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 14:51:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc58b4d-82a5-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 15:51:44 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VCvjfe027179;
 Mon, 31 Jan 2022 14:51:39 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dx7wu272g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 14:51:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3262.eurprd03.prod.outlook.com (2603:10a6:803:1d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 14:51:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 14:51:35 +0000
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
X-Inumbo-ID: 4dc58b4d-82a5-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICn4NGMHj7J4RKDfucwXyqvmpKw8/WBbPGEoeH3nFtOLcYf4c8hEUgcEtA5dLukHbkxOQ248AuRaKvhXAXvy9XRuY1aW4igjuLTMsI92bheGeslBoxuPDWE1aOgUZYDasLfrEClODZxKQdhPzdj66S9UWLmt/nAHiVPjp35wgq+FUFWgxZd3j4BKz64RCqfJadp4UjhDjd3K1SIrv+nsHi2nQrfp4DvJY40ZtkasYnxythKapLa69A7HrZTu3C/gIQDyc35TJN32dlm+PLQpae6GeKmfAP4WHSwquRgun0QceJdCsPhgaTILXM4l2y0QC4dHxRe/vouWLmcXQhZHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tm1P+0VuN93o5CakgosbqIzl7aA7jai26H+1+0dHoPk=;
 b=lX8UjJB1jC1H6mprFmvn7lFZ45LXSt9qNlQFyfDSWlNgxF40E+4+YJ0XZDeFgJqslVYLyaekkIbLsRw4oRrI1WuOvUf+WOUA18HFFplDUHGhIgkjKofonN+GoINtzNx6IZJDzPoQUqfUS9d3D27wH0Oa+24nB7YRvoj4i3fJPqADvKSP+BIqlfLhkqU/Y0CStk7ihbGfuEiMKd03heIqDHfNvgKLIPUOIf8XYx/3/bCoAqhed1rBFzttnjTWFo2qV3EvJhw5n2dyDW/jEarBoR5adjTq20Co3PEk4YEs4GkyWkovM6nsr7OOev46rytqeNtllsxCb9wOPdHakJiSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tm1P+0VuN93o5CakgosbqIzl7aA7jai26H+1+0dHoPk=;
 b=rj6KsQgFlMvNaaVsk1UFcyhRdiBMQEDfiXAES3jh44zp8U5pNPVra+ctRZSxRllPAWoyFfnkkKVFUz3cESwlJfjLgggpsaVje1tqnvhQseONhaQAe+jSr2rreSv6Qbu3xYata1RfGYRgW7Gg64FO4WxJXlJh1J9GBDtKELLldf6+pZMH7s2krDq3sra7OvX/bc60kts/E0C8Tcijd8np2dMRQ8gw6mMvgtFbYCOT2Ra1lc7O2+1uJdVVJuyGUST0SqZC9RDxzSittQaAWw1Ywu8jC4q47AUCcyWqQzJlyhFQJ6HBxhHuTArng5PttzIemGlNovkGLPHZQepPZlXB7g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAABW/AIAAP1GA
Date: Mon, 31 Jan 2022 14:51:35 +0000
Message-ID: <3ff7d8e5-f612-92a0-6cc6-cf620641813c@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <YffCWGuP9ny8zG2p@Air-de-Roger>
In-Reply-To: <YffCWGuP9ny8zG2p@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5acd6d6f-2068-4b55-36c5-08d9e4c92dc4
x-ms-traffictypediagnostic: VI1PR0302MB3262:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3262A280865255FDA4C1C8C9E7259@VI1PR0302MB3262.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zYikjQN9OCzdYbZV15i03El86F47ArRL8a1FSzTjNBFQXnu1G9TLCPbjCsWO986KWzG1anDvm1C+0Y9kVCBg0zJsvvpi1ARJmZaskeJAlc56KGpsrf7+vqni3/rmAu0n+zfs7bWCigAUR+kYvPqD8qlxckmefxIVw5alIVJq9fUNLAZ+auvD1UAkCXAlp3is8+2gsGw8bQrvuoXVL+COgfao/SQpwrLBh/sGZHMxH2anw5V3cswqpos0XbgLKiXns2Bc6k3hh9p0OHXlXwILUSZDf8Odenfxq3rlBHwllqWxbORA9HBr/Pzl3kAkjFdQSsc9jSPaDC4ujHS4g7f5JKAg9gqqjHOclCmeZj6G3egzqCbESnAxyN7Aa7pfdYj7mq/lYbmfU5R0qlKAV5RPpFR/+X8yHtY1gp9rg60w882gYAqqsssFsjj3jJFQEUcTCGi06duvdTfYQGfsZ4Dab971e0xFzwYyE5tpTICGY7q6kTRPZsgFs2jVQtf556M3oL9+svKiccLDBDIdxBXTedhMAw3q8wzTU7UVyoC44R9Q/3e0wmZT41fiP/J28T2EA102ur2hI53QwZiZDmk6LJ8adK/Y73x5uB4T1VHiMATYMhK8RleSN5SiLDQoQVOZTreQYMZ9pA3N86iMXDwDwu9mINRN59jPwNVM1SMpEpeX/PCU7NnxLJBs6SVnGX7ynwfCZEF2BWOexMx3mDKawHC1ZbM1O+hgDsmP1i8NBF49sJ6SwO/Gj6ZmWqhUWhvd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(36756003)(2906002)(26005)(38070700005)(186003)(4744005)(508600001)(2616005)(31686004)(6916009)(316002)(6486002)(54906003)(7416002)(4326008)(91956017)(66446008)(66476007)(66556008)(66946007)(76116006)(5660300002)(71200400001)(6512007)(86362001)(31696002)(38100700002)(122000001)(6506007)(8936002)(8676002)(64756008)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFQ3L0R1TWdXMjJuWlpKdmdacGZWaDhhZVpmOGpMTENidmR1KzBoZkFGYVBW?=
 =?utf-8?B?eXI0L2hVV1QvUm1aVEZwNHBhSmhncmVUcnVldER2dGFKVFRReXY1cU43UWJZ?=
 =?utf-8?B?NlRWR0djaTFadEFoZSsxS1M3WnRzOEVvZU96VU1VTC9WNUtZVkgwczdtVlBM?=
 =?utf-8?B?ZnY3MEZlTHNWaThwZTJWZ2o3YmNEMzNnc2RmMnNuU1lvV3hwKzJFa0FWYUZl?=
 =?utf-8?B?MDViaHNJWEQxQkV2QjFOUmFSZCtjem93UVorMmdTaWRQUEEyRHJZY0hLVGZw?=
 =?utf-8?B?SE54bVlWVEYyZ2RsMmpMNjlPRGVpbUJlY2pydFE1VU9VL0RWQkxDWGZ6ZWUy?=
 =?utf-8?B?WFQ5WkFGOW1WY3BqMnVMZnBTU2xyc3l3b3lHWUxjRGdwT1cvTmhKTldyMmEy?=
 =?utf-8?B?UG9CMHdteFEzdmttZ2hhbStkd0ZWamZ6M0oyNkFVekpRR05ObkxJWk5zTXhX?=
 =?utf-8?B?RkNlOW9nSmkxNDVVWERhQ2h5eFlkSG1HNWxuNlYySmkrVWpUbHFZMzIvRy9s?=
 =?utf-8?B?K01pTFRienhqV2FPVlFxRk9MenU3QitNeTYwU2hDSjQrejFiSHg5SXhuOXc3?=
 =?utf-8?B?N0RWd0FrUks3dWxZT2ZYTHk5MHB2TDRYRmdXOGRnYndOS0U5L0dKQzVhbWJ2?=
 =?utf-8?B?NGRnbExDWFZNdW1UUFBNQ0h0aGtUSTNqTG03NU9zc0xpelQya1l1Q05zUmlz?=
 =?utf-8?B?dDJBeUtXRFYxYTBWMWpvOWJJeTFTNXF6TWNKUk0rM3d0WGoxd1NnRFR6SExI?=
 =?utf-8?B?RS9wWTNXSEhKU2M1RHhWd00zSVFyd2ovWjlKR1czd0hwbTRIRUZDK1lJeEpF?=
 =?utf-8?B?aXFBZDVmQ1NzbjMwZWNXZ3dlaWJWNXh1di9nYXZiUU5vd1d2SkhrUTY4eCsr?=
 =?utf-8?B?NjByaE54azFrMjUyMXc2cUlKUVNTVW5jU1Vuck5pVHpDbjFYdUZkNzk1OEEv?=
 =?utf-8?B?Ump6SnRDeVVTVDBGTldFR1ByVUNqL2JVa3FCSmE0OUtYWTdLNTd6Vng0WjM2?=
 =?utf-8?B?THdJOGhVb2NaRlAxK2ZmSFJMZTFOeEFwUytWclozQXdEb1dyVE0rWnFudGZH?=
 =?utf-8?B?YnVnNGlMQUlUVGxPYTBWY2tBQThIOEJUOEY3MVdMWUR4TXoraGpkSnlBQzU3?=
 =?utf-8?B?czQrbUJkRlJGM1kwUXc4djFEUElFdXFQSmlxV2tTQ0huNE5JcEJBdWRyS0NO?=
 =?utf-8?B?SWNLcDhWdk93NG1teG9RY2ZZRFNCK1RPYkR3aFpoNnV3NG5hQzZGc3VyZXBY?=
 =?utf-8?B?VFdvMWY3aVNWdlE1amIzZ2pGbFpOcG56Q0xxbU8vZ1Rxa2trdnlxOGJiRkFS?=
 =?utf-8?B?dkgyWTJ3aHNIbzl6YWp0K0JpeXk3WnZzNDFMQ2Z4SkMraTg2YjJUWVRsZjZF?=
 =?utf-8?B?cGMwZTcwZWswTUlQSWg4dVAxQVNYdEw3RGttZThUQWphbGt5bElNVUYvUVJN?=
 =?utf-8?B?ZVEwN2QrS0hMc0Q1Z1kxamJTazV0d3BkQUM5dDRrWlhsK1J0TXNVUnNxMDlI?=
 =?utf-8?B?VDNmZnJjbzBXTWFRRmhTMFo1TnlLYTRVMmZhZGhRQXlXZW9CcUlrNElaaWRq?=
 =?utf-8?B?cHI4KzdIV3pzU3c5c1pxcUNucHdya1NISzVwdjlBVHBKS2ZweWduZkI5b0sy?=
 =?utf-8?B?Zm9PL3BYdHV5elprbGs4WW9CMUJ2UTVQdnQ5R2V1NVNGbU1pNVhMVThETmdK?=
 =?utf-8?B?MlY1OTYxUkRkUlZwODhhSUtyOHFTVkQrN3VRTlVqVkp0WWsvQkVkMXRza05C?=
 =?utf-8?B?bkUvZ1NzbFBsWUVveXVkYWxzaVJNSkMwZFhTbjUrWC9ZeENvaFFpRDRrWndQ?=
 =?utf-8?B?bTJpL1lUdnpQQ3BCcTNwaDJKNHI2cmhnUENCaEhicTlqOUd4U2RkUy9NbmZm?=
 =?utf-8?B?SHR6cXY2Q2U2Z1A2a3BqOFRkcjl2ZGxoQ1FtZldncUV5aVdodVhsUk5ibjZw?=
 =?utf-8?B?STI0L1pVTjVMWFlFcmVGYnJqSEpTdG83OWcyS0lhWFJxdDdGQzhiREkwTWRo?=
 =?utf-8?B?VnZ4bUY5UDZRdmlGbWRXYnZBNEhWK3d5T0k0OHpJUTQzcC9mNHlmKzRFTlF0?=
 =?utf-8?B?SnkrSm9kdlYvaXo0b0hWK2V2TTVIeHpCRFlPVDNnRkszVDlVYk0zejhXZDcz?=
 =?utf-8?B?eU1DeXN5WUwwYkwrVVBpcExvSC8vV04vRzYzYUVuTGVwYkc3VmxIZG9EZkZQ?=
 =?utf-8?B?M2x5MFNNaDJqQytiYW9RbHpuNWFRWnVuU01iNVVCSHB1MllzZWV6eVV0Z2Vm?=
 =?utf-8?B?N1BmVHFkOXZIRUVYZm1XSHFqdzU5UGVxdkFTTy84bE1Xb1ZxRzc5MnFhRkhT?=
 =?utf-8?B?ZmxmbXVEWWJhMmFTRGs3eWY2MmVjRXozYTZvTUpUOVJLWmRWMFR1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <678DA17B35BDBC4B9B59D0119930B62A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acd6d6f-2068-4b55-36c5-08d9e4c92dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 14:51:35.5466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W68+LyGH5XIx5w3cdgcn1s2tDCR3jMpTA8DUOiXWXQyT9a0+ml0+3ohq5zLJQKRkhXPGdLEYSSWZD3YVnonpmvFNWzRW3+h6MJ7TfstYNPODn8B3JtSA53yAwy0TjpBx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3262
X-Proofpoint-ORIG-GUID: NyzYeFzroC1xV345EHIBOKAjVueIl6br
X-Proofpoint-GUID: NyzYeFzroC1xV345EHIBOKAjVueIl6br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_06,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=956 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310099

DQo+Pj4gSSB3b25kZXIgd2hldGhlciB3ZSBuZWVkIHRvIHByb3RlY3QgdGhlIGFkZGVkIGNvZGUg
d2l0aA0KPj4+IENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JULCB0aGlzIHdvdWxkIGVmZmVj
dGl2ZWx5IGJlIGRlYWQgY29kZQ0KPj4+IG90aGVyd2lzZS4gTG9uZyB0ZXJtIEkgZG9uJ3QgdGhp
bmsgd2Ugd2lzaCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4NCj4+PiBkb20wIGFuZCBkb21VIHZQ
Q0kgc3VwcG9ydCBhdCBidWlsZCB0aW1lLCBzbyBJJ20gdW5zdXJlIHdoZXRoZXIgaXQncw0KPj4+
IGhlbHBmdWwgdG8gcG9sbHV0ZSB0aGUgY29kZSB3aXRoIENPTkZJR19IQVNfVlBDSV9HVUVTVF9T
VVBQT1JUIHdoZW4NCj4+PiB0aGUgcGxhbiBpcyB0byByZW1vdmUgdGhvc2UgbG9uZyB0ZXJtLg0K
Pj4gSSB3b3VsZCBoYXZlIGl0IHdpdGhvdXQgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQg
aWYgeW91DQo+PiBkb24ndCBtaW5kDQo+IFdlbGwsIEkgZ3Vlc3MgaWYgaXQncyBub3QgdG9vIGlu
dHJ1c2l2ZSBpdCdzIGZpbmUgdG8gYWRkIHRoZSBkZWZpbmVzLA0KPiByZW1vdmluZyB0aGVtIGFm
dGVyd2FyZHMgc2hvdWxkIGJlIGVhc3kuDQpJdCBpcyBpbnRydXNpdmU6IGl0IGlzIGVhc3kgdG8g
YWRkIHN1Y2ggYSBkZWZpbmUgaW4gc3RydWN0IHZwY2ksIGJ1dCB0aGVuIHlvdSBuZWVkDQppZmRl
ZmVyeSBpbiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIHRvIHNvcnQgb3V0IHRoZSBjYXNlIHdo
ZW4gaXQgaXMgZGVmaW5lZCBvcg0Kbm90LiBJIGNhbiBzdGlsbCBkbyB0aGF0IGlmIHlvdSBpbnNp
c3QNCj4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

