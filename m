Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A206E946
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 18:45:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoVxk-0004ZJ-Qd; Fri, 19 Jul 2019 16:42:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vi2/=VQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hoVxj-0004ZE-JY
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 16:42:27 +0000
X-Inumbo-ID: 30b5a34e-aa44-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30b5a34e-aa44-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 16:42:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vFwHmBIakjm0A0YiaMgZ/vDbzZGbZU/e2K0YFCrPZ8WPckhEE2NHdF2tZ3m/a0K0TU4/IMW0c7
 CIshkBrHdqP6yq0A4hxTvVWQ4f5HueP/RwItYe8L7FMGJ3DcLlQ10zMMgnKdr9pBxB1VJlc0dn
 BKSPSFz/UPFKCvnFqNHKgwv64HnQGrzY3okl9QDbge3H8kLCPD4qMOBQPVxcp4R/hvl7+XyC1u
 KSc7Q2DB0FzzwUp6xeR/bXufBidQmN7C2P7Kjtkqmt3l4vrgHwE39KTnhFYN2KQ5ScmFtRnTvy
 htQ=
X-SBRS: 2.7
X-MesageID: 3284133
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,283,1559534400"; 
   d="scan'208";a="3284133"
Date: Fri, 19 Jul 2019 17:42:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190719164223.GE1208@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <aafe1ed8-74e3-02b7-0156-5ff1b5589869@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafe1ed8-74e3-02b7-0156-5ff1b5589869@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v3 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MjE6MTNQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IFRoZSBwYXRjaGVzIG9uIHRoZSBsaXN0IGFyZSBtYWxmb3JtZWQuIFRoZXkgaGF2ZQo+
IAo+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IHF1b3RlZC1wcmludGFibGUKPiAKPiB3aGlj
aCBpcyBmaW5lLCBpbiBpdHNlbGY7IGhvd2V2ZXIsIHRoZXkgaGF2ZSBDUi1DUi1MRiBsaW5lIHRl
cm1pbmF0b3JzLgo+IAo+IEZvciBleGFtcGxlLCBmcm9tIHRoZSBmaXJzdCBwYXRjaDoKPiAKPiBk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGli
LmluZiBiL092bWZQa2cvTD0KPiBpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIu
aW5mCj4gaW5kZXggN2M0NGY5OWE1Yy4uMmYyNGRhYzg3ZiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtn
L0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mCj4gKysrIGIvT3ZtZlBr
Zy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZgo+IEBAIC0zMCw0ICsz
MCw1IEBAIFtQYWNrYWdlc10KPiAgW0xpYnJhcnlDbGFzc2VzXT0wRD0wRAo+ICAgIERlYnVnTGli
PTBEPTBECj4gICAgSW9MaWI9MEQ9MEQKPiArICBQY2lMaWI9MEQ9MEQKPiAgICBUaW1lckxpYj0w
RD0wRAo+IAo+IE5vdGUgIj0wRD0wRCIuCj4gCj4gTm93LCBpZiBJIHRyeSB0byBhcHBseSB0aGlz
IGZ1bGwgc2V0IHdpdGggZ2l0LWFtIGxpa2UgdGhhdCwgdGhlIGZpcnN0Cj4gcGF0Y2ggaW4gdGhl
IHNlcmllcyBhcHBsaWVzLCBidXQgdGhlIHNlY29uZCBzdGlsbCBmYWlsczoKPiAKPiA+IGVycm9y
OiBjb3JydXB0IHBhdGNoIGF0IGxpbmUgMjMKPiA+IFBhdGNoIGZhaWxlZCBhdCAwMDAyIE92bWZQ
a2c6IENyZWF0ZSBwbGF0Zm9ybSBPdm1mWGVuCj4gCj4gQmFzZWQgb24gdGhlIGVtYWlsIGhlYWRl
cnMsIHRoZSAiaXBobXguY29tIiByZWZlcmVuY2VzIHN1Z2dlc3QgKHZpYSBhCj4gZ29vZ2xlIHNl
YXJjaCkgIkNpc2NvJ3MgSXJvbnBvcnQgQ2xvdWQgZW1haWwgc2VydmljZSIuCj4gCj4gSSB0aGlu
ayB0aGF0IGVtYWlsIHNlcnZpY2UgKE1UQSkgaXMgYnJva2VuLgo+IAo+IElmIHlvdSBjb3VsZCB1
c2UgYSBkaWZmZXJlbnQgTVRBIChvciBnZXQgdGhlIGN1cnJlbnQgb25lIGZpeGVkKSwgdGhhdAo+
IHdvdWxkIGJlIGhlbHBmdWwuIChZZXMsIHllczogaWYgdGhlIGVkazIgcHJvamVjdCBkaWRuJ3Qg
dXNlIENSTEYgbGluZQo+IHRlcm1pbmF0b3JzLCB0aGF0IHdvdWxkIGJlICpldmVuIG1vcmUqIGhl
bHBmdWwuKQoKSSdtIG5vdCBzdXJlIHRoYXQgdXNpbmcgYSBkaWZmZXJlbnQgTVRBIGlzIGdvaW5n
IHRvIGhlbHAuIEkgZG9uJ3QgdGhpbmsKSSBjYW4gZmluZCBhIHBhdGNoIG9uIHRoZSBsaXN0IHRo
YXQgSSBjYW4gYXBwbHkgKHdpdGhvdXQgdXNpbmcgdW5peDJkb3MpLgpJIGRpZCBzZW5kIGEgcGF0
Y2ggdG8gbXkgZ21haWwgYWRkcmVzcywgYW5kIGl0IGxvb2tzIGZpbmUgKD0wRCBpbiB0aGUKZXhw
ZWN0ZWQgcGxhY2VzIGFuZCBub3doZXJlIGVsc2UpLiBTbyBtYXliZSB3aGVuIGEgcGF0Y2ggaXMg
c2VudCB0aHJvdWdoCmEgbWFpbGluZyBsaXN0LCBzb21lIG1vcmUgZm9ybWF0aW5nIGlzIGRvbmU/
CgpBbnl3YXksIGNhbiBJIHRyeSBzZW5kaW5nIHBhdGNoIGVuY29kZWQgaW4gYmFzZTY0IGluc3Rl
YWQgb2YKcXVvdGVkLXByaW50YWJsZT8gVGhhdCB3b3VsZCBwcm9iYWJseSB3b3JrIGJldHRlci4K
CkkgZm91bmQgPDIwMTkwNzA0MDQwNzMxLjUzMDMtMS1nbGluQHN1c2UuY29tPiBvbiB0aGUgbGlz
dCB0aGF0IGlzIGJhc2U2NAplbmNvZGVkLCB0aGF0IEkgY2FuIGVhc2lseSBhcHBseSBhbmQgcGF0
Y2hldyB0b28uCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
