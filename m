Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC57151824
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:47:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyuli-0002iA-0E; Tue, 04 Feb 2020 09:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyulg-0002i5-R9
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:45:16 +0000
X-Inumbo-ID: 0c0350a8-4733-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c0350a8-4733-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 09:45:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2564FAD76;
 Tue,  4 Feb 2020 09:45:15 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>
References: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
 <20200204093424.10159-3-ian.jackson@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3204301-7beb-7a09-21f8-73b4377544f6@suse.com>
Date: Tue, 4 Feb 2020 10:45:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204093424.10159-3-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] INSTALL: Mention kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxMDozNCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gRnJvbTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4gCj4gRmlyc3RseSwgYWRkIGEgcmVmZXJlbmNl
IHRvIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUga2NvbmZpZyBzeXN0ZW0uCj4gCj4gU2Vjb25k
bHksIHdhcm4gdGhlIHVzZXIgYWJvdXQgdGhlIFhFTl9DT05GSUdfRVhQRVJUIHByb2JsZW0uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCkp1c3QgaW4g
Y2FzZSBpdCBoZWxwczoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
