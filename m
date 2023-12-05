Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1880439E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 01:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647362.1010423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAJh5-0001Wj-4v; Tue, 05 Dec 2023 00:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647362.1010423; Tue, 05 Dec 2023 00:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAJh5-0001Ui-17; Tue, 05 Dec 2023 00:53:47 +0000
Received: by outflank-mailman (input) for mailman id 647362;
 Tue, 05 Dec 2023 00:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V90W=HQ=epam.com=prvs=67037769f0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rAJh3-0001TU-So
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 00:53:45 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcbdb2ca-9308-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 01:53:43 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B50866Z032243; Tue, 5 Dec 2023 00:53:42 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3usejgj1k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Dec 2023 00:53:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB8795.eurprd03.prod.outlook.com (2603:10a6:20b:553::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 00:53:38 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 00:53:38 +0000
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
X-Inumbo-ID: bcbdb2ca-9308-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNpfeyJyqlbPIWd8IBDNLXAFEVOOCBUKe5xLCcij5mggJEOnbc/WJHLlJR8wIvNwaBScyQoSBRK8Q4a4CwrPBdREI1IR5V7WsPumzYt57u4wZi4XeuwnqqrIsZ8/tDJOhZ5CnCp9xmZxSnlXD6atV6xFddm7spD65Lzstp1llF3VMX7JPepz1pYEn5o11Zx3WqcSVQG8SChW5kPL7sZfxgv5o02eTy8WdzPILoVPHvuKnqGkIlRxOCb8cR4nirkY434NlGyF/KMDqAITvzy19ToTq7p6JSxP3ZTE1Ae/RFRlyIzRV+nqDjCamcQ+KRLF7jOUNwtVbIjDEWjCKIzrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1xsGQ4MYPeDidDh8+TUu5AzjMyGCZLqUrfdEoBS1h4=;
 b=TbupHye1UL/GqA+1vmAOC8GU3wtt0PkbIedaRjZDLI2xqZDz2AyLAO0CTQQ6tbCFHJLhP2XOxh1E/6SbOVAv16dkFSjmjs9s1DZWesQ14KSkjPutC4P+RNdYOv5U3UL2fHdwNlTjVhACgluzI/mur5v2dsO5YGrbBPmZ9LTaFBAMlVikSaSzbDDz4OGkdpA3fRNmY+4od7NhaUuxZaK+kmbjyymxRL1GZsI3xZmxO24uyXAmPDJLIQsoWonAeGMaaMHIBX+f6582rQxe5pP/FCXdztIx2Bh+OKhpX9LaW6tJxkH8S3eqL2VkDNFxjpqhNHMPGxJNxRL/P2kSAiRXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1xsGQ4MYPeDidDh8+TUu5AzjMyGCZLqUrfdEoBS1h4=;
 b=EwWHtnYONv7AWB97xBWtK5fGDvUhgYqqc+XT179/MUwIDAquQ+zS8mPWORSwKAzBhgqV3Gg5sCpoEpPKvUTgO/gLeQLFzdY2v4tKkiK5D4SOSpVDvOuxGaCsxKrGFdQ16V7Y9E0uAItF2JIIDhMCJeRB4pWG0luQt+iwZ0v9t6ZmkLRb4hrziFemdvrLj1BrRguT81ZFkPgZZvnl+VJXv1QwpI/qcDxZ7ms+VDiLN2KxTX2OtvdKpUcKO+ekey2tHfECREn7zZ5YGJ5HWAwDyhk/lOYihNty+dP/QI0HmwDfsz305jMRicf79KQ0WFNkPfGQrHAegpl5Hx5T3augEQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Thread-Topic: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Thread-Index: AQHaJL6n1kPp1+DEXkyG3DA4rY4zlLCYzt6AgAESXIA=
Date: Tue, 5 Dec 2023 00:53:38 +0000
Message-ID: <87lea9sc4u.fsf@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
 <11ee03e0-9de9-4179-bb4e-4ea2510122ef@suse.com>
In-Reply-To: <11ee03e0-9de9-4179-bb4e-4ea2510122ef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB8795:EE_
x-ms-office365-filtering-correlation-id: 1bdeaac6-611a-41f0-ae2d-08dbf52c9e1d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7xwQvmJCSSY0jo7+y9x+kv6rHlQnPRRRB109GQCwQ/NMLWeYZM8zE3DpoV8Gx7a+a+lLkAARwSouoD7dr43GqjIJPB/NPu0w/zCJuiVN7oWSt2eiJtCsfqe1/WGI7Re0WY68vNCG5mlHbEaljtWSxJh4I/FARGp4x6QB+leySecOkLmFAO8VrWIrKbXfYjfr8cFlSRCBStFDNVSnWfN8ZMV7hnhXg00DcH444mJ7El2Ksrge2Uih0QJkyS+7zmxQezzqXSLIZoKXIhUkYnUbb+wm9mVh2A9p24XzxDVbNsPQakFy1d1kbTzgSYNePOhs4pbfAFlLZHl4Xiy16USadrw9XGWGqgTHF86UpD7ulLXNh69dFmyC0/R8QH91LKB21S9XiMZ4Qrt/dH6hxBzQm6kIuHL9esGAjo5PkXtZJfrJhlH2c/AiEi0we1GwCF89iZnKhRS4BoflXF01SiOGSul79YVC5LiFhoREtxcxsAN5fH+S0pnLD63xG8Aa43gGSdkupksF5HffxApKfZ/Rv21gVZ4ZiYiJJDPIgeea502q08BiXmRN6ItQ/6DWPnXp2dqj480ASpucGj786S7hoq3CHU/tk9/HmLfV7evty/r3pKgDkOf3eURS96rUzOfn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(83380400001)(478600001)(6512007)(2616005)(55236004)(53546011)(6506007)(26005)(71200400001)(316002)(91956017)(66476007)(66446008)(64756008)(54906003)(6916009)(66556008)(76116006)(66946007)(86362001)(41300700001)(36756003)(8676002)(4326008)(8936002)(38070700009)(4744005)(2906002)(5660300002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWhab1FPaERhb1JaMUdBM2FPQXUxYS9SVDdiTTUvTlNBOUtmWTIxUHVLNFQw?=
 =?utf-8?B?S1B5UkhjYUVCSDJxT3JEV01LMEhlbVEzM1F6S2dBWk84dnQ0MVgzM2l4ODBu?=
 =?utf-8?B?ZjJpOXlVT0Vnbk9wOWFMcWZqd1FRcFRoeDkwZHRlei9hNGFNQ094bUI0cW85?=
 =?utf-8?B?ajZOSmNZOGRxbERuODdic2ZwM3M4am55NlpuYjF0UmdBMTdNQkc2MDZxUGZt?=
 =?utf-8?B?KzZubFBIMXp6M09NZjhrcTl6OTRVVXl6aUpOcThFQkJHUmlnWE5HL2Q0LzFS?=
 =?utf-8?B?K2YvUlI2QzZaTzhmWGVVZGRUVkl4alJQNTVPcFFDUElYT3phTFF5ZFQrK2xJ?=
 =?utf-8?B?NERVanRQazFveXdwK1h2M1d3SVlOVEdCNXZkMFdON0ZlQkZTaXBEaFp4MEw1?=
 =?utf-8?B?TEdpdVhRYlUvWm14cVhtNW1Mem5EN1N4bklVSEVPMmhTY0lIYjhPRzN6Qmty?=
 =?utf-8?B?NDNHMWJFTGExU1NiZFl4U2M2UXdUU3c1VnpsR1JoS0NocTBHYThkNDBtQVdK?=
 =?utf-8?B?RHFjMDN4VTA3Q21wdGtoVEJvY25rb2dFWjdWdktsYUNpUHIyZ1hBOG5icVlJ?=
 =?utf-8?B?NXlDODU5cEc4d2dKUEdnOWZUWDF1ZDRSUGQwUmhCelQvdWJQQVFITTVSS1FC?=
 =?utf-8?B?cUwvdEZPT2kvclB1Z1ZPampMRzN5T2tMRG1PRDNtMEREMCt6VGswMzRUZDZI?=
 =?utf-8?B?RzdPUFVwR0c3azArc2toSWZaTysyYTg5b0R6KzVLUTg5b2hDUUNCOFpVVnRW?=
 =?utf-8?B?bENQbmE3NnYvOHl6QzIvNjY4blVOZDZtdC9tcGdxa3lidkx3eFV6Y0FHOFpq?=
 =?utf-8?B?alE2b2RMbEJxWjNVM3NjS3J0a01qRTNaWXRvbXFJM1dMSjRGLy9OVFNtdFk2?=
 =?utf-8?B?Q2pQUFVJU1hteDBueXhKWjViOEFOSDdPUE5mYThiQU1vZjdLNnh2Wm52eVlL?=
 =?utf-8?B?RWRnSEZSVHUzWmpDTHdRRjg3bGNxdzFNb2IzN0VKcE5KdDZValY4SFVVY0Ja?=
 =?utf-8?B?a1ROMUl1NWFUaDFmQXk5WlU0MUNQMVltd2RJaWptMFNUNnc3U3pFZ2pUQzVE?=
 =?utf-8?B?OCtTelUwek9XTGVrYU1lcUNzWThKZWRKd0dndHVyaTdoKzViVmFWTTMzYnRY?=
 =?utf-8?B?eXJweExIYXVKZjZhY0orUklZd2RxU3NaUTg0VHdXNEI5Y1R0b2RtNXZaNDJM?=
 =?utf-8?B?dzVBVkpsL2NZaWdMUzBRTmFKSDd1V2RmRVZHR0IwQzd2WUVBbmVhZkQzOVRo?=
 =?utf-8?B?VWVYcmN2MExQYUUraUc2NVluaVJmbEg1NS8xb3RQaStiVVVQSkdpZnJGYTk0?=
 =?utf-8?B?QnJySjIwNXZlWnJaRldlRmxqOGNFeEZjL280RkVOTjdEQ05wMDc3MFBtYk4y?=
 =?utf-8?B?MnB1UW9nQlFaZGhGUys2MGtHK3hiWnlwc0lYTG9LS1lzdmZOdHVLdThlVTli?=
 =?utf-8?B?YWMyeGYraHNKdVp0TEE1QXY1UDRoS2cxV0MxRFJQZnVYeFk1V3pEQVdIWXVy?=
 =?utf-8?B?WlhQSUZOL0JuK3NtZUlwd2JzTmtGR0d5eFJTcXBtN1YvcnZLZittaTh1SUdm?=
 =?utf-8?B?UEIwbGsraDcyRGJDa0h2NlJZL2ZVVTlhMmduYStuR3ZXaWphMU96TW1DOGJo?=
 =?utf-8?B?Mm9SaHJybytnODVvZzE4Tm8zMk5RZ214Ry9CaXp2ZFA2aGVHL04yRTlsWVJu?=
 =?utf-8?B?R2ZSWWxlY3I2RTNVUVMvVzljMEhCSXczMFE1MTYrMW9mcFd6eXFWSDVqS3hM?=
 =?utf-8?B?cHVVSXlXcmlscGFULzhPNisweFBOR2w4MTh6MUZRcEZCSTc2UmFGSHFkZklv?=
 =?utf-8?B?UEhnQVhMWXNLbDF6NkhweVhLayt6YSttUEM4WUZvNFloRGtJb3dlTHdDKzBV?=
 =?utf-8?B?OUpERTZVaitObjdDTXFKZXhxVTZBLzB4OWFvLzY0ODg1bzF3ejIwLzV5V3FL?=
 =?utf-8?B?RkM0aVVCOEtjczhGT1NvSDRYSVBSUFJPYmtOMGVyZVJHUC9wUVAyRGlFUHVk?=
 =?utf-8?B?dXFrYmthNEVWMUFlNCtscGQ2STdJRlJ5cmZXRG1QM21vSktDdTVnL09EQi9t?=
 =?utf-8?B?NmZiUVNnVjRqUUtnS2VKN3BxS1pzb0lDeFdIMUNUWGZmSDVBcWhodXl3UDEy?=
 =?utf-8?B?cW0xUVllRWdOUGtMeU5DRStPaVZFSVk1bUUwRjVVUXBGUnA2aWg0NTFXZzFj?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F33C4B3CE09D7F49BB0883296D906225@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdeaac6-611a-41f0-ae2d-08dbf52c9e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 00:53:38.3019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8aOMyJrtNj2zprh6fMUeu1OnHtl8TSDV+TMNM8DGMW/Ial/srmJbQX1HgZECU/TvfSkIhKiNisfqB2XPKLCgW1lkuXlqkqVkU0z+hDcGM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8795
X-Proofpoint-GUID: x087ifakXWvBAdthUUg9Q5ULrlfD9jkx
X-Proofpoint-ORIG-GUID: x087ifakXWvBAdthUUg9Q5ULrlfD9jkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_24,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=669 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050006

SGVsbG8gSmFuLA0KDQpKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyaXRlczoNCg0K
PiBPbiAwMi4xMi4yMDIzIDAyOjI3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEludHJv
ZHVjZSAiZmFpbCIgbGFiZWwgaW4gaW5pdF9iYXJzKCkgZnVuY3Rpb24gdG8gaGF2ZSB0aGUgY2Vu
dHJhbGl6ZWQNCj4+IGVycm9yIHJldHVybiBwYXRoLiBUaGlzIGlzIHRoZSBwcmUtcmVxdWlyZW1l
bnQgZm9yIHRoZSBmdXR1cmUgY2hhbmdlcw0KPj4gaW4gdGhpcyBmdW5jdGlvbi4NCj4+IA0KPj4g
VGhpcyBwYXRjaCBkb2VzIG5vdCBpbnRyb2R1Y2UgZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4gDQo+
PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+DQo+PiBTdWdnZXN0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPj4gQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPg0KPiBOaXQ6IFRhZ3MgaW4gY2hyb25vbG9naWNhbCBvcmRlciBwbGVhc2UuDQoNCkp1
c3QgdG8gYmUgY2xhcmlmeSwgaXQgc2hvdWxkIGJlDQoNClN1Z2dlc3RlZC1ieQ0KU2lnbmVkLW9m
Zi1ieQ0KQWNrZWQtYnkNCg0KQ29ycmVjdD8NCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

