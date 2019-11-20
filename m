Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9C10412D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:44:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXT2B-0003eL-AV; Wed, 20 Nov 2019 16:40:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXT29-0003eG-Jv
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:40:49 +0000
X-Inumbo-ID: 815bc17e-0bb4-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 815bc17e-0bb4-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 16:40:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91497B20E6;
 Wed, 20 Nov 2019 16:40:47 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
Date: Wed, 20 Nov 2019 17:40:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMTkgMTc6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjExLjIwMTkgMTI6
MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUgLmZpbGUgYXNzZW1ibGVyIGRpcmVjdGl2ZXMg
Z2VuZXJhdGVkIGJ5IHRoZSBjb21waWxlciBkbyBub3QgaW5jbHVkZQo+PiBhbnkgcGF0aCBjb21w
b25lbnRzIChnY2MpIG9yIGp1c3QgdGhlIG9uZXMgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxp
bmUKPj4gKGNsYW5nLCBhdCBsZWFzdCB2ZXJzaW9uIDUpLCBhbmQgaGVuY2UgbXVsdGlwbGUgaWRl
bnRpY2FsbHkgbmFtZWQgc291cmNlCj4+IGZpbGVzIChpbiBkaWZmZXJlbnQgZGlyZWN0b3JpZXMp
IG1heSBwcm9kdWNlIGlkZW50aWNhbGx5IG5hbWVkIHN0YXRpYwo+PiBzeW1ib2xzIChpbiB0aGVp
ciBrYWxsc3ltcyByZXByZXNlbnRhdGlvbikuIFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0K
Pj4gdXNlZCBieSB4ZW4tbGl2ZXBhdGNoLCBob3dldmVyLCBkZXBlbmRzIG9uIGhhdmluZyB1bmlx
dWUgc3ltYm9scy4KPj4KPj4gTWFrZSB0aGUgRU5GT1JDRV9VTklRVUVfU1lNQk9MUyBLY29uZmln
IG9wdGlvbiBjb250cm9sIHRoZSAoYnVpbGQpCj4+IGJlaGF2aW9yLCBhbmQgaWYgZW5hYmxlZCB1
c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAocmVsYXRpdmUgdG8gdGhlCj4+IHhlbi8gc3ViZGly
ZWN0b3J5KSBwYXRoIHRvIHRoZSBjb21waWxlciBpbnZva2VkIFNUVF9GSUxFIHN5bWJvbHMuIE5v
dGUKPj4gdGhhdCB0aGlzIGJ1aWxkIG9wdGlvbiBpcyBtYWRlIG5vIGxvbmdlciBkZXBlbmQgb24g
TElWRVBBVENILCBidXQgbWVyZWx5Cj4+IGRlZmF1bHRzIHRvIGl0cyBzZXR0aW5nIG5vdy4KPj4K
Pj4gQ29uZGl0aW9uYWxpemUgZXhwbGljaXQgLmZpbGUgZGlyZWN0aXZlIGluc2VydGlvbiBpbiBD
IGZpbGVzIHdoZXJlIGl0Cj4+IGV4aXN0cyBqdXN0IHRvIGRpc2FtYmlndWF0ZSBuYW1lcyBpbiBh
IGxlc3MgZ2VuZXJpYyBtYW5uZXI7IG5vdGUgdGhhdAo+PiBhdCB0aGUgc2FtZSB0aW1lIHRoZSBy
ZWR1bmRhbnQgZW1pc3Npb24gb2YgU1RUX0ZJTEUgc3ltYm9scyBnZXRzCj4+IHN1cHByZXNzZWQg
Zm9yIGNsYW5nLiBBc3NlbWJsZXIgZmlsZXMgYXMgd2VsbCBhcyBtdWx0aXBseSBjb21waWxlZCBD
Cj4+IG9uZXMgdXNpbmcgX19PQkpFQ1RfRklMRV9fIGFyZSBsZWZ0IGFsb25lIGZvciB0aGUgdGlt
ZSBiZWluZy4KPj4KPj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0aGVyZSBub3QgdG8gYmUgYW55IGR1
cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+PiBmb3JjZSB0aGUgc2VsZWN0aW9uIG9mIHRo
ZSBvcHRpb24gdG8gJ24nIGFueW1vcmUgaW4gYWxscmFuZG9tLmNvbmZpZy4KPj4gU2ltaWxhcmx5
IENPVkVSQUdFIG5vIGxvbmdlciBzdXBwcmVzc2VzIGR1cGxpY2F0ZSBzeW1ib2wgd2FybmluZ3Mg
aWYKPj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0LCB3aGljaCBpbiB0dXJuIGFsbG93cwo+PiBT
VVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTIHRvIHNpbXBseSBkZXBlbmQgb24KPj4g
IUVORk9SQ0VfVU5JUVVFX1NZTUJPTFMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJJ3ZlIGdvdCBhY2tzIGZyb20gS29ucmFkIGFuZCBX
ZWksIGJ1dCBzdGlsbCBuZWVkIGFuIHg4NiBhbmQgYSByZWxlYXNlCj4gb25lIGhlcmUuIEFuZHJl
dz8gT3IgYWx0ZXJuYXRpdmVseSAtIErDvHJnZW4sIHdvdWxkIHlvdSByYXRoZXIgbm90IHNlZQo+
IHRoaXMgZ28gaW4gYW55bW9yZT8KCkluIGNhc2UgdGhlIG5lZWRlZCB4ODYgQWNrIGlzIGNvbWlu
ZyBpbiBiZWZvcmUgUkMzIEknbSBmaW5lIHRvIGdpdmUgbXkKUmVsZWFzZS1hY2ssIGJ1dCBJJ20g
aGVzaXRhbnQgdG8gdGFrZSBpdCBsYXRlci4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
