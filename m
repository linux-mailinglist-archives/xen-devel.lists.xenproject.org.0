Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185D51F76
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 02:04:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfYul-0001Mr-Oq; Tue, 25 Jun 2019 00:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfYuk-0001Ml-7i
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 00:02:22 +0000
X-Inumbo-ID: 80dc03b4-96dc-11e9-9cc2-534447b76dcb
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80dc03b4-96dc-11e9-9cc2-534447b76dcb;
 Tue, 25 Jun 2019 00:02:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 638E0206DD;
 Tue, 25 Jun 2019 00:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561420940;
 bh=J9L+FJxfkDJmdiz4dgBuJ6BK5EAQPmHUsGiauHQjvVY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kDPNa/bpyBxxnxEz5pykZkLac0sfrzovXDc1nOpEUnx14IIpnleWNQGal8BgPeBGd
 gC/fFTjgt6d0r+cBSYbzxZNN4Fkq1yZv5VSi9Npozwj+8L9wiSP1OztEkvAmh7HSbu
 YCGsR0u7ldMANYnmBgFGbBHYp54S+9VQrP2Fw0ts=
Date: Mon, 24 Jun 2019 17:02:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
Message-ID: <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8yNC8xOSA5OjIzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBN
b24sIDI0IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+
ID4gT24gMjQvMDYvMjAxOSAxOTowMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+
IE9uIE1vbiwgMjQgSnVuIDIwMTksIExhcnMgS3VydGggd3JvdGU6Cj4gPiA+ID4gSSB0aGluayB3
ZSBhbGwgYWdyZWUgYnkgbm93IHRoYXQgbWFpbnRhaW5pbmcgdXAtdG8tZGF0ZSBkb2NzIG9uIHRo
ZSB3aWtpCj4gPiA+ID4gYW5kIGtlZXBpbmcgdGhlbSBpbiBzeW5jIHdpdGggY29kZSBjaGFuZ2Vz
IGlzIGhhcmQuIEkgc2VlIG1vdmluZyB0aGluZ3MKPiA+ID4gPiBmcm9tIHRoZSB3aWtpIHRvIHhl
bi5naXQgYXMgYSBncmVhdCBpbXByb3ZlbWVudC4gV2UgaGF2ZSBhIGZldyBYZW4gb24KPiA+ID4g
PiBBUk0gZG9jcyB0aGF0IGFyZSB3b3J0aCBpbXBvcnRpbmcgZnJvbSB0aGUgd2lraToKPiA+ID4g
PiAKPiA+ID4gPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fQVJNX3dpdGhf
VmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucwo+ID4gPiAKPiA+ID4gSSBhZ3JlZSBmb3IgdGhpcyBi
dXQgLi4uCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEFuZCBhbGwgdGhlIGJvYXJkIHNwZWNpZmlj
IGRvY3MgbGlua2VkIGZyb20gaXQsIHN1Y2ggYXM6Cj4gPiA+ID4gCj4gPiA+ID4gaHR0cHM6Ly93
aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVu
c2lvbnMvcWVtdS1zeXN0ZW0tYWFyY2g2NAo+ID4gPiA+IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0
Lm9yZy93aWtpL1hlbl9BUk1fd2l0aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zL0Zhc3RNb2Rl
bHMKPiA+ID4gPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9IaUtleTk2MAo+ID4g
PiAKPiA+ID4gLi4uIEkgdGhpbmsgaXQgaXMgYSBwcmV0dHkgYmFkIGlkZWEgdG8gaW1wb3J0IGJv
YXJkIHNwZWNpZmljIGRvY3MuIFRoZXJlCj4gPiA+IGFyZSBhIGxvdCBvZiB3YXkgdG8gYnVpbGQg
Y29tcG9uZW50cyBmb3IgYSBnaXZlbiBib2FyZCBhbmQgSSBhbSB3b3JyeSBvZgo+ID4gPiB0aGUg
b3ZlcmhlYXJkIGZvciB0aGUgbWFpbnRhaW5lcnMgdG8gbG9vay9tYWludGFpbiB0aGUgZG9jdW1l
bnRhdGlvbi4gSXQKPiA+ID4gYWxzbyBicmluZ3MgdGhlIHF1ZXN0aW9uIG9mIHRoZSBhY2NlcHRh
bmNlL3JlbW92YWwgb2YKPiA+ID4gYSBib2FyZCBkb2N1bWVudGF0aW9uLgo+ID4gCj4gPiBUaGF0
IHByb2JsZW0gY2FuIGJlIHNvbHZlZCBieSBzcGVjaWZ5aW5nIGFuIGFwcHJvcHJpYXRlIG1haW50
ZW5hbmNlCj4gPiBtb2RlbCBmb3IgdGhvc2UgZG9jdW1lbnRzLgo+ID4gCj4gPiAKPiA+ID4gSW5z
dGVhZCB3ZSBzaG91bGQgcHJvdmlkZSBnZW5lcmljIGd1aWRhbmNlL3Ryb3VibGVzaG9vdCB0byB0
aGUgdXNlci4KPiA+ID4gQW55dGhpbmcgYm9hcmQgc3BlY2lmaWMgY291bGQgYmUgbWFpbnRhaW4g
b24gdGhlIHdpa2kgYnkgc29tZW9uZSBjYXJpbmcKPiA+ID4gYWJvdXQgdGhlIGJvYXJkIHdpdGhv
dXQgaGF2aW5nIHVzIHRvIGdhdGUgaXQuCj4gPiAKPiA+IElmIHdlIG1vdmUgdGhlIGRvY3MgdG8g
eGVuLmdpdCBpdCBkb2Vzbid0IGltbWVkaWF0ZWx5IGltcGx5IHRoYXQgdGhlCj4gPiBSRVNUIG1h
aW50YWluZXJzIG5lZWQgdG8gImdhdGUiIHRoZW0uIFdlIGNvdWxkIG1ha2UgdGhlIGV4aXN0aW5n
Cj4gPiBjdXJhdG9ycyBvZiB0aG9zZSBwYWdlcyB0aGUgbWFpbnRhaW5lcnMgZm9yIHRob3NlIGZp
bGVzLCBmb3IgZXhhbXBsZS4gV2UKPiA+IGNhbiBjb21lIHVwIHdpdGggbW9kZSBpZGVhcy4gV2Ug
Y291bGQgZXZlbiBsZWF2ZSB0aGVtIHVubWFpbnRhaW5lZC4KPiAKPiBJIGRvbid0IHRoaW5rIEkg
d2FudCB0byBhZGQgYSByYW5kb20gcGVyc29uIGFzIGEgbWFpbnRhaW5lciBpbiB4ZW4uZ2l0LiBT
byBhdAo+IGJlc3Qgd2Ugd291bGQgbmVlZCBhIG5ldyByb2xlLgoKVGhpcyBpcyBhIGdvb2QgcG9p
bnQsIHRha2luZyBpbnRvIGFjY291bnQgdGhlIGN1cnJlbnQgZ292ZXJuYW5jZSBtb2RlbC4KV2Ug
Y291bGQgdXNlIFI6IGZvciB0aGF0PwoKCj4gPiBUaGUgcG9pbnQgaGVyZSBpcyB0aGF0IHdlIGNh
biBiZSBmbGV4aWJsZSBhbmQgY3JlYXRpdmUgYWJvdXQgdGhlIHdheSB0bwo+ID4gbWFpbnRhaW4g
dGhlIGRvY3Mgb24geGVuLmdpdC4gQnV0IGFzIGEgdGVjaG5vbG9neSBpcyBjZXJ0YWlubHkgYmV0
dGVyCj4gPiB0aGFuIHRoZSB3aWtpOiB3ZSBkb24ndCBoYXZlIHRvIGtlZXAgdGhlbSBhbGwgdXAt
dG8tZGF0ZSB3aXRoIHRoZSBjb2RlLAo+ID4gYnV0IGF0IGxlYXN0IHRoaXMgd2F5IHdlIGhhdmUg
YSBjaGFuY2UgKGlmIHdlIHdhbnQgdG8pLiBJZiB3ZSBsZWF2ZSB0aGVtCj4gPiBvbiB0aGUgd2lr
aSwgdGhlcmUgaXMgbm8gY2hhbmNlLgo+IAo+IEkgY2FuJ3Qgc2VlIGhvdyB4ZW4uZ2l0IGlzIGdv
aW5nIHRvIGJlIGJldHRlciBpZiAid2UgZG9uJ3QgaGF2ZSB0byBrZWVwIHRoZW0KPiBhbGwgdXAt
dG8tZGF0ZSIuCgpUaGF0J3MgYmVjYXVzZSBhIGNvbnRyaWJ1dG9yIGNvdWxkIGFkZCBhIHBhdGNo
IGF0IHRoZSBlbmQgb2YgYSBzZXJpZXMgdG8KdXBkYXRlIG9uZSBvZiB0aGUgZG9jcywgZXZlbiBp
ZiB0aGUgZG9jIGluIHF1ZXN0aW9uIGNvbWVzIHdpdGggbm8KcHJvbWlzZXMgb2YgYmVpbmcgdXAt
dG8tZGF0ZS4KCgo+IEJ1dCBteSBwb2ludCBoZXJlIGlzIG1vc3Qgb2YgdGhlIGJvYXJkIHNob3Vs
ZCBiZSB0cml2aWFsLiBUaGUgbW9zdCBvZiB0aGUKPiBub24tdHJpdmlhbCBzZXR1cCByZXF1aXJl
IG5vbi11cHN0cmVhbSBwYXRjaC4gV2hpbGUgSSBhbSBoYXBweSB0byBzZWUgdGhhdCBvbgo+IHRo
ZSB3aWtpLCBJIHRoaW5rIHhlbi5naXQgc2hvdWxkIG5vdCBwcm9tb3RlIHN1Y2ggY29uZmlndXJh
dGlvbiBhdCBhbGwuIFdlIGFyZQo+IHdvcmtpbmcgdXBzdHJlYW0sIG5vdCB3aXRoIHVua25vd24v
dW50cnVzdGVkIHN0YWNrLgo+IAo+IEZvciBzb21lIHdvcmtpbmcgZnVsbHkgdXBzdHJlYW0sIEkg
ZG9uJ3QgdGhpbmsgeGVuLmdpdCBzaG91bGQgcHJvbW90ZSBhbnkKPiBkaXN0cm9zL3ZlcnNpb25z
IG9mIHRoZSBrZXJuZWwuIEhvd2V2ZXIsIHRoaXMgaXMgb2sgb24gdGhlIHdpa2kuCgpJIHdvdWxk
IGxpa2UgdG8gc2VlIHRoZSB3aWtpIGRpc2FwcGVhciBjb21wbGV0ZWx5IGluIHRoZSBsb25nIHRl
cm0uIEFzCndlIGFyZSBtb3ZpbmcgbW9yZSBjb250ZW50IHRvIHhlbi5naXQsIGl0IGlzIG5vdCBh
IGdvb2QgaWRlYSB0byBoYXZlIHR3bwpwbGFjZXMgd2hlcmUgd2Uga2VlcCBpbmZvcm1hdGlvbiwg
Zm9yIHNpbWlsYXIgcmVhc29ucyB3aHkgeW91IHN1Z2dlc3RlZAp0byB1c2UgaW4tY29kZSBjb21t
ZW50cyBpbnN0ZWFkIG9mIGRvY3MgdG8gZG9jdW1lbnQgaW50ZXJmYWNlcy4gSXQKanVzdCB0YWtl
cyBtb3JlIGVmZm9ydHMgdG8gbWFpbnRhaW4gaW5mb3JtYXRpb24gaW4gdHdvIHBsYWNlcyBhbmQg
dGhleQp0ZW5kIHRvIGdldCBvdXQgb2Ygc3luYyB3aXRoIGVhY2ggb3RoZXJzLgoKSWYgd2UgbWFr
ZSB0aGUgd2lraSBnbyBhd2F5IChJIGhvcGUgc28pLCB3ZSdsbCBuZWVkIGEgcGxhY2UgdG8gc3Rv
cmUgdGhlCkFybSBib2FyZC1zcGVjaWZpYyBkb2N1bWVudHMsIGFuZCBvdGhlciB0dXRvcmlhbHMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
