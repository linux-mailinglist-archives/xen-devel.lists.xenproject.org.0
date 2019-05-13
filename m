Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CA1B7FA
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:19:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBkt-0008Jf-UW; Mon, 13 May 2019 14:16:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBks-0008JS-KU
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:16:38 +0000
X-Inumbo-ID: b872a8f3-7589-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b872a8f3-7589-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:16:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85389633"
Date: Mon, 13 May 2019 15:16:35 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190513141635.GL2798@zion.uk.xensource.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-2-wei.liu2@citrix.com>
 <20190513141305.GA9999@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513141305.GA9999@perard.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDM6MTM6MDZQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6NDc6MTFQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFRoZSBkaXJlY3RvcnkgaXMgY3JlYXRlZCBieSBWaXN1YWwgU3R1ZGlvIENv
ZGUgZWRpdG9yIHRvIHN0b3JlIGl0cwo+ID4gbG9jYWwgc3RhdGUuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICAuZ2l0aWdu
b3JlIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQo+ID4gaW5kZXggMjZiYzU4M2Y3NC4u
MzgyMmJiNzViYSAxMDA2NDQKPiA+IC0tLSBhLy5naXRpZ25vcmUKPiA+ICsrKyBiLy5naXRpZ25v
cmUKPiA+IEBAIC0zMCw2ICszMCw3IEBAIGNzY29wZS5vdXQKPiA+ICBjc2NvcGUucG8ub3V0Cj4g
PiAgLmNvbmZpZwo+ID4gIC52aW1yYwo+ID4gKy52c2NvZGUKPiAKPiBTaG91bGRuJ3QgdGhpcyBn
byBpbiAifi8uY29uZmlnL2dpdC9pZ25vcmUiIGluc3RlYWQ/IE9yIHdoYXRldmVyIGBnaXQKPiBj
b25maWcgY29yZS5leGNsdWRlc0ZpbGVgIHBvaW50IHRvLgo+IAo+IGBnaXQgaGVscCBpZ25vcmVg
IGZvciBtb3JlIGRldGFpbC4KCldlIGFscmVhZHkgcHV0IGEgYnVuY2ggb2YgZmlsZXMgZm9yIHZh
cmlvdXMgdG9vbHMgaW4geGVuLmdpdCdzCmdpdGlnbm9yZS4gSSBkb24ndCBzZWUgd2h5IHRoaXMg
Y2FuJ3QgYmUgZG9uZSBmb3IgdnNjb2RlLgoKV2VpLgoKPiAKPiAtLSAKPiBBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
