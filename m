Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6EFC563
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:32:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDIy-0005zR-8H; Thu, 14 Nov 2019 11:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVDIw-0005zM-G0
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 11:28:50 +0000
X-Inumbo-ID: ec778bec-06d1-11ea-a249-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec778bec-06d1-11ea-a249-12813bfff9fa;
 Thu, 14 Nov 2019 11:28:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1DE1ADCB;
 Thu, 14 Nov 2019 11:28:46 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
Date: Thu, 14 Nov 2019 12:29:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] wall clock drift on Coffee Lake / C24x mainboard
 (HPET broken?), best practices
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAwMDoxMCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IEkgY2FtZSBhY3Jv
c3MgdGhlIGZvbGxvd2luZzogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOC8yOS81MzYKPiAK
PiBDb3VsZCB0aGF0IGJlIHRoZSByZWFzb24gZm9yIHRoZSBwcm9ibGVtIG1lbnRpb25lZCBiZWxv
dz8gWGVuIGlzIHVzaW5nIAo+IEhQRVQgYXMgY2xvY2tzb3VyY2Ugb24gdGhlIHBsYXRmb3JtL21h
aW5ib2FyZC4gSXMgdGhlcmUgYW4gKGVhc3kpIHdheSB0byAKPiB2ZXJpZnkgaWYgWGVuIHVzZXMg
UEMxMD8KCkluIHByaW5jaXBsZSB0aGlzIGNhbiBiZSBvYnRhaW5lZCB2aWEgYm90aCB0aGUgeGVu
cG0gdXRpbGl0eSBhbmQKdGhlICdjJyBkZWJ1ZyBrZXkuIEZvciBDb2ZmZWUgTGFrZSwgaG93ZXZl
ciwgSSBjYW4ndCBmaW5kIGFueQppbmRpY2F0aW9uIGluIHRoZSBTRE0gdGhhdCBhIFBDMTAgcmVz
aWRlbmN5IE1TUiB3b3VsZCBleGlzdC4KSGVuY2UgSSBjYW4gb25seSBzdWdnZXN0IHRoYXQgeW91
IHRyeSBhZ2FpbiB3aXRoIGxpbWl0ZWQgb3Igbm8KdXNlIG9mIEMgc3RhdGVzLCB0byBhdCBsZWFz
dCBnZXQgYSBoaW50IGFzIHRvIGEgcG9zc2libGUKY29ubmVjdGlvbi4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
