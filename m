Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA514522A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 11:10:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuCvT-0008S3-G7; Wed, 22 Jan 2020 10:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuCvS-0008Rp-75
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 10:07:54 +0000
X-Inumbo-ID: 08c3a886-3cff-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08c3a886-3cff-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 10:07:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF675AD9F;
 Wed, 22 Jan 2020 10:07:43 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a93b117-fc1a-9857-b44e-f239cc217740@suse.com>
Date: Wed, 22 Jan 2020 11:07:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxMTowMSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyMC8wMS8yMDIw
IDEwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDEuMjAyMCAxNzo0NCwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IHYyIC0tPiB2MzoKPj4+IC0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0
ZXJpbmcKPj4KPj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24sIGhvdyBhYm91dCBh
ZGRpbmcgWEVOVkVSX2RlbmllZCB0bwo+PiByZXR1cm4gdGhlICJkZW5pZWQiIHN0cmluZywgYWxs
b3dpbmcgY29tcG9uZW50cyB3aGljaCB3YW50IHRvIGZpbHRlcgo+PiB0byBrbm93IGV4YWN0bHkg
d2hhdCB0byBsb29rIGZvcj8gQW5kIHRoZW4gcmUtYWRkIHRoZSBmaWx0ZXJpbmcgeW91Cj4+IGhh
ZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hvdWxkIHRoZW4gcGVyaGFw
cyBiZQo+PiBleHRlbmRlZCB0byBtYWtlIHZlcnkgY2xlYXIgdGhhdCB0aGUgY2hvc2VuIHN0cmlu
ZyBzaG91bGQgbm90IG1hdGNoCj4+IGFueXRoaW5nIHRoYXQgY291bGQgcG90ZW50aWFsbHkgYmUg
cmV0dXJuZWQgYnkgYW55IG9mIHRoZSBYRU5WRVJfCj4+IHN1Yi1vcHMuKQo+IAo+IEkgaGFkIHRo
ZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+IAo+IDEuIE1vc3QgcmVhbC13b3JsZCB1c2VycyB3b3Vs
ZCBzZXQgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HPSIiIGFueXdheS4KPiAKPiAyLiBGaWx0ZXJp
bmcgaW4gRE1JIHRhYmxlcyBpcyBub3QgYSBjb21wbGV0ZSBzb2x1dGlvbiwgc2luY2UgZGVuaWVk
Cj4gc3RyaW5nIGxlYWtzIGVsc2V3aGVyZSB0aHJvdWdoIHRoZSBoeXBlcmNhbGwgKFBWIGd1ZXN0
cywgc3lzZnMsIGRyaXZlcgo+IGxvZ3MpIGFzIEFuZHJldyBoYXMgcG9pbnRlZCBvdXQgaW4gdGhl
IHByZXZpb3VzIGRpc2N1c3Npb24uCgpXZWxsLCB0aGF0J3MgQW5kcmV3J3MgdGhpbmtpbmcuIFRv
IG1lLCBnZXR0aW5nIGJhY2sgIjxkZW5pZWQ+IiBmcm9tCnRoZSBoeXBlcmNhbGwgaXMgbm90IGEg
bGVha2luZyBvZiB0aGlzIHN0cmluZywgYnV0IHRoZSBpbnRlbmRlZApvdXRwdXQuIEkgY29udGlu
dWUgdG8gdGhpbmsgdGhhdCBnZXR0aW5nIGJhY2sgYSBibGFuayBzdHJpbmcgdGhlcmUKaXMgY29u
ZnVzaW5nLCBhcyBpdCBpcyBmYXIgbW9yZSBsaWtlbHkgdG8gYmUgbWlzdGFrZW4gdG8gYmUgYWN0
dWFsbHkKYmxhbmsgdGhhbiBpdCBpcyBmb3IgIjxkZW5pZWQ+IiB0byBiZSBtaXN0YWtlbiBmb3Ig
YWN0dWFsIGRhdGEuCldoZXJlIHN1Y2ggYSBzdHJpbmcgd2FudHMgZmlsdGVyaW5nIGlzIHRvIGJl
IGRldGVybWluZWQgZm9yIGV2ZXJ5CmNvbnN1bWVyIG9mIHRoaXMgaW50ZXJmYWNlIHNlcGFyYXRl
bHk7IGFzIHNhaWQgYmVmb3JlLCB0aGlzIGlzIGEgVUkKZnVuY3Rpb24sIG5vdCBzb21ldGhpbmcg
dG8gYmUgY2F0ZXJlZCBmb3IgaW4gdGhlIGh5cGVydmlzb3IuCgpKYW4KCj4gT24gdGhlIG90aGVy
IGhhbmQsIFNNQmlvcyBmaWx0ZXJpbmcgc2xpZ2h0bHkgaW1wcm92ZXMgdGhlIHNpdHVhdGlvbiBm
b3IKPiBIVk0gZG9tYWlucywgc28gSSBjYW4gcmV0dXJuIGl0IGlmIG1haW50YWluZXJzIGZpbmQg
aXQgd29ydGh5Lgo+IAo+IC0tCj4gVGhhbmtzLAo+IFNlcmdleQo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
