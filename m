Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67576BBA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Ie-0004oW-Dj; Fri, 26 Jul 2019 14:34:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvJk=VX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hr1Id-0004oR-Lb
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:34:23 +0000
X-Inumbo-ID: 753f0500-afb2-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 753f0500-afb2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:34:21 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I3nTFLP8QRm8GAnnmbE/Mka+HHFL8tfYWUDPHlpWYa71aCWLg0j+TTiXks2El/x/GoXsgi90V+
 THxnQ7PjrovmwApTF/aZdh5nyjQggq6G/W+Fdj1OquigpFnFbX8TWcI5I9WlippWpdfx4Ppf7g
 NGGCXYtFEwMQ3gncTJH8QV7El9edYbQF8HC4/x1TZa6nTAi0usjy2TzGpgxphmxVt0FL2DELH7
 IoSYp5atRYxPKF7hjkqM6WJx3rPTQ8GRhbprzOwkVipZsBNNay6ykwL0W/dss3kRD4UmWHeS0e
 3RE=
X-SBRS: 2.7
X-MesageID: 3614297
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3614297"
Date: Fri, 26 Jul 2019 15:34:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Message-ID: <20190726143419.GF1242@perard.uk.xensource.com>
References: <20190726064300.27530-1-chen.zhang@intel.com>
 <20190726134730.GE1242@perard.uk.xensource.com>
 <9CFF81C0F6B98A43A459C9EDAD400D78061F318C@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CFF81C0F6B98A43A459C9EDAD400D78061F318C@shsmsx102.ccr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH V2] tools/libxl: Add iothread support for
 COLO
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6MTg6NDJQTSArMDAwMCwgWmhhbmcsIENoZW4gd3Jv
dGU6Cj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogQW50aG9ueSBQ
RVJBUkQgW21haWx0bzphbnRob255LnBlcmFyZEBjaXRyaXguY29tXQo+ID4gU2VudDogRnJpZGF5
LCBKdWx5IDI2LCAyMDE5IDk6NDggUE0KPiA+IAo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQg
MDI6NDM6MDBQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToKPiA+IFdoYXQgSSBoYWQgaW4gbWlu
ZCB3aGlsZSByZXZpZXdpbmcgdGhlIHYxIG9mIHRoZSBwYXRjaCB3YXMgdG8gcmVtb3ZlIGJvdGgK
PiA+IGBjb2xvX2lvdGhyZWFkJyBhbmQgYGNvbG9fY29tcGFyZV9pb3RocmVhZCcgZnJvbSB0aGUg
bGlieGwgQVBJIGFuZCB4bCBjb25maWcKPiA+IG9wdGlvbi4gSSBkb24ndCB0aGluayB0aGVyZSBh
cmUgdXNlZnVsLiBXaHkgZGlkIHlvdSBrZWVwIGBjb2xvX2lvdGhyZWFkJz8KPiAKPiBPaCwgaXQg
bG9va3MgSSBtaXN1bmRlcnN0b29kIHlvdXIgbWVhbnMuCj4gRG8geW91IHRoaW5rIHdlIGp1c3Qg
bmVlZCBoYXJkIGNvZGUgdGhlIGlvdGhyZWFkIG5hbWUgaGVyZT8KPiBGb3IgZXhhbXBsZSB0aGUg
ImlvdGhyZWFkLTEiPwoKWWVzLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGFyZCBjb2RlIGZvciBu
b3csIGJ1dCB3aXRoIGEgbmFtZSB3aGljaApiZXR0ZXIgZGVzY3JpYmUgd2hlcmUgdGhlIGlvdGhy
ZWFkIGlzIHVzZWQsIGhvdyBhYm91dAoiY29sby1jb21wYXJlLWlvdGhyZWFkLTEiID8KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
