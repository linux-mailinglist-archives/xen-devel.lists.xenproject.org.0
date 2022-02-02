Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83844A72B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264224.457243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGJT-0000sN-Vg; Wed, 02 Feb 2022 14:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264224.457243; Wed, 02 Feb 2022 14:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGJT-0000q3-SU; Wed, 02 Feb 2022 14:08:47 +0000
Received: by outflank-mailman (input) for mailman id 264224;
 Wed, 02 Feb 2022 14:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFGJS-0000px-26
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:08:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a159b3aa-8431-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:08:44 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212DsAVc019829;
 Wed, 2 Feb 2022 14:08:40 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyu8br38k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 14:08:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4700.eurprd03.prod.outlook.com (2603:10a6:10:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 14:08:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:08:29 +0000
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
X-Inumbo-ID: a159b3aa-8431-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI/iQiYtZcFBeQbQy1Fvy+6H4rXi+YrAdRnuif/m73tCvvRBA3CsKUKo0x6vvVA8O00D9p62R0cPLTdVWVRHEIybxpknZsOG6gauZkDJtudCoCbXLJEwp38OfLMn41UuGjp97gmS4FSohIKEOibIcmZQQ+rcSdCgCODEXQqyOxOHLCe/suk9noH9uvygmaRLVMwBjY8U41DTkOiFFLurW8hNjnhhb0FcK1tLmSbWA645JNBEAv7B1R/9fYsLgOpwTY1YiCQXmr6zko8RFvX7Mx9GQ3vtPomOWAioMPhJCiT8yNYjYQyk1ZLaIc/nMbqagO8JWMlVe9FrzAYOysBpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsK5JEw4uol7jvopYR4wghYE0SKCQvUUk6OTqoTlstw=;
 b=E7sQSL0FcUJQLGPcqte3dOkq71PjYmMnVKocGClrmvz3I5wD5DCxPsGcYmTILHKu9Tz8OOcv7GjR0rFcNMHk/wJB7kUDzndN/Gl9rKad1sXXqR9ny3N32pelRYhRCYjlJKkzCNFy02vY7fClSYRJTxf6cCdmOW27t/5O3ctKz/LDBP+RZfytjmNHiYdcgHi7RfgI9HkTmZybnemqKFlwd9r4pWSCzDqTqQeO/y5Y06j5q6O5r/2o/tUhRz9T8+552GtREQfPeepFJDO4XsrM9Yx3l/SMpVekORuqm+k6JYgpsNr/5+/o77t3LKJvONPbYiKuOXrUuIKLZ5ACuHDDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsK5JEw4uol7jvopYR4wghYE0SKCQvUUk6OTqoTlstw=;
 b=jCIQNeAFKqv0uuD1fLg50jQHBXLITz0uV0XUEK+sasZ0ZksSEJEAvdtqbLD7ZbtQUBS0GmJjsFFIiT4tqHyfCc9FdqJDwxn83bKZbD3yxDq42n7z8nFtUpF0foqy7jCS8s4yNvHI+qRPgtCwgqClTThTsQAOfhAU1NoDQI7JGjdB9DzxNJg2SDIkrlVDXD0V9IZT/b9RAQZjQenAJET6FHNxMxc9lmppifGBJf6J7J0vzdUF9cLP4y+9fk8aRE5Jhdo5jHRLkDc54i0gIh0ST+hMETSOqYYIdk1SZTKVmJ4LJH+dOXoxx/B/QBMnvgeP/RIuXZN3MUiIB8FQ+HZFgQ==
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
Subject: Re: [PATCH v5 13/14] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Topic: [PATCH v5 13/14] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHX4ewM3E9Hca8G9ECzl5GuB0PchKxhPaoAgB97MoA=
Date: Wed, 2 Feb 2022 14:08:29 +0000
Message-ID: <e5428b6b-a254-c360-bc7c-cdc7e2a12290@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-14-andr2000@gmail.com>
 <YeAn0k1HbYFUGeMj@Air-de-Roger>
In-Reply-To: <YeAn0k1HbYFUGeMj@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c060d28-cecc-4169-7c4a-08d9e6557d5d
x-ms-traffictypediagnostic: DB7PR03MB4700:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB47008ABA0D0981597FA1B150E7279@DB7PR03MB4700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nljte0qEiqtSmLUJGjYe2F1eNn6ynyN6wtSllqDAq6UkIi6t81xbGGufIhsTKerWPaHACPl5oIgOA08dy9XzQceBI6c1YGlkHaadCNjBl2UMsFhaPfbD/fLrpTNzur98+ShHMDKEEtTHUu+BrFKzxcmshYmtfGJYWoeS4b8b2OXTDrgzXV1N2DVxH8KoJ1e0zc9ZljAzcAfDyfctQeKnEaNUIU/GEtK1nqrGOlZRvuUyp+EC77j0+/UbPzHLkXPlVjJiQzyKh5Y2JUtIG4iW5S6yJtXqf/6BlKmCAvbtkGXnafPJIL6HYsOd3gbKzmcicDJSWFPTL2NY82+EBut+UHOFNtXnszilnuudJrXVD42NZvxnvu2ImzBipO0jG7PuABdLQiUPHRs1aNnrEOydG4a1PaXhZkEk8iJOB19gHP+iGzE+5xlVho/LUYn/b4utjcL+I2sBjVu60zKH0n9DzSmqHqlw51CCOwOJxvY8D8QHoEZcziWTBD1WJw5dN+Aqn2eCdNA+LqHiEIG7N4MFi+IdQ/BarWqAZI70WKp8D1qUHX2bXgPkRZvSREjT2nEPg0Rx70hUWKSoO1rsuYTUDRZYHmR5hCEmgodSx8yZc5cvwCyvuN+lSCeKlBN7Jub8sjHoP23J8LibVq0Ei4+krB+yjDCpPNZfiFY2t/K6XA+6uDdU7AxYpKxeRuStBCiUYWd8WpiGeXx+JSn7YUoaPm5egYacs+FFl9R0ZgDBoDfnjMIGcn+4ORLItq/Q9XHz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(107886003)(71200400001)(2616005)(36756003)(508600001)(6486002)(83380400001)(2906002)(186003)(6506007)(26005)(6512007)(31686004)(7416002)(8676002)(66476007)(316002)(6916009)(66556008)(4326008)(66946007)(38070700005)(8936002)(5660300002)(91956017)(38100700002)(31696002)(15650500001)(76116006)(54906003)(122000001)(86362001)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWQ3bzhxRTJBUzJrQ05WK0RuVVA3TTBPUWM5ZThtMjVJQUwyOHJVR2prK3do?=
 =?utf-8?B?QWVQSWRYNnpGUHRpcTNCMmJJU0UxM05ZQ1ZBS0piMmZMODI4bVl3TUVVdlFa?=
 =?utf-8?B?YjcxcXpRMVV1WXZsUHViVjdQS3c5MktiQnlWN0xIT3Z0NERYK3pJc2NHSFdu?=
 =?utf-8?B?L1B3ZkRCZHNISDFzcnlMM1Q0REZ5b0lTbTJia3hkaGdlbUQwSjV0c1U1ZWk5?=
 =?utf-8?B?aDZYSVFVZkpnaVJYMms0UjFYSHpqYzB1VitVbFpuam16SExNRExwZEN5Nll6?=
 =?utf-8?B?UmIxbHRia2w5cGFWcEZkbmtuK3dCckVCVy90VkNxRmlkSU5mSnBISGZSOG5D?=
 =?utf-8?B?Q2ZDemdnQ2lHT1paK0V4WEFSQ2lYWnUyS1hmak0ydGFtWXhNR0N6RFFYVFlC?=
 =?utf-8?B?TjkvNEwvUXhKZGdqUzhGS1oxVW5CV0NiVkE3OVU0Smw0MDRISzVoY04vVndF?=
 =?utf-8?B?dkowRjJtMU5UOE1tNlV5NXZjYjVZeTNFMGl3U2YwZkNWMHRJditUQXFDVlQx?=
 =?utf-8?B?OUxoS0RzUWxaM3NUb0pyZTNxT3UzazRhN3Q4WFZub3RXTWk2OG05ZDd3OWRn?=
 =?utf-8?B?Z0N1VjUwaG1ENFFuKzFPVWYyYnNQQVdKSnphTU4yQVRBTlVONys5blJlRDF5?=
 =?utf-8?B?S1d6dmVaNlhCcjJhS0FJMHJCUVFoZUhIMjNaVTFVN3B5czVSdXA3dkZNM0Nv?=
 =?utf-8?B?aERjU2ZEZFc5U1JhK1lzcHRQNXpOSldtNWFvaW0ySnVkOEpLTC95QU45Sk5T?=
 =?utf-8?B?OTJqWVdEdlZteW9RdFNITTNSYU16citDclFUbWREbmZFUFJzL3UvL3R6bzUx?=
 =?utf-8?B?Y1V1UkRuT3kvTmVrUytRdDR2SjhMbnBJSFdWZ2RIbGU3UUJDTHRMUTF1SVlz?=
 =?utf-8?B?ZkFBMEd1bU1BcENsd216RjUwd2VFYzFDNVJmb0djMW9iY3BXN0ZHcFB4dGgv?=
 =?utf-8?B?czBnQkxBajREQmY1OWRtQzQyNTZJNUZSakVlRndpNTkweUtKUHdQaTJHak51?=
 =?utf-8?B?UW9JUjFWdDdISnhtelN2ams2L2liY2NCUjAvMzUydU9qUEp0OGpSSi85a1M4?=
 =?utf-8?B?VjdPelhQbzJ3NXF4N0h6ejEybjhZSkVFTWozSXlQS2dUTkw2dU9TZ1Babmp2?=
 =?utf-8?B?Y2Zuem0rMVFOVlV2MFJWQnNYV2ZTV2JxVFpaVldYSXNJZFZUYXkreHBXdUx5?=
 =?utf-8?B?ZFNORm4xbU9VZThoSlVzWWlIaE84UWI4Y012ekNxNE1HbkxCT1BTdmw3MkhH?=
 =?utf-8?B?MlRwd3VlVi9DQmVKV2pzMFFmUmtTWnFoUHRaVW1zRXgrSmZ4Z2NTT3ZXRTgr?=
 =?utf-8?B?cDRXNG9wOEsrV0ZOUThGV3R6VStZMFAwUU43RjRHTWJrRnQ3MGRtV3YzdWlU?=
 =?utf-8?B?VzVEMjJWZXh3UzZFcjVGZkZTR3NBK2VKc3NESHA5VzVtc3lybkkrcWU2TTJu?=
 =?utf-8?B?Yy9POTRWMis2T2Joc1MyeThhejB4b1p2bzhxK1hPT1JycnVBRG9DV2VEa0VV?=
 =?utf-8?B?dkpsNGVCUkNIWlFrUyttMFN6b3EwTXJuODhBVTU5M1NQZElGSXFpRDg0MFh1?=
 =?utf-8?B?dXdWb3lyVitwMCt2dHJtU0dGRVJ0b1ZkZHloTTJCdTUxcGRYR2E0REZhMXIr?=
 =?utf-8?B?c2JxYUJXaFZJUHRYVUVyMEJITGJmZ3ZmblFjN21uT2F4bUQrN1FNWGozMVZj?=
 =?utf-8?B?TmE3NFNKOURQdWNOaDNPSy9UUG5ySnBGQk5mVUZvbGZTdGJmWFFXekJNVTZh?=
 =?utf-8?B?alRLUnJMWjA1dXgyNmRQNVkyQ0NTR3JTU09sNnN5bmJqaHVDZEhicmVjTVlt?=
 =?utf-8?B?Y2hoczBpL1V3R254Nm5qZ1hjZGNLU0lZV2NYMnVIOW4rSU1DNHZKOU9HMXBN?=
 =?utf-8?B?VGg3MEpmakh5elN4VjY3RGhXY1dkYUxZLzlVV0paNlBVZEQySnNtV0E2V0pM?=
 =?utf-8?B?UVhFblNHeitITTBtZVdRaDhqcHpKVWxvMGltQ0UyQUJ5cWJLTnlxbmxCRGpz?=
 =?utf-8?B?TVJ4a3RpMk0xU2xnMDFSVEVPS1dJNVMyTnVoaFFVTU42OUora3RJMTRqL215?=
 =?utf-8?B?TCtHZlJTMThqek81dG1iamliNWpscnJ0MVA1T1Ntem5pcVdXc3htZkxkYmV5?=
 =?utf-8?B?WWJEZkpRRitzQ1hXZXZETzY2NGJwdVA4QWVYZ3l2RWMzYVlWZ0NzR0pnSEZN?=
 =?utf-8?B?RjEyOGZ4NmY3MlVjRDNBbVVmSURHOUhmY25aSm0xRk53MStQb3Zmc3IzVU9x?=
 =?utf-8?B?VHlPYWV0TGZaY2t0Nng1SzVxeENHVXhGOUJ1UUU5aTNzOWk5VFJNM2JJRXZZ?=
 =?utf-8?B?RU5IR3g2WGhjWnJ5NTdLN0YxTGlHdTdvVldsN0VWaGZzL0M5bndrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0DF2C893DC1CA45967FE86F2C216B56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c060d28-cecc-4169-7c4a-08d9e6557d5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 14:08:29.8585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDqSes3v6G/1215AE9TqfLh/+MG6r6V/Zd7wULZq6OvRdrud7Nh/MM5aSPIarHj52lAVTzqIPZ0iiKXrB+tI+e9wMKJi2qCpPHAnZMnawhLWIIXkfRABwGYB77ao6JCk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4700
X-Proofpoint-GUID: GHu6xdae0zfAOc04Qg_jSXe1BlpNEnP5
X-Proofpoint-ORIG-GUID: GHu6xdae0zfAOc04Qg_jSXe1BlpNEnP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=753 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020078

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxNToyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NTBQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQXQgdGhlIG1vbWVudCwgd2Ug
YWx3YXlzIGFsbG9jYXRlIGFuIGV4dHJhIDE2IHNsb3RzIGZvciBJTyBoYW5kbGVycw0KPj4gKHNl
ZSBNQVhfSU9fSEFORExFUikuIFNvIHdoaWxlIGFkZGluZyBJTyB0cmFwIGhhbmRsZXJzIGZvciB0
aGUgZW11bGF0ZWQNCj4+IE1TSS1YIHJlZ2lzdGVycyB3ZSBuZWVkIHRvIGV4cGxpY2l0bHkgdGVs
bCB0aGF0IHdlIGhhdmUgYWRkaXRpb25hbCBJTw0KPj4gaGFuZGxlcnMsIHNvIHRob3NlIGFyZSBh
Y2NvdW50ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiBMR1RNLCBqdXN0IG9uZSBjb21t
ZW50IGJlbG93LiBUaGlzIHdpbGwgcmVxdWlyZSBhbiBBY2sgZnJvbSB0aGUgQXJtDQo+IGd1eXMu
DQo+DQo+PiAtLS0NCj4+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4gQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IC0tLQ0KPj4g
VGhpcyBhY3R1YWxseSBtb3ZlZCBoZXJlIGZyb20gdGhlIHBhcnQgMiBvZiB0aGUgcHJlcCB3b3Jr
IGZvciBQQ0kNCj4+IHBhc3N0aHJvdWdoIG9uIEFybSBhcyBpdCBzZWVtcyB0byBiZSB0aGUgcHJv
cGVyIHBsYWNlIGZvciBpdC4NCj4+DQo+PiBOZXcgaW4gdjUNCj4+IC0tLQ0KPj4gICB4ZW4vYXJj
aC9hcm0vdnBjaS5jIHwgMTUgKysrKysrKysrKysrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92cGNpLmMgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBpbmRleCAzZDEzNGY0MmQw
N2UuLjkwMmY4NDkxZTAzMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+IEBAIC0xMzQsNiArMTM0LDggQEAgc3RhdGlj
IGludCB2cGNpX2dldF9udW1faGFuZGxlcnNfY2Ioc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAgDQo+
PiAgIHVuc2lnbmVkIGludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMoc3RydWN0
IGRvbWFpbiAqZCkNCj4+ICAgew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgY291bnQ7DQo+PiArDQo+
PiAgICAgICBpZiAoICFoYXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAg
IA0KPj4gQEAgLTE0NSw3ICsxNDcsMTggQEAgdW5zaWduZWQgaW50IGRvbWFpbl92cGNpX2dldF9u
dW1fbW1pb19oYW5kbGVycyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICAgICAgfQ0KPj4gICANCj4+
ICAgICAgIC8qIEZvciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRp
b24gc3BhY2UuICovDQo+PiAtICAgIHJldHVybiAxOw0KPj4gKyAgICBjb3VudCA9IDE7DQo+PiAr
DQo+PiArI2lmZGVmIENPTkZJR19IQVNfUENJX01TSQ0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBU
aGVyZSdzIGEgc2luZ2xlIE1TSS1YIE1NSU8gaGFuZGxlciB0aGF0IGRlYWxzIHdpdGggYm90aCBQ
QkENCj4+ICsgICAgICogYW5kIE1TSS1YIHRhYmxlcyBwZXIgZWFjaCBQQ0kgZGV2aWNlIGJlaW5n
IHBhc3NlZCB0aHJvdWdoLg0KPj4gKyAgICAgKiBNYXhpbXVtIG51bWJlciBvZiBlbXVsYXRlZCB2
aXJ0dWFsIGRldmljZXMgaXMgVlBDSV9NQVhfVklSVF9ERVYuDQo+PiArICAgICAqLw0KPj4gKyAg
ICBjb3VudCArPSBWUENJX01BWF9WSVJUX0RFVjsNCj4gWW91IGNvdWxkIGFsc28gdXNlIElTX0VO
QUJMRUQoQ09ORklHX0hBU19QQ0lfTVNJKSBzaW5jZQ0KPiBWUENJX01BWF9WSVJUX0RFViBpcyBk
ZWZpbmVkIHVuY29uZGl0aW9uYWxseS4NClllcywgd2lsbCB1c2UsIHRoYW5rIHlvdQ0KPg0KPiBU
aGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

