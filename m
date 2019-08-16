Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E28FFA9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:03:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZ2c-0004pe-Cz; Fri, 16 Aug 2019 10:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyZ2a-0004pZ-BH
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:01:00 +0000
X-Inumbo-ID: be4aadb4-c00c-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id be4aadb4-c00c-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 10:00:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2A328;
 Fri, 16 Aug 2019 03:00:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FC9D3F706;
 Fri, 16 Aug 2019 03:00:56 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <20190815172256.34363-1-lars.kurth@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
Date: Fri, 16 Aug 2019 11:00:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815172256.34363-1-lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gMTUvMDgvMjAxOSAxODoyMiwg
TGFycyBLdXJ0aCB3cm90ZToKPiBVc2UtY2FzZTogQWxsb3cgdXNpbmcgYm90aCBzY3JpcHRzIG9u
IHhlbiByZXBvc2l0b3JpZXMgc3VjaCBhcwo+IG1pbmktb3MuZ2l0LCBvc3N0ZXN0LmdpdCwKPiAK
PiBUb29sIGNoYW5nZXM6Cj4gKiBhZGRfbWFpbnRhaW5lcnMucGw6ICRnZXRfbWFpbnRhaW5lciBp
bmhlcml0cyBwYXRoIGZyb20gJDAKPiAqIGdldF9tYWludGFpbmVyLnBsOiB3YXJuIChpbnN0ZWFk
IGZvIGRpZSkgd2hlbiBjYWxsZWQKPiAgICBmcm9tIGEgZGlmZmVyZW50IHRyZWUKPiAKPiBBc3N1
bXB0aW9uczogdGhlIHJlcG9zaXRvcnkgY29udGFpbnMgYSBNQUlOVEFJTkVSUyBmaWxlIHRoYXQK
PiBmb2xsb3dzIHRoZSBzYW1lIGNvbnZlbnRpb25zIGFzIHRoZSBmaWxlIGluIHhlbi5naXQKPiAK
PiBBIHN1Z2dlc3RlZCB0ZW1wbGF0ZQo+IAo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gVGhpcyBmaWxlIGZvbGxvd3MgdGhlIHNhbWUg
Y29udmVudGlvbnMgYXMgb3V0bGluZWQgaW4KPiB4ZW4uZ2l0Ok1BSU5UQUlORVJTLiBQbGVhc2Ug
cmVmZXIgdG8gdGhlIGZpbGUgaW4geGVuLmdpdAo+IGZvciBtb3JlIGluZm9ybWF0aW9uLgo+IAo+
IFRIRSBSRVNUCj4gTToJTUFJTlRBSU5FUjEgPG1haW50YWluZXIxQGVtYWlsLmNvbT4KPiBNOiAg
ICAgIE1BSU5UQUlORVIyIDxtYWludGFpbmVyMkBlbWFpbC5jb20+Cj4gTDoJeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4gUzoJU3VwcG9ydGVkCj4gRjoJKi8KPiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KPiAtLS0KPiAgIHNjcmlw
dHMvYWRkX21haW50YWluZXJzLnBsIHwgIDQgKystLQo+ICAgc2NyaXB0cy9nZXRfbWFpbnRhaW5l
ci5wbCAgfCAxMyArKysrKysrKysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvYWRkX21haW50
YWluZXJzLnBsIGIvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwKPiBpbmRleCAwOWU5ZjY2MDlm
Li41YTZkMGY2MzFiIDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvYWRkX21haW50YWluZXJzLnBsCj4g
KysrIGIvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwKPiBAQCAtMjYsOSArMjYsOSBAQCBzdWIg
aW5zZXJ0ICgkJCQkKTsKPiAgIHN1YiBoYXN0YWcgKCQkKTsKPiAgIAo+ICAgIyBUb29sIFZhcmlh
Ymxlcwo+IC1teSAkZ2V0X21haW50YWluZXIgICAgICA9ICIuL3NjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGwiOwo+IC0KPiAgIG15ICR0b29sID0gJDA7Cj4gK215ICRnZXRfbWFpbnRhaW5lciA9ICR0
b29sOwo+ICskZ2V0X21haW50YWluZXIgPX4gcy9hZGRfbWFpbnRhaW5lcnMvZ2V0X21haW50YWlu
ZXIvOwo+ICAgbXkgJHVzYWdlID0gPDxFT1Q7Cj4gICBPUFRJT05TOgo+ICAgLS0tLS0tLS0KPiBk
aWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50
YWluZXIucGwKPiBpbmRleCAxNzRkZmI3ZTQwLi5mMWU5YzkwNGVlIDEwMDc1NQo+IC0tLSBhL3Nj
cmlwdHMvZ2V0X21haW50YWluZXIucGwKPiArKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBs
Cj4gQEAgLTI2Niw4ICsyNjYsMTcgQEAgaWYgKCRlbWFpbCAmJgo+ICAgfQo+ICAgCj4gICBpZiAo
IXRvcF9vZl90cmVlKCR4ZW5fcGF0aCkpIHsKPiAtICAgIGRpZSAiJFA6IFRoZSBjdXJyZW50IGRp
cmVjdG9yeSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgIgo+IC0JLiAiYSBYZW4gc291cmNlIHRyZWUu
XG4iOwo+ICsgICAgIyBEbyBub3QgZXhpdCwgYnV0IHByaW50IGFuIGVycm9yIG1lc3NhZ2UgdG8g
U1RERVJSIHRvIGFsbG93IGNhbGxpbmcKPiArICAgICMgdGhlIHRvb2wgZnJvbSB4ZW4tcmVsYXRl
ZCByZXBvcyBzdWNoIGFzIG1pbmktb3MuZ2l0LAo+ICsgICAgIyBsaXZlIHBhdGNoLWJ1aWxkLXRv
b2xzLmdpdCwgZXRjCj4gKyAgICBwcmludCBTVERFUlIgIiRQOlxuIi4KPiArICAgICAgICAgICI9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PVxuIi4K
PiArICAgICAgICAgICJXQVJOSU5HOiBUaGUgY3VycmVudCBkaXJlY3RvcnkgZG9lcyBub3QgYXBw
ZWFyIHRvIGJlIFxuIi4KPiArCSAgInRoZSB4ZW4uZ2l0IHNvdXJjZSB0cmVlLlxuXG4iLgo+ICsg
ICAgICAgICAgIlRoZSB0b29sIHdvcmtzIG91dHNpZGUgb2YgdGhlIHhlbi5naXQgdHJlZSwgaWYg
dGhlXG4iLgo+ICsgICAgICAgICAgIk1BSU5UQUlORVJTIGZpbGUgZm9sbG93cyB0aGUgc2FtZSBm
b3JtYXQgYXMgdGhhdCBvZlxuIi4KPiArICAgICAgICAgICJ4ZW4uZ2l0LiBVc2UgYXQgeW91ciBv
d24gcGVyaWwuXG4iLgo+ICsgICAgICAgICAgIj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09XG4iOwoKIEZyb20gbXkgdW5kZXJzdGFuZGluZywgYW55
IHVzZSBvbiBtaW5pLW9zLmdpdCAmIGNvIHdpbGwgYmUgbGVnaXRpbWF0ZS4gSG93ZXZlciwgCndl
IHN0aWxsIHByaW50IHRoZSBXQVJOSU5HIGluIHRob3NlIGNhc2VzLgoKVXN1YWxseSBXQVJOSU5H
IG1lYW5zIHNvbWV0aGluZyBuZWVkcyBhdHRlbnRpb24uIEFzIG1vc3Qgb2YgdGhlIHVzZXJzIHdp
bGwgCmxpa2VseSBjb3B5L3Bhc3RlIGZyb20gdGhlIHdpa2ksIHdlIGFyZSBnb2luZyB0byBoYXZl
IHJlcG9ydCBhc2tpbmcgd2h5IHRoZSAKV0FSTklORyBpcyB0aGVyZS4KCkkgdGhpbmsgaXQgd291
bGQgbWFrZSBzZW5zZSB0byB0cnkgdG8gZG93bmdyYWRlIHRoZSBtZXNzYWdlIGEgYml0IHdoZW4g
cG9zc2libGUuIApGb3IgaW5zdGFuY2UsIHdlIGNvdWxkIGNoZWNrIGlmIHRoZSBzZWN0aW9uICJU
SEUgUkVTVCIgaXMgcHJlc2VudCBpbiB0aGUgZmlsZSAKTUFJTlRBSU5FUlMuIElmIG5vdCwgdGhp
cyBpcyBsaWtlbHkgbm90IGEgZmlsZSB3ZSBhcmUgYWJsZSB0byBzdXBwb3J0LgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
