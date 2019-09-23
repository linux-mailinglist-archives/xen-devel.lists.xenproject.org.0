Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A249CBB213
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:16:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLKh-0008B0-P2; Mon, 23 Sep 2019 10:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCLKg-0008Ar-C3
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:12:38 +0000
X-Inumbo-ID: aad1ca6e-ddea-11e9-95fc-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aad1ca6e-ddea-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 10:12:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95D7AADAA;
 Mon, 23 Sep 2019 10:12:36 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
 <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
 <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
 <6f14e2e9-3e8f-5a48-cd01-aec41d61be66@suse.com>
 <80cfdfb0-fd25-1f58-45e6-96a0888a7b0a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bfce92a-8c85-28e1-53f2-daca7e35bb6a@suse.com>
Date: Mon, 23 Sep 2019 12:12:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <80cfdfb0-fd25-1f58-45e6-96a0888a7b0a@suse.com>
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

T24gMjMuMDkuMjAxOSAxMTo1NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMy4wOS4xOSAx
MTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIzLjA5LjIwMTkgMTE6NDIsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxNi4wOS4xOSAxNzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTYuMDkuMjAxOSAxNjo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gQWZ0ZXIg
YSBjb21wbGljYXRlZCBpbnZlc3RpZ2F0aW9uLCBpdCB0dXJucyBvdXQgdGhhdCBjL3MgMjUyOWM4
NTBlYTQ4Cj4+Pj4+IGJyb2tlIHhjX3ZjcHVfZ2V0aW5mbygpLgo+Pj4+Pgo+Pj4+PiBUaGUgYnVn
IGxvb2tzIGFzIGlmIGl0IGlzIGluIHZjcHVfcnVuc3RhdGVfZ2V0KCksIHdoaWNoIGRvZXNuJ3Qg
YWNjb3VudAo+Pj4+PiBmb3IgWEVOX1JVTlNUQVRFX1VQREFURSBhbmQgY2FsY3VsYXRpbmcgYSB3
aWxkbHkgaW5hcHByb3ByaWF0ZSBkZWx0YS4KPj4+Pj4gVWx0aW1hdGVseSwgdGhlIHJlc3VsdCBv
ZiBYRU5fRE9NQ1RMX2dldHZjcHVpbmZvIGVuZHMgdXAgdmVyeQo+Pj4+PiBvY2Nhc2lvbmFsbHkg
d2l0aCBvcC0+dS5nZXR2Y3B1aW5mby5jcHVfdGltZSBiZWluZyB3cm9uZyBieSAxIDw8IDYzLgo+
Pj4+Pgo+Pj4+PiBHaXZlbiBzb21lIG9mIHRoZSBjYWxsZXJzIG9mIHZjcHVfcnVuc3RhdGVfZ2V0
KCksIEkgZG9uJ3QgdGhpbmsgaXQgaXMKPj4+Pj4gcmVhc29uYWJsZSB0byBwYXVzZSB0aGUgVkNQ
VSB3aGlsZSByZWFkaW5nIHRoZSBydW5zdGF0ZSBpbmZvLsKgIEhvd2V2ZXIsCj4+Pj4+IGl0IGlz
IGFsc28gdW5jbGVhciB3aGV0aGVyIHdhaXRpbmcgZm9yIFhFTl9SVU5TVEFURV9VUERBVEUgdG8g
ZHJvcCBpbgo+Pj4+PiB2Y3B1X3J1bnN0YXRlX2dldCgpIGlzIHNhZmUgZWl0aGVyLgo+Pj4+Cj4+
Pj4gRmlyc3QgYW5kIGZvcmVtb3N0IEknbSB3b25kZXJpbmcgd2hldGhlciBzaW1wbHkgbWFza2lu
ZyBvZmYKPj4+PiBYRU5fUlVOU1RBVEVfVVBEQVRFIGluIHZjcHVfcnVuc3RhdGVfZ2V0KCkgd291
bGRuJ3QgYmUgYW4KPj4+PiBvcHRpb24uIFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBmZWF0dXJlIGFz
IGEgd2hvbGUgaXMgZm9yIHRoZQo+Pj4+IGhpZ2ggYml0IHRvIG5ldmVyIGJlIHNldCBpbiBhbiBh
Y3R1YWwgdGltZSB2YWx1ZSwgYWZ0ZXIgYWxsLgo+Pj4+Cj4+Pj4gVGhlIG90aGVyIG9wdGlvbiBJ
J2Qgc2VlIGlzIGZvciB2Y3B1X3J1bnN0YXRlX2dldCgpIHRvIGdhaW4KPj4+PiBhIGJvb2xlYW4g
cmV0dXJuIHR5cGUgYnkgd2hpY2ggaXQgd291bGQgaW5kaWNhdGUgdG8KPj4+PiBpbnRlcmVzdGVk
IGNhbGxlcnMgd2hldGhlciB0aGUgbGF0Y2hpbmcgb2YgdGhlIHZhbHVlcwo+Pj4+IGhhcHBlbmVk
IHdoaWxlIGFuIHVwZGF0ZSB3YXMgaW4gcHJvZ3Jlc3MgZWxzZXdoZXJlLiBDYWxsZXJzCj4+Pj4g
bmVlZGluZyB0byBjb25zdW1lIHRoZSBwb3RlbnRpYWxseSBpbmNvcnJlY3QgcmVzdWx0IGNvdWxk
Cj4+Pj4gdGhlbiBjaG9vc2UgdG8gd2FpdCBvciBzY2hlZHVsZSBhIGh5cGVyY2FsbCBjb250aW51
YXRpb24uCj4+Pj4KPj4+PiBUaGUgM3JkIG9wdGlvbiAobGVzcyBkZXNpcmFibGUgaW1vIG5vdCB0
aGUgbGVhc3QgYmVjYXVzZSBpdAo+Pj4+IHdvdWxkIHJlcXVpcmUgdG91Y2hpbmcgYWxsIGNhbGxl
cnMpIHdvdWxkIGJlIGZvciB0aGUgZnVuY3Rpb24KPj4+PiB0byBnYWluIGEgcGFyYW1ldGVyIHRl
bGxpbmcgaXQgd2hldGhlciB0byBzcGluIHVudGlsCj4+Pj4gWEVOX1JVTlNUQVRFX1VQREFURSBp
cyBvYnNlcnZlZCBjbGVhci4KPj4+Cj4+PiBBbmQgdGhlIDR0aCBvcHRpb24gd291bGQgYmUgdG8g
bGV0IHZjcHVfcnVuc3RhdGVfZ2V0KCkgb3BlcmF0ZSBvbiBhCj4+PiBsb2NhbCBydW5zdGF0ZSBj
b3B5IGluIG9yZGVyIHRvIGF2b2lkIHNldHRpbmcgWEVOX1JVTlNUQVRFX1VQREFURSBpbgo+Pj4g
dGhlICJvZmZpY2lhbCIgcnVuc3RhdGUgaW5mbyBvZiB0aGUgdmNwdS4KPj4KPj4gQnV0IGl0IGFs
cmVhZHkgZG9lcyAtIGZpcnN0IHRoaW5nIGl0IGRvZXMgaXMgYSBtZW1jcHkoKSBmcm9tIHRoZQo+
PiAib2ZmaWNpYWwiIGluc3RhbmNlIHRvIGEgY2FsbGVyIHByb3ZpZGVkIGJ1ZmZlci4gKFdoYXQg
aXMKPj4gY29uZnVzaW5nLCBhdCBsZWFzdCB0byBtZSwgaXMgdGhhdCB0aGUgbG9jayBnZXRzIGRy
b3BwZWQgbGFzdCwKPj4gd2hlbiBldmVyeXRoaW5nIGFmdGVyIHRoZSBtZW1jcHkoKSBhbHJlYWR5
IGFjdHMgb24gdGhlIGNvcHkgb25seS4pCj4gCj4gT2gsIHRoYXQgd2FzIG15IGZhdWx0IGhlcmU6
IEkgbWVhbnQgdG8gbGV0IHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKCkKPiBvcGVyYXRlIG9uIGEgbG9j
YWwgY29weSwgb2YgY291cnNlLgoKQWgsIEkgc2VlLiBJdCB3YXMgbXkgdW5kZXJzdGFuZGluZyB0
aGF0IGJ5IHNldHRpbmcgdGhlIGZsYWcgaW4gdGhlCiJvZmZpY2lhbCIgaW5zdGFuY2UsIGludGVy
bmFsIGNvbnN1bWVycyBjb3VsZCAoaWYgdGhleSBjYXJlZCkgYWxzbwphdm9pZCBhY3Rpbmcgb24g
aW5jb25zaXN0ZW50IC8gaW4tZmxpZ2h0IGRhdGEuIE9yIHdhcyB0aGUgY3VycmVudApzb2x1dGlv
biBjaG9zZW4gZXhjbHVzaXZlbHkgYmVjYXVzZSBpdCB3YXMgZWFzaWVzdCB0byBzZXQgdGhlIGZs
YWcKaW4gdGhlIG1hc3RlciBpbnN0YW5jZSwgYW5kIHRoZW4gY29weSBmcm9tIHRoZXJlPwoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
