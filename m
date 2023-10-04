Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827F7B8650
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 19:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612707.952767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5Wo-0002Ua-Dj; Wed, 04 Oct 2023 17:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612707.952767; Wed, 04 Oct 2023 17:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo5Wo-0002RR-Ac; Wed, 04 Oct 2023 17:19:18 +0000
Received: by outflank-mailman (input) for mailman id 612707;
 Wed, 04 Oct 2023 17:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lT9A=FS=epam.com=prvs=4641b3489e=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qo5Wn-0002RH-64
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 17:19:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f1e642-62da-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 19:19:15 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 394Dv7Pq021682; Wed, 4 Oct 2023 17:18:46 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3th6f2hvwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 17:18:46 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB9437.eurprd03.prod.outlook.com (2603:10a6:20b:5a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 4 Oct
 2023 17:18:42 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::ac2a:7470:c441:365c]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::ac2a:7470:c441:365c%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 17:18:42 +0000
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
X-Inumbo-ID: 22f1e642-62da-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjIB0teCLGGM+xXCkjmEEpPPVS/sy/eLoHWFPXlwRgxjtc/5b7iy1u7Zi8uD9TzzLq+gG2hkynQFaDg/oB/bN4BbsNFomRfp1CpKCWY+2VZYmZ+kqTIggzzakpRCZiB+PSwUB2zKNJmlQgBg2QvKi/d3S+0W2R+KvTnZikzib6F4IpS8eoA5ns+dquvgmNM9qn+Rk8qGGQnEwpWpIW0U6pMy5q3f8JfIm/VawzokGMdSESaxhlzE+VedyBcl2X5gIt2YadN7RvSg/+hV2V1rJJsKvKG0oAfYavnO/o77pZA+bT/g2zhycwrlGUebxD5Dx8/myvjtvHTsFzHF3TJaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm3I36RDY0zfDwhCiXvT/6o0lRf1GQ4jDZbzk1FPHl8=;
 b=NZHLWnsHDnK3p+M9SJU8lMlewehpyx86U/q6XDBaLw4tT3gF+yJth6hiNfnjKdFyh1vf/ve5uloufqtcAjxgGv+RFM8IKOfAyHl3/Fyl/JGNeAdH2Vtkzs5zeC+V5CT0x4F4YgKRCzA3WcDKiamhYO9NAaq57EXfbkC/PjY4kYreMnl6AMQXSn7EG68dXpfq+yzbUHjK6TH9CnO819SGOzxwn31DtlNn9fsem5ywfVpNA1fj3WUukMclKMNmMka2+xtx8tukaXhGO/jGdQstJ5+YpQuo3hjjENpGrUPePQFde3Hk1KZ1oMuXVB2xn8qG+AkuChQvdlPOohukKjomcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm3I36RDY0zfDwhCiXvT/6o0lRf1GQ4jDZbzk1FPHl8=;
 b=StxgVvrJVALK73+BRrO+1bdbGoOPAHd1D0OiZpskzD2xWQEwybAUZLyMhb4Z8AQy2TWsCMKGOWz4SkWE0k1K8PdMtZE3NZt8rHztQFfJA+5CFZlsuxR6kjoFLTqdb20D0FnnOUh2FfBUk8+5lu1h2Yjp5dc6EvemosEfiwoqLbnkfAMuKSzRQIkCDsbqZhAD3gNF0OGIXBlfN6CRuXyaCB8FgjNjNd2KlBlv7OLeVQQBotgggxJalhWmIuCekwDVWlmTQr9faXokq+OdqUKCx6HDEjKSxFRB5gmLQSa4ylYnaG2JJnIFE0YtvjicB2c6zQcuJhrW98zucIXeatqWqw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Thread-Topic: Issue with shared information page on Xen/ARM 4.17
Thread-Index: 
 AQHZ9dNZbcd5CVq6q0CaRs8d4dlf/7A4cSiAgADYhwCAAC0hgIAADTmAgAAVaACAAEiNAA==
Date: Wed, 4 Oct 2023 17:18:42 +0000
Message-ID: <afbf0662-1191-49bb-b4a7-933d360c6079@epam.com>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger> <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <aaf14d06-4e29-4de0-8e56-ff200f21b692@epam.com>
 <ZR1hliaiprDqCjyQ@MacBookPdeRoger>
In-Reply-To: <ZR1hliaiprDqCjyQ@MacBookPdeRoger>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS8PR03MB9437:EE_
x-ms-office365-filtering-correlation-id: 5306e2f9-1efb-439e-0008-08dbc4fdf55b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1CyzGPuIBKcpkBjD0sd+tV7VdI28VcvAXCRDQLNItK9rBQE2XsEV/17I4aMajyjZKFj7z7cbajdzU5uFKhZJa2AoW5XbpAhiwdB1SH+dYzuvBsDAiL3lQHaCu4TMsx8rGK6ICgcgFS1G1WithKzrOmUZvTezjNzqdnrfcdObWgFDCW3rNVLfCTUQ123yWkKxLUmgdZ18FS5qsK/mcbOEcJh94IbF2GRMC4x70rGVJGwVTB+s6xNCjil34QtcBbThPok9Pfa8HwqFjiSWKPmRsuw9uZx6h2KxUS6rLZ7+docYzr3dw3P5XSqDvLqY6lX7K4T/ocUknsHxO35DaUQZltDpgrCDnmtiAYGLVBynsTM83vwGfT63lMBZaKDilD0izZhJzjlt2N+t+sJPgbVbrnleiZ3iDZDPMxx/2E6/vj5dms9f/mM548dgxTQm8iXsR/z+TGNs829sV29qrLQaF6VmhWbpbTc9a244E4pL9PRORVHyRYdbSZCXen+FYWQu+MgY4/9gPkgQs8X/UjG+W/RcS6ig8Nyd6OIMfR904wvnG5saOPVVcRsaQkDA9v+Zak/9O6clQ47ByXYqieEfr5ZvmS2A7liSlpDWfwgKG32KLcg4bJ5CWWHoAH2hiOKfpScOzSknU0AZVuQKxeItZw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6512007)(2616005)(6506007)(38100700002)(71200400001)(478600001)(38070700005)(53546011)(4326008)(66556008)(66446008)(66946007)(8936002)(41300700001)(5660300002)(83380400001)(26005)(86362001)(8676002)(76116006)(64756008)(66476007)(91956017)(316002)(54906003)(31696002)(6916009)(107886003)(36756003)(122000001)(2906002)(6486002)(66899024)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QjVtcll0dU5LNGJQRXhydnZTTUZ1VnNpMVBtenNETUJiVTlWL2hjNzJxNFpW?=
 =?utf-8?B?KytIVGtxMTJNeXNHSGtJVVlxQVJTbUlIb1htWjZRUklROEovZm9XekZxZWF1?=
 =?utf-8?B?Z1NjMjg3Y3FRTjdpOCtacWsrd2JoV1ZXcWdrVnBQcWxXUDRPcVdYN0JNeGlj?=
 =?utf-8?B?eVdaRHdRWGcrVWVteGZOa0xDV1E2UGJXbzZib0ZrOFdBeFIrYWFDam1FUU5I?=
 =?utf-8?B?QWZSeU9jNmp3Vk0zSEQ1TTNyRkNnSU85aUV2bklORGpLL3lUMXNSMzZYV1hJ?=
 =?utf-8?B?MVR0a1FkRmpDb3lQRHIwL0MvMDNTVDhuMmN0NXB0NGx0SDF5d1E5dDhmcS94?=
 =?utf-8?B?ek5CelpweERlSlI4b1lOWUxUTjBEUFl2Q0hZeW44TTlBV3hETmpYMUpQNUI4?=
 =?utf-8?B?NEZKN1NuVGRmaG1mUEZKdEtIeEZZRENWY0FNc1g0Z0cyOVNWR1g3S3ZNU0JI?=
 =?utf-8?B?TzNnQjFpZHZTM3RTL3dSRGxGVXNnUFYzVXhRTy9Cc1d2dU1qZEpOQXhKVy9s?=
 =?utf-8?B?cmtQWWhvSFFIZmFRVDBQVUFGUDd2eVRFTWJ2eXpDMnMyVlphOWxXS2F3ZWVs?=
 =?utf-8?B?TmFrTFJ0WFpTTWhZbkJ6dDNncGFBbmV6MWUwVTVXc2owUGlrWjRkMXhxRE4x?=
 =?utf-8?B?K1JaeGwvQU5xLzlobVlicWIyYVhURlhQSXZaTFc3dGlKZng4NzVaZzVZWHBl?=
 =?utf-8?B?L2VxVndDU2REcUZtUE9MOGJMVnJLRExyWlJ3cm1QTEpVbE1Ud3FvZkNhZVZH?=
 =?utf-8?B?M3QvR2xtbXpiUnFxNmt4cEdodVpmRnVsak5qZzk1bFJvNDFnaXVoeWNJV2Vz?=
 =?utf-8?B?cExNWlVlVnZIR1J3ZGsxQU1xam4yN2g3SHlCWjdrVWxjWHVIQ2piZzdyT3dj?=
 =?utf-8?B?MUNpMGtoWXV2SGJwTXJ3ODA5VTFpWEZMSHhXeVU4eno2NVo3Z1JGWnVvbmpm?=
 =?utf-8?B?V2RHS1hHSXU5elN3bDl1b1R6TXdycEl3d0djK3RQY2I4RHE4c01jKzY0azZp?=
 =?utf-8?B?amgwY1lIYnBvaVFDTjVlTjNRcERiNnpzdmN6MW1BWE5XOGdUd0RZLyt3K0kx?=
 =?utf-8?B?eXp2Q0tGLzdBL3hKTzlyNUIxU0d0TWovMlNSclNwWHg5bEhxTVJwUEoyYlBB?=
 =?utf-8?B?OHR6T3labDVPK3dIUmNQeTV3anRHNERyVERwclJWMzY5MWovOGVqSFNCdC9C?=
 =?utf-8?B?QTFpL1hyeXdjRDh4VkVNam5Ea0IyN0ZWTlNMdk5CVzlJSHF2ZUIydDNmVk1p?=
 =?utf-8?B?dnd4WVFHYXVyMi9LR3BJVGFHUFNTaWpwazBwUjlvYVlabmtSZS9qRTZtVVVr?=
 =?utf-8?B?OC9ZL0dNeDV2K1hPSkViRDFsRUR4UDEvWkxRamxQcjlpS3BGdmNBRHluUjFT?=
 =?utf-8?B?MXdsY0IwMWM4THhoTS94c1VadTh2TEJjUEJWS0s5c2hOZlB5RGxkaGhSWUpK?=
 =?utf-8?B?ck1qTGxBajVWUndPZFFaUk9wTi9GSjNTaFhwV2lzQmJxc3hOS2tuZ2JWK3dZ?=
 =?utf-8?B?bE4rU004STVDU2Z3eTZXaVFvOW8zdU1Pckx5cVQvMFRwcTNtajE2UXdUOUlI?=
 =?utf-8?B?elgwcnR4SllRY3NqaFZxOHVMS0pRaDZab2FSSUZoNzk3VEJPd09vVTRvRHNK?=
 =?utf-8?B?cTFoQ0VNWG9hR01KR08wVU5vVFpEdWd1Nk5BeXFGdDl1dDJESERKcjZQaHIy?=
 =?utf-8?B?dW9Ucmwzc1k2NW5XWHV6djVJYWVyVzlzU3l2dVhJOEdvRE1FSkU3N2MxK1Ny?=
 =?utf-8?B?eW5CMmRJNUM5amFZZXpYTFU0NjlkWWVYY3RQYjZpUk92SUQ3ZWdxQzVpK2Jh?=
 =?utf-8?B?R2ljYlB4aW9yeE9vL1FTdmxabE5iV1JOWHY3aEdISGVWNHJuUEI0dTN3a01B?=
 =?utf-8?B?Q3JOVVpyR2k5Q29wOWtNQjFqZFRnOVV3dzlxNFNlalZmS1VmYWZTYk4xQTND?=
 =?utf-8?B?VWRuRUdlb2ZLWGUwN2Z5VjkzamFXb3pUTzVISCtUUTJGNW1kVm9pK0cxdDBD?=
 =?utf-8?B?N0trcGJSeU9mcHF1TmZXUDQzZ1B2ekw3S0RJWmw1c0ZqTlBGMEQ2cHhiZHJX?=
 =?utf-8?B?SU0ydVlPa1lMNFp6Znk4TU9qOGZxMmF6ZTQ1UE44d29Bc0NnNE55MkNoSjlD?=
 =?utf-8?B?ekkxZHAzOGFsVHY0b2hPR29HS3U1YlRqS1IybDJVckJnVUM2V3NJdUd0dHFa?=
 =?utf-8?Q?dOrT461u18S5DYWOkf7eRCs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85A7BCF8DAA92B4FBC2064ED5B40368A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5306e2f9-1efb-439e-0008-08dbc4fdf55b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 17:18:42.4519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppkmGnqLOnznnqMHsA3AovMj9YidsUpcCEua3xuEkBzbgisM7A+CMHEF6nW3SQ8Mr5hZT7f4sk69IypfKIIM2vB1N+zoMkWeHufPr4mYgfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9437
X-Proofpoint-GUID: M4GubfrjmDuU3o7cnjxkFu2xL2BZyJnK
X-Proofpoint-ORIG-GUID: M4GubfrjmDuU3o7cnjxkFu2xL2BZyJnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_08,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040124

DQoNCk9uIDA0LjEwLjIzIDE1OjU5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KDQpIZWxsbyBS
b2dlcg0KDQoNCg0KPiBPbiBXZWQsIE9jdCAwNCwgMjAyMyBhdCAxMTo0MjozMkFNICswMDAwLCBP
bGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMDQuMTAuMjMgMTM6NTUs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+DQo+PiBIZWxsbyBhbGwuDQo+Pg0KPj4+IEhpIFJvZ2Vy
LA0KPj4+DQo+Pj4gT24gMDQvMTAvMjAyMyAwOToxMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4+Pj4gT24gVHVlLCBPY3QgMDMsIDIwMjMgYXQgMTI6MTg6MzVQTSAtMDcwMCwgRWxsaW90dCBN
aXRjaGVsbCB3cm90ZToNCj4+Pj4+IE9uIFR1ZSwgT2N0IDAzLCAyMDIzIGF0IDEwOjI2OjI4QU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gVGh1LCBTZXAgMjgsIDIw
MjMgYXQgMDc6NDk6MThQTSAtMDcwMCwgRWxsaW90dCBNaXRjaGVsbCB3cm90ZToNCj4+Pj4+Pj4g
SSdtIHRyeWluZyB0byBnZXQgRnJlZUJTRC9BUk0gb3BlcmF0aW9uYWwgb24gWGVuL0FSTS7CoCBD
dXJyZW50DQo+Pj4+Pj4+IGlzc3VlIGlzDQo+Pj4+Pj4+IHRoZSBjaGFuZ2VzIHdpdGggdGhlIGhh
bmRsaW5nIG9mIHRoZSBzaGFyZWQgaW5mb3JtYXRpb24gcGFnZSBhcHBlYXIgdG8NCj4+Pj4+Pj4g
aGF2ZSBicm9rZW4gdGhpbmdzIGZvciBtZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2l0aCBhIHByZS00
LjE3IGJ1aWxkIG9mIFhlbi9BUk0gdGhpbmdzIHdvcmtlZCBmaW5lLsKgIFlldCB3aXRoIGEgYnVp
bGQNCj4+Pj4+Pj4gb2YgdGhlIDQuMTcgcmVsZWFzZSwgbWFwcGluZyB0aGUgc2hhcmVkIGluZm9y
bWF0aW9uIHBhZ2UgZG9lc24ndCB3b3JrLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBpcyBkdWUgdG8g
NzEzMjA5NDZkNWVkZiBBRkFJQ1QuDQo+Pj4+Pg0KPj4+Pj4gWWVzLsKgIFdoaWxlIHRoZSAtRUJV
U1kgbGluZSBtYXkgYmUgdGhlIG9uZSB0cmlnZ2VyaW5nLCBJJ20gdW5zdXJlIHdoeS4NCj4+Pj4+
IFRoaXMgc2VlbXMgYSBmYWlybHkgcmVhc29uYWJsZSBjaGFuZ2UsIHNvIEkgaGFkIG5vIGludGVu
dGlvbiBvZiBhc2tpbmcNCj4+Pj4+IGZvciBhIHJldmVydCAod2hpY2ggbGlrZWx5IHdvdWxkIGhh
dmUgYmVlbiByZWplY3RlZCkuwqAgVGhlcmUgaXMgYWxzbyBhDQo+Pj4+PiByZWFsIHBvc3NpYmls
aXR5IHRoZSAtRUJVU1kgY29tZXMgZnJvbSBlbHNld2hlcmUuwqAgQ291bGQgYWxzbyBiZQ0KPj4+
Pj4gNzEzMjA5NDZkNWVkZiBjYXVzZWQgYSBidWcgZWxzZXdoZXJlIHRvIGJlIGV4cG9zZWQuDQo+
Pj4+DQo+Pj4+IEEgZ29vZCB3YXkgdG8ga25vdyB3b3VsZCBiZSB0byBhdHRlbXB0IHRvIHJldmVy
dCA3MTMyMDk0NmQ1ZWRmIGFuZCBzZWUNCj4+Pj4gaWYgdGhhdCBmaXhlcyB5b3VyIGlzc3VlLg0K
Pj4+Pg0KPj4+PiBBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gdHJ5IChvciBzaW1pbGFyKToNCj4+Pj4N
Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMN
Cj4+Pj4gaW5kZXggNmNjZmZlYWVhNTdkLi4xMDVlZjNmYWVjZmQgMTAwNjQ0DQo+Pj4+IC0tLSBh
L3hlbi9hcmNoL2FybS9tbS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+Pj4+IEBA
IC0xNDI0LDYgKzE0MjQsOCBAQCBpbnQgeGVubWVtX2FkZF90b19waHlzbWFwX29uZSgNCj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZV9zZXRfeGVuaGVhcF9nZm4o
bWZuX3RvX3BhZ2UobWZuKSwgZ2ZuKTsNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoIiV1IGFscmVhZHkgbWFwcGVkXG4iLCBzcGFj
ZSk7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIE1hbmRhdGUgdGhlIGNhbGxlciB0byBmaXJzdCB1bm1hcCB0
aGUgcGFnZSBiZWZvcmUNCj4+Pj4gbWFwcGluZyBpdA0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIGFnYWluLiBUaGlzIGlzIHRvIHByZXZlbnQgWGVuIGNyZWF0aW5nIGFuIHVu
d2FudGVkDQo+Pj4+IGhvbGUgaW4NCj4+Pj4gQEAgLTE0MzIsNiArMTQzNCw3IEBAIGludCB4ZW5t
ZW1fYWRkX3RvX3BoeXNtYXBfb25lKA0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIHRvIHVubWFwIGl0IGFmdGVyd2FyZHMuDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICovDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYyA9IC1FQlVTWTsN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBwMm1fd3Jp
dGVfdW5sb2NrKHAybSk7DQo+Pj4+ICDCoMKgwqDCoMKgIH0NCj4+Pj4NCj4+Pj4+Pj4gSSdtIHVz
aW5nIFRpYW5vY29yZSBhcyB0aGUgZmlyc3Qgc3RhZ2UgbG9hZGVyLsKgIFRoaXMgY29udGludWVz
IHRvIHdvcmsNCj4+Pj4+Pj4gZmluZS7CoCBUaGUgYnVpbGQgaXMgdXNpbmcgdGFnICJlZGsyLXN0
YWJsZTIwMjIxMSIsIGNvbW1pdCBmZmY2ZDgxMjcwLg0KPj4+Pj4+PiBXaGlsZSBUaWFub2NvcmUg
ZG9lcyBtYXAgdGhlIHNoYXJlZCBpbmZvcm1hdGlvbiBwYWdlLCBteSByZWFkaW5nIG9mDQo+Pj4+
Pj4+IHRoZWlyDQo+Pj4+Pj4+IHNvdXJjZSBpcyB0aGF0IGl0IHByb3Blcmx5IHVubWFwcyB0aGUg
cGFnZSBhbmQgdGhlcmVmb3JlIHNob3VsZG4ndA0KPj4+Pj4+PiBjYXVzZQ0KPj4+Pj4+PiB0cm91
YmxlLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBOb3RlcyBvbiB0aGUgYWN0dWFsIGNhbGwgaXMgZ3BmbiB3
YXMgMHgwMDAwMDAwMDAwMDQwMDcyLsKgIFRoaXMgaXMNCj4+Pj4+Pj4gb3V0c2lkZQ0KPj4+Pj4+
PiB0aGUgcmVjb21tZW5kZWQgYWRkcmVzcyByYW5nZSwgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMg
dGhpcyBpcw0KPj4+Pj4+PiBzdXBwb3NlZA0KPj4+Pj4+PiB0byBiZSBva2F5Lg0KPj4+Pj4+Pg0K
Pj4+Pj4+PiBUaGUgcmV0dXJuIGNvZGUgaXMgLTE2LCB3aGljaCBpcyBFQlVTWS4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gSWRlYXM/DQo+Pj4+Pj4NCj4+Pj4+PiBJIHRoaW5rIHRoZSBpc3N1ZSBpcyB0aGF0
IHlvdSBhcmUgbWFwcGluZyB0aGUgc2hhcmVkIGluZm8gcGFnZSBvdmVyIGENCj4+Pj4+PiBndWVz
dCBSQU0gcGFnZSwgYW5kIGluIG9yZGVyIHRvIGRvIHRoYXQgeW91IHdvdWxkIGZpc3QgbmVlZCB0
byBjcmVhdGUNCj4+Pj4+PiBhIGhvbGUgYW5kIHRoZW4gbWFwIHRoZSBzaGFyZWQgaW5mbyBwYWdl
LsKgIElPVzogdGhlIGlzc3VlIGlzIG5vdCB3aXRoDQo+Pj4+Pj4gZWRrMiBub3QgaGF2aW5nIHVu
bWFwcGVkIHRoZSBwYWdlLCBidXQgd2l0aCBGcmVlQlNEIHRyeWluZyB0byBtYXAgdGhlDQo+Pj4+
Pj4gc2hhcmVkX2luZm8gb3ZlciBhIFJBTSBwYWdlIGluc3RlYWQgb2YgYSBob2xlIGluIHRoZSBw
Mm0uwqAgeDg2DQo+Pj4+Pj4gYmVoYXZpb3IgaXMgZGlmZmVyZW50IGhlcmUsIGFuZCBkb2VzIGFs
bG93IG1hcHBpbmcgdGhlIHNoYXJlZF9pbmZvDQo+Pj4+Pj4gcGFnZSBvdmVyIGEgUkFNIGdmbiAo
YnkgZmlyc3QgcmVtb3ZpbmcgdGhlIGJhY2tpbmcgUkFNIHBhZ2Ugb24gdGhlDQo+Pj4+Pj4gZ2Zu
KS4NCj4+Pj4+DQo+Pj4+PiBBbiBpbnRlcmVzdGluZyB0aG91Z2h0LsKgIEkgdGhvdWdodCBJJ2Qg
dHJpZWQgdGhpcywgYnV0IHNpbmNlIEkgZGlkbid0DQo+Pj4+PiBzZWUNCj4+Pj4+IHN1Y2ggaW4g
bXkgZXhwZXJpbWVudHMgbGlzdC7CoCBXaGF0IEkgaGFkIHRyaWVkIHdhcyByZW1vdmluZyBhbGwg
dGhlDQo+Pj4+PiBwYWdlcw0KPj4+Pj4gaW4gdGhlIHN1Z2dlc3RlZCBtYXBwaW5nIHJhbmdlLsKg
IFlldCB0aGlzIGZhaWxlZC4NCj4+Pj4NCj4+Pj4gWWVhaCwgSSB3ZW50IHRvbyBmYXN0IGFuZCBk
aWRuJ3QgcmVhZCB0aGUgY29kZSBjb3JyZWN0bHksIGl0IGlzIG5vdA0KPj4+PiBjaGVja2luZyB0
aGF0IHRoZSBwcm92aWRlZCBnZm4gaXMgYWxyZWFkeSBwb3B1bGF0ZWQsIGJ1dCB3aGV0aGVyIHRo
ZQ0KPj4+PiBtZm4gaW50ZW5kZWQgdG8gYmUgbWFwcGVkIGlzIGFscmVhZHkgbWFwcGVkIGF0IGEg
ZGlmZmVyZW50IGxvY2F0aW9uLg0KPj4+Pg0KPj4+Pj4gU2luY2UgdGhpcyBzZWVtZWQgcmVhc29u
YWJsZSwgSSd2ZSBub3cgdHJpZWQgYW5kIGZvdW5kIGl0IGZhaWxzLsKgIFRoZQ0KPj4+Pj4gWEVO
TUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAgY2FsbCByZXR1cm5zIDAuDQo+Pj4+DQo+Pj4+IFhFTk1F
TV9yZW1vdmVfZnJvbV9waHlzbWFwIHJldHVybmluZyAwIGlzIGZpbmUsIGJ1dCBpdCBzZWVtcyB0
byBtZQ0KPj4+PiBsaWtlIGVkazIgaGFzbid0IHVubWFwcGVkIHRoZSBzaGFyZWRfaW5mbyBwYWdl
LsKgIFRoZSBPUyBoYXMgbm8gaWRlYQ0KPj4+PiBhdCB3aGljaCBwb3NpdGlvbiB0aGUgc2hhcmVk
X2luZm8gcGFnZSBpcyBjdXJyZW50bHkgbWFwcGVkLCBhbmQgaGVuY2UNCj4+Pj4gY2FuJ3QgZG8g
YW55dGhpbmcgdG8gYXR0ZW1wdCB0byB1bm1hcCBpdCBpbiBvcmRlciB0byBjb3ZlciB1cCBmb3IN
Cj4+Pj4gYnVnZ3kgZmlybXdhcmUuDQo+Pj4+DQo+Pj4+IGVkazIgc2hvdWxkIGJlIHRoZSBlbnRp
dHkgdG8gaXNzdWUgdGhlIFhFTk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwDQo+Pj4+IGFnYWluc3Qg
dGhlIGdmbiB3aGVyZSBpdCBoYXMgdGhlIHNoYXJlZF9pbmZvIHBhZ2UgbWFwcGVkLsKgIExpa2Vs
eQ0KPj4+PiBuZWVkcyB0byBiZSBkb25lIGFzIHBhcnQgb2YgRXhpdEJvb3RTZXJ2aWNlcygpIG1l
dGhvZC4NCj4+Pj4NCj4+Pj4gRldJVywgNzEzMjA5NDZkNWVkZiBpcyBhbiBBQkkgY2hhbmdlLCBh
bmQgYXMgZGVzaXJhYmxlIGFzIHN1Y2gNCj4+Pj4gYmVoYXZpb3IgbWlnaHQgYmUsIGEgbmV3IGh5
cGVyY2FsbCBzaG91bGQgaGF2ZSBpbnRyb2R1Y2VkIHRoYXQgaGFkIHRoZQ0KPj4+PiBiZWhhdmlv
ciB0aGF0IHRoZSBjaGFuZ2UgaW50ZW5kZWQgdG8gcmV0cm9maXQgaW50bw0KPj4+PiBYRU5NRU1f
YWRkX3RvX3BoeXNtYXAuDQo+Pj4gSSBjYW4gc2VlIGhvdyB5b3UgdGhpbmsgdGhpcyBpcyBhbiBB
QkkgY2hhbmdlIGJ1dCB0aGUgcHJldmlvdXMgYmVoYXZpb3INCj4+PiB3YXMgaW5jb3JyZWN0LiBC
ZWZvcmUgdGhpcyBwYXRjaCwgb24gQXJtLCB3ZSB3b3VsZCBhbGxvdyB0aGUgc2hhcmVkIHBhZ2UN
Cj4+PiB0byBiZSBtYXBwZWQgdHdpY2UuIEFzIHdlIGRvbid0IGtub3cgd2hlcmUgdGhlIGZpcm13
YXJlIGhhZCBtYXBwZWQgaXQNCj4+PiB0aGlzIGNvdWxkIHJlc3VsdCB0byByYW5kb20gY29ycnVw
dGlvbi4NCj4+Pg0KPj4+IE5vdywgd2UgY291bGQgc3VyZWx5IGRlY2lkZSB0byByZW1vdmUgdGhl
IHBhZ2UgYXMgeDg2IGRpZC4gQnV0IHRoaXMNCj4+PiBjb3VsZCBsZWF2ZSBhIGhvbGUgaW4gdGhl
IFJBTS4gQXMgdGhlIE9TIHdvdWxkIG5vdCBrbm93IHdoZXJlIHRoZSBob2xlDQo+Pj4gaXMsIHRo
aXMgY291bGQgbGVhZCB0byBwYWdlIGZhdWx0IHJhbmRvbWx5IGR1cmluZyBydW50aW1lLg0KPj4N
Cj4+DQo+PiArMS4NCj4+DQo+PiBJbiBhZGRpdGlvbiB0byB3aGF0IEp1bGllbiBoYXMgYWxyZWFk
eSBzYWlkLCBJIHdvdWxkIGxpa2UgdG8gc2F5IHRoZQ0KPj4gc2FtZSBpc3N1ZSB3YXMgZmFjZWQg
ZHVlIHRvIFUtQm9vdCAocnVubmluZyBhcyBhIHBhcnQgb2YgWGVuIGd1ZXN0DQo+PiBiZWZvcmUg
T1MpIGRpZG4ndCBwZXJmb3JtIGEgY2xlYW51cCBiZWZvcmUganVtcGluZyB0byBPUy4gVGhpcyBp
cw0KPj4gYWxyZWFkeSBmaXhlZCB0byBmb2xsb3cgdGhlIGN1cnJlbnQgYmVoYXZpb3IuIEkgZGlk
bid0IGZpbmQNCj4+IGNvcnJlc3BvbmRpbmcgVS1Cb290IG1haWwgdGhyZWFkLCBidXQgY2FuIHBv
aW50IHRvIGFscmVhZHkgdXBzdHJlYW1lZA0KPj4gY29tbWl0IGluIHRoZSBtYWluIHJlcG8uDQo+
IA0KPiBXaGF0IGFib3V0IG90aGVyIGJvb3Rsb2FkZXJzPw0KPiANCj4gVGhlcmUgbWlnaHQgYmUg
b3RoZXIgbG9hZGVycyB0aGF0IGRpZG4ndCB1bm1hcCBzaGFyZWRfaW5mbyBlaXRoZXIsIGJ1dA0K
PiB0aGF0IHJlbW92ZWQgdGhlIHBhZ2Ugd2hlcmUgdGhlIHNoYXJlZF9pbmZvIGlzIG1hcHBlZCBm
cm9tIHRoZQ0KPiByZXBvcnRlZCBSQU0gcmFuZ2VzIHRvIHRoZSBndWVzdC4gIEluIHN1Y2ggY2Fz
ZSBub3QgZG9pbmcgdGhlDQo+IHVubWFwcGluZyB3YXMgYmVuaWduLCBhcyB0aGUgZ3Vlc3Qgd291
bGQgbmV2ZXIgdXNlIHRoYXQgZ2ZuIGFzIFJBTQ0KPiBhbnl3YXkuDQoNCkkgZ290IHlvdXIgcG9p
bnQsIHRoaXMgd2F5LCBJIGFncmVlLCBub3QgZG9pbmcgdGhlDQp1bm1hcHBpbmcgd291bGRuJ3Qg
YmUgYSBiaWcgcHJvYmxlbS4gSSBhbSB3b25kZXJpbmcgd2hldGhlciBzdWNoIA0KYm9vdGxvYWRl
cnMgdGhhdCBpbnN0ZWFkIG9mIHVubWFwcGluZyBpbmRlZWQgaGlkaW5nL3Jlc2VydmluZyB0aGUg
Z2ZuIA0KKHdoZXJlIHNoYXJlZF9pbmZvIGlzIG1hcHBlZCB0bykgYXJlIHJlYWxseSBwcmVzZW50
IGluIHRoZSB3b3JsZCAoQXJtKT8gDQpQYXRjaCB3YXMgbWVyZ2VkIG1vcmUgdGhhbiAxIHllYXIg
YWdvLCBhbmQgdGhlIGlzc3VlIGhhc24ndCBiZWVuIG5vdGljZWQgDQp1bnRpbCBub3cgd2l0aCBF
REsyLiBMZXQncyB3YWl0IGZvciB0aGUgYWRkaXRpb24gaW5wdXQgb24gaG93IHRoZSBFREsyIA0K
aXMgcmVhbGx5IGRlYWxpbmcgd2l0aCBzaGFyZWRfaW5mby4NCg0KDQo+IA0KPiBUaGFua3MsIFJv
Z2VyLg==

