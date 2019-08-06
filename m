Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7D82F92
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 12:15:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huwRt-0008FG-QH; Tue, 06 Aug 2019 10:12:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkML=WC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1huwRs-0008FB-7Y
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 10:12:08 +0000
X-Inumbo-ID: a5101437-b832-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5101437-b832-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 10:12:07 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B8jSuKFhvkDrXL4ByKiuW0XlMwPtWlGBiCHPEYLd4u0iMs+2cA02s4MywyV6KiyrLe1g/eNObE
 oamvFzA661c9iZTlrorFdCq6WHWE4grOnqad74X7IJkz/AUyTulsLhNltKbKXPNnSdnu3GXmdC
 Wz2loTwkRzed6PjWhhz9neG1kz+Q2SlQ/xw1uQ83rkYYX0Nd5Y89oeLsWCwCjbtwkvut4N7jGP
 CtSIErvYrxhf9XjJRxG8LSRV9S8s/p+nBSB1iok2CUFMYIvG6pg4ht2lOMUZYlQxpPl+hIQVl5
 FQo=
X-SBRS: 2.7
X-MesageID: 4061561
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4061561"
Date: Tue, 6 Aug 2019 11:12:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20190806101204.GL1242@perard.uk.xensource.com>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
 <c8a008e4cca343e8ac9928660057764b01b8ef2f.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8a008e4cca343e8ac9928660057764b01b8ef2f.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 0/3] automation: build Xen in openSUSE
 Tumbleweed
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTE6NDQ6MTFBTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gQW55d2F5LCBpdCBzZWVtcyB0aGF0LCBpbiBhZGRpdGlvbiB0byB0aGUgb25lIEkg
bWVudGlvbmVkIHRvIEFudGhvbnkgYQo+IGZldyBkYXlzIGFnbywgd2UgYWxzbyBtaXNzIHRoaXMg
ZnJvbSB1cHN0cmVhbT8KPiAKPiBjb21taXQgMmQyMDIzYzNiOTllZGIzM2FkNGJiOTc5MWY3MDQ1
NmVhMWExYzA0OQo+IHNvY2tldHM6IGF2b2lkIHN0cmluZyB0cnVuY2F0aW9uIHdhcm5pbmdzIHdo
ZW4gY29weWluZyBVTklYIHBhdGgKPiAKPiBBbnRob255LCBkbyB5b3UgdGhpbmsgaXQncyBmaW5l
IHRvIGltcG9ydCB0aGF0IHBhdGNoPyBPciBzaG91bGQgSSB0cnkKPiB0byByZWJ1aWxkIGFuZCBz
ZWUgaWYgcnVuIGludG8gdGhlIGlzc3VlIHRoaXMgdGltZSwgYW5kIGlmIHRoYXQgcGF0Y2gKPiBm
aXhlcyBpdD8KCkkndmUgcHVzaGVkIHRoYXQgcGF0Y2ggYW5kIHRoYXQgb3RoZXIgb25lOgogIGNj
Yjc5OTMxM2E1OTI2YTZhYTQ5MDE4YmJjNjdmZTYxNjVmYWQ3ZjMKICBody91c2I6IGF2b2lkIGZv
cm1hdCB0cnVuY2F0aW9uIHdhcm5pbmcgd2hlbiBmb3JtYXR0aW5nIHBvcnQgbmFtZQoKd2l0aCB0
aG9zZSB0d28gSSBjb3VsZCBidWlsZCBhIHFlbXUgaW4gdGhlIHR1bWJsZXdlZWQgY29udGFpbmVy
LCBidXQKdGhlcmUgYXJlIG1heWJlIG90aGVyIGNvbW1pdCBtaXNzaW5nLgoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
