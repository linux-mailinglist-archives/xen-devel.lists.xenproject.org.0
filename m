Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A08BB1C6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCL4s-0005ez-3B; Mon, 23 Sep 2019 09:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0fYd=XS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCL4q-0005eu-Br
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:56:16 +0000
X-Inumbo-ID: 606e5391-dde8-11e9-95fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 606e5391-dde8-11e9-95fa-12813bfff9fa;
 Mon, 23 Sep 2019 09:56:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95F31AFF8;
 Mon, 23 Sep 2019 09:56:14 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
 <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
 <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
 <6f14e2e9-3e8f-5a48-cd01-aec41d61be66@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <80cfdfb0-fd25-1f58-45e6-96a0888a7b0a@suse.com>
Date: Mon, 23 Sep 2019 11:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6f14e2e9-3e8f-5a48-cd01-aec41d61be66@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Regression with vcpu runstate info and
 XEN_RUNSTATE_UPDATE
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 SergeyDyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMTkgMTE6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA5LjIwMTkgMTE6
NDIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE2LjA5LjE5IDE3OjQ0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE2LjA5LjIwMTkgMTY6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+
Pj4gQWZ0ZXIgYSBjb21wbGljYXRlZCBpbnZlc3RpZ2F0aW9uLCBpdCB0dXJucyBvdXQgdGhhdCBj
L3MgMjUyOWM4NTBlYTQ4Cj4+Pj4gYnJva2UgeGNfdmNwdV9nZXRpbmZvKCkuCj4+Pj4KPj4+PiBU
aGUgYnVnIGxvb2tzIGFzIGlmIGl0IGlzIGluIHZjcHVfcnVuc3RhdGVfZ2V0KCksIHdoaWNoIGRv
ZXNuJ3QgYWNjb3VudAo+Pj4+IGZvciBYRU5fUlVOU1RBVEVfVVBEQVRFIGFuZCBjYWxjdWxhdGlu
ZyBhIHdpbGRseSBpbmFwcHJvcHJpYXRlIGRlbHRhLgo+Pj4+IFVsdGltYXRlbHksIHRoZSByZXN1
bHQgb2YgWEVOX0RPTUNUTF9nZXR2Y3B1aW5mbyBlbmRzIHVwIHZlcnkKPj4+PiBvY2Nhc2lvbmFs
bHkgd2l0aCBvcC0+dS5nZXR2Y3B1aW5mby5jcHVfdGltZSBiZWluZyB3cm9uZyBieSAxIDw8IDYz
Lgo+Pj4+Cj4+Pj4gR2l2ZW4gc29tZSBvZiB0aGUgY2FsbGVycyBvZiB2Y3B1X3J1bnN0YXRlX2dl
dCgpLCBJIGRvbid0IHRoaW5rIGl0IGlzCj4+Pj4gcmVhc29uYWJsZSB0byBwYXVzZSB0aGUgVkNQ
VSB3aGlsZSByZWFkaW5nIHRoZSBydW5zdGF0ZSBpbmZvLsKgIEhvd2V2ZXIsCj4+Pj4gaXQgaXMg
YWxzbyB1bmNsZWFyIHdoZXRoZXIgd2FpdGluZyBmb3IgWEVOX1JVTlNUQVRFX1VQREFURSB0byBk
cm9wIGluCj4+Pj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpcyBzYWZlIGVpdGhlci4KPj4+Cj4+PiBG
aXJzdCBhbmQgZm9yZW1vc3QgSSdtIHdvbmRlcmluZyB3aGV0aGVyIHNpbXBseSBtYXNraW5nIG9m
Zgo+Pj4gWEVOX1JVTlNUQVRFX1VQREFURSBpbiB2Y3B1X3J1bnN0YXRlX2dldCgpIHdvdWxkbid0
IGJlIGFuCj4+PiBvcHRpb24uIFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBmZWF0dXJlIGFzIGEgd2hv
bGUgaXMgZm9yIHRoZQo+Pj4gaGlnaCBiaXQgdG8gbmV2ZXIgYmUgc2V0IGluIGFuIGFjdHVhbCB0
aW1lIHZhbHVlLCBhZnRlciBhbGwuCj4+Pgo+Pj4gVGhlIG90aGVyIG9wdGlvbiBJJ2Qgc2VlIGlz
IGZvciB2Y3B1X3J1bnN0YXRlX2dldCgpIHRvIGdhaW4KPj4+IGEgYm9vbGVhbiByZXR1cm4gdHlw
ZSBieSB3aGljaCBpdCB3b3VsZCBpbmRpY2F0ZSB0bwo+Pj4gaW50ZXJlc3RlZCBjYWxsZXJzIHdo
ZXRoZXIgdGhlIGxhdGNoaW5nIG9mIHRoZSB2YWx1ZXMKPj4+IGhhcHBlbmVkIHdoaWxlIGFuIHVw
ZGF0ZSB3YXMgaW4gcHJvZ3Jlc3MgZWxzZXdoZXJlLiBDYWxsZXJzCj4+PiBuZWVkaW5nIHRvIGNv
bnN1bWUgdGhlIHBvdGVudGlhbGx5IGluY29ycmVjdCByZXN1bHQgY291bGQKPj4+IHRoZW4gY2hv
b3NlIHRvIHdhaXQgb3Igc2NoZWR1bGUgYSBoeXBlcmNhbGwgY29udGludWF0aW9uLgo+Pj4KPj4+
IFRoZSAzcmQgb3B0aW9uIChsZXNzIGRlc2lyYWJsZSBpbW8gbm90IHRoZSBsZWFzdCBiZWNhdXNl
IGl0Cj4+PiB3b3VsZCByZXF1aXJlIHRvdWNoaW5nIGFsbCBjYWxsZXJzKSB3b3VsZCBiZSBmb3Ig
dGhlIGZ1bmN0aW9uCj4+PiB0byBnYWluIGEgcGFyYW1ldGVyIHRlbGxpbmcgaXQgd2hldGhlciB0
byBzcGluIHVudGlsCj4+PiBYRU5fUlVOU1RBVEVfVVBEQVRFIGlzIG9ic2VydmVkIGNsZWFyLgo+
Pgo+PiBBbmQgdGhlIDR0aCBvcHRpb24gd291bGQgYmUgdG8gbGV0IHZjcHVfcnVuc3RhdGVfZ2V0
KCkgb3BlcmF0ZSBvbiBhCj4+IGxvY2FsIHJ1bnN0YXRlIGNvcHkgaW4gb3JkZXIgdG8gYXZvaWQg
c2V0dGluZyBYRU5fUlVOU1RBVEVfVVBEQVRFIGluCj4+IHRoZSAib2ZmaWNpYWwiIHJ1bnN0YXRl
IGluZm8gb2YgdGhlIHZjcHUuCj4gCj4gQnV0IGl0IGFscmVhZHkgZG9lcyAtIGZpcnN0IHRoaW5n
IGl0IGRvZXMgaXMgYSBtZW1jcHkoKSBmcm9tIHRoZQo+ICJvZmZpY2lhbCIgaW5zdGFuY2UgdG8g
YSBjYWxsZXIgcHJvdmlkZWQgYnVmZmVyLiAoV2hhdCBpcwo+IGNvbmZ1c2luZywgYXQgbGVhc3Qg
dG8gbWUsIGlzIHRoYXQgdGhlIGxvY2sgZ2V0cyBkcm9wcGVkIGxhc3QsCj4gd2hlbiBldmVyeXRo
aW5nIGFmdGVyIHRoZSBtZW1jcHkoKSBhbHJlYWR5IGFjdHMgb24gdGhlIGNvcHkgb25seS4pCgpP
aCwgdGhhdCB3YXMgbXkgZmF1bHQgaGVyZTogSSBtZWFudCB0byBsZXQgdXBkYXRlX3J1bnN0YXRl
X2FyZWEoKQpvcGVyYXRlIG9uIGEgbG9jYWwgY29weSwgb2YgY291cnNlLgoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
