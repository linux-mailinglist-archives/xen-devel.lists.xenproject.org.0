Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4975171441
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:42:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Fd7-0007Jp-SO; Thu, 27 Feb 2020 09:38:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7Fd5-0007Jk-VI
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:38:51 +0000
X-Inumbo-ID: f51eb9e5-5944-11ea-961e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f51eb9e5-5944-11ea-961e-12813bfff9fa;
 Thu, 27 Feb 2020 09:38:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B582ACA4;
 Thu, 27 Feb 2020 09:38:50 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c435d5ba-16c9-2e0d-46c3-12255daf7d80@suse.com>
Date: Thu, 27 Feb 2020 10:38:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-7-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 06/23] xen/build: Fix
 section-renaming of libfdt and libelf
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSW4gY29tbW9uL2xp
YmVsZi9NYWtlZmlsZSwgd2hlbiBTRUNUSU9OUyBnZXRzIGRlZmluZWQKPiBTUEVDSUFMX0RBVEFf
U0VDVElPTlMgZG9lc24ndCBleGlzdCwgc28gb25seSAidGV4dCBkYXRhIiBzZWN0aW9ucyBhcmUK
PiBiZWVuIHJlbmFtZWQuIFRoaXMgd2FzIGRpZmZlcmVudCBiZWZvcmUgNDgxMTVkMTQ3NDNlICgi
TW92ZSBtb3JlCj4ga2VybmVsIGRlY29tcHJlc3Npb24gYml0cyB0byAuaW5pdC4qIHNlY3Rpb25z
IikuCgpPYnZpb3VzbHkgSSBjYW4ndCBoYXZlIGNoZWNrZWQgdGhlIGdlbmVyYXRlZCBiaW5hcnkg
YmFjayB0aGVuLgoKV2h5IGlzIGxpYmZkdCBtZW50aW9uZWQgaW4ganVzdCB0aGUgdGl0bGUgdGhv
dWdoPwoKPiBNb3ZlIFNQRUNJQUxfREFUQV9TRUNUSU9OUyBpbiBSdWxlcy5tayBiZWZvcmUgaW5j
bHVkaW5nICJNYWtlZmlsZSIgdG8KPiBmaXggdGhpcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CihwcmVmZXJhYmx5IHdpdGggYSBzZW50ZW5jZSBh
ZGRlZCB0byB0aGUgZGVzY3JpcHRpb24gbWFraW5nIGNsZWFyCmhvdy93aHkgdGhhdCBvbmUncyBh
bHNvIGFmZmVjdGVkOyBjb3VsZCBiZSBhcyBzaW1wbGUgYXMgIlRoZSBzYW1lCm1pc3Rha2UgaGFz
IHRoZW4gYmVlbiBwcm9wYWdhdGUgaW50byBsaWJmZHQsIGJ5IHdheSBvZiBjb21taXQgLi4uIiwK
d2hpY2ggb3VnaHQgdG8gYmUgZWFzeSBlbm91Z2ggdG8gYWRkIHdoaWxlIGNvbW1pdHRpbmcuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
