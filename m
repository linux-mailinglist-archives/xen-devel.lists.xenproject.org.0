Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1B11A87
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMC7A-0007OP-23; Thu, 02 May 2019 13:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMC78-0007OK-V0
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:51:06 +0000
X-Inumbo-ID: 5185d3e4-6ce1-11e9-9da9-b39fe2e42f44
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5185d3e4-6ce1-11e9-9da9-b39fe2e42f44;
 Thu, 02 May 2019 13:51:00 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:50:59 -0600
Message-Id: <5CCAF5BE020000780022B485@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:50:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1556803627-22855-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1556803627-22855-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate the Real Mode entry
 points
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
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gQEAgLTM4LDYgKzM4LDEyIEBACj4gIAo+ICAgICAg
ICAgIC5jb2RlMTYKPiAgCj4gKy8qCj4gKyAqIGRvX2Jvb3RfY3B1KCkgcHJvZ3JhbXMgdGhlIFN0
YXJ0dXAtSVBJIHRvIHBvaW50IGhlcmUuICBEdWUgdG8gdGhlIFNJUEkKPiArICogZm9ybWF0LCB0
aGUgcmVsb2NhdGVkIGVudHJ5cG9pbnQgbXVzdCBiZSA0ayBhbGlnbmVkLgo+ICsgKgo+ICsgKiBJ
dCBpcyBlbnRlcmVkIGluIFJlYWwgTW9kZSwgd2l0aCAlY3MgPSB3YWtldXBfc3RhcnQgPj4gNCBh
bmQgJWlwID0gMC4KPiArICovCj4gIEdMT0JBTCh0cmFtcG9saW5lX3JlYWxtb2RlX2VudHJ5KQoK
VGhlIHJlZmVyZW5jZSB0byB3YWtldXBfc3RhcnQgbG9va3MgdG8gYmUgYSBjb3B5LWFuZC1wYXN0
ZQoob3IgYWxpa2UpIG1pc3Rha2UgaGVyZS4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiBAQCAtNTQ4LDkgKzU0OCwxMiBAQCBz
dGF0aWMgaW50IGRvX2Jvb3RfY3B1KGludCBhcGljaWQsIGludCBjcHUpCj4gIAo+ICAgICAgYm9v
dGluZ19jcHUgPSBjcHU7Cj4gIAo+IC0gICAgLyogc3RhcnRfZWlwIGhhZCBiZXR0ZXIgYmUgcGFn
ZS1hbGlnbmVkISAqLwo+ICAgICAgc3RhcnRfZWlwID0gc2V0dXBfdHJhbXBvbGluZSgpOwo+ICAK
PiArICAgIC8qIHN0YXJ0X2VpcCBuZWVkcyBiZSBwYWdlIGFsaWduZWQsIGFuZCBiZWxvdyB0aGUg
MU0gYm91bmRhcnkuICovCj4gKyAgICBpZiAoIHN0YXJ0X2VpcCAmIH4weGZmMDAwICkKPiArICAg
ICAgICBwYW5pYygiQVAgdHJhbXBvbGluZSAlI2x4IG5vdCBzdWl0YWJseSBwb3NpdGlvbmVkXG4i
LCBzdGFydF9laXApOwoKU2VlaW5nIHdoYXQgc2V0dXBfdHJhbXBvbGluZSgpIHJlYWxseSBkb2Vz
LCBJJ20gbm90CmNvbnZpbmNlZCBhIHBhbmljKCkgaXMgb2YgbXVjaCB2YWx1ZS4gVGhlIHBhZ2Ut
YWxpZ25tZW50CnNob3VsZCBiZSBwb3NzaWJsZSB0byBjaGVjayBhdCBidWlsZCB0aW1lLCBhbmQg
dGhlIGJlbG93LTFNCnJlcXVpcmVtZW50IHNob3VsZCBiZSBndWFyYW50ZWVkIGJ5IHVzIGFsbG9j
YXRpbmcgbG93Cm1lbW9yeSBzcGFjZSBpbiB0aGUgZmlyc3QgcGxhY2UuIE5ldmVydGhlbGVzcyBJ
IHdvbid0IGluc2lzdCwKc28gd2l0aCB0aGUgZWFybGllciBjb21tZW50IGNvcnJlY3RlZApSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
