Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB656263F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 14:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTQS9-0004D9-9w; Wed, 22 May 2019 12:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTQS7-0004D4-7a
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 12:34:39 +0000
X-Inumbo-ID: f496b6e6-7c8d-11e9-b4cb-9b9c533fa337
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f496b6e6-7c8d-11e9-b4cb-9b9c533fa337;
 Wed, 22 May 2019 12:34:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 06:34:34 -0600
Message-Id: <5CE541D60200007800231587@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 06:34:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Juergen Gross" <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@suse.com>
 <f100e5be-cf19-bf28-c113-b07b4fe99c59@suse.com>
In-Reply-To: <f100e5be-cf19-bf28-c113-b07b4fe99c59@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDEyOjE5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wNS8yMDE5IDEyOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjIuMDUuMTkgYXQg
MTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4gQEAgLTMxODUsMjIg
KzMxODUsNiBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHko
Cj4+PiAgCj4+PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+PiAgCj4+PiAtICAgIC8q
Cj4+PiAtICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2ls
bCBkbyBncmFudC10YWJsZSBvcHMKPj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBHcmFu
dC10YWJsZSBjb2RlIGN1cnJlbnRseSBkb2VzIAo+IGNvcHlfdG8vZnJvbV9ndWVzdAo+Pj4gLSAg
ICAgKiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4gbG9jaywgd2hpY2ggdGhpcyB0
ZXN0IHdvdWxkIAo+IGRpc2FsbG93Lgo+Pj4gLSAgICAgKiBUaGUgdGVzdCBpcyBub3QgbmVlZGVk
IHVudGlsIHdlIGltcGxlbWVudCBzbGVlcGluZy1vbi13YWl0cXVldWUgd2hlbgo+Pj4gLSAgICAg
KiB3ZSBhY2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cu
Cj4+PiAtICAgICAqLwo+Pj4gLSNpZiAwCj4+PiAtICAgIC8qCj4+PiAtICAgICAqIElmIHRoZSBy
ZXF1aXJlZCBndWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0LCB0aGlzIGZ1bmN0aW9uIG1heSBzbGVl
cC4KPj4+IC0gICAgICogSGVuY2Ugd2UgYmFpbCBpbW1lZGlhdGVseSBpZiBjYWxsZWQgZnJvbSBh
dG9taWMgY29udGV4dC4KPj4+IC0gICAgICovCj4+PiAtICAgIGlmICggaW5fYXRvbWljKCkgKQo+
Pj4gLSAgICAgICAgcmV0dXJuIEhWTVRSQU5TX3VuaGFuZGxlYWJsZTsKPj4+IC0jZW5kaWYKPj4g
Cj4+IERlYWxpbmcgd2l0aCB0aGlzIFRPRE8gaXRlbSBpcyBvZiBjb3Vyc2UgbXVjaCBhcHByZWNp
YXRlZCwgYnV0Cj4+IHNob3VsZCBpdCByZWFsbHkgYmUgZGVsZXRlZCBhbHRvZ2V0aGVyPyBUaGUg
YmlnLWRvbWFpbi1sb2NrIGlzc3VlCj4+IGlzIGdvbmUgYWZhaXIsIGluIHdoaWNoIGNhc2UgZHJv
cHBpbmcgdGhlICNpZiAwIHdvdWxkIHNlZW0KPj4gcG9zc2libGUgdG8gbWUsIGV2ZW4gaWYgaXQn
cyBub3Qgc3RyaWN0bHkgbmVlZGVkIHdpdGhvdXQgdGhlIHNsZWVwLQo+PiBvbi13YWl0cXVldWUg
YmVoYXZpb3IgbWVudGlvbmVkLgo+IAo+IFF1ZXN0aW9uIGlzIHdoZXRoZXIgaXQgaXMgd29ydGgg
dG8ga2VlcCBpdCByZXN1bHRpbmcgaW4gdGhlIG5lZWQgdG8KPiBrZWVwIHByZWVtcHRfY291bnQo
KSBhcyB3ZWxsLgoKV2VsbCwgcGVyc29uYWxseSBJIHRoaW5rIGtlZXBpbmcgaXQgaXMgYSBzbWFs
bCBwcmljZSB0byBwYXkuIEJ1dCBzZWVpbmcKQW5kcmV3J3MgUi1iIGhlIGNsZWFybHkgdGhpbmtz
IGRpZmZlcmVudC4gQW5kIGp1c3QgdG8gYmUgY2xlYXIgLSBJCmRvbid0IHJlYWxseSB3YW50IHRv
IHZldG8gdGhpcyBjaGFuZ2UsIGFzIGF0IHRoZSBzYW1lIHRpbWUgaXQncyBhbHNvCmVhc3kgZW5v
dWdoIHRvIHB1dCBiYWNrIGlmIG5lZWQgYmUuIEJ1dCBJJ2QgbGlrZSB0aGlzIHRvIGJlIGdpdmUg
YQoybmQgY29uc2lkZXJhdGlvbiBhdCBsZWFzdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
