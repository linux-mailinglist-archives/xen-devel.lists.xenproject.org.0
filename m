Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17DB8517F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:56:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvPC1-0007zd-SP; Wed, 07 Aug 2019 16:53:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvPC0-0007zY-W3
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:53:41 +0000
X-Inumbo-ID: e803245d-b933-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e803245d-b933-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:53:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13EB344;
 Wed,  7 Aug 2019 09:53:39 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307233F694;
 Wed,  7 Aug 2019 09:53:39 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908070942410.2451@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6f5b1d04-8c39-eb0b-da12-544506008d4e@arm.com>
Date: Wed, 7 Aug 2019 17:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908070942410.2451@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: unbreak arm64 build for older
 toolchains
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
Cc: Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA3LzA4LzIwMTkgMTc6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBDb21taXQgNDk0MWJmYiAieGVuL2FybTY0OiBtYWNyb3M6IEludHJvZHVjZSBhbiBhc3Nl
bWJseSBtYWNybyB0byBhbGlhcwo+IHgzMCIgbW92ZWQKPiAKPiAgICBsciAgICAgIC5yZXEgICAg
eDMwCj4gCj4gdG8gbWFjcm9zLmguIEEgbGF0ZXIgcGF0Y2ggKDEzOTZkYWIgInhlbi9hcm02NDog
aGVhZDogRG9uJ3QgY2xvYmJlcgo+IHgzMC9sciBpbiB0aGUgbWFjcm8gUFJJTlQiKSBzdGFydGVk
IHRvIHVzZSAibHIiIGluIGhlYWQuUywgaG93ZXZlciwgaXQKPiBkaWRuJ3QgYWRkIGFuICNpbmNs
dWRlIG1hY3Jvcy5oIHRvIGhlYWQuUy4gVGhpcyBjb21taXQgZml4ZXMgaXQuCj4gCj4gVGhlIGxh
Y2sgb2YgYWxpYXMgYnJlYWtzIHRoZSBidWlsZCB3aXRoCj4gZ2NjLWxpbmFyby01LjMuMS0yMDE2
LjA1LXg4Nl82NF9hYXJjaDY0LWxpbnV4LWdudS4gVGhlIGFsaWFzIHdhcyBhZGRlZAo+IGxhdGVy
IHRvIGJpbnV0aWxlcyAyLjI5IGluIDIwMTcuCgpOSVQ6IGJpbnV0aWxlcy9iaW51dGlscy8KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
PgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
