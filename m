Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2685099
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOPK-0002pG-Tt; Wed, 07 Aug 2019 16:03:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvOPI-0002p4-OV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:03:20 +0000
X-Inumbo-ID: df720dcf-b92c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df720dcf-b92c-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:03:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 836FBAF41;
 Wed,  7 Aug 2019 16:03:18 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
 <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
 <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
 <d2ff9dcf-233b-ac02-1034-310f97e2c215@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e248c4b-4c7d-6450-b5fe-f6d40379ebab@suse.com>
Date: Wed, 7 Aug 2019 18:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2ff9dcf-233b-ac02-1034-310f97e2c215@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad RzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNzo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wOC8yMDE5
IDE2OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNzowMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA3LzA4LzIwMTkgMTU6MzAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA3LjA4LjIwMTkgMTU6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IEZ1
cnRoZXJtb3JlLCBpZiB0aGVyZSBpcyB0aGlzIHByb2JsZW0gZm9yIGV2ZW50IGNoYW5uZWxzLCB0
aGVuCj4+Pj4+IHRoZXJlIGlzCj4+Pj4+IGFsbW9zdCBjZXJ0YWlubHkgYSByZWxhdGVkIHByb2Js
ZW0gZm9yIGdyYW50IHRhYmxlcy4KPj4+Pj4KPj4+Pj4gVGhlIGNvbnRyb2wgaW4gWGVuIHNob3Vs
ZCBiZSBleHByZXNzZWQgaW4gYSBwb3NpdGl2ZSBmb3JtLCBvciB0aGUKPj4+Pj4gbG9naWMKPj4+
Pj4gd2lsbCBiZWNvbWUgYSB0YW5nbGUuwqAgSXQgc2hvdWxkIGJlIGEgYml0IHBlcm1pdHRpbmcg
dGhlIHVzZSBvZiB0aGUKPj4+Pj4gRklGTwo+Pj4+PiBBQkksIHJhdGhlciB0aGFuIGEgYml0IHNh
eWluZyAib2ggYWN0dWFsbHksIHlvdSBjYW4ndCB1c2UgdGhhdCIuCj4+Pj4+Cj4+Pj4+IFRoYXQg
c2FpZCwgaXQgbWlnaHQgYmUgZWFzaWVyIHRvIGRlY2xhcmUgRklGTyB0byBiZSAiZXZlbnQgY2hh
bm5lbAo+Pj4+PiB2MiIsCj4+Pj4+IGFuZCBzcGVjaWZ5IG1heF97Z3JhbnQsZXZudGNobn1fdmVy
IGluc3RlYWQuCj4+Pj4KPj4+PiBJJ20gbm90IHN1cmUgYXNzdW1pbmcgbGluZWFyIChvciBhY3R1
YWxseSBhbnkpIG9yZGVyaW5nIGJldHdlZW4KPj4+PiB2YXJpYW50cyBpcyBhIGdvb2QgdGhpbmcu
IFllcywgcmlnaHQgbm93IHdlIG9ubHkgaGF2ZSBnbnR0YWIKPj4+PiB2MSBhbmQgdjIgYW5kIGV2
dGNobiAybCBhbmQgZmlmbywgd2hpY2ggY291bGQgYmUgY29uc2lkZXJlZCB2MQo+Pj4+IGFuZCB2
MiBhcyB5b3Ugc3VnZ2VzdC4gSG93ZXZlciwgYXNzdW1pbmcgYSAzcmQgdmFyaWFudCBzdXJmYWNl
cywKPj4+PiB3aHkgd291bGQgaXQgYmUgdGhhdCBvbmUgaGFzIHRvIGV4cG9zZSB2MiBqdXN0IHRv
IG1ha2UgdjMKPj4+PiB1c2FibGU/IEluIHBhcnRpY3VsYXIgZ250dGFiIHYyIGhhcyB2YXJpb3Vz
IGlzc3VlcyAod2hpY2ggaXMgd2h5Cj4+Pj4geW91IGludHJvZHVjZWQgYSB3YXkgdG8gZGlzYWJs
ZSBpdHMgdXNlIGluIHRoZSBmaXJzdCBwbGFjZSksIHlldAo+Pj4+IEknZCBob3BlIHdlJ2QgZW5k
IHVwIHdpdGggYSBsZXNzIHF1aXJreSB2MyBpZiBvbmUgZXZlciBiZWNvbWVzCj4+Pj4gbmVjZXNz
YXJ5LiBBbmQgaW4gdHVybiBJJ2QgaG9wZSB3ZSBjb3VsZCBoaWRlIHYyIGZyb20gYW55IHYzCj4+
Pj4gdXNlcnMuCj4+Pj4KPj4+PiBJT1cgSSB0aGluayBhIGJpdG1hcCB0byBwZXJtaXQgdXNlIG9m
ICJhZHZhbmNlZCIgdmVyc2lvbnMgaXMKPj4+PiBtb3JlIGZ1dHVyZSBwcm9vZi4gKEFzIGEgc2lk
ZSBub3RlLCBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8KPj4+PiBpbnRyb2R1Y2UgYSBkaXNhYmxl
IGZvciB0aGUgcmVzcGVjdGl2ZSB2MSBpbnRlcmZhY2VzLikKPj4+Cj4+PiBXZSBhYnNvbHV0ZWx5
IGRvIHdhbnQgYSB3YXkgdG8gdHVybiBldmVyeXRoaW5nIG9mZi4KPj4+Cj4+PiBUaGUgaW5hYmls
aXR5IHRvIHR1cm4gdGhlIFhlbiBleHRlbnNpb25zIG9mZiBmb3IgSFZNIGd1ZXN0cyAoZXZlbiBp
Zgo+Pj4gb25seSBmb3IgZGVidWdnaW5nIHB1cnBvc2VzKSBpcyBhIHNldmVyZWx5IHNob3J0IHNp
Z2h0ZWQgZGVjaXNpb24uCj4+Cj4+IEZvciBIVk0gcGVyaGFwcywgYnV0IG5vdCBmb3IgUFYuCj4g
Cj4gUmlnaHQuLi4KPiAKPiBJJ20gY29uZnVzZWQgYXMgdG8gd2hhdCBpbiBteSBzZW50ZW5jZSBp
cyBpbiBhbnkgd2F5IHVuY2xlYXIuCgpJJ20gc29ycnksIEkgbXVzdCBoYXZlIGJlZW4gY29tcGxl
dGVseSBibGluZCB0byB0aGUgIkhWTSIgaW4Kd2hhdCB5b3UndmUgc2FpZC4KCj4+PiBJdCBpcyBh
bHNvIGEgZmVhdHVyZSB3aGljaCBoYXMgYmVlbiByZXF1ZXN0ZWQgcmVwZWF0ZWRseSBieSB1c2Vy
cyBpbiB0aGUKPj4+IHBhc3QsIGFuZCBJIGFtIHZlcnkgZGVsaWJlcmF0ZWx5IGJ1aWxkaW5nIGEg
d2F5IHRvIGRvIHRoaXMgaW50byB0aGUKPj4+IENQVUlEIHdvcmsuCj4+Pgo+Pj4gSG93ZXZlciwg
aXQgaXMgYW4gdW5yZWFzb25hYmxlIHJlcXVlc3QgdG8gYnVuZGxlIGludG8gdGhpcyBidWdmaXgs
IGhlbmNlCj4+PiB3aHkgSSBkaWRuJ3Qgc3VnZ2VzdCBpdC4KPj4KPj4gVGhlcmUncyBubyBidWcg
Zml4IGhlcmUsIGFzIHRoZXJlJ3Mgbm8gYnVnIChpbiBYZW4pLgo+IAo+ID/CoCBJIGRpZG4ndCBz
YXkgaXQgd2FzIGEgYnVnIGluIFhlbiwgYnV0IHRoZSBjaGFuZ2UgaXMgc3BlY2lmaWNhbGx5IHRv
Cj4gZml4IGEgYnVnLgoKV2hhdGV2ZXIgd2UgZG8gaW4gWGVuLCBpdCdsbCBvbmx5IGFsbG93IHRv
IHdvcmsgYXJvdW5kIHRoYXQgaXNzdWUuCkFuIGFjdHVhbCBmaXggYmVsb25ncyBpbiB0aGUga2Vy
bmVsKHMpLiBGb3IgdGhpcyByZWFzb24gSSBzdXBwb3NlCndoYXQgd2UncmUgdGFsa2luZyBhYm91
dCBoZXJlIGlzIGEgZmVhdHVyZSAoZnJvbSBYZW4ncyBwb3YpLCBub3QgYQpidWcgZml4LiBBbmQg
aXQgYmVpbmcgYSBmZWF0dXJlLCBpdCBzaG91bGQgcHJlZmVyYWJseSBiZSBjb2RlZCBpbgphIHdh
eSB0aGF0J3MgdXNhYmxlIGFsc28gZ29pbmcgZm9yd2FyZC4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
