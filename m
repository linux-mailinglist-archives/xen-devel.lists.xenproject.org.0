Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1144635E62
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 15:53:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWIa-0002HS-LA; Wed, 05 Jun 2019 13:49:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYWIZ-0002HN-Ru
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:49:51 +0000
X-Inumbo-ID: ca0eb70a-8798-11e9-b361-9faaeca1a4bf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ca0eb70a-8798-11e9-b361-9faaeca1a4bf;
 Wed, 05 Jun 2019 13:49:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ACEF80D;
 Wed,  5 Jun 2019 06:49:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D42B3F246;
 Wed,  5 Jun 2019 06:49:49 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>
 <23799.43045.610265.697616@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <03e4ddf2-37d8-9d99-06aa-1c9b7dae91d0@arm.com>
Date: Wed, 5 Jun 2019 14:49:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23799.43045.610265.697616@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds [and 1 more messages]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMDUvMDYvMjAxOSAxMjozMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSnVsaWVu
IEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAyLzJdIFJGQzogZW5hYmxlIENPTkZJ
R19MSVZFUEFUQ0ggaW4gYWxsIHJlbGV2YW50IGFybTY0IGJ1aWxkcyIpOgo+PiBPbiAwNS8wNi8y
MDE5IDEyOjEzLCBJYW4gSmFja3NvbiB3cm90ZToKPj4+IFN3aXRjaGluZyBvbiBDT05GSUdfTElW
RVBBVENIIGZvciB0aGUgYWZmZWN0ZWQgdGVzdHMgd2lsbCwgaG9wZWZ1bGx5LAo+Pj4gbWFrZSB0
aGlzIHByb2JsZW0gImdvIGF3YXkiIGFnYWluLiAgVGhpcyBpcyBjbGVhcmx5IGEgYm9kZ2UuICBC
dXQgaXQKPj4+IGlzIGJldHRlciB0aGFuIHNpbXBseSBmb3JjZSBwdXNoaW5nOiBpZiB3ZSBjYW4g
Z2V0IGl0IHRvIGJvb3QsIHdlIHdpbGwKPj4+IGJlIGFibGUgdG8gcnVuIHRoZSBvdGhlciB0ZXN0
cy4KPj4KPj4gSG93IGFib3V0IGRpc2FibGluZyB0aGUgdGVzdCBvbiByb2NoZXN0ZXI/Cj4gCj4g
SSBjb3VsZCBpbnZlbnQgYSBuZXcgaG9zdGZsYWcKPiAgICB4ZW4tNC4xMS1hcm02NC1zZWVtcy10
by1ib290LW9rCj4gYnV0IHRoYXQgc2VlbXMgcmlkaWN1bG91cy4KPiAKPiBBbmQsIHdlIHByZXN1
bWFibHkgd2FudCB0byBhY3R1YWxseSB0ZXN0IG90aGVyIHRoaW5ncyBvbiByb2NoZXN0ZXIhCgpU
aGUgcHJvYmxlbSBpcyBJIGhhdmUgbm8gd2F5IHRvIHRlbGwgd2hldGhlciBhIGdpdmVuIFhlbiB3
aWxsIGJvb3Qgb24gVGh1bmRlci1YIAoob3IgYW55IG90aGVyIEFybSBwbGF0Zm9ybSB3ZSBtYXkg
YnV5KSBhdCBhbnkgcG9pbnQgdGhlIGZ1dHVyZS4KCkl0IHdvdWxkIGJlIHByZWZlcmFibGUgaWYg
d2UgaGF2ZSBhIHdheSB0byBzYXkgInRlc3QgRk9PIGNhbid0IHJ1biBvbiAKcm9jaGVzdGVyezAs
MX0iLgoKPiAKPiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggMi8yXSBS
RkM6IGVuYWJsZSBDT05GSUdfTElWRVBBVENIIGluIGFsbCByZWxldmFudCBhcm02NCBidWlsZHMi
KToKPj4gT24gMDUuMDYuMTkgYXQgMTM6MTMsIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPiB3
cm90ZToKPj4+IC0tLSBhL21maS1jb21tb24KPj4+ICsrKyBiL21maS1jb21tb24KPj4+IEBAIC0z
NzMsNyArMzczLDggQEAgY3JlYXRlX2J1aWxkX2pvYnMgKCkgewo+Pj4gICAgICAgICAgIGZpCj4+
PiAgICAgICBmaQo+Pj4gICAKPj4+IC0gICAgaWYgYnJhbmNoX3dhbnRzX2xpdmVwYXRjaDsgdGhl
bgo+Pj4gKyAgICBpZiBicmFuY2hfd2FudHNfbGl2ZXBhdGNoIHx8Cj4+PiArICAgICAgICAgIFsg
JGFyY2ggPSBhcm02NCAtYSAiJHhlbmJyYW5jaCIgPSB4ZW4tNC4xMS10ZXN0aW5nIF07IHRoZW4K
Pj4+ICAgICAgICAgIGxpdmVwYXRjaF9ydW52YXJzPSdlbmFibGVfbGl2ZXBhdGNoPXRydWUnCj4+
PiAgICAgICBmaQo+Pgo+PiBJc24ndCB0aGlzIG92ZXJseSByZXN0cmljdGl2ZSwgaS5lLiB3b3Vs
ZG4ndCB0aGlzIGJldHRlciBiZSBkb25lIHVuaWZvcm1seQo+PiBmb3IgYWxsIGJyYW5jaGVzPwo+
IAo+IE5vLiAgQmVjYXVzZSB0aGUgYnVnIGlzIGEgcmFuZG9tIGZhaWx1cmUsIEkgZG9uJ3Qgd2Fu
dCB0byBwZXJtdXRlIGFsbAo+IHRoZSBvdGhlciBicmFuY2hlcyBhbmQgbWF5YmUgY2F1c2UgdGhl
bSB0byBleHBlcmllbmNlIGl0Lgo+IAo+IEkgc3RpbGwgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGZpeCB0aGlzIGluIHRoZSBYZW4gY29kZS4KCkkgYW0gYWZyYWlkIHRoYXQncyBub3QgZ29p
bmcgdG8gYmUgcG9zc2libGUuIEl0IHJlcXVpcmVzIGEgZnVsbCByZXdvcmsgb2YgdGhlIApib290
IGFuZCBtZW1vcnkgY29kZS4gQXQgdGhlIG1vbWVudCwgSSBoYXZlIDEwMCBwYXRjaGVzIHdyaXR0
ZW4sIGFuZCBJIHdvdWxkIApleHBlY3QgbXVjaCBtb3JlIHRvIGNvbWUuCgo+IAo+IFdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIG1ha2Ugd2hldGhlciB0byBkbyAid3JvbmcgdGhpbmcgQSIgKHdoaWNo
IGRvZXMKPiBub3QgYm9vdCBvbiByb2Noc3Rlcikgb3IgIndyb25nIHRoaW5nIEIiICh3aGljaCBi
b290cyBvbiByb2NoZXN0ZXIgYnV0Cj4gbm90IG9uIHNvbWUgb3RoZXIgdW5rbm93biBtYWNoaW5l
KHMpKSBhIGNvbmZpZyBvciBib290LXRpbWUgb3B0aW9uID8KClRoYXQncyBub3QgYW4gb3B0aW9u
IGZvciBtZS4gVGhlcmUgYXJlIG5vIHByb21pc2UgdGhhdCBYZW4gd2lsbCBub3QgY3Jhc2ggaW4g
dGhlIApmdXR1cmUgb24gVGh1bmRlci1YIChvciBhbnkgbmV3IHBsYXRmb3JtIHdlIGhhdmUpIHdp
dGhvdXQgYWRkcmVzc2luZyBhbGwgdGhlIApwcm9ibGVtLgoKVGhpcyBpcyBhbiBhbm5veWluZyBw
cm9ibGVtLCBidXQgdGhlIG9ubHkgdGhpbmcgd2UgY2FuIGRvIGlzIGxpbWl0aW5nIHRoZSAKdGVz
dGluZyBvbiBUaHVuZGVyLVggZm9yIHRoZSB0aW1lIGJlaW5nLgoKVGhpcyBpcyBub3QgdGhlIGZp
cnN0IHRpbWUgd2UgZmFjZSBBcm0gQXJtIHZpb2xhdGlvbiBpbiBYZW4uIFdlIGFscmVhZHkgaGFk
IApzaW1pbGFyIHByb2JsZW0gb24gQXJtMzIgd2l0aCB0aGUgU2V0L1dheSAocmVtZW1iZXIgZ3Vl
c3QgY3Jhc2hpbmcgdGltZSB0byB0aW1lKS4KCkkgaG9wZSBzdWNoIGlzc3VlcyB3aWxsIHNob3cg
aG93IGNyaXRpY2FsIGl0IGlzIHRvIHdvcmsgYWN0aXZlbHkgbWFraW5nIFhlbiBtb3JlIApjb21w
bGlhbnQgcmF0aGVyIHRoYW4gcGlsaW5nIHVwIG1vcmUgd29yayBvbiB0b3Agb2YgdW5zdGFibGUg
Zm91bmRhdGlvbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
