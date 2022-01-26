Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B749C56F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260711.450649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdqp-0007yL-4D; Wed, 26 Jan 2022 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260711.450649; Wed, 26 Jan 2022 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdqp-0007wK-1G; Wed, 26 Jan 2022 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 260711;
 Wed, 26 Jan 2022 08:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9k5=SK=epam.com=prvs=3025680a51=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nCdqn-0007wE-6H
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:40:21 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9737068b-7e83-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 09:40:19 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20Q7gs46018100;
 Wed, 26 Jan 2022 08:40:14 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3du1n507cj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:40:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7789.eurprd03.prod.outlook.com (2603:10a6:20b:3df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 08:40:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 08:40:09 +0000
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
X-Inumbo-ID: 9737068b-7e83-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BikpthesnqcEzJ8UHvnCspvgF7mOXM3EDXVZPrjmTAMBULi68VYFycQ046nNLBBF8SVLylEL16/2u3WtXB7jEHVomIoAmAEHZhBtoSMiPLkSCTpf8/ELyIyFicT3DJ3McciZV6Ut36M6nr1tBHPt+45xHsuFlrreZ6v4VcjzZRTXmx1gFu6ycL6ZULYuP4T+Hk+f9Fsbw1Eh0HbBJtB88fX+hBQh1MV2QaPFWP9JnOkEzffFNJ3vd+E181jqK/yLo/qAmSk20HO0JRCoVmxXyZjc97JzCpeaqhgV7tM6scIbEFjDAQ7WHnPl0y0t6z7uy82i6RaNzAwwi1q3IrUDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5HvTzJ/A4gaMa6cI1K3lbfMIrMEdSx+vA0Oy1tDceU=;
 b=FANJUFBgBU5as5n+SMwuFC8N6YEWSy1vErCKqJ+QkJLXL8ZCtqKZQUz3up2dEWm/MdGPYXH8bape16Wvj8SWEbqdSZy0gGv9H1Sigek8eKr6JOYtkawYkRLoUSa0/YFsnHoiHXgI48sVsnPrHDBzioMHKTeHavNL88LaaHhCvvu33+1BpE3Qa6f/Wy5OmjOstEOLhFMzG4/ggMAvtLlg8Mttv/Se7BXwjscnYA4l1IoPZWxiKE4d45zr39uZK2blGOFtcKYAobRDu4uqg5kyoM0z5KgTJKoDbhtu6P2jQ/sKa0zVUbLwUNEb/83JITKTT7OdoFcGFCU1B6ZkNcWD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5HvTzJ/A4gaMa6cI1K3lbfMIrMEdSx+vA0Oy1tDceU=;
 b=pcmtyXzBgRunQDxBZJYhxeEWeTtX/gb/d9ETJgMyz2mcme/vmt+KHFtSXclRdBpv43pItz0fXibTB9fkTkXmQ3YYkBWTPN+Fr6kvgN+rGdqzomT67iSHgy67NqYqhkWmp8H6kpoYDx4j695b1a6K3kCOfPnfPD24MFxhioE+1NCojVpDkwuHhJlVsByfrEkTwDL7hD6BIMA1ZeginFJKfBXB6S2l3BOrxdCWyF4VhnGQwvQmledCVfKNBMgL63DHmnUcCGTV6QezC8o9MgDPlMfJlM95h/jJCgyaLrw/gT1b/RCQB8WhgR5Lg15CboolP/bTiT6hWIP2E8gssPLv+w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
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
        Ian Jackson <ian.jackson@eu.citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Index: AQHX4ewHDku9OOCAtECwEMPLB4JkU6xeOMoAgAGIjICAFZt4gA==
Date: Wed, 26 Jan 2022 08:40:09 +0000
Message-ID: <5f00c94d-069d-ea5f-aa1b-1861fe8a7cef@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com> <Yd2ffPULbmNpSmaD@Air-de-Roger>
 <d738229b-11ed-db77-f313-5f1618ed95a1@suse.com>
In-Reply-To: <d738229b-11ed-db77-f313-5f1618ed95a1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a39f74-3b25-4c1b-7de2-08d9e0a77651
x-ms-traffictypediagnostic: AM9PR03MB7789:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7789595CB177F31C33C4AA9EE7209@AM9PR03MB7789.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AHgu/Z2iUcYCCpQac/LaY+rP0xT6m7tumUGznYxp3N2e1wxhPcWwlj5dR8eLVA/uPqtQnUDt14Pkx6KstvfD46jWF1/RtthC+xVlShybkmVjAzLX8b7b7anL5IA6sS7Wvxp4L/+fH1uyX6SXVrofp5UYyviQJzmVTOmsiUM8vryN3ftHzx0zbbsX2dmZBAicfrwwlgik2hNBQAMyluQDtU9ogh11UOoJJ47v626STiQ9QtoBhOQ1q9y0Ra6bIDNe49VBuBib7NdXp/5nBAWE7akYfnaP1cWgxXfxn2DdElwaALoARbs16SzSr+O65W/2Otm0Wxc4oBpae1M2olyNPRmXksk5q0F0th3MjO9Etw4q0hBZh53AUfU9U37lyEtWB8TjK6Qom2NrckGPz29xY4caXDuQOnavFmuMKkHyqzx5Wd/UOo/wpo2vKB25QMLtsbWMLoEH/1psktqkct3JWtXVHL23VoAAYjg+PogToo39ixVIwu1So5amz3JKMRKpStTZRYQt8pypdz8ax0htEF85vwXLpXowXo5Hfw8r2m4f26/CV7v6S3GHTDxs2Fxpdure9OccjceBRwhmyTin68ihS3dydkY2Y5HXZQF7RT6T/E87vlK/Cn/HjhoE5IV9GSKgcCCZyR7Ika6yQL2KpDZJzbsTjkY/UzeO5VrDKAbrjX8OfdzV3wgXGbL9PGymXkTwIkaGxXW57wEu4ahkyumMbTJjDlIMrg5YFbSAI7inGfPcFbBycIATXn/6UBMbtZISptJoKDfPz2UHdN0zequi1f2gxTBvaWygIxURWKpyj5/6bbIbpEB3EckKcbnx5QVklyR4iWtlPuolkeSVow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(186003)(76116006)(110136005)(71200400001)(66946007)(53546011)(26005)(6506007)(6512007)(2616005)(91956017)(107886003)(4326008)(5660300002)(38070700005)(31686004)(7416002)(8936002)(6486002)(966005)(54906003)(2906002)(83380400001)(508600001)(38100700002)(31696002)(8676002)(86362001)(66446008)(66476007)(64756008)(122000001)(36756003)(66556008)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eStpRjlnbndzQ0RyS0dHN3JxMThxWHNJR1FyVHpyMlVCeHluVnIyd1dRV0c3?=
 =?utf-8?B?QjEvdUs0dVhUWkkrcFo0OFN4TytRdVNmNkEzVzRsTk1MRWFkbGdSU0cwSlNC?=
 =?utf-8?B?aWtwc0Z3UElTZ2dIbWdSNUtKM1JwdlFhQ3E3bkFkdDlGUzlWUERXOHBxYTZ6?=
 =?utf-8?B?dENlckM4Z284SVhnMzVER0FMVlk3Szh3ZFpPWTZST1lCeWdha2k0djhuQzZv?=
 =?utf-8?B?eTczZXZPaFllRWZ5MGhoanJhRjZBVDJrTmx6bE5EajFDSnJSRDBKdlM3U1p3?=
 =?utf-8?B?UGkraWhYWmpUQkx5WDN2dnJKRGxiTWhzMDY3SmZ5NU5QK2xEdlVWUlh2Tisz?=
 =?utf-8?B?clEvNmQ2RTNFK3crWWZWVmZEUEloNkVNYURqenZWRkhJdjgwblVhaStHR0Nl?=
 =?utf-8?B?RGhsV00xVVcwSXBNK1RONHNjRWxqQ1RyaUlidnpVQWU0RjhhNmUzY3ZiVUVF?=
 =?utf-8?B?ekNHTVJqZEhDeDRnMDRkMVgxQ1JnYU5ibXNwZ0dvdG5aa01ibVBTZTliQUhQ?=
 =?utf-8?B?aGc4WXoxMTMvM3pxdlFiWXN5Y1JYSGtYb3BxWDdUUm1ITUJJOGFRb29vOXNH?=
 =?utf-8?B?R3FFRlFNOWFFaTA3a0pOSzJna2lWY2FUMjkxMFpJU3JWYVdZRFpnaGJnODlV?=
 =?utf-8?B?dnVIaGVSMzdhUkRrdmY4NUhyVlZJNDlTQ2x0Vmp4dmoycVJSRTg5QTNnYXE2?=
 =?utf-8?B?SUNEeFNCRVp0c2QrcGtmUWZ2Mmg3LzZwT1FBSjBsT1BzNzdaL1JMWlNIdUNl?=
 =?utf-8?B?MnJyV0doVnh4QXV0WllNbUVOeC9TUUczWkdUWVRrRTVHVWNsT2F5dXdPT3ZN?=
 =?utf-8?B?UmRLUjMyOUo1enRQMVo1OEVxbFNUcFhyck1KaHhYTldHNHFTTVFYRGhnNjdO?=
 =?utf-8?B?SjFpV2pLaWdPN1E1RE1qZGw2aU5rbXJ6ZmxLNWJVV3hoTmRQU3NZUWZQdW5u?=
 =?utf-8?B?bGhJK0lmcEtvbktKT1EwZVhkd3NPRHMxRkhPNXBERCtEQlhuMGYyamEyTkFI?=
 =?utf-8?B?NHIxTDZPMHNMWWdUVzBXQUIyd0oraDR4RXpjRHl6anJ5QmtZTkZLenVaeXlV?=
 =?utf-8?B?aUl6TmdxSmorZXc1N2o2UkRPdlZnejR6MUFRSXR2WjFMVWIzdFYzOFprQkVt?=
 =?utf-8?B?dEgzYkk0TUpDV2grM2VqTWVvQ3RwQlMyaWNlZ214eklyTFMyaTd5dWxKUTE3?=
 =?utf-8?B?cFMzQ1FvQmx0QzRQTjY3OXJGcEpIVXBqSmdPMG1PRmNpUXFkNFhYRjlMY05D?=
 =?utf-8?B?dGtoNmFGdFFERldkRW51YUFFMnZOdm56dU1PR3dOZkZLdkxGVk9sYWNyaVZN?=
 =?utf-8?B?RkZUN1dncXdFeUlIVmEvT0Y4aG9tamNYbkU4RUJwbURkMktMaGtTRGVRSlFp?=
 =?utf-8?B?UG9yTytvOFU0bmw1THlBNk5ZWVRIYnE1VWRKeTdLZmpCeElDMktlVERZOHJJ?=
 =?utf-8?B?RUw3UkFVUExyWFFRaHhyWHp2dElTV1Nma1RZbHZodzYvUEpGSVMrczJOV0Uv?=
 =?utf-8?B?OTVDTFp4Q3g1SnFEbCs2dENId0hhNVpkSTdDenNKVnhkOElGZ0swdC95V2NO?=
 =?utf-8?B?Um9PaDRLTWpML0tueFNvNnIvTkN3RTFGV2JyUE9IR3o3YzNOSS9QVFAxZFo2?=
 =?utf-8?B?K0duYzgyQk5iakZMYWZVUWVONGh1NnVCaTExQUlLaUp0RWlCUnVGR2V0Rkgy?=
 =?utf-8?B?b084OXFQRXZiOXJYL2NkTVVud293UFIwT3c1WFZTTkp0enBHOFBmWFp5Y1lD?=
 =?utf-8?B?MVZBb0xHaEp1VWFkOEZuYmRaeTQxWkFndFBCTnZWMlZuSXF2MHd1OUhsUUNK?=
 =?utf-8?B?ZmpKc0FrT2tIeC92Nmg4eGxYRitqeVBZdC9aUDU2SDZ6S1lnSDZNcUV0YWty?=
 =?utf-8?B?eEF4STN1eTNhQnF2K0s4cGI5MDNsNE5jQkFOUVlPMzhhWnl0dTdsV0JCVEY5?=
 =?utf-8?B?NlZSdi9ZOWFnNW53cnFWZEpLZmVrRlFRSXJzaUxCbE9TSmRjWUd2dW9NQ3p3?=
 =?utf-8?B?bWE5ZkNuSW1QdVFuTWVkZDR3YlpDRVczenNKTmE5V1Q5Ym5HZDJZL1VkNTd5?=
 =?utf-8?B?QWxNYVVVYzlSNm1qWm5WTWgxZ01nbjFhOVM2bDROd09zOVNGeTZRVU5VbzJx?=
 =?utf-8?B?TjdmVnNCdWd0VnA3UVZPSzI5SkF3NE83QndyYXlEMjlRZHhMSnVGTzM1V1l5?=
 =?utf-8?B?ZGFFSDVMdUVEeE5WbXRtTVF4THZqWVhLL3luUWJwdzBrK04vbG90VGh0Yjhk?=
 =?utf-8?B?Q1FzYVltWmRZd04xbkFTRVpUMkFMK1hTRkJ4b1BZSHdMMHZaUHRLa08za0JJ?=
 =?utf-8?B?TDRhRDk4TGcvbzdRQXdFVHJjeVo2cU5lMGJ0ZG1tNm9YZTdaQldkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E1CA46281707143B10FCDAC495A9592@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a39f74-3b25-4c1b-7de2-08d9e0a77651
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 08:40:09.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAl/b0L03pD6tWoXYCraiN8nP26o7PoWJn5gtOXSDpp/MSu0RRNoIWFRULg/hV08z2Erqb/yOggkMwDqb84IVulp33AA1Nct5hRhfCLhiDiWuXKBPWeLskTqvl3CVc0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7789
X-Proofpoint-GUID: zHMcnCFBCM4pbQxHfuh9sUv51pLrTvyI
X-Proofpoint-ORIG-GUID: zHMcnCFBCM4pbQxHfuh9sUv51pLrTvyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_02,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=867 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260050

SGVsbG8sIFJvZ2VyLCBKYW4hDQoNCk9uIDEyLjAxLjIyIDE2OjQyLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4gT24gMTEuMDEuMjAyMiAxNjoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9u
IFRodSwgTm92IDI1LCAyMDIxIGF0IDAxOjAyOjQwUE0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBi
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4gaW5kZXggNjU3Njk3ZmUzNDA2Li5jZWFhYzQ1
MTZmZjggMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+PiArKysg
Yi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+IEBAIC0zNSwxMiArMzUsMTAgQEAgZXh0ZXJu
IHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpjb25zdCBfX3N0YXJ0X3ZwY2lfYXJyYXlbXTsNCj4+PiAg
IGV4dGVybiB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgX19lbmRfdnBjaV9hcnJheVtdOw0K
Pj4+ICAgI2RlZmluZSBOVU1fVlBDSV9JTklUIChfX2VuZF92cGNpX2FycmF5IC0gX19zdGFydF92
cGNpX2FycmF5KQ0KPj4+ICAgDQo+Pj4gLXZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQ0KPj4+ICtzdGF0aWMgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2VfaGFuZGxl
cnNfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+ICAgew0KPj4+IC0gICAgaWYgKCAh
aGFzX3ZwY2kocGRldi0+ZG9tYWluKSApDQo+Pj4gLSAgICAgICAgcmV0dXJuOw0KPj4+ICsgICAg
QVNTRVJUKHNwaW5faXNfbG9ja2VkKCZwZGV2LT52cGNpX2xvY2spKTsNCj4+PiAgIA0KPj4+IC0g
ICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+PiAgICAgICB3aGlsZSAoICFsaXN0
X2VtcHR5KCZwZGV2LT52cGNpLT5oYW5kbGVycykgKQ0KPj4+ICAgICAgIHsNCj4+PiAgICAgICAg
ICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIgPSBsaXN0X2ZpcnN0X2VudHJ5KCZwZGV2LT52cGNp
LT5oYW5kbGVycywNCj4+PiBAQCAtNTAsMTUgKzQ4LDMzIEBAIHZvaWQgdnBjaV9yZW1vdmVfZGV2
aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+ICAgICAgICAgICBsaXN0X2RlbCgmci0+bm9k
ZSk7DQo+Pj4gICAgICAgICAgIHhmcmVlKHIpOw0KPj4+ICAgICAgIH0NCj4+PiAtICAgIHNwaW5f
dW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+PiArfQ0KPj4+ICsNCj4+PiArdm9pZCB2cGNp
X3JlbW92ZV9kZXZpY2VfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gSSB0aGluayB0
aGlzIGNvdWxkIGJlIHN0YXRpYyBpbnN0ZWFkLCBhcyBpdCdzIG9ubHkgdXNlZCBieQ0KPj4gdnBj
aV9yZW1vdmVfZGV2aWNlIGFuZCB2cGNpX2FkZF9oYW5kbGVycyB3aGljaCBhcmUgbG9jYWwgdG8g
dGhlDQo+PiBmaWxlLg0KVGhpcyBpcyBnb2luZyB0byBiZSB1c2VkIG91dHNpZGUgbGF0ZXIgb24g
d2hpbGUgcHJvY2Vzc2luZyBwZW5kaW5nIG1hcHBpbmdzLA0Kc28gSSB0aGluayBpdCBpcyBub3Qg
d29ydGggaXQgZGVmaW5pbmcgaXQgc3RhdGljIGhlcmUgYW5kIHRoZW4gcmVtb3ZpbmcgdGhlIHN0
YXRpYw0Ka2V5IHdvcmQgbGF0ZXIgb246IHBsZWFzZSBzZWUgW1BBVENIIHY1IDA0LzE0XSB2cGNp
OiBjYW5jZWwgcGVuZGluZyBtYXAvdW5tYXAgb24gdnBjaSByZW1vdmFsIFsxXQ0KPiBEb2VzIHRo
ZSBzcGxpdHRpbmcgb3V0IG9mIHZwY2lfcmVtb3ZlX2RldmljZV9oYW5kbGVyc19sb2NrZWQoKSBi
ZWxvbmcgaW4NCj4gdGhpcyBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2U/IFRoZXJlJ3Mgbm8gc2Vj
b25kIGNhbGxlciBiZWluZyBhZGRlZCwgc28NCj4gdGhpcyBsb29rcyB0byBiZSBhbiBvcnRob2dv
bmFsIGFkanVzdG1lbnQuDQpJIHRoaW5rIG9mIGl0IGFzIGEgcHJlcGFyYXRpb24gZm9yIHRoZSB1
cGNvbWluZyBjb2RlOiBhbHRob3VnaCB0aGUgcmVhc29uIGZvciB0aGUNCmNoYW5nZSBtaWdodCBu
b3QgYmUgaW1tZWRpYXRlbHkgc2VlbiBpbiB0aGlzIHBhdGNoIGl0IGlzIHN0aWxsIGluIGxpbmUg
d2l0aCB3aGF0DQpoYXBwZW5zIG5leHQuDQpTbywgSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCB0aGUg
Y2hhbmdlIGFzIGlzOiBhbnl3YXlzIHRoZSB3aG9sZSBzZXJpZXMgc2hvdWxkIHByb2JhYmx5DQpi
ZSBjb21taXR0ZWQgYXMgYSBzaW5nbGUgcGllY2Ugb2Ygd29yaywgc28gaXQgd29uJ3QgbG9vayBp
bmNvbnNpc3RlbnQgdGhlbg0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCj4NCj4gSmFuDQo+DQoN
ClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNo
LzIwMjExMTI1MTEwMjUxLjI4NzcyMTgtNS1hbmRyMjAwMEBnbWFpbC5jb20v

