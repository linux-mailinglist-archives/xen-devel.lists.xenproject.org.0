Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287CD4504
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 18:09:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIxO1-00013W-AS; Fri, 11 Oct 2019 16:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIxO0-00013R-88
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:03:24 +0000
X-Inumbo-ID: a6b71e66-ec40-11e9-933c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a6b71e66-ec40-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:03:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAB97142F;
 Fri, 11 Oct 2019 09:03:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEE9F3F71A;
 Fri, 11 Oct 2019 09:03:21 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>, Oleksandr Grytsov
 <al1img@gmail.com>, "wl@xen.org" <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
Date: Fri, 11 Oct 2019 17:03:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23968.40555.917945.129929@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xMC8yMDE5IDE2OjIzLCBJYW4gSmFja3NvbiB3cm90ZToKPiBPbGVrc2FuZHIg
R3J5dHNvdiB3cml0ZXMgKCJbUEFUQ0ggdjFdIGxpYnhsOiBBZGQgRFRCIGNvbXBhdGlibGUgbGlz
dCB0byBjb25maWcgZmlsZSIpOgo+PiBGcm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRy
X2dyeXRzb3ZAZXBhbS5jb20+Cj4+Cj4+IFNvbWUgcGxhdGZvcm1zIG5lZWQgbW9yZSBjb21wYXRp
YmxlIHByb3BlcnR5IHZhbHVlcyBpbiBkZXZpY2UKPj4gdHJlZSByb290IG5vZGUgaW4gYWRkaXRp
b24gdG8gInhlbix4ZW52bS0lZC4lZCIgYW5kICJ4ZW4seGVudm0iCj4+IHZhbHVlcyB0aGF0IGFy
ZSBnaXZlbiBieSBYZW4gYnkgZGVmYXVsdC4KCkkgYW0gcHJldHR5IHN1cmUgSSBoYXZlIHNlZW4g
dGhpcyBwYXRjaCBhIGZldyB5ZWFycyBhZ28sIGJ1dCBJIGNhbid0IGZpbmQgaXQgaW4gCm15IGlu
Ym94LiBXaGF0IGlzIHRoZSBleGFjdCBwcm9ibGVtIGhlcmU/Cgo+PiBTcGVjaWZ5IGluIGRvbWFp
biBjb25maWd1cmF0aW9uIGZpbGUgd2hpY2ggdmFsdWVzIHNob3VsZCBiZSBhZGRlZAo+PiBieSBw
cm92aWRpbmcgImR0Yl9jb21wYXRpYmxlIiBsaXN0IG9mIHN0cmluZ3Mgc2VwYXJhdGVkIGJ5IGNv
bWFzLgo+IAo+IEhpLCB0aGFua3MuCj4gCj4gSSBkb24ndCBoYXZlIGFuIG9waW5pb24gYWJvdXQg
dGhlIHByaW5jaXBsZSBvZiB0aGlzIGFuZCB3b3VsZCBsaWtlIHRvCj4gaGVhciBmcm9tIEFSTSBm
b2xrcyBhYm91dCB0aGF0Lgo+IAo+IEFsc28sIFN0ZWZhbm8sIEp1bGllbjogc2hvdWxkIHdlIGJl
IGFza2luZyBmb3IgYSBmcmVlemUgZXhjZXB0aW9uIGZvcgo+IHRoaXMgZm9yIDQuMTMgPwoKSSBk
b24ndCBoYXZlIGVub3VnaCBjb250ZXh0IHRvIHVuZGVyc3RhbmQgdGhlIGV4YWN0IGlzc3VlIGhl
IGlzIHRyeWluZyB0byBzb2x2ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
