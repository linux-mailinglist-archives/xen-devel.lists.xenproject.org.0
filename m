Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409E4A862B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264871.458136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFd44-0005Nh-Lq; Thu, 03 Feb 2022 14:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264871.458136; Thu, 03 Feb 2022 14:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFd44-0005L1-Id; Thu, 03 Feb 2022 14:26:24 +0000
Received: by outflank-mailman (input) for mailman id 264871;
 Thu, 03 Feb 2022 14:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFd42-0005Kv-Rc
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:26:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c7fb59-84fd-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:26:21 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213EAguV001373;
 Thu, 3 Feb 2022 14:26:15 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0fwd07td-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 14:26:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM7PR03MB6369.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:26:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:26:07 +0000
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
X-Inumbo-ID: 40c7fb59-84fd-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtfKRqW1C5MKo6a/sP/w6mAwZDTDpEtcIG+5RrZVDaXNuUA3sDEIYGJ2NPRjDjjxql8KKue02HslZSJgw62H6Lj67ESx1keVbmjywq2hcdSSOljeL7vcf98AyzDdqNWM4B+b6WGPX8U5DE0TGSjRKl/+piG6mg3R9vnAlfBuyVTF1H3JnG61I1O5tjNaMyb+VY1qjLVvBLXunGG2rNjzO7ap58gq3hVzWV2RfiQxRIz69Mh3DD6HT+T/k7ToLb7WmnbAjLMeCaOvKJge6Sv295WN2s1gs2PTJ+cATImvCWW4OssJF0sgaYAghmuYUT1tQ360kHy1CQvfihVM5TJPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydsqxChzJ+C+qFYsxgonDMMngWA0WaharFTnKZyVBxY=;
 b=YyTquGeQUajWLY2nujlAQvrldqcOKJj6QBJzhZ081XfZ1/8ylOqJyeqq/G9249pUjjvYqHJ0Nwbj1IXtDhG5LvuUyHtZss3ETcG2bCiHgb10qwzLxekgJ0TaHKhI4fHAq4CovzRiMTsDuXi0sXhMA75YFw7UNQowvIBlzpD563EmGG1MJ6Lmevf14l9aSML8dJGdaTDo6LLH58slnYa351qVF9BT1qJbs1bqC7+id0L72tahEwY1wcPMr8D96CLlGZm+wVk3tQfj0i6hnl8Ds5cKX8xOIGZg4uPO4WOKjuz9jZA04cyAug18Xe3GGef/R53mNeMqjGUbw8QmB853sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydsqxChzJ+C+qFYsxgonDMMngWA0WaharFTnKZyVBxY=;
 b=GCxqzDhpcIeCGuTZ4TKjwNuyINHvs3FY5vB/O3UD7jCg33lAPB+o33ZSTA+mhynp6TitJfRZUcACY1gkfKLpBoMAy7L64K0hSdxFTSO43GNznvTbCQowo19MdzCjXfC2LV5OEAiMgAvRXCqj+bBPrYR6ZHJhtG4pq7Ag9E3e3x//M92jkb2Vn2XTECXMLXjghN0ms4FUJYuVgMK/gX7D1cW/rrWci7z8I2c+S3MAQDYQe7u3DmNtWzGWKTFg5wNGDD2YpYyC/K2iG99hU7F6tMKSVTFXuMp1nPjE2ZUaeQW3/4pillzcBM1d8aDm7RtOLBZM259eYg15ZJPJ9uebSw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxf8XWAgB1bfoCABObrAIAAAsYAgAAJ6wCAAAngAIAABa2A
Date: Thu, 3 Feb 2022 14:26:06 +0000
Message-ID: <0b339957-b313-3fe4-5211-c03612a000ce@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
 <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
 <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
 <YfvhOmbFxjKdjI2x@Air-de-Roger>
In-Reply-To: <YfvhOmbFxjKdjI2x@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36dba2b1-372b-4825-8bf0-08d9e7211ddf
x-ms-traffictypediagnostic: AM7PR03MB6369:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB6369E08C3B49EF964D451498E7289@AM7PR03MB6369.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5d5BT11NKQs+npT6FhhwvKj+EJl4i2S1GxXqEioVLhYSjWIae7qlOzhu2Z1Amh3NWKieNzzflGl2kJZZERUB+WAdtW3Y7A/hWZsCSckJ8+prZdqqprdZLmxn8et7NqGKVD/0mLFzsDSLxXAWzRR5BB5x2CrjdSyLMzgYK6V3kt2nmvzjoPdQEq5Flm37Bn706tmV1kkJxnnawJ3RNFReHAtyhjqDl8X8fXWR6YbnI/MlS0XOx+LrLqfTPlsxX5p0NKK0M2yxBic9kHXQANvQnYUJ2ZUGVQv7MaYFGbf1yk0Hn4OvPLPg1k0GaIpiQto1l7A/7IoevWzscpRQ6KB7ROzAcksF2Vu501wO7YtHuokUvhWlNKvhCjVcRFOR3LqiB0eiY/TaNp1NLqBhSNt2U+juiDYteISDWWpsidz+lib3LgkS01RMtHI4hcGL4FQP/6hB1l8ypzQT78P2vxsPMZQXCizyAwBrEkVPuvXs/Jg9/knSWy3lPuzO/BkHL1UbWcbuITkUtMRYD40rK5DuNJSbuW5qrFrHzZJseYyU1eYjpo7mttk2Rp7aZjHoOtigxjKqRomha1R+1KuY+R8BQ4UpTT90uDWp71yMDkoBnJvW38YETQlAnhsNa/hyoVff8bRfh6GGn8jGdcFX/YhNSPOgTPGQ4FuvpTpv8uhfLnVVIq6GrmohdNc1O5ZJwgBy6ycmLzIP4C5M1EGluqB4fWRKMrJIm7nxPrvU6+fX/FQerJv9KHQqevHVEX2AzsiLivBKJZ8JTgx0kMCbkejSDzh/3cQjDhU6697qLWlVVEMFbc8Xn1ZL2QOCSgp1qHajPbOyiqRt3XsKHd7xnSXvxQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(2616005)(186003)(508600001)(966005)(31686004)(2906002)(36756003)(6486002)(316002)(83380400001)(38070700005)(107886003)(26005)(110136005)(54906003)(122000001)(71200400001)(5660300002)(6506007)(38100700002)(7416002)(76116006)(86362001)(8676002)(8936002)(66946007)(4326008)(64756008)(66476007)(66556008)(66446008)(6512007)(91956017)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1RTNnRYRUt1WnF0cUNaamNJcmFJbmk3a2RnQWFqZFRvRHEvWEtINDdWZDUy?=
 =?utf-8?B?Q1NjVGY3UTl1a04vZmYrWFFCalJrK245UkNwWjd4cXBTTDhKUFFSMmFEMU1V?=
 =?utf-8?B?SWtRWVlTOURvU2dTWU5zRnY1QlRpUm1YdUZyaGZzdS9DVHVqNzA0Q3VlbTdi?=
 =?utf-8?B?Y0hKT0oxdXEwbDN1TzlOY2JGT083SkU4eWx0Z2w0ZnI4TE9OYkxaa2w1cExq?=
 =?utf-8?B?M1JKWGtPcm5uMWwyQ2ViREQ2a3NHVDIrOSt2TDE3NDZhRW10UEkyZ3VrUFZl?=
 =?utf-8?B?eE1ROHJXS3RqUTVybi9LZzV6Q1hTbFdoWFlNdkxScmNpRklzRDAwSVpkc3A0?=
 =?utf-8?B?a0NzRjlMdzU5WUpPWmFCUG1VK0VxYzQ3c1lFSk1za1ptZ0pDNHd6Y05Hdjhq?=
 =?utf-8?B?U0h2SzA0UUROaFRSVEJQWElHMnloS3dhUlI4WStOd1VYUmFoUDFoTWU4S2dW?=
 =?utf-8?B?bXIraG45ZjFBYUZLQU0xUVVpN3NLd3IxaVUxaVdya0JuR090VHFWUGhidWV6?=
 =?utf-8?B?ZWV2anNvaFdMeHU1emRjZ1h5THJsTG5xRGtTMWcwRzJkM0dlVFJzRXZqc3FP?=
 =?utf-8?B?dkJMamRKSU9SZnh2TXpHWHhZSUE4RGtpTjZNdmNNdlNZWHdCUmRjWWlwQzE4?=
 =?utf-8?B?VjNSY3lGNElPcVpoaTRENnVGeUY3VzBrMnR5UEsxdVlDb3RRR0U4OVFsZmdI?=
 =?utf-8?B?bU9NRkJ1d2V6N24wSktkTjJNZm9PS21ReElsL2lmcWxEK09HclZrOWxyZ3Fj?=
 =?utf-8?B?bUlobm9NalI4Snk4emxwWU02YTZuWGpVejFFblVyZS9qRmpyM3BLc0lodzg3?=
 =?utf-8?B?bG1GWVZpQklQVVdaUGpDRTVIQ3FZeUpLa1luelRndmFZYXVMY3BnNVJaRFlD?=
 =?utf-8?B?RDYyNTZpUUxQL1ZobVRZdG5jOE02bUV2WEVjbEpndW9SNEplNUp0YkJ1SGdM?=
 =?utf-8?B?THN6a29Hc1d6Tk43VFVFemdMak9mV1NqMVFvakxGYWp3WXRtV09LWWNneWdq?=
 =?utf-8?B?NFJmcDlHa1pmQmpuRE1jNkFDQVNkQTdGMmNlRU5tSlRqRUJKOHVLcFdLVEh2?=
 =?utf-8?B?d0E3N3ZHQ3hTMU9CU1Zkci90M3p2OXNwd3c2dERCMWZ2ZllmSHNBbnY4eFFS?=
 =?utf-8?B?UnFGa3FvdDFiSm9TY3RQT3RhOG1EN1VEN1hCK05sdStBLyt2Y0NDVmRZTUZG?=
 =?utf-8?B?UFFqaDEzdVRlaW9yQXhQOVJsYU1LUEp1aW4ydS93Tks0MjFDeUNhejZpOVh3?=
 =?utf-8?B?czE4aVBjcFdreWI1SVJWWXhaR1lVbGQ5Z2J0d1RQQlR4cllra2E3LzNCWlNx?=
 =?utf-8?B?Q1VtL3AwT1k5SjlTaEFMTk1KaWIrdElITHkvQTZKUzdvMkJDTDlBMHlCb0NQ?=
 =?utf-8?B?a004Sm9CejdsTWw1ODVJMHo1UisrWmpjalJ6elZtNlhLV0E0TzhaWFRTVVBu?=
 =?utf-8?B?ajE5VnlIbXNyL1VwVWJZeGhYWXhxU2hKbUJtb21HOEQ3dHU4aURQMTlRR08v?=
 =?utf-8?B?WHNZdGRYWXZXU1hFa3F4UnRNRUhDN3EwUTJzNXhod0Z6NldlaERSSVpnTnZp?=
 =?utf-8?B?UFgrUFg3WjJQY1d6ejVFemtQUDNUQ1ZSSnZ5RFNmTi92RXROTTBZaEI2dWdJ?=
 =?utf-8?B?SXVxUm9NMzJBdFQzTG1FWkpNOE1RdjFkVDliVFc1ck55QU1oTGFCL0Z5VHI3?=
 =?utf-8?B?SExLeHBkRGJXbzBwRnBVdHREaWFIVkxxeGRGUWsxU3VrZ3FtYmYzcmZzMThB?=
 =?utf-8?B?eDQ4UEhQZERubDNmZWlBeDlRVmRMUmFHK3NlcmNLK2FpZitJL0RNa2FXRzZM?=
 =?utf-8?B?QW9TdTI1a2MzWVhqZlBockdrWWVjSWtUMSs2ZS93YUVXRTE3Q1pXaUc5Zjdi?=
 =?utf-8?B?WkFET2tvdDhvKzd6NDlYNnZjdGxvWExLZlVUd0dtT283UzBGUFNwbHFVOWxv?=
 =?utf-8?B?WllEV3NyTHFQQ3M4YWpuMC96ekptSjJvalMyd21nTHhxclV0Z1VGZVMzZlk3?=
 =?utf-8?B?dnBMWEsvY3lIdEg1K29CUnppU1pMa1NHVHVTL0o4dzdSZFlGUGloZGZEeVV5?=
 =?utf-8?B?QmxYazY0QlVST3BJS3VIRUVHYWFmN2VnOWJ1aEZ6Wk40MVIwRlVhL3VBdVk1?=
 =?utf-8?B?cDdRZWErVDFXZmVlZ01yclJsa0daTE1YZUpnc1VzUWxGYmFYalZuL05xTmcy?=
 =?utf-8?B?WWdRRUhhMGdTYnRZMXAvWHFuZW1LQ0l0bGpwa0hubUFaNXJLU2dQYkVGNHNS?=
 =?utf-8?B?Y3dqbWY5amErSnhUWXZQNGhncHozbHNUWXVWU29DWFZYbG45RXdROEcvWmJx?=
 =?utf-8?B?bzAwenZ6bVk5TmxBTUNBSmQ5S3dvMUU3Q3VHWENYWlVjc2IyYTE0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <647FBC7B75172C49B699826FF4F4370F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dba2b1-372b-4825-8bf0-08d9e7211ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:26:06.9356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljXTJVVPU3nuxLj6YGv2yAOMgWEGJViJKZpiHLc8rHL/26gyd/2HC+lE5gYc9MK0kJJvtYsofHUv7H2ISbcdk0TzsA/AdlqMZmH6GJBe7ClKDHfi1OMtLJuSq8QBvSr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6369
X-Proofpoint-GUID: S4tDpQkVhOKM21oRYPF5ZqjcYDesbk_-
X-Proofpoint-ORIG-GUID: S4tDpQkVhOKM21oRYPF5ZqjcYDesbk_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030089

DQoNCk9uIDAzLjAyLjIyIDE2OjA1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IEZlYiAwMywgMjAyMiBhdCAwMTozMDoyNlBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwMy4wMi4yMiAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDMuMDIuMjAyMiAxMzo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+Pj4gQWxzbyBtZW1vcnkgZGVjb2RpbmcgbmVlZHMgdG8gYmUgaW5pdGlhbGx5IGRpc2FibGVk
IHdoZW4gdXNlZCBieQ0KPj4+Pj4+IGd1ZXN0cywgaW4gb3JkZXIgdG8gcHJldmVudCB0aGUgQkFS
IGJlaW5nIHBsYWNlZCBvbiB0b3Agb2YgYSBSQU0NCj4+Pj4+PiByZWdpb24uIFRoZSBndWVzdCBw
aHlzbWFwIHdpbGwgYmUgZGlmZmVyZW50IGZyb20gdGhlIGhvc3Qgb25lLCBzbyBpdCdzDQo+Pj4+
Pj4gcG9zc2libGUgZm9yIEJBUnMgdG8gZW5kIHVwIHBsYWNlZCBvbiB0b3Agb2YgUkFNIHJlZ2lv
bnMgaW5pdGlhbGx5DQo+Pj4+Pj4gdW50aWwgdGhlIGZpcm13YXJlIG9yIE9TIHBsYWNlcyB0aGVt
IGF0IGEgc3VpdGFibGUgYWRkcmVzcy4NCj4+Pj4+IEFncmVlLCBtZW1vcnkgZGVjb2RpbmcgbXVz
dCBiZSBkaXNhYmxlZA0KPj4+PiBJc24ndCBpdCBhbHJlYWR5IGFjaGlldmVkIGJ5IHRoZSB0b29s
c3RhY2sgcmVzZXR0aW5nIHRoZSBQQ0kgZGV2aWNlDQo+Pj4+IHdoaWxlIGFzc2lnbmluZ8KgIGl0
IHRvIGEgZ3Vlc3Q/DQo+Pj4gSWlyYyB0aGUgdG9vbCBzdGFjayB3b3VsZCByZXNldCBhIGRldmlj
ZSBvbmx5IGFmdGVyIGdldHRpbmcgaXQgYmFjayBmcm9tDQo+Pj4gYSBEb21VLiBXaGVuIGNvbWlu
ZyBzdHJhaWdodCBmcm9tIERvbTAgb3IgRG9tSU8sIG5vIHJlc2V0IHdvdWxkIGJlDQo+Pj4gcGVy
Zm9ybWVkLiBGdXJ0aGVybW9yZSwgKGFnYWluIGlpcmMpIHRoZXJlIGFyZSBjYXNlcyB3aGVyZSB0
aGVyZSdzIG5vDQo+Pj4ga25vd24gKHN0YW5kYXJkKSB3YXkgdG8gcmVzZXQgYSBkZXZpY2UuIEFz
c2lnbmluZyBzdWNoIHRvIGEgZ3Vlc3Qgd2hlbg0KPj4+IGl0IHByZXZpb3VzbHkgd2FzIG93bmVk
IGJ5IGFub3RoZXIgb25lIGlzIHJpc2t5IChhbmQgaGVuY2UgbmVlZHMgYW4NCj4+PiBhZG1pbiBr
bm93aW5nIHdoYXQgdGhleSdyZSBkb2luZyksIGJ1dCBtYXkgYmUgYWNjZXB0YWJsZSBpbiBwYXJ0
aWN1bGFyDQo+Pj4gd2hlbiBlLmcuIHNpbXBseSByZWJvb3RpbmcgYSBndWVzdC4NCj4+Pg0KPj4+
IElPVyAtIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiByZWx5IG9uIHRoZSBiaXQgYmVpbmcgaW4gYSBw
YXJ0aWN1bGFyIHN0YXRlLg0KPj4gU28sIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlOg0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYw0KPj4gaW5kZXggNzY5NTE1OGU2NDQ1Li45ZWJkNTc0NzJkYTggMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jDQo+PiBAQCAtODA4LDYgKzgwOCwxNCBAQCBzdGF0aWMgaW50IGluaXRfYmFy
cyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByYzsNCj4+ICAgwqDCoMKgwqAgfQ0KPj4NCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDC
oCAqIE1lbW9yeSBkZWNvZGluZyBuZWVkcyB0byBiZSBpbml0aWFsbHkgZGlzYWJsZWQgd2hlbiB1
c2VkIGJ5DQo+PiArwqDCoMKgwqAgKiBndWVzdHMsIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIEJB
UiBiZWluZyBwbGFjZWQgb24gdG9wIG9mIGEgUkFNDQo+PiArwqDCoMKgwqAgKiByZWdpb24uDQo+
PiArwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqAgaWYgKCAhaXNfaHdkb20gKQ0KPj4gK8KgwqDCoMKg
wqDCoMKgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCAmIH5Q
Q0lfQ09NTUFORF9NRU1PUlkpOw0KPiBNZW1vcnkgZGVjb2RpbmcgaXMgYWxyZWFkeSBkaXNhYmxl
ZCBoZXJlLCBzbyB5b3UganVzdCBuZWVkIHRvIGF2b2lkDQo+IGVuYWJsaW5nIGl0LCBmb3IgZXhh
bXBsZToNCj4NCj4gIMKgwqDCoCAvKg0KPiAgwqDCoMKgwqAgKiBNZW1vcnkgZGVjb2RpbmcgbmVl
ZHMgdG8gYmUgaW5pdGlhbGx5IGRpc2FibGVkIHdoZW4gdXNlZCBieQ0KPiAgwqDCoMKgwqAgKiBn
dWVzdHMsIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIEJBUnMgYmVpbmcgbWFwcGVkIGF0IGdmbiAw
IGJ5DQo+ICAgICAgICogZGVmYXVsdC4NCj4gIMKgwqDCoMKgICovDQo+ICDCoMKgwqAgaWYgKCAh
aXNfaHdkb20gKQ0KPiAgICAgICAgICBjbWQgJj0gflBDSV9DT01NQU5EX01FTU9SWTsNCj4NCj4+
ICAgwqDCoMKgwqAgcmV0dXJuIChjbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpID8gbW9kaWZ5X2Jh
cnMocGRldiwgY21kLCBmYWxzZSkgOiAwOw0KPiBUaGlzIGlzIGltcG9ydGFudCBoZXJlIGJlY2F1
c2UgZ3Vlc3RfcmVnIHdvbid0IGJlIHNldCAoaWU6IHdpbGwgYmUgc2V0DQo+IHRvIDApIHNvIGlm
IGZvciBzb21lIHJlYXNvbiBtZW1vcnkgZGVjb2Rpbmcgd2FzIGVuYWJsZWQgeW91IHdvdWxkIGVu
ZA0KPiB1cCB3aXRoIEJBUnMgbWFwcGluZ3Mgb3ZlcmxhcHBpbmcgYXQgZ2ZuIDAuDQpUaGVuIHRo
ZSBwYXRjaCBbMV0gd2lsbCBkbyB3aGF0IHdlIG5lZWQgdG8gYmUgZG9uZSBmb3IgdGhlIGd1ZXN0
IEkgZ3Vlc3MNCkkgYW0gdGhpbmtpbmcgdG8gc3RpbGwgaGF2ZSBpdCBpbiB0aGUgc2VyaWVzIHdo
aWNoIHdpbGwgc29sdmUgZXhhY3RseSB0aGUgcHJvYmxlbQ0Kd2UgYXJlIHRyeWluZyB0byBzb2x2
ZQ0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMTExMjUxMTAyNTEuMjg3NzIxOC0xMS1hbmRyMjAw
MEBnbWFpbC5jb20v

