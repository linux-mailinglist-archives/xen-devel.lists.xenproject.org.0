Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E97402DCD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181290.328385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNf4m-00022i-86; Tue, 07 Sep 2021 17:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181290.328385; Tue, 07 Sep 2021 17:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNf4m-0001yt-2z; Tue, 07 Sep 2021 17:40:04 +0000
Received: by outflank-mailman (input) for mailman id 181290;
 Tue, 07 Sep 2021 17:40:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNf4k-0001hT-6i
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:40:02 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a012b290-1002-11ec-b118-12813bfff9fa;
 Tue, 07 Sep 2021 17:40:00 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187HdHfK008599; 
 Tue, 7 Sep 2021 17:39:58 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3axcp0801p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 17:39:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5698.eurprd03.prod.outlook.com (2603:10a6:208:171::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 17:39:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 17:39:54 +0000
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
X-Inumbo-ID: a012b290-1002-11ec-b118-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/MK8hwg9nGOd8gb5Ws2edbdyv778uQwgZPVMD8b+MKRAhCje0TQO+6XghwEA/CMt4CL7T8OP25/0yBU1JJK9LwJbX42boTbze8fAs1LBuuIC9ve+VPx+fBlLcFEtKiuuE3Wq55kgOD/Fcsdf9l9nAAsCiin/fXvmWjutQzWdtmWdJLZZygWeE2OMAIK0rV50LNDhLv6lgQz4M19/OeAJr3QXoNCpx/xGtCJsY5779MElfqOAamLM1p0YpcSA3TwXy+0xRBPNJt1pVYKvqThanG+4wHPdSuCGvjlNs1U1v4fxQChYwZt9k1foSd6jjt6Y8IJ1y8NU2FijK/zDJ9yLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q5ycq2nXR5FZX0BWbi7FjueKCXrfpTy2STsvy440gaU=;
 b=m3PQuJB9rfpJ7tobfCoYCGotDjtY0ZSRCuIPwWb0H3YUZlpqPW7PQHb1UrEsz38j/tFd5SGHKEmioCbAEU2gIy/JeCQBwupJ9JPxo7XknQXuNZoqS7fKruOtFnreDaEiLS16Ifte/GYOjudqFcfxWEn2wl8DMZsgOliS3O5uC1T5Es1vLC81IejbkBG8AXDRMeAzBjEwfVOET3aMMI4GmC6r5AYlNsf8T783PVSWr8Y15HCVQSXmVtohnDUQ2Lr53xTAmagjEOMo1cu9peX3/1ZGifMBqRfAo/urD5v+I77lN/M2kHAnaf8irF78vYsUXjnOpQST4JC+xN2hLEErWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ycq2nXR5FZX0BWbi7FjueKCXrfpTy2STsvy440gaU=;
 b=tksrpfuOZn1tf3LjUt99XqNea3nx3XZMXcP3hSp6uUx3lSRSDiz56nJ1Blp2YNLSWTc9wj/Ij5d0RggXqKTGJGIXWqDhW89090QmxC3qaeEkVWguAfLwFGykY9CvHmHUIPF5E4PF6j2CEBu/7/UvNzB3K7LBmaaqJuw9mr/FY7Rd93CztytyZ1B0ngRyfNYPu6m6EC6QKlUXQiIscHnraSB2KLoH1+xlUqLoftKLaoyRyQlPVQUBtE63rLj0EKbzWNNak+bwZEm6E0iZLPvpv10Y6DPqhtqr6cxvKa5RwgEDF36grslOVDNeUpEmiYjxmRK44UhrmaWtTekr3sKtYA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Topic: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Index: AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLICAADFtgIAAE0qA
Date: Tue, 7 Sep 2021 17:39:53 +0000
Message-ID: <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
In-Reply-To: <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d665de14-4035-41cd-b75d-08d97226808c
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5698D597C0C97051001595D2E7D39@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6vuZpvrPAynKg2di+1hAuLDCecb9fCfpWYcYFaKhzenTyjgH7XHdpMreUOVeFagECEenqt4xbKzBmczAaBUtObPYKoR3/wnQ8rkvq3Nxk7G3lqGEWm6H0hNkv4wKWxQ2JUddWO1RtlsBK927krBJqDK1mgkVlQW1Wwc6CVt26yiY4FA8auOKStotRpK2tb2YYsLvMHXMOe1PrYZL9h2zLR7AG36dgGm6bPEp3O2ib+U7vjzviEg+HGkWc3YTIHursq7ftM+BjlSxO5tM1gZZhITZCyCj6ttbPe0Xg0Y6Auub71mGCNLMgDaQQ2wfpj9zlxkRIAss1QVWDuypuTznZSOnlVPiEdJe7Z6Q1Nv2D/oQtgJOnV2OPaVc9u7+WYcUyyIsGEPTUzOGI6OZlwoT/hHy7O0/AAwjnmDUiPKULzjjzjmIFrma2/zsklkgotXlPpMLQeHtyqcyEK21y9Bgo+5MylyalULZW9zWC2R0cX8eXvPzavhhBZPikNmy9Lu9U506Y4McI4anbCP6DBKqIJNC8hVd8GYjTJ8jtyrvSIv5HlTxdDM2htQe+n9hVzRPM7Fa3gM1Ni5delgukedj2GcofsVSr6jutodgtoufLU9zS57vcJDmrtRHypeWuPc8YnMESjqbz15YNaUUMkup28lJ6gZyeN1mVgwZk+Evpl6Ufgihi7bgC2/mank2hdwA8dHbFryJUOhWslAae0HDLV/TkFFyFOWzvbnB5NKDrShi4PKAtmjFvU7PzlWz0MJg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(66946007)(31686004)(64756008)(38070700005)(66446008)(66556008)(36756003)(316002)(86362001)(66476007)(53546011)(76116006)(8936002)(6486002)(6506007)(2906002)(478600001)(31696002)(8676002)(71200400001)(83380400001)(122000001)(110136005)(26005)(38100700002)(54906003)(186003)(4326008)(2616005)(5660300002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SUM4VW5WSHA0VXhTalBLSlFyZFdHanlOdEV4a2J2czVTbGg1UHNRbnNXbUwr?=
 =?utf-8?B?d1pOdDVacGF1emdYQ09UL3lrcUtZaWZrVW5wNDJpbXkwOVJjMHVMNWx3TVZZ?=
 =?utf-8?B?cy82TnF2MmVKa1luclBQV1lzMVBJRGJOZXJIOHRuNnpQZHFUdjdxb2pHckl6?=
 =?utf-8?B?ZFZYZWdxSmNZY0dvQXRZc3oyRm1wM2NRZW9MbDhyaXBWZWw4Z0xaZjJnWWpS?=
 =?utf-8?B?VmtOZmxOZHQ2NUtoM0hGWnR5dzVydE5EcFRudFEvaUxYeVV6c0phUVJNUFA0?=
 =?utf-8?B?aUFSaXlQQjlYUndQbWNvTXhoU3V1cGJnYWZ0dUhwOERjclAvWGRtYWNybDEx?=
 =?utf-8?B?S2dRYWVxellmZW5rN3Q5WC9JVjNLUEVjQ3poVkcvbkFOQTFvNHRUMElWZnNy?=
 =?utf-8?B?NzlMOENqRkt3SkJsUVpWQTZIcXRDaDVUejlxMVJKSDROQjlyVENodE9aUE9B?=
 =?utf-8?B?UTYwNFpiTXJuSlJSaFVtanVBNW4wb2J5L05mNmk2Yk1mczZKZWYzRTFnVW1R?=
 =?utf-8?B?d1ZnaWc2bi95VDNzejhrZWc1RzdzaFZqVTVZMTZLUy9pQVZmeWNwcjlYQ1RE?=
 =?utf-8?B?amVJcnFSMnpxZDhUTzhIclRsUHYvQng3c1YwK1EvUW5hTzhnMTBWckkvN3hT?=
 =?utf-8?B?VjRZcGRLMGNVckZpQTlkKzBVNFJLK1Q5KzJmck45ZXJQalNtRXZJOERSYVpa?=
 =?utf-8?B?UFFrazdpdXg1VnU2aUlkZ0dBWmwwQ0lmL0tFb3g4MDJUem9IcWk5Yi9Zdndy?=
 =?utf-8?B?bHhpMEVoMVFDaHRZR0JSUjRZeG1HSmZrWmJBbXlKYnZwZk5haitqcnpiQ3lo?=
 =?utf-8?B?S0NWMkxMZWlmU1BKNVQvSXdveWxqN2RwdDh6VXNwRXJHN0p2M2NsZHMyVFRL?=
 =?utf-8?B?WkhOSWMwV1Q1WUZ2NStvdUI4WUFieUNnd3o4SFhvS0JJV2YvcCsxS0ZXZXlV?=
 =?utf-8?B?Wlltak1rR2lIcXRCTTIva3c2aFFHQmFLRTBET2dIUE4xM3d6bWRYWnQwNGhn?=
 =?utf-8?B?Y0ZMS3JubEUzY2oxa1ZnZnVSQkl6ZlJOVE9DU0dKZSt6T054b2lXSHVSNzQy?=
 =?utf-8?B?NjM1Q1RkdUFpeURjRTFtbTdiUzRQRldVTjdmVDRpamtkZ3JxbjgxRUpGYm13?=
 =?utf-8?B?TDRIVWlrMlRIUTNaVHNzRzVYdWxoM3FqUytHaHdsMkhKaXpqTGpMY2FiRnhj?=
 =?utf-8?B?Q0x4UFAwYWR2SmdvVjBkM3BCc01HWXlBd3N1SWpCSzZnUW9zWmVDaXRna21w?=
 =?utf-8?B?dnp5RXZKa0tRYjdWaXoxeVNnWFljb3ZXZyttN0ZvL3RDWXRLOFRrdDhweU9V?=
 =?utf-8?B?b1VXcWp3bTlqMGlBcDg4Yks4ZmV1L1RMYUNTeEZxQVFxOTMzdEpQY1ZoTjEw?=
 =?utf-8?B?RUQybVpORDhTWk5aeFF6YVFCemxhcmNwTVBGT2t0eWZ5M1NjTVU1dWdITERi?=
 =?utf-8?B?ZXErbGF2ZFJsV0pQWUNHRmYwcWpXalVkWmxlb3BGNkdUK05iVGtWWkZKUUIz?=
 =?utf-8?B?TW05ZWZNcCtyRStDcFhjeUJZRlQ2NG1yUkw1cGtDTUVTcnJXU0V4M2g2QTRX?=
 =?utf-8?B?ZmtkY3phbTVPTDZEbmw5MEtxNzJZeXh0RzJUR0NuYnVWWE5nT0N1T0g0aHZ4?=
 =?utf-8?B?Z0Mxa3BPTlRTRXBPK3hxbCtHNlBUc3ZUMmdWSmNncnE4MThSaEJLb2VKU1Ux?=
 =?utf-8?B?c0FselI3WnNZQjR1VVJiNkxOc1RwMkxEV2w0TEd3NlBsYW11b1NRTCtad1NQ?=
 =?utf-8?Q?HJ4PaUIuYRSMejkel5OzfnL3728WaB5MTuqEvUg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D12DE7B3F3E954297B1A39DBC5196F3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d665de14-4035-41cd-b75d-08d97226808c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 17:39:53.9639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsgvCCCFxy/Zfb0OtDOxEVWxGSJnts0euCdkHfWPRsRSjR2CZbFM7KnRrGeblQyV7mavMN0uogZnPIYM1uKjRvZ+Da07Za362kDQ37uh7Gjzo/TxLCZ4RDEShwgSRjH/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
X-Proofpoint-ORIG-GUID: DjBeJHtbMsIyhGXSYA36Cy7vhdlgs_tP
X-Proofpoint-GUID: DjBeJHtbMsIyhGXSYA36Cy7vhdlgs_tP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109070114

DQpPbiAwNy4wOS4yMSAxOTozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTU6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDYuMDkuMjEgMTc6
MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gQEAgLTQwMCwx
MiArNDAwLDcyIEBAIHN0YXRpYyB2b2lkIGJhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4gICAgc3RhdGljIHZvaWQgZ3Vlc3RfYmFyX3dy
aXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKQ0K
Pj4+PiAgICB7DQo+Pj4+ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KPj4+PiAr
ICAgIGJvb2wgaGkgPSBmYWxzZTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggYmFyLT50eXBlID09
IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIEFTU0VSVChy
ZWcgPiBQQ0lfQkFTRV9BRERSRVNTXzApOw0KPj4+PiArICAgICAgICBiYXItLTsNCj4+Pj4gKyAg
ICAgICAgaGkgPSB0cnVlOw0KPj4+PiArICAgIH0NCj4+Pj4gKyAgICBlbHNlDQo+Pj4+ICsgICAg
ICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KPj4+PiArICAgIGJhci0+Z3Vl
c3RfYWRkciAmPSB+KDB4ZmZmZmZmZmZ1bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+Pj4+ICsgICAg
YmFyLT5ndWVzdF9hZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+PiBX
aGF0IHlvdSBzdG9yZSBoZXJlIGlzIG5vdCB0aGUgYWRkcmVzcyB0aGF0J3MgZ29pbmcgdG8gYmUg
dXNlZCwNCj4+IGJhci0+Z3Vlc3RfYWRkciBpcyBuZXZlciB1c2VkIGRpcmVjdGx5IHRvIGJlIHJl
cG9ydGVkIHRvIGEgZ3Vlc3QuDQo+IEFuZCB0aGlzIGlzIHdoYXQgSSBxdWVzdGlvbiwgYXMgYW4g
YXBwcm9hY2guIFlvdXIgbW9kZWwgX21heV8gd29yaywNCj4gYnV0IGl0cyBuZWVkbGVzc2x5IGRl
dmlhdGluZyBmcm9tIGhvdyBwZW9wbGUgbGlrZSBtZSB3b3VsZCBleHBlY3QNCj4gdGhpcyB0byB3
b3JrLiBBbmQgaWYgaXQncyBpbnRlbmRlZCB0byBiZSB0aGlzIHdheSwgaG93IHdvdWxkIEkNCj4g
aGF2ZSBrbm93bj8NCldlbGwsIEkganVzdCB0cmllZCB0byBmb2xsb3cgdGhlIG1vZGVsIHdlIGFs
cmVhZHkgaGF2ZSBpbiB0aGUgZXhpc3RpbmcgY29kZS4uLg0KPg0KPj4gSXQgaXMgYWx3YXlzIHVz
ZWQgYXMgYW4gaW5pdGlhbCB2YWx1ZSB3aGljaCBpcyB0aGVuIG1vZGlmaWVkIHRvIHJlZmxlY3QN
Cj4+IGxvd2VyIGJpdHMsIGUuZy4gQkFSIHR5cGUgYW5kIGlmIHByZWZldGNoYWJsZSwgc28gSSB0
aGluayB0aGlzIGlzIHBlcmZlY3RseQ0KPj4gZmluZSB0byBoYXZlIGl0IHRoaXMgd2F5Lg0KPiBB
bmQgaXQgaXMgYWxzbyBwZXJmZWN0bHkgZmluZSB0byBzdG9yZSB0aGUgdmFsdWUgdG8gYmUgaGFu
ZGVkDQo+IGJhY2sgdG8gZ3Vlc3RzIG9uIHRoZSBuZXh0IHJlYWQuIEtlZXBzIHRoZSByZWFkIHBh
dGggc2ltcGxlLA0KPiB3aGljaCBJIHRoaW5rIGNhbiBiZSBhc3N1bWVkIHRvIGJlIHRha2VuIG1v
cmUgZnJlcXVlbnRseSB0aGFuDQo+IHRoZSB3cml0ZSBvbmUuIFBsdXMgc3RvcmVkIHZhbHVlcyBy
ZWZsZWN0IHJlYWxpdHkuDQo+DQo+IFBsdXMgLSBpZiB3aGF0IHlvdSBzYXkgd2FzIHJlYWxseSB0
aGUgY2FzZSwgd2h5IGRvIHlvdSBtYXNrIG9mZg0KPiBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNL
IGhlcmU/IFlvdSBzaG91bGQgdGhlbiBzaW1wbHkgc3RvcmUNCj4gdGhlIHdyaXR0ZW4gdmFsdWUg
YW5kIGRvIF9hbGxfIHRoZSBwcm9jZXNzaW5nIGluIHRoZSByZWFkIHBhdGguDQo+IE5vIHBvaW50
IGhhdmluZyBwYXJ0aWFsIGxvZ2ljIGluIHR3byBwbGFjZXMuDQoNCkkgd2lsbCBtb3ZlIHRoZSBs
b2dpYyB0byB0aGUgd3JpdGUgaGFuZGxlciwgaW5kZWVkIHdlIGNhbiBzYXZlIHNvbWUNCg0KQ1BV
IGN5Y2xlcyBoZXJlDQoNCj4NCj4+PiAgICBhcw0KPj4+IHlvdSBkb24ndCBtYXNrIG9mZiB0aGUg
bG93IGJpdHMgKHRvIGFjY291bnQgZm9yIHRoZSBCQVIncyBzaXplKS4NCj4+PiBXaGVuIGEgQkFS
IGdldHMgd3JpdHRlbiB3aXRoIGFsbCBvbmVzLCBhbGwgd3JpdGFibGUgYml0cyBnZXQgdGhlc2UN
Cj4+PiBvbmVzIHN0b3JlZC4gVGhlIGFkZHJlc3Mgb2YgdGhlIEJBUiwgYWl1aSwgcmVhbGx5IGNo
YW5nZXMgdG8NCj4+PiAodHlwaWNhbGx5KSBjbG9zZSBiZWxvdyA0R2IgKGluIHRoZSBjYXNlIG9m
IGEgMzItYml0IEJBUiksIHdoaWNoDQo+Pj4gaXMgd2h5IG1lbW9yeSAvIEkvTyBkZWNvZGluZyBz
aG91bGQgYmUgb2ZmIHdoaWxlIHNpemluZyBCQVJzLg0KPj4+IFRoZXJlZm9yZSB5b3Ugc2hvdWxk
bid0IGxvb2sgZm9yIHRoZSBzcGVjaWZpYyAiYWxsIHdyaXRhYmxlIGJpdHMNCj4+PiBhcmUgb25l
cyIgcGF0dGVybiAob3Igd29yc2UsIGFzIHlvdSBwcmVzZW50bHkgZG8sIHRoZSAiYWxsIGJpdHMN
Cj4+PiBvdXRzaWRlIG9mIHRoZSB0eXBlIHNwZWNpZmllciBhcmUgb25lcyIgb25lKSBvbiB0aGUg
cmVhZCBwYXRoLg0KPj4+IEluc3RlYWQgbWFzayB0aGUgdmFsdWUgYXBwcm9wcmlhdGVseSBoZXJl
LCBhbmQgc2ltcGx5IHJldHVybiBiYWNrDQo+Pj4gdGhlIHN0b3JlZCB2YWx1ZSBmcm9tIHRoZSBy
ZWFkIHBhdGguDQo+PiAiUENJIExPQ0FMIEJVUyBTUEVDSUZJQ0FUSU9OLCBSRVYuIDMuMCIsICJJ
TVBMRU1FTlRBVElPTiBOT1RFDQo+Pg0KPj4gU2l6aW5nIGEgMzItYml0IEJhc2UgQWRkcmVzcyBS
ZWdpc3RlciBFeGFtcGxlIiBzYXlzLCB0aGF0DQo+Pg0KPj4gIlNvZnR3YXJlIHNhdmVzIHRoZSBv
cmlnaW5hbCB2YWx1ZSBvZiB0aGUgQmFzZSBBZGRyZXNzIHJlZ2lzdGVyLCB3cml0ZXMNCj4+IDAg
RkZGRiBGRkZGaCB0byB0aGUgcmVnaXN0ZXIsIHRoZW4gcmVhZHMgaXQgYmFjay4iDQo+Pg0KPj4g
VGhlIHNhbWUgYXBwbGllcyBmb3IgNjQtYml0IEJBUnMuIFNvIHdoYXQncyB3cm9uZyBpZiBJIHRy
eSB0byBjYXRjaCBzdWNoDQo+PiBhIHdyaXRlIHdoZW4gYSBndWVzdCB0cmllcyB0byBzaXplIHRo
ZSBCQVI/IFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhhdA0KPj4gSSBjb21wYXJlIGFzDQo+PiAg
IMKgwqDCoMKgwqDCoMKgIGlmICggKHZhbCAmIFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0tfMzIp
ID09IFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0tfMzIgKQ0KPj4gd2hpY2ggaXMgYmVjYXVzZSB2
YWwgaW4gdGhlIHF1ZXN0aW9uIGhhcyBsb3dlciBiaXRzIGNsZWFyZWQuDQo+IEJlY2F1c2Ugd2hp
bGUgdGhpcyBtYXRjaGVzIHdoYXQgdGhlIHNwZWMgc2F5cywgaXQncyBub3QgZW5vdWdoIHRvDQo+
IG1hdGNoIGhvdyBoYXJkd2FyZSBiZWhhdmVzLg0KQnV0IHdlIHNob3VsZCBpbXBsZW1lbnQgYXMg
dGhlIHNwZWMgc2F5cywgbm90IGxpa2UgYnVnZ3kgaGFyZHdhcmUgYmVoYXZlcw0KPiAgIFlldCB5
b3Ugd2FudCB0byBtaW1pYyBoYXJkd2FyZSBiZWhhdmlvcg0KPiBhcyBjbG9zZWx5IGFzIHBvc3Np
YmxlIGhlcmUuIFRoZXJlIGlzIChpaXJjKSBhdCBsZWFzdCBvbmUgb3RoZXINCj4gcGxhY2UgaW4g
dGhlIHNvdXJjZSB0cmVlIHdlcmUgd2UgaGFkIHRvIGFkanVzdCBhIHNpbWlsYXIgaW5pdGlhbA0K
PiBpbXBsZW1lbnRhdGlvbiB0byBiZSBjbG9zZXIgdG8gb25lIGV4cGVjdGVkIGJ5IGd1ZXN0cywN
Cg0KQ291bGQgeW91IHBsZWFzZSBwb2ludCBtZSB0byB0aGF0IGNvZGUgc28gSSBjYW4gY29uc3Vs
dCBhbmQgcG9zc2libHkNCg0KcmUtdXNlIHRoZSBhcHByb2FjaD8NCg0KPiAgIG5vIG1hdHRlcg0K
PiB0aGF0IHRoZXkgbWF5IG5vdCBiZSBmb2xsb3dpbmcgdGhlIHNwZWMgdG8gdGhlIGxldHRlci4g
RG9uJ3QNCj4gZm9yZ2V0IHRoYXQgdGhlcmUgbWF5IGJlIGJ1Z3MgaW4ga2VybmVscyB3aGljaCBk
b24ndCBzdXJmYWNlIHVudGlsDQo+IHRoZSBrZXJuZWwgZ2V0cyBydW4gb24gYW4gb3Zlcmx5IHNp
bXBsaXN0aWMgZW11bGF0aW9uLg0KVGhpcyBpcyBzYWQuIEFuZCB0aGUga2VybmVsIG5lZWRzIHRv
IGJlIGZpeGVkIHRoZW4sIG5vdCBYZW4NCj4NCj4+Pj4gQEAgLTUyMiw2ICs1ODIsMTMgQEAgc3Rh
dGljIGludCBhZGRfYmFyX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sIGlzX2h3
ZG9tKQ0KPj4+PiAgICAgICAgICAgICAgICBpZiAoIHJjICkNCj4+Pj4gICAgICAgICAgICAgICAg
ICAgIHJldHVybiByYzsNCj4+Pj4gICAgICAgICAgICB9DQo+Pj4+ICsgICAgICAgIC8qDQo+Pj4+
ICsgICAgICAgICAqIEl0IGlzIG5laXRoZXIgc2FmZSBub3Igc2VjdXJlIHRvIGluaXRpYWxpemUg
Z3Vlc3QncyB2aWV3IG9mIHRoZSBCQVJzDQo+Pj4+ICsgICAgICAgICAqIHdpdGggcmVhbCB2YWx1
ZXMgd2hpY2ggYXJlIHVzZWQgYnkgdGhlIGhhcmR3YXJlIGRvbWFpbiwgc28gYXNzaWduDQo+Pj4+
ICsgICAgICAgICAqIGFsbCB6ZXJvcyB0byBndWVzdCdzIHZpZXcgb2YgdGhlIEJBUnMsIHNvIHRo
ZSBndWVzdCBjYW4gcGVyZm9ybQ0KPj4+PiArICAgICAgICAgKiBwcm9wZXIgUENJIGRldmljZSBl
bnVtZXJhdGlvbiBhbmQgYXNzaWduIEJBUnMgb24gaXRzIG93bi4NCj4+Pj4gKyAgICAgICAgICov
DQo+Pj4+ICsgICAgICAgIGJhcnNbaV0uZ3Vlc3RfYWRkciA9IDA7DQo+Pj4gSSdtIGFmcmFpZCBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQ6IFdpdGhvdXQgbWVtb3J5IGRlY29kaW5nDQo+
Pj4gZW5hYmxlZCwgdGhlIEJBUnMgYXJlIHNpbXBsZSByZWdpc3RlcnMgKHdpdGggYSBmZXcgci9v
IGJpdHMpLg0KPj4gTXkgZmlyc3QgaW1wbGVtZW50YXRpb24gd2FzIHRoYXQgYmFyLT5ndWVzdF9h
ZGRyIHdhcyBpbml0aWFsaXplZCB3aXRoDQo+PiB0aGUgdmFsdWUgb2YgYmFyLT5hZGRyIChwaHlz
aWNhbCBCQVIgdmFsdWUpLCBidXQgdGFsa2luZyBvbiBJUkMgd2l0aA0KPj4gUm9nZXIgaGUgc3Vn
Z2VzdGVkIHRoYXQgdGhpcyBtaWdodCBiZSBhIHNlY3VyaXR5IGlzc3VlIHRvIGxldCBndWVzdA0K
Pj4gYSBoaW50IGFib3V0IHBoeXNpY2FsIHZhbHVlcywgc28gdGhlbiBJIGNoYW5nZWQgdGhlIGFz
c2lnbm1lbnQgdG8gYmUgMC4NCj4gV2VsbCwgeWVzLCB0aGF0J3MgY2VydGFpbmx5IGNvcnJlY3Qu
IEl0J3MgcGVyaGFwcyB0b28gdW5vYnZpb3VzIHRvIG1lDQo+IHdoeSBvbmUgbWF5IHdhbnQgdG8g
dXNlIHRoZSBob3N0IHZhbHVlIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLiBJdA0KPiBzaW1wbHkg
aGFzIG5vIG1lYW5pbmcgaGVyZS4NCkRvIHlvdSB3YW50IG1lIHRvIHJlbW92ZSB0aGUgY29tbWVu
dD8NCj4NCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4+Pj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4+Pj4gQEAgLTEwMyw2ICsxMDMsNyBAQA0KPj4+
PiAgICAjZGVmaW5lICBQQ0lfQkFTRV9BRERSRVNTX01FTV9UWVBFXzY0CTB4MDQJLyogNjQgYml0
IGFkZHJlc3MgKi8NCj4+Pj4gICAgI2RlZmluZSAgUENJX0JBU0VfQUREUkVTU19NRU1fUFJFRkVU
Q0gJMHgwOAkvKiBwcmVmZXRjaGFibGU/ICovDQo+Pj4+ICAgICNkZWZpbmUgIFBDSV9CQVNFX0FE
RFJFU1NfTUVNX01BU0sJKH4weDBmVUwpDQo+Pj4+ICsjZGVmaW5lICBQQ0lfQkFTRV9BRERSRVNT
X01FTV9NQVNLXzMyCSh+MHgwZlUpDQo+Pj4gUGxlYXNlIGRvbid0IGludHJvZHVjZSBhbiBpZGVu
dGljYWwgY29uc3RhbnQgdGhhdCdzIG1lcmVseSBvZg0KPj4+IGRpZmZlcmVudCB0eXBlLiAodWlu
dDMyX3QpUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSyBhdCB0aGUgdXNlDQo+Pj4gc2l0ZSAoaWYg
YWN0dWFsbHkgc3RpbGwgbmVlZGVkIGFzIHBlciB0aGUgY29tbWVudCBhYm92ZSkgd291bGQNCj4+
PiBzZWVtIG1vcmUgY2xlYXIgdG8gbWUuDQo+PiBPaywgSSB0aG91Z2h0IHR5cGUgY2FzdGluZyBp
cyBhIGJpZ2dlciBldmlsIGhlcmUNCj4gT2Z0ZW4gaXQgaXMsIGJ1dCBpbW8gaGVyZSBpdCBpcyBu
b3QuIEkgaG9wZSB5b3UgcmVhbGl6ZSB0aGF0IH4weDBmVQ0KPiBpZiBub3QgbmVjZXNzYXJpbHkg
MHhmZmZmZmZmMD8gV2UgbWFrZSBjZXJ0YWluIGFzc3VtcHRpb25zIG9uIHR5cGUNCj4gd2lkdGhz
LiBGb3IgdW5zaWduZWQgaW50IHdlIGFzc3VtZSBpdCB0byBiZSBhdCBsZWFzdCAzMiBiaXRzIHdp
ZGUuDQo+IFdlIHNob3VsZCBhdm9pZCBhc3N1bXB0aW9ucyBvZiBpdCBiZWluZyBleGFjdGx5IDMy
IGJpdHMgd2lkZS4gSnVzdA0KPiBsaWtlIHdlIGNhbm5vdCAobW9yZSBvYnZpb3VzbHkpIGFzc3Vt
ZSB0aGUgd2lkdGggb2YgdW5zaWduZWQgbG9uZy4NCj4gKFdoaWNoIHRlbGxzIHVzIHRoYXQgZm9y
IDMyLWJpdCBhcmNoZXMgUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSyBpcw0KPiBhY3R1YWxseSBv
ZiB0aGUgd3JvbmcgdHlwZS4gVGhpcyBjb25zdGFudCBzaG91bGQgYmUgdGhlIHNhbWUgbm8NCj4g
bWF0dGVyIHRoZSBiaXRuZXNzLikNCk9rLCBJIHdpbGwgbm90IGludHJvZHVjZSBhIG5ldyBkZWZp
bmUgYW5kIHVzZSAodWludDMyX3QpDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2Fu
ZHINCg==

