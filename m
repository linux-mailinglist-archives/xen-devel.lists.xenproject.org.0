Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A2178FC5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 12:49:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9SSk-0005FI-7x; Wed, 04 Mar 2020 11:45:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9SSi-0005FD-Qh
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 11:45:16 +0000
X-Inumbo-ID: 9d7ed660-5e0d-11ea-a3a1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d7ed660-5e0d-11ea-a3a1-12813bfff9fa;
 Wed, 04 Mar 2020 11:45:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BC49AD03;
 Wed,  4 Mar 2020 11:45:15 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-13-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8306e8bb-0aec-5ac9-c6e4-c3904187fea6@suse.com>
Date: Wed, 4 Mar 2020 12:45:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-13-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 12/12] xen: remove
 XEN_SYSCTL_set_parameter support
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGUgZnVuY3Rpb25h
bGl0eSBvZiBYRU5fU1lTQ1RMX3NldF9wYXJhbWV0ZXIgaXMgYXZhaWxhYmxlIHZpYSBoeXBmcwo+
IG5vdywgc28gaXQgY2FuIGJlIHJlbW92ZWQuCj4gCj4gVGhpcyBhbGxvd3MgdG8gcmVtb3ZlIHRo
ZSBrZXJuZWxfcGFyYW0gc3RydWN0dXJlIGZvciBydW50aW1lIHBhcmFtZXRlcnMKPiBieSBwdXR0
aW5nIHRoZSBub3cgb25seSB1c2VkIHN0cnVjdHVyZSBlbGVtZW50IGludG8gdGhlIGh5cGZzIG5v
ZGUKPiBzdHJ1Y3R1cmUgb2YgdGhlIHJ1bnRpbWUgcGFyYW1ldGVycy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIG9uZSBtaW5vciBhZGp1c3RtZW50OgoKPiBAQCAt
MTEwMiw3ICsxMDg2LDYgQEAgc3RydWN0IHhlbl9zeXNjdGwgewo+ICAjZGVmaW5lIFhFTl9TWVND
VExfZ2V0X2NwdV9sZXZlbGxpbmdfY2FwcyAgICAgICAgMjUKPiAgI2RlZmluZSBYRU5fU1lTQ1RM
X2dldF9jcHVfZmVhdHVyZXNldCAgICAgICAgICAgIDI2Cj4gICNkZWZpbmUgWEVOX1NZU0NUTF9s
aXZlcGF0Y2hfb3AgICAgICAgICAgICAgICAgICAyNwo+IC0jZGVmaW5lIFhFTl9TWVNDVExfc2V0
X3BhcmFtZXRlciAgICAgICAgICAgICAgICAgMjgKClBsZWFzZSBmb2xsb3cgdGhlIHRtZW1fb3Ag
ZXhhbXBsZSBoZXJlIGFuZCBkb24ndCBvdXRyaWdodApkZWxldGUgdGhlIGxpbmUuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
