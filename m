Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B463894B56
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:10:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzl7S-0004Gz-Vr; Mon, 19 Aug 2019 17:06:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzl7Q-0004Gu-P6
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:06:56 +0000
X-Inumbo-ID: bef3872e-c2a3-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bef3872e-c2a3-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 17:06:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 953EA22CE9;
 Mon, 19 Aug 2019 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566234414;
 bh=eR+ZKbSjOJQFFb6/HAXO31MI0Fg9JzlkeR/xhXtRhVI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tMhmhhfQ4DCufzq2wWyHWcf8FsU0cxewrXGMB996mNT2E+8neMDchf76N+ctogNKd
 0BS9dxCRZK6NKgR3zuFZLI+0n6GjDdOpDQiQ/G3XUdSwS7wmRbHXZiuxMxXadEAF7C
 TEeW9QiJwjfBDOpu0jAN1me2AoNMgsoheX6nd2pg=
Date: Mon, 19 Aug 2019 10:06:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <40411181-196b-8e7e-8b6d-1ca2f4a1c565@arm.com>
Message-ID: <alpine.DEB.2.21.1908191006330.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-1-sstabellini@kernel.org>
 <3113e535-e77c-83bc-81ae-4cacce155a9a@arm.com>
 <alpine.DEB.2.21.1908161710200.20094@sstabellini-ThinkPad-T480s>
 <40411181-196b-8e7e-8b6d-1ca2f4a1c565@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 1/8] xen/arm: pass node to
 device_tree_for_each_node
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxOSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDgvMTcvMTkgMToy
OSBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gRnJpLCAxNiBBdWcgMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDE2LzA4LzIwMTkg
MDA6MzYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBBZGQgYSBuZXcgcGFyYW1l
dGVyIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGU6IG5vZGUsIHRoZSBub2RlIHRvCj4gPiA+
ID4gc3RhcnQgdGhlIHNlYXJjaCBmcm9tLiBQYXNzaW5nIDAgdHJpZ2dlcnMgdGhlIG9sZCBiZWhh
dmlvci4KPiA+ID4gCj4gPiA+IEhlcmUgeW91IHNheSAwIHRyaWdnZXJzIHRoZSBvbGQgYmVoYXZp
b3IgYnV0Li4uCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IFNldCBtaW5fZGVwdGggdG8gZGVwdGgg
b2YgdGhlIGN1cnJlbnQgbm9kZSArIDEgdG8gYXZvaWQgc2Nhbm5pbmcKPiA+ID4gPiBzaWJsaW5n
cyBvZiB0aGUgaW5pdGlhbCBub2RlIHBhc3NlZCBhcyBhbiBhcmd1bWVudC4KPiA+ID4gPiAKPiA+
ID4gPiBEb24ndCBjYWxsIGZ1bmMoKSBvbiB0aGUgcGFyZW50IG5vZGUgcGFzc2VkIGFzIGFuIGFy
Z3VtZW50LiBDbGFyaWZ5IHRoZQo+ID4gPiA+IGNoYW5nZSBpbiB0aGUgY29tbWVudCBvbiB0b3Ag
b2YgdGhlIGZ1bmN0aW9uLgo+ID4gPiAKPiA+ID4gLi4uIGhlcmUgeW91IG1lbnRpb24gdGhhdCB0
aGUgZmlyc3Qgbm9kZSB3aWxsIGJlIHNraXBwZWQuIFNvIHRoZSBiZWhhdmlvcgo+ID4gPiBpcwo+
ID4gPiBub3cgZGlmZmVyZW50IGFuZCBzaG91bGQgYmUgZXhwbGFpbmVkIGluIHRoZSBjb21taXQg
bWVzc2FnZSB3aHkgdGhpcyBpcwo+ID4gPiBmaW5lCj4gPiA+IHRvIHNraXAgdGhlIHJvb3Qgbm9k
ZS4KPiA+IAo+ID4gWWVzIEknbGwgdXBkYXRlCj4gPiAKPiA+IAo+ID4gPiA+IAo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+
ID4gPiAtLS0KPiA+ID4gPiBDaGFuZ2VzIGluIHY2Ogo+ID4gPiA+IC0gZml4IGNvZGUgc3R5bGUK
PiA+ID4gPiAtIGRvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBmaXJzdCBub2RlCj4gPiA+ID4gCj4g
PiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gPiAtIGdvIGJhY2sgdG8gdjMKPiA+ID4gPiAtIGNv
ZGUgc3R5bGUgaW1wcm92ZW1lbnQgaW4gYWNwaS9ib290LmMKPiA+ID4gPiAtIGltcHJvdmUgY29t
bWVudHMgYW5kIGNvbW1pdCBtZXNzYWdlCj4gPiA+ID4gLSBpbmNyZWFzZSBtaW5fZGVwdGggdG8g
YXZvaWQgcGFyc2luZyBzaWJsaW5ncwo+ID4gPiA+IC0gcmVwbGFjZSBmb3Igd2l0aCBkby93aGls
ZSBsb29wIGFuZCBpbmNyZWFzZSBtaW5fZGVwdGggdG8gYXZvaWQKPiA+ID4gPiAgICAgc2Nhbm5p
bmcgc2libGluZ3Mgb2YgdGhlIGluaXRpYWwgbm9kZQo+ID4gPiA+IC0gcGFzcyBvbmx5IG5vZGUs
IGNhbGN1bGF0ZSBkZXB0aAo+ID4gPiA+IAo+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4g
LSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gPiA+ID4gLSBpbXByb3ZlIGluLWNvZGUgY29tbWVu
dHMKPiA+ID4gPiAtIGltcHJvdmUgY29kZSBzdHlsZQo+ID4gPiA+IAo+ID4gPiA+IENoYW5nZXMg
aW4gdjI6Cj4gPiA+ID4gLSBuZXcKPiA+ID4gPiAtLS0KPiA+ID4gPiAgICB4ZW4vYXJjaC9hcm0v
YWNwaS9ib290LmMgICAgICB8ICA4ICsrKysrLS0tCj4gPiA+ID4gICAgeGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYyAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4g
PiA+ID4gICAgeGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggfCAgNiArKystLS0KPiA+ID4g
PiAgICAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+
ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMgYi94
ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMKPiA+ID4gPiBpbmRleCA5YjI5NzY5YTEwLi5iZjljNzhi
MDJjIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwo+ID4gPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwo+ID4gPiA+IEBAIC0yNDYsOSArMjQ2LDEx
IEBAIGludCBfX2luaXQgYWNwaV9ib290X3RhYmxlX2luaXQodm9pZCkKPiA+ID4gPiAgICAgICAg
ICogLSB0aGUgZGV2aWNlIHRyZWUgaXMgbm90IGVtcHR5IChpdCBoYXMgbW9yZSB0aGFuIGp1c3Qg
YQo+ID4gPiA+IC9jaG9zZW4KPiA+ID4gPiBub2RlKQo+ID4gPiA+ICAgICAgICAgKiAgIGFuZCBB
Q1BJIGhhcyBub3QgYmVlbiBmb3JjZSBlbmFibGVkIChhY3BpPWZvcmNlKQo+ID4gPiA+ICAgICAg
ICAgKi8KPiA+ID4gPiAtICAgIGlmICggcGFyYW1fYWNwaV9vZmYgfHwgKCAhcGFyYW1fYWNwaV9m
b3JjZQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICYmCj4gPiA+ID4gZGV2
aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShkZXZpY2VfdHJlZV9mbGF0dGVuZWQsCj4gPiA+ID4gLQo+
ID4gPiA+IGR0X3NjYW5fZGVwdGgxX25vZGVzLAo+ID4gPiA+IE5VTEwpKSkKPiA+ID4gPiArICAg
IGlmICggcGFyYW1fYWNwaV9vZmYpCj4gPiA+ID4gKyAgICAgICAgZ290byBkaXNhYmxlOwo+ID4g
PiA+ICsgICAgaWYgKCAhcGFyYW1fYWNwaV9mb3JjZSAmJgo+ID4gPiA+ICsgICAgICAgICBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgMCwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdF9zY2FuX2RlcHRoMV9ub2Rlcywg
TlVMTCkgKQo+ID4gPiA+ICAgICAgICAgICAgZ290byBkaXNhYmxlOwo+ID4gPiA+ICAgICAgICAg
IC8qCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jCj4gPiA+ID4gaW5kZXggODkxYjRiNjZmZi4uZjE2MTRlZjdmYyAxMDA2
NDQKPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gPiA+ID4gKysrIGIveGVu
L2FyY2gvYXJtL2Jvb3RmZHQuYwo+ID4gPiA+IEBAIC03NSw5ICs3NSwxMCBAQCBzdGF0aWMgdTMy
IF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQKPiA+ID4gPiAqZmR0LAo+ID4g
PiA+IGludCBub2RlLAo+ID4gPiA+ICAgIH0KPiA+ID4gPiAgICAgIC8qKgo+ID4gPiA+IC0gKiBk
ZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIC0gaXRlcmF0ZSBvdmVyIGFsbCBkZXZpY2UgdHJlZSBu
b2Rlcwo+ID4gPiA+ICsgKiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIC0gaXRlcmF0ZSBvdmVy
IGFsbCBkZXZpY2UgdHJlZSBzdWItbm9kZXMKPiA+ID4gPiAgICAgKiBAZmR0OiBmbGF0IGRldmlj
ZSB0cmVlLgo+ID4gPiA+IC0gKiBAZnVuYzogZnVuY3Rpb24gdG8gY2FsbCBmb3IgZWFjaCBub2Rl
Lgo+ID4gPiA+ICsgKiBAbm9kZTogcGFyZW50IG5vZGUgdG8gc3RhcnQgdGhlIHNlYXJjaCBmcm9t
Cj4gPiA+ID4gKyAqIEBmdW5jOiBmdW5jdGlvbiB0byBjYWxsIGZvciBlYWNoIHN1Yi1ub2RlLgo+
ID4gPiA+ICAgICAqIEBkYXRhOiBkYXRhIHRvIHBhc3MgdG8gQGZ1bmMuCj4gPiA+ID4gICAgICoK
PiA+ID4gPiAgICAgKiBBbnkgbm9kZXMgbmVzdGVkIGF0IERFVklDRV9UUkVFX01BWF9ERVBUSCBv
ciBkZWVwZXIgYXJlIGlnbm9yZWQuCj4gPiA+ID4gQEAgLTg1LDIwICs4NiwxOCBAQCBzdGF0aWMg
dTMyIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQKPiA+ID4gPiAqZmR0LAo+
ID4gPiA+IGludCBub2RlLAo+ID4gPiA+ICAgICAqIFJldHVybnMgMCBpZiBhbGwgbm9kZXMgd2Vy
ZSBpdGVyYXRlZCBvdmVyIHN1Y2Nlc3NmdWxseS4gIElmIEBmdW5jCj4gPiA+ID4gICAgICogcmV0
dXJucyBhIHZhbHVlIGRpZmZlcmVudCBmcm9tIDAsIHRoYXQgdmFsdWUgaXMgcmV0dXJuZWQKPiA+
ID4gPiBpbW1lZGlhdGVseS4KPiA+ID4gPiAgICAgKi8KPiA+ID4gPiAtaW50IF9faW5pdCBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKPiA+ID4gPiAraW50IF9faW5p
dCBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90cmVl
X25vZGVfZnVuYyBmdW5jLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICpkYXRhKQo+ID4gPiA+ICAgIHsKPiA+ID4gPiAtICAgIGludCBub2RlOwo+
ID4gPiA+IC0gICAgaW50IGRlcHRoOwo+ID4gPiA+ICsgICAgaW50IGRlcHRoID0gZmR0X25vZGVf
ZGVwdGgoZmR0LCBub2RlKTsKPiA+ID4gCj4gPiA+IFNvcnJ5IEkgZGlkbid0IHNwb3QgdGhpcyBp
biB0aGUgcHJldmlvdXMgdmVyc2lvbi4gQXMgSSBwb2ludGVkIG91dCBvbiB2NAo+ID4gPiAoYW5k
Cj4gPiA+IHlvdSBhY3R1YWxseSBhZ3JlZWQhKSwgeW91IGRvbid0IG5lZWQgdGhlIGFic29sdXRl
IGRlcHRoLi4uCj4gPiA+IAo+ID4gPiBZb3Ugb25seSBuZWVkIHRoZSByZWxhdGl2ZSBkZXB0aC4g
U28gdGhpcyBpcyBhIHdhc3RlIG9mIHByb2Nlc3NpbmcgYXMgeW91Cj4gPiA+IGhhdmUKPiA+ID4g
dG8gZ28gdGhyb3VnaCB0aGUgRkRUIHRvIGNhbGN1bGF0ZSB0aGUgZGVwdGguCj4gPiA+IAo+ID4g
PiBUaGlzIGlzIG5vdCBlbnRpcmVseSBjcml0aWNhbCBzbyBJIHdvdWxkIGJlIHdpbGxpbmcgdG8g
Y29uc2lkZXIgYSBwYXRjaCBvbgo+ID4gPiB0b3AKPiA+ID4gb2YgdGhpcyBzZXJpZXMuCj4gPiAK
PiA+IEkgdHJpZWQgd2hlbiBJIHNlbnQgdGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMsIGJ1dCBJ
IGNvdWxkbid0IHF1aXRlIGRvCj4gPiBpdCB0aGF0IHdheS4gSSB3YW50ZWQgdG8gZ2V0IHJpZCBv
ZiB0aGUgZGVwdGggcGFyYW1ldGVyIHRvCj4gPiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlLCBh
bmQgd2UgbmVlZCB0byBrbm93IHRoZSBkZXB0aCBvZiB0aGUgZmlyc3QKPiA+IG5vZGUgcGFzc2Vk
IGFzIGFuIGFyZ3VtZW50IHRvIGNvbXBhcmUgaXQgd2l0aCB0aGUgZGVwdGggb2YgdGhlIG5leHQg
bm9kZQo+ID4gYW5kIGZpZ3VyZSBvdXQgaWYgaXQgaXMgYXQgdGhlIHNhbWUgbGV2ZWwgb3Igb25l
IGxldmVsIGRlZXBlci4KPiAKPiBmZHRfbmV4dF9ub2RlKCkgd2lsbCBpbmNyZW1lbnQvZGVjcmVt
ZW50IHdoaWNoZXZlciBkZXB0aCB5b3UgcGFzcyBpbiBhcmd1bWVudC4KPiAKPiBTbyBpZiB5b3Ug
cGFzcyAwLCB0aGVuIGFueSBjaGlsZCBvZiB0aGUgbm9kZSB3aWxsIGJlIGF0IGRlcHRoIDEuIEFu
eSBub2RlIGF0Cj4gdGhlIHNhbWUgbGV2ZWwgYXMgdGhlIHBhcmVudCBub2RlIHdpbGwgYWxzbyBi
ZSBkZXB0aCAwLi4uCj4gCj4gVGhlcmVmb3JlIGluaXRpYWxpemluZyBkZXB0aCB0byAwIGFuZCBj
aGVja2luZyBpdCBpcyBzdHJpY3RseSBwb3NpdGl2ZSAoaS5lCj4gZGVwdGggPiAwKSBpcyBlbm91
Z2ggZm9yIG91ciB1c2UgY2FzZS4KClRoYXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgYW5kIHdpbGwg
aW1wcm92ZSB0aGUgY29kZS4gVGhhbmtzIGZvciB0aGUKc3VnZ2VzdGlvbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
