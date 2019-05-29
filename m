Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC522DC11
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVwvT-0001se-Tb; Wed, 29 May 2019 11:39:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYmT=T5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hVwvR-0001sT-PU
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:39:21 +0000
X-Inumbo-ID: 65fe12be-8206-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65fe12be-8206-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 11:39:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0Kx5xn7SuZQ1Z1IPtAE7TmgugBltWOuBga8oa9wGXZ4bypeFwa+AzZGY4AuxtUR5LRSqfuL0OE
 H6AYMZhkAkNuNru6JvSzixseNHn1fp/R4LJdlN1JTdpa+26U04q3prAhIafqHwU+K6wb5ZYqay
 n6TqmmpdWPqjAJIIkBnwDYEGtiko/OwGA3wE8f+EIh0+B+WVLbZ39C1N8UFKj9q2CP/hLsgxe/
 e7thAxQXE75Dp8o1zg2ieWzbs99YwzP8fBOzssi59sSSDZwItA3rBqB5PycO+H8kLZ4BDo3qTa
 o1A=
X-SBRS: 2.7
X-MesageID: 1036351
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1036351"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23790.28482.572598.843984@mariner.uk.xensource.com>
Date: Wed, 29 May 2019 12:38:42 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <23789.37660.726217.578999@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
 <23789.37660.726217.578999@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch,
 osstest, redux
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Olaf
 Hering <olaf@aepfle.de>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiU3RhYmxlIHRyZWVzICg0LjYgYW5kIDQuNyksIGJ1aWxkaW5n
IG9uIHN0cmV0Y2gsIG9zc3Rlc3QsIHJlZHV4Iik6Cj4gSSBhbSBzdGlsbCBzdHJ1Z2dsaW5nIHdp
dGggdGhpcy4gIDQuNyBhbmQgNC42IHN0aWxsIGRvIG5vdCBidWlsZC4KCkkgaGF2ZSBub3cgcHVz
aGVkIGFsbCBvZiB0aGVzZSB0byA0LjYgYW5kIDQuNyBhbmQgaXQgYnVpbGRzIGZvciBtZS4KSSB3
aWxsIGtpbGwgdGhlIGN1cnJlbnQsIGRvb21lZCwgNC42IGFuZCA0LjcgZmxpZ2h0cy4KCj4gMS4g
VGhhdCBvbGQgaXB4ZSBpcyBqdXN0IHRvbyBiYWRseSBicm9rZW4uICBJIHNwZW50IGEgbG9uZyB3
aGlsZQo+IHRyeWluZyB0byBiYWNrcG9ydCBjb21waWxlciBmaXhlcyBidXQgaXQgaXMgdG90YWxs
eSByaWRpY3Vsb3VzLiAgSU1PCj4gb3VyIG9ubHkgc2Vuc2libGUgb3B0aW9uIGlzIHRvIHVwZGF0
ZSBhdCBsZWFzdCBvc3N0ZXN0J3MgYnVpbGRzeCB0byBhCj4gbXVjaCBuZXdlciBpcHhlLgo+IAo+
IFRoaXMgY291bGQgYmUgZG9uZSBieSBjaGVycnkgcGlja2luZwo+ICAgICAgMzhhYjk5YjI2YmY0
Mjk4YTMzMTA1ZWM2NmYzZjZhM2Y3ZTA1YTMyNgo+ICAgICAgICBpcHhlOiB1cGRhdGUgdG8gbmV3
ZXIgY29tbWl0Cj4gKHdoaWNoIGlzIGZyb20geGVuIDQuOCBpc2gpIG9udG8gb3VyIDQuNyBhbmQg
NC42IGJyYW5jaGVzLgo+IAo+IElmIHRoaXMgaXMgZmVsdCB0b28gaW50cnVzaXZlLCB0aGVuIEkg
Y291bGQgc29tZWhvdyBtYWtlIGl0Cj4gY29uZGl0aW9uYWwgYW5kIGhhdmUgb3NzdGVzdCB1c2Ug
aXQuICBUaGlzIGlzIG5vdCBlbnRpcmVseSB0cml2aWFsCj4gYmVjYXVzZSB3ZSBoYXZlIGFuIGFk
IGhvYyBwYXRjaCBhcHBsaWNhdGlvbiB0aGluZy4KPiAKPiBJJ20gc29ydCBvZiB0ZW1wdGVkIHRv
IGhhdmUgb3NzdGVzdCBhcmJpdHJhcmlseSBydW4KPiAgICBnaXQgY2hlcnJ5LXBpY2sgMzhhYjk5
YjI2YmY0Mjk4YTMzMTA1ZWM2NmYzZjZhM2Y3ZTA1YTMyNgo+IGF0IHNvbWUgYXBwcm9wcmlhdGUg
cG9pbnQuLi4KClRoaXMgYXBwbGllZCBjbGVhbmx5IHRvIGJvdGguCgo+IDIuIGh2bWxvYWRlciBm
YWlscyB0byBidWlsZCwgSSB0aGluayBiZWNhdXNlIHdlIG5lZWQKPiAgICAgNzgyNWFlMTJkZjFm
NmQ0OGM0ZDAwOWNiYmRmNWE1NWFmZjI3MjkxYgo+ICAgICAgIGVycm5vOiBpbnRyb2R1Y2UgRUlT
RElSL0VST0ZTL0VOT1RFTVBUWSB0byB0aGUgQUJJCj4gICAgIDAzNzIwZWE1NDEzODJhM2NhODBl
YWFlYzJhYTExOTMyYjAzYWFjYWYKPiAgICAgICBlcnJubzogZGVjbGFyZSBhbGlhc2VzIHVzaW5n
IFhFTl9FUlJOTygpCj4gICAgIDY3NzkwMjA1ZGYyNmU3YzNkZmVlZjhiOGU2NDE5NGViYzI3OTIy
MGQKPiAgICAgICBwdWJsaWMvZXJybm86IFJlZHVjZSBjb21wbGV4aXR5IG9mIGluY2x1c2lvbgo+
ICAgICAzMDVlOTU3ZmZlZTk0ZmMwNmM0YmE1M2VmNTU2MmYxYjhjMWM2YjAyCj4gICAgICAgaHZt
bG9hZGVyOiB1c2UgeGVuL2Vycm5vLmggcmF0aGVyIHRoYW4gdGhlIGhvc3Qgc3lzdGVtcyBlcnJu
by5oCj4gCj4gSXMgYmFja3BvcnRpbmcgdGhhdCBsb3QgT0sgPwoKVGhlc2Ugd2VyZSBub3QgbmVl
ZGVkIGZvciA0LjcuCgo+IAo+IFRoZXJlIGFyZSBhbHNvIHNvbWUgc2ltcGxlIGJhY2twb3J0cyB3
ZSBuZWVkOgo+ICAgIGMyYTE3ODY5ZDVkY2Q4NDVkNjQ2YmY0ZGIxMjJjYWQ3MzU5NmEyYmUKPiAg
ICAgIGxpYmZzaW1hZ2U6IHJlcGxhY2UgZGVwcmVjYXRlZCByZWFkZGlyX3IoKSB3aXRoIHJlYWRk
aXIoKQo+ICAgIGI5ZGFmZjlkODExMjg1ZjFlNDA2NjliYzYyMWMyMjQxNzkzZjdhOTUKPiAgICAg
IGxpYnhsOiByZXBsYWNlIGRlcHJlY2F0ZWQgcmVhZGRpcl9yKCkgd2l0aCByZWFkZGlyKCkKClRo
ZXNlIHdlcmUgbm90IG5lZWRlZCBmb3IgNC43Cgo+ICAgIDY2OGU0ZWRmOTJmY2Y3Y2I5MjllZWQy
MjEwNTlhM2VlYjAyNzIyYzMKPiAgICAgIHN0dWJkb206IG1ha2UgR01QIGF3YXJlIHRoYXQgaXQn
cyBiZWluZyBjcm9zcy1jb21waWxlZAo+ICAgIDJmOWViNzNjMmUyZDdmZGRhOGUyNTg2YzIwZjdk
YmQ4NTYwMDJlYmEKPiAgICAgICBzdHViZG9tOiBmaXggc3R1YmRvbS12dHBtIGJ1aWxkCgpUaGVz
ZSB3ZXJlIG5lZWRlZCBmb3IgNC42IGFuZCA0LjcuICBUaGUgbGFzdCBxdW90ZWQgY29tbWl0IHRo
ZXJlIGlzCndyb25nICh0aGUgcXVvdGVkIGNvbW1pdCBpZCBpcyBhIGxvY2FsIG9uZSBvZiBtaW5l
KS4gIEl0IHNob3VsZCByZWFkOgoKICAgICA3NzkxNzkwYzdhYjk3Yzg1MzA2ZGNlNzQ5YzZjOGVi
NTZkMWRjMGRhCiAgICAgICAgc3R1YmRvbTogZml4IHN0dWJkb20tdnRwbSBidWlsZAoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
