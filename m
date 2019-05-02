Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE511949
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMB4T-0007y9-D6; Thu, 02 May 2019 12:44:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMB4R-0007xc-NE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:44:15 +0000
X-Inumbo-ID: f950b256-6cd7-11e9-b3cd-df1b6979fd66
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f950b256-6cd7-11e9-b3cd-df1b6979fd66;
 Thu, 02 May 2019 12:44:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:44:06 -0600
Message-Id: <5CCAE614020000780022B370@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:44:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1556797923-7107-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1556797923-7107-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/boot: Fix latent memory corruption with
 early_boot_opts_t
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
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDEzOjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYy9zIGViYjI2YjUwOWYgInhlbi94ODY6IG1ha2UgVkdBIHN1cHBvcnQgc2VsZWN0YWJs
ZSIgYWRkZWQgYW4gI2lmZGVmCj4gQ09ORklHX1ZJREVPIGludG8gdGhlIG1pZGRsZSB0aGUgYmFj
a2luZyBzcGFjZSBmb3IgZWFybHlfYm9vdF9vcHRzX3QsCj4gYnV0IGRpZG4ndCBhZGp1c3QgdGhl
IHN0cnVjdHVyZSBkZWZpbml0aW9uIGluIGNtZGxpbmUuYwo+IAo+IFRoaXMgb25seSBmdW5jdGlv
bnMgY29ycmVjdGx5IGJlY2F1c2UgdGhlIGFmZmVjdGVkIGZpZWxkcyBhcmUgYXQgdGhlIGVuZAo+
IG9mIHRoZSBzdHJ1Y3R1cmUsIGFuZCBjbWRsaW5lLmMgZG9lc24ndCB3cml0ZSB0byB0aGVtIGlu
IHRoaXMgY2FzZS4KPiAKPiBUbyByZXRhaW4gdGhlIHNsaW1taW5nIGVmZmVjdCBvZiBjb21waWxp
bmcgb3V0IENPTkZJR19WSURFTywgYWRqdXN0Cj4gY21kbGluZS5jIHdpdGggZW5vdWdoICNpZmRl
Zi1hcnkgdG8gbWFrZSBDJ3MgaWRlYSBvZiB0aGUgc3RydWN0dXJlIG1hdGNoCj4gdGhlIGRlY2xh
cmF0aW9uIGluIGFzbS4gIFRoaXMgcmVxdWlyZXMgYWRkaW5nIF9fbWF5YmVfdW51c2VkIGFubm90
YXRpb25zCj4gdG8gdHdvIGhlbHBlciBmdW5jdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggYSByZW1hcmsgYW5kIGEgcXVlc3Rpb246
Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2NtZGxpbmUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L2NtZGxpbmUuYwo+IEBAIC00MCwxMCArNDAsMTIgQEAgdHlwZWRlZiBzdHJ1Y3QgX19w
YWNrZWQgewo+ICAgICAgdTggb3B0X2VkZDsKPiAgICAgIHU4IG9wdF9lZGlkOwo+ICAgICAgdTgg
cGFkZGluZzsKPiArI2lmZGVmIENPTkZJR19WSURFTwo+ICAgICAgdTE2IGJvb3RfdmlkX21vZGU7
Cj4gICAgICB1MTYgdmVzYV93aWR0aDsKPiAgICAgIHUxNiB2ZXNhX2hlaWdodDsKPiAgICAgIHUx
NiB2ZXNhX2RlcHRoOwo+ICsjZW5kaWYKClNpbmNlIGFwcGFyZW50bHkgdGhlICJLZWVwIGluIHN5
bmMiIGNvbW1lbnQgaW4gdHJhbXBvbGluZS5TCndhc24ndCBzdWZmaWNpZW50LCBhbmQgc2luY2Ug
LSB3aXRoIHdoYXQgc2FpZCBjb21taXQgZGlkIC0gdGhlCmNvbW1lbnQgbm93IGxvb2tzIHVucmVs
YXRlZCB0byB0aGVzZSBkYXRhIGl0ZW1zIChmb3IgdGhlcmUKYmVpbmcgYSBibGFuayBsaW5lIGlu
IGJldHdlZW4gbm93KSBwZXJoYXBzIHRoaXMgc2hvdWxkIGJlCmFjY29tcGFuaWVkIGJ5IGJvdGgg
YSBTVEFSVCBhbmQgRU5EIG1hcmtlcj8KCkFuZCBwZXJoYXBzIHRoZSBjb21tZW50IG5leHQgdG8g
dmVzYV9zaXplIHNob3VsZCBhbHNvCmdldCBjb3JyZWN0ZWQgdG8gc2F5ICJ3aWR0aCB4IGhlaWdo
dCB4IGRlcHRoIi4KCk15IFItYiBzdGFuZHMgaWYgeW91IGRlY2lkZSB0byBmb2xkIHRoZXNlIGlu
LgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9kZWZzLmgKPiArKysgYi94ZW4vYXJjaC94ODYv
Ym9vdC9kZWZzLmgKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAjaW5jbHVkZSAiLi4vLi4vLi4vaW5j
bHVkZS94ZW4vc3RkYm9vbC5oIgo+ICAKPiAgI2RlZmluZSBfX3BhY2tlZAlfX2F0dHJpYnV0ZV9f
KChfX3BhY2tlZF9fKSkKPiArI2RlZmluZSBfX21heWJlX3VudXNlZAlfX2F0dHJpYnV0ZV9fKChf
X3VudXNlZF9fKSkKPiAgI2RlZmluZSBfX3N0ZGNhbGwJX19hdHRyaWJ1dGVfXygoX19zdGRjYWxs
X18pKQoKUHVyZWx5IG91dCBvZiBjdXJpb3NpdHkgKEkgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQg
dGhlIG9yZGVyaW5nCmhlcmUgYXMgbG9uZyBhcyB0aGUgc2V0IGRvZXNuJ3QgbWVhbmluZ2Z1bGx5
IGdyb3cpOiBCYXNlZCBvbgp3aGF0IGRpZCB5b3UgZGVjaWRlIHRoaXMgYmVzdCBnb2VzIGJldHdl
ZW4gdGhlIHR3byBleGlzdGluZwpvbmVzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
