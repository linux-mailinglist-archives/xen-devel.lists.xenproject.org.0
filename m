Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092D9072F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:46:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hygFY-00080F-Qj; Fri, 16 Aug 2019 17:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hygFW-0007zi-VK
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:42:50 +0000
X-Inumbo-ID: 42772910-c04d-11e9-8bb8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 42772910-c04d-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 17:42:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074ED360;
 Fri, 16 Aug 2019 10:42:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7F93F694;
 Fri, 16 Aug 2019 10:42:45 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-4-julien.grall@arm.com>
 <85eea744-c2f9-748e-c2a6-8382320b33fd@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e5e6be74-8af1-c3cb-2b46-a8ab47605825@arm.com>
Date: Fri, 16 Aug 2019 18:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85eea744-c2f9-748e-c2a6-8382320b33fd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen/public: Document
 HYPERCALL_console_io()
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOC8wOC8yMDE5IDE1OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNS4wOC4y
MDE5IDE1OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEN1cnJlbnRseSwgT1MgZGV2ZWxvcHBl
cnMgd2lsbCBoYXZlIHRvIGxvb2sgYXQgWGVuIGNvZGUgaW4gb3JkZXIgdG8ga25vdwo+PiB0aGUg
cGFyYW1ldGVycyBvZiBhbiBoeXBlcmNhbGwgYW5kIGhvdyBpdCBpcyBtZWFudCB0byB3b3JrLgo+
Pgo+PiBUaGlzIGlzIG5vdCBhIHRyaXZpYWwgdGFzayBhcyB5b3UgbWF5IG5lZWQgdG8gaGF2ZSBh
IGRlZXAgdW5kZXJzdGFuZGluZwo+PiBvZiBYZW4gaW50ZXJuYWwuCj4+Cj4+IFRoaXMgcGF0Y2gg
YXR0ZW1wdHMgdG8gZG9jdW1lbnQgdGhlIGJlaGF2aW9yIG9mIEhZUEVSQ0FMTF9jb25zb2xlX2lv
KCkgdG8KPj4gaGVscCBPUyBkZXZlbG9wZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIGEgY291cGxlIG9mIG5pdHM6Cj4gCj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgK
Pj4gQEAgLTQ4Niw3ICs0ODYsMjkgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobW11ZXh0X29w
X3QpOwo+PiAgICAvKiBgIH0gKi8KPj4gICAgCj4+ICAgIC8qCj4+IC0gKiBDb21tYW5kcyB0byBI
WVBFUlZJU09SX2NvbnNvbGVfaW8oKS4KPj4gKyAqIGAgaW50Cj4+ICsgKiBgIEhZUEVSVklTT1Jf
Y29uc29sZV9pbyh1bnNpZ25lZCBpbnQgY21kLAo+PiArICogYCAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGNvdW50LAo+PiArICogYCAgICAgICAgICAgICAgICAgICAgICAgY2hh
ciBidWZmZXJbXSk7Cj4+ICsgKgo+PiArICogQGNtZDogQ29tbWFuZCAoc2VlIGJlbG93KQo+PiAr
ICogQGNvdW50OiBTaXplIG9mIHRoZSBidWZmZXIgdG8gcmVhZC93cml0ZQo+PiArICogQGJ1ZmZl
cjogUG9pbnRlciBpbiB0aGUgZ3Vlc3QgbWVtb3J5Cj4+ICsgKgo+PiArICogTGlzdCBvZiBjb21t
YW5kczoKPj4gKyAqCj4+ICsgKiAgKiBDT05TT0xFSU9fd3JpdGU6IFdyaXRlIHRoZSBidWZmZXIg
b24gWGVuIGNvbnNvbGUuCj4gCj4gcy8gb24gLyB0byAvID8KCkkgYW0gbm90IGVudGlyZWx5IHN1
cmUuIExvb2tpbmcgb25saW5lIFsxXSAib24iIHdvdWxkIG1ha2Ugc2Vuc2UgaGVyZS4KCkJ1dCBJ
IGFtIG5vdCBhIG5hdGl2ZSBlbmdsaXNoIHNwZWFrZXIuIEBHZW9yZ2UsIEBJYW4sIEBBbmRyZXcs
IGFueSBvcGluaW9ucz8KCj4gCj4+ICsgKiAgICAgIEZvciB0aGUgaGFyZHdhcmUgZG9tYWluLCBh
bGwgdGhlIGNoYXJhY3RlcnMgaW4gdGhlIGJ1ZmZlciB3aWxsCj4+ICsgKiAgICAgIGJlIHdyaXR0
ZW4uIENoYXJhY3RlcnMgd2lsbCBiZSBwcmludGVkIHRvIGRpcmVjdGx5IHRvIHRoZQo+IAo+IFRo
ZSBmaXJzdCAidG8iIGxvb2tzIHRvIGJlIHVud2FudGVkLgoKWWVzLCBJIGhhdmUgZHJvcHBlZCBp
dC4KCj4gCj4+ICsgKiAgICAgIGNvbnNvbGUuCj4+ICsgKiAgICAgIEZvciBhbGwgdGhlIG90aGVy
IGRvbWFpbnMsIG9ubHkgdGhlIHByaW50YWJsZSBjaGFyYWN0ZXJzIHdpbGwgYmUKPj4gKyAqICAg
ICAgd3JpdHRlbi4gQ2hhcmFjdGVycyBtYXkgYmUgYnVmZmVyZWQgdW50aWwgYSBuZXdsaW5lIChp
LmUgJ1xuJykgaXMKPj4gKyAqICAgICAgZm91bmQuCj4+ICsgKiAgICAgIEByZXR1cm4gMCBvbiBz
dWNjZXNzLCBvdGhlcndpc2UgcmV0dXJuIGFuIGVycm9yIGNvZGUuCj4+ICsgKiAgKiBDT05TT0xF
SU9fcmVhZDogQXR0ZW1wdHMgdG8gcmVhZCB1cCBAY291bnQgY2hhcmFjdGVycyBmcm9tIFhlbiBj
b25zb2xlLgo+IAo+ICIuLi4gdXAgdG8gQGNvdW50IC4uLiIKPiAKPj4gKyAqICAgICAgVGhlIG1h
eGltdW0gYnVmZmVyIHNpemUgKGkuZSBAY291bnQpIHN1cHBvcnRlZCBpcyAyR0IuCj4gCj4gImku
ZS4iIG9yICJpZSIgYXJlIHRoZSB0d28gY29tbW9uIGZvcm1zIEknbSBhd2FyZSBvZi4KClllcywg
SSBtdXN0IGhhdmUgbWFkZSB1cCB0aGF0IG9uZS4gSSB3aWxsIHVzZSB0aGUgaS5lLiBmb3JtLgoK
PiAKPj4gKyAqICAgICAgQHJldHVybiB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlciByZWFkIG9uIHN1
Y2Nlc3MsIG90aGVyd2lzZSByZXR1cm4KPiAKPiAiY2hhcmFjdGVycyIKCkZpeGVkLgoKVGhhbmsg
eW91IGZvciB0aGUgYWNrLiBJIHdpbGwgd2FpdCBmb3IgdGhlIG9uL3RvIGRpc2N1c3Npb24gdG8g
c2V0dGxlIGJlZm9yZSAKY29tbWl0dGluZy4KCkNoZWVycywKClsxXSBodHRwczovL2lkaW9tcy50
aGVmcmVlZGljdGlvbmFyeS5jb20vd3JpdGUrb24KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
