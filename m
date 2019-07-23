Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED571FA6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 20:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpzqD-0006is-TV; Tue, 23 Jul 2019 18:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpzqB-0006il-Vz
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 18:48:48 +0000
X-Inumbo-ID: 7fc970d8-ad7a-11e9-be1c-bffa7916bab2
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fc970d8-ad7a-11e9-be1c-bffa7916bab2;
 Tue, 23 Jul 2019 18:48:45 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 02XpWcY6rhKYI50OzoqL3U2v3NyzUTK1R3ki0PfnB4oE9PEEdNLcP3ZFnfu3X1yee73olIjflR
 NGzk18R1jfwa3BZ7B2EruhDqsfQJzvQ3q1liajmg/zwGDyqAeDrS17pxjk/USXzheQ6gzDRFQ2
 HjVW7bqYBdYuBauqcSZrfFOtDikolNCdIXM1zM9eJk/h0BaqfCvUGMGLuhK4vLxLJK+wG5yksZ
 WrVijP6kBsOFMZt7vpCDQVpFTkzXrhzXpvvSGRPk1xyxCXBu68Yknvw1Cs8vOLXANI7DRUhf/m
 cPY=
X-SBRS: 2.7
X-MesageID: 3421300
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3421300"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190723182530.24087-1-jgross@suse.com>
 <20190723182530.24087-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <714dad88-baa2-3200-60ff-68b9dd1673cb@citrix.com>
Date: Tue, 23 Jul 2019 19:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723182530.24087-2-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/x86: cleanup unused NMI/MCE code
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDcvMjAxOSAxOToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBwdl9yYWlzZV9pbnRl
cnJ1cHQoKSBpcyBvbmx5IGNhbGxlZCBmb3IgTk1JcyB0aGVzZSBkYXlzLCBzbyB0aGUgTUNFCj4g
c3BlY2lmaWMgcGFydCBjYW4gYmUgcmVtb3ZlZC4gUmVuYW1lIHB2X3JhaXNlX2ludGVycnVwdCgp
IHRvCj4gcHZfcmFpc2Vfbm1pKCkgYW5kIE5NSV9NQ0VfU09GVElSUSB0byBOTUlfU09GVElSUS4K
CkZvciBwb3N0ZXJpdHksIGl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gZXhwbGljaXRseSBpZGVudGlm
eSAzNTViMDQ2OWE4CndoaWNoIGludHJvZHVjZWQgTk1JIGFuZCBNQ0UgcGlubmluZyAod2hlcmUg
cHJldmlvdXNseSB0aGVyZSB3YXMgbm8gTk1JCnBpbm5pbmcgYmVmb3JlaGFuZCBBRkFJQ1QpLCBh
bmQgdGhlbiAzYTkxNzY5ZDZlIHdoaWNoIHJlbW92ZWQgdGhlIE1DRQpwaW5uaW5nLgoKU3RhdGVk
IGxpa2UgdGhhdCwgSSBkb3VidCB0aGUgTk1JIHBpbm5pbmcgd2FzIGV2ZXIgcmVsZXZhbnQgaW4g
cHJhY3RpY2UuCgo+Cj4gQWRkaXRpb25hbGx5IHRoZXJlIGlzIG5vIG5lZWQgdG8gcGluIHRoZSB2
Y3B1IHRoZSBOTUkgaXMgZGVsaXZlcmVkCj4gdG8sIHRoYXQgaXMgYSBsZWZ0b3ZlciBvZiAoYWxy
ZWFkeSByZW1vdmVkKSBNQ0UgaGFuZGxpbmcuIFNvIHJlbW92ZQo+IHRoZSBwaW5uaW5nLCB0b28u
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpFdmVy
eXRoaW5nIExHVE0uwqAgQSBmZXcgdHJpdmlhbCBub3Rlcy4KCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9wdi90cmFwcy5jIGIveGVuL2FyY2gveDg2L3B2L3RyYXBzLmMKPiBpbmRleCAxNzQw
Nzg0ZmYyLi45NDM2YzgwMDQ3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi90cmFwcy5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L3B2L3RyYXBzLmMKPiBAQCAtMTM2LDQ3ICsxMzYsMjEgQEAg
Ym9vbCBzZXRfZ3Vlc3Rfbm1pX3RyYXBib3VuY2Uodm9pZCkKPiAgICAgIHJldHVybiAhbnVsbF90
cmFwX2JvdW5jZShjdXJyLCB0Yik7Cj4gIH0KPiAgCj4gLXN0cnVjdCBzb2Z0aXJxX3RyYXAgewo+
IC0gICAgc3RydWN0IGRvbWFpbiAqZG9tYWluOyAgIC8qIGRvbWFpbiB0byBpbmplY3QgdHJhcCAq
Lwo+IC0gICAgc3RydWN0IHZjcHUgKnZjcHU7ICAgICAgIC8qIHZjcHUgdG8gaW5qZWN0IHRyYXAg
Ki8KPiAtICAgIHVuc2lnbmVkIGludCBwcm9jZXNzb3I7ICAvKiBwaHlzaWNhbCBjcHUgdG8gaW5q
ZWN0IHRyYXAgKi8KPiAtfTsKPiArc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICos
IHNvZnRpcnFfbm1pX3ZjcHUpOwo+ICAKPiAtc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBz
b2Z0aXJxX3RyYXAsIHNvZnRpcnFfdHJhcCk7Cj4gLQo+IC1zdGF0aWMgdm9pZCBubWlfbWNlX3Nv
ZnRpcnEodm9pZCkKPiArc3RhdGljIHZvaWQgbm1pX3NvZnRpcnEodm9pZCkKPiAgewo+ICAgICAg
dW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAtICAgIHN0cnVjdCBzb2Z0
aXJxX3RyYXAgKnN0ID0gJnBlcl9jcHUoc29mdGlycV90cmFwLCBjcHUpOwo+IC0KPiAtICAgIEJV
R19PTihzdC0+dmNwdSA9PSBOVUxMKTsKPiAtCj4gLSAgICAvKgo+IC0gICAgICogU2V0IHRoZSB0
bXAgdmFsdWUgdW5jb25kaXRpb25hbGx5LCBzbyB0aGF0IHRoZSBjaGVjayBpbiB0aGUgaXJldAo+
IC0gICAgICogaHlwZXJjYWxsIHdvcmtzLgo+IC0gICAgICovCj4gLSAgICBjcHVtYXNrX2NvcHko
c3QtPnZjcHUtPmNwdV9oYXJkX2FmZmluaXR5X3RtcCwKPiAtICAgICAgICAgICAgICAgICBzdC0+
dmNwdS0+Y3B1X2hhcmRfYWZmaW5pdHkpOwo+ICsgICAgc3RydWN0IHZjcHUgKip2X3B0ciA9ICZw
ZXJfY3B1KHNvZnRpcnFfbm1pX3ZjcHUsIGNwdSk7CgpUaGVyZSBpcyBvbmx5IGEgc2luZ2xlIHVz
ZSBvZiAnY3B1JyBoZXJlLCBzbyB5b3UgY2FuIGRyb3AgdGhhdCBhbmQgdXNlCnRoaXNfY3B1KHNv
ZnRpcnFfbm1pX3ZjcHUpIGluc3RlYWQuCgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L3B2L3RyYXBzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3B2L3RyYXBzLmgKPiBpbmRleCBm
Y2M3NWY1ZTlhLi40N2Q2Y2Y1ZmM0IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
cHYvdHJhcHMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHYvdHJhcHMuaAo+IEBAIC0y
Nyw4ICsyNyw4IEBACj4gIAo+ICB2b2lkIHB2X3RyYXBfaW5pdCh2b2lkKTsKPiAgCj4gLS8qIERl
bGl2ZXIgaW50ZXJydXB0IHRvIFBWIGd1ZXN0LiBSZXR1cm4gMCBvbiBzdWNjZXNzLiAqLwo+IC1p
bnQgcHZfcmFpc2VfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2LCB1aW50OF90IHZlY3Rvcik7Cj4g
Ky8qIERlbGl2ZXIgTk1JIHRvIFBWIGd1ZXN0LiBSZXR1cm4gMCBvbiBzdWNjZXNzLiAqLwo+ICtp
bnQgcHZfcmFpc2Vfbm1pKHN0cnVjdCB2Y3B1ICp2KTsKPiAgCj4gIGludCBwdl9lbXVsYXRlX3By
aXZpbGVnZWRfb3Aoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOwo+ICB2b2lkIHB2X2VtdWxh
dGVfZ2F0ZV9vcChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7Cj4gQEAgLTQ2LDggKzQ2LDgg
QEAgc3RhdGljIGlubGluZSBib29sIHB2X3RyYXBfY2FsbGJhY2tfcmVnaXN0ZXJlZChjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwKPiAgCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBwdl90cmFwX2luaXQodm9p
ZCkge30KPiAgCj4gLS8qIERlbGl2ZXIgaW50ZXJydXB0IHRvIFBWIGd1ZXN0LiBSZXR1cm4gMCBv
biBzdWNjZXNzLiAqLwo+IC1zdGF0aWMgaW5saW5lIGludCBwdl9yYWlzZV9pbnRlcnJ1cHQoc3Ry
dWN0IHZjcHUgKnYsIHVpbnQ4X3QgdmVjdG9yKSB7IHJldHVybiAtRU9QTk9UU1VQUDsgfQo+ICsv
KiBEZWxpdmVyIE5NSSB0byBQViBndWVzdC4gUmV0dXJuIDAgb24gc3VjY2Vzcy4gKi8KPiArc3Rh
dGljIGlubGluZSBpbnQgcHZfcmFpc2Vfbm1pKHN0cnVjdCB2Y3B1ICp2KSB7IHJldHVybiAtRU9Q
Tk9UU1VQUDsgfQoKSSBkb24ndCB0aGluayBkdXBsaWNhdGluZyB0aGUgZnVuY3Rpb24gZGVzY3Jp
cHRpb24gaGVyZSBpcyB1c2VmdWwuwqAKSW5zdGVhZCwgSSdkIHJlY29tbWVuZCBkcm9wcGluZyB0
aGVzZSBsaW5lcywgYW5kIGNvbW1lbnRpbmcgaXQgb25jZSBpbgpwdi90cmFwcy5jLsKgIFRoYXQg
c2hvdWxkIGluY2x1ZGUgdGhlIGZhY3QgdGhhdCBpdCBpcyBleHBlY3RlZCB0byBiZSB1c2VkCk5N
SSBjb250ZXh0LCB3aGljaCBtZWFucyBpdHMgbm90IHNhZmUgdG8gdXNlIHByaW50aygpIGV0YyBp
biB0aGVyZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
