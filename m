Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CABBCAE9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmRV-0004hs-HD; Tue, 24 Sep 2019 15:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCmRT-0004hl-SH
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:09:27 +0000
X-Inumbo-ID: 4c481cc2-dedd-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4c481cc2-dedd-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 15:09:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB65DAC93;
 Tue, 24 Sep 2019 15:09:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
Date: Tue, 24 Sep 2019 17:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTc6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTY6
NDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIzLjA5LjE5IDE3OjQxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTE4NTEsNyArMTg1Miw3IEBAIHZvaWQgc2NoZWRfY29udGV4dF9zd2l0Y2hlZChzdHJ1
Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCkKPj4+PiAgICAgICAgICAgICAgICB3
aGlsZSAoIGF0b21pY19yZWFkKCZuZXh0LT5yZW5kZXp2b3VzX291dF9jbnQpICkKPj4+PiAgICAg
ICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4+Pj4gICAgICAgIH0KPj4+PiAtICAgIGVsc2Ug
aWYgKCB2cHJldiAhPSB2bmV4dCApCj4+Pj4gKyAgICBlbHNlIGlmICggdnByZXYgIT0gdm5leHQg
JiYgc2NoZWRfZ3JhbnVsYXJpdHkgPT0gMSApCj4+Pj4gICAgICAgICAgICBjb250ZXh0X3NhdmVk
KHZwcmV2KTsKPj4+PiAgICB9Cj4+Pgo+Pj4gV291bGQgeW91IG1pbmQgaGVscGluZyBtZSB3aXRo
IHVuZGVyc3RhbmRpbmcgd2h5IHRoaXMgY2FsbCBpcwo+Pj4gbmVlZGVkIHdpdGggYSBncmFudWxh
cml0eSBvZiAxIG9ubHk/Cj4+Cj4+IE90aGVyd2lzZSBpdCBpcyBkb25lIGp1c3QgYSBmZXcgbGlu
ZXMgdXAgKGdyYW51bGFyaXR5IDEgd2lsbCByZXN1bHQKPj4gaW4gcmVuZGV6dm91c19vdXRfY250
IGJlaW5nIHplcm8pLgo+IAo+IEkuZS4gaWYgaXMgcmVuZGV6dm91c19vdXRfY250IGlzIHplcm8g
YW5kIHZwcmV2ICE9IHZuZXh0IGJ1dAo+IHNjaGVkX2dyYW51bGFyaXR5ID4gMSB0aGUgY2FsbCBp
c24ndCBuZWVkZWQ/IFdoeT8gQXQgdGhlIGVuZCBvZgoKSSBjYW4gYWRkIGFuIEFTU0VSVCgpIGhl
cmUuIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbi4KCj4gdGhlIHNlcmllcyB2Y3B1X2NvbnRleHRf
c2F2ZWQoKSBnZXRzIGNhbGxlZCBpbiBhbGwgY2FzZXM7IHdoYXQncwo+IGNvbmRpdGlvbmFsIHVw
b24gZ3JhbnVsYXJpdHkgYmVpbmcgMSB0aGVyZSBpcyB0aGUgY2FsbCB0bwo+IHVuaXRfY29udGV4
dF9zYXZlZCgpLgoKdmNwdV9jb250ZXh0X3NhdmVkKCkgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVz
IGlzIHRlc3RpbmcgdnByZXYgIT0gdm5leHQuCgo+IAo+Pj4+ICsgICAgaWYgKCBpc19pZGxlX3Vu
aXQodW5pdCkgKQo+Pj4+ICsgICAgICAgIHJldHVybiB0cnVlOwo+Pj4+ICsKPj4+PiArICAgIGZv
cl9lYWNoX3NjaGVkX3VuaXRfdmNwdSAoIHVuaXQsIHYgKQo+Pj4+ICsgICAgICAgIGlmICggdmNw
dV9ydW5uYWJsZSh2KSApCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiB0cnVlOwo+Pj4KPj4+IElz
bid0IHRoZSBsb29wIGdvaW5nIHRvIHlpZWxkIHRydWUgYW55d2F5IGZvciBpZGxlIHVuaXRzPyBJ
ZiBzbywgaXMKPj4+IHRoZXJlIGEgcGFydGljdWxhciByZWFzb24gZm9yIHRoZSBzcGVjaWFsIGNh
c2luZyBvZiBpZGxlIHVuaXRzIHVwCj4+PiBmcm9udCBoZXJlPwo+Pgo+PiBEaWRuJ3QgSSBleHBs
YWluIHRoYXQgYmVmb3JlPwo+IAo+IFF1aXRlIHBvc3NpYmxlOyBhIGdvb2QgaGludCB0aGF0IGEg
Y29kZSBjb21tZW50IHdvdWxkbid0IGh1cnQuCgpPa2F5LgoKPiAKPj4gZm9yX2VhY2hfc2NoZWRf
dW5pdF92Y3B1KCkgZm9yIGFuIGlkbGUKPj4gdW5pdCBtaWdodCBlbmQgcHJlbWF0dXJlIHdoZW4g
b25lIG9mIHRoZSB2Y3B1cyBpcyBydW5uaW5nIGluIGFub3RoZXIKPj4gdW5pdCAoaWRsZV92Y3B1
LT5zY2hlZF91bml0ICE9IGlkbGVfdW5pdCkuCj4gCj4gT2gsIHRoYXQgKHYpLT5zY2hlZF91bml0
ID09IChpKSBpbiB0aGUgY29uc3RydWN0IGlzIGNsZWFybHkgdW5leHBlY3RlZC4KPiBJcyB0aGlz
IHJlYWxseSBzdGlsbCBuZWVkZWQgYnkgdGhlIGVuZCBvZiB0aGUgc2VyaWVzPyBJIHJlYWxpemUg
dGhhdAo+IF9zb21lXyBjaGVjayBpcyBuZWVkZWQsIGJ1dCBjb3VsZCB0aGlzIHBlcmhhcHMgYmUg
YXJyYW5nZWQgaW4gYSB3YXkKPiB0aGF0IHlvdSdkIHN0aWxsIGhpdCBhbGwgdkNQVS1zIHdoZW4g
dXNpbmcgaXQgb24gYW4gaWRsZSB1bml0LCBubwo+IG1hdHRlciB3aGV0aGVyIHRoZXkncmUgaW4g
dXNlIGFzIGEgc3Vic3RpdHV0ZSBpbiBhICJyZWFsIiB1bml0PwoKSSBjb3VsZCBkbyB0aGF0IGJ5
IGhhdmluZyBhbm90aGVyIGxpbmtlZCBsaXN0IGluIHN0cnVjdCB2Y3B1LiBUaGlzIHdheQpJIGNh
biBhdm9pZCBpdC4KCj4gQXMgdG8gdGhhdCBjb25zdHJ1Y3QgLSB3aHkgaXMgdGhlIHBhcmFtZXRl
ciBuYW1lZCAiaSIgcmF0aGVyIHRoYW4gInUiPwo+IEFuZCB3aHkgImUiIGluIGZvcl9lYWNoX3Nj
aGVkX3VuaXQoKT8KCiJpIiBsaWtlICJpdGVtIiAoc29tZWhvdyB0aGlzIHN1cnZpdmVkIHRoZSBi
aWcgcmVuYW1lKS4gQ2FuIGNoYW5nZSBpdC4KImUiIGxpa2UgImVsZW1lbnQiLiBJIHRoaW5rIHRo
aXMgaXMgYW5vdGhlciByZWxpYy4gQ2FuIGNoYW5nZSBpdCwgdG9vLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
