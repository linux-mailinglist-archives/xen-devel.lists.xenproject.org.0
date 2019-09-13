Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F125B2357
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nQ0-0000qQ-OD; Fri, 13 Sep 2019 15:23:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8nPz-0000qG-Jh
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:23:27 +0000
X-Inumbo-ID: 6e40283c-d63a-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e40283c-d63a-11e9-b76c-bc764e2007e4;
 Fri, 13 Sep 2019 15:23:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33639ACC6;
 Fri, 13 Sep 2019 15:23:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
 <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
 <36e873f4-b6d1-bb8e-ec98-50e123636358@suse.com>
 <b70e27f7-7832-4e8f-f543-9d685eadcf88@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <58e9201c-dae8-d4d3-b989-2d817edab92a@suse.com>
Date: Fri, 13 Sep 2019 17:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b70e27f7-7832-4e8f-f543-9d685eadcf88@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMTkgMTY6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjA5LjIwMTkgMTY6
MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDEyOjMwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaAo+Pj4+IEBAIC0xNzQsNiArMTc0LDcgQEAgc3RydWN0IHZjcHUKPj4+PiAgICAg
ICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9ydW5zdGF0ZV9pbmZvX2NvbXBhdF90KSBjb21w
YXQ7Cj4+Pj4gICAgICAgIH0gcnVuc3RhdGVfZ3Vlc3Q7IC8qIGd1ZXN0IGFkZHJlc3MgKi8KPj4+
PiAgICAjZW5kaWYKPj4+PiArICAgIGludCAgICAgICAgICAgICAgbmV3X3N0YXRlOwo+Pj4KPj4+
IEkgcmVhbGl6ZSBpdHMgY291bnRlcnBhcnQgKHdyb25nbHkpIGlzIHBsYWluIGludCBpbiB0aGUg
cHVibGljCj4+PiBpbnRlcmZhY2UgLSBJIHRoaW5rIGl0IHNob3VsZCBiZSB1bnNpZ25lZCBpbnQg
aGVyZSBhbmQgdWludDMyX3QKPj4+IHRoZXJlLiBJJ20gcG9uZGVyaW5nIHdoZXRoZXIgdG8gZG8g
YSBzd2lwZSBhY3Jvc3MgYWxsIHB1YmxpYwo+Pj4gaGVhZGVycyB0byByZXBsYWNlIGFsbCB1c2Vz
IG9mIHBsYWluIGludCAoYW5kIGFsaWtlKSB3aXRoCj4+PiBmaXhlZCB3aWR0aCB0eXBlcy4KPj4K
Pj4gVGhlIGxpc3QgZm9yIGNsZWFudXBzIGlzIGJlY29taW5nIGxvbmdlci4uLgo+Pgo+PiBTbyBh
cmUgeW91IGZpbmUgd2l0aCBtZSBub3QgY2hhbmdpbmcgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQg
cmlnaHQgbm93Pwo+IAo+IFdlbGwsIGl0IHdvdWxkbid0IGJlIGJhZCBpZiB0aGUgbmV3IGZpZWxk
IHdhcyBvZiBhcHByb3ByaWF0ZSB0eXBlLgoKT2theSwgY2hhbmdlZCBpdC4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
