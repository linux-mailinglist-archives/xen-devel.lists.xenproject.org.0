Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F267A49A60
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 09:21:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd8OF-00047E-6n; Tue, 18 Jun 2019 07:18:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RPg2=UR=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hd8OD-000479-Cz
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 07:18:45 +0000
X-Inumbo-ID: 4d9344ef-9199-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::71f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4d9344ef-9199-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMq0skjKp900JoEAauIL8Ahrg3NsRUqwfJimNF1z0G8=;
 b=Ng33FImMMvGiu0vNwQcKxu73tWHXIPOT1Oo2oMCzydHjJKKLAw/Od9OcUL/eZneBfKMfowKxFPoQu5ldjimttBBJ6HtHwDbrlgEI4y72I776/Sa4yLYpld+PftL/9MPJhj1d9JWvq6Oz/80Xzf5EeadNkkaDK1h9EYQC1j+bQxM=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2893.eurprd02.prod.outlook.com (10.171.101.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Tue, 18 Jun 2019 07:18:41 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 07:18:41 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>
Thread-Topic: [PATCH RESEND] MAINTAINERS: hand over vm_event maintainership
Thread-Index: AQHVIfB521hhIJZ7jUKD/iwJLM85x6ahCDUA
Date: Tue, 18 Jun 2019 07:18:40 +0000
Message-ID: <d83354bd-bccc-bf5e-1196-5132a8157972@bitdefender.com>
References: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
In-Reply-To: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0214.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::34) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4201912-a508-466f-7e8b-08d6f3bd3056
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2893; 
x-ms-traffictypediagnostic: VI1PR0202MB2893:|VI1PR0202MB2893:
x-microsoft-antispam-prvs: <VI1PR0202MB2893339BC1AE7D93B3D47CC0ABEA0@VI1PR0202MB2893.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(2906002)(7736002)(25786009)(229853002)(31696002)(107886003)(7416002)(2616005)(99286004)(86362001)(76176011)(6486002)(31686004)(486006)(102836004)(2201001)(558084003)(478600001)(4326008)(71190400001)(71200400001)(256004)(6512007)(26005)(14454004)(6246003)(53936002)(6436002)(54906003)(316002)(81156014)(3846002)(66066001)(81166006)(5660300002)(36756003)(8676002)(386003)(6116002)(476003)(66946007)(6506007)(68736007)(110136005)(73956011)(52116002)(64756008)(186003)(66476007)(66556008)(446003)(66446008)(2501003)(8936002)(305945005)(53546011)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2893;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rwofzFgmyVD9HNDExV/EAbuhHRoiEsF6cCt/WoQAmN1hz8LJyycZKGWqHZb3uw6sOUVGOYFwMXFtj3OVayGuicBdr7kGWgZY1ncWpSkYKHFK5xkCBsUjkpx/tgV0rsGzj62IfA1u8RxCymVvk7/UBVlk5pCYVEYeJQ/ZmmdRMRxWaGLUe+FAgwXYMiVyRGc6TLPpQ1oiw67OEUsThJ3RrT/G2c2L379eorjUjGf5SViXQlqLBA6o9RhcUWcqiA0Wn4nVcWGyik03MbcgOMcx1kdU3n0JBi2aYUkX9A8zGoPAajUz7hL9zVtrAeukXS52U2UEwbQeIW4AzPSlc1mFijPm5j0Zf63R76S/coo1rZMHk0zImypQiXA6A1CfX7EAvfFApEw72YE0mrfOXr6kZduzz0awrnoctyTsonY8XhY=
Content-ID: <8CF14B074E91FF42ADE5DD41FD84AF95@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4201912-a508-466f-7e8b-08d6f3bd3056
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 07:18:40.9050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2893
Subject: Re: [Xen-devel] [PATCH RESEND] MAINTAINERS: hand over vm_event
 maintainership
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEzLjA2LjIwMTkgMTc6MDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4gUmVtb3Zl
IG15c2VsZiBhcyB2bV9ldmVudCBtYWludGFuZXIsIGFkZCBBbGV4YW5kcnUgYW5kIFBldHJlIGFz
DQo+IEJpdGRlZmVuZGVyIHZtX2V2ZW50IG1haW50YWluZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KDQpBY2tlZC1i
eTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
