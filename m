Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16F8471F3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 15:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675065.1050234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVua4-0007iz-5z; Fri, 02 Feb 2024 14:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675065.1050234; Fri, 02 Feb 2024 14:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVua4-0007g8-2I; Fri, 02 Feb 2024 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 675065;
 Fri, 02 Feb 2024 14:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tPbJ=JL=epam.com=prvs=8762cb4b7f=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rVua2-0007g2-FW
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 14:31:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9856b6c-c1d7-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 15:31:44 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412DAtNn002337; Fri, 2 Feb 2024 14:31:41 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3w1126r7wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 14:31:40 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB7842.eurprd03.prod.outlook.com (2603:10a6:20b:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 14:31:37 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 14:31:37 +0000
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
X-Inumbo-ID: c9856b6c-c1d7-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9AREyWShnAijfjFnLr86in0QK3cFn8L8Rb4Mrgv0wXgftdHoKdfCVLrjPYFqCekSKawO7J1qY40YlXiG/bu6MVyfTdjYfF2TQvvsuoumT2V/vYaS0p3SwH6H0QkfoUkJJda8W1cVWd3x7m4rSyDCTB0JKqfKDimL/CvN8NICV9D75Ylazolgd8ep9ovxJxJFr8QLX/6IHfyXx0ANHfdT91rXUPF+gdp3TXLGZgnwvYc1WtsqDs/4fW1NQRHENELyrdbZVcooexpotKmV+FghpH4VzU/EkwCsr+cpWLsZkxp+nsisZgnt8G73vc3ie70kRtN6C6h1grSPEFexscyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG/j2KF9G6OvLae5GXWX3zztvjbeOfZVwZa2+PowQ44=;
 b=UGFn9KtHBxZV+wgRmq7qhx0jMxNE9Mv7jhOJRWSb3hhyBEUDykJmqTtwnALjrTbzI/nveHN3BCpoT+zkfg7bpKf3LxdPwsIxOmUGyS9a9i5iqYLvlq+w6hU//wErhio5WWiSml9/QtJMfQwTXKxYls0Vf+IecYMR1/7BUDj5rWJmASpXp+ZxrtwmYcHqgRkGKEwPtHKKfX7IEVVTZEWEfqUd2sSjOkDl1paJwxAccXayE8lFHZ6WrBtaUTo+zjDKoqGt3wfRQZvgNlFYf9BKW1WPGhAFOmV8yFLGCfUm5HuX9pbyWwF20H968kri4JB/OAvI17Zo9YMzT8aZ5g051A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG/j2KF9G6OvLae5GXWX3zztvjbeOfZVwZa2+PowQ44=;
 b=WAOPYJunZYc2ZOkqGo0LzYtZFDlTe0DCMjLDN1hXZ2uf4yO+HIttjMdXFIIv//8f1W7iN5QT0/UcOFBjjCrhnlVMoMh4KB40JQadL72LYTQbuwFw1U6+EotWb86pPMurzw0KXH/OvzcoToEgJHqg6qHhM2/swwdJzHyjhaEjMe078YTr4uzH3Bia9LqPaDAhyvkZwmAp1S7B/EyBTiXiEyvl7GuYq8orzHbx11CUBUpJaM97MS0PYv90qveDb2iof5TzIaiMRKGBUuHH+CHuaFwLMgK2uxgjzVDFkQLsAxeh+5IbLzLZgnkEXA138RyohkZ5N9iBc4SN/JthatLKAg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Topic: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Index: AQHaVcWXJV0m8uwkbEKeSgAhd5N6SLD240wAgAA6LgA=
Date: Fri, 2 Feb 2024 14:31:37 +0000
Message-ID: <ea2fac26-6c14-4df0-9bb9-e311deb32832@epam.com>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
 <20240202110316.hfzwseow7uhdgtsz@vireshk-i7>
In-Reply-To: <20240202110316.hfzwseow7uhdgtsz@vireshk-i7>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS8PR03MB7842:EE_
x-ms-office365-filtering-correlation-id: b0f813ed-ee05-48ce-1950-08dc23fbaa0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1SNLGnuOtFINIy8UTz+BGAbg/xYWn1pfpXDPO/Jyaji5pqS5rFJClmIoLqY3de46qtqCXfMZz9Jo2zMbW4ZfLWrK4vWw5hA5S65HtGl74XP8vLwJBCxqSvZUAIl9pcVZhwbQu8ITuV7rXtKyi4Oz3NUEumTYnfxekW+ehUykZUM5tnTm95IzMNxCSx7hKBDZj7cSTJ4ssnmxk135GfFi5YfR08+T80GMIUu0jhfuQ/3XvThNtmm5tmjOPwe5hZmJRssYUVaAtR65MtAU7BMBVyyMbAWWzHxe9lCLQkp3k7/0bgkcZHRIiR1C2SmsaDZAQv/XDLSNQ+yL7Gqrp0xvlUAlFs4E4PhQOKQK2XkEPNvrolg1SN8byxR/mEP9b08E9sVnLz17i01hVV87KrBccdSfALh2H+BE97+sFW1PxemMAMBB4wGemgNFoqvTgseb1xjJhVyQX20oPRnKGdpzxVHdFaT5vlnGG+dY07e4m5vQplIDUvZSOHf9VnVJDpjQVeurBV280numcc78PD6tv82NWCC84ToD3TZpxZCR34+ebd1FzWuctPmsE1usTxJuWV01jUDbRgopIZGhn3nx1AB120bCczlHy9SITkPn14GfyxyK980WJD7ZqFSjXI1mgGCP+d3cI0Mv7jnvalLYZA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2616005)(6512007)(38100700002)(26005)(6506007)(122000001)(4326008)(64756008)(8936002)(66946007)(5660300002)(8676002)(55236004)(76116006)(2906002)(54906003)(53546011)(478600001)(71200400001)(316002)(66556008)(66476007)(66446008)(6486002)(110136005)(38070700009)(86362001)(36756003)(41300700001)(31696002)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3A3OWNSRXRMVldLUGdWNVRYdzQzNXZzUmtIcUdTMnMwRzRKbVNNaEU3UTFX?=
 =?utf-8?B?M09OdnJsNnE5Q3VwMnhab0dIdHZYTXdWNVQ3eVlWbzFrNFZFb2ZaUjVYSHN4?=
 =?utf-8?B?cmhvLzRMVjJGQWdzbTNJbHNieWtXRkx2bm1LRkE1MGxmbjF3YlptbkdpcFRC?=
 =?utf-8?B?Rk1JZWYveGhxV2JHOVhERmpLcGlsRFRnY0JkenJMNzI0L1ZHZm1YVlQ1a0Q5?=
 =?utf-8?B?U0pXN3hIaE5pcGdmK1JkNEZKekxNekY1SGZSQ1dVRzVJd1NFbFN2c3dnMmFr?=
 =?utf-8?B?b2FIYjVWRFh3M2hpNFFQYklMNzFZQmpYNjJPVjZpUHpZYjhUYitpYTRoVW5Y?=
 =?utf-8?B?eExXaXU0WHozRTl5UjIxY3pURW00cjBCSGR5VGJnQ3J2a3ZaekRvNmFJRG4r?=
 =?utf-8?B?NVdaQWFXMXBrZTJ6N3FPT0pKVDhMTzJJby9rQkhuSGQ2UURXdkJZUndzblhS?=
 =?utf-8?B?WGlINDJuT0tKaEdqWXhaRGJuNElONHIvQUxQOXIwK0dFajNucXMzcURBNURT?=
 =?utf-8?B?OUxad2lOTkZNZUIxNDBzQ0UvZy9sMVplcE5xQ2VESXcwb1dGenpscTRKekpl?=
 =?utf-8?B?dDlJdGRXaXpEVHBEVS9nN3Z0TGRMNGtIbmVVL1k1RnZka00ySXMzMGl1NzhF?=
 =?utf-8?B?UVdlUXVnUC9VU2UwZEd4NGZlYmhYdlZmdUp5NlNIaWFqUmdBamtmU0hjcTZH?=
 =?utf-8?B?M3U0U2lNb243RXQvdzhObXlJQnZkaWlHWVJYVjVIRmpKc3U5ZzZ5anV2UzB5?=
 =?utf-8?B?S2hHbk16c212L1dDci9ldU80RGM5SVFBOUdiMzFJTURFQWUxem1yTkZxVXJ5?=
 =?utf-8?B?L0Q0MFhlV0hiVWlIWjFvZTI5U21ONDh0b003K0piV0wyTkJyLzZvVSszVGxX?=
 =?utf-8?B?dlhYakUzOGVYcWRJMEFPcS9LUHFVY1duQ1I3UzhuNU1zYnNMZmg4eVFKSmh5?=
 =?utf-8?B?dFp6QUdlVTBoV3FoaE5jOTF3WUREK04vc3RiU0ZFdDVkcjFMdXB0L0tFaXdG?=
 =?utf-8?B?eU44UlNuWWltV0ptTFA2Vjd3YUtoSHFtWFFoaEFaTnJjZ3dWbWQvOTk5YlZn?=
 =?utf-8?B?RVlxQ2YwT2QxQm5yRTJoWjdBck9RRFF6TFoxcTJJb0x1M2tiaFZiMDZHTUoy?=
 =?utf-8?B?MktWczlXVEFXN1N0cW45eVZjOThMdFZnQWRVKzZueklKL0VrK29rODVzR1dq?=
 =?utf-8?B?dzk5Ti90VXBpK21RM0EzVzRySk8zWjZWRnNmRHB4Y29GMzhVWkVZS3l2cmNw?=
 =?utf-8?B?LzFCRmx1c29uY0hFbHJjTzM2QmsvVlQrQStPUTd2TWJHcUF4Sm1oaHgyVVV6?=
 =?utf-8?B?L25jY2ErK1FxR1hkclAyUEZXMFNaTmVaSmt1U04wZ1NrRUpYNm1CbTZ4VEJo?=
 =?utf-8?B?MEE1T1JUcS9oRzRiNk53Z3U2dGU2RktwMEtRYWlRM1BCLzJtMkJ4cEFQVzBC?=
 =?utf-8?B?V0J6dUVmMm9jS3V3WitGaTdZTjRHRzdOSkFVT2E2Q0NUT1E1bkJhd2N0aGxa?=
 =?utf-8?B?ZHV6SSt2NVBoTlRWWjQwZDRuZmw2TCtMTmtJdzJSVEVRM2tMbHdqRCs3b1dw?=
 =?utf-8?B?TG44WHIveE1hWUNXL0lucU5aOVdUQ1JCU3gyMzFxYTJZanJPMnNzRlllUzZC?=
 =?utf-8?B?RmhHWkpCV0RHdG9vWVB0WXpGZ1VPNjhCMklOUEVNOFVmNDlGOWFySHBNSm5u?=
 =?utf-8?B?OWM0OFF3ZnMwZ04yZzd2T1ZkOXptdjVXYk9HQy9RUmtOcHNCMHpkRFd5cHRQ?=
 =?utf-8?B?dnhSbjlwSjdwVEJ6clIyUFF3VkZKc2d0TmFVRWQzL1pSYmtWcHlBUEtsUHlm?=
 =?utf-8?B?cUVIT2VRS3FJb0Y1T1lpYlJCd3I5VS9yR3hIWW1GcFZkK2pxNk51QUlwYzNv?=
 =?utf-8?B?SkVUaTZwU2RiWTBTa0wwQ2pVUE1qMEJiM1hxSDBLMjIwa3p4WFFZQlZFSEZr?=
 =?utf-8?B?NkpETUM4UHRwZENwODVrbzdiYTV6c01ZdDQ0dENwMmJzR1duTTIwOEMxSjBj?=
 =?utf-8?B?aVU4ZHRvcUEzV3VodmY3Y0lPMWVMbVR0NUZBbGdYcFM5eENtVmhJTjc4V0VK?=
 =?utf-8?B?YjVxZmh2WHJncjhpU2J2dWpoMW9IK2JnY0RQOU9DSWNOV2dLb1ZvU0h5RDFH?=
 =?utf-8?B?L25KY3JjVDlkdGViWStUczJtNkhhSkJTWThRVWlialNEdjZpRDVlSS8xWjJL?=
 =?utf-8?Q?8F6vosj6GzOyAMV2Uo+npzM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DE9435BF3074A42B8AE214B2290FA88@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f813ed-ee05-48ce-1950-08dc23fbaa0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 14:31:37.6200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNFuznfAL926AXXLw0JGAtccL7r06pHOZqc/0laWsGa4oAuu8R5OMJOdalPUMiin5mE3nbKkxKns0GqfhOqAyKni+9nXnvrnqU0nsOmpBsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7842
X-Proofpoint-GUID: Bbs9mBJR-SQow6WojRApXF-CkidJ65Ax
X-Proofpoint-ORIG-GUID: Bbs9mBJR-SQow6WojRApXF-CkidJ65Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_08,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020106

DQoNCk9uIDAyLjAyLjI0IDEzOjAzLCBWaXJlc2ggS3VtYXIgd3JvdGU6DQoNCkhlbGxvIFZpcmVz
aA0KDQoNCj4gT24gMDItMDItMjQsIDEyOjQ5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToN
Cj4+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QuaW4g
Yi9kb2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QuaW4NCj4+IGluZGV4IGJjOTQ1
Y2M1MTcuLjNjMDM1NDU2ZDUgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21hbi94bC1kaXNrLWNvbmZp
Z3VyYXRpb24uNS5wb2QuaW4NCj4+ICsrKyBiL2RvY3MvbWFuL3hsLWRpc2stY29uZmlndXJhdGlv
bi41LnBvZC5pbg0KPj4gQEAgLTQwNCw2ICs0MDQsMzEgQEAgVmlydGlvIGZyb250ZW5kIGRyaXZl
ciAodmlydGlvLWJsaykgdG8gYmUgdXNlZC4gUGxlYXNlIG5vdGUsIHRoZSB2aXJ0dWFsDQo+PiAg
IGRldmljZSAodmRldikgaXMgbm90IHBhc3NlZCB0byB0aGUgZ3Vlc3QgaW4gdGhhdCBjYXNlLCBi
dXQgaXQgc3RpbGwgbXVzdCBiZQ0KPj4gICBzcGVjaWZpZWQgZm9yIHRoZSBpbnRlcm5hbCBwdXJw
b3Nlcy4NCj4+ICAgDQo+PiArPWl0ZW0gQjxncmFudF91c2FnZT1CT09MRUFOPg0KPj4gKw0KPj4g
Kz1vdmVyIDQNCj4+ICsNCj4+ICs9aXRlbSBEZXNjcmlwdGlvbg0KPj4gKw0KPj4gK1NwZWNpZmll
cyB0aGUgdXNhZ2Ugb2YgWGVuIGdyYW50cyBmb3IgYWNjZXNzaW5nIGd1ZXN0IG1lbW9yeS4gT25s
eSBhcHBsaWNhYmxlDQo+PiArdG8gc3BlY2lmaWNhdGlvbiAidmlydGlvIi4NCj4+ICsNCj4+ICs9
aXRlbSBTdXBwb3J0ZWQgdmFsdWVzDQo+PiArDQo+PiArSWYgdGhpcyBvcHRpb24gaXMgQjx0cnVl
PiwgdGhlIFhlbiBncmFudHMgYXJlIGFsd2F5cyBlbmFibGVkLg0KPj4gK0lmIHRoaXMgb3B0aW9u
IGlzIEI8ZmFsc2U+LCB0aGUgWGVuIGdyYW50cyBhcmUgYWx3YXlzIGRpc2FibGVkLg0KPj4gKw0K
Pj4gKz1pdGVtIE1hbmRhdG9yeQ0KPj4gKw0KPj4gK05vDQo+PiArDQo+PiArPWl0ZW0gRGVmYXVs
dCB2YWx1ZQ0KPj4gKw0KPj4gK0lmIHRoaXMgb3B0aW9uIGlzIG1pc3NpbmcsIHRoZW4gdGhlIGRl
ZmF1bHQgZ3JhbnQgc2V0dGluZyB3aWxsIGJlIHVzZWQsDQo+PiAraS5lLiBlbmFibGUgZ3JhbnRz
IGlmIGJhY2tlbmQtZG9taWQgIT0gMC4NCj4+ICsNCj4+ICs9YmFjaw0KPj4gKw0KPj4gICA9YmFj
aw0KPj4gICANCj4+ICAgPWhlYWQxIENPTE8gUGFyYW1ldGVycw0KPiANCj4gSSB3b25kZXIgaWYg
dGhlcmUgaXMgYSB3YXkgdG8gYXZvaWQgdGhlIGR1cGxpY2F0aW9uIGhlcmUgYW5kIHVzZSB0aGUg
ZGVmaW5pdGlvbg0KPiBmcm9tOiBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gc29tZWhvdyA/DQoN
Cg0KVGhhdCdzIGdvb2QgcG9pbnQuIEkgYW0gbm90IDEwMCUgc3VyZSwgYnV0IGlmIHdlIGNvdWxk
IHVzZSBzb21ldGhpbmcgDQpsaWtlIHRoYXQgaXQgd291bGQgYmUgcmVhbGx5IG5pY2UuIExldCdz
IHNlZSB3aGF0IG90aGVyIHJldmlld2VycyB3aWxsIHNheS4NCg0KDQo9aXRlbSBCPGdyYW50X3Vz
YWdlPUJPT0xFQU4+DQoNCj1vdmVyIDQNCg0KU3BlY2lmaWVzIHRoZSB1c2FnZSBvZiBYZW4gZ3Jh
bnRzIGZvciBhY2Nlc3NpbmcgZ3Vlc3QgbWVtb3J5LiBPbmx5IA0KYXBwbGljYWJsZSB0byBzcGVj
aWZpY2F0aW9uICJ2aXJ0aW8iLiBQbGVhc2Ugc2VlIEI8Z3JhbnRfdXNhZ2U+IGluIA0KTDx4bC5j
ZmcoNSk+IGZvciBtb3JlIGluZm9ybWF0aW9uIG9uIHRoaXMgb3B0aW9uLg0KDQo9YmFjaw0K

