Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4214F08C
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:20:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYzn-0005o4-L7; Fri, 31 Jan 2020 16:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixYzm-0005nz-A4
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:18:14 +0000
X-Inumbo-ID: 477986d4-4445-11ea-8be3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 477986d4-4445-11ea-8be3-12813bfff9fa;
 Fri, 31 Jan 2020 16:18:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 848EBAE71;
 Fri, 31 Jan 2020 16:18:12 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
 <20200131143716.gtdb5wwoagxpb223@debian>
 <c08b3b1d-3d88-98c4-b175-ab5e1d2ec8c4@suse.com>
 <20200131161509.mjw2pvzjgv4zhdzc@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07672921-8670-7004-56ce-68ddf5dab147@suse.com>
Date: Fri, 31 Jan 2020 17:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131161509.mjw2pvzjgv4zhdzc@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxNzoxNSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEphbiAzMSwgMjAy
MCBhdCAwNDozNToyM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzEuMDEuMjAy
MCAxNTozNywgV2VpIExpdSB3cm90ZToKPj4+IE9uIEZyaSwgSmFuIDMxLCAyMDIwIGF0IDAzOjI0
OjA3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjAxLjIwMjAgMjE6MjAs
IFdlaSBMaXUgd3JvdGU6Cj4+Pj4+IEkgdHJpZWQgdXNpbmcgdGhlIGFzbSgiLmVxdSAuLiIpIHRy
aWNrIGJ1dCBoaXQgYSBwcm9ibGVtIHdpdGggJWMgYWdhaW4uCj4+Pj4+Cj4+Pj4+IG1tLmM6NTcz
Njo1OiBlcnJvcjogaW52YWxpZCAnYXNtJzogb3BlcmFuZCBpcyBub3QgYSBjb25kaXRpb24gY29k
ZSwgaW52YWxpZCBvcGVyYW5kIGNvZGUgJ2MnCj4+Pj4+ICAgICAgICAgICAgICAgIGFzbSAoICIu
ZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+Pj4+Cj4+Pj4g
V291bGQgeW91IG1pbmQgYWxzbyBpbmRpY2F0aW5nIHdoYXQgdGhlIGlucHV0IG9wZXJhbmQgYWN0
dWFsbHkKPj4+PiB3YXM/IEFjY29yZGluZyB0byBteSBsb29raW5nIGF0IGdjYyBzb3VyY2VzIHdo
ZW4geW91IGZpcnN0Cj4+Pj4gbWVudGlvbmVkIHRoaXMgKG9uIGlyYyBpaXJjKSwgbXVjaCBkZXBl
bmRzIG9uIGl0IGFjdHVhbGx5IGJlCj4+Pj4gcmVjb2duaXphYmxlIGFzIGEgY29uc3RhbnQgYnkg
dGhlIGNvbXBpbGVyLgo+Pj4KPj4+IFNvbWV0aGluZyBhbG9uZyB0aGUgbGluZToKPj4+Cj4+PiAg
IGFzbSAoICIuZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+
Pj4gICAgICAgIDo6ICJpIiAoX19maXhfeF90b192aXJ0KEZJWF9YX0hWLi4uKSkKPj4KPj4gUXVp
dGUgYSBiaXQgb2YgcGxheWluZyBsYXRlciwgJVAwIGlzIGRvY3VtZW50ZWQsIHN1cHBvcnRlZAo+
PiBhbHJlYWR5IGluIGdjYyA0LjEueCwgYW5kIGFsc28gdXNlZCBpbiBhIGZldyBjYXNlcyBieSBM
aW51eC4KPj4gJXAwIHdvdWxkIGJlIGFub3RoZXIgZG9jdW1lbnRlZCBhbHRlcm5hdGl2ZSwgYnV0
IHN1cHBvcnQgZm9yCj4+IHRoaXMgbG9va3MgdG8gaGF2ZSBiZWVuIGludHJvZHVjZWQgbGF0ZXIu
IE5vdCBiZWluZyBhYmxlIHRvIHVzZQo+PiAlYzAgaGVyZSBzdGlsbCBzbWVsbHMgbGlrZSBhIGJ1
ZyAoYW5kIEkgZ3Vlc3MgSSdsbCBlbnRlciBvbmUuKQo+IAo+IE9LLiBMZXQgbWUgdHJ5IHRoYXQu
Cj4gCj4gSWYgdGhhdCB0dXJucyBvdXQgc3VjY2Vzc2Z1bCwgZG8geW91IHdhbnQgbWUgdG8gY2hh
bmdlIHRoZSBvdGhlcgo+IGluc3RhbmNlIHRvICVQMCB0b28/CgpUaGF0IHdhcyBhIHByZXR0eSBz
bWFsbCB2YWx1ZSwgd2Fzbid0IGl0PyBJIGd1ZXNzIGl0IG1pZ2h0IGJlIHNhZmVyCnRvIHN3aXRj
aCB0byAlUCAoYW5kIHRoZW4gcGVyaGFwcyBhbHNvIGVsc2V3aGVyZSBpbiB0aGUgY29kZSBiYXNl
KS4KQnV0IGR1cmluZyBteSBwbGF5aW5nIHdpdGggaXQgSSBhbHNvIG5vdGljZWQgdGhlcmUncyBh
IHNpZ25lZG5lc3MKYnVnIChhZmZlY3RpbmcgYWxsIHBvc3NpYmxlIG1vZGlmaWVycyksIHNvIHdl
IG5lZWQgdG8gd2F0Y2ggb3V0IGZvcgpyZXN1bHRzIGJlaW5nIHJpZ2h0IGluIGFueSBldmVudC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
