Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD4F1A07
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 16:31:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNE7-0004iD-AE; Wed, 06 Nov 2019 15:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cVPj=Y6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSNE5-0004i8-QX
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 15:28:05 +0000
X-Inumbo-ID: 06c9a6ac-00aa-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c9a6ac-00aa-11ea-b678-bc764e2007e4;
 Wed, 06 Nov 2019 15:28:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4CF36B071;
 Wed,  6 Nov 2019 15:28:04 +0000 (UTC)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org,
 Artem Mygaiev <joculator@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
Date: Wed, 6 Nov 2019 16:28:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxMDoxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBcnRlbSBN
eWdhaWV2IDxqb2N1bGF0b3JAZ21haWwuY29tPgo+IAo+IFN0aWxsIGhhdmUgbGlua2VyIGlzc3Vl
cwoKVGhpcyBtYXkgYmUgYWNjZXB0YWJsZSBmb3IgYW4gUkZDIHNlcmllcywgYnV0IGRvZXNuJ3Qg
anVzdGlmeSB0aGVyZQpub3QgYmVpbmcgYW55IG90aGVyIGRlc2NyaXB0aW9uLiBKdXN0IHRvIGdp
dmUgYW4gZXhhbXBsZSxJJ2QgbGlrZSB0bwp1bmRlcnN0YW5kIHdoeSAuLi4KCj4gLS0tIGEvQ29u
ZmlnLm1rCj4gKysrIGIvQ29uZmlnLm1rCj4gQEAgLTIyMSw3ICsyMjEsOSBAQCBDRkxBR1MgKz0g
LVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcwo+ICAKPiAgJChjYWxsIGNjLW9wdGlvbi1hZGQsSE9T
VENGTEFHUyxIT1NUQ0MsLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQpCj4gICQoY2FsbCBj
Yy1vcHRpb24tYWRkLENGTEFHUyxDQywtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCkKPiAr
aWZuZXEgKCQoYXJtZHMpLHkpCj4gICQoY2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV25v
LXVudXNlZC1idXQtc2V0LXZhcmlhYmxlKQo+ICtlbmRpZgo+ICAkKGNhbGwgY2Mtb3B0aW9uLWFk
ZCxDRkxBR1MsQ0MsLVduby11bnVzZWQtbG9jYWwtdHlwZWRlZnMpCj4gIAo+ICBMREZMQUdTICs9
ICQoZm9yZWFjaCBpLCAkKEVYVFJBX0xJQiksIC1MJChpKSkgCgouLi4gdGhpcyB3b3VsZCBiZSBu
ZWNlc3NhcnkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
