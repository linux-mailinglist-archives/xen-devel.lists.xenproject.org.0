Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67156A01B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 12:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362916.593193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OtO-00054C-FF; Thu, 07 Jul 2022 10:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362916.593193; Thu, 07 Jul 2022 10:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OtO-00051M-CT; Thu, 07 Jul 2022 10:37:54 +0000
Received: by outflank-mailman (input) for mailman id 362916;
 Thu, 07 Jul 2022 10:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmvb=XM=epam.com=prvs=9187b89ef8=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1o9OtM-00051F-Oj
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 10:37:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7737fe1-fde0-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 12:37:48 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2679qcZo002560;
 Thu, 7 Jul 2022 10:37:38 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3h5ve810r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 10:37:37 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM4PR0302MB2675.eurprd03.prod.outlook.com (2603:10a6:200:91::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 10:35:01 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2d63:5490:24b9:415b]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2d63:5490:24b9:415b%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 10:35:01 +0000
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
X-Inumbo-ID: d7737fe1-fde0-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3AWg4X8Q4Giq3Rz8CEJkdrNx96HxZi4Pz2exBKP/j2TCkrk3F3dONvkFza/iY8SqpsD9B+x/fFgCYf2TUA2HfTMtLhO5IyVKmtDoCaKeogcAk4D0bulm9CnZykKz55wmUDd7mTXksTP87TKkEYZ8hEbKk/rWEX1oeZJ7DNp0vuoaZLlTO/hTfxQ8lnfPNHWF2O43xYeWBEo3U8sjCLbbRxAi967p3tzISI5GkQxCT9eQ+6MgVbM1M3n9BOgEhTdFUr1aLXR7x8A95yMe9VU/9GA+PEC9JRx3ZxSpOBJhQe6NM/yqGwMnfAiOEn0qiW3DyitWRf/vp0NnfJH9QoB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba9u7UG7l6uCZKm4dIcahyaB8d9LWNf8nlzGyAamsfA=;
 b=TRRucJofv+YYiCCSUGIKfw8ub2LFdnrM4CU/MbPn88/1b2BOK1DY9u4qsYGkx0kiz/lSpV1tA6xJUvTrId3N/R47EujLadLexflV1wH4LAO8gmp2cRmt9wU9nOdrhUjA8Nws2VxavnzeQ4TZkPNSLnpY3AbEITHV41LC5/3Y2eWn0ifNCCOZM57f85fTdJuYMlqGojC4Hee6NjbkF3Ynf/LZrX+HLbVzSCP1MFfUmleQTOkiIsoetHHVb3LYlp27DpAW6Zrz3ZeW7pMHlxJkeGxxE6x2ZoGmbyHHzGqVmqMEZuY3RvnyRpkIJvCKOlKbBp3wRhloH/Dbe5JQorUY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba9u7UG7l6uCZKm4dIcahyaB8d9LWNf8nlzGyAamsfA=;
 b=Hl8PvunYrDe3oM4I67LbN+HvHUxS8SrL1msGDFJjeb5c/M4AsApgVxdn21HDBNoKPpqQG0EyEq/CuJ5RpflEWFIKTLXXpPvE/+tDMSxz46QMq6XYWwBhgozEIKsyhFwlO9c0JqbT+ugEB8s+fSOmuuLnsjn8uNLxFwxDHD7XwOmxUMrExejdJ3WH67IgkKCDoTzne5W8uTJqYnLR2rvkKMoPFuUyk//hCQ94VX1crEN2UFpug1pCHYYBN7to95xJlxKyiWv0BGHKIs+Mn7P5AvoI91YNnwyQOrRaywSx7XXpN5Ln5fpCZ2yBowOADD1PncjsAjDi8W4kDWv7fVIhWg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
        Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Nick Rosbrook
	<rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Paul
 Durrant <paul@xen.org>
Subject: [RFC] DVFS and Thermal management subsystem proposal
Thread-Topic: [RFC] DVFS and Thermal management subsystem proposal
Thread-Index: AQHYke02Cidd2c7KkEyfmAiMVFzcyw==
Date: Thu, 7 Jul 2022 10:35:00 +0000
Message-ID: <20220707103500.GA1959452@EPUAKYIW015D>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1048ab47-e219-4768-5c9b-08da600458ab
x-ms-traffictypediagnostic: AM4PR0302MB2675:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4lRd+JiJkrQ+NsVTm1ws71oaM5H0CQpfPPi38xLXDSsYuTEmxqqfeUuYui5p7q1iIEqDb8oTeOxk43sR4w7tp99cDA+lqGzyeSChDfU51yk3SCrHz8mCtM2/yZytu9T4agTAjYisI3DNJLDjt/P+lP3Xg21696HutNDDDmfsDaAX4LJXqJKqao5yMllTEIKWtUxKLENqbpS8Jjb1DeBiXywTZrxt8fR3bxQsrj80De3brGlPS5RzggT0Aqyha2lhN7HMWOEn3GfQCl2f/Trbba9OIG4TgaFNLuwk3U1/RUajYZ1fKv/t2914DmAoNiiX8nV9WYhDt0YRd/x4WUUuPsUdtgNbh4x85sUXc5Q6gD+UH4lujEFFlY2kNtDvGuCiu4RM7NkOz8FFQd/sngUVIkFbX5TcHQLUZovM+7VNImx5ya0YUF25eYOm5noZTtUrovQvO85VnEnXjcnB4hM1DxMKl40XtLtIwkAXpHQY/1BAFzrhPmnGxOshzrwoPSYqM+ZENqFTqSGSi0Jo2uIbRbaKzkRaYVBSYSdxg67fhR8KvmmgUSCo2Bu+q7IdSOWNTdIClBKPBie1HSa+wfS1I1G45fzo4eA3fbsBk4CAOLLEAjwtdMnBKhBSAkEa7QNGJ/hWnicHTyiYhg0MNuCpzed1GFotTlRy28lI9wsz+VIWFSemF49i4bK0In+foPFVrRh8WXiKrcl8UUrYQ3i3gjxilHR4ZtLDfV7Fhv1dbVRkS5izRVmHau2pBPZ8zUvCRvi6Il8QF6NvKWC+Uv5ue4QsC/sXh4YsBYEG7zivp15Se0DqVvu2zLtFCPNFHr8zY4V6o3hUqIHkyFOA4p1V+C9/0IYQBuxMa4UP5W6uwQQ6DxAJ5H/EaVghuOgJlRZ3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(396003)(39860400002)(366004)(346002)(376002)(136003)(83380400001)(86362001)(38070700005)(1076003)(186003)(966005)(9686003)(38100700002)(33656002)(66446008)(478600001)(71200400001)(41300700001)(7416002)(6916009)(64756008)(316002)(91956017)(122000001)(54906003)(5660300002)(8936002)(30864003)(6486002)(4326008)(2906002)(66946007)(76116006)(33716001)(6512007)(66556008)(55236004)(26005)(6506007)(8676002)(66476007)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RSs0dklnV0ZEWGJOU2FnUkpqMExVanZiSWFSY3FkSkI5dnRZUklIM3IxZ05M?=
 =?utf-8?B?b1Q0Sld6VUNOUmZxeGN0UVlDSExNSUwyUTFZQ1BHdHBaaUNYSTQrM0ErUStL?=
 =?utf-8?B?bk9VV1haRHhGTEtNM1NXYncxMHhkNDgzUllwMGlJVFF6aTYyb2lZVUhPNHdE?=
 =?utf-8?B?WnBqekxLVmNDVnYxeE9xWHRYNWhpckQwQ1dMSWFDWVpsc1hNakU4WWxWSlpI?=
 =?utf-8?B?OHVJRlBEZnp3ejFnMFgxK0NXaGdPQkY2RWp5VHlTUW1TRGVzZjRMMHp0S3lQ?=
 =?utf-8?B?RHZCdTJYdmRiQ0xGNDlRWEp5WElwUVVkOHE0eXJjWUl5dldHaEw0UFE0UHBp?=
 =?utf-8?B?T085Q2VhKzY3aFVYekJyWUZYNTZJeGNLWncyMTNOMUNPL2ZhOVFLMFRzVUJ0?=
 =?utf-8?B?WWkzbkdxTWxvTG95SmozVmozZC91RCtpVCt3L21tdkc2SUFOZEpTcFJGMVZV?=
 =?utf-8?B?RGdwMHpOSXdJcVF3VHQ2cVlWNkY1Nmpjd3ZnMDdVNkdFbGE4em52N0FpNW9Y?=
 =?utf-8?B?Y0FicnoraHNZU1pyUlpOL0Eycm9oa0xHZGdqY05zRVQveFZsVGYyN01tTkxr?=
 =?utf-8?B?enl3dGMzT3BLSlM3Y0hRWndhUXdvMEExalNxbUNnaFYwcVNJWk0yQVJXWTc5?=
 =?utf-8?B?RjlXcXZ6Q05CZk9FbDk2bmV3WW5MM0lyY25lOSswUm8wU0xQTUdZNFBvcDBQ?=
 =?utf-8?B?UXgyOEpzblVZNE5Tb0NpczhVSlN1WGVvazZoTFZLeXhRRW40czhuQW5KbTQ5?=
 =?utf-8?B?YjFDVkdFak9pN1phSXl1WmxjSWdxeU9EZENMNFR5U3JPbXF6SGxMSmIzOEpT?=
 =?utf-8?B?WTJMeEtNbnd1eG90V2svS29Wa2g4WjJDdmJ3UWlRMDZmd2FQTmVua1NkTXZH?=
 =?utf-8?B?OHlzQ2dWbEtDQWRwRjdNaTd1OUVJTFNDVUNiYXprSWV0R3prVU8zbDRDSDhT?=
 =?utf-8?B?Y2hBRHZFeCtwZWRXRVBoUlJRMU03a1Y1dEpidUphc3FUUW91SEVUWWRrcTJt?=
 =?utf-8?B?UVh5N1dPanRvYVVDN3psZTJweDVxTkRzc21rOVc0YVc3ZllZZGFWNFVNNGhq?=
 =?utf-8?B?MGdBMnBSRXhoT2NCaFBUZVNjWExhbnExVkZ6SU9JbzlHVkpYVkswUm8zYUFi?=
 =?utf-8?B?Um9qc3RPQVVrRzlTYndlL0xKTEtzbW9EZzEvd1FOaGVQNnNnb0k5S1pCN1B4?=
 =?utf-8?B?Sm05RUxFRzhmNWFZZHhhVC9mS1F1RGd3SVlhdXlaT1QvcWo5Nk1udXYvYXp3?=
 =?utf-8?B?MDZaandQVm1HV1NXMDlqblpka1FhT0FnMHV6SDdTL0Vkb3BRN2lhMCttWGxi?=
 =?utf-8?B?OTJuZkwrVUhEK1FMSllGMUdwanQ1dkVuS0pPYVpkdHJITG55NVd0V2hWN0lt?=
 =?utf-8?B?ekdEMlJVL0tHSWNWb2NrZE91aDBSVWhqSEdRSTZDdjhVcGVDL0pvRGcvSTRp?=
 =?utf-8?B?MUxvTkFubWEzUThkYTJhUlhDRGRVTGdtM1lFcCsrWVdxeVBBQkt6K1RURzVi?=
 =?utf-8?B?bmoxNlFYLzZ3dUxrbVUzQnU4YjZpSFVZYlQyNDk4WUg1L3lzS3JtV0p1OG5k?=
 =?utf-8?B?VStjYWtxZHMxSFBieWVDVWNNRFRETmNuckxXeSs5b3NuUVBEdDFEN1kxb0h6?=
 =?utf-8?B?RVZhUHoxQjBRdXBES0Jza0FUejgrQVM1MXZYZkFJMTZDTlJLR3UzYURYVklY?=
 =?utf-8?B?cFNjME9QSXZaTDJ6cEhnQnR3NDI0UFIrYlQxbmpLVjZSTVlHa1VCN2lDT1ZN?=
 =?utf-8?B?eVdWZ05LekU4MlFMRnFkWjZTNnZuNXVCOGVXT1BMdFRadUMvRDZ1clBGMEZy?=
 =?utf-8?B?ZVBSRHBFMjZ6N1pEb0M1YUJXalVZUjJBU0JWQUdoNDAvcDFpL0gyNG1kUzZV?=
 =?utf-8?B?dEdlQ1BjRDBjRU8yNG5vSG5DRkQxSFAxOVVORGhNeGVKQy9zYUpEL1hyWHVi?=
 =?utf-8?B?aXIwQ1NlalIyTE9aZEtmdFdEbjZBOThwVjVwYStoTWtRaTdwT1lKaDBkREZl?=
 =?utf-8?B?RlZmZWIyS2NOcURqcVBwd0RZbGNtRWNuMCtqL2ppOTE3NGhwYmhpRU5UWkxm?=
 =?utf-8?B?MW9IUlk4YUJTb0N6T3R5WGdrQUNWK1I0US8vQmlTdVVZL09Jck8waFRvRmVT?=
 =?utf-8?B?TEtSY2tObUZOZUNVd3NOTHlGYlRnUVRwME5NUTF1eXBCa1RHeWJTSDErZytj?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <897A9F25DF3E5749806057D2CFA3C69E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1048ab47-e219-4768-5c9b-08da600458ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 10:35:00.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4UbgR5/le9g0h5JqapcbBlabfSq+kdPt9nyNdyGDpkuM8X8e2a50+Vb+RirJf+Hot8kHmVrQvtRF5ssl132je7cMsDQvgS8jlug/m1M5pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2675
X-Proofpoint-GUID: xKiiK1Lsgh_RspR_rUQEVpFUuaEjCAOB
X-Proofpoint-ORIG-GUID: xKiiK1Lsgh_RspR_rUQEVpFUuaEjCAOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_08,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070042

IyBTeW5vcHNpcw0KVGhpcyBkb2N1bWVudCBpcyBpbnRlbmRlZCB0byBkZXNjcmliZSB0aGUgZGVz
aWduIG9mIHRoZSB0aGVybWFsIGJhc2VkIGNwdQ0KdGhyb3R0bGluZyBpbiB2aXJ0dWFsaXplZCBl
bnZpcm9ubWVudHMuIFRoZSBnb2FsIGlzIHRvIHByb3ZpZGUgZ2VuZXJpYyB0aGVybWFsDQptYW5h
Z2VtZW50IHN1YnN5c3RlbSwgd2hpY2ggc2hvdWxkIHdvcmsgd2l0aCBleGlzdGluZyBjcHVmcmVx
IHN1YnN5c3RlbSBpbiBYRU4NCmFuZCBjb3VsZCBiZSB1c2VkIG9uIHZhcmlvdXMgYXJjaGl0ZWN0
dXJlcyBhbmQgaGFyZHdhcmUuDQoNCiMgQ3B1ZnJlcSBzdWJzeXN0ZW0gaW4gWEVODQoNCiMjIEJy
aWVmIG92ZXJ2aWV3DQoNCiAgIEdvdmVybm9ycw0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KfCAr
LS0tLS0tLS0tLS0tLS0tLSsgfCAgc3RydWN0IGNwdWZyZXFfZ292ZXJub3Igew0KfCB8ICBvbmRl
bWFuZCAgICAgIHwgfCAgICAgIC5uYW1lDQp8ICstLS0tLS0tLS0tLS0tLS0tKyB8ICAgICAgLmdv
dmVybm9yDQp8ICstLS0tLS0tLS0tLS0tLS0tKyB8ICAgICAgLmhhbmRsZV9vcHRpb24NCnwgfCAg
cG93ZXJzYXZlICAgICB8IHwgIH0NCnwgKy0tLS0tLS0tLS0tLS0tLS0rIHwNCnwgKy0tLS0tLS0t
LS0tLS0tLS0rIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSsNCnwgfCAgcGVyZm9ybWFuY2UgICB8IHwtPmNwdWZyZXFfcmVnaXN0ZXJfZ292ZXJu
b3IoKSB8ICstLS0tLS0tLS0tLS0tLS0tLS0tK3wNCnwgKy0tLS0tLS0tLS0tLS0tLS0rIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IHwgIGNwdWZyZXFfZGV2X2RydiAgfHwNCnwgKy0t
LS0tLS0tLS0tLS0tLS0rIHwgICBjcHVmcmVxX3JlZ2lzdGVyX2RyaXZlcigpLT58ICstLS0tLS0t
LS0tLS0tLS0tLS0tK3wNCnwgfCAgdXNlcnNwYWNlICAgICB8IHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICstLS0tLS0tLS0tLS0tLS0tLS0tK3wNCnwgKy0tLS0tLS0tLS0tLS0tLS0r
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IHwgICAgIC4uLiAgICAgICAgICAgfHwN
CnwgKy0tLS0tLS0tLS0tLS0tLS0rIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICst
LS0tLS0tLS0tLS0tLS0tLS0tK3wNCnwgfCAgLi4uICAgICAgICAgICB8IHwgICAgc3RydWN0IGNw
dWZyZXFfZHJpdmVyIHsgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCnwgKy0tLS0tLS0tLS0t
LS0tLS0rIHwgICAgICAgLmluaXQgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsNCistLS0tLS0tLS0tLS0tLS0tLS0tLSsgICAgICAgLnZlcmlmeSAgICAgICAgICAgICAg
ICB8ICAgIEhhcmR3YXJlICAgICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LnNldHBvbGljeSAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLnVwZGF0ZQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAudGFyZ2V0DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5nZXQNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLmdldGF2Zw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAu
ZXhpdA0KICAgICAgICAgICAgICAgICAgICAgICAgICB9DQoNCkNwdWZyZXEgc3Vic3lzdGVtIGNv
bnNpc3RzIG9mIDIgcGFydHM6DQoxKSBDcHVmcmVxIGdvdmVybm9yLCB3aGljaCBzaG91bGQgYmUg
cmVnaXN0ZXJlZCB1c2luZyBjcHVmcmVxX3JlZ2lzdGVyX2dvdmVybm9yDQpjYWxsOw0KMikgQ3B1
ZnJlcSBkcml2ZXIsIHdoaWNoIHByb3ZpZGVzIGFjY2VzcyB0byB0aGUgaGFyZHdhcmUgc2hvdWxk
IGJlIHJlZ2lzdGVyZWQNCnVzaW5nIGNwdWZyZXFfcmVnaXN0ZXJfZHJpdmVyIGNhbGwuDQoNCiMj
IEhhcmR3YXJlIGRyaXZlcnMNCg0KVGhlcmUgYXJlIHR3byBDcHVmcmVxIGhhcmR3YXJlIGRyaXZl
cnMgaW1wbGVtZW50ZWQgYnkgdXMgKHNlZSBBcHBlbmRpeCAxIGFuZA0KQXBwZW5kaXggMikgdG8g
cHJvdmlkZSBzdXBwb3J0IGZvciBSY2FyLTMgYW5kIGkuTVg4IGJvYXJkcy4gVGhvc2UgZHJpdmVy
cyBhcmUNCmRlc2lnbmVkIHRvIHN1cHBvcnQgdGhlcm1hbCB0aHJvdHRsaW5nIHN1YnN5c3RlbS4g
VGhleSBhcmUgZ29pbmcgdG8gYmUgdGhlIHBhcnQNCm9mIHRoZSBjb250cmlidXRpb24gcGFja2Fn
ZS4NCg0KIyMgQ29uZmlndXJhdGlvbiBvcHRpb25zDQoNCkNwdWZyZXEgc3Vic3lzdGVtIGVuYWJs
ZXMgd2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZyBwYXJhbToNCistLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSsNCkNPTkZJR19IQVNfQ1BVRlJFUT15DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoNCkNwdWZy
ZXEgZGV2aWNlIGRyaXZlciBpcyBwbGF0Zm9ybSBzcGVjaWZpYyBhbmQgY2FuIGJlIHNlbGVjdGVk
IG9uIGNvbXBpbGUgdGltZQ0KYnkgc2V0dGluZyBjb25maWcgcGFyYW1ldGVyOg0KKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKw0KQ09ORklHX0NQVUZSRVFfWFhYDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
DQpXaGVyZSBYWFggaXMgdGhlIHBsYXRmb3JtIG5hbWUuDQpBZGRpdGlvbmFsIGNvbmZpZ3VyYXRp
b24gaXMgYWxzbyBwb3NzaWJsZS4gVGhpcyBjb3VsZCBiZSBkb25lIGJ5IGRldmljZSB0cmVlDQpu
b2RlcyBvciB1c2luZyBBQ1BJIGNvbmZpZ3VyYXRpb24uIEN1cnJlbnQgaW1wbGVtZW50YXRpb24g
c3VwcG9ydHMgb25seQ0KZGV2aWNlLXRyZWUgY29uZmlndXJhdGlvbi4NCkRldmljZSB0cmVlIGNv
bmZpZ3VyYXRpb24gaXMgZGVmaW5lZCBieSB0aGUgY3B1ZnJlcSBkcml2ZXIgaW1wbGVtZW50YXRp
b24gYW5kDQptb3N0bHkgdXNpbmcgZGV2aWNlLXRyZWUgYmluZGluZ3MgZnJvbSBsaW51eCBrZXJu
ZWwuIExpbnV4IGtlcm5lbCBkZWZpbmVzDQpjb21tb24gYW5kIHBsYXRmb3JtIHNwZWNpZmljIGNw
dWZyZXEgYmluZGluZ3MuDQpTZWUgWzBdIC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY3B1ZnJlcSBhbmQNClswXSAvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL29w
cCBmb3IgZGV0YWlscy4NClNvbWUgZXhhbXBsZXMgY2FuIGJlIGZvdW5kIGluIEFwcG5kaXggMSBh
bmQgQXBwZW5kaXggMi4NCg0KQ3B1ZnJlcSBkcml2ZXIgaW5pdGlhbGl6ZXMgb24gWGVuIHN0YXJ0
IGJhc2VkIG9uIHRoZSBjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMuDQpPbmx5IG9uZSBjcHVmcmVx
IGRldmljZSBkcml2ZXIgY291bGQgYmUgZW5hYmxlZCBvbiBzeXN0ZW0uIFN3aXRjaGluZyB0byB0
aGUgZGlmZg0KQ3B1ZnJlcSBoYXJkd2FyZSBkcml2ZXIgc2hvdWxkIGJlIHByb2JlZCBiYXNlZCBv
biBEZXZpY2UtdHJlZSBub2RlcyBvciBBQ1BJDQpjb25maWd1cmF0aW9uLg0KDQpUaGUgZGVmYXVs
dCBnb3Zlcm5vciBjYW4gYmUgc2V0IGZyb20gdGhlIHhlbi1ib290YXJncyBhbmQgaGFzIHRoZSBm
b2xsb3dpbmcNCmZvcm1hdDoNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCmNwdWZyZXE9eGVuOm9u
ZGVtYW5kDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoNCnhsLmNmZyAoZ3Vlc3QgY29uZmlndXJh
dGlvbiBmaWxlcykgc3VwcG9ydCB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb24gb3B0aW9uOg0K
Z3Vlc3RwbS4gSXQgZGVmaW5lcyBQTSBwb2xpY3kgZm9yIHRoZSBnaXZlbiBndWVzdC4gRm9yIGV4
YW1wbGU6DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQpndWVzdHBtID0gIjAtNyINCistLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsNCmd1ZXN0cG0gPSAiMC03IiBsaW5lIGFsbG93cyBndWVzdCB0byBjaG9v
c2UgT1BQIGxldmVscyBmcm9tIDAgdG8gNyBvdXQgb2YgMTUuDQpIaWdoZXIgT1BQIGxldmVscyB3
aWxsIGJlIGlnbm9yZWQgYnkgaHlwZXJ2aXNvci4NCg0KDQojIFhFTiBEeW5hbWljIFRoZXJtYWwg
bWFuYWdlbWVudCBkZXNpZ24NCg0KIyMgU3lub3BzaXMNCg0KSW50cm9kdWNpbmcgdGhlIGRlc2ln
biBvZiB0aGUgRHluYW1pYyBUaGVybWFsIE1hbmFnZW1lbnQgZm9yIFhlbiBoeXBlcnZpc29yLg0K
VGhpcyBmZWF0dXJlIGlzIGFuIGVuaGFuY2VtZW50IG9mIHRoZSBYZW4gRFZGUyBmZWF0dXJlIGFu
ZCB3aWxsIGFsbG93IHN5c3RlbQ0KYWRtaW4gdG8gY29uZmlndXJlIGRpZmZlcmVudCB0aGVybWFs
IGdvdmVybm9ycyB3aGljaCB3aWxsIHBlcmZvcm0gQ1BVDQp0aHJvdHRsaW5nLCBiYXNlZCBvbiB0
aGUgQ1BVIGNvcmVzIHRlbXBlcmF0dXJlIGFuZCB0aGVybWFsIGNvbmZpZ3VyYXRpb24uDQoNCiMj
IFRvcCBsZXZlbCBkZXNpZ24uDQoNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsNCnwgICAgWEVOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCnwgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tKyAgICAgICAgICAg
IHwNCnwgICAgICAgICAgICAgIHwgICAgICBUaGVybWFsICAgICAgfCAgICAgICAgICAgIHwNCnwg
ICAgICAgKy0tLS0tPnwgICAgIEdvdmVybm9yICAgICAgfCAgICAgICAgICAgIHwNCnwgICAgICAg
fCAgICAgICstLS0tLS0tLS18LS0tLS0tLS0tKyAgICAgICAgICAgIHwNCnwgICAgICAgfCAgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHwNCnwgICAgICAgfCAgICAgICAgICAg
ICAgICArLS0tLS0tLSsgICAgICAgICAgICAgIHwNCnwgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgIHwNCnwgICstLS0tLS0tLS0tLS0tLS0tLS0rICArLS0tLS0t
LS0tLS0tLS0tLS0tKyAgIHwNCnwgIHwgICBUaGVybWFsICAgICAgICB8ICB8ICAgIENwdWZyZXEg
ICAgICAgfCAgIHwNCnwgIHwgICBEcml2ZXIgICAgICAgICB8ICB8ICAgICAgICAgICAgICAgICAg
fCAgIHwNCnwgICstLS0tLS0tLS0tLS0tLS0tLS0rICArLS0tLS0tLS0tLS0tLS0tLS0tKyAgIHwN
CnwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCistLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAgICAg
ICAgICAgICAgXg0KICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgICAgICAgICAgICAgIHwN
CiAgICAgICAgICAgKy0tLS0tLS0tdi0tLS0tLS0tKw0KICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICB8DQogICAgICAgICAgIHwgICAgSGFyZHdhcmUgICAgIHwNCiAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgfA0KICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0rDQoNCg0KIyMgVGhl
cm1hbCBtYW5hZ2VtZW50IHN1YnN5c3RlbSBkZXNpZ24gaW4gWEVODQoNCiArLS0tLS0tLS0tLS0t
LS0tLS0tKw0KIHwgKy0tLS0tLS0tLS0tLS0tKyB8DQogfCB8ICBwb3dlcnNhdmUgICB8IHwgICAg
ICAgICAgICAgICBzdHJ1Y3QgdGhlcm1hbF9nb3Zlcm5vciB7DQogfCArLS0tLS0tLS0tLS0tLS0r
IHwgICAgICAgICAgICAgICAgICAgLm5hbWUNCiB8ICstLS0tLS0tLS0tLS0tLSsgfCAgICAgICAg
ICAgICAgICAgICAuZ292ZXJub3INCiB8IHwgICBzdGVwd2lzZSAgIHwgfDwtLS0tLS0tLS0tLS0r
ICAgICAuaGFuZGxlX29wdGlvbg0KIHwgKy0tLS0tLS0tLS0tLS0tKyB8ICAgICAgICAgICAgIHwg
fQ0KIHwgKy0tLS0tLS0tLS0tLS0tKyB8ICAgICAgICAgICAgIHwNCiB8IHwgICAgIC4uLiAgICAg
IHwgfCAgICAgICAgICAgICB8DQogfCArLS0tLS0tLS0tLS0tLS0rIHwgICAgICAgICAgICAgfA0K
ICstLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgIHYNCiAgICAgICAgICArLS0tLS0tLS0t
LS0tLS0tLS0+cmVnaXN0ZXJfdGhlcm1hbF9nb3Zlcm5vcigpDQogICAgICAgICAgfA0KKy0tLS0t
LS0tLXYtLS0tLS0tLSsgICAgICAgICAgICAgICAgICAgICAgICAgUG9sbGluZyB0ZW1wZXJhdHVy
ZQ0KfCAgIGR5bl90aGVybWFsICAgIHw8LS0tLS0tLS0rICAgICAgICAgICAgICstLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCistLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgKy0tLS0tLS0tLS0tLT58
ICBwb2xsaW5nX2hhbmRsZXIoKSB8DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQogcmVn
aXN0ZXJfdGhlcm1hbF9kcml2ZXIoKSAgICAgICAgICAgICAgICB8IF9fY3B1ZnJlcV9kcml2ZXJf
dGFyZ2V0KEhJR0gpIHwNCiAgICAgICAgICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgdGhlcm1hbF9kcml2ZXIgeyAgIFNldCBISUdIIHByaW9yaXR5IHRvIHRoZQ0KICst
LS0tLS0tLS0tLS0tLS0tLS0rICAgICAubmFtZSAgICAgICAgICAgICAgICAgIHRhcmdldCBwb2xp
Y3kuIFNvIHRoaXMNCiB8ICB0aGVybWFsX2RyaXZlciAgfCAgICAgLmdldF90cmlwcyAgICAgICAg
ICAgICBjb25maWd1cmF0aW9uIHdpbGwgb3ZlcnJpZGUNCiArLS0tLS0tLS0tLS0tLS0tLS0tKyAg
ICAgLmdldF90ZW1wICAgICAgICAgICAgICBjcHVmcmVxIGdvdmVybm9yDQogICAgICAgICAgICAg
ICAgICAgICAgICAgIC5zZXRfYWxhcm1fdGVtcA0KICstLS0tLS0tLS0tLS0tLS0tLS0rICB9DQog
fCB0aGVybWFsX3NlbnNvcnMgIHwNCiArLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQpEeW5hbWljIHRo
ZXJtYWwgZmVhdHVyZSBjb25zaXN0cyBvZiB0aGUgMiBlbnRpdGllczogdGhlcm1hbCBnb3Zlcm5v
ciBhbmQgZHJpdmVyDQoNClRoZXJtYWwgZ292ZXJub3Igc2hvdWxkIGJlIHJlZ2lzdGVyZWQgdXNp
bmcgcmVnaXN0ZXJfdGhlcm1hbCBnb3Zlcm5vciBhbmQgd2lsbA0KcHJvdmlkZSB0aGUgZm9sbG93
aW5nIGludGVyZmFjZToNCg0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0Kc3RydWN0IHRoZXJtYWxf
Z292ZXJub3Igew0KICAgIC5uYW1lID0gIm5hbWUiDQogICAgLmdvdmVybm9yID0gZ292X2RicywN
CiAgICAuaGFuZGxlX29wdGlvbiA9IGhhbmRsZV9vcHQNCiAgICAudGVtcF9oYW5kbGVyID0gdF9o
YW5kbGVyDQp9DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoNCldoZXJlIGdvdmVybm9yIHNob3Vs
ZCBwcm9jZXNzIGNvbW1hbmRzIChzdGFydC9zdG9wL2V2ZW50KS4gRXZlbnQNCmNvbW1hbmQgaXMg
bmVlZGVkIGlmIGh3IGRyaXZlciBzdXBwb3J0cyB0ZW1wX2FsYXJtIHNldC4gR292ZXJub3IgaXMg
YWxzbw0KcmVzcG9uc2libGUgZm9yIHBvbGxpbmcgdGVtcGVyYXR1cmUgYW5kIGRvIHRocm90dGxp
bmcgYnkgc2V0dGluZyBjcHVmcmVxDQpwb2xpY3kuIENwdWZyZXEgcG9saWN5IHdpbGwgYmUgc2V0
IHdpdGggdGhlIHByaW9yaXR5LCBISUdIIHRvIG92ZXJyaWRlIGNvbW1hbmRzDQpmcm9tIGNwdWZy
ZXFfZ292ZXJub3IuIENvbW1hbmRzIGZyb20gY3B1ZnJlcSBnb3Zlcm5vciBzaG91bGQgYmUgaWdu
b3JlZCB1bnRpbA0KdGhyb3R0bGluZyBpcyBpbiBwcm9ncmVzcy4NCg0KVGhlcm1hbCBkcml2ZXIg
c2hvdWxkIHByb3ZpZGUgYWNjZXNzIHRvIHRoZSBoYXJkd2FyZSBhbmQgZ2l2ZSBpbnRlcmZhY2Ug
dG8gdGhlDQppbmZvcm1hdGlvbi4gVGhlcm1hbCBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yIHRo
ZSBjb25maWd1cmF0aW9uIGFuZCBzaG91bGQNCnByb3ZpZGUgdGhpcyBjb25maWd1cmF0aW9uIHRv
IGdvdmVybm9yLiBXZSBhcmUgcGxhbm5pbmcgdG8gcHJvdmlkZSBzdXBwb3J0IG9mDQp0aGUgUmNh
ci0zIGFuZCBpLk1YOCBib2FyZHMgKHNlZSBBcHBlbmRpeCAzIGFuZCBBcHBlbmRpeCA0KS4NCg0K
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KdGhlcm1hbF9kcml2ZXIgew0KICAgICAubmFtZQ0KICAg
ICAuZ2V0X3RyaXBzDQogICAgIC5nZXRfdGVtcA0KICAgICAuc2V0X2FsYXJtX3RlbXANCn0NCist
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsNCg0KIyMgR292ZXJub3JzDQoNCkluIExpbnV4IEtlcm5lbCB0
aGVyZSBpcyBhbiBlbnRpdHkgY2FsbGVkIHRoZXJtYWwgZ292ZXJub3IsIHdoaWNoDQppcyByZXNw
b25zaWJsZSBmb3IgdGhlIHN5c3RlbSBiZWhhdmlvdXIgd2hlbiBjcml0aWNhbCB0ZW1wZXJhdHVy
ZXMgd2VyZQ0KcmVhY2hlZC4gVGhlIGZvbGxvd2luZyBnb3Zlcm5vcnMgYXJlIGdvaW5nIHRvIGJl
IGltcGxlbWVudGVkIGluIFhlbjoNCg0KIyMjIFBvd2Vyc2F2ZSBnb3Zlcm5vcg0KDQpTZXRzIG1p
bmltYWwgY3B1IGZyZXF1ZW5jeSBpZiBwYXNzaXZlIHRyaXAgdGVtcGVyYXR1cmUgd2FzIHJlYWNo
ZWQuIFJlYm9vdGluZw0KYm9hcmQgb24gY3JpdGljYWwgdGVtcGVyYXR1cmUuDQoNCiMjIyMgRmFp
ci1zaGFyZSBnb3Zlcm5vcg0KDQpVc2luZyAzIHBhcmFtZXRlcnMgdG8gY2FsY3VsYXRlIHRocm90
dGxlIHN0YXRlOiBQMTogbWF4IHRocm90dGxlIHN0YXRlOyBQMjoNCnBlcmNlbnRhZ2VbSV0vMTAw
LiBTaG93cyBob3cgZWZmZWN0aXZlIGRldmljZSBpczsgUDM6DQpjdXJfdHJpcF9sZXZlbC9tYXhf
bm9fb2ZfdHJpcHMuIE5ldyBjcHUgc3RhdGUgb2YgQ1BVID0gUDMgKiBQMiAqIFAxDQoNCiMjIyMg
U3RlcC13aXNlIGdvdmVybm9yDQoNClNlcXVlbnRpYWxseSBzd2l0Y2hpbmcgc3RhdGUgdXBwZXIg
aWYgdGVtcGVyYXR1cmUgaXMgcmlzaW5nIGFuZCBsb3dlcg0Kb3RoZXJ3aXNlLg0KDQojIyMjIFVz
ZXItc3BhY2UgZ292ZXJub3INCg0KTm90aWZpZXMgZ3Vlc3RzIHdoZW4gdHJpcCB0ZW1wZXJhdHVy
ZSB3YXMgcmVhY2hlZCBieSBzZXR0aW5nIGZsYWcgaW4geGVuaHlwZnMuDQoNCiMjIyBUaGVybWFs
IGdvdmVybm9yIGNvbmZpZ3VyYXRpb24NCg0KVGhlcm1hbCBnb3Zlcm5vciBzaG91bGQgYmUgZW5h
YmxlZCBpbiBYZW4gY29uZmlnIHBhcmFtdGVyZXJzOg0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0K
Q09ORklHX0hBU19USEVSTUFMPXkNCkNPTkZJR19HT1ZfVEhFUk1BTF9GQUlSX1NIQVJFPXkNCkNP
TkZJR19HT1ZfVEhFUk1BTF9TVEVQX1dJU0U9eQ0KQ09ORklHX0dPVl9USEVSTUFMX1BPV0VSU0FW
RT15DQpDT05GSUdfR09WX1RIRVJNQUxfVVNFUlNQQUNFPXkNCistLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSsNCldoZXJlIENPTkZJR19IQVNfVEhFUk1BTCBlbmFibGVzIER5bmFtaWMgVGhlcm1hbCBNYW5h
Z2VtZW50LiBPdGhlciBwYXJhbWV0ZXJzDQplbmFibGUgZGlmZmVyZW50IHRoZXJtYWwgZ292ZXJu
b3JzIGluIHN5c3RlbS4gVGhlIGRlZmF1bHQgZ292ZXJub3IgaXMgU1RFUF9XSVNFDQpvciB0aGUg
Zmlyc3QgaW4gbGlzdCBpZiB3YXNu4oCZdCBzZXQgaW4gY21kbGluZSBvciBTVEVQX1dJU0Ugd2Fz
IG5vdCBlbmFibGVkLg0KDQpJbiBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB0aGVybWFsIGRyaXZl
ciBpcyB1c2luZyBkZXZpY2UtdHJlZSBub2RlcyB0byBwcm9iZQ0KZGV2aWNlIGRyaXZlci4gQUNQ
SSBjb25maWd1cmF0aW9uIGlzIG5vdCB0aGUgcGFydCBvZiBjdXJyZW50IGltcGxlbWVudGF0aW9u
Lg0KVGhlcm1hbCBkZXZpY2UgZHJpdmVyIGRlZmluZXMgdGhlIGRldmljZS10cmVlIGNvbmZpZ3Vy
YXRpb24gZm9ybWF0IGJhc2VkIG9uDQp0aGVybWFsIGRldmljZSB0cmVlIGJpbmRpbmdzIGZyb20g
dGhlIExpbnV4IGtlcm5lbCBzb3VyY2UgY29kZS4NClNlZSBbMF0gL0RvY3VtZXRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwgZm9yIGRldGFpbHMuDQoNClRoZXJtYWwgZ292ZXJub3Ig
Y2FuIGJlIGNvbmZpZ3VyZWQgaW4geGVuLWJvb3RhcmdzIGNvbW1hbmQgbGluZSBieSBhZGRpbmcg
dGhlDQpmb2xsb3dpbmcgcGFyYW1ldGVyOg0KDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQp0aGVy
bWFsPXhlbjpzdGVwd2lzZQ0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQpYZW5oeXBmcyB1dGls
aXR5IGNhbiBiZSB1c2VkIHRvIGdpdmUgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIHRoZXJtYWw6
DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+eGVuaHlwZnMgbHMgL3RoZXJtYWwvDQp0aGVybWFs
X2dvdmVybm9yDQphdmFpbF9nb3Zlcm5vcnMNClRyaXBzDQpUaHJvdHRsZQ0KY3VycmVudF90ZW1w
DQo+eGVuaHlwZnMgY2F0IC90aGVybWFsL3RoZXJtYWxfZ292ZXJub3INCnN0ZXB3aXNlDQo+eGVu
aHlwZnMgY2F0IC90aGVybWFsL2F2YWlsX2dvdmVybm9ycw0Kc3RlcHdpc2UgcG93ZXJzYXZlIHVz
ZXJzcGFjZQ0KPnhlbmh5cGZzIGNhdCAvdGhlcm1hbC90cmlwcy8NCjEwNyhwYXNzaXZlKSAxMTco
Y3JpdGljYWwpDQo+eGVuaHlwZnMgY2F0IC90aGVybWFsL3Rocm90dGxlDQowDQo+eGVuaHlwZnMg
Y2F0IC90aGVybWwvY3VycmVudF90ZW1wLzANCjg1KGNsdXN0ZXIgMCkNCj54ZW5oeXBmcyBjYXQg
L3RoZXJtbC9jdXJyZW50X3RlbXAvMQ0KODcoY2x1c3RlciAxKQ0KKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKw0KDQpUaGVybWFsIGdvdmVybm9yIGNhbiBiZSBjaGFuZ2VkIGJ5IHRoZSBmb2xsb3dpbmcg
Y29tbWFuZDoNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj54ZW5oeXBmcyB3cml0ZSAvdGhlcm1h
bC90aGVybWFsX2dvdmVybm9yIHBvd2Vyc2F2ZQ0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQoj
IyBTdW1tYXJ5DQoNClRoZSBwcm9wb3NlZCBmZWF0dXJlIHdpbGwgcHJvdmlkZSBzbWFydGVyIHdh
eSB0byBkbyB0aHJvdHRsaW5nIGluIGNhc2Ugb2YNCnRoZXJtYWwgYWxhcm0gaW4gWEVOLg0KDQoj
IEFwcGVuZGl4IDEuIFJjYXItMyBjcHVmcmVxIGRyaXZlcg0KVGhlIHNvbHV0aW9uIGZvciBSY2Fy
IEdlbjMgcGxhdGZvcm0gY29uc2lzdHMgb2YgdGhlIGZvbGxvd2luZyBzb2Z0d2FyZQ0KY29tcG9u
ZW50czoNCuKAoiBBUk0gVHJ1c3RlZCBGaXJtd2FyZSwgd2hpY2ggYWN0cyBhcyBTQ1AgbW9kdWxl
Lg0K4oCiIFhFTiBIeXBlcnZpc29yLCB3aGljaCBiZWFycyBzZXQgb2YgY3B1ZnJlcSBnb3Zlcm5v
cnMuDQpBUk0gVHJ1c3RlZCBGaXJtd2FyZSBpbXBsZW1lbnRzIFNDTUkgcHJvdG9jb2wgd2l0aCBT
TUNzIGFzIHRoZSBtYWlsYm94DQppbnRlcmZhY2UuIEFSTSBURiBpcyBjYXBhYmxlIG9mIGNvbnRy
b2xsaW5nIHBlcmZvcm1hbmNlIHN0YXRlIG9mIGJvdGggQ29ydGV4DQpBNTcgY2x1c3RlciBhbmQg
Q29ydGV4IEE1MyBjbHVzdGVyLg0KDQpBY3RpdmUgZ292ZXJub3IgZGVzaWRlcywgd2hpY2ggY2x1
c3RlciBzaG91bGQgYmUgYWx0ZXJlZCBhbmQgY29uZmlndXJlDQpwZXJmb3JtYW5jZSBieSBzZXR0
aW5nIE9QUCBsZXZlbCBpbiBIVy4NCkhXIGRyaXZlciBhY2Nlc3MgQVRGIHZpYSBTQ01JIHByb3Rv
Y29sIGFuZCBzZXQncyB0aGUgcmVxdWVzdGVkIHBlcmZvcm1hbmNlDQpsZXZlbC4NCg0KIyBBcHBl
bmRpeCAyIGkuTVg4IGNwdWZyZXEgZHJpdmVyDQpUaGUgc29sdXRpb24gZm9yIGkuTVg4IGlzIHNp
bWlsYXIgdG8gdGhlIFJjYXItMyBhcyBpdCBoYXMgdGhlIHNhbWUgY29tcG9uZW50cw0KaW52b2x2
ZWQ6DQoqIEFSTSBUcnVzdGVkIEZpcm13YXJlLCB3aGljaCBwcm92aWRlcyBTQ1AgcHJvdG9jb2wu
DQoqIFhFTiBIeXBlcnZpc29yLg0KKiBTQyBGaXJtd2FyZSB3aXRoIGFsdGVycyBwZXJmb3JtYW5j
ZSBsZXZlbC4NCg0KaS5NWDggY3B1ZnJlcSBkcml2ZXIgdXNpbmcgU0NGVyBpbnRlcmZhY2UgdG8g
YWNjZXNzIHRvIGNwdSBjbHVzdGVyczogQTUzIGFuZA0KQTcyLiBBUk0gVEYgaXMgdXNlZCB0byBj
b250cm9sIGNwdSBmcmVxdWVuY3kgb2YgYm90aCBjbHVzdGVycyB1c2luZyBTTUMNCm1lc3NhZ2Vz
LiBTQ0ZXIGludGVyZmFjZSBjYW4ndCBiZSB1c2VkIHRvIGNvbnRyb2wgY3B1IHBlcmZvcm1hbmNl
LCBqdXN0IHRvIGdldA0KdGhlIGV4aXN0aW5nIHBlcmZvcm1hbmNlIHN0YXRlIGJlY2F1c2Ugb2Yg
dGhlIGJvYXJkIGltcGxlbWVudGF0aW9uIGxpbWl0YXRpb25zLg0KDQpDcHVmcmVxIGRldmljZSBk
cml2ZXIgdXNpbmcgZGV2aWNlLXRyZWUgYmluZGluZ3MgdG8gcmVjZWl2ZSB0byBvcHAtdGFibGVz
DQpjb25maWd1cmF0aW9uLiBTZWUgWzBdIC9Eb2N1bWV0YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9vcHAgZm9yIGRldGFpbHMuDQoNCiMgQXBwZW5kaXggMyBSY2FyLTMgdGhlcm1hbCBkcml2ZXIN
ClRoZSBzb2x1dGlvbiBmb3IgUmNhciBHZW4zIHBsYXRmb3JtIGFsbG93cyB0aGVybWFsIHN1YnN5
c3RlbSB0byBhY2Nlc3MgdGhlDQpoYXJkd2FyZSBhbmQgcmVhZCBzZW5zb3JzIHZhbHVlcy4gRHJp
dmVyIGlzIGNvbmZpZ3VyZWQgZnJvbSB0aGUgZGV2aWNlLXRyZWUuDQpIYXJkd2FyZSBpcyBhYmxl
IHRvIGdlbmVyYXRlIElSUSB3aGVuIGNyaXRpY2FsIHRlbXBlcmF0dXJlIHdhcyByZWFjaGVkLiBU
aGVybWFsDQpkcml2ZXIgaGFuZGxlcyB0aGlzIElSUSBhbmQgc2VuZCBldmVudCB0byB0aGVybWFs
IGdvdmVybm9yLg0KDQpUaGVtYWwgZGV2aWNlIGRyaXZlciB1c2luZyByY2FyLWdlbjMtdGhlcm1h
bCBiaW5kaW5ncyBmb3IgdGhlIGNvbmZpZ3VyYXRpb24uDQpTZWUgWzBdIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3JjYXItZ2VuMy10aGVybWFsLnlhbWwgZm9yDQpk
ZXRhaWxzLiBET01JRF9YRU4gb3duZXIgaXMgc2V0IHRvIHRoZSBwcm9jZXNzZWQgbm9kZXMsIHNv
IHRob3NlIG5vZGVzIHNoYWxsDQpub3QgYmUgcGFzc2VkIHRvIHRoZSBndWVzdHMuDQoNCiMgQXBw
ZW5kaXggNCBpLk1YOCB0aGVybWFsIGRyaXZlcg0KVGhlIHNvbHV0aW9uIGZvciBpLk1YOCBib2Fy
ZCBhbGxvd3MgdGhlcm1hbCBzdWJzeXN0ZW0gdG8gcmVhZCB0aGVybWFsIHNlbnNvcnMNCnVzaW5n
IFNDRlcgaW50ZXJmYWNlIHRvIGFjY2VzcyBoYXJkd2FyZS4gQ3VycmVudCBpbXBsZW1lbnRhdGlv
biBmb2xsb3dzIHRoZQ0KaW1wbGVtZW50YXRpb24gb2YgaW14X3NjX3RoZXJtYWwgaW4gbGludXgg
a2VybmVsLiBBbGFybSBldmVudHMgYXJlIHNlbnQgYmFzZWQNCm9uIHBvbGxpbmcgaW4gdGhlIHNl
cGFyYXRlIHRocmVhZCAodXNlZCB0aW1lciBtZWNoYW5pc20pLiBQb2xsaW5nIHRpbWVvdXRzIGFy
ZQ0Kc2V0IGluIHRoZSBEZXZpY2UtdHJlZSBub2RlLg0KDQppLk1YOCB0aGVybWFsIGRldmljZSBk
cml2ZXIgdXNpbmcgaW14LXRoZXJtYWwgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZQ0KY29u
ZmlndXJhdGlvbi4NClNlZSBbMF0gL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aGVybWFsL2lteC10aGVybWFsLnlhbWwgZm9yDQpkZXRhaWxzLiBET01JRF9YRU4gb3duZXIgc2V0
IHRvIHRoZSBwcm9jZXNzZWQgbm9kZSwgc28gaXQgd29uJ3QgYmUgcGFzc2VkIHRvDQp0aGUgZ3Vl
c3QuDQoNCiMgTGlua3MNClswXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNl

