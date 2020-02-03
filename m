Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B6150610
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyaiO-0000PM-DL; Mon, 03 Feb 2020 12:20:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyaiN-0000P9-0U
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:20:31 +0000
X-Inumbo-ID: 91416142-467f-11ea-8e54-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91416142-467f-11ea-8e54-12813bfff9fa;
 Mon, 03 Feb 2020 12:20:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93611B1D5;
 Mon,  3 Feb 2020 12:20:29 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-10-anthony.perard@citrix.com>
 <b794460e-75a0-12e8-07e7-c3731ff7493c@suse.com>
 <20200203114509.GB2306@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e3006bf-a1ad-5efa-a0ce-0cd50f2653b6@suse.com>
Date: Mon, 3 Feb 2020 13:20:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203114509.GB2306@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 09/12] xen/build: include
 include/config/auto.conf in main Makefile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMjo0NSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMDI6MDY6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gLS0tIGEveGVuL01ha2Vm
aWxlCj4+PiArKysgYi94ZW4vTWFrZWZpbGUKPj4+IEBAIC00OSw3ICs0OSw3MSBAQCBkZWZhdWx0
OiBidWlsZAo+Pj4gIC5QSE9OWTogZGlzdAo+Pj4gIGRpc3Q6IGluc3RhbGwKPj4+ICAKPj4+IC1i
dWlsZCBpbnN0YWxsOjogaW5jbHVkZS9jb25maWcvYXV0by5jb25mCj4+PiArCj4+PiAraWZuZGVm
IHJvb3QtbWFrZS1kb25lCj4+PiArIyBzZWN0aW9uIHRvIHJ1biBiZWZvcmUgY2FsbGluZyBSdWxl
cy5taywgYnV0IG9ubHkgb25jZS4KPj4+ICsjCj4+PiArIyBUbyBtYWtlIHN1cmUgd2UgZG8gbm90
IGluY2x1ZGUgLmNvbmZpZyBmb3IgYW55IG9mIHRoZSAqY29uZmlnIHRhcmdldHMKPj4+ICsjIGNh
dGNoIHRoZW0gZWFybHksIGFuZCBoYW5kIHRoZW0gb3ZlciB0byB0b29scy9rY29uZmlnL01ha2Vm
aWxlCj4+PiArCj4+PiArY2xlYW4tdGFyZ2V0cyA6PSAlY2xlYW4KPj4+ICtuby1kb3QtY29uZmln
LXRhcmdldHMgOj0gJChjbGVhbi10YXJnZXRzKSBcCj4+PiArCQkJIHVuaW5zdGFsbCBkZWJ1ZyBj
bG9jIFwKPj4+ICsJCQkgY3Njb3BlIFRBR1MgdGFncyBNQVAgZ3RhZ3MgXAo+Pj4gKwkJCSB4ZW52
ZXJzaW9uCj4+PiArCj4+PiArY29uZmlnLWJ1aWxkCTo9Cj4+Cj4+IElzIHRoaXMgYWN0dWFsbHkg
bmVlZGVkPyBXaGlsZSBjb3JyZWN0IChhZmFpY3QpIHRvZ2V0aGVyIHdpdGggdGhlCj4+IGlmZGVm
IGZ1cnRoZXIgZG93biwgSSBmaW5kIHRoaXMgYXNwZWN0IG9mIG1ha2UgYmVoYXZpb3IgYSBsaXR0
bGUKPj4gY29uZnVzaW5nLCBhbmQgaGVuY2UgaXQgd291bGQgc2VlbSBzbGlnaHRseSBiZXR0ZXIg
aWYgdGhlcmUgd2FzCj4+IG5vIGVtcHR5IGRlZmluaXRpb24gb2YgdGhpcyBzeW1ib2wuCj4gCj4g
VGhhdCdzIGFjdHVhbGx5IGEgdmVyeSByZWNlbnQgY2hhbmdlIGluIExpbnV4IHNvdXJjZSBjb2Rl
LiBUaGV5IHVzZWQgdG8KPiB1c2UgaWZlcSgkKGNvbmZpZy1idWlsZCksMSkgYW5kIGlmZXEoJChj
b25maWctYnVpbGQpLDApLiBJIGNhbiBjZXJ0YWlubHkKPiBjaGFuZ2UgYmFjayB0byB1c2UgaWZl
cSBpbnN0ZWFkIG9mIGlmZGVmLgoKVGhlbiBwZXJoYXBzLCBhbG9uZyB0aGUgbGluZXMgb2YgLi4u
Cgo+Pj4gK25lZWQtY29uZmlnCTo9IDEKPj4KPj4gSGVyZSBhbmQgYmVsb3csIHdvdWxkIGl0IGJl
IHBvc3NpYmxlIHRvIHVzZSB5IGluc3RlYWQgb2YgMSwgdG8KPj4gbWF0Y2ggaG93ICJ0cnVlIiBn
ZXRzIGV4cHJlc3NlZCBpbiB2YXJpb3VzIHBsYWNlcyBlbHNld2hlcmU/Cj4+IE9yIHdvdWxkIHRo
ZXJlIGFnYWluIGJlIGRldmlhdGlvbi1mcm9tLUxpbnV4IGNvbmNlcm5zPwo+IAo+IEl0J3MgcHJv
YmFibHkgZmluZSB0byB1c2UgInkiLiBJIGRvbid0IHRoaW5rIGl0IG1hdHRlciwgd2UgbmVlZCB0
byBtYWtlCj4gcXVpdGUgYSBsb3Qgb2YgY2hhbmdlcyBjb21wYXJlIHRvIExpbnV4IGFueXdheS4g
SSdsbCB1c2UgIm4iIGZvciB0aGUKPiBuZWdhdGl2ZS4KCi4uLiB0aGlzLCBhbHNvIHVzZSB5L24/
Cgo+Pj4gK2lmZGVmIGNvbmZpZy1idWlsZAo+Pj4gKyMgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+PiAr
IyAqY29uZmlnIHRhcmdldHMgb25seSAtIG1ha2Ugc3VyZSBwcmVyZXF1aXNpdGVzIGFyZSB1cGRh
dGVkLCBhbmQgZGVzY2VuZAo+Pj4gKyMgaW4gdG9vbHMva2NvbmZpZyB0byBtYWtlIHRoZSAqY29u
ZmlnIHRhcmdldAo+Pj4gKwo+Pj4gK2NvbmZpZzogRk9SQ0UKPj4+ICsJJChNQUtFKSAtZiAkKEJB
U0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJD
SD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiAkQAo+
Pj4gKwo+Pj4gKyMgQ29uZmlnLm1rIHRyaWVzIHRvIGluY2x1ZGUgLmNvbmZpZyBmaWxlLCBkb24n
dCB0cnkgdG8gcmVtYWtlIGl0Cj4+PiArJS8uY29uZmlnOiA7Cj4+Cj4+IFRoaXMgZGlkbid0IGV4
aXN0IGJlZm9yZSAtIHdoeSBpcyBpdCBuZWVkZWQgYWxsIG9mIHRoZSBzdWRkZW4/Cj4gCj4gSXQn
cyBiZWNhdXNlIEknbSBpbnRyb2R1Y2luZyBhIG5ldyB0YXJnZXQgIiVjb25maWciLiBTbyB3aGVu
IG1ha2UKPiAiLWluY2x1ZGUgJChYRU5fUk9PVCkvLmNvbmZpZyIgKGFzIGZvdW5kIGluIENvbmZp
Zy5taykgaXQgY2hlY2sgaWYgdGhlCj4gZmlsZSBuZWVkcyB0byBiZSByZWJ1aWx0LCBhbmQgZmlu
ZCAlY29uZmlnIGFuZCB0aHVzIHJ1biBrY29uZmlnIHRvIGJ1aWxkCj4gLmNvbmZpZy4KPiAKPiBD
dXJyZW50bHksIE1ha2VmaWxlIGxpc3QgYWxsIHRoZSB0YXJnZXRzIHRoYXQgbmVlZHMgdG8gYmUg
YnVpbHQgd2l0aAo+IGtjb25maWcuCgpBaCwgSSBzZWUgLSB3ZSBkaWRuJ3QgaGF2ZSBhICVjb25m
aWcgdGFyZ2V0IGFueXdoZXJlIGF0IGFsbC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
