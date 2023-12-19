Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F033F81899D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656873.1025389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFavM-00077B-Id; Tue, 19 Dec 2023 14:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656873.1025389; Tue, 19 Dec 2023 14:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFavM-00075T-FU; Tue, 19 Dec 2023 14:18:20 +0000
Received: by outflank-mailman (input) for mailman id 656873;
 Tue, 19 Dec 2023 14:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUif=H6=epam.com=prvs=6717fc9f42=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rFavK-00073F-Vy
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:18:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e94e81-9e79-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:18:17 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJCoWRs003525; Tue, 19 Dec 2023 14:18:11 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3v37dpsgtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Dec 2023 14:18:10 +0000 (GMT)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI1PR0301MB6685.eurprd03.prod.outlook.com
 (2603:10a6:800:17c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 14:18:07 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645%6]) with mapi id 15.20.7091.028; Tue, 19 Dec 2023
 14:18:07 +0000
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
X-Inumbo-ID: 73e94e81-9e79-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQ0VBP6xZk7qQmwl5fVwu5bWnfmqSfaCU8hql55+X/vP/QHKYtHa7jd4wZU/3FRYadmzafgvxiTSIMv0Q0Dmo4RF8ULkljUSaWuRZ5o0odTr9VMJRP8PYcCn3R6YLwts0YUYxmYOL06/4qnziPMBtsluikibwL7TmscZivCaCusAkr0pkmkVdLFgVgDnjYiyFrFWZSU7gkTur+oF1G2TWGYVNvl6+/K+vRGS7fcVo9JH8YrE0yzrErQuLMOGGFMLDrlor3AOZMXlShnzRGnCBHubERitBhHg3Tw0y15DEeFSgU3mIcXG1++FgroXLEN2pSqtoOB5YxI6Uz+ieXbftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTp9nMWw/NCphTutyRqbZiIZBqiytq4Yue6d9PCrxlA=;
 b=HeeNDk5vrCxayd8jqsj78gplyyLh1KF4MZHiqljeKIHnQmhpi9VxCZNnc153DmZ2k8pGbNAIwzKeLFGU2dF4hIxu1FVmDtIDnHTvgLYSbPkRXvbHyBK/l13Sfng235my2Csx1iE5zGiAzHMQELLZuKPNyf/b8S0YvPKnMYR1eRbt+aR9US7DgP2l2MoG7+dNggrTW5i6xu1wgn8tAoTOVbN1Lumqqy96vbtW+HqfNUyExxfBtSxsDtufQzoAC0rjafUY1Tm8gxa3omRLt3tddGKzifasIBIkkp95j3rjaXfNGOCTSwEMZCWkltaa5agEGNfkQaa+FhZMA/QHlqzL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTp9nMWw/NCphTutyRqbZiIZBqiytq4Yue6d9PCrxlA=;
 b=Kg+939uIH2bML7B/F2PlaQk90gyOFkpYVP/EoxpnGon2GISjHu+TcNY80wFTnjd6Zg66aDoX/ju/wWsVEJQj7tLN6OF39iEk1xldhBBISj8Eg0CR9vHzD8ZHem7J5FmlvZIn5qTAtioh4zeaHQbSoiTf2S1AbAC9GEYqOje4Ad3g4B2wb/QT+W0zEpcsEyvivMCfWtok/30FxltFDZaz1t+GBVb8msA+ExnO4wd3vZeEd9gpXqhk4m9xveu80kuoyGCccrmlH0ehMEYyKOuEBgQzzMxA2NdRDi0bvv0NKp2VE3m59YTrENlRaHUt31ghL+63fORbKCCBMhJKHy0V5A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen
 Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Topic: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Index: AQHaMoIbfIb6LpTMIEGFPPk7JAqgfbCwp1oA
Date: Tue, 19 Dec 2023 14:18:07 +0000
Message-ID: <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com>
References: 
 <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
In-Reply-To: 
 <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI1PR0301MB6685:EE_
x-ms-office365-filtering-correlation-id: d314fe71-b4f7-4376-f98f-08dc009d5260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8wORjhmeGQ8OC3YmmQmFGBnQOcFD6KNB5+IiXD4RpQ8FwmxmgDHeCmdD+f72stLier1DVRwCOqd3cdDAMQuFtQ3EaujrLS8Dtpmk77hy7Xq9FHMt9J+UerHUTR6XGlPnCWCPZm+jJMggNmuEcxvuLiGauFHiRM3iyojGrcPj+DcF2cf4g/GeHC4R2ndOBImRdif+s5bywugHhnzVHyxT0apne47bjQPQP+ynH/a1jeQqOTL94d5S6Ssgittt1ooxAom2WcCCXT+MeUt1A5GMtHsgsRMSGYqalTur4zxTSTXMJFp68g7Bif3/2lLOBkL8EcMCGNan9BtyLhiBOsLk8eKhYDqCaKAHZh5cQa06Br6wI0x6qecRRSmzswtO2gUU/s4GSu9XPvOsRqmlsclh2WEs+afBLyrHaInRpT/G6gzNBjZ4xoIPOceqHiGhkmNcWhu7rzOs3S6rOYAaek8tjOv32e7k6iJ9YUhNs6br7FL467n3rDtez/hOeb3MMVcC+G6jo52ne2blOoe1P7ksUjOFWY0QcSSJx5my9IzCo5Id010xiU8pH7ijW/TSfTKpEYWXLZYK9Zhax6Ii3O25/vdZlQ9+FYr0vuCqzOkXy5P77UPy4A4/Z5NhVy+0rhwemVhppXUs62RaX1e8vD2eiw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(91956017)(6916009)(54906003)(86362001)(8676002)(8936002)(4326008)(316002)(31696002)(966005)(41300700001)(6486002)(66446008)(478600001)(76116006)(66946007)(66556008)(64756008)(66476007)(38070700009)(7416002)(2906002)(36756003)(5660300002)(558084003)(122000001)(71200400001)(26005)(6512007)(38100700002)(107886003)(6506007)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0FsV1dNaG5XbG5kODMvSnJqVVFhQ3lodUk5bnpGL24yek9DK0l1WER6QkVP?=
 =?utf-8?B?eUFramhtZzJqdVphbmdvQmxGMlVPM0JLd3Y2ZGZ6MEo1TDRaUzVidnBlZ1ph?=
 =?utf-8?B?UnBrTTA5WVRIbUlOK3RYcFUwZXdIeVdiZEFVYlByZ2JnWkpOWXl6WmkyR0tV?=
 =?utf-8?B?ZGlmRHhlZTFTUis0VW1sNXl0WUFrMFg4T3RWUFFLaDdFaDVFOEhaZy8xZnhu?=
 =?utf-8?B?d3ZqSkg4NE1nQmVIUWtCNElocWJ1SWFNcFVOd1pBSTRvWUZrVzE2TTMyUExu?=
 =?utf-8?B?MDlmM002N2tkWFlDcnY2NmsvdFRKQXpib0RVRkN6WWtubEJBRDVrVFlyUE9i?=
 =?utf-8?B?WnpMY0ZIaVlnaWhDZkVEL04rMWdFeVArUUFzdzZNR2ZPaFVaVUptQXFpVGsr?=
 =?utf-8?B?NktFRnU1L2wwc2FTaGZJZFhCWXNUbkF4WVBTZGVvbTlrejNOS3ZHNmNEK2VJ?=
 =?utf-8?B?Ty9aYVptSXhzNFpaQXg4YzladGdHdTdFUFJWYnNXOEM4aWhHS29EMVdCVDRD?=
 =?utf-8?B?US9jOTNmcWxSVHRwUm5ob2hwM0FsMFZwLzJ5LzZmVGFUSDRRM2FXOE9UUE8x?=
 =?utf-8?B?andReFJIL2QwcHliNnRCZUFHYytSMU5ZQzVEOHdhYlFBQURoeGxmUUQvRjFE?=
 =?utf-8?B?N0hZQWhOMDcyb0E1ZkJyb2FOVVd3UlZicUR2QmhDdU5HeTNGRkVoZG5INk1J?=
 =?utf-8?B?Zm9SRjBJQTZNbktZZTVVMDA3NHlXM1E5UDRKZVkwVDg4cHBXa2VGbSswZFpm?=
 =?utf-8?B?SDZqUzVEczRpdi8yNTVVSUVBaDZtSkYxR3FRY3lBaGFBK3JxV04vTzhjWDJN?=
 =?utf-8?B?aForRmY5K1VMYzFCYXpHRFRZUFBJMTNFUHROdERVRTVDdEI4ZlN2MkxqeTVv?=
 =?utf-8?B?ZElrZThENG9aVDJxVGNkaXZZSkJVcVBaeXlueWtYY1JkeUlnNjI5UXRSeXJn?=
 =?utf-8?B?Y09pNSt4YjJDZzRaYnVOd1QyZVF5WnpERDl2TnF2aDBWMm1sUlQ3eGJUbnNy?=
 =?utf-8?B?VFdUNzVocWFCNHhiNlZHU0ZoWWE1TDY3U2EwZmdhTm5ENFlaT1I1Z2U3RG9Z?=
 =?utf-8?B?UytSekJvUGFQVDFZSWVzc0lmV0FHZjYvTFpraE5KQ2hKSnZod1ZJQVorVGdW?=
 =?utf-8?B?YXhUdmdncnc1MDN2S3BtcndXZmxaQXloRzc4U1ZHMGkrMXVkWG1UUzFISWxK?=
 =?utf-8?B?NjFMZG1Gc1JxT1RzaExlWXZkRTQxcmVLUmFqbzZQaUtKLzJBUGZBM1BVNXZT?=
 =?utf-8?B?UWtUdmtjK1lhcUJpRHY5bkRMOE9PZWtNVUFXcTYxcllNWFF0N0s4SXhaTVFw?=
 =?utf-8?B?N2VCL2RKaFkzVi9mZFhYdTdnb3R2VnhBRGZDY080VnZyc3g0RG9qYkcwdFNT?=
 =?utf-8?B?aHpKbnJlamJwZFZqeWVVK1Z2a0JLa1ordWhPNEFGaFoyVlFRYlZSMlRiVDEv?=
 =?utf-8?B?VEQrTU1NbHRiYzhUOC84bjdkamtaMm4yMkFrZEQrSWFqVEVpd0VIdVk4eDNB?=
 =?utf-8?B?bXZHUVhZZkF2UnJIM1IzQWdZMjcvMG5qRGpUd3VOUlhGaTJ4VXRITWZYUmsx?=
 =?utf-8?B?L0tXMUQ4MWxLazE2YTdhbjdlZklpdTdpYTgzbmFhZ1pDdFN0emE0RVZUVE05?=
 =?utf-8?B?UEkxVmJUMFNlbFFDRmovQU5kZ0xCa1NCVUNxVERMQzZVNmgxUTd2NnlydW1w?=
 =?utf-8?B?QW9ZejVtRjE3MkNuQ3htMlpmb2Q2UWluQzBIbDRhaFVFbEJlRDhwakl3Ym1q?=
 =?utf-8?B?WmRlTlZXeHJEVEE4bEJaRzJZNEFBU2pYbm5pVE8vM0JrV0ZLTWFUcDhSYlUx?=
 =?utf-8?B?dEJ3Y0syckFaU3FkSll3WnZiRGpJbDFaVnJZdi80MTFDVGRTZ05CZGswOE9D?=
 =?utf-8?B?cEpBRGFxMXYvNWlmcXRyNjJJWnFoNTlDNVJSQ3BMMGhkTVJhZEJGdnQ1ZDkr?=
 =?utf-8?B?N2xLVEJUWXUwMkhTRFpXTUVoTkpBajhqbklsUlNUWUhUbE50d3c5MUZvbHc5?=
 =?utf-8?B?YXdIbUJYdnFhRXJBMk1pbTdlMjUxaHYzbEFoc3d5Qkh0amlqVmFkSkdLK1d6?=
 =?utf-8?B?VGhPbjhKUG8vSnJYeEY4SnVZWElIVTd0eWJNYm9VT2JNeTFUcDZBU1JMcDRs?=
 =?utf-8?B?VWY1L2dHelB3YWQ3ZHhYaTU5SGNPQVZxQXJEQlhGVG5mM1NvdjlBY3JkZThk?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26C0D66F738B134A9227DCD00B619566@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d314fe71-b4f7-4376-f98f-08dc009d5260
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 14:18:07.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n48eCpvvprqqZqYp04V7YRjmAEHSvJpP9QcN7hgOGaMLRXqA2MCTBoX4jTbXSKSdh4f48BlRlBpV0+iqroOlbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6685
X-Proofpoint-GUID: qiHPhBZpnfVaZjZ__disvIudHMvcOSgi
X-Proofpoint-ORIG-GUID: qiHPhBZpnfVaZjZ__disvIudHMvcOSgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=416 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190106

Rm9sbG93aW5nIHVwIHdpdGggcmVsZXZhbnQgUUVNVSBwYXRjaCBsaW5rLg0KDQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9wYXRjaC9jN2ExODBhNTg3NGYw
MzZjMjQ2ZmMzOWY5MjFlZWZhZmVjYmM4Yzc2LjE3MDI5OTQ2NDkuZ2l0Lm15a3l0YV9wb3R1cmFp
QGVwYW0uY29tLw0K

