Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B1116E2D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:52:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJQ8-00047M-8E; Mon, 09 Dec 2019 13:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieJQ5-00047H-T4
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:49:49 +0000
X-Inumbo-ID: c3eda0cc-1a8a-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3eda0cc-1a8a-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 13:49:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D95EBAC3C;
 Mon,  9 Dec 2019 13:49:47 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191209112954.124169-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <194245a0-fd02-25d6-289e-251c12b7532a@suse.com>
Date: Mon, 9 Dec 2019 14:50:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209112954.124169-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] CODING_STYLE: Document how to handle
 unexpected conditions
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxMjoyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAtLS0gYS9DT0RJTkdf
U1RZTEUKPiArKysgYi9DT0RJTkdfU1RZTEUKPiBAQCAtMTMzLDMgKzEzMyw5NyBAQCB0aGUgZW5k
IG9mIGZpbGVzLiAgSXQgc2hvdWxkIGJlOgo+ICAgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKPiAg
ICogRW5kOgo+ICAgKi8KPiArCj4gK0hhbmRsaW5nIHVuZXhwZWN0ZWQgY29uZGl0aW9ucwo+ICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK0dVSURFTElORVM6Cj4gKwo+ICtQ
YXNzaW5nIGVycm9ycyB1cCB0aGUgc3RhY2sgc2hvdWxkIGJlIHVzZWQgd2hlbiB0aGUgY2FsbGVy
IGlzIGFscmVhZHkKPiArZXhwZWN0aW5nIHRvIGhhbmRsZSBlcnJvcnMsIGFuZCB0aGUgc3RhdGUg
d2hlbiB0aGUgZXJyb3Igd2FzCj4gK2Rpc2NvdmVyZWQgaXNu4oCZdCBicm9rZW4sIG9yIGlzbid0
IHRvbyBoYXJkIHRvIGZpeC4KPiArCj4gK2RvbWFpbl9jcmFzaCgpIHNob3VsZCBiZSB1c2VkIHdo
ZW4gcGFzc2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIGlzIHRvbwo+ICtkaWZmaWN1bHQsIGFuZC9v
ciB3aGVuIGZpeGluZyB1cCBzdGF0ZSBvZiBhIGd1ZXN0IGlzIGltcHJhY3RpY2FsLCBidXQKPiAr
d2hlcmUgZml4aW5nIHVwIHRoZSBzdGF0ZSBvZiBYZW4gd2lsbCBhbGxvdyBYZW4gdG8gY29udGlu
dWUgcnVubmluZy4KPiArVGhpcyBpcyBwYXJ0aWN1bGFybHkgYXBwcm9wcmlhdGUgd2hlbiB0aGUg
Z3Vlc3QgaXMgZXhoaWJpdGluZyBiZWhhdmlvcgo+ICt3ZWxsLWJlaGF2ZWQgZ3Vlc3Qgc2hvdWxk
LgoKRFlNICJzaG91bGRuJ3QiPwoKPiArQlVHX09OKCkgc2hvdWxkIGJlIHVzZWQgd2hlbiB5b3Ug
Y2Fu4oCZdCBwYXNzIGVycm9ycyB1cCB0aGUgc3RhY2ssIGFuZAo+ICtlaXRoZXIgY29udGludWlu
ZyBvciBjcmFzaGluZyB0aGUgZ3Vlc3Qgd291bGQgbGlrZWx5IGNhdXNlIGFuCj4gK2luZm9ybWF0
aW9uIGxlYWsgb3IgcHJpdmlsZWdlIGVzY2FsYXRpb24gdnVsbmVyYWJpbGl0eS4KPiArCj4gK0FT
U0VSVCgpIElTIE5PVCBBTiBFUlJPUiBIQU5ETElORyBNRUNIQU5JU00uICBBU1NFUlQgaXMgYSB3
YXkgdG8gbW92ZQo+ICtkZXRlY3Rpb24gb2YgYSBidWcgZWFybGllciBpbiB0aGUgcHJvZ3JhbW1p
bmcgY3ljbGU7IGl0IGlzIGEKPiArbW9yZS1ub3RpY2VhYmxlIHByaW50ay4gIEl0IHNob3VsZCBv
bmx5IGJlIGFkZGVkIGFmdGVyIG9uZSBvZiB0aGUKPiArb3RoZXIgdGhyZWUgZXJyb3ItaGFuZGxp
bmcgbWVjaGFuaXNtcyBoYXMgYmVlbiBldmFsdWF0ZWQgZm9yCj4gK3JlbGlhYmlsaXR5IGFuZCBz
ZWN1cml0eS4KPiArCj4gK1JBVElPTkFMRToKPiArCj4gK0l0J3MgZnJlcXVlbnRseSB0aGUgY2Fz
ZSB0aGF0IGNvZGUgaXMgd3JpdHRlbiB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQKPiArY2VydGFp
biBjb25kaXRpb25zIGNhbiBuZXZlciBoYXBwZW4uICBUaGVyZSBhcmUgc2V2ZXJhbCBwb3NzaWJs
ZQo+ICthY3Rpb25zIHByb2dyYW1tZXJzIGNhbiB0YWtlIGluIHRoZXNlIHNpdHVhdGlvbnM6Cj4g
Kwo+ICsqIFByb2dyYW1tZXJzIGNhbiBzaW1wbHkgbm90IGhhbmRsZSB0aG9zZSBjYXNlcyBpbiBh
bnkgd2F5LCBvdGhlciB0aGFuCj4gK3BlcmhhcHMgdG8gd3JpdGUgYSBjb21tZW50IGRvY3VtZW50
aW5nIHdoYXQgdGhlIGFzc3VtcHRpb24gaXMuCj4gKwo+ICsqIFByb2dyYW1tZXJzIGNhbiB0cnkg
dG8gaGFuZGxlIHRoZSBjYXNlIGdyYWNlZnVsbHkgLS0gZml4aW5nIHVwCj4gK2luLXByb2dyZXNz
IHN0YXRlIGFuZCByZXR1cm5pbmcgYW4gZXJyb3IgdG8gdGhlIHVzZXIuCj4gKwo+ICsqIFByb2dy
YW1tZXJzIGNhbiBjcmFzaCB0aGUgZ3Vlc3QuCj4gKwo+ICsqIFByb2dyYW1tZXJzIGNhbiB1c2Ug
QVNTRVJUKCksIHdoaWNoIHdpbGwgY2F1c2UgdGhlIGNoZWNrIHRvIGJlCj4gK2V4ZWN1dGVkIGlu
IERFQlVHIGJ1aWxkcywgYW5kIGNhdXNlIHRoZSBoeXBlcnZpc29yIHRvIGNyYXNoIGlmIGl0J3MK
PiArdmlvbGF0ZWQKPiArCj4gKyogUHJvZ3JhbW1lcnMgY2FuIHVzZSBCVUdfT04oKSwgd2hpY2gg
d2lsbCBjYXVzZSB0aGUgY2hlY2sgdG8gYmUKPiArZXhlY3V0ZWQgaW4gYm90aCBERUJVRyBhbmQg
bm9uLURFQlVHIGJ1aWxkcywgYW5kIGNhdXNlIHRoZSBoeXBlcnZpc29yCj4gK3RvIGNyYXNoIGlm
IGl0J3MgdmlvbGF0ZWQuCj4gKwo+ICtJbiBzZWxlY3Rpbmcgd2hpY2ggcmVzcG9uc2UgdG8gdXNl
LCB3ZSB3YW50IHRvIGFjaGlldmUgc2V2ZXJhbCBnb2FsczoKPiArCj4gKy0gVG8gbWluaW1pemUg
cmlzayBvZiBpbnRyb2R1Y2luZyBzZWN1cml0eSB2dWxuZXJhYmlsaXRpZXMsCj4gKyAgcGFydGlj
dWxhcmx5IGFzIHRoZSBjb2RlIGV2b2x2ZXMgb3ZlciB0aW1lCj4gKwo+ICstIFRvIGVmZmljaWVu
dGx5IHNwZW5kIHByb2dyYW1tZXIgdGltZQo+ICsKPiArLSBUbyBkZXRlY3QgdmlvbGF0aW9ucyBv
ZiBhc3N1bXB0aW9ucyBhcyBlYXJseSBhcyBwb3NzaWJsZQo+ICsKPiArLSBUbyBtaW5pbWl6ZSB0
aGUgaW1wYWN0IG9mIGJ1Z3Mgb24gcHJvZHVjdGlvbiB1c2UgY2FzZXMKPiArCj4gK1RoZSBndWlk
ZWxpbmVzIGFib3ZlIGF0dGVtcHQgdG8gYmFsYW5jZSB0aGVzZToKPiArCj4gKy0gV2hlbiB0aGUg
Y2FsbGVyIGlzIGV4cGVjdGluZyB0byBoYW5kbGUgZXJyb3JzLCBhbmQgdGhlcmUgaXMgbm8KPiAr
YnJva2VuIHN0YXRlIGF0IHRoZSB0aW1lIHRoZSB1bmV4cGVjdGVkIGNvbmRpdGlvbiBpcyBkaXNj
b3ZlcmVkLCBvcgo+ICt3aGVuIGZpeGluZyB0aGUgc3RhdGUgaXMgc3RyYWlnaHRmb3J3YXJkLCB0
aGVuIGZpeGluZyB1cCB0aGUgc3RhdGUgYW5kCj4gK3JldHVybmluZyBhbiBlcnJvciBpcyB0aGUg
bW9zdCByb2J1c3QgdGhpbmcgdG8gZG8uICBIb3dldmVyLCBpZiB0aGUKPiArY2FsbGVyIGlzbid0
IGV4cGVjdGluZyB0byBoYW5kbGUgZXJyb3JzLCBvciBpZiB0aGUgc3RhdGUgaXMgZGlmZmljdWx0
Cj4gK3RvIGZpeCwgdGhlbiByZXR1cm5pbmcgYW4gZXJyb3IgbWF5IHJlcXVpcmUgZXh0ZW5zaXZl
IHJlZmFjdG9yaW5nLAo+ICt3aGljaCBpcyBub3QgYSBnb29kIHVzZSBvZiBwcm9ncmFtbWVyIHRp
bWUgd2hlbiB0aGV5J3JlIGNlcnRhaW4gdGhhdAo+ICt0aGlzIGNvbmRpdGlvbiBjYW5ub3Qgb2Nj
dXIuCj4gKwo+ICstIEJVR19PTigpIHdpbGwgc3RvcCBhbGwgaHlwZXJ2aXNvciBhY3Rpb24gaW1t
ZWRpYXRlbHkuICBJbiBzaXR1YXRpb25zCj4gK3doZXJlIGNvbnRpbnVpbmcgbWlnaHQgYWxsb3cg
YW4gYXR0YWNrZXIgdG8gZXNjYWxhdGUgcHJpdmlsZWdlLCBhCj4gK0JVR19PTigpIGNhbiBjaGFu
Z2UgYSBwcml2aWxlZ2UgZXNjYWxhdGlvbiBvciBpbmZvcm1hdGlvbiBsZWFrIGludG8gYQo+ICtk
ZW5pYWwtb2Ytc2VydmljZSAoYW4gaW1wcm92ZW1lbnQpLiAgQnV0IGluIHNpdHVhdGlvbnMgd2hl
cmUKPiArY29udGludWluZyAoc2F5LCByZXR1cm5pbmcgYW4gZXJyb3IpIG1pZ2h0IGJlIHNhZmUs
IHRoZW4gQlVHX09OKCkgY2FuCj4gK2NoYW5nZSBhIGJlbmlnbiBmYWlsdXJlIGludG8gZGVuaWFs
LW9mLXNlcnZpY2UgKGEgZGVncmFkYXRpb24pLgo+ICsKPiArLSBkb21haW5fY3Jhc2goKSBpcyBz
aW1pbGFyIHRvIEJVR19PTigpLCBidXQgd2l0aCBhIG1vcmUgbGltaXRlZAo+ICtlZmZlY3Q6IGl0
IHN0b3BzIHRoYXQgZG9tYWluIGltbWVkaWF0ZWx5LiAgSW4gc2l0dWF0aW9ucyB3aGVyZQo+ICtj
b250aW51aW5nIG1pZ2h0IGNhdXNlIGd1ZXN0IG9yIGh5cGVydmlzb3IgY29ycnVwdGlvbiwgYnV0
IGRlc3Ryb3lpbmcKPiArdGhlIGd1ZXN0IGFsbG93cyB0aGUgaHlwZXJ2aXNvciB0byBjb250aW51
ZSwgdGhpcyBjYW4gY2hhbmdlIGEgbW9yZQo+ICtzZXJpb3VzIGJ1ZyBpbnRvIGEgZ3Vlc3QgZGVu
aWFsLW9mLXNlcnZpY2UuICBCdXQgaW4gc2l0dWF0aW9ucyB3aGVyZQo+ICtyZXR1cm5pbmcgYW4g
ZXJyb3IgbWlnaHQgYmUgc2FmZSwgdGhlbiBkb21haW5fY3Jhc2goKSBjYW4gY2hhbmdlIGEKPiAr
YmVuaWduIGZhaWx1cmUgaW50byBhIGd1ZXN0IGRlbmlhbC1vZi1zZXJ2aWNlLgoKUGVyaGFwcyBm
dXJ0aGVyIHB1dCBlbXBoYXNpcyBvbiB0aGUgY2FsbCB0cmVlIHN0aWxsIGdldHRpbmcgdW53b3Vu
ZApub3JtYWxseSwgd2hpY2ggbWF5IGltcGx5IGZ1cnRoZXIgYWN0aW9ucyBvbiB0aGUgKG5vdyBk
eWluZykgZG9tYWluCnRha2VuLiBVbmZvcnR1bmF0ZWx5IGl0J3Mgbm90IHVudXN1YWwgZm9yIHBl
b3BsZSB0byBmb3JnZXQgdGhpczsgSQp0aGluayB0aGUgSU9NTVUgY29kZSBpbiBwYXJ0aWN1bGFy
IHdhcyAoaG9wZWZ1bGx5IGlzbid0IHNvIG11Y2gKYW55bW9yZSkgYSAiZ29vZCIgZXhhbXBsZSBv
ZiB0aGlzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
