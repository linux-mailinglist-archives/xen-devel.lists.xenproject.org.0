Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E5213AF
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 08:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRWE7-0007aN-H5; Fri, 17 May 2019 06:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRWE6-0007aI-BZ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 06:20:18 +0000
X-Inumbo-ID: d3ae9118-786b-11e9-b67f-0700fac8357f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3ae9118-786b-11e9-b67f-0700fac8357f;
 Fri, 17 May 2019 06:20:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 00:20:11 -0600
Message-Id: <5CDE5296020000780022FEC9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 00:20:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ian Jackson" <ian.jackson@citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
 <23773.36372.890326.392603@mariner.uk.xensource.com>
In-Reply-To: <23773.36372.890326.392603@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE4OjIxLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gU29ycnksIGJ1dCBJIHRoaW5rIGl0IG1heSBiZSBiZXN0IHRvIHdhaXQuICBJJ20gb3BlbiB0
byBiZWluZwo+IHBlcnN1YWRlZC4uLgoKT2theSAtIGFzIGFsc28gaW5kaWNhdGVkIG9uIGlyYywg
d2l0aCB0aGUgd2Vla2VuZCBpbiBiZXR3ZWVuIGFuZAp3aXRoIHRoZSBtb3N0IHJlY2VudCBmbGln
aHQgaGF2aW5nIGZhaWxlZCBhbnl3YXkgaXQgc2hvdWxkbid0IGJlCnRvbyBtdWNoIG9mIGFuIGV4
dHJhIGRlbGF5LiBZZXQgdG8gYmUgaG9uZXN0IC0gbW9zdCBvciBhbGwgb2YgdGhlc2UKc2hvdWxk
IGhhdmUgYmVlbiByZXF1ZXN0ZWQgYW5kIGNvbW1pdHRlZCBzZXZlcmFsIHdlZWtzIGFnbywKc29v
biBhZnRlciB0aGUgbWFpbCBhdCB0aGUgcm9vdCBvZiB0aGlzIHRocmVhZCB3YXMgc2VudC4gSSB3
b25kZXIKaWYgSSBuZWVkIHRvIGFkZCBhIGhhcmQgY3V0LW9mZiBkYXRlIHRvIHRoZXNlIGluaXRp
YXRvciBtYWlscyB0aGF0IEkKc2VuZC4gSSdkIHByZWZlciBub3QgdG8sIG5vdCB0aGUgbGVhc3Qg
YmVjYXVzZSBvZiB1bmZvcmVzZWVuCmlzc3VlcyBsaWtlIHRoZSByZWNlbnQgbW9udGgtbG9uZyAo
b3IgbW9yZT8pIG9zc3Rlc3Qgc3RhbGwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
