Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E06BB1BA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:54:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCL06-0005Uf-Cz; Mon, 23 Sep 2019 09:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCL05-0005UY-06
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:51:21 +0000
X-Inumbo-ID: b13aac34-dde7-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b13aac34-dde7-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 09:51:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD1BAAFB4;
 Mon, 23 Sep 2019 09:51:18 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
 <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
 <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f14e2e9-3e8f-5a48-cd01-aec41d61be66@suse.com>
Date: Mon, 23 Sep 2019 11:51:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Regression with vcpu runstate info and
 XEN_RUNSTATE_UPDATE
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 SergeyDyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxMTo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNi4wOS4xOSAx
Nzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2LjA5LjIwMTkgMTY6NTAsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBBZnRlciBhIGNvbXBsaWNhdGVkIGludmVzdGlnYXRpb24sIGl0IHR1
cm5zIG91dCB0aGF0IGMvcyAyNTI5Yzg1MGVhNDgKPj4+IGJyb2tlIHhjX3ZjcHVfZ2V0aW5mbygp
Lgo+Pj4KPj4+IFRoZSBidWcgbG9va3MgYXMgaWYgaXQgaXMgaW4gdmNwdV9ydW5zdGF0ZV9nZXQo
KSwgd2hpY2ggZG9lc24ndCBhY2NvdW50Cj4+PiBmb3IgWEVOX1JVTlNUQVRFX1VQREFURSBhbmQg
Y2FsY3VsYXRpbmcgYSB3aWxkbHkgaW5hcHByb3ByaWF0ZSBkZWx0YS4KPj4+IFVsdGltYXRlbHks
IHRoZSByZXN1bHQgb2YgWEVOX0RPTUNUTF9nZXR2Y3B1aW5mbyBlbmRzIHVwIHZlcnkKPj4+IG9j
Y2FzaW9uYWxseSB3aXRoIG9wLT51LmdldHZjcHVpbmZvLmNwdV90aW1lIGJlaW5nIHdyb25nIGJ5
IDEgPDwgNjMuCj4+Pgo+Pj4gR2l2ZW4gc29tZSBvZiB0aGUgY2FsbGVycyBvZiB2Y3B1X3J1bnN0
YXRlX2dldCgpLCBJIGRvbid0IHRoaW5rIGl0IGlzCj4+PiByZWFzb25hYmxlIHRvIHBhdXNlIHRo
ZSBWQ1BVIHdoaWxlIHJlYWRpbmcgdGhlIHJ1bnN0YXRlIGluZm8uwqAgSG93ZXZlciwKPj4+IGl0
IGlzIGFsc28gdW5jbGVhciB3aGV0aGVyIHdhaXRpbmcgZm9yIFhFTl9SVU5TVEFURV9VUERBVEUg
dG8gZHJvcCBpbgo+Pj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpcyBzYWZlIGVpdGhlci4KPj4KPj4g
Rmlyc3QgYW5kIGZvcmVtb3N0IEknbSB3b25kZXJpbmcgd2hldGhlciBzaW1wbHkgbWFza2luZyBv
ZmYKPj4gWEVOX1JVTlNUQVRFX1VQREFURSBpbiB2Y3B1X3J1bnN0YXRlX2dldCgpIHdvdWxkbid0
IGJlIGFuCj4+IG9wdGlvbi4gVGhlIGFzc3VtcHRpb24gb2YgdGhlIGZlYXR1cmUgYXMgYSB3aG9s
ZSBpcyBmb3IgdGhlCj4+IGhpZ2ggYml0IHRvIG5ldmVyIGJlIHNldCBpbiBhbiBhY3R1YWwgdGlt
ZSB2YWx1ZSwgYWZ0ZXIgYWxsLgo+Pgo+PiBUaGUgb3RoZXIgb3B0aW9uIEknZCBzZWUgaXMgZm9y
IHZjcHVfcnVuc3RhdGVfZ2V0KCkgdG8gZ2Fpbgo+PiBhIGJvb2xlYW4gcmV0dXJuIHR5cGUgYnkg
d2hpY2ggaXQgd291bGQgaW5kaWNhdGUgdG8KPj4gaW50ZXJlc3RlZCBjYWxsZXJzIHdoZXRoZXIg
dGhlIGxhdGNoaW5nIG9mIHRoZSB2YWx1ZXMKPj4gaGFwcGVuZWQgd2hpbGUgYW4gdXBkYXRlIHdh
cyBpbiBwcm9ncmVzcyBlbHNld2hlcmUuIENhbGxlcnMKPj4gbmVlZGluZyB0byBjb25zdW1lIHRo
ZSBwb3RlbnRpYWxseSBpbmNvcnJlY3QgcmVzdWx0IGNvdWxkCj4+IHRoZW4gY2hvb3NlIHRvIHdh
aXQgb3Igc2NoZWR1bGUgYSBoeXBlcmNhbGwgY29udGludWF0aW9uLgo+Pgo+PiBUaGUgM3JkIG9w
dGlvbiAobGVzcyBkZXNpcmFibGUgaW1vIG5vdCB0aGUgbGVhc3QgYmVjYXVzZSBpdAo+PiB3b3Vs
ZCByZXF1aXJlIHRvdWNoaW5nIGFsbCBjYWxsZXJzKSB3b3VsZCBiZSBmb3IgdGhlIGZ1bmN0aW9u
Cj4+IHRvIGdhaW4gYSBwYXJhbWV0ZXIgdGVsbGluZyBpdCB3aGV0aGVyIHRvIHNwaW4gdW50aWwK
Pj4gWEVOX1JVTlNUQVRFX1VQREFURSBpcyBvYnNlcnZlZCBjbGVhci4KPiAKPiBBbmQgdGhlIDR0
aCBvcHRpb24gd291bGQgYmUgdG8gbGV0IHZjcHVfcnVuc3RhdGVfZ2V0KCkgb3BlcmF0ZSBvbiBh
Cj4gbG9jYWwgcnVuc3RhdGUgY29weSBpbiBvcmRlciB0byBhdm9pZCBzZXR0aW5nIFhFTl9SVU5T
VEFURV9VUERBVEUgaW4KPiB0aGUgIm9mZmljaWFsIiBydW5zdGF0ZSBpbmZvIG9mIHRoZSB2Y3B1
LgoKQnV0IGl0IGFscmVhZHkgZG9lcyAtIGZpcnN0IHRoaW5nIGl0IGRvZXMgaXMgYSBtZW1jcHko
KSBmcm9tIHRoZQoib2ZmaWNpYWwiIGluc3RhbmNlIHRvIGEgY2FsbGVyIHByb3ZpZGVkIGJ1ZmZl
ci4gKFdoYXQgaXMKY29uZnVzaW5nLCBhdCBsZWFzdCB0byBtZSwgaXMgdGhhdCB0aGUgbG9jayBn
ZXRzIGRyb3BwZWQgbGFzdCwKd2hlbiBldmVyeXRoaW5nIGFmdGVyIHRoZSBtZW1jcHkoKSBhbHJl
YWR5IGFjdHMgb24gdGhlIGNvcHkgb25seS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
