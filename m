Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7374C360
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdiXK-0003pg-0T; Wed, 19 Jun 2019 21:54:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdiXJ-0003pZ-1d
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:54:33 +0000
X-Inumbo-ID: d1364b29-92dc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d1364b29-92dc-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:54:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05A32344;
 Wed, 19 Jun 2019 14:54:31 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 426A83F738;
 Wed, 19 Jun 2019 14:54:30 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
 <a29aa125-bb95-d178-0f74-0804d8ad6f91@arm.com>
 <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ff241dfa-fb0e-63d6-f345-f80afb6a6035@arm.com>
Date: Wed, 19 Jun 2019 22:54:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzE5LzE5IDEwOjQ3IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAxOSBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBTdGVmYW5vLAo+Pgo+PiBU
aXRsZTogWW91IHNob3VsZCBhdCBsZWFzdCBtZW50aW9uIHRoaXMgaXMgZm9yIG9wLXRlZS4KPj4K
Pj4gQWxzbywgbW9zdGx5IGxpa2VseSB0aGUgc2hhMSBpcyB0b28gc21hbGwgYW5kIGxpa2VseSB0
byBtYXRjaCBtdWx0aXBsZSBjb21taXQKPj4gaW4gdGhlIGZ1dHVyZS4gU28geW91IHdhbnQgdG8g
c3BlY2lmeSB0aGUgdGl0bGUgb2YgdGhlIGNvbW1pdC4KPj4KPj4gT24gNi8xOS8xOSAxMDoyNCBQ
TSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT3B0ZWUgYnJlYWtzIHRoZSBidWlsZCB3
aXRoOgo+Pj4KPj4+IG9wdGVlLmM6IEluIGZ1bmN0aW9uIOKAmHRyYW5zbGF0ZV9ub25jb250aWcu
aXNyYS404oCZOgo+Pj4gb3B0ZWUuYzo3NDM6Mzg6IGVycm9yOiDigJh4ZW5fZGF0YeKAmSBtYXkg
YmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPj4+IFstV2Vycm9yPW1heWJl
LXVuaW5pdGlhbGl6ZWRdCj4+PiAgICAgICAgICAgICAgICB4ZW5fZGF0YS0+bmV4dF9wYWdlX2Rh
dGEgPSBwYWdlX3RvX21hZGRyKHhlbl9wZ3MgKyAxKTsKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4+PiBvcHRlZS5jOjczMjo3MTogZXJyb3I6IOKAmGd1ZXN0
X2RhdGHigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzCj4+PiBmdW5jdGlvbiBb
LVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+Pj4gICAgICAgICAgICBwYWdlID0KPj4+IGdl
dF9kb21haW5fcmFtX3BhZ2UoZ2FkZHJfdG9fZ2ZuKGd1ZXN0X2RhdGEtPnBhZ2VzX2xpc3RbaWR4
XSkpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+IG9wdGVlLmM6NzUwOjIxOiBlcnJvcjog4oCY
Z3Vlc3RfcGfigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uCj4+
PiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+Pj4gICAgICAgICAgICAgICAgcHV0X3Bh
Z2UoZ3Vlc3RfcGcpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBeCj4+PiBjYzE6IGFsbCB3
YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+Pj4KPj4+IEZpeCBpdCBieSBpbml0aWFs
aXppbmcgeGVuX2RhdGEsIGd1ZXN0X2RhdGEsIGd1ZXN0X3BnIHRvIE5VTEwuIEFsc28gc2V0Cj4+
PiB4ZW5fcGdzIHRvIE5VTEwgZm9yIGNvbnNpc3RlbmN5Lgo+Pgo+PiBXaXRob3V0IG1vcmUgZXhw
bGFuYXRpb24gSSB0aGluayB0aGlzIGlzIGFuIHVud2lzZSBjaG9pY2UuIElmIEdDQyB0aGlua3Mg
aXQgaXMKPj4gZ29pbmcgdG8gYmUgdXNlZCB1bml0aWFsaXplZCwgdGhlbiBtb3N0bHkgbGlrZWx5
IHlvdSBzaWxlbnQgYW4gZXJyb3IgdGhhdAo+PiBjb3VsZCBlbmQgdXAgdG8gZGVyZWZlcmVuY2Ug
TlVMTC4KPj4KPj4gQWxzbywgc2V0dGluZyB4ZW5fcGdzIGZvciBjb25zaXN0ZW5jeSB3aWxsIG9u
bHkgZGVmZWF0IHRoZSBjb21waWxlci4gTGVhZGluZwo+PiB0byBkZXJlZmVyZW5jaW5nIE5VTEwg
YW5kIGNyYXNoIFhlbi4uLgo+Pgo+PiBGb3IgeGVuX3BncywgdGhpcyBzaG91bGQgZGVmaW5pdGVs
eSBub3QgYmUgTlVMTC4gRm9yIHRoZSB0d28gb3RoZXJzLCB5b3UgbmVlZAo+PiB0byBleHBsYWlu
IHdoeSB0aGlzIGlzIGZpbmUgKGlmIHRoaXMgaXMganVzdCBiZWNhdXNlIHRoZSBjb21waWxlciBj
YW4ndCBmaW5kCj4+IHRoZSByZWFzb24sIHRoZW4geW91IHNob3VsZCBhZGQgYSBjb21tZW50IGlu
IHRoZSBjb2RlIHRvIGV4cGxhaW4gaXQpLgo+IAo+IEkgd2FzIG9ubHkgdHJ5aW5nIHRvIHVuYmxv
Y2sgdGhlIGJ1aWxkLiAKClNvPyBXZSBkb24ndCBzaWxlbmNlIGEgY29tcGlsZXIgd2FybmluZyBq
dXN0IGZvciB1bmJsb2NraW5nIHRoZSBidWlsZCAKd2l0aG91dCBhbnkgcHJvcGVyIGludmVzdGln
YXRpb24uIERpZG4ndCB5b3UgZG8gdGhhdCBiZWZvcmUgYWRkaW5nIHRoZSBOVUxMPwoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
