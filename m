Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F83C41E34
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 09:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haxwH-0003Ax-7B; Wed, 12 Jun 2019 07:44:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1haxwG-0003As-8Q
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:44:56 +0000
X-Inumbo-ID: f61c9f9a-8ce5-11e9-a66b-37f4114ec096
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f61c9f9a-8ce5-11e9-a66b-37f4114ec096;
 Wed, 12 Jun 2019 07:44:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 01:44:50 -0600
Message-Id: <5D00AD6F0200007800237538@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 01:44:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com> <87wohs6jkz.fsf@epam.com>
In-Reply-To: <87wohs6jkz.fsf@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDIwOjUyLCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+IFZvbG9keW15ciB3YXMgZ29pbmcgdG8gcmVz
ZW5kIHRoZSBzZXJpZXMgd2l0aCBkb2N1bWVudGF0aW9uIChhcyBhCj4+IHNlcGFyYXRlIHBhdGNo
KS4gQnV0IEkgd291bGQgYmUgaGFwcHkgdG8gdGFrZSAjMSBhbmQgIzIgYXNzdW1pbmcgdGhhdAo+
PiBkb2N1bWVudGF0aW9uIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHNlbnQuCj4gCj4gWWVzLCBzb3Jy
eSBmb3IgdGhlIGRlbGF5LiBJJ20gZ29pbmcgdG8gc2VuZCByZXNlbmQgdGhlIHNlcmllcyBzb29u
LiBCdXQKPiBJIGNhbiBzZWUsIHRoYXQgZmlyc3QgdHdvIHBhdGNoZXMgYXJlIGFscmVhZHkgaW4g
dGhlIHN0YWdpbmcgYnJhbmNoLgo+IFNob3VsZCBJIHJlc2VuZCB0aGUgd2hvbGUgc2VyaWVzIGlu
IHRoaXMgY2FzZT8gT3Igc2luZ2xlIHBhdGNoIHdpdGggdGhlCj4gbWlzc2luZyBkb2N1bWVudGF0
aW9uIHdpbGwgYmUgc3VmZmljaWVudD8KCllvdSBzaG91bGQgbmV2ZXIgc2VuZCBwYXRjaGVzIHRo
YXQgaGF2ZSBhbHJlYWR5IGJlZW4gYXBwbGllZC4KCj4gQW5kIGFub3RoZXIsIHNsaWdodGx5IHJl
bGF0ZWQgcXVlc3Rpb246IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIHdpdGggbXkKPiBwYXRjaCB0
byBnZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQuIFNob3VsZCBJIHJlc2VuZCB0aGUgbmV3IHZlcnNp
b24/IEphbgo+IGhhZCBjb21tZW50cyBvbmx5IHRvIGNvbW1pdCBtZXNzYWdlLi4uCgpXZWxsLCBy
ZS1zZW5kaW5nIG1heSBtYWtlIGl0IGVhc2llciwgYnV0IGZpcnN0IG9mIGFsbCB5b3UgbmVlZCB0
bwpnZXQgYSBtYWludGFpbmVyIHRvIGFjayB0aGUgcGF0Y2guIE15IFBlcmwgaXNuJ3QgZ29vZCBl
bm91Z2gKdGhhdCBJIHdvdWxkIGZlZWwgcXVhbGlmaWVkIHRvIGdpdmUgbWluZS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
