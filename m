Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB41126092
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:11:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtgV-0003uP-L7; Thu, 19 Dec 2019 11:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtgU-0003uI-Mg
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:09:34 +0000
X-Inumbo-ID: e5a761cc-224f-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5a761cc-224f-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 11:08:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B006B15F;
 Thu, 19 Dec 2019 11:08:33 +0000 (UTC)
To: Lars Kurth <lars.kurth.xen@gmail.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
 <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
 <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64e30946-8c36-3728-b894-441c0bf6c970@suse.com>
Date: Thu, 19 Dec 2019 12:09:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxMTowMywgTGFycyBLdXJ0aCB3cm90ZToKPiAKPiAKPj4gT24gMTkgRGVj
IDIwMTksIGF0IDA5OjU2LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAxOC4xMi4yMDE5IDE4OjA5LCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4KPj4+Cj4+PiDv
u79PbiAxOC8xMi8yMDE5LCAxNDoyOSwgIkp1bGllbiBHcmFsbCIgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToKPj4+Cj4+PiAgICBIaSBMYXJzLAo+Pj4KPj4+ICAgIE9uIDEyLzEyLzIwMTkgMjE6MTQs
IExhcnMgS3VydGggd3JvdGU6Cj4+Pj4gKyMjIyBXb3JrZmxvdyBmcm9tIGFuIEF1dGhvcidzIFBl
cnNwZWN0aXZlCj4+Pj4gKwo+Pj4+ICtXaGVuIGNvZGUgYXV0aG9ycyByZWNlaXZlIGZlZWRiYWNr
IG9uIHRoZWlyIHBhdGNoZXMsIHRoZXkgdHlwaWNhbGx5IGZpcnN0IHRyeQo+Pj4+ICt0byBjbGFy
aWZ5IGZlZWRiYWNrIHRoZXkgZG8gbm90IHVuZGVyc3RhbmQuIEZvciBzbWFsbGVyIHBhdGNoZXMg
b3IgcGF0Y2ggc2VyaWVzCj4+Pj4gK2l0IG1ha2VzIHNlbnNlIHRvIHdhaXQgdW50aWwgcmVjZWl2
aW5nIGZlZWRiYWNrIG9uIHRoZSBlbnRpcmUgc2VyaWVzIGJlZm9yZQo+Pj4+ICtzZW5kaW5nIG91
dCBhIG5ldyB2ZXJzaW9uIGFkZHJlc3NpbmcgdGhlIGNoYW5nZXMuIEZvciBsYXJnZXIgc2VyaWVz
LCBpdCBtYXkKPj4+PiArbWFrZSBzZW5zZSB0byBzZW5kIG91dCBhIG5ldyByZXZpc2lvbiBlYXJs
aWVyLgo+Pj4+ICsKPj4+PiArQXMgYSByZXZpZXdlciwgeW91IG5lZWQgc29tZSBzeXN0ZW0gdGhh
dCBoZTtwcyBlbnN1cmUgdGhhdCB5b3UgYWRkcmVzcyBhbGwKPj4+Cj4+PiAgICBKdXN0IGEgc21h
bGwgdHlwbzogSSB0aGluayB5b3UgbWVhbnQgImhlbHBzIiByYXRoZXIgdGhhbiAiaGU7cHMiLgo+
Pj4KPj4+ICAgIENoZWVycywKPj4+Cj4+PiBUaGFuayB5b3U6IGZpeGVkIGluIG15IHdvcmtpbmcg
Y29weS4KPj4+Cj4+PiBPbmUgdGhpbmcgd2hpY2ggb2NjdXJyZWQgdG8gbWUgZm9yIHJldmlld3Mg
bGlrZSB0aGVzZSwgd2hlcmUgdGhlcmUgaXMgbm8gQUNLJ3Mgb3IgUmV2aWV3ZWQtYnkncyBpcyB0
aGF0IEkgZG9uJ3QgYWN0dWFsbHkga25vdyB3aGV0aGVyIHlvdSBhcyByZXZpZXdlciBpcyBvdGhl
cndpc2UgaGFwcHkgd2l0aCB0aGUgcmVtYWluZGVyIG9mIHRoZSBwYXRjaC4KPj4+IE5vcm1hbGx5
IHRoZSBBQ0tlZC1ieSBvciBSZXZpZXdlZC1ieSBpcyBhIHNpZ25hbCB0aGF0IGl0IGlzCj4+Pgo+
Pj4gSSBhbSBhc3N1bWluZyBpdCBpcywgYnV0IEkgdGhpbmsgaXQgbWF5IGJlIHdvcnRod2hpbGUg
cG9pbnRpbmcgdGhpcyBvdXQgaW4gdGhlIGRvY3VtZW50LCB0aGF0IHVubGVzcyBzdGF0ZWQgb3Ro
ZXJ3aXNlLCB0aGUgcmV2aWV3ZXIgaXMgaGFwcHkgd2l0aCB0aGUgcGF0Y2gKPj4KPj4gSSBkb24n
dCB0aGluayB0aGVyZSBzaG91bGQgZXZlciBiZSBzdWNoIGFuIGltcGxpY2F0aW9uLiBBZmFpYyB0
aGVyZQo+PiBhcmUgcGF0Y2hlcyBJIGNvbW1lbnQgdXBvbiwgYnV0IHRoYXQgSSBlaXRoZXIgZG9u
J3QgZmVlbCBxdWFsaWZpZWQKPj4gdG8gZ2l2ZSBhbiBhY2svUi1iIG9uLCBvciB0aGF0IEkgc2lt
cGx5IGRvbid0IHdhbnQgdG8gZm9yIHdoYXRldmVyCj4+IHJlYXNvbi4gQXQgYmVzdCwgbm8gb3Ro
ZXIgY29tbWVudCAoYXMgaW4gdGhlIGFib3ZlIGV4YW1wbGUpIG1heSBiZQo+PiB0YWtlbiBhcyAi
SSBkb24ndCBvYmplY3QiLgo+IAo+IAo+IElmIHRoYXQgaXMgdGhlIGNhc2UsIHdvdWxkIHRoZXJl
IGJlIGEgcmVhc29uYWJsZSBjb252ZW50aW9uIHRvIG1ha2UgdGhpcyBjbGVhcj8gCj4gCj4gSW4g
YSBudXRzaGVsbCwgaW4gc3VjaCBhIHJldmlldyB0aGUgcG9zc2libGUgaW50ZXJwcmV0YXRpb25z
IGFyZQo+ICogSSByZXZpZXdlZCwgYnV0IGRpZG4ndCBmZWVsIHF1YWxpZmllZCB0byBkbyB0aGUg
cmVzdAo+ICogSSByZXZpZXdlZCwgYnV0IGRpZCBub3QgZ2V0IHJvdW5kIHRvIGdpdmUgaXQgZnVs
bCBhdHRlbnRpb24KPiAqIEkgcmV2aWV3ZWQsIGJ1dCBiZWZvcmUgSSBtYWtlIGEgZmluYWwgZGVj
aXNpb24gd2FudCB0byBsb29rIGF0IHRoZSBuZXh0IHZlcnNpb24KPiAuLi4KPiAqIEkgcmV2aWV3
ZWQgYW5kIGRvbid0IG9iamVjdCB0aGUgcmVzdAo+ICogSSByZXZpZXdlZCBhbmQgYWdyZWVkIHdp
dGggdGhlIHJlc3QgCj4gVGhlIGxhdHRlciB0d28gYXJlIGVxdWl2YWxlbnQgdG8gQWNrL1ItYgo+
IAo+IFRoYXQgaXMgcXVpdGUgYSBsYXJnZSByYW5nZSBvZiBwb3NzaWJpbGl0aWVzIGFuZCBraW5k
IG9mIGxlYXZlcyB0aGUgYXV0aG9yIGd1ZXNzaW5nIHdoYXQgc3RhdGUgdGhlIHJldmlldyBpcyBp
bgoKV2VsbCwgSSB0aG91Z2ggdGhlIGNvbnZlbnRpb24gaXMgdG8gZ2l2ZSBBLWIgLyBSLWIgZXhw
bGljaXRseS4gSW4KYSBmZXcgb3Zlcmx5IGFtYmlndW91cyBjYXNlcyB3ZSB0ZW5kIHRvIHNpbXBs
eSBhc2sgYmFjayB3aGV0aGVyIGEKZ2l2ZW4gcmVwbHkgY2FuIGJlIHRyYW5zZm9ybWVkIGludG8g
YSB0YWcuIEkgZG9uJ3Qgc2VlIGFueSBuZWVkCmZvciBmdXJ0aGVyIGZvcm1hbGl6YXRpb24gaGVy
ZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
