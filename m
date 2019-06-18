Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80B49E8A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBcF-0005os-Se; Tue, 18 Jun 2019 10:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdBcE-0005on-Nf
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:45:26 +0000
X-Inumbo-ID: 2bce7210-91b6-11e9-9c5c-6f8824a8d194
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bce7210-91b6-11e9-9c5c-6f8824a8d194;
 Tue, 18 Jun 2019 10:45:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 04:45:21 -0600
Message-Id: <5D08C0BB020000780023934A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 04:45:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E2B0200007800237E00@prv1-mh.provo.novell.com>
 <246c43d3-6725-597b-eb1d-32c42ff68c9e@citrix.com>
In-Reply-To: <246c43d3-6725-597b-eb1d-32c42ff68c9e@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/9] AMD/IOMMU: use bit field for control
 register
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDExOjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFsc28gaW50
cm9kdWNlIGEgZmllbGQgaW4gc3RydWN0IGFtZF9pb21tdSBjYWNoaW5nIHRoZSBtb3N0IHJlY2Vu
dGx5Cj4+IHdyaXR0ZW4gY29udHJvbCByZWdpc3Rlci4gQWxsIHdyaXRlcyBzaG91bGQgbm93IGhh
cHBlbiBleGNsdXNpdmVseSBmcm9tCj4+IHRoYXQgY2FjaGVkIHZhbHVlLCBzdWNoIHRoYXQgaXQg
aXMgZ3VhcmFudGVlZCB0byBiZSB1cCB0byBkYXRlLgo+Pgo+PiBUYWtlIHRoZSBvcHBvcnR1bml0
eSBhbmQgYWRkIGZ1cnRoZXIgZmllbGRzLiBBbHNvIGNvbnZlcnQgYSBmZXcgYm9vbGVhbgo+PiBm
dW5jdGlvbiBwYXJhbWV0ZXJzIHRvIGJvb2wsIHN1Y2ggdGhhdCB1c2Ugb2YgISEgY2FuIGJlIGF2
b2lkZWQuCj4gCj4gQ3JpdGljYWxseSBhbHNvLCBzb21lIHByZXZpb3VzIHdyaXRlbCgpJ3MgaGF2
ZSB0dXJuZWQgaW50byB3cml0ZXEoKSwKPiB3aGljaCBuZWVkcyBjYWxsaW5nIG91dC4KClN1cmUs
IGRvbmUuCgo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRl
ZnMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMu
aAo+PiBAQCAtMjk1LDM4ICsyOTUsNTUgQEAgc3RydWN0IGFtZF9pb21tdV9kdGUgewo+Pgo+PiAr
dW5pb24gYW1kX2lvbW11X2NvbnRyb2wgewo+PiArICAgIHVpbnQ2NF90IHJhdzsKPj4gKyAgICBz
dHJ1Y3Qgewo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaW9tbXVfZW46MTsKPj4gKyAgICAgICAg
dW5zaWduZWQgaW50IGh0X3R1bl9lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZXZlbnRf
bG9nX2VuOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBldmVudF9pbnRfZW46MTsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGNvbV93YWl0X2ludF9lbjoxOwo+PiArICAgICAgICB1bnNpZ25l
ZCBpbnQgaW52X3RpbWVvdXQ6MzsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBhc3NfcHc6MTsK
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHJlc19wYXNzX3B3OjE7Cj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBjb2hlcmVudDoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaXNvYzoxOwo+PiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgY21kX2J1Zl9lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBp
bnQgcHByX2xvZ19lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgcHByX2ludF9lbjoxOwo+
PiArICAgICAgICB1bnNpZ25lZCBpbnQgcHByX2VuOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGlu
dCBndF9lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ2FfZW46MTsKPj4gKyAgICAgICAg
dW5zaWduZWQgaW50IGNydzo0Owo+IAo+IFRoaXMgZmllbGQgZG9lcyBoYXZlIGFuIGFzc2lnbmVk
IG5hbWUsIGJ1dCBpcyBhbHNvIGRvY3VtZW50ZWQgYXMgUmVzMAo+IGZvciBmb3J3YXJkcyBjb21w
YXRpYmlsaXR5LiAgSSB0aGluayB0aGlzIGZpZWxkIHdhbnRzIGhhbmRsaW5nCj4gY29uc2lzdGVu
dGx5IHdpdGguLi4KPiAKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHNtaWZfZW46MTsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IHNsZl93Yl9kaXM6MTsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50
IHNtaWZfbG9nX2VuOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnYW1fZW46MzsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGdhX2xvZ19lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
Z2FfaW50X2VuOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkdWFsX3Bwcl9sb2dfZW46MjsK
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IGR1YWxfZXZlbnRfbG9nX2VuOjI7Cj4+ICsgICAgICAg
IHVuc2lnbmVkIGludCBkZXZfdGJsX3NlZ19lbjozOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
cHJpdl9hYnJ0X2VuOjI7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBwcHJfYXV0b19yc3BfZW46
MTsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1hcmNfZW46MTsKPj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGJsa19zdG9wX21ya19lbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgcHByX2F1
dG9fcnNwX2FvbjoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgOjI7Cj4gCj4gLi4uIHRoaXMs
IHdoZXJlIHlvdSBoYXZlIGRyb3BwZWQgdGhlIERvbWFpbklEUE5FIGJpdCAod2hhdGV2ZXIgdGhl
IFBOCj4gc3RhbmRzIGZvcikuCgpJIGd1ZXNzIHRoZSB3b3JrIHdhcyBkb25lIHdpdGggYW4gZWFy
bGllciB2ZXJzaW9uIG9mIHRoZSBkb2MuIEkndmUKbm93IGFkZGVkIHRoZSBtaXNzaW5nIG5hbWUg
b2YgdGhlIGZpZWxkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
