Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672102325F
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 13:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSgRn-0006Ye-S0; Mon, 20 May 2019 11:27:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSgRm-0006YZ-CI
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:27:14 +0000
X-Inumbo-ID: 365aaefd-7af2-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 365aaefd-7af2-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 11:27:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 05:27:11 -0600
Message-Id: <5CE28F0B020000780023090E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 05:27:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
In-Reply-To: <23778.33200.47146.497482@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDEyOjMwLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMS10ZXN0aW5nIHRlc3Rd
IDEzNjM4NTogcmVncmVzc2lvbnMgLSAKPiBGQUlMIik6Cj4+IGZsaWdodCAxMzYzODUgeGVuLTQu
MTEtdGVzdGluZyByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2Mzg1LyAKPj4gCj4+IFJlZ3Jlc3Npb25zIDotKAo+PiAKPj4g
VGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGlu
ZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1x
ZW11dC1kZWJpYW5odm0tYW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMu
IDEzNTY4Mwo+PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1kZWJpYW5odm0taTM4Ni14c20g
MTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEzNTY4Mwo+IAo+IFRoZXNlIGFy
ZSBhIGtub3duIGJ1Zy4gIFRoZSBEZWJpYW4gInN0cmV0Y2giICgic3RhYmxlIikgaTM4NiBrZXJu
ZWwKPiBzaW1wbHkgZG9lcyBub3Qgd29yayB1bmRlciBYZW4gSFZNLiAgSSBkb24ndCB0aG5rIHRo
aXMgaXMgYW55dGhpbmcgdG8KPiBkbyB3aXRoIHRoZSA0LjExIFhlbiBjb21taXRzIHVuZGVyIHRl
c3QgaGVyZS4gIEl0IGlzIGFwcGVhcmluZyBoZXJlIGluCj4gdGhpcyBmbGlnaHQgYmVjYXVzZSBJ
IHJlb3JnYW5pc2VkIHRoZSBhbWQ2NC9pMzg2IHRlc3Qgam9icy4KCkRpZCB0aGlzIHJlb3JnIGlu
Y2x1ZGUgYSBjaGFuZ2UgaW4gdGhlIG5hbWluZyBzY2hlbWU/IEkgYXNrIGJlY2F1c2UKb25seSB0
aGUgbGF0dGVyIG9mIHRoZSB0d28gaW5jbHVkZXMgImkzODYiIGluIHRoZSBuYW1lLCBpLmUuIGJ5
IHRoZQprbm93biB0byBtZSBuYW1pbmcgbW9kZWwgdGhlIGZvcm1lciBvdWdodCB0byB1c2UgYSA2
NC1iaXQgZ3Vlc3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
