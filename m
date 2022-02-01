Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C94A5A5A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263487.456190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqbx-0005ZZ-Ag; Tue, 01 Feb 2022 10:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263487.456190; Tue, 01 Feb 2022 10:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqbx-0005Wk-7Z; Tue, 01 Feb 2022 10:42:09 +0000
Received: by outflank-mailman (input) for mailman id 263487;
 Tue, 01 Feb 2022 10:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bwX=SQ=epam.com=prvs=4031c7af39=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEqbv-0005We-Eu
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:42:07 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 981cf660-834b-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 11:42:05 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 211A7RZ1007395;
 Tue, 1 Feb 2022 10:41:56 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxv6cs5xr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 10:41:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by HE1PR0301MB2348.eurprd03.prod.outlook.com (2603:10a6:3:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Tue, 1 Feb
 2022 10:41:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 10:41:48 +0000
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
X-Inumbo-ID: 981cf660-834b-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP/YbYztSIdnz+ZGLWqESwkVg8E1Udvze2ms+4bRJ9Qk1/f8WxdA4dZOg/A4rPTYwn5B/Su1mon9esGSPJSRWe1NC3WFopSxp34/e94WzVGB2XCF6mc3OjjwXflGf/B/AIiIY7AoGHATGWzvj+kAcU5HQw1tGcgiNVDVWmx4ktk+7y8cQ5t/EDNENNNR8Pcq9Zcg3hODhwa7CdHZGPAKGJJaGIVQC/BDexn2rKQWpNUf8s3SAIQZcuIXZAvAHpHp8mph6MSKKICmSlL/GZftHheW4YmRvgTuGIXJFcnHEPIoJ6FqDrFeOqNJDslebfGpl0rUSF1Pb2fS/wbzp14wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDKrnjq2JPTwlH9H7M6cNz4lIiafKZCiyjfI1lfVmEc=;
 b=Bp3acx4DOSelFwvXX3Tac9TxvwNOBDovSeUlBRDxIEwUpdicaeJ5ju7bSsxtd6/gY9F/boMkgRIiU4Wm8DAXGFcZK8bBEZGg4Mbyl620T/VbuzipRlpyNyyZkyLi4sj0r+tVRLhWKyvi+0Ptw+ivDE3P8BgiuxHYuxQio4x53r+iLPnMX1Mz8u1ZEtQcDc81hB1rC7XZYr3edesPFTIvlembrswLkoUpL9fcApI3R/hErWKcEw7gOvAuk/JcvpKrOj1qugOOX61PprLv4Re4ffkRH8/Gs0NJLProMwHT6iI6vRZ9NuRGRNQ56804IjGQ7ID17UDTlQhFnXHwg8LFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDKrnjq2JPTwlH9H7M6cNz4lIiafKZCiyjfI1lfVmEc=;
 b=XXOcGyQ4ie4Pu+uJu/mF1fA9BAx1HNQxgBqNGv1rJpTGvXYPVTpc2kJcyVqZ35bO29r7S8gDX4pz0CcIU2fp7R0+yh96Asct+D7RM3NgzY+RDnQyoC40ayX0WbZ6Ut4LLpuH2O/6ILAtN30Fx4EG741aEfHon5yGx697i44wq7Ro9PT7c1RuOGo/ALB11S6zuD2a/ZrN5lmbjLn45/gnFClu9Iqonpttg3X8xtrtu3tevzscUEKJiFIsvCojJcXwzqfGVWI72Fp9GPfipRBgs9Lmyh4Ng8FIPbh5/7zsao5BzsTi14kz/NFmJQtFIgE9WsFC+K+s05FDH/2C3mOqMQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB4GiwCAAAxbgIABBueAgAAsSACAAAjhgA==
Date: Tue, 1 Feb 2022 10:41:47 +0000
Message-ID: <1f123f78-0cf2-3388-4db2-986aaffca389@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
 <df36767b-e04f-aa29-82af-87e8624bd29c@suse.com>
 <c82f94c4-dadf-7b2d-4d30-a1de2b5f962a@epam.com>
 <YfkG91cg+fAHFPGd@Air-de-Roger>
In-Reply-To: <YfkG91cg+fAHFPGd@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4a13da5-0456-4ad1-22a0-08d9e56f72d9
x-ms-traffictypediagnostic: HE1PR0301MB2348:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0301MB2348AABF8BC038D66127DCE3E7269@HE1PR0301MB2348.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MnJaDHlxNCTe1oqkzhc9q7RIoTwrCV82OKNS17PqYfM9YxxXyUU2bAkx6jlNSyAkdtaurFNxK0tmNTD/TxU7UoGti7zU7dFOE2zQpPt9215UL82B0BHUDbFY71wAbcRH5zAfAx9Q+Rry+yfYJg5paFl5cCxn+ln7p9cvy9LZZ/FlUGpN1iElIahsIsJkpcB6xzUT8AFyLr2Xcw8HXH5fmsgxmeg7Cqc2VpRLRo4jjnof5rWxrpCsZ0E0xxbvvxBasbGpuJq3InlqDvhF6JCHS3r/tFEKoe2EmzgccPoI06763MMSpGLZhhSLDPN/MWu5/SnbREM+It/Yt6yPFn5GI4zYcdz4nSm5lTYv+E7kbeZ92fasSq7qdtMRxD2ReH8GqQYW48HGl11+y3B0gzMFqimrTKbM92ASiQlULsv11iENJzd0ZF/RA5LahoZAwwjahNSFRBC5VFEDdKVjsRvTdJVpWqyCrJqE6DdoGsV6Zt85UX3Sb7EUExUSxtwCSpQRpdymFqVMsVeiGeeCrn+hn2NwviDogAcFlIDi1kyrcGfJwLcGVhlLcTVRpC8FXG1PCf3eySO2PXXvQodtAv09uDV5lDaGDzk01MCRZNF1jObqxDqvjRKehPEkJ8NDkNv8Zldzx6UmEd3vVNuWhWksNTzGzX7ehgekIMCAmcoERTXdZzRzQz3X+YAnhl/saB5qdYUuWUWx4BYLw3iOo6Dk38lPVoO9Ipe6iYsNOW746G4w4PNKlm/8V9hrDQ8kaTTy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(38100700002)(4326008)(107886003)(2616005)(8936002)(8676002)(122000001)(76116006)(91956017)(66946007)(6506007)(83380400001)(66446008)(66556008)(64756008)(66476007)(2906002)(316002)(54906003)(86362001)(36756003)(6486002)(5660300002)(38070700005)(7416002)(6916009)(26005)(6512007)(31686004)(186003)(508600001)(31696002)(71200400001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M25BdnZ6QWd0a1U0bC90U1BkMVZ6dlg4R0o4djRSTnJwb3BxcWpFN2piL1Vj?=
 =?utf-8?B?SUFaM3h5ejUrSkcycnFOUVBDaml3eWFTYm1tbS9YZytkOUVXOWZzdi91WXgx?=
 =?utf-8?B?RWpodUFVbDI3OE9lY1MrNDZZOUZiOVAvamhqclNldXdFT0FWNDhqUUJTNWda?=
 =?utf-8?B?SThBSzhxMnA0SCtaSGgxQTczV2FpMlFSMVllbEJWeVZNR0s1SXJtR3JQenJw?=
 =?utf-8?B?R2tWaFcrcTJ0MlVRcWZaWmRPc1hHTEExL1hZYWxSY05YbmhUNElkUGJtOEFP?=
 =?utf-8?B?YXhmVk45VjVOMnpVT0MvTENodC9rTURnRThQWk5Ta0t6VTVMbzQwNjhNLzFo?=
 =?utf-8?B?YXdOL0Q2Q2JIUlBNQmVTcXo1Nkk3N1RtdWIvVjVZUXpvaGlrRmUwTU83bGIv?=
 =?utf-8?B?d1NWSWhkU3pVUXZyR2xuRlhHQkRycTFrOUdzNnVTdmhYbUVsc0F2UFFFVytn?=
 =?utf-8?B?cVkvNFBKUkxpRXQ1eUJaN1l2TEJSRnA2NnQ1SU5TblhuajlMQ2pqQWFRdWpF?=
 =?utf-8?B?OGl4Tk5yaEVORjYxTjdlWWl4YTR4SWZNMDlPZHl4eWgyU2lma0VPMjg3eU5T?=
 =?utf-8?B?YVlTZUplSGxaNzN3UmROdW5zcmsxSHNzY2VIRnNEZC9HZXNuMUd1MS9aNVV1?=
 =?utf-8?B?OG85cHVCczBQZExadUpoc2Z3Y0FCTlR5NWkzcEdkNnQ1L29oLzJuR003ZHFp?=
 =?utf-8?B?NG13K1FvMFNUTkRaT0NpNDU0MzZZVjBPbk4rVjVsYjROVkhWa292R2hHRXc4?=
 =?utf-8?B?R2E5QTUwOWFNMXhvaVZ4T3oyZ1dkYUZpTXlVdGkyMnlJQmZscHVhNnFkN3g3?=
 =?utf-8?B?TXBUNG9KdW5WTTAxRGZrNVI0MFR2dUFUM1V1MlNIblFpTmRMbW01aEgzbWp4?=
 =?utf-8?B?VFdBMkxOS0pmS1l6Wm4wSFlYNng2TkpRUUV5NDNvQXZGQW9PM3FNL3JuaWZq?=
 =?utf-8?B?eXB0dkdrQnh5bHhOREI5RnJkY3FwaFlTU1lCMlVTK0ZFaFo2bEdGU1oxTWxX?=
 =?utf-8?B?dWI3Wi9WVEpqMHQ3N1VVZzNUbTVma3Rtc2d0cHZ3NlVncW9PN0xkYXR3RkhN?=
 =?utf-8?B?ZFBOdnVkWGQ1V0NONHhRS01mZjJmRWh3RmlNTGdtbEx0cmd6V1RxNUxucGk0?=
 =?utf-8?B?emVMYWpkajhYNndQd1Q1T2dSSEtFVm05UWdQR3kxS1JJV1czb0pQRFdudE9F?=
 =?utf-8?B?cEFzOUlFQXJCeUM1YmgvUGxGY2Z6dHVWTEFpYitUZUVCUkgrQy9scW1CeHNM?=
 =?utf-8?B?YVd4K1BGbm9JZ2k0dDhFaHJMYTRUSjIvc2FWamZCM3REWTg5UWtIaUdtUDN3?=
 =?utf-8?B?cXc5b3RwSnB4NmhGYnRCSjBpN3pMMzFVSmNQYjlBVFVPL29ZWGU3QWxncWNJ?=
 =?utf-8?B?L3hSem1tRmtoeTVkNVFFbU5SVmM0VkFkNjlGWGRUdldVUkhVbTI3aDYwZUwy?=
 =?utf-8?B?MXNFYW5wNjVvMWhRMXNFZjNwTU5keEV6RXh3ak95bmFtblRNSDc3NC91OHFH?=
 =?utf-8?B?QXYxSUxZQUpPTHBqTFNmSUVoT24xWUNxM05LUzBsWURxejR1WWpZb3RBdTI2?=
 =?utf-8?B?c3BhUllmZTBWV3RTSlIzUGdnanE1TGtsVjZxZ2FycnBPc0pISU1NU3RUMGJU?=
 =?utf-8?B?ckJBSVlRODYyRDV3YnFNTjdERDdTV2FDdzFLY1pkR2hBL0ZZZzBXS3RoWlpK?=
 =?utf-8?B?VUJ0YjBEY21JWVFSQnM0WXJmMENkaE91VzhCNlZvQlVTWXNuOXM4dnRKRDNm?=
 =?utf-8?B?Z21QemNpTWE5Z3Y2U3VocSt1a1MwdDRLdnEzdzZwUlk3eFMzVU9ZQzlteWVY?=
 =?utf-8?B?YlBXOHBxaythR1Qwb2ZaYkJvVEpCMGNmRDJ3K3c0TU5aVlpjeFVKTTBFSkta?=
 =?utf-8?B?dVE4T3lBaHVGRWVMcGVMM2VES2ZxQzcvYXdPUnJ5OVI0OW5seVZLT0V3WmIy?=
 =?utf-8?B?YktJQ24zRWRqQTBKOFdvMndBcmN6VXE1MkFua1EvOG9GNVh0dEhPVk1TZmJW?=
 =?utf-8?B?RnFTc25JOEl5UlFYRFBjcmd1Zm5iVmhqZHpJZWY1ZGJld21iWHRpQnB3R2xn?=
 =?utf-8?B?Tzk0ejNnaUVBbkFDNmY5RU9nN3lYQVE4MzloT2N6V1FFR1lpeVVkcmU3elRy?=
 =?utf-8?B?NmNQMW5kQkkyWDA4em9TRnFnOVVnbXpHWnZoNlBZejNueVlleXc1bzc1RG0y?=
 =?utf-8?B?Ky8vWDY2eUFQK3dmR29RR0E0ekJhSDJBVHFvTlliTVBNRitUeGtoZlptR3gz?=
 =?utf-8?B?NzlpN29oTlBMbUxKTTg0VzZTNGxUWFFjVnRHK1N4ajc4SkxxY1ZpeGd3NThy?=
 =?utf-8?B?eUZ0UDZ0THZtcnVuZG9wU0hnRVBpTlFvWFY1bGdlU0RzMFp6b3RJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F0C035C8067C8439D717CBD807B8BE9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a13da5-0456-4ad1-22a0-08d9e56f72d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 10:41:47.9191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MbMEw1yCGn2OwsppmbGx4KrOlELkmDBm6MqL999LSAfwaFvdvKILiSa2J/ltv7LUaKv5B+s+5MHsG9m0srpokm5OAoWReY7AUF00LaqIu2TnUzBX+mb9I/ghUFcvTzMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2348
X-Proofpoint-ORIG-GUID: L4N6btNoXX579pL8nF0OrPTa51hTyt6-
X-Proofpoint-GUID: L4N6btNoXX579pL8nF0OrPTa51hTyt6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010059

SGksIFJvZ2VyIQ0KDQpPbiAwMS4wMi4yMiAxMjoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVHVlLCBGZWIgMDEsIDIwMjIgYXQgMDc6MzE6MzFBTSArMDAwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMzEuMDEuMjIgMTc6NTAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+IE9uIDMxLjAxLjIwMjIgMTY6MDYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+PiBIaSwgUm9nZXIhDQo+Pj4+Pj4gICAgICAgICAgICAgICAgIHJvbS0+dHlw
ZSA9IFZQQ0lfQkFSX0VNUFRZOw0KPj4+Pj4+ICAgICAgICAgfQ0KPj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4+Pj4+
IGluZGV4IGVkMTI3YTA4YTk1My4uMGE3M2IxNGE5MmRjIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5o
DQo+Pj4+Pj4gQEAgLTY4LDcgKzY4LDEwIEBAIHN0cnVjdCB2cGNpIHsNCj4+Pj4+PiAgICAgICAg
IHN0cnVjdCB2cGNpX2hlYWRlciB7DQo+Pj4+Pj4gICAgICAgICAgICAgLyogSW5mb3JtYXRpb24g
YWJvdXQgdGhlIFBDSSBCQVJzIG9mIHRoaXMgZGV2aWNlLiAqLw0KPj4+Pj4+ICAgICAgICAgICAg
IHN0cnVjdCB2cGNpX2JhciB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIC8qIFBoeXNpY2FsIHZpZXcg
b2YgdGhlIEJBUi4gKi8NCj4+Pj4+IE5vLCB0aGF0J3Mgbm90IHRoZSBwaHlzaWNhbCB2aWV3LCBp
dCdzIHRoZSBwaHlzaWNhbCAoaG9zdCkgYWRkcmVzcy4NCj4+Pj4+DQo+Pj4+Pj4gICAgICAgICAg
ICAgICAgIHVpbnQ2NF90IGFkZHI7DQo+Pj4+Pj4gKyAgICAgICAgICAgIC8qIEd1ZXN0IHZpZXcg
b2YgdGhlIEJBUjogYWRkcmVzcyBhbmQgbG93ZXIgYml0cy4gKi8NCj4+Pj4+PiArICAgICAgICAg
ICAgdWludDY0X3QgZ3Vlc3RfcmVnOw0KPj4+Pj4gSSBjb250aW51ZSB0byB0aGluayBpdCB3b3Vs
ZCBiZSBjbGVhcmVyIGlmIHlvdSBzdG9yZSB0aGUgZ3Vlc3QgYWRkcmVzcw0KPj4+Pj4gaGVyZSAo
Z2FkZHIsIHdpdGhvdXQgdGhlIGxvdyBiaXRzKSBhbmQgYWRkIHRob3NlIGluIGd1ZXN0X2Jhcl9y
ZWFkDQo+Pj4+PiBiYXNlZCBvbiBiYXItPnt0eXBlLHByZWZldGNoYWJsZX0uIFRoZW4gaXQgd291
bGQgYmUgZXF1aXZhbGVudCB0byB0aGUNCj4+Pj4+IGV4aXN0aW5nICdhZGRyJyBmaWVsZC4NCj4+
Pj4+DQo+Pj4+IEkgYWdyZWVkIGZpcnN0IHRvIGRvIHN1Y2ggYSBjaGFuZ2UsIGJ1dCB0aGVuIHJl
Y2FsbGVkIG91ciBkaXNjdXNzaW9uIHdpdGggSmFuIFsxXS4NCj4+Pj4gQW5kIHRoZW4gd2UgZGVj
aWRlZCB0aGF0IGluIG9yZGVyIGZvciBpdCB0byBiZSBlZmZpY2llbnQgaXQgaXMgYmV0dGVyIGlm
IHdlIHNldHVwIGFsbCB0aGUNCj4+Pj4gdGhpbmdzIGR1cmluZyB0aGUgd3JpdGUgcGhhc2UgKHJh
cmUpLCByYXRoZXIgdGhlbiBkdXJpbmcgdGhlIHdyaXRlIHBoYXNlIChtb3JlIG9mdGVuKS4NCj4+
PiBTbWFsbCBjb3JyZWN0aW9uOiBUaGUgMm5kICJ3cml0ZSIgd2FzIGxpa2VseSBtZWFudCB0byBi
ZSAicmVhZCIuDQo+PiBZZXMsIHRoaXMgaXMgY29ycmVjdC4NCj4+PiAgICBCdXQNCj4+PiBwbGVh
c2UgcmVjYWxsIHRoYXQgUm9nZXIgaXMgdGhlIG1haW50YWluZXIgb2YgdGhlIGNvZGUsIHNvIGhl
IGdldHMNCj4+PiB0aGUgZmluYWwgc2F5Lg0KPj4gQWdyZWUsIGJ1dCB3b3VsZCB2b3RlIGZvciB0
aGUgY3VycmVudCBhcHByb2FjaCBhcyBpdCBzdGlsbCBzYXZlcyBzb21lDQo+PiBDUFUgY3ljbGVz
IG1ha2luZyB0aGUgcmVhZCBvcGVyYXRpb24gcmVhbGx5IHRpbnkNCj4gSSB0aGluayB5b3UgbmVl
ZCB0byBidWlsZCB0aGUgbWFwcGluZyByYW5nZXNldChzKSBiYXNlZCBvbiBndWVzdA0KPiBhZGRy
ZXNzZXMsIG5vdCBob3N0IG9uZXMsIHNvIGl0J3MgbGlrZWx5IGdvaW5nIHRvIGJlIGVhc2llciBp
ZiB5b3UNCj4gc3RvcmUgdGhlIGFkZHJlc3MgaGVyZSBpbiBvcmRlciB0byB1c2UgaXQgd2hlbiBi
dWlsZGluZyB0aGUgcmFuZ2VzZXQuDQo+DQo+IE92ZXJhbGwgdGhlIGNvc3Qgb2YgdGhlIHZtZXhp
dCB3aWxsIHNoYWRvdyB0aGUgY29zdCBvZiBkb2luZyBhIGNvdXBsZQ0KPiBvZiBPUnMgaGVyZSBp
biBvcmRlciB0byByZXR1cm4gdGhlIGd1ZXN0IHZpZXcgb2YgdGhlIEJBUi4NCj4NCj4gSWYgeW91
IHRoaW5rIHN0b3JpbmcgdGhlIGd1ZXN0IHZpZXcgb2YgdGhlIEJBUiByZWdpc3RlciB3aWxsIG1h
a2UgdGhlDQo+IGNvZGUgZWFzaWVyIHRvIHVuZGVyc3RhbmQsIHRoZW4gcGxlYXNlIGdvIGFoZWFk
LiBPdGhlcndpc2UgSSB3b3VsZA0KPiByZWNvbW1lbmQgdG8gc3RvcmUgdGhlIGFkZHJlc3MgbGlr
ZSB3ZSBkbyBmb3IgdGhlIGhvc3QgcG9zaXRpb24gb2YgdGhlDQo+IEJBUiAoaWU6IGFkZHIgZmll
bGQpLg0KSSBzdGlsbCB0aGluayBpdCBpcyBlYXNpZXIgdG8gdW5kZXJzdGFuZDogaWYgeW91IHRh
a2UgYSBsb29rIGF0IHdoYXQgd2UgZG8NCmZvciBCQVIgd3JpdGUgZm9yIGJvdGggaG9zdCBhbmQg
Z3Vlc3QgeW91J2xsIHNlZSB0aGF0IHdlIGRvIGFsbW9zdCB0aGUNCnNhbWUgb3BlcmF0aW9ucywg
YnV0IGluIGhvc3QgY2FzZSB3ZSBlbmQgdXAgd3JpdGluZyBiYXItPmFkZHIgKyBsb3cNCmJpdHMg
dG8gdGhlIEhXIHJlZ2lzdGVyIGFuZCBpbiBjYXNlIG9mIGEgZ3Vlc3Qgd2Ugc3RvcmUgdGhlIGNv
bXBsZXRlDQp0aGluZyBpbnRvIGJhci0+Z3Vlc3RfcmVnLiBSZWFkIG9wZXJhdGlvbiBkb2Vzbid0
IHJlcXVpcmUgYW55IHByb2Nlc3NpbmcNCmZvciBob3N0LCBzbyBpdCBpcyBlcXVpdmFsZW50IHRv
IGRpcmVjdCBodyByZWFkIGFuZCBpbiBjYXNlIG9mIGEgZ3Vlc3QgaXQNCmlzIGFzIHNpbXBsZSBh
cyBwb3NzaWJsZSBhbmQgaW1wbGVtZW50cyB0aGUgZXF1aXZhbGVudCBieSByZXR1cm5pbmcNCnBh
cnQgb2YgYmFyLT5ndWVzdF9yZWcgKGhpIG9yIGxvKS7CoCBTbywgZnJvbSB0aGlzIFBPViBpdCBp
cyBJTU8gZWFzaWVyIHRvDQp1bmRlcnN0YW5kIHRoZSBsb2dpYy4NClRoYXQgYmVpbmcgc2FpZCwg
SSBkbyBhZ3JlZSB0aGF0IHRoZSBjb250ZW50cyBvZiB0aGUgYmFyLT5hZGRyIGlzIG5vdA0KZXF1
aXZhbGVudCB0byBiYXItPmd1ZXN0X3JlZywgYnV0IHdlIGhhdmUgYWxyZWFkeSB0YWtlbiBjYXJl
IG9mIGl0DQpieSBuYW1pbmcgdGhlIGd1ZXN0J3Mgb25lIHdpdGggZ3Vlc3RfcmVnLCBub3QgZ3Vl
c3RfYWRkci4NCg0KSSB3aWxsIGtlZXAgdGhlIGNvZGUgYXMgaXMgdGhlbi4NCj4NCj4gVGhhbmtz
LCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

