Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496079EF32
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:42:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2dZa-0007B9-EY; Tue, 27 Aug 2019 15:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2dZZ-0007B3-0H
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:39:53 +0000
X-Inumbo-ID: e8957946-c8e0-11e9-ae37-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8957946-c8e0-11e9-ae37-12813bfff9fa;
 Tue, 27 Aug 2019 15:39:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B31A6ADEF;
 Tue, 27 Aug 2019 15:39:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bfcac2fc-72e2-b3c4-64d1-33a16230b61f@suse.com>
Date: Tue, 27 Aug 2019 17:39:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813105352.32412-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen: Drop
 XEN_DOMCTL_suppress_spurious_page_faults
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
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMjAxOSAxMjo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGZ1bmN0aW9u
YWxpdHkgaXMgb2Jzb2xldGUuICBJdCB3YXMgaW50cm9kdWNlZCBieSBjL3MgMzk0MDdiZWQ5YzAg
aW50bwo+IFhlbmQsIGJ1dCBuZXZlciBleHBvc2VkIGluIGxpYnhsLgoKVGhpcyBpcyBnb29kIGVu
b3VnaCBhIHJlYXNvbiBJIHRoaW5rIChob3BlKSwgd2hpbGUgLi4uCgo+IFdoaWxlIG5vdCBleHBs
aWNpdGx5IGxpbWl0ZWQgdG8gUFYgZ3Vlc3RzLCB0aGlzIGlzIFBWLW9ubHkgYnkgdmlydHVlIG9m
IGl0cwo+IHBvc2l0aW9uIGluIHRoZSBwYWdlZmF1bHQgaGFuZGxlci4KPiAKPiBMb29raW5nIHRo
b3VnaCB0aGUgWGVuU2VydmVyIHRlbXBsYXRlcywgdGhpcyB3YXMgdXNlZCB0byB3b3JrIGFyb3Vu
ZCBidWdzIGluCj4gdGhlIDMyYml0IFJIRUwvQ2VudE9TIDQuezUuLjd9IGtlcm5lbHMgKGZpeGVk
IGluIDQuOCkuICBSSEVMIDQgYXMgYSBtYWpvcgo+IHZlcnNpb24gd2hlbiBvdXQgaWYgc3VwcG9y
dCBpbiAyMDE3LgoKLi4uIEkgd291bGRuJ3QgYWNjZXB0IHRoaXMgYXMganVzdGlmaWNhdGlvbiwg
c2luY2UgcGVvcGxlIGFyZQpmcmVlIHRvIHVzZSBvdXQtb2Ytc3VwcG9ydCBzb2Z0d2FyZSBmb3Ig
YXMgbG9uZyBhcyB0aGV5IHdpc2guCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpIeXBlcnZpc29yIHBhcnRzClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25lIGZ1cnRoZXIgc3VnZ2VzdGlv
bjoKCj4gLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvdHJh
cHMuYwo+IEBAIC0xNDUyLDIwICsxNDUyLDYgQEAgdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQo+ICAgICAgICAgICAgICAgICBlcnJvcl9jb2RlLCBfcChhZGRy
KSk7Cj4gICAgICAgfQo+ICAgCj4gLSAgICBpZiAoIHVubGlrZWx5KGN1cnJlbnQtPmRvbWFpbi0+
YXJjaC5zdXBwcmVzc19zcHVyaW91c19wYWdlX2ZhdWx0cykgKQo+IC0gICAgewo+IC0gICAgICAg
IHBmX3R5cGUgPSBzcHVyaW91c19wYWdlX2ZhdWx0KGFkZHIsIHJlZ3MpOwo+IC0gICAgICAgIGlm
ICggKHBmX3R5cGUgPT0gc21lcF9mYXVsdCkgfHwgKHBmX3R5cGUgPT0gc21hcF9mYXVsdCkpCj4g
LSAgICAgICAgewo+IC0gICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICIlcHYgZmF0YWwg
U00lY1AgdmlvbGF0aW9uXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgY3VycmVudCwgKHBmX3R5
cGUgPT0gc21lcF9mYXVsdCkgPyAnRScgOiAnQScpOwo+IC0KPiAtICAgICAgICAgICAgZG9tYWlu
X2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4gLSAgICAgICAgfQo+IC0gICAgICAgIGlmICggcGZf
dHlwZSAhPSByZWFsX2ZhdWx0ICkKPiAtICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgfQoKWW91
IG1heSB3YW50IHRvIGNvbnNpZGVyIHJlZHVjaW5nIHBmX3R5cGUncyBzY29wZSBhdCB0aGUgc2Ft
ZQp0aW1lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
