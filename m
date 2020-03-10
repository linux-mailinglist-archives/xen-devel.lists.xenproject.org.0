Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F027B17FF83
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:50:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBfEY-0005It-15; Tue, 10 Mar 2020 13:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBfEW-0005Ig-KB
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:47:44 +0000
X-Inumbo-ID: b7797580-62d5-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7797580-62d5-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 13:47:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6640AAC22;
 Tue, 10 Mar 2020 13:47:42 +0000 (UTC)
To: paul@xen.org
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <d1c4f00d-3bcd-b6f1-cd4e-24870ad248cc@suse.com>
 <000b01d5f6ca$49cf80a0$dd6e81e0$@xen.org>
 <e18a0f06-d954-683b-9ca0-0fb1aed62064@suse.com>
 <000d01d5f6d6$3c45f6b0$b4d1e410$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f9a004a-1a76-32cd-2b37-012f5927eceb@suse.com>
Date: Tue, 10 Mar 2020 14:47:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000d01d5f6d6$3c45f6b0$b4d1e410$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/5] IOMMU: iommu_intpost is x86/HVM-only
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxMzoyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTE6MDIKPj4gVG86IHBhdWxAeGVuLm9yZwo+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyAnS2V2aW4gVGlhbicgPGtldmluLnRpYW5AaW50
ZWwuY29tPjsgJ1N0ZWZhbm8gU3RhYmVsbGluaScKPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyAnSnVsaWVuIEdyYWxsJyA8anVsaWVuQHhlbi5vcmc+OyAnV2VpIExpdScgPHdsQHhlbi5vcmc+
OyAnS29ucmFkIFdpbGsnCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgJ0dlb3JnZSBEdW5s
YXAnIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyAnQW5kcmV3IENvb3BlcicKPj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyAnSWFuIEphY2tzb24nIDxpYW4uamFja3NvbkBjaXRy
aXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNV0gSU9NTVU6IGlvbW11X2ludHBv
c3QgaXMgeDg2L0hWTS1vbmx5Cj4+Cj4+IE9uIDEwLjAzLjIwMjAgMTE6NTQsIFBhdWwgRHVycmFu
dCB3cm90ZToKPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+IEZyb206IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiBTZW50OiAwOSBNYXJjaCAyMDIwIDEwOjQz
Cj4+Pj4KPj4+PiBAQCAtNDg2LDggKzQ4MCwxMCBAQCBpbnQgX19pbml0IGlvbW11X3NldHVwKHZv
aWQpCj4+Pj4gICAgICAgICAgcGFuaWMoIkNvdWxkbid0IGVuYWJsZSAlcyBhbmQgaW9tbXU9cmVx
dWlyZWQvZm9yY2VcbiIsCj4+Pj4gICAgICAgICAgICAgICAgIWlvbW11X2VuYWJsZWQgPyAiSU9N
TVUiIDogIkludGVycnVwdCBSZW1hcHBpbmciKTsKPj4+Pgo+Pj4+ICsjaWZuZGVmIGlvbW11X2lu
dHBvc3QKPj4+PiAgICAgIGlmICggIWlvbW11X2ludHJlbWFwICkKPj4+PiAgICAgICAgICBpb21t
dV9pbnRwb3N0ID0gMDsKPj4+Cj4+PiBOaXQ6IDAgLT4gZmFsc2UKPj4KPj4gSG1tLCBJJ20gbm90
IHRvdWNoaW5nIHRoaXMgbGluZSwgYW5kIHRoZSBnb2FsIG9mIHRoZSBwYXRjaCBpc24ndAo+PiB0
byAoYWxzbykgc3dpdGNoIF9hbGxfIGFzc2lnbm1lbnRzIHRvIHRoZSB2YXJpYWJsZS4KPiAKPiBZ
ZXMsIGJ1dCBpdCBpcyBpbiBjb250ZXh0IGFuZCB5b3Ugbm9ybWFsbHkgYXNrIGZvciBmaXgtdXBz
IHdoZXJlCj4gdGhleSBhcmUgaW4gY29udGV4dC4gSW4gdGhpcyBjYXNlIGl04oCZcyBhIHByZXR0
eSB0cml2aWFsIGFkZGl0aW9uIHRvIHRoZSBwYXRjaC4KCkhtbSwgSSBub3cgbm90aWNlIHRoYXQg
aW4gYW5vdGhlciBwbGFjZSBJIGFscmVhZHkgZG8gc3VjaCBhbiBpbi1jb250ZXh0CmFkanVzdG1l
bnQsIHNvIEknbGwgZG8gc28gaGVyZSB0b28uIE5vcm1hbGx5IEkgKHRyeSB0bykgcmVzdHJpY3Qg
c3VjaAoocmVxdWVzdHMpIHRvIGxpbmVzIHRvdWNoZWQgYW55d2F5LgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
