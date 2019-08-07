Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F84854E2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 23:04:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvT3U-0001hN-8h; Wed, 07 Aug 2019 21:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvT3T-0001hI-1t
 for xen-devel@lists.xen.org; Wed, 07 Aug 2019 21:01:07 +0000
X-Inumbo-ID: 786699b4-b956-11e9-87e8-cbee8bb8cd0a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 786699b4-b956-11e9-87e8-cbee8bb8cd0a;
 Wed, 07 Aug 2019 21:01:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 630B12173C;
 Wed,  7 Aug 2019 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565211664;
 bh=RrNfrrLe9gAttRT4Z89H6JAM7wIt6bwtxs+XIrXvHzc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kA7LzxaIQGgQwzbslqch0e0Rh2U3ZDPsrXM4yBjDty8vC9y3Xnzv2hq/9Yu480vV5
 +g8xEd0LbEgxoG9tXJV2cJxuX/0Lfhp92szXAzgxhC7/EaUtwdeqtfSF3vgdgqZbEk
 mK39zq4LD9EJMLM3SJZPJRM3urg/1FqeqzClTVIQ=
Date: Wed, 7 Aug 2019 14:01:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <32c809ac-24e0-f6b7-0520-d4a89c2cd0dd@arm.com>
Message-ID: <alpine.DEB.2.21.1908071347460.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-5-git-send-email-sstabellini@kernel.org>
 <781536e8-462f-1283-d647-af965206b04c@arm.com>
 <alpine.DEB.2.10.1901031347280.800@sstabellini-ThinkPad-X260>
 <32c809ac-24e0-f6b7-0520-d4a89c2cd0dd@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: add dom0less device assignment
 info to docs
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNSBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEvMy8xOSAxMDow
NyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gTW9uLCAyNCBEZWMgMjAxOCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBTdGVmYW5vLAo+ID4gPiAKPiA+ID4gT24gMTIv
NS8xOCA1OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4gPiA+IC0t
LQo+ID4gPiA+ICAgIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAxMDgK
PiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gICAgMSBm
aWxlIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKPiA+ID4gPiBiL2RvY3Mv
bWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKPiA+ID4gPiBpbmRleCAzMTdhOWU5Li5m
NWFhZjhmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9v
dGluZy50eHQKPiA+ID4gPiArKysgYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0Cj4gPiA+ID4gQEAgLTIyNiwzICsyMjYsMTExIEBAIGNob3NlbiB7Cj4gPiA+ID4gICAgICAg
ICAgICB9Owo+ID4gPiA+ICAgICAgICB9Owo+ID4gPiA+ICAgIH07Cj4gPiA+ID4gKwo+ID4gPiA+
ICsKPiA+ID4gPiArRGV2aWNlIEFzc2lnbm1lbnQKPiA+ID4gPiArPT09PT09PT09PT09PT09PT0K
PiA+ID4gPiArCj4gPiA+ID4gK0RldmljZSBBc3NpZ25tZW50IChQYXNzdGhyb3VnaCkgaXMgc3Vw
cG9ydGVkIGJ5IGFkZGluZyBhbm90aGVyIG1vZHVsZSwKPiA+ID4gPiArYWxvbmdzaWRlIHRoZSBr
ZXJuZWwgYW5kIHJhbWRpc2ssIHdpdGggdGhlIGRldmljZSB0cmVlIGZyYWdtZW50Cj4gPiA+ID4g
K2NvcnJlc3BvbmRpbmcgdG8gdGhlIGRldmljZSBub2RlIHRvIGFzc2lnbiB0byB0aGUgZ3Vlc3Qu
Cj4gPiA+ID4gKwo+ID4gPiA+ICtUaGUgZHRiIHN1Yi1ub2RlIHNob3VsZCBoYXZlIHRoZSBmb2xs
b3dpbmcgcHJvcGVydGllczoKPiA+ID4gPiArCj4gPiA+ID4gKy0gY29tcGF0aWJsZQo+ID4gPiA+
ICsKPiA+ID4gPiArICAgICJtdWx0aWJvb3QsZHRiIgo+ID4gPiAKPiA+ID4gSSB3b3VsZCBwcmVm
ZXIgIm11bHRpYm9vdCxkZXZpY2UtdHJlZSIKPiA+IAo+ID4gSSByZW5hbWVkIGl0Cj4gPiAKPiA+
IAo+ID4gPiA+ICsKPiA+ID4gPiArLSByZWcKPiA+ID4gPiArCj4gPiA+ID4gKyAgICBTcGVjaWZp
ZXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIGRldmljZSB0cmVlIGJpbmFyeSBmcmFnbWVu
dAo+ID4gPiA+ICsgICAgUkFNIGFuZCBpdHMgbGVuZ3RoLgo+ID4gPiA+ICsKPiA+ID4gPiArQXMg
YW4gZXhhbXBsZToKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgbW9kdWxlQDB4YzAwMDAwMCB7
Cj4gPiA+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGR0YiIsICJtdWx0
aWJvb3QsbW9kdWxlIjsKPiA+ID4gPiArICAgICAgICAgICAgcmVnID0gPDB4MCAweGMwMDAwMDAg
MHhmZmZmZmY+Owo+ID4gPiA+ICsgICAgICAgIH07Cj4gPiA+ID4gKwo+ID4gPiA+ICtUaGUgRFRC
IGZyYWdtZW50IChsb2FkZWQgaW4gbWVtb3J5IGF0IDB4YzAwMDAwMCBpbiB0aGUgZXhhbXBsZSBh
Ym92ZSkKPiA+ID4gPiArc2hvdWxkIGZvbGxvdyB0aGUgY29udmVudGlvbiBleHBsYWluZWQgaW4K
PiA+ID4gPiBkb2NzL21pc2MvYXJtL3Bhc3N0aHJvdWdoLnR4dC4KPiA+ID4gPiArVGhlIERUQiBm
cmFnbWVudCB3aWxsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBkZXZpY2UgdHJlZSwgc28gdGhhdCB0
aGUKPiA+ID4gPiArZ3Vlc3Qga2VybmVsIHdpbGwgYmUgYWJsZSB0byBkaXNjb3ZlciB0aGUgZGV2
aWNlLgo+ID4gPiA+ICsKPiA+ID4gPiArSW4gYWRkaXRpb24sIHRoZSBmb2xsb3dpbmcgcHJvcGVy
dGllcyBmb3IgZWFjaCBkZXZpY2Ugbm9kZSBpbiB0aGUKPiA+ID4gPiBkZXZpY2UKPiA+ID4gPiAr
dHJlZSBmcmFnbWVudCB3aWxsIGJlIHVzZWQgZm9yIHRoZSBkZXZpY2UgYXNzaWdubWVudCBzZXR1
cDoKPiA+ID4gPiArCj4gPiA+ID4gKy0gcmVnCj4gPiA+ID4gKwo+ID4gPiA+ICsgIFRoZSByZWcg
cHJvcGVydHkgc3BlY2lmeWluZyB0aGUgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgZGV2aWNlCj4g
PiA+ID4gbWVtb3J5Lgo+ID4gPiA+ICsgIFRoZSBkZXZpY2UgbWVtb3J5IHdpbGwgYmUgYXV0b21h
dGljYWxseSBtYXBwZWQgdG8gdGhlIGd1ZXN0IGRvbWFpbgo+ID4gPiA+ICsgIHdpdGggYSAxOjEg
bWFwcGluZyAocHNldWRvLXBoeXNpY2FsIGFkZHJlc3MgPT0gcGh5c2ljYWwgYWRkcmVzcykuCj4g
PiA+IAo+ID4gPiBBcyBzYWlkIGluIGEgcHJldmlvdXMgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyBjb3JyZWN0IHRvIGltcG9zZSAxOjEuCj4gPiA+IFRoZQo+ID4gPiB1c2VyIGlzIG5laXRo
ZXIgaW4gY29udHJvbCBvZiB0aGUgSFcgbWVtb3J5IG1hcCBub3IgdGhlIEd1ZXN0IG1lbW9yeSBt
YXAuCj4gPiA+IFNvCj4gPiA+IG5vdCBtYW55IHBlb3BsZSBhcmUgZ29pbmcgdG8gYmUgYWJsZSB0
byB1c2UgaXQgd2l0aG91dCBoYWNraW5nIFhlbi4KPiA+IAo+ID4gWWVzLCBJJ2xsIGZpeCB0aGlz
IChhbmQgYSBjb3VwbGUgb2Ygb3RoZXIgaXNzdWVzKSBieSBpbnRyb2R1Y2luZyBhIG5ldwo+ID4g
InhlbixyZWciIHByb3BlcnR5LCBpbnN0ZWFkIG9mIHRyeWluZyB0byByZXVzZSB0aGUgZXhpc3Rp
bmcgcmVnCj4gPiBwcm9wZXJ0eS4KPiA+IAo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICstIGludGVy
cnVwdHMKPiA+ID4gPiArCj4gPiA+ID4gKyAgVGhlIGludGVycnVwdHMgcHJvcGVydHkgc3BlY2lm
aWVzIHRoZSBpbnRlcnJ1cHQgb2YgdGhlIGRldmljZS4gVGhleQo+ID4gPiA+ICsgIGFyZSBhdXRv
bWF0aWNhbGx5IHJvdXRlZCB0byB0aGUgZ3Vlc3QgZG9tYWluIHdpdGggdmlydHVhbCBpcnFzID09
Cj4gPiA+ID4gKyAgcGh5c2ljYWwgaXJxcy4KPiA+ID4gPiArCj4gPiA+ID4gKy0gaW50ZXJydXB0
LXBhcmVudAo+ID4gPiA+ICsKPiA+ID4gPiArICBJdCBjb250YWlucyBhIHJlZmVyZW5jZSB0byB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9kZS4gSXQgc2hvdWxkCj4gPiA+ID4gYmUKPiA+ID4g
PiArICA2NTAwMCwgY29ycmVzcG9uZGluZyB0byBHVUVTVF9QSEFORExFX0dJQy4KPiA+ID4gCj4g
PiA+IFdlIG1hbmFnZWQgdG8gZ2V0IGF3YXkgaW4gdGhlIHRvb2xzdGFjayB3aXRoIHRoaXMgcHJv
cGVydHkuIFNvIHdoeSBkbyB5b3UKPiA+ID4gbmVlZAo+ID4gPiBpdCBmb3IgdGhlIGh5cGVydmlz
b3I/IEZ1cnRoZXJtb3JlLCB0aGlzIHdvdWxkIGZvcmJpZCB0byBwYXNzdGhyb3VnaCBhbnkKPiA+
ID4gb3RoZXIKPiA+ID4gaW50ZXJydXB0IGNvbnRyb2xsZXIgdG8gdGhlIGd1ZXN0Lgo+ID4gCj4g
PiBUaGUgdG9vbHN0YWNrIGRvZXMgdXNlIEdVRVNUX1BIQU5ETEVfR0lDIHRvZGF5IGZvciBwYXNz
dGhyb3VnaAo+ID4gaW50ZXJydXB0cywgc2VlIHRvb2xzL2xpYnhsL2xpYnhsX2FybS5jOm1ha2Vf
cm9vdF9wcm9wZXJ0aWVzIGFuZAo+ID4gZG9jcy9taXNjL2FybS9wYXNzdGhyb3VnaC50eHQ6Cj4g
PiAKPiA+ICAgICogVGhlIGludGVycnVwdC1wYXJlbnQgcHJvcGVydHkgd2lsbCBiZSBhZGRlZCBi
eSB0aGUgdG9vbHN0YWNrIGluIHRoZQo+ID4gICAgICByb290IG5vZGU7Cj4gCj4gWW91IG1pc3Vu
ZGVyc3Rvb2QgbXkgcG9pbnQgaGVyZS4gVGhlIHRvb2xzdGFjayBpcyBhZGRpbmcgdGhlIHByb3Bl
cnR5IGZvciB0aGUKPiB1c2VyLiBTbyB3aHkgZG9lcyB5b3UgcmVxdWlyZSB0aGUgdXNlciB0byBh
ZGQgdGhpcyBwcm9wZXJ0eSBmb3IgRG9tMGxlc3MgY2FzZT8KCkkgZGlkIG1pc3VuZGVyc3RhbmQu
IGludGVycnVwdC1wYXJlbnQgY2FtZSBmcm9tIHRoZSBleGFtcGxlIEkgaGFkIGF0IGhhbmQsIHdo
aWNoIGhhZAphbHJlYWR5IHRoZSBwcm9wZXJ0eSBldmVuIGlmIGl0IGlzIHVubmVjZXNzYXJ5LiBJ
IGNvbWZpcm1lZCB0aGF0IGl0IGlzCnN1cGVyZmxvdXMgYW5kIEkgYW0gaGFwcHkgdG8gcmVtb3Zl
IGl0LgoKRllJIGR0YyB0aHJvd3MgYSB3YXJuaW5nIGlmIGludGVycnVwdC1wYXJlbnQgaXMgbWlz
c2luZzoKCjxzdGRvdXQ+OiBXYXJuaW5nIChpbnRlcnJ1cHRzX3Byb3BlcnR5KTogTWlzc2luZyBp
bnRlcnJ1cHQtcGFyZW50IGZvciAvcGFzc3Rocm91Z2gvZXRoZXJuZXRAZmYwZTAwMDAKCkl0IG1h
a2VzIG1lIGd1ZXNzIHRoYXQgaXMgd2h5IGl0IHdhcyBhZGRlZCB0byB0aGUgZXhhbXBsZSBJIGhh
ZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
