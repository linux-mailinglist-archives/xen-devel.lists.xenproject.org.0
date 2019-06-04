Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D043345DA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 13:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY7rL-0004YN-61; Tue, 04 Jun 2019 11:44:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY7rJ-0004YI-Aw
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 11:44:05 +0000
X-Inumbo-ID: 0cdd3830-86be-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0cdd3830-86be-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 11:44:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 05:44:02 -0600
Message-Id: <5CF6597E0200007800235008@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 05:43:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>,"Baodong Chen" <chenbaodong@mxnavi.com>
References: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
 <B930162C-3D36-4182-9302-D0833A550C9C@citrix.com>
In-Reply-To: <B930162C-3D36-4182-9302-D0833A550C9C@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, IanJackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDEyOjQ5LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gSnVuIDQsIDIwMTksIGF0IDE6NDQgQU0sIEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2Rv
bmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZwo+PiArKysg
Yi94ZW4vY29tbW9uL0tjb25maWcKPj4gQEAgLTM2OCw0ICszNjgsMTYgQEAgY29uZmlnIERPTTBf
TUVNCj4+IAo+PiAJICBMZWF2ZSBlbXB0eSBpZiB5b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8gc3Bl
Y2lmeS4KPj4gCj4+ICtjb25maWcgVFJBQ0VCVUZGRVIKPj4gKwlib29sICJFbmFibGUgdHJhY2Ug
ZXZlbnQgbG9ncyIgIGlmIEVYUEVSVCA9ICJ5Igo+PiArCS0tLWhlbHAtLS0KPj4gKwkgIFhlbiBp
bnRlcm5hbCBydW5uaW5nIHN0YXR1cyh0cmFjZSBldmVudCkgd2lsbCBiZSBzYXZlZCB0byB0cmFj
ZSBtZW1vcnkKPj4gKwkgIHdoZW4gZW5hYmxlZC4gdHJhY2UgZXZlbnQgZGF0YSBhbmQgY29uZmln
IHBhcmFtcyBjYW4gYmUgcmVhZC9jaGFuZ2VkCj4+ICsJICBieSBzeXN0ZW0gY29udHJvbCBoeXBl
cmNhbGwgYXQgcnVuIHRpbWUuCj4+ICsKPj4gKwkgIFRoaXMgaXMgdXNlZCB0byByZWNvcmQgeGVu
IGludGVybmFsIHJ1bm5pbmcgc3RhdHVzLgo+PiArCSAgd2l0aCBhIGxpdHRlIHBlcmZvcm1hbmNl
IG92ZXJoZWFkLgo+PiArCSAgQ2FuIGJlIHNldCB0byAnTicgaWYgeW91IGRvbnQgd2FudCB0aGlz
IGZ1bmN0aW9uLgo+PiArCSAgV2hlbiBub3QgY29uZmlndXJlZCwgJ1hFTl9TVFNDVExfdGJ1Zl9v
cCcgY29tbWFuZCB3aWxsIHJlc3VsdCAnRU5PU1lT4oCZLgo+IAo+IEkgdGhpbmsgdGhpcyB3b3Vs
ZCBsb29rIGJldHRlciBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IOKAnEVuYWJsZSB0cmFjaW5n
IGluZnJhc3RydWN0dXJl4oCdCj4gCj4g4oCcRW5hYmxlIGluIHRyYWNpbmcgaW5mcmFzdHJ1Y3R1
cmUgYW5kIHByZS1kZWZpbmVkIHRyYWNlcG9pbnRzIHdpdGhpbiBYZW4uICAKPiBUaGlzIHdpbGwg
YWxsb3cgbGl2ZSBpbmZvcm1hdGlvbiBhYm91dCBYZW7igJlzIGV4ZWN1dGlvbiBhbmQgcGVyZm9y
bWFuY2UgdG8gYmUgCj4gY29sbGVjdGVkIGF0IHJ1biB0aW1lIGZvciBkZWJ1Z2dpbmcgb3IgcGVy
Zm9ybWFuY2UgYW5hbHlzaXMuICBNZW1vcnkgYW5kIAo+IGV4ZWN1dGlvbiBvdmVyaGVhZCB3aGVu
IG5vdCBhY3RpdmUgaXMgbWluaW1hbC4iCj4gCj4gQWxzbywgSeKAmW0gbm90IDEwMCUgZmFtaWxp
YXIgd2l0aCB0aGUga2NvbmZpZyBzeW50YXgg4oCUIEkgdGhpbmsgd2Ugd2FudCAKPiB0cmFjaW5n
IGVuYWJsZWQgYnkgZGVmYXVsdCB1bmxlc3MgYWN0aXZlbHkgZGlzYWJsZWQ7IGlzIHRoYXQgd2hh
dCB3aWxsIGhhcHBlbiAKPiBoZXJlPyAgT3Igd2lsbCBpdCBvbmx5IGJlIGVuYWJsZWQgaWYgRVhQ
RVJUID09IOKAmHnigJk/CgpPaCwgaW5kZWVkIC0gdGhlcmUncyBhICJkZWZhdWx0IHkiIG1pc3Np
bmcuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
