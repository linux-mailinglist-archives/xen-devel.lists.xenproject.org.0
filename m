Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1A35FE4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 17:09:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYXUD-0002XI-OA; Wed, 05 Jun 2019 15:05:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYXUC-0002XD-6e
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 15:05:56 +0000
X-Inumbo-ID: 69430ccc-87a3-11e9-8c7d-677b68fe66da
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69430ccc-87a3-11e9-8c7d-677b68fe66da;
 Wed, 05 Jun 2019 15:05:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 09:05:52 -0600
Message-Id: <5CF7DA4D02000078002359AC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 09:05:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Sergey Dyasli" <sergey.dyasli@citrix.com>, "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-11-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-11-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 10/10] x86/microcode: always
 collect_cpu_info() during boot
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
 xen-devel <xen-devel@lists.xenproject.org>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBG
cm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4gCj4gQ3VycmVu
dGx5IGNwdV9zaWcgc3RydWN0IGlzIG5vdCB1cGRhdGVkIGR1cmluZyBib290IHdoZW4gZWl0aGVy
Ogo+IAo+ICAgICAxLiB1Y29kZV9zY2FuIGlzIHNldCB0byBmYWxzZSAoZS5nLiBubyAidWNvZGU9
c2NhbiIgaW4gY21kbGluZSkKPiAgICAgMi4gaW5pdHJkIGRvZXMgbm90IGNvbnRhaW4gYSBtaWNy
b2NvZGUgYmxvYgoKSSB0aG91Z2h0IHdlJ2QgYWxyZWFkeSBkaXNjdXNzZWQgdGhpcyAtICJ1Y29k
ZT08bnVtYmVyPiIgaXMgbm90CmNvdmVyZWQgYnkgdGhpcy4KCj4gVGhlc2Ugd2lsbCByZXN1bHQg
aW4gY3B1X3NpZy5yZXYgYmVpbmcgMCB3aGljaCBhZmZlY3RzIEFQSUMncwo+IGNoZWNrX2RlYWRs
aW5lX2VycmF0YSgpIGFuZCByZXRwb2xpbmVfc2FmZSgpIGZ1bmN0aW9ucy4KPiAKPiBGaXggdGhp
cyBieSBnZXR0aW5nIHVjb2RlIHJldmlzaW9uIGVhcmx5IGR1cmluZyBib290IGFuZCBTTVAgYnJp
bmcgdXAuCj4gV2hpbGUgYXQgaXQuCgpXaGlsZSBhdCBpdD8KCj4gU2lnbmVkLW9mZi1ieTogU2Vy
Z2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4gLS0tCj4gY2hhbmdlcyBpbiB2NzoKPiAtIHJl
YmFzZSBvbiBwYXRjaCAxfjkKCkZyb20gdGhlIGxvb2tzIG9mIGl0IHRoaXMgZG9lc24ndCBkZXBl
bmQgb24gYW55IG9mIHRoZSBlYXJsaWVyIGNoYW5nZXMKKGV4Y2VwdCB0aGUgdWNvZGVfY3B1X2lu
Zm8gLT4gY3B1X3NpZyBjaGFuZ2UpLCBhbmQgaGVuY2UgY291bGQgZ28KaW4gcmlnaHQgYXdheS4g
QW0gSSBvdmVybG9va2luZyBzb21ldGhpbmc/IElmIG5vdCwgYWxsIHRoYXQncyBuZWVkZWQKd291
bGQgYmUgY2xhcmlmaWNhdGlvbnMgb2YgdGhlIGRlc2NyaXB0aW9uIGFzIHBlciBhYm92ZS4KCj4g
LS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jCj4gQEAgLTU5MCw2ICs1OTAsMTAgQEAgaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVf
aW5pdCh2b2lkKQo+ICAKPiAgICAgIGlmICggbWljcm9jb2RlX29wcyApCj4gICAgICB7Cj4gKyAg
ICAgICAgcmMgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKCZ0aGlzX2NwdShjcHVf
c2lnKSk7Cj4gKyAgICAgICAgaWYgKCByYyApCj4gKyAgICAgICAgICAgIHJldHVybiByYzsKPiAr
Cj4gICAgICAgICAgaWYgKCB1Y29kZV9tb2QubW9kX2VuZCB8fCB1Y29kZV9ibG9iLnNpemUgKQo+
ICAgICAgICAgICAgICByYyA9IGVhcmx5X21pY3JvY29kZV9wYXJzZV9hbmRfdXBkYXRlX2NwdSgp
Owo+ICAgICAgfQoKRG8gd2UgcmVhbGx5IG5lZWQgdG8gYmFpbCBvbiBlcnJvciBoZXJlPyBJIGRv
bid0IHNlZSBhbnl0aGluZyB3cm9uZwp3aXRoIHNpbXBseSBjb250aW51aW5nLiBUaGUgY2FsbGVy
IGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUgcmV0dXJuCnZhbHVlIGFueXdheSwgc28gYmVzdCBlZmZv
cnQgd291bGQgc2VlbSB0byBiZSBnb29kIGVub3VnaC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
