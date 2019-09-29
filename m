Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBDBC140B
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 11:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEVIH-0004ir-Q1; Sun, 29 Sep 2019 09:15:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEVIG-0004im-Qw
 for xen-devel@lists.xen.org; Sun, 29 Sep 2019 09:15:04 +0000
X-Inumbo-ID: 9e997680-e299-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 9e997680-e299-11e9-97fb-bc764e2007e4;
 Sun, 29 Sep 2019 09:15:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C78BE28;
 Sun, 29 Sep 2019 02:15:02 -0700 (PDT)
Received: from [10.37.8.142] (unknown [10.37.8.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A99693F739;
 Sun, 29 Sep 2019 02:15:01 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
 <20190926231144.16297-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e185bd21-8dbe-b62c-b41f-5977610c2e39@arm.com>
Date: Sun, 29 Sep 2019 10:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926231144.16297-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/8] xen/arm: introduce kinfo->phandle_gic
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDkvMjcvMTkgMTI6MTEgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBJbnN0ZWFkIG9mIGFsd2F5cyBoYXJkLWNvZGluZyB0aGUgR0lDIHBoYW5kbGUgKEdVRVNU
X1BIQU5ETEVfR0lDKSwgc3RvcmUKPiBpdCBpbiBhIHZhcmlhYmxlIHVuZGVyIGtpbmZvLiBUaGlz
IHdheSBpdCBjYW4gYmUgZHluYW1pY2FsbHkgY2hvc2VuIHBlcgo+IGRvbWFpbi4gUmVtb3ZlIHRo
ZSBmZHQgcG9pbnRlciBhcmd1bWVudCB0byB0aGUgbWFrZV8qX2RvbVVfbm9kZQo+IGZ1bmN0aW9u
cyBhbmQgb2FzcyBhIHN0cnVjdCBrZXJuZWxfaW5mbyAqIGluc3RlYWQuIFRoZSBmZHQgcG9pbnRl
ciBjYW4KPiBiZSBhY2Nlc3NlZCBmcm9tIGtpbmZvLT5mZHQuIFJlbW92ZSB0aGUgc3RydWN0IGRv
bWFpbiAqZCBwYXJhbWV0ZXIgdG8KPiB0aGUgbWFrZV8qX2RvbVVfbm9kZSBmdW5jdGlvbnMgYmVj
YXVzZSBpdCBiZWNvbWVzIHVudXNlZC4KPiAKPiBJbml0aWFsaXplIHBoYW5kbGVfZ2ljIHRvIEdV
RVNUX1BIQU5ETEVfR0lDIGF0IHRoZSBiZWdpbm5pbmcgb2YKPiBwcmVwYXJlX2R0Yl9kb21VIGZv
ciBEb21Vcy4gTGF0ZXIgcGF0Y2hlcyB3aWxsIGNoYW5nZSB0aGUgdmFsdWUgb2YKPiBwaGFuZGxl
X2dpYyBkZXBlbmRpbmcgb24gdXNlciBwcm92aWRlZCBpbmZvcm1hdGlvbi4KPiAKPiBGb3IgRG9t
MCwgaW5pdGlhbGl6ZSBwaGFuZGxlX2dpYyB0byBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhh
bmRsZQo+IChjdXJyZW50IHZhbHVlKSBhdCB0aGUgYmVnaW5uaW5nIG9mIHByZXBhcmVfZHRiLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNv
bT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
