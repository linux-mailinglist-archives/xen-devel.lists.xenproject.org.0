Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D50448EC60
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 16:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257660.442893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8OHz-0003E1-OQ; Fri, 14 Jan 2022 15:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257660.442893; Fri, 14 Jan 2022 15:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8OHz-0003Bv-L7; Fri, 14 Jan 2022 15:14:51 +0000
Received: by outflank-mailman (input) for mailman id 257660;
 Fri, 14 Jan 2022 15:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0T4=R6=epam.com=prvs=30137d93b0=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1n8OHy-0003Bp-Av
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 15:14:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b557a763-754c-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 16:14:47 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20EFDtGg014314;
 Fri, 14 Jan 2022 15:14:34 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dkbmkg02v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 15:14:34 +0000
Received: from PAXPR03MB8114.eurprd03.prod.outlook.com (2603:10a6:102:227::15)
 by HE1PR0302MB2617.eurprd03.prod.outlook.com (2603:10a6:3:e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:14:27 +0000
Received: from PAXPR03MB8114.eurprd03.prod.outlook.com
 ([fe80::79e0:5310:180f:f716]) by PAXPR03MB8114.eurprd03.prod.outlook.com
 ([fe80::79e0:5310:180f:f716%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 15:14:27 +0000
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
X-Inumbo-ID: b557a763-754c-11ec-a115-11989b9578b4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zqtl9OS1RSnKkb1bO9gh9VUDIIDlfFdBc1DQQnhE1wSFVC+T6HsBmxx13xgFaU7vnzno+6jDSGXU5J3Q4R9ffOcpMDxC0DS1zsTd9zGHuLCSL4aGNragVXHLk6VGIrP/H3fQ49f3mkDEkSadgTclvvrPMOtaDwgyzeS4beQjdaHloI1qZX4ocTAe7bsm62nQVDBmVPyCkTWZXJSq5US3o7F5ovtdaUcFTxRB5vjbAN62Gl8mY3/I/do44FaLoLnGgVOFVcQiX/bqpAUL2nO3uUWzUHn+9sZYXPL49mBtCWzXtpLZrfn8B8VaO33/8g16XwcZhSco8qbxg1WD4SzFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hZu9tUMGSGW9B8DcFzujcgTyq/drFzckGHCVaAsy0I=;
 b=JXVUJchrHTrN0DGcKiw512mu/XeO00Se4zWlhxHBZlFf1sYIglZfDux+0N5TsN4lwY/cgj4z5bC9rmaeqQmHKj1pnJTs0WpASqR+qXarzpGMiUvXzYxfWh0HVPGFdg6oIiyEr05S7/r1qErLPWT3q9FCRWLMB33/Sk1gnU/QV4QoclxPMQ8yiFaELh8y9sJByajcbmgiTSmO7sL0Y2ET1Kgj0OlSy08EpDkgZRWgPXzrz0Ob555X51san0Pe7KA30QmH8czqd2mvDTxqh+2hroXLR6rgfwKuOiEyEsKC/nK5iVHYIzdEvUBZM4XBKHKHRxItMAUsoK+SU34FfNAp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hZu9tUMGSGW9B8DcFzujcgTyq/drFzckGHCVaAsy0I=;
 b=bBxBzYMjGktAXaFGtrvg4gd/ZGycUCjXxS2FulGEVbAKsb79cmtYSFbSxpxW8IlB8zfvMdfO2GM1udqrjbXISCptk+TixIK55FjO5UxOzQ/YuyQhO4zMmCBCmTkqvmroMPfXV4V9qVyU7vNHJWWeQ92UFrEO9p6fx0W33kw/59mMiEcOSBKVwl9pLtkIZoHiVmAHc355iYkgVLxAWn/gsETl1x0PGD2XPj59bALX9O2Aywvgdx9CXVNlbYu93dmSPOV9WYju1HelGCEiAIMhHd3xeGphuBTdoA76CWwgIHbMKeJkV3TLYLTBCTKvPMPuiDvscSyg2jkHgMjnh99T/g==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<olekstysh@gmail.com>,
        Andrii Anisov <Andrii_Anisov@epam.com>
Subject: RE: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Topic: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Index: AQHYCR/RlHsaR2efDkukmH3CGCI2AKxiNMsAgABq05A=
Date: Fri, 14 Jan 2022 15:14:27 +0000
Message-ID: 
 <PAXPR03MB81148EEE0B2401C29C8065BCF0549@PAXPR03MB8114.eurprd03.prod.outlook.com>
References: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
 <964D6F09-82DF-4B33-AD93-A1C04E7A7FC7@arm.com>
 <VI1PR08MB305666002DC9077053E643C392549@VI1PR08MB3056.eurprd08.prod.outlook.com>
In-Reply-To: 
 <VI1PR08MB305666002DC9077053E643C392549@VI1PR08MB3056.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd426df2-a3d9-46f5-ebcd-08d9d7708e5e
x-ms-traffictypediagnostic: HE1PR0302MB2617:EE_
x-microsoft-antispam-prvs: 
 <HE1PR0302MB261742CFE39799C69E1BE3E7F0549@HE1PR0302MB2617.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PNid6tKe4TIdWOwsGzr1jtF9lt6IjwiXQ0KIrb7qJJdDksd8uxQMQb3uiBv1iIIlFwy52Wi5vkXT/Mh++SVobMxW5cqMalz9d1y4Foy+UEcDvst7TrPZjLnqxAgDzRpeilE3bOqNG8SyRDbVCqYTRZrgU4Af4TCdGtjQoSLu7oDaQDrzGSLx2gs1msGzeEX70LEWDCv/+0Y1NHzBF5v3ihO+nADkyZWRqD8B03DkkVL7xXDn46VOZYbMFzA+yJ4SOuR7IIKM9+KpEpEllapvrh3Xw+wEqs1HtLf6SvxCy+MCUHtd2PNgBU515PLhg4/MlqX1JAbm7DwcW3H2NOYuKQ69uL68lObQIT3LXFcxcmT1BAKsAmOT41Atj8HqPMC4HvOy0JbPOm/LrPSYobQeFUqhsmPmNRMtW0BzPPCVE4CSOKauCMBP/CEWRHhNYj/cmEBbUiHLl8HALoziS9rPAEu4xJEvPn8HfMDkId1h2iVNUY3JjCD5t9fSCZ01BmKqnbMV8Pym6jP2lwRD5feVVralwvc1e+ivrvmFmnSD2VBXB1LNBQEIgTEWoV6LxqRKQO9xhY4hL5YGIxzDwZHrFzqPab1pPsy0w4LyZUvhfi/Y4K9c+n5pB6e0hZ1hWItiuMB3yVZ7hLj8qcjeL7c400Bpan4FqinaZfn/g3vbAZXJv6G3Lm45S6yL0J/L8hNRkQOoXwWNHB53gjPT2Bjmpg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB8114.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(9686003)(71200400001)(52536014)(54906003)(38100700002)(122000001)(5660300002)(86362001)(66946007)(55016003)(38070700005)(6506007)(7696005)(64756008)(66556008)(2906002)(4744005)(8676002)(76116006)(107886003)(6916009)(4326008)(33656002)(316002)(66446008)(186003)(26005)(508600001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WDI2OEJhRDBGRGpzRVB1VWpCb2pMTUdaRXlvdzB6Zk5DRUZCS0lTbDB0Rmtu?=
 =?utf-8?B?WXhNQ3l5YU9nZzZoQ0Eyc0RPZXR5eXY3aUFaN1lxa2c1TEVjTkVGcFFjUmt5?=
 =?utf-8?B?RE9jOWU4TVVqWGRiZkh1cU0vdjA4UHRwR3FvNFNNS3dYUkFhRnJURDhZVVFB?=
 =?utf-8?B?cHYxbjJyc0J6K3JzYVJiWVZDb1hDaktKREw5SkR3cklCZTBXTWx1Uy80QXJV?=
 =?utf-8?B?N09hOWZKWFdHSTNBRHptTEJTd2RGYy8zQVdLMWN2YVFHOHV1RXg2ODI0Q24x?=
 =?utf-8?B?bVc1ejNFelRmNG01Q2d0WFNkblRiVVp2MGthWXdkUys0VmhzZlM3UGIySnE0?=
 =?utf-8?B?YWY5M1V0YVVZOTNFbkswQUptS3kzZ29HSGZtS05WRU1CblpNYVJXOW9Edk1n?=
 =?utf-8?B?S0FYOGRhQjRTVGtRRkhBOTVhRmdCY2l4SndZRGU3UEZ6Mkg0UlYxbzdjQ3h3?=
 =?utf-8?B?S0Q5anNxbnptOE1kZi9mMGthZFg3eHBveXVDLzI2YnkvRmlPT0NpS0laSFkx?=
 =?utf-8?B?OXB3MDVIeUFJV1RpeW5pQ0t3UmQyMGNPN0FEYmVnMXRjQkt4MTF0bmREbHRw?=
 =?utf-8?B?MloveW5La0dDYmVBSEtzUDNURUpEYWdUVFV3TjMyNS9BS2YyclpTV3lIOHVJ?=
 =?utf-8?B?ckREaUNVcmN0SXBZSkxJTFM1czVHZE5JcFluVWw1T1ZFaFhMb1dNS1AxVkJT?=
 =?utf-8?B?V1hSNmJuTTJjS2g2NWVhaXR1Y0gwWHYwRGpMekUzQzZBQ1lIdWpJdERacUtx?=
 =?utf-8?B?NWg3d2ZVVWZjbGNsSzhlSVMyd0FOMUUwUzJzMGE3Qlk2S0x3aDBuVkZ1Unhn?=
 =?utf-8?B?dG02UVBFd2RsWTYrWEg5VnBBaUo5bmhudDNTQUlBWHRuVTNUamNvVTZsVjhl?=
 =?utf-8?B?OHQvdERwWTN3N0pHaEYydGZ0RythaFo4amd1R0ZEa1FpNXYzT0wyTFBldFE1?=
 =?utf-8?B?WXg1ZldUY0hBMVBsWFA3d0NZQlFkdmc3UGZjMWhadFp1VlRQN0RUWE9nWkNY?=
 =?utf-8?B?V3hqQys5RHZpS3NpRnVnTmtxS0IrR0V5N21MS2RTRkNSb29NUldUWWxqY3dV?=
 =?utf-8?B?eUhtYlJQOGtsdkhyNlVlckp5UUsyM3hjRFF0ZExFVFdMMXd5UUVmNFlyMkhP?=
 =?utf-8?B?czFHTFF4TmhXTzBzWlAyYmkya0oyZTdmazlWYng3ZE9NU2JnRGRLUFlTWlEv?=
 =?utf-8?B?S2x2czRVbDA5bUJQTGV3bGhuSDdGR2VobEV0VnJJd2pwazMxanZVdTNnOVFr?=
 =?utf-8?B?eXhqZWlYcnNCdHJXU2U5bVdhWDh4V2tzMnZoYytZTnVKTnp0TzZzd3pML0Uy?=
 =?utf-8?B?L3lPNHQrLzloaStxemdKT29uYW9VMEI0TGsyUGo3dUxEUThTTGpUbjdxNDFW?=
 =?utf-8?B?WXRKb2lEVm5VbTVWRHpwY2FQYktPWGFCRE1hbExpRHpHSzgxWUY1Y0padjF1?=
 =?utf-8?B?WWZ2NldMOE1ybmxOYk9BYXRnNndMSEJXZDVJNVUxdUNUeUVoRUpPYU1yVkRF?=
 =?utf-8?B?YkoyakhxSGZUTjBvSUJpb1VUL29ZZlB6QS92Q0h0Q2F1aTZSdkRBMXl1SG93?=
 =?utf-8?B?RTFYRGhGblluNjg3VVhRZTgyS3RIR2Q5WS9uR2dvTGl6WnBGeVRmZnJrWURL?=
 =?utf-8?B?TDRaMkZLczVpSkhDQ2M2dlhBbkkvUC8vZXNBR2U5b20wdC8vUS85blp6NTVV?=
 =?utf-8?B?eWg0UXVDQiswMVBnbkRjU3JkQytNY25PZEhXV2IrYUp4U0g2aUJDRFNnVE9L?=
 =?utf-8?B?TTJyeFZ3bXdlQ3JRV2l5eDhEVURlK1F3bGdVSGFnKzFEYTE3bTBEdVZDTGhF?=
 =?utf-8?B?RXllSE5SOHBoamdvdzlISks0UkdSUGdCcEJCaDNGK1RJbFRkZzl6ZzVtTisx?=
 =?utf-8?B?OHJ2RHREQmlCUi95NThLRG9VcDdxZnBLRGxMZHJreVVGUWhVNkVDREZjcUFN?=
 =?utf-8?B?NnhMRFphQlAxSzRRbU5SWlo3STYrUjJOZGFvMUljZVcxTHUvV0lBZE5hU3g0?=
 =?utf-8?B?emFJRzNTazRRZUlac092K01YQ0FkTStveThJaVlEL2RudVlsWlVlZzRXWFBp?=
 =?utf-8?B?dlp3U3ZtNGFNNGwrZWJuVy9ZY3Ztd3VrZkZIWDBBZUNjRElMREV3Y0t3V3VQ?=
 =?utf-8?B?bWJOdCthUU1JZUhXS213YzE5NmtwSnVkTmRMVXlwZVRjMlJGdHNpQU5tbmVi?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB8114.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd426df2-a3d9-46f5-ebcd-08d9d7708e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 15:14:27.3749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtGC6vgI3MIY1JDHjShGJT2zLwTiNJDNY5yctGb+YxDF5+NtUQcR2hSvmsSmV7zCoNyEYvYsstmKMjCkSaA4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2617
X-Proofpoint-ORIG-GUID: wJoNrOnZCk2OgebrHLoXIg9seFSwzjT7
X-Proofpoint-GUID: wJoNrOnZCk2OgebrHLoXIg9seFSwzjT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=558
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140102

PiA+ID4gQ3VycmVudGx5IG5vIElPTU1VIHByb3BlcnRpZXMgYXJlIGV4cG9zZWQgdG8gZG9tMCwg
dGh1cyBrZXJuZWwgYnkNCj4gPiBkZWZhdWx0DQo+ID4gPiBhc3N1bWVzIG5vIHByb3RlY3Rpb24g
YW5kIGVuYWJsZXMgc3dpb3RsYi14ZW4sIHdoaWNoIGxlYWRzIHRvIGNvc3RseQ0KPiA+ID4gYW5k
IHVubmVjZXNzYXJ5IGJ1ZmZlcnMgYm91bmNpbmcuDQo+ID4gPg0KPiA+ID4gVG8gbGV0IGtlcm5l
bCBrbm93IHdoaWNoIGRldmljZSBpcyBiZWhpbmcgSU9NTVUgYW5kIGhlbmNlIG5lZWRzIG5vDQo+
IFtKaWFtZWkgWGllXQ0KPiBiZWhpbmc/ICBUeXBvDQo+IA0KDQpPb3BzLCB0eXBvIGluZGVlZC4N
ClRoYW5rIHlvdSENCg0KIC0gU2VyZ2l5DQo=

