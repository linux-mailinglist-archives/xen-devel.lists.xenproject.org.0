Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E122B26664
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 16:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTSdK-00072W-Md; Wed, 22 May 2019 14:54:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Clyk=TW=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTSdJ-00072Q-E7
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 14:54:21 +0000
X-Inumbo-ID: 788d78fa-7ca1-11e9-a3bb-e7c3abd22975
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 788d78fa-7ca1-11e9-a3bb-e7c3abd22975;
 Wed, 22 May 2019 14:54:17 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: tVuGKCpeKVVn/iRpsAoMQDSW2fzgkmP5NF+bwaQyRmgioPx0kHk3NODzHCFRb2eEBcEYFcVDg9
 UGEx0I7OuCQFn4jaXu3WtN4jS8kXxN6RjbFC25UDGKlc9i9iRfA7D72XO20SaFGuYqgY1nyBNp
 2mOX8Z5I+VTW4T6LSMV5agiomN6rrvCbHuRm3tY51C2SZ5FWsBUOuug1aRUKP53FNSVxZEGO8a
 BfFm24u5QeNodHB04zqH8rV+YKnCWQVqgkd/wybJfuAG59CywholckQJnIJ6k/FkCooyQwurRo
 I+8=
X-SBRS: 2.7
X-MesageID: 773743
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="773743"
Date: Wed, 22 May 2019 15:54:13 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190522145413.GA2373@zion.uk.xensource.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522145140.12943-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDM6NTE6NDBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gU2luY2UgUUVNVSAyLjEwIChvciBxZW11LXhlbi00LjEwKSwgcWVtdSBsb2NrcyBk
aXNrIGltYWdlcyB0byBhdm9pZAo+IHRoZW0gYmVlbiByZS1vcGVuZWQgaW4gYSBkaWZmZXJlbnQg
cWVtdSBwcm9jZXNzLgo+IAo+IFdpdGggWGVuLCB0aGVyZSBhcmUgdHdvIGlzc3VlczoKPiAtIEZv
ciBIVk0gZ3Vlc3RzLCBhIGRpc2sgaW1hZ2UgY2FuIGJlIG9wZW4gdHdpY2UhIE9uZSBieSB0aGUK
PiAgIGVtdWxhdGlvbiBkcml2ZXIsIGFuZCBvbmUgYnkgdGhlIFBWIGJhY2tlbmQuCj4gLSBEdXJp
bmcgbWlncmF0aW9uLCB0aGUgcWVtdSBwcm9jZXNzIG9mIHRoZSBuZXdseSBzcGF3bmVkIGRvbWFp
biBtYXkKPiAgIGF0dGVtcHQgdG8gYWNjZXNzIHRoZSBkaXNrIGltYWdlIGJlZm9yZSB0aGUgZG9t
YWluIGJlZW4gbWlncmF0ZWQKPiAgIGFuZCB0aGUgcWVtdSBwcm9jZXNzIGFyZSBiZWVuIGNvbXBs
ZXRlbHkgZGVzdHJveWVkLgo+IAo+IE1pZ3JhdGlvbiBvZiBIVk0gZ3Vlc3QgYXMgYmVlbiB0YWtl
biBjYXJlIG9mIGluIGxpYnhsLCBidXQgbWlncmF0aW9uCj4gb2YgUFYgZ3Vlc3Qgd2l0aCBxZGlz
ayBhbmQgSFZNIGd1ZXN0IGF0dGVtcHRpbmcgdG8gYWNjZXNzIHRoZSBQViBkaXNrCj4gYmVmb3Jl
IHVucGx1Z2dpbmcgdGhlIGVtdWxhdGVkIGRpc2sgYXJlIHN0aWxsIGFuIGlzc3VlLgo+IAo+IEZv
ciB0aGVzZSByZWFzb25zLCB3ZSBkb24ndCB3YW50IHRvIGhhdmUgUUVNVSB1c2UgYSBsb2NraW5n
IG1lY2hhbmlzbQo+IHdpdGggdGhlIFBWIGJhY2tlbmQuCj4gCj4gVGhpcyBpcyBhbHJlYWR5IGRv
bmUgYnkgZGI5ZmY0NmVlYiBpbiBRRU1VIHVwc3RyZWFtLCBvciBRRU1VIDQuMC4KPiAKPiBBZmZl
Y3RlZCB2ZXJzaW9uIG9mIFFFTVUgYXJlOgo+IC0gcWVtdS14ZW4gb2YgWGVuIDQuMTAgYW5kIDQu
MTEKPiAtIFFFTVUgMi4xMCwgMi4xMSwgMi4xMiwgMy4wIGFuZCAzLjEKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiAtLS0K
PiAKPiBIaSBPbGFmLCBSb2dlciwgV2VpLAo+IAo+IEluc3RlYWQgb2YgYSBmaXggaW4gbGlieGwg
KHdpdGggdGhlIHJldmVydGVkIHBhdGNoICJsaWJ4bDogZml4Cj4gbWlncmF0aW9uIG9mIFBWIGFu
ZCBQVkggZG9tVXMgd2l0aCBhbmQgd2l0aG91dCBxZW11IiksIHdoYXQgZG8geW91Cj4gdGhpbmsg
b2YgdGhpcyBRRU1VIHBhdGNoPyAgSXQgaXMgbXVjaCBzaW1wbGVyIHRoYXQgdHJ5aW5nIHRvIHdv
cmsKPiBhcm91bmQgdGhlIGlzc3VlIGluIGxpYnhsLCBhbmQgaXQgZml4IG9uZSBtb3JlIHByb2Js
ZW0gdGhhdCBzdGlsbAo+IGV4aXN0Lgo+IAo+IFRoaXMgcGF0Y2ggaXMgb25seSBmb3Igc3RhYmxl
IGJyYW5jaGVzIGFzIFhlbiB1bnN0YWJsZSBhbHJlYWR5IGhhdmUgYQo+IHFlbXUgd2l0aCBhIHNp
bWlsYXIgcGF0Y2guCj4gCj4gQ2FuIHlvdSBnaXZlIGl0IGEgdHJ5IHdpdGggb25lIG9mIHRoZSBh
ZmZlY3RlZCBxZW11PyAocWVtdS14ZW4tNC4xMCBvcgo+IHFlbXUteGVuLTQuMTEpCj4gCj4gVGhh
bmtzLAoKVGhhbmtzIGZvciBzdGVwcGluZyB1cC4gOi0pCgo+IC0tLQo+ICBody9ibG9jay94ZW5f
ZGlzay5jIHwgOSArKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9ody9ibG9jay94ZW5fZGlzay5jIGIvaHcv
YmxvY2sveGVuX2Rpc2suYwo+IGluZGV4IGU0MzFiZDg5ZTguLmNiZmYxNzRhOTggMTAwNjQ0Cj4g
LS0tIGEvaHcvYmxvY2sveGVuX2Rpc2suYwo+ICsrKyBiL2h3L2Jsb2NrL3hlbl9kaXNrLmMKPiBA
QCAtMTA4NCwxMSArMTA4NCwxOCBAQCBzdGF0aWMgaW50IGJsa19jb25uZWN0KHN0cnVjdCBYZW5E
ZXZpY2UgKnhlbmRldikKPiAgICAgICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKPiAgICAg
ICAgICBRRGljdCAqb3B0aW9ucyA9IE5VTEw7Cj4gIAo+ICsgICAgICAgIG9wdGlvbnMgPSBxZGlj
dF9uZXcoKTsKPiArCj4gICAgICAgICAgaWYgKHN0cmNtcChibGtkZXYtPmZpbGVwcm90bywgIjx1
bnNldD4iKSkgewo+IC0gICAgICAgICAgICBvcHRpb25zID0gcWRpY3RfbmV3KCk7Cj4gICAgICAg
ICAgICAgIHFkaWN0X3B1dF9zdHIob3B0aW9ucywgImRyaXZlciIsIGJsa2Rldi0+ZmlsZXByb3Rv
KTsKPiAgICAgICAgICB9Cj4gIAo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogSXQgaXMgbmVj
ZXNzYXJ5IHRvIHR1cm4gZmlsZSBsb2NraW5nIG9mZiBhcyBhbiBlbXVsYXRlZCBkZXZpY2UKPiAr
ICAgICAgICAgKiBtYXkgaGF2ZSBhbHJlYWR5IG9wZW5lZCB0aGUgc2FtZSBpbWFnZSBmaWxlLgo+
ICsgICAgICAgICAqLwo+ICsgICAgICAgIHFkaWN0X3B1dF9zdHIob3B0aW9ucywgImZpbGUubG9j
a2luZyIsICJvZmYiKTsKPiArCj4gICAgICAgICAgLyogc2V0dXAgdmlhIHhlbmJ1cyAtPiBjcmVh
dGUgbmV3IGJsb2NrIGRyaXZlciBpbnN0YW5jZSAqLwo+ICAgICAgICAgIHhlbl9wdl9wcmludGYo
JmJsa2Rldi0+eGVuZGV2LCAyLCAiY3JlYXRlIG5ldyBiZHJ2ICh4ZW5idXMgc2V0dXApXG4iKTsK
PiAgICAgICAgICBibGtkZXYtPmJsayA9IGJsa19uZXdfb3BlbihibGtkZXYtPmZpbGVuYW1lLCBO
VUxMLCBvcHRpb25zLAo+IC0tIAo+IEFudGhvbnkgUEVSQVJECj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
