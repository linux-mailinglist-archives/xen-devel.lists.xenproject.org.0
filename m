Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F371E312DC
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 18:47:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWkdp-00024V-GC; Fri, 31 May 2019 16:44:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWkdo-00024M-4W
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 16:44:28 +0000
X-Inumbo-ID: 59394a16-83c3-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 59394a16-83c3-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 16:44:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F6D7ABC1;
 Fri, 31 May 2019 16:44:24 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
 <0c912c719f7fe4fcfcc329f90303b7c985c43c34.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <386b50b3-e396-181a-8217-b34c547ab0fc@suse.com>
Date: Fri, 31 May 2019 18:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0c912c719f7fe4fcfcc329f90303b7c985c43c34.camel@suse.com>
Content-Language: de-DE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAxNzo1MiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVHVlLCAyMDE5
LTA1LTI4IGF0IDEyOjMzICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbnN0ZWFkIG9m
IGhhdmluZyBhIGZ1bGwgYmxvd24gc2NoZWR1bGVyIHJ1bm5pbmcgZm9yIHRoZSBmcmVlIGNwdXMK
Pj4gYWRkIGEgdmVyeSBtaW5pbWFsaXN0aWMgc2NoZWR1bGVyIGZvciB0aGF0IHB1cnBvc2Ugb25s
eSBldmVyCj4+IHNjaGVkdWxpbmcKPj4gdGhlIHJlbGF0ZWQgaWRsZSB2Y3B1LiBUaGlzIGhhcyB0
aGUgYmlnIGFkdmFudGFnZSBvZiBub3QgbmVlZGluZyBhbnkKPj4gcGVyLWNwdSwgcGVyLWRvbWFp
biBvciBwZXItc2NoZWR1bGluZyB1bml0IGRhdGEgZm9yIGZyZWUgY3B1cyBhbmQgaW4KPj4gdHVy
biBzaW1wbGlmeWluZyBtb3ZpbmcgY3B1cyB0byBhbmQgZnJvbSBjcHVwb29scyBhIGxvdC4KPj4K
Pj4gQXMgdGhpcyBuZXcgc2NoZWR1bGVyIGlzIG5vdCB1c2VyIHNlbGVjdGFibGUgZG9uJ3QgcmVn
aXN0ZXIgaXQgYXMgYW4KPj4gb2ZmaWNpYWwgc2NoZWR1bGVyLCBidXQganVzdCBpbmNsdWRlIGl0
IGluIHNjaGVkdWxlLmMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPj4gLS0tCj4+IFYxOiBuZXcgcGF0Y2gKPj4gLS0tCj4gCj4+IC0tLSBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAg
LTgzLDYgKzgzLDU3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyCj4+ICpfX3N0YXJ0
X3NjaGVkdWxlcnNfYXJyYXlbXSwgKl9fZW5kX3NjaGVkdWxlcnNfYXJyCj4+ICAKPj4gIHN0YXRp
YyBzdHJ1Y3Qgc2NoZWR1bGVyIF9fcmVhZF9tb3N0bHkgb3BzOwo+PiAgCj4+IFsuLi5dCj4+Cj4+
ICtzdGF0aWMgdm9pZCAqCj4+ICtzY2hlZF9pZGxlX2FsbG9jX3ZkYXRhKGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0Cj4+IHNjaGVkX3VuaXQgKnVuaXQsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKmRkKQo+PiArewo+PiArICAgIC8qIEFueSBub24tTlVMTCBwb2lu
dGVyIGlzIGZpbmUgaGVyZS4gKi8KPj4gKyAgICByZXR1cm4gKHZvaWQgKikxVUw7Cj4+ICt9Cj4+
ICsKPiBJIHRoaW5rIHRoZSBwcm9wZXIgdGhpbmcgdG8gZG8sIGhlcmUsIHdvdWxkIGJlIHRvIGNv
bnZlcnQgYWxsb2NfdmRhdGEoKQo+IHRvIFBUUl9FUlIoKSAmIElTX0VSUigpLgo+IAo+IFRoYXQn
cyBhbm90aGVyIHBhdGNoLCBvZiBjb3Vyc2UsIGFuZCBnaXZlbiB0aGF0IHRoaXMgc2VyaWVzIGlz
IHJhdGhlcgo+IGJpZyBhbHJlYWR5LCBJJ20gbm90IHN1cmUgYWJvdXQgYXNraW5nIGZvciBpdCB0
byBiZSBkb25lIGluIHRoZSBjb250ZXh0Cj4gb2YgdGhpcyB3b3JrLgo+IAo+IEkgY2FuIGRvIGl0
IG15c2VsZiwgZWl0aGVyIHJpZ2h0IG5vdyBvciBhZnRlciB0aGlzIHNlcmllcyBpcyBtZXJnZWQK
PiAoZm9yIHRoZSBzYWtlIG9mIG5vdCBtYWtpbmcgcmViYXNpbmcgNjAgcGF0Y2hlcyBtb3JlIGNv
bXBsaWNhdGVkIHRoYW4KPiBpdCBtdXN0IGJlIGFscmVhZHksIGZvciB5b3UgOi1EKS4KPiAKPiBM
ZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4KClRoZXJlIGlzIG9ubHkgb25lIHBsYWNlIGxlZnQg
d2hlcmUgYWxsb2NfdmRhdGEgaXMgYmVpbmcgY2FsbGVkIGZvciB0aGUKaWRsZSBzY2hlZHVsZXIs
IGFuZCB0aGF0IGlzIHNjaGVkX2luaXRfdmNwdSgpIG9mIGFuIGlkbGUgdmNwdS4KCkkgaGF2ZSBw
bGFubmVkIHRvIGRvIGEgZm9sbG93dXAgc2VyaWVzIGNsZWFuaW5nIHVwIHRoZSBzY2hlZHVsaW5n
IHN0dWZmCndoZXJlIEkgY2FuIGFkZCBhIHBhdGNoIHNwZWNpYWwgY2FzaW5nIHRoYXQgYW5kIHJl
bW92aW5nCnNjaGVkX2lkbGVfYWxsb2NfdmRhdGEoKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
