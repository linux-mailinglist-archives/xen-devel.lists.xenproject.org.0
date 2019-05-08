Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3517B91
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 16:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hONbl-0007Ec-Qp; Wed, 08 May 2019 14:31:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hONbk-0007EX-6t
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 14:31:44 +0000
X-Inumbo-ID: ffd83caa-719d-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ffd83caa-719d-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 14:31:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994C8A78;
 Wed,  8 May 2019 07:31:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3A23F238;
 Wed,  8 May 2019 07:31:41 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
 <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <98200ea9-c21e-9d58-498d-468764209972@arm.com>
Date: Wed, 8 May 2019 15:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wNS8yMDE5IDE0OjU0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBEb2VzIGl0IGFs
d2F5cyBmYWlsLCBvciBvbmx5IHRpbWUgdG8gdGltZT8KPiBJdCBoYXBwZW5zIG9uIGJvb3QuIEFu
ZCB0aG9zZSBwcmludHMgYXJlIHBlcm1hbmVudCBhbmQgbWFrZXMgYm9vdCB0aW1lIGVub3Jtb3Vz
LiAKPiBJIG9uY2Ugd2FpdGVkIHRpbGwgdXNlciBwcm9tcHQgKGhhbGYgYW4gaG91ciBvciBzbyks
IHRoZXkgY2FsbWVkIG9uIHZpc2libGUgCj4gaWRsZSwgYnV0IHByaW50ZWQgZnJvbSB0aW1lIHRv
IHRpbWUgKG1heWJlIG9uIHVzZXJzcGFjZSBhY3Rpdml0aWVzKS4KCkkgaGF2ZW4ndCBzZWVuIHRo
ZW0gd2l0aCBub2twdGkgcGxhdGZvcm0gc28gZmFyLiBJIGFtIGN1cmlvdXMgdG8ga25vdyB3aGF0
IGlzIAp5b3VyIGNvbmZpZ3VyYXRpb24gaGVyZS4KCj4gCj4+IENvdWxkIHlvdSBkdW1wIHRoZSBn
dWVzdCByZWdpc3RlciB3aGVuIHRoaXMgaGFwcGVuPwo+IENvdWxkIHlvdSBwbGVhc2UgcmVtZW1i
ZXIgaG93IHRvIGRvIHRoYXQ/Cgp2Y3B1X3Nob3dfZXhlY3V0aW9uX3N0YXRlKGN1cnJlbnQpIHNo
b3VsZCBkbyB0aGUgam9iIGhlcmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
