Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F658165CF0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:47:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kHI-0000nP-6D; Thu, 20 Feb 2020 11:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kHH-0000nD-4X
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:45:59 +0000
X-Inumbo-ID: 8fa8e1ca-53d6-11ea-850a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fa8e1ca-53d6-11ea-850a-12813bfff9fa;
 Thu, 20 Feb 2020 11:45:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kHF-0007HE-Vd; Thu, 20 Feb 2020 11:45:57 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kHF-0008JO-LH; Thu, 20 Feb 2020 11:45:57 +0000
Date: Thu, 20 Feb 2020 11:45:55 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220114555.7776yxl4omw5o6w3@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/5] libxl/PCI: reserved device memory
 adjustments
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDQ6NDQ6MTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgcGxheWluZyB3aXRoIHRoaXMsIEkndmUgbm90aWNlZCBhIG51bWJlciBvZiBp
c3N1ZXMsCj4gc29tZSBhY3R1YWwgYnVncywgc29tZSBtZXJlbHkgY29zbWV0aWMgKGF0IGxlYXN0
IGF0IHRoaXMgcG9pbnQKPiBpbiB0aW1lLiBUaGlzIGlzIHRoZSBjb2xsZWN0aW9uIG9mIGFkanVz
dG1lbnRzIG1hZGUsIHdpdGggYnVnCj4gZml4ZXMgZmlyc3QuCgpJIHdpbGwgbGVhdmUgY29tbWl0
dGluZyB0aGlzIHNlcmllcyB0byB5b3UgYmVjYXVzZSB5b3VyIHBhdGNoZXMgZG9uJ3QKc2VlbSB0
byB3b3JrIHdpdGggZ2l0LWFtLgoKSW4gYW55IGNhc2UsIHBsZWFzZSBhbGxvdyBzb21lIHRpbWUg
Zm9yIEFudGhvbnkgYW5kIElhbiB0byBjb21tZW50IG9uCnRoaXMgc2VyaWVzLgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
