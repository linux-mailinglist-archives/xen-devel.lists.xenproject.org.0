Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D303FA1A4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 02:59:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUhsn-0006l8-KD; Wed, 13 Nov 2019 01:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZTFR=ZF=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1iUhsm-0006l3-7x
 for xen-devel@lists.xen.org; Wed, 13 Nov 2019 01:55:44 +0000
X-Inumbo-ID: b1cda9dd-05b8-11ea-a221-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b1cda9dd-05b8-11ea-a221-12813bfff9fa;
 Wed, 13 Nov 2019 01:55:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9760B7A7;
 Tue, 12 Nov 2019 17:55:40 -0800 (PST)
Received: from [192.168.3.111] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9A93F534;
 Tue, 12 Nov 2019 17:55:39 -0800 (PST)
To: Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0TPPzSCMBHsR9e2A1Qvpsrk_K7tqfcKTUYYcTq84hA+Q@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <e9b952a3-a5af-c3a9-db95-4feb8cebe803@arm.com>
Date: Wed, 13 Nov 2019 01:58:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a0TPPzSCMBHsR9e2A1Qvpsrk_K7tqfcKTUYYcTq84hA+Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAwMTowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKSGksCgo+IE9uIFR1ZSwg
MTIgTm92IDIwMTksIDA0OjAxIFN0ZWZhbm8gU3RhYmVsbGluaSwgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmcKPiA8bWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+PiB3cm90ZToKPiAKPiAgICAg
T24gU2F0LCA5IE5vdiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gICAgID4gT24gU2F0LCA5
IE5vdiAyMDE5LCAwNDoyNyBTdGVmYW5vIFN0YWJlbGxpbmksCj4gICAgIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnIDxtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4+IHdyb3RlOgo+ICAgICA+
wqAgwqAgwqAgwqBPbiBUaHUsIDcgTm92IDIwMTksIFBlbmcgRmFuIHdyb3RlOgo+ICAgICA+wqAg
wqAgwqAgwqA+IFRoZSBlbmQgc2hvdWxkIGJlIEdJQ0RfSVNBQ1RJVkVSTiBub3QgR0lDRF9JU0FD
VElWRVIuCj4gICAgID7CoCDCoCDCoCDCoD4KPiAgICAgPsKgIMKgIMKgIMKgPiBTaWduZWQtb2Zm
LWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbQo+ICAgICA8bWFpbHRvOnBlbmcuZmFuQG54
cC5jb20+Pgo+ICAgICA+Cj4gICAgID7CoCDCoCDCoCDCoFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcKPiAgICAgPG1haWx0bzpzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPj4KPiAgICAgPgo+ICAgICA+Cj4gICAgID4gVG8gYmUgaG9uZXN0LCBJIGFt
IG5vdCBzdXJlIHRoZSBjb2RlIGlzIGNvcnJlY3QuIEEgcmVhZCB0byB0aG9zZQo+ICAgICByZWdp
c3RlcnMgc2hvdWxkIHRlbGwgeW91IHRoZSBsaXN0IG9mIGludGVycnVwdHMgYWN0aXZlLiBBcyB3
ZSBhbHdheXMKPiAgICAgPiByZXR1cm4gMCwgdGhpcyB3aWxsIG5vdCByZXR1cm4gdGhlIGNvcnJl
Y3Qgc3RhdGUgb2YgdGhlIEdJQy4KPiAgICAgPgo+ICAgICA+IEkga25vdyB0aGF0IHJldHVybmlu
ZyB0aGUgbGlzdCBvZiBhY3RpdmVzIGludGVycnVwdHMgaXMKPiAgICAgY29tcGxpY2F0ZWQgd2l0
aCB0aGUgb2xkIHZHSUMsIGJ1dCBJIGRvbid0IHRoaW5rIHNpbGVudGx5IGlnbm9yaW5nCj4gICAg
IGl0IGlzIGEgZ29vZAo+ICAgICA+IGlkZWEuCj4gICAgID4gVGhlIHF1ZXN0aW9uIGhlcmUgaXMg
d2h5IHRoZSBndWVzdCBhY2Nlc3NlZCB0aG9zZSByZWdpc3RlcnM/IFdoYXQKPiAgICAgaXMgaXQg
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQ/Cj4gCj4gICAgIFdlIGFyZSBub3QgZ29pbmcgdG8gc29sdmUg
dGhlIGdlbmVyYWwgcHJvYmxlbSBhdCB0aGlzIHN0YWdlLiBBdCB0aGUKPiAgICAgbW9tZW50IHRo
ZSBjb2RlOgo+IAo+ICAgICAtIGlnbm9yZSB0aGUgZmlyc3QgcmVnaXN0ZXIgb25seQo+ICAgICAt
IHByaW50IGFuIGVycm9yIGFuZCByZXR1cm4gYW4gSU9fQUJPUlQgZXJyb3IgZm9yIHRoZSBvdGhl
ciByZWdzCj4gCj4gICAgIEZvciB0aGUgaW5jb25zaXN0ZW5jeSBhbG9uZSB0aGUgc2Vjb25kIG9w
dGlvbiBpcyB1bmRlc2lyYWJsZS4gQWxzbyBpdAo+ICAgICBkb2Vzbid0IG1hdGNoIHRoZSB3cml0
ZSBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggZG9lcyB0aGUgc2FtZSB0aGluZyBmb3IKPiAgICAgYWxs
IHRoZSBHSUNEX0lTQUNUSVZFUiogcmVncyBpbnN0ZWFkIG9mIGhhdmluZyBhIHNwZWNpYWwgdHJl
YXRtZW50IGZvcgo+ICAgICB0aGUgZmlyc3Qgb25lIG9ubHkuIEl0IGxvb2tzIGxpa2UgYSB0eXBv
IGluIHRoZSBvcmlnaW5hbCBwYXRjaCB0byBtZS4KPiAKPiAgICAgVGhlIHByb3Bvc2VkIHBhdGNo
IHN3aXRjaGVzIHRoZSBiZWhhdmlvciB0bzoKPiAKPiAgICAgLSBzaWxlbnRseSBpZ25vcmUgYWxs
IHRoZSBHSUNEX0lTQUNUSVZFUiogcmVncyAoYXMgcHJvcG9zZWQpCj4gCj4gCj4gICAgIGlzIGFu
IGltcHJvdmVtZW50Lgo+IAo+IAo+IFBlbmcgbWVudGlvbmVkIHRoYXQgTGludXggaXMgYWNjZXNz
aW5nIGl0LCBzbyB0aGUgd29yc3QgdGhpbmcgd2UgY2FuIGRvCj4gaXMgbHlpbmcgdG8gdGhlIGd1
ZXN0IChhcyB5b3Ugc3VnZ2VzdCBoZXJlKS4gSSB3b3VsZCBkZWZpbml0ZWx5IG5vdCBjYWxsCj4g
dGhhdCBhbiBpbXByb3ZlbWVudC4KClRoZSBJU0FDVElWRVIgcmFuZ2UgaXMgd3JvbmcgaW4gdGhl
IGRlc2NyaXB0aW9uLCBpdCBjb3ZlcnMgb25seSBvbmUKcmVnaXN0ZXIsIG5vdCBtdWx0aXBsZS4g
VGhpcyBpcyBvYnZpb3VzbHkgYSB0eXBvLCBzaW5jZSBpdCdzIGNvcnJlY3QgaW4KYm90aCBHSUN2
MiBhbmQgaW4gdGhlIGhpZ2ggbGV2ZWwgc3dpdGNoL2Nhc2UgaW4gR0lDdjMuIFJlYWRpbmcgZnJv
bQpvdXRzaWRlIG9mIGFueSByYW5nZSB3aWxsIGluamVjdCBhbiBhYm9ydCBpbnRvIHRoZSBndWVz
dCwgd2hpY2ggcnVucyBpbgprZXJuZWwgc3BhY2UuIFRoaXMgd2lsbCBwcm9iYWJseSByZXN1bHQg
aW4gYSBndWVzdCBjcmFzaC4gSSB3b3VsZApjb25zaWRlciBub3QgY3Jhc2hpbmcgYW4gaW1wcm92
ZW1lbnQuCgpBYm91dCAibHlpbmciIHRvIHRoZSBndWVzdDogVHlwaWNhbGx5IGFuIElSUSBpcyBq
dXN0IGFjdGl2ZSBmb3IgYSB2ZXJ5CnNob3J0IHRpbWUsIHNvIDAgaXMgYSB2ZXJ5IGdvb2QgYW5z
d2VyLCBhY3R1YWxseS4gVGhlIG9sZCBWR0lDIGluIEtWTQpkaWQgZXhhY3RseSB0aGUgc2FtZToK
ICAgICAgICB2Z2ljX3JlZ19hY2Nlc3MobW1pbywgTlVMTCwgb2Zmc2V0LAogICAgICAgICAgICAg
ICAgICAgICAgICBBQ0NFU1NfUkVBRF9SQVogfCBBQ0NFU1NfV1JJVEVfSUdOT1JFRCk7CgpUaGUg
cHJvcGVyIHNvbHV0aW9uIHdvdWxkIGJlOgoxKSBUcmFjayB0aGUgc3RhdGUgb2YgdGhlIGFjdGl2
ZSBiaXQgd2hlbiB3ZSBjYW4gb2JzZXJ2ZSBpdCwgc28gd2hlbiB0aGUKZ3Vlc3QgZXhpdHMgd2l0
aCBhbiBhY3RpdmUgSVJRLiBUaGUgbmV3IFZHSUMgZG9lcyB0aGF0LgoyKSBLaWNrIG91dCBhbGwg
VkNQVXMgdGhhdCBoYXZlIElSUXMgaW4gdGhhdCBnaXZlbiByYW5rLCBhbmQgc2FtcGxlIHRoZQph
Y3RpdmUgYml0IGZyb20gdGhlIExScy4gU291bmRzIHByZXR0eSBob3JyaWJsZSwgYW5kIGNoYW5j
ZXMgYXJlIHZlcnkKaGlnaCB5b3Ugd2lsbCBnZXQgYWxsIDBzIHRoZXJlLgoKU28gaWYgSSBjb21w
YXJlICJmaXggdGhvc2UgdHdvIHR5cG9zIGFuZCBwcmVzZXJ2ZSB0aGUgc3RhdGUgdGhhdCB0aGUg
WGVuClZHSUMgaGFzIGJlZW4gaW4gZm9yIHllYXJzIiB0byAiY3JlYXRlIGEgbG90IG9mIHJhY3kg
Y29kZSBmb3IgYSByYXJlCmNvcm5lciBjYXNlIiwgdGhlIGZpcnN0IG9uZSBzdXJlbHkgd2lucy4K
VGhhdCBkb2Vzbid0IG1lYW4gd2Ugc2hvdWxkIG5ldmVyIHRyeSBpdCwgYnV0IHN1cmVseSB0aGlz
IGZpeCBuZWVkcyB0bwpnbyBpbiBtZWFud2hpbGUuCgo+IEluIHRoZSBjdXJyZW50IHN0YXRlLCBp
dCBpcyBhIE5hY2suIElmIHRoZXJlIHdlcmUgYSB3YXJuaW5nLCB0aGVuIEkKPiB3b3VsZCBiZSBt
b3JlIGluY2xpbmVkIHRvIHNlZSB0aGlzIHBhdGNoIGdvaW5nIHRocm91Z2guCgpEbyB5b3UgbWVh
biBhIHdhcm5pbmcgdGhhdCB3ZSBhcmUgYWJvdXQgdG8gbGllIHRvIHRoZSBndWVzdD8gVGhhdCBz
b3VuZHMKcHJldHR5IHVzZWxlc3MsIHNpbmNlIG5vYm9keSBjYW4gZG8gYW55dGhpbmcgYWJvdXQg
aXQuIFBsdXMgd2UgaGF2ZQphbHJlYWR5IHRob3NlIHdhcm5pbmdzIG9uIHdyaXRpbmcgdG8gdGhl
c2UgcmVnaXN0ZXJzLCBhbmQgdGhpcyBhbHdheXMKY29uZnVzZXMgcGVvcGxlIGFuZCB0cmlnZ2Vy
ZWQgcG9pbnRsZXNzIGJ1ZyByZXBvcnRzLgoKSSB0aGluayB0aGUgb2xkIFZHSUMgaGFzIGJpZ2dl
ciBwcm9ibGVtcyA7LSkKCkNoZWVycywKQW5kcmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
