Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE233296DD
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 13:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU86O-0004pQ-9Y; Fri, 24 May 2019 11:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU86N-0004pL-9O
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 11:11:07 +0000
X-Inumbo-ID: 9e51f998-7e14-11e9-856b-4b1564dd958a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e51f998-7e14-11e9-856b-4b1564dd958a;
 Fri, 24 May 2019 11:11:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 05:11:02 -0600
Message-Id: <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 05:10:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
 <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
In-Reply-To: <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDExOjU0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biA1LzIzLzE5IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjEuMDUuMTkgYXQg
MDk6NDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gR3Vlc3RzIGNhbiBpc3N1ZSBn
cmFudCB0YWJsZSBvcGVyYXRpb25zIGFuZCBwcm92aWRlIGd1ZXN0IGNvbnRyb2xsZWQKPj4+IGRh
dGEgdG8gdGhlbS4gVGhpcyBkYXRhIGlzIHVzZWQgYXMgaW5kZXggZm9yIG1lbW9yeSBsb2FkcyBh
ZnRlciBib3VuZAo+Pj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVjdWxhdGl2
ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMsIHdlCj4+PiB1c2UgdGhlIGFycmF5X2luZGV4X25vc3Bl
YyBtYWNybyB3aGVyZSBhcHBsaWNhYmxlLCBvciB0aGUgbWFjcm8KPj4+IGJsb2NrX3NwZWN1bGF0
aW9uLiBOb3RlLCB0aGF0IHRoZSBibG9ja19zcGVjdWxhdGlvbiBpcyBhbHdheXMgdXNlZCBpbgo+
PiBzL2Fsd2F5cy9hbHJlYWR5LyA/Cj4gVGhleSBib3RoIHdvcmssIGJ1dCB0aGUgJ2Fsd2F5cycg
dW5kZXJsaW5lcyB0aGF0IGEgY2FsbGVyIGNhbiByZWx5IG9uCj4gdGhlIGZhY3QgdGhhdCB0aGlz
IHdpbGwgaGFwcGVuIG9uIGFsbCBleGVjdXRpb24gcGF0aCBvZiB0aGF0IGZ1bmN0aW9uLgo+IEhl
bmNlLCBJIGxpa2UgdG8gc3RpY2sgdG8gJ2Fsd2F5cycgaGVyZS4KCldlbGwsIEknbSBub3QgYSBu
YXRpdmUgc3BlYWtlciwgYnV0IHRvIG1lICJhbHdheXMiIGRvZXNuJ3QgZXhwcmVzcwp3aGF0IHlv
dSB3YW50IHRvIGV4cHJlc3MgaGVyZS4gV2hhdCB5b3UgbWVhbiBJJ2Qgd29yZCAiLi4uIGlzIHVz
ZWQKb24gYWxsIHBhdGhzIG9mIC4uLiIKCj4+PiB0aGUgY2FsbHMgdG8gc2hhcmVkX2VudHJ5X2hl
YWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcywgc28gdGhhdCBubwo+Pj4gYWRkaXRpb25hbCBwcm90
ZWN0aW9uIGlzIHJlcXVpcmVkIG9uY2UgdGhlc2UgZnVuY3Rpb25zIGhhdmUgYmVlbgo+Pj4gY2Fs
bGVkLgoKQXMgYW4gYXNpZGUsIHlvdXIgdXNlIG9mICJpbiB0aGUgY2FsbHMgdG8iIGxvb2tzIGFs
c28gbWlzbGVhZGluZyB0byBtZSwKYmVjYXVzZSB0aGUgZmVuY2VzIHNpdCBpbiB0aGUgZnVuY3Rp
b25zLCBub3QgYXQgdGhlIGNhbGwgc2l0ZXMuCgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jCj4+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+IEBAIC05ODgsOSAr
OTg4LDEwIEBAIG1hcF9ncmFudF9yZWYoCj4+PiAgICAgICAgICBQSU5fRkFJTCh1bmxvY2tfb3V0
LCBHTlRTVF9iYWRfZ250cmVmLCAiQmFkIHJlZiAlI3ggZm9yIGQlZFxuIiwKPj4+ICAgICAgICAg
ICAgICAgICAgIG9wLT5yZWYsIHJndC0+ZG9tYWluLT5kb21haW5faWQpOwo+Pj4gIAo+Pj4gLSAg
ICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9wLT5yZWYpOwo+Pj4gKyAgICAvKiBU
aGlzIGNhbGwgYWxzbyBlbnN1cmVzIHRoZSBhYm92ZSBjaGVjayBjYW5ub3QgYmUgcGFzc2VkIHNw
ZWN1bGF0aXZlbHkgKi8KPj4+ICAgICAgc2hhaCA9IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCBv
cC0+cmVmKTsKPj4+ICAgICAgc3RhdHVzID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+
ZmxhZ3MgOiAmc3RhdHVzX2VudHJ5KHJndCwgb3AtPnJlZik7Cj4+PiArICAgIGFjdCA9IGFjdGl2
ZV9lbnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7Cj4+IEkga25vdyB3ZSd2ZSBiZWVuIHRoZXJl
IGJlZm9yZSwgYnV0IHdoYXQgZ3VhcmFudGVlcyB0aGF0IHRoZQo+PiBjb21waWxlciB3b24ndCBy
ZWxvYWQgb3AtPnJlZiBmcm9tIG1lbW9yeSBmb3IgZWl0aGVyIG9mIHRoZQo+PiBsYXR0ZXIgdHdv
IGFjY2Vzc2VzPyBJbiBmYWN0IGFmYWljdCBpdCBhbHdheXMgd2lsbCwgZHVlIHRvIHRoZQo+PiBt
ZW1vcnkgY2xvYmJlciBpbiBhbHRlcm5hdGl2ZSgpLgo+IFRoZSBjb21waWxlciBjYW4gcmVsb2Fk
IG9wLT5yZWYgZnJvbSBtZW1vcnksIHRoYXQgaXMgZmluZSBoZXJlLCBhcyB0aGUKPiBib3VuZCBj
aGVjayBoYXBwZW5zIGFib3ZlLCBhbmQgdGhlIHNoYXJlZF9lbnRyeSBjYWxsIGNvbWVzIHdpdGgg
YW4KPiBsZmVuY2UoKSBieSBub3csIHNvIHRoYXQgd2Ugd2lsbCBub3QgY29udGludWUgZXhlY3V0
aW5nIHNwZWN1bGF0aXZlbHkKPiB3aXRoIG9wLT5yZWYgYmVpbmcgb3V0LW9mLWJvdW5kcywgaW5k
ZXBlbmRlbnRseSBvZiB3aGV0aGVyIGl0J3MgZnJvbQo+IG1lbW9yeSBvciByZWdpc3RlcnMuCgpJ
IGRvbid0IGJ1eSB0aGlzIGFyZ3VtZW50YXRpb246IEluIHBhcnRpY3VsYXIgaWYgdGhlIGNhY2hl
IGxpbmUgZ290CmZsdXNoZWQgZm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIGxvYWQgbWF5IHRha2Ug
YWxtb3N0IGFyYml0cmFyaWx5CmxvbmcsIG9wZW5pbmcgdXAgYSBsYXJnZSBzcGVjdWxhdGlvbiB3
aW5kb3cgYWdhaW4gdXNpbmcgdGhlCmRlc3RpbmF0aW9uIHJlZ2lzdGVyIG9mIHRoZSBsb2FkICh3
aGF0ZXZlciAtIG5vdCBib3VuZHMgY2hlY2tlZCAtCnZhbHVlIHRoYXQgZW5kcyB1cCBob2xkaW5n
KS4KCj4+PiBAQCAtMzg2Myw2ICszODgzLDkgQEAgc3RhdGljIGludCBnbnR0YWJfZ2V0X3N0YXR1
c19mcmFtZV9tZm4oc3RydWN0IGRvbWFpbiAqZCwKPj4+ICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPj4+ICAgICAgfQo+Pj4gIAo+Pj4gKyAgICAvKiBNYWtlIHN1cmUgaWR4IGlzIGJvdW5k
ZWQgd3J0IG5yX3N0YXR1c19mcmFtZXMgKi8KPj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsK
Pj4+ICsKPj4+ICAgICAgKm1mbiA9IF9tZm4odmlydF90b19tZm4oZ3QtPnN0YXR1c1tpZHhdKSk7
Cj4+PiAgICAgIHJldHVybiAwOwo+Pj4gIH0KPj4gV2h5IGRvbid0IHlvdSB1c2UgYXJyYXlfaW5k
ZXhfbm9zcGVjKCkgaGVyZT8gQW5kIGhvdyBjb21lCj4gVGhlcmUgaXMgbm8gc3BlY2lmaWMgcmVh
c29uLiBJIHdpbGwgc3dhcC4KPj4gc3BlY3VsYXRpb24gaW50byBnbnR0YWJfZ3Jvd190YWJsZSgp
IGlzIGZpbmUgYSBmZXcgbGluZXMgYWJvdmU/Cj4gSSBkbyBub3Qgc2VlIGEgcmVhc29uIHdoeSBp
dCB3b3VsZCBiZSBiYWQgdG8gZW50ZXIgdGhhdCBmdW5jdGlvbgo+IHNwZWN1bGF0aXZlbHkuIFRo
ZXJlIGFyZSBubyBhY2Nlc3NlcyB0aGF0IHdvdWxkIGhhdmUgdG8gYmUgcHJvdGVjdGVkIGJ5Cj4g
ZXh0cmEgY2hlY2tzLCBhZmFpY3QuIE90aGVyd2lzZSwgdGhhdCBmdW5jdGlvbiBzaG91bGQgYmUg
cHJvdGVjdGVkIGJ5Cj4gaXRzIG93bi4KCldoaWNoIGluIGZhY3QgaGFwcGVucywgYnV0IG9ubHkg
aW4gcGF0Y2ggMy4gVGhpcyBtYXkgYmUgd29ydGggc2F5aW5nCmV4cGxpY2l0bHkgaGVyZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
