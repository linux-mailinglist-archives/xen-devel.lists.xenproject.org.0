Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D5178DF0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:02:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9QpD-000416-KL; Wed, 04 Mar 2020 10:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9QpB-000411-Qk
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:00:21 +0000
X-Inumbo-ID: f4e8b06a-5dfe-11ea-a378-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4e8b06a-5dfe-11ea-a378-12813bfff9fa;
 Wed, 04 Mar 2020 10:00:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 038FAAD45;
 Wed,  4 Mar 2020 10:00:18 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200303115253.47449-1-roger.pau@citrix.com>
 <9cc580b5-f7e1-16d1-02f8-f847d10f70dc@suse.com>
 <20200304095341.GQ24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2397893-01fc-78a2-6cd3-3b8dcd74cdff@suse.com>
Date: Wed, 4 Mar 2020 11:00:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304095341.GQ24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/dom0: improve PVH initrd and
 metadata placement
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxMDo1MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE1h
ciAwMywgMjAyMCBhdCAwNDo0MDozNlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDMuMDMuMjAyMCAxMjo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9i
dWlsZC5jCj4+PiBAQCAtNDkwLDYgKzQ5MCw0NSBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfcG9w
dWxhdGVfcDJtKHN0cnVjdCBkb21haW4gKmQpCj4+PiAgI3VuZGVmIE1CMV9QQUdFUwo+Pj4gIH0K
Pj4+ICAKPj4+ICtzdGF0aWMgcGFkZHJfdCBmaW5kX21lbW9yeShjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxmLAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNpemVfdCBzaXplKQo+Pj4gK3sKPj4+ICsgICAgcGFkZHJfdCBrZXJuZWxfc3Rh
cnQgPSAocGFkZHJfdCllbGYtPmRlc3RfYmFzZTsKPj4+ICsgICAgcGFkZHJfdCBrZXJuZWxfZW5k
ID0gKHBhZGRyX3QpKGVsZi0+ZGVzdF9iYXNlICsgZWxmLT5kZXN0X3NpemUpOwo+Pj4gKyAgICB1
bnNpZ25lZCBpbnQgaTsKPj4+ICsKPj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBkLT5hcmNoLm5y
X2U4MjA7IGkrKyApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHBhZGRyX3Qgc3RhcnQsIGVuZCA9
IGQtPmFyY2guZTgyMFtpXS5hZGRyICsgZC0+YXJjaC5lODIwW2ldLnNpemU7Cj4+PiArCj4+PiAr
ICAgICAgICAvKiBEb24ndCB1c2UgbWVtb3J5IGJlbG93IDFNQiwgYXMgaXQgY291bGQgb3Zlcndy
aXRlIHRoZSBCREEvRUJEQS4gKi8KPj4+ICsgICAgICAgIGlmICggZW5kIDw9IE1CKDEpIHx8IGQt
PmFyY2guZTgyMFtpXS50eXBlICE9IEU4MjBfUkFNICkKPj4+ICsgICAgICAgICAgICBjb250aW51
ZTsKPj4+ICsKPj4+ICsgICAgICAgIHN0YXJ0ID0gTUFYKFJPVU5EVVAoZC0+YXJjaC5lODIwW2ld
LmFkZHIsIFBBR0VfU0laRSksIE1CKDEpKTsKPj4+ICsKPj4+ICsgICAgICAgIGlmICggZW5kIDw9
IGtlcm5lbF9zdGFydCB8fCBzdGFydCA+PSBrZXJuZWxfZW5kICkKPj4+ICsgICAgICAgICAgICA7
IC8qIE5vIG92ZXJsYXAsIG5vdGhpbmcgdG8gZG8uICovCj4+PiArICAgICAgICAvKiBEZWFsIHdp
dGggdGhlIGtlcm5lbCBhbHJlYWR5IGJlaW5nIGxvYWRlZCBpbiB0aGUgcmVnaW9uLiAqLwo+Pj4g
KyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCA8PSBzdGFydCAmJiBrZXJuZWxfZW5kID4g
c3RhcnQgKQo+Pgo+PiBTaW5jZSwgYWNjb3JkaW5nIHRvIHlvdXIgcmVwbHkgb24gdjEsIFtrZXJu
ZWxfc3RhcnQsa2VybmVsX2VuZCkgaXMKPj4gYSBzdWJzZXQgb2YgW3N0YXJ0LGVuZCksIEkgdW5k
ZXJzdGFuZCB0aGF0IHRoZSA8PSBjb3VsZCBlcXVhbGx5Cj4+IHdlbGwgYmUgPT0gLSBkbyB5b3Ug
YWdyZWU/IEZyb20gdGhpcyB0aGVuIC4uLgo+Pgo+Pj4gKyAgICAgICAgICAgIC8qIFRydW5jYXRl
IHRoZSBzdGFydCBvZiB0aGUgcmVnaW9uLiAqLwo+Pj4gKyAgICAgICAgICAgIHN0YXJ0ID0gUk9V
TkRVUChrZXJuZWxfZW5kLCBQQUdFX1NJWkUpOwo+Pj4gKyAgICAgICAgZWxzZSBpZiAoIGtlcm5l
bF9zdGFydCA8PSBlbmQgJiYga2VybmVsX2VuZCA+IGVuZCApCj4+Cj4+IC4uLiBpdCBmb2xsb3dz
IHRoYXQgeW91IG5vdyBoYXZlIHR3byBvZmYtYnktMXMgaGVyZSwgYXMgeW91IGNoYW5nZWQKPj4g
dGhlIHJpZ2h0IHNpZGUgb2YgdGhlICYmIGluc3RlYWQgb2YgdGhlIGxlZnQgb25lICh0aGUgcmln
aHQgc2lkZQo+PiBjb3VsZCwgYXMgcGVyIGFib3ZlLCB1c2UgPT0gYWdhaW4pLiBVc2luZyA9PSBp
biBib3RoIHBsYWNlcyB3b3VsZCwKPj4gaW4gbGlldSBvZiBhIGNvbW1lbnQsIGltbyBtYWtlIG1v
cmUgdmlzaWJsZSB0byB0aGUgcmVhZGVyIHRoYXQKPj4gdGhlcmUgaXMgdGhpcyBzdWItcmFuZ2Ug
cmVsYXRpb25zaGlwIGJldHdlZW4gYm90aCByYW5nZXMuCj4gCj4gUmlnaHQsIEkgYWdyZWUgdG8g
Ym90aCB0aGUgYWJvdmUgYW5kIGhhdmUgYWRqdXN0ZWQgdGhlIGNvbmRpdGlvbnMuCj4gCj4+PiAr
ICAgICAgICAgICAgLyogVHJ1bmNhdGUgdGhlIGVuZCBvZiB0aGUgcmVnaW9uLiAqLwo+Pj4gKyAg
ICAgICAgICAgIGVuZCA9IGtlcm5lbF9zdGFydDsKPj4+ICsgICAgICAgIC8qIFBpY2sgdGhlIGJp
Z2dlc3Qgb2YgdGhlIHNwbGl0IHJlZ2lvbnMuICovCj4+Cj4+IFRoZW4gYWdhaW4gLSB3b3VsZG4n
dCB0aGlzIHBhcnQgc3VmZmljZT8gaWYgc3RhcnQgPT0ga2VybmVsX3N0YXJ0Cj4+IG9yIGVuZCA9
PSBrZXJuZWxfZW5kLCBvbmUgc2lkZSBvZiB0aGUgInNwbGl0IiByZWdpb24gd291bGQgc2ltcGx5
Cj4+IGJlIGVtcHR5Lgo+IAo+IFRoYXQncyB3aHkgaXQncyB1c2luZyBhbiBlbHNlIGlmIGNvbnN0
cnVjdCwgc28gdGhhdCB3ZSBvbmx5IGdldAo+IGhlcmUgaWYgdGhlIGtlcm5lbCBpcyBsb2FkZWQg
aW4gdGhlIG1pZGRsZSBvZiB0aGUgcmVnaW9uLCBhbmQgdGhlcmUKPiBhcmUgdHdvIHJlZ2lvbnMg
bGVmdCBhcyBwYXJ0IG9mIHRoZSBzcGxpdC4KCkJ1dCBteSBxdWVzdGlvbiBpcyAtIGRvIHdlIHJl
YWxseSBuZWVkIHRoZSBlYXJsaWVyIHBhcnRzIG9mCnRoaXMgaWYvZWxzZS1pZiBjaGFpbj8gV29u
J3QgdGhpcyBsYXR0ZXIgcGFydCBkZWFsIGZpbmQgd2l0aAp6ZXJvLXNpemVkIHJhbmdlcyBhdCBo
ZWFkIG9yIHRhaWwgb2YgdGhlIHJlZ2lvbj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
