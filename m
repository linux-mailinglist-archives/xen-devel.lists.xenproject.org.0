Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23F6AF9E0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zSN-0005fQ-7G; Wed, 11 Sep 2019 10:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7zSM-0005fL-2l
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:02:34 +0000
X-Inumbo-ID: 455e6ff2-d47b-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 455e6ff2-d47b-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 10:02:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 707C7AD49;
 Wed, 11 Sep 2019 10:02:31 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <c29e4609-5948-760d-2143-75d51e42d36d@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <27aa2cc1-e927-eeba-9cfa-28d659133008@suse.com>
Date: Wed, 11 Sep 2019 12:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c29e4609-5948-760d-2143-75d51e42d36d@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTE6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMDg6
MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIHRoZSAyMDE5IFhlbiBkZXZlbG9wZXIgc3Vt
bWl0IHRoZXJlIHdhcyBhZ3JlZW1lbnQgdGhhdCB0aGUgWGVuCj4+IGh5cGVydmlzb3Igc2hvdWxk
IGdhaW4gc3VwcG9ydCBmb3IgYSBoaWVyYXJjaGljYWwgbmFtZS12YWx1ZSBzdG9yZQo+PiBzaW1p
bGFyIHRvIHRoZSBMaW51eCBrZXJuZWwncyBzeXNmcy4KPj4KPj4gVGhpcyBpcyBhIGZpcnN0IGlt
cGxlbWVudGF0aW9uIG9mIHRoYXQgaWRlYSBhZGRpbmcgdGhlIGJhc2ljCj4+IGZ1bmN0aW9uYWxp
dHkgdG8gaHlwZXJ2aXNvciBhbmQgdG9vbHMgc2lkZS4gVGhlIGludGVyZmFjZSB0byBhbnkKPj4g
dXNlciBwcm9ncmFtIG1ha2luZyB1c2Ugb2YgdGhhdCAieGVuLXN5c2ZzIiBpcyBhIG5ldyBsaWJy
YXJ5Cj4+ICJsaWJ4ZW5mcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCj4+Cj4+IFRoZXJlIGFy
ZSBzdGlsbCBzb21lIHBlbmRpbmcgcXVlc3Rpb25zLCB0aG9zZSBhcmU6Cj4+Cj4+IC0gYWNjZXNz
IHJpZ2h0czoKPj4gICAgKyBzaG91bGQgd2UgYWxsb3cgYWNjZXNzIHRvIGRvbTAgb25seSwgb3Ig
dG8gYWxsIGRvbWFpbnMsIG9yIHNob3VsZAo+PiAgICAgIHRoYXQgYmUgcG9zc2libGUgdG8gc2V0
IHBlciBlbnRyeT8KPiAKPiBEb20wIG9ubHkgZm9yIG5vdywgSSdkIHNheS4gQnV0IGlmIHBvc3Np
YmxlIGRvbid0IHB1dCBpbiByb2FkIGJsb2Nrcwo+IG1ha2luZyByZWxheGluZyB0aGlzIG1vcmUg
ZGlmZmljdWx0LgoKU3VyZS4KCj4gCj4+ICAgICsgaG93IHRvIGludGVncmF0ZSB3aXRoIHhzbT8K
PiAKPiBXaGVuIERvbTAgb25seSwgcGVyaGFwcyBub3QgbmVlZGVkIG1vcmUgdGhhbiB3aXJpbmcg
dGhpcyB0aHJvdWdoIHRoZQo+IHNhbWUgaG9vayBhcyBlLmcuIHRoZSBzeXNjdGwtcyB1c2U/CgpZ
ZXMsIG9yIGFkZGluZyBhbm90aGVyIGhvb2sgZm9yIHRoYXQgcHVycG9zZS4KCj4gCj4+IC0gZHlu
YW1pY2FsIGVudHJpZXM6Cj4+ICAgICsgZG8gd2Ugd2FudCBzdXBwb3J0IGZvciBlLmcuIHBlci1k
b21haW4gYW5kL29yIHBlci1jcHVwb29sIGVudHJpZXM/Cj4gCj4gRG93biB0aGUgcm9hZCAtIHBl
cmhhcHMuCj4gCj4+ICAgICsgZG8gd2Ugd2FudCBzdXBwb3J0IGZvciBkZWJ1ZyBhaWRzIChsb2Nr
LXByb2ZpbGluZywgZGVidWd0cmFjZSAuLik/Cj4gCj4gU2VlaW5nIHlvdSBpbnRyb2R1Y2UgYSBm
aWxlIHN5c3RlbSBhYnN0cmFjdGlvbiwgaGF2ZSBzdWNoIGdvIHRocm91Z2gKPiBhIGRlYnVnZnMt
bGlrZSBvbmU/CgpXZWxsLCBJIHdhcyBtb3JlIHRoaW5raW5nIG9mIGEgImRlYnVnIiBkaXJlY3Rv
cnkgZm9yIHRoYXQgcHVycG9zZS4KCj4gCj4+IC0gd3JpdGUgYWNjZXNzOgo+PiAgICArIHJ1bnRp
bWUgcGFyYW1ldGVycz8KPj4gICAgKyBkZWJ1Z2dpbmcgYWlkcz8KPiAKPiBGb3IgYm90aCAtIGRv
d24gdGhlIHJvYWQsIHBlcmhhcHMuCgpPa2F5LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
