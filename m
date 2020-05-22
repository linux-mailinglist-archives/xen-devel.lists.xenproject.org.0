Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BD1DE2A3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3he-0003TT-8c; Fri, 22 May 2020 09:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jc3hd-0003TL-6N
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:10:53 +0000
X-Inumbo-ID: 228f853e-9c0c-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 228f853e-9c0c-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 09:10:52 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +G6WDXfExI75jnQA6JOAuo3eKtLOQIbvPajZy4U9rP2rbRs+BCQw/WcfvkMLNDb88PCNp0JJYj
 d/xkxzEn3zfJ375XYbTGaUrdeLdhNGFhg9T6V/v0ViHAVjsBwXz+9cKz9jFDUICW9HRj+iFgtP
 VPbJWTVpNZ6tBsFUllcmooTOYXyh6HmgbTQ80230OfU/gJ6C12PkprOjHKBa69kX1xCz+lytJ9
 4MF2dOdyRqIgUXss7Uh3x7+tZA7SPVsvK71fRNZhZvyCdQJxGEbR6wsSic+eRCNnbVmsiE0Bl3
 TCw=
X-SBRS: 2.7
X-MesageID: 18423670
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18423670"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
Thread-Topic: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
Thread-Index: AQHWLYCfnvKV6FW89kWP3GSPgwH2N6iyfZwA
Date: Fri, 22 May 2020 09:10:48 +0000
Message-ID: <4510049C-2AD1-4AE4-B0E5-F4231450EDB6@citrix.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE6482AAEA84DC4B9DAEA5E44713F5EE@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE1heSAxOSwgMjAyMCwgYXQgMjo1NCBBTSwgSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IEdlbmVyYWwgaWRlYSBpcyB0byBhbGxvdyBmcmVlbHkg
c2V0IGRldmljZV9tb2RlbF92ZXJzaW9uIGFuZA0KPiBkZXZpY2VfbW9kZWxfc3R1YmRvbWFpbl9v
dmVycmlkZSBhbmQgY2hvb3NlIHRoZSByaWdodCBvcHRpb25zIGJhc2VkIG9uIHRoaXMNCj4gY2hv
aWNlLiAgQWxzbywgYWxsb3cgdG8gc3BlY2lmaWMgcGF0aCB0byBzdHViZG9tYWluIGtlcm5lbC9y
YW1kaXNrLCBmb3IgZ3JlYXRlcg0KPiBmbGV4aWJpbGl0eS4NCg0KRXhjaXRlZCB0byBzZWUgdGhp
cyBwYXRjaCBzZXJpZXMgZ2V0IGluLiAgQnV0IEkgZGlkbuKAmXQgcmVhbGx5IG5vdGljZSBhbnkg
ZG9jdW1lbnRzIGV4cGxhaW5pbmcgaG93IHRvIGFjdHVhbGx5IHVzZSBpdCDigJQgaXMgdGhlcmUg
YSBibG9nIHBvc3QgYW55d2hlcmUgZGVzY3JpYmluZyBob3cgdG8gZ2V0IHRoZSBrZXJuZWwgLyBp
bml0cmQgaW1hZ2UgYW5kIHNvIG9uPw0KDQpBbHNvLCB3b3VsZCBpdCBiZSBwb3NzaWJsZSB0byBh
ZGQgYSBmb2xsb3ctdXAgc2VyaWVzIHdoaWNoIG1vZGlmaWVzIFNVUFBPUlQubWQgYW5kIENIQU5H
RUxPRy5tZD8NCg0KVGhhbmtzLA0KIC1HZW9yZ2U=

