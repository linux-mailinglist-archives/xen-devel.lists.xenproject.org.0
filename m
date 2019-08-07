Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BE84F84
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNYg-0004Gc-2o; Wed, 07 Aug 2019 15:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvNYe-0004GX-FZ
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:08:56 +0000
X-Inumbo-ID: 452215e6-b925-11e9-a9d2-a391f642a236
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 452215e6-b925-11e9-a9d2-a391f642a236;
 Wed, 07 Aug 2019 15:08:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13F94ACFA;
 Wed,  7 Aug 2019 15:08:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
 <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
Date: Wed, 7 Aug 2019 17:08:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNzowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wOC8yMDE5
IDE1OjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNTo0MSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEZ1cnRoZXJtb3JlLCBpZiB0aGVyZSBpcyB0aGlzIHByb2JsZW0g
Zm9yIGV2ZW50IGNoYW5uZWxzLCB0aGVuIHRoZXJlIGlzCj4+PiBhbG1vc3QgY2VydGFpbmx5IGEg
cmVsYXRlZCBwcm9ibGVtIGZvciBncmFudCB0YWJsZXMuCj4+Pgo+Pj4gVGhlIGNvbnRyb2wgaW4g
WGVuIHNob3VsZCBiZSBleHByZXNzZWQgaW4gYSBwb3NpdGl2ZSBmb3JtLCBvciB0aGUgbG9naWMK
Pj4+IHdpbGwgYmVjb21lIGEgdGFuZ2xlLsKgIEl0IHNob3VsZCBiZSBhIGJpdCBwZXJtaXR0aW5n
IHRoZSB1c2Ugb2YgdGhlIEZJRk8KPj4+IEFCSSwgcmF0aGVyIHRoYW4gYSBiaXQgc2F5aW5nICJv
aCBhY3R1YWxseSwgeW91IGNhbid0IHVzZSB0aGF0Ii4KPj4+Cj4+PiBUaGF0IHNhaWQsIGl0IG1p
Z2h0IGJlIGVhc2llciB0byBkZWNsYXJlIEZJRk8gdG8gYmUgImV2ZW50IGNoYW5uZWwgdjIiLAo+
Pj4gYW5kIHNwZWNpZnkgbWF4X3tncmFudCxldm50Y2hufV92ZXIgaW5zdGVhZC4KPj4KPj4gSSdt
IG5vdCBzdXJlIGFzc3VtaW5nIGxpbmVhciAob3IgYWN0dWFsbHkgYW55KSBvcmRlcmluZyBiZXR3
ZWVuCj4+IHZhcmlhbnRzIGlzIGEgZ29vZCB0aGluZy4gWWVzLCByaWdodCBub3cgd2Ugb25seSBo
YXZlIGdudHRhYgo+PiB2MSBhbmQgdjIgYW5kIGV2dGNobiAybCBhbmQgZmlmbywgd2hpY2ggY291
bGQgYmUgY29uc2lkZXJlZCB2MQo+PiBhbmQgdjIgYXMgeW91IHN1Z2dlc3QuIEhvd2V2ZXIsIGFz
c3VtaW5nIGEgM3JkIHZhcmlhbnQgc3VyZmFjZXMsCj4+IHdoeSB3b3VsZCBpdCBiZSB0aGF0IG9u
ZSBoYXMgdG8gZXhwb3NlIHYyIGp1c3QgdG8gbWFrZSB2Mwo+PiB1c2FibGU/IEluIHBhcnRpY3Vs
YXIgZ250dGFiIHYyIGhhcyB2YXJpb3VzIGlzc3VlcyAod2hpY2ggaXMgd2h5Cj4+IHlvdSBpbnRy
b2R1Y2VkIGEgd2F5IHRvIGRpc2FibGUgaXRzIHVzZSBpbiB0aGUgZmlyc3QgcGxhY2UpLCB5ZXQK
Pj4gSSdkIGhvcGUgd2UnZCBlbmQgdXAgd2l0aCBhIGxlc3MgcXVpcmt5IHYzIGlmIG9uZSBldmVy
IGJlY29tZXMKPj4gbmVjZXNzYXJ5LiBBbmQgaW4gdHVybiBJJ2QgaG9wZSB3ZSBjb3VsZCBoaWRl
IHYyIGZyb20gYW55IHYzCj4+IHVzZXJzLgo+Pgo+PiBJT1cgSSB0aGluayBhIGJpdG1hcCB0byBw
ZXJtaXQgdXNlIG9mICJhZHZhbmNlZCIgdmVyc2lvbnMgaXMKPj4gbW9yZSBmdXR1cmUgcHJvb2Yu
IChBcyBhIHNpZGUgbm90ZSwgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvCj4+IGludHJvZHVjZSBh
IGRpc2FibGUgZm9yIHRoZSByZXNwZWN0aXZlIHYxIGludGVyZmFjZXMuKQo+IAo+IFdlIGFic29s
dXRlbHkgZG8gd2FudCBhIHdheSB0byB0dXJuIGV2ZXJ5dGhpbmcgb2ZmLgo+IAo+IFRoZSBpbmFi
aWxpdHkgdG8gdHVybiB0aGUgWGVuIGV4dGVuc2lvbnMgb2ZmIGZvciBIVk0gZ3Vlc3RzIChldmVu
IGlmCj4gb25seSBmb3IgZGVidWdnaW5nIHB1cnBvc2VzKSBpcyBhIHNldmVyZWx5IHNob3J0IHNp
Z2h0ZWQgZGVjaXNpb24uCgpGb3IgSFZNIHBlcmhhcHMsIGJ1dCBub3QgZm9yIFBWLgoKPiBJdCBp
cyBhbHNvIGEgZmVhdHVyZSB3aGljaCBoYXMgYmVlbiByZXF1ZXN0ZWQgcmVwZWF0ZWRseSBieSB1
c2VycyBpbiB0aGUKPiBwYXN0LCBhbmQgSSBhbSB2ZXJ5IGRlbGliZXJhdGVseSBidWlsZGluZyBh
IHdheSB0byBkbyB0aGlzIGludG8gdGhlCj4gQ1BVSUQgd29yay4KPiAKPiBIb3dldmVyLCBpdCBp
cyBhbiB1bnJlYXNvbmFibGUgcmVxdWVzdCB0byBidW5kbGUgaW50byB0aGlzIGJ1Z2ZpeCwgaGVu
Y2UKPiB3aHkgSSBkaWRuJ3Qgc3VnZ2VzdCBpdC4KClRoZXJlJ3Mgbm8gYnVnIGZpeCBoZXJlLCBh
cyB0aGVyZSdzIG5vIGJ1ZyAoaW4gWGVuKS4KCj4gTm93IEkgdGhpbmsgYWJvdXQgaXQsIHRoaW5n
cyBsaWtlIGF2YWlsYWJsZSBBQklzIHJlYWxseSBzaG91bGQgYmUgaW4gdGhlCj4gWGVuIGh5cGVy
dmlzb3IgQ1BVSUQgbGVhdmVzLCBidXQgYWdhaW4sIHRoYXQgc2hpcCBzYWlsZWQgYSBkZWNhZGUg
YWdvLgoKRm9yIGNvbXBhcmlzb24sIGRvIHlvdSBrbm93IG9mIGFueSBDUFUgYXJjaGl0ZWN0dXJl
IG1ha2luZyBfYWxsXwpvZiBpdHMgYmFzaWMgaW5zbnMgYW5kIG90aGVyIGZ1bmN0aW9uYWxpdHkg
YXZhaWxhYmxlIGNvbmRpdGlvbmFsbHkKb25seT8gSnVzdCBsaWtlIHRoZXJlLCBJIHRoaW5rIGl0
IGlzIHJlYXNvbmFibGUgdG8gaGF2ZSBhIGJhc2ljCnNldCBhdmFpbGFibGUgaW4gYWxsIGNhc2Vz
LiBOZXZlcnRoZWxlc3MsIGFzIHNhaWQgYWJvdmUsIEhWTSBtaWdodApoYXZlIGJlbmVmaXRlZCBm
cm9tIG1ha2luZyBldmVuIHNvbWUgYmFzaWMgaHlwZXJjYWxscyBjb25kaXRpb25hbCwKYmVjYXVz
ZSB0aGVyZSB0aGV5J3JlIHN0cmljdGx5IGV4dGVuc2lvbnMsIG5vdCBiYXNlIGZ1bmN0aW9uYWxp
dHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
