Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4CC150B6A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:27:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeXZ-0000sj-Pt; Mon, 03 Feb 2020 16:25:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyeXY-0000sa-AE
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:25:36 +0000
X-Inumbo-ID: ce297e92-46a1-11ea-8e76-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce297e92-46a1-11ea-8e76-12813bfff9fa;
 Mon, 03 Feb 2020 16:25:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98DD2AE1A;
 Mon,  3 Feb 2020 16:25:34 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580746020.git.tamas.lengyel@intel.com>
 <ae672a868ab7ac879a6809b6909422f996d58f60.1580746020.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab3a7c5d-4684-db5e-becd-549469f532d8@suse.com>
Date: Mon, 3 Feb 2020 17:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ae672a868ab7ac879a6809b6909422f996d58f60.1580746020.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 4/7] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNzoxMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFdoZW4gcGx1Z2dp
bmcgYSBob2xlIGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJt
aXNzaW9uCj4gcmV0dXJuZWQgYnkgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzIGFzIGl0IGlzIG5vbi1z
ZW5zaWNhbCAocDJtX2FjY2Vzc19uKSBpbgo+IHRoZSB1c2UtY2FzZSBhZGRfdG9fcGh5c21hcCB3
YXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBpbi4gSXQgbGVhZHMgdG8gdm1fZXZlbnRzCj4gYmVpbmcg
c2VudCBvdXQgZm9yIGFjY2VzcyB2aW9sYXRpb25zIGF0IHVuZXhwZWN0ZWQgbG9jYXRpb25zLiBN
YWtlIHVzZSBvZgo+IHAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZCBhbmQgZG9jdW1lbnQgdGhl
IGFtYmlndWl0eSBzdXJyb3VuZGluZyAiaG9sZSIKPiB0eXBlcyBhbmQgY29ybmVyLWNhc2VzIHdp
dGggY3VzdG9tIG1lbV9hY2Nlc3MgYmVpbmcgc2V0IG9uIGhvbGVzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiAtLS0KPiB2NzogYWRkIGRldGFp
bGVkIGNvbW1lbnQgZXhwbGFpbmluZyB0aGUgaXNzdWUgYW5kIHdoeSB0aGlzIGZpeCBpcyBjb3Jy
ZWN0CgpUaGFua3MgZm9yIHRoaXMgYWRkaXRpb24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
