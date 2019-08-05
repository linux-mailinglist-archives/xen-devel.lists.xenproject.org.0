Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA081FC8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueYh-0004Rx-9o; Mon, 05 Aug 2019 15:05:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wcQ6=WB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hueYg-0004Rs-F1
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:05:58 +0000
X-Inumbo-ID: 86fcc2fd-b792-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86fcc2fd-b792-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 15:05:57 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Asruckw4Kd7yx9zLF4l8H2K+AfwH5kjIYDqRKYCFX6Ai5JQQ/D+fKAOROSj/mssA1htd5z1CGW
 v11bZ6VBbDyanLn14WzLDdQzj+krYwmMXKY0OrR0RYeV8V9TvZ8jgjgcOwDqlcEEBVR0sOs+yl
 fx+6eiuJKOwNw53+9oHMReVMY2cJOHPdOyuVrrl1Q6QQVn7ud6QgAsDx8j4iWt/PJRmLX88k24
 zRJl4MzT/TN/Hk7sF7KevwyzlJnGblo4WpcllYbudHE5ysHzatJM6WHGioWTA3rNXtT5wHz5Dj
 9xg=
X-SBRS: 2.7
X-MesageID: 3911709
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3911709"
Date: Mon, 5 Aug 2019 16:05:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190805150554.GK1242@perard.uk.xensource.com>
References: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
 <20190703160317.GM13449@perard.uk.xensource.com>
 <20190719013839.GA8955@gao-cwp>
 <23880.16715.608881.373298@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23880.16715.608881.373298@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDM6NDY6MzVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRnJvbSBiZmYwYjVkZmI2OTI1NDZhMTJlMWYzZTEyNGI2NjkxOTU1NTYwMTEyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+IERhdGU6IE1vbiwgNSBBdWcgMjAxOSAxNTo0NDo0NiArMDEwMAo+IFN1Ympl
Y3Q6IFtQQVRDSCBSRkNdOiB0b29sczogbGlieGxfcW1wOiBEZXByZWNhdGUgc3luY2hyb25vdXMg
aW50ZXJmYWNlCj4gCj4gQ3VycmVudGx5IGl0IGlzIG5vdCBhbHdheXMgcG9zc2libGUgdG8gdXNl
IHRoZSBhc3luY2hyb25vdXMgaW50ZXJmYWNlCj4gYmVjYXVzZSB0aGUgdHdvIHFtcCBjb25uZWN0
aW9uIHN0cnVjdHMgbGlieGxfX2V2X3FtcCBhbmQKPiBsaWJ4bF9fcW1wX2hhbmRsZXIgYXJlIGRp
ZmZlcmVudCBhbmQgaW5jb21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9x
bXAuYyB8IDE2ICsrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKPiBpbmRleCA5YzQ0ODBhMmIxLi5jMDY2
N2ExNTIwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCj4gKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfcW1wLmMKPiBAQCAtMjMsMTcgKzIzLDIzIEBACj4gIAo+ICAvKgo+ICAg
KiBMb2dpYyB1c2VkIHRvIHNlbmQgY29tbWFuZCB0byBRRU1VCj4gKyAqLwo+ICsKPiArLyoKPiAr
ICogKkRFUFJFQ0FURUQqICBObyBuZXcgY2FsbHMgdG8gdGhlc2UgZnVuY3Rpb24gc2hvdWxkIGJl
IGludHJvZHVjZWQsCj4gKyAqIGlkZWFsbHkuICBJbnN0ZWFkLCB3aGVyZSBwb3NzaWJsZSwgdXNl
IHRoZSBhc3luY2hyb25vdXMgY2FsbHMsIHNlZQo+ICsgKiAiUU1QIGFzeW5jaHJvbm91cyBjYWxs
cyIgaW4gbGlieGxfaW50ZXJuYWwuaC4KPiAgICoKPiAtICogcW1wX29wZW4oKToKPiArICogcW1w
X29wZW4oKTogKkRFUFJFQ0FURUQqCj4gICAqICBXaWxsIG9wZW4gYSBzb2NrZXQgYW5kIGNvbm5l
Y3QgdG8gUUVNVS4KPiAgICoKPiAtICogcW1wX25leHQoKToKPiArICogcW1wX25leHQoKTogKkRF
UFJFQ0FURUQqCj4gICAqICBXaWxsIHJlYWQgZGF0YSBzZW50IGJ5IFFFTVUgYW5kIHRoZW4gY2Fs
bCBxbXBfaGFuZGxlX3Jlc3BvbnNlKCkgb25jZSBhCj4gICAqICBjb21wbGV0ZSBRTVAgbWVzc2Fn
ZSBpcyByZWNlaXZlZC4KPiAgICogIFRoZSBmdW5jdGlvbiByZXR1cm4gb24gdGltZW91dC9lcnJv
ciBvciBvbmNlIGV2ZXJ5IGRhdGEgcmVjZWl2ZWQgYXMgYmVlbgo+ICAgKiAgcHJvY2Vzc2VkLgo+
ICAgKgo+IC0gKiBxbXBfaGFuZGxlX3Jlc3BvbnNlKCkKPiArICogcW1wX2hhbmRsZV9yZXNwb25z
ZSgpICpERVBSRUNBVEVEKgo+ICAgKiAgVGhpcyBwcm9jZXNzIGpzb24gbWVzc2FnZXMgcmVjZWl2
ZWQgZnJvbSBRRU1VIGFuZCB1cGRhdGUgZGlmZmVyZW50IGxpc3QgYW5kCj4gICAqICBtYXkgY2Fs
bCBjYWxsYmFjayBmdW5jdGlvbi4KPiAgICogIGBsaWJ4bF9fcW1wX2hhbmRsZXIud2FpdF9mb3Jf
aWRgIGlzIHJlc2V0IG9uY2UgYSBtZXNzYWdlIHdpdGggdGhpcyBJRCBpcwo+IEBAIC00MiwxMiAr
NDgsMTIgQEAKPiAgICogICAgb3B0aW9uYWwgYXNzb3RpYXRlZCBjYWxsYmFjayBmdW5jdGlvbi4g
VGhlIHJldHVybiB2YWx1ZSBvZiBhIGNhbGxiYWNrIGlzCj4gICAqICAgIHNldCBpbiBjb250ZXh0
Lgo+ICAgKgo+IC0gKiBxbXBfc2VuZCgpOgo+ICsgKiBxbXBfc2VuZCgpOiAqREVQUkVDQVRFRCoK
PiAgICogIFNpbXBseSBwcmVwYXJlIGEgUU1QIGNvbW1hbmQgYW5kIHNlbmQgaXQgdG8gUUVNVS4K
PiAgICogIEl0IGFsc28gYWRkIGEgYHN0cnVjdCBjYWxsYmFja19pZF9wYWlyYCBvbiB0aGUKPiAg
ICogIGBsaWJ4bF9fcW1wX2hhbmRsZXIuY2FsbGJhY2tfbGlzdGAgdmlhIHFtcF9zZW5kX3ByZXBh
cmUoKS4KPiAgICoKPiAtICogcW1wX3N5bmNocm9ub3VzX3NlbmQoKToKPiArICogcW1wX3N5bmNo
cm9ub3VzX3NlbmQoKTogKkRFUFJFQ0FURUQqCj4gICAqICBUaGlzIGZ1bmN0aW9uIGNhbGxzIHFt
cF9zZW5kKCksIHRoZW4gd2FpdCBmb3IgUUVNVSB0byByZXBseSB0byB0aGUgY29tbWFuZC4KPiAg
ICogIFRoZSB3YWl0IGlzIGRvbmUgYnkgY2FsbGluZyBxbXBfbmV4dCgpIG92ZXIgYW5kIG92ZXIg
YWdhaW4gdW50aWwgZWl0aGVyCj4gICAqICB0aGVyZSBpcyBhIHJlc3BvbnNlIGZvciB0aGUgY29t
bWFuZCBvciB0aGVyZSBpcyBhbiBlcnJvci4KCkxvb2tzIGZpbmUsIGJ1dCBtYXliZSB5b3Ugd291
bGQgbGlrZSB0byBhZGQgc29tZSBtb3JlICJkZXByZWNhdGVkIiBpbgpsaWJ4bF9pbnRlcm5hbC5o
LCBmb3IgdGhlIHR5cGUgYGxpYnhsX19xbXBfaGFuZGxlcicgYW5kIHRoZSBmdW5jdGlvbgpsaWJ4
bF9fcW1wX2luaXRpYWxpemUoKSBhbmQgbGlieGxfX3FtcF9jbG9zZSgpLgoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
