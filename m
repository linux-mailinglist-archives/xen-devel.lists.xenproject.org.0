Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6B1529BC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:18:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIe3-0001uz-LR; Wed, 05 Feb 2020 11:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izIe2-0001uu-8t
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:14:58 +0000
X-Inumbo-ID: bde7c4c2-4808-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bde7c4c2-4808-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 11:14:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D277DAE6F;
 Wed,  5 Feb 2020 11:14:56 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94ca3477-4bd5-59ce-484c-090136ed584b@suse.com>
Date: Wed, 5 Feb 2020 12:15:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204153704.15934-4-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 03/10] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNjozNiwgV2VpIExpdSB3cm90ZToKPiBUaGlzIGFsbG93cyB1cyB0byBz
ZXQgYXNpZGUgc29tZSBhZGRyZXNzIHNwYWNlIGZvciBleGVjdXRhYmxlIG1hcHBpbmcuCj4gVGhp
cyBmaXhlZCBtYXAgcmFuZ2Ugc3RhcnRzIGZyb20gWEVOX1ZJUlRfRU5EIHNvIHRoYXQgaXQgaXMg
d2l0aGluIHJlYWNoCj4gb2YgdGhlIC50ZXh0IHNlY3Rpb24uCj4gCj4gU2hpZnQgdGhlIHBlcmNw
dSBzdHViIHJhbmdlIGFuZCBzaHJpbmsgbGl2ZXBhdGNoIHJhbmdlIGFjY29yZGluZ2x5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIC4uLgoKPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9h
c21fZGVmbnMuaAo+IEBAIC0zOTIsNCArMzkyLDkgQEAgbGFiZWw6IC5sb25nICh2YWwpOyAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAuc2l6ZSBsYWJlbCwgLiAtIGxhYmVsOyAgICAg
ICAgICAgICAgICAgXAo+ICAgICAgLnR5cGUgbGFiZWwsIEBvYmplY3QKPiAgCj4gKwo+ICsjZGVm
aW5lIEFTTV9DT05TVEFOVChuYW1lLCB2YWx1ZSkgICAgICAgICAgICAgICAgXAo+ICsgICAgYXNt
ICggIi5lcXUgIiAjbmFtZSAiLCAlUDA7IC5nbG9iYWwgIiAjbmFtZSAgXAo+ICsgICAgICAgICAg
OjogImkiICgodmFsdWUpKSApOwo+ICsKPiAgI2VuZGlmIC8qIF9fWDg2X0FTTV9ERUZOU19IX18g
Ki8KCi4uLiBubyBkb3VibGUgYmxhbmsgbGluZXMgaW50cm9kdWNlZCBoZXJlLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
