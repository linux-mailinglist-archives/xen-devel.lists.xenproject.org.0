Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DC13A75E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:27:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJMk-0003e6-Hh; Tue, 14 Jan 2020 10:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irJMj-0003e1-OZ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:24:05 +0000
X-Inumbo-ID: f817c316-36b7-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f817c316-36b7-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 10:23:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 298F0AD05;
 Tue, 14 Jan 2020 10:23:55 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <cb84362c-d175-7a71-89cc-17ce0c523b09@suse.com>
 <09fa90a8-b58a-04e9-ccae-702b3b092c4a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0349a697-a413-2aa8-3ab2-c66539b382e0@suse.com>
Date: Tue, 14 Jan 2020 11:23:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <09fa90a8-b58a-04e9-ccae-702b3b092c4a@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] IRQ: u16 is too narrow for an event channel
 number
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxMToxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biAxNC8wMS8yMDIwIDEwOjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRklGTyBldmVudCBjaGFu
bmVscyBhbGxvdyBwb3J0cyB1cCB0byAyXjE3LCBzbyB3ZSBuZWVkIHRvIHVzZSBhIHdpZGVyCj4+
IGZpZWxkIGluIHN0cnVjdCBwaXJxLiBNb3ZlICJtYXNrZWQiIHN1Y2ggdGhhdCBpdCBtYXkgc2hh
cmUgdGhlIDgtYnl0ZQo+PiBzbG90IHdpdGggc3RydWN0IGFyY2hfcGlycSBvbiA2NC1iaXQgYXJj
aGVzLCByYXRoZXIgdGhhbiBsZWF2aW5nIGEKPj4gNy1ieXRlIGhvbGUgaW4gYWxsIGNhc2VzLgo+
Pgo+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBhZGQgYSBjb21tZW50IHJlZ2FyZGlu
ZyAiYXJjaCIgcGxhY2VtZW50Cj4+IHdpdGhpbiB0aGUgc3RydWN0dXJlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9pcnEuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaXJxLmgKPj4gQEAgLTEy
Nyw5ICsxMjcsMTAgQEAgc3RydWN0IHZjcHU7Cj4+ICAgCj4+ICAgc3RydWN0IHBpcnEgewo+PiAg
ICAgICBpbnQgcGlycTsKPj4gLSAgICB1MTYgZXZ0Y2huOwo+PiAtICAgIGJvb2xfdCBtYXNrZWQ7
Cj4+ICsgICAgZXZ0Y2huX3BvcnRfdCBldnRjaG47Cj4+ICAgICAgIHN0cnVjdCByY3VfaGVhZCBy
Y3VfaGVhZDsKPj4gKyAgICBib29sIG1hc2tlZDsKPj4gKyAgICAvKiBBcmNoaXRlY3R1cmVzIG1h
eSByZXF1aXJlIHRoaXMgZmllbGQgdG8gYmUgbGFzdC4gKi8KPiAKPiBJIG9yZ2luYWxseSBwbGFu
bmVkIHRvIGFkZCBhIGNvbW1lbnQgaW4gc3RydWN0IHBpcnEsIGJ1dCBJIGFtIG5vdCBpbiAKPiBm
YXZvciB0byBjb250aW51ZSB0byBlbmNvdXJhZ2UgcXVpcmtpbmVzcyBpbiB0aGUgY29kZS4gSSBz
ZW50IGEgc2VyaWVzIAo+IChzZWUgWzFdKSB0aGF0IGRyb3AgdGhpcyByZXF1aXJlbWVudHMgZnJv
bSB4ODYgYW5kIHRoZXJlZm9yZSByZW1vdmUgdGhlIAo+IG5lZWQgb2YgdGhpcyBjb21tZW50LgoK
V2VsbCwgSSd2ZSBmb3VuZCB0aGUgaXNzdWUgZml4ZWQgaGVyZSB3aGlsZSBkb2luZyBhIGZpcnN0
IHJldmlldyBwYXNzCm92ZXIgc2FpZCBwYXRjaCBvZiB5b3VycyAoSSdtIHlldCB0byBtYWtlIHVw
IG15IG1pbmQgd2hldGhlciBJIGhhdmUKcmVzZXJ2YXRpb25zLCBoZW5jZSBJIGRpZG4ndCByZXBs
eSB5ZXQpLiBUaGUgY2hhbmdlIGhlcmUgd2lsbCB3YW50CmJhY2twb3J0aW5nLCBzbyBpdCdsbCBi
ZSBlYXNpZXIgaW4gYW55IGV2ZW50IHRvIHJlYmFzZSB5b3VyIHBhdGNoIG92ZXIKdGhpcyBvbmUu
IFRoaXMgcmViYXNpbmcgY2FuIHRoZW4gaW5jbHVkZSBkcm9wcGluZyB0aGUgY29tbWVudCBhZ2Fp
bi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
