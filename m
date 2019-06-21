Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2D4EA4C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:12:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKF4-00075s-VY; Fri, 21 Jun 2019 14:10:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heKF3-00075n-E1
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:10:13 +0000
X-Inumbo-ID: 4813834c-942e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4813834c-942e-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:10:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 08:10:10 -0600
Message-Id: <5D0CE53E020000780023A293@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 08:10:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8795020000780021F32C@prv1-mh.provo.novell.com>
 <f149d827-ac66-3460-2fa3-9c653bfbf91b@citrix.com>
In-Reply-To: <f149d827-ac66-3460-2fa3-9c653bfbf91b@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 49/50] x86emul: add a SHA test case to
 the harness
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE1OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ICsgICAgICAg
IC8qCj4+ICsgICAgICAgICAqIFNIQTI1NlJORFMyCj4+ICsgICAgICAgICAqCj4+ICsgICAgICAg
ICAqIFNSQzEgPSB7IEMwLCBEMCwgRzAsIEgwIH0KPj4gKyAgICAgICAgICogU1JDMiA9IHsgQTAs
IEIwLCBFMCwgRjAgfQo+PiArICAgICAgICAgKiBYTU0wID0gVycgPSB7ID8sID8sIFdLMSwgV0sw
IH0KPj4gKyAgICAgICAgICoKPj4gKyAgICAgICAgICogKE5CIHRoYXQgdGhlIG5vdGF0aW9uIGFn
YWluIGlzIG5vdCBDLWxpa2UsIGkuZS4gZWxlbWVudHMgYXJlIGxpc3RlZAo+PiArICAgICAgICAg
KiBoaWdoLXRvLWxvdyBldmVyeXdoZXJlIGluIHRoaXMgY29tbWVudC4pCj4+ICsgICAgICAgICAq
Cj4+ICsgICAgICAgICAqIENoKEUsRixHKSA9IChFICYgRikgXiAofkUgJiBHKQo+PiArICAgICAg
ICAgKiBNYWooQSxCLEMpID0gKEEgJiBCKSBeIChBICYgQykgXiAoQiAmIEMpCj4+ICsgICAgICAg
ICAqCj4+ICsgICAgICAgICAqIMOOwqMwKEEpID0gUk9SMihBKSBeIFJPUjEzKEEpIF4gUk9SMjIo
QSkKPj4gKyAgICAgICAgICogw47CozEoRSkgPSBST1I2KEUpIF4gUk9SMTEoRSkgXiBST1IyNShF
KQo+IAo+IFRoaXMgbG9va3MgbGlrZSBzb21lIGVuY29kaW5nIHByb2JsZW1zIChhbmQgbGF0ZXIg
b24gaW4gdGhlIGNvbW1lbnQpLiAgSQo+IGNhbid0IHRlbGwgd2hldGhlciBpdCBpcyBhIGNvbnNl
cXVlbmNlIG9mIHRoZSBlbWFpbCBvciBzb21ldGhpbmcgcHJlc2VudAo+IGluIHRoZSB1bmRlcmx5
aW5nIHBhdGNoLiAKCk9oIC0gSSBmb3Jnb3QgdG8gcHJvcGVybHkgZW5mb3JjZSBVVEY4IHdoaWxl
IGNvbXBvc2luZyB0aGUgbWFpbC4KVGhpcyBpcyB3aGF0IGl0J2xsIGxvb2tzIGxpa2Ugd2hlbiBj
b21taXR0ZWQ6CgogICAgICAgIC8qCiAgICAgICAgICogU0hBMjU2Uk5EUzIKICAgICAgICAgKgog
ICAgICAgICAqIFNSQzEgPSB7IEMwLCBEMCwgRzAsIEgwIH0KICAgICAgICAgKiBTUkMyID0geyBB
MCwgQjAsIEUwLCBGMCB9CiAgICAgICAgICogWE1NMCA9IFcnID0geyA/LCA/LCBXSzEsIFdLMCB9
CiAgICAgICAgICoKICAgICAgICAgKiAoTkIgdGhhdCB0aGUgbm90YXRpb24gYWdhaW4gaXMgbm90
IEMtbGlrZSwgaS5lLiBlbGVtZW50cyBhcmUgbGlzdGVkCiAgICAgICAgICogaGlnaC10by1sb3cg
ZXZlcnl3aGVyZSBpbiB0aGlzIGNvbW1lbnQuKQogICAgICAgICAqCiAgICAgICAgICogQ2goRSxG
LEcpID0gKEUgJiBGKSBeICh+RSAmIEcpCiAgICAgICAgICogTWFqKEEsQixDKSA9IChBICYgQikg
XiAoQSAmIEMpIF4gKEIgJiBDKQogICAgICAgICAqCiAgICAgICAgICogzqMwKEEpID0gUk9SMihB
KSBeIFJPUjEzKEEpIF4gUk9SMjIoQSkKICAgICAgICAgKiDOozEoRSkgPSBST1I2KEUpIF4gUk9S
MTEoRSkgXiBST1IyNShFKQoKPj4gK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4X3NoYSh2b2lk
KQo+PiArewo+PiArICAgIHJldHVybiBjcHVfaGFzX3NoYSAmJiBjcHVfaGFzX2F2eDsKPiAKPiBJ
IGNhbid0IGxvY2F0ZSBhbnkgW0VdVkVYIGVuY29kaW5nIGluZm9ybWF0aW9uIGZvciB0aGUgU0hB
Cj4gaW5zdHJ1Y3Rpb25zLiAgSXMgdGhpcyBhIHNpZGUgZWZmZWN0IG9mIHRoZSByZXN0IG9mIHRo
ZSB0ZXN0IGFsZ29yaXRobSwKPiBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIGluIHRoZSBtYW51
YWw/CgpUaGVyZSBhcmUgb25seSBsZWdhY3kgZm9ybXMgYXMgb2Ygbm93LiBOb3RlIHRoZSBzaW5n
bGUgc2VudGVuY2UgaW4KdGhlIGNvbW1pdCBtZXNzYWdlOgoKIkFsc28gdXNlIHRoaXMgZm9yIEFW
WDUxMlZMIFZQUk97TCxSfXssVn1EIGFzIHdlbGwgYXMgc29tZSBmdXJ0aGVyIHNoaWZ0cwogdGVz
dGluZy4iCgpUaGUgQVZYIGFuZCBBVlg1MTJGIGZsYXZvcnMgb2YgdGhlIHRlc3QgYXJlIGdvb2Qg
dGVzdCBjYXNlcyBmb3Igb3RoZXIKaW5zbnM7IHRoZXkgYXJlIHN0aWxsIG9ubHkgdXRpbGl6aW5n
IGxlZ2FjeSBlbmNvZGVkIFNIQSBpbnNucy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
