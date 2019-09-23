Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB4BAED5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 10:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJEw-0002p4-6Z; Mon, 23 Sep 2019 07:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCJEu-0002oq-Ek
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 07:58:32 +0000
X-Inumbo-ID: ef3d2cf6-ddd7-11e9-95f5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef3d2cf6-ddd7-11e9-95f5-12813bfff9fa;
 Mon, 23 Sep 2019 07:58:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC162AE86;
 Mon, 23 Sep 2019 07:58:30 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
Date: Mon, 23 Sep 2019 09:58:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920160250.GA8065@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxODowMiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAxMjoxMDowOVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMTQuMDkuMjAxOSAxNzozNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEFsbG93IGRldmljZSBtb2RlbCBydW5uaW5nIGluIHN0dWJkb21haW4gdG8g
ZW5hYmxlL2Rpc2FibGUgSU5UeC9NU0koLVgpLAo+Pj4gYnlwYXNzaW5nIHBjaWJhY2suIFdoaWxl
IHBjaWJhY2sgaXMgc3RpbGwgdXNlZCB0byBhY2Nlc3MgY29uZmlnIHNwYWNlCj4+PiBmcm9tIHdp
dGhpbiBzdHViZG9tYWluLCBpdCByZWZ1c2UgdG8gd3JpdGUgdG8KPj4+IFBDSV9NU0lfRkxBR1Nf
RU5BQkxFL1BDSV9NU0lYX0ZMQUdTX0VOQUJMRS9QQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUKPj4+
IGluIG5vbi1wZXJtaXNzaXZlIG1vZGUuIFdoaWNoIGlzIHRoZSByaWdodCB0aGluZyB0byBkbyBm
b3IgUFYgZG9tYWluCj4+PiAodGhlIG1haW4gdXNlIGNhc2UgZm9yIHBjaWJhY2spLCBhcyBQViBk
b21haW4gc2hvdWxkIHVzZSBYRU5fUENJX09QXyoKPj4+IGNvbW1hbmRzIGZvciB0aGF0LiBVbmZv
cnR1bmF0ZWx5IHRob3NlIGNvbW1hbmRzIGFyZSBub3QgZ29vZCBmb3IKPj4+IHN0dWJkb21haW4g
dXNlLCBhcyB0aGV5IGNvbmZpZ3VyZSBNU0kgaW4gZG9tMCdzIGtlcm5lbCB0b28sIHdoaWNoIHNo
b3VsZAo+Pj4gbm90IGhhcHBlbiBmb3IgSFZNIGRvbWFpbi4KPj4KPj4gV2h5IHRoZSAiZm9yIEhW
TSBkb21haW4iIGhlcmU/IEkuZS4gd2h5IHdvdWxkIHRoaXMgYmUgY29ycmVjdCBmb3IKPj4gYSBQ
ViBkb21haW4/IEJlc2lkZXMgbXkgZGlzbGlrZSBmb3Igc3VjaCBhIGJ5cGFzcyAoaW1vIGFsbCBv
ZiB0aGUKPj4gaGFuZGxpbmcgc2hvdWxkIGdvIHRocm91Z2ggcGNpYmFjaywgb3Igbm9uZSBvZiBp
dCkgSSBjb250aW51ZSB0bwo+PiB3b25kZXIgd2hldGhlciB0aGUgcHJvYmxlbSBjYW4ndCBiZSBh
ZGRyZXNzZWQgYnkgYSBwY2liYWNrIGNoYW5nZS4KPj4gQW5kIGV2ZW4gaWYgbm90LCBJJ2Qgc3Rp
bGwgd29uZGVyIHdoZXRoZXIgdGhlIHJlcXVlc3Qgc2hvdWxkbid0IGdvCj4+IHRocm91Z2ggcGNp
YmFjaywgdG8gcmV0YWluIHByb3BlciBsYXllcmluZy4gVWx0aW1hdGVseSBpdCBtYXkgYmUKPj4g
YmV0dGVyIHRvIGhhdmUgZXZlbiB0aGUgbWFwL3VubWFwIGdvIHRocm91Z2ggcGNpYmFjayAoaXQn
cyBhdAo+PiBsZWFzdCBhbiBhcHBhcmVudCB2aW9sYXRpb24gb2YgdGhlIG9yaWdpbmFsIHBoeXNk
ZXYtb3AgbW9kZWwgdGhhdAo+PiB0aGVzZSB0d28gYXJlIFhTTV9ETV9QUklWKS4KPiAKPiBUZWNo
bmljYWxseSBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gbW92ZSB0aGlzIHBhcnQgdG8gcGNpYmFj
aywgYW5kIGluCj4gZmFjdCB0aGlzIGlzIHdoYXQgSSd2ZSBjb25zaWRlcmVkIGluIHRoZSBmaXJz
dCB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzLgo+IEJ1dCBSb2dlciBwb2ludHMgb3V0IG9uIGVhY2gg
dmVyc2lvblsxXSBvZiB0aGlzIHNlcmllcyB0aGF0IHBjaWJhY2sgaXMKPiBtZWFudCB0byBzZXJ2
ZSAqUFYqIGRvbWFpbnMsIHdoZXJlIGEgUENJIHBhc3N0aHJvdWdoIGlzIGEgY29tcGxldGVseQo+
IGRpZmZlcmVudCBkaWZmZXJlbnQgYmVhc3QuIEluIGZhY3QsIEkgZXZlbiBjb25zaWRlciB0aGF0
IHVzaW5nIHBjaWZyb250Cj4gaW4gYSBMaW51eCBzdHViZG9tYWluIGFzIGEgcHJveHkgZm9yIHFl
bXUgdGhlcmUgbWF5IGJlIGEgYmFkIGlkZWEgKG9uZQo+IG5lZWRzIHRvIGJlIGNhcmVmdWwgdG8g
YXZvaWQgc3R1YmRvbWFpbiBrZXJuZWwgZmlnaHRpbmcgd2l0aCBxZW11IGFib3V0Cj4gZGV2aWNl
IHN0YXRlKS4KCldlbGwsIG5vdCB1c2luZyBwY2liYWNrIF9hdCBhbGxfIGluIHRoaXMgY2FzZSB3
b3VsZCBiZSBhbm90aGVyIG9wdGlvbi4KV2hhdCBJIGRpc2xpa2UgaXMgdGhlIGZ1cnRoZXJpbmcg
b2YgaHlicmlkLW5lc3MuCgo+IEFueXdheSwgaWYgeW91IGFsbCBhZ3JlZSB0aGF0IHBjaWJhY2sg
c2hvdWxkIGJlIHRoZSB3YXkgdG8gZ28sIEkgY2FuIGdvCj4gdGhhdCByb3V0ZSB0b28uIEluIHBy
YWN0aWNlLCBpdCB3b3VsZCBiZSBhIGZsYWcgKHNldCBieSB0aGUgdG9vbHN0YWNrPykKPiBhbGxv
d2luZyB3cml0ZXMgdG8gYXBwcm9wcmlhdGUgY29uZmlnIHNwYWNlIHJlZ2lzdGVycyBkaXJlY3Rs
eSAod2l0aAo+IGFwcHJvcHJpYXRlIGNoZWNrcywgYXMgaW4gdGhpcyBwYXRjaCkuCgpJJ20gYWZy
YWlkIEkgZG9uJ3QgYWdyZWU6IEhvdyB3b3VsZCBhbGxvd2luZyB3cml0ZXMgdG8gbW9yZSBjb25m
aWcgc3BhY2UKcmVnaXN0ZXJzIGJ5IGEgc3R1YmRvbSBiZSBzYWZlPwoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
