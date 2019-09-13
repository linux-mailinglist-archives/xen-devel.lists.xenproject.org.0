Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F71B1B82
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ihg-0006YP-Cq; Fri, 13 Sep 2019 10:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8ihe-0006Y9-5B
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:21:22 +0000
X-Inumbo-ID: 3aaee186-d610-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aaee186-d610-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 10:21:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFC39AEAE;
 Fri, 13 Sep 2019 10:21:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190912132813.6509-1-jgross@suse.com>
 <20190912132813.6509-6-jgross@suse.com>
 <786f5fc8-7907-fbb9-44ef-b4619cb8e960@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <60420ae2-90ed-8f41-031b-9ae4ea194509@suse.com>
Date: Fri, 13 Sep 2019 12:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <786f5fc8-7907-fbb9-44ef-b4619cb8e960@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 5/5] xen: add function name to lock
 profiling data
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMTkgMTE6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTU6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYwo+
PiArKysgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKPj4gQEAgLTM0OCw2ICszNDgsNyBAQCBzdGF0
aWMgc190aW1lX3QgbG9ja19wcm9maWxlX3N0YXJ0Owo+PiAgIHN0YXRpYyBzdHJ1Y3QgbG9ja19w
cm9maWxlX2FuYyAqbG9ja19wcm9maWxlX2FuY3M7Cj4+ICAgc3RhdGljIHN0cnVjdCBsb2NrX3By
b2ZpbGVfcWhlYWQgbG9ja19wcm9maWxlX2dsYl9xOwo+PiAgIHN0YXRpYyBzcGlubG9ja190IGxv
Y2tfcHJvZmlsZV9sb2NrID0gU1BJTl9MT0NLX1VOTE9DS0VEOwo+PiArc3RhdGljIGNvbnN0IGNo
YXIgKmxvY2tfcHJvZmlsZV9ub2Z1bmMgPSBfX1BSRVRUWV9GVU5DVElPTl9fOwo+IAo+IGNvbnN0
IGFsc28gZm9yIHRoZSB2YXJpYWJsZSBpdHNlbGY/Cj4gCj4+IEBAIC0zNzEsOCArMzcyLDEwIEBA
IHN0YXRpYyB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRfZWxlbShzdHJ1Y3QgbG9ja19wcm9m
aWxlICpkYXRhLAo+PiAgICAgICBwcmludGsoIiVzICIsIHR5cGUpOwo+PiAgICAgICBpZiAoIGlk
eCAhPSBMT0NLUFJPRl9JRFhfTk9ORSApCj4+ICAgICAgICAgICBwcmludGsoIiVkICIsIGlkeCk7
Cj4+IC0gICAgcHJpbnRrKCIlczogYWRkcj0lcCwgbG9ja3ZhbD0lMDh4LCAiLCBkYXRhLT5uYW1l
LCBsb2NrLAo+PiAtICAgICAgICAgICBsb2NrLT50aWNrZXRzLmhlYWRfdGFpbCk7Cj4+ICsgICAg
cHJpbnRrKCIlcyIsIGRhdGEtPm5hbWUpOwo+PiArICAgIGlmICggZGF0YS0+ZnVuYyAmJiBzdHJj
bXAoZGF0YS0+ZnVuYywgbG9ja19wcm9maWxlX25vZnVuYykgKQo+PiArICAgICAgICBwcmludGso
IkAlcyIsIGRhdGEtPmZ1bmMpOwo+PiArICAgIHByaW50aygiOiBhZGRyPSVwLCBsb2NrdmFsPSUw
OHgsICIsIGxvY2ssIGxvY2stPnRpY2tldHMuaGVhZF90YWlsKTsKPiAKPiBBcyBsb25nIGFzIHRo
aXMgaXMgdXNlZCBmcm9tIGEga2V5IGhhbmRsZXIgb25seSwgSSBndWVzcyB0aGUKPiBzcGxpdHRp
bmcgb2YgdGhlIHByaW50aygpcyBpc24ndCBtdWNoIG9mIGEgcHJvYmxlbS4KPiAKPj4gQEAgLTQy
Nyw3ICs0MzAsMTQgQEAgc3RhdGljIHZvaWQgc3BpbmxvY2tfcHJvZmlsZV91Y29weV9lbGVtKHN0
cnVjdCBsb2NrX3Byb2ZpbGUgKmRhdGEsCj4+ICAgCj4+ICAgICAgIGlmICggcC0+cGMtPm5yX2Vs
ZW0gPCBwLT5wYy0+bWF4X2VsZW0gKQo+PiAgICAgICB7Cj4+IC0gICAgICAgIHNhZmVfc3RyY3B5
KGVsZW0ubmFtZSwgZGF0YS0+bmFtZSk7Cj4+ICsgICAgICAgIGlmICggZGF0YS0+ZnVuYyAmJiBz
dHJjbXAoZGF0YS0+ZnVuYywgbG9ja19wcm9maWxlX25vZnVuYykgKQo+PiArICAgICAgICB7Cj4+
ICsgICAgICAgICAgICBzbnByaW50ZihlbGVtLm5hbWUsIHNpemVvZihlbGVtLm5hbWUpLCAiJXNA
JXMiLCBkYXRhLT5uYW1lLAo+PiArICAgICAgICAgICAgICAgICAgICAgZGF0YS0+ZnVuYyk7Cj4+
ICsgICAgICAgICAgICBlbGVtLm5hbWVbc2l6ZW9mKGVsZW0ubmFtZSkgLSAxXSA9IDA7Cj4gCj4g
VGhpcyBpc24ndCBuZWVkZWQgYWZ0ZXIgc25wcmludGYoKSwgaXMgaXQ/Cj4gCj4gV2l0aCB0aGUg
dHdvIHN1Z2dlc3RlZCBhZGp1c3RtZW50cyAocHJvdmlkZWQgeW91IGFncmVlLCBhbmQKPiB3aGlj
aCBjb3VsZCBwcm9iYWJseSBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcpCj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClllcywgSSBhZ3JlZSwgdGhhbmtzCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
