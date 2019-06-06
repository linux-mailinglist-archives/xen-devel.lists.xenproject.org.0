Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B538092
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 00:25:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZ0lH-0002oo-Vy; Thu, 06 Jun 2019 22:21:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pv7B=UF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hZ0lG-0002oj-PG
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 22:21:30 +0000
X-Inumbo-ID: 6dd7cb46-88a9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6dd7cb46-88a9-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 22:21:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E06B52064A;
 Thu,  6 Jun 2019 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559859688;
 bh=aOaz7nQkOCz19CSE5Qs/4ZADeNzaykyK5Xs7x3wcJmY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=j8RjwK47OqcmlTSyq/Tq3FYAws1LNJNiw/oIjqG4ciEHC5YOJfGVwuPHUdWMZU06a
 +BZPr6wo0FP72eZDM/cVZBAN0YAXX/YxsdH0Bj6mfh5qYQiqQcRiF8OmfwVbDi71kl
 /R1WLR+zpKRz/EMMQjv39G4Ph/s1l+BT7/iY2FbM=
Date: Thu, 6 Jun 2019 15:21:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fc26793a-9af5-ac4d-6b39-cec4dba34270@arm.com>
Message-ID: <alpine.DEB.2.21.1906061359010.10214@sstabellini-ThinkPad-T480s>
References: <osstest-136184-mainreport@xen.org>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
 <7af8e9d1-6f60-f3b4-9201-2b84f1cf6886@arm.com>
 <alpine.DEB.2.21.1906041508520.14041@sstabellini-ThinkPad-T480s>
 <986b7bb5-f223-f91a-ddc5-96dc3ee69b17@arm.com>
 <alpine.DEB.2.21.1906051313570.14041@sstabellini-ThinkPad-T480s>
 <8acdb27d-dd3b-44af-5763-efbad3c1b554@arm.com>
 <5CF8D1EA0200007800235CBF@prv1-mh.provo.novell.com>
 <fc26793a-9af5-ac4d-6b39-cec4dba34270@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA2IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDYvMDYvMjAxOSAw
OTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiBPbiAwNS4wNi4xOSBhdCAyMzozOCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+ID4gT24gNi81LzE5IDk6MjkgUE0sIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBNeSB2b3RlIGlzIHRvIGJhY2twb3J0IHRv
IGJvdGguIEphbi9vdGhlcnMgcGxlYXNlIGV4cHJlc3MgeW91ciBvcGluaW9uLgo+ID4gPiAKPiA+
ID4gVG8gZm9sbG93IHRoZSB2b3RlIGNvbnZlbnRpb246Cj4gPiA+IAo+ID4gPiA0LjExOiAtMQo+
ID4gCj4gPiBIbW0sIEknbSBzdXJwcmlzZWQgYnkgdGhpcy4gRGlkbid0IEkgc2VlIHlvdSBtZW50
aW9uIHRvIElhbiAob24gaXJjKQo+ID4geW91J2QgcHJlZmVyIGJhY2twb3J0aW5nIG92ZXIgd29y
a2luZyBhcm91bmQgdGhpcyBpbiBvc3N0ZXN0Pwo+IAo+IE15IG1pc3Rha2UgaGVyZS4gSXQgc2hv
dWxkIGJlICsxIGhlcmUuCj4KPiA+ID4gNC4xMDogLTEgKEkgd2FzIHRlbXB0ZWQgYnkgYSAtMiBi
dXQgaWYgdGhlIG90aGVyIGZlZWxzIGl0IHNob3VsZCBiZQo+ID4gPiBiYWNrcG9ydGVkIHRoZW4g
SSB3aWxsIG5vdCBwdXNoIGJhY2spLgo+ID4gCj4gPiBDb25zaWRlcmluZyB0aGUgc2l0dWF0aW9u
LCBJJ20gbGVhbmluZyB0b3dhcmRzIEp1bGllbidzIG9waW5pb24gaGVyZS4KPiA+IEJ1dCB0YWtl
IHRoaXMgd2l0aCBjYXJlIC0gSSBoYXZlIHdheSB0b28gbGl0dGxlIGluc2lnaHQgdG8gaGF2ZSBh
Cj4gPiBtZWFuaW5nZnVsIG9waW5pb24uCgpBbGwgcmlnaHQuIEkgYmFja3BvcnRlZCB0aGUgcGF0
Y2ggdG8gc3RhZ2luZy00LjExIG9ubHkuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
