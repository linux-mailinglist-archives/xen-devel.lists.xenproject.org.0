Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D519EC4
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6DD-0000IC-OE; Fri, 10 May 2019 14:09:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP6DC-0000I7-SE
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:09:22 +0000
X-Inumbo-ID: 3463fd0c-732d-11e9-96a4-f3c0549c844f
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3463fd0c-732d-11e9-96a4-f3c0549c844f;
 Fri, 10 May 2019 14:09:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,453,1549929600"; d="scan'208";a="89700629"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
 <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
 <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
 <5e873087-73cd-5bdf-f414-e9eede0207a4@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <673c54d0-8b3f-9d92-b3c3-2210163c970e@citrix.com>
Date: Fri, 10 May 2019 15:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5e873087-73cd-5bdf-f414-e9eede0207a4@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDUvMjAxOSAxNTowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Cj4KPiBPbiAxMC8wNS8y
MDE5IDE1OjA1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxMC8wNS8yMDE5IDE1OjAyLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjQ2LCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IE9uIDEwLzA1LzIwMTkgMTQ6NDEsIEphbiBCZXVsaWNo
IHdyb3RlOgo+Pj4+Pj4+PiBPbiAxMC4wNS4xOSBhdCAxNTozNCwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiB3cm90ZToKPj4+Pj4+IE9uIDEwLzA1LzIwMTkgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+
IHdyb3RlOgo+Pj4+Pj4+PiBAQCAtMTAzMCwxOSArMTAzMSwxOSBAQCBsb25nIHAybV9wdF9hdWRp
dF9wMm0oc3RydWN0IHAybV9kb21haW4KPj4+Pj4+Pj4gKnAybSkKPj4+Pj4+Pj4gQEAgLTI3OTUs
NTQgKzI3OTUsNTQgQEAgdm9pZCBhdWRpdF9wMm0oc3RydWN0IGRvbWFpbiAqZCwKPj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOwo+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoCBwYWdlX2xpc3RfZm9yX2VhY2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgewo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgbWZuID0g
bWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgbWZuID0g
cGFnZV90b19tZm4ocGFnZSk7Cj4+Pj4+Pj4+IMKgwqDCoCAtwqDCoMKgwqDCoMKgwqAgUDJNX1BS
SU5USygiYXVkaXRpbmcgZ3Vlc3QgcGFnZSwgbWZuPSUjbHhcbiIsIG1mbik7Cj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBQMk1fUFJJTlRLKCJhdWRpdGluZyBndWVzdCBwYWdlLCBtZm49JSJQUklf
bWZuIlxuIiwKPj4+Pj4+Pj4gbWZuX3gobWZuKSk7Cj4+Pj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG9kID0gcGFnZV9nZXRfb3duZXIocGFnZSk7Cj4+Pj4+Pj4+IMKgwqDCoCDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggb2QgIT0gZCApCj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgewo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQMk1fUFJJTlRL
KCJ3cm9uZyBvd25lciAlI2x4IC0+ICVwKCV1KSAhPSAlcCgldSlcbiIsCj4+Pj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZm4sIG9kLCAob2Q/b2Qt
PmRvbWFpbl9pZDotMSksIGQsCj4+Pj4+Pj4+IGQtPmRvbWFpbl9pZCk7Cj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFAyTV9QUklOVEsoIndyb25nIG93bmVyICUiUFJJX21mbiIgLT4g
JXAoJXUpICE9Cj4+Pj4+Pj4+ICVwKCV1KVxuIiwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1mbl94KG1mbiksIG9kLCAob2Q/b2QtPmRvbWFp
bl9pZDotMSksCj4+Pj4+Pj4+IGQsIGQtPmRvbWFpbl9pZCk7Cj4+Pj4+Pj4gUGxlYXNlIGJlIGNh
cmVmdWwgbm90IHRvIGRyb3AgMHggcHJlZml4ZXMgZnJvbSB0aGUgcmVzdWx0aW5nIG91dHB1dAo+
Pj4+Pj4+ICh3aGljaCBhcmUgYW4gZWZmZWN0IG9mIHRoZSAjIGZsYWcgdGhhdCB5b3UgZGVsZXRl
KSwgYXQgbGVhc3Qgd2hlbgo+Pj4+Pj4+IGxvZyBtZXNzYWdlcyBjb250YWluIGEgbWl4IG9mIGhl
eCBhbmQgZGVjIG51bWJlcnMuIChJIGFtLCBidHcsCj4+Pj4+Pj4gbm90IGNvbnZpbmNlZCB0aGF0
IHN3aXRjaGluZyB0byBQUklfbWZuIGhlcmUgaXMgaGVscGZ1bC4pCj4+Pj4+PiBMYXN0IHRpbWUg
SSBrZWVwZWQgJSMgZm9yIE1GTiwgSSBoYXZlIGJlZW4gYXNrZWQgdG8gcmVtb3ZlIHRoZSAjLgo+
Pj4+Pj4gSSBwcmVmZXIKPj4+Pj4+IGhhdmluZyAweCBmb3IgYWxsIHRoZSBoZXgsIGFuZCBJIGFt
IGhhcHB5IHRvIGJlIGtlZXAgYXMgaXMuIEJ1dCBJCj4+Pj4+PiB3b3VsZCBsaWtlIGEKPj4+Pj4+
IGJpdCBvZiBjb25zaXN0ZW5jeSBvbiB0aGUgd2F5IHdlIHByaW50IE1GTi4uLgo+Pj4+PiBXZWxs
LCAiJSMiUFJJX21mbiBpcyBib2d1cyAoYmVjYXVzZSBvZiB0aGUgY29tYmluYXRpb24gd2l0aCB0
aGUKPj4+Pj4gbWluaW11bSB3aWR0aCBzcGVjaWZpY2F0aW9uKSwgc28gaXQgb3VnaHQgdG8gYmUg
IiUjbHgiIG9yCj4+Pj4+ICIweCUiUFJJX21mbi4KPj4+Pj4gSGF2ZSB5b3UgcmVhbGx5IGJlZW4g
YXNrZWQgZm9yIHNvbWV0aGluZyBlbHNlPyBJZiBzbywgYW5kIGlmIGl0Cj4+Pj4+IHdhcyBtZSwK
Pj4+Pj4gdGhlbiBJIGFwb2xvZ2l6ZS4KPj4+PiBJIGFtIG5vdCBzdXJlIHdoeSB0aGlzIGlzIGJv
Z3VzLiBUaGUgdGhpbmcgaXMgdXNpbmcgZGlmZmVyZW50Cj4+Pj4gZm9ybWF0IGZvciB0aGUgTUZO
Cj4+Pj4gbWFrZXMgaXQgZGlmZmljdWx0IHRvIHJlYWQgYSBtZXNzYWdlIHdpdGhvdXQgbG9va2lu
ZyBmb3JtYXQgc3RyaW5nLgo+Pj4gV2UgbG9vayB0byBiZSBpbiBhZ3JlZW1lbnQgdGhhdCB0aGVy
ZSBzaG91bGQgYmUgYSAweCBwcmVmaXggaGVyZS4KPj4+IFdoYXQgSSdtIGFza2luZyBmb3IgaXMg
dG8gYXZvaWQgdGhlIHZhbHVlIGxvZ2dlZCB0byBkZS1nZW5lcmF0ZSBpbnRvCj4+PiBhIDMtZGln
aXQgb25lICgweD8/Pykgd2hlbiBhIGZpdmUgZGlnaXQgb25lIGlzIG1lYW50IChzZWUgUFJJX21m
bikuCj4+PiBOb3QgdG8gc3BlYWsgb2YgdGhlIGZ1cnRoZXIgaW5jb25zaXN0ZW50IHN0cmluZyB0
aGF0IHdvdWxkIGJlIGxvZ2dlZAo+Pj4gZm9yIE1GTiAwLgo+Pgo+PiBUaGUgb3ZlcndoZWxtaW5n
IG1ham9yaXR5IHdheSBvZiBwcmludGluZyBtZm5zIGlzIHZpYToKPj4KPj4gbWZuICUiUFJJX21m
biIKPj4KPj4gd2hpY2ggaXMgYWxtb3N0IGZ1bGx5IGNvbnNpc3RlbnQgYWNyb3NzIHRoZSB4ODYg
Y29kZS4KPgo+IElmIEkgZ290IGl0IHJpZ2h0LCB0aGUgZm9ybWF0IGhlcmUgd291bGQgYmUgIndy
b25nIG93bmVyIG1mbgo+ICUiUFJJX21mbiIuIEFtIEkgY29ycmVjdD8KCklNTywgeWVzLCBidXQg
c2VlIG15IHNwZWNpZmljIGVtYWlsIGZvciBhbiBldmVuIGJldHRlciBhbHRlcm5hdGl2ZS4KCn5B
bmRyZXcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
