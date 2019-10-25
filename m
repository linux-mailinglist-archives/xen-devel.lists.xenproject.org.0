Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC3E4EB4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:14:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0KC-0000Rn-P4; Fri, 25 Oct 2019 14:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO0KB-0000Rh-Su
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:12:19 +0000
X-Inumbo-ID: 718aec80-f731-11e9-94ca-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 718aec80-f731-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 14:12:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D624BBAE3;
 Fri, 25 Oct 2019 14:12:13 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4594707-7c0f-e5d5-c4fa-c1fb9fb3a13a@suse.com>
Date: Fri, 25 Oct 2019 16:12:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAwNTo0NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IERvIG5vdCByZXF1aXJlIHN3aXRjaGluZyBwYWdlIHRhYmxlcyB0byBhY2Nlc3MgKHN0YXRpYykg
aW5mb3JtYXRpb24gaW4KPiB0aGUgcnVudGltZSBzZXJ2aWNlcyB0YWJsZSBpdHNlbGYsIHVzZSBk
aXJlY3RtYXAgZm9yIHRoaXMuIFRoaXMgYWxsb3dzCj4gZXhpdGluZyBlYXJseSBmcm9tIFhFTl9F
RklfcXVlcnlfY2Fwc3VsZV9jYXBhYmlsaXRpZXMsCj4gWEVOX0VGSV91cGRhdGVfY2Fwc3VsZSBh
bmQgWEVOX0VGSV9xdWVyeV92YXJpYWJsZV9pbmZvIChpbiBjYXNlIG9mIG5vdAo+IHN1cHBvcnRl
ZCBjYWxsKSB3aXRob3V0IGFsbCB0aGUgaW1wYWN0IG9mIHBhZ2UgdGFibGUgc3dpdGNoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBcyBzYWlkIEkgd291bGQgaGF2ZSBwcmVmZXJyZWQgdGhpcyB0byBiZSBwYXRj
aCAxIG9mIHRoZSBzZXJpZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
