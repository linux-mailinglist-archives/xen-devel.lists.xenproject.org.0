Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D9486DE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctPc-0005nw-SP; Mon, 17 Jun 2019 15:19:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hctPb-0005nm-1I
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:19:11 +0000
X-Inumbo-ID: 4127f779-9113-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4127f779-9113-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 15:19:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 09:19:08 -0600
Message-Id: <5D07AF680200007800238DC3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 09:19:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "George Dunlap" <George.Dunlap@eu.citrix.com>,
 "Baodong Chen" <chenbaodong@mxnavi.com>,
 "Dario Faggioli" <dfaggioli@suse.com>
References: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDA1OjE4LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gVGh1cywgc2l6ZW9mKHN0cnVjdCBjcHVwb29sKSB3aWxsIHNhdmUgOCBieXRlcyBmb3IgNjQt
Yml0IHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25n
QG14bmF2aS5jb20+Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkkndmUganVz
dCBub3RpY2VkIHRoYXQgdGhpcyBmaWxlIGlzbid0IHBhcnQgb2YgdGhlIFNDSEVEVUxJTkcKbWFp
bnRhaW5lciBncm91cC4gVGhlcmVmb3JlCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSSdtIHdvbmRlcmluZyB0aG91Z2ggd2hldGhlciBtYWludGFpbmVyc2hpcCBv
ZiB0aGUgZmlsZSBzaG91bGRuJ3QgYmUKYWRqdXN0ZWQsIHByZWZlcmFibHkgYnkgbW92aW5nIHRo
aXMgKHN1cHBvc2VkbHkgcHJpdmF0ZSkgaGVhZGVyIGludG8KeGVuL2NvbW1vbi8uIEkgcmVhbGl6
ZSB0aGVyZSBtYXkgYmUgc29tZSBmdXJ0aGVyIGNsZWFudXAgbmVlZGVkCmZvciB0aGlzIHRvIGFj
dHVhbGx5IGJlIHBvc3NpYmxlLiBJZiB0aGVyZSB3YXMgZ2VuZXJhbCBjb25zZW5zdXMgYWJvdXQK
c3VjaCBhIHN0ZXAsIEkgY291bGQgc2VlIGFib3V0IGFjdHVhbGx5IGNhcnJ5aW5nIGl0IG91dC4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
