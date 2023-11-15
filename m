Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598817ECE19
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 20:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633840.988947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3LjG-00019z-OL; Wed, 15 Nov 2023 19:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633840.988947; Wed, 15 Nov 2023 19:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3LjG-000182-L6; Wed, 15 Nov 2023 19:39:14 +0000
Received: by outflank-mailman (input) for mailman id 633840;
 Wed, 15 Nov 2023 19:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6a9m=G4=epam.com=prvs=56830be07e=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1r3LjF-00017w-Oi
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 19:39:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5cdc1a8-83ee-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 20:39:11 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFGraOf027671; Wed, 15 Nov 2023 19:39:03 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uctca2rtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 19:39:03 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB10128.eurprd03.prod.outlook.com (2603:10a6:20b:5bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 19:38:58 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::fea9:8f02:fb13:fd44]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::fea9:8f02:fb13:fd44%6]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 19:38:58 +0000
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
X-Inumbo-ID: a5cdc1a8-83ee-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me1fSBOWzjdiLnFszU3DJRTWlp0KWtgBud0ptuLeP5H1TjbGE8CyEUHa5PI5Pvia240sTUYBDG7sb1V4PD4FPW1Rj2XSaOYc3vEPWbHddot+t4jm5/mP9vVq3MU9QK03tJdEcMfTFm6OMYSKWO2Z8/K4J9jC1ID6ShlTz6skC+35ErScVBFhCBYpFDY6o68OUpqCeJTWiDPguIuK4yruefkY1+xAuY63J+U47wcUD67kmzv/4bY/ehFsTlpDO2dpcXFBfCS7kc84ODb3DALN3GZTFI4et5dWNjaPePaipY54IFK30ERxO861v/WM8DovvALzpDHjdxTkwGEs26QRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f74twMPlyyNfZBYsvlbbeQYuwB/qF1IsQ1Qbn18Fhck=;
 b=S5ALl1480FdMNG64EX6Er7A6pGrLv5MHTix2XYlLs6bRCOP6Tv/wAeOsavf5p081sTiCIC8y+ZsfdsXynPPyF5bHAsgG9B31CPW8m3Ig2w0guLJI0rtHTYImsZFLO/mRX+FkR9Eu4XFVzSLS63XCLBKEaCLn9qVXk4j3F+aNc9gp3WPPYJ6s0iqgFPY7s/CoplxArVC0LvNr1OUe9NCHtSyco8bvArXgvI2pOwTWz6Lvc6h5vXqiNOJZ309u+XYvRoTEUL+bxS65ZfV83SvXrNlVPQ0HekLYoDLCaTC6esW0iG1tiyz4DlwHYFA/VUj9eHe3qY41TJ3Hbv3qm+cGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f74twMPlyyNfZBYsvlbbeQYuwB/qF1IsQ1Qbn18Fhck=;
 b=O9BoUcu7I5VVAVycf2MlcsNhz8mcoFXZgAaA7E8Q/o9eWeCGKLHozB7fGb6FYvku81q0Qkpa29ypNxd4aciG/xw06OndxFe0g3ORFKPwWreexiRN6aWkt3rZuVnVyenIwvojYf0lrCq1zd8gjR6/fyV+SAzWdDBWJ6zwRwSc85ruLR7QX8jgy5Gn+H4x5l2YpdigVDOWI5EO9INAcWthNBmVT/HduXI2iX8sMVDrKPqY9eXZtl5cfD9O/Hu8vlllDfhbULj1H0ETryhmc8SE6VpirrtdPN2yxp6NukIwNgcHNo9xByJnF98ST4JBbKUkUG+ar0EraXGIyPWBFRmsRA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Topic: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Index: AQHaF7/0l4ZQp7ixjkGnkGM6dDamtLB7mIqAgAALAoCAAAwrAIAABRsAgAASbYA=
Date: Wed, 15 Nov 2023 19:38:58 +0000
Message-ID: <6b82639b-a2cb-43f5-9968-590aec3f086b@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
 <1e5b414b-c730-4fbf-bc51-c292e396f6c5@epam.com>
 <38ac9e15-3618-4178-b4f6-00a16eb53578@xen.org>
In-Reply-To: <38ac9e15-3618-4178-b4f6-00a16eb53578@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS8PR03MB10128:EE_
x-ms-office365-filtering-correlation-id: 26ad613a-585a-4778-16ae-08dbe61282c0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DOSLb3ergsaEMDQETRx16WmH5CRt8nFvymHRtPylUqzfZF41myqotTOgMT9yfyxCihBpA7trK1ePgye+6hCZ952iiS2zVhdvejsPhuBfSzbUPj2t47mfRRtZSyHuAi6aZ7B6igH/YSuvjZ77IJFtzvKtto0flSB9RlirjfYl4ymxpeVakCYiyplDpua2eg0rdOGZz1cFeY7FB1FJhP6liAT5HlOG4evE6Lt9JW6EF/a0jJG8+3w853d0lBIZNwTRfe1pDcHPGphyjNU7nfZd6vOz9IkaTcYgI7molk2uz3AgwJIyhwGCYaoxu71o8EmD/VlYEmjP7+8ZR/iaM5g64trWw7cuIN7VpTTE+o1DnDoe3pg3VUVH1r8rpkvbtV9h61cUcdU9GcGxhhb4vb7BoLq/aruueQI5A48Slz7k0eYqAyZLM0L7L7fXneWY7D8op4u+Jzj4CCMwUIEEBjsZwqvXTj47nE6YrgniszMYCNZlSWkvVOazg//B0WwZ7y69mM46NfqMZ0imYNpfVceSwMgH/mZmoFumn2drjR2m17yyzYR/UvvmkK8oXx6Zap3iyV27IxcpY3OlmTJ74+dI8eD/GtxYc4GOCWnyUQwDg7qge/p9O7+YLj6T881uULdREw+ObTNi3x1um5ju/TGzMA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(107886003)(66899024)(54906003)(71200400001)(8676002)(53546011)(2906002)(2616005)(6512007)(83380400001)(4326008)(8936002)(5660300002)(26005)(41300700001)(316002)(6486002)(478600001)(66556008)(110136005)(76116006)(66446008)(66946007)(91956017)(66476007)(122000001)(38070700009)(38100700002)(64756008)(86362001)(31696002)(36756003)(6506007)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z0psUUVmMTB4cnh0UmhtWUFhOTVvdXFTWDBSLyt5anBOTVZtalN6TlhVZmM3?=
 =?utf-8?B?Q00xNVQ3UnBxSmlHaVhINzUrZlUybW5ldUdaMWpmQzc2YzE0U0srVHVqSDVr?=
 =?utf-8?B?RlB5OWhhTkZxa3ZDOC9hQTJJWnh3YkFZMEF0MFR6ZFFOOVpXb0MydUI2ck45?=
 =?utf-8?B?L3BmVEN3RmJVc2xxV29XMlZlOGIwcis0Ny9RaDJRcnZtUmFTRU1sSHgxY0wy?=
 =?utf-8?B?cUtzUFM0aXVIVkFjcG8yOU53d3JrdlZadmFvR0xXam82Rng4dGNybEN0VnRi?=
 =?utf-8?B?bnZnY1hWOEVvdlJzbHlTMXpNKzRoV0szbHF6NXVtRWtsKzE1cklsS3E2QTUy?=
 =?utf-8?B?endKZ1VBb0RqUmtNUVgwL1RyalI1Y3VIUnFtMzVhZkRiN0R0U0N2QzhKaFMx?=
 =?utf-8?B?QWJyWUFESHIyeElGN095V1V5dS82Q3RsRzVuK2hiSHl0cG03TVlCemloTTdY?=
 =?utf-8?B?RW8raHQ4cVVsbmVzUkkxS2tRUkZzZmhyOXU1QmtnK0h1YmZIaHVORFM5WFdK?=
 =?utf-8?B?NnZFSmFoWG9mVUs4ZXJlemFsKzhDVDQ1SFFyRFViSnpVZUQyTVpQQVQwemdE?=
 =?utf-8?B?RzhZSkY4WHFsM3ZFaHRvWDg1VThaUzk4MWsvOFZPei9xcWRhV0pJMlduTWpo?=
 =?utf-8?B?b0NFVlJXbkNDeVV2OEZITitsdW9yMERlVkkwRTJUeExDdkE4ZHMvVWxLTmMv?=
 =?utf-8?B?ZDd3Vk5wWnNIY1dOZ2x3bkpRazRwMG9Nc01ibU42VnNvQlNiK0ZnbVluMEI0?=
 =?utf-8?B?ZDFtVEpOYnhhWGpuNVVuRGxyNEVtTGViVlIyK2hsQld2Yng4alBNTGhlYkI0?=
 =?utf-8?B?UldSeWF3MzQ4N0hPck9ORzFHQnBGT0xZUXJGVGg2ZjMzNTBjakxFVmdEUnlE?=
 =?utf-8?B?RGRIVW1RbldsTU5GQjE3YWZ6UHQ2QzR0d05PZ3c5SlpFdXNnMzF0Q3pQaXVq?=
 =?utf-8?B?VWthZHprcERCN01TdFBhUDVHbDRuM1g5TGRBSzFlenArb2VuR0pvbEpzSHJI?=
 =?utf-8?B?Ny82bGk5aHU4aFBLRVhvWVlRaExZQnlYbDdwV0hHSVNCL09MS0hZWWhRL2lp?=
 =?utf-8?B?c25KUVF4NGpWYzl1dHdVNUcyMjVXYlVISGxXYlRmU1pLaUsrZnBWUkhpNndL?=
 =?utf-8?B?Y2VDbklSVDhBODJwRWs5aTYycjFVbGcrQS9NYTRISk1QcG5CM2pMZ2NKVW5W?=
 =?utf-8?B?dmlhZFZWR1g5TEVGVU1KOW9LRnlZTkc0UnN5cTQxQ1REU3BRS2V5dThJdnF2?=
 =?utf-8?B?TDBBMmpXcytheDZLTmZMS1d6NTBFb2JENWsyMXhFUnJrRFhsUXNFa29sRFdu?=
 =?utf-8?B?LzY5V3BONHJhZTZhZ1JvcEdtUXoyckYvbG5IU2xrYkp1RHhUYmI0bjIxbkNV?=
 =?utf-8?B?cUZuamVtRUZqQXlQU3hTK2FFUjZlYW1KMTZ6N1k1ajBwekQ0dkN2TS9jMFgx?=
 =?utf-8?B?a3doTkU2OVQyUnlPdW5Kb2FFSjcyS1IybFIrZkNzTS9qTUZlc1cxd2xSeGZO?=
 =?utf-8?B?eGdNdzVMZzBXZDM1MkFtVkJ0c0FNUWEyUFlUYUtvQ2hmYlhIOEVYS0poK3Jx?=
 =?utf-8?B?T1RVM2JwZkphU3JkR1VlcnZvZ01oVDd4TTRyV3BwY2hUYWlaUlZ1OUNHRjdl?=
 =?utf-8?B?NDFBQ2J5KzVZUVZsN01sVWRmWTRlQWR4TDFtSERwQ1FTeVdBcndacWcvTjJv?=
 =?utf-8?B?S21EMXI2OEZOOXRnL2lRSkZkejNNMmh5OGpBVXdyUEp1OGxxT3l6d00rd0dQ?=
 =?utf-8?B?RGlDMjZJS2I4S3IxdlBkd1lSdklwTW4xZTFhaGQyRmRrOGtSamxkdzNXZDdV?=
 =?utf-8?B?bjZ6TU9rZ3pkSjNXMEdhb1psZVJiZGtIeVhmTEZubzl6ZGR3Ry8xUkwxc0cw?=
 =?utf-8?B?Y25QVHBFUTZUSTVTczVMRm54U29vZUtCalVOU0tWb0k5QldNZEppVVA4ZWhI?=
 =?utf-8?B?SGV5cXB3N2Z0OFlYeUtvdHNqdXVFc01vVUY3Sy8wMDlCSVdtRlpRNlRVZU1M?=
 =?utf-8?B?QjlpNzJ1a1dsOEVBNTRTTnJudS9odVNuZkJtRVAybUQvWlcwNkE5S0dUT2lN?=
 =?utf-8?B?Um5zK3pqbE81Y1VDS3VoNitFMVdZRlIrQzdhMlE0NGFOM24wY0hUZnoyNDJ6?=
 =?utf-8?B?azdYNkl5QmxpRzV0ZWlDazRNTWFkdnZQWmhhM2gxazlHK0VvNlY0aWN0U0lR?=
 =?utf-8?Q?s3F9PT0jyzmZK80vEzrPWAU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64D6312971C62E4498874244B975B463@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ad613a-585a-4778-16ae-08dbe61282c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 19:38:58.0253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwdYzcxH59VlSv6eIBNjwcxUXmCRnD3S1BMPImb+l1GaVmpr/O7uvbV7yHu3nEirrtNP66h9IImc4/KqRvVxsEiB4+rz8uoLtx2jNd79SUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10128
X-Proofpoint-ORIG-GUID: uG2tzZp4TQlhNfGYuyoJoK1N5jPb487E
X-Proofpoint-GUID: uG2tzZp4TQlhNfGYuyoJoK1N5jPb487E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_19,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150156

DQoNCk9uIDE1LjExLjIzIDIwOjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5k
ciwNCg0KSGVsbG8gSnVsaWVuDQoNCg0KPiANCj4gT24gMTUvMTEvMjAyMyAxODoxNCwgT2xla3Nh
bmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxNS4xMS4yMyAxOTozMSwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+IE9uIDE1LzExLzIwMjMgMTY6NTEsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdy
b3RlOg0KPj4+PiBPbiAxNS4xMS4yMyAxNDozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4g
VGhhbmtzIGZvciBhZGRpbmcgc3VwcG9ydCBmb3IgdmlydGlvLXBjaSBpbiBYZW4uIEkgaGF2ZSBz
b21lIA0KPj4+Pj4gcXVlc3Rpb25zLg0KPj4+Pj4NCj4+Pj4+IE9uIDE1LzExLzIwMjMgMTE6MjYs
IFNlcmdpeSBLaWJyaWsgd3JvdGU6DQo+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28g
PG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gSW4gb3JkZXIg
dG8gZW5hYmxlIG1vcmUgdXNlLWNhc2VzIHN1Y2ggYXMgaGF2aW5nIG11bHRpcGxlDQo+Pj4+Pj4g
ZGV2aWNlLW1vZGVscyAoUWVtdSkgcnVubmluZyBpbiBkaWZmZXJlbnQgYmFja2VuZCBkb21haW5z
IHdoaWNoIA0KPj4+Pj4+IHByb3ZpZGUNCj4+Pj4+PiB2aXJ0aW8tcGNpIGRldmljZXMgZm9yIHRo
ZSBzYW1lIGd1ZXN0LCB3ZSBhbGxvY2F0ZSBhbmQgZXhwb3NlIG9uZQ0KPj4+Pj4+IFBDSSBob3N0
IGJyaWRnZSBmb3IgZXZlcnkgdmlydGlvIGJhY2tlbmQgZG9tYWluIGZvciB0aGF0IGd1ZXN0Lg0K
Pj4+Pj4NCj4+Pj4+IE9PSSwgd2h5IGRvIHlvdSBuZWVkIHRvIGV4cG9zZSBvbmUgUENJIGhvc3Qg
YnJpZGdlIGZvciBldmVyeSANCj4+Pj4+IHN0dWJkb21haW4/DQo+Pj4+Pg0KPj4+Pj4gSW4gZmFj
dCBsb29raW5nIGF0IHRoZSBuZXh0IHBhdGNoLCBpdCBzZWVtcyB5b3UgYXJlIGhhbmRsaW5nIHNv
bWUgDQo+Pj4+PiBvZiB0aGUNCj4+Pj4+IGhvc3RicmlkZ2UgcmVxdWVzdCBpbiBYZW4uIFRoaXMg
aXMgYWRkcyBhIGJpdCBtb3JlIGNvbmZ1c2lvbi4NCj4+Pj4+DQo+Pj4+PiBJIHdhcyBleHBlY3Rp
bmcgdGhlIHZpcnR1YWwgUENJIGRldmljZSB3b3VsZCBiZSBpbiB0aGUgdlBDSSBhbmQgZWFjaA0K
Pj4+Pj4gRGV2aWNlIGVtdWxhdG9yIHdvdWxkIGFkdmVydGlzZSB3aGljaCBCREYgdGhleSBhcmUg
Y292ZXJpbmcuDQo+Pj4+DQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggc2VyaWVzIG9ubHkgY292ZXJz
IHVzZS1jYXNlcyB3aGVyZSB0aGUgZGV2aWNlIGVtdWxhdG9yDQo+Pj4+IGhhbmRsZXMgdGhlICpl
bnRpcmUqIFBDSSBIb3N0IGJyaWRnZSBhbmQgUENJICh2aXJ0aW8tcGNpKSBkZXZpY2VzIA0KPj4+
PiBiZWhpbmQNCj4+Pj4gaXQgKGkuZS4gUWVtdSkuIEFsc28gdGhpcyBwYXRjaCBzZXJpZXMgZG9l
c24ndCB0b3VjaCB2UENJL1BDSQ0KPj4+PiBwYXNzLXRocm91Z2ggcmVzb3VyY2VzLCBoYW5kbGlu
ZywgYWNjb3VudGluZywgbm90aGluZy4NCj4+Pg0KPj4+IEkgdW5kZXJzdG9vZCB5b3Ugd2FudCB0
byBvbmUgRGV2aWNlIEVtdWxhdG9yIHRvIGhhbmRsZSB0aGUgZW50aXJlIFBDSQ0KPj4+IGhvc3Qg
YnJpZGdlLiBCdXQuLi4NCj4+Pg0KPj4+IMKgIEZyb20gdGhlDQo+Pj4+IGh5cGVydmlzb3Igd2Ug
b25seSBuZWVkIGEgaGVscCB0byBpbnRlcmNlcHQgdGhlIGNvbmZpZyBzcGFjZSBhY2Nlc3Nlcw0K
Pj4+PiBoYXBwZW4gaW4gYSByYW5nZSBbR1VFU1RfVklSVElPX1BDSV9FQ0FNX0JBU0UgLi4uDQo+
Pj4+IEdVRVNUX1ZJUlRJT19QQ0lfRUNBTV9CQVNFICsgR1VFU1RfVklSVElPX1BDSV9UT1RBTF9F
Q0FNX1NJWkVdIGFuZA0KPj4+PiBmb3J3YXJkIHRoZW0gdG8gdGhlIGxpbmtlZCBkZXZpY2UgZW11
bGF0b3IgKGlmIGFueSksIHRoYXQncyBhbGwuDQo+Pj4NCj4+PiAuLi4gSSByZWFsbHkgZG9uJ3Qg
c2VlIHdoeSB5b3UgbmVlZCB0byBhZGQgY29kZSBpbiBYZW4gdG8gdHJhcCB0aGUNCj4+PiByZWdp
b24uIElmIFFFTVUgaXMgZGVhbGluZyB3aXRoIHRoZSBob3N0YnJpZGdlLCB0aGVuIGl0IHNob3Vs
ZCBiZSBhYmxlDQo+Pj4gdG8gcmVnaXN0ZXIgdGhlIE1NSU8gcmVnaW9uIGFuZCB0aGVuIGRvIHRo
ZSB0cmFuc2xhdGlvbi4NCj4+DQo+Pg0KPj4gSG1tLCBzb3VuZHMgc3VycHJpc2luZyBJIHdvdWxk
IHNheS4gQXJlIHlvdSBzYXlpbmcgdGhhdCB1bm1vZGlmaWVkIFFlbXUNCj4+IHdpbGwgd29yayBp
ZiB3ZSBkcm9wICM1Pw0KPiANCj4gSSBkb24ndCBrbm93IGlmIGFuIHVubW9kaWZpZWQgUUVNVSB3
aWxsIHdvcmsuIE15IHBvaW50IGlzIEkgZG9uJ3QgdmlldyANCj4gdGhlIHBhdGNoIGluIFhlbiBu
ZWNlc3NhcnkuIFlvdSBzaG91bGQgYmUgYWJsZSB0byB0ZWxsIFFFTVUgImhlcmUgaXMgdGhlIA0K
PiBFQ0FNIHJlZ2lvbiwgcGxlYXNlIGVtdWxhdGUgYW4gaG9zdGJyaWRnZSIuIFFFTVUgd2lsbCB0
aGVuIHJlZ2lzdGVyIHRoZSANCj4gcmVnaW9uIHRvIFhlbiBhbmQgYWxsIHRoZSBhY2Nlc3NlcyB3
aWxsIGJlIGZvcndhcmRlZC4gPg0KPiBJbiB0aGUgZnV0dXJlIHdlIG1heSBuZWVkIGEgcGF0Y2gg
c2ltaWxhciB0byAjNSBpZiB3ZSB3YW50IHRvIGhhdmUgDQo+IG11bHRpcGxlIERNIHVzaW5nIHRo
ZSBzYW1lIGhvc3RicmlkZ2UuIEJ1dCB0aGlzIGlzIGEgZGlmZmVyZW50IA0KPiBkaXNjdXNzaW9u
IGFuZCB0aGUgcGF0Y2ggd291bGQgbmVlZCBzb21lIHJld29yay4NCg0KDQpvaw0KDQo+IA0KPiBU
aGUgaW9yZXEuYyBjb2RlIHdhcyBhbHdheXMgbWVhbnQgdG8gYmUgZ2VuZXJpYyBhbmQgaXMgYWx3
YXlzIGZvciBldmVyeSANCj4gZW11bGF0ZWQgTU1JTy4gU28geW91IHdhbnQgdG8gbGltaXQgYW55
IGNoYW5nZSBpbiBpdC4gQ2hlY2tpbmcgdGhlIE1NSU8gDQo+IHJlZ2lvbiBiZWxvbmdzIHRvIHRo
ZSBob3N0YnJpZGdlIGFuZCBkb2luZyB0aGUgdHJhbnNsYXRpb24gaXMgSU1ITyBub3QgYSANCj4g
Z29vZCBpZGVhIHRvIGRvIGluIGlvcmVxLmMuIEluc3RlYWQgeW91IHdhbnQgdG8gZG8gdGhlIGNv
bnZlcnNpb24gZnJvbSANCj4gTU1JTyB0byAoc2JkZiwgb2Zmc2V0KSBpbiB2aXJ0aW9fcGNpX21t
aW97cmVhZCwgd3JpdGV9KCkuIFNvIHRoZSBqb2Igb2YgDQo+IGlvcmVxLmMgaXMgdG8gc2ltcGx5
IGZpbmQgdGhlIGNvcnJlY3QgRGV2aWNlIE1vZGVsIGFuZCBmb3J3YXJkIGl0Lg0KDQoNCg0KQXJl
IHlvdSBhYm91dCB2aXJ0aW9fcGNpX2lvcmVxX3NlcnZlcl9nZXRfYWRkcigpIGNhbGxlZCBmcm9t
IA0KYXJjaF9pb3JlcV9zZXJ2ZXJfZ2V0X3R5cGVfYWRkcigpPyBJZiBzbyBhbmQgaWYgSSBhbSBu
b3QgbWlzdGFrZW4gdGhlIA0KeDg2IGFsc28gY2hlY2sgd2hhdCBQQ0kgZGV2aWNlIGlzIHRhcmdl
dGVkIHRoZXJlLg0KDQpCdXQsIEkgYW0gbm90IGFnYWluc3QgdGhlIHN1Z2dlc3Rpb24sIEkgYWdy
ZWUgd2l0aCBpdC4NCg0KDQo+IA0KPiBJIGFsc28gZG9uJ3Qgc2VlIHdoeSB0aGUgZmVhdHVyZSBp
cyBnYXRlZCBieSBoYXNfdmNwaSgpLiBUaGV5IGFyZSB0d28gDQo+IGRpc3RpbmN0IGZlYXR1cmVz
IChhdCBsZWFzdCBpbiB5b3VyIGN1cnJlbnQgbW9kZWwpLg0KDQp5ZXMsIHlvdSBhcmUgY29ycmVj
dC4gSW4gIzUgdmlydGlvLXBjaSBtbWlvIGhhbmRsZXJzIGFyZSBzdGlsbCANCnJlZ2lzdGVyZWQg
aW4gZG9tYWluX3ZwY2lfaW5pdCgpICh3aGljaCBpcyBnYXRlZCBieSBoYXNfdmNwaSgpKSwgZXRj
DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiA=

