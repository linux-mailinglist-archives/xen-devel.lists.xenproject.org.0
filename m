Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D714049D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 08:51:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isMNJ-0004Bn-DA; Fri, 17 Jan 2020 07:49:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fsd1=3G=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1isMNH-0004Bi-J5
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 07:48:59 +0000
X-Inumbo-ID: d188e048-38fd-11ea-a985-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d188e048-38fd-11ea-a985-bc764e2007e4;
 Fri, 17 Jan 2020 07:48:58 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1isMND-000NPr-Do; Fri, 17 Jan 2020 07:48:55 +0000
Date: Fri, 17 Jan 2020 07:48:55 +0000
From: Tim Deegan <tim@xen.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200117074855.GB89813@deinos.phlegethon.org>
References: <20200115111601.GN11738@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115111601.GN11738@Air-de-Roger>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] Issues/improvements performing flush of guest TLBs
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBdCAxMjoxNiArMDEwMCBvbiAxNSBKYW4gKDE1NzkwOTA1NjEpLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ICAtIFNoYWRvdzogaXQncyBub3QgY2xlYXIgdG8gbWUgZXhhY3RseSB3aGlj
aCBwYXJ0cyBvZiBzaF91cGRhdGVfY3IzCj4gICAgYXJlIG5lZWRlZCBpbiBvcmRlciB0byBwZXJm
b3JtIGEgZ3Vlc3QgVExCIGZsdXNoLiBJIHRoaW5rIGNhbGxpbmc6Cj4gCj4gI2lmIChTSEFET1df
T1BUSU1JWkFUSU9OUyAmIFNIT1BUX1ZJUlRVQUxfVExCKQo+ICAgICAvKiBObyBsb25nZXIgc2Fm
ZSB0byB1c2UgY2FjaGVkIGd2YS0+Z2ZuIHRyYW5zbGF0aW9ucyAqLwo+ICAgICB2dGxiX2ZsdXNo
KHYpOwo+ICNlbmRpZgo+ICNpZiAoU0hBRE9XX09QVElNSVpBVElPTlMgJiBTSE9QVF9PVVRfT0Zf
U1lOQykKPiAgICAgLyogTmVlZCB0byByZXN5bmMgYWxsIHRoZSBzaGFkb3cgZW50cmllcyBvbiBh
IFRMQiBmbHVzaC4gKi8KPiAgICAgc2hhZG93X3Jlc3luY19jdXJyZW50X3ZjcHUodik7Cj4gI2Vu
ZGlmCj4gCj4gICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogTGluZWFyIG1hcHBpbmdzIG1pZ2h0IGJlIGNhY2hlZCBpbiBub24tcm9vdCBtb2RlIHdo
ZW4gQVNJRC9WUElEIGlzCj4gICAgICAgICAgKiBpbiB1c2UgYW5kIGhlbmNlIHRoZXkgbmVlZCB0
byBiZSBmbHVzaGVkIGhlcmUuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGh2bV9hc2lkX2ZsdXNo
X3ZjcHUodik7Cj4gCj4gICAgU2hvdWxkIGJlIGVub3VnaCBidXQgSSdtIG5vdCB2ZXJ5IGZhbWls
aWFyIHdpdGggdGhlIHNoYWRvdyBjb2RlLAo+ICAgIGFuZCBoZW5jZSB3b3VsZCBsaWtlIHNvbWUg
ZmVlZGJhY2sgZnJvbSBzb21lb25lIG1vcmUgZmFtaWxpYXIgd2l0aAo+ICAgIHNoYWRvdyBpbiBv
cmRlciB0byBhc3NlcnQgZXhhY3RseSB3aGF0J3MgcmVxdWlyZWQgdG8gcGVyZm9ybSBhCj4gICAg
Z3Vlc3QgVExCIGZsdXNoLgoKSSB3b3VsZCBhZHZpc2Uga2VlcGluZyB0aGUgd2hvbGUgdGhpbmcg
dW50aWwgeW91IGhhdmUgbWVhc3VyZW1lbW50cwp0aGF0IHNob3cgdGhhdCBpdCdzIHdvcnRod2hp
bGUgYmVpbmcgY2xldmVyIGhlcmUgKGUuZy4gdGhhdCB0aGUgSVBJCmNvc3RzIGRvbid0IGRvbWlu
YXRlKS4KCkJ1dCBJIHRoaW5rIGZvciBzYWZldHkgd2UgbmVlZCBhdCBsZWFzdCB0aGUgY29kZSB5
b3UgbWVudGlvbiBhbmQgYWxzbzoKIC0gdGhlIGNvZGUgdGhhdCByZWxvYWRzIHRoZSBQQUUgdG9w
LWxldmVsIGVudHJpZXM7IGFuZAogLSB0aGUgc2hhZG93X3Jlc3luY19vdGhlcl92Y3B1cygpIGF0
IHRoZSBlbmQuCgo+ICAgIEFsc28sIEFGQUlDVCBzaF91cGRhdGVfY3IzIGlzIG5vdCBzYWZlIHRv
IGJlIGNhbGxlZCBvbiB2Q1BVcwo+ICAgIGN1cnJlbnRseSBydW5uaW5nIG9uIHJlbW90ZSBwQ1BV
cywgYWxiZWl0IHRoZXJlIGFyZSBubyBhc3NlcnRpb25zCj4gICAgdG8gdGhhdCBlbmQuIEl0J3Mg
YWxzbyBub3QgY2xlYXIgd2hpY2ggcGFydHMgb2Ygc2hfdXBkYXRlX2NyMyBhcmUKPiAgICBzYWZl
IHRvIGJlIGNhbGxlZCB3aGlsZSB0aGUgdkNQVSBpcyBydW5uaW5nLgoKWWVhaCwgc2hfdXBkYXRl
X2NyMyBtYWtlcyBhIGJ1bmNoIG9mIHN0YXRlIGNoYW5nZXMgYW5kIGFzc3VtZXMKdGhhdCB0aGUg
dmNwdSBjYW4ndCBkbyBUTEIgbG9hZHMgcGFydC13YXkgdGhyb3VnaC4gIEl0IG1heSBiZSBwb3Nz
aWJsZQp0byBkbyBzb21lIG9mIGl0IHJlbW90ZWx5IGJ1dCBhcyB5b3Ugc2F5IGl0IHdvdWxkIHRh
a2UgYSBsb3Qgb2YKdGhpbmtpbmcsIGFuZCBpZiB0aGUgZ3Vlc3QgaXMgcnVubmluZyB5b3UncmUg
Z29pbmcgdG8gbmVlZCBhbiBJUEkKYW55d2F5IHRvIGZsdXNoIHRoZSBhY3R1YWwgVExCLgoKPiBG
V0lXLCB0aGVyZSBhbHNvIHNlZW1zIHRvIGJlIGEgbG90IG9mIHVubmVlZGVkIGZsdXNoZXMgb2Yg
SFZNIGd1ZXN0cwo+IFRMQiwgYXMgZG9fdGxiX2ZsdXNoIHdpbGwgdW5jb25kaXRpb25hbGx5IGNs
ZWFyIGFsbCBIVk0gZ3Vlc3QgVExCcyBvbgo+IHRoZSBwQ1BVIGJ5IGNhbGxpbmcgaHZtX2FzaWRf
Zmx1c2hfY29yZSB3aGljaCBJIGRvbid0IHRoaW5rIGl0J3MKPiBuZWNlc3NhcnkvaW50ZW5kZWQg
YnkgcXVpdGUgYSBsb3Qgb2YgdGhlIFhlbiBUTEIgZmx1c2ggY2FsbGVycy4gSQo+IGd1ZXNzIHRo
aXMgd291bGQgYWxzbyB3YXJyYW50IGEgZGlmZmVyZW50IGRpc2N1c3Npb24sIGFzIHRoZXJlIHNl
ZW1zCj4gdG8gYmUgcm9vbSBmb3IgaW1wcm92ZW1lbnQgaW4gdGhpcyBhcmVhLgoKVGhlcmUgbWF5
IGJlIHJvb20gZm9yIGltcHJvdmVtZW50LCBidXQgZG8gYmUgY2FyZWZ1bCAtIHRoZSBYZW4gTU0K
c2FmZXR5IHJ1bGVzIGRlcGVuZCBvbiBUTEIgZmx1c2hlcyB3aGVuIGEgcGFnZSdzIHR5cGUgb3Ig
b3duZXJzaGlwCmNoYW5nZXMsIGFuZCB0aGF0IGRvZXMgbWVhbiBmbHVzaGluZyBldmVuIHRoZSBn
dWVzdCBUTEJzLiAgSVNUUgpkaXNjdXNzaW5nIHRoaXMgYXQgdGhlIHRpbWUgdGhhdCB2VExCcyB3
ZXJlIGludHJvZHVjZWQgYW5kIGRlY2lkaW5nCnRoYXQgaXQgd2Fzbid0IHdvcnRoIGFkZGluZyBh
bGwgdGhlIHRyYWNraW5nIHRoYXQgd291bGQgYmUgbmVjZXNzYXJ5Owp0aGF0IG1heSBoYXZlIGNo
YW5nZWQgbm93IHRoYXQgdGhlIHAybSBpbmZyYXN0cnVjdHVyZSBpcyBiZXR0ZXIKZGV2ZWxvcGVk
LgoKQ2hlZXJzLAoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
