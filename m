Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C899005E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:58:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZtD-0001MQ-S9; Fri, 16 Aug 2019 10:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyZtC-0001ML-8U
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:55:22 +0000
X-Inumbo-ID: 567dcf88-c014-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 567dcf88-c014-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 10:55:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE2C360;
 Fri, 16 Aug 2019 03:55:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3E7A3F706;
 Fri, 16 Aug 2019 03:55:17 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
Date: Fri, 16 Aug 2019 11:55:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
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
Cc: Felipe Huici <felipe.huici@neclab.eu>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Florian Schmidt <florian.schmidt@neclab.eu>, Jan Beulich <jbeulich@suse.com>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE2LzA4LzIwMTkgMTE6NDIsIExhcnMgS3VydGggd3JvdGU6Cj4gVW5pa3Jh
ZnQgcmVwb3MgZm9sbG93IHRoZSBzYW1lIHN5bnRheCBhcyB4ZW4uZ2l0IHdpdGggdGhlCj4gZm9s
bG93aW5nIGV4Y2VwdGlvbnM6Cj4gKiBNQUlOVEFJTkVSUyBmaWxlcyBhcmUgY2FsbGVkIE1BSU5U
QUlORVJTLm1kCj4gKiBNOiAuLi4gZXRjIGJsb2NrcyBhcmUgcHJlY2VkZWQgYnkgd2hpdGVzcGFj
ZXMgZm9yIHJlbmRlcmluZyBhcwo+ICAgIG1hcmt1cCBmaWxlcwoKVGhlcmUgaXMgYW4gb3RoZXIg
ZGlmZmVyZW5jZS4gVGhlICJmYWxsYmFjayIgY2F0ZWdvcnkgaXMgIlVOSUtSQUZUIEdFTkVSQUwi
IGFuZCAKbm90ICJUSEUgUkVTVCIuCgo+IAo+IFRoaXMgY2hhbmdlIHdpbGwKPiAtIGxvYWQgTUFJ
TlRBSU5FUlMubWQgaWYgTUFJTlRBSU5FUlMgaXMgbm90IHByZXNlbnQKPiAtIGRlYWwgd2l0aCBp
bmRlbnRlZCBNOiAuLi4gYmxvY2tzCgpPbmUgcHJvY2VzcyBxdWVzdGlvbi4gRG9lcyBpdCBtZWFu
IFVuaWtyYWZ0IGZvbGtzIHdpbGwgaGF2ZSB0byBjaGVja291dCBYZW4gaW4gCm9yZGVyIHRvIHVz
ZSB7YWRkLCBnZXR9X21haW50YWluZXJzLnBsPyBJZiBzbywgd291bGQgaXQgbWFrZSBzZW5zZSB0
byBoYXZlIAphZGRfbWFpbnRhaW5lcnMucGwgYW5kIHNjcmlwdF9tYWludGFpbmVycy5wbCBpbiBh
IHNlcGFyYXRlIHJlcG8gdGhhdCBjYW4gYmUgCmFkZGVkIGFzIHN1Ym1vZHVsZT8KCj4gCj4gU2ln
bmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IC0tLQo+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAKPiBDQzogU2ltb24gS3Vl
bnplciA8c2ltb24ua3VlbnplckBuZWNsYWIuZXU+Cj4gQ0M6IEZsb3JpYW4gU2NobWlkdCA8Zmxv
cmlhbi5zY2htaWR0QG5lY2xhYi5ldT4KPiBDQzogRmVsaXBlIEh1aWNpIDxmZWxpcGUuaHVpY2lA
bmVjbGFiLmV1Pgo+IC0tLQo+ICAgc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDE0ICsrKysr
KysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3Njcmlw
dHMvZ2V0X21haW50YWluZXIucGwKPiBpbmRleCBmMWU5YzkwNGVlLi5iZGIwOWY4ZjY1IDEwMDc1
NQo+IC0tLSBhL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKPiArKysgYi9zY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsCj4gQEAgLTI4NCwxMiArMjg0LDE4IEBAIGlmICghdG9wX29mX3RyZWUoJHhl
bl9wYXRoKSkgewo+ICAgbXkgQHR5cGV2YWx1ZSA9ICgpOwo+ICAgbXkgJWtleXdvcmRfaGFzaDsK
PiAgIAo+IC1vcGVuIChteSAkbWFpbnQsICc8JywgIiR7eGVuX3BhdGh9TUFJTlRBSU5FUlMiKQo+
IC0gICAgb3IgZGllICIkUDogQ2FuJ3Qgb3BlbiBNQUlOVEFJTkVSUzogJCFcbiI7Cj4gK215ICRt
YWludDsKPiArbXkgJG1haW50YWluZXJzX2ZpbGUgPSAiTUFJTlRBSU5FUlMiOwo+ICtpZiAoISBv
cGVuICgkbWFpbnQsICc8JywgJHt4ZW5fcGF0aH0uJG1haW50YWluZXJzX2ZpbGUpKSB7Cj4gKyAg
ICAkbWFpbnRhaW5lcnNfZmlsZSA9ICJNQUlOVEFJTkVSUy5tZCI7Cj4gKyAgICBvcGVuICgkbWFp
bnQsICc8JywgJHt4ZW5fcGF0aH0uJG1haW50YWluZXJzX2ZpbGUpCj4gKyAgICAgICAgb3IgZGll
ICIkUDogQ2FuJ3Qgb3BlbiBNQUlOVEFJTkVSUyBvciBNQUlOVEFJTkVSUy5tZDogJCFcbiI7Cj4g
K30KPiArCj4gICB3aGlsZSAoPCRtYWludD4pIHsKPiAgICAgICBteSAkbGluZSA9ICRfOwo+ICAg
Cj4gLSAgICBpZiAoJGxpbmUgPX4gbS9eKFtBLVpdKTpccyooLiopLykgewo+ICsgICAgaWYgKCRs
aW5lID1+IG0vXlxzKihbQS1aXSk6XHMqKC4qKS8pIHsKCkFzIHlvdSBhbGxvdyBzcGFjZSBiZWZv
cmUgdGhlIGJsb2NrcyBNOiwgd291bGQgbm90IHRoaXMgY2F0Y2ggdGhlIGV4YW1wbGUgYXQgdGhl
IApiZWdpbm5pbmcgb2YgdGhlIGZpbGU/CgoJTTogTWFpbCBwYXRjaGVzIHRvOiBGdWxsTmFtZSA8
YWRkcmVzc0Bkb21haW4+CglSOiBEZXNpZ25hdGVkIHJldmlld2VyOiBGdWxsTmFtZSA8YWRkcmVz
c0Bkb21haW4+Cgo+ICAgCW15ICR0eXBlID0gJDE7Cj4gICAJbXkgJHZhbHVlID0gJDI7Cj4gICAK
PiBAQCAtNDIxLDcgKzQyNyw3IEBAIGZvcmVhY2ggbXkgJGZpbGUgKEBBUkdWKSB7Cj4gICAgICAg
fQo+ICAgICAgIGlmICgkZnJvbV9maWxlbmFtZSkgewo+ICAgCXB1c2goQGZpbGVzLCAkZmlsZSk7
Cj4gLQlpZiAoJGZpbGUgbmUgIk1BSU5UQUlORVJTIiAmJiAtZiAkZmlsZSAmJiAoJGtleXdvcmRz
IHx8ICRmaWxlX2VtYWlscykpIHsKPiArCWlmICgkZmlsZSBuZSAkbWFpbnRhaW5lcnNfZmlsZSAm
JiAtZiAkZmlsZSAmJiAoJGtleXdvcmRzIHx8ICRmaWxlX2VtYWlscykpIHsKPiAgIAkgICAgb3Bl
bihteSAkZiwgJzwnLCAkZmlsZSkKPiAgIAkJb3IgZGllICIkUDogQ2FuJ3Qgb3BlbiAkZmlsZTog
JCFcbiI7Cj4gICAJICAgIG15ICR0ZXh0ID0gZG8geyBsb2NhbCgkLykgOyA8JGY+IH07Cj4gCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
