Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300EA17BF7C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:46:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADGn-0005iF-Qm; Fri, 06 Mar 2020 13:44:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADGm-0005i9-9D
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:44:04 +0000
X-Inumbo-ID: 8a04719a-5fb0-11ea-a7d6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a04719a-5fb0-11ea-a7d6-12813bfff9fa;
 Fri, 06 Mar 2020 13:44:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E3D8AD94;
 Fri,  6 Mar 2020 13:44:01 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
Date: Fri, 6 Mar 2020 14:44:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzozNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMDYgTWFy
Y2ggMjAyMCAxMjoyMAo+PiBUbzogcGR1cnJhbnRAYW16bi5jb20KPj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsKPj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IFBhdWwKPj4gRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcAo+PiA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+OyBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyB4ZW4tCj4+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyA1LzZdIG1tOiBhZGQgJ2lzX3NwZWNpYWxfcGFn
ZScgbWFjcm8uLi4KPj4KPj4gT24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20g
d3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+PiArKysg
Yi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+PiBAQCAtMjA4NywxOSArMjA4Nywy
MiBAQCBzdGF0aWMgaW50IHNoX3JlbW92ZV9hbGxfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCwg
bWZuX3QgZ21mbiwgZ2ZuX3QgZ2ZuKQo+Pj4gICAgICAgICAgICogVGhlIHFlbXUgaGVscGVyIHBy
b2Nlc3MgaGFzIGFuIHVudHlwZWQgbWFwcGluZyBvZiB0aGlzIGRvbSdzIFJBTQo+Pj4gICAgICAg
ICAgICogYW5kIHRoZSBIVk0gcmVzdG9yZSBwcm9ncmFtIHRha2VzIGFub3RoZXIuCj4+PiAgICAg
ICAgICAgKiBBbHNvIGFsbG93IG9uZSB0eXBlZCByZWZjb3VudCBmb3IKPj4+IC0gICAgICAgICAq
IC0gWGVuIGhlYXAgcGFnZXMsIHRvIG1hdGNoIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QoKSwK
Pj4+IC0gICAgICAgICAqIC0gaW9yZXEgc2VydmVyIHBhZ2VzLCB0byBtYXRjaCBwcmVwYXJlX3Jp
bmdfZm9yX2hlbHBlcigpLgo+Pj4gKyAgICAgICAgICogLSBzcGVjaWFsIHBhZ2VzLCB3aGljaCBh
cmUgZXhwbGljaXRseSByZWZlcmVuY2VkIGFuZCBtYXBwZWQgYnkKPj4+ICsgICAgICAgICAqICAg
WGVuLgo+Pj4gKyAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFnZXMsIHdoaWNoIG1heSBiZSBz
cGVjaWFsIHBhZ2VzIG9yIG5vcm1hbAo+Pj4gKyAgICAgICAgICogICBndWVzdCBwYWdlcyB3aXRo
IGFuIGV4dHJhIHJlZmVyZW5jZSB0YWtlbiBieQo+Pj4gKyAgICAgICAgICogICBwcmVwYXJlX3Jp
bmdfZm9yX2hlbHBlcigpLgo+Pj4gICAgICAgICAgICovCj4+PiAgICAgICAgICBpZiAoICEoc2hh
ZG93X21vZGVfZXh0ZXJuYWwoZCkKPj4+ICAgICAgICAgICAgICAgICAmJiAocGFnZS0+Y291bnRf
aW5mbyAmIFBHQ19jb3VudF9tYXNrKSA8PSAzCj4+PiAgICAgICAgICAgICAgICAgJiYgKChwYWdl
LT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9jb3VudF9tYXNrKQo+Pj4gLSAgICAgICAgICAgICAg
ICAgICA9PSAoaXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICA9PSAoaXNfc3BlY2lhbF9wYWdlKHBhZ2UpIHx8Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAoaXNfaHZtX2RvbWFpbihkKSAmJiBpc19pb3JlcV9zZXJ2ZXJfcGFnZShkLCBwYWdlKSkpKSkg
KQo+Pgo+PiBTaG91bGRuJ3QgeW91IGRlbGV0ZSBtb3N0IG9mIHRoaXMgbGluZSwgYWZ0ZXIgdGhl
IHByZXZpb3VzIHBhdGNoCj4+IGNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIHRvIFBH
Q19leHRyYSBvbmVzPwo+IAo+IEkgdGhvdWdodCB0aGF0IHRvbyBvcmlnaW5hbGx5IGJ1dCB0aGVu
IEkgcmVhbGlzZSB3ZSBzdGlsbCBoYXZlIHRvCj4gY2F0ZXIgZm9yIHRoZSAnbGVnYWN5JyBlbXVs
YXRvcnMgdGhhdCBzdGlsbCByZXF1aXJlIElPUkVRIHNlcnZlcgo+IHBhZ2VzIHRvIGJlIG1hcHBl
ZCB0aHJvdWdoIHRoZSBwMm0sIGluIHdoaWNoIGNhc2UgdGhleSB3aWxsIG5vdAo+IGJlIFBHQ19l
eHRyYSBwYWdlcy4KCk9oLCBpbmRlZWQuIChJIGRvbid0IHN1cHBvc2Ugd2UgY2FuIGV2ZXIgZG8g
YXdheSB3aXRoIHRoaXMgbGVnYWN5Cm1lY2hhbmlzbT8pCgo+PiBBbHNvIEkgbm90aWNlIHRoaXMg
Y29uc3RydWN0IGlzIHVzZWQgYnkgeDg2IGNvZGUgb25seSAtIGlzIHRoZXJlCj4+IGEgcGFydGlj
dWxhciByZWFzb24gaXQgZG9lc24ndCBnZXQgcGxhY2VkIGluIGFuIHg4NiBoZWFkZXIgKGF0Cj4+
IGxlYXN0IGZvciB0aGUgdGltZSBiZWluZyk/Cj4gCj4gUEdDX2V4dHJhIHBhZ2VzIGFyZSBjb21t
b24gc28gbWF5YmUgaXQgaXMgYmV0dGVyIG9mZiBkZWZpbmVkIGhlcmUKPiBzbyBpdCBpcyBhdmFp
bGFibGUgdG8gQVJNIGNvZGU/CgpUbyBiZSBob25lc3QsIG15IHF1ZXN0aW9uIHdhcyBtYWlubHkg
YmFzZWQgb24gbWUgYmVpbmcgcHV6emxlZCB0aGF0CkFybSAob3IgY29tbW9uKSBjb2RlIGRvZXNu
J3QgbmVlZCBhbnkgc3VjaCBhZGp1c3RtZW50LiBBcyBhIHJlc3VsdApJJ20gd29uZGVyaW5nIHdo
ZXRoZXIgdGhhdCdzIGp1c3QgImx1Y2siIChpbiB3aGljaCBjYXNlIEknZCBhZ3JlZQp0aGUgcGxh
Y2VtZW50IGNvdWxkIHJlbWFpbiBhcyBpcyksIG9yIHdoZXRoZXIgdGhlcmUncyBhIGRlZXBlcgpy
ZWFzb24gYmVoaW5kIHRoYXQsIGxhcmdlbHkgZ3VhcmFudGVlaW5nIEFybSB3b3VsZCBhbHNvIG5l
dmVyIG5lZWQKaXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
