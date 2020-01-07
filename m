Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C4132096
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 08:40:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iojRP-0004Ed-5x; Tue, 07 Jan 2020 07:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iojRO-0004ET-9I
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 07:38:14 +0000
X-Inumbo-ID: a866d3f8-3120-11ea-abae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a866d3f8-3120-11ea-abae-12813bfff9fa;
 Tue, 07 Jan 2020 07:38:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2BFEAAD0;
 Tue,  7 Jan 2020 07:38:11 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
Message-ID: <2fe65299-a651-d645-3b31-58e1527614e2@suse.com>
Date: Tue, 7 Jan 2020 08:38:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] VT-d: adjust log messages in
 domain_context_mapping_one()
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIG1pc3NpbmcgbmV3bGluZXMsIHVzZSAlcGQsIGFuZCBkcm9wIGV4Y2xhbWF0aW9uIG1hcmtz
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTEzMDgsMTAgKzEzMDgsOSBAQCBpbnQgZG9tYWluX2Nv
bnRleHRfbWFwcGluZ19vbmUoCiAgICAgICAgICAgICBpZiAoIHBkZXYtPmRvbWFpbiAhPSBkb21h
aW4gKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19JTkZP
IFZURFBSRUZJWAotICAgICAgICAgICAgICAgICAgICAgICAiZCVkOiAlMDR4OiUwMng6JTAyeC4l
dSBvd25lZCBieSBkJWQhIiwKLSAgICAgICAgICAgICAgICAgICAgICAgZG9tYWluLT5kb21haW5f
aWQsCi0gICAgICAgICAgICAgICAgICAgICAgIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBD
SV9GVU5DKGRldmZuKSwKLSAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluID8gcGRl
di0+ZG9tYWluLT5kb21haW5faWQgOiAtMSk7CisgICAgICAgICAgICAgICAgICAgICAgICIlcGQ6
ICUwNHg6JTAyeDolMDJ4LiV1IG93bmVkIGJ5ICVwZFxuIiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgZG9tYWluLCBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksCisg
ICAgICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbik7CiAgICAgICAgICAgICAgICAgcmVz
ID0gLUVJTlZBTDsKICAgICAgICAgICAgIH0KICAgICAgICAgfQpAQCAtMTMyMywxNiArMTMyMiwx
NSBAQCBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoCiAgICAgICAgICAgICBpZiAoIGNk
b21haW4gPCAwICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9H
X0dfV0FSTklORyBWVERQUkVGSVgKLSAgICAgICAgICAgICAgICAgICAgICAgImQlZDogJTA0eDol
MDJ4OiUwMnguJXUgbWFwcGVkLCBidXQgY2FuJ3QgZmluZCBvd25lciFcbiIsCi0gICAgICAgICAg
ICAgICAgICAgICAgIGRvbWFpbi0+ZG9tYWluX2lkLAotICAgICAgICAgICAgICAgICAgICAgICBz
ZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbikpOworICAgICAgICAgICAg
ICAgICAgICAgICAiJXBkOiAlMDR4OiUwMng6JTAyeC4ldSBtYXBwZWQsIGJ1dCBjYW4ndCBmaW5k
IG93bmVyXG4iLAorICAgICAgICAgICAgICAgICAgICAgICBkb21haW4sIHNlZywgYnVzLCBQQ0lf
U0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7CiAgICAgICAgICAgICAgICAgcmVzID0gLUVJ
TlZBTDsKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIGVsc2UgaWYgKCBjZG9tYWluICE9IGRv
bWFpbi0+ZG9tYWluX2lkICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBwcmludGso
WEVOTE9HX0dfSU5GTyBWVERQUkVGSVgKLSAgICAgICAgICAgICAgICAgICAgICAgImQlZDogJTA0
eDolMDJ4OiUwMnguJXUgYWxyZWFkeSBtYXBwZWQgdG8gZCVkISIsCi0gICAgICAgICAgICAgICAg
ICAgICAgIGRvbWFpbi0+ZG9tYWluX2lkLAorICAgICAgICAgICAgICAgICAgICAgICAiJXBkOiAl
MDR4OiUwMng6JTAyeC4ldSBhbHJlYWR5IG1hcHBlZCB0byBkJWRcbiIsCisgICAgICAgICAgICAg
ICAgICAgICAgIGRvbWFpbiwKICAgICAgICAgICAgICAgICAgICAgICAgc2VnLCBidXMsIFBDSV9T
TE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLAogICAgICAgICAgICAgICAgICAgICAgICBjZG9t
YWluKTsKICAgICAgICAgICAgICAgICByZXMgPSAtRUlOVkFMOwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
