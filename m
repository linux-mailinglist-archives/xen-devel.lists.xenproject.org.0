Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9317074F7E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:31:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdnu-0006gs-O2; Thu, 25 Jul 2019 13:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rHZM=VW=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqdnt-0006gm-2z
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:29:05 +0000
X-Inumbo-ID: 2ac1a530-aee0-11e9-9392-775eb0ce1ffd
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ac1a530-aee0-11e9-9392-775eb0ce1ffd;
 Thu, 25 Jul 2019 13:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 4BE4A9C0332;
 Thu, 25 Jul 2019 09:29:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DDpljfcSba-S; Thu, 25 Jul 2019 09:29:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id BA27E9C033D;
 Thu, 25 Jul 2019 09:29:01 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BvL3zh5APbPD; Thu, 25 Jul 2019 09:29:01 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8853D9C0332;
 Thu, 25 Jul 2019 09:29:01 -0400 (EDT)
Message-ID: <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
 <JBeulich@suse.com>
Date: Thu, 25 Jul 2019 09:29:01 -0400
In-Reply-To: <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
Organization: Savoir-faire Linux
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA3LTI1IGF0IDE1OjEzICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjU0OjQ2UE0gKzAwMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gT24gMjUuMDcuMjAxOSAxNDo0NCwgIEZyZWR5IFAuICB3cm90ZToKPiA+ID4g
T24gV2VkLCAyMDE5LTA3LTI0IGF0IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBXaGF0IGhhcmR3YXJlIGludGVyZmFjZSBkb2VzIHRoZXJtYWxkIChvciB0
aGUgZHJpdmVyIGluCj4gPiA+ID4gPiA+IExpbnV4IGlmCj4gPiA+ID4gPiA+IHRoZXJlJ3Mgb25l
KSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPwo+ID4gPiAKPiA+ID4gSW4gb3VyIGlu
aXRpYWwgUE9DIHVzaW5nIFhlbiA0LjgueCB3ZSB3aGVyZSB1c2luZyBMaW51eCBjb3JldGVtcAo+
ID4gPiBkcml2ZXIKPiA+ID4gcmVhZGluZyBieSBleGFtcGxlIC9jbGFzcy9zeXMvaHdtb24vaHdt
b24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QKPiA+ID4gZGVwcmVjYXRlZCBhdCBjb21taXQgNzJl
MDM4NDUwZDNkNWRlMWEzOWYwY2ZhMmQyYjBmOWIzZDQzYzZjNgo+ID4gCj4gPiBIbW0sIEkgd291
bGRuJ3QgY2FsbCB0aGlzIGRlcHJlY2F0aW9uLCBidXQgYSByZWdyZXNzaW9uLiBJIHdvdWxkCj4g
PiBzYXkgd2Ugd2FudCB0byByZS1leHBvc2UgdGhpcyBsZWFmIHRvIERvbTAsIHRoZSBtb3JlIHRo
YXQgdGhlCj4gPiBjb21taXQgYWxzbyBvbmx5IG1lbnRpb25zIHVucHJpdmlsZWdlZCBkb21haW5z
LiBBbmRyZXc/Cj4gCj4gQUZBSUNUIGZyb20gdGhlIGRvY3VtZW50cyBwcm92aWRlZCBieSBGcmVk
eSB0aGUgdGVtcGVyYXR1cmUgaXMgcmVhZAo+IGZyb20gYSBNU1IgdGhhdCByZXBvcnRzIHRoZSBj
dXJyZW50IHRlbXBlcmF0dXJlIG9mIHRoZSBjb3JlIG9uIHdoaWNoCj4gdGhlIE1TUiBpcyByZWFk
IGZyb20uIFdoZW4gcnVubmluZyBvbiBYZW4gdGhpcyB3aWxsIG9ubHkgd29yawo+IGNvcnJlY3Rs
eSBpZiBkb20wIGlzIGdpdmVuIHRoZSBzYW1lIHZDUFVzIGFzIHBDUFVzIGFuZCB0aG9zZSBhcmUK
PiBpZGVudGl0eSBwaW5uZWQuCgpJIGp1c3Qgd2FudCB0byBiZSBzdXJlIEkgZ290IGl0IGNvcnJl
Y3RseSwgYnkgc2F5aW5nICJXaGVuIHJ1bm5pbmcgb24KWGVuIHRoaXMgd2lsbCBvbmx5IHdvcmsg
Y29ycmVjdGx5IGlmIC4uLiIgbWVhbnMgaW4gYSBmdXR1cmUKaW1wbGVtZW50YXRpb24gb3IgdGhh
dCByaWdodCBub3cgY291bGQgd29yayBpZiBJIHBpbiB0aGlzIHYvcENQVVM/Cgo+IE5vdCBzdXJl
IGhvdyBjb21tb24gdGhpcyBNU1IgaW50ZXJmYWNlIGlzIGluIG9yZGVyIHRvIHJlYWQgdGhlcm1h
bAo+IHZhbHVlcywgaWYgdGhlIGludGVyZmFjZSBpdCdzIGNvbW1vbiBtYXliZSBpdCdzIHNvbWV0
aGluZyB0aGF0IGNvdWxkCj4gYmUgaW1wbGVtZW50ZWQgaW4gWGVuLCBhbmQgZXhwb3J0ZWQgc29t
ZWhvdyB0byBkb20wLCBtYXliZSB1c2luZwo+IHN5c2N0bD8KPiAKPiBPciBlbHNlIGhhdmluZyBh
biBoeXBlcmNhbGwgdGhhdCBhbGxvd3MgZG9tMCB0byByZXF1ZXN0IFhlbiB0bwo+IGV4ZWN1dGUK
PiBNU1IgcmVhZC93cml0ZXMgb24gYSBnaXZlbiBwQ1BVLgo+IAo+IFRoYW5rcywgUm9nZXIuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
