Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5E920C8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 11:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzeKM-0001aU-K5; Mon, 19 Aug 2019 09:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzeKL-0001aP-CQ
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 09:51:49 +0000
X-Inumbo-ID: f4b6eef6-c266-11e9-aee9-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f4b6eef6-c266-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 09:51:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA323344;
 Mon, 19 Aug 2019 02:51:45 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7D2B3F718;
 Mon, 19 Aug 2019 02:51:43 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-1-sstabellini@kernel.org>
 <3113e535-e77c-83bc-81ae-4cacce155a9a@arm.com>
 <alpine.DEB.2.21.1908161710200.20094@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <40411181-196b-8e7e-8b6d-1ca2f4a1c565@arm.com>
Date: Mon, 19 Aug 2019 10:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908161710200.20094@sstabellini-ThinkPad-T480s>
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzE3LzE5IDE6MjkgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBG
cmksIDE2IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxNi8w
OC8yMDE5IDAwOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBBZGQgYSBuZXcgcGFy
YW1ldGVyIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGU6IG5vZGUsIHRoZSBub2RlIHRvCj4+
PiBzdGFydCB0aGUgc2VhcmNoIGZyb20uIFBhc3NpbmcgMCB0cmlnZ2VycyB0aGUgb2xkIGJlaGF2
aW9yLgo+Pgo+PiBIZXJlIHlvdSBzYXkgMCB0cmlnZ2VycyB0aGUgb2xkIGJlaGF2aW9yIGJ1dC4u
Lgo+Pgo+Pj4KPj4+IFNldCBtaW5fZGVwdGggdG8gZGVwdGggb2YgdGhlIGN1cnJlbnQgbm9kZSAr
IDEgdG8gYXZvaWQgc2Nhbm5pbmcKPj4+IHNpYmxpbmdzIG9mIHRoZSBpbml0aWFsIG5vZGUgcGFz
c2VkIGFzIGFuIGFyZ3VtZW50Lgo+Pj4KPj4+IERvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBwYXJl
bnQgbm9kZSBwYXNzZWQgYXMgYW4gYXJndW1lbnQuIENsYXJpZnkgdGhlCj4+PiBjaGFuZ2UgaW4g
dGhlIGNvbW1lbnQgb24gdG9wIG9mIHRoZSBmdW5jdGlvbi4KPj4KPj4gLi4uIGhlcmUgeW91IG1l
bnRpb24gdGhhdCB0aGUgZmlyc3Qgbm9kZSB3aWxsIGJlIHNraXBwZWQuIFNvIHRoZSBiZWhhdmlv
ciBpcwo+PiBub3cgZGlmZmVyZW50IGFuZCBzaG91bGQgYmUgZXhwbGFpbmVkIGluIHRoZSBjb21t
aXQgbWVzc2FnZSB3aHkgdGhpcyBpcyBmaW5lCj4+IHRvIHNraXAgdGhlIHJvb3Qgbm9kZS4KPiAK
PiBZZXMgSSdsbCB1cGRhdGUKPiAKPiAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjY6
Cj4+PiAtIGZpeCBjb2RlIHN0eWxlCj4+PiAtIGRvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBmaXJz
dCBub2RlCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2NToKPj4+IC0gZ28gYmFjayB0byB2Mwo+Pj4gLSBj
b2RlIHN0eWxlIGltcHJvdmVtZW50IGluIGFjcGkvYm9vdC5jCj4+PiAtIGltcHJvdmUgY29tbWVu
dHMgYW5kIGNvbW1pdCBtZXNzYWdlCj4+PiAtIGluY3JlYXNlIG1pbl9kZXB0aCB0byBhdm9pZCBw
YXJzaW5nIHNpYmxpbmdzCj4+PiAtIHJlcGxhY2UgZm9yIHdpdGggZG8vd2hpbGUgbG9vcCBhbmQg
aW5jcmVhc2UgbWluX2RlcHRoIHRvIGF2b2lkCj4+PiAgICAgc2Nhbm5pbmcgc2libGluZ3Mgb2Yg
dGhlIGluaXRpYWwgbm9kZQo+Pj4gLSBwYXNzIG9ubHkgbm9kZSwgY2FsY3VsYXRlIGRlcHRoCj4+
Pgo+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+Pj4gLSBp
bXByb3ZlIGluLWNvZGUgY29tbWVudHMKPj4+IC0gaW1wcm92ZSBjb2RlIHN0eWxlCj4+Pgo+Pj4g
Q2hhbmdlcyBpbiB2MjoKPj4+IC0gbmV3Cj4+PiAtLS0KPj4+ICAgIHhlbi9hcmNoL2FybS9hY3Bp
L2Jvb3QuYyAgICAgIHwgIDggKysrKystLS0KPj4+ICAgIHhlbi9hcmNoL2FybS9ib290ZmR0LmMg
ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+Pj4gICAgeGVu
L2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggfCAgNiArKystLS0KPj4+ICAgIDMgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwo+
Pj4gaW5kZXggOWIyOTc2OWExMC4uYmY5Yzc4YjAyYyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9hY3BpL2Jvb3QuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCj4+PiBA
QCAtMjQ2LDkgKzI0NiwxMSBAQCBpbnQgX19pbml0IGFjcGlfYm9vdF90YWJsZV9pbml0KHZvaWQp
Cj4+PiAgICAgICAgICogLSB0aGUgZGV2aWNlIHRyZWUgaXMgbm90IGVtcHR5IChpdCBoYXMgbW9y
ZSB0aGFuIGp1c3QgYSAvY2hvc2VuCj4+PiBub2RlKQo+Pj4gICAgICAgICAqICAgYW5kIEFDUEkg
aGFzIG5vdCBiZWVuIGZvcmNlIGVuYWJsZWQgKGFjcGk9Zm9yY2UpCj4+PiAgICAgICAgICovCj4+
PiAtICAgIGlmICggcGFyYW1fYWNwaV9vZmYgfHwgKCAhcGFyYW1fYWNwaV9mb3JjZQo+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJiYKPj4+IGRldmljZV90cmVlX2Zvcl9lYWNoX25v
ZGUoZGV2aWNlX3RyZWVfZmxhdHRlbmVkLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGR0X3NjYW5fZGVwdGgxX25vZGVzLAo+Pj4gTlVMTCkp
KQo+Pj4gKyAgICBpZiAoIHBhcmFtX2FjcGlfb2ZmKQo+Pj4gKyAgICAgICAgZ290byBkaXNhYmxl
Owo+Pj4gKyAgICBpZiAoICFwYXJhbV9hY3BpX2ZvcmNlICYmCj4+PiArICAgICAgICAgZGV2aWNl
X3RyZWVfZm9yX2VhY2hfbm9kZShkZXZpY2VfdHJlZV9mbGF0dGVuZWQsIDAsCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdF9zY2FuX2RlcHRoMV9ub2RlcywgTlVMTCkg
KQo+Pj4gICAgICAgICAgICBnb3RvIGRpc2FibGU7Cj4+PiAgICAgICAgICAvKgo+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4+
PiBpbmRleCA4OTFiNGI2NmZmLi5mMTYxNGVmN2ZjIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+Pj4gQEAgLTc1
LDkgKzc1LDEwIEBAIHN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVlX2dldF91MzIoY29uc3Qg
dm9pZCAqZmR0LAo+Pj4gaW50IG5vZGUsCj4+PiAgICB9Cj4+PiAgICAgIC8qKgo+Pj4gLSAqIGRl
dmljZV90cmVlX2Zvcl9lYWNoX25vZGUgLSBpdGVyYXRlIG92ZXIgYWxsIGRldmljZSB0cmVlIG5v
ZGVzCj4+PiArICogZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSAtIGl0ZXJhdGUgb3ZlciBhbGwg
ZGV2aWNlIHRyZWUgc3ViLW5vZGVzCj4+PiAgICAgKiBAZmR0OiBmbGF0IGRldmljZSB0cmVlLgo+
Pj4gLSAqIEBmdW5jOiBmdW5jdGlvbiB0byBjYWxsIGZvciBlYWNoIG5vZGUuCj4+PiArICogQG5v
ZGU6IHBhcmVudCBub2RlIHRvIHN0YXJ0IHRoZSBzZWFyY2ggZnJvbQo+Pj4gKyAqIEBmdW5jOiBm
dW5jdGlvbiB0byBjYWxsIGZvciBlYWNoIHN1Yi1ub2RlLgo+Pj4gICAgICogQGRhdGE6IGRhdGEg
dG8gcGFzcyB0byBAZnVuYy4KPj4+ICAgICAqCj4+PiAgICAgKiBBbnkgbm9kZXMgbmVzdGVkIGF0
IERFVklDRV9UUkVFX01BWF9ERVBUSCBvciBkZWVwZXIgYXJlIGlnbm9yZWQuCj4+PiBAQCAtODUs
MjAgKzg2LDE4IEBAIHN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVlX2dldF91MzIoY29uc3Qg
dm9pZCAqZmR0LAo+Pj4gaW50IG5vZGUsCj4+PiAgICAgKiBSZXR1cm5zIDAgaWYgYWxsIG5vZGVz
IHdlcmUgaXRlcmF0ZWQgb3ZlciBzdWNjZXNzZnVsbHkuICBJZiBAZnVuYwo+Pj4gICAgICogcmV0
dXJucyBhIHZhbHVlIGRpZmZlcmVudCBmcm9tIDAsIHRoYXQgdmFsdWUgaXMgcmV0dXJuZWQgaW1t
ZWRpYXRlbHkuCj4+PiAgICAgKi8KPj4+IC1pbnQgX19pbml0IGRldmljZV90cmVlX2Zvcl9lYWNo
X25vZGUoY29uc3Qgdm9pZCAqZmR0LAo+Pj4gK2ludCBfX2luaXQgZGV2aWNlX3RyZWVfZm9yX2Vh
Y2hfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfZnVuYyBmdW5jLAo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4+PiAgICB7
Cj4+PiAtICAgIGludCBub2RlOwo+Pj4gLSAgICBpbnQgZGVwdGg7Cj4+PiArICAgIGludCBkZXB0
aCA9IGZkdF9ub2RlX2RlcHRoKGZkdCwgbm9kZSk7Cj4+Cj4+IFNvcnJ5IEkgZGlkbid0IHNwb3Qg
dGhpcyBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbi4gQXMgSSBwb2ludGVkIG91dCBvbiB2NCAoYW5k
Cj4+IHlvdSBhY3R1YWxseSBhZ3JlZWQhKSwgeW91IGRvbid0IG5lZWQgdGhlIGFic29sdXRlIGRl
cHRoLi4uCj4+Cj4+IFlvdSBvbmx5IG5lZWQgdGhlIHJlbGF0aXZlIGRlcHRoLiBTbyB0aGlzIGlz
IGEgd2FzdGUgb2YgcHJvY2Vzc2luZyBhcyB5b3UgaGF2ZQo+PiB0byBnbyB0aHJvdWdoIHRoZSBG
RFQgdG8gY2FsY3VsYXRlIHRoZSBkZXB0aC4KPj4KPj4gVGhpcyBpcyBub3QgZW50aXJlbHkgY3Jp
dGljYWwgc28gSSB3b3VsZCBiZSB3aWxsaW5nIHRvIGNvbnNpZGVyIGEgcGF0Y2ggb24gdG9wCj4+
IG9mIHRoaXMgc2VyaWVzLgo+IAo+IEkgdHJpZWQgd2hlbiBJIHNlbnQgdGhpcyB2ZXJzaW9uIG9m
IHRoZSBzZXJpZXMsIGJ1dCBJIGNvdWxkbid0IHF1aXRlIGRvCj4gaXQgdGhhdCB3YXkuIEkgd2Fu
dGVkIHRvIGdldCByaWQgb2YgdGhlIGRlcHRoIHBhcmFtZXRlciB0bwo+IGRldmljZV90cmVlX2Zv
cl9lYWNoX25vZGUsIGFuZCB3ZSBuZWVkIHRvIGtub3cgdGhlIGRlcHRoIG9mIHRoZSBmaXJzdAo+
IG5vZGUgcGFzc2VkIGFzIGFuIGFyZ3VtZW50IHRvIGNvbXBhcmUgaXQgd2l0aCB0aGUgZGVwdGgg
b2YgdGhlIG5leHQgbm9kZQo+IGFuZCBmaWd1cmUgb3V0IGlmIGl0IGlzIGF0IHRoZSBzYW1lIGxl
dmVsIG9yIG9uZSBsZXZlbCBkZWVwZXIuCgpmZHRfbmV4dF9ub2RlKCkgd2lsbCBpbmNyZW1lbnQv
ZGVjcmVtZW50IHdoaWNoZXZlciBkZXB0aCB5b3UgcGFzcyBpbiAKYXJndW1lbnQuCgpTbyBpZiB5
b3UgcGFzcyAwLCB0aGVuIGFueSBjaGlsZCBvZiB0aGUgbm9kZSB3aWxsIGJlIGF0IGRlcHRoIDEu
IEFueSAKbm9kZSBhdCB0aGUgc2FtZSBsZXZlbCBhcyB0aGUgcGFyZW50IG5vZGUgd2lsbCBhbHNv
IGJlIGRlcHRoIDAuLi4KClRoZXJlZm9yZSBpbml0aWFsaXppbmcgZGVwdGggdG8gMCBhbmQgY2hl
Y2tpbmcgaXQgaXMgc3RyaWN0bHkgcG9zaXRpdmUgCihpLmUgZGVwdGggPiAwKSBpcyBlbm91Z2gg
Zm9yIG91ciB1c2UgY2FzZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
