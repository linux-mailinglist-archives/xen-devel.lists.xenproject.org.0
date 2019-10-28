Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265DE70C5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:51:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3WS-0007In-J8; Mon, 28 Oct 2019 11:49:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZLsx=YV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iP3WQ-0007Id-KN
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:49:18 +0000
X-Inumbo-ID: f8a05b62-f978-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f8a05b62-f978-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 11:49:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 088C01F1;
 Mon, 28 Oct 2019 04:49:17 -0700 (PDT)
Received: from [10.1.196.50] (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BCBE3F6C4;
 Mon, 28 Oct 2019 04:49:16 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>
References: <23985.51097.655432.655379@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <66044a22-2551-dbab-4c74-cc29f89606c9@arm.com>
Date: Mon, 28 Oct 2019 11:49:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23985.51097.655432.655379@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] rochester and Debian buster
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMjQvMTAvMjAxOSAxNjo0NywgSWFuIEphY2tzb24gd3JvdGU6Cj4gV2UgZGlz
Y3Vzc2VkIG9uIGlyYyB0aGUgcHJvYmxlbXMgSSBoYXZlIGJlZW4gaGF2aW5nIHRyeWluZyB0byBn
ZXQKPiBidXN0ZXIncyByZWxlYXNlZCBrZXJuZWwgdG8gcnVuIG9uIHRoZSByb2NoZXN0ZXJzLCB3
aGljaCBpcyB3YW50ZWQgdG8KPiB1cGdyYWRlIG9zc3Rlc3QgdG8gYnVzdGVyICh3aGljaCBpcyBj
dXJyZW50bHkgRGViaWFuIHN0YWJsZSkuCj4gCj4gVW5mb3J0dW5hdGVseSBvdXIgcHJldmlvdXMg
Y29udmVyc2F0aW9ucyBkb24ndCBzZWVtIHRvIGhhdmUgYmVlbgo+IHJlY29yZGVkIGFueXdoZXJl
LiAgTGV0J3MgdHJ5IGF0IGxlYXN0IHRvIHdyaXRlIHRoaW5ncyBkb3duIG5vdy4KPiAKPiBUaGUg
c3ltcHRvbSBpcyB0aGF0IHRoZSBtYWNoaW5lIHRoaW5rcyB0aGUgbmV0d29yayBsaW5rIGlzIGRv
d24sIGFuZAo+IG5vIG5ldHdvcmsgc3R1ZmYgaGFwcGVucywgc28gdGhlIGluc3RhbGxlciBkb2Vz
bid0IHdvcmsuICAoSSBkb24ndAo+IHRoaW5rIEkgaGF2ZSBjaGVja2VkIGF0IHRoZSBzd2l0Y2gg
ZW5kIHdoZXRoZXIgdGhlIGxpbmsgaXMgYWN0dWFsbHkKPiB1cC4pCgpJIGhhdmUganVzdCByZW1l
bWJlcmVkIHRoYXQgd2UgYXJlIG5vdCB1c2luZyB0aGUgb24tYm9hcmQgbmV0d29yayBjYXJkIGJ1
dCAKaW5zdGVhZCBhIFVTQiBkb25nbGUuIExvb2tpbmcgYXQgdGhlIGxvZywgaXQgbG9va3MgbGlr
ZSB0aGUga2VybmVsIGZvdW5kIHRoZSBkb25nbGU6CgpPY3QgMjQgMTA6NTc6MzEuNDk5MDg1IFsg
ICAxNC40MjEwNjRdIGFzaXggMy0xLjM6MS4wIGV0aDU6IHJlZ2lzdGVyICdhc2l4JyBhdCAKdXNi
LTAwMDA6MDA6MTEuMC0xLjMsIEFTSVggQVg4ODc3MkIgVVNCIDIuMCBFdGhlcm5ldCwgMDA6NTA6
YjY6MjI6MDA6NjcKCkJ1dCBJIGFtIG5vdCBzdXJlIHdoaWNoIGV0aCBpbnRlcmZhY2UgaXMgbGlu
a2VkIHRvIGFuZCBob3cgeW91IGZvdW5kIG91dCB0aGUgCm5ldHdvcmsgaXMgZG93bi4KCj4gCj4g
WW91IHN1Z2dlc3RlZCB0aGF0IG1heWJlIGFkZGluZwo+ICAgIGlvbW11LnBhc3N0aHJvdWdoPTEK
PiB0byB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBtaWdodCBoZWxwLiAgQnV0IGl0IGhhc24ndC4K
PiAKPiBJIGhhdmUgYSBtZW1vcnkgb2YgZGlzY3Vzc2luZyB0aGUgbmV4dCBzdGVwcyBhbmQgSSB0
aGluayB3ZSBkaXNjdXNzZWQKPiB1cGdyYWRpbmcgdGhlIGZpcm13YXJlLiAgSWYgSSByZW1lbWJl
ciByaWdodGx5IHdlIGFncmVlZCAod2l0aAo+IEp1ZXJnZW4pIHRoYXQgdXBncmFkaW5nIHRoZSBm
aXJtd2FyZSBvbiBvbmUgb2YgdGhlIHR3byByb2NoZXN0ZXIKPiBtYWNoaW5lcyB3b3VsZCBiZSBh
biBhY2NlcHRhYmxlIHJpc2suICBDYW4gd2UgZmlsZSBhIHRpY2tldCB0byBoYXZlCj4gdGhhdCBk
b25lIGJ5IG91ciBvbnNpdGUgdGVjaG5pY2lhbiA/CgpJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdo
ZXRoZXIgdGhpcyB3b3VsZCBoZWxwIGJlY2F1c2UgSSBoYXZlIGhhZCByZXBvcnQgdGhhdCAKRGVi
aWFuIEJ1c3RlciBoYXMgYmVlbiBpbnN0YWxsZWQgc3VjY2Vzc2Z1bGx5IG9uIFRodW5kZXItWC4K
CkFueXdheSwgdXBkYXRpbmcgdGhlIGZpcm13YXJlIHRvIHNvbWV0aGluZyBtb3JlIHJlY2VudCB3
b3VsZCBiZSBnb29kLiBXZSBhcmUgCmN1cnJlbnRseSB1c2luZyBUNDgsIGFuZCB0aGUgbW9zdCBy
ZWNlbnQgc2VlbXMgdG8gYmUgRjAyIFsxXS4KCkl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB0byBt
ZSB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgVHh4IGFuZCBGeHggCnJlbGVhc2Uu
IEkgaGF2ZSBhc2tlZCBzb21lIGhlbHAgYW5kIHdpbGwgbGV0IHlvdSBrbm93LgoKQ2hlZXJzLAoK
WzFdIGh0dHBzOi8vd3d3LmdpZ2FieXRlLmNvbS9BUk0tU2VydmVyL1IxNTAtVDYxLXJldi0xMTAv
c3VwcG9ydCNzdXBwb3J0LWRsLWJpb3MKCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
