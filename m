Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582094AF33B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269176.463186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnK8-00029v-2H; Wed, 09 Feb 2022 13:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269176.463186; Wed, 09 Feb 2022 13:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnK7-00026C-UY; Wed, 09 Feb 2022 13:47:55 +0000
Received: by outflank-mailman (input) for mailman id 269176;
 Wed, 09 Feb 2022 13:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRsY=SY=epam.com=prvs=4039ed7fca=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHnK6-000266-EK
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:47:54 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa0e4c9-89ae-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:47:52 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219D5oFc023106;
 Wed, 9 Feb 2022 13:47:50 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e4e6s06a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 13:47:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4180.eurprd03.prod.outlook.com (2603:10a6:208:cc::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 13:47:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 13:47:44 +0000
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
X-Inumbo-ID: dfa0e4c9-89ae-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqSKa9QTQm9xOEL7YyOhXX8pDPAF3PL7msdaUlxev9XzY/AoMi9DojhqdhdACx66FkgOcSTajos6+cvYYPVahu6bviMHi0XaLv83eCvCQ5r2Sp9BUTXAU/o1zbBgqRUOAc2Ix4HSa0ZySTQtgdBrflLYEKf75T17uQxPJJUiD/a1QI3qdTsuzfX3mRY2HwSPEEcOtEUlGbzxiuZjz7fB2tgddhSBvjczUdHc+HucnO2XQKhQhlLz/gv/LFcjmOKl5zzc3PbuM75bsOxxkrqoz2+VqDZ7ie9ZpNYAokcDznYKfoj4q5yczBWkGKurOyKsV243EHV2ZgFayiZZlNBBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjtRBZchUgkI311NrWgALTqmBaiGDVLnajzaK/LJct4=;
 b=GoSD/OkR5mpB/wAGGx9FRhp1rS1lezk2Nu1F/6WG5HHVZ43mP2+j9sXI/ty+JoCLTy40rrn1NqACNmS6AWqtZDbcPNwXIn9sDSkz+W/lkFf7o1nwjXXKBOwplDupBGywmMG+aIsJa4GUuzQQnq1tcb2QjmDtkWHW/OFwXbRH1A6CFi56zgh4lvaru5lGGZK2RhtaALVbgZ+YW1fcMVo9Mzxjx3ZRPwbqmeAEP5xU2zryDWtMRCYjAL8DtBdmFkfA8N6Fikj/v486ZqAEdwTc3q3w0rnta1tVIf70sRT5X8ZAny4bb3e3hPWzGaKAiXz3GFZBGMjASNAynueN19hs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjtRBZchUgkI311NrWgALTqmBaiGDVLnajzaK/LJct4=;
 b=qLJfb1s5hRSzyIfVZv5rFF4rD7O2qBaBft91EKJINd09/WdToR2udORP+z/nzObphs3FPrpYr/le8OIOlJzq0cIlQOFjgYYyxcgqLQr+wVTIR/css+zS1Eb74Jmsn51C0+K5YSWAIdFRRGT5suiK0u3TmTtefJvilSIy1p0xA3W2HDeLv3npDmOU1DVMzMxb8kwWLtYV21xXuffA2RyDv5LWJjvCldREU0gKA4OdB3Z4J+HX2+z1xhsrifm9m/6JnoxNxqyBX2seHjhXIk2v5L5rWCDsxKgrj6vFJ89NmsJuSQAKgZqPL1TFhNZAisJKimqam+itCfjwVxC/hMJ/Zg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Topic: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Index: AQHYHbudSLxWMD9F30i+VGpqKP0vfg==
Date: Wed, 9 Feb 2022 13:47:44 +0000
Message-ID: <0b3068fd-d06f-1135-7b84-5400cca0d3de@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: 
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b508dd58-bf6a-41e9-b3f7-08d9ebd2c034
x-ms-traffictypediagnostic: AM0PR03MB4180:EE_
x-microsoft-antispam-prvs: 
 <AM0PR03MB418070FEC105FBE9CB00E490E72E9@AM0PR03MB4180.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lNMY+RFkW/HnqFM4pwSoxMZojao6bVyjSdyEu4PbIcYI++3EYGaRq4+IlFg+dwPGIrTR+0x4o2iVat7SNR+6lPlsYvz0VujrX9qjOj4nBVJl8wyFfJzBNOZdzUYi5Rf8x5S0cL9/fgjDbPrrFurwXv7Gubt0xa7swE2uVrbjbsRf6qJL/NM9C4b2GLOfr1Zrc15VEaEZBCurBHuYI5PAQbK9N/Eo0Cdg9IeCRK73bNFzkncL2C5bWkwPrGezBa/n3xDaVNsaGBMTEENk/aHxewSAftLnfYMutQx6kPQYXX6QO7t3o5lsHW6Ppk7/TtBmE7vG7JsRmsKDctGzb98v3tNEabA/7pMgjKumH4ZK3mCmwLqyG/ioNJTS8jeyTW3pgTjQePFfjzMG+KMWBjtdhIARqaACsUUGpJbujSbbm6ovAoRAxtjhArSXMynXTl/prJjzeDqBFDxB/3rtRv949xMpWEj9DRmlmULsVCSZa+dn+cfmjIzNygd7VoRy76tzdeyTgxNVSQ9xueV1gbFDyTNn6URvSR4aFQ0OfPMehTq0RLnvTpHDMFa85bwDVygc4shcvpJH6DsSUzOg5gK3NdmUPumTaMF+qNpB8QfsQKwoejxmv4/GXsebp32N1sEC0qO/fITEATNRDgAQJUixvjTqH1voZ2E1pdoSLUGGQMGOU9FnY67usV5L/1kc77iPjv2U9zYpuMyI+LKIn5jeyy9w0JkFAFeciqykEM2tzpKeyJLEiapI8fEwJMPvieMb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(186003)(26005)(4326008)(86362001)(122000001)(31696002)(8676002)(76116006)(83380400001)(2906002)(4744005)(38100700002)(55236004)(71200400001)(6512007)(316002)(6506007)(53546011)(38070700005)(8936002)(36756003)(2616005)(110136005)(54906003)(6486002)(31686004)(508600001)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WFJwc1RiQlFiQy9wNjlqeE9sdHdObTRqT2RPUkZSbFluV0hMVER3c3JIMmFV?=
 =?utf-8?B?dkhzZFAwYVJMVUw5Nk1BZ3dKeFNEcDZ6eEFLbzRoQXBmZE5jaG5JZVI5TDdn?=
 =?utf-8?B?NXRTSkU5ZXN0Z3RLdTdWQTZtUVN1dmVTTEVIQkRkdWM0TTJHWlF6dFVuOHBz?=
 =?utf-8?B?WHNuMEJsdW1vYkNjTFNhcEtVRGh2TG01VGNNdWNUMHN2K0FNT2gxL0ZTeGtk?=
 =?utf-8?B?RTdGaVFsNzluNE1WajM5ZU4yemhZbTFmV1hrRjdKTUVBQ0NmUUh4Ty9qL25F?=
 =?utf-8?B?R2RnNytNUlNOd25uTzJXeXNPRjlBV3UyN1V6RGwxdDc3b0JMaFh5QjhoT2xz?=
 =?utf-8?B?Vm5neFVPSGxRNkp0OG5lZmo3SnFGSHFod3hYaWpOdG1ibkpHcWpQalVlYWIy?=
 =?utf-8?B?VG5oTWhKVkNvVzRaQm1XdDBFcysyMjBhbURhTGw2Y1VOcE1RS1AwdlNNYm1P?=
 =?utf-8?B?WDA0OU5CRCswMWRPeDZBYjZxeXV3RXQycjltUURxRE9MTDVtSkZMR3pFa0kv?=
 =?utf-8?B?MG5hY0F2VWtwbmR2K0wyQUFMc2ljblh5bzRlbnQ4dHlxQ3dvTW94WGVldGxX?=
 =?utf-8?B?NmZzdzZmM2NwNlZ5SzgwQjJKVTk5UzZEV0NNdmQ3c1BYVmhKZitLYndBYWJF?=
 =?utf-8?B?bU5PbWFWZS8rUCs4dHltcTRLbHV3dFE1elVsQ1g3Z0JTODNtSU9qSWg1Y29l?=
 =?utf-8?B?OWQxYTI0bTJUTUg5a3R1WGM1ZkduenlnTDlKWU5sUEF1MnlRV0R2emoyZnB5?=
 =?utf-8?B?UndGTE00RWVMeDQvNHMzYzQwdnpZTWowRGVXTTNueHM0Ykwzem8rM3RoQS9r?=
 =?utf-8?B?MW1kd2R1cHd1WGMxWG1lU3Eva01WeUlCdDZ1M1ZiVzhkdXkxNlhPU0NiVW9n?=
 =?utf-8?B?Y0p1WWF1MmtjZVMxdnFZZ1JzWnRjaVJvUUhHcTkxdXVyc2FWalFLSUhQck9r?=
 =?utf-8?B?Y0NyZjJzZXJMemljUTdWcDhRdjhYTmtZcnZNTE04a1dyaVhhd3RqNWl0K1hp?=
 =?utf-8?B?U2YxN3pCeE95cG9IZDl1UGhKQ1BlRDdsZldaWWxjR3laWld4MzBua0RxdDJS?=
 =?utf-8?B?RjlmRXBZbE1HWTJjaVpFNFZQU1VySGpWMFBIRGJUQnBPd2hydytqbmhZMU9k?=
 =?utf-8?B?eEJ6ZS9leUp1Vzl4Vk12eXQ1ZFc3QmhCbTAxa2Vyemh3L2tUc1dRYy9NbWVs?=
 =?utf-8?B?dnpMdVBKTnlmNm83ZFRualB0K0pqZWc4Njg1ZlBmTGZWN3d6OHVXL0tCZkV1?=
 =?utf-8?B?U2M0ckRvYm1XRVVHREg3ZzBjUkRxM3R3L0poUmxtQTZQZFVpRkpFVnFYSWRU?=
 =?utf-8?B?ZmkyVFFOUFMxbHEzMEdudzlSTXB6MUt5YjFXaDJDUnJvMzZkdm5kanIzakhN?=
 =?utf-8?B?R3dXWm0xRW5HbHZpWS9pOEQwTVpCaTFUdG5qT0I5eXRVWlVEWWN4TFdwQlhM?=
 =?utf-8?B?S25OWE9ZL2ZDWnAydm1rVlUzNCtQblIwK09oRmRMY1NNSnJhdEgyY29DZHk5?=
 =?utf-8?B?M3YvZldpN0RKenJhWG1FMSt6MTF1YXdSR2lmWGg2UTRxb3dZSk04eCtkb0JP?=
 =?utf-8?B?N3Jnb1Z0TFF4K3lQRzgzR2QrZk1tdzRrdFpmODgwcDhiREZNaTBLeElXRTMz?=
 =?utf-8?B?K3VIVlV1em9OeUJsdXB5RlFnbjU1WHRUYXEzelJXTWltRzhvWlNHblJucG81?=
 =?utf-8?B?ZjRhSnBFRFpMZ29FamRJbytuOVI3V3lpTUVWYys2YXZGREY1T3g4T2s4aTVm?=
 =?utf-8?B?bjB5bnJHdjV2blhaK1lrd2tkNGF0ZTB4QWhYcERoaEtXK3hsV0w3Znlmck03?=
 =?utf-8?B?OUcrS0J4ZHVkWG8rRUk2cVhOd0duMGU2YXdUdmxkVTM4R2dzNnV0YUhOUjA3?=
 =?utf-8?B?Z3hpWEVPNUZ4NTBOazJEWHJsY1J2UXQ4Q0pjRDk3UCs2U1g3TVhlZEZNL2VX?=
 =?utf-8?B?Uk40dUhXSXN1SUxlN05tZDZoOE5lQ2pTWUtnYVgvOUYvSVNodW9DSmREVEFa?=
 =?utf-8?B?UndyQ2RkSDhGOStEVU00bGxDTnlsd1FRWGRIUU9SUWUzb3VyanNUdmlRUXUw?=
 =?utf-8?B?Q09DaXYyQ09hVlovaTBRUTNNVkorQkJ6cG9vc0ZNeUVjVGpSQzlGWkV0SHJk?=
 =?utf-8?B?WWpOcjJlRGZxSWVkU3V2a3VBNDRRRGljbG9LaWE5aUJaTVBJSzJXNTYzTGth?=
 =?utf-8?B?Rms0TGpQNjVWa083L3V5MDdRUGZqSkZlVkhLNTlpT1J6VUREZW5OdDNkelJv?=
 =?utf-8?B?RTYwdzZhSy9EREFNYnNRWkZsa1pUdXFZVFk5bmVQZ2dlYStMZTQ4eklySWti?=
 =?utf-8?B?Mlo1T0ZtdEorTmVGaUZMNEVYZ0FuWnEydFVPRlZNMUtrbENkc2xXdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EB3528D62BB2C479C05F926E8321D52@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b508dd58-bf6a-41e9-b3f7-08d9ebd2c034
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 13:47:44.8725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bj4j8+YF7F+2kpbgSquKPve4Euwd8IUtiR4MJe7yuSG6Fxu/6eGZXASkjRwT00Rw8ZztdpEitaoZACtIBgVasXCccLryubCHDjT7z0qWQvs+5+7BT1iYMyj1/tU57z6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4180
X-Proofpoint-GUID: zv1CSuP3Z5eOtezvio1fy1DOCTeieTED
X-Proofpoint-ORIG-GUID: zv1CSuP3Z5eOtezvio1fy1DOCTeieTED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_07,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1011 mlxlogscore=974 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090079

SGksIE9sZWtzaWkhDQoNCk9uIDA4LjAyLjIyIDIwOjAwLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90
ZToNCj4gbGlieGVuaHlwZnMgd2lsbCByZXR1cm4gYmxvYiBwcm9wZXJ0aWVzIGFzIGlzLiBUaGlz
IG91dHB1dCBjYW4gYmUgdXNlZA0KPiB0byByZXRyaWV2ZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBo
eXBmcy4gQ2FsbGVyIGlzIHJlc3BvbnNpYmxlIGZvcg0KPiBwYXJzaW5nIHByb3BlcnR5IHZhbHVl
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9tb2lzaWVp
ZXZAZXBhbS5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL2xpYnMvaHlwZnMvY29yZS5jIHwgMiAtLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlicy9oeXBmcy9jb3JlLmMgYi90b29scy9saWJzL2h5cGZzL2NvcmUuYw0KPiBpbmRleCA1
MmIzMGRiOGQ3Li5kMDliYmE3ZDhjIDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2h5cGZzL2Nv
cmUuYw0KPiArKysgYi90b29scy9saWJzL2h5cGZzL2NvcmUuYw0KPiBAQCAtMzA3LDggKzMwNyw2
IEBAIGNoYXIgKnhlbmh5cGZzX3JlYWQoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwgY29uc3QgY2hh
ciAqcGF0aCkNCj4gICAgICAgICAgIGVycm5vID0gRUlTRElSOw0KPiAgICAgICAgICAgYnJlYWs7
DQo+ICAgICAgIGNhc2UgeGVuaHlwZnNfdHlwZV9ibG9iOg0KPiAtICAgICAgICBlcnJubyA9IEVE
T007DQo+IC0gICAgICAgIGJyZWFrOw0KVGhpcyB3aWxsIG5lZWQgYSAvKiBmYWxsdGhyb3VnaCAq
LyBJIGd1ZXNzDQo+ICAgICAgIGNhc2UgeGVuaHlwZnNfdHlwZV9zdHJpbmc6DQo+ICAgICAgICAg
ICByZXRfYnVmID0gYnVmOw0KPiAgICAgICAgICAgYnVmID0gTlVMTDsNClRoYW5rIHlvdSwNCk9s
ZWtzYW5kcg==

