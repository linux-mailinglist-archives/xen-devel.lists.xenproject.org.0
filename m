Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9F2F8F9
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 11:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWGzy-0004Bf-J5; Thu, 30 May 2019 09:05:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F1hi=T6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hWGzw-0004BW-PR
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:05:20 +0000
X-Inumbo-ID: 0a54f68c-82ba-11e9-926c-c320021da75b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a54f68c-82ba-11e9-926c-c320021da75b;
 Thu, 30 May 2019 09:05:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: aBplbNA/WMGkMc/J2ip2EK0NgXuurtETkZl/wHpgaB49eUBiKhSkOkrOCKsm28n+ktMDKIeVu+
 YHoap1iqwMDWGcc+D3hMKoWC74SNkGjYToLbLZjxQRzB3fFMAXv9v/xqrVNkwHZQlh4L+gPs+e
 36AqyUnl8zemBzC1j58jYxfdCc0J7Rkn9UjkfHnW4NYbzTF7ecO4XQ9oVv1YG65PjgFKym/LvX
 HAIGlN/ixvOIEpcI97LmPVh1PxhME7f1PXiPoUPTEwODg+JbX5NrPTMEcnczHnKAQSjuMrPn9T
 xoU=
X-SBRS: 2.7
X-MesageID: 1095995
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,530,1549947600"; 
   d="scan'208";a="1095995"
From: George Dunlap <George.Dunlap@citrix.com>
To: Baodong Chen <chenbaodong@mxnavi.com>
Thread-Topic: [PATCH] xen: 'keyhandler' is not used in null scheduler
Thread-Index: AQHVFquFkfAQzFEf20KAP57rGRKi6qaDPq+A
Date: Thu, 30 May 2019 09:05:08 +0000
Message-ID: <BBCA5C60-5657-47B6-8B7B-B1206AFA2561@citrix.com>
References: <1559195244-7692-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559195244-7692-1-git-send-email-chenbaodong@mxnavi.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.8)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <D1A944AC6167354895131DEB2B4DBE3C@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: 'keyhandler' is not used in null
 scheduler
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE1heSAzMCwgMjAxOSwgYXQgNjo0NyBBTSwgQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9u
Z0BteG5hdmkuY29tPiB3cm90ZToNCj4gDQo+IFNvIHJlbW92ZSAna2V5aGFuZGxlci5oJyBpbmNs
dWRlLg0KPiBBbHNvIGFkZCAnc3RhdGljJyBwcmVmaXggZm9yICdzY2h1ZF9idWxsX2RlZicNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4N
Cg0KVGhhbmtzIGZvciB0aGUgcGF0Y2gg4oCUIHRoZXNlIGNoYW5nZXMgbG9vayBnb29kLiAgSSB0
aGluayB0aGUgdGl0bGUgd291bGQgYmUgYmV0dGVyIHNvbWV0aGluZyBsaWtlOg0KDQp4ZW4vc2No
ZWRfbnVsbDogU3VwZXJmaWNpYWwgY2xlYW4tdXBzDQoNClRoZW4ganVzdCBsaXN0IGJvdGggaW4g
YnVsbGV0IHBvaW50czsgc29tZXRoaW5nIGxpa2U6DQoNCiogUmVtb3ZlIHVudXNlZCBkZXBlbmRl
bmN5IOKAmGtleWhhbmRsZXIu4oCZaA0KKiBNYWtlIHNjaGVkX251bGxfZGVmIHN0YXRpYw0KDQpX
b3VsZCB5b3UgbWluZCByZS1zZW5kaW5nIHRoZSBwYXRjaD8gIFlvdSBjYW4gYWRkOg0KDQpSZXZp
ZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpUaGFu
a3MsDQogLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
