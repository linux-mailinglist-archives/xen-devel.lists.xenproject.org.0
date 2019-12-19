Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37511260EE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:37:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihu4x-00073F-3p; Thu, 19 Dec 2019 11:34:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihu4v-00073A-BC
 for xen-devel@lists.xen.org; Thu, 19 Dec 2019 11:34:49 +0000
X-Inumbo-ID: 8b0ced14-2253-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0ced14-2253-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 11:34:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E009AF39;
 Thu, 19 Dec 2019 11:34:39 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
Date: Thu, 19 Dec 2019 12:35:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxMjoyMywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAxOC8xMi8yMDE5
IDExOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMTIuMjAxOSAxNjo0NiwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IEhpZGUgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0IGNh
biBoZWxwIGlkZW50aWZ5IHRoZSBydW5uaW5nIFhlbgo+Pj4gYmluYXJ5IHZlcnNpb246Cj4+Pgo+
Pj4gICAgIFhFTlZFUl9leHRyYXZlcnNpb24KPj4+ICAgICBYRU5WRVJfY29tcGlsZV9pbmZvCj4+
PiAgICAgWEVOVkVSX2NhcGFiaWxpdGllcwo+Pgo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCBleHBvc2lu
ZyB0aGlzIG9uZT8KPiAKPiBleHRyYXZlcnNpb24gY2FuIGhlbHAgaWRlbnRpZnkgdGhlIGV4YWN0
IHJ1bm5pbmcgWGVuIGJpbmFyeSAoYW5kIEkgbXVzdAo+IHNheSB0aGF0IGF0IENpdHJpeCB3ZSBh
ZGQgc29tZSBhZGRpdGlvbmFsIHZlcnNpb24gaW5mb3JtYXRpb24gdGhlcmUpLgo+IGNvbXBpbGVf
aW5mbyB3aWxsIGlkZW50aWZ5IGNvbXBpbGVyIGFuZCBtYW55IHNwZWN1bGF0aXZlIG1pdGlnYXRp
b25zCj4gYXJlIHByb3ZpZGVkIGJ5IGNvbXBpbGVycyB0aGVzZSBkYXlzLiBOb3Qgc3VyZSBpZiBp
dCdzIHdvcnRoIGhpZGluZwo+IGNhcGFiaWxpdGllcywgYnV0IE9UT0ggSSBkb24ndCBzZWUgaG93
IGd1ZXN0cyBjb3VsZCBtZWFuaW5nZnVsbHkgdXNlIGl0LgoKV2VsbCwgbXkgcXVlc3Rpb24gKHVz
aW5nICJ0aGlzIiwgbm90ICJ0aGVzZSIpIHdhcyByZWFsbHkgbWFpbmx5IG9uCnRoZSBsYXN0IGl0
ZW0uIEkgY2FuIHNlZSBob3cgZXh0cmF2ZXJzaW9uIGNhbiBwcm92aWRlIGNsdWVzLiBJJ20KaGF2
aW5nIGRpZmZpY3VsdHkgc2VlaW5nIGhvdyB0aGUgY29tcGlsZXIgKGxpdHRsZSBiaXQgb2YpIGRl
dGFpbHMKY2FuIHByb3ZpZGUgc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0byBiZWNvbWUgbGV2ZXJh
Z2FibGUuCgo+Pj4gICAgIFhFTlZFUl9jaGFuZ2VzZXQKPj4+ICAgICBYRU5WRVJfY29tbWFuZGxp
bmUKPj4+ICAgICBYRU5WRVJfYnVpbGRfaWQKPj4+Cj4+PiBSZXR1cm4gYSBtb3JlIGN1c3RvbWVy
IGZyaWVuZGx5IGVtcHR5IHN0cmluZyBpbnN0ZWFkIG9mICI8ZGVuaWVkPiIKPj4+IHdoaWNoIHdv
dWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UgZG1pZGVjb2RlLj4KPj4gSSB0aGluayAiPGRlbmll
ZD4iIGlzIHF1aXRlIGZpbmUgZm9yIG1hbnkgb2YgdGhlIG9yaWdpbmFsIHB1cnBvc2VzLgo+PiBN
YXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZmlsdGVyIGZvciB0aGlzIHdoZW4gcG9wdWxhdGlu
ZyBndWVzdAo+PiBETUkgdGFibGVzPwo+IAo+IEkgZG9uJ3Qga25vdyBob3cgRE1JIHRhYmxlcyBh
cmUgcG9wdWxhdGVkLCBidXQgbm90aGluZyBzdG9wcyBhIGd1ZXN0Cj4gZnJvbSB1c2luZyB0aGVz
ZSBoeXBlcmNhbGxzIGRpcmVjdGx5LgoKQW5kIHRoaXMgaXMgcHJlY2lzZWx5IHRoZSBjYXNlIHdo
ZXJlIEkgdGhpbmsgIjxkZW5pZWQ+IiBpcyBiZXR0ZXIKdGhhbiBhbiBlbXB0eSBzdHJpbmcuCgo+
Pj4gICAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fSE9PSywgY3VycmVudC0+
ZG9tYWluLCBOVUxMKTsKPj4+ICsKPj4+ICsgICAgY2FzZSBYRU5WRVJfZXh0cmF2ZXJzaW9uOgo+
Pj4gKyAgICBjYXNlIFhFTlZFUl9jb21waWxlX2luZm86Cj4+PiArICAgIGNhc2UgWEVOVkVSX2Nh
cGFiaWxpdGllczoKPj4+ICsgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+Pj4gKyAgICBjYXNl
IFhFTlZFUl9jb21tYW5kbGluZToKPj4+ICsgICAgY2FzZSBYRU5WRVJfYnVpbGRfaWQ6Cj4+PiAg
ICAgIGRlZmF1bHQ6Cj4+Cj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBhZGQgYWxsIG9mIHRoZXNlIG5l
eHQgdG8gdGhlIGRlZmF1bHQgY2FzZS4KPj4gTm90ZSBob3cgY29tbWFuZGxpbmUgYW5kIGJ1aWxk
X2lkIGhhdmUgYmVlbiBjb21pbmcgaGVyZSBhbHJlYWR5Cj4+IChhbmQgdGhlcmUgd291bGQgbmVl
ZCB0byBiZSBmdXJ0aGVyIGp1c3RpZmljYXRpb24gZm9yIGV4cG9zaW5nCj4+IHRoZW0gb24gZGVi
dWcgYnVpbGRzLCBzaG91bGQgdGhpcyBxdWVzdGlvbmFibGUgYmVoYXZpb3IgLSBzZWUKPj4gYWJv
dmUgLSBiZSByZXRhaW5lZCkuCj4gCj4gSSBmaW5kIHRoYXQgZXhwbGljaXRseSBsaXN0aW5nIGFs
bCB0aGUgY2FzZXMgaXMgYmV0dGVyIGZvciBjb2RlCj4gcmVhZGFiaWxpdHksIGJ1dCBJIGRvbid0
IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBoZXJlLgoKV2VsbCwgSSdtIHZpZXdpbmcgaXQga2luZCBv
ZiB0aGUgb3Bwb3NpdGUsIGFzIGJlaW5nIHVubmVjZXNzYXJ5CmNsdXR0ZXIgKGFuZCBoZW5jZSBo
YXJtaW5nIHJlYWRhYmlsaXR5KS4gV2UnbGwgc2VlIHdoYXQgb3RoZXJzCnRoaW5rLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
