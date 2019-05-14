Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE761C80E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:56:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVzL-00049l-No; Tue, 14 May 2019 11:52:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQVzK-00049g-1H
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:52:54 +0000
X-Inumbo-ID: cb3c7830-763e-11e9-95a0-db887c48da5c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb3c7830-763e-11e9-95a0-db887c48da5c;
 Tue, 14 May 2019 11:52:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 05:52:47 -0600
Message-Id: <5CDAAC0C020000780022E921@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 05:52:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190514103030.8393-1-wei.liu2@citrix.com>
 <20190514103030.8393-2-wei.liu2@citrix.com>
 <5CDAA7FD020000780022E8F1@prv1-mh.provo.novell.com>
 <20190514113954.GB2798@zion.uk.xensource.com>
In-Reply-To: <20190514113954.GB2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
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

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjM5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDU6MzU6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxNC4wNS4xOSBhdCAxMjozMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IEJsa3RhcDIgaXMgZWZmZWN0aXZlbHkgZGVhZCBmb3IgYSBmZXcgeWVhcnMuCj4+
ID4gCj4+ID4gTm90YWJsZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2g6Cj4+ID4gCj4+ID4gMC4gVW5o
b29rIGJsa3RhcDIgZnJvbSBidWlsZCBzeXN0ZW0KPj4gPiAxLiBsaWJ4bCBubyBsb25nZXIgc3Vw
cG9ydHMgVEFQIGRpc2sgYmFja2VuZCwgd2l0aCBhcHByb3ByaWF0ZSBhc3NlcnRpb25zCj4+ID4g
ICAgYWRkZWQgYW5kIHNvbWUgY29kZSBwYXRocyBub3cgcmV0dXJuIEVSUk9SX0ZBSUwKPj4gCj4+
IEFuZCBhbHNvIGFwcHJvcHJpYXRlIGVycm9yIG1lc3NhZ2VzLCBhbGxvd2luZyBwZW9wbGUgdG8g
a25vdwo+PiB3aGF0IG5lZWRzIGNoYW5naW5nIHdpdGhvdXQgZmlyc3QgZGlnZ2luZyB0aHJvdWdo
IHRoZSBzb3VyY2VzPwo+IAo+IFllcyB0aGVyZSBoYXZlIGFsd2F5cyBiZWVuIGFwcHJvcHJpYXRl
IGVycm9yIG1lc3NhZ2VzIGluIHRoZSBlcnJvcgo+IHBhdGhzLgoKV2VsbCwgZ29vZCB0byBrbm93
LCBidXQgaXQgZG9lc24ndCBtYXRjaCBteSBleHBlcmllbmNlLCBzbyBhdCB0aGUKdmVyeSBsZWFz
dCBJJ20gaW4gZG91YnQgb2YgeW91ciB1c2Ugb2YgImFsd2F5cyIuIEJ1dCBpdCdzIGJlZW4gYSB3
aGlsZSwKaWlyYyB0aGlzIHdhcyBwYWluZnVsIG1haW5seSB3aGVuLCBvdmVyIGFuIGV4dGVuZGVk
IHBlcmlvZCBvZiB0aW1lCihpLmUuIGFzIHRoZXkgZ290IHVzZWQgZm9yIHRlc3RpbmcpLCBoYXZp
bmcgc3dpdGNoZWQgZG9tYWluIGNvbmZpZ3MKZnJvbSB4ZW5kIHRvIHhsIHNoYXBlLiBXaGljaCBp
cyB0byBzYXk6IEkgY2FuJ3QgZ2l2ZSBhbnkgY29uY3JldGUKcmVjZW50IGV4YW1wbGVzIG9mIHVu
Y2xlYXIgZXJyb3IgbWVzc2FnZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
