Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A216C80197B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645829.1008241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002H9-5z; Sat, 02 Dec 2023 01:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645829.1008241; Sat, 02 Dec 2023 01:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002Ao-2b; Sat, 02 Dec 2023 01:27:20 +0000
Received: by outflank-mailman (input) for mailman id 645829;
 Sat, 02 Dec 2023 01:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Ems-000271-Gj
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb9763e6-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:14 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWY004068; Sat, 2 Dec 2023 01:27:12 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:11 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:06 +0000
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
X-Inumbo-ID: eb9763e6-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVV67vpxBffXxsYMlmmK8gJaR/DMybyhELr2tdhCVNw3hW0O0kXW68wkcapv0Ncfg0Rj2E+9jNidiIgfx/0+aq8YqreY6rzRqvnNJArH2F72q+JFkiIJtR0Cw2Axg+aKGfBnVyrqgcCjYKaxcDwRqXDM6xjvS6HSePLHDa/h8Ui8GTbHCAevSCNPEi5q8aCiHryReFM7aqoZz+KVOYu2uKuNgPNpipnGcM3N18ogPxlhmLcI5xRL2IgucwL69jiSCXJ9Hbc2OuQzbRIKGJJrpQnIZ4oiHvQA8G/wss7fwVZlkojgxq1gRr4ikGlfbB12PwyxwzyzGSYzWA/4RclyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEcu45xdaIpfXtUGO2Sqnh0DJtv9WM0RX9NJ+e+vxXs=;
 b=nZej2pAQdMYTWnY1bn+qOynGXYYu4KqAS7k8GvFFypdaOPzH4Velgtkd/8pJJWu54w6uNuKCNQW2oFDoq7eE70Pre4H/LDLqidGJlArMXSWGteW7ekg5V8oKyynKAY32MC3PJHZ/42jBX5frh4ueqqfzX1sg5lqsPJJEk+pbq+QfzUHmpZjhXhhP1DScs1qywzi3rELpHnB22J4SUzN1gmmQuX7fbogVDmY1criJ48Uma/9kt2EW0lpiOUXJtK5vTsxtnpnKtFaa6eY7gYAwQtD8q7uQJzp+L3mVu00Nxdi9um1k1oAnZyCh+EyjuHsrfUqppmCbA7dZyQ0BBgyShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEcu45xdaIpfXtUGO2Sqnh0DJtv9WM0RX9NJ+e+vxXs=;
 b=UODhRrK7CCn3wvuVnh6kgfZTEVVI8/4u9ribXWt9c4560GyJmKMnCiOElfC6dIr5tX2dxPKguL0AUNCS8bIG1wSiCPGCy5ho3fH8cWKqYZ2kBsonSTookbLLydbPbjJes62k+gU0gkCV/BWO/L+IIsqpmr8S406g/BuQyeebsJWmJfOZHOodPVKA4QzIsESuvQMR3Qgn/ewq+p4V3yvE0kCQmoXQRYYNgNbtX8aUNZbPxXVPrUIqBTR8zMo9Xtgf7Al2CjIFs2OeK+5BPc63DLeGXYFja/w4NE2PHLBfqyoOaoQcK9Qi1zspqVTbGFwXHO5VCjHyAP5aB/i4ey0Hyg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 04/17] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v11 04/17] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHaJL6nE24AjhfTmkCFnkV7ezIkjw==
Date: Sat, 2 Dec 2023 01:27:03 +0000
Message-ID: <20231202012556.2012281-5-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 80ec34e3-a240-4e66-ebcc-08dbf2d5cbae
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2N/TNAahW4L73JX+HAXfzCTMdpr1gcTQhVzVOy+PLMysr87Ho5bS1WZ4sUwqYLwqkDxkmPOMTS3fcS0R14AZzEcxqvjUYOhi2bFuhggx9DmsICGIvRWWxBbwwKbDTjcf9iQ4B7XhZ0M30Z4zXR8Wf1ebgKClp+wK0p7vbk2uPYwg8L2C6Yy/KW+TXmBJgYBGhh4KPeSBzBNk8NFFYOcEH8Kr6xAxI6/RAMmEK1pMZ66FJxk2gNua8zVitz9Wf8nSunb8v/KqJ21bdi/Ltqw4y2/GzCur5r9DaJaWi5E6U7bJ5bpeWYtB6Yl6znjPnFcwFITSzMyK+XFwdwRiyYoSHyATLd6zlURGOVosnHsoceeuP90duHQGCUgxlX7oBIDzpFYHdOdPM4ngYQJn+ZHfte42dGSAggDfsZjyIWLLzjiLb0L1gDVfdZa78JxExxJG0TLvRLkyVykANsm2FTo33gHhzqKYNQdPGrCtQ+H6PIfe7ie2PFVdphjy7GZgDXPNRZ46crvdZ4HDfb1Y1I1cW1rRRurHCADnGLPSWTlh5SRRdvEFijVFExeDxtA5eY9xovoMgQtwoN+1tOnQJWU9r0QIKfz0dD7Sl0Ov8LNQdudLcfnyIVJaEngpChDl80K0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dDhla0tVZFRuQm5pZDM2R0xSeDlpZkx1RWdrSzR1elVOQ1pTSWZXZ1BLK3Jl?=
 =?utf-8?B?cXRxMkdybTFGdVBnYkY2alhFZXdvRmlBNDVVdC9kdnFYN1B0SzlpU0c0Y1RY?=
 =?utf-8?B?ZG5QdDRMeUJPelptNW40bVNmS3BkNlZHakdhWlFKVHVjTkFsRGw1aUZlYmZO?=
 =?utf-8?B?QkRtVlBqVTV3UnppdThKMnJ0VzJ1aEc1M0RnY3VrZVd2Mkl6R2tTclQ4SGNk?=
 =?utf-8?B?OTk4aTJvckMyeCtwN3pwakJZYW01d1ZzYVZKbDg2WG9lZVlWcnBvZE96Mmkz?=
 =?utf-8?B?ZUUrMHRBKzE2d0FFd2dKaUJqUzkzUnB1TFpzRVh0eWsyM0FYUGlwTmpmYnRz?=
 =?utf-8?B?NzVuMi9ieDN2ZGhpTEUvUlN2VUJwdGtxaEQ4ZmZBRUJuZit1OEZ6amVxL3Fp?=
 =?utf-8?B?Z2trdkkwOXdsSG00aTlzbEx1ODdNcldHQlhnSXQwVDJ2T0ZWMnlqVElUL2ps?=
 =?utf-8?B?UzRScE1zMWJqcy9TMXFsUEpRaVcwYVRORWI1NjROQTRmZVNXSG5Vb25CenlJ?=
 =?utf-8?B?NVFPRFgzdG44cDNHd2NSSTVIaGpNc3Z6ZVNad21Kbk9oNzlpSnBWdTFxaHlO?=
 =?utf-8?B?eGY0NjdKTHFnWkRNajFUMEtmcml1TTJrbkRyaWV0RVNmT3NYOUs2ZitHelAx?=
 =?utf-8?B?bW9saHdPak03V3VsNXBZU3RJMXI4aVJQUXB6TTJOZDdPN0JMQU9Ndyt3UTBS?=
 =?utf-8?B?RDR5Qlp4eUNiaS91NEFxcnVJUVV6eU1OSXNNenZ5aU00QXdWQ0l4NXpWMWJ5?=
 =?utf-8?B?bktMQlZtdmdaQkt4a1crRE9qOElxMy9scjh4ZDkrUlRoNCt2TW5tSU5ncmZI?=
 =?utf-8?B?SS8wNmVDL2pMMWRraWRzZkl5TGZhVXhHL3R5MVZoL3lWV1JDWWFXY1Awd1VE?=
 =?utf-8?B?eTViV2JCZGRBM2Z3RnBiemFMNzJNZWh3Tm50MzRkdERjK211VFVwNThFWjZY?=
 =?utf-8?B?Tk1jN0FlSnViZFJ4cXVVRk5RMUpuSm5GRUVTQmNxVHdTTzdCcnNRdFE5UURD?=
 =?utf-8?B?NkNHa2RmZHVHNXVQMm82bkwrRWJsVG1CVkFWVURxdUx1bnJ5cE1sSVV3alor?=
 =?utf-8?B?MTBzZ1lJdjluYmxzNnNwNFBlYVR3RVMwTDV1N1B2R2hKLzBzU0V6UGlJaTNw?=
 =?utf-8?B?Z0dSdnhPVW5zejhLZ1RMNldaVXVEblBlQXZpL2orRDJhMGlLeVVzZ2Y0TkpX?=
 =?utf-8?B?MW9kSFNNNmFHM2gvQUh3RWpXcC9xWVd3eGtXSit2NmJONzFrT1VqRytVM21W?=
 =?utf-8?B?VWk1Q3dHWlRkcGZYRXZMeFFXMlFWckdJTVMzazlZdHFEOHRNYmwweGpQR2dt?=
 =?utf-8?B?ZVlqeHpmaFJnU2RlMStQM1VnNzg3M2YvS29jM0t6VTFUSENaamQ3YzdQUjM3?=
 =?utf-8?B?UFdlZFRJNnh4YUZkYm0yUUFBNEsvZXdJL0hSaTkwb1o5cFhKUDJpYmIzWStx?=
 =?utf-8?B?S2tRRHY5VmpFUTJVMTlhQ1pMRlRzZVRuUVNaTDRsU2dzWVI4NkpSbXgzSDNV?=
 =?utf-8?B?N3RFKzh2eG5qVXB5NFNobytKOTAxMndXMVY5L3poRFl5Q0RJakh3cWFwSGQz?=
 =?utf-8?B?ZGNlL3RvQmU5dzVUaUNKM1AyVDRERXhlbFN1aTgwSTd2YWh5VlhadERpTVBR?=
 =?utf-8?B?T0ViV1V0NTRkQlhxMm1TdUh4ZXUwek9FQkx2V0E0UFh6aGRvQUhvSmFVLzFn?=
 =?utf-8?B?N0p2c3EzOXBDd1p6YzNreUhRWDJ4NkI0cDMya2gwSFhTeU5QN2FxY2hJakNF?=
 =?utf-8?B?UWp6bnQyTklyb1YvS3hXOXkwY2k1S2N1eWVJM3U0MnExN1FDbW4vc1NqeEdy?=
 =?utf-8?B?b1BuckpsVUNnMEh4SEg0Vi9YN1FUcGM0c1YrWVpvUGt5QkljcmpmdG81TlZ4?=
 =?utf-8?B?dlBZVno2NmIvaGZMQzRUNW9vZktuMy9ucEMvcHJGMTlRMHhJUUl3UTI5MDlP?=
 =?utf-8?B?Y1Zlb1BERm43RU1DMnZYMGFERjNvZVJpUncvNExweUU0K3AySCt6LzNORm50?=
 =?utf-8?B?TGhvS1l5cHByT0NuSHJIRFVRbENqS2Zack9aK0ludWdrN2c3UDNMQ1lJNTBN?=
 =?utf-8?B?dEMxbXZURGZoOSt6ZmhPdmNiMVIyL1BWWUhXWCt6Z0kzVlB1Njl6eEZJanZI?=
 =?utf-8?B?Mk5STzhiNHNVVHJpWFJlRVp1MWlPNll3a1U4M1JCQ0JkQWZneVdHdzJBbytv?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0602D929B1A7F342A0843CA4FA2B004F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ec34e3-a240-4e66-ebcc-08dbf2d5cbae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:03.5224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vww/+lC8a1TlEoTF72cbIYT1y9XqExC3c/h9NufnURYzjLVp4D0kOePyFjXMc7b/acBK5+/+ZoZZxjDz98W2Iw1n78y13+M4VRaQAkS1guU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: NWLUW9YaROk7wzB6Wg9Jh9JOx0Yo-LuI
X-Proofpoint-GUID: NWLUW9YaROk7wzB6Wg9Jh9JOx0Yo-LuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KDQpBIGd1ZXN0IHdvdWxkIGJlIGFibGUgdG8gcmVhZCBhbmQgd3JpdGUgdGhvc2Ug
cmVnaXN0ZXJzIHdoaWNoIGFyZSBub3QNCmVtdWxhdGVkIGFuZCBoYXZlIG5vIHJlc3BlY3RpdmUg
dlBDSSBoYW5kbGVycywgc28gaXQgd2lsbCBiZSBwb3NzaWJsZQ0KZm9yIGl0IHRvIGFjY2VzcyB0
aGUgaGFyZHdhcmUgZGlyZWN0bHkuDQpJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KcmVnaXN0ZXJzIG1ha2Ugc3Vy
ZSBvbmx5IGhhcmR3YXJlIGRvbWFpbiBjYW4gYWNjZXNzIHRoZSBoYXJkd2FyZSBkaXJlY3RseQ0K
YW5kIHJlc3RyaWN0IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KDQpTdWdnZXN0ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KU2ln
bmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29t
Pg0KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
DQotLS0NClNpbmNlIHY5Og0KLSByZW1vdmVkIHN0cmF5IGZvcm1hdHRpbmcgY2hhbmdlDQotIGFk
ZGVkIFJvZ2VyJ3MgUi1iIHRhZw0KU2luY2UgdjY6DQotIGRvIG5vdCB1c2UgaXNfaHdkb20gcGFy
YW1ldGVyIGZvciB2cGNpX3tyZWFkfHdyaXRlfV9odyBhbmQgdXNlDQogIGN1cnJlbnQtPmRvbWFp
biBpbnRlcm5hbGx5DQotIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KTmV3IGluIHY2DQotLS0NCiB4
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyB8IDggKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hl
bi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQppbmRleCAwYjY5NGJlYWRmLi40ZmVjNGIyNmQ5IDEwMDY0
NA0KLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kv
dnBjaS5jDQpAQCAtMjMzLDYgKzIzMywxMCBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3
KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCiB7DQogICAgIHVpbnQzMl90IGRh
dGE7DQogDQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHJlYWQgcmVh
bCBoYXJkd2FyZS4gKi8NCisgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJlbnQtPmRv
bWFpbikgKQ0KKyAgICAgICAgcmV0dXJuIH4odWludDMyX3QpMDsNCisNCiAgICAgc3dpdGNoICgg
c2l6ZSApDQogICAgIHsNCiAgICAgY2FzZSA0Og0KQEAgLTI3Niw2ICsyODAsMTAgQEAgc3RhdGlj
IHVpbnQzMl90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
DQogc3RhdGljIHZvaWQgdnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGludCBzaXplLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgZGF0YSkNCiB7DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRv
IHdyaXRlIHJlYWwgaGFyZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihj
dXJyZW50LT5kb21haW4pICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAgc3dpdGNoICggc2l6
ZSApDQogICAgIHsNCiAgICAgY2FzZSA0Og0KLS0gDQoyLjQyLjANCg==

