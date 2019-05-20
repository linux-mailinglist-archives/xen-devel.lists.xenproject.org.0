Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD32305D
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSeYV-0002xW-SA; Mon, 20 May 2019 09:26:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSeYU-0002xR-Jb
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:26:02 +0000
X-Inumbo-ID: 46e01dce-7ae1-11e9-bb42-8ffd02955657
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46e01dce-7ae1-11e9-bb42-8ffd02955657;
 Mon, 20 May 2019 09:25:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 03:25:57 -0600
Message-Id: <5CE272A1020000780023080E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 03:25:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Viktor Mitin" <viktor.mitin.19@gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
In-Reply-To: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDExOjE3LCA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+ID4gTWVhbiB0aGF0IHJlc3VsdCBvZiAiKGludDY0X3QpdmFkZHIgPj4gNjMiIGNhbiBi
ZSAwIG9yIDEuCj4+ID4gU28gdGhlIG5leHQgY29kZSBtYXkgbm90IHdvcmsgcHJvcGVybHkgaW4g
Y2FzZSBvZiBhbm90aGVyIAo+ICdpbXBsZW1lbnRhdGlvbnMnLgo+PiA+IFdpdGggYW5vdGhlciBj
b21waWxlciAoaS5lLiBjbGFuZywgZXRjKSB0aGlzIGNvZGUgbWF5IGludHJvZHVjZSBidWdzCj4+
ID4gd2hpY2ggYXJlIGhhcmQgdG8gZmluZC4KPj4gPgo+PiA+ICgoaW50NjRfdCl2YWRkciA+PiA0
NykgPT0gKChpbnQ2NF90KXZhZGRyID4+IDYzKQo+PiA+Cj4+ID4gRm9yIHRoaXMgcmVhc29uIGl0
IGlzIGJldHRlciB0byBhdm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUuCj4+Cj4+IFdl
bGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBhd2F5IHdpdGhvdXQgdXNpbmcgaW1wbGVtZW50
YXRpb24KPj4gZGVmaW5lZCBiZWhhdmlvci4gQnV0IEknbSBhZnJhaWQgd2UncmUgcXVpdGUgZmFy
IGZyb20gdGhhdCwgYW5kCj4+IHdlJ2Qgbm90IGFsd2F5cyBiZSB3aWxsaW5nIHRvIGFjY2VwdCB0
aGUgd29yc2Ugc291cmNlIGFuZC9vcgo+PiBiaW5hcnkgY29kZSB0aGF0IHdvdWxkIGJlIG5lZWRl
ZCB0byBhdm9pZCBpdC4KPiAKPiBIb3cgYWJvdXQgdXNpbmcgdGhlIG5leHQgb25lLWxpbmVyIHRv
IGF2b2lkIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSA6Cj4gCj4gLy9SZXR1cm5zIHRydWUg
aW4gY2FzZSB3aGVuIHRoZSB0b3AgbGVmdCAxNyBiaXRzIGFyZSBhbGwgemVybyBvciBhcmUgYWxs
IG9uZQo+IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8fCAoKCh2YWRkciA+PiA0NykmMHgxRkZG
RikgPT0gMHgxRkZGRikpCgpOb3RlIGhvdywgaW4gbXkgZmlyc3QgcmVwbHksIEkgc2FpZCAicHJl
ZmVyYWJseSB3aXRoIGp1c3QgYSBzaW5nbGUgY29tcGFyaXNvbiIuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
