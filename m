Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208882C606
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 14:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVakl-0001ou-ST; Tue, 28 May 2019 11:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVakk-0001oo-Sf
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:58:50 +0000
X-Inumbo-ID: f28c2e42-813f-11e9-b3b0-9790817ddf4d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f28c2e42-813f-11e9-b3b0-9790817ddf4d;
 Tue, 28 May 2019 11:58:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E0B0BAEF9;
 Tue, 28 May 2019 11:58:45 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
 <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5ea454f1-79f7-2974-0736-3262870446ab@suse.com>
Date: Tue, 28 May 2019 13:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxMzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGhhdmluZyBh
IGZ1bGwgYmxvd24gc2NoZWR1bGVyIHJ1bm5pbmcgZm9yIHRoZSBmcmVlIGNwdXMKPj4gYWRkIGEg
dmVyeSBtaW5pbWFsaXN0aWMgc2NoZWR1bGVyIGZvciB0aGF0IHB1cnBvc2Ugb25seSBldmVyIHNj
aGVkdWxpbmcKPj4gdGhlIHJlbGF0ZWQgaWRsZSB2Y3B1LiBUaGlzIGhhcyB0aGUgYmlnIGFkdmFu
dGFnZSBvZiBub3QgbmVlZGluZyBhbnkKPj4gcGVyLWNwdSwgcGVyLWRvbWFpbiBvciBwZXItc2No
ZWR1bGluZyB1bml0IGRhdGEgZm9yIGZyZWUgY3B1cyBhbmQgaW4KPj4gdHVybiBzaW1wbGlmeWlu
ZyBtb3ZpbmcgY3B1cyB0byBhbmQgZnJvbSBjcHVwb29scyBhIGxvdC4KPiAKPiBBbmQgdGhlIG51
bGwgc2NoZWR1bGVyIGlzIG5vdCBtaW5pbWFsaXN0aWMgZW5vdWdoPwoKVGhlIG1haW4gZGlzYWR2
YW50YWdlIG9mIHRoZSBudWxsIHNjaGVkdWxlciBhcmUgdGhlIG5lZWQgZm9yIHByaXZhdGUKZGF0
YSAod2hpY2ggaGFzIHRvIGJlIGFsbG9jYXRlZC9mcmVlZCBvbiBzY2hlZHVsZXIgc3dpdGNoKSwg
aXRzIG5vdAp5ZXQgcGVyZmVjdCBzdGFiaWxpdHksIGFuZCBpdHMgImNvbXBsZXhpdHkiIChlLmcu
IDkwMCBsaW5lcyB2cy4gNTApLgoKPiAKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+
PiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4+IEBAIC0zNTAsOCArMzUwLDYgQEAgdm9p
ZCBzdGFydF9zZWNvbmRhcnkodW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+PiAgCj4+
ICAgICAgc2V0dXBfY3B1X3NpYmxpbmdfbWFwKGNwdWlkKTsKPj4gIAo+PiAtICAgIHNjaGVkdWxl
cl9wZXJjcHVfaW5pdChjcHVpZCk7Cj4+IC0KPj4gICAgICAvKiBSdW4gbG9jYWwgbm90aWZpZXJz
ICovCj4+ICAgICAgbm90aWZ5X2NwdV9zdGFydGluZyhjcHVpZCk7Cj4+ICAgICAgLyoKPj4gLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5j
Cj4+IEBAIC0zODIsOCArMzgyLDYgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCAqdW51c2Vk
KQo+PiAgCj4+ICAgICAgc2V0X2NwdV9zaWJsaW5nX21hcChjcHUpOwo+PiAgCj4+IC0gICAgc2No
ZWR1bGVyX3BlcmNwdV9pbml0KGNwdSk7Cj4+IC0KPj4gICAgICBpbml0X3BlcmNwdV90aW1lKCk7
Cj4+ICAKPj4gICAgICBzZXR1cF9zZWNvbmRhcnlfQVBJQ19jbG9jaygpOwo+IAo+IFNlZWluZyB5
b3UgcmV2ZXJ0IGhlcmUgd2hhdCBhbiBlYXJsaWVyIHBhdGNoIGluIHRoZSBzZXJpZXMgaGFzIGFk
ZGVkLAo+IEkgZG9uJ3Qgc3VwcG9zZSByZS1vcmRlcmluZyBjb3VsZCBhdm9pZCB0aGlzIGNvZGUg
Y2h1cm4/CgpUaGlzIHdvdWxkIHJlcXVpcmUgYW5vdGhlciBtYWpvciBzaHVmZmxpbmcgb2YgcGF0
Y2hlcy4gSSdkIGxpa2UgdG8gYXZvaWQKdGhhdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
