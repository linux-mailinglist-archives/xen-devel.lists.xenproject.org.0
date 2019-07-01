Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB05BF91
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:17:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhy1b-0007A6-Gt; Mon, 01 Jul 2019 15:15:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhy1a-00079t-3X
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:15:22 +0000
X-Inumbo-ID: 086147dc-9c13-11e9-b4c4-93c61a6e7d68
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 086147dc-9c13-11e9-b4c4-93c61a6e7d68;
 Mon, 01 Jul 2019 15:15:18 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:11:43 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:08:34 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=aIap1GXg9iMuQN21+XRUeg0iM5u/Gy+rA39DAk0sIQaYD6FvEZb/3oick5o+i1EPL+4A2FD8cw45aBmAcbGlCtGx7/35StYc+YBUS4oU4ia3SHSosmldA/j4z1kXeqpoBf0ih3vXA4etdOd5Uoa4oVvUiK8FwhxBeCAH9y6MLmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXpDcDHMIkQtzhxPSiUPsq62Q0S0LEGlWV9Ox1KjXuc=;
 b=KzgchyqLBcNxIgrhaqIKO+A98OCMBzcuyPaCPLR7jOOYYfEHHkoyiK2qzZAMi9v9jm3uqrGxqThMgZylgvgrCffmlbGhKf3N/uxHCwNptghFihNnu9zvEuCTkS/LfoJSIrsuI2LKKW2OF6At4gekL8cFQWBi4LizF+OOY0KeVBs=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3220.namprd18.prod.outlook.com (10.255.137.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 1 Jul 2019 15:08:32 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:08:32 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Thread-Topic: Xen 4.11.2 released
Thread-Index: AQHVMB7ZzpReHQt5nkm9zyd/HyxZXA==
Date: Mon, 1 Jul 2019 15:08:32 +0000
Message-ID: <f66998f7-20e1-81ec-37b1-e67f441f0a1b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::43)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbf7bc87-12c9-460a-0f08-08d6fe35fb69
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3220; 
x-ms-traffictypediagnostic: BY5PR18MB3220:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR18MB3220557D3BB6232D104ACDAAB3F90@BY5PR18MB3220.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(189003)(199004)(6506007)(386003)(5660300002)(2351001)(86362001)(8676002)(486006)(102836004)(31686004)(2501003)(2906002)(966005)(14454004)(316002)(25786009)(476003)(72206003)(81156014)(8936002)(7116003)(3846002)(99286004)(81166006)(6116002)(31696002)(53936002)(4744005)(478600001)(7736002)(5640700003)(71190400001)(71200400001)(36756003)(2616005)(6306002)(66066001)(52116002)(6512007)(80792005)(450100002)(4326008)(6916009)(186003)(305945005)(14444005)(66446008)(64756008)(6486002)(66556008)(256004)(68736007)(66476007)(6436002)(73956011)(66946007)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3220;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DJ0ufh4clnK8D6MhWWtpFCCFwh5NuDhjURSnH5yN9YKfxbSrbxsBYucO4ft4m5y//YKRgZJWfGPAd05hw4n8RFOt0HkSwfq7gPM5JvQZZ+iXyBWf4zU/0KqyPIqPHDHJVV9k5eClyGQycyAUqVub9hImzZaUyQaQZV2XsNVrWLLxcXVC2Dn0ES5yhQFbwQFzD8O/r3JF2g13O+PXxLJaZEJE3dqyZYjSpCpdQ/e4cthQeDfFsCx9+88tdf3YT5YkkC4WwexIdoEMV8uXU4Sc6R6NzwBOuB1jKXhQh7EyeQFdklz4DVRLSKwN4bY0QTJFGE6nA20NXxcwiA/lLh7IpAi+/Cw2wmSHDvQbxsbed8sUYzCFfQqIUhbtyxIt+oDT2me4xQG5n3yGSx7t1QUxZLXxGsMHcBFDiXHO7ZQ032k=
Content-ID: <3C56C5DADE39F142A0AE959D768ED950@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf7bc87-12c9-460a-0f08-08d6fe35fb69
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:08:32.6690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3220
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Xen 4.11.2 released
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLA0KDQpJIGFtIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2Ugb2YgWGVuIDQuMTEu
Mi4gVGhpcyBpcyBhdmFpbGFibGUNCmltbWVkaWF0ZWx5IGZyb20gaXRzIGdpdCByZXBvc2l0b3J5
DQpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1y
ZWZzL2hlYWRzL3N0YWJsZS00LjExDQoodGFnIFJFTEVBU0UtNC4xMS4yKSBvciBmcm9tIHRoZSBY
ZW5Qcm9qZWN0IGRvd25sb2FkIHBhZ2UNCmh0dHBzOi8veGVucHJvamVjdC5vcmcvZG93bmxvYWRz
L3hlbi1wcm9qZWN0LWFyY2hpdmVzL3hlbi1wcm9qZWN0LTQtMTEtc2VyaWVzL3hlbi1wcm9qZWN0
LTQtMTEtMi8NCih3aGVyZSBhIGxpc3Qgb2YgY2hhbmdlcyBjYW4gYWxzbyBiZSBmb3VuZCkuDQoN
CldlIHJlY29tbWVuZCBhbGwgdXNlcnMgb2YgdGhlIDQuMTEgc3RhYmxlIHNlcmllcyB0byB1cGRh
dGUgdG8gdGhpcw0KbGF0ZXN0IHBvaW50IHJlbGVhc2UuDQoNClJlZ2FyZHMsIEphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
