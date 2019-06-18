Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF649E5F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBUv-0004pT-Hb; Tue, 18 Jun 2019 10:37:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Le+r=UR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdBUt-0004pN-PO
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:37:51 +0000
X-Inumbo-ID: 1e69b1ea-91b5-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e69b1ea-91b5-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 10:37:50 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DDHux5zBak0GoX92EtIlAJw9EKcrP1pg7reypGUEfF7o3HjgwYBcw50mtJ8FtPw0pXxW/jPk5X
 XtVlGw6UXW0FzknrmYqMbJvbh9n63Ky5QMZkTbqmkJJEyLdIfwo0AYKi8/591Go3+tOZvVC0Ib
 TWX36rUX5tKjmOAYjH/r8r9FIVsv03S4HJvV6cKRIdmJXtQQByCzNAzLPPh6tgOJm2NWohbknk
 0Tx5UBLlWebPCJ+JjnKtt7OgXmhR35R12Iqj6TbnfH/n4rrPCEIix5g+JsvWd8YeVBm4sx6QQU
 H84=
X-SBRS: 2.7
X-MesageID: 1887521
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,388,1557201600"; 
   d="scan'208";a="1887521"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7a2cfbe7-32d3-4349-66a3-84b4d1ecf6f6@citrix.com>
Date: Tue, 18 Jun 2019 11:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/9] AMD/IOMMU: use bit field for IRTE
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDYvMjAxOSAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXQgdGhlIHNhbWUgdGlt
ZSByZXN0cmljdCBpdHMgc2NvcGUgdG8ganVzdCB0aGUgc2luZ2xlIHNvdXJjZSBmaWxlCj4gYWN0
dWFsbHkgdXNpbmcgaXQsIGFuZCBhYnN0cmFjdCBhY2Nlc3NlcyBieSBpbnRyb2R1Y2luZyBhIHVu
aW9uIG9mCj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUgZW50cmllcyBp
cyBub3QgdXNlZCB0byBtYWtlIGl0Cj4gaW1wb3NzaWJsZSB0byBbd3JvbmdseSwgb25jZSB0aGUg
MTI4LWJpdCBmb3JtIGdldHMgYWRkZWRdIHBlcmZvcm0KPiBwb2ludGVyIGFyaXRobWV0aWMgLyBh
cnJheSBhY2Nlc3NlcyBvbiBkZXJpdmVkIHR5cGVzLikKPgo+IEFsc28gbW92ZSBhd2F5IGZyb20g
dXBkYXRpbmcgdGhlIGVudHJpZXMgcGllY2VtZWFsOiBDb25zdHJ1Y3QgYSBmdWxsIG5ldwo+IGVu
dHJ5LCBhbmQgd3JpdGUgaXQgb3V0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IEl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIHRvIHVzZSB3
cml0ZV9hdG9taWMoKSBvciBBQ0NFU1NfT05DRSgpIGZvciB0aGUKPiBhY3R1YWwgd3JpdGVzLCBi
dXQgYm90aCBjYXN0IHRoZSB2YWx1ZSB0byBhIHNjYWxhciBvbmUsIHdoaWNoIGRvZXNuJ3QKPiBz
dWl0IHVzIGhlcmUgKGFuZCBJIGFsc28gZGlkbid0IHdhbnQgdG8gbWFrZSB0aGUgY29tcG91bmQg
dHlwZSBhIHVuaW9uCj4gd2l0aCBhIHJhdyBtZW1iZXIganVzdCBmb3IgdGhpcykuCj4KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IEBAIC0yMyw2ICsyMywyMyBAQAo+
ICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KPiAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+
Cj4gIAo+ICtzdHJ1Y3QgaXJ0ZV9iYXNpYyB7CgpJJ2Qgc3VnZ2VzdCBpcnRlXzMyLCB0byBnbyB3
aXRoIGlydGVfMTI4IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2guwqAKClRoZSAxMjhiaXQgZm9ybWF0
IGlzIGFsc28gdXNlZCBmb3IgcG9zdGVkIGludGVycnVwdHMsIGFuZCBpc24ndCBzcGVjaWZpYwp0
byB4MmFwaWMgc3VwcG9ydC4KCkZ1cnRoZXJtb3JlLCBjYWxsaW5nIGl0IGlydGVfZnVsbCBpc24n
dCBhIHRlcm0gSSBjYW4gc2VlIGluIHRoZSBtYW51YWwsCmFuZCBpcyBmYWxsaW5nIGludG8gdGhl
IG5hbWluZyB0cmFwIHRoYXQgVVNCIGN1cnJlbnRseSBsaXZlcyBpbi4KCj4gKyAgICB1bnNpZ25l
ZCBpbnQgcmVtYXBfZW46MTsKPiArICAgIHVuc2lnbmVkIGludCBzdXBfaW9fcGY6MTsKPiArICAg
IHVuc2lnbmVkIGludCBpbnRfdHlwZTozOwo+ICsgICAgdW5zaWduZWQgaW50IHJxX2VvaToxOwo+
ICsgICAgdW5zaWduZWQgaW50IGRtOjE7Cj4gKyAgICB1bnNpZ25lZCBpbnQgZ3Vlc3RfbW9kZTox
OyAvKiBNQlogKi8KPiArICAgIHVuc2lnbmVkIGludCBkZXN0Ojg7Cj4gKyAgICB1bnNpZ25lZCBp
bnQgdmVjdG9yOjg7Cj4gKyAgICB1bnNpZ25lZCBpbnQgOjg7Cj4gK307Cj4gKwo+ICt1bmlvbiBp
cnRlX3B0ciB7Cj4gKyAgICB2b2lkICpyYXc7Cj4gKyAgICBzdHJ1Y3QgaXJ0ZV9iYXNpYyAqYmFz
aWM7Cj4gK307Cj4gKwo+ICAjZGVmaW5lIElOVFJFTUFQX1RBQkxFX09SREVSICAgIDEKPiAgI2Rl
ZmluZSBJTlRSRU1BUF9MRU5HVEggMHhCCj4gICNkZWZpbmUgSU5UUkVNQVBfRU5UUklFUyAoMSA8
PCBJTlRSRU1BUF9MRU5HVEgpCj4gQEAgLTEwMSw0NyArMTE4LDQ0IEBAIHN0YXRpYyB1bnNpZ25l
ZCBpbnQgYWxsb2NfaW50cmVtYXBfZW50cnkKPiAgICAgIHJldHVybiBzbG90Owo+ICB9Cj4gIAo+
IC1zdGF0aWMgdTMyICpnZXRfaW50cmVtYXBfZW50cnkoaW50IHNlZywgaW50IGJkZiwgaW50IG9m
ZnNldCkKPiArc3RhdGljIHVuaW9uIGlydGVfcHRyIGdldF9pbnRyZW1hcF9lbnRyeSh1bnNpZ25l
ZCBpbnQgc2VnLCB1bnNpZ25lZCBpbnQgYmRmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQpCgpBcyB0aGlzIGlzIGNoYW5naW5n
LCBzL29mZnNldC9lbnRyeS8gdG8gYXZvaWQgYW55IGNvbmZ1c2lvbiB3aGVyZSBvZmZzZXQKbWln
aHQgYmUgaW4gdW5pdHMgb2YgYnl0ZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
