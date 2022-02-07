Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F884ABA52
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 12:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266764.460471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH2BF-0007ch-8w; Mon, 07 Feb 2022 11:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266764.460471; Mon, 07 Feb 2022 11:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH2BF-0007aS-4U; Mon, 07 Feb 2022 11:27:37 +0000
Received: by outflank-mailman (input) for mailman id 266764;
 Mon, 07 Feb 2022 11:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH2BE-0007aK-3O
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 11:27:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f17d245f-8808-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 12:27:34 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2179ge3Y031345;
 Mon, 7 Feb 2022 11:27:30 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e2xqt1b5r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:27:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2829.eurprd03.prod.outlook.com (2603:10a6:800:da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 11:27:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 11:27:25 +0000
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
X-Inumbo-ID: f17d245f-8808-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtrIs+uIvqu48KuICGcBEHAFrHDWfE/Sswk+/LpBwCnabFhn4iBVD7qSTjEJCRgtV343zdCtuCsdGZxPiykEJWv+3wvR8byGFwnjLBpaNLlsPstVqFWqnfPdVWASqRapfe/61UaNpCH0h28WCBRspbN7NGhdnSIoik0k888yy3VbnW0klgptFyYV2z46RqUpV8wH8g11R14BWtzhe8m8uw20Mktfc4kYxFdGeLElmfx3m25rFpJM6XlMyXlIulKPGF8QPMuycyJDe93Dw/6oBL1gH3Ohu11WSkylUOkq/ClVcZplJp1DCr4lICEP/xL3GZCmcLLizxp3StK9EI/DtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDt+cwtoR7ZZwhNkFnxN2q6lMj2E9WZmyXTOAn4yw7Q=;
 b=IE/+d6vqrPWaAknFTqQgj7Z72h6HfZza2Hs5izYRNYw0YhpfGhlNVrBaTWjcZEmoPlf4zHy+Yqg4lpUnuFX95EBoNsaDwFkfHGn5b/drnkzbmzVZ31fj846QNiQv/ZJ0BzyLX/e/BEOA1YDpTIuwBGm3lrBLHg6vdchYsbWlNRbRCkLLjp8CpFuCSbTBixO/m3+hvXBNBEvV+blRzG1N2iJ7K/JRCmjjYgXnvlTjO9Wv1X23D5rHrwvqz3uUtJGSUzw4+zMsCeKlshINZoIko1ffb4JUEZ3iXM295Gc/YdZx9rO13OtPuwt5F/LyBf/GVHyNzQnSu9mg9zTyc/orkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDt+cwtoR7ZZwhNkFnxN2q6lMj2E9WZmyXTOAn4yw7Q=;
 b=SX7DKGSOrBBT2cHztDbs84agvGB7oszCyBDzJBcdQFtB+Y5imKhScVbN19s9GPq6GRfoSEbwE7sPe8nK5Oc9+NFQR+cYo944zuRtY80BOqVnpk0HH2Rev72cb6+bb4in+875xC1XiA+WbPwrcM1XUieuw1Ufosa/Zq2fZBj6h/zLhmE5C4CxySq13RY0qZRiGvIAKgAI99/+gSF+0p/zjy482R3tD6KcBQy0pAXOWNeluFR3Asn7fDoJUw84MJBIlk+XNSkdWJAuSNWCs516+GRLAJZxhooLq4J2vc7/epmrpwb9S5pQPhl6d4BqFzQwK+i6a+DroxAjKNSSE41UMw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgA
Date: Mon, 7 Feb 2022 11:27:25 +0000
Message-ID: <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
In-Reply-To: <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 145ea3a2-01dc-4d1c-2644-08d9ea2cd116
x-ms-traffictypediagnostic: VI1PR0302MB2829:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB28291296C4E8395D9FB32E1EE72C9@VI1PR0302MB2829.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KSlB7i/+gpY722HMwnPUnIjYvLRzIn7yN2vdWTY9cNY9rmNu8GIHO4nZ2ieM3q2+vyWDkFlkn/GZVPIQT6h4pEcIlwxjzOcVBGs8FL0XWGtHRoH3xFqoBLl9nw5TB8atsuMTRxgDFAucOMeGR71UDyIC0mNpNMF5raPTHsaKJGMgX5qC6lwcfePmvzjuNEP3Z31T7kRA1YcjJy2d+ARGCA0yw2ygM8CXW8GYoRBMOC+HyTLB9gvBfIN3KRkVsuaOaSoQgHQ6WBzWSt9CDSqIK5Qn/00+B3i/D8UrIv+glDpNBjIkQclsRqkv/yuN7yn3NnFQ/zsdY2NZg/avyoOaVob50hNS/feo4ThshwBBrCBH2ex0apsE16j16oqe9pr+O0mdtvu9EZU8RY0BxTGN62rbW70OjVzIlRydPUBtB+R++wb/LKgAD7WInCHsNyDw1MTtzdQBhhVrp3YfYGEvG6e3A8wSxFQn6kLaZBD+thw59QVRplVK50R/NWfhPrTkLRCgwOgo+LzxfNUVzaiW7mBlk8tCXwDb7m3XtIafEmR8hzuMPnWtZj94mP+UKUMIyVqsLmS3WlYLcV1cU/vY547ZxtvdBpysfNQahefgKkyptuLbOQk0eqlP0Pv4DuTDOJipxRcp8JFUZiUfvqPXkcKjOiJs4LsoH0zsubCet29AHMbJWJaIchjL00OE4HndIRn0aWYhHX9KaBfdrHTtCgP9W94VVOAUf9a/oTIWgn0crfP8W9XKBjweXOKyiBII/JeYzPa48HwvNAZFMloY0zkwNzcN7G7/3IQqj+OwFn/GQGLS90a7RWGT0e8rvrx3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(966005)(2616005)(31686004)(6486002)(26005)(186003)(38100700002)(7416002)(508600001)(31696002)(6512007)(86362001)(5660300002)(76116006)(66476007)(53546011)(55236004)(122000001)(54906003)(316002)(6916009)(64756008)(91956017)(71200400001)(4326008)(8676002)(8936002)(66556008)(66446008)(66946007)(38070700005)(83380400001)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N3BGRlp3bDBwa1VDWjhYbVFtNnBwd01EYm4wdW5BTWwzanR1UndLZ3ltNWJw?=
 =?utf-8?B?d2h5YnZTL3JOWEkyQURBNjVKZldIVzBxZHI5amNzTWE1YnB2QW5kRGJveDVw?=
 =?utf-8?B?MGRsOEtWYmh2N2Y5QXRjVmEyYXBxdjI3em9kWlV1YkwvOURPcGNRVGNkM000?=
 =?utf-8?B?dmtpUm5Cd09ReTgxNjBYa2xMK2diSHpQcXA2cDl2anlpMDdUUTNjdkYxb1Rm?=
 =?utf-8?B?SjhyaVBMdENpclZlOGYxQVRyVW0vcVg0RFlSUDlrLzFUcTUzOG5kem9HV2J6?=
 =?utf-8?B?RExTQnAzclBqS2xYMU5WVWY2ajExVFBZRUtkMmRRb1NqY0JmZ3NZQWJLNDBN?=
 =?utf-8?B?K1ZOVU9GTVR4bzIvRXVUU3NmcVNvMzE2eE5hR1N1YkFpRC81MTYwYVBLcXpT?=
 =?utf-8?B?a050Z05sdkZDVHFkRWRwNmdoRTJjMDkwSXZwL0NLN29BbHl6RzFMWDNDcFBJ?=
 =?utf-8?B?R2FLeGRzSU9SbnJKaUNka2EyaUlEb1pTcE0rUkdpcW84emtpUkxNKzUvNGZD?=
 =?utf-8?B?R0V6ankwa2h1RWVhczZncUI0bUNzeG9hRFJUdzQycW9uR0UzQWtiT1Yvc1VG?=
 =?utf-8?B?YlIyamE2dlVlZzFMaURVL20vaTVhRjBDV1d4VVg1K2hLU1lUUS95WWJUQng1?=
 =?utf-8?B?MzFpRWZ5Z042clZNbFJYYUpnQnUzd3FoTENlUFdYaWRacFFWaUlyQ2pOWHNn?=
 =?utf-8?B?RXJGS3FMcUFNbGV2d1dCV2VoM3NrYU4zaVRiUmJvSkpBdzVDV1p2QkNtbFoz?=
 =?utf-8?B?ZkJuUWg1TVVqTVJMdlkvckMycmppM2RJV3Vyby9tcWFwbktOQ0xnWU9IT3Rw?=
 =?utf-8?B?NUdPT2Vzc2RiVXozK3hxWGd3WTR2dXF0b2MvSS94N0h2Skw1WWdzbVlsY1o0?=
 =?utf-8?B?SysrS2ZzaUVMcUo1QXVvRVBjZVNUNEJ0a1pHUm9jb3ZVRUhVVyttbzJ4UGJK?=
 =?utf-8?B?K2VKK2xhYmtNV0JtOWZVNWtpbzRzK0FWRGpIRlV1N3pIajhpTzJqVXFFdUVt?=
 =?utf-8?B?YkI5Q1JmMWdqbU1YS0RKb0IzR2tMT1ZvMklyS1FIb0svQXc2dHo5YnhFNFFq?=
 =?utf-8?B?T2Y3dS9RM0kwZUQ5TVV3MHdNWHh4d28ya2J6anZib0FQZm5wOGM2aVFxbEkw?=
 =?utf-8?B?SjNHbXlQNitPNXlnbVp4TEJ4eXB1N01ZQXJtQ1BjcDBxQlZ6M0lyY2cveUEv?=
 =?utf-8?B?QkxJREVBeUgxYk5tN2xNQXYwZkgzVldDZ0duTDJRc3YybjM1V0xUQWZ0MWxR?=
 =?utf-8?B?SzAvWnZ6MmRNQk9wTld6bmRCZWtTcURrY0lVQWhJYnpyWGdSZkx0R1JkOStN?=
 =?utf-8?B?QU1XM2l6RmN1ek42bFZSUjl1eVRvMWRBcXdDcmtxampGQmFXRGlJaWRxNDdG?=
 =?utf-8?B?bDZGTFpzdS9FRVVEWTlNa1hMNVZFanE4U2VKT29pUzRYR29CcTRkY2wwbDJr?=
 =?utf-8?B?SjExWnNWc2haaWZnN0dLUzJXOEE3M3l1cUdKYlBqTW9ZblpNOFBjT3A4NTBO?=
 =?utf-8?B?eCt1L2syWERXUTB1N1pzU1RDaURpeitwSk5Gd2xTaEdTVG1BOTZWY0o4ekZv?=
 =?utf-8?B?ckxrY1NoUThlbzNwQWc5bWRRYkdaUzZ6bC8rTlNkaWl0eFpQc1VQQm4vOC9o?=
 =?utf-8?B?NTBmVzUzRm5rbWFWdjhqb1gzbSt1Q1o3SVlPeVN0YklFa2VyWS9YNG9sYWsx?=
 =?utf-8?B?dXRtdjZsZk00aFRwNUtoZlNlZlhka0crQVhPakpubjJ6TWhHeU5yZ3FqR2M1?=
 =?utf-8?B?RlZnUmhJZ2JzdTV5VjRNak11OVpwSlZlUkN0LzNvemxQRDA4SStQWXlyMzNP?=
 =?utf-8?B?TEdJS1RYNVVNaVM0OVRpZDgzMGJ0Sy9KaThIeVU3Vm9VYTZJMUZmQko3WmRU?=
 =?utf-8?B?eDA3eXVURm83NFFwR21VZzVBSkNOZU54aGNPcG9tWVphaG1uYjk4YXU1cWJa?=
 =?utf-8?B?ZjczcDdJTUo0Q1IxRHl2NllUOTBZdFE0SnBUVnJuTXFYamV5UlFLN2FTYkds?=
 =?utf-8?B?a2JnQkpwS1JHeTVoQ1lMKysza3JONEdBNGo1NVJWZHpFTmdCZkdHTHZQL25o?=
 =?utf-8?B?WkdoaEk4a01nNExnVWVFalJwWFl3WjNuc2xlYkZDMFdRUno4VzNLUHNNc2t3?=
 =?utf-8?B?OFNZT0FxTjNRWUMrRTJETGNmcVpGblZQNzJON09Fd0xENmJYSkp4WklVTFdk?=
 =?utf-8?B?WHFZNnpOb3NuZlRtMmxwUkg3d0U4NXNMWXBVdXNoMUV2eWlTQWtaR0UyV2VI?=
 =?utf-8?B?R1RSUUozQlFCZDRBeG1BSk44U2IxRXlUcGhnY0VOSGZ6VWZMeWU4VFFBM2Nz?=
 =?utf-8?B?UWxjaTdtUWZIbEt5WlhlV1BZV0xVTmFpY3FBS2FicVliZktmYXVXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5836A6A90722944833021E64453E7F3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145ea3a2-01dc-4d1c-2644-08d9ea2cd116
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 11:27:25.5892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmQFpMYEgfQIqoMYYqQetoRoCPHfoFtdAABXvX6mmq1sPx7BCM0wXEavilpgfNrYvx7PpxawmRUME36Ur25q5Pn5AssRY2x2m0V83qLdfTET93GL+GglS3IXArqi8Oud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2829
X-Proofpoint-GUID: KXaxsyHVC7ziJF_ypjYmEaZ56TX_vh8_
X-Proofpoint-ORIG-GUID: KXaxsyHVC7ziJF_ypjYmEaZ56TX_vh8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070074

DQoNCk9uIDA3LjAyLjIyIDA5OjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAxNTozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNC4wMi4yMiAx
NjozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMDIuMjAyMiAwNzozNCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IFJlc2V0IHRoZSBjb21tYW5kIHJlZ2lzdGVy
IHdoZW4gYXNzaWduaW5nIGEgUENJIGRldmljZSB0byBhIGd1ZXN0Og0KPj4+PiBhY2NvcmRpbmcg
dG8gdGhlIFBDSSBzcGVjIHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciBpcyB0eXBpY2FsbHkgYWxs
IDAncw0KPj4+PiBhZnRlciByZXNldC4NCj4+PiBJdCdzIG5vdCBlbnRpcmVseSBjbGVhciB0byBt
ZSB3aGV0aGVyIHNldHRpbmcgdGhlIGhhcmR3YXJlIHJlZ2lzdGVyIHRvDQo+Pj4gemVybyBpcyBv
a2F5LiBXaGF0IHdhbnRzIHRvIGJlIHplcm8gaXMgdGhlIHZhbHVlIHRoZSBndWVzdCBvYnNlcnZl
cw0KPj4+IGluaXRpYWxseS4NCj4+ICJ0aGUgUENJIHNwZWMgc2F5cyB0aGUgUENJX0NPTU1BTkQg
cmVnaXN0ZXIgaXMgdHlwaWNhbGx5IGFsbCAwJ3MgYWZ0ZXIgcmVzZXQuIg0KPj4gV2h5IHdvdWxk
bid0IGl0IGJlIG9rPyBXaGF0IGlzIHRoZSBleGFjdCBjb25jZXJuIGhlcmU/DQo+IFRoZSBjb25j
ZXJuIGlzIC0gYXMgdm9pY2VkIGlzIHNpbWlsYXIgd2F5cyBiZWZvcmUsIHBlcmhhcHMgaW4gb3Ro
ZXINCj4gY29udGV4dHMgLSB0aGF0IHlvdSBuZWVkIHRvIGNvbnNpZGVyIGJpdC1ieS1iaXQgd2hl
dGhlciBvdmVyd3JpdGluZw0KPiB3aXRoIDAgd2hhdCBpcyBjdXJyZW50bHkgdGhlcmUgaXMgb2th
eS4gWGVuIGFuZC9vciBEb20wIG1heSBoYXZlIHB1dA0KPiB2YWx1ZXMgdGhlcmUgd2hpY2ggdGhl
eSBleHBlY3QgdG8gcmVtYWluIHVuYWx0ZXJlZC4gSSBndWVzcw0KPiBQQ0lfQ09NTUFORF9TRVJS
IGlzIGEgZ29vZCBleGFtcGxlOiBXaGlsZSB0aGUgZ3Vlc3QncyB2aWV3IG9mIHRoaXMNCj4gd2ls
bCB3YW50IHRvIGJlIHplcm8gaW5pdGlhbGx5LCB0aGUgaG9zdCBoYXZpbmcgc2V0IGl0IHRvIDEg
bWF5IG5vdA0KPiBlYXNpbHkgYmUgb3ZlcndyaXR0ZW4gd2l0aCAwLCBvciBlbHNlIHlvdSdkIGVm
ZmVjdGl2ZWx5IGltcGx5IGdpdmluZw0KPiB0aGUgZ3Vlc3QgY29udHJvbCBvZiB0aGUgYml0Lg0K
V2UgaGF2ZSBhbHJlYWR5IGRpc2N1c3NlZCBpbiBncmVhdCBkZXRhaWwgUENJX0NPTU1BTkQgZW11
bGF0aW9uIFsxXS4NCkF0IHRoZSBlbmQgeW91IHdyb3RlIFsxXToNCiJXZWxsLCBpbiBvcmRlciBm
b3IgdGhlIHdob2xlIHRoaW5nIHRvIGJlIHNlY3VyaXR5IHN1cHBvcnRlZCBpdCBuZWVkcyB0bw0K
YmUgZXhwbGFpbmVkIGZvciBldmVyeSBiaXQgd2h5IGl0IGlzIHNhZmUgdG8gYWxsb3cgdGhlIGd1
ZXN0IHRvIGRyaXZlIGl0Lg0KVW50aWwgeW91IG1lYW4gdlBDSSB0byByZWFjaCB0aGF0IHN0YXRl
LCBsZWF2aW5nIFRPRE8gbm90ZXMgaW4gdGhlIGNvZGUNCmZvciBhbnl0aGluZyBub3QgaW52ZXN0
aWdhdGVkIG1heSBpbmRlZWQgYmUgZ29vZCBlbm91Z2guDQoNCkphbiINCg0KU28sIHRoaXMgaXMg
d2h5IEkgbGVmdCBhIFRPRE8gaW4gdGhlIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBmb3Igbm93IGFu
ZCBvbmx5DQpjYXJlIGFib3V0IElOVHggd2hpY2ggaXMgaG9ub3JlZCB3aXRoIHRoZSBjb2RlIGlu
IHRoaXMgcGF0Y2guDQo+DQo+IEphbg0KPg0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCg0KWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAy
MTA5MDMxMDA4MzEuMTc3NzQ4LTktYW5kcjIwMDBAZ21haWwuY29tLw0KWzJdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0wOS9tc2cwMDcz
Ny5odG1s

