Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680C429164
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206099.361584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw6I-0002vL-HZ; Mon, 11 Oct 2021 14:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206099.361584; Mon, 11 Oct 2021 14:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw6I-0002tQ-EX; Mon, 11 Oct 2021 14:16:22 +0000
Received: by outflank-mailman (input) for mailman id 206099;
 Mon, 11 Oct 2021 14:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRsb=O7=epam.com=prvs=0918241709=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mZw6G-0002tG-3w
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:16:20 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd2efd46-2a9d-11ec-80e0-12813bfff9fa;
 Mon, 11 Oct 2021 14:16:18 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BAeEuf026636; 
 Mon, 11 Oct 2021 14:16:13 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bmkqj0wsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 14:16:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4148.eurprd03.prod.outlook.com (2603:10a6:208:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 14:16:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:16:09 +0000
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
X-Inumbo-ID: cd2efd46-2a9d-11ec-80e0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp9WgR9DmIC3ztMXIYJxbxsu3fTDPvJ0DI/eR2kYyDdL0nf8eY4z5/TN6DHBsvHeo/QTjbGQI5t78Y2on/8AF5kgGP6IcBXnIys1JsX6pWDtkhwGcwLHVmvNlqAGWC6TJhv5hkdnfp/BfZ2hSEFi0Qtd1lAd57mC/5uaQl7nr+KkPVlNWHRh+KzAJ4F6EMDGOxeVPEQDxtrl+D7RPZRZjwg3eApjDDnt5iJaXYOsuS9CsdxpHZox+7ZqoQ7xkRU+pVluIMknXNk5xUHiHIEF/Lk2dZmbsF9Tfq3jLsmgAc9ttybDTVxUud0/Hv5GTVSgse1jVnl4YcRgFqdaMVBing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKAn6gmZryd0mu3ilOZoDA7iyashoEnQR+UZMgAdg0k=;
 b=G/Kn883SJTgs4ejKV8jh1iMun1dcuiuhoFQ4edE3yVoklSQdQ7CyLS+BjLPZ13DdMALBzPBv/I/T1bk2UNjd8idl8+kXQVdJmSQ0B/wrH4x/iabQ48NeUJOdSQKvZTtWkUtlSfOeRGqEMa/oIxQbm6rHToedroW2iIq4jVDWPRYMMOKcliTFurV5QaqawIEamlQIeBC4QW/uHXYIllO6Ia8D9DnZ+YVU5H+51siGSqHf1+7wl1s9qrZbpNqFkixA4ngeH9bYOFa+9e36RHC7DW8rjqs2e0a9hhOkrfGtOytS6kixvPgL5YxTbvBwD6i+xuKa6pEfYAukLQ9t61thSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKAn6gmZryd0mu3ilOZoDA7iyashoEnQR+UZMgAdg0k=;
 b=uBm2L6JR3QhbjJQmZ9zl0Rnm1RHopuJoYRLUokDNfrttJaJSbv9yunHDNnjnpJIa9c+y1/M+tdKmhP2UmmrZGRN40oikJDxmcO26BmoT3dtyN2lCPBRcHwnt2qKnO5KIoxOkTNUZ/BzsDPZiiRtc7uslVdQXKZoNM60W2RiRkcYd6kme2I/lhyUdoxe3jLhydcQFObnUY160gLgPOc2aanpaCr/VvcrjceTRVvmuToOTJUg9raoKD5YiXYbmAaMz/VWE2pC98oLZs72/TQNlIbJxUj/mzKkG4CI71D+b9+cpR1smYoIbOiT+v/HXsJwlYQsJ6yGBvz2Wr22d+BfAUQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Juergen Gross
	<jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAJ9YA=
Date: Mon, 11 Oct 2021 14:16:09 +0000
Message-ID: <49a3a42d-78b5-3a01-c0d3-ab30f6d625c6@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
In-Reply-To: <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ffb6b9c-e510-459b-fa38-08d98cc1ac70
x-ms-traffictypediagnostic: AM0PR03MB4148:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4148027676B9557F113F647CE7B59@AM0PR03MB4148.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SIosRc+jBNjBjbH3QX/LUE6Pe99ItjQG9VscgrK+1JEPXthMHa8wXWM++bc/sjzZXkByJEfhSQLYaYIxUXEzeESw2y5G4wxuoajnnwAHl9BOm2VzkygIE6rN5kcYL37isMWeeEBhoGQnmM/Nm8BMiSNCe6oGg8mqvHMTPL6bfColS4IxjUavqggocYF93slVfn0S5q3aCuCViEYS2g/a4ICZaPxS2NX0XWBWwHtlZCatnHo/REkcEjxMsdnrTl/3F3rINT8gZvvJj0MR1Al8oQOMc3cFhwDtnZaOKE4r3fkPFCco+iuNNnLorT2GbrmHnD7H9BbY4CpmGOxvMJgVeIkosClTM8/j8tQhOAvsGcYKSkswrn5hFWkC34GnejF/qxZvcstllol3J2UpAdoDMRYYLz8yojf5WV8QczLC3M5bFeG6NT0iyrRaj8febsebWY9WZxF3vk8Tbf4YWC2kU4t2nYtUG08anaPET0FJ+cL7+uzX2KUXedhT5Q1grlL/061MHt1pJ6Fm51rV/4q6xH6zQ5n4T1pbjCh3lXa5vz0K+Y2xkN8xcUnmd548T+MJKi2pFNQUrxqTA6L+cSQFi6ilSFeKRZBQdSb0lKk8qNpwwKk/GibMm1g4CHmMZJ0y96PoEn9T72DRm1Th35ZLq9NrxN+NT3DtHc+mbtRfIj5qGRWk7u9qrrkFOFdKk2JiIsOfawRuo5IzW2j325ye2DduhF4BPevGD40dnJBirWZ1yH0vrZ5WLMEZ+cVqkzMl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(2616005)(8936002)(66446008)(66556008)(64756008)(6486002)(26005)(66476007)(83380400001)(6512007)(91956017)(76116006)(186003)(71200400001)(55236004)(66946007)(53546011)(6506007)(36756003)(31696002)(8676002)(38100700002)(31686004)(122000001)(54906003)(110136005)(316002)(38070700005)(4326008)(2906002)(5660300002)(508600001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L2VYcSt6c0xBTGJBbVN0UTI1YnpRK3VWNGhZVjdaU2hYWDk0clBNZEZabVYx?=
 =?utf-8?B?U1FseE5rdnZjcW9Gc0xuYnlnajBwZjNDSmd4OG1MczRicmRYbElnbGloYThm?=
 =?utf-8?B?S044OEh3N0hyL0pQNWFuRnR0S1N4ZmdwaDFhSjBzMFlTRmt2UVJEY0p4b25C?=
 =?utf-8?B?Yk13TU9MVlhKU3liYUNyTUEwYTNhV0tKSm9jQ0JSUm5SaHdTMHJLVzc4OW1L?=
 =?utf-8?B?aUJJWEdldUZwRlJIZjZ4Qm5la2JRTkZpYXFhZk5nVlphc2hrWmZGT0IyM1Zm?=
 =?utf-8?B?bTlzcnpiaEM1cHA3ekpsdXNTQ1BJOWZ5T0pjay9WdjZCR0dQQ2NnUERIeDRT?=
 =?utf-8?B?aiswMDBCR2pPaS9sSmRCaFBNTVN1UEZ5ZHAzSHUvNjkxcU9yNG15ejdSTkpr?=
 =?utf-8?B?V295VTV3Mm11cER1ZUI3RC9qZEVMOTNYNHRPRENPK1haR2szWnk2UmhFeXND?=
 =?utf-8?B?UEV3MVd0Mk15OVdLQVlhdGpBdnF4VWZhVzlQVWRqQWpMN3VKVU12aDBtQkJN?=
 =?utf-8?B?aGxHeXh1R2YxQlVGdldMUDJpemp4YWNBcjY0M0M3MXBmRmpyKzRuVjdzdFRP?=
 =?utf-8?B?SWhZcWdKZUxDM1JrUytGMnBldjNhY3pYVVdMc2s1WFZCV1VzTGszNWcxakM4?=
 =?utf-8?B?WlBPMUNVazdaTkM4dDBqUWttSE1vekxCeGxCbWVRMGhMQlhoeGZ6eFp3RFo0?=
 =?utf-8?B?NnBQcGpqL1BVR0NBa0FtdFY3Wmo0NmtvU2RuRmJ0ZlZaanBkMWpLdHFBbkFE?=
 =?utf-8?B?cUVlWEpoQlZ6T3dxMnB2cllRWXFiajhhK1lDZzRSUWZHUFdCNVFFY3FuV1M4?=
 =?utf-8?B?WStxQzdvc1ZyL0g5c1g3TENxUmc2L1AyQWtoZmgwNTR6U3g3S1dLTDBubk83?=
 =?utf-8?B?bm4zdDMwRkRTV2txMWhQVEF0WlJRMGlUbEVTbFcwOTJWN2UzODZ0NnlhTkV5?=
 =?utf-8?B?SWROOGRKWUlxNVlBUHBWMTRPUmpVRUtreVU2MjFMY2RSVG9ieXhySC9jSlh5?=
 =?utf-8?B?ZWJqVW5oVjR6R0hHUHR5c1E0aWthZURGMlpiY0tXSVZxY3VBdmZ0bEViVWpI?=
 =?utf-8?B?cmFFSGl6a2NQRUJzcElvVUF0a21vdUpCVi9NY1NoZnZMMkM2TzY3Q1VnRjNw?=
 =?utf-8?B?RHFiNkZ3RjFFSm91ZDlvTUpaSG91NVVUQ0RxVzZmbWk2TWdTYi90ckJlbGZH?=
 =?utf-8?B?OXhYMzFZNU9JejBPZ0wrb2tjaU10MnVneDZBWi9IOXUyekNLWkRCNDNOWTMy?=
 =?utf-8?B?bHREMFVPV0dpbVBkM0FnbVUyeGVQb3pCam9TaWZjOSt0d2xhdzVtWjMvaElE?=
 =?utf-8?B?N0JHNlp6bnRjcFpSOXc5NytFMWxHbTA5aHQyelhIQXcwK2RXY01WNis5NkFk?=
 =?utf-8?B?cUZIYWk2ZUpycTJQTTJzQjdjcmdXTGp6UHQvZHhFVTBYbW80N1ZxdUdsSHZk?=
 =?utf-8?B?ci9WWGQwcUlZdWlYeXh5ZFZ4ZFprWEVrUXRUVEVpOWQxbUcyMUJldEp6S0tt?=
 =?utf-8?B?ZC8wbTAwSUxSamhkQXJ1NFhkVzVrcDBGN2FqN1JNR0xTeGpoQTIxZFIyeVpm?=
 =?utf-8?B?Q2VRZ1VQaTdRUTdtbWJJNjcrSGJZK0pXMzJ0OXRoT3VRQ0YvbEJhNEFRdzIv?=
 =?utf-8?B?UlB6eEJKZ3lKWUY5NjlpVFNvZXU2S1grWXlQRDFTV2YzSjhpQ25oT0NzeEh3?=
 =?utf-8?B?T2pUeFp0S25DeTFqREZBVFhUMGRmSTVSTmVUdU9WS2NOTVJueXoxWmNaSmpW?=
 =?utf-8?B?RHFsdmVZc1RnSlhZQTdVUHlwVlg2N3JtdUQrMVZNRmRvbE5ueHM4YkNxYndw?=
 =?utf-8?B?K3dISlYvb2NKS3JIdkpyQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1F3F65B085BC0438B3882F0EDCD4C6E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffb6b9c-e510-459b-fa38-08d98cc1ac70
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 14:16:09.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCplJC39LLPVz+q28f7FVXP7zzTFFybDU7nWE/x6bzEz977f7Z+TLPPRoHy7NBfFNIpkzBrkeVHjNeV4hSo802Q7F5E6yL1k3r0nVkQrEPaxzyGIAYqMUph+F1jg5Het
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4148
X-Proofpoint-ORIG-GUID: Wv7ZFCpZYl1QYZXMutm3pqcAgw837sCi
X-Proofpoint-GUID: Wv7ZFCpZYl1QYZXMutm3pqcAgw837sCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=951 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110084

SGksIGFsbA0KDQpPbiAxMS4xMC4yMSAxNjo0MCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4g
SGkgUm9nZXIsDQo+DQo+ICsgT2xla3NhbmRyIHRvIGhhdmUgYSBiZXR0ZXIgUENJIGV4cGVydCB0
aGVuIG1lLg0KPg0KPj4gT24gMTEgT2N0IDIwMjEsIGF0IDE0OjIwLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gTW9uLCBPY3QgMTEsIDIw
MjEgYXQgMTI6MTE6MDRQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBIaSBS
b2dlciwNCj4+Pg0KPj4+PiBPbiAxMSBPY3QgMjAyMSwgYXQgMTI6NDcsIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gV2VkLCBPY3Qg
MDYsIDIwMjEgYXQgMDY6NDA6MjdQTSArMDEwMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+PiBB
Uk0gYXJjaGl0ZWN0dXJlIGRvZXMgbm90IGltcGxlbWVudCBJL08gcG9ydHMuIElnbm9yZSB0aGlz
IGNhbGwgb24gQVJNDQo+Pj4+PiB0byBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YgbWFraW5nIGEgaHlw
ZXJjYWxsIGp1c3QgZm9yIFhlbiB0byByZXR1cm4NCj4+Pj4+IC1FTk9TWVMuDQo+Pj4+IFdoYXQg
aXMgdGhlIGNhbCB0cmFjZSBvZiB0aGlzIGZ1bmN0aW9uIGFjdHVhbGx5IG9uIEFybT8NCj4+Pj4N
Cj4+Pj4gQUZBSUNUIGxpYnhsIHdpbGwgb25seSBjYWxsIHhjX2RvbWFpbl9pb3BvcnRfcGVybWlz
c2lvbiBpZiB0aGVyZSBhcmUNCj4+Pj4gSU8gcG9ydHMgZXhwbGljaXRseSBkZWZpbmVkIGluIHRo
ZSBndWVzdCBjb25maWd1cmF0aW9uLCBvciBpZiBhbnkgb2YNCj4+Pj4gdGhlIEJBUnMgb2YgdGhl
IFBDSSBkZXZpY2UgaXMgaW4gdGhlIElPIHNwYWNlLCB3aGljaCBpcyBub3QgcG9zc2libGUNCj4+
Pj4gb24gQXJtLg0KPj4+IFBDSSBkZXZpY2VzIEJBUnMgY2FuIGJlIGluIHRoZSBJTyBzcGFjZSBh
cyB0aGUgUENJIGRldmljZXMgYXJlIG5vdA0KPj4+IEFybSBzcGVjaWZpYy4gVGhlcmUgaXMgbm90
IGlvcG9ydHMgb24gYXJtIHNvIHRvIGJlIHVzZWQgdGhvc2UgY2FuIGJlDQo+Pj4gaW4gc29tZSBj
YXNlcyByZW1hcHBlZCBhbmQgYWNjZXNzZWQgYXMgTU1JT3Mgb3IgYXJlIG5vdCBwb3NzaWJsZQ0K
Pj4+IHRvIHVzZSBhdCBhbGwuDQo+Pj4NCj4+PiBCdXQgdGhlIElPIHNwYWNlIGRvZXMgYXBwZWFy
IHdoZW4gQkFScyBhcmUgbGlzdGVkIGV2ZW4gb24gQXJtLg0KPj4gVXJnLCBJIHdvbmRlciB3aGV0
aGVyIHRob3NlIGRldmljZXMgd2l0aCBJTyBCQVJzIHdpbGwgd29yayBjb3JyZWN0bHkNCj4+IHVu
ZGVyIEFybSB0aGVuLg0KPj4NCj4+IEhvdyBkbyB5b3Uga25vdyB3aGV0aGVyIHRoZSBCQVIgaGFz
IGJlZW4gcmVtYXBwZWQgZnJvbSBJTyBzcGFjZSBpbnRvDQo+PiBNTUlPPw0KPiBXZSBjYW5ub3Qs
IEkgdGhpbmsgdGhlIHBsYXRmb3JtIHdpbGwgZGVmaW5lIGlmIHRoaXMgaXMgdGhlIGNhc2UgYW5k
IHdoZXJlLg0KPiBAb2xla3NhbmRyOiBJIHJlbWVtYmVyIHRoYXQgdGhpcyB3YXMgZGlzY3Vzc2Vk
IGR1cmluZyBzb21lIG9mIG91cg0KPiBtZWV0aW5ncyBidXQgSSBoYXZlIG5vIGlkZWEgb2YgdGhl
IGRldGFpbHMgaGVyZSwgY2FuIHlvdSBoZWxwID8NCj4NCkZvciB0aGUgZ3Vlc3QgZG9tYWlucyB3
ZSBlbXVsYXRlIGEgaG9zdCBicmlkZ2Ugd2l0aG91dCBJTywgc28gdGhlDQpndWVzdCB3b24ndCBi
ZSBhYmxlIHRvIGFzc2lnbiBhbnkgSU8gbWVtb3J5IGF0IGFsbC4=

