Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065951F333
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 14:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsjQ-0006uy-Mw; Wed, 15 May 2019 12:10:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQsjP-0006us-Pl
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 12:09:59 +0000
X-Inumbo-ID: 5bd7efd5-770a-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5bd7efd5-770a-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 12:09:58 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: APMhprVAcWr9UgIPP1D1uFoDhCrYHF0Yn9TkKwxuvI89dfGEH2ntaJO43OpjVuE36CMJ9iUV42
 Xp9G8n4bd2ic1XCBvW3K1aKQqWnP7RaEnUZ3lg6vMFwwfUe4RSCNhp70kH7CqKblBzd2+fAD63
 A0hu1ewu6uLnFiLvMsj2nGoZFV0IaIWByHFXy9rzKA/E+Gl8MxR1ImvaZ5OQDJVDeeHIK99WZs
 B7/aXF/LLZDeDuJFSfVch1LqjYx7AP0iEwE4xMnQppIpjl2WsZIUFrv8zb1qKuIirfRCncRfkH
 15s=
X-SBRS: 2.7
X-MesageID: 454511
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="454511"
Date: Wed, 15 May 2019 13:09:56 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190515120956.GS2798@zion.uk.xensource.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
 <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDE6MDc6MDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNS8yMDE5IDEyOjQwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IFRo
aXMgd2FzIHByb2JhYmx5IHVzZWZ1bCB0byBsb2FkIEVMRiBOb3RlLCBidXQgbm93IEVMRiBub3Rl
cwo+ID4gInNob3VsZCBsaXZlIGluIGEgUFRfTk9URSBzZWdtZW50IiAoZWxmbm90ZS5oKS4KPiA+
Cj4gPiBXaXRoIG5vdGVzIGxpdmluZyBpbiBzZWdtZW50LCB0aGVyZSBhcmUgbm8gbmVlZCBmb3Ig
c2VjdGlvbnMsIHNvIHRoZXJlCj4gPiBpcyBub3RoaW5nIHRvIGJlIHN0b3JlZCBpbiB0aGUgc2hz
dHJ0YWIuCj4gPgo+ID4gVGhpcyBwYXRjaCB3b3VsZCBhbGxvdyB0byB3cml0ZSBhIHNpbXBsZXIg
RUxGIGhlYWRlciBmb3IgYW4gT1ZNRiBibG9iCj4gPiAod2hpY2ggaXNuJ3QgYW4gRUxGKSBhbmQg
YWxsb3cgaXQgdG8gYmUgbG9hZGVkIGFzIGEgUFZIIGtlcm5lbC4gVGhlCj4gPiBoZWFkZXIgb25s
eSBuZWVkcyB0byBkZWNsYXJlIHR3byBwcm9ncmFtIHNlZ21lbnRzOgo+ID4gLSBvbmUgdG8gdGVs
bCBhbiBFTEYgbG9hZGVyIHdoZXJlIHRvIHB1dCB0aGUgYmxvYiwKPiA+IC0gb25lIGZvciBhIFhl
biBFTEZOT1RFLgo+ID4KPiA+IFRoZSBFTEZOT1RFIGlzIHRvIGNvbXBseSB0byB0aGUgcHZoIGRl
c2lnbiB3aGljaCB3YW50cyB0aGUKPiA+IFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSB0byBkZWNs
YXJlIGEgYmxvYiBhcyBjb21wYXB0aWJsZSB3aXRoIHRoZSBQVkgKPiA+IGJvb3QgQUJJLgo+ID4K
PiA+IE5vdGUgdGhhdCB3aXRob3V0IHRoZSBFTEZOT1RFLCBsaWJ4YyB3aWxsIGxvYWQgYW4gRUxG
IGJ1dCB3aXRoCj4gPiB0aGUgcGxhaW4gRUxGIGxvYWRlciwgd2hpY2ggZG9lc24ndCBjaGVjayBm
b3Igc2hzdHJ0YWIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9saWJ4Yy94Y19kb21fZWxm
bG9hZGVyLmMgfCA5IC0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMgYi90
b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMKPiA+IGluZGV4IDgyYjVmMmVlNzkuLmIzMjdk
YjIxOWQgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMKPiA+
ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9lbGZsb2FkZXIuYwo+ID4gQEAgLTE2NSwxNSArMTY1
LDYgQEAgc3RhdGljIGVsZl9uZWdlcnJub3ZhbCB4Y19kb21fcGFyc2VfZWxmX2tlcm5lbChzdHJ1
Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4gPiAgICAgICAgICByZXR1cm4gcmM7Cj4gPiAgICAgIH0K
PiA+ICAKPiA+IC0gICAgLyogRmluZCB0aGUgc2VjdGlvbi1oZWFkZXIgc3RyaW5ncyB0YWJsZS4g
Ki8KPiA+IC0gICAgaWYgKCBFTEZfUFRSVkFMX0lOVkFMSUQoZWxmLT5zZWNfc3RydGFiKSApCj4g
PiAtICAgIHsKPiA+IC0gICAgICAgIHhjX2RvbV9wYW5pYyhkb20tPnhjaCwgWENfSU5WQUxJRF9L
RVJORUwsICIlczogRUxGIGltYWdlIgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICIgaGFzIG5v
IHNoc3RydGFiIiwgX19GVU5DVElPTl9fKTsKPiA+IC0gICAgICAgIHJjID0gLUVJTlZBTDsKPiA+
IC0gICAgICAgIGdvdG8gb3V0Owo+ID4gLSAgICB9Cj4gCj4gVGhpcyBtaWdodCBiZSBmaW5lIGZv
ciBuZXdlciBiaW5hcmllcywgYnV0IHlvdSdsbCBicmVhayBvbGRlciBvbmVzLgo+IAo+IEluc3Rl
YWQsIHlvdSBzaG91bGQgc2tpcCBzZWFyY2hpbmcgZm9yIHN0cnRhYiBpZiB3ZSd2ZSBhbHJlYWR5
IGxvY2F0ZWQKPiB0aGUgWGVuIG5vdGVzLgoKQUlVSSBvbGQgYmluYXJpZXMgYWx3YXlzIGhhdmUg
c2hzdHJ0YWIgd2hpbGUgaXQgaXNuJ3QgYWx3YXlzIHRydWUgZm9yCm5ldyBvbmVzLgoKVW5mb3J0
dW5hdGVseSBteSBhdHRlbXB0IHRvIGZpZ3VyZSBvdXQgdGhlIGhpc3Rvcnkgb2YgdGhpcyBwaWVj
ZSBvZiBjb2RlCmlzIGZ1dGlsZS4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
