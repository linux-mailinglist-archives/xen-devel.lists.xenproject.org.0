Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B66B8CD1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:28:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEDQ-0002sU-3k; Fri, 20 Sep 2019 08:24:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBEDO-0002sP-RJ
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:24:30 +0000
X-Inumbo-ID: 0f7ff80e-db80-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f7ff80e-db80-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 08:24:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B55BDAFCE;
 Fri, 20 Sep 2019 08:24:26 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
 <03e3bb4f-e6da-b5a5-d337-4e91215dc2fe@suse.com>
 <f2532730-7528-9819-1653-83f901acc754@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be92ed8d-f49e-8455-2316-ec28453c236d@suse.com>
Date: Fri, 20 Sep 2019 10:24:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f2532730-7528-9819-1653-83f901acc754@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxMDowNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTkuMDkuMjAxOSAxNjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZ1cnRoZXJtb3JlIHdoaWxl
IHlvdSBub3cgcmVzdHJpY3QgdGhlIGNoZWNrIHRvIGxpbmVhciBhZGRyZXNzCj4+IGJhc2VkIGFj
Y2Vzc2VzLCBvdGhlciB0aGFuIHRoZSBkZXNjcmlwdGlvbiBzYXlzIChvciBhdCBsZWFzdAo+PiBp
bXBsaWVzKSB5b3UgZG8gbm90IHJlc3RyaWN0IGl0IHRvIHJlYWQgYW5kIGV4ZWMgYWNjZXNzZXMu
IEl0J3MKPj4gbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhhdCdzIGludGVudGlvbmFsLCB5ZXQg
aXQgYWZmZWN0cyB3aGljaAo+PiBodm1fY29weV8qX2xpbmVhcigpIGNhbGxlcnMgbmVlZCBhdWRp
dGluZy4KPiAKPiBUaGUgcGZlYyB2YXIgaXMgY2hlY2tlZCBpbiBodm1fbW9uaXRvcl9jaGVja19w
Mm0oKS4gSWYgeW91IHRoaW5rIGl0IGlzIAo+IG5lY2Vzc2FyeSBJIGNhbiBhZGQgb25lIG1vcmUg
Y2hlY2sgaGVyZSBmb3IgKHBmZWMgJiAoUEZFQ19pbnNuX2ZldGNoIHwgCj4gUEZFQ193cml0ZV9h
Y2Nlc3MpKS4KCmh2bV9tb25pdG9yX2NoZWNrX3AybSgpIGdldHMgY2FsbGVkIGZyb20gdHdvIHBs
YWNlcywgc28gYSBjaGVjawp0aGVyZSB3b24ndCBoZWxwIChhZmFpY3QpLiBUaGUgcXVlc3Rpb24g
d2hldGhlciB0byBwdXQgYW4KYWRkaXRpb25hbCBjaGVjayBoZXJlIGRlcGVuZHMgb24gd2hldGhl
ciwgYXMgdGhlIGRlc2NyaXB0aW9uCnNheXMsIHlvdSByZWFsbHkgb25seSB3YW50IHRvIGhhbmRs
ZSByZWFkL2V4ZWMgYWNjZXNzZXMgaGVyZSwKb3Igd2hldGhlciB5b3UgYWxzbyB3YW50IHRvIGNv
dmVyIHdyaXRlIG9uZXMgKGluIHdoaWNoIGNhc2UgdGhlCmRlc2NyaXB0aW9uIHNob3VsZCBiZSBh
ZGp1c3RlZCBzbyB0aGF0IGl0J3Mgbm90IG1pc2xlYWRpbmcpLgoKPj4gRmluYWxseSwgd2hhdCBh
Ym91dCAtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgcmVtYWluaW5nIHNldAo+PiBhZnRlciBo
dm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoKSwgYmVjYXVzZSBodm1fbW9uaXRvcl9jaGVja19wMm0o
KQo+PiAodGhlIG9ubHkgcGxhY2Ugd2hlcmUgdGhlIGZsYWcgd291bGQgZ2V0IGNsZWFyZWQpIHdh
cyBuZXZlciBoaXQKPj4gaW4gdGhlIHByb2Nlc3M/Cj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlz
IG91dCwgaW5kZWVkIGl0J3MgYSBwcm9ibGVtIGhlcmUuIEEgc29sdXRpb24gY2FuIAo+IGJlIHRv
IG1vdmUgc2VuZF9ldmVudCA9IGZhbHNlOyBhZnRlciBodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQo
KSBpcyAKPiBmaW5pc2hlZC4gQW5kIHN0YXRlIGluIHRoZSBjb21tZW50IHRoYXQgdGhlIHVzZXIg
aXMgaW4gY2hhcmdlIG9mIAo+IGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcgdGhlIGZsYWcuCj4gT3Ig
anVzdCBoYXZlIGl0IGluIGJvdGggcGxhY2VzLgoKRm9yIHRoaXMgYXNwZWN0IGFsb25lIEkgdGhp
bmsgeW91IHdhbnQgaXQgaW4gYm90aCBwbGFjZXMsIGJ1dCAuLi4KCj4+IEFuZCB3aGF0IGFib3V0
IGFuIGluc3RydWN0aW9uIGFjY2Vzc2luZyB0d28gKG9yCj4+IG1vcmUpIGRpc3RpbmN0IGFkZHJl
c3Nlcz8gVGhlIGZsYWcgd291bGQgYmUgY2xlYXIgYWZ0ZXIgdGhlIGZpcnN0Cj4+IG9uZSB3YXMg
Y2hlY2tlZCBhZmFpY3QuCj4gCj4gVGhlcmUgaXMgbm8gcHJvYmxlbSBoZXJlIGJlY2F1c2UgZW11
bGF0aW9uIHdpbGwgc3RvcCBhZnRlciB0aGUgZmlyc3QgYmFkIAo+IGFjY2VzcyBzbyB0aGVyZSBp
cyBubyBuZWVkIHRvIGNvbnRpbnVlLgoKLi4uIGZvciB0aGlzIG1vdmluZyBpdCBtYXkgaW5kZWVk
IGJlIG5lY2Vzc2FyeS4gSSBoYXZlIHRvIGFkbWl0CnRoYXQgSSBkb24ndCBmb2xsb3cgeW91ciBy
ZXBseSBoZXJlOiBUaGUgZmxhZyB3aWxsIGFsc28gYmUgY2xlYXIKYWZ0ZXIgdGhlIGZpcnN0IGdv
b2QgYWNjZXNzIChhZmFpY3QpLCBhbmQgaGVuY2UgZnVydGhlciBhY2Nlc3NlcwpieSB0aGUgc2Ft
ZSBpbnNuIHdvbid0IG1ha2UgaXQgaW50byBodm1fbW9uaXRvcl9jaGVja19wMm0oKSBhdCBhbGwu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
