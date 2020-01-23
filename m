Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5AB146595
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 11:23:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuZbG-00045i-9d; Thu, 23 Jan 2020 10:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuZbE-00045d-FS
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 10:20:32 +0000
X-Inumbo-ID: f723f286-3dc9-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f723f286-3dc9-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 10:20:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9D82B206;
 Thu, 23 Jan 2020 10:20:22 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
 <29772dcab47696af624d9c0a9026af38ac3be577.1579727989.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <987d9cd1-c2ed-0fd3-1f37-9b222ad7d02a@suse.com>
Date: Thu, 23 Jan 2020 11:20:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <29772dcab47696af624d9c0a9026af38ac3be577.1579727989.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/4] x86/microcode: Improve documentation
 for ucode=
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMzozMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gLS0tIGEvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jCj4gQEAgLTIxMzQsNyArMjEzNCwxMiBAQCBsb2dpYyBhcHBsaWVzOgo+ICAj
IyMgdWNvZGUgKHg4NikKPiAgPiBgPSBMaXN0IG9mIFsgPGludGVnZXI+IHwgc2Nhbj08Ym9vbD4s
IG5taT08Ym9vbD4gXWAKPiAgCj4gLVNwZWNpZnkgaG93IGFuZCB3aGVyZSB0byBmaW5kIENQVSBt
aWNyb2NvZGUgdXBkYXRlIGJsb2IuCj4gKyAgICBBcHBsaWNhYmlsaXR5OiB4ODYKCldpdGggdGhp
cywgdGhlICh4ODYpIGluIHRoZSBzZWN0aW9uIHRpdGxlIHNob3VsZCBnbyBhd2F5LCBJIHRoaW5r
LgoKPiArICAgIERlZmF1bHQ6IGBubWlgCj4gKwo+ICtDb250cm9scyBmb3IgQ1BVIG1pY3JvY29k
ZSBsb2FkaW5nLiBGb3IgZWFybHkgbG9hZGluZywgdGhpcyBwYXJhbWV0ZXIgY2FuCj4gK3NwZWNp
ZnkgaG93IGFuZCB3aGVyZSB0byBmaW5kIHRoZSBtaWNyb2NvZGUgdXBkYXRlIGJsb2IuIEZvciBs
YXRlIGxvYWRpbmcsCj4gK3RoaXMgcGFyYW1ldGVyIHNwZWNpZmllcyBpZiB0aGUgdXBkYXRlIGhh
cHBlbnMgd2l0aGluIGEgTk1JIGhhbmRsZXIuCj4gIAo+ICAnaW50ZWdlcicgc3BlY2lmaWVzIHRo
ZSBDUFUgbWljcm9jb2RlIHVwZGF0ZSBibG9iIG1vZHVsZSBpbmRleC4gV2hlbiBwb3NpdGl2ZSwK
PiAgdGhpcyBzcGVjaWZpZXMgdGhlIG4tdGggbW9kdWxlIChpbiB0aGUgR3JVQiBlbnRyeSwgemVy
byBiYXNlZCkgdG8gYmUgdXNlZAo+IEBAIC0yMTUyLDYgKzIxNTcsNyBAQCBpbWFnZSB0aGF0IGNv
bnRhaW5zIG1pY3JvY29kZS4gRGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSB0aGUgYmxvYiB3aXRo
IHRoZQo+ICBtaWNyb2NvZGUgaW4gdGhlIGNwaW8gbmFtZSBzcGFjZSBtdXN0IGJlOgo+ICAgIC0g
b24gSW50ZWw6IGtlcm5lbC94ODYvbWljcm9jb2RlL0dlbnVpbmVJbnRlbC5iaW4KPiAgICAtIG9u
IEFNRCAgOiBrZXJuZWwveDg2L21pY3JvY29kZS9BdXRoZW50aWNBTUQuYmluCj4gK0lmIEVGSSBi
b290LCB0aGUgYHVjb2RlPTxmaWxlbmFtZT5gIGNvbmZpZyB0YWtlcyBwcmVjZW5kZW5jZSBvdmVy
IGBzY2FuYC4KCiJJbiBFRkkgYm9vdCIgaXMgd3JvbmcsIGlzbid0IGl0PyBUaGlzIGlzIGZvciB4
ZW4uZWZpIG9ubHkgYWl1aS4KQWxzbyB0aGVyZSdzIGEgc3RyYXkgJ24nIGluICJwcmVjZWRlbmNl
Ii4KCkFsbCBjb3VsZCBiZSB0YWtlbiBjYXJlIG9mIHdoaWxlIGNvbW1pdHRpbmcsIEkgZ3Vlc3Ms
IHNvIHdpdGgKdGhpcwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
