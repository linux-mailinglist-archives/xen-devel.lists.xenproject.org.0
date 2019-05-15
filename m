Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59281F4E5
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 14:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQtRb-0002KA-0Y; Wed, 15 May 2019 12:55:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FtK4=TP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hQtRZ-0002K5-Gc
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 12:55:37 +0000
X-Inumbo-ID: baf69766-7710-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id baf69766-7710-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 12:55:35 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: sXmLeN3Tr/Ck53G2bkzXZblvgylUGSWkU61dfTm2JGioPMmlmljikkwDvsYEEzDgp9TNLqIH2H
 HGlwW13Grvlx55WZ7gD8M6NMCVbjmvf1O+TW8TeIhJpSrUb0mcgmwcd3/uMRRw2ug2v/NgqwHn
 H5sQkHirCF6I9tymMguxdgqCcOgHf8gNgnoOALHvLFF0l53PMODQ6uc6gljNC8HRI2evXvFwKU
 US0HcBeC3RXFig03kYTJ2Cnc1RRU+z/294t1q1DeGZxPMjYSyhvtSzECiPgBqP4uiB25IIEHMX
 +Yw=
X-SBRS: 2.7
X-MesageID: 454793
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="454793"
Date: Wed, 15 May 2019 13:55:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190515125530.GB1245@perard.uk.xensource.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
 <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>
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
IGxvY2F0ZWQKPiB0aGUgWGVuIG5vdGVzLgoKOi0oLCBtYXliZSBJIHNob3VsZCBoYXZlIGdvbmUg
ZnV0aGVyIG9uIGV4cGxhaW5pbmcgd2h5IHRoaXMgY2hlY2sgaXMKdXNlbGVzcyAoYW5kIHByb2Jh
Ymx5IGF0IHRoZSB3cm9uZyBwbGFjZSwgYXQgbGVhc3Qgbm93KS4KClRoZSBuZXh0IHRoaW5nIHRo
YXQncyBkb25lIGFmdGVyIHRoYXQgY2hlY2sgaXM6CmVsZl9wYXJzZV9iaW5hcnkoKQplbGZfeGVu
X3BhcnNlKCkKVGhvc2UgYXJlIGxvY2F0ZWQgaW4gInhlbi9jb21tb24vbGliZWxmIiwgYW5kIHRo
b3NlIGFyZSB0aGUgZnVuY3Rpb25zCnRoYXQgYWN0dWFsbHkgdGFrZXMgY2FyZSBvZiBleHRyYWN0
aW5nIGRhdGEgZnJvbSB0aGUgZWxmLgoKZWxmX3hlbl9wYXJzZSgpIGZpcnN0IGxvb2sgZm9yIFhl
biBFTEZOT1RFIGluIHRoZSBwcm9ncmFtIHNlZ21lbnRzCihwaGRyLCBQVF9OT1RFKSBhbmQgc2tp
cCByZWFkaW5nIHNlY3Rpb24gYW5kIHN0cnRhYiBpZiBmb3VuZC4KClNvLCBsaWJlbGYgYWxyZWFk
eSBkb2VzIHdoYXQgeW91IGFza2VkIGZvciA7LSkuCgpUaGUgc2hzdHJ0YWIgYXJlIG9ubHkgdXNl
ZCB0byBsb29rIGZvciBsZWdhY3kgX194ZW5fZ3Vlc3Qgc2VjdGlvbiBuYW1lcy4KU2luY2UgRUxG
Tk9URXMgd2FzIHVzZWQsIHRoZSBuYW1lIG9mIHNlY3Rpb24gYXJlbid0IGxvb2tlZCBhdC4KCkkg
aG9wZSB0aGF0IGhlbHAuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
