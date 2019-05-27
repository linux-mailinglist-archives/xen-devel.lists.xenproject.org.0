Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D22B14A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:29:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBuM-00026s-6C; Mon, 27 May 2019 09:27:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVBuJ-000266-QG
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:27:03 +0000
X-Inumbo-ID: 95a61927-8061-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95a61927-8061-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:27:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:27:01 -0600
Message-Id: <5CEBAD610200007800232B4A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:26:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CA1C0F902000078002236A3@prv1-mh.provo.novell.com>
 <5CA1C0F902000000001041A4@prv1-mh.provo.novell.com>
 <5CA1C0F90200007800232A7A@prv1-mh.provo.novell.com>
In-Reply-To: <5CA1C0F90200007800232A7A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH] x86emul/fuzz: extend canonicalization to
 57-bit linear address width case
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAxLjA0LjE5IGF0IDA5OjQyLCAgd3JvdGU6Cj4gRG9uJ3QgZW5mb3JjZSBhbnkgb3Ro
ZXIgZGVwZW5kZW5jaWVzIGZvciBub3csIGp1c3QgbGlrZSB3ZSBkb24ndCBlbmZvcmNlCj4gZS5n
LiBQQUUgZW5hYmxlZCBhcyBhIHByZXJlcSBmb3IgbG9uZyBtb2RlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS90b29scy9mdXp6
L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9mdXp6LWVtdWwuYwo+ICsrKyBiL3Rvb2xzL2Z1enov
eDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL2Z1enotZW11bC5jCj4gQEAgLTY2MiwyMSArNjYyLDIx
IEBAIHN0YXRpYyB2b2lkIHNldF9zaXplcyhzdHJ1Y3QgeDg2X2VtdWxhdGUKPiAgICAgIH0KPiAg
fQo+ICAKPiAtI2RlZmluZSBDQU5PTklDQUxJWkUoeCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArI2RlZmluZSBDQU5PTklDQUxJWkUoeCwgYml0cykgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICB1aW50NjRfdCBfeSA9ICh4KTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICBpZiAoIF95ICYgKDFVTEwg
PDwgNDcpICkgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgX3kgfD0g
KH4wVUxMKSA8PCA0ODsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICBpZiAo
IF95ICYgKDFVTEwgPDwgKChiaXRzKSAtIDEpKSApICAgICAgICAgICAgICAgIFwKPiArICAgICAg
ICAgICAgX3kgfD0gKH4wVUxMKSA8PCAoYml0cyk7ICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
ICAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAtICAgICAgICAgICAgX3kgJj0gKDFVTEwgPDwgNDgpLTE7ICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArICAgICAgICAgICAgX3kgJj0gKDFVTEwgPDwgKGJpdHMpKSAtIDE7ICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICBwcmludGYoIkNhbm9uaWNhbGl6ZWQgJSIgUFJJeDY0
ICIgdG8gJSIgUFJJeDY0ICJcbiIsIHgsIF95KTsgICAgXAo+ICAgICAgICAgICh4KSA9IF95OyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgIH0gd2hpbGUoIDAg
KQo+ICAKPiAtLyogRXhwZWN0cyBiaXRtYXAgYW5kIHJlZ3MgdG8gYmUgZGVmaW5lZCAqLwo+ICsv
KiBFeHBlY3RzIGJpdG1hcCwgcmVncywgYW5kIGMgdG8gYmUgZGVmaW5lZCAqLwo+ICAjZGVmaW5l
IENBTk9OSUNBTElaRV9NQVlCRShyZWcpICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICBp
ZiAoICEoYml0bWFwICYgKDEgPDwgQ0FOT05JQ0FMSVpFXyMjcmVnKSkgKSAgICAgIFwKPiAtICAg
ICAgICBDQU5PTklDQUxJWkUocmVncy0+cmVnKTsgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgIENBTk9OSUNBTElaRShyZWdzLT5yZWcsIGMtPmNyWzRdICYgWDg2X0NSNF9MQTU3ID8g
NTcgOiA0OCk7IFwKPiAgCj4gIGVudW0gewo+ICAgICAgSE9PS19yZWFkLAo+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYveDg2LWRlZm5zLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3g4
Ni1kZWZucy5oCj4gQEAgLTY0LDYgKzY0LDcgQEAKPiAgI2RlZmluZSBYODZfQ1I0X09TRlhTUiAg
ICAgMHgwMDAwMDIwMCAvKiBlbmFibGUgZmFzdCBGUFUgc2F2ZSBhbmQgcmVzdG9yZSAKPiAqLwo+
ICAjZGVmaW5lIFg4Nl9DUjRfT1NYTU1FWENQVCAweDAwMDAwNDAwIC8qIGVuYWJsZSB1bm1hc2tl
ZCBTU0UgZXhjZXB0aW9ucyAqLwo+ICAjZGVmaW5lIFg4Nl9DUjRfVU1JUCAgICAgICAweDAwMDAw
ODAwIC8qIGVuYWJsZSBVTUlQICovCj4gKyNkZWZpbmUgWDg2X0NSNF9MQTU3ICAgICAgIDB4MDAw
MDEwMDAgLyogZW5hYmxlIDUtbGV2ZWwgcGFnaW5nICovCj4gICNkZWZpbmUgWDg2X0NSNF9WTVhF
ICAgICAgIDB4MDAwMDIwMDAgLyogZW5hYmxlIFZNWCAqLwo+ICAjZGVmaW5lIFg4Nl9DUjRfU01Y
RSAgICAgICAweDAwMDA0MDAwIC8qIGVuYWJsZSBTTVggKi8KPiAgI2RlZmluZSBYODZfQ1I0X0ZT
R1NCQVNFICAgMHgwMDAxMDAwMCAvKiBlbmFibGUge3JkLHdyfXtmcyxnc31iYXNlICovCj4gCj4g
Cj4gCj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
