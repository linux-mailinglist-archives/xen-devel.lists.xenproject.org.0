Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137EBDDC7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:08:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD61n-0001pc-S2; Wed, 25 Sep 2019 12:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD61m-0001pX-RZ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:04:14 +0000
X-Inumbo-ID: 964ebfe0-df8c-11e9-962f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 964ebfe0-df8c-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 12:04:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B545CAD3E;
 Wed, 25 Sep 2019 12:04:11 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-27-jgross@suse.com>
 <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2def1338-8048-58b3-9c5d-a0baf6f3dcb8@suse.com>
Date: Wed, 25 Sep 2019 14:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 26/47] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMDA6MzMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFNhdCwgMjAxOS0w
OS0xNCBhdCAxMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gTm93IHRoYXQgdmNw
dV9taWdyYXRlX3N0YXJ0KCkgYW5kIHZjcHVfbWlncmF0ZV9maW5pc2goKSBhcmUgdXNlZCBvbmx5
Cj4+IHRvIGVuc3VyZSBhIHZjcHUgaXMgcnVubmluZyBvbiBhIHN1aXRhYmxlIHByb2Nlc3Nvcgo+
Pgo+IElzIHRoaXMgc2VudGVuY2UgbGlrZSB0aGlzIChJIG1lYW4gd2l0aCB0aGF0ICJOb3ciIGF0
IHRoZSBiZWdpbm5pbmcpCj4gYmVjYXVzZSBpdCB3YXMgLS1pbiBwcmV2aW91cyB2ZXJzaW9ucyBv
ZiB0aGUgc2VyaWVzLS0gcmlnaHQgYWZ0ZXIgdGhlCj4gcGF0Y2ggdGhhdCBjaGFuZ2VkIHZjcHVf
Zm9yY2VfcmVzY2hlZHVsZSgpPwo+IAo+IElmIHllcywgdGhlbiB0aGF0IGlzIG5vdCB0aGUgY2Fz
ZSBhbnkgbG9uZ2VyLCBzbyB3ZSBtYXkgd2FudCB0byByZS0KPiBwaHJhc2UuCgpJbmRlZWQuCgo+
IAo+PiB0aGV5IGNhbiBiZQo+PiBzd2l0Y2hlZCB0byBvcGVyYXRlIG9uIHNjaGVkdWxlIHVuaXRz
IGluc3RlYWQgb2YgdmNwdXMuCj4+Cj4+IFdoaWxlIGRvaW5nIHRoYXQgcmVuYW1lIHRoZW0gYWNj
b3JkaW5nbHkgYW5kIG1ha2UgdGhlIF9zdGFydCgpCj4+IHZhcmlhbnQKPj4gc3RhdGljLgo+Pgo+
IFdoYXQgZG9lcyB0aGlzIG1lYW4vcmVmZXIgdG8/Cj4gCj4gV2Fzbid0IHZjcHVfbWlncmF0ZV9z
dGFydCgpIHN0YXRpYyBhbHJlYWR5PwoKV2VpIGNoZWF0ZWQuIEhlIG1vZGlmaWVkIGl0IHdpdGgg
Y29tbWl0IDlmOGQ2MDZiNDM4NDQwOC4gOi0pCgo+IAo+PiBBcyBpdCBpcyBuZWVkZWQgYW55d2F5
IGNhbGwgdmNwdV9zeW5jX2V4ZWNzdGF0ZSgpIGZvciBlYWNoCj4+IHZjcHUgb2YgdGhlIHVuaXQg
d2hlbiBjaGFuZ2luZyBwcm9jZXNzb3JzLgo+Pgo+IEFnYWluLCB3aGF0IGRvIHlvdSBtZWFuIHdp
dGggIkFzIGl0IGlzIG5lZWRlZCBhbnl3YXkiPwoKV2hlbiBtb3ZpbmcgZnJvbSBvbmUgY3B1IHRv
IGFub3RoZXIgb25lIHRoZSBzdGF0ZSBtdXN0IGJlIHNhdmVkIGluCnN0cnVjdCB2Y3B1IChpbiBj
b250cmFzdCB0byBiZWluZyBoZWxkIHBhcnRpYWxseSBpbiByZWdpc3RlcnMgb3Igb24gdGhlCnN0
YWNrIGluIGNhc2Ugb25seSB0aGUgaWRsZSB2Y3B1IHdhcyBzY2hlZHVsZWQgYWZ0ZXJ3YXJkcyBv
biB0aGUgb2xkCmNwdSkuIFRoaXMgaXMgZG9uZSBieSB2Y3B1X3N5bmNfZXhlY3N0YXRlKCkuIFdp
dGhvdXQgdGhlIGV4cGxpY2l0IGNhbGwKaXQgd291bGQgYmUgZG9uZSBlaXRoZXIgd2hlbiB0aGUg
dmNwdSBpcyBiZWluZyBzY2hlZHVsZWQgb24gdGhlIG5ldyBjcHUKb3IgaWYgYW5vdGhlciBub24t
aWRsZSB2Y3B1IGlzIGJlY29taW5nIGFjdGl2ZSBvbiB0aGUgb2xkIGNwdS4KCj4gCj4+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4g
aW5kZXggMGJkOWYwZDI3OC4uNzAyNzFjZGVhMiAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+Pgo+PiAgIC8qCj4+ICAg
ICogSW5pdGlhdGluZyBtaWdyYXRpb24KPj4gICAgKgo+PiAtICogSW4gb3JkZXIgdG8gbWlncmF0
ZSwgd2UgbmVlZCB0aGUgdmNwdSBpbiBxdWVzdGlvbiB0byBoYXZlIHN0b3BwZWQKPj4gKyAqIElu
IG9yZGVyIHRvIG1pZ3JhdGUsIHdlIG5lZWQgdGhlIHVuaXQgaW4gcXVlc3Rpb24gdG8gaGF2ZSBz
dG9wcGVkCj4+ICAgICogcnVubmluZyBhbmQgaGFkIHNjaGVkX3NsZWVwKCkgY2FsbGVkICh0byB0
YWtlIGl0IG9mZiBhbnkKPj4KPiBNaWdodCBiZSBtZSAobm90IGEgbmF0aXZlIHNwZWFrZXIpLCBi
dXQgdGhpcyByZWFkcyB3ZWlyZC4gImFuZCBoYXZlCj4gY2FsbGVkIHNjaGVkX3NsZWVwKCkiIG9y
ICJhbmQgc2NoZWRfc2xlZXAoKSB0byBoYXZlIGJlZW4gY2FsbGVkIiB3b3VsZAo+IHNvdW5kIGJl
dHRlci4KPiAKPiBJdCdzLCBvZiBjb3Vyc2UsIG5vdCB5b3VyIGZhdWx0LCBidXQgSSBndWVzcyB3
ZSBjYW4gY29uc2lkZXIgYWRqdXN0aW5nCj4gaXQsIHNpbmNlIHdlIGFyZSB0b3VjaGluZyB0aGUg
bGluZSBhYm92ZSBpdC4KPiAKPiBPciBtYXliZSB5b3UgYWxzbyB3YW50IHRvIHF1ZXVlIGl0IHVw
IGZvciB0aGUgY2xlYW51cCBzZXJpZXM/CgpObywgSSdsbCBjaGFuZ2UgaXQuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
