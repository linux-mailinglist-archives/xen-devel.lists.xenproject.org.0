Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD90A3836
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 15:57:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hMO-0007YZ-1O; Fri, 30 Aug 2019 13:54:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hMN-0007YU-B1
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:54:39 +0000
X-Inumbo-ID: b5111c98-cb2d-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5111c98-cb2d-11e9-ac23-bc764e2007e4;
 Fri, 30 Aug 2019 13:54:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 032E2AD54;
 Fri, 30 Aug 2019 13:54:38 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-3-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e3b7898-db99-55cf-d832-6e88889d6d17@suse.com>
Date: Fri, 30 Aug 2019 15:54:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830082953.2192-3-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/6] domain: introduce
 XEN_DOMCTL_CDF_iommu flag
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
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBhIGNvbW1vbiBkb21haW4gY3JlYXRpb24gZmxhZyB0byBkZXRlcm1pbmUgd2hldGhl
cgo+IHRoZSBkb21haW4gaXMgcGVybWl0dGVkIHRvIG1ha2UgdXNlIG9mIHRoZSBJT01NVS4gQ3Vy
cmVudGx5IHRoZSBmbGFnIGlzCj4gYWx3YXlzIHNldCAoZm9yIGJvdGggZG9tMCBhbmQgZG9tVSkg
aWYgdGhlIElPTU1VIGlzIGdsb2JhbGx5IGVuYWJsZWQKPiAoaS5lLiBpb21tdV9lbmFibGVkID09
IDEpLiBzYW5pdGlzZV9kb21haW5fY29uZmlnKCkgaXMgbW9kaWZpZWQgdG8gcmVqZWN0Cj4gdGhl
IGZsYWcgaWYgIWlvbW11X2VuYWJsZWQuCj4gCj4gQSBuZXcgaGVscGVyIGZ1bmN0aW9uLCBpc19p
b21tdV9lbmFibGVkKCksIGlzIGFkZGVkIHRvIHRlc3QgdGhlIGZsYWcgYW5kCj4gaW9tbXVfZG9t
YWluX2luaXQoKSB3aWxsIHJldHVybiBpbW1lZGlhdGVseSBpZiAhaXNfaW9tbXVfZW5hYmxlZCgp
LiBUaGlzIGlzCj4gc2xpZ2h0bHkgZGlmZmVyZW50IHRvIHRoZSBwcmV2aW91cyBiZWhhdmlvdXIg
YmFzZWQgb24gIWlvbW11X2VuYWJsZWQgd2hlcmUKPiB0aGUgY2FsbCB0byBhcmNoX2lvbW11X2Rv
bWFpbl9pbml0KCkgd2FzIG1hZGUgcmVnYXJkbGVzcywgaG93ZXZlciBpdCBhcHBlYXJzCj4gdGhh
dCB0aGlzIGNhbGwgd2FzIG9ubHkgbmVjZXNzYXJ5IHRvIGluaXRpYWxpemUgdGhlIGR0X2Rldmlj
ZXMgbGlzdCBmb3IgQVJNCj4gc3VjaCB0aGF0IGlvbW11X3JlbGVhc2VfZHRfZGV2aWNlcygpIGNh
biBiZSBjYWxsZWQgdW5jb25kaXRpb25hbGx5IGJ5Cj4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3Vy
Y2VzKCkuIEFkZGluZyBhIHNpbXBsZSBjaGVjayBvZiBpc19pb21tdV9lbmFibGVkKCkKPiBpbnRv
IGlvbW11X3JlbGVhc2VfZHRfZGV2aWNlcygpIGtlZXBzIHRoaXMgdW5jb25kaXRpb25hbCBjYWxs
IHdvcmtpbmcuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Ugc2hvdWxkIGJlIG9ic2VydmVkIHdp
dGggdGhpcyBwYXRjaCBhcHBsaWVkLgo+IAo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGFsbG93
IHRoZSB0b29sc3RhY2sgdG8gY29udHJvbCB3aGV0aGVyIHVzZSBvZiB0aGUKPiBJT01NVSBpcyBl
bmFibGVkIGZvciBhIGRvbWFpbi4KPiAKPiBOT1RFOiBUaGUgaW50cm9kdWN0aW9uIG9mIHRoZSBp
c19pb21tdV9lbmFibGVkKCkgaGVscGVyIGZ1bmN0aW9uIG1pZ2h0Cj4gICAgICAgc2VlbSBleGNl
c3NpdmUgYnV0IGl0cyB1c2UgaXMgZXhwZWN0ZWQgdG8gaW5jcmVhc2Ugd2l0aCBzdWJzZXF1ZW50
Cj4gICAgICAgcGF0Y2hlcy4gQWxzbywgaGF2aW5nIGlvbW11X2RvbWFpbl9pbml0KCkgYmFpbCBi
ZWZvcmUgY2FsbGluZwo+ICAgICAgIGFyY2hfaW9tbXVfZG9tYWluX2luaXQoKSBpcyBub3Qgc3Ry
aWN0bHkgbmVjZXNzYXJ5LCBidXQgSSB0aGluayB0aGUKPiAgICAgICBjb25zZXF1ZW50IGFkZGl0
aW9uIG9mIHRoZSBjYWxsIHRvIGlzX2lvbW11X2VuYWJsZWQoKSBpbgo+ICAgICAgIGlvbW11X3Jl
bGVhc2VfZHRfZGV2aWNlcygpIG1ha2VzIHRoZSBjb2RlIGNsZWFyZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1i
eTogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkh5cGVydmlzb3Ig
cGFydHMgKG5vbi1Bcm0pCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
