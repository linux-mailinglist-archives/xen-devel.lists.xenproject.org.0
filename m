Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2024A7EA1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:00:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5R6K-0008J5-JN; Wed, 04 Sep 2019 08:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5R6J-0008J0-BU
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:57:15 +0000
X-Inumbo-ID: fccafb40-cef1-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fccafb40-cef1-11e9-a337-bc764e2007e4;
 Wed, 04 Sep 2019 08:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66982ABF4;
 Wed,  4 Sep 2019 08:57:12 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-5-jgross@suse.com>
 <900f969a-3454-758a-a427-09cb38f41963@suse.com>
 <eebe2817-55a2-5ff7-a056-607d014dc975@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8dd9642c-5d2d-6123-7600-99fff0cc3522@suse.com>
Date: Wed, 4 Sep 2019 10:57:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eebe2817-55a2-5ff7-a056-607d014dc975@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] xen: modify lock profiling interface
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMDozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
Njo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBUb2RheSBhZGRpbmcgbG9ja3MgbG9jYXRlZCBpbiBhIHN0cnVjdCB0
byBsb2NrIHByb2ZpbGluZyByZXF1aXJlcyBhCj4+PiB1bmlxdWUgdHlwZSBpbmRleCBmb3IgZWFj
aCBzdHJ1Y3R1cmUuIFRoaXMgbWFrZXMgaXQgaGFyZCB0byBhZGQgYW55Cj4+PiBuZXcgc3RydWN0
dXJlIGFzIHRoZSByZWxhdGVkIHN5c2N0bCBpbnRlcmZhY2UgbmVlZHMgdG8gYmUgY2hhbmdlZCwg
dG9vLgo+Pj4KPj4+IEluc3RlYWQgb2YgdXNpbmcgYW4gaW5kZXggdGhlIGFscmVhZHkgZXhpc3Rp
bmcgc3RydWN0IG5hbWUgc3BlY2lmaWVkCj4+PiBpbiBsb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3Ry
dWN0KCkgY2FuIGJlIHVzZWQgYXMgYW4gaWRlbnRpZmllciBpbnN0ZWFkLgo+Pj4KPj4+IE1vZGlm
eSB0aGUgc3lzY3RsIGludGVyZmFjZSB0byB1c2UgdGhlIHN0cnVjdCBuYW1lIGluc3RlYWQgb2Yg
dGhlIHR5cGUKPj4+IGluZGV4IGFuZCBhZGFwdCB0aGUgcmVsYXRlZCBjb2RpbmcgYWNjb3JkaW5n
bHkuIEluc3RlYWQgb2YgYW4gYXJyYXkgb2YKPj4+IHN0cnVjdCBhbmNob3JzIGZvciBsb2NrIHBy
b2ZpbGluZyB3ZSBub3cgdXNlIGEgbGlua2VkIGxpc3QgZm9yIHRoYXQKPj4+IHB1cnBvc2UuIFVz
ZSB0aGUgc3BlY2lhbCBpZHggdmFsdWUgLTEgZm9yIGNhc2VzIHdoZXJlIHRoZSBpZHggaXNuJ3QK
Pj4+IHJlbGV2YW50IChnbG9iYWwgbG9ja3MpIGFuZCBzaG91bGRuJ3QgYmUgcHJpbnRlZC4KPj4K
Pj4gSnVzdCB0byBtYWtlIGV4cGxpY2l0IHdoYXQgd2FzIGltcGxpZWQgYnkgbXkgdjEgcmVwbHk6
IEkgY2FuIHNlZSB3aHkKPj4geW91IHdhbnQgdG8gZG8gdGhpcywgYnV0IEknbSBub3QgcmVhbGx5
IGEgZnJpZW5kIG9mIHN0cmluZyBsaXRlcmFscwo+PiBpbiB0aGUgaHlwZXJjYWxsIGludGVyZmFj
ZSwgd2hlbiBiaW5hcnkgdmFsdWVzIGNhbiBhbHNvIGRvLiBTbyB0bwo+PiBtZSB0aGlzIGxvb2tz
IHRvIGJlIGEgbW92ZSBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uLiBUaGVyZWZvcmUsIHdoaWxlCj4+
IEknbSBmaW5lIHJldmlld2luZyBzdWNoIGEgY2hhbmdlLCBJJ20gbm90IHZlcnkgbGlrZWx5IHRv
IGV2ZW50dWFsbHkKPj4gYWNrIGl0Lgo+IAo+IEknbGwgd3JpdGUgdHdvIGV4YW1wbGUgcGF0Y2hl
cyBmb3IgYWRkaW5nIHN1cHBvcnQgb2YgbG9jayBwcm9maWxpbmcgaW4gYQo+IG5ldyBzdHJ1Y3R1
cmUsIG9uZSB3aXRoIHBhdGNoIDQgb2YgdGhpcyBzZXJpZXMgYXBwbGllZCBhbmQgb25lIGZvciB0
aGUKPiBpbnRlcmZhY2Ugd2l0aG91dCB0aGF0IHBhdGNoLiBUaGlzIHNob3VsZCBtYWtlIGNsZWFy
IHdoeSBJJ20gcmVhbGx5IGluCj4gZmF2b3Igb2YgdGhpcyBwYXRjaC4KCldlbGwsIEkgY2FuIGVh
c2lseSBzZWUgaG93IG9uZSB3aWxsIGJlIHF1aXRlIGEgYml0IHNtYWxsZXIgdGhhbiB0aGUKb3Ro
ZXIsIGJ1dCBwYXRjaCBzaXplIC8gaW50cnVzaXZlbmVzcyBpcyBub3QgdGhlIG9ubHkgYXNwZWN0
IHRvCmNvbnNpZGVyLiBJT1cgSSdtIGFmcmFpZCB0aGUgZGlmZmVyZW5jZSB3b24ndCBjaGFuZ2Ug
bXkgb3BpbmlvbiBvbgpzdHJpbmcgbGl0ZXJhbHMgaW4gaHlwZXJjYWxsIGludGVyZmFjZXMuIEJ1
dCByZWNhbGwsIHlvdSBkb24ndApkZXBlbmQgb24gbWUgYWNraW5nIHRoaXMgcGF0Y2ggb2YgeW91
cnMsIHRoZXJlIGFyZSBlbm91Z2ggb3RoZXIKcGVvcGxlIHdobyBjYW4gaWYgdGhleSBhcmUgaGFw
cHkgd2l0aCBzdWNoIGEgbW9kZWwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
