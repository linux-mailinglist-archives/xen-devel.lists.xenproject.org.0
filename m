Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948D119F2
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBZj-000313-KD; Thu, 02 May 2019 13:16:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBZh-00030w-HS
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:16:33 +0000
X-Inumbo-ID: 803d5a48-6cdc-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 803d5a48-6cdc-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:16:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:16:30 -0600
Message-Id: <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:16:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
In-Reply-To: <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE0OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDUvMjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jCj4+IEBAIC0xNDUwLDE3ICsxNDUwLDM2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICoKPj4gICAgICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICFoZC0+
cGxhdGZvcm1fb3BzICkKPj4gICAgICAgICAgcmV0dXJuIDA7Cj4+ICAKPj4gLSAgICAvKiBQcmV2
ZW50IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0gc2hhcmluZyBoYXZlIGJlZW4g
Cj4+IC0gICAgICogZW5hYmxlZCBmb3IgdGhpcyBkb21haW4gKi8KPj4gLSAgICBpZiAoIHVubGlr
ZWx5KGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKPj4gLSAgICAgICAgICAgICAg
ICAgIHZtX2V2ZW50X2NoZWNrX3JpbmcoZC0+dm1fZXZlbnRfcGFnaW5nKSB8fAo+PiArICAgIGRv
bWFpbl9sb2NrKGQpOwo+PiArCj4+ICsgICAgLyoKPj4gKyAgICAgKiBQcmV2ZW50IGRldmljZSBh
c3NpZ25tZW50IGlmIGFueSBvZgo+PiArICAgICAqIC0gbWVtIHBhZ2luZwo+PiArICAgICAqIC0g
bWVtIHNoYXJpbmcKPj4gKyAgICAgKiAtIHRoZSBwMm1fcmFtX3JvIHR5cGUKPj4gKyAgICAgKiAt
IGdsb2JhbCBsb2ctZGlydHkgbW9kZQo+IAo+IFhlblNlcnZlciBoYXMgd29ya2luZyBsaXZlIG1p
Z3JhdGlvbiB3aXRoIEdQVXMsIHdoaWNoIHRoaXMgY2hhbmdlIHdvdWxkCj4gcmVncmVzcy4KPiAK
PiBCZWhpbmQgdGhlIHNjZW5lcywgd2UgY29tYmluZSBYZW4ncyBsb2dkaXJ0eSBiaXRtYXAgd2l0
aCBvbmUgcHJvdmlkZWQgYnkKPiB0aGUgR1BVLCB0byBlbnN1cmUgdGhhdCBhbGwgZGlydHkgdXBk
YXRlcyBhcmUgdHJhY2tlZC4KCkJ1dCB0aGlzIHNheXMgbm90aGluZyBmb3IgdGhlIHBhdGNoIGhl
cmUuIEFzIGxvbmcgYXMgaXQgZG9lc24ndAp3b3JrIGluIHRoZSBzdGFnaW5nIHRyZWUsIGl0IHNo
b3VsZCBiZSBwcmV2ZW50ZWQuIEluIFhlblNlcnZlcgp5b3UgY291bGQgdGhlbiBwYXRjaCBvdXQg
dGhhdCBjaGVjayBhbmQgY29tbWVudCBsaW5lIHRvZ2V0aGVyCndpdGggd2hhdGV2ZXIgb3RoZXIg
Y2hhbmdlcyB5b3UgaGF2ZSB0byBtYWtlIGZvciB0aGlucyB0bwp3b3JrLiBBbHRlcm5hdGl2ZWx5
IHlvdSBjb3VsZCBzdWJtaXQgYSBwYXRjaCAob3IgbW9yZSkgdG8gbWFrZQppdCB3b3JrIGluIHN0
YWdpbmcgdG9vLCBhdCB3aGljaCBwb2ludCBJJ2QgaGF2ZSB0byByZS1iYXNlIHRoZQpvbmUgaGVy
ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
