Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC051C3E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 22:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfVUX-0001TG-U2; Mon, 24 Jun 2019 20:23:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfVUW-0001TB-OH
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 20:23:04 +0000
X-Inumbo-ID: de39b048-96bd-11e9-bd49-c30ca40f6680
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de39b048-96bd-11e9-bd49-c30ca40f6680;
 Mon, 24 Jun 2019 20:23:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91FB720663;
 Mon, 24 Jun 2019 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561407783;
 bh=fQ4XC5BCan772gVk8FpexBQviYgv9XwyaoHKaZqSou0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RwTkuAv+VHBdgqKPNbaJbM0e8tWQQKsRko2D5AvMsgJVHrS1atFrYupq5MxPnJLDp
 6ggptON55Ksx1ooDxRigMepA29jbXKl0chBSiHY0Yveul3PNtiZUjnb065GOji4aEI
 HQaLhR5qoQjG4VLGMChyDumB3mDwM/zM+6SsjI04=
Date: Mon, 24 Jun 2019 13:23:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
Message-ID: <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
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

T24gTW9uLCAyNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI0
LzA2LzIwMTkgMTk6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1vbiwgMjQg
SnVuIDIwMTksIExhcnMgS3VydGggd3JvdGU6Cj4gPiBJIHRoaW5rIHdlIGFsbCBhZ3JlZSBieSBu
b3cgdGhhdCBtYWludGFpbmluZyB1cC10by1kYXRlIGRvY3Mgb24gdGhlIHdpa2kKPiA+IGFuZCBr
ZWVwaW5nIHRoZW0gaW4gc3luYyB3aXRoIGNvZGUgY2hhbmdlcyBpcyBoYXJkLiBJIHNlZSBtb3Zp
bmcgdGhpbmdzCj4gPiBmcm9tIHRoZSB3aWtpIHRvIHhlbi5naXQgYXMgYSBncmVhdCBpbXByb3Zl
bWVudC4gV2UgaGF2ZSBhIGZldyBYZW4gb24KPiA+IEFSTSBkb2NzIHRoYXQgYXJlIHdvcnRoIGlt
cG9ydGluZyBmcm9tIHRoZSB3aWtpOgo+ID4gCj4gPiBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9YZW5fQVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucwo+IAo+IEkgYWdy
ZWUgZm9yIHRoaXMgYnV0IC4uLgo+IAo+ID4gCj4gPiBBbmQgYWxsIHRoZSBib2FyZCBzcGVjaWZp
YyBkb2NzIGxpbmtlZCBmcm9tIGl0LCBzdWNoIGFzOgo+ID4gCj4gPiBodHRwczovL3dpa2kueGVu
cHJvamVjdC5vcmcvd2lraS9YZW5fQVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9x
ZW11LXN5c3RlbS1hYXJjaDY0Cj4gPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9Y
ZW5fQVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9GYXN0TW9kZWxzCj4gPiBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9IaUtleTk2MAo+IAo+IC4uLiBJIHRoaW5rIGl0
IGlzIGEgcHJldHR5IGJhZCBpZGVhIHRvIGltcG9ydCBib2FyZCBzcGVjaWZpYyBkb2NzLiBUaGVy
ZSAKPiBhcmUgYSBsb3Qgb2Ygd2F5IHRvIGJ1aWxkIGNvbXBvbmVudHMgZm9yIGEgZ2l2ZW4gYm9h
cmQgYW5kIEkgYW0gd29ycnkgb2YgCj4gdGhlIG92ZXJoZWFyZCBmb3IgdGhlIG1haW50YWluZXJz
IHRvIGxvb2svbWFpbnRhaW4gdGhlIGRvY3VtZW50YXRpb24uIEl0IAo+IGFsc28gYnJpbmdzIHRo
ZSBxdWVzdGlvbiBvZiB0aGUgYWNjZXB0YW5jZS9yZW1vdmFsIG9mCj4gYSBib2FyZCBkb2N1bWVu
dGF0aW9uLgoKVGhhdCBwcm9ibGVtIGNhbiBiZSBzb2x2ZWQgYnkgc3BlY2lmeWluZyBhbiBhcHBy
b3ByaWF0ZSBtYWludGVuYW5jZQptb2RlbCBmb3IgdGhvc2UgZG9jdW1lbnRzLgoKCj4gSW5zdGVh
ZCB3ZSBzaG91bGQgcHJvdmlkZSBnZW5lcmljIGd1aWRhbmNlL3Ryb3VibGVzaG9vdCB0byB0aGUg
dXNlci4gCj4gQW55dGhpbmcgYm9hcmQgc3BlY2lmaWMgY291bGQgYmUgbWFpbnRhaW4gb24gdGhl
IHdpa2kgYnkgc29tZW9uZSBjYXJpbmcgCj4gYWJvdXQgdGhlIGJvYXJkIHdpdGhvdXQgaGF2aW5n
IHVzIHRvIGdhdGUgaXQuCgpJZiB3ZSBtb3ZlIHRoZSBkb2NzIHRvIHhlbi5naXQgaXQgZG9lc24n
dCBpbW1lZGlhdGVseSBpbXBseSB0aGF0IHRoZQpSRVNUIG1haW50YWluZXJzIG5lZWQgdG8gImdh
dGUiIHRoZW0uIFdlIGNvdWxkIG1ha2UgdGhlIGV4aXN0aW5nCmN1cmF0b3JzIG9mIHRob3NlIHBh
Z2VzIHRoZSBtYWludGFpbmVycyBmb3IgdGhvc2UgZmlsZXMsIGZvciBleGFtcGxlLiBXZQpjYW4g
Y29tZSB1cCB3aXRoIG1vZGUgaWRlYXMuIFdlIGNvdWxkIGV2ZW4gbGVhdmUgdGhlbSB1bm1haW50
YWluZWQuCgpUaGUgcG9pbnQgaGVyZSBpcyB0aGF0IHdlIGNhbiBiZSBmbGV4aWJsZSBhbmQgY3Jl
YXRpdmUgYWJvdXQgdGhlIHdheSB0bwptYWludGFpbiB0aGUgZG9jcyBvbiB4ZW4uZ2l0LiBCdXQg
YXMgYSB0ZWNobm9sb2d5IGlzIGNlcnRhaW5seSBiZXR0ZXIKdGhhbiB0aGUgd2lraTogd2UgZG9u
J3QgaGF2ZSB0byBrZWVwIHRoZW0gYWxsIHVwLXRvLWRhdGUgd2l0aCB0aGUgY29kZSwKYnV0IGF0
IGxlYXN0IHRoaXMgd2F5IHdlIGhhdmUgYSBjaGFuY2UgKGlmIHdlIHdhbnQgdG8pLiBJZiB3ZSBs
ZWF2ZSB0aGVtCm9uIHRoZSB3aWtpLCB0aGVyZSBpcyBubyBjaGFuY2UuCgoKPiBXZSBjb3VsZCB0
cnkgdG8gcmV2aXZlIGEgZGlzY3Vzc2lvbiB3ZSBoYWQgYSBjb3VwbGUgb2YgeWVhcnMgYWdvIHdo
ZXJlIAo+IHNvbWVvbmUgaXMgcmVzcG9uc2libGUgZm9yIGEgZ2l2ZW4gYm9hcmQgdG8gdGVzdCBh
bmQgZG9jdW1lbnQgaXQuIFRvZGF5IAo+IGl0IGlzIGluZm9ybWFsLCBidXQgSSBoYXZlIGJlZW4g
cHVzaGluZyBmb3IgaXQgcmVjZW50bHkgZm9yIG5ldyBib2FyZHMuCgpZZXMsIHRoaXMgaXMgYSBn
b29kIGlkZWEgYW5kIGZpdCBuaWNlbHkgd2l0aCB0aGUgbWFpbnRlbmFuY2UgbW9kZWwgSQp3YXMg
c3VnZ2VzdGluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
