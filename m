Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A551C4E6D6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 13:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heHRK-0008Cr-4F; Fri, 21 Jun 2019 11:10:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUw3=UU=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1heHRI-0008Cm-Ex
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 11:10:40 +0000
X-Inumbo-ID: 333356ea-9415-11e9-b2b0-77c77dde02c8
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 333356ea-9415-11e9-b2b0-77c77dde02c8;
 Fri, 21 Jun 2019 11:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 86BF33082137;
 Fri, 21 Jun 2019 11:10:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-66.ams2.redhat.com [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACDE661101;
 Fri, 21 Jun 2019 11:10:35 +0000 (UTC)
Date: Fri, 21 Jun 2019 12:10:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190621111032.GJ11706@redhat.com>
References: <20190621105441.3025-1-anthony.perard@citrix.com>
 <20190621105441.3025-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621105441.3025-3-anthony.perard@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 21 Jun 2019 11:10:37 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: Import other xen/io/*.h
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6NTQ6NDFBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQSBYZW4gcHVibGljIGhlYWRlciBoYXZlIGJlZW4gaW1wb3J0ZWQgaW50byBRRU1V
IChieQo+IGY2NWVhZGI2MzkgInhlbjogaW1wb3J0IHJpbmcuaCBmcm9tIHhlbiIpLCBidXQgdGhl
cmUgYXJlIG90aGVyIGhlYWRlcgo+IHRoYXQgZGVwZW5kcyBvbiByaW5nLmggd2hpY2ggY29tZSBm
cm9tIHRoZSBzeXN0ZW0gd2hlbiBidWlsZGluZyBRRU1VLgo+IAo+IFRoaXMgcGF0Y2ggcmVzb2x2
ZXMgdGhlIGlzc3VlIG9mIGhhdmluZyBoZWFkZXJzIGZyb20gdGhlIHN5c3RlbQo+IGltcG9ydGlu
ZyBhIGRpZmZlcmVudCBjb3BpZSBvZiByaW5nLmguCj4gCj4gVGhpcyBwYXRjaCBpcyBwcm9tcHQg
YnkgdGhlIGJ1aWxkIGlzc3VlIGRlc2NyaWJlZCBpbiB0aGUgcHJldmlvdXMKPiBwYXRjaDogJ1Jl
dmVydCB4ZW4vaW8vcmluZy5oIG9mICJDbGVhbiB1cCBhIGZldyBoZWFkZXIgZ3VhcmQgc3ltYm9s
cyInCj4gCj4gcmluZy5oIGFuZCB0aGUgbmV3IGltcG9ydGVkIGhlYWRlcnMgYXJlIG1vdmVkIHRv
Cj4gImluY2x1ZGUvaHcveGVuL2ludGVyZmFjZSIgYXMgdGhvc2UgZGVzY3JpYmUgaW50ZXJmYWNl
cyB3aXRoIGEgZ3Vlc3QuCj4gCj4gVGhlIGltcG9ydGVkIGhlYWRlcnMgYXJlIGNsZWFuZWQgdXAg
YSBiaXQgd2hpbGUgaW1wb3J0aW5nIHRoZW06IHNvbWUKPiBwYXJ0IG9mIHRoZSBmaWxlIHRoYXQg
UUVNVSBkb2Vzbid0IHVzZSBhcmUgcmVtb3ZlZCAoZGVzY3JpcHRpb24KPiBvZiBob3cgdG8gbWFr
ZSBoeXBlcmNhbGwgaW4gZ3JhbnRfdGFibGUuaCBoYXZlIGJlZW4gcmVtb3ZlZCkuCj4gCj4gT3Ro
ZXIgY2xlYW51cDoKPiAtIHhlbi1tYXBjYWNoZS5jIGFuZCB4ZW4tbGVnYWN5LWJhY2tlbmQuYyBk
b24ndCBuZWVkIGdyYW50X3RhYmxlLmguCj4gLSB4ZW5mYi5jIGRvZXNuJ3QgbmVlZCBldmVudF9j
aGFubmVsLmguCgpQZXJzb25hbGx5IEkgd291bGQgaGF2ZSBqdXN0IGtlcHQgdGhlIGhlYWRlcnMg
ImFzIGlzIiBhbmQgbm90CmNoYW5nZWQgYW55dGhpbmcuIEFzIGxvbmcgYXMgdGhlIHVudXNlZCBw
aWVjZXMgZG9uJ3QgYWN0aXZlbHkKY2F1c2UgcHJvYmxlbXMgZm9yIHRoZSBRRU1VIGJ1aWxkLCBy
ZW1vdmluZyB0aGVtIGp1c3QgbWFrZXMKbGlmZSBtb3JlIGNvbXBsZXggaWYgeW91IHBlcmlvZGlj
YWxseSByZWZyZXNoIHRoZSBoZWFkZXJzIHdpdGgKbmV3IGNvcGllcyBmcm9tIGZ1dHVyZSBYZW4g
cmVsZWFzZXMuCgpOb3QgYSBzaG93IHN0b3BwZXIgdGhvdWdoIC0geW91ciBjaG9pY2UgYXMgbWFp
bnRhaW5lciwgc28KClJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0ga2Vl
cCBvcmlnaW5hbCBoZWFkZXIgZ3VhcmQKPiAgICAgLSBzcXVhc2hlZCBvZiAieGVuOiBGaXggYnVp
bGQgd2l0aCBwdWJsaWMgaGVhZGVycyIgYW5kICJ4ZW46IEltcG9ydAo+ICAgICAgIG90aGVyIHhl
bi9pby8qLmgiIGFzIHRoaXMgcGF0Y2ggaXNuJ3QgdGhlIG9uZSB0aGF0IGZpeCB0aGUgYnVpbGQg
aXNzdWUKPiAgICAgICBhbnltb3JlLgoKPiAKPiAgaHcvOXBmcy94ZW4tOXBmcy5oICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDQgKy0KPiAgaHcvYmxvY2sveGVuX2Jsa2lmLmggICAgICAgICAg
ICAgICAgICAgICB8ICAgIDUgKy0KPiAgaHcvY2hhci94ZW5fY29uc29sZS5jICAgICAgICAgICAg
ICAgICAgICB8ICAgIDIgKy0KPiAgaHcvZGlzcGxheS94ZW5mYi5jICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDcgKy0KPiAgaHcvbmV0L3hlbl9uaWMuYyAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDIgKy0KPiAgaHcvdXNiL3hlbi11c2IuYyAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDMgKy0KPiAgaHcveGVuL3hlbi1sZWdhY3ktYmFja2VuZC5jICAgICAgICAgICAgICB8ICAg
IDIgLQo+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvZ3JhbnRfdGFibGUuaCAgIHwgICAzNiAr
Cj4gIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9ibGtpZi5oICAgICAgfCAgNzEyICsrKysr
KysrKysrKysrKwo+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vY29uc29sZS5oICAgIHwg
ICA0NiArCj4gIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9mYmlmLmggICAgICAgfCAgMTU2
ICsrKysKPiAgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2tiZGlmLmggICAgICB8ICA1NjYg
KysrKysrKysrKysrCj4gIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9uZXRpZi5oICAgICAg
fCAxMDEwICsrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNl
L2lvL3Byb3RvY29scy5oICB8ICAgNDIgKwo+ICBpbmNsdWRlL2h3L3hlbi97ID0+IGludGVyZmFj
ZX0vaW8vcmluZy5oIHwgICAgMAo+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vdXNiaWYu
aCAgICAgIHwgIDI1NCArKysrKysKPiAgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3hlbmJ1
cy5oICAgICB8ICAgNzAgKysKPiAgaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oICAgICAgICAg
ICAgICB8ICAgIDIgKy0KPiAgMTggZmlsZXMgY2hhbmdlZCwgMjkwMyBpbnNlcnRpb25zKCspLCAx
NiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVy
ZmFjZS9ncmFudF90YWJsZS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9p
bnRlcmZhY2UvaW8vYmxraWYuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4v
aW50ZXJmYWNlL2lvL2NvbnNvbGUuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94
ZW4vaW50ZXJmYWNlL2lvL2ZiaWYuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94
ZW4vaW50ZXJmYWNlL2lvL2tiZGlmLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcv
eGVuL2ludGVyZmFjZS9pby9uZXRpZi5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3
L3hlbi9pbnRlcmZhY2UvaW8vcHJvdG9jb2xzLmgKPiAgcmVuYW1lIGluY2x1ZGUvaHcveGVuL3sg
PT4gaW50ZXJmYWNlfS9pby9yaW5nLmggKDEwMCUpCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vdXNiaWYuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3hlbmJ1cy5oCgoKCgpSZWdhcmRzLApEYW5pZWwKLS0g
Cnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNrci5j
b20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8t
ICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwKfDogaHR0cHM6Ly9l
bnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJl
cnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
