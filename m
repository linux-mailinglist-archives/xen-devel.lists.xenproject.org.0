Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB2151A02
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywWs-0004rz-6f; Tue, 04 Feb 2020 11:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4ZTP=3Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iywWq-0004rS-Qj
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:38:04 +0000
X-Inumbo-ID: cde17ed4-4742-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde17ed4-4742-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 11:38:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1DA65AE71;
 Tue,  4 Feb 2020 11:38:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-5-jgross@suse.com>
 <05b9770e-1554-1f71-3757-4feb9c1fa247@suse.com>
 <d258dd8e-cd89-140e-4bf1-d0001f3eb32b@suse.com>
 <2ecc4058-a350-d67b-f860-0b2bf26ee5ca@suse.com>
 <e6235120-1c40-efcb-887e-4581ed374d56@suse.com>
 <7676bff8-dd0d-c9fa-2666-c362ed7c1e3e@suse.com>
 <2e414b42-83f3-0496-8449-baae286683cc@suse.com>
 <09f068f7-52e3-0f5e-7325-8d902d3efec0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cd66e3ac-f02d-0462-3955-c68377810a52@suse.com>
Date: Tue, 4 Feb 2020 12:38:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <09f068f7-52e3-0f5e-7325-8d902d3efec0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/9] xen: add basic hypervisor filesystem
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAgMTI6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjAyLjIwMjAgMTE6
NDgsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA0LjAyLjIwIDEwOjU4LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjAyLjIwMjAgMTA6MjEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDQuMDIuMjAgMDk6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4wMi4y
MDIwIDA3OjQzLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDMuMDIuMjAgMTY6MDcs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDIxLjAxLjIwMjAgMDk6NDMsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+ICtzdHJ1Y3QgeGVuX2h5cGZzX2RpcmVudHJ5IHsKPj4+Pj4+
Pj4gKyAgICB1aW50MTZfdCBmbGFnczsKPj4+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX1dSSVRF
QUJMRSAgICAweDAwMDEKPj4+Pj4+Pj4gKyAgICB1aW50OF90IHR5cGU7Cj4+Pj4+Pj4+ICsjZGVm
aW5lIFhFTl9IWVBGU19UWVBFX0RJUiAgICAgMHgwMDAwCj4+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9I
WVBGU19UWVBFX0JMT0IgICAgMHgwMDAxCj4+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBF
X1NUUklORyAgMHgwMDAyCj4+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX1VJTlQgICAg
MHgwMDAzCj4+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX0lOVCAgICAgMHgwMDA0Cj4+
Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX0JPT0wgICAgMHgwMDA1Cj4+Pj4+Pj4+ICsg
ICAgdWludDhfdCBlbmNvZGluZzsKPj4+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX0VOQ19QTEFJ
TiAgICAweDAwMDAKPj4+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX0VOQ19HWklQICAgICAweDAw
MDEKPj4+Pj4+Pgo+Pj4+Pj4+IE1lYW5pbmcgSSBjYW4gZS5nLiBoYXZlIGEgZ3ppcC1lZCBzdHJp
bmcgb3IgYm9vbCAob3IgZXZlbiBkaXIpPwo+Pj4+Pj4+IElmIHRoaXMgaXMganVzdCBmb3IgImJs
b2IiLCB3aHkgaGF2ZSBzZXBhcmF0ZSBmaWVsZHMgaW5zdGVhZCBvZgo+Pj4+Pj4+IGUuZy4gQkxP
Ql9SQVcgYW5kIEJMT0JfR1pJUCBvciBzb21lIHN1Y2g/Cj4+Pj4+Pgo+Pj4+Pj4gZ3ppcC1lZCBz
dHJpbmcgb3IgYmxvYiBhcmUgdGhlIHByaW1hcnkgdGFyZ2V0cy4KPj4+Pj4+Cj4+Pj4+PiBNYXli
ZSB3ZSB3YW50IHRvIGhhdmUgb3RoZXIgZW5jb2RpbmcgcyBsYXRlciAoQW5kcmV3IGFza2VkIGZv
ciB0aGF0Cj4+Pj4+PiBwb3NzaWJpbGl0eSB3aGVuIEkgcG9zdGVkIHRoZSBwYXRjaCBmb3IgcmV0
cmlldmluZyB0aGUgLmNvbmZpZyBmaWxlCj4+Pj4+PiBjb250ZW50cyBlYXJseSBsYXN0IHllYXIp
Lgo+Pj4+Pgo+Pj4+PiBUbyBtZSBpdCB3b3VsZCBzZWVtIHByZWZlcmFibGUgaWYgdGhlIGNvbnRl
bnRzIG9mIGEgYmxvYgo+Pj4+PiBpZGVudGlmaWVkIGl0c2VsZiBhcyB0byBpdHMgZm9ybWF0LiBC
dXQgc2luY2UgdGhpcyBsZWF2ZXMKPj4+Pj4gcm9vbSBmb3IgYW1iaWd1aXRpZXMgSSBhY2NlcHQg
dGhhdCB0aGUgZm9ybWF0IG5lZWRzCj4+Pj4+IHNwZWNpZnlpbmcuIEhvd2V2ZXIsIHRvIG1lIGEg
Z3ppcC1lZCBzdHJpbmcgaXMgYXMgZ29vZCBhcyBhCj4+Pj4+IGd6aXAtZWQgYmxvYiwgYW5kIGhl
bmNlIEkgc3RpbGwgdGhpbmsgc3ViLWRpdmlkaW5nICJibG9iIiBpcwo+Pj4+PiB0aGUgd2F5IHRv
IGdvLCB3aXRoIG5vIHNlcGFyYXRlICJlbmNvZGluZyIuIE90aGVyd2lzZSBhdCB0aGUKPj4+Pj4g
dmVyeSBsZWFzdCBhIGNvbW1lbnQgaGVyZSB3b3VsZCBuZWVkIGFkZGluZyB0byBjbGFyaWZ5IHdo
YXQKPj4+Pj4gY29tYmluYXRpb25zIGFyZSB2YWxpZCAvIHRvIGJlIGV4cGVjdGVkIGJ5IGNhbGxl
cnMuCj4+Pj4KPj4+PiBsaWJ4ZW5oeXBmcyBpcyBhYmxlIHRvIGhhbmRsZSBhbGwgcG9zc2libGUg
Y29tYmluYXRpb25zLiBJIGp1c3QgZG9uJ3QKPj4+PiB0aGluayBzb21lIG9mIHRoZSBjb21iaW5h
dGlvbnMgYXJlIG1ha2luZyBzZW5zZSAoZ3ppcC1pbmcgYSBiaW5hcnkKPj4+PiB2YWx1ZSBvZiA0
IGJ5dGVzIGUuZy4gaXMgbm9uc2Vuc2UpLgo+Pj4+Cj4+Pj4gT1RPSCBpbiBjYXNlIHdlJ2xsIGFk
ZCBsYXJnZSBhcnJheXMgb2YgbG9uZ3MgaW4gdGhlIGZ1dHVyZSBpdCBtaWdodCBiZQo+Pj4+IGJl
bmVmaWNpYWwgdG8gY29tcHJlc3MgdGhlbSBpbiBzb21lIHdheS4gU28gSSdkIGxpa2UgdG8ga2Vl
cCB0eXBlIGFuZAo+Pj4+IGVuY29kaW5nIGFzIHNlcGFyYXRlIGluZm9ybWF0aW9uLgo+Pj4KPj4+
IE9rYXksIEknbSBub3QgZW50aXJlbHkgb3Bwb3NlZC4gQnV0IEknZCBiZSBjdXJpb3VzIGlmIGFu
eW9uZQo+Pj4gZWxzZSBoYXMgYW4gb3BpbmlvbiBoZXJlLgo+Pgo+PiBJIHRoaW5rIGNvbnRlbnQg
dHlwZSBhbmQgdHJhbnNwb3J0IGVuY29kaW5nIHNob3VsZCBub3QgYmUgbWl4ZWQgdXAuIFRoZXkK
Pj4gYXJlIG9ydGhvZ29uYWwgdG8gZWFjaCBvdGhlciBhbmQgc28gdGhleSBzaG91bGQgYmUgaGFu
ZGxlZC4KPiAKPiBJbiBwcmluY2lwbGUgSSBhZ3JlZSwgYnV0ICJibG9iIiByZWFsbHkgY292ZXJz
IGFueXRoaW5nIG9yIG5vdGhpbmcKPiBhdCBhbGwuIFllcywgaWYgc3RyaW5ncyBhcmUgbWVhbnQg
dG8gYmUgcG9zc2libGUgdG8gYmUgZ3ppcC1lZCwKPiB0aGVuIHRoZXJlIGlzIHZhbHVlIGluIHRo
ZSBzZXBhcmF0aW9uLiBJJ20gbm90IGZ1bGx5IGNvbnZpbmNlZAo+IHRob3VnaCB0aGF0IHN1Y2gg
Y29tcHJlc3NlZCBzdHJpbmdzIChBcmUgeW91IHRoaW5raW5nIGFib3V0Cj4gLmNvbmZpZyBoZXJl
Pykgc2hvdWxkbid0IHNpbXBseSBiZSAiYmxvYiIgdGhlbiwgdG9vLgoKV2l0aCBhIGxpYnJhcnkg
b24gdG9wIG9mIHRoZSBoeXBlcmNhbGwgaXQgaXMgZWFzeSB0byBoaWRlIHRoZSBlbmNvZGluZwpm
cm9tIHRoZSBzdGFuZGFyZCB1c2VyLiBTbyBldmVuIHdpdGggLmNvbmZpZyBiZWluZyBoZWxkIGlu
IGd6aXAtZWQKZm9ybWF0IGluIHRoZSBoeXBlcnZpc29yIHRoZSB4ZW5oeXBmcyB0b29sIHdpbGwg
c3RpbGwganVzdCBwcmludCB0aGUKdGV4dHVhbCBmb3JtIG9mIGl0IHdoZW4gcmVhZGluZyB0aGUg
YXNzb2NpYXRlZCBub2RlLiBUaGlzIGlzIGRpZmZlcmVudApmcm9tIHN5c2ZzIG9yIHByb2NmcyBv
ZiB0aGUgTGludXgga2VybmVsLCB3aGVyZSB0aGUgcmF3IGRhdGEgaXMKcHJlc2VudGVkIGF0IHRo
ZSBwcmltYXJ5IHVzZXIgaW50ZXJmYWNlLiBBZGRpdGlvbmFsbHkgdGhpcyBlbmFibGVzIHVzCnRv
IGF2b2lkIGhhdmluZyB0byBzcGVjaWZ5IHRoZSBjb21wcmVzc2lvbiBmb3JtYXQgYXMgYSBzdGFi
bGUgQUJJLiBXZQpjb3VsZCBhdCBhbnkgdGltZSBzd2l0Y2ggdG8gdW5jb21wcmVzc2VkIGZvcm1h
dCB3aXRob3V0IHByb2JsZW0uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
