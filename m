Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3740C1FDA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:15:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtcJ-0000s1-AM; Mon, 30 Sep 2019 11:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEtcI-0000rv-7U
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:13:22 +0000
X-Inumbo-ID: 4f6d6a96-e373-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4f6d6a96-e373-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 11:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36B6FAC7B;
 Mon, 30 Sep 2019 11:13:20 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
 <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
 <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
 <fc49b59e-bbbb-7c64-3b31-2244c76ee2ae@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <800eb65a-a26f-289b-86b3-bace17ce5083@suse.com>
Date: Mon, 30 Sep 2019 13:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc49b59e-bbbb-7c64-3b31-2244c76ee2ae@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot
 parameter documentation
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

T24gMzAuMDkuMTkgMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA5LjIwMTkgMTI6
NTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDMwLjA5LjE5IDEyOjI1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDMwLjA5LjIwMTkgMTI6MDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBuZXcgInNjaGVkLWdyYW4iIGh5cGVydmlzb3Ig
Ym9vdCBwYXJhbWV0ZXIuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVu
LWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MK
Pj4+PiBpbmRleCBmYzY0NDI5MDY0Li5jODU1MjQ2MDUwIDEwMDY0NAo+Pj4+IC0tLSBhL2RvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+Pj4+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYwo+Pj4+IEBAIC0xNzgyLDYgKzE3ODIsMjcgQEAgU2V0IHRoZSB0aW1l
c2xpY2Ugb2YgdGhlIGNyZWRpdDEgc2NoZWR1bGVyLCBpbiBtaWxsaXNlY29uZHMuICBUaGUKPj4+
PiAgICBkZWZhdWx0IGlzIDMwbXMuICBSZWFzb25hYmxlIHZhbHVlcyBtYXkgaW5jbHVkZSAxMCwg
NSwgb3IgZXZlbiAxIGZvcgo+Pj4+ICAgIHZlcnkgbGF0ZW5jeS1zZW5zaXRpdmUgd29ya2xvYWRz
Lgo+Pj4+ICAgIAo+Pj4+ICsjIyMgc2NoZWQtZ3JhbiAoeDg2KQo+Pj4+ICs+IGA9IGNwdSB8IGNv
cmUgfCBzb2NrZXRgCj4+Pj4gKwo+Pj4+ICs+IERlZmF1bHQ6IGBzY2hlZC1ncmFuPWNwdWAKPj4+
PiArCj4+Pj4gK1NldCB0aGUgc2NoZWR1bGluZyBncmFudWxhcml0eS4gSW4gY2FzZSB0aGUgZ3Jh
bnVsYXJpdHkgaXMgbGFyZ2VyIHRoYW4gMSAoZS5nLgo+Pj4+ICtgY29yZWBvbiBhIFNNVC1lbmFi
bGVkIHN5c3RlbSwgb3IgYHNvY2tldGApIG11bHRpcGxlIHZjcHVzIGFyZSBhc3NpZ25lZAo+Pj4+
ICtzdGF0aWNhbGx5IHRvIGEgInNjaGVkdWxpbmcgdW5pdCIgd2hpY2ggd2lsbCB0aGVuIGJlIHN1
YmplY3QgdG8gc2NoZWR1bGluZy4KPj4+PiArVGhpcyBhc3NpZ25tZW50IG9mIHZjcHVzIHRvIHNj
aGVkdWxpbmcgdW5pdHMgaXMgZml4ZWQuCj4+Pj4gKwo+Pj4+ICtgY3B1YDogVmNwdXMgd2lsbCBi
ZSBzY2hlZHVsZWQgaW5kaXZpZHVhbGx5IG9uIHNpbmdsZSBjcHVzLgo+Pj4+ICsKPj4+PiArYGNv
cmVgOiBBcyBtYW55IHZjcHVzIGFzIHRoZXJlIGFyZSBoeXBlcnRocmVhZHMgb24gYSBwaHlzaWNh
bCBjb3JlIGFyZQo+Pj4+ICtzY2hlZHVsZWQgdG9nZXRoZXIgb24gYSBwaHlzaWNhbCBjb3JlLgo+
Pj4+ICsKPj4+PiArYHNvY2tldGA6IEFzIG1hbnkgdmNwdXMgYXMgdGhlcmUgYXJlIGh5cGVydGhy
ZWFkcyBvbiBhIHBoeXNpY2FsIHNvY2tldHMgYXJlCj4+Pj4gK3NjaGVkdWxlZCB0b2dldGhlciBv
biBhIHBoeXNpY2FsIHNvY2tldC4KPj4+Cj4+PiBJJ2QgcHJlZmVyIGlmIHRoaXMgZGlkbid0IGVu
ZCB1cCBJbnRlbC1jZW50cmljOyBpZGVhbGx5IGl0IGFsc28gd291bGRuJ3QgYmUKPj4+IHg4Ni1z
cGVjaWZpYy4gQU1EIGhhcyBpbnRyb2R1Y2VkIGh5cGVydGhyZWFkaW5nIGluIEZhbTE3IG9ubHk7
IEZhbTE1IHVzZWQKPj4+ICJjb21wdXRlIHVuaXRzIiwgZ3JvdXBpbmcgdG9nZXRoZXIgImNvcmVz
Ii4gSW50ZXJuYWxseSB0aGUgSW50ZWwgc2lkZQo+Pj4gImNvcmUgdnMgaHlwZXJ0aHJlYWQiIGlz
IHJlcHJlc2VudGVkIGluIHRoZSBzYW1lIHZhcmlhYmxlcyAoY3B1X3NpYmxpbmdfbWFzawo+Pj4g
aW4gcGFydGljdWxhcikgYXMgdGhlIEFNRCBzaWRlICJjb21wdXRlIHVuaXQgdnMgY29yZSIuCj4+
Cj4+IFllcywgaXQgaXMgYSBtZXNzLgo+Pgo+Pj4gVGhlcmVmb3JlIGl0IG1heSBiZSBiZXR0ZXIg
dG8gdGFsayBoZXJlIGFib3V0IGUuZy4gInNtYWxsZXN0IHRvcG9sb2dpY2FsCj4+PiBzdWItdW5p
dCIgYW5kIG9ubHkgc2F5ICJlLmcuIGEgaHlwZXJ0aHJlYWQgdG8gbWFrZSBhIGNvbm5lY3Rpb24g
dG8gY29tbW9uCj4+PiB4ODYgLyBJbnRlbCB0ZXJtaW5vbG9neSIuIE9mIGNvdXJzZSB0aGUgQU1E
IHNpZGUgYWx0ZXJuYXRpdmUgdXNlIG9mIHRoZQo+Pj4gdmFyaWFibGVzIGFsc28gcmVuZGVycyB0
aGUgYWN0dWFsIGNvbW1hbmQgbGluZSBvcHRpb24gInNjaGVkLWdyYW49Y29yZSIKPj4+IG5vdCBv
dmVybHkgZm9ydHVuYXRlLiBQZXJoYXBzIHdlJ2Qgd2FudCB0byBhbHNvIHVzZSBtb3JlIGFic3Ry
YWN0IHRlcm1zCj4+PiBoZXJlLCBlLmcuIHRvcG9sb2dpY2FsICJsZXZlbHMiPwo+Pgo+PiBJIHRo
aW5rIHJlZ2FyZGluZyB1c2FnZSBvZiAiaHlwZXJ0aHJlYWRzIiBJJ2xsIGdvIHdpdGg6Cj4+Cj4+
ICtgY3B1YDogVmNwdXMgd2lsbCBiZSBzY2hlZHVsZWQgaW5kaXZpZHVhbGx5IG9uIHNpbmdsZSBj
cHVzIChlLmcuIGEKPj4gKyBoeXBlcnRocmVhZCB1c2luZyB4ODYvSW50ZWwgdGVybWlub2xvZ3kp
Cj4+ICsKPj4gKyBgY29yZWA6IEFzIG1hbnkgdmNwdXMgYXMgdGhlcmUgYXJlIGNwdXMgb24gYSBw
aHlzaWNhbCBjb3JlIGFyZQo+PiArIHNjaGVkdWxlZCB0b2dldGhlciBvbiBhIHBoeXNpY2FsIGNv
cmUuCj4+IC4uLgo+Pgo+PiBJIHRoaW5rIHVzaW5nICJjb3JlIiBpcyBmaW5lLiBXZSBoYXZlIGl0
IGluIG11bHRpcGxlIHBsYWNlcyBpbiB0aGUKPj4gaHlwZXJ2aXNvciB3aGljaCBhcmUgX25vdF8g
c3BlY2lmaWMgdG8gSW50ZWwuCj4gCj4gV2VsbCwgd2hhdCB3ZSBoYXZlIGluIGh5cGVydmlzb3Ig
c291cmNlcyBpcyBvbmUgdGhpbmcgLSB3ZSBjYW4KPiBzZXR0bGUgb24gYW55IGNvbnZlbnRpb24g
d2Ugd2FudCB0aGVyZS4gSXQncyB0aGUgdXNlciAoYWRtaW4pCj4gaW50ZXJmYWNlIChpLmUuIHRo
ZSBjb21tYW5kIGxpbmUgb3B0aW9uIG5hbWUgYW5kIGRlc2NyaXB0aW9uCj4gaGVyZSkgd2hpY2gg
d2UgbWF5IHdhbnQgdG8gYmUgYSBsaXR0bGUgbW9yZSBjYXJlZnVsIHdpdGguIEJ1dAo+IHllcywg
SSBjYW4gc2VlIGhvdyB3ZSB1c2UgImNvcmUiIGFscmVhZHkgaW4gc2ltaWxhciBjb250ZXh0cwo+
IGluIHRoZSBjb21tYW5kIGxpbmUgb3B0aW9uIGRvYywgZmlyc3QgYW5kIGZvcmVtb3N0IG9uCj4g
ImNyZWRpdDJfcnVucXVldWUiLiAoSW4gcmV0cm9zcGVjdCBJIHRoaW5rIHRoaXMgbWlnaHQgaGF2
ZSBiZWVuCj4gYSBtaXN0YWtlIHRob3VnaC4pCgpTbyB3aGF0IGRvIHlvdSBzdWdnZXN0PwoKPEly
b255IG9uPgoidG9wb2xvZ3ktbGV2ZWwtanVzdC1hYm92ZS10aGUtc21hbGxlc3QtdG9wb2xvZ2lj
YWwtc3ViLXVuaXQiPwo8SXJvbnktb2ZmPgoKSSBjYW4ndCB0aGluayBvZiBhbnkgc2Vuc2libGUg
dGVybWlub2xvZ3kgbm90IHJlc3VsdGluZyBpbiBzb21ldGhpbmcKd2hpY2ggaXMgbXVjaCBoYXJk
ZXIgdG8gdW5kZXJzdGFuZCB0aGFuICJjb3JlIi4KCkFuZCB3ZSBhcmUgdXNpbmcgImNvcmUiIG9y
ICJjb3JlcyIgaW4gaHlwZXJ2aXNvciBtZXNzYWdlcywgdG9vLgoKPj4gQW5kICJjb3JlLXNjaGVk
dWxpbmciIGlzIGEgd2VsbC1rbm93biBidXp6d29yZCBhbHJlYWR5Lgo+IAo+IExldCBtZSBub3Qg
Z2V0IHN0YXJ0ZWQgb24gYnV6endvcmRzIDstKQoKOi0pCgoKSnVlcmdlbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
