Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA74A45D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 16:48:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdFLn-00057H-U7; Tue, 18 Jun 2019 14:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdFLm-000579-JD
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:44:42 +0000
X-Inumbo-ID: 99455964-91d7-11e9-ab8c-43206808944f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 99455964-91d7-11e9-ab8c-43206808944f;
 Tue, 18 Jun 2019 14:44:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893B02B;
 Tue, 18 Jun 2019 07:44:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0B9A3F718;
 Tue, 18 Jun 2019 07:44:37 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
 <5D08EF5A02000078002394E6@prv1-mh.provo.novell.com>
 <88205b2b-98c2-d512-c555-98bc16ae05ff@arm.com>
 <5D08F4AA020000780023953E@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d5d5624b-4dfe-9160-dcec-a1dfe70041b7@arm.com>
Date: Tue, 18 Jun 2019 15:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D08F4AA020000780023953E@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.11 1/2] XSM: adjust Kconfig names
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgSWFuKQoKT24gMTgvMDYvMjAxOSAxNToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDYuMTkgYXQgMTY6MTEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDE4
LzA2LzIwMTkgMTU6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gU2luY2UgdGhlIEtjb25maWcg
b3B0aW9uIHJlbmFtaW5nIHdhcyBub3QgYmFja3BvcnRlZCwgdGhlIG5ldyB1c2VzIG9mCj4+PiBp
bnZvbHZlZCBDT05GSUdfKiBzZXR0aW5ncyBzaG91bGQgaGF2ZSBiZWVuIGFkb3B0ZWQgdG8gdGhl
IGV4aXN0aW5nCj4+PiBuYW1lcyBpbiB0aGUgWFNBLTI5NSBzZXJpZXMuIERvIHRoaXMgbm93LCBh
bHNvIGNoYW5naW5nIFhTTV9TSUxPIHRvIGp1c3QKPj4+IFNJTE8gdG8gYmV0dGVyIG1hdGNoIGl0
cyBGTEFTSyBjb3VudGVycGFydC4KPj4+Cj4+PiBUbyBhdm9pZCBicmVha2luZyB0aGUgS2NvbmZp
ZyBtZW51IHN0cnVjdHVyZSBhbHNvIGFkanVzdCBYU01fUE9MSUNZJ3MKPj4+IGRlcGVuZGVuY3kg
KGFzIHdhcyBhbHNvIHNpbGVudGx5IGRvbmUgb24gbWFzdGVyIGR1cmluZyB0aGUgcmVuYW1pbmcp
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4KPj4gU29ycnkgZm9yIHRoZSBicmVha2FnZS4gVG8gYXZvaWQgc3VjaCBibHVuZGVyIGR1cmlu
ZyBYU0FzLCB3b3VsZCBpdCBiZSBwb3NzaWJsZQo+PiB0byB0ZXN0IHRoZW0gb24gb3NzdGVzdCBi
ZWZvcmUgdGhleSBhcmUgcHVibGlzaGVkPwo+IAo+IFRoYXQncyBhbiBvcHRpb24sIGJ1dCB3b3Vs
ZCBjYXVzZSBmdXJ0aGVyIGRlbGF5cy4gSG93IGV4YWN0bHkgdG8KPiBhcnJhbmdlIGZvciB0aGlz
IEknbSB0aGUgd3Jvbmcgb25lIHRvIGFzaywgdGhvdWdoLgoKSW5kZWVkLCBob3dldmVyIHRlc3Rp
bmdzIG5lZWQgdG8gYmUgZG9uZSBtYW51YWxseSBhdCB0aGUgbW9tZW50LiBXaXRoIDYgdHJlZXMg
dG8gCnRha2UgY2FyZSwgdGhpcyBpcyBtb3JlIGxpa2VseSBnb2luZyB0byBkZWxheSBtb3JlIHRo
YW4gYXV0b21hdGljIHRlc3RpbmcuCgpBbnl3YXksIHRoYXQncyBvbmx5IGEgc3VnZ2VzdGlvbiB0
byBpbXByb3ZlIFhTQSB0ZXN0aW5ncyAoYXQgbGVhc3Qgb24gQXJtKS4gOikKCj4gCj4gQnV0IGxl
dCdzIGZhY2UgaXQ6IFRoZSBwYXRjaCBjaGFuZ2luZyBLY29uZmlnIG5vdCBoYXZpbmcgYXBwbGll
ZAo+IHdpdGhvdXQgZnV6eiBzaG91bGQgaGF2ZSB0b2xkIHdob2V2ZXIgZGlkIHRoZSBiYWNrcG9y
dCB0byBsb29rCj4gbW9yZSBjbG9zZWx5Lgo+IAo+IFdoYXQgSSdkIGxpa2UgdG8gYXNrIGZvciBp
biB0aGUgZnV0dXJlIGluIGFueSBjYXNlIHRob3VnaCBpcyB0aGF0IGFmdGVyCj4gcHVzaGluZyBz
dHVmZiB0byBzdGFibGUgdHJlZXMgeW91IHdvdWxkIHBsZWFzZSBjaGVjayB0aGUgb3NzdGVzdAo+
IHJlcG9ydHMsIGFuZCBpbiBjYXNlIG9mIHJlZ3Jlc3Npb25zIGludmVzdCBhdCBsZWFzdCBzb21l
IHRpbWUgaW50bwo+IGZpZ3VyaW5nIG91dCB3aGF0IGJyb2tlLiBSaWdodCBub3csIGV2ZW4gd2l0
aCB0aGUgWFNNIHRlc3RzCj4gKGhvcGVmdWxseSkgdGFrZW4gY2FyZSBvZiB0aGVyZSdzIHN0aWxs
IGEgZmxvb2Qgb2YgYXJtaGYgZmFpbHVyZXMsIHdoaWNoCj4gbWF5IG9yIG1heSBub3QgYmUgZHVl
IHRvIGVudmlyb25tZW50YWwgaXNzdWVzLgoKSSB1c3VhbGx5IGxvb2sgb3ZlciBvc3N0ZXN0IGJ1
dCBmYWlsIHRvIGRldGVjdCB0aGlzIHdhcyBhbiBpc3N1ZSBiZWNhdXNlIG9mIHRoZSAKWFNBcy4g
UmVnYXJkaW5nIHRoZSBvdGhlciBhcm1oZiBmYWlsdXJlLCBJYW4gYWxyZWFkeSBwb2ludGVkIG91
dCBvbiBJUkMuCgpIb3dldmVyLCBJIHdpbGwgbm90IGhhdmUgdGltZSB0byBsb29rIGF0IGl0IGJl
Zm9yZSBYZW4gU3VtbWl0LiBNYXliZSBTdGVmYW5vIGNhbj8KCj4+IEFsc28sIGRvIHdlIG5lZWQg
dG8gdXBkYXRlIHRoZSBhZHZpc29yeT8KPiAKPiBEdW5uby4gSSBkaWRuJ3QgZG8gZnVsbCBhbmFs
eXNpcyBvZiB3aGF0IG1heSBnbyB3cm9uZywgSSd2ZSBqdXN0IHdvcmtlZAo+IG15IHdheSBmYXIg
ZW5vdWdoIHRvIHVuZGVyc3RhbmQgd2hhdCBuZWVkcyBmaXhpbmcuIFdoZXRoZXIgYW4KPiB1cGRh
dGUgaXMgbmVlZGVkIGltbyBsYXJnZWx5IGRlcGVuZHMgb24gd2hldGhlciB0aGUgcHVycG9zZSBv
ZiB0aGUKPiBwYXRjaGVzIHdhc24ndCBmdWxmaWxsZWQuIFBlb3BsZSBhY3R1YWxseSB1c2luZyBY
U00gd2lsbCBub3RpY2UgdmVyeQo+IHF1aWNrbHkgdGhhdCB0aGluZ3MgZG9uJ3Qgd29yayBhbnlt
b3JlLCBhcyBjYW4gYmUgc2VlbiBmcm9tIHRoZQo+IG9zc3Rlc3QgY2FzZXMuCgpBRkFJQ1QsIEFy
bSBkb2VzIG5vdCBzZWVtIHRvIGJlIGFmZmVjdGVkIGJ5IHRoZSBwcm9ibGVtIChhdCBsZWFzdCBv
c3N0ZXN0IGRvZXMgCm5vdCBjb21wbGFpbikuIEkgd291bGQgbm90IGV4cGVjdCB4ODYgdXNlcnMg
dG8gbWVyZ2UgdGhvc2UgcGF0Y2gsIHNvIG1heWJlIGl0IApzaG91bGQgYmUgb2suCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
