Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6D1C60C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 11:29:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQTi7-0006aq-AG; Tue, 14 May 2019 09:26:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQTi6-0006ak-0K
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:26:58 +0000
X-Inumbo-ID: 6af21a10-762a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6af21a10-762a-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 09:26:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 03:26:56 -0600
Message-Id: <5CDA89DD020000780022E70B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 03:26:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
In-Reply-To: <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDEwOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDA0OjI4OjEyUE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDA1OjIwOjA1UE0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NTM6MjFQTSArMDIw
MCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4+ID4gPiBXaGF0IGlzIHRoZSByZWNvbW1lbmRlZCB3YXkg
dG8gZGlzYWJsZSBDT05GSUdfUFZfU0hJTSwgd2hpY2ggaXMgc2V0IGluCj4+ID4gPiB0b29scy9m
aXJtd2FyZS9NYWtlZmlsZT8gRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoZXJlIGlzIG5vIHdheSB0
byAKPiBpbmZsdWVuY2UKPj4gPiA+IGl0cyB2YWx1ZSBmcm9tIG91dHNpZGUsIHdoaWNoIG1lYW5z
IHRoZSBidWlsZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgo+PiA+IAo+PiA+IEkgdGhpbmsgdGhl
IGZvbGxvd2luZyBzaG91bGQgZG8gdGhlIHRyaWNrLgo+PiA+IAo+PiA+IExldCBtZSBrbm93IGlm
IHRoYXQgd29ya3MgZm9yIHlvdSBhbmQgSSB3aWxsIHN1Ym1pdCBpdCBmb3JtYWxseS4KPj4gPiAK
Pj4gPiBUaGFua3MhCj4+ID4gCj4+ID4gLS0tODwtLS0KPj4gPiBkaWZmIC0tZ2l0IGEvY29uZmln
L1Rvb2xzLm1rLmluIGIvY29uZmlnL1Rvb2xzLm1rLmluCj4+ID4gaW5kZXggOTgyNDVmNjNjOS4u
ODRkZGIxYTU0MiAxMDA2NDQKPj4gPiAtLS0gYS9jb25maWcvVG9vbHMubWsuaW4KPj4gPiArKysg
Yi9jb25maWcvVG9vbHMubWsuaW4KPj4gPiBAQCAtNzUsMyArNzUsNSBAQCBUSU5GT19MSUJTICAg
ICAgICAgIDo9IEBUSU5GT19MSUJTQAo+PiA+ICBBUkdQX0xERkxBR1MgICAgICAgIDo9IEBhcmdw
X2xkZmxhZ3NACj4+ID4gIAo+PiA+ICBGSUxFX09GRlNFVF9CSVRTICAgIDo9IEBGSUxFX09GRlNF
VF9CSVRTQAo+PiA+ICsKPj4gPiArQ09ORklHX1BWX1NISU0gICAgICA6PSBAcHZzaGltQAo+PiA+
IGRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUuYWMgYi90b29scy9jb25maWd1cmUuYWMKPj4g
PiBpbmRleCBjOWZkNjlkZGZhLi44ZGYyZmQ2MDRiIDEwMDY0NAo+PiA+IC0tLSBhL3Rvb2xzL2Nv
bmZpZ3VyZS5hYwo+PiA+ICsrKyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+PiA+IEBAIC00OTIsNCAr
NDkyLDE1IEBAIEFDX0FSR19FTkFCTEUoWzlwZnNdLAo+PiA+ICAKPj4gPiAgQUNfU1VCU1Qobmlu
ZXBmcykKPj4gPiAgCj4+ID4gK0FDX0FSR19FTkFCTEUoW3B2c2hpbV0sCj4+ID4gKyAgICBBU19I
RUxQX1NUUklORyhbLS1kaXNhYmxlLXB2c2hpbV0sIFtEaXNhYmxlIHB2c2hpbSBidWlsZCAoeDg2
IG9ubHksIAo+IGVuYWJsZWQgYnkgZGVmYXVsdCldKSwKPj4gPiArICAgIFtBU19JRihbdGVzdCAi
eCRlbmFibGVfcHZzaGltIiA9ICJ4bm8iXSwgW3B2c2hpbT1uXSwgW3B2c2hpbT15XSldLCBbCj4+
ID4gKyAgICBjYXNlICIkaG9zdF9jcHUiIGluCj4+ID4gKyAgICAgICAgaVtbMzQ1Nl1dODZ8eDg2
XzY0KQo+PiA+ICsgICAgICAgICAgIHB2c2hpbT0ieSI7Owo+PiAKPj4gU2luY2UgeGVuIGRvZXNu
J3QgYnVpbGQgb24gMzJiaXQgYW55bW9yZSB5b3UgbWF5IHdhbnQgdG8gZXhjbHVkZQo+PiBpWzM0
NTZdODYgaGVyZT8KPiAKPiBPaCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzLiBJcyBpdCB0cnVlIGZv
ciBhbGwgZGlzdHJvcz8KCkl0J3MgYSBwcm9wZXJ0eSBvZiB0aGUgaHlwZXJ2aXNvciAobm90ZTog
bm90IHRoZSB0b29sIHN0YWNrKSwgYXMgb2YgNC4zLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
