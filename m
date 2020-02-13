Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3D15BCDD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:32:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BlN-0000yt-9y; Thu, 13 Feb 2020 10:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2BlL-0000yn-MN
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:30:27 +0000
X-Inumbo-ID: d9d25050-4e4b-11ea-b0fd-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9d25050-4e4b-11ea-b0fd-bc764e2007e4;
 Thu, 13 Feb 2020 10:30:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2BlK-0004q0-AG; Thu, 13 Feb 2020 10:30:26 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2BlK-0008Sz-19; Thu, 13 Feb 2020 10:30:26 +0000
Date: Thu, 13 Feb 2020 10:30:23 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200213103023.hzen7babuqh7dmvo@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
 <20200212165354.GQ4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212165354.GQ4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/4] x86/hyperv: misc cleanup
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6NTM6NTRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEZlYiAxMiwgMjAyMCBhdCAwNDowOToxNVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gQ2hhbmdlIGh2X3ZwX2luZGV4IHRvIHVzZSB1aW50MzJfdCBiZWNhdXNl
IHRoYXQgaXMgd2hhdCBpcyBkZWZpbmVkIGluIFRMRlMuCj4gPiAKPiA+IEFkZCAiX2FkZHIiIHN1
ZmZpeCB0byBodl9kb19yZXBfaHlwZXJjYWxsJ3MgcGFyYW1ldGVycy4KPiAKPiBCZWluZyBvZiB0
eXBlIHBhZGRyX3QgSSdtIHVuc3VyZSB0aGUgX2FkZHIgc3VmZml4IGFkZHMgYW55IHZhbHVlIHRv
Cj4gdGhlIG5hbWUuCj4gCgpBbmRyZXcgYXNrZWQgdXMgdG8gYWRkIHRoYXQgcHJlZml4IGZvciBo
dl9kb19oeXBlcmNhbGwuIEkgZGlzY292ZXJlZCB0aGUKc2FtZSB0aGluZyBzaG91bGQndmUgYmVl
biBkb25lIGZvciBodl9kb19yZXBfaHlwZXJjYWxsIGFzIHdlbGwuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
