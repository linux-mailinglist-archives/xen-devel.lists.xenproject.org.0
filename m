Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05E51CDF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 23:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfWCm-0004ZH-Q9; Mon, 24 Jun 2019 21:08:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfWCm-0004ZC-7x
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 21:08:48 +0000
X-Inumbo-ID: 4140b961-96c4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4140b961-96c4-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 21:08:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 452AD344;
 Mon, 24 Jun 2019 14:08:46 -0700 (PDT)
Received: from [10.37.9.192] (unknown [10.37.9.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FDC33F71E;
 Mon, 24 Jun 2019 14:08:44 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
Date: Mon, 24 Jun 2019 22:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjQvMTkgOToyMyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjQgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDI0LzA2LzIwMTkgMTk6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIE1v
biwgMjQgSnVuIDIwMTksIExhcnMgS3VydGggd3JvdGU6Cj4+PiBJIHRoaW5rIHdlIGFsbCBhZ3Jl
ZSBieSBub3cgdGhhdCBtYWludGFpbmluZyB1cC10by1kYXRlIGRvY3Mgb24gdGhlIHdpa2kKPj4+
IGFuZCBrZWVwaW5nIHRoZW0gaW4gc3luYyB3aXRoIGNvZGUgY2hhbmdlcyBpcyBoYXJkLiBJIHNl
ZSBtb3ZpbmcgdGhpbmdzCj4+PiBmcm9tIHRoZSB3aWtpIHRvIHhlbi5naXQgYXMgYSBncmVhdCBp
bXByb3ZlbWVudC4gV2UgaGF2ZSBhIGZldyBYZW4gb24KPj4+IEFSTSBkb2NzIHRoYXQgYXJlIHdv
cnRoIGltcG9ydGluZyBmcm9tIHRoZSB3aWtpOgo+Pj4KPj4+IGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL1hlbl9BUk1fd2l0aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zCj4+Cj4+
IEkgYWdyZWUgZm9yIHRoaXMgYnV0IC4uLgo+Pgo+Pj4KPj4+IEFuZCBhbGwgdGhlIGJvYXJkIHNw
ZWNpZmljIGRvY3MgbGlua2VkIGZyb20gaXQsIHN1Y2ggYXM6Cj4+Pgo+Pj4gaHR0cHM6Ly93aWtp
LnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lv
bnMvcWVtdS1zeXN0ZW0tYWFyY2g2NAo+Pj4gaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dp
a2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lvbnMvRmFzdE1vZGVscwo+Pj4g
aHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvSGlLZXk5NjAKPj4KPj4gLi4uIEkgdGhp
bmsgaXQgaXMgYSBwcmV0dHkgYmFkIGlkZWEgdG8gaW1wb3J0IGJvYXJkIHNwZWNpZmljIGRvY3Mu
IFRoZXJlCj4+IGFyZSBhIGxvdCBvZiB3YXkgdG8gYnVpbGQgY29tcG9uZW50cyBmb3IgYSBnaXZl
biBib2FyZCBhbmQgSSBhbSB3b3JyeSBvZgo+PiB0aGUgb3ZlcmhlYXJkIGZvciB0aGUgbWFpbnRh
aW5lcnMgdG8gbG9vay9tYWludGFpbiB0aGUgZG9jdW1lbnRhdGlvbi4gSXQKPj4gYWxzbyBicmlu
Z3MgdGhlIHF1ZXN0aW9uIG9mIHRoZSBhY2NlcHRhbmNlL3JlbW92YWwgb2YKPj4gYSBib2FyZCBk
b2N1bWVudGF0aW9uLgo+IAo+IFRoYXQgcHJvYmxlbSBjYW4gYmUgc29sdmVkIGJ5IHNwZWNpZnlp
bmcgYW4gYXBwcm9wcmlhdGUgbWFpbnRlbmFuY2UKPiBtb2RlbCBmb3IgdGhvc2UgZG9jdW1lbnRz
Lgo+IAo+IAo+PiBJbnN0ZWFkIHdlIHNob3VsZCBwcm92aWRlIGdlbmVyaWMgZ3VpZGFuY2UvdHJv
dWJsZXNob290IHRvIHRoZSB1c2VyLgo+PiBBbnl0aGluZyBib2FyZCBzcGVjaWZpYyBjb3VsZCBi
ZSBtYWludGFpbiBvbiB0aGUgd2lraSBieSBzb21lb25lIGNhcmluZwo+PiBhYm91dCB0aGUgYm9h
cmQgd2l0aG91dCBoYXZpbmcgdXMgdG8gZ2F0ZSBpdC4KPiAKPiBJZiB3ZSBtb3ZlIHRoZSBkb2Nz
IHRvIHhlbi5naXQgaXQgZG9lc24ndCBpbW1lZGlhdGVseSBpbXBseSB0aGF0IHRoZQo+IFJFU1Qg
bWFpbnRhaW5lcnMgbmVlZCB0byAiZ2F0ZSIgdGhlbS4gV2UgY291bGQgbWFrZSB0aGUgZXhpc3Rp
bmcKPiBjdXJhdG9ycyBvZiB0aG9zZSBwYWdlcyB0aGUgbWFpbnRhaW5lcnMgZm9yIHRob3NlIGZp
bGVzLCBmb3IgZXhhbXBsZS4gV2UKPiBjYW4gY29tZSB1cCB3aXRoIG1vZGUgaWRlYXMuIFdlIGNv
dWxkIGV2ZW4gbGVhdmUgdGhlbSB1bm1haW50YWluZWQuCgpJIGRvbid0IHRoaW5rIEkgd2FudCB0
byBhZGQgYSByYW5kb20gcGVyc29uIGFzIGEgbWFpbnRhaW5lciBpbiB4ZW4uZ2l0LiAKU28gYXQg
YmVzdCB3ZSB3b3VsZCBuZWVkIGEgbmV3IHJvbGUuCgo+IAo+IFRoZSBwb2ludCBoZXJlIGlzIHRo
YXQgd2UgY2FuIGJlIGZsZXhpYmxlIGFuZCBjcmVhdGl2ZSBhYm91dCB0aGUgd2F5IHRvCj4gbWFp
bnRhaW4gdGhlIGRvY3Mgb24geGVuLmdpdC4gQnV0IGFzIGEgdGVjaG5vbG9neSBpcyBjZXJ0YWlu
bHkgYmV0dGVyCj4gdGhhbiB0aGUgd2lraTogd2UgZG9uJ3QgaGF2ZSB0byBrZWVwIHRoZW0gYWxs
IHVwLXRvLWRhdGUgd2l0aCB0aGUgY29kZSwKPiBidXQgYXQgbGVhc3QgdGhpcyB3YXkgd2UgaGF2
ZSBhIGNoYW5jZSAoaWYgd2Ugd2FudCB0bykuIElmIHdlIGxlYXZlIHRoZW0KPiBvbiB0aGUgd2lr
aSwgdGhlcmUgaXMgbm8gY2hhbmNlLgoKSSBjYW4ndCBzZWUgaG93IHhlbi5naXQgaXMgZ29pbmcg
dG8gYmUgYmV0dGVyIGlmICJ3ZSBkb24ndCBoYXZlIHRvIGtlZXAgCnRoZW0gYWxsIHVwLXRvLWRh
dGUiLgoKQnV0IG15IHBvaW50IGhlcmUgaXMgbW9zdCBvZiB0aGUgYm9hcmQgc2hvdWxkIGJlIHRy
aXZpYWwuIFRoZSBtb3N0IG9mIAp0aGUgbm9uLXRyaXZpYWwgc2V0dXAgcmVxdWlyZSBub24tdXBz
dHJlYW0gcGF0Y2guIFdoaWxlIEkgYW0gaGFwcHkgdG8gCnNlZSB0aGF0IG9uIHRoZSB3aWtpLCBJ
IHRoaW5rIHhlbi5naXQgc2hvdWxkIG5vdCBwcm9tb3RlIHN1Y2ggCmNvbmZpZ3VyYXRpb24gYXQg
YWxsLiBXZSBhcmUgd29ya2luZyB1cHN0cmVhbSwgbm90IHdpdGggCnVua25vd24vdW50cnVzdGVk
IHN0YWNrLgoKRm9yIHNvbWUgd29ya2luZyBmdWxseSB1cHN0cmVhbSwgSSBkb24ndCB0aGluayB4
ZW4uZ2l0IHNob3VsZCBwcm9tb3RlIAphbnkgZGlzdHJvcy92ZXJzaW9ucyBvZiB0aGUga2VybmVs
LiBIb3dldmVyLCB0aGlzIGlzIG9rIG9uIHRoZSB3aWtpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
