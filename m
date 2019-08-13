Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827F8C1C9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 22:03:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxcwZ-00017q-9i; Tue, 13 Aug 2019 19:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2WXD=WJ=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1hxcwX-00017l-4f
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 19:58:53 +0000
X-Inumbo-ID: c59b0320-be04-11e9-9319-57562db115e3
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c59b0320-be04-11e9-9319-57562db115e3;
 Tue, 13 Aug 2019 19:58:51 +0000 (UTC)
Received: from [192.168.43.20] (unknown [172.58.35.116])
 (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id 06353720086;
 Tue, 13 Aug 2019 20:54:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 06353720086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1565744096;
 bh=4X0bl1Sc/tnKSbgX9zQuT15fEVZKuhzuj5wgtwMBUK8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dY5cpsluwqmLHbjLuw/kGJ6wKQV0z+ZOF4wAo9SGYeQfmr1jOuTm4gk5vewu3klUv
 z/dV18jtLdBcRtjluMe6nTK+LVoPYpzBgNgTMTdFUpn9Ot4YybsfvG/N0NaUSMI9Rq
 b+5k98HrN/RkUP2+twfTM4ludganvKXXY77nV7Js=
To: George Dunlap <George.Dunlap@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
 <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
 <760ba819-a3ab-c5dc-054c-3064c6b07a1b@prgmr.com>
 <E4C0136D-9D42-4174-942E-EB6365CB11A1@citrix.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <da822afb-83d0-9d3b-e629-44fd7f0c5f76@prgmr.com>
Date: Tue, 13 Aug 2019 12:58:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E4C0136D-9D42-4174-942E-EB6365CB11A1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xMy8xOSAxOjQzIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IAo+IAo+PiBPbiBBdWcg
MTMsIDIwMTksIGF0IDM6NTkgQU0sIFNhcmFoIE5ld21hbiA8c3JuQHByZ21yLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIDgvMTIvMTkgODowMSBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDEy
LzA4LzIwMTkgMTU6NTMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4gT24gOC84LzE5IDEwOjEz
IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IEhpIEphbiwKPj4+Pj4KPj4+Pj4gT24gMDgv
MDgvMjAxOSAxMDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwOC4wOC4yMDE5IDEw
OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4+IE9uIDA4LzA4LzIwMTkgMDc6MjIsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNy4wOC4yMDE5IDIxOjQxLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4+Pj4gKysrIGIvZG9jcy9n
bG9zc2FyeS5yc3QKPj4+Pj4+Pj4+IEBAIC0wLDAgKzEsMzcgQEAKPj4+Pj4+Pj4+ICtHbG9zc2Fy
eQo+Pj4+Pj4+Pj4gKz09PT09PT09Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArLi4gVGVybXMgc2hv
dWxkIGFwcGVhciBpbiBhbHBoYWJldGljYWwgb3JkZXIKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsu
LiBnbG9zc2FyeTo6Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArICAgY29udHJvbCBkb21haW4KPj4+
Pj4+Pj4+ICsgICAgIEEgOnRlcm06YGRvbWFpbmAsIGNvbW1vbmx5IGRvbTAsIHdpdGggdGhlIHBl
cm1pc3Npb24gYW5kCj4+Pj4+Pj4+PiByZXNwb25zaWJpbGl0eQo+Pj4+Pj4+Pj4gKyAgICAgdG8g
Y3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLgo+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4gKyAgIGRvbWFpbgo+Pj4+Pj4+Pj4gKyAgICAgQSBkb21haW4gaXMgWGVuJ3Mg
dW5pdCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkgaGFzCj4+Pj4+Pj4+PiBh
dCB0aGUKPj4+Pj4+Pj4+ICsgICAgIG1pbmltdW0gc29tZSBSQU0gYW5kIHZpcnR1YWwgQ1BVcy4K
Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsgICAgIFRoZSB0ZXJtcyA6dGVybTpgZG9tYWluYCBhbmQg
OnRlcm06YGd1ZXN0YCBhcmUgY29tbW9ubHkgdXNlZAo+Pj4+Pj4+Pj4gKyAgICAgaW50ZXJjaGFu
Z2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQgdGhpbmdzLgo+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4gKyAgICAgQSBndWVzdCBpcyBhIHNpbmdsZSB2aXJ0dWFsIG1hY2hpbmUuCj4+
Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArICAgICBDb25zaWRlciB0aGUgY2FzZSBvZiBsaXZlIG1pZ3Jh
dGlvbiB3aGVyZSwgZm9yIGEgcGVyaW9kIG9mCj4+Pj4+Pj4+PiB0aW1lLCBvbmUKPj4+Pj4+Pj4+
ICsgICAgIGd1ZXN0IHdpbGwgYmUgY29tcHJpc2VkIG9mIHR3byBkb21haW5zLCB3aGlsZSBpdCBp
cyBpbiB0cmFuc2l0Lgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKyAgIGRvbWlkCj4+Pj4+Pj4+PiAr
ICAgICBUaGUgbnVtZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmluZyA6dGVybTpgZG9tYWluYC4g
IEl0IGlzCj4+Pj4+Pj4+PiB1bmlxdWUgdG8gYQo+Pj4+Pj4+Pj4gKyAgICAgc2luZ2xlIGluc3Rh
bmNlIG9mIFhlbiwgdXNlZCBhcyB0aGUgaWRlbnRpZmllciBpbiB2YXJpb3VzIEFQSXMsCj4+Pj4+
Pj4+PiBhbmQgaXMKPj4+Pj4+Pj4+ICsgICAgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2VxdWVudGlh
bGx5IGZyb20gMC4KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsgICBndWVzdAo+Pj4+Pj4+Pj4gKyAg
ICAgU2VlIDp0ZXJtOmBkb21haW5gCj4+Pj4+Pj4+IEkgdGhpbmsgeW91IHdhbnQgdG8gbWVudGlv
biB0aGUgdXN1YWwgZGlzdGluY3Rpb24gaGVyZTogRG9tMCBpcywKPj4+Pj4+Pj4gd2hpbGUgYSBk
b21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuCj4+Pj4+Pj4gVG8gYmUgaG9u
ZXN0LCBJIGhhZCB0b3RhbGx5IGZvcmdvdHRlbiBhYm91dCB0aGF0LiAgSSBndWVzcyBub3cgaXMg
dGhlCj4+Pj4+Pj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1YmxpYy4KPj4+Pj4+Pgo+
Pj4+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIHdheSBpdCBjdXJyZW50bHkgZ2V0cyB1c2VkIGhhcyBh
IGNsZWFyIG9yIGNvaGVyZW50IHNldAo+Pj4+Pj4+IG9mIHJ1bGVzLCBiZWNhdXNlIEkgY2FuJ3Qg
dGhpbmsgb2YgYW55IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1c2VkLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gRWl0aGVyIHRoZXJlIGFyZSBhIGNsZWFyIGFuZCBjb2hlcmVudCAoYW5kIHNpbXBsZSEp
IHNldCBvZiBydWxlcyBmb3IKPj4+Pj4+PiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hp
Y2ggcG9pbnQgdGhleSBjYW4gbGl2ZSBoZXJlIGluIHRoZQo+Pj4+Pj4+IGdsb3NzYXJ5LCBvciB0
aGUgZnV6enkgd2F5IGl0IGlzIGN1cnJlbnQgdXNlZCBzaG91bGQgY2Vhc2UuCj4+Pj4+PiBXaGF0
J3MgZnV6enkgYWJvdXQgRG9tMCBub3QgYmVpbmcgYSBndWVzdCAoZHVlIHRvIGJlaW5nIGEgcGFy
dCBvZiB0aGUKPj4+Pj4+IGhvc3QgaW5zdGVhZCk/Cj4+Pj4+IERvbTAgaXMgbm90IHBhcnQgb2Yg
dGhlIGhvc3QgaWYgeW91IGFyZSB1c2luZyBhbiBoYXJkd2FyZSBkb21haW4uIEkKPj4+Pj4gYWN0
dWFsbHkgdGhvdWdodCB3ZSByZW5hbWVkIGV2ZXJ5dGhpbmcgaW4gWGVuIGZyb20gRG9tMCB0byBo
d2RvbSB0bwo+Pj4+PiBhdm9pZCB0aGUgY29uZnVzaW9uLgo+Pj4+Pgo+Pj4+PiBJIGFsc28gd291
bGQgcmF0aGVyIGF2b2lkIHRvIHRyZWF0ICJkb20wIiBhcyBub3QgYSBndWVzdC4gSW4gbm9ybWFs
Cj4+Pj4+IHNldHVwIHRoaXMgaXMgYSBtb3JlIHByaXZpbGVnZSBndWVzdCwgaW4gb3RoZXIgc2V0
dXAgdGhpcyBtYXkganVzdCBiZSBhCj4+Pj4+IG5vcm1hbCBndWVzdCAodGhpbmsgYWJvdXQgcGFy
dGl0aW9uaW5nKS4KPj4+PiBBIGxpdGVyYWwgZ3Vlc3QgaXMgc29tZW9uZSB3aG8gZG9lc24ndCBs
aXZlIGluIHRoZSBidWlsZGluZyAob3Igd29yayBpbgo+Pj4+IHRoZSBidWxpZGluZywgaWYgeW91
J3JlIGluIGEgaG90ZWwpLiAgVGhlIGZhY3QgdGhhdCB0aGUgc3RhZmYgY2xlYW5pbmcKPj4+PiBy
b29tcyBhcmUgcmVzdHJpY3RlZCBpbiB0aGVpciBwcml2aWxlZ2VzIGRvZXNuJ3QgbWFrZSB0aGVt
IGd1ZXN0cyBvZiB0aGUKPj4+PiBob3RlbC4KPj4+Pgo+Pj4+IFRoZSB0b29sc3RhY2sgZG9tYWlu
LCB0aGUgaGFyZHdhcmUgZG9tYWluLCB0aGUgZHJpdmVyIGRvbWFpbiwgdGhlCj4+Pj4geGVuc3Rv
cmUgZG9tYWluLCBhbmQgc28gb24gYXJlIGFsbCBwYXJ0IG9mIHRoZSBob3N0IHN5c3RlbSwgZGVz
aWduZWQgdG8KPj4+PiBhbGxvdyB5b3UgdG8gdXNlIFhlbiB0byBkbyB0aGUgdGhpbmcgeW91IGFj
dHVhbGx5IHdhbnQgdG8gZG86IFJ1biBndWVzdHMuCj4+Pj4KPj4+PiBBbmQgaXQncyBpbXBvcnRh
bnQgdGhhdCB3ZSBoYXZlIGEgd29yZCB0aGF0IGRpc3Rpbmd1aXNoZXMgImRvbWFpbnMgdGhhdAo+
Pj4+IHdlIG9ubHkgY2FyZSBhYm91dCBiZWNhdXNlIHRoZXkgbWFrZSBpdCBwb3NzaWJsZSB0byBy
dW4gb3RoZXIgZG9tYWlucyIsCj4+Pj4gYW5kICJkb21haW5zIHRoYXQgd2UgYWN0dWFsbHkgd2Fu
dCB0byBydW4iLiAgImd1ZXN0IC8gaG9zdCIgaXMgYSBuYXR1cmFsCj4+Pj4gdGVybWlub2xvZ3kg
Zm9yIHRoZXNlLgo+Pj4+Cj4+Pj4gV2UgYWxyZWFkeSBoYXZlIHRoZSB3b3JkICJkb21haW4iLCB3
aGljaCBpbmNsdWRlcyBkb20wLCBkcml2ZXIgZG9tYWlucywKPj4+PiB0b29sc3RhY2sgZG9tYWlu
cywgaGFyZHdhcmUgZG9tYWlucywgYXMgd2VsbCBhcyBndWVzdCBkb21haW5zLiAgV2UgZG9uJ3QK
Pj4+PiBuZWVkICJndWVzdCIgdG8gYmUgYSBzeW5vbnltIGZvciAiZG9tYWluIi4KPj4+IFNvLi4u
Cj4+PiBQbGVhc2UgY2FuIHNvbWVvbmUgcHJvcG9zZSB3b3JkaW5nIHNpbXBsZSwgY2xlYXIgd29y
ZGluZyBmb3Igd2hhdAo+Pj4gImd1ZXN0IiBtZWFucy4KPj4KPj4gQSBwb3RlbnRpYWxseSB1bnRy
dXN0ZWQgZG9tYWluLgo+IAo+IEJ1dCB3b3VsZG7igJl0IHRoYXQgaW5jbHVkZSBib3RoIGRyaXZl
ciBkb21haW5zIGFuZCBzdHViZG9tYWlucz8KClRoZW4gaG93IGFib3V0OiBhIGRvbWFpbiB3aGlj
aCBkb2VzIG5vdCBwcm92aWRlIFhlbi1yZWxhdGVkIHNlcnZpY2VzLgoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
