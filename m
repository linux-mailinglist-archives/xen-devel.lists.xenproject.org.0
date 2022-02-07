Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F64AD078
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 06:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267436.461248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHIhu-0003tP-M0; Tue, 08 Feb 2022 05:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267436.461248; Tue, 08 Feb 2022 05:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHIhu-0003ib-HQ; Tue, 08 Feb 2022 05:06:26 +0000
Received: by outflank-mailman (input) for mailman id 267436;
 Mon, 07 Feb 2022 20:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErhA=SW=epam.com=prvs=40371fc674=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1nHAFV-0008Kx-6N
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 20:04:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28bd38ae-8851-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 21:04:31 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217JjYOI027387;
 Mon, 7 Feb 2022 20:04:26 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e39v6021w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 20:04:26 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM6PR03MB3653.eurprd03.prod.outlook.com (2603:10a6:209:39::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 20:04:19 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 20:04:19 +0000
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
X-Inumbo-ID: 28bd38ae-8851-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEke78kK7gJbaU9FwrFKAJzdBOYxt5Z0utl5Wu3y6V0ayuNQLqev69OMxY607XGdZ6n+YT6NpneXTwa0XreMakItqmYKE+pYDr9eY7Uxx7bXMvVEY5zePeZi++gG7HU2KDzxqQYL0580WAGJeCmATp9uwfBKTRQ1/miYGktmG3v7WkhXhHH9Uk4x4SwT1Xa26nE9qkbPpoR2xwqa+dAOVEul2tMDPOl6B0Z3MFheD0bwTzsRHQnqAZ6PLvehOzjiyT7ere2MDB1mr7vs6ztkIiYWGtY3Z3f0IFzJAAYoqjKZ9cacZtZzqzvXbqoAzqbXLh8wsL1JrQ18zDGxS2cRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q+4tKJYOMjBfbsHP4XIsGbDN7rsMa8a8W0Nzt5979g=;
 b=ZNVbUKh6JTs9UXTlNNuEyFfhSuoA+xTrfr0lZjFhqs8rIsa3Y9qtA/FK5CyRcLQj3IDryH/uzWjClO4lyala6nVy7sIO5DywAP9BD7xPardFzaXH6EdSX6nt1ecr9rddFLdPsGhlBfPX/wlZO+MIs7Be/mCU0DYKRi+VzsKDwRPj9c49AToSRjL1DgNeHrGBLPlMs4mQyloh89kQ164MbAFKnMGS9InZd8Wkj/6SfCqYxRyfpZMiHMi5lQcyGZ7EX1AfFkXiMeuKCxdsYP8BW8Pn9fwqUfTnVk577XQycqo69DyE/lH+ma+CfXlUMOSISBySqWgoDLMExy4DPm+lvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q+4tKJYOMjBfbsHP4XIsGbDN7rsMa8a8W0Nzt5979g=;
 b=Dbmo0/nGGO98aP92vvPaurOo4dz9NkYuDyAQ5821Bci4xDMqCJNlsTDIE/RwEjjStJwHWbYOrk1E+1+agkhtMu0tqjcNvcOBjRfsWKncn68RtjwItAps3NX11CF4ql0BLqMAqOGVG+uaBt6PaakD9OdXXPWo14S9cMA2EXsofTZ3JyNuHM5kFQYnrL+DvLnCXOQYvcA6mcStevfgAfc6RSBqqO7qNnFcEgE7NM+//HEC15I7/ufgaDvZmvsflXsXI3RUrsgvgUGHq9QpUrLS9hssdygVFMdkNn7rWbDwlJ9Vcyj2ERtqzfuYLFgNFe4O02mxG4ERs6948+YHlq9L9Q==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bob Eshleman
	<bobbyeshleman@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Thread-Topic: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Index: 
 AQHYAomKM/4d8JNsdEqc8nNA4dib2KxWDBOAgAAkKACAMl6jAIAABJuAgAAAX4CAACLbAA==
Date: Mon, 7 Feb 2022 20:04:19 +0000
Message-ID: <a7c1be96-431e-feb2-aaa3-166a58ea158e@epam.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
 <ef4f77d7-2ad7-998e-c32b-534fdbc64e7f@xen.org>
 <46822a8c-998b-6ebb-5e2a-c9df5f7650e9@epam.com>
 <da4fc5cc-d80e-b4d6-7c96-0f9eb47a9304@xen.org>
In-Reply-To: <da4fc5cc-d80e-b4d6-7c96-0f9eb47a9304@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72113f5d-ba06-463c-ceb8-08d9ea7506c4
x-ms-traffictypediagnostic: AM6PR03MB3653:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB3653FE27E3BE155E8F348BBE862C9@AM6PR03MB3653.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VQsc+sKu0xMwwi4Y1MddKkc45g1kgKWL0WB6/MwJKVbgwbBwNyM4ngKnNR/2NDwaAOKoHvkux7ElovTJvjPVKXUD664rX18j1K0esiDmfK7soBaK0qPt1j+OJsjsnArEaNF7C+2wX5Butr1cXNEXb3ZzAAxWn3z6f7AtXFoc12VEg9F4zliI5u7yEHb4jqUgtj3BWgv7ZIUlO4/p49zJ+on9Sy7Md+bLeCtFnpqjA5ghk/y6rRmrignaYheJXaFdRKt3ANxOCtnTGT8GfZCyIBR1p8Vh//1s+XfHGOsaRNVvRGiTccBE4hHz9DjR5sHaotzD6fS311UXpXgcD1Yi/nhy/NVcR6PJ7sCW0BMJEmrTBsQyowPpLXUcyfOjh/zAGBGmO6FvxM1EWeUoi/VMmCJ7N8z4gJKN5luZNOU7AMRKq9TZWIdNCjkWBZ/BmNUsMlV0LSwTODU2BZha4R2EkBMRH0vmjtEpnDcTr14LGf8H+E7wogoZ3EPHRydDtKpBVhV27dNwdJ1o1Ba4aOhS6qGOQug85i3rb5XRSNwWqBZqG67tc3YC7wGcPL5rCQpVs1+ay/cp6fBqlcL9ik4PBKxgJY/f51tYy7FpkZ+WL73Iyi/ICgvdCI+amCmx7Y/8RpM6H4UnPHHsaJ4JJ3T8rd2vAqnLEjITePSwyqyCJmNhQhiREyCkXF5j3WC22Z8QVBtfYqYfeM1uuh8tDy0DIXvjD/C7zSlHYG8QV/2jXurJvdiiCC0Lmsjxi5VBufoG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(8676002)(86362001)(8936002)(66946007)(66446008)(2906002)(38070700005)(31696002)(64756008)(76116006)(4326008)(91956017)(122000001)(38100700002)(4744005)(7416002)(508600001)(2616005)(36756003)(55236004)(6512007)(71200400001)(6506007)(6486002)(54906003)(26005)(186003)(316002)(6916009)(5660300002)(31686004)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZllLMCtLZ3ppOStlVGtEZWVKeDlXVXJLUm1yTUhhN3pma0doUC9VRVRjQk1Q?=
 =?utf-8?B?NmFOSG9wZ1k3eUNCRi81V1NsNDVrV1BraXZJcHM4a3R3amlBMUd2ZHc2amM2?=
 =?utf-8?B?dEo1NlR0eWZyaEFSVEJ2SEYrUkQ1Q1NJdWtoMEx4YlAwSWFWaWFzdHcrZzh6?=
 =?utf-8?B?eEMxdWtVY3JHa3lXVm1vWVE3V2JNSHdvSlN1anRlbjhUY2hEMS82ajdhMVE5?=
 =?utf-8?B?cEU3WDZUUzlUSms1TTRPakVFNFZxS1hNUndaeHFZeFNCUzllSk9rQWJ2SUNT?=
 =?utf-8?B?WWEvTkNkTHVhcUpHTzJLRXZ5YXQ5WGJWdHhJYW1UUHVpZkd4dnZ2bEV5WFcw?=
 =?utf-8?B?YkpCcUdpMXFKQnZqZzVIa1BUdmRwdmh1aUVQK2YycTZ6VHBoWGI5ZnBLMURR?=
 =?utf-8?B?K1BCWDZnSlQrN2F2OW9WNmJ6c2dpdnorNFdWWnl6R01xSTUvc0pQNzh1ZGxo?=
 =?utf-8?B?dmR4NWZLNGZHblBlcGpZWFp4SnRabHUvdzgwNlJISUZYTk5peStJVzdqc2JG?=
 =?utf-8?B?K1ZMdDlld2F4d2FmaDQ3eWUyUXBHTnhhVDFvQlVscW9CU3NEc2NOV2ZPZG1T?=
 =?utf-8?B?Z0JEWit6cSt2QjVPbG5OSVBnaWUyYWNQTWhpR0pSZURYV211SlkvUU9QRWRu?=
 =?utf-8?B?TmtLQmFEWURYVUVYcGYwMXJNbVliMDg4QnFWWCtXNXVTUXhvNWF2eloyYU9V?=
 =?utf-8?B?bGJ0Y3RaT1Fzem1QQXhqdEtJajlmQmc2TTQvRTI1YVB6ZE9iam1sOWRuQjVr?=
 =?utf-8?B?SGhGdUtaK1ZiWEZKMXNhSjJ3VHpJTWFZc095cDBNbXF3ZVRDRGFIQlppRVIw?=
 =?utf-8?B?b1h3a3g4OS9GdTRKV2pGbXBWWW9sUFovQXJLc25ldFZkYTNHaW9PTHZFZjNh?=
 =?utf-8?B?d3RuRUhnR1dmdGtTS3NHQ1VxVnVTQ2tEMDhJY3NvbmxDZVZsS2xqTURhbGJ4?=
 =?utf-8?B?SVBJdmNrRE9VUERnbDc5eFlWVXpGbnd2L0JmRmJNZWFpb0hSb29FZ3N2eTBn?=
 =?utf-8?B?MERxR3cvY244MG9Pb0UvWDhZdXVWZXp5NUllUytmM1ZpVDRVN0x5eE92TEJ5?=
 =?utf-8?B?M2tzbFh0NTlUR2pJTVBwdzc0M205aFltYnAzdmZGS2NKUHVkWmR6UnRoRDM4?=
 =?utf-8?B?TnFOWjUrRWRLai9nWVpOM0hxalYxaCthNURKQTE3c2xoUjZ5VUdlSDUvSHFU?=
 =?utf-8?B?QTJKLzdXY045YmU3bXpxaVVlSk1QVm56RXd5eUJ1RUgxcHhWSjUzalk0WWdz?=
 =?utf-8?B?bDFzNXlJUFpVZUVTUmdYRkFGNWdiOFdrOG9VZk1BWC9tREQxMzUzeXFSczlr?=
 =?utf-8?B?MTVCQU4xRy9uckZ1ZFpFbERGL2FIem9xSVVLVVVMYzZmQ1djMXFzYU1qT3BW?=
 =?utf-8?B?bzNndU4zVWhIMkFuTkxIalhSa2E0dFFJYXVFeW90RExSQW1Vc1NKRkpFVEdv?=
 =?utf-8?B?dnYvWWR2OE9WTEJsL1I4bVZZb1dGV1BBNTNGUHU5UFU3WnVRSXd0TjBoZXFa?=
 =?utf-8?B?QitQYyszQVFadVVsK3NaaUJIcDBnU1VSRGpnMHU2YU5DdkNQRGJQNmZSOVBO?=
 =?utf-8?B?dXExWmlVbEgvdlB6N1VHRmVtRGgvMHdCMlJ3amNkM2tnM2hPVU1FaEZnckhS?=
 =?utf-8?B?VHN6TEl4dSt6S1A2TnprUGtXTmxITVVGak42MWxQbzIrTU41Ry8yOWdjZStj?=
 =?utf-8?B?ZloraG04ckNmaVZkelFyOWN6bktIaisvYWVEQnlOeFh2U0ZTeEpiQk1YTmhq?=
 =?utf-8?B?akRUWnJhNzI3U2hMSzh3ZjE0SzFQbGk1aG96SlV0cGR6SlN1YkN5WWgxZVRw?=
 =?utf-8?B?Q1B0RjlUVzBHZWRiZGpRaUVOTzVFZW95U0xsWWZRUmF2bUdmSHQ5dHhHQXh2?=
 =?utf-8?B?YXhzeVV1U2N1RUNKYlN1SzNkQVZMRlRlekRLNy9ybU0xbXdReW8yVUhISEFO?=
 =?utf-8?B?d0w3SFc1RGY2Y2s3Y2FrUytwejc2NjY1VGRoZ05QVUFhejJTdTdFRndBT1lm?=
 =?utf-8?B?TUpqMm15N2NzQW84RmdpamxHZDlXdGhmZXV0NlU0RWNtb1pYYVpxWWV4ckV5?=
 =?utf-8?B?aG52QWdEUUgrK21ZamFVcUlmNGlFZjFUS1NBbGdMZVVjSEF3QUpsRjNLTVdj?=
 =?utf-8?B?b2ZBZFFqQjVtK0dvc1dCUVBjbDNNeW1DL3JQRlc5emI3QU0wZ05SSDVySStn?=
 =?utf-8?B?Z1ArMDRPMDM4a2h6b2NKWEFkRWp6QnZjamZ4cVV6TTFvOXV3TXk4M21xUW91?=
 =?utf-8?Q?6yw0xfyGYI+8nOKce/SyskyoVyY/03gVjtO9WXnUk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2766C9237B83944B028310C43DF392E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72113f5d-ba06-463c-ceb8-08d9ea7506c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 20:04:19.4801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98IJ43PXlBFRUgl2RLQrOl1f555iDH1gUjrH8vfbT/SPQxkiqYYtJu7ho+fGURbRhk9zD305Z0/HJ08fW12eeyx+WLiJ5u+gST7mQj9OZzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3653
X-Proofpoint-GUID: CXtEeiRaLDV1Kb3uQNxRrdNMSJbsVYSJ
X-Proofpoint-ORIG-GUID: CXtEeiRaLDV1Kb3uQNxRrdNMSJbsVYSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 mlxlogscore=905 mlxscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070118

DQpPbiAwNy4wMi4yMiAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KDQpIaSBKdWxpZW4NCg0K
DQo+DQo+DQo+IE9uIDA3LzAyLzIwMjIgMTc6NTgsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3Rl
Og0KPj4NCj4+IE9uIDA3LjAyLjIyIDE5OjQxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24g
MDYvMDEvMjAyMiAxNjozMCwgT2xla3NhbmRyIHdyb3RlOg0KPj4+DQo+Pj4gU28gSSBhZ3JlZSB3
aXRoIEphbiB0aGF0IHRoZSBuYW1lIHNob3VsZCBiZSBhZGp1c3RlZCBpZiBpdCBzdGF5cyB3aGVy
ZQ0KPj4+IGl0IGlzLg0KPj4+DQo+Pj4gVGhhdCBzYWlkLCBJIHdvdWxkIGFjdHVhbGx5IHByZWZl
ciB0aGUgYWRqdXN0bWVudCBpbg0KPj4+IGFsbG9jX2hlYXBfcGFnZXMoKS4gSXQgaXMgb25lIGxl
c3MgYXNzaWdubWVudCBwZXIgcGFnZSBhbmQgSSBkb24ndA0KPj4+IGV4cGVjdCBhbnkgaXNzdWUg
d2l0aCBzZXR0aW5nIHRoZSBiaXRzIHRvIElOVkFMSURfR0ZOIGV2ZXJ5d2hlcmUgaW4NCj4+PiB0
aGUgZnV0dXJlIG9uIEFybS4NCj4+DQo+Pg0KPj4gU29ycnkgSSBsb3N0IHRoZSBjb250ZXh0LiBU
byBjbGFyaWZ5LCBhcmUgeW91IHNwZWFraW5nIGFib3V0IHdoYXQgSQ0KPj4gcHJvcG9zZWQgYXQg
WzFdPw0KPg0KPiBUaGF0J3MgY29ycmVjdC4NCg0KDQpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZp
Y2F0aW9uLg0KDQoNCj4NCj4gQ2hlZXJzLA0KPg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIg
VHlzaGNoZW5rbw0K

