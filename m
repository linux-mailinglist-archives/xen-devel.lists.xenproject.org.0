Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A948885
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:15:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuFm-0004Fa-6m; Mon, 17 Jun 2019 16:13:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcuFl-0004FS-1c
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:13:05 +0000
X-Inumbo-ID: c8a0aa44-911a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8a0aa44-911a-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:13:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 10:13:02 -0600
Message-Id: <5D07BC090200007800238E78@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 10:12:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
 <5CA765920200007800224E5A@prv1-mh.provo.novell.com>
 <a13c7c87-99a3-80a3-fd95-e6b91de010a9@citrix.com>
In-Reply-To: <a13c7c87-99a3-80a3-fd95-e6b91de010a9@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/AMD: correct certain Fam17 checks
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
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>, Pu Wen <puwen@hygon.cn>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDE4OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDQvMjAxOSAxNToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IENvbW1pdCAz
MTU3YmI0ZTEzICgiQWRkIE1TUiBzdXBwb3J0IGZvciB2YXJpb3VzIGZlYXR1cmUgQU1EIHByb2Nl
c3Nvcgo+PiBmYW1pbGllcyIpIGNvbnZlcnRlZCBjZXJ0YWluIGNoZWNrcyBmb3IgRmFtMTEgdG8g
aW5jbHVkZSBmYW1pbGllcyBhbGwKPj4gdGhlIHdheSB1cCB0byBGYW0xNy4gVGhlIGNvbW1pdCBo
YXZpbmcgbm8gZGVzY3JpcHRpb24sIGl0IGlzIGhhcmQgdG8KPj4gdGVsbCB3aGV0aGVyIHRoaXMg
d2FzIGEgbWVjaGFuaWNhbCBkZWMtPmhleCBjb252ZXJzaW9uIG1pc3Rha2UsIG9yCj4+IGluZGVl
ZCBpbnRlbmRlZC4gSW4gYW55IGV2ZW50IHRoZSBOQl9DRkcgaGFuZGxpbmcgbmVlZHMgdG8gYmUg
cmVzdHJpY3RlZAo+PiB0byBGYW0xNiBhbmQgYmVsb3c6IEZhbTE3IGRvZXNuJ3QgcmVhbGx5IGhh
dmUgc3VjaCBhbiBNU1IgYW55bW9yZS4gQXMKPj4gcGVyIG9ic2VydmF0aW9uIGl0J3MgcmVhZC16
ZXJvIC8gd3JpdGUtZGlzY2FyZCBub3csIHNvIG1ha2UgUFYgdW5pZm9ybWx5Cj4+ICh3aXRoIHRo
ZSBleGNlcHRpb24gb2YgcGlubmVkIERvbTAgdkNQVS1zKSBiZWhhdmUgc28sIGp1c3QgbGlrZSBI
Vk0KPj4gYWxyZWFkeSBkb2VzLgo+Pgo+PiBNaXJyb3IgdGhlIE5CX0NGRyBiZWhhdmlvciB0byBN
U1JfRkFNMTBIX01NSU9fQ09ORl9CQVNFIGFzIHdlbGwsIGV4Y2VwdAo+PiB0aGF0IGhlcmUgdGhl
IHZlbmRvci9tb2RlbCBjaGVjayBpcyBrZXB0IGluIHBsYWNlIChmb3Igbm93IGF0IGxlYXN0KS4K
Pj4KPj4gQSBub24tTU1DRkcgZXh0ZW5kZWQgY29uZmlnIHNwYWNlIGFjY2VzcyBtZWNoYW5pc20g
c3RpbGwgYXBwZWFycyB0bwo+PiBleGlzdCwgYnV0IGNvZGUgdG8gZGVhbCB3aXRoIGl0IHdpbGwg
bmVlZCB0byBiZSB3cml0dGVuIGRvd24gdGhlIHJvYWQsCj4+IHdoZW4gaXQgY2FuIGFjdHVhbGx5
IGJlIHRlc3RlZC4KPj4KPj4gUmVwb3J0ZWQtYnk6IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+Cj4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+
IHYyOiBNYWtlIE5CX0NGRyByZWFkLXplcm8gLyB3cml0ZS1kaXNjYXJkIGZvciBQViBEb21VLCBq
dXN0IGxpa2UgSFZNIGhhcwo+PiAgICAgaXQgYWxyZWFkeS4gSSd2ZSBub3QgYXBwbGllZCAiSW4g
cHJpbmNpcGxlLCBBY2tlZC1ieTogQW5kcmV3IENvb3Blcgo+PiAgICAgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ii4KPiAKPiBJIHN1cHBvc2UgdGhpcyBpcyBzbGlnaHRseSBiZXR0ZXIgaW50
ZXJtZWRpYXRlIHN0ZXAuICBJIGd1ZXNzIEknbGwgaGF2ZQo+IHRvIGRvIHRoZSBwcm9wZXIgZml4
IG9mIHJlbW92aW5nIE1TUl9BTUQ2NF9OQl9DRkcgZnJvbSB0aGUgZ3Vlc3QKPiBlbXVsYXRpb24g
cGF0aHMsIHdoZXJlIGl0IGFic29sdXRlbHkgZG9lc24ndCBiZWxvbmcuCgpXZWxsLCBJJ2xsIGJl
IGN1cmlvdXMgdG8gc2VlIGhvdyB5b3Ugd2lsbCBtYW5hZ2UgdG8gZG8gdGhpcyB3aXRob3V0CmJy
ZWFraW5nIERvbTAtcyBhY3R1YWxseSBoaXR0aW5nIHRoaXMgcGF0aC4gT3IgZWxzZSBJIGd1ZXNz
IEkgd291bGQKaGF2ZSBkb25lIHNvIHJpZ2h0IGhlcmUuCgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzIQoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
