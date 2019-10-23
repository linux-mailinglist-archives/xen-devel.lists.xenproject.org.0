Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF31E1CF9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:43:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGr1-0001PS-CL; Wed, 23 Oct 2019 13:39:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGqz-0001PN-6S
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:39:09 +0000
X-Inumbo-ID: 7c7c9dd4-f59a-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c7c9dd4-f59a-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 13:39:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0C14B91B;
 Wed, 23 Oct 2019 13:39:06 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-2-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6533ef97-1b37-374b-60b5-1c70df8e1ef3@suse.com>
Date: Wed, 23 Oct 2019 15:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-2-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 01/11] libxl: Offer API
 versions 0x040700 and 0x040800
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IEFjY29yZGluZyB0byBnaXQg
bG9nIC1HOgo+IAo+IDB4MDQwNzAwIHdhcyBpbnRyb2R1Y2VkIGluIDMwNDQwMDQ1OWVmMCAoYWth
IDQuNy4wLXJjMX40ODEpCj4gICAgInRvb2xzL2xpYnhsOiByZW5hbWUgcmVtdXMgZGV2aWNlIHRv
IGNoZWNrcG9pbnQgZGV2aWNlIgo+IAo+IDB4MDQwODAwIHdhcyBpbnRyb2R1Y2VkIGluIDU3Zjhi
MTNjNzI0MCAoYWthIDQuOC4wLXJjMX40MzcpCj4gICAgImxpYnhsOiBtZW1vcnkgc2l6ZSBpbiBr
YiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiCj4gCj4gSXQgaXMgc3VycHJpc2luZyB0aGF0IG5v
LW9uZSBub3RpY2VkIHRoaXMuCj4gCj4gQW55d2F5LCBpbiB0aGUgbWVhbnRpbWUsIHdlIHNob3Vs
ZCBmaXggaXQuICBCYWNrcG9ydGluZyB0aGlzIGlzCj4gcHJvYmFibHkgYSBnb29kIGlkZWE6IGl0
IHdvbid0IGNoYW5nZSB0aGUgYmVoYXZpb3VyIGZvciBleGlzdGluZwo+IGNhbGxlcnMgYnV0IGl0
IHdpbGwgYXZvaWQgZXJyb3JzIGZvciBzb21lIG9sZGVyIGNvcnJlY3QgdXNlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBBY2tl
ZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZWxlYXNl
LWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
