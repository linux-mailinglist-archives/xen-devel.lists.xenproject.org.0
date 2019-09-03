Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C6A67FB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57SO-0001t9-AZ; Tue, 03 Sep 2019 11:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i57SN-0001t4-Ly
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 11:58:43 +0000
X-Inumbo-ID: 2c8a7fbe-ce42-11e9-9b57-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c8a7fbe-ce42-11e9-9b57-bc764e2007e4;
 Tue, 03 Sep 2019 11:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 908F9AC8E;
 Tue,  3 Sep 2019 11:58:41 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
 <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
 <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <45f2bc1b-571d-d780-961c-64b73bf26c3b@suse.com>
Date: Tue, 3 Sep 2019 13:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
 debugtrace
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTM6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTI6
MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDEyOjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gVG9kYXkgZHVtcGluZyB0aGUgZGVidWd0cmFjZSBidWZmZXJzIGlzIGRvbmUgdmlhIHNlcmNv
bl9wdXRzKCksIHdoaWxlCj4+Pj4gZGlyZWN0IHByaW50aW5nIG9mIHRyYWNlIGVudHJpZXMgKGFm
dGVyIHRvZ2dsaW5nIG91dHB1dCB0byB0aGUgY29uc29sZSkKPj4+PiBpcyB1c2luZyBzZXJpYWxf
cHV0cygpLgo+Pj4+Cj4+Pj4gVXNlIHNlcmNvbl9wdXRzKCkgaW4gYm90aCBjYXNlcywgYXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBib3RoIGlzIG5vdAo+Pj4+IHJlYWxseSBtYWtpbmcgc2Vuc2Uu
Cj4+Pgo+Pj4gTm8gbWF0dGVyIHRoYXQgSSBsaWtlIHRoaXMgY2hhbmdlLCBJJ20gbm90IGNvbnZp
bmNlZCBpdCdzIGNvcnJlY3Q6Cj4+PiBUaGVyZSBhcmUgdHdvIGRpZmZlcmVuY2VzIGJldHdlZW4g
dGhlIGZ1bmN0aW9ucywgbmVpdGhlciBvZiB3aGljaAo+Pj4gSSBjb3VsZCBxdWFsaWZ5IGFzICJu
b3QgcmVhbGx5IG1ha2luZyBzZW5zZSI6IFdoeSBpcyBpdCBvYnZpb3VzCj4+PiB0aGF0IGl0IG1h
a2VzIG5vIHNlbnNlIGZvciB0aGUgZGVidWd0cmFjZSBvdXRwdXQgdG8gYnlwYXNzIG9uZSBvcgo+
Pj4gYm90aCBvZiBzZXJpYWxfc3RlYWxfZm4oKSBhbmQgcHZfY29uc29sZV9wdXRzKCk/IElmIHlv
dSdyZQo+Pj4gY29udmluY2VkIG9mIHRoaXMsIHBsZWFzZSBwcm92aWRlIHRoZSAid2h5Ii1zIGJl
aGluZCB0aGUgc2VudGVuY2UKPj4+IGFib3ZlLgo+Pgo+PiBPa2F5LCBJJ2xsIHVzZToKPj4KPj4g
VXNlIHNlcmNvbl9wdXRzKCkgaW4gYm90aCBjYXNlcywgdG8gYmUgY29uc2lzdGVudCBiZXR3ZWVu
IGR1bXBpbmcgdGhlCj4+IGJ1ZmZlciB3aGVuIHN3aXRjaGluZyBkZWJ1Z3RyYWNlIHRvIGNvbnNv
bGUgb3V0cHV0IGFuZCB3aGVuIHByaW50aW5nCj4+IGEgZGVidWd0cmFjZSBlbnRyeSBkaXJlY3Rs
eSB0byBjb25zb2xlLgo+IAo+IFdlbGwsIHRoaXMgaXMgYmV0dGVyIGFzIGFuIGV4cGxhbmF0aW9u
IGluZGVlZCwgYnV0IGl0IHN0aWxsIGRvZXNuJ3QKPiBtYWtlIGNsZWFyIHdoZXRoZXIgaXQgd2Fz
bid0IGluIGZhY3Qgd2FudGVkIGZvciB0aGVyZSB0byBiZSBhCj4gZGlmZmVyZW5jZSBpbiB3aGVy
ZSBvdXRwdXQgZ2V0cyBzZW50LiBJIG1heSBiZWxpZXZlIHRoYXQgYnlwYXNzaW5nCj4gcHZfY29u
c29sZV9wdXRzKCkgd2Fzbid0IGludGVuZGVkLCBidXQgdGhlIHN0ZWFsIGZ1bmN0aW9uIGJ5cGFz
cwo+IGhhZCBiZWVuIHRoZXJlIGluIDMuMiBhbHJlYWR5LCBzbyBtYXkgd2VsbCBoYXZlIGJlZW4g
b24gcHVycG9zZS4KClRoZXJlIGFyZSB0d28gdXNlcnMgb2YgY29uc29sZV9zdGVhbCgpOgoKc3Vz
cGVuZCBoYW5kbGluZyAtIEkgYmVsaWV2ZSBpdCBpcyBhIGdvb2QgaWRlYSB0byBub3QgdXNlIHRo
ZSBzZXJpYWwKaW50ZXJmYWNlIHdoaWxlIGl0IGlzIHBvdGVudGlhbGx5IHVuaW5pdGlhbGl6ZWQu
CgpnZGIgc3VwcG9ydCAtIFdoeSBzaG91bGQgdGhhdCBiZSBzcGVjaWFsPyBOb3QgdHJlYXRpbmcg
dGhlIG91dHB1dCBkYXRhCmFwcHJvcHJpYXRlIHRvIHRoZSBhdHRhY2hlZCBkZWJ1Z2dlciB3aWxs
IGJlIHdvcnNlIHRoYW4gZW5jYXBzdWxhdGluZwppdCBpbiBhIHdheSB0aGUgZGVidWdnZXIgY2Fu
IGhhbmRsZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
