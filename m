Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3DD1C7E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVmv-0002zt-RG; Tue, 14 May 2019 11:40:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQVmt-0002mP-Sy
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:40:03 +0000
X-Inumbo-ID: 023b9b60-763d-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 023b9b60-763d-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 11:40:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85433139"
Date: Tue, 14 May 2019 12:39:54 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190514113954.GB2798@zion.uk.xensource.com>
References: <20190514103030.8393-1-wei.liu2@citrix.com>
 <20190514103030.8393-2-wei.liu2@citrix.com>
 <5CDAA7FD020000780022E8F1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDAA7FD020000780022E8F1@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/2] tools: remove blktap2 related code and
 documentation
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDU6MzU6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA1LjE5IGF0IDEyOjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBCbGt0YXAyIGlzIGVmZmVjdGl2ZWx5IGRlYWQgZm9yIGEgZmV3IHllYXJzLgo+ID4g
Cj4gPiBOb3RhYmxlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaDoKPiA+IAo+ID4gMC4gVW5ob29rIGJs
a3RhcDIgZnJvbSBidWlsZCBzeXN0ZW0KPiA+IDEuIGxpYnhsIG5vIGxvbmdlciBzdXBwb3J0cyBU
QVAgZGlzayBiYWNrZW5kLCB3aXRoIGFwcHJvcHJpYXRlIGFzc2VydGlvbnMKPiA+ICAgIGFkZGVk
IGFuZCBzb21lIGNvZGUgcGF0aHMgbm93IHJldHVybiBFUlJPUl9GQUlMCj4gCj4gQW5kIGFsc28g
YXBwcm9wcmlhdGUgZXJyb3IgbWVzc2FnZXMsIGFsbG93aW5nIHBlb3BsZSB0byBrbm93Cj4gd2hh
dCBuZWVkcyBjaGFuZ2luZyB3aXRob3V0IGZpcnN0IGRpZ2dpbmcgdGhyb3VnaCB0aGUgc291cmNl
cz8KClllcyB0aGVyZSBoYXZlIGFsd2F5cyBiZWVuIGFwcHJvcHJpYXRlIGVycm9yIG1lc3NhZ2Vz
IGluIHRoZSBlcnJvcgpwYXRocy4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
