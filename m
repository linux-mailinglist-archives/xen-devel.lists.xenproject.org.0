Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC986BD6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 22:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvpH3-0000lM-Pp; Thu, 08 Aug 2019 20:44:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvpH3-0000lH-2j
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 20:44:37 +0000
X-Inumbo-ID: 5530ad31-ba1d-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5530ad31-ba1d-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 20:44:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 468772089E;
 Thu,  8 Aug 2019 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565297075;
 bh=eyywsBtdh7GQEVZ3cMRrYsyVWDLe+KH7rlOIYYUwUKc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OnWdjcu/AVaMX22XQfvWpYR9Cta8bIn20M/n+8Y0OZL5EEh2uuhKmYImMzPcy9+yX
 cH4GPpVZJTzccfJvXfn+6dO18KwiETkfKTgk56MFnt8L6QZFPLff/FqVXprTvvgepv
 MNHiUH8XhfhymkISPe9eYiH26so4Oxvp53LZ+Ua8=
Date: Thu, 8 Aug 2019 13:44:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <35a1ab11-5bba-866c-40fc-6366c65317f0@citrix.com>
Message-ID: <alpine.DEB.2.21.1908081342390.22196@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <35a1ab11-5bba-866c-40fc-6366c65317f0@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: George.Dunlap@eu.citrix.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, dfaggioli@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDgvNy8xOSA3OjIy
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBIaSBEYXJpbywgR2VvcmdlLAo+ID4g
Cj4gPiBEb20wbGVzcyB3aXRoIHNjaGVkPW51bGwgaXMgYnJva2VuIG9uIHN0YWdpbmcsIGl0IHNp
bXBseSBoYW5ncyBzb29uCj4gPiBhZnRlciBYZW4gaXMgZmluaXNoZWQgbG9hZGluZyB0aGluZ3Mu
IE15IGltcHJlc3Npb24gaXMgdGhhdCB2Y3B1cyBhcmUKPiA+IG5vdCBhY3R1YWxseSBzdGFydGVk
LiBJIGRpZCBhIGdpdCBiaXNlY3Rpb24gYW5kIGl0IHBvaW50ZWQgdG86Cj4gPiAKPiA+IGNvbW1p
dCBkNTQ1ZjFkNmMyNTE5YTE4M2VkNjMxY2ZjYTdhZmYwYmFmMjlmZGU1IChyZWZzL2Jpc2VjdC9i
YWQpCj4gPiBBdXRob3I6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gPiBE
YXRlOiAgIE1vbiBBdWcgNSAxMTo1MDo1NSAyMDE5ICswMTAwCj4gPiAKPiA+ICAgICB4ZW46IHNj
aGVkOiBkZWFsIHdpdGggdkNQVXMgYmVpbmcgb3IgYmVjb21pbmcgb25saW5lIG9yIG9mZmxpbmUK
PiAKPiBUaGF0J3MgRGFyaW8ncyBwYXRjaCAtLSBEYXJpbywgY2FuIHlvdSB0YWtlIGEgbG9vaz8K
PiAKPiBTdGVmYW5vLCBob3cgdXJnZW50IGlzIGl0IGZvciB0aGluZ3MgdG8gd29yayBmb3IgeW91
IC0tIGkuZS4sIGF0IHdoYXQKPiBwb2ludCBkbyB5b3Ugd2FudCB0byBjb25zaWRlciByZXZlcnRp
bmcgdGhlIHBhdGNoPwoKT2YgY291cnNlLCB3ZSBjYW5ub3QgbWFrZSBhIHJlbGVhc2Ugd2l0aCB0
aGlzIGlzc3VlLiBJIGNhbiBsaXZlIHdpdGggaXQKZm9yIG5vdyBiZWNhdXNlIEkgaGF2ZSBhIHJl
dmVydCBmb3IKZDU0NWYxZDZjMjUxOWExODNlZDYzMWNmY2E3YWZmMGJhZjI5ZmRlNSBhdCB0aGUg
dG9wIG9mIGFsbCBteSB3b3JraW5nCmJyYW5jaGVzIGFuZCB0aGUgcHJvZHVjdGlvbiBicmFuY2hl
cyBhdCBYaWxpbnggYXJlIGJhc2VkIG9uIHRoZSBsYXN0CnJlbGVhc2UuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
