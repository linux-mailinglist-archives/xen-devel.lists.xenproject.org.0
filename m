Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F521152E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM6rc-0007mI-S6; Thu, 02 May 2019 08:14:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM6rb-0007mD-03
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:14:43 +0000
X-Inumbo-ID: 558ed98c-6cb2-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 558ed98c-6cb2-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 08:14:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 02:14:40 -0600
Message-Id: <5CCAA6ED020000780022B0AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 02:14:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org><cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
In-Reply-To: <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
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

Pj4+IE9uIDAxLjA1LjE5IGF0IDEzOjE3LCA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4g
V2UgYXBwZWFyIHRvIGhhdmUgaW1wbGVtZW50ZWQgYSBtZW1jcHkoKSBpbiB0aGUgbG93LW1lbW9y
eSB0cmFtcG9saW5lCj4gd2hpY2ggd2UgdGhlbiBjYWxsIGludG8gZnJvbSBfX3N0YXJ0X3hlbigp
LCBmb3Igbm8gYWRlcXVhdGVseSBkZWZpbmVkCj4gcmVhc29uLgoKTWF5IEkgc3VnZ2VzdCB0aGF0
IGluIGNhc2VzIGxpa2UgdGhpcyB5b3UgbG9vayBhdCB0aGUgY29tbWl0CmludHJvZHVjaW5nIHRo
ZSBmdW5jdGlvbj8gSXQgc3VwcGxpZXMgYSByZWFzb246CgoiQWRkIGEgbmV3IHJhdyBlODIwIHRh
YmxlIGZvciBjb21tb24gcHVycG9zZSBhbmQgY29weSB0aGUgQklPUyBidWZmZXIKIHRvIGl0LiBE
b2luZyB0aGUgY29weWluZyBpbiBhc3NlbWJseSBhdm9pZHMgdGhlIG5lZWQgdG8gZXhwb3J0IHRo
ZQogc3ltYm9scyBmb3IgdGhlIEJJT1MgRTgyMCBidWZmZXIgYW5kIG51bWJlciBvZiBlbnRyaWVz
LiIKCkkgaGF2ZSB0byBhZG1pdCB0aGF0IEkgc2VlIHZhbHVlIGluIHRoaXMsIGFzIGl0IGF2b2lk
cyBpbnRyb2R1Y3Rpb24Kb2Ygd3JvbmcgYWNjZXNzZXMgdG8gdGhlc2UgdmFyaWFibGVzLiBUaGVy
ZWZvcmUgSSdkIGxpa2UgdG8gYXNrCmZvciBiZXR0ZXIganVzdGlmaWNhdGlvbiBvZiB0aGUgY2hh
bmdlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
