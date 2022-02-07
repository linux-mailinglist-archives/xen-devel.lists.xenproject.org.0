Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7A4AC151
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267067.460772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH56l-0007JD-OM; Mon, 07 Feb 2022 14:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267067.460772; Mon, 07 Feb 2022 14:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH56l-0007HO-L9; Mon, 07 Feb 2022 14:35:11 +0000
Received: by outflank-mailman (input) for mailman id 267067;
 Mon, 07 Feb 2022 14:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH56k-0007HI-RC
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:35:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ea9a9f-8823-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:35:09 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEgf3023712;
 Mon, 7 Feb 2022 14:35:05 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350ur3cq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:35:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3815.eurprd03.prod.outlook.com (2603:10a6:20b:1a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:35:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:35:02 +0000
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
X-Inumbo-ID: 25ea9a9f-8823-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1SN0MQZIZr0om6V/g9lCvzQ0iXCW0uNtgmNHj7JAoasq+XzuYWYMSx0pqIBYMfc8x0A5tOmATxf+lkFAOZTjydWpycCYR4oipDIV9ZjeeWOEmabN8cGCdM71kg4ODdE4jg4sxwgoLI2gar+X6TK7d83Zp4s//72VwOz1NJq4kKaCPIJquJech0EphCFdvD9bvXilMblGDAve1byuluQ0oOaUFAzi+kok26iPGAMxcAFOGpXsmvj8FCI3dta3ti65ONoOu0bfDEkxeS1SbQ6b+f21kbDi6yGbug/R269eIh+QHfNv9N+qARakJoPQJZaEj7hmVjWx1q6Xw6plNaBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRojDeEmDv4UlyC6iOri4DoNWhCV9lp6lLLGdRBtIvo=;
 b=bBNMWmiSrKIDUSMSBCZK2Zy25kvXijROeuNIHReR05/cYuwzyRWlP1I/fXEfvESpHsqESmOz12H1v2HrNTO8rkEiiBouohfBvwBFWxm47Ay/JWpCm3MXaqn3BtTynVvKoTnbRGEHHCXiARK8qviBqYF6zdN8gNWGz2YxAqyzIfPSFvMk8fK0e2ncqfwRC159K1Md6DazIAePZXEAlbgWw5u3l9mtLMZpAfVs50WPTuPbS3+ALtMP77E8zJy08bwAJ7E1jRVSVeZByM3UFyP4kbH4h9pyf+nAKz6Cj3CIkUYs31/Yjo7Rlw23vtTalbM/xzv3iTmsvIo8jpBUWipG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRojDeEmDv4UlyC6iOri4DoNWhCV9lp6lLLGdRBtIvo=;
 b=EZJRJ2EoMDpryQYSJo9CKSH1D+ZfAQC8DCk8jJPbLGehH9Vqo7uYyiQjd28gzj2kAAqWRrWysbxcyE39ABPO2jH8q3Be+j4dKSn3qgSyVuU51fxR9GKox0txX62wIptUJjUhuDTsvxwje3jnFuVmVzw9mEzfXQaMF8Yg7AJIjCZl6Gzsy4+i4lJvSQp1/oPjANm7JQIvXHixbG4pdd8UWbI0oHJCz2Cuecb9JtJLPCDKgR+tII21SWgaUIPi9Jnui8SQqlWj9hqz1/3VUe+eTvoC/1tcQLgH5CiYOcejhDtb1nSLfLm/nmpaXy03VxlHIe8dCeVqew0ELJTMv4BtYg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiA
Date: Mon, 7 Feb 2022 14:35:02 +0000
Message-ID: <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
In-Reply-To: <YgEsRuckQJIQlkzf@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b94cee1-0fb5-4edd-2b16-08d9ea470676
x-ms-traffictypediagnostic: AM6PR03MB3815:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB38152BD22386AEC0413E461EE72C9@AM6PR03MB3815.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fJ1IKr54q0IovgOnZ2OVGhWR1G9OruFAzegkLLD2rxARz6IBfSFgUUn9nus5k848WsGavOhO6oFfkeJw+XsGanCZtfp4EkZgl1UYlDIkkiQQUdqvjoB2dkSjgWHLmA/Wo/yQAdYR4fkDJMfyKcpTJbqSQSuj6VEpRZzp+4dS6QyD7OsQRPARMcvRo48ZCdwYR/WogNzIXfy1kJtKVueHRo1jLIw558uz3CAxbIYP9fIyRMrJAKbd4DQwm2tdcw4n0XKUQIso7IH6FfFTYmUhkM9bg1v100Oanxjepn6xnGi74zg09Abj/Y7SW+8Wa8SX+5+d36Go/uQiFvJ42KyYGBJzFzLQ1+F7KZPvZPqnJtyLftp4qUBcFB8lW0C1FFtXi0lc4jcQsvk8VNyJLlM/NxHdDLvodx7QTgv8W4wISVAk7zwQaWJk88AQtG+uOJiO4a+fXGUD4OKHgEfmr1GCmjlTAOWWB+XesD8QefkqxGxkVrBlWvJvkRi17Nqty+0tESqZx14RmoSto/qru7EnL40HRr2QChi5v0HWiDyKU1pBNhxjdNaFnYvYOhYDG+Opv9YeHKMXqYvbvi14Rq+gjsN905t60ScxEy57dHM8rh99JjP3Q0FQPG1G/87vrgCxLEkqlk4xc7ZffxQ7i7vQcGkYMpYLyukZ1M2qtBFox4i95aQzuAwV9t4uNZ4Y/YDzATm/1cjcdzk3uWBB0Yjxs6xNo5q5EjnEKlOEC6+3pwk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(31696002)(5660300002)(508600001)(186003)(55236004)(6486002)(7416002)(54906003)(110136005)(107886003)(6506007)(36756003)(2616005)(26005)(316002)(53546011)(31686004)(38100700002)(6512007)(8936002)(71200400001)(64756008)(66946007)(66446008)(66476007)(66556008)(76116006)(4326008)(8676002)(38070700005)(86362001)(91956017)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dlpHRFlzSTlZVnpuMHM1eUNYWHZhU3RWT2Y2elRrc0ZLNVZxSWUweUJoTnFZ?=
 =?utf-8?B?VjIxd3JOV2xjSmRYZktCYm9DcXBvc21PUE9KU0d2THF2Sy9BUjNOb0pVazY3?=
 =?utf-8?B?YktjUi9iMGtWVm1zSDkwaHJVNUdvZ1pqejRTTE16R0pLRjJqMDlsL09jcVZM?=
 =?utf-8?B?Q1ZQUFVQWEp4R3hxaVpHQ214Z1hFeTZwdzcyMFllTUk3aExGYytPZmZQTnp4?=
 =?utf-8?B?NW5WT1R3QzBVWFNrSFVsZGZ2ZHJFQm1GdnFoV1dQRkpQdGgxem9UbTdQZUxm?=
 =?utf-8?B?WjZUd0Y0dUpRQlpkcWdYZDFVaUlpUUNOQ0dSV205UjB3b0lQOUxpbFlVcTBa?=
 =?utf-8?B?UXBtU1lyYlQ5cFFqSTRrbGd3QTlsK1U4S0NjblBtOWVTak9iejQ3OVZ4dVVD?=
 =?utf-8?B?ZnBiTW5pQWFXL01samFtNkZqQzdvNENKSjllM0s4cE12SWtEanRQQmhaNUc3?=
 =?utf-8?B?V2hIY1l6ek5LWDRYUE4wV2l3S09LOXVvNXN1WHR0V1lzNHExN3paZXpsczRQ?=
 =?utf-8?B?c05ZWU1GS1RMbkYrOEV1OEFGbEo2SVF5VFFBT2NobE9IKzlnY283cmFFRktn?=
 =?utf-8?B?bER6WmgxSHpZMmp1azBINnNybk94RnlrblJsZ09tVGp3aTJzM0Q0SDUvZ3V2?=
 =?utf-8?B?WUxrVEpjNk1BM3RBcXNCRUJFZHBUdU9QY0VMWDZwUWxDS1N1bjg3djNPZWEr?=
 =?utf-8?B?cXowRVhhWXBYaDA3R2RJSjJjWWtuZEJPMklBNFAwaUVXSm9OTlBPREJXOVQz?=
 =?utf-8?B?cCt0eEdaZ2kyMENpa3loS2pkelYwUGVvaG42b2FrNE84MVd4T05iazh6WDI3?=
 =?utf-8?B?WVlReXlHUGdRNTY1WmFLRmZ4elc0NnVVUko1MElwY2M0TnlLeERBYzFlVVJn?=
 =?utf-8?B?ZlZkTnFDVHF4YUFRZjRkcjQyYStlQUtrVzlXSldkeEJYeC9JcWlmWG5QZEU4?=
 =?utf-8?B?dUZpbTNmTnFPUk0yNmNxRFNvNkFqOW1jTXQ5VlVwUFB3VW1scUJxdUZUU2Fo?=
 =?utf-8?B?dTVzU2Y4WGM5Q1VFR09EWnVqZ3RyZ3BnUm51UDJzalBuS0c0YlZ2bTdBTkN6?=
 =?utf-8?B?dmtVRGplM2dXNlZLcUVZeXllU3hTRFJIVXB2aXJiU3AxZUpkZ2dWTHhPRUxu?=
 =?utf-8?B?bmZPK0pmZDBYRUVvRFZnaC9vV2pMdHBCajB4SjZjeFI3TENRQ2M5cjBSRTU1?=
 =?utf-8?B?aGhFcHdPS28rSmdCRVRueFBHeGhtdk8wSHJVRXhocXF5dGlvaUV2S2pJeDNI?=
 =?utf-8?B?bmVYVWtSSndWUFdhRGZRYXhyM0lZUkFaaFZHVzFHTkNDMENoQk9GOXlsL3VG?=
 =?utf-8?B?b2NudEFZdXR4a1YvQXpSemU0bVFid09nbk9hUEg3T0lReHhDcjk5ODJlak02?=
 =?utf-8?B?by9SWjZYbnZlUHdpckZ0MUVHUDhyUEc1TE1hcmdnM3U0VHRnRVZyQnhhYk14?=
 =?utf-8?B?ZnNsQUQwa2RLSGwrMHZJZS9ydlBROWcvSUZjdGpVY2ltTHg1eFBQVFNsVURR?=
 =?utf-8?B?Yml4NFA2STBDQ2t5SnRkMDM1c05NR2s0STBGYnRscFNvWTNMOHE3R3l4cEl0?=
 =?utf-8?B?U3RBMnI2dGtoVjYxUEc2NEF2YnJiSkRVQjAzZXFKM2xaSHZGR0N0cDJVd3ZR?=
 =?utf-8?B?djJQQWZ6aW5wMTN6V3ZFT1V3VHlOZzRCSGF0ZmFjcm8zMWlXSXFzcXh2V0o0?=
 =?utf-8?B?cGVHQUhjcUZoWHpTcnBTZWlOMmlLTXp5L2dZMDJqN1VwWW16ME9YemMveHhQ?=
 =?utf-8?B?QXpSaldoaFNLUHdGcmtlOW5ZYkVCMlVmWEpBRVZWOVBHbHJ2dVAyWS9GaGty?=
 =?utf-8?B?b3dkcG1ncXVEODBNdk45cHZrUU1EMTlGUmNhb2MxYThNMVNobHZOb2F0bmhv?=
 =?utf-8?B?K1ZwU0drYWtXN256TEl4bmp0ZklGNC85WlpYT2FNQUR2REpDWDcrMXpTNFNE?=
 =?utf-8?B?Smh3MHZldEZCRklFUjhnVUhjdTdIbkdyZ01naWJnWExmV3M1Z09jQnNJS2Fx?=
 =?utf-8?B?YWVXRjZlYU96aTc4c0N6TjZxMEkySUpuVVZFb1dLa0tvdHVFTFVvZDl4Szhr?=
 =?utf-8?B?RVZsb0xJRmg3dDF6a29DcU5PeHNtbmtyM29VVm9uWndycEdkeVRIRmxzMnVD?=
 =?utf-8?B?NFNZblhkcUIxZDVUMzBSWjZQTDNsbmRIM2dNMW4vVnlNZ1ArSlNhSHhaUjBy?=
 =?utf-8?B?OVlnY2w5YjUzUllQZVR0dENiOGFXeU5yempnYjVIUFArc3dwV1k5QU1TYWxN?=
 =?utf-8?B?NmJNQ0tTR0NjY0hXL0JJOHNFb1FBU1IrZDNCblZBQWp2YVBUc3owSzRxd1FH?=
 =?utf-8?B?bHh1Z2xPZ1ZnRkNxUW9XbkhiR3pOLyt6NUFBZmJ2UW1XZ2xBNURmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D6C8A1A12735B4E84F4B8799B8BAC84@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b94cee1-0fb5-4edd-2b16-08d9ea470676
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:35:02.0058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sCuGEK8Cjnc0tahrLGpCio3M9Ox4AA4zHYibnk5eNsJPEDO9HBawM4AYre7Go3rD84/cn22/r4aua1kza0ResSNtycOWO+CuFsg7JsCULqyixiXmUmQmi4v/Q4ojFF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3815
X-Proofpoint-GUID: q7owqDPmlrZe65JmuYCGcQHagohK-EGy
X-Proofpoint-ORIG-GUID: q7owqDPmlrZe65JmuYCGcQHagohK-EGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=543 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070093

DQoNCk9uIDA3LjAyLjIyIDE2OjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAwNywgMjAyMiBhdCAwMzoxMTowM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
IE9uIDA3LjAyLjIwMjIgMTQ6NTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
IE9uIDA3LjAyLjIyIDE0OjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBJIHRoaW5r
IHRoZSBwZXItZG9tYWluIHJ3bG9jayBzZWVtcyBsaWtlIGEgZ29vZCBvcHRpb24uIEkgd291bGQg
ZG8NCj4+Pj4gdGhhdCBhcyBhIHByZS1wYXRjaC4NCj4+PiBJdCBpcy4gQnV0IGl0IHNlZW1zIGl0
IHdvbid0IHNvbHZlIHRoZSB0aGluZyB3ZSBzdGFydGVkIHRoaXMgYWR2ZW50dXJlIGZvcjoNCj4+
Pg0KPj4+IFdpdGggcGVyLWRvbWFpbiByZWFkIGxvY2sgYW5kIHN0aWxsIEFCQkEgaW4gbW9kaWZ5
X2JhcnMgKGhvcGUgdGhlIGJlbG93DQo+Pj4gaXMgY29ycmVjdGx5IHNlZW4gd2l0aCBhIG1vbm9z
cGFjZSBmb250KToNCj4+Pg0KPj4+IGNwdTA6IHZwY2lfd3JpdGUtPiBkLT5STG9jayAtPiBwZGV2
MS0+bG9jayAtPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJvbV93
cml0ZSAtPiBtb2RpZnlfYmFyczogdG1wIChwZGV2MikgLT5sb2NrDQo+Pj4gY3B1MTrCoMKgwqDC
oMKgwqDCoCB2cGNpX3dyaXRlLT4gZC0+UkxvY2sgcGRldjItPmxvY2sgLT4gY21kX3dyaXRlIC0+
IG1vZGlmeV9iYXJzOiB0bXAgKHBkZXYxKSAtPmxvY2sNCj4+Pg0KPj4+IFRoZXJlIGlzIG5vIEFQ
SSB0byB1cGdyYWRlIHJlYWQgbG9jayB0byB3cml0ZSBsb2NrIGluIG1vZGlmeV9iYXJzIHdoaWNo
IGNvdWxkIGhlbHAsDQo+Pj4gc28gaW4gYm90aCBjYXNlcyB2cGNpX3dyaXRlIHNob3VsZCB0YWtl
IHdyaXRlIGxvY2suDQo+PiBIbW0sIHllcywgSSB0aGluayB5b3UncmUgcmlnaHQ6IEl0J3Mgbm90
IG1vZGlmeV9iYXJzKCkgaXRzZWxmIHdoaWNoIG5lZWRzDQo+PiB0byBhY3F1aXJlIHRoZSB3cml0
ZSBsb2NrLCBidXQgaXRzIChwZXJoYXBzIGluZGlyZWN0KSBjYWxsZXIuIEVmZmVjdGl2ZWx5DQo+
PiB2cGNpX3dyaXRlKCkgd291bGQgbmVlZCB0byB0YWtlIHRoZSB3cml0ZSBsb2NrIGlmIHRoZSBy
YW5nZSB3cml0dGVuDQo+PiBvdmVybGFwcyB0aGUgQkFScyBvciB0aGUgY29tbWFuZCByZWdpc3Rl
ci4NCj4gSSdtIGNvbmZ1c2VkLiBJZiB3ZSB1c2UgYSBwZXItZG9tYWluIHJ3bG9jayBhcHByb2Fj
aCB0aGVyZSB3b3VsZCBiZSBubw0KPiBuZWVkIHRvIGxvY2sgdG1wIGFnYWluIGluIG1vZGlmeV9i
YXJzLCBiZWNhdXNlIHdlIHNob3VsZCBob2xkIHRoZQ0KPiByd2xvY2sgaW4gd3JpdGUgbW9kZSwg
c28gdGhlcmUncyBubyBBQkJBPw0KdGhpcyBpcyBvbmx5IHBvc3NpYmxlIHdpdGggd2hhdCB5b3Ug
d3JvdGUgYmVsb3c6DQo+DQo+IFdlIHdpbGwgaGF2ZSBob3dldmVyIHRvIGRyb3AgdGhlIHBlciBk
b21haW4gcmVhZCBhbmQgdnBjaSBsb2NrcyBhbmQNCj4gcGljayB0aGUgcGVyLWRvbWFpbiBsb2Nr
IGluIHdyaXRlIG1vZGUuDQpJIHRoaW5rIHRoaXMgaXMgZ29pbmcgdG8gYmUgdW5yZWxpYWJsZS4g
V2UgbmVlZCBhIHJlbGlhYmxlIHdheSB0bw0KdXBncmFkZSByZWFkIGxvY2sgdG8gd3JpdGUgbG9j
ay4NClRoZW4sIHdlIGNhbiBkcm9wIHBkZXYtPnZwY2lfbG9jayBhdCBhbGwsIGJlY2F1c2Ugd2Ug
YXJlIGFsd2F5cw0KcHJvdGVjdGVkIHdpdGggZC0+cndsb2NrIGFuZCB0aG9zZSB3aG8gd2FudCB0
byBmcmVlIHBkZXYtPnZwY2kNCndpbGwgdXNlIHdyaXRlIGxvY2suDQoNClNvLCBwZXItZG9tYWlu
IHJ3bG9jayB3aXRoIHdyaXRlIHVwZ3JhZGUgaW1wbGVtZW50ZWQgbWludXMgcGRldi0+dnBjaQ0K
c2hvdWxkIGRvIHRoZSB0cmljaw0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

