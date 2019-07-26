Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B7763EB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:55:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxpk-0000Sc-Jk; Fri, 26 Jul 2019 10:52:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X75G=VX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqxpj-0000ST-Lo
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:52:19 +0000
X-Inumbo-ID: 6f7c7635-af93-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f7c7635-af93-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:52:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29A68AD70;
 Fri, 26 Jul 2019 10:52:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190726101057.21324-1-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <65a9dd64-9ad5-e4d7-78b0-be1069085462@suse.com>
Date: Fri, 26 Jul 2019 12:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190726101057.21324-1-andrew.cooper3@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC] x86/shim: Refresh pvshim_defconfig
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
 Dario Faggioli <dfaggioli@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMTkgMTI6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gKiBBZGQgYSBkZXBlbmRl
bmN5IHNvIHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9kZWZjb25maWcgY2hhbmdl
cy4KPiAqIERlZmF1bHQgdG8gdGhlIE5VTEwgc2NoZWR1bGVyIG5vdyB0aGF0IGl0IHdvcmtzIHdp
dGggdmNwdSBvbmxpbmUvb2ZmbGluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gQ0M6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4g
Cj4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIERhcmlvJ3Mgc2VyaWVzLCBhbmQgY2FudCBnbyBpbiB1
bnRpbCB0aGVuLgo+IAo+IEFsc28gUkZDLgo+IAo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KPiAKPiBJIHRyaWVkIHR1cm5pbmcgb2ZmIE1FTV9BQ0NFU1MsIGJ1dCBJIGNhbid0
IGdldCBLY29uZmlnIHRvIGFjdHVhbGx5IHR1cm4gaXQKPiBvZmYgaW4gdGhlIGJ1aWxkLiAgV2hh
dCBpcyB0aGUgZGVhbCB3aXRoIE1FTV9BQ0NFU1NfQUxXQVlTX09OID8gIEl0IG1ha2VzIGl0Cj4g
aW1wb3NzaWJsZSB0byB0dXJuIE1FTV9BQ0NFU1Mgb2ZmLCBiZWNhdWUgaXQgaXMgc2VsZWN0ZWQg
YnkgeDg2LCB3aGljaCBsZWF2ZXMKPiBNRU1fQUNDRVNTIGVuYWJsZWQgYW5kIHVubW9kaWZpYWJs
ZS4KCm1vZGlmeSBhcmNoL3g4Ni9LY29uZmlnIGxpa2U6CgotCXNlbGVjdCBNRU1fQUNDRVNTX0FM
V0FZU19PTgorCXNlbGVjdCBNRU1fQUNDRVNTX0FMV0FZU19PTiBpZiAhUFZfU0hJTV9FWENMVVNJ
VkUKCj8/PwoKSnVlcmdlbgoKPiAtLS0KPiAgIHRvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZp
bGUgICAgICAgfCAyICstCj4gICB4ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmln
IHwgNSArKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUg
Yi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4gaW5kZXggODM1OTdmMDAxNy4uNzQz
NTQyMTI1MSAxMDA2NDQKPiAtLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4g
KysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+IEBAIC00MSw3ICs0MSw3IEBA
IGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKPiAgICQoRCk6
IGxpbmtmYXJtLnN0YW1wCj4gICAJJChNQUtFKSAtQyAkKEQpL3hlbiBkaXN0Y2xlYW4KPiAgIAo+
IC0kKEQpL3hlbi8uY29uZmlnOiAkKEQpCj4gKyQoRCkveGVuLy5jb25maWc6ICQoRCkgJChEKS94
ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCj4gICAJJChNQUtFKSAtQyAkKEBE
KSBLQlVJTERfREVGQ09ORklHPXB2c2hpbV9kZWZjb25maWcgWEVOX0NPTkZJR19FWFBFUlQ9eSBk
ZWZjb25maWcKPiAgIAo+ICAgeGVuLXNoaW06ICQoRCkveGVuLy5jb25maWcKPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZyBiL3hlbi9hcmNoL3g4Ni9j
b25maWdzL3B2c2hpbV9kZWZjb25maWcKPiBpbmRleCA5NzEwYWE2MjM4Li4zMjlhYWY5MDI5IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKPiArKysg
Yi94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCj4gQEAgLTUsNiArNSw3IEBA
IENPTkZJR19QVkhfR1VFU1Q9eQo+ICAgQ09ORklHX1BWX1NISU09eQo+ICAgQ09ORklHX1BWX1NI
SU1fRVhDTFVTSVZFPXkKPiAgIENPTkZJR19OUl9DUFVTPTMyCj4gK0NPTkZJR19TQ0hFRF9OVUxM
PXkKPiAgICMgRGlzYWJsZSBmZWF0dXJlcyBub3QgdXNlZCBieSB0aGUgUFYgc2hpbQo+ICAgIyBD
T05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0Cj4gICAjIENPTkZJR19CSUdNRU0gaXMgbm90
IHNldAo+IEBAIC0xMywxMCArMTQsMTIgQEAgQ09ORklHX05SX0NQVVM9MzIKPiAgICMgQ09ORklH
X0tFWEVDIGlzIG5vdCBzZXQKPiAgICMgQ09ORklHX1hFTk9QUk9GIGlzIG5vdCBzZXQKPiAgICMg
Q09ORklHX1hTTSBpcyBub3Qgc2V0Cj4gKyMgQ09ORklHX1NDSEVEX0NSRURJVCBpcyBub3Qgc2V0
Cj4gICAjIENPTkZJR19TQ0hFRF9DUkVESVQyIGlzIG5vdCBzZXQKPiAgICMgQ09ORklHX1NDSEVE
X1JURFMgaXMgbm90IHNldAo+ICAgIyBDT05GSUdfU0NIRURfQVJJTkM2NTMgaXMgbm90IHNldAo+
IC0jIENPTkZJR19TQ0hFRF9OVUxMIGlzIG5vdCBzZXQKPiAgICMgQ09ORklHX0xJVkVQQVRDSCBp
cyBub3Qgc2V0Cj4gICAjIENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdT
IGlzIG5vdCBzZXQKPiAgICMgQ09ORklHX0RFQlVHIGlzIG5vdCBzZXQKPiArIyBDT05GSUdfTUVN
X0FDQ0VTU19BTFdBWVNfT04gaXMgbm90IHNldAo+ICsjIENPTkZJR19NRU1fQUNDRVNTIGlzIG5v
dCBzZXQKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
