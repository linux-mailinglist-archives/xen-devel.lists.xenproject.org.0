Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9B36EE6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:40:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnte-0002np-0S; Thu, 06 Jun 2019 08:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYntc-0002ni-GG
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:37:16 +0000
X-Inumbo-ID: 47f45678-8836-11e9-96f4-3b4a663a6bbd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47f45678-8836-11e9-96f4-3b4a663a6bbd;
 Thu, 06 Jun 2019 08:37:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 02:37:12 -0600
Message-Id: <5CF8D0B40200007800235CAA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 02:37:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Petre Pircalabu" <ppircalabu@bitdefender.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <3ec19ed5425a62ecbc524e44c4bba86d5fe41762.1559224640.git.ppircalabu@bitdefender.com>
 <74176687-4c9f-f2dc-fafa-a999e3129f3c@citrix.com>
 <2d36968a158b9ff12ef8b717d9ae617062abae6c.camel@bitdefender.com>
In-Reply-To: <2d36968a158b9ff12ef8b717d9ae617062abae6c.camel@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 8/9] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDE5OjAxLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IE9uIFR1ZSwgMjAxOS0wNi0wNCBhdCAxNTo0MyArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gT24gMzAvMDUvMjAxOSAxNToxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+PiA+
ICtzdGF0aWMgaW50IHZtX2V2ZW50X2NoYW5uZWxzX2FsbG9jX2J1ZmZlcihzdHJ1Y3QKPj4gPiB2
bV9ldmVudF9jaGFubmVsc19kb21haW4gKmltcGwpCj4+ID4gK3sKPj4gPiArICAgIGludCBpLCBy
YyA9IC1FTk9NRU07Cj4+ID4gKwo+PiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9m
cmFtZXM7IGkrKyApCj4+ID4gKyAgICB7Cj4+ID4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShpbXBsLT52ZWQuZCwKPj4gPiAwKTsKPj4gCj4+IFRo
aXMgY3JlYXRlcyBwYWdlcyB3aGljaCBhcmUgcmVmZXJlbmNlLWFibGUgKGluIHByaW5jaXBsZSkg
YnkgdGhlCj4+IGd1ZXN0LAo+PiBhbmQgYXJlIGJvdW5kZWQgYnkgZC0+bWF4X3BhZ2VzLgoKTm90
IGJ5IGEgSFZNIG9uZSwgYmVjYXVzZSB0aGV5IGNhbid0IHJlZmVyZW5jZSBwYWdlcyBieSBNRk4u
Ck9yIGVsc2UsIGFzIFBldHJlIGltcGxpZXMsIHRoZSBpb3JlcSBhcHByb2FjaCB3b3VsZCBiZSB3
cm9uZywgdG9vLgoKPj4gQm90aCBvZiB0aGVzZSBhcmUgcHJvcGVydGllcyBvZiB0aGUgZXhpc3Rp
bmcgaW50ZXJmYWNlIHdoaWNoIHdlJ2QKPj4gcHJlZmVyCj4+IHRvIHJlbW92ZS4KPiBUaGUgYWxs
b2NhdGlvbiBtZWNoYW5pc20gaXMgc2ltaWxhciB3aXRoIHRoZSBvbmUgdXNlZCBieSBpb3JlcSAo
dGhlCj4gbWFpbiBkaWZmZXJlbmNlIGlzIHRoZSBudW1iZXIgb2YgcGFnZXMpLgoKUXVlc3Rpb24g
aXMgd2hldGhlciBoZXJlIHlvdSB3YW50IHRvIHVzZSB0aGUgImNhbGxlciBvd25lZCIKdmFyaWFu
dC4gSSBoYXZlbid0IHRob3VnaHQgdGhyb3VnaCB3aGV0aGVyIHRoaXMgd291bGQgYWN0dWFsbHkK
YmUgYmV0dGVyLCBzbyBpdCdzIG1lcmVseSBhIHJlbWFyay4KCj4+ID4gKyAgICAgICAgaWYgKCAh
cGFnZSApCj4+ID4gKyAgICAgICAgICAgIGdvdG8gZXJyOwo+PiA+ICsKPj4gPiArICAgICAgICBp
ZiAoICFnZXRfcGFnZV9hbmRfdHlwZShwYWdlLCBpbXBsLT52ZWQuZCwKPj4gPiBQR1Rfd3JpdGFi
bGVfcGFnZSkgKQo+PiA+ICsgICAgICAgIHsKPj4gPiArICAgICAgICAgICAgcmMgPSAtRU5PREFU
QTsKPj4gPiArICAgICAgICAgICAgZ290byBlcnI7Cj4+ID4gKyAgICAgICAgfQo+PiA+ICsKPj4g
PiArICAgICAgICBpbXBsLT5tZm5baV0gPSBwYWdlX3RvX21mbihwYWdlKTsKPj4gPiArICAgIH0K
Pj4gPiArCj4+ID4gKyAgICBpbXBsLT5zbG90cyA9IChzdHJ1Y3Qgdm1fZXZlbnRfc2xvdCAqKXZt
YXAoaW1wbC0+bWZuLCBpbXBsLQo+PiA+ID5ucl9mcmFtZXMpOwo+PiAKPj4gWW91IGFwcGVhciB0
byBoYXZlIG9wZW5jb2RlZCB2bWFsbG9jKCkgaGVyZS4gIElzIHRoZXJlIGFueSByZWFzb24gbm90
Cj4+IHRvCj4+IHVzZSB0aGF0Pwo+PiAKPiAKPiBUaGUgcHJvYmxlbSB3aXRoIHZtYWxsb2MgaXMg
dGhhdCBpZiB0aGUgcGFnZXMgYXJlIG5vdCBhc3NpZ25lZCB0byBhCj4gc3BlY2lmaWMgZG9tYWlu
IHRoZSByZW1hcHBpbmcgZmFpbHMgaW4gdGhlIG1vbml0b3IgZG9tYWluLgo+IGUuZy46Cj4gLi4u
Cj4gKFhFTikgbW0uYzoxMDE1OmQwdjIgcGdfb3duZXIgZDEgbDFlX293bmVyIGQwLCBidXQgcmVh
bF9wZ19vd25lciBkLTEKPiAoWEVOKSBtbS5jOjEwOTE6ZDB2NyBFcnJvciBnZXR0aW5nIG1mbiA1
ZmJmNTMgKHBmbiBmZmZmZmZmZmZmZmZmZmZmKQo+IGZyb20gTDEgZW50cnkgODAwMDAwMDVmYmY1
MzIyNyBmb3IgbDFlX293bmVyIGQwLCBwZ19vd25lciBkMQoKSW4gd2hpY2ggY2FzZSBtYXliZSB1
c2Ugdm1hbGxvYygpIGFuZCB0aGVuIGFzc2lnbl9wYWdlcygpPwoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
