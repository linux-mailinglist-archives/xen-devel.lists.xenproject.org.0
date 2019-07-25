Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49F74922
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 10:29:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqZ4l-0008TD-3l; Thu, 25 Jul 2019 08:26:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqZ4j-0008T8-IR
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 08:26:09 +0000
X-Inumbo-ID: d9459b51-aeb5-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d9459b51-aeb5-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 08:26:07 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /ozy+IqfhaJGHpxItM9OO56g3jDQOJwoJtGey938XRI7eF8l/RFH3+7lyfnxdGzfPGPjMp2fNk
 Y9mhGCjtyTi4fYbtaq6o9bY7/yybGOxuglMd4HE3wAMTwwA1/ms6pRWEeYOYPl7mBufyqfJ/y6
 HEvJRNWqm0p3Yu0MYSXJdL2A2uKFICTeKCekjTRvYKGMMI3B5QbFybkS/Q+n7EC6+eST8LQZqS
 fdLfJ7oEpA/lIbZF4mjU0rkJ8TQyXjA2gl9AgOq+Nn8Rtdwg2Srs7chSmb80m5e0TUmN8slris
 Dwk=
X-SBRS: 2.7
X-MesageID: 3503757
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3503757"
Date: Thu, 25 Jul 2019 10:25:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <christopher.w.clark@gmail.com>
Message-ID: <20190725082550.z7baryjjwxahdmkc@Air-de-Roger>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725005326.3553-1-christopher.w.clark@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDU6NTM6MjZQTSAtMDcwMCwgY2hyaXN0b3BoZXIudy5j
bGFya0BnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9w
aGVyLncuY2xhcmtAZ21haWwuY29tPgo+IAo+IGdjYyA5LjEuMCByZXBvcnRzOgo+IAo+IHwgdGVz
dC1jcHUtcG9saWN5LmM6NjQ6MTg6IGVycm9yOiAnJS4xMnMnIGRpcmVjdGl2ZSBhcmd1bWVudCBp
cyBub3QgYSBudWwtdGVybWluYXRlZCBzdHJpbmcgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0K
PiB8ICAgIDY0IHwgICAgICAgICAgICAgZmFpbCgiICBUZXN0ICclLjEycycsIGV4cGVjdGVkIHZl
bmRvciAldSwgZ290ICV1XG4iLAo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiB8IHRlc3QtY3B1LXBvbGlj
eS5jOjIwOjEyOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICdmYWlsJwo+IHwgICAgMjAg
fCAgICAgcHJpbnRmKGZtdCwgIyNfX1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAgICBcCj4gfCAg
ICAgICB8ICAgICAgICAgICAgXn5+Cj4gfCB0ZXN0LWNwdS1wb2xpY3kuYzo2NDoyNzogbm90ZTog
Zm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKPiB8ICAgIDY0IHwgICAgICAgICAgICAgZmFp
bCgiICBUZXN0ICclLjEycycsIGV4cGVjdGVkIHZlbmRvciAldSwgZ290ICV1XG4iLAo+IHwgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Cj4gfCB0ZXN0LWNwdS1wb2xpY3ku
Yzo0NDo3OiBub3RlOiByZWZlcmVuY2VkIGFyZ3VtZW50IGRlY2xhcmVkIGhlcmUKPiB8ICAgIDQ0
IHwgICAgIH0gdGVzdHNbXSA9IHsKPiB8ICAgICAgIHwgICAgICAgXn5+fn4KPiAKPiBzbyBpbmNy
ZWFzZSB0aGUgc3RyaW5nIGFycmF5IHNpemUgYnkgb25lIGNoYXJhY3RlciBmb3IgdGhlIG51bGwg
c3RyaW5nCj4gdGVybWluYXRvciBhbmQgYWRkIGFub3RoZXIgc2luZ2xlIGNoYXIgdG8gdGhlIHN0
cnVjdCB3aXRoaW4gdGhlIHNhbWUKPiB1bmlvbiB0byBiYWxhbmNlIGl0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5j
b20+CgpUaGFua3MhIEp1c3QgdHdvIG5pdHMgYmVsb3cuCgo+IC0tLQo+ICB0b29scy90ZXN0cy9j
cHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jIGIvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90
ZXN0LWNwdS1wb2xpY3kuYwo+IGluZGV4IGNhM2I4ZGQ0NWYuLmM5MTQwOGE5M2EgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+ICsrKyBiL3Rv
b2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUtcG9saWN5LmMKPiBAQCAtMzUsOSArMzUsMTAg
QEAgc3RhdGljIHZvaWQgdGVzdF92ZW5kb3JfaWRlbnRpZmljYXRpb24odm9pZCkKPiAgewo+ICAg
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB0ZXN0IHsKPiAgICAgICAgICB1bmlvbiB7Cj4gLSAgICAg
ICAgICAgIGNoYXIgaWRlbnRbMTJdOwo+ICsgICAgICAgICAgICBjaGFyIGlkZW50WzEzXTsKPiAg
ICAgICAgICAgICAgc3RydWN0IHsKPiAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGIsIGQsIGM7
Cj4gKyAgICAgICAgICAgICAgICBjaGFyIG51bGxfdGVybWluYXRvcjsKCkRvIHlvdSByZWFsbHkg
bmVlZCB0aGlzIGZpZWxkIGhlcmUsIEFGQUlDVCBpdCdzIHVudXNlZC4gVGhlIGNvbXBpbGVyCndp
bGwgYWRkIHRoZSBwYWRkaW5nIGhlcmUgYXV0b21hdGljYWxseSB0byBtYXRjaCB0aGUgc2l6ZSBv
ZiB0aGUgb3RoZXIKZmllbGQgb2YgdGhlIHVuaW9uLgoKQWxzbywgc2luY2UgaWRlbnQgaXMgbnVs
bCB0ZXJtaW5hdGVkIG5vdyB5b3UgY2FuIHJlbW92ZSB0aGUgLjEyIGZyb20KdGhlIGZvcm1hdCBz
dHJpbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
