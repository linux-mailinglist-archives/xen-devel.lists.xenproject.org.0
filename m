Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E6A35DFD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 15:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYW2z-0008Sa-V8; Wed, 05 Jun 2019 13:33:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYW2x-0008SV-NA
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:33:43 +0000
X-Inumbo-ID: 891736f2-8796-11e9-95c6-ff8a10330710
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 891736f2-8796-11e9-95c6-ff8a10330710;
 Wed, 05 Jun 2019 13:33:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6751880D;
 Wed,  5 Jun 2019 06:33:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33B123F246;
 Wed,  5 Jun 2019 06:33:41 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <23799.43045.610265.697616@mariner.uk.xensource.com>
 <5CF7BE9A0200007800235895@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7d7f4537-edca-cd15-0210-5c9c38061f0c@arm.com>
Date: Wed, 5 Jun 2019 14:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7BE9A0200007800235895@prv1-mh.provo.novell.com>
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8wNi8yMDE5IDE0OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNS4w
Ni4xOSBhdCAxMzozMSwgPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBJIHN0aWxs
IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBmaXggdGhpcyBpbiB0aGUgWGVuIGNvZGUuCj4g
Cj4gRnVsbHkgYWdyZWUuIEJ1dCBhcyBKdWxpZW4gc2F5cyAtIGZ1bGx5IGZpeGluZyB0aGlzIG1h
eSBiZSB0b28gaW50cnVzaXZlCj4gZm9yIG9sZCBicmFuY2hlcyAocHJvdmlkZWQgaXQgZ2V0cyBm
aXhlZCBvbiBtYXN0ZXIgYXQgYWxsKS4KCldlbGwgd2UgaGF2ZSBubyBvdGhlciBjaG9pY2UgdGhh
biBmaXhpbmcgaW4gbWFzdGVyLi4uIE90aGVyd2lzZSB3ZSBhcmUgZmFjaW5nIApYZW4gdG8gYmUg
Y29tcGxldGVseSB1bnVzYWJsZSBvbiBuZXdlciBwbGF0Zm9ybS4KCkhvd2V2ZXIsIGl0IGlzIHZl
cnkgdW5saWtlbHkgdG8gYmUgZml4ZWQgaW4gb2xkIGJyYW5jaGVzIGJlY2F1c2UgdGhlIGJvb3Qv
bWVtb3J5IApjb2RlIG5lZWRzIGEgZnVsbCByZXdyaXRlLgoKPiAKPj4gV291bGQgaXQgYmUgcG9z
c2libGUgdG8gbWFrZSB3aGV0aGVyIHRvIGRvICJ3cm9uZyB0aGluZyBBIiAod2hpY2ggZG9lcwo+
PiBub3QgYm9vdCBvbiByb2Noc3Rlcikgb3IgIndyb25nIHRoaW5nIEIiICh3aGljaCBib290cyBv
biByb2NoZXN0ZXIgYnV0Cj4+IG5vdCBvbiBzb21lIG90aGVyIHVua25vd24gbWFjaGluZShzKSkg
YSBjb25maWcgb3IgYm9vdC10aW1lIG9wdGlvbiA/ID4KPiBTaW5jZSBpdCdzIGFwcGFyZW50bHkg
WGVuIGltYWdlIGRlcGVuZGVudCwgYSBib290IHRpbWUgb3B0aW9uIHNlZW1zCj4gdW5saWtlbHkg
dG8gYmUgYSBwb3NzaWJpbGl0eS4gQSBjb25maWcgb3B0aW9uIG1pZ2h0IGJlIHBvc3NpYmxlLCBi
dXQgdGhhdCwKPiBhcyB5b3Ugc2F5IGVsc2V3aGVyZSBvbiBhbm90aGVyIGFzcGVjdCwgc2VlbXMg
cmlkaWN1bG91cy4gQnV0IGluIHRoZQo+IGVuZCB0aGUgQXJtIG1haW50YWluZXJzIHdpbGwga25v
dyBiZXN0Li4uCgpOb25lIG9mIHRob3NlIG9wdGlvbnMgbG9va3MgYXBwZWFsaW5nIHRvIG1lIGJl
Y2F1c2Ugd2UgYXJlIG5vdCBpbW11bmUgdG8gaGF2ZSAKbW9yZSBidWcgbG9vbWluZyBpbiB0aGUg
ZnV0dXJlIGJlY2F1c2Ugb2YgYW55IGJhY2twb3J0IHBhdGNoZXMgdGhhdCBjYW4gCmRlY3JlYXNl
L2luY3JlYXNlIHNpemUgb2YgWGVuLgoKV2Ugd2lsbCBqdXN0IGhhdmUgdG8gbGl2ZSB3aXRoIGl0
IGFuZCBhZGRyZXNzIHRoZW0gYXMgdGhleSBjb21lIGluIHN0YWJsZSBicmFuY2hlcy4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
