Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D9499E6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 09:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd8BM-0003BF-Pk; Tue, 18 Jun 2019 07:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0qio=UR=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hd8BK-0003BA-NB
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 07:05:26 +0000
X-Inumbo-ID: 6fc9e004-9197-11e9-9f80-934d13214891
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.112]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fc9e004-9197-11e9-9f80-934d13214891;
 Tue, 18 Jun 2019 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQR3Ndf3ZrlYhisowavcHqbGbxYFzmBzshl/0LEJxpM=;
 b=tcdE9w6z6dLtzmQTpbSq5CxEyeb8u0m7RoVWqEoifCnLScXQajqoM4Vbax+edierLoIPgJGEg+JXgglwe7Oe5tf0vsqjb14NlTQYIL/obceIMqsZsHFdfLdwtkaBWsu5iZVc+36ascfag7auHrTr+0pwZxMg6VUaq3l7jrvX21I=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB3745.eurprd02.prod.outlook.com (52.134.84.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 07:05:20 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 07:05:20 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>
Thread-Topic: [PATCH RESEND] MAINTAINERS: hand over vm_event maintainership
Thread-Index: AQHVIfB/Wo8VFdYmRkKZyCDlBCT+nKahBHyA
Date: Tue, 18 Jun 2019 07:05:20 +0000
Message-ID: <a2c0b4a4e6759adf46716ef0e8449864d5a68489.camel@bitdefender.com>
References: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
In-Reply-To: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::16) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea730d7-4008-49af-c732-08d6f3bb530d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB3745; 
x-ms-traffictypediagnostic: AM0PR02MB3745:|AM0PR02MB3745:
x-microsoft-antispam-prvs: <AM0PR02MB3745712680B5B9F525C4DD2AD6EA0@AM0PR02MB3745.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(66946007)(66066001)(186003)(102836004)(26005)(110136005)(2201001)(86362001)(54906003)(118296001)(71190400001)(71200400001)(36756003)(2906002)(256004)(316002)(53936002)(76176011)(52116002)(99286004)(6506007)(386003)(50226002)(68736007)(229853002)(478600001)(2501003)(8676002)(6436002)(66476007)(66446008)(486006)(81166006)(66556008)(14454004)(305945005)(64756008)(11346002)(6246003)(81156014)(25786009)(7736002)(107886003)(2616005)(558084003)(6512007)(6116002)(476003)(446003)(3846002)(6486002)(7416002)(5660300002)(73956011)(4326008)(8936002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3745;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Oxzpw4PXT3IvoNRUraLOHuA4qUkIRrORPBvtdcvk2ZpygvMbqsZAZ791o5AeOG9T/FKd1NAKnbYqFCF8IZ28SUELziRcscz2TiH+yX5csq/NMYR/zm//46E4CwLEer4dVlRsNkahu2wfjJhz8gFEXAIJIGCwQsqXtlHlkYiPTVvuxCPRK0USI2daFBXeWCPko0Yiyk8SF7sbzJyLQHWpFEWN6oUSiYkHUrf1eAeUX8+IogzazUQrnbXsLbA4Jipvk16FGxWdASQy6GWR1dRH4VJGkfCFi1O5aW2OXg7zDs1X4xRQYHkFxfDf7gwBvbTHUaWC/oBVFs7dcf5YA+nrmtOx+AbLRR45zY4GQki9Z90IE2fsnvAhPkhCEAv9pEmxObRHOukEqwNkk7Q95sU3O7vv7eDLXdsLxEbm0QTEkc=
Content-ID: <484D2BA8126BEC408D3BAF88D4B7BE00@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea730d7-4008-49af-c732-08d6f3bb530d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 07:05:20.0298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3745
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA2LTEzIGF0IDE3OjAwICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6
DQo+IFJlbW92ZSBteXNlbGYgYXMgdm1fZXZlbnQgbWFpbnRhbmVyLCBhZGQgQWxleGFuZHJ1IGFu
ZCBQZXRyZSBhcw0KPiBCaXRkZWZlbmRlciB2bV9ldmVudCBtYWludGFpbmVycy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4N
Cj4gDQpBY2tlZC1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
