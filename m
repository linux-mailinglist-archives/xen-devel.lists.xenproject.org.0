Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A51B7E7
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBhZ-0007wT-Dj; Mon, 13 May 2019 14:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LC6n=TN=citrix.com=prvs=029733b21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hQBhY-0007wO-9g
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:13:12 +0000
X-Inumbo-ID: 3bbb90ca-7589-11e9-bea1-8bbf7001d7c0
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bbb90ca-7589-11e9-bea1-8bbf7001d7c0;
 Mon, 13 May 2019 14:13:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85389371"
Date: Mon, 13 May 2019 15:13:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190513141305.GA9999@perard.uk.xensource.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-2-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513134714.3124-2-wei.liu2@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 1/4] gitignore: ignore .vscode directory
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6NDc6MTFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgZGlyZWN0b3J5IGlzIGNyZWF0ZWQgYnkgVmlzdWFsIFN0dWRpbyBDb2RlIGVkaXRvciB0
byBzdG9yZSBpdHMKPiBsb2NhbCBzdGF0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICAuZ2l0aWdub3JlIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdp
dGlnbm9yZQo+IGluZGV4IDI2YmM1ODNmNzQuLjM4MjJiYjc1YmEgMTAwNjQ0Cj4gLS0tIGEvLmdp
dGlnbm9yZQo+ICsrKyBiLy5naXRpZ25vcmUKPiBAQCAtMzAsNiArMzAsNyBAQCBjc2NvcGUub3V0
Cj4gIGNzY29wZS5wby5vdXQKPiAgLmNvbmZpZwo+ICAudmltcmMKPiArLnZzY29kZQoKU2hvdWxk
bid0IHRoaXMgZ28gaW4gIn4vLmNvbmZpZy9naXQvaWdub3JlIiBpbnN0ZWFkPyBPciB3aGF0ZXZl
ciBgZ2l0CmNvbmZpZyBjb3JlLmV4Y2x1ZGVzRmlsZWAgcG9pbnQgdG8uCgpgZ2l0IGhlbHAgaWdu
b3JlYCBmb3IgbW9yZSBkZXRhaWwuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
