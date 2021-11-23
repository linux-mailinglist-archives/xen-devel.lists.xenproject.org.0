Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2445A65D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 16:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229685.397183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpXVG-0005l6-QX; Tue, 23 Nov 2021 15:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229685.397183; Tue, 23 Nov 2021 15:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpXVG-0005j3-NW; Tue, 23 Nov 2021 15:14:38 +0000
Received: by outflank-mailman (input) for mailman id 229685;
 Tue, 23 Nov 2021 15:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpXVF-0005iw-Gi
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 15:14:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f6d42f-4c70-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 16:14:35 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANFDC51032101;
 Tue, 23 Nov 2021 15:14:32 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgyymrsh1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 15:14:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4577.eurprd03.prod.outlook.com (2603:10a6:208:c1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 15:14:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
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
X-Inumbo-ID: 10f6d42f-4c70-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np9hz3rxY2sfSYFOyiO44Ff7ZJvGw4gvoHTBL+kroVH3d0xfxZGETjj6xzFofcCKnEGd1fjN51M1kIxQ+98eg+QfjqhjeimqdS+p7zprvttkPTJiei3y71Z1ooDfxUOXcfXLK3JpNlDuW8LvANLYX8PPMjzhBqSW0QdjVYdpWg4UvnSkaLYskmFnyUUoMkeRWLftXEhWyny9NrZ4zRxAz5HABXETiY3lmzR1YhqpraHF255VOdocZMprPnudr56pykr0ods31V78mwpHcr2EPalOH+j81HGdayO+1sch2dYOPGy6NTbu8OUmKQhS/oCUl6sPtqzkmVZ9BQx3IxXWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqRcsiHQaZOX+OGslcrYzfz+7HO+tAOOjbS+UMeeGkU=;
 b=EIOTLeoxf/RdOZK1M6SX3yxNyxj/ZHhzeBs+x31MxLY09eWCIyUh0QIGycuuDq2MftBcT5oxmwIIbaP44HSa3oa9bMr3u5vkzIRUzKvU6Q6ssVh/yUVNIXDkFRyFY8X8HQ9Qnhot/O61oqy9qB/I+k48lGtdJ23mqh0fJ5jASO0IhD3DFig+Y26UIl3SVEDDOgkEA77NYynudh0wOk5+w8ND0nAYXwpooyUfeVjRgi0JZm3NXbd1ojRhEZiYjgrjAIXUOceYavdXhRpjzvoRps33V2a8cHq0Ve3hjdH0Hdk2zjojFOwlNMUQIfg82TLhcdZgusdySIV65swIoLy7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqRcsiHQaZOX+OGslcrYzfz+7HO+tAOOjbS+UMeeGkU=;
 b=LtsG2Xl75Vv7zKV+/HFrlsMjpjZddTzF4pHd7XEJ6V2u3JFyEv7G3laBqXGuvEDvvjAHIK0Jv8iGpxdvs/fJdxFjgcEWTEMO7QjRjdunku6OdNcxAIqh6xWpiJaBAzOuU80X3AWwB/g03hzbdSxx8faxq3x0ha1H/IZljcNvgOtrzTClyEiZrjxjqtM3IBz4ixTuhHQJWvwD1Cj4+i6DA79JBho3ZwzxRMat5FbfpRbj23wPQw12nbmuxPA9WjhFf+B1UdZ2OBAqpViR4kE4iKCRb5aXx+Lq3dgXc8a2OrCn9ElvTP/4dOF1iLTPX08g6+EMAvfU36nUUgA4e/JjXQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
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
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYCAAAeUgIAAApWAgAAAtgCAAAGSgIAAAk+AgAZuEAA=
Date: Tue, 23 Nov 2021 15:14:27 +0000
Message-ID: <3192ef9d-c014-df72-91c9-13386bb584e7@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
 <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
 <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
In-Reply-To: <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b2657f-8cbe-469b-f7fb-08d9ae93f100
x-ms-traffictypediagnostic: AM0PR03MB4577:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4577EF6B824F72D0200A551FE7609@AM0PR03MB4577.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6aa+3ZIDVID1SRZf2DuLkdACOG/hUf7f0wTptxQ+IBZ9HoDQC4xlXkEY6YmQwwZBHUkb0tzW4bwKYBSYlII2sb4O4QHnxpgq776HI12aywr9IR21bhMPrqjuuZcS7vtg1eIPMyTaliBVHmzWZ0X6avD6KGPMR83s8DNJXXhDioLwxQdq3u3yYZ2iIgA7uXeeEYVRcTiKMaND/cgq6vwz2zFwuS92cjlsBvu/AfzYJM/TdrenO74DwrLo+d1K/j0ucrIA8ZdxI8N4VuNeOLQwbqpgzWB6sWmZjChhNf5vkllOQfWjMZ+ETEWrwrea/4Al4sQyg4sEmqk4T+XgdfnEpWgVTfJuRSlPhx/DCaBCCVKnls9rETx82Hyfq+RvvS2aTfrXIeNFVN6ro/tu/YVPGg7KzN+VJREEkuk+h8ybafjHTqkEIpGTtTSVFRqEfVQpD5X0I9J5lp2zHJBtVb7mLwINWrkE1sJlzaP38oyFNllTRPFUOXLUhpHQwWFXV5g7QthOcjJmYfT+A8Ovn1HMyGEsaA/3x3Sh/YD5UXRSmGUV9G4WMsKTAiFQ5N9rBGhbTwZqgC/esCI0W3+oqzNW96un3bacIYEw1Yxux5veQRCjQY6tesUDJep+YkQv2AHZ/B12ikGAk+i+wwpgmcEdd5H7L3MzxsZVD1TcWMCm1RgcfDgLt+UU05nMFwPFn+xOoFT75dp6E0sxSd1lWF6mKv7xKsNXCqaOpjv0JXitV3K8GM87PekFwWwa2uqNqQHr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(2906002)(6512007)(53546011)(6506007)(6486002)(86362001)(36756003)(316002)(4326008)(38070700005)(5660300002)(8676002)(76116006)(66476007)(71200400001)(8936002)(54906003)(31686004)(508600001)(186003)(122000001)(91956017)(31696002)(6916009)(64756008)(66556008)(7416002)(38100700002)(66946007)(2616005)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SCtYeWpxR2RIMVhqWVdUTGt2bEgyZFk1Y0p1azFURGkvWlI2QnI4YVEvVEFG?=
 =?utf-8?B?L3ZJcW8wZm0yNWEzMzlJRnRJUDlVNm1uNnVtOHlQTHBhbXhzTWhWM2pUbGxj?=
 =?utf-8?B?SWJ1TFVQVW9zaDEwZjZOTlFQczBKUlNoOElJV1VLeE9JbWV2STlCR3UvOUdk?=
 =?utf-8?B?YUI3V3dKN3lBRm5wcjEzdENzSVNTeDhTNmtxbmRpbVhJZUVvcCtFcmtQaGtn?=
 =?utf-8?B?aEp5YVhPYnMxSWNzTFhxcUp0MkUwNTRJWFV3WVd1Ui9LSG5RV3hzeFp1OHJl?=
 =?utf-8?B?R0JGUWxRRTd5c0ZKbWdscS85b21XdUZ5UU0rWDc2SWN1VnlKdkFCbTNpUmNH?=
 =?utf-8?B?NGszaURTKzVzUVp1ZmN1czVGaGpQSmwvb240MGphVEc0cGtRNnlVRTFmNnFY?=
 =?utf-8?B?L0tLU2hBS3RRNEo4b3pQYjgyRSt4a2dKc2JzUDRJWVFkYytPYms0N0tPVm05?=
 =?utf-8?B?cHR4LzUxSkQ3UllIL2dqSis1Q250dG9kNXZIWXpWRjV4NGJxMUJ2N1NOd2JS?=
 =?utf-8?B?bFFnaXhabUJOUHBwTHRuS3RSL2JsRXg5WTNab0ZjaE4wNjk0aTNLWnYxK1RV?=
 =?utf-8?B?OGxuUk1DeHZXQStSODgzRktWeWNUWmV3L0hENlFvOTZlMm1Sc0pZMzlFN3hN?=
 =?utf-8?B?ZVJJY2k1djN5Y09wYTdXcTNPclc1aWFjVlJrR3Fjakx1a3ZTUXlwNUdZMnpM?=
 =?utf-8?B?WlZ3dDdjNDJsYWdTMmthL0lSSGNZaStPUi8yOVd4cjBDb01MTUFXNldyNUcr?=
 =?utf-8?B?c0U3Rkl3d2FXc085SkxkU2MwTEpOeUJkOVVBVTJzaUZ2N080a2dKZHJQMmg0?=
 =?utf-8?B?UGRVNG5SL3ArbkdaeFJaREpTNnJ0UG9yNnA0YWVBRnN4UkNRL3B1bnlGTmlv?=
 =?utf-8?B?dS9EUFhMNUxVVUxqRXpNSUdmQnJPaHZIYVd4Uzg1bDNaa2NaNTh4b1lDZ3Zv?=
 =?utf-8?B?U09KS3p0aVk0QkhPanpUY1U2dnhVbzdrWkxzbXpWODRKRGJOUElNcTNUMU0y?=
 =?utf-8?B?eUNVeGtqVzNhc2ZzVXBVUDQyNjNqWTlJak1BeWg2R0ZYMTJHQmFNZFppZWJT?=
 =?utf-8?B?cU1jWGxEcmhmaDdVeGNFNFRGUFdRZkh0RCtmYU5tWU5OWll3bGtZbnFVQnBi?=
 =?utf-8?B?VmNIU2J6eUxaRGxISEFnS2Y1bzBhNFdpNFRlTkc0YmczdlR4MG82dVJMckhK?=
 =?utf-8?B?Y21WYjBaZUliSkk1WDI1V0EyQW51azJhSklvdEgyYWtLWnJhNGRmV2ZCN0VG?=
 =?utf-8?B?M2JyaU9RVUJOWUxDemlNdU5URVVIdFptdUdaZnZhNWVxY2MwSWhrQWYwWU8z?=
 =?utf-8?B?QnJLbFpVOGw3dnNITnQyY0hWQ3ZySGlxMUJiK2pFMjA4dVl0ckdOV1VLc2xO?=
 =?utf-8?B?eW5uU2lvdjdGdnl2ZUNRT2I0Ui9NZDZpamJONTdDczg2d1pqbkNydG01d2Zz?=
 =?utf-8?B?MHZoYUFVNm5NMEtqRCtsTVFlaTZvejdRQTNzcTFob1NJNVMyZStpWGhsK2gx?=
 =?utf-8?B?eWZRczhtakVEendlczVPNGJTN25mTnVpWktBMnNwYThiMUNYQUIvUENBQ3cz?=
 =?utf-8?B?VnlsbmF5Ums4NzBReDZ0MXJyTVBnN3RsY3k2bWFCRU4xRTNOdjQzRStHczZB?=
 =?utf-8?B?bDdBbVorQ082eFRvMVpCbWdjVmRTT0ZkeEdqOG5LblNsTGc3dEE3aWpNajdj?=
 =?utf-8?B?d1RRSzVrbjNtT3dlMUZldjdsVGo4Y2o3OUhOc3lBM2FGb2xCa0FUWUxLbmhG?=
 =?utf-8?B?cm91ZnMvMTZPSGZlU2NFLzEwci9vR29UY1UyWUhnc0gvOTl0SnU3YVM2UFds?=
 =?utf-8?B?WEdWdjJEK21uSXNCVWF1MzFCL01hVThGWmpITmljMFVDZTIxWUdwY2gvbVJL?=
 =?utf-8?B?eS9vcHFOUmlLMEdJV01WZHRFeExoYmtNMDdZaGNYak1oWU0ydll5TzhtRFZZ?=
 =?utf-8?B?SUxnRjZwWll2UTBHdXljdCtENFdLL09kdVNrb0hSZnFmSUVsVUxaSnhNRFUx?=
 =?utf-8?B?VWlCSzJjY0RPUWZzUjVsQzBwUDMzSXoyQUVZZWovc2U5dHVPWTVLcmZFYUlS?=
 =?utf-8?B?K0FBUDFKUXdJdGY3dlFZYTdmMkxLY0F2UDgyUURzMjluS2RSaE92U1JBcnJS?=
 =?utf-8?B?RlhtdE9sd0E3NUpKYVBkWE4yOUVGbStleEhGcTNqTEVlUTVHQ1VZd0d3VmN3?=
 =?utf-8?B?TmpIcVppVCtpK3VaZnB3Uk5yZ05JQmZhZzBsMkhpNzZJYnlqYmlOOUpEN1ZT?=
 =?utf-8?B?RWFHeG5Ha3J5cVRnZWlDKzRpOHNtSWZWcVF5S251aG9yWmQ4Z2EySUlOcXND?=
 =?utf-8?B?T1o5VERxaHJPdC9VZ3pGWVY0ZGljc05hdnZ2UGlSNDJnMWtZQmMvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1960D9A437968F4F9B2D347C76D8733B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b2657f-8cbe-469b-f7fb-08d9ae93f100
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 15:14:27.5508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYrXGpAdgcDkho3foKrQlZ1sT2U4fW95DMSLvSjHYp2kafSmMOUeDEdzU49ANNOFi1kLQ0bueJtjnd0nGeXATGCBJ2vXyS7Px0UOTovaeHmPNfdNWHs23Gez3BSKHj/K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4577
X-Proofpoint-GUID: nU7JKuEwsqc3NO0yAPzlgshzdXH0GWag
X-Proofpoint-ORIG-GUID: nU7JKuEwsqc3NO0yAPzlgshzdXH0GWag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_05,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111230080

SGksIFJvZ2VyIQ0KDQpPbiAxOS4xMS4yMSAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDE5LjExLjIwMjEgMTM6NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24g
MTkuMTEuMjEgMTQ6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE5LjExLjIwMjEgMTM6
NDYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMSAxNDoz
NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOS4xMS4yMDIxIDEzOjEwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxOS4xMS4yMSAxMzo1OCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
Yw0KPj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gQEAg
LTQwOCw2ICs0MDgsNDggQEAgc3RhdGljIHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+Pj4gICAgICAgICAgcGNpX2NvbmZf
d3JpdGUzMihwZGV2LT5zYmRmLCByZWcsIHZhbCk7DQo+Pj4+Pj4+PiAgICAgIH0NCj4+Pj4+Pj4+
ICAgICAgDQo+Pj4+Pj4+PiArc3RhdGljIHZvaWQgZ3Vlc3RfYmFyX3dyaXRlKGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsIHZvaWQgKmRhdGEpDQo+Pj4+Pj4+PiArew0K
Pj4+Pj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+Pj4+Pj4+PiArICAg
IGJvb2wgaGkgPSBmYWxzZTsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgaWYgKCBiYXItPnR5
cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAg
ICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+Pj4+Pj4+ICsgICAgICAg
IGJhci0tOw0KPj4+Pj4+Pj4gKyAgICAgICAgaGkgPSB0cnVlOw0KPj4+Pj4+Pj4gKyAgICB9DQo+
Pj4+Pj4+PiArICAgIGVsc2UNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgdmFs
ICY9IFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0s7DQo+Pj4+Pj4+PiArICAgICAgICB2YWwgfD0g
YmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTMyID8gUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV8z
Mg0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
IFBDSV9CQVNFX0FERFJFU1NfTUVNX1RZUEVfNjQ7DQo+Pj4+Pj4+PiArICAgICAgICB2YWwgfD0g
YmFyLT5wcmVmZXRjaGFibGUgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7DQo+
Pj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgYmFyLT5ndWVzdF9hZGRy
ICY9IH4oMHhmZmZmZmZmZnVsbCA8PCAoaGkgPyAzMiA6IDApKTsNCj4+Pj4+Pj4+ICsgICAgYmFy
LT5ndWVzdF9hZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+Pj4+Pj4+
ICsNCj4+Pj4+Pj4+ICsgICAgYmFyLT5ndWVzdF9hZGRyICY9IH4oYmFyLT5zaXplIC0gMSkgfCB+
UENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzsNCj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+PiArDQo+Pj4+
Pj4+PiArc3RhdGljIHVpbnQzMl90IGd1ZXN0X2Jhcl9yZWFkKGNvbnN0IHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgY29uc3Qg
c3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KPj4+Pj4+Pj4gKyAgICBib29sIGhpID0gZmFs
c2U7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFS
X01FTTY0X0hJICkNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgQVNTRVJUKHJl
ZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7DQo+Pj4+Pj4+PiArICAgICAgICBiYXItLTsNCj4+Pj4+
Pj4+ICsgICAgICAgIGhpID0gdHJ1ZTsNCj4+Pj4+Pj4+ICsgICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+
Pj4+Pj4gKyAgICByZXR1cm4gYmFyLT5ndWVzdF9hZGRyID4+IChoaSA/IDMyIDogMCk7DQo+Pj4+
Pj4+IEknbSBhZnJhaWQgImd1ZXN0X2FkZHIiIHRoZW4gaXNuJ3QgdGhlIGJlc3QgbmFtZTsgbWF5
YmUgImd1ZXN0X3ZhbCI/DQo+Pj4+Pj4+IFRoaXMgd291bGQgbWFrZSBtb3JlIG9idmlvdXMgdGhh
dCB0aGVyZSBpcyBhIG1lYW5pbmdmdWwgZGlmZmVyZW5jZQ0KPj4+Pj4+PiBmcm9tICJhZGRyIiBi
ZXNpZGVzIHRoZSBndWVzdCB2cyBob3N0IGFzcGVjdC4NCj4+Pj4+PiBJIGFtIG5vdCBzdXJlIEkg
Y2FuIGFncmVlIGhlcmU6DQo+Pj4+Pj4gYmFyLT5hZGRyIGFuZCBiYXItPmd1ZXN0X2FkZHIgbWFr
ZSBpdCBjbGVhciB3aGF0IGFyZSB0aGVzZSB3aGlsZQ0KPj4+Pj4+IGJhci0+YWRkciBhbmQgYmFy
LT5ndWVzdF92YWwgd291bGQgbWFrZSBzb21lb25lIGdvIGxvb2sgZm9yDQo+Pj4+Pj4gYWRkaXRp
b25hbCBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IHRoYXQgdmFsIGlzIGZvci4NCj4+Pj4+IEZlZWwg
ZnJlZSB0byByZXBsYWNlICJ2YWwiIHdpdGggc29tZXRoaW5nIG1vcmUgc3VpdGFibGUuICJndWVz
dF9iYXIiDQo+Pj4+PiBtYXliZT8gVGhlIHZhbHVlIGRlZmluaXRlbHkgaXMgbm90IGFuIGFkZHJl
c3MsIHNvICJhZGRyIiBzZWVtcw0KPj4+Pj4gaW5hcHByb3ByaWF0ZSAvIG1pc2xlYWRpbmcgdG8g
bWUuDQo+Pj4+IFRoaXMgaXMgYSBndWVzdCdzIHZpZXcgb24gdGhlIEJBUidzIGFkZHJlc3MuIFNv
IHRvIG1lIGl0IGlzIHN0aWxsIGd1ZXN0X2FkZHINCj4+PiBJdCdzIGEgZ3Vlc3QncyB2aWV3IG9u
IHRoZSBCQVIsIG5vdCBqdXN0IHRoZSBhZGRyZXNzLiBPciBlbHNlIHlvdSBjb3VsZG4ndA0KPj4+
IHNpbXBseSByZXR1cm4gdGhlIHZhbHVlIGhlcmUgd2l0aG91dCBmb2xkaW5nIGluIHRoZSBjb3Jy
ZWN0IGxvdyBiaXRzLg0KPj4gSSBhZ3JlZSB3aXRoIHRoaXMgdGhpcyByZXNwZWN0IGFzIGl0IGlz
IGluZGVlZCBhZGRyZXNzICsgbG93ZXIgYml0cy4NCj4+IEhvdyBhYm91dCBndWVzdF9iYXJfdmFs
IHRoZW4/IFNvIGl0IHJlZmxlY3RzIGl0cyBuYXR1cmUsIGUuZy4gdGhlIHZhbHVlDQo+PiBvZiB0
aGUgQkFSIGFzIHNlZW4gYnkgdGhlIGd1ZXN0Lg0KPiBHZXRzIGEgbGl0dGxlIGxvbmdpc2ggZm9y
IG15IHRhc3RlLiBJIGZvciBvbmUgd291bGRuJ3QgbWluZCBpdCBiZSBqdXN0DQo+ICJndWVzdCIu
IEluIHRoZSBlbmQgUm9nZXIgaGFzIHRoZSBmaW5hbCBzYXkgaGVyZSBhbnl3YXkuDQpXaGF0IGlz
IHlvdXIgcHJlZmVyZW5jZSBvbiBuYW1pbmcgaGVyZT8NCjEuIGd1ZXN0X2FkZHINCjIuIGd1ZXN0
X3ZhbA0KMy4gZ3Vlc3RfYmFyX3ZhbA0KNC4gZ3Vlc3QNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3Ug
aW4gYWR2YW5jZSwNCk9sZWtzYW5kcg==

