Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDD15A0AA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 06:35:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1kcl-0007Lk-7G; Wed, 12 Feb 2020 05:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1kcj-0007Lf-O4
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 05:31:45 +0000
X-Inumbo-ID: f2bc4ad1-4d58-11ea-b6d6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2bc4ad1-4d58-11ea-b6d6-12813bfff9fa;
 Wed, 12 Feb 2020 05:31:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A52AAC54;
 Wed, 12 Feb 2020 05:31:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200128142818.27200-1-jgross@suse.com>
 <20200128142818.27200-2-jgross@suse.com>
 <6c49ac2f-fb4f-dd40-d916-a8a6f7e6272e@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0922fc5d-9033-30d0-cf14-191a4ab09635@suse.com>
Date: Wed, 12 Feb 2020 06:31:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6c49ac2f-fb4f-dd40-d916-a8a6f7e6272e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] xenstore: setup xenstore stubdom
 console interface properly
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAgMjE6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjgvMDEvMjAyMCAx
NDoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBnZXQg
YWNjZXNzIHRvIHRoZSBjb25zb2xlIG9mIFhlbnN0b3JlIHN0dWJkb20KPj4gd2UgbmVlZCBhbiBh
cHByb3ByaWF0ZSBncmFudHRhYiBlbnRyeS4gU28gY2FsbCB4Y19kb21fZ250dGFiX2luaXQoKQo+
PiB3aGVuIGNvbnN0cnVjdGluZyB0aGUgZG9tYWluIGFuZCBwcmVzZXQgc29tZSBpbmZvcm1hdGlv
biBuZWVkZWQKPj4gZm9yIHRoYXQgZnVuY3Rpb24gaW4gdGhlIGRvbSBzdHJ1Y3R1cmUuCj4+Cj4+
IFdlIG5lZWQgdG8gY3JlYXRlIHRoZSBldmVudCBjaGFubmVsIGZvciB0aGUgY29uc29sZSwgdG9v
LiBEbyB0aGF0IGFuZAo+PiBzdG9yZSBhbGwgbmVjZXNzYXJ5IGRhdGEgbG9jYWxseS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4g
ICB0b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgfCAxMyArKysrKysrKysrKysr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYyBiL3Rvb2xzL2hlbHBlcnMvaW5p
dC14ZW5zdG9yZS1kb21haW4uYwo+PiBpbmRleCBhZGI4NDA4YjYzLi5hMzEyYmMzOGI4IDEwMDY0
NAo+PiAtLS0gYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMKPj4gKysrIGIv
dG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jCj4+IEBAIC0yNCw2ICsyNCw4IEBA
IHN0YXRpYyBjaGFyICpwYXJhbTsKPj4gICBzdGF0aWMgY2hhciAqbmFtZSA9ICJYZW5zdG9yZSI7
Cj4+ICAgc3RhdGljIGludCBtZW1vcnk7Cj4+ICAgc3RhdGljIGludCBtYXhtZW07Cj4+ICtzdGF0
aWMgeGVuX3Bmbl90IGNvbnNvbGVfbWZuOwo+PiArc3RhdGljIHVuc2lnbmVkIGludCBjb25zb2xl
X2V2dGNobjsKPj4gICAKPj4gICBzdGF0aWMgc3RydWN0IG9wdGlvbiBvcHRpb25zW10gPSB7Cj4+
ICAgICAgIHsgImtlcm5lbCIsIDEsIE5VTEwsICdrJyB9LAo+PiBAQCAtMTEzLDYgKzExNSw3IEBA
IHN0YXRpYyBpbnQgYnVpbGQoeGNfaW50ZXJmYWNlICp4Y2gpCj4+ICAgICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgInhjX2RvbWFpbl9zZXRtYXhtZW0gZmFpbGVkXG4iKTsKPj4gICAgICAgICAgIGdv
dG8gZXJyOwo+PiAgICAgICB9Cj4+ICsgICAgY29uc29sZV9ldnRjaG4gPSB4Y19ldnRjaG5fYWxs
b2NfdW5ib3VuZCh4Y2gsIGRvbWlkLCAwKTsKPiAKPiBQcmVzdW1hYmx5IHNvbWUgZm9ybSBvZiBl
cnJvciBjaGVja2luZz8KClllcy4KCj4gCj4gQWxzbywgd2hpbGUgaXQgaXMgcHJvYmFibHkgZmlu
ZSBmb3Igbm93LCBJIHRoaW5rIHRoaXMgZG9lcyBoaWdobGlnaHQgYQo+IGZ1dHVyZSBpc3N1ZS7C
oCBXaGF0IGhhcHBlbnMgd2hlbiB4ZW5jb25zb2xlZCBpcyBhbHNvIGEgc3R1YmRvbWFpbj8KPiAK
PiBJIHN1c3BlY3Qgd2UgaGF2ZSBhIGxvb21pbmcgY2hpY2tlbiZlZ2cgcHJvYmxlbSwgd2hlcmUg
dGhlIHRvb2xzdGFjayBpcwo+IGdvaW5nIHRvIGhhdmUgdG8gZG8gc29tZSBjYXJlZnVsIGRvbWlk
IGFuZCBwbHVtYmluZyB0byBzZXQgdXAgYnVpbGQgYm90aAo+IHN0dWJkb21zIGluIHRhbmRlbS4K
CkhtbSwgSSdkIHJhdGhlciBkZWZlciBjb25zb2xlIHNldHVwIGluIHhlbnN0b3JlLXN0dWJkb20g
dGhlbiBhbmQgZG8gaXQKbGF0ZXIgdmlhIGEgWFNfQ09OVFJPTCBtZXNzYWdlLiBUaGlzIHdpbGwg
ZXZlbiBlbmFibGUgYSByZXN0YXJ0IG9mCmNvbnNvbGUtc3R1YmRvbS4KCj4gCj4+ICAgICAgIHJ2
ID0geGNfZG9tYWluX3NldF9tZW1tYXBfbGltaXQoeGNoLCBkb21pZCwgbGltaXRfa2IpOwo+PiAg
ICAgICBpZiAoIHJ2ICkKPj4gICAgICAgewo+PiBAQCAtMTMzLDYgKzEzNiw5IEBAIHN0YXRpYyBp
bnQgYnVpbGQoeGNfaW50ZXJmYWNlICp4Y2gpCj4+ICAgICAgICAgICBzbnByaW50ZihjbWRsaW5l
LCA1MTIsICItLWV2ZW50ICVkIC0taW50ZXJuYWwtZGIiLCBydik7Cj4+ICAgCj4+ICAgICAgIGRv
bSA9IHhjX2RvbV9hbGxvY2F0ZSh4Y2gsIGNtZGxpbmUsIE5VTEwpOwo+IAo+IEFueSBjaGFuY2Ug
b2Ygc29tZSBlcnJvciBoYW5kbGluZywgdW5saWtlbHkgYXMgaXQgaXMgdG8gZ28gd3Jvbmc/CgpP
a2F5LgoKPiAKPj4gKyAgICBkb20tPmNvbnRhaW5lcl90eXBlID0gWENfRE9NX1BWX0NPTlRBSU5F
UjsKPj4gKyAgICBkb20tPnhlbnN0b3JlX2RvbWlkID0gZG9taWQ7Cj4+ICsgICAgZG9tLT5jb25z
b2xlX2V2dGNobiA9IGNvbnNvbGVfZXZ0Y2huOwo+IAo+IGFuZCBhIG5ld2xpbmUgaGVyZT8KCk9r
YXkuCgo+IAo+PiAgICAgICBydiA9IHhjX2RvbV9rZXJuZWxfZmlsZShkb20sIGtlcm5lbCk7Cj4+
ICAgICAgIGlmICggcnYgKQo+PiAgICAgICB7Cj4+IEBAIC0xODYsNiArMTkyLDEyIEBAIHN0YXRp
YyBpbnQgYnVpbGQoeGNfaW50ZXJmYWNlICp4Y2gpCj4+ICAgICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgInhjX2RvbV9ib290X2ltYWdlIGZhaWxlZFxuIik7Cj4+ICAgICAgICAgICBnb3RvIGVycjsK
Pj4gICAgICAgfQo+PiArICAgIHJ2ID0geGNfZG9tX2dudHRhYl9pbml0KGRvbSk7Cj4+ICsgICAg
aWYgKCBydiApCj4+ICsgICAgewo+PiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgInhjX2RvbV9n
bnR0YWJfaW5pdCBmYWlsZWRcbiIpOwo+PiArICAgICAgICBnb3RvIGVycjsKPj4gKyAgICB9Cj4+
ICAgCj4+ICAgICAgIHJ2ID0geGNfZG9tYWluX3NldF92aXJxX2hhbmRsZXIoeGNoLCBkb21pZCwg
VklSUV9ET01fRVhDKTsKPj4gICAgICAgaWYgKCBydiApCj4+IEBAIC0yMDEsNiArMjEzLDcgQEAg
c3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkKPj4gICAgICAgfQo+PiAgIAo+PiAg
ICAgICBydiA9IDA7Cj4+ICsgICAgY29uc29sZV9tZm4gPSB4Y19kb21fcDJtKGRvbSwgZG9tLT5j
b25zb2xlX3Bmbik7Cj4gCj4gVGhpcyBkb2Vzbid0IGFwcGVhciB0byBiZSB1c2VkLgoKT2gsIHRo
ZSB1c2FnZSBpcyBpbiBwYXRjaCAyLiBQcm9iYWJseSBJIHNob3VsZCBtb3ZlIHRoaXMgYWRkaXRp
b24gdG8KdGhhdCBwYXRjaCB0aGVuLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
