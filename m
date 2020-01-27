Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A414AA9A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 20:39:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwAC5-0007rw-TS; Mon, 27 Jan 2020 19:37:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwAC4-0007rr-3G
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 19:37:08 +0000
X-Inumbo-ID: 674cacb8-413c-11ea-acc1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 674cacb8-413c-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 19:37:07 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwAC2-0001xY-JE; Mon, 27 Jan 2020 19:37:06 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwAC1-000596-QL; Mon, 27 Jan 2020 19:37:06 +0000
Date: Mon, 27 Jan 2020 19:37:02 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200127193702.4m3kj5afpxdvsp35@debian>
References: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
 <07c64009-35cd-39ff-2e02-baf12584e661@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07c64009-35cd-39ff-2e02-baf12584e661@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [Vote] Approve hypervisor project check-in policy
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDM6Mjc6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMDEuMjAyMCAxNToxMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+IEkgaGF2
ZSBkcmFmdGVkIGFuIGV4cGxpY2l0IHBvbGljeSBvbiB3aGF0IGlzIChnZW5lcmFsbHkpIHJlcXVp
cmVkIHRvCj4gPiBjaGVjayBhIHBhdGNoIGluLiAgSXQncyBiZWVuIHRocm91Z2ggc2V2ZXJhbCBy
b3VuZHMsIGFuZCB2NCBoYXMgYmVlbgo+ID4gYWNrZWQgWzFdLgo+ID4gCj4gPiBJJ3ZlIGhhZCBp
bmZvcm1hbCBhc3NlbnQgZnJvbSBhbGwgY29tbWl0dGVycywgYnV0IGp1c3QgdG8gZG90IGFsbCBv
dXIKPiA+IGkncyBhbmQgY3Jvc3MgYWxsIG91ciB0J3MsIGl0J3MgcHJvYmFibHkgd29ydGggaGF2
aW5nIGEgdm90ZSBvZiB0aGUKPiA+IGNvbW1pdHRlcnMsIGluIGxpbmUgd2l0aCB0aGUgWGVuUHJv
amVjdCBnb3Zlcm5hbmNlIHBvbGljeSBbMV0uCj4gPiAKPiA+IFBsZWFzZSByZXNwb25kIGJ5IDEw
IEZlYnJ1YXJ5IHdpdGggeW91ciB2b3RlOgo+ID4gKzE6IGZvciBwcm9wb3NhbAo+ID4gLTE6IGFn
YWluc3QgcHJvcG9zYWwKPiA+IGluIHB1YmxpYyBvciBwcml2YXRlLgo+IAo+ICsxCj4gCj4gQXMg
YW4gYXNpZGUsIEkgbm90aWNlIHlvdSBtYXkgd2FudCB0byB1cGRhdGUgeW91ciBhZGRyZXNzIGJv
b2suIEkndmUKPiBjb3JyZWN0ZWQgV2VpJ3MgYW5kIEp1bGllbidzIGVtYWlsIGFkZHJlc3Nlcy4K
ClRoYW5rcy4KCisxIHRvIHRoaXMgcHJvcG9zYWwuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
