Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F214313AB
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:19:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWl9F-0004hw-Q3; Fri, 31 May 2019 17:16:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWl9E-0004hr-Pn
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:16:56 +0000
X-Inumbo-ID: e348f67e-83c7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e348f67e-83c7-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 17:16:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57341A78;
 Fri, 31 May 2019 10:16:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D9D3F59C;
 Fri, 31 May 2019 10:16:53 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <959c8e20-705e-b654-d87c-916c2bdf29f4@arm.com>
Date: Fri, 31 May 2019 18:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMC8wNS8yMDE5IDE3OjE0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9u
IDI5LjA1LjE5IDE4OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBCVFcsIGRvIHlvdSBoZWFy
IGFib3V0IHBsYW5zIGZvciB0aGUgbmV3IHZnaWM/IFNvbWUgdGltZSBhZ28gaXQgd2FzIHNhaWQg
dGhhdCAKPj4+IG5ldyB2Z2ljIGltcGxlbWVudGF0aW9uIGdvaW5nIHRvIHJlcGxhY2UgdGhlIG9s
ZCBvbmUsIGFuZCBvcHRpbWl6aW5nIHRoZSBvbGQgCj4+PiBpcyB3b3J0aGxlc3MuIEJ1dCBhcyBJ
IHNlZSwgdGhlcmUgYXJlIG5vIHVwZGF0ZXMgaW50byB0aGF0IGFyZWEgeWV0Lgo+Pgo+PiBXZSBu
ZWVkIGhlbHAgdG8gbWFrZSBpdCBoYXBwZW4uCj4gSSdtIG5vdCBzdXJlIEknbGwgaGF2ZSBzcGFy
ZSB0aW1lIHNvb24sIGJ1dCB3aGF0IGtpbmQgb2YgaGVscCB5b3UgbmVlZD8gRG8geW91IAo+IGhh
dmUgYSBUT0RPIGxpc3Q/CgogRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQgdGhlIG1ham9yIGJsb2Nr
ZXIgaXMgR0lDdjMgKCsgSVRTKSBzdXBwb3J0LiBJdCBtb3N0bHkgCm5lZWQgdG8gYmUgcG9ydGVk
IGZyb20gTGludXguCgpUaGVyZSB3ZXJlIGFsc28gYSBjb3VwbGUgb2YgY29uY2VybiByZWdhcmRp
bmcgdXNpbmcgb3JkZXJpbmcgdGhlIGxpc3Qgd2hpbGUgCmZvbGRpbmcgKGNhbid0IHJlbWVtYmVy
IGlmIHRoaXMgd2FzIGFkZHJlc3NlZCBpbiBMaW51eCkuCgpAQW5kcmUsIEkgdGhvdWdodCB3ZSBj
YXB0dXJlIHRoYXQgaW4gWGVuIFByb2plY3QgamlyYSBidXQgSSBjYW4ndCBmaW5kIGl0LiBEaWQg
CnlvdSBrZWVwIGEgbGlzdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
