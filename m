Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F67110F965
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic38R-0000R7-HP; Tue, 03 Dec 2019 08:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic38P-0000R2-NB
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 08:02:13 +0000
X-Inumbo-ID: 346383ff-15a3-11ea-81d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 346383ff-15a3-11ea-81d2-12813bfff9fa;
 Tue, 03 Dec 2019 08:02:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0ACBAAF83;
 Tue,  3 Dec 2019 08:02:10 +0000 (UTC)
To: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
Date: Tue, 3 Dec 2019 09:02:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191201174714.GA13968@gentoo-tp.home>
Content-Language: en-US
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTIuMjAxOSAxODo0NywgSmVyZW1pIFBpb3Ryb3dza2kgd3JvdGU6Cj4gT24gVGh1LCBP
Y3QgMjQsIDIwMTkgYXQgMTA6MTI6MTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDIzLjEwLjIwMTkgMjI6MzMsIFByeSBNYXIgd3JvdGU6Cj4+PiBIZWxsbyB4ZW4tZGV2ZWwsCj4+
Pgo+Pj4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L3BsYWluLzExMDkzNzQKPj4+Cj4+PiBzaG93
cyBteSB0cmFjZXMgZnJvbSBhIGhlYWx0aHkgQ2VudE9TIDgsIHhlbi00LjEyLjEgZG9tMCB3aGVu
IHRyeWluZwo+Pj4gdG8gbGF1bmNoIGEgcHYgaW5zdGFsbCBvZiB0aGUgbmV3bHkgcmVsZWFzZWQg
dWIxOTEwLiBUaGUgc291cmNlIGlzIGEKPj4+IGJsb2NrLWF0dGFjaGVkIElTTyBhbmQgdGhlIGtl
cm5lbC9yYW1kaXNrIHdhcyBjb3BpZWQgb2ZmIGxvY2FsbHkuCj4+Cj4+IFdvdWxkIHlvdSBwbGVh
c2UgaW5jcmVhc2UgdmVyYm9zaXR5ICh4bCAtdnZ2IGNyZWF0ZSAuLi4pIHN1Y2ggdGhhdCB3ZQo+
PiBjYW4gc2VlIHdoYXQgZXhhY3RseSB0aGUgZGVjb21wcmVzc2lvbiBjb2RlIGRvZXNuJ3QgbGlr
ZSBhYm91dCB0aGlzCj4+IGtlcm5lbCBpbWFnZT8KPiAKPiBJIHN0dW1ibGVkIGFjcm9zcyB0aGUg
c2FtZSBpc3N1ZSwgYmVsb3cgaXMgdGhlIHhsIC12dnZ2IGNyZWF0ZSBvdXRwdXQuCj4gCj4gUGFy
c2luZyBjb25maWcgZnJvbSB1YnVudHUuY2ZnCj4gbGlieGw6IGRlYnVnOiBsaWJ4bF9jcmVhdGUu
YzoxNjkzOmRvX2RvbWFpbl9jcmVhdGU6IERvbWFpbiAwOmFvIDB4NTVhNTk4ZTc3MTkwOiBjcmVh
dGU6IGhvdz0obmlsKSBjYWxsYmFjaz0obmlsKSBwb2xsZXI9MHg1NWE1OThlNzQwNDAKPiBsaWJ4
bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjM5NzpsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0X2JhY2tl
bmQ6IERpc2sgdmRldj14dmRhIHNwZWMuYmFja2VuZD11bmtub3duCj4gbGlieGw6IGRlYnVnOiBs
aWJ4bF9kZXZpY2UuYzozNTg6ZGlza190cnlfYmFja2VuZDogRGlzayB2ZGV2PXh2ZGEsIGJhY2tl
bmQgcGh5IHVuc3VpdGFibGUgZHVlIHRvIGZvcm1hdCBxY293Mgo+IGxpYnhsOiBkZWJ1ZzogbGli
eGxfZGV2aWNlLmM6NDMxOmxpYnhsX19kZXZpY2VfZGlza19zZXRfYmFja2VuZDogRGlzayB2ZGV2
PXh2ZGEsIHVzaW5nIGJhY2tlbmQgcWRpc2sKPiBsaWJ4bDogZGVidWc6IGxpYnhsX2NyZWF0ZS5j
OjEwMTg6aW5pdGlhdGVfZG9tYWluX2NyZWF0ZTogRG9tYWluIDExOnJ1bm5pbmcgYm9vdGxvYWRl
cgo+IGxpYnhsOiBkZWJ1ZzogbGlieGxfYm9vdGxvYWRlci5jOjMzNDpsaWJ4bF9fYm9vdGxvYWRl
cl9ydW46IERvbWFpbiAxMTpubyBib290bG9hZGVyIGNvbmZpZ3VyZWQsIHVzaW5nIHVzZXIgc3Vw
cGxpZWQga2VybmVsCj4gbGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjY4OTpsaWJ4bF9fZXZf
eHN3YXRjaF9kZXJlZ2lzdGVyOiB3YXRjaCB3PTB4NTVhNTk4ZTgyN2E4OiBkZXJlZ2lzdGVyIHVu
cmVnaXN0ZXJlZAo+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2FsbG9jYXRlOiBjbWRs
aW5lPSIiLCBmZWF0dXJlcz0iIgo+IGxpYnhsOiBkZWJ1ZzogbGlieGxfZG9tLmM6Nzk5OmxpYnhs
X19idWlsZF9wdjogcHYga2VybmVsIG1hcHBlZCAwIHBhdGggL3RhbmsveGVuc2NyYXRjaC91YnVu
dHUvdm1saW51ei01LjMuMC0yMy1nZW5lcmljCj4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19k
b21fa2VybmVsX2ZpbGU6IGZpbGVuYW1lPSIvdGFuay94ZW5zY3JhdGNoL3VidW50dS92bWxpbnV6
LTUuMy4wLTIzLWdlbmVyaWMiCj4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fbWFsbG9j
X2ZpbGVtYXAgICAgOiAxMTEzMiBrQgo+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2Jv
b3RfeGVuX2luaXQ6IHZlciA0LjEyLCBjYXBzIHhlbi0zLjAteDg2XzY0IHhlbi0zLjAteDg2XzMy
cCAKPiBkb21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9wYXJzZV9pbWFnZTogY2FsbGVkCj4g
ZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fZmluZF9sb2FkZXI6IHRyeWluZyBtdWx0aWJv
b3QtYmluYXJ5IGxvYWRlciAuLi4gCj4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiBsb2FkZXIgcHJv
YmUgZmFpbGVkCj4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fZmluZF9sb2FkZXI6IHRy
eWluZyBIVk0tZ2VuZXJpYyBsb2FkZXIgLi4uIAo+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogbG9h
ZGVyIHByb2JlIGZhaWxlZAo+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2ZpbmRfbG9h
ZGVyOiB0cnlpbmcgTGludXggYnpJbWFnZSBsb2FkZXIgLi4uIAo+IGRvbWFpbmJ1aWxkZXI6IGRl
dGFpbDogTFo0IGRlY29tcHJlc3Npb24gZXJyb3I6IGRlY29kaW5nIGZhaWxlZAoKVGhpcyBzdWdn
ZXN0cyB0aGF0IHRoZSBkZWNvZGluZyBsb2dpYyBkaWRuJ3QgbGlrZSB0aGUgaW5wdXQuIFNpbmNl
IGFzCnBlciB0aGUgb3RoZXIgbWFpbCBtYW51YWwgZGVjb21wcmVzc2lvbiB3b3JrcywgdGhpcyB3
aWxsIGxpa2VseSBuZWVkCmRlYnVnZ2luZyBieSBzb21lb25lIGFibGUgdG8gcmVwcm8uCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
