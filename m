Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7947A66D3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604827.942362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibpn-0005Eh-5d; Tue, 19 Sep 2023 14:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604827.942362; Tue, 19 Sep 2023 14:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibpn-0005CY-2H; Tue, 19 Sep 2023 14:36:15 +0000
Received: by outflank-mailman (input) for mailman id 604827;
 Tue, 19 Sep 2023 14:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+/=FD=epam.com=prvs=36266dbb07=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qibpl-00051T-7L
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:36:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd78967-56f9-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 16:36:11 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JEKthQ021480; Tue, 19 Sep 2023 14:36:04 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t7dax01x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 14:36:04 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6286.eurprd03.prod.outlook.com (2603:10a6:800:139::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 14:36:01 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:36:01 +0000
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
X-Inumbo-ID: dfd78967-56f9-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+q7bqyu+q/H4Z9gFL3a+PbgFHnDoVvnNah1hhzjrXG8SUDoYmkeSYOAHTtf2B3iagkvWqgoaak3FGZEI0dCx7XueH1pz5ieE9cZLEpOvr7VKopMJIqxlEzmLBaRQGrsMr/XK+W15ipqPtjP8DFKh/BCs4EA113AFblespM2ZMFzMmAoetgQYyK8Y3XqyO09xr5YpgFmoCaFeIsfCCi9Z9TfdKDDDT0PCpFbhTQn5RIi4pX2eQ0W/3R/CQupdyvoZ7ughibAJlqnGQ2hcgyAp1upgkoCENQcxJtYM2yh+LODW7j4P9vtSiNoEXYhVCKtnmcUJmOt7lsxKfLLPErx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iSMQ1521gnKBZJGAA8o3+xeV321nTPUFqxGO0Qppso=;
 b=ZMGBXGDb2ab7XyYq00c0fPcqYN1xSBV8ikY+IuO/LV78Xjz9thid3q4YR+ubVU7R6OR9wrrlngScN40GmPyghr9HgK/hz2sFjE8DsAU/JLnDu0jWMNrG3JaGBrBqFBlAf+xhLfhzgywjz0W8Lur5bUXZLCyBnSGu4+eD8672HTvR59gSwOtBgtkuUQHFnupFrnhBV829ON6VeRIshSzv1MaMxrndvdftQ39MItMo2IA5Pi/mvnPEzpulZx9ApA+aRSGPikG4HVdeeTnjZSGWSnjFHAy6z6iYac7ZZSasUVhvCGbmmJCwLHG8bZr6U2f+6YjFF+S5bxpC4VSODMyNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iSMQ1521gnKBZJGAA8o3+xeV321nTPUFqxGO0Qppso=;
 b=L0RNjMB0O45XZKcaXYRY3WfoYkf2kUiXnih9XMmhUEuvr79H0CrNJ78gG7lbGX8NbijJuZhJLgEuuimGjf35eNajTx5QB5VjyQeXr9mu/5mfHdrwfy4O0RlRjfgHEOXIWMUEihDAg6nb8OSiDocMqCPSq61L47CktTqiioRPAHH9TLOuxcMeQehqs0HGdmDcDbKn7CDA3mdDDoXlQ8prdgnum/S2yGUguTambAeWN1tgUCjEvPwdkVvYG/PHN55jSmCQvNbDA3pHzp0gUKCSMMEYwsQ+SI/aZoTAIQIyVEDvlxvHHeehE0ntdKxf9shggQuPtoey8Y8+R1Tccrv92w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Topic: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Index: AQHZ6ux4LpE3chDIj0mOPudUv9951bAiHTaAgAAZXIA=
Date: Tue, 19 Sep 2023 14:36:01 +0000
Message-ID: <87fs3afcxb.fsf@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
 <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org>
In-Reply-To: <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|VI1PR03MB6286:EE_
x-ms-office365-filtering-correlation-id: 3d2ec12a-8848-48a2-8fc8-08dbb91dbef1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JGf84xraH6rRXWIDTsthxOh9CnyQh+naPXE0TCu6wxqzepirSrtYWj9hJUezq0oOapjyywStpm11TgCm/bEBWmVA08hVCbMUU52qoo/LJKx9EUaDaXn7JbKjzHeUvxtGWlpKksZiBhJDQm2v7+zAJSZ2/a1nfWRImvce/SjA/C0ceS+HUT0Wz6qn6NO5X4IKF8CGlV1qiUaXggNWRdanmwZHis2ggwgFl6uFnH4cf9To3yrSRE0kYNBZZcDBbew2VTXSgMm5tAPQs1L6KbYafQNhR0eMEKAvI0HGHleqDydYegOd+Id7F2yJ6wD8VXWXR5L0i94F1k9aDC4y+KhBy5mF5JslOluFCD5CbIRLoYmVO4gC8vsb6QPgxvxBys+G8mozi8W91xkHlCYMiVbSS2XvJM4ZYdXJsdZPe5P+rjVj1xz6obY2Z6+aFmmrfAmz3c56Da74b7tq3nXuq3rGbt9nB4OWl1wKHsqM+l76BG9Touqe+ZT0ygW4hEqKpI9gpysCku7UxWLcDsS3j65dk8pDXiGFxgTWxOQmLqZPlrit8CRnes+zT//wvyAHA4+gNuHeysNs9aNJFx2l6ZlSwixgos/bmabI/VnkRUE+P686Vu0TQ5sX0cOvr9crBG81
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(186009)(451199024)(1800799009)(6512007)(6486002)(55236004)(38070700005)(76116006)(38100700002)(53546011)(478600001)(66446008)(2616005)(66556008)(66476007)(64756008)(91956017)(6506007)(71200400001)(86362001)(83380400001)(122000001)(26005)(66946007)(8936002)(54906003)(41300700001)(2906002)(6916009)(5660300002)(36756003)(316002)(4326008)(8676002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?whAJb+hm5PE8p40QWdV5gzdviCI39apARwUxPwMK1MgFTkrc/Grc+jdITv?=
 =?iso-8859-1?Q?fINFNKWkXqbtPKuK1zjG79DH0blDr1m2FcyHEqjiRIp0cHLep0dR5sYIEl?=
 =?iso-8859-1?Q?WjH6qAKuXHrjPsvw5NhqTWCpZI6foVqmvchQ9XoiCwhZky6z4RflrQ+r3j?=
 =?iso-8859-1?Q?zXpjZD6b4Dxw3rI1dvSD3PiX4RnLBqCPoM7neMJcrl1kQoLeC/7RK0wOrK?=
 =?iso-8859-1?Q?jc22QrNf05Ar/AV3zI/1Nq9I2sfzW6xEFc2jGXidVbpnD+hXLCA79ZykjU?=
 =?iso-8859-1?Q?BScZNtHxnxNTi9iZUlTGGAq9H82mJlPAo5KpLbgGV3XsjKNzLM4iWiR8X9?=
 =?iso-8859-1?Q?HXc/kdQlRzNmRnhnLiP5VgdSFs/15RSICBaBuP5Cr59jb9/4VMxD8yANjr?=
 =?iso-8859-1?Q?TOtu0e+gKDVve2sQOE+QVY7Dh/AGgkRlqs2GF0YO9t9ynqZIBG28DKCHW/?=
 =?iso-8859-1?Q?CkXoXKNwX9H06V9MvUrldmqkkVQPNnDrrIN5myUvubrqCJOr3a1DWq15ms?=
 =?iso-8859-1?Q?D3AC2wXYXZtk/uJm85adX0litns3ZZTUr1HdB96a+HUBwtuFYg4xuULsCn?=
 =?iso-8859-1?Q?tb6nR0KsjKegxqBiRWSHkI5BjA86pXxxZfMhDp/9bFdMxcJ9UFNTl4Udn4?=
 =?iso-8859-1?Q?np+2OH72lDuy3NcKaGwzPwGzBcRsiopFuzppJlWswMbpqjWL/GlKqswfpw?=
 =?iso-8859-1?Q?N7q0IXrdjS4Jhj1lKQiEZCIEBf3wuve5XAOXWevHHJTfLwa2qXbuhBqY/j?=
 =?iso-8859-1?Q?TjZXspCoRDDZ453kKfCfbMI8iWnOkSqvq3b/SXlDIuFwqRiUPXfGfD/wY9?=
 =?iso-8859-1?Q?Pem6NDPCxtbntqYHisJ5WsVEu/P/otwXWh4nFY6AvWNOJ35THhoE1PFZTh?=
 =?iso-8859-1?Q?SdxNw82mjga+GytDI0zOjKUEtN2U02iMLIBWR3stnT09J9ekIEZSdbomge?=
 =?iso-8859-1?Q?+UTmIFN9fQfIu1NSC8T0Cv9FUplrLR7CyKFU0idxLCHC8GeYcCiPWgVRYv?=
 =?iso-8859-1?Q?Qem95GuOXHOKUJhQ7XCZx/tiasSUsdG1yloawDnLXdTUif4/IeCqdfnm1v?=
 =?iso-8859-1?Q?Ikh0477hsPv5b7EoOmk0Vl8ZdsSCZx5LIx+csGN9fhkDguQNAPQasvqhKv?=
 =?iso-8859-1?Q?EfKkXj4j2wzEUbTAO8LFqHNaWRt4BibUvqK7q6rho7c8Y+5yZWZbjZo3GB?=
 =?iso-8859-1?Q?b6abe4zdXqjqL6CfAjwh+uXdaQMo6rmEZs3vRnlBWG/sX2LgVd3BsU263I?=
 =?iso-8859-1?Q?1VqNFY8m41LPf8l4rty2RzzL5HVavbsKujOMwY9HXKX82qxMF8MGGf7bgQ?=
 =?iso-8859-1?Q?JeL8g2Ybk1wIAFvSSB0M2y+nE3WUf3PQX5ATOfcjXpGLfV3Fg2GqLh+0R9?=
 =?iso-8859-1?Q?JcHD+ExKBMkUgguMtGp0Mespx+gzRZacsLrgN533yhpzRxFwKvGq0vYCFB?=
 =?iso-8859-1?Q?6qk9gEVGddhW30ThnCiqi5Vd4ZH/K6gX3E8QJTqEU8BNJrFdqzTZ0PtG4r?=
 =?iso-8859-1?Q?S8zmU6YVnQS0udPoGVCIjn3rlciltU1wZgdAueokbfoA8JB+/13KIaXKAp?=
 =?iso-8859-1?Q?g5yuFoQduyWAKR+EBjvHe7ZoC1DJSKaEZsecFnEPOROgu936W5syOCOUc9?=
 =?iso-8859-1?Q?ho8t4KDPtZTfeiO/sUYnu6UQbh2YO349iIz/rP2eUkEG5026qStiJnag?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2ec12a-8848-48a2-8fc8-08dbb91dbef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 14:36:01.1346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SfMGMyGOccD/w3BjjqL8MW9F/GjCuw0W07Hb22srLnjXMogouEJH2OIW/x49mI96wUKrBqCJJxkq+ZCo1JECS/x+c6qQWIvmtfMhJ26IlJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6286
X-Proofpoint-GUID: o8keAZ_xJ1dGjwaxvH4rjiKqi_0kMkB-
X-Proofpoint-ORIG-GUID: o8keAZ_xJ1dGjwaxvH4rjiKqi_0kMkB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=569 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190125


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> On 19/09/2023 12:28, Volodymyr Babchuk wrote:
>> There is no need to invalidate cache entry because we just wrote into a
>> memory region. Writing itself guarantees that cache entry is valid.
>
> The goal of invalidate is to remove the line from the cache. So I
> don't quite understand the reasoning here.
>

Well, I may be wrong, but what is the goal in removing line from the
cache? As I see this, we want to be sure that ITS sees data written in
the memory, so we should flush a cache line. But why do we need to
remove it from CPU's cache?

--=20
WBR, Volodymyr=

