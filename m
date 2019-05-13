Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1A1B9D6
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:23:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCkY-0007nY-2X; Mon, 13 May 2019 15:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQCkW-0007nQ-7l
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:20:20 +0000
X-Inumbo-ID: 9b52e0a2-7592-11e9-b1c7-4fc44896899e
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b52e0a2-7592-11e9-b1c7-4fc44896899e;
 Mon, 13 May 2019 15:20:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89709715"
Date: Mon, 13 May 2019 17:20:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513165321.464fdeaf.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NTM6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gV2hhdCBpcyB0aGUgcmVjb21tZW5kZWQgd2F5IHRvIGRpc2FibGUgQ09ORklHX1BWX1NI
SU0sIHdoaWNoIGlzIHNldCBpbgo+IHRvb2xzL2Zpcm13YXJlL01ha2VmaWxlPyBGcm9tIG15IHVu
ZGVyc3RhbmRpbmcgdGhlcmUgaXMgbm8gd2F5IHRvIGluZmx1ZW5jZQo+IGl0cyB2YWx1ZSBmcm9t
IG91dHNpZGUsIHdoaWNoIG1lYW5zIHRoZSBidWlsZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgoK
SSB0aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBkbyB0aGUgdHJpY2suCgpMZXQgbWUga25vdyBp
ZiB0aGF0IHdvcmtzIGZvciB5b3UgYW5kIEkgd2lsbCBzdWJtaXQgaXQgZm9ybWFsbHkuCgpUaGFu
a3MhCgotLS04PC0tLQpkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29uZmlnL1Rv
b2xzLm1rLmluCmluZGV4IDk4MjQ1ZjYzYzkuLjg0ZGRiMWE1NDIgMTAwNjQ0Ci0tLSBhL2NvbmZp
Zy9Ub29scy5tay5pbgorKysgYi9jb25maWcvVG9vbHMubWsuaW4KQEAgLTc1LDMgKzc1LDUgQEAg
VElORk9fTElCUyAgICAgICAgICA6PSBAVElORk9fTElCU0AKIEFSR1BfTERGTEFHUyAgICAgICAg
Oj0gQGFyZ3BfbGRmbGFnc0AKIAogRklMRV9PRkZTRVRfQklUUyAgICA6PSBARklMRV9PRkZTRVRf
QklUU0AKKworQ09ORklHX1BWX1NISU0gICAgICA6PSBAcHZzaGltQApkaWZmIC0tZ2l0IGEvdG9v
bHMvY29uZmlndXJlLmFjIGIvdG9vbHMvY29uZmlndXJlLmFjCmluZGV4IGM5ZmQ2OWRkZmEuLjhk
ZjJmZDYwNGIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYworKysgYi90b29scy9jb25m
aWd1cmUuYWMKQEAgLTQ5Miw0ICs0OTIsMTUgQEAgQUNfQVJHX0VOQUJMRShbOXBmc10sCiAKIEFD
X1NVQlNUKG5pbmVwZnMpCiAKK0FDX0FSR19FTkFCTEUoW3B2c2hpbV0sCisgICAgQVNfSEVMUF9T
VFJJTkcoWy0tZGlzYWJsZS1wdnNoaW1dLCBbRGlzYWJsZSBwdnNoaW0gYnVpbGQgKHg4NiBvbmx5
LCBlbmFibGVkIGJ5IGRlZmF1bHQpXSksCisgICAgW0FTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9wdnNo
aW0iID0gInhubyJdLCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0sIFsKKyAgICBjYXNlICIkaG9z
dF9jcHUiIGluCisgICAgICAgIGlbWzM0NTZdXTg2fHg4Nl82NCkKKyAgICAgICAgICAgcHZzaGlt
PSJ5Ijs7CisgICAgICAgICopIHB2c2hpbT0ibiI7OworICAgIGVzYWMKKyAgICAgXSkKK0FDX1NV
QlNUKHB2c2hpbSkKKwogQUNfT1VUUFVUKCkKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL01h
a2VmaWxlIGIvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKaW5kZXggY2YzMDRmYzU3OC4uODA5YTVm
ZDAyNSAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmly
bXdhcmUvTWFrZWZpbGUKQEAgLTEsMTAgKzEsNiBAQAogWEVOX1JPT1QgPSAkKENVUkRJUikvLi4v
Li4KIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvUnVsZXMubWsKIAotaWZuZXEgKCQoWEVOX1RB
UkdFVF9BUkNIKSx4ODZfMzIpCi1DT05GSUdfUFZfU0hJTSA6PSB5Ci1lbmRpZgotCiAjIGh2bWxv
YWRlciBpcyBhIDMyLWJpdCBwcm90ZWN0ZWQgbW9kZSBiaW5hcnkuCiBUQVJHRVQgICAgICA6PSBo
dm1sb2FkZXIvaHZtbG9hZGVyCiBJTlNUX0RJUiA6PSAkKERFU1RESVIpJChYRU5GSVJNV0FSRURJ
UikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
