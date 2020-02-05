Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656715297D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:58:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izILD-0008JU-BV; Wed, 05 Feb 2020 10:55:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izILB-0008JO-Tq
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:55:29 +0000
X-Inumbo-ID: 0569c104-4806-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0569c104-4806-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 10:55:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22101AD61;
 Wed,  5 Feb 2020 10:55:28 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200205101141.24769-1-jgross@suse.com>
 <20200205101141.24769-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b575dd1d-3e13-0654-39b3-e31fd782bb11@suse.com>
Date: Wed, 5 Feb 2020 11:55:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205101141.24769-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/8] xen: add a generic way to include
 binary files as variables
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMToxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgYSBuZXcgc2Ny
aXB0IHhlbi90b29scy9iaW5maWxlIGZvciBpbmNsdWRpbmcgYSBiaW5hcnkgZmlsZSBhdCBidWls
ZAo+IHRpbWUgYmVpbmcgdXNhYmxlIHZpYSBhIHBvaW50ZXIgYW5kIGEgc2l6ZSB2YXJpYWJsZSBp
biB0aGUgaHlwZXJ2aXNvci4KPiAKPiBNYWtlIHVzZSBvZiB0aGF0IGdlbmVyaWMgdG9vbCBpbiB4
c20uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
