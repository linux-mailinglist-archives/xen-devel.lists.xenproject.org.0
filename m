Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553E2617A
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 12:12:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTOCj-00017c-U4; Wed, 22 May 2019 10:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTOCi-00017X-K9
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:10:36 +0000
X-Inumbo-ID: d533631c-7c79-11e9-849f-1f8d379902dd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d533631c-7c79-11e9-849f-1f8d379902dd;
 Wed, 22 May 2019 10:10:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 04:10:31 -0600
Message-Id: <5CE52014020000780023147E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 04:10:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Juergen Gross" <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
In-Reply-To: <20190522094549.28397-2-jgross@suse.com>
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

Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+
IEBAIC0zMTg1LDIyICszMTg1LDYgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3Vs
dCBfX2h2bV9jb3B5KAo+ICAKPiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4gIAo+IC0g
ICAgLyoKPiAtICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMg
d2lsbCBkbyBncmFudC10YWJsZSBvcHMKPiAtICAgICAqIHN1Y2ggYXMgcXVlcnlfc2l6ZS4gR3Jh
bnQtdGFibGUgY29kZSBjdXJyZW50bHkgZG9lcyBjb3B5X3RvL2Zyb21fZ3Vlc3QKPiAtICAgICAq
IGFjY2Vzc2VzIHVuZGVyIHRoZSBiaWcgcGVyLWRvbWFpbiBsb2NrLCB3aGljaCB0aGlzIHRlc3Qg
d291bGQgZGlzYWxsb3cuCj4gLSAgICAgKiBUaGUgdGVzdCBpcyBub3QgbmVlZGVkIHVudGlsIHdl
IGltcGxlbWVudCBzbGVlcGluZy1vbi13YWl0cXVldWUgd2hlbgo+IC0gICAgICogd2UgYWNjZXNz
IGEgcGFnZWQtb3V0IGZyYW1lLCBhbmQgdGhhdCdzIHBvc3QgNC4xLjAgbm93Lgo+IC0gICAgICov
Cj4gLSNpZiAwCj4gLSAgICAvKgo+IC0gICAgICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9y
eSBpcyBwYWdlZCBvdXQsIHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVwLgo+IC0gICAgICogSGVuY2Ug
d2UgYmFpbCBpbW1lZGlhdGVseSBpZiBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dC4KPiAtICAg
ICAqLwo+IC0gICAgaWYgKCBpbl9hdG9taWMoKSApCj4gLSAgICAgICAgcmV0dXJuIEhWTVRSQU5T
X3VuaGFuZGxlYWJsZTsKPiAtI2VuZGlmCgpEZWFsaW5nIHdpdGggdGhpcyBUT0RPIGl0ZW0gaXMg
b2YgY291cnNlIG11Y2ggYXBwcmVjaWF0ZWQsIGJ1dApzaG91bGQgaXQgcmVhbGx5IGJlIGRlbGV0
ZWQgYWx0b2dldGhlcj8gVGhlIGJpZy1kb21haW4tbG9jayBpc3N1ZQppcyBnb25lIGFmYWlyLCBp
biB3aGljaCBjYXNlIGRyb3BwaW5nIHRoZSAjaWYgMCB3b3VsZCBzZWVtCnBvc3NpYmxlIHRvIG1l
LCBldmVuIGlmIGl0J3Mgbm90IHN0cmljdGx5IG5lZWRlZCB3aXRob3V0IHRoZSBzbGVlcC0Kb24t
d2FpdHF1ZXVlIGJlaGF2aW9yIG1lbnRpb25lZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
