Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF723094A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 09:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWbpp-0008MO-85; Fri, 31 May 2019 07:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+xl=T7=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hWbpn-0008MJ-MF
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:20:15 +0000
X-Inumbo-ID: 84ee20b6-8374-11e9-9549-c7d3e705f1a2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ee20b6-8374-11e9-9549-c7d3e705f1a2;
 Fri, 31 May 2019 07:20:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vZ/vfl2aWL/s2CrBoteUwRYksEByaVfCVcKUAHL+r/L7L0C9LKwCME3Jfwyqimk5UyqNI9Uekg
 QyY+0MYrqMjTsS+HXDmX8Ig34gUCd/4+8YpKfoxWA9ZZLIeLbZEKqavso5sj5z/7yfTo3/U3nq
 f8EDO5tH1IOUpds654nQ3M9asmbrkTU9/32zOEidozr3I67zQ/Pg3ESHZ95IoEUq8PCp/wEqWb
 22RcvvBK22nkB8FFw2j9Y3r9cgDfsq8dI/5VnfrwHVC2+LLZ4uKyXQN3hJcA6M1FCzW3hk2A91
 ZG8=
X-SBRS: 2.7
X-MesageID: 1142044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1142044"
Date: Fri, 31 May 2019 08:20:05 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20190531072005.GC25537@zion.uk.xensource.com>
References: <20190530190438.9571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xen-netback: remove redundant assignment to
 err
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
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDg6MDQ6MzhQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSB2YXJpYWJsZSBlcnIgaXMgYXNzaWduZWQgd2l0aCB0aGUgdmFsdWUgLUVOT01FTSB0aGF0
IGlzIG5ldmVyCj4gcmVhZCBhbmQgaXQgaXMgcmUtYXNzaWduZWQgYSBuZXcgdmFsdWUgbGF0ZXIg
b24uICBUaGUgYXNzaWdubWVudCBpcwo+IHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFja2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL2ludGVyZmFjZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+IGluZGV4
IDc4MzE5ODg0NGRkNy4uMjQwZjc2MmIzNzQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL2ludGVyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50
ZXJmYWNlLmMKPiBAQCAtNjMzLDcgKzYzMyw3IEBAIGludCB4ZW52aWZfY29ubmVjdF9kYXRhKHN0
cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAo+ICAJCQl1bnNpZ25lZCBpbnQgcnhfZXZ0Y2huKQo+
ICB7Cj4gIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7Cj4gLQlpbnQgZXJyID0gLUVOT01FTTsK
PiArCWludCBlcnI7Cj4gIAo+ICAJQlVHX09OKHF1ZXVlLT50eF9pcnEpOwo+ICAJQlVHX09OKHF1
ZXVlLT50YXNrKTsKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
