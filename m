Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A581F6F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:49:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueGY-0002Z0-Q7; Mon, 05 Aug 2019 14:47:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hueGX-0002Yu-Ub
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:47:13 +0000
X-Inumbo-ID: e65b9a6e-b78f-11e9-b2d1-77dce7f23b16
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e65b9a6e-b78f-11e9-b2d1-77dce7f23b16;
 Mon, 05 Aug 2019 14:47:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oQWzPWoFeoRczdQpmTi0SvixK/Jjg+7FLo4p8Oy/jwNdb9iP8Givv9iAUanl6UulbtqnE1jB0k
 baYnqVv2Oe7Prn1IURFnEwkxKuR8Iycci2MDcd9KYDqGg6acE4FXr5h4qAKKybGMJt5xT23q/6
 U4DOt6v77O1QZreB0kMnoC3Y3nLWKF8QWOLa+eJrGmSC6XKI9RIXO5EVuDDQdD6EUxU3xs948K
 npdcQYXvPzH6TML2WaIHV0RRLpD0awBj1v5fUcj77Qo1e3oNFJCv3li8Qio/+8lT5YrVyJ9SAM
 7M8=
X-SBRS: 2.7
X-MesageID: 3877573
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3877573"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.16715.608881.373298@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 15:46:35 +0100
To: Chao Gao <chao.gao@intel.com>
In-Reply-To: <20190719013839.GA8955@gao-cwp>
References: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
 <20190703160317.GM13449@perard.uk.xensource.com>
 <20190719013839.GA8955@gao-cwp>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbyBHYW8gd3JpdGVzICgiUmU6IFtQQVRDSCB2Ml0gbGlieGxfcW1wOiB3YWl0IGZvciBjb21w
bGV0aW9uIG9mIGRldmljZSByZW1vdmFsIik6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6
MDM6MTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPk9uIFdlZCwgSnVsIDAzLCAy
MDE5IGF0IDAxOjU2OjEzUE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+ID4+IFRvIHJlbW92ZSBh
IGRldmljZSBmcm9tIGEgZG9tYWluLCBhIHFtcCBjb21tYW5kIGlzIHNlbnQgdG8gcWVtdS4gQnV0
IGl0IGlzCj4gPj4gaGFuZGxlZCBieSBxZW11IGFzeWNocm9ub3VzbHkuIEV2ZW4gdGhlIHFtcCBj
b21tYW5kIGlzIGNsYWltZWQgdG8gYmUgZG9uZSwKPiA+PiB0aGUgYWN0dWFsIGhhbmRsaW5nIGlu
IHFlbXUgc2lkZSBtYXkgaGFwcGVuIGxhdGVyLgo+ID4+IFRoaXMgYmVoYXZpb3IgYnJpbmdzIHR3
byBxdWVzdGlvbnM6Cj4gPj4gMS4gQXR0YWNoaW5nIGEgZGV2aWNlIGJhY2sgdG8gYSBkb21haW4g
cmlnaHQgYWZ0ZXIgZGV0YWNoaW5nIHRoZSBkZXZpY2UgZnJvbQo+ID4+IHRoYXQgZG9tYWluIHdv
dWxkIGZhaWwgd2l0aCBlcnJvcjoKPiA+PiAKPiA+PiBsaWJ4bDogZXJyb3I6IGxpYnhsX3FtcC5j
OjM0MTpxbXBfaGFuZGxlX2Vycm9yX3Jlc3BvbnNlOiBEb21haW4gMTpyZWNlaXZlZCBhbgo+ID4+
IGVycm9yIG1lc3NhZ2UgZnJvbSBRTVAgc2VydmVyOiBEdXBsaWNhdGUgSUQgJ3BjaS1wdC02MF8w
MC4wJyBmb3IgZGV2aWNlCj4gPj4gCj4gPj4gMi4gQWNjZXNzZXMgdG8gUENJIGNvbmZpZ3VyYXRp
b24gc3BhY2UgaW4gUWVtdSBtYXkgb3ZlcmxhcCB3aXRoIGxhdGVyIGRldmljZQo+ID4+IHJlc2V0
IGlzc3VlZCBieSAneGwnIG9yIGJ5IHBjaWJhY2suCj4gPj4gCj4gPj4gSW4gb3JkZXIgdG8gYXZv
aWQgbWVudGlvbmVkIHF1ZXN0aW9ucywgd2FpdCBmb3IgdGhlIGNvbXBsZXRpb24gb2YgZGV2aWNl
Cj4gPj4gcmVtb3ZhbCBieSBxdWVyeWluZyBhbGwgcGNpIGRldmljZXMgdXNpbmcgcW1wIGNvbW1h
bmQgYW5kIGVuc3VyaW5nIHRoZSB0YXJnZXQKPiA+PiBkZXZpY2UgaXNuJ3QgbGlzdGVkLiBPbmx5
IHJldHJ5IDUgdGltZXMgdG8gYXZvaWQgJ3hsJyBwb3RlbnRpYWxseSBiZWluZyBibG9ja2VkCj4g
Pj4gYnkgcWVtdS4KLi4uCj4gQ291bGQgd2UgbWVyZ2UgdGhpcyBwYXRjaD8gb3IgbmVlZCBjb21t
ZW50cyBmcm9tIHNvbWVvbmUgZWxzZT8KCkkgc2VlIHRoaXMgcGF0Y2ggd2FzIGluIGZhY3QgbWVy
Z2VkLgoKSG93ZXZlciwgdGhlcmUgaXMgYSBwcm9ibGVtLgoKSXQgYWRkcyBhIG5ldyBjYWxsIHRv
ICJxbXBfc3luY2hyb25vdXNfc2VuZCIuICBXZSBoYXZlIGJlZW4gdHJ5aW5nIHRvCm1ha2UgbGli
eGwgbm90IHRydXN0IHFlbXUgYW5kIHRoYXQgbWVhbnMgYWJvbGlzaGluZyBhbGwgdXNlcyBvZgpx
bXBfc3luY2hyb25vdXNfc2VuZC4gIE5vdyBJIGtub3cgdGhhdCBjdXJyZW50bHkgd2UgaGF2ZW4n
dCBkb25lIHRoYXQKZm9yIFBDSSBwYXNzdGhyb3VnaCBidXQgd2Ugc2hvdWxkIG5vdCBiZSBhZGRp
bmcgbW9yZSB0ZWNobmNpYWwgZGVidAp1bmxlc3Mgd2UgaGF2ZSB0by4KClVuZm9ydHVuYXRlbHkg
dGhlIHBsYWNlIHdoZXJlIHRoaXMgcGF0Y2ggaGFzIHRvIGFkZCBjb2RlIGFscmVhZHkgdXNlcwp0
aGlzIHN5bmNocm9ub3VzIGludGVyZmFjZSBhbmQgY3VycmVudGx5IGl0IGlzIHRoZXJlZm9yZSBu
b3QgZWFzeSB0bwpkbyB3aGF0IENoYW8gR2FvIG5lZWRlZCB0byBkby4gIFNvIGl0IHdhcyBwcm9i
YWJseSByaWdodCB0byBhY2NlcHQKdGhpcyBwYXRjaC4KCk1heWJlIHdlIHNob3VsZCBpbnRyb2R1
Y2UgYSB0aGluZyB3aGljaCBjYW4gbWFrZSBhIGxpYnhsX19ldl9xbXAgZnJvbQphIGxpYnhsX19x
bXBfaGFuZGxlciwgb3IgbWFrZSBsaWJ4bF9fcW1wX2hhbmRsZXIgY29udGFpbiBhCmxpYnhsX19l
dl9xbXAsIG9yIHNvbWV0aGluZyA/ICBJZiB3ZSBoYWQgaGFkIHRoYXQsIENoYW8gR2FvIGNvdWxk
IGhhdmUKcHJvdmlkZWQgYSBwYXRjaCBpbnRyb2R1Y2luZyBuZXcgY2FsbHMgdG8gbGlieGxfX2V2
X3FtcF9zZW5kIGV0Yy4KCkFkZGl0aW9uYWxseTogaXMgaXQgcmVhbGx5IHRoZSBjYXNlIHRoYXQg
dGhlcmUgaXMgbm8gd2F5IHRvIGhhdmUgcWVtdQpzZW5kIHVzIGEgc2lnbmFsIHdoZW4gdGhlIHdv
cmsgaXMgZG9uZSA/ICBUaGlzIHBvbGxpbmcgaXMgcmF0aGVyIHBvb3IuCgpUaGFua3MsCklhbi4K
CkZyb20gYmZmMGI1ZGZiNjkyNTQ2YTEyZTFmM2UxMjRiNjY5MTk1NTU2MDExMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CkRhdGU6IE1vbiwgNSBBdWcgMjAxOSAxNTo0NDo0NiArMDEwMApTdWJqZWN0OiBbUEFUQ0gg
UkZDXTogdG9vbHM6IGxpYnhsX3FtcDogRGVwcmVjYXRlIHN5bmNocm9ub3VzIGludGVyZmFjZQoK
Q3VycmVudGx5IGl0IGlzIG5vdCBhbHdheXMgcG9zc2libGUgdG8gdXNlIHRoZSBhc3luY2hyb25v
dXMgaW50ZXJmYWNlCmJlY2F1c2UgdGhlIHR3byBxbXAgY29ubmVjdGlvbiBzdHJ1Y3RzIGxpYnhs
X19ldl9xbXAgYW5kCmxpYnhsX19xbXBfaGFuZGxlciBhcmUgZGlmZmVyZW50IGFuZCBpbmNvbXBh
dGlibGUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDE2ICsrKysrKysrKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMK
aW5kZXggOWM0NDgwYTJiMS4uYzA2NjdhMTUyMCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTIzLDE3ICsyMywyMyBA
QAogCiAvKgogICogTG9naWMgdXNlZCB0byBzZW5kIGNvbW1hbmQgdG8gUUVNVQorICovCisKKy8q
CisgKiAqREVQUkVDQVRFRCogIE5vIG5ldyBjYWxscyB0byB0aGVzZSBmdW5jdGlvbiBzaG91bGQg
YmUgaW50cm9kdWNlZCwKKyAqIGlkZWFsbHkuICBJbnN0ZWFkLCB3aGVyZSBwb3NzaWJsZSwgdXNl
IHRoZSBhc3luY2hyb25vdXMgY2FsbHMsIHNlZQorICogIlFNUCBhc3luY2hyb25vdXMgY2FsbHMi
IGluIGxpYnhsX2ludGVybmFsLmguCiAgKgotICogcW1wX29wZW4oKToKKyAqIHFtcF9vcGVuKCk6
ICpERVBSRUNBVEVEKgogICogIFdpbGwgb3BlbiBhIHNvY2tldCBhbmQgY29ubmVjdCB0byBRRU1V
LgogICoKLSAqIHFtcF9uZXh0KCk6CisgKiBxbXBfbmV4dCgpOiAqREVQUkVDQVRFRCoKICAqICBX
aWxsIHJlYWQgZGF0YSBzZW50IGJ5IFFFTVUgYW5kIHRoZW4gY2FsbCBxbXBfaGFuZGxlX3Jlc3Bv
bnNlKCkgb25jZSBhCiAgKiAgY29tcGxldGUgUU1QIG1lc3NhZ2UgaXMgcmVjZWl2ZWQuCiAgKiAg
VGhlIGZ1bmN0aW9uIHJldHVybiBvbiB0aW1lb3V0L2Vycm9yIG9yIG9uY2UgZXZlcnkgZGF0YSBy
ZWNlaXZlZCBhcyBiZWVuCiAgKiAgcHJvY2Vzc2VkLgogICoKLSAqIHFtcF9oYW5kbGVfcmVzcG9u
c2UoKQorICogcW1wX2hhbmRsZV9yZXNwb25zZSgpICpERVBSRUNBVEVEKgogICogIFRoaXMgcHJv
Y2VzcyBqc29uIG1lc3NhZ2VzIHJlY2VpdmVkIGZyb20gUUVNVSBhbmQgdXBkYXRlIGRpZmZlcmVu
dCBsaXN0IGFuZAogICogIG1heSBjYWxsIGNhbGxiYWNrIGZ1bmN0aW9uLgogICogIGBsaWJ4bF9f
cW1wX2hhbmRsZXIud2FpdF9mb3JfaWRgIGlzIHJlc2V0IG9uY2UgYSBtZXNzYWdlIHdpdGggdGhp
cyBJRCBpcwpAQCAtNDIsMTIgKzQ4LDEyIEBACiAgKiAgICBvcHRpb25hbCBhc3NvdGlhdGVkIGNh
bGxiYWNrIGZ1bmN0aW9uLiBUaGUgcmV0dXJuIHZhbHVlIG9mIGEgY2FsbGJhY2sgaXMKICAqICAg
IHNldCBpbiBjb250ZXh0LgogICoKLSAqIHFtcF9zZW5kKCk6CisgKiBxbXBfc2VuZCgpOiAqREVQ
UkVDQVRFRCoKICAqICBTaW1wbHkgcHJlcGFyZSBhIFFNUCBjb21tYW5kIGFuZCBzZW5kIGl0IHRv
IFFFTVUuCiAgKiAgSXQgYWxzbyBhZGQgYSBgc3RydWN0IGNhbGxiYWNrX2lkX3BhaXJgIG9uIHRo
ZQogICogIGBsaWJ4bF9fcW1wX2hhbmRsZXIuY2FsbGJhY2tfbGlzdGAgdmlhIHFtcF9zZW5kX3By
ZXBhcmUoKS4KICAqCi0gKiBxbXBfc3luY2hyb25vdXNfc2VuZCgpOgorICogcW1wX3N5bmNocm9u
b3VzX3NlbmQoKTogKkRFUFJFQ0FURUQqCiAgKiAgVGhpcyBmdW5jdGlvbiBjYWxscyBxbXBfc2Vu
ZCgpLCB0aGVuIHdhaXQgZm9yIFFFTVUgdG8gcmVwbHkgdG8gdGhlIGNvbW1hbmQuCiAgKiAgVGhl
IHdhaXQgaXMgZG9uZSBieSBjYWxsaW5nIHFtcF9uZXh0KCkgb3ZlciBhbmQgb3ZlciBhZ2FpbiB1
bnRpbCBlaXRoZXIKICAqICB0aGVyZSBpcyBhIHJlc3BvbnNlIGZvciB0aGUgY29tbWFuZCBvciB0
aGVyZSBpcyBhbiBlcnJvci4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
