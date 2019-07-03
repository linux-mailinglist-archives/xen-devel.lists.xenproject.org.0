Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1075E85F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 18:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hihj8-0004kr-3u; Wed, 03 Jul 2019 16:03:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=roNQ=VA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hihj7-0004km-HO
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 16:03:21 +0000
X-Inumbo-ID: 138aec94-9dac-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 138aec94-9dac-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 16:03:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mbMRuguPZ9uCjR6ePUpON5Cq0gvNpOZC5MPltuGnan64qwmSdzxsTMwCo0l4EcdNhRnbaBJ5bI
 KmHbLxkY6swAFF5cIW8W1s6CLyVDx2w3Mkl68IW5r+lGZHLLr3GiNvhZZt2K3Xt32hOj+rUpaj
 GMNMYhWcrYxWaZ29yIDDt/AmVQbrIhHaNpII3eyMQ8dcrEdzmDirlFXQvW82q8cfOMolhvoC6s
 bOYAdWlasMh+IlJH3WjNpZIRqJA5UZetip/O+K15mdjopfKS83AQK56YSKXuiBKSFcyBPOIxqL
 Hm0=
X-SBRS: 2.7
X-MesageID: 2551771
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2551771"
Date: Wed, 3 Jul 2019 17:03:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190703160317.GM13449@perard.uk.xensource.com>
References: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2] libxl_qmp: wait for completion of device
 removal
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6NTY6MTNQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gVG8gcmVtb3ZlIGEgZGV2aWNlIGZyb20gYSBkb21haW4sIGEgcW1wIGNvbW1hbmQgaXMgc2Vu
dCB0byBxZW11LiBCdXQgaXQgaXMKPiBoYW5kbGVkIGJ5IHFlbXUgYXN5Y2hyb25vdXNseS4gRXZl
biB0aGUgcW1wIGNvbW1hbmQgaXMgY2xhaW1lZCB0byBiZSBkb25lLAo+IHRoZSBhY3R1YWwgaGFu
ZGxpbmcgaW4gcWVtdSBzaWRlIG1heSBoYXBwZW4gbGF0ZXIuCj4gVGhpcyBiZWhhdmlvciBicmlu
Z3MgdHdvIHF1ZXN0aW9uczoKPiAxLiBBdHRhY2hpbmcgYSBkZXZpY2UgYmFjayB0byBhIGRvbWFp
biByaWdodCBhZnRlciBkZXRhY2hpbmcgdGhlIGRldmljZSBmcm9tCj4gdGhhdCBkb21haW4gd291
bGQgZmFpbCB3aXRoIGVycm9yOgo+IAo+IGxpYnhsOiBlcnJvcjogbGlieGxfcW1wLmM6MzQxOnFt
cF9oYW5kbGVfZXJyb3JfcmVzcG9uc2U6IERvbWFpbiAxOnJlY2VpdmVkIGFuCj4gZXJyb3IgbWVz
c2FnZSBmcm9tIFFNUCBzZXJ2ZXI6IER1cGxpY2F0ZSBJRCAncGNpLXB0LTYwXzAwLjAnIGZvciBk
ZXZpY2UKPiAKPiAyLiBBY2Nlc3NlcyB0byBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSBpbiBRZW11
IG1heSBvdmVybGFwIHdpdGggbGF0ZXIgZGV2aWNlCj4gcmVzZXQgaXNzdWVkIGJ5ICd4bCcgb3Ig
YnkgcGNpYmFjay4KPiAKPiBJbiBvcmRlciB0byBhdm9pZCBtZW50aW9uZWQgcXVlc3Rpb25zLCB3
YWl0IGZvciB0aGUgY29tcGxldGlvbiBvZiBkZXZpY2UKPiByZW1vdmFsIGJ5IHF1ZXJ5aW5nIGFs
bCBwY2kgZGV2aWNlcyB1c2luZyBxbXAgY29tbWFuZCBhbmQgZW5zdXJpbmcgdGhlIHRhcmdldAo+
IGRldmljZSBpc24ndCBsaXN0ZWQuIE9ubHkgcmV0cnkgNSB0aW1lcyB0byBhdm9pZCAneGwnIHBv
dGVudGlhbGx5IGJlaW5nIGJsb2NrZWQKPiBieSBxZW11Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBC
cmVhayBvdXQgZWFybHkgaWYgd2UgZm91bmQgYW4gZXJyb3IgZHVyaW5nIHF1ZXJ5aW5nIHBjaSBk
ZXZpY2VzLgo+ICAtIFByaW50IGEgbWVzc2FnZSB0byB3YXJuIGFkbWluIHRoYXQgZGV2aWNlIHJl
bW92YWwgbWF5IG5vdCBiZSBkb25lCj4gICAgaW4gZGV2aWNlIG1vZGVsJ3Mgc2lkZS4KClJldmll
d2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
