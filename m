Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95E605DA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 14:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjNDe-0006sA-FJ; Fri, 05 Jul 2019 12:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjNDc-0006s5-PK
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 12:21:36 +0000
X-Inumbo-ID: 6dfa2410-9f1f-11e9-8826-d3a87ae2344e
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dfa2410-9f1f-11e9-8826-d3a87ae2344e;
 Fri, 05 Jul 2019 12:21:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1287D308216C;
 Fri,  5 Jul 2019 12:21:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 352C18479E;
 Fri,  5 Jul 2019 12:21:14 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190704144233.27968-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <aafe1ed8-74e3-02b7-0156-5ff1b5589869@redhat.com>
Date: Fri, 5 Jul 2019 14:21:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 05 Jul 2019 12:21:24 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v3 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDA3LzA0LzE5IDE2OjQxLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBQ
YXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJp
dHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5wbGF0Zm9ybS14
ZW4tcHZoLXYzCj4gCj4gSGksCj4gCj4gSSd2ZSBzdGFydGVkIHRvIGNyZWF0ZSBhIFhlbiBzcGVj
aWZpYyBwbGF0Zm9ybSwgaW4gT3ZtZlBrZy9YZW5Pdm1mLmRzYwo+IHdpdGggdGhlIGdvYWwgdG8g
bWFrZSBpdCB3b3JrIG9uIGJvdGggWGVuIEhWTSBhbmQgWGVuIFBWSC4KPiAKPiBUaGUgZmlyc3Qg
ZmV3IHBhdGNoZXMgb25seSBjcmVhdGUgdGhlIHBsYXRmb3JtIGFuZCBkdXBsaWNhdGUgc29tZSBj
b2RlIGZyb20KPiBPdm1mUGtnIGFuZCB0aGUgbGF0ZXIgcGF0Y2hlcyBtYWtlcyBPVk1GIGJvb3Qg
aW4gYSBYZW4gUFZIIGd1ZXN0IGFuZCBjYW4gYm9vdAo+IGEgTGludXggZ3Vlc3QuCj4gCj4gQWZ0
ZXIgdGhpcyBwYXRjaCBzZXJpZXMsIEknZCBsaWtlIHRvIHdhaXQgYSBiaXQgYmVmb3JlIHJlbW92
aW5nIFhlbiBzdXBwb3J0Cj4gZnJvbSB0aGUgT3ZtZlBrZyouZHNjLCB0byBhbGxvdyB0aW1lIHRv
IHN3aXRjaCB0byB0aGUgbmV3IFhlbiBvbmx5IHBsYXRmb3JtLAo+IG1heWJlIDEgeWVhci4KPiAK
PiBUbyBidWlsZCBhbmQgYm9vdDoKPiAKPiBUbyBidWlsZCwgc2ltcGx5IHJ1biBPdm1mUGtnL2J1
aWxkLnNoIC1wIE92bWZQa2cvT3ZtZlhlbi5kc2MKPiBUaGVuIHVzZSBPVk1GLmZkIGFzIGEga2Vy
bmVsIG9mIGEgcHZoIGd1ZXN0IGNvbmZpZyBmaWxlICh3aXRoIHhsL2xpYnhsKS4KPiAKPiBQYXRj
aCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJpdHMu
eGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5wbGF0Zm9ybS14ZW4t
cHZoLXYzCgpUaGUgcGF0Y2hlcyBvbiB0aGUgbGlzdCBhcmUgbWFsZm9ybWVkLiBUaGV5IGhhdmUK
CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IHF1b3RlZC1wcmludGFibGUKCndoaWNoIGlzIGZp
bmUsIGluIGl0c2VsZjsgaG93ZXZlciwgdGhleSBoYXZlIENSLUNSLUxGIGxpbmUgdGVybWluYXRv
cnMuCgpGb3IgZXhhbXBsZSwgZnJvbSB0aGUgZmlyc3QgcGF0Y2g6CgpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZiBiL092bWZQa2cv
TD0KaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZgppbmRleCA3YzQ0Zjk5
YTVjLi4yZjI0ZGFjODdmIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0ZW1M
aWIvUmVzZXRTeXN0ZW1MaWIuaW5mCisrKyBiL092bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxp
Yi9SZXNldFN5c3RlbUxpYi5pbmYKQEAgLTMwLDQgKzMwLDUgQEAgW1BhY2thZ2VzXQogW0xpYnJh
cnlDbGFzc2VzXT0wRD0wRAogICBEZWJ1Z0xpYj0wRD0wRAogICBJb0xpYj0wRD0wRAorICBQY2lM
aWI9MEQ9MEQKICAgVGltZXJMaWI9MEQ9MEQKCk5vdGUgIj0wRD0wRCIuCgpZb3VyIG90aGVyIChy
ZWNlbnQpIHBhdGNoZXMsCgotIFtlZGsyLWRldmVsXSBbUEFUQ0ggdjJdCiAgT3ZtZlBrZy9YZW5C
dXNEeGU6IENsb3NlIFhlbklvUHJvdG9jb2wgb3Blbm5lZCBieSBjaGlsZHJlbgoKLSBbZWRrMi1k
ZXZlbF0gW1BBVENIXQogIE92bWZQa2cvWGVuQnVzRHhlOiBEb24ndCBjYWxsIERpc2Nvbm5lY3RD
b250cm9sbGVyIGluIFN0b3AoKQoKaGFkIHRoZSBzYW1lIHByb2JsZW07IEkgaGFkIHRvIHVzZSAi
LS1pZ25vcmUtd2hpdGVzcGFjZSIgd2l0aCBnaXQtYW0sIHRvCmFwcGx5IHRoZW0uCgpOb3csIGlm
IEkgdHJ5IHRvIGFwcGx5IHRoaXMgZnVsbCBzZXQgd2l0aCBnaXQtYW0gbGlrZSB0aGF0LCB0aGUg
Zmlyc3QKcGF0Y2ggaW4gdGhlIHNlcmllcyBhcHBsaWVzLCBidXQgdGhlIHNlY29uZCBzdGlsbCBm
YWlsczoKCj4gZXJyb3I6IGNvcnJ1cHQgcGF0Y2ggYXQgbGluZSAyMwo+IFBhdGNoIGZhaWxlZCBh
dCAwMDAyIE92bWZQa2c6IENyZWF0ZSBwbGF0Zm9ybSBPdm1mWGVuCgpCYXNlZCBvbiB0aGUgZW1h
aWwgaGVhZGVycywgdGhlICJpcGhteC5jb20iIHJlZmVyZW5jZXMgc3VnZ2VzdCAodmlhIGEKZ29v
Z2xlIHNlYXJjaCkgIkNpc2NvJ3MgSXJvbnBvcnQgQ2xvdWQgZW1haWwgc2VydmljZSIuCgpJIHRo
aW5rIHRoYXQgZW1haWwgc2VydmljZSAoTVRBKSBpcyBicm9rZW4uCgpJIGRlY29kZWQgeW91ciBl
bWFpbHMgKGZyb20gcXVvdGVkLXByaW50YWJsZSB0byA4LWJpdCBwbGFpbnRleHQpLApyZW1vdmVk
IHRoZSAiQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZyIgbGluZXMsIGFuZCByZXBsYWNlZCAnXHJc
cicgd2l0aAonXHInLiBUaGlzIHdheSwgZ2l0LWFtIGNvbXBsZXRlZCAod2l0aCBzb21lICJuZXcg
YmxhbmsgbGluZSBhdCBFT0YiCndhcm5pbmdzKS4gQXBwbHlpbmcgdGhlICJwcm9jZXNzZWQiIHBh
dGNoZXMgb24gdG9wIG9mIGNvbW1pdAphN2M3ZDIxZmZhOWEsIHRoZSByZXN1bHRhbnQgdHJlZSBp
cyBpZGVudGljYWwgdG8geW91ciB0cmVlIGF0CiJici5wbGF0Zm9ybS14ZW4tcHZoLXYzIiBicmFu
Y2ggKGNvbW1pdCBlODc5NWQxODU4NzUpLiBJbiBhZGRpdGlvbiwgSSByYW4KCiQgZ2l0IHJhbmdl
LWRpZmYgYTdjN2QyMWZmYTlhIFwKICAgICAgeGVuX3B2aF9hbnRob255X3YzIFwKICAgICAgeGVu
X3B2aF9hbnRob255X3YzX2Zyb21fZW1haWwKCmFuZCB0aGUgb25seSBkaWZmZXJlbmNlcyByZXBv
cnRlZCBieSB0aGF0IGNvbW1hbmQgd2VyZSB0aGUgIk1lc3NhZ2UtSWQiCnRhZ3MgYXBwZW5kZWQg
dG8gdGhlIGNvbW1pdCBtZXNzYWdlcyBieSBteSAiZ2l0LWFtIiBpbnZvY2F0aW9uLiAoSSBoYXZl
CiJhbS5tZXNzYWdlaWQiIHNldCB0byB0byAidHJ1ZSIuKQoKSSBsaWtlIHRvIHBlcmZvcm0gdGhp
cyBzYW5pdHkgY2hlY2sgd2hlbiBhIHBhdGNoIHNlcmllcyBkb2Vzbid0IGFwcGx5CmFzLWlzICh3
aXRob3V0IGxvY2FsIHR3ZWFraW5nKSBmcm9tIHRoZSBsaXN0LCBidXQgdGhlcmUgaXMgYSByZW1v
dGUKdG9waWMgYnJhbmNoIHRvIGZldGNoIChpLmUuIHdoZW4gdGhlcmUgYXJlIHR3byB0aGluZ3Mg
SSBjYW4gY29tcGFyZSkuIFNvCmluIHRoaXMgY2FzZSwgdGhlIHNhbml0eSBjaGVjayBwYXNzZWQg
ZmluZTsgSSBjYW4gbm93IGxvb2sgYXQgdGhlCnBhdGNoZXMgdGhlbXNlbHZlcy4KCklmIHlvdSBj
b3VsZCB1c2UgYSBkaWZmZXJlbnQgTVRBIChvciBnZXQgdGhlIGN1cnJlbnQgb25lIGZpeGVkKSwg
dGhhdAp3b3VsZCBiZSBoZWxwZnVsLiAoWWVzLCB5ZXM6IGlmIHRoZSBlZGsyIHByb2plY3QgZGlk
bid0IHVzZSBDUkxGIGxpbmUKdGVybWluYXRvcnMsIHRoYXQgd291bGQgYmUgKmV2ZW4gbW9yZSog
aGVscGZ1bC4pCgpUaGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
