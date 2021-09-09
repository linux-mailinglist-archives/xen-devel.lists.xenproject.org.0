Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE80404442
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 06:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182581.330198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOBat-0004Sv-G1; Thu, 09 Sep 2021 04:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182581.330198; Thu, 09 Sep 2021 04:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOBat-0004QC-Cq; Thu, 09 Sep 2021 04:23:23 +0000
Received: by outflank-mailman (input) for mailman id 182581;
 Thu, 09 Sep 2021 04:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOBar-0004Q6-UW
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 04:23:22 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a970af7-1b8b-4c40-a9db-0730e868be01;
 Thu, 09 Sep 2021 04:23:20 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1894NG15017834; 
 Thu, 9 Sep 2021 04:23:17 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ayayu0126-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 04:23:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4147.eurprd03.prod.outlook.com (2603:10a6:208:cf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 04:23:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 04:23:05 +0000
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
X-Inumbo-ID: 5a970af7-1b8b-4c40-a9db-0730e868be01
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Trt2hdYIxmmzOI/aMsJVP5fb4Wmq6mGazEMGLBSY5Bfa8TXeXl+CV9AJXB+G4IjWk1OSH4AcXYa1yrlUuo7T3XzoyejdsdchtBa/x8ZBPeuhpgTitwxOSBkf+IXa6dULFkOyx2UZMWLWO5GC7ttpFMSlgCSIQgx4mCgAViLtgwPzPy3YKZfTkpWi4FyjhprZBoR8UzneMuvSLYWffYavHPswlzVes37DZm6S+NmBvio8WDFLfLH/PGMgY5WYA43U+HsVEhX2IzGY8j/12itzzzn4fJT3GXnM/uC0yJ+D/yiJLgC4K2xUcjO5osvd/5CriAv5L3yXn6LTNyO7mhLcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5/nJC3Ejo4dEXeyJ7Q7cuDsRvlFO+tjpz0+gtHrFn0g=;
 b=CgGFyoZgXM8FcF7Q+fTOd8rUuri/BzuiaIFnfTxPpueP6+sy/xyA4sqwr6Umh2aknWNu1jRb26r0R4Trj8Oxy0ot6KhKa2x6wsSSs7DQeVeKFMVWzzGobioCNlUhbIDjuJLkJLHzNYePiaQaKxYNRnXk+CPmOrIFGh7o1T9yYRkOPGH5IkY4TlSZEwKeYAXL/XizXdvrdtXrXp0mxwldWKydMERkTqgvF2QqCO0PiGGbXDlW9r/NifvF46G+lcvogj+MPeV78fKAZvPbG8mZdl6Ha84IorNlIwqLDSrM8YUyu/1KDd1fM7Ah3gUpwUhHCU9jqk/cZ6iQXnXzBNbZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/nJC3Ejo4dEXeyJ7Q7cuDsRvlFO+tjpz0+gtHrFn0g=;
 b=3AYlwfPT+Tkq0ERUMc2thENEq8EbiTxEmtL2jZpZYLiPXQT1rqNR4E8HGyHW7i13HRmbtRcFM81z74NwPM+UeYjqAjh8LAH1AIjYBd4wLcEr9LhyJx354HjuvW/0B4asGw3DoV2oKh2As9nq4oK9sNlfX5pZKvMoZyD3foiQXzutvao+bPPzQDYfOSoGPqtyFtBqyk7e+UKPiDdNrNwfBa61ZWr6PVZzfgLUJJ32l8alg2WAqjPfhbJ1W3dkIVcgyZFLtt7q7AhgeeXIuDkaSwEDDqWMHmKqAs4VekawQMEIxeuelXennUZ6IiwIhQlRqqfTMYTxr3pEL0hkSTpYLA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        Rahul Singh <rahul.singh@arm.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 9/9] vpci/header: Use pdev's domain instead of vCPU
Thread-Topic: [PATCH 9/9] vpci/header: Use pdev's domain instead of vCPU
Thread-Index: AQHXoKux1/ZjebFtnUG1WufptJXen6uXHZ8AgAQFzQA=
Date: Thu, 9 Sep 2021 04:23:05 +0000
Message-ID: <63217fb0-c9cb-3777-7cd7-1046a27b62ba@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-10-andr2000@gmail.com>
 <214a8300-e818-321c-7618-185c56684db0@suse.com>
In-Reply-To: <214a8300-e818-321c-7618-185c56684db0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f014c78-d658-486a-9502-08d97349851d
x-ms-traffictypediagnostic: AM0PR03MB4147:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB41472FED748A8D24B4496B17E7D59@AM0PR03MB4147.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qiiqYDyZCRxXKr9cFGCz6D60FnoQhHWOogbk4CEc0UsgiPcHqRUFY57Q7npW22e37NmMnyTrODXfwZeL11FZuvPrc7PoDbpfCR5TFR/RI7ROt2vgDXOOup3l8CRi/v742m8X7a5BNLjsTj1iaU1EZ26udPVR/6H7KkzJ+imOzhyrIKMViYBHITDH/j6YTjR0lNfHtoyRx0uQ4OOP06PpexPvbJgk71wpYk2RD68/7ntIVztZs7cdSIEv6sSsDxxdRgh3XdE1hJGxCnhxukQyLjEvxMXlZUDsYyiP5KOZMDj9riv/AKkLPRRn+8hmX7a+erdXKAJ118CdGn5X4ifYjTYxspd8NVOmrXxa83qYz3aQAyhN8MSFjByx2KYX73cXAJw7qbRSrqLVtA+qP/1+hIzpdpAE7t/2jSCYSvDO02NaVNbmr3ALJIotQ9I1/0pJa/uB40s6OFwFgucCu+1OSaHifWQWDL+2one8tkZApCl4h5X/C9nZFfthJAkeUzShf/5eOUN1ICui8v80Hb69OuDtfgoBlz6WkjoFCPshEOVRAgIMNN9ch4QwvMbb6daGMcAxa+j7JNJep8YFp+Ln/FJFP6M2xHDjitDJM3E9U9FxPXbsbVRSgqDoCaUO3SIjpbKltsKtZeae7sYRllBxVogA3i0rEKPe2gEkW4a6oY9vm+xXsxu+7YLVEFjFOfUs9oySyuDbylXIVkN4wmM+Z1unco15adMpp1bPAXQg+amjhv/ngSsQftLeVa+W3OPG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(122000001)(38100700002)(26005)(6506007)(53546011)(6512007)(478600001)(5660300002)(4744005)(31686004)(186003)(2906002)(316002)(66946007)(66446008)(66476007)(66556008)(8676002)(8936002)(31696002)(38070700005)(64756008)(86362001)(36756003)(2616005)(4326008)(6486002)(76116006)(110136005)(91956017)(54906003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU9ET3JCOUFSTTluUVFqN1RIdzdGdloxL05kaVFzc09MNThaVk01dVVGNHJm?=
 =?utf-8?B?ZkRxc3BIQUNBSjBIZzFNR2tXT1ZJam42N1daSldwZVNPVW5iU2pRWTJvNldJ?=
 =?utf-8?B?OWU5VWlQM0JWa0lVc0Z1WGZXUTZxSXpPRUpWYStsK0Vsb0NWUWFxSTF2MzdI?=
 =?utf-8?B?R0tpWXBlbFJkeXFWNjdEWnE1UFJVMUJLaVRFQUVHNzVETXlndEt5KzBYTm56?=
 =?utf-8?B?TnprazVCUElmTVJ3czJRcHd5bzk2bitBUnRMd1Q1ZDhkSHMrdHdFaG9scEQ1?=
 =?utf-8?B?Vm9Kelo0L0hKdWJRSHVXNTZoekRnWU9UR1A2VVhibFk0YTExQy81YVBqeU9Z?=
 =?utf-8?B?RzVqTmJKNk9FSUhYYjgyWVBidTJ5S1BOejMvcEZmU3VJZnV1b0tFNGs0U3lO?=
 =?utf-8?B?VFNrUEhmblBacURDRjVVYkwySzEzLzNwdkExT01oWENqcjEzcmVwaXhVZ2tp?=
 =?utf-8?B?aU5EVVVrYWxJcFp0ZmYvZ05PdHY5U0s1cnRjZVhZdzB3emNtL1JhYnJ1eVNQ?=
 =?utf-8?B?Z0tOWDZ0TmVtcWFUaFdFb1htTGVTY01rRnZMUGluZkZvWFc5aHNFWm1BbmdV?=
 =?utf-8?B?RE5icHV2czVod3d2aHA4c2JrOW9jOERxNFdWZy9EOFhKcDQzY1hoZHFRMlIx?=
 =?utf-8?B?aGVubUEvaXhVQS9VQVBUaU5obWNJNHlaU0tETjJodmduQVFQZVB0cm5udnJP?=
 =?utf-8?B?Yy9Ld3VHcjdsZXZCQmFobU5rYkhPV1dQWXRQOUYreXlqdkFKMjE2QmF3eWx4?=
 =?utf-8?B?bUZGVWg2QWlmQk9iVnB6bEtJVmIwN3JEbkNFd1pKbzVLQ2RYcU9TZmJBbDlT?=
 =?utf-8?B?RElEVEpWTWdqVURSMUVpWkkrMjVIUEo4ZnJ0bDd0bXpoQS81WVRhZnRST0Nu?=
 =?utf-8?B?SUl1dTFkZ2dkcVZIWmcyUlEzOVl2bHJDQTBQL0ovamZpK1BWSmdUenJKUUxY?=
 =?utf-8?B?T292TnR5ZFc4QlBSN3QycGU5azM5aXhObGdXaGtVWmFRaXZxeE5xaFBTeVhO?=
 =?utf-8?B?MEtQWXFxRS9TcHNneVFiSENmRDZmTlBhaGtkd1BZV2JpTkdnSXczZnErREQy?=
 =?utf-8?B?YTA4TFBvSkV4dzI5K2wxL1VlUk9aZng5ZkNkeW4xM2EwdWRPcmF6VVJoS1Aw?=
 =?utf-8?B?Vm55Z0x0b3ZqazB6OERVVXEvTDBXTlA0UDVQWHRCK200WEY3dXBTWTBGQ21w?=
 =?utf-8?B?N1BZSDRaMytTV1NZV2tiaFhGTDkxcG9UenBicXJXajg5aTA0NXQwWXNDSUNV?=
 =?utf-8?B?UnNqU3lra2Y5WGk5bWZYUE1hS3lkQXRhRDVCbmFpbmdIV3BXS0lrVDZyK0NE?=
 =?utf-8?B?SzVadEc3cVAvNW1PTXpPTUErRTFKSVQ2TXNVSnN5WlNLQnJOaUlYdFlEaU4y?=
 =?utf-8?B?TGc1eVMyTXNxZWlsSlVMalBJWHlydlZZdXVpL2RNZjRyVzhLTzRuanJKcFNi?=
 =?utf-8?B?RHdMNnpXZUtqTVlQU05RT29XSVVGeGRLaTdiZDhodmVtSzVORWZRS0cwT0c5?=
 =?utf-8?B?clJCWW1HNkl5cWZRa3dFcEE1MjJzSVN1N3JXL0lRWFk0ekRuakppTTRZb2hX?=
 =?utf-8?B?Q2ZGVDhsMjlNOEhNckw2VmJ0RUcwS2tYdWVTMVgrRHpubmw4L1Myb2VZTTV2?=
 =?utf-8?B?V1Nkem51cndTM3ZrSEVLYiswWDUwTWIyWTdIdGgvNEJNRktnckg5S0RNYTZn?=
 =?utf-8?B?a200UGZPaUQySW5CWUFLL3pETWRnaXkvTStTTkY0SEY1ZjdaWnhHZ0hoNUVD?=
 =?utf-8?Q?fUOHWII6csd/9eTTqlUVh0Ss18wP4m4lNcpJHhg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F67783780276D846B62198497CE4A277@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f014c78-d658-486a-9502-08d97349851d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 04:23:05.1088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hm3tR0oe8C/cInXbBJ4vO3ezK9zu9hQmNbsNz2KFYj9Ld5FXf9AgR6VFeP1QGGnHKOR/2MbhSVVrGtUqskeVNYAzRBnZxkOVzqtkIlJql6rWtrR2rdFoKhZavIPKsUuL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4147
X-Proofpoint-ORIG-GUID: JTWAHk33C3hnkyeG3x1VWUH21qC019FK
X-Proofpoint-GUID: JTWAHk33C3hnkyeG3x1VWUH21qC019FK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_01,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 mlxlogscore=805 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090026

DQpPbiAwNi4wOS4yMSAxNzo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogUmFodWwgU2lu
Z2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+Pg0KPj4gRml4ZXM6IDljMjQ0ZmRlZjdlNyAoInZw
Y2k6IGFkZCBoZWFkZXIgaGFuZGxlcnMiKQ0KPiBJbiB3aGljaCB3YXkgaXMgdGhhdCBvcmlnaW5h
bCBjaGFuZ2UgYnJva2VuPw0KDQpBZnRlciBjb25zdWx0aW5nIHdpdGggQXJtIHdlIGRlY2lkZWQg
dGhhdCB0aGlzIHBhdGNoIGNhbiBiZSBkcm9wcGVkLg0KDQpJZiB3ZSBmYWNlIHNvbWUgaXNzdWUg
YW5kIG5lZWQgYmUgaXQgd2lsbCBiZSBzdWJtaXR0ZWQgc2VwYXJhdGVseQ0KDQo+IFRoZSB0aXRs
ZSBkb2Vzbid0DQo+IGNsYXJpZnkgdGhpcywgYW5kIHRoZSBkZXNjcmlwdGlvbiBpcyBlbXB0eSAu
Li4NCj4NCj4gSmFuDQo+

