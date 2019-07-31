Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4897CDFD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuyO-0002H1-SU; Wed, 31 Jul 2019 20:13:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsuyN-0002Gt-Dr
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:13:19 +0000
X-Inumbo-ID: a15ebeb4-b3cf-11e9-b78c-4ba9501b1107
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a15ebeb4-b3cf-11e9-b78c-4ba9501b1107;
 Wed, 31 Jul 2019 20:13:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99238337;
 Wed, 31 Jul 2019 13:13:15 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6933F694;
 Wed, 31 Jul 2019 13:13:14 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-17-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301044180.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dbe7204c-76ce-d203-5110-3be42415894c@arm.com>
Date: Wed, 31 Jul 2019 21:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301044180.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 16/35] xen/arm64: head: Rework and
 document launch()
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgNjo0NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjIgSnVsIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQm9vdCBDUFUg
YW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2ludCB0byBDIGNv
ZGUuIEF0Cj4+IHRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0byB1c2Ug
aXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgo+Pgo+PiBJbiBvcmRlciB0byBhdm9pZCBhIGJyYW5j
aCBmb3IgdGhlIGRlY2lzaW9uIGFuZCBtYWtlIHRoZSBjb2RlIGNsZWFyZXIsCj4+IGxhdW5jaCgp
IGlzIHJld29ya2VkIHRvIHRha2UgaW4gcGFyYW1ldGVycyB0aGUgZW50cnkgcG9pbnQgYW5kIGl0
cwo+PiBhcmd1bWVudHMuCj4+Cj4+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0
aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+PiBmdW5jdGlvbi4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gLS0t
Cj4+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPj4gICAgICAgICAgLSBVc2UgeDMgaW5zdGVhZCBvZiB4
NAo+PiAgICAgICAgICAtIEFkZCBhIGNsb2JiZXJzIHNlY3Rpb24KPj4gLS0tCj4+ICAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiBpbmRleCBmMTY1ZGQ2MWNhLi43NTQxNjM1MTAy
IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKPj4gQEAgLTMxMiw2ICszMTIsMTEgQEAgcHJpbWFyeV9zd2l0
Y2hlZDoKPj4gICAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhl
IFVBUlQuICovCj4+ICAgICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQURE
UkVTUwo+PiAgICNlbmRpZgo+PiArICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4+ICsg
ICAgICAgIC8qIFNldHVwIHRoZSBhcmd1bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBD
IHdvcmxkICovCj4+ICsgICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogeDAg
Oj0gUGh5c2ljYWwgb2Zmc2V0ICovCj4+ICsgICAgICAgIG1vdiAgIHgxLCB4MjEgICAgICAgICAg
ICAgICAgLyogeDEgOj0gcGFkZHIoRkRUKSAqLwo+PiArICAgICAgICBsZHIgICB4MiwgPXN0YXJ0
X3hlbgo+PiAgICAgICAgICAgYiAgICAgbGF1bmNoCj4+ICAgRU5EUFJPQyhyZWFsX3N0YXJ0KQo+
PiAgIAo+PiBAQCAtMzc0LDYgKzM3OSw5IEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoKPj4gICAgICAg
ICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCj4+ICAg
ICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+PiAgICNlbmRp
Zgo+PiArICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4+ICsgICAgICAgIC8qIEp1bXAg
dG8gQyB3b3JsZCAqLwo+PiArICAgICAgICBsZHIgICB4MiwgPXN0YXJ0X3NlY29uZGFyeQo+PiAg
ICAgICAgICAgYiAgICAgbGF1bmNoCj4+ICAgRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKPj4gICAK
Pj4gQEAgLTczMiwyMyArNzQwLDI2IEBAIHNldHVwX2ZpeG1hcDoKPj4gICAgICAgICAgIHJldAo+
PiAgIEVORFBST0Moc2V0dXBfZml4bWFwKQo+PiAgIAo+PiArLyoKPj4gKyAqIFNldHVwIHRoZSBp
bml0aWFsIHN0YWNrIGFuZCBqdW1wIHRvIHRoZSBDIHdvcmxkCj4+ICsgKgo+PiArICogSW5wdXRz
Ogo+PiArICogICB4MCA6IEFyZ3VtZW50IDAgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAo+PiAr
ICogICB4MSA6IEFyZ3VtZW50IDEgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAo+PiArICogICB4
MiA6IEMgZW50cnkgcG9pbnQKPj4gKyAqCj4+ICsgKiBDbG9iYmVycyB4Mwo+PiArICovCj4+ICAg
bGF1bmNoOgo+PiAtICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4+IC0KPj4gLSAgICAg
ICAgbGRyICAgeDAsID1pbml0X2RhdGEKPj4gLSAgICAgICAgYWRkICAgeDAsIHgwLCAjSU5JVElO
Rk9fc3RhY2sgLyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNrICovCj4+IC0gICAgICAgIGxkciAg
IHgwLCBbeDBdCj4+IC0gICAgICAgIGFkZCAgIHgwLCB4MCwgI1NUQUNLX1NJWkUgICAgLyogKHdo
aWNoIGdyb3dzIGRvd24gZnJvbSB0aGUgdG9wKS4gKi8KPj4gLSAgICAgICAgc3ViICAgeDAsIHgw
LCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSByb29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KPj4g
LSAgICAgICAgbW92ICAgc3AsIHgwCj4+IC0KPj4gLSAgICAgICAgY2JueiAgeDIyLCAxZgo+PiAt
Cj4+IC0gICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdz
OiAtIHBoeXNfb2Zmc2V0ICovCj4+IC0gICAgICAgIG1vdiAgIHgxLCB4MjEgICAgICAgICAgICAg
ICAgLyogICAgICAgICAgICAgICAtIEZEVCAqLwo+PiAtICAgICAgICBiICAgICBzdGFydF94ZW4g
ICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCj4+IC0x
Ogo+PiAtICAgICAgICBiICAgICBzdGFydF9zZWNvbmRhcnkgICAgICAgIC8qICh0byB0aGUgYXBw
cm9wcmlhdGUgZW50cnkgcG9pbnQpICovCj4+ICsgICAgICAgIGxkciAgIHgzLCA9aW5pdF9kYXRh
Cj4+ICsgICAgICAgIGFkZCAgIHgzLCB4MywgI0lOSVRJTkZPX3N0YWNrIC8qIEZpbmQgdGhlIGJv
b3QtdGltZSBzdGFjayAqLwo+PiArICAgICAgICBsZHIgICB4MywgW3gzXQo+PiArICAgICAgICBh
ZGQgICB4MywgeDMsICNTVEFDS19TSVpFICAgIC8qICh3aGljaCBncm93cyBkb3duIGZyb20gdGhl
IHRvcCkuICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIHBs
ZWFzZSBtb3ZlIDEgc3BhY2UgdG8gdGhlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByaWdodAo+IAo+IEFzaWRlIGZyb20gdGhpcyBtaW5vciBjb2RlIHN0eWxlIHRo
aW5nCgpJZiBJIHdhbnRlZCB0byBiZSBwaWNreSwgYWxsIHRoZSByZXN0IG9mIHRoZSBjb2RlIGlu
IHRoaXMgZmlsZSBpcyAKaW5kZW50YXRpb24gYXQgY29sdW1uIDM4LiBTbyB0aGlzIGxpbmUgaGFz
IHRoZSBjb3JyZWN0IGluZGVudGF0aW9uIGJ1dCAKdGhlIHR3byBvdGhlcnMgYXJlIG5vdC4gSG93
ZXZlciwgdGhpcyB3b3VsZCBtZWFucyB0aGVyZSBhcmUgbm90IHNwYWNlIApiZXR3ZWVuIHRoZSBp
bnN0cnVjdGlvbiBhbmQgdGhlIGNvbW1lbnQ6Cgpmb29iYXIvKiAuLi4gKi8KClNvIEkgZ3Vlc3Ms
IGluZGVudGluZyBhdCBjb2x1bW4gMzkgd291bGQgYmUgdGhlIGJlc3QgaGVyZSwgYWx0aG91Z2gg
SSAKYWxyZWFkeSBrbm93IHNvbWVvbmUgdGhhdCB3aWxsIGJlIHVuaGFwcHkgd2l0aCBpbiB0aGUg
ZnV0dXJlIDspLgoKPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKVGhhbmsgeW91IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
