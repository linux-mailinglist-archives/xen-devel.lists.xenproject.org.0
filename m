Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58ECF3EB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 09:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHjwM-0005rk-LQ; Tue, 08 Oct 2019 07:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHjwL-0005rd-9K
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 07:29:49 +0000
X-Inumbo-ID: 612437c6-e99d-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 612437c6-e99d-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 07:29:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85784B033;
 Tue,  8 Oct 2019 07:29:35 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
 <5b1bad1b-f381-869d-95a8-036a236a2b31@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9ed8408-cd85-6ee9-44a4-2c2dda396f66@suse.com>
Date: Tue, 8 Oct 2019 09:29:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5b1bad1b-f381-869d-95a8-036a236a2b31@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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
Cc: Lars Kurth <lars.kurth@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org,
 committers@xenproject.org, mirageos-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMjAxOSAxODoxMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA5LzI3LzE5IDEw
OjE0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMDkuMjAxOSAyMTozOSwgTGFycyBL
dXJ0aCB3cm90ZToKPj4+ICsjIyMgVmVyYm9zZSB2cy4gdGVyc2UKPj4+ICtEdWUgdG8gdGhlIHRp
bWUgaXQgdGFrZXMgdG8gcmV2aWV3IGFuZCBjb21wb3NlIGNvZGUgcmV2aWV3ZXIsIHJldmlld2Vy
cyBvZnRlbiBhZG9wdCBhCj4+PiArdGVyc2Ugc3R5bGUuIEl0IGlzIG5vdCB1bnVzdWFsIHRvIHNl
ZSByZXZpZXcgY29tbWVudHMgc3VjaCBhcwo+Pj4gKz4gdHlwbwo+Pj4gKz4gcy9yZXNpb25zL3Jl
Z2lvbnMvCj4+PiArPiBjb2Rpbmcgc3R5bGUKPj4+ICs+IGNvZGluZyBzdHlsZTogYnJhY2tldHMg
bm90IG5lZWRlZAo+Pj4gK2V0Yy4KPj4+ICsKPj4+ICtUZXJzZSBjb2RlIHJldmlldyBzdHlsZSBo
YXMgaXRzIHBsYWNlIGFuZCBjYW4gYmUgcHJvZHVjdGl2ZSBmb3IgYm90aCB0aGUgcmV2aWV3ZXIg
YW5kCj4+PiArdGhlIGF1dGhvci4gSG93ZXZlciwgb3ZlcnVzZSBjYW4gY29tZSBhY3Jvc3MgYXMg
dW5mcmllbmRseSwgbGFja2luZyBlbXBhdGh5IGFuZAo+Pj4gK2NhbiB0aHVzIGNyZWF0ZSBhIG5l
Z2F0aXZlIGltcHJlc3Npb24gd2l0aCB0aGUgYXV0aG9yIG9mIGEgcGF0Y2guIFRoaXMgaXMgaW4g
cGFydGljdWxhcgo+Pj4gK3RydWUsIHdoZW4geW91IGRvIG5vdCBrbm93IHRoZSBhdXRob3Igb3Ig
dGhlIGF1dGhvciBpcyBhIG5ld2NvbWVyLiBUZXJzZQo+Pj4gK2NvbW11bmljYXRpb24gc3R5bGVz
IGNhbiBhbHNvIGJlIHBlcmNlaXZlZCBhcyBydWRlIGluIHNvbWUgY3VsdHVyZXMuCj4+Cj4+IEFu
ZCBhbm90aGVyIHJlbWFyayBoZXJlOiBOb3QgYmVpbmcgdGVyc2UgaW4gc2l0dWF0aW9ucyBsaWtl
IHRoZSBvbmVzCj4+IGVudW1lcmF0ZWQgYXMgZXhhbXBsZXMgYWJvdmUgaXMgYSBkb3VibGUgd2Fz
dGUgb2YgdGhlIHJldmlld2VyJ3MgdGltZToKPiAKPiBGV0lXIEkgZG9uJ3QgdGhpbmsgdGhpcyBk
b2N1bWVudCBwcm9oaWJpdHMgdGVyc2UgcmVwbGllcy4gIEl0IHBvaW50cyBvdXQKPiB0aGF0IHRo
ZXkgY2FuIGNvbWUgYWNyb3NzIGFzIHVuZnJpZW5kbHksIGFuZCB0aGV5IGNhbiBiZSBwZXJjZWl2
ZWQgYXMKPiBydWRlIGluIHNvbWUgY3VsdHVyZXM7IGJvdGggb2Ygd2hpY2ggYXJlIHRydWUuICBJ
dCB0aGVuICpyZWNvbW1lbmRzKgo+IHRoYXQgcmV2aWV3ZXJzIGNvbXBlbnNhdGUgZm9yIGl0IGlu
IGEgcmV2aWV3IG9wZW5pbmcgKGkuZS4sIG9uY2UgcGVyCj4gcGF0Y2ggLyBzZXJpZXMpIHdoaWNo
IGV4cHJlc3NlcyBhcHByZWNpYXRpb247IHdoaWNoIGlzIGJvdGggaGVscGZ1bCBhbmQKPiByZWxh
dGl2ZWx5IGxvdyBjb3N0Lgo+IAo+IFRoZSBwb2ludCBvZiB0aGUgb3BlbmluZyBpcyB0byBzZXQg
dGhlIHRvbmUuICBJZiB5b3Ugc3RhcnQgb3V0IHdpdGgKPiBzb21ldGhpbmcgcG9zaXRpdmUsIGFu
ZCBlbmRzIHdpdGggInRoYW5rcyIsIHRoZW4gYSBsb25nIHNlcmllcyBvZiB0ZXJzZQo+IGNvbW1l
bnRzIGlzIG1vcmUgbGlrZWx5IHRvIGJlIHJlYWQgYXMgc2ltcGx5IGJlaW5nIGVmZmljaWVudC4g
IElmIHRoZQo+IGVudGlyZSByZXZpZXcgY29uc2lzdHMgb2Ygbm90aGluZyBidXQgY3JpdGljaXNt
IG9yIHRlcnNlIGNvbW1lbnRzLCBpdCdzCj4gbW9yZSBsaWtlbHkgdG8gYmUgcmVhZCBhcyBhbm5v
eWFuY2Ugb24gdGhlIHBhcnQgb2YgdGhlIHJldmlld2VyLgo+IAo+PiBUaGV5IHNob3VsZG4ndCBl
dmVuIG5lZWQgdG8gbWFrZSBzdWNoIGNvbW1lbnRzLCBlc3BlY2lhbGx5IG5vdCBtYW55Cj4+IHRp
bWVzIGZvciBhIHNpbmdsZSBwYXRjaCAoc2VlIHlvdXIgbWVudGlvbiBvZiAib3ZlcnVzZSIpLiAg
SSByZWFsaXplCj4+IHdlIHN0aWxsIGhhdmUgbm8gYXV0b21hdGVkIG1lY2hhbmlzbSB0byBjaGVj
ayBzdHlsZSBhc3BlY3RzLCBidXQKPj4gYW55Ym9keSBjYW4gZWFzaWx5IGxvb2sgb3ZlciB0aGVp
ciBwYXRjaGVzIGJlZm9yZSBzdWJtaXR0aW5nIHRoZW0uCj4+IEFuZCBmb3IgYW4gb2NjYXNpb25h
bCBpc3N1ZSBJIHRoaW5rIGEgdGVyc2UgcmVwbHkgaXMgcXVpdGUgcmVhc29uYWJsZQo+PiB0byBo
YXZlLgo+IAo+IFRoaXMgc29ydCBvZiBzb3VuZHMgbGlrZSB5b3UgYXJlICppbnRlbmRpbmcqIHRv
IGV4cHJlc3MgYW5ub3lhbmNlPwoKSW1wbGljaXRseSBieSBiZWluZyB0ZXJzZSwgeWVzLiBJJ3Zl
IGJlZW4gdHJ5aW5nIHRvIGF2b2lkIGV4cHJlc3NpbmcKc3VjaCBleHBsaWNpdGx5LCBidXQgSSBo
YXZlIHRvIGFkbWl0IHRoZXJlIGFyZSAobHVja2lseSBvbmx5IGZldykKY2FzZXMgd2hlcmUgSSBm
aW5kIGl0IHByZXR0eSBoYXJkIHRvIHN0YXkgYXdheS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
