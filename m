Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13D4EBFD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:29:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLRM-0006B2-NI; Fri, 21 Jun 2019 15:27:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmcb=UU=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1heLRL-0006Ai-DK
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:26:59 +0000
X-Inumbo-ID: 014ae4c7-9439-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 014ae4c7-9439-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 15:26:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2F0043016E74; Fri, 21 Jun 2019 18:26:56 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 90A56306E4AC;
 Fri, 21 Jun 2019 18:26:55 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
References: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhnyFohstOVKZT6+AA4kLDXUaQ2WpKtfB4v+tzU3TEhGaw@mail.gmail.com>
 <5D0CF49F020000780023A3B6@prv1-mh.provo.novell.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ab133b96-3d3b-1dab-7c57-3651acc38f8d@bitdefender.com>
Date: Fri, 21 Jun 2019 18:26:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D0CF49F020000780023A3B6@prv1-mh.provo.novell.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH RESEND] MAINTAINERS: hand over vm_event
 maintainership
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, aisaila@bitdefender.com,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yMS8xOSA2OjE1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4wNi4xOSBh
dCAxNzoxMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBPbiBUaHUsIEp1biAxMywg
MjAxOSBhdCA4OjAxIEFNIFJhenZhbiBDb2pvY2FydQo+PiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVy
LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gUmVtb3ZlIG15c2VsZiBhcyB2bV9ldmVudCBtYWludGFuZXIs
IGFkZCBBbGV4YW5kcnUgYW5kIFBldHJlIGFzCj4+PiBCaXRkZWZlbmRlciB2bV9ldmVudCBtYWlu
dGFpbmVycy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+Cj4gCj4gSSdsbCB0YWtlIHRoZSBsaWJlcnR5IGFuZCBhcHBseSB0aGlz
IHRvIHRoZSByZXZpc2VkIChkZXNpZ25hdGVkIHJldmlld2VyKQo+IGFkZGl0aW9ucy4KCklmIHlv
dSBtZWFuIHJlbW92aW5nIG15IGVtYWlsIGFkZHJlc3MgZnJvbSB0aGUgbWFpbnRhaW5lcnMgbGlz
dCwgdGhhdCdzIApmaW5lIHdpdGggbWUsIHVubGVzcyAoYXMgcHJldmlvdXNseSBkaXNjdXNzZWQg
aW4gcHJpdmF0ZSB3aXRoIEdlb3JnZSBhbmQgClRhbWFzKSBteSBzdGVwcGluZyBkb3duIGF0IHRo
aXMgcG9pbnQgd291bGQgcHV0IHVuZHVlIHN0cmVzcyBvbiB0aGUgeDg2IAovIG1tIG1haW50YWlu
ZXJzLCBpbiB3aGljaCBjYXNlIEkgY2FuIGNvbnRpbnVlIGhlbHBpbmcgdGhyb3VnaCB0aGUgCnRy
YW5zaXRpb24gcGhhc2UgKGFsdGhvdWdoIHVuZm9ydHVuYXRlbHkgbXVjaCBsZXNzIHByb21wdGx5
IHRoYW4gYmVmb3JlKS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
