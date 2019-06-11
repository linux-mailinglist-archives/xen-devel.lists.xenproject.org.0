Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5053D5E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halsY-0008AT-C9; Tue, 11 Jun 2019 18:52:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYfD=UK=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1halsX-0008AL-2W
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:52:17 +0000
X-Inumbo-ID: 07929491-8c7a-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::60b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07929491-8c7a-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmpTJqa+wQqitvnT0x1YpoKTWD7Powo15D6NSIH2ZHo=;
 b=flZQjw9EKb53fJ1HPf8Ej0dYhdoaop7eNE2TolkNWp/btxDg0QNSRhqoTmkiu05e2gOS1zoyqBwBBfGQwENd5UeES7tf9FqSbur6fFuOHKLTy4Pavzatmt9VCHK7STvt1JpIYgNBWeSqNab3orv215XfXXkzGFL9LPXoMCU6Pip0tlOtHPB0BhEieHyHeyoR55lDMvwXwDXNHrTUUWNyabds9219giF4etrx8VQRJCXo5czNcfZSCdGe0xbKXHuldL6P0M6elj5MNhaN0/cEtIJ0LHQNnFIwQEOae6hJNHWskJrV8dEMlKV6a5DgoB33UPsiaWrQ0pnFS0RrHqfmbA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4020.eurprd03.prod.outlook.com (52.135.147.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 18:52:13 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1965.011; Tue, 11 Jun 2019
 18:52:13 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
Thread-Index: AQHVC+yMHILNn8cZtESyMQqnzza/oKaNVxqAgAABAACACZ2bAA==
Date: Tue, 11 Jun 2019 18:52:13 +0000
Message-ID: <87wohs6jkz.fsf@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
In-Reply-To: <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad3dd168-c652-479b-a00b-08d6ee9deacb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4020; 
x-ms-traffictypediagnostic: AM0PR03MB4020:
x-microsoft-antispam-prvs: <AM0PR03MB4020E090C5BA8C7BC25CEFCBE6ED0@AM0PR03MB4020.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(14444005)(54906003)(86362001)(256004)(7416002)(316002)(71200400001)(11346002)(6916009)(2616005)(476003)(71190400001)(486006)(446003)(5660300002)(6116002)(80792005)(7736002)(305945005)(99286004)(3846002)(26005)(53936002)(66946007)(4326008)(229853002)(53546011)(6436002)(6506007)(76116006)(76176011)(68736007)(8936002)(36756003)(73956011)(72206003)(25786009)(102836004)(186003)(6486002)(6512007)(55236004)(91956017)(6246003)(8676002)(64756008)(66556008)(66476007)(66066001)(2906002)(14454004)(81156014)(81166006)(478600001)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4020;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sKC9UW+LiDdxD1DddT9gVlD3uK0jG6XHSsNBLrE6STabY8BePYIB9+bOyNdOIvyPMRyXB97r4M0GV4Js+rrjRIJUHkmZmQecp2fLlCFtJeMZgTnEwmt9zPcZsHzILtRNCSgtFubpA7xc+q2UBfh8UzOSFGq6wha9uY/FVEMOjiEDZ2H2gGxa1Ct1cHvKO376KMLhchq2MAIcpOy7wKyk1H2tkxAiMl2i4+sHfso18kpcH0pNwcEjDIQtDOa85Fbfti2W+W4N8Acm1ugBaX6lVOlWeCJS6UNoJrc6k19TMxhRwWDDBoslMYZ8XKr50VZrgfPwbg/7i+OtLd20jlJh3PaOEi4HgsT9mVpoUNscLIgPSEcxKtb0SygZzjfJyDo3fl+s/VEtPfbFeMtxTTpzMrK7RRxXzwh7o9DFGU9otEc=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3dd168-c652-479b-a00b-08d6ee9deacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:52:13.5573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4020
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIEp1bGllbiwgSmFuLAoKSnVsaWVuIEdyYWxsIHdyaXRlczoKCj4+Pj4+IE9uIDE2LjA1
LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOgo+Pj4gQXMg
YnVpbGQgc3lzdGVtIG5vdyBzdXBwb3J0cyAqX2RlZmNvbmZpZyBydWxlcyBpdCBpcyBnb29kIHRv
IGJlIGFibGUKPj4+IHRvIGNvbmZpZ3VyZSBtaW5pbWFsIFhFTiBpbWFnZSB3aXRoCj4+Pgo+Pj4g
ICBtYWtlIHRpbnk2NF9kZWZjb25maWcKPj4+Cj4+PiBjb21tYW5kLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPj4K
Pj4geW91IGhhZCBvYmplY3Rpb25zIGhlcmUsIGFuZCB0aGUgZmlyc3QgcGF0Y2ggbWFrZXMgbGl0
dGxlIHNlbnNlCj4+IHdpdGhvdXQgdGhlIDJuZC4gTWF5IEkgYXNrIHdoYXQgdGhlIHZlcmRpY3Qg
aXMsIGkuZS4gd2hldGhlciBJIHNob3VsZAo+PiBkcm9wIHRoZXNlIHR3byBmcm9tIG15IGxpc3Qg
b2YgcGVuZGluZyBwYXRjaGVzPwo+Cj4gVm9sb2R5bXlyIHdhcyBnb2luZyB0byByZXNlbmQgdGhl
IHNlcmllcyB3aXRoIGRvY3VtZW50YXRpb24gKGFzIGEKPiBzZXBhcmF0ZSBwYXRjaCkuIEJ1dCBJ
IHdvdWxkIGJlIGhhcHB5IHRvIHRha2UgIzEgYW5kICMyIGFzc3VtaW5nIHRoYXQKPiBkb2N1bWVu
dGF0aW9uIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHNlbnQuCgpZZXMsIHNvcnJ5IGZvciB0aGUgZGVs
YXkuIEknbSBnb2luZyB0byBzZW5kIHJlc2VuZCB0aGUgc2VyaWVzIHNvb24uIEJ1dApJIGNhbiBz
ZWUsIHRoYXQgZmlyc3QgdHdvIHBhdGNoZXMgYXJlIGFscmVhZHkgaW4gdGhlIHN0YWdpbmcgYnJh
bmNoLgpTaG91bGQgSSByZXNlbmQgdGhlIHdob2xlIHNlcmllcyBpbiB0aGlzIGNhc2U/IE9yIHNp
bmdsZSBwYXRjaCB3aXRoIHRoZQptaXNzaW5nIGRvY3VtZW50YXRpb24gd2lsbCBiZSBzdWZmaWNp
ZW50PwoKQW5kIGFub3RoZXIsIHNsaWdodGx5IHJlbGF0ZWQgcXVlc3Rpb246IEknbSBub3Qgc3Vy
ZSB3aGF0IHRvIGRvIHdpdGggbXkKcGF0Y2ggdG8gZ2V0X21haW50YWluZXIucGwgc2NyaXB0LiBT
aG91bGQgSSByZXNlbmQgdGhlIG5ldyB2ZXJzaW9uPyBKYW4KaGFkIGNvbW1lbnRzIG9ubHkgdG8g
Y29tbWl0IG1lc3NhZ2UuLi4KCi0tCkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1awpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
