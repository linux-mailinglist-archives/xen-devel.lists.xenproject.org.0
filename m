Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90C75130
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqeim-0005WN-VZ; Thu, 25 Jul 2019 14:27:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rHZM=VW=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqeim-0005WI-3S
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:27:52 +0000
X-Inumbo-ID: 60a9d3bb-aee8-11e9-8980-bc764e045a96
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 60a9d3bb-aee8-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id A30959C019A;
 Thu, 25 Jul 2019 10:27:48 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RC0uty2uavIZ; Thu, 25 Jul 2019 10:27:48 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id EE4289C034A;
 Thu, 25 Jul 2019 10:27:47 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T-VW6VYP1WXI; Thu, 25 Jul 2019 10:27:47 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C23BA9C019A;
 Thu, 25 Jul 2019 10:27:47 -0400 (EDT)
Message-ID: <ab479a6208d2776e0b3f609c534e54900ef0d9d2.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
 <JBeulich@suse.com>
Date: Thu, 25 Jul 2019 10:27:47 -0400
In-Reply-To: <20190725140744.cds7lzqrbozfj66y@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <b2e44583-8969-7a61-0458-a8ceea245792@suse.com>
 <20190725140744.cds7lzqrbozfj66y@Air-de-Roger>
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

LS0gCkZyZWR5IFB1bGlkbywKQ29uc3VsdGFudCBlbiBsb2dpY2llbCBsaWJyZQpJbmZyYXN0cnVj
dHVyZSwgSW5mb251YWdpcXVlIGV0IGFyY2hpdGVjdHVyZSBkZSBzeXN0w6htZXMKU2F2b2lyLWZh
aXJlIExpbnV4LCBNb250csOpYWwsIFFjCkJ1cmVhdSA6ICgrIDEpIDUxNCAyNzYtNTQ2OCBwLjQx
MCAKCk1lc3NhZ2UgZGUgY29uZmlkZW50aWFsaXTDqSA6CkNlIGNvdXJyaWVsIChkZSBtw6ptZSBx
dWUgbGVzIGZpY2hpZXJzIGpvaW50cykgZXN0IHN0cmljdGVtZW50IHLDqXNlcnbDqSDDoApsJ3Vz
YWdlIGRlIGxhIHBlcnNvbm5lIG91IGRlIGwnZW50aXTDqSDDoCBxdWkgaWwgZXN0IGFkcmVzc8Op
IGV0IHBldXQKY29udGVuaXIgZGUgbCdpbmZvcm1hdGlvbiBwcml2aWzDqWdpw6llIGV0IGNvbmZp
ZGVudGllbGxlLgpUb3V0ZSBkaXZ1bGdhdGlvbiwgZGlzdHJpYnV0aW9uIG91IGNvcGllIGRlIGNl
IGNvdXJyaWVsIGVzdCBzdHJpY3RlbWVudApwcm9oaWLDqWUuClNpIHZvdXMgYXZleiByZcOndSBj
ZSBjb3VycmllbCBwYXIgZXJyZXVyLCB2ZXVpbGxleiBub3VzIGVuIGF2aXNlciBzdXItCmxlLWNo
YW1wLCBkw6l0cnVpcmUgdG91dGVzIGxlcyBjb3BpZXMgZXQgbGUgc3VwcHJpbWVyIGRlIHZvdHJl
IHN5c3TDqG1lCmluZm9ybWF0aXF1ZS4KCk9uIFRodSwgMjAxOS0wNy0yNSBhdCAxNjowNyArMDIw
MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwMTo0
MzozNFBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDI1LjA3LjIwMTkgMTU6MTMs
IFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAx
Mjo1NDo0NlBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiBPbiAyNS4wNy4yMDE5
IDE0OjQ0LCAgRnJlZHkgUC4gIHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCAyMDE5LTA3LTI0IGF0
IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gV2hh
dCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0aGVybWFsZCAob3IgdGhlIGRyaXZlciBpbgo+ID4g
PiA+ID4gPiA+ID4gTGludXggaWYKPiA+ID4gPiA+ID4gPiA+IHRoZXJlJ3Mgb25lKSB1c2UgdG8g
Z2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJbiBvdXIgaW5p
dGlhbCBQT0MgdXNpbmcgWGVuIDQuOC54IHdlIHdoZXJlIHVzaW5nIExpbnV4Cj4gPiA+ID4gPiBj
b3JldGVtcCBkcml2ZXIKPiA+ID4gPiA+IHJlYWRpbmcgYnkgZXhhbXBsZSAvY2xhc3Mvc3lzL2h3
bW9uL2h3bW9uMC90ZW1wM19pbnB1dCBidXQgaXQKPiA+ID4gPiA+IGdvdAo+ID4gPiA+ID4gZGVw
cmVjYXRlZCBhdCBjb21taXQgNzJlMDM4NDUwZDNkNWRlMWEzOWYwY2ZhMmQyYjBmOWIzZDQzYzZj
Ngo+ID4gPiA+IAo+ID4gPiA+IEhtbSwgSSB3b3VsZG4ndCBjYWxsIHRoaXMgZGVwcmVjYXRpb24s
IGJ1dCBhIHJlZ3Jlc3Npb24uIEkKPiA+ID4gPiB3b3VsZAo+ID4gPiA+IHNheSB3ZSB3YW50IHRv
IHJlLWV4cG9zZSB0aGlzIGxlYWYgdG8gRG9tMCwgdGhlIG1vcmUgdGhhdCB0aGUKPiA+ID4gPiBj
b21taXQgYWxzbyBvbmx5IG1lbnRpb25zIHVucHJpdmlsZWdlZCBkb21haW5zLiBBbmRyZXc/Cj4g
PiA+IAo+ID4gPiBBRkFJQ1QgZnJvbSB0aGUgZG9jdW1lbnRzIHByb3ZpZGVkIGJ5IEZyZWR5IHRo
ZSB0ZW1wZXJhdHVyZSBpcwo+ID4gPiByZWFkCj4gPiA+IGZyb20gYSBNU1IgdGhhdCByZXBvcnRz
IHRoZSBjdXJyZW50IHRlbXBlcmF0dXJlIG9mIHRoZSBjb3JlIG9uCj4gPiA+IHdoaWNoCj4gPiA+
IHRoZSBNU1IgaXMgcmVhZCBmcm9tLiBXaGVuIHJ1bm5pbmcgb24gWGVuIHRoaXMgd2lsbCBvbmx5
IHdvcmsKPiA+ID4gY29ycmVjdGx5IGlmIGRvbTAgaXMgZ2l2ZW4gdGhlIHNhbWUgdkNQVXMgYXMg
cENQVXMgYW5kIHRob3NlIGFyZQo+ID4gPiBpZGVudGl0eSBwaW5uZWQuCj4gPiA+IAo+ID4gPiBO
b3Qgc3VyZSBob3cgY29tbW9uIHRoaXMgTVNSIGludGVyZmFjZSBpcyBpbiBvcmRlciB0byByZWFk
Cj4gPiA+IHRoZXJtYWwKPiA+ID4gdmFsdWVzLCBpZiB0aGUgaW50ZXJmYWNlIGl0J3MgY29tbW9u
IG1heWJlIGl0J3Mgc29tZXRoaW5nIHRoYXQKPiA+ID4gY291bGQKPiA+ID4gYmUgaW1wbGVtZW50
ZWQgaW4gWGVuLCBhbmQgZXhwb3J0ZWQgc29tZWhvdyB0byBkb20wLCBtYXliZSB1c2luZwo+ID4g
PiBzeXNjdGw/Cj4gPiA+IAo+ID4gPiBPciBlbHNlIGhhdmluZyBhbiBoeXBlcmNhbGwgdGhhdCBh
bGxvd3MgZG9tMCB0byByZXF1ZXN0IFhlbiB0bwo+ID4gPiBleGVjdXRlCj4gPiA+IE1TUiByZWFk
L3dyaXRlcyBvbiBhIGdpdmVuIHBDUFUuCj4gPiAKPiA+IFRoaXMgd291bGQgbG9vayB0byByZXF1
aXJlIGp1c3QgYSBzbWFsbCBleHRlbnNpb24gdG8KPiA+IFhFTl9SRVNPVVJDRV9PUF9NU1JfUkVB
RC4gUXVlc3Rpb24gaXMgd2hldGhlciB0aGUgTGludXggZHJpdmVyCj4gPiBtYWludGFpbmVycyB3
b3VsZCBhY2NlcHQgYSBjaGFuZ2UgdXNpbmcgdGhpcyBYZW4tc3BlY2lmaWMKPiA+IGFsdGVybmF0
aXZlIGFjY2VzcyBtZWNoYW5pc20gKGluIHdoYXRldmVyIHNoYXBlKS4KPiAKPiBSaWdodCwgdGhl
cmUncyBhbHNvIHRoZSBmYWN0IHRoYXQgYWxsIHBDUFVzIHNob3VsZCBiZSByZXBvcnRlZCBpbiB0
aGUKPiB0aGVybWFsIGRyaXZlciwgd2hpbGUgZG9tMCBtaWdodCBoYXZlIGxlc3MgdkNQVXMgdGhh
biBwQ1BVcyBvbiB0aGUKPiBzeXN0ZW0uCj4gCj4gRG8geW91IHRoaW5rIHlvdSBjYW4gdGFrZSBh
IGxvb2sgaW50byB0aGlzIEZyZWR5PwoKSSB0aGluayBJIGNhbiBidXQgd2lsbCB0YWtlcyBsb25n
LCBzaG9ydCBoaXN0b3J5IEknbSAianVzdCBhIHN5c2FkbWluCmRvaW5nIGEgc2VjdXJpdHkgdXBk
YXRlIiB0aGVuIEknbGwgdHJ5IHRvIGZpbmQgaWYgc29tZSBvbmUgb2YgdGhlIGd1eXMKdGhhdCB3
cm90ZSBsb3cgbGV2ZWwgY29kZSB0byBoZWxwIG1lIHdpdGggdGhpcy4KCj4gSXQgd2lsbCBpbnZv
bHZlIGxvb2tpbmcgaW50byB0aGUgTGludXggZHJpdmVyIGluIG9yZGVyIHRvIG1ha2UgdXNlIG9m
Cj4gYW4gaHlwZXJjYWxsIGluc3RlYWQgb2YgYSByZG1zci4gSSB0aGluayBpdCBzaG91bGQgYmUg
ZmluZSB0byBleHBvc2UKPiB0aGUgQ1BVSUQgbGVhZiB0byBkb20wIGFzIGxvbmcgYXMgcmVhZHMg
YXJlIHBlcmZvcm1lZCBmcm9tIHRoZQo+IGh5cGVyY2FsbCwgaW4gb3JkZXIgdG8gYXNzdXJlIHRo
YXQgTGludXggZ2V0cyBjb25zaXN0ZW50IHZhbHVlcy4KPiAKPiBSb2dlci4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
