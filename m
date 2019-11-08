Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9CCF4039
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:09:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSxQb-0005zX-Uk; Fri, 08 Nov 2019 06:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSxQa-0005zO-GF
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:07:24 +0000
X-Inumbo-ID: 07a0ac98-01ee-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07a0ac98-01ee-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 06:07:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC177AEF3;
 Fri,  8 Nov 2019 06:07:22 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191031121727.287419-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <31745372-dc15-de50-679f-d79c2d5a495e@suse.com>
Date: Fri, 8 Nov 2019 07:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031121727.287419-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl_pci: Don't hold QMP
 connection while waiting
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMTkgMTM6MTcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFmdGVyIHNlbmRpbmcg
dGhlICdkZXZpY2VfZGVsJyBjb21tYW5kIGZvciBhIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2UsCj4g
d2Ugd2FpdCB1bnRpbCBRRU1VIGhhcyBlZmZlY3RpdmVseSBkZWxldGVkIHRoZSBkZXZpY2UsIHRo
aXMgaW52b2x2ZXMKPiBleGVjdXRpbmcgbW9yZSBRTVAgY29tbWFuZHMuIFdoaWxlIHdhaXRpbmcs
IGxpYnhsIGhvbGQgdGhlIGNvbm5lY3Rpb24uCj4gCj4gSXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGhv
bGQgdGhlIGNvbm5lY3Rpb24gYW5kIGl0IHByZXZlbnRzIG90aGVycyBmcm9tCj4gbWFraW5nIHBy
b2dyZXNzLCBzbyB0aGlzIHBhdGNoIHJlbGVhc2VzIHRoZSBRTVAgY29ubmVjdGlvbi4KPiAKPiBG
b3IgYmFja2dyb3VuZDoKPiAgICAgIGUuZy4sIHdoZW4gYSBndWVzdCBpcyBjcmVhdGVkIHdpdGgg
c2V2ZXJhbCBwY2kgcGFzc3Rocm91Z2gKPiAgICAgIGF0dGFjaGVkLCBvbiBgeGwgZGVzdHJveWAg
YWxsIHRoZSBkZXZpY2VzIG5lZWRzIHRvIGJlIGRldGFjaCwgYW5kCj4gICAgICB0aGlzIGlzIHVz
dWFsbHkgd2hhdCBoYXBwZW5zOgo+IAktICdkZXZpY2VfZGVsJyBjYWxsZWQgZm9yIHRoZSAxc3Qg
cGNpIGRldmljZQo+IAktICdxdWVyeS1wY2knIGNoZWNraW5nIGlmIHBjaSBzdGlsbCB0aGVyZSwg
aXQgaXMKPiAJLSB3YWl0IDFzCj4gCS0gJ3F1ZXJ5LXBjaScgY2hlY2tpbmcgYWdhaW4sIGFuZCBp
dCdzIGdvbmUKPiAJLT4gbm93IHRoZSBzYW1lIGNhbiBiZSBkb25lIGZvciB0aGUgc2Vjb25kIHBj
aSBkZXZpY2UsIHNvCj4gCXBsZW50eSBvZiB3YWl0aW5nIG9uIG90aGVycyB3aGVuIHBjaSBkZXRh
Y2ggY2FuIGJlIGRvbmUgaW4KPiAJcGFyYWxsZWwuCj4gCj4gICAgICBPbiBzaHV0ZG93biwgbGli
eGwgdXN1YWxseSBrZWVwcyB3YWl0aW5nIGJlY2F1c2UgUUVNVSBuZXZlcgo+ICAgICAgcmVsZWFz
ZXMgdGhlIGRldmljZSBiZWNhdXNlIHRoZSBndWVzdCBrZXJuZWwgbmV2ZXIgcmVzcG9uZHMgUUVN
VSdzCj4gICAgICB1bnBsdWcgcXVlcmllcy4gU28gZGV0YWNoaW5nIG9mIHRoZSAxc3QgZGV2aWNl
IHdhaXRzIHVudGlsIGEKPiAgICAgIHRpbWVvdXQgc3RvcHMgaXQsIGFuZCBzaW5jZSB0aGUgc2Ft
ZSB0aW1lb3V0IGlzIHNldHVwIGF0IHRoZSBzYW1lCj4gICAgICB0aW1lIGZvciB0aGUgb3RoZXIg
ZGV2aWNlcyB0byBkZXRhY2gsIHRoZSAnZGV2aWNlX2RlbCcgY29tbWFuZCBpcwo+ICAgICAgbmV2
ZXIgc2VudCBmb3IgdGhvc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
