Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B049EEF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBvW-0007b5-J0; Tue, 18 Jun 2019 11:05:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdBvV-0007b0-HO
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:05:21 +0000
X-Inumbo-ID: f579fb5a-91b8-11e9-8407-9bcdb3b5169f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f579fb5a-91b8-11e9-8407-9bcdb3b5169f;
 Tue, 18 Jun 2019 11:05:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2F3C344;
 Tue, 18 Jun 2019 04:05:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F06D53F246;
 Tue, 18 Jun 2019 04:07:03 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
 <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
 <alpine.DEB.2.21.1906171423230.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e1d8a184-284d-1af3-1732-25022ea6b348@arm.com>
Date: Tue, 18 Jun 2019 12:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906171423230.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE3LzA2LzIwMTkgMjI6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDEgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDMwLzA0LzIwMTkgMjI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE5vdyB0
aGF0IG1hcF9tbWlvX3JlZ2lvbnMgdGFrZXMgYSBwMm10IHBhcmFtZXRlciwgdGhlcmUgaXMgbm8g
bmVlZCB0bwo+Pj4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFtZXRlciBk
b2VzIGEgYmV0dGVyIGpvYiBhdAo+Pj4gZXhwcmVzc2luZyB3aGF0IHRoZSBtYXBwaW5nIGlzIGFi
b3V0LiBMZXQncyBzYXZlIHRoZSBlbnZpcm9ubWVudCA1Cj4+PiBjaGFyYWN0ZXJzIGF0IGEgdGlt
ZS4KPj4KPj4gQXQgbGVhc3Qgb24gQXJtLCB3aGF0J3MgdGhlIGRpZmZlcmVuY2Ugd2l0aCBndWVz
dF9waHlzbWFwX2FkZF9lbnRyeSBhbmQgdGhpcwo+PiBmdW5jdGlvbiBub3c/IE9uIHg4NiwgaG93
IGRvZXMgdGhlIHVzZXIgbm93IHdoaWNoIGZ1bmN0aW9uIHRvIHVzZT8KPj4KPj4gV2hhdCBhY3R1
YWxseSB0ZWxsIHRoZSB1c2VycyBpdCBzaG91bGQgbm90IHVzZSB0aGlzIGZ1bmN0aW9uIGZvciBS
QU0/Cj4gCj4gQWxzbyB0YWtpbmcgaW50byBhY2NvdW50IEphbidzIGNvbW1lbnRzLCBJJ2xsIGRy
b3AgdGhpcyBwYXRjaCBpbiB0aGUKPiBuZXh0IHZlcnNpb24sIGtlZXBpbmcgdGhlIG9yaWdpbmFs
IG5hbWUgbWFwX21taW9fcmVnaW9ucy4gSWYgeW91IGhhdmUgYW4KPiBhbHRlcm5hdGl2ZSBzdWdn
ZXN0aW9uIGxldCBtZSBrbm93IGFuZCBJJ2xsIHRyeSB0byBmb2xsb3cgaXQuCgpBcyBsb25nIGFz
IG9ubHkgcDJtX21taW9fKiB0eXBlcyBjYW4gYmUgdXNlZCBoZXJlLCB0aGVuIEkgYW0gZmluZSB3
aXRoIGl0LgoKQ29tcGFyZSB0byB4ODYsIHRoZSBQMk0gaW50ZXJmYWNlIG9uIEFybSBpcyBwcmV0
dHkgbXVjaCBhIHdpbGQgd2VzdCBzbyBmYXIuIEkgCmhhdmUgYSBUT0RPIHRvIHJldGhpbmsgYW5k
IGFkZCBtb3JlIGNoZWNrIGluIHRoZW0gb24gQXJtLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
