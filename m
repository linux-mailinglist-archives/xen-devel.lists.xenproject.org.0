Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C899113FF9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 12:15:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icp3K-0001OG-9z; Thu, 05 Dec 2019 11:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icp3I-0001OB-WB
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 11:12:09 +0000
X-Inumbo-ID: 129b8c7c-1750-11ea-821f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 129b8c7c-1750-11ea-821f-12813bfff9fa;
 Thu, 05 Dec 2019 11:12:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1F131AD79;
 Thu,  5 Dec 2019 11:12:06 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
 <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
 <cb2c4422-f425-721b-2b66-48fe7ba300ce@suse.com>
 <fff722182ec8405486b4e29d4519c140@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e09cf45c-1326-91b6-7602-5f0391dd22eb@suse.com>
Date: Thu, 5 Dec 2019 12:12:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fff722182ec8405486b4e29d4519c140@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "Xia, Hongyan" <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxMjowMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDA1
IERlY2VtYmVyIDIwMTkgMTA6MjYKPj4gVG86IFhpYSwgSG9uZ3lhbiA8aG9uZ3l4aWFAYW1hem9u
LmNvbT4KPj4gQ2M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgd2xAeGVuLm9yZzsKPj4gcm9nZXIucGF1QGNpdHJpeC5jb20KPj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCA2LzldIHg4Ni9tbTogYWRkIGFuIGVuZF9v
Zl9sb29wIGxhYmVsCj4+IGluIG1hcF9wYWdlc190b194ZW4KPj4KPj4gT24gMDUuMTIuMjAxOSAx
MToyMSwgWGlhLCBIb25neWFuIHdyb3RlOgo+Pj4+IE9uIDAyLjEwLjIwMTkgMTk6MTYsIEhvbmd5
YW4gWGlhIHdyb3RlOgo+Pj4+PiBXZSB3aWxsIHNvb24gbmVlZCB0byBjbGVhbiB1cCBtYXBwaW5n
cyB3aGVuZXZlciB0aGUgb3V0IG1vc3QgbG9vcCBpcwo+Pj4+PiBlbmRlZC4gQWRkIGEgbmV3IGxh
YmVsIGFuZCB0dXJuIHJlbGV2YW50IGNvbnRpbnVlJ3MgaW50byBnb3RvJ3MuCj4+Pj4KPj4+PiBJ
IHRoaW5rIGFscmVhZHkgd2hlbiB0aGlzIHN0aWxsIHdhcyBSRkMgSSBkaWQgaW5kaWNhdGUgdGhh
dCBJJ20gbm90Cj4+Pj4gaGFwcHkgYWJvdXQgdGhlIGludHJvZHVjdGlvbiBvZiB0aGVzZSBsYWJl
bHMgKGluY2x1ZGluZyBhbHNvIHBhdGNoIDgpLgo+Pj4+IEkgcmVhbGl6ZSBpdCdzIHF1aXRlIGEg
bG90IHRvIGFzaywgYnV0IGJvdGggZnVuY3Rpb25zIHdvdWxkIGJlbmVmaXQKPj4+ID5mcm9tIHNw
bGl0dGluZyB1cCBpbnRvIHBlci1sZXZlbCBoZWxwZXIgZnVuY3Rpb25zLCB3aGljaCAtIGFmYWlj
dCAtCj4+Pj4gd291bGQgYXZvaWQgdGhlIG5lZWQgZm9yIHN1Y2ggbGFiZWxzLCBhbmQgd2hpY2gg
d291bGQgYXQgdGhlIHNhbWUKPj4+PiB0aW1lIGxpa2VseSBtYWtlIGl0IHF1aXRlIGEgYml0IGVh
c2llciB0byBleHRlbmQgdGhlc2UgdG8gdGhlCj4+Pj4gNS1sZXZlbCBwYWdlIHRhYmxlcyBjYXNl
IGRvd24gdGhlIHJvYWQuCj4+Pgo+Pj4gQSBjb21tb24gcGF0dGVybiBJIGhhdmUgZm91bmQgd2hl
biBtYXBwaW5nIFBURSBwYWdlcyBvbi1kZW1hbmQgKGFuZCBJCj4+PiB0aGluayBpcyB0aGUgZXhh
Y3QgaW50ZW50aW9uIG9mIHRoZXNlIGxhYmVscyBmcm9tIFdlaSwgYWxzbyBkZXNjcmliZWQKPj4+
IGluIHRoZSBjb21taXQgbWVzc2FnZSkgaXMgdGhhdCB3ZSBvZnRlbiBuZWVkIHRvIGRvOgo+Pj4K
Pj4+IG1hcCBzb21lIHBhZ2VzIC0gcHJvY2VzcyB0aG9zZSBwYWdlcyAtIGVycm9yIG9jY3VycyBv
ciB0aGlzIGl0ZXJhdGlvbgo+Pj4gb2YgbG9vcCBjYW4gYmUgc2tpcHBlZCAtIF9jbGVhbiB1cCB0
aGUgbWFwcGluZ3NfIC0gY29udGludWUgb3IgcmV0dXJuCj4+Pgo+Pj4gQXMgbG9uZyBhcyBjbGVh
bmluZyB1cCBpcyByZXF1aXJlZCwgdGhlc2UgbGFiZWxzIHdpbGwgbGlrZWx5IGJlIG5lZWRlZAo+
Pj4gYXMgdGhlIGNsZWFuLXVwIHBhdGggYmVmb3JlIHNraXBwaW5nIG9yIHJldHVybmluZywgc28g
SSB3b3VsZCBzYXkgd2UKPj4+IHdpbGwgc2VlIHN1Y2ggbGFiZWxzIGV2ZW4gaWYgd2Ugc3BsaXQg
aXQgaW50byBoZWxwZXIgZnVuY3Rpb25zCj4+PiAodmlydF90b194ZW5fbFsxMjNdZSgpIGxhdGVy
IGluIHRoZSBwYXRjaCBzZXJpZXMgaXMgYW4gZXhhbXBsZSkuIEkgc2VlCj4+PiB0aGUgbGFiZWxz
IG1vcmUgb3IgbGVzcyBhcyBvcnRob2dvbmFsIHRvIG1vZHVsYXJpc2luZyBpbnRvIGhlbHBlcgo+
Pj4gZnVuY3Rpb25zLgo+Pgo+PiBJIHRoaW5rIGRpZmZlcmVudGx5OiBUaGUgZmFjdCB0aGF0IGxh
YmVscyBhcmUgbmVlZGVkIGlzIGJlY2F1c2Ugb2YKPj4gdGhlIGNvbXBsZXhpdHkgb2YgdGhlIGZ1
bmN0aW9ucy4gU2ltcGxlciBmdW5jdGlvbnMgd291bGQgYWxsb3cKPj4gZ290by1mcmVlIGhhbmRs
aW5nIG9mIHN1Y2ggZXJyb3IgY29uZGl0aW9ucyAoYnkgaW5zdGVhZCBiZWluZyBhYmxlCj4+IHRv
IHVzZSBjb250aW51ZSwgYnJlYWssIG9yIHJldHVybiB3aXRob3V0IG1ha2luZyB0aGUgY29kZSBs
ZXNzCj4+IHJlYWRhYmxlLCBvZnRlbiBldmVuIGltcHJvdmluZyByZWFkYWJpbGl0eSkuCj4gCj4g
QW5kIHdoYXQgaXMgd3Jvbmcgd2l0aCB1c2luZyBnb3RvLXM/IEl0IGlzIGEgKnZlcnkqIGNvbW1v
biBzdHlsZSBvZgo+IGVycm9yIGhhbmRsaW5nIHVzZSB3aWRlbHkgaW4gZS5nLiB0aGUgbGludXgg
a2VybmVsLiBJTU8gaXQgb2Z0ZW4KPiBtYWtlcyBlcnJvciBwYXRocyBtdWNoIG1vcmUgb2J2aW91
cyBhbmQgZWFzaWVyIHRvIHJlYXNvbiBhYm91dC4gSW4KPiBmYWN0IEkgdmVyeSBtdWNoIGRpc2xp
a2UgcmV0dXJucyBmcm9tIHRoZSBtaWRkbGUgb2YgZnVuY3Rpb25zIGFzCj4gdGhleSBjYW4gZWFz
aWx5IGxlYWQgdG8gYXZvaWRhbmNlIG9mIG5lY2Vzc2FyeSBlcnJvciBjbGVhbnVwLgoKV2hlcmVh
cyBJIHBlcnNvbmFsbHkgZGlzbGlrZSBnb3RvLXMgKGFuZCBJJ3ZlIGJlZW4gdGF1Z2h0IHNvIHdo
ZW4KZmlyc3QgbGVhcm5pbmcgcHJvZ3JhbW1pbmcgbGFuZ3VhZ2VzKS4gSW4gcHJpdmF0ZSBjb2Rl
IEkgYXZvaWQgdGhlbQpieSBhbGwgbWVhbnMuIEluIHByb2plY3RzIEknbSB0aGUgbWFpbnRhaW5l
ciBmb3IgSSBhY2NlcHQgdGhlbSB3aGVuCnRoZSBhbHRlcm5hdGl2ZSBpcyBub3RpY2VhYmx5IG1v
cmUgdWdseS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
