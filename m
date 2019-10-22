Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE9E068A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 16:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMvCY-0000uJ-29; Tue, 22 Oct 2019 14:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jyZJ=YP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMvCW-0000tV-0x
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 14:31:56 +0000
X-Inumbo-ID: b0d01498-f4d8-11e9-9469-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0d01498-f4d8-11e9-9469-12813bfff9fa;
 Tue, 22 Oct 2019 14:31:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D71DAE16;
 Tue, 22 Oct 2019 14:31:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
 <20191022105240.GN17494@Air-de-Roger>
 <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
 <20191022112557.GO17494@Air-de-Roger>
 <e57f109a-d189-432f-5b06-bbfb3cf0d22a@suse.com>
 <20191022135001.GP17494@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <69b4787d-dd95-0438-c26b-61d64c70a0ed@suse.com>
Date: Tue, 22 Oct 2019 16:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022135001.GP17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTAuMTkgMTU6NTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjIsIDIwMTkgYXQgMDE6NTA6NDRQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MjIuMTAuMTkgMTM6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUdWUsIE9jdCAy
MiwgMjAxOSBhdCAwMTowMTowOVBNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9u
IDIyLjEwLjE5IDEyOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBUdWUsIE9j
dCAyMiwgMjAxOSBhdCAxMToyNzo0MUFNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+
Pj4gU2luY2UgY29tbWl0IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUoKSBz
ZWxlY3QgcHJvY2Vzc29yIikKPj4+Pj4+IHRoZSBpbml0aWFsIHByb2Nlc3NvciBmb3IgYWxsIHB2
LXNoaW0gdmNwdXMgd2lsbCBiZSAwLCBhcyBubyBvdGhlciBjcHVzCj4+Pj4+PiBhcmUgb25saW5l
IHdoZW4gdGhlIHZjcHVzIGFyZSBjcmVhdGVkLiBCZWZvcmUgdGhhdCBjb21taXQgdGhlIHZjcHVz
Cj4+Pj4+PiB3b3VsZCBoYXZlIHByb2Nlc3NvcnMgc2V0IG5vdCBiZWluZyBvbmxpbmUgeWV0LCB3
aGljaCB3b3JrZWQganVzdCBieQo+Pj4+Pj4gY2hhbmNlLgo+Pj4KPj4+IFNvIGFsbCB2Q1BVcyBm
b3IgdGhlIHNoaW0gaGF2ZSB0aGVpciBoYXJkIGFmZmluaXR5IHNldCB0byBwQ1BVIzAgaWYgSQo+
Pgo+PiBObywgdGhlIGhhcmQgYWZmaW5pdHkgaXMgc2V0IHRvIHBjcHUjKHZjcHUtaWQpLCBidXQg
dGhlIGluaXRpYWwgY3B1IHRvCj4+IHJ1biBvbiBpcyBwY3B1IzAgYXMgbm8gb3RoZXIgY3B1IGlz
IG9ubGluZSB3aGVuIHRoZSB2Y3B1cyBhcmUgYmVpbmcKPj4gY3JlYXRlZCwgYW5kIHYtPnByb2Nl
c3NvciBzaG91bGQgYWx3YXlzIGJlIGEgdmFsaWQgb25saW5lIGNwdS4KPiAKPiBPaCwgSSBkaWRu
J3Qga25vdyB2LT5wcm9jZXNzb3IgbXVzdCBhbHdheXMgYmUgdmFsaWQsIGV2ZW4gZm9yIG9mZmxp
bmUKPiB2Q1BVcy4gSSdtIHF1aXRlIHN1cmUgdGhlIHNoaW0gcHJldmlvdXNseSBzZXQgdi0+cHJv
Y2Vzc29yIHRvIHBDUFVzCj4gdGhhdCB3aGVyZSBub3QgeWV0IG9ubGluZS4KClllcywgdGhhdCdz
IHRoZSByZWFzb24gSSB3cm90ZSBpdCB3YXMgd29ya2luZyBqdXN0IGJ5IGNoYW5jZS4KCj4+PiB1
bmRlcnN0YW5kIGl0IGNvcnJlY3RseS4gRnJvbSBteSByZWFkaW5nIG9mIHNjaGVkX3NldHVwX2Rv
bTBfdmNwdXMgaXQKPj4+IHNlZW1zIGxpa2UgaW4gdGhlIHNoaW0gY2FzZSBhbGwgc2NoZWQgdW5p
dHMgYXJlIHBpbm5lZCB0byB0aGVpciBpZCwKPj4+IHdoaWNoIHdvdWxkIGltcGx5IHNjaGVkIHVu
aXRzICE9IDAgYXJlIG5vdCBwaW5uZWQgdG8gQ1BVIzA/Cj4+Cj4+IFJpZ2h0Lgo+Pgo+Pj4KPj4+
IE9yIG1heWJlIHRoZXJlJ3Mgb25seSBvbmUgc2NoZWQgdW5pdCB0aGF0IGNvbnRhaW5zIGFsbCB0
aGUgc2hpbSB2Q1BVcz8KPj4KPj4gTm8uCj4+Cj4+Pgo+Pj4+Pj4gV2hlbiB0aGUgcHYtc2hpbSB2
Y3B1IGJlY29tZXMgYWN0aXZlIGl0IHdpbGwgaGF2ZSBhIGhhcmQgYWZmaW5pdHkKPj4+Pj4+IG5v
dCBtYXRjaGluZyBpdHMgaW5pdGlhbCBwcm9jZXNzb3IgYXNzaWdubWVudCBsZWFkaW5nIHRvIGZh
aWxpbmcKPj4+Pj4+IEFTU0VSVCgpcyBvciBvdGhlciBwcm9ibGVtcyBkZXBlbmRpbmcgb24gdGhl
IHNlbGVjdGVkIHNjaGVkdWxlci4KPj4+Pj4KPj4+Pj4gSSdtIHNsaWdodGx5IGxvc3QgaGVyZSwg
d2hvIGhhcyBzZXQgdGhpcyBoYXJkIGFmZmluaXR5IG9uIHRoZSBwdnNoaW0KPj4+Pj4gdkNQVXM/
Cj4+Pj4KPj4+PiBUaGF0IGlzIGRvbmUgaW4gc2NoZWRfc2V0dXBfZG9tMF92Y3B1cygpLgo+Pj4+
Cj4+Pj4+Cj4+Pj4+PiBGaXggdGhhdCBieSByZWRvaW5nIHRoZSBhZmZpbml0eSBzZXR0aW5nIGFm
dGVyIG9ubGluaW5nIHRoZSBjcHUgYnV0Cj4+Pj4+PiBiZWZvcmUgdGFraW5nIHRoZSB2Y3B1IHVw
Lgo+Pj4+Pgo+Pj4+PiBUaGUgY2hhbmdlIHNlZW1zIGZpbmUgdG8gbWUsIGJ1dCBJIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHRoZSBsYWNrIG9mCj4+Pj4+IHRoaXMgY2FuIGNhdXNlIGFzc2VydHMgdG8g
dHJpZ2dlciwgYXMgcmVwb3J0ZWQgYnkgU2VyZ2V5LiBJIGFsc28KPj4+Pj4gd29uZGVyIHdoeSBh
IGNoYW5nZSB0byBwaW4gdkNQVSMwIHRvIHBDUFUjMCBpcyBub3QgcmVxdWlyZWQsIGJlY2F1c2UK
Pj4+Pj4gcHZfc2hpbV9jcHVfdXAgaXMgb25seSB1c2VkIGZvciBBUHMuCj4+Pj4KPj4+PiBXaGVu
IHZjcHUgMCBpcyBiZWluZyBjcmVhdGVkIHBjcHUgMCBpcyBvbmxpbmUgYWxyZWFkeS4gU28gdGhl
IGFmZmluaXR5Cj4+Pj4gc2V0IGluIHNjaGVkX3NldHVwX2RvbTBfdmNwdXMoKSBpcyBmaW5lIGlu
IHRoYXQgY2FzZS4KPj4+Cj4+PiBJSVJDIGFsbCBzaGltIHZDUFVzIHdoZXJlIHBpbm5lZCB0byB0
aGVpciBpZGVudGl0eSBwQ1BVIGF0IGNyZWF0aW9uLCBhbmQKPj4+IHRoZXJlIHdhcyBubyBuZWVk
IHRvIGRvIHRoaXMgcGluaW5nIHdoZW4gdGhlIHZDUFUgaXMgYnJvdWdodCBvbmxpbmUuIEkKPj4+
IGd1ZXNzIHRoaXMgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlLgo+Pgo+PiBUaGUgcHJvYmxlbSBpcyBu
b3QgdGhlIHBpbm5pbmcsIGJ1dCB0aGUgaW5pdGlhbCBjcHUgc3RvcmVkIGluCj4+IHYtPnByb2Nl
c3Nvci4gVGhpcyByZXN1bHRzIGluIHYtPnByb2Nlc3NvciBub3QgYmVpbmcgc2V0IGluIHRoZSBo
YXJkCj4+IGFmZmluaXR5IG1hc2sgb2YgdGhlIHZjcHUgKG9yIGJldHRlcjogdW5pdCkgd2hpY2gg
dGhlbiB0cmlnZ2VycyB0aGUKPj4gcHJvYmxlbXMuCj4gCj4gSSBndWVzcyBqdXN0IHNldHRpbmcg
di0+cHJvY2Vzc29yIGluIHB2X3NoaW1fY3B1X3VwIGRpcmVjdGx5IHdvdWxkIGJlCj4gdG9vIGlu
dHJ1c2l2ZT8KCkRvaW5nIHRoYXQgYmVoaW5kIHRoZSBzY2hlZHVsZXIncyBiYWNrIGlzIGFza2lu
ZyBmb3IgdHJvdWJsZS4KCj4gSW4gYW55IGNhc2UsIGl0IHNlZW1zIGRhbmdlcm91cyB0byBhbGxv
dyB2Q1BVcyAoZXZlbiB3aGVuIG9mZmxpbmUpIHRvCj4gYmUgaW4gYSBzdGF0ZSB0aGF0IHdoZW4g
d29rZW4gdXAgd2lsbCBjYXVzZSBhc3NlcnRpb25zIGluc2lkZSB0aGUKPiBzY2hlZHVsaW5nIGxv
Z2ljLiBJZTogaXQgd291bGQgYmUgYmVzdCBJTU8gdG8gbm90IHNldCB0aGUgaGFyZAo+IGFmZmlu
aXR5IGluIHNjaGVkX3NldHVwX2RvbTBfdmNwdXMgYW5kIGluc3RlYWQgc2V0IGl0IHdoZW4gdGhl
IHBDUFUgaXMKPiBicm91Z2h0IG9ubGluZSwgb3IgbWF5YmUgaGF2ZSB2Y3B1X3dha2Ugc2VsZWN0
IGEgc3VpdGFibGUgdi0+cHJvY2Vzc29yCj4gdmFsdWU/CgpZZXMsIG1heWJlIHdlIHNob3VsZCBy
ZW1vdmUgdGhlIGFmZmluaXR5IHNldHRpbmcgZm9yIGFsbCBidXQgdmNwdTAgZnJvbQpzY2hlZF9z
ZXR1cF9kb20wX3ZjcHVzKCkuCgpJbiBjYXNlIFNlcmdleSBjYW4gY29uZmlybSB0aGUgY3VycmVu
dCBwYXRjaCBpcyB3b3JraW5nIEkgY2FuIHJlc2VuZCBpdAp3aXRoIHRoZSBhZmZpbml0eSBzZXR0
aW5nIHJlbW92ZWQgaW4gc2NoZWRfc2V0dXBfZG9tMF92Y3B1cygpLgoKQWxsIG90aGVyIGNhc2Vz
IHNob3VsZCBiZSBmaW5lIGFscmVhZHksIHNvIG5vIG5lZWQgdG8gdHdlYWsgdmNwdV93YWtlKCku
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
