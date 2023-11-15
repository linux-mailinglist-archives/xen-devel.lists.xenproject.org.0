Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1077EBA8E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 01:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633408.988190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r33fy-0003JY-Vn; Wed, 15 Nov 2023 00:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633408.988190; Wed, 15 Nov 2023 00:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r33fy-0003HZ-SV; Wed, 15 Nov 2023 00:22:38 +0000
Received: by outflank-mailman (input) for mailman id 633408;
 Wed, 15 Nov 2023 00:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LT9n=G4=epam.com=prvs=5683a4b404=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r33fw-0003HT-Pp
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 00:22:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c5ef42-834d-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 01:22:32 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3AENbngc001821;
 Wed, 15 Nov 2023 00:22:18 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ucdbf0s4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 00:22:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBBPR03MB6746.eurprd03.prod.outlook.com (2603:10a6:10:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 00:22:13 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 00:22:13 +0000
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
X-Inumbo-ID: 10c5ef42-834d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL/X2REKNUg57ffbDY/8SV9Gd62xCoDfUL7FmpQP36J5L4s3NmAW6ZY75wpeoOtfILhZsm+4qfYBOFeLnlrrBIixANh3z21rUMI4jzWZlUuWYfl1EldwuzhoHWpbiW8waebPCOUXkOLl32ObNfdcgG1Z/5PqoyfsFN42slLsjVB3kl9YX+IBSCGdrFfx7BApRtepj6FLd66NXuu/+Lp8iBtnlNYeUA+n0ke4kmFDD3gcm4lM5HTAEHvDikSH9o+X+3cgx6LrBmF2P1Z1wSLlhxILkZFgUu3O9eBoUF3aY5fC8beXaejFBpDgDSKWuS/aMnrNKfE/M++pSQzzMKXuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYQEYpft3N11diaNQeWQVhlQZjov32WoRwJ28KcWO4w=;
 b=bJM57rBDwSaY61ZLSVrT/GUqQHO6OjU66YIruCsVG9n/zc84arEJS0uWnNafZW0HPSjOY5poOQVXUFiGFwEDFfyWfS9beqV2qhsSAW21ZPsRrzuK3Mt3YJ/uypZtAHz3AZa9/JB+OZuX7049uB/vVT0b1qHDLMPDEUFqQc6u7VAp/1hrmaOqICJQdyKrpOW1QC2RgEDLSjbHDHELh1FBLPXEZaYCNU6RhdMgECtyU46ufpzugyf/XBU4EvQPeYKy+Wnh9mzxcGDQ3bropRSd7GzNS0UX2/h5ebFz/OfoR7c0BSlzKOJrpcqQrBz3bt9wnzRWIhnqQVrxNsoGhjGa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYQEYpft3N11diaNQeWQVhlQZjov32WoRwJ28KcWO4w=;
 b=CFVzkFrKE6ppsKuCxjPZkePY2TEtru2rak5KCTqy8ZZcPFEJ3bA0kcz6Bp3Vnl1kvtMqzZq1WI85E2FvAKY6l8vLrkPgxRlSn+uFd1myeSeo4vehzanTsu8UMeENNu7vg7w4PsvtuvJIdkTxRfkTv6ySHuST+LmAzAKJTm3D8zmFu0TBkY7FkkwuHTP2+tZVPvqJcMwWddFcTW+0pmKemJ5LeSYFuhpEY0vaj8vw+sfmlBga6yvdsDDnJqi4IX7FQvn1g8GLaSf/pHO8StUSsPTEUiJP/Q4tgDnqvbQWlmyVEMNVFEDZAfpFN62MUC/5qWoUimr5qj0uM5dST/pDkw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/7] xen_pvdev: Do not assume Dom0 when creating a
 directrory
Thread-Topic: [PATCH v1 4/7] xen_pvdev: Do not assume Dom0 when creating a
 directrory
Thread-Index: AQHaFBZoMLHgqbm5ZUeTIEOOIKOHALB3McuAgANTGAA=
Date: Wed, 15 Nov 2023 00:22:12 +0000
Message-ID: <87fs176f2k.fsf@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-5-volodymyr_babchuk@epam.com>
 <851f9138ccc9c4a9ec1c8f7f6c2cc57c652f2b96.camel@infradead.org>
In-Reply-To: <851f9138ccc9c4a9ec1c8f7f6c2cc57c652f2b96.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBBPR03MB6746:EE_
x-ms-office365-filtering-correlation-id: b70f2355-d0b1-46c5-fb13-08dbe570ea13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7AwLotBfzKGmClrDCQETCgUFrPwtsVbyPFVvSJ2rG6hnpFwj6CVFqnDIzbdCiyb/sGXNXRebMuZYKxeAOaVbELVbnhQEVpPDIYP49VtU5teegJ1JD6h5Qgc9rFOB3rI/L4dTaF58tEA+OM0RehIhqT+gOQA9kKyI8bykVB/LIhQReuKKaDp/9t84ETlIf3AkxfZlIErrDF3RBz2FOcGw3sWc54ThFWnSNDgAnCXYXejzht1daGd9J1sdPwbyekcJ0U4Z9lAp1yk8tIlOC0x4GCJ5b6iU7pTK0hKqrBfRWq6AcshwzGZxIw85wgArzDlXnOOjA019sJvvukTMkLeBRsmf9+GYo2gJwto/EErQaaYh3pwK9T542PFhkEXWqM6dmTbVg/sYTWaX6oUf1/8AXcgv+gsY6yQkyv5EPAWGM8MrCFiVwKV1hVbnfpp+zvlV1VBv7bU9a09MGoj747J27GDoLO1I4NgwAbJT0vAku2rJcSTQM97SQItZ7A0HUXz17cRltgmlDpm/+RzFAG8RiI51YXqWbFrzWd65GT3VeB7dZx2VmsTTZyygz5grF1uJpsGeJYv7xkwrhMfE5SvjxzgPjGXdAyfQ7IrGlVAi3UOvnGBsDc4yktLJZbTmFnNg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8936002)(8676002)(71200400001)(38070700009)(26005)(2906002)(4001150100001)(5660300002)(2616005)(86362001)(6506007)(55236004)(6486002)(122000001)(36756003)(478600001)(41300700001)(38100700002)(83380400001)(316002)(6916009)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(91956017)(54906003)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGQ0S1B2OWFhUlU3YlRPd1dNeHBjR01HSEJ6elVFMWh5am40SHUrSWR6MnBW?=
 =?utf-8?B?Y1BMN2dMZG1nVnNrc25TdnV6OHV0OThidFdWMU5DNnFaT25TaXBHVGJiVVdp?=
 =?utf-8?B?QUpiSFpGVUw4STYwS1NRQk03ZmtyRjExWVZvZnJLSm96anFHcHFyS3IvZWRG?=
 =?utf-8?B?SmxBd0pKUEZNSDhFOCt6UjdXR1ZGQUZ3L2UzS3BWMlQ5K0tSZG9ManJZSjBy?=
 =?utf-8?B?bjc1SlBsZEtWOGY1Y0RvK1R6TmpZUXFDaFNIMmp5TFlCMGlXdlI3N2YzU2Zp?=
 =?utf-8?B?OG5rOG9hR2NBZ29iTURvY3Z4NlNVd29DMmhuQjhOWnY5TXA0VTNoWHlabUhO?=
 =?utf-8?B?dmhYYllabzhJRzNHbHBqVE5rbDNTcnlybUIreGlMekZSZzFidFB2cnJDbEpC?=
 =?utf-8?B?cFhXbnBJMllUV1oyVDdGZXM4TWdBb3dDNVJRYlJ5dVZJckVhcUY2b0dSRVd3?=
 =?utf-8?B?TlFrZnFRWTdkVlNJMVZJOENTeUlQdU81ZGhiM0JKV2tBbTVoK2FBOXJWYStL?=
 =?utf-8?B?WUppS3NQQWR5UEhQR3BwVmhDVDI0SWRYMmsvZ29jYTdLdUdpN0VPM09RcGx6?=
 =?utf-8?B?WXBnR2xjNFRIOFE4NHNHMTRrdU00ajlkNjkraXkwbE1tenFCUDh0NWxqbFRT?=
 =?utf-8?B?UEFuRmxSbmYxMk8rbWM2KzMvakZSL2xaZ0ZFK0dVclMvVm9LMkZUT2sxbm9m?=
 =?utf-8?B?dTN1TE9RTmFjNkJlbmxlKzNPd2xzN3hXTGZ4MFcydGdEaWdOZ3BRdmRla3JC?=
 =?utf-8?B?bGJId05xcld5TWpHQ3ZHZmdaT1hXZSs5cmpJRUo3SjNRVEdBdThIOEJQMHBl?=
 =?utf-8?B?cUpMVHNXK3FaWUFhTWVDSXMzdmY2ZnY5OTRQSTgzYWM2dVd1OGFRZnNDZzVx?=
 =?utf-8?B?czJwZ2pYUm5mcC8xdHB2NDd4eW8vWVJiU0NTSlpBaUxqSSs3Y0huVTZ2NWxZ?=
 =?utf-8?B?Sk1KbnlQejVpaUhDRy9JOEdMNG1UOG5xRjZvd2Z0UWdOZTI3ZVJ4enpMWTdB?=
 =?utf-8?B?NmtoQXFpMThuV2J0RnE5YjhxekQ1N0ZyT0NLMURYVkJVUitBUEZkS3BlUFlh?=
 =?utf-8?B?OUZNYjhFYS82dWFjaVpmNmpac0ZMNWlSYUtBN0VSUG1PamJTUW04QTVTb2xu?=
 =?utf-8?B?b3huVTRmOGIyTzNDM21IcHBzRHNnYUd6anZ5SkdvQjZSUFQ0WlZHWWVSMEsr?=
 =?utf-8?B?d3VCY0dxTlhQeWdlZUxWU2FEQ1p2UlJueUJZazgzODJFajF4eGRhZXdVUjdV?=
 =?utf-8?B?M2U0ZGlVd2x0bWdZVi95TGNQeVdpVXVsSmR6cnltK1VvOXBLaUpuYVZGVUo2?=
 =?utf-8?B?MDdsSUxHMlU3M2U5VEMxWW9aWEV4cytBRUtsblNucjdMbWhqOWJDQVVMWStv?=
 =?utf-8?B?OHdDWDhxMnhLL3YxZkFzcHpXMzhUMktnaEIzOFdTeUc3RFEzN3ZFK3kyODU0?=
 =?utf-8?B?MUpPNGpQdzZVMjdleGVVeDZqL2JJUlBuWGExSlFTRStMMi9OUHpJUFJPblhO?=
 =?utf-8?B?Nk1kNUtua3d3dlZwRUlXUFlwa3QrcDRzc0diR2V2QzkxL0lKTmdHemowbThJ?=
 =?utf-8?B?dG5hN0Q3YWNYM3NUQzBFaS95NGJCZzNaRklvbmdyVHNKcEVTVG52ZmpKTjJC?=
 =?utf-8?B?U2tTS2pQekppSnNKQlBiMk9xRTRad0VPeit2OGJrZEtRcUR3cGNOQUg5OS83?=
 =?utf-8?B?Z2hZUU5oc3lVeVUyc3F6OER5QU0yWmJ0OHpocGZMK3didjJtV21NOVlESDZH?=
 =?utf-8?B?NmtzZEZUOXJQSlQwdDdnR0MzMUEyV0t0eXJPdnd2N1hMbk5QT3VnNXFQQmsr?=
 =?utf-8?B?enFXbFl5clR0Wk51Z01NekFVOFJuODRSd1lSWkRjMGYxSWVpK25CaHhUaG1i?=
 =?utf-8?B?bENwQjdFZ2pCRUp2RFpTMXJEcTVMeTJYZ1RybDZsY2Vnd1B5ZjRWS2h4VFJJ?=
 =?utf-8?B?eEdMdWxWUVE5blFmcEtQTGNPaXhtZU43U0pjUjY3U2Q4Ujl4Y2tBOXRacjR5?=
 =?utf-8?B?eEoyckVlbzNQai9UdzJOZ0lRY1k4Z3llRlZ5WFZFdnVoU0d1V21NYU9YbnY1?=
 =?utf-8?B?WjVQaCtOM0Q1Z2dtNXZqT2tPMWFJWjZtdXhnVWl1bjlZVG5iNTNaRGhVVUFa?=
 =?utf-8?B?Nk91dm5uMmdDSWhaZmdGY3F3Y2hneGxOV3dqZ3V4cnkzNm9CVnkvQlFmcFVU?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D594071A22DC764483AE0000E7F26A4B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70f2355-d0b1-46c5-fb13-08dbe570ea13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 00:22:12.8714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrMMA6f/dTW2AWXvHsPOcDq5lFvul4GG+X3xrZ/WU0wRSuniWMDJjmsAFV1/ZPMLUHVI90YwEG3ggFte0GHI1V50NtxBZdiEF8lzxMZZC5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6746
X-Proofpoint-ORIG-GUID: 92IgnHQ3-3qBkP0MefFyTWzQhB8q6KN5
X-Proofpoint-GUID: 92IgnHQ3-3qBkP0MefFyTWzQhB8q6KN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_23,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxlogscore=986 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150001

DQpIaSBEYXZpZCwNCg0KRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPiB3cml0
ZXM6DQoNCj4gW1tTL01JTUUgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4gT24gRnJpLCAyMDIz
LTExLTEwIGF0IDIwOjQyICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEZyb206
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+
IA0KPj4gSW5zdGVhZCBvZiBmb3JjaW5nIHRoZSBvd25lciB0byBkb21pZCAwLCB1c2UgWFNfUFJF
U0VSVkVfT1dORVIgdG8gc2F2ZQ0KPj4gdGhlIHByZXZpb3VzIG93bmVyIG9mIHRoZSBkaXJlY3Rv
cnkuDQo+PiANCj4NCj4gWW91J3JlIG1pc3NpbmcgdGhlIHdvcmRzICIuLi4gaWYgaXQgYWxyZWFk
eSBleGlzdHMiIGZyb20gdGhhdCBzZW50ZW5jZS4NCj4NCj4gSWYgdGhlIGRpcmVjdG9yeSAqZGlk
bid0KiBhbHJlYWR5IGV4aXN0LCBpdCBnZXRzIGNyZWF0ZWQgd2l0aCBkb20wIGFzDQo+IHRoZSBv
d25lciBzdGlsbCwgcmlnaHQ/IEFzc3VtaW5nIFhlblN0b3JlIGFsbG93cyBRRU1VIHRvIGRvIHRo
YXQuDQoNCklmIGl0IGRpZG4ndCBhbHJlYWR5IGV4aXN0LCBpdCBpcyBjcmVhdGVkIGFuZCBpdCBp
bmhlcml0cyBhY2Nlc3MgcmlnaHRzDQpmcm9tIHRoZSBwYXJlbnQgbm9kZS4NCg0KPiBTdHJpY3Rs
eSwgdGhlIG5vZGUgZ2V0cyBjcmVhdGVkIChpZiBwZXJtaXR0ZWQpIGFuZCAqdGhlbioNCj4geHNf
c2V0X3Blcm1pc3Npb25zKCkgYXR0ZW1wdHMgdG8gc2V0IGRvbTAgYXMgdGhlIG93bmVyIChpZiBw
ZXJtaXR0ZWQpLg0KDQpZZXMuIEknbGwgcmVwaHJhc2UgdGhpcyBhcyAiSW5zdGVhZCBvZiBmb3Jj
aW5nIHRoZSBvd25lciB0byBkb21pZCAwLCB1c2UNCiBYU19QUkVTRVJWRV9PV05FUiB0byBzYXZl
IHRoZSBpbmhlcml0ZWQgb3duZXIgb2YgdGhlIGRpcmVjdG9yeS4iDQoNCndpbGwgaXQgYmUgb2th
eT8NCg0KPg0KPj4gTm90ZSB0aGF0IGZvciBvdGhlciB0aGFuIERvbTAgZG9tYWluIChub24gdG9v
bHN0YWNrIGRvbWFpbikgdGhlDQo+PiAiZHJpdmVyX2RvbWFpbiIgcHJvcGVydHkgc2hvdWxkIGJl
IHNldCBpbiBkb21haW4gY29uZmlnIGZpbGUgZm9yIHRoZQ0KPj4gdG9vbHN0YWNrIHRvIGNyZWF0
ZSByZXF1aXJlZCBkaXJlY3RvcmllcyBpbiBhZHZhbmNlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+DQo+PiAtLS0NCj4+IMKgaHcveGVuL3hlbl9wdmRldi5jIHwgMyArKy0NCj4+IMKgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvaHcveGVuL3hlbl9wdmRldi5jIGIvaHcveGVuL3hlbl9wdmRldi5jDQo+PiBpbmRl
eCBjNWFkNzFlOGRjLi40MmJkZDRmNmM4IDEwMDY0NA0KPj4gLS0tIGEvaHcveGVuL3hlbl9wdmRl
di5jDQo+PiArKysgYi9ody94ZW4veGVuX3B2ZGV2LmMNCj4+IEBAIC02MCw3ICs2MCw4IEBAIHZv
aWQgeGVuX2NvbmZpZ19jbGVhbnVwKHZvaWQpDQo+PiDCoA0KPj4gwqBpbnQgeGVuc3RvcmVfbWtk
aXIoY2hhciAqcGF0aCwgaW50IHApDQo+PiDCoHsNCj4+IC3CoMKgwqAgaWYgKCFxZW11X3hlbl94
c19jcmVhdGUoeGVuc3RvcmUsIDAsIDAsIHhlbl9kb21pZCwgcCwgcGF0aCkpIHsNCj4+ICvCoMKg
wqAgaWYgKCFxZW11X3hlbl94c19jcmVhdGUoeGVuc3RvcmUsIDAsIFhTX1BSRVNFUlZFX09XTkVS
LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB4ZW5fZG9taWQsIHAsIHBhdGgpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHhlbl9wdl9w
cmludGYoTlVMTCwgMCwgInhzX21rZGlyICVzOiBmYWlsZWRcbiIsIHBhdGgpOw0KPj4gwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLTE7DQo+PiDCoMKgwqDCoCB9DQo+DQo+IFdoeSBib3RoZXIgd2l0
aCB4ZW5zdG9yZV9ta2RpcigpPyBBRkFJQ1QgaXQncyAqb25seSogdXNlZCBmcm9tIHRoZQ0KPiBs
ZWdhY3kgWGVuTGVnYWN5RGV2aWNlIHN0dWZmLCBhbmQgY2FuJ3Qgd2UganVzdCBmaW5pc2ggdGhl
IGpvYiBvZg0KPiBtb3ZpbmcgZnJvbSB0aGF0IHRvIHRoZSBYZW5EZXZpY2UgbW9kZWw/IEkndmUg
ZG9uZSBjb25zb2xlIGFuZCBuZXQNCj4gcmVjZW50bHk7IHdhbnQgdG8ga2VlcCBnb2luZz8NCg0K
V2VsbCwgSSBhbSBub3Qgc28gZmFtaWxpYXIgd2l0aCBRRU1VIHRvIGFjY29tcGxpc2ggdGhpcyBp
biBhIHNob3J0DQp0aW1lLiBJZiB5b3UgcmVhbGx5IG5lZWQgaGVscCwgSSBjYW4gdGFrZSBhbG9v
ayBhdCA5cCBkcml2ZXIsIGl0IGxvb2tzDQpzaW1wbGVzdCBvZiB0aGVtIGFsbC4uLg0KDQo+DQo+
IEFuZCBldmVuIHRoZW4uLi4gdGhlIHhlbnN0b3JlX21rZGlyKCkgZnVuY3Rpb24gaXMgY2FsbGVk
IHR3aWNlIGZyb20NCj4geGVuX2NvbmZpZ19kZXZfZGlycygpIGluIGh3L3hlbi94ZW5fZGV2Y29u
ZmlnLmMgdG8gY3JlYXRlIHRoZSBmcm9udGVuZA0KPiBhbmQgYmFja2VuZCBkaXJlY3RvcmllcyDi
gJQgd2hpY2ggaXMgd2hhdCB0aGUgcmVzdCBvZiB5b3VyIHBhdGNoIHNlcmllcw0KPiBpcyB0cnlp
bmcgdG8gZWxpbWluYXRlIGJlY2F1c2UgYSBkcml2ZXIgZG9tYWluIGRvZXNuJ3QgaGF2ZSBwZXJt
aXNzaW9ucw0KPiB0byBkbyB0aGF0IGFueXdheS4NCj4NCj4gSXQncyBhbHNvIGNhbGxlZCBmcm9t
IHhlbl9iZV9yZWdpc3RlcigpIGluIGh3L3hlbi94ZW5fZGV2Y29uZmlnLmMgdG8NCj4gY3JlYXRl
IGRldmljZS1tb2RlbC8ke0dVRVNUX0RPTUlEfS9iYWNrZW5kcy8ke0RFVklDRV9UWVBFfSAodXNp
bmcgYQ0KPiByZWxhdGl2ZSBwYXRoLCBzbyBpbiB0aGUgZHJpdmVyIGRvbWFpbidzIFhlblN0b3Jl
KS4gVGhhdCBvbmUgcHJlc3VtYWJseQ0KPiAqd29uJ3QqIGV4aXN0IGFscmVhZHksIGFuZCBzbyBY
U19QUkVTRVJWRV9PV05FUiB3b24ndCBldmVuIGhhdmUgYW55DQo+IGVmZmVjdD8NCg0KQXMgSSBz
YWlkLCBpdCB3aWxsIGluaGVyaXQgZHJpdmVyJ3MgZG9tYWluIGFjY2VzcyByaWdodHMuIFNvIHll
YWgsDQpPbGVrc2FuZHIncyBwYXRjaCBjb3ZlcnMgdGhpcyBjYXNlLCBtb3N0bHkuDQoNCkkgYWdy
ZWUsIGl0IHdvdWxkIGJlIGJldHRlciB0byBkcm9wIHhlbnN0b3JlX21rZGlyKCkgYXQgYWxsLCBi
dXQgdGhpcyBpcw0KdGFuZ2VudCB0byBteSB0YXNrIG9mIGFkZGluZyB2aXJ0aW8tcGNpIHN1cHBv
cnQgZm9yIEFSTSBndWVzdHMuIFRob3NlDQpPbGVrc2FuZHIncyBwYXRjaGVzIGZvciBkcml2ZSBk
b21haW4sIHRoYXQgeW91IGFyZSBzZWVpbmcsIGNvbWUgdG8gbGlmZQ0Kb25seSBiZWNhdXNlIG91
ciBzeXN0ZW0gaGFwcGVucyB0byB1c2UgYSBzZXBhcmF0ZSBkcml2ZXIgZG9tYWluLg0KDQotLSAN
CldCUiwgVm9sb2R5bXly

