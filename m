Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB51791FD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:10:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UgV-0001ot-NL; Wed, 04 Mar 2020 14:07:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9UgU-0001oo-2y
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:07:38 +0000
X-Inumbo-ID: 7fdef70c-5e21-11ea-a3e6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fdef70c-5e21-11ea-a3e6-12813bfff9fa;
 Wed, 04 Mar 2020 14:07:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3EF55ADAB;
 Wed,  4 Mar 2020 14:07:35 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
 <dc509c91-f809-6dbb-797c-6600b4857a74@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <623c77c6-d00a-d15e-a1e3-3827d32e1c10@suse.com>
Date: Wed, 4 Mar 2020 15:07:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dc509c91-f809-6dbb-797c-6600b4857a74@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxNDo1NywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gSGkg
R2VvcmdlLAo+IAo+IFRoaXMgaXMgYSBraW5kIHJlbWluZGVyIGlmIHlvdSBjYW4gdGFrZSBhIGxv
b2sgYXQgdGhpcyBwYXRjaCB3aGVuIHlvdSAKPiBoYXZlIHRoZSB0aW1lLgoKQXJlIHlvdSBwZXJo
YXBzIG5vdCBhd2FyZSBvZiB0aGUgcmVjZW50IG1haW50YWluZXIgY2hhbmdlIG9uCnhlbi9hcmNo
L3g4Ni9tbS8/IFdoYXQgeW91IG5lZWQgdG8gZ28gaHVudCBpcyAuLi4KCj4gT24gMDMuMDMuMjAy
MCAxNDoyMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+IEF0IHRoaXMgbW9tZW50
IGEgZ3Vlc3QgY2FuIGNhbGwgdm1mdW5jIHRvIGNoYW5nZSB0aGUgYWx0cDJtIHZpZXcuIFRoaXMK
Pj4gc2hvdWxkIGJlIGxpbWl0ZWQgaW4gb3JkZXIgdG8gYXZvaWQgYW55IHVud2FudGVkIHZpZXcg
c3dpdGNoLgo+Pgo+PiBUaGUgbmV3IHhjX2FsdHAybV9zZXRfdmlzaWJpbGl0eSgpIHNvbHZlcyB0
aGlzIGJ5IG1ha2luZyB2aWV3cyBpbnZpc2libGUKPj4gdG8gdm1mdW5jLgo+PiBUaGlzIGlzIGRv
bmUgYnkgaGF2aW5nIGEgc2VwYXJhdGUgYXJjaC5hbHRwMm1fd29ya2luZ19lcHRwIHRoYXQgaXMK
Pj4gcG9wdWxhdGVkIGFuZCBtYWRlIGludmFsaWQgaW4gdGhlIHNhbWUgcGxhY2VzIGFzIGFsdHAy
bV9lcHRwLiBUaGlzIGlzCj4+IHdyaXR0ZW4gdG8gRVBUUF9MSVNUX0FERFIuCj4+IFRoZSB2aWV3
cyBhcmUgbWFkZSBpbi92aXNpYmxlIGJ5IG1hcmtpbmcgdGhlbSB3aXRoIElOVkFMSURfTUZOIG9y
Cj4+IGNvcHlpbmcgdGhlbSBiYWNrIGZyb20gYWx0cDJtX2VwdHAuCj4+IFRvIGhhdmUgY29uc2lz
dGVuY3kgdGhlIHZpc2liaWxpdHkgYWxzbyBhcHBsaWVzIHRvCj4+IHAybV9zd2l0Y2hfZG9tYWlu
X2FsdHAybV9ieV9pZCgpLgo+Pgo+PiBOb3RlOiBJZiBhbHRwMm0gbW9kZSBpcyBzZXQgdG8gbWl4
ZWQgdGhlIGd1ZXN0IGlzIGFibGUgdG8gY2hhbmdlIHRoZSB2aWV3Cj4+IHZpc2liaWxpdHkgYW5k
IHRoZW4gY2FsbCB2bWZ1bmMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+PiAtLS0KPj4gQ0M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4gQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IENDOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4+IENDOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+
PiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+PiBD
QzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBDQzogIlJv
Z2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gQ0M6IEp1biBOYWthamlt
YSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KPj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBzaW5jZSBWNToKPj4gCS0gQ2hhbmdlIGlkeCB0
eXBlIGZyb20gdWludDE2X3QgdG8gdW5zaWduZWQgaW50Cj4+IAktIEFkZCByYyB2YXIgYW5kIGRy
b3BwZWQgdGhlIGVyciByZXR1cm4gZnJvbSBwMm1fZ2V0X3N1cHByZXNzX3ZlKCkuCj4+Cj4+IENo
YW5nZXMgc2luY2UgVjQ6Cj4+IAktIE1vdmUgcDJtIHNwZWNpZmljIHRoaW5ncyBmcm9tIGh2bSB0
byBwMm0uYwo+PiAJLSBBZGQgY29tbWVudCBmb3IgYWx0cDJtX2lkeCBib3VuZHMgY2hlY2sKPj4g
CS0gQWRkIGFsdHAybV9saXN0X2xvY2svdW5sb2NrKCkuCj4+Cj4+IENoYW5nZXMgc2luY2UgVjM6
Cj4+IAktIENoYW5nZSB2YXIgbmFtZSBmb3JtIGFsdHAybV9pZHggdG8gaWR4IHRvIHNob3J0ZW4g
bGluZSBsZW5ndGgKPj4gCS0gQWRkIGJvdW5kcyBjaGVjayBmb3IgaWR4Cj4+IAktIFVwZGF0ZSBj
b21taXQgbWVzc2FnZQo+PiAJLSBBZGQgY29tbWVudCBpbiB4ZW5jdHJsLmguCj4+Cj4+IENoYW5n
ZXMgc2luY2UgVjI6Cj4+IAktIERyb3AgaGFwX2VuYWJsZWQoKSBjaGVjawo+PiAJLSBSZWR1Y2Ug
dGhlIGluZGVudGF0aW9uIGRlcHRoIGluIGh2bS5jCj4+IAktIEZpeCBhc3NpZ25tZW50IGluZGVu
dGF0aW9uCj4+IAktIERyb3AgcGFkMi4KPj4KPj4gQ2hhbmdlcyBzaW5jZSBWMToKPj4gCS0gRHJv
cCBkb3VibGUgdmlldyBmcm9tIHRpdGxlLgo+PiAtLS0KPj4gICB0b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmN0cmwuaCAgIHwgIDcgKysrKysrKwo+PiAgIHRvb2xzL2xpYnhjL3hjX2FsdHAybS5jICAg
ICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKwoKLi4uIGEgdG9vbCBzdGFjayBhY2sg
YW5kIC4uLgoKPj4gICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgIHwgMTQgKysrKysr
KysrKysrKysKPj4gICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgIHwgIDIgKy0KCi4u
LiBhbmQgYSBWTVggb25lLCBhbHNvIGZvciAuLi4KCj4+ICAgeGVuL2FyY2gveDg2L21tL2hhcC9o
YXAuYyAgICAgICB8IDE1ICsrKysrKysrKysrKysrKwo+PiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0t
ZXB0LmMgICAgICAgfCAgMSArCgouLi4gdGhpcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
