Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54AD359CE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:47:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSU9-00007B-9l; Wed, 05 Jun 2019 09:45:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYSU7-000076-Vp
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:45:32 +0000
X-Inumbo-ID: a5daf12c-8776-11e9-8a5e-ffec7722b99a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5daf12c-8776-11e9-8a5e-ffec7722b99a;
 Wed, 05 Jun 2019 09:45:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 03:45:26 -0600
Message-Id: <5CF78F340200007800235687@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 03:45:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559677885-10731-1-git-send-email-andrew.cooper3@citrix.com>
 <1559677885-10731-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1559677885-10731-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] libx86: Helper for clearing
 out-of-range CPUID leaves
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDIxOjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTE2Myw2ICsxNzAsNTggQEAgdm9pZCB4ODZfY3B1aWRfcG9saWN5X2ZpbGxfbmF0
aXZlKHN0cnVjdCBjcHVpZF9wb2xpY3kgKnApCj4gICAgICByZWNhbGN1bGF0ZV9zeW50aChwKTsK
PiAgfQo+ICAKPiArdm9pZCB4ODZfY3B1aWRfcG9saWN5X2NsZWFyX291dF9vZl9yYW5nZV9sZWF2
ZXMoc3RydWN0IGNwdWlkX3BvbGljeSAqcCkKPiArewo+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4g
Kwo+ICsgICAgemVyb19sZWF2ZXMocC0+YmFzaWMucmF3LCBwLT5iYXNpYy5tYXhfbGVhZiArIDEs
Cj4gKyAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHAtPmJhc2ljLnJhdykgLSAxKTsKPiArCj4g
KyAgICBpZiAoIHAtPmJhc2ljLm1heF9sZWFmIDwgNCApCj4gKyAgICAgICAgbWVtc2V0KHAtPmNh
Y2hlLnJhdywgMCwgc2l6ZW9mKHAtPmNhY2hlLnJhdykpOwo+ICsgICAgZWxzZQo+ICsgICAgewo+
ICsgICAgICAgIGZvciAoIGkgPSAwOyAoaSA8IEFSUkFZX1NJWkUocC0+Y2FjaGUucmF3KSAmJgo+
ICsgICAgICAgICAgICAgICAgICAgICAgcC0+Y2FjaGUuc3VibGVhZltpXS50eXBlKTsgKytpICkK
PiArICAgICAgICAgICAgOwo+ICsKPiArICAgICAgICB6ZXJvX2xlYXZlcyhwLT5jYWNoZS5yYXcs
IGkgKyAxLAo+ICsgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUocC0+Y2FjaGUucmF3KSAt
IDEpOwoKRG8geW91IHJlYWxseSB3YW50ICJpICsgMSIgaGVyZT8gV291bGRuJ3QgaXQgYmUgYmV0
dGVyIHRvIGZ1bGx5IHphcApzdWJsZWFmIGkgYXMgd2VsbCwgd2hlbiBpdHMgdHlwZSBpcyB6ZXJv
PyBTYW1lIGZvciBsZWFmIDB4YiB0aGVuLgoKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIHAtPmJh
c2ljLm1heF9sZWFmIDwgNyApCj4gKyAgICAgICAgbWVtc2V0KHAtPmZlYXQucmF3LCAwLCBzaXpl
b2YocC0+ZmVhdC5yYXcpKTsKPiArICAgIGVsc2UKPiArICAgICAgICB6ZXJvX2xlYXZlcyhwLT5m
ZWF0LnJhdywgcC0+ZmVhdC5tYXhfc3VibGVhZiArIDEsCj4gKyAgICAgICAgICAgICAgICAgICAg
QVJSQVlfU0laRShwLT5mZWF0LnJhdykgLSAxKTsKPiArCj4gKyAgICBpZiAoIHAtPmJhc2ljLm1h
eF9sZWFmIDwgMHhiICkKPiArICAgICAgICBtZW1zZXQocC0+dG9wby5yYXcsIDAsIHNpemVvZihw
LT50b3BvLnJhdykpOwo+ICsgICAgZWxzZQo+ICsgICAgewo+ICsgICAgICAgIGZvciAoIGkgPSAw
OyAoaSA8IEFSUkFZX1NJWkUocC0+dG9wby5yYXcpICYmCj4gKyAgICAgICAgICAgICAgICAgICAg
ICBwLT50b3BvLnN1YmxlYWZbaV0udHlwZSk7ICsraSApCj4gKyAgICAgICAgICAgIDsKPiArCj4g
KyAgICAgICAgemVyb19sZWF2ZXMocC0+dG9wby5yYXcsIGkgKyAxLAo+ICsgICAgICAgICAgICAg
ICAgICAgIEFSUkFZX1NJWkUocC0+dG9wby5yYXcpIC0gMSk7Cj4gKyAgICB9Cj4gKwo+ICsgICAg
aWYgKCBwLT5iYXNpYy5tYXhfbGVhZiA8IDB4ZCB8fCAhY3B1aWRfcG9saWN5X3hzdGF0ZXMocCkg
KQo+ICsgICAgICAgIG1lbXNldChwLT54c3RhdGUucmF3LCAwLCBzaXplb2YocC0+eHN0YXRlLnJh
dykpOwo+ICsgICAgZWxzZQo+ICsgICAgewo+ICsgICAgICAgIC8qIEZpcnN0IHR3byBsZWF2ZXMg
YWx3YXlzIHZhbGlkLiAgUmVzdCBkZXBlbmQgb24geHN0YXRlcy4gKi8KPiArICAgICAgICBpID0g
bWF4KDIsIDY0IC0gX19idWlsdGluX2NsemxsKGNwdWlkX3BvbGljeV94c3RhdGVzKHApKSk7Cj4g
Kwo+ICsgICAgICAgIHplcm9fbGVhdmVzKHAtPnhzdGF0ZS5yYXcsIGksCj4gKyAgICAgICAgICAg
ICAgICAgICAgQVJSQVlfU0laRShwLT54c3RhdGUucmF3KSAtIDEpOwo+ICsgICAgfQoKSW4geDg2
X2NwdWlkX3BvbGljeV9maWxsX25hdGl2ZSgpIHlvdSdyZSB1c2luZyA2MyBhcyB0aGUgbG9vcApi
b3VuZCwgZ3VhcmFudGVlaW5nIHRvIGlnbm9yZSBiaXQgNjMgaW4gY2FzZSBpdCBnYWlucyBhIG1l
YW5pbmcuCkhlcmUgYW5kIGluIHg4Nl9jcHVpZF9jb3B5X3RvX2J1ZmZlcigpIHlvdSBkb24ndC4g
SSdtIHNsaWdodGx5CndvcnJpZWQgdGhhdCB0aGVzZSBjb2RlIHNlcXVlbmNlcyB3aWxsIG5lZWQg
Y2hhbmdpbmcgKHdpdGggbm8Kd2F5IHRvIGVhc2lseSBub3RpY2UpIHdoZW4gQ1BVSURfR1VFU1Rf
TlJfWFNUQVRFIGdldHMKaW5jcmVhc2VkLiBCdXQgSSdtIG5vdCBnb2luZyB0byBpbnNpc3QgLSBm
b3Igbm93IHRoZSBjb2RlIGlzIGZpbmUKYXMgaXMgKGFmYWljdCkuCgpIYXZpbmcgcmVhY2hlZCB0
aGUgZW5kIG9mIHRoZSBwYXRjaCBhbmQgc2VlaW5nIHRoZSB0aXRsZSBvZgpwYXRjaCAyIC0gaXMg
dGhlcmUgbm8gbmVlZCB0byB1c2UgdGhpcyBmdW5jdGlvbiBhbnl3aGVyZQpvdXRzaWRlIHRoZSBm
dXp6aW5nIGhhcm5lc3M/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
