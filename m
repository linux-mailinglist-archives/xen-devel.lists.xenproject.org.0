Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E91154E0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:10:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idG7z-0000vA-87; Fri, 06 Dec 2019 16:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idG7y-0000v5-97
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:06:46 +0000
X-Inumbo-ID: 659d629a-1842-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 659d629a-1842-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 16:06:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70447AFD8;
 Fri,  6 Dec 2019 16:06:43 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
Date: Fri, 6 Dec 2019 17:06:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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

T24gMDYuMTIuMjAxOSAxNTo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA1LzEyLzIwMTkg
MTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNS4xMi4yMDE5IDE3OjI3LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBPbiAwNS8xMi8yMDE5IDE1OjMzLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiArLyoKPj4+PiArICogU3RyaW5nIGNvbXBhcmlzb24gZnVuY3Rpb25zIG1vc3RseSBtYXRj
aGluZyBzdHJjbXAoKSAvIHN0cm5jbXAoKSwKPj4+PiArICogZXhjZXB0IHRoYXQgdGhleSB0cmVh
dCAnLScgYW5kICdfJyBhcyBtYXRjaGluZyBvbmUgYW5vdGhlci4KPj4+PiArICovCj4+Pj4gK3N0
YXRpYyBpbnQgX3N0cmNtcChjb25zdCBjaGFyICpzMSwgY29uc3QgY2hhciAqczIpCj4+Pgo+Pj4g
SSB0aG91Z2h0IHdlIHdlcmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBmdW5jdGlvbiBuYW1lIHdpdGgg
bGVhZGluZyBfPwo+Pgo+PiBXZSdyZSB0cnlpbmcgdG8gYXZvaWQgbmV3IG5hbWUgc3BhY2Ugdmlv
bGF0aW9ucy4gU3VjaCBhcmUKPj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIHR3byB1bmRl
cnNjb3JlcywKPj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIGFuIHVuZGVyc2NvcmUgYW5k
IGFuIHVwcGVyIGNhc2UgbGV0dGVyLAo+PiAtIGlkZW50aWZpZXJzIG9mIG5vbi1zdGF0aWMgc3lt
Ym9scyBzdGFydGluZyB3aXRoIGFuIHVuZGVyc2NvcmUuCj4gCj4gSSBhbSBub3Qgc3VyZSB0byB1
bmRlcnN0YW5kIHdoeSBub24tc3RhdGljIHN5bWJvbHMgb25seS4gVGhpcyB3b3VsZCAKPiBwcmV2
ZW50IHlvdSB0byB1c2UgdGhlIHRoZSBub24tc3RhdGljIHN5bWJvbCBpZiB5b3UgaGFwcGVuIHRv
IHJlLXVzZSB0aGUgCj4gc2FtZSBuYW1lLgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQu
IEFueXdheSAtIHdoYXQgSSd2ZSBsaXN0ZWQgYWJvdmUgaXMKd2hhdCB0aGUgbGFuZ3VhZ2Ugc3Rh
bmRhcmQgbWFuZGF0ZXMuCgo+IEFueXdheSwgaG93IGFib3V0IGNhbGxpbmcgaXQgY21kbGluZV9z
dHJuY21wKCk/IFRoaXMgd291bGQgYmUgZWFzaWVyIHRvIAo+IHNwb3QgbWlzdXNlIG9uIHJldmll
dyAoaS5lIHVzaW5nIHN0cm5jbXAoKSByYXRoZXIgdGhhbiBfc3RybmNtcCgpKS4KCldlIGFscmVh
ZHkgaGF2ZSBjbWRsaW5lX3N0cmNtcCgpLCBvciBlbHNlIEkgd291bGQgaW5kZWVkIGhhdmUgdXNl
ZAp0aGlzIHByZWZpeC4gTm8gcHJlZml4IChvdGhlciB0aGFuIHRoZSBsb25lIHVuZGVyc2NvcmUp
IHNlZW1lZCB0aGUKbmV4dCBiZXN0IG9wdGlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
