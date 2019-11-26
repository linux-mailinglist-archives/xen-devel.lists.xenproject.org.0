Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26C10A040
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:29:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZboE-0000rs-6p; Tue, 26 Nov 2019 14:27:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZboC-0000rk-46
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:27:16 +0000
X-Inumbo-ID: d79ff4d0-1058-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d79ff4d0-1058-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 14:27:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72EB5B023;
 Tue, 26 Nov 2019 14:27:14 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <24029.13124.935192.209484@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d71df9cc-ebde-0139-c313-dc6e47e7e45d@suse.com>
Date: Tue, 26 Nov 2019 15:27:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24029.13124.935192.209484@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNToxNCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxhcCB3
cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50IHBjaS1hc3NpZ25hYmxl
IHN0YXRlIik6Cj4+ICA9aXRlbSBCPHBjaS1hc3NpZ25hYmxlLXJlbW92ZT4gW0k8LXI+XSBJPEJE
Rj4KPiAuLi4KPj4gK01ha2UgdGhlIGRldmljZSBhdCBQQ0kgQnVzL0RldmljZS9GdW5jdGlvbiBC
REYgbm90IGFzc2lnbmFibGUgdG8KPj4gK2d1ZXN0cy4gIFRoaXMgd2lsbCBhdCBsZWFzdCB1bmJp
bmQgdGhlIGRldmljZSBmcm9tIHBjaWJhY2ssIGFuZAo+PiArcmUtYXNzaWduIGl0IGZyb20gdGhl
ICJxdWFyYW50aW5lIGRvbWFpbiIgYmFjayB0byBkb21haW4gMC4gIElmIHRoZSAtcgo+PiArb3B0
aW9uIGlzIHNwZWNpZmllZCwgaXQgd2lsbCBhbHNvIGF0dGVtcHQgdG8gcmUtYmluZCB0aGUgZGV2
aWNlIHRvIGl0cwo+PiArb3JpZ2luYWwgZHJpdmVyLCBtYWtpbmcgaXQgdXNhYmxlIGJ5IERvbWFp
biAwIGFnYWluLiAgSWYgdGhlIGRldmljZSBpcwo+PiArbm90IGJvdW5kIHRvIHBjaWJhY2ssIGl0
IHdpbGwgcmV0dXJuIHN1Y2Nlc3MuCj4+ICsKPj4gK05vdGUgdGhhdCB0aGlzIGZ1bmN0aW9uYWxp
dHkgd2lsbCB3b3JrIGV2ZW4gZm9yIGRldmljZXMgd2hpY2ggd2VyZSBub3QKPj4gK21hZGUgYXNz
aWduYWJsZSBieSBCPHBjaS1hc3NpZ25hYmxlLWFkZD4uICBUaGlzIGNhbiBiZSB1c2VkIHRvIGFs
bG93Cj4+ICtkb20wIHRvIGFjY2VzcyBkZXZpY2VzIHdoaWNoIHdlcmUgYXV0b21hdGljYWxseSBx
dWFyYW50aW5lZCBieSBYZW4KPj4gK2FmdGVyIGRvbWFpbiBkZXN0cnVjdGlvbiBhcyBhIHJlc3Vs
dCBvZiBYZW4ncyBCPGlvbW11PXF1YXJhbnRpbmU+Cj4+ICtjb21tYW5kLWxpbmUgZGVmYXVsdC4K
PiAKPiBXaGF0IGFyZSB0aGUgc2VjdXJpdHkgaW1wbGljYXRpb25zIG9mIGRvaW5nIHRoaXMgaWYg
dGhlIGRldmljZSBtaWdodAo+IHN0aWxsIGJlIGRvaW5nIERNQSBvciBzb21ldGhpbmcgPwoKRGV2
aWNlcyBnZXQgcmVzZXQgaW4gYmV0d2Vlbiwgc28gd2VsbCBiZWhhdmluZyBvbmVzIHNob3VsZCBu
b3QKc3RpbGwgYmUgZG9pbmcgRE1BIGF0IHRoYXQgcG9pbnQuIE1pc2JlaGF2aW5nIG9uZXMgd291
bGQgYmV0dGVyCm5vdCBiZSBhc3NpZ25lZCAoYmFjayBhbmQgZm9ydGgpIGFueXdheS4gQnV0IGEg
cmVjZW50IHBhdGNoIG9mClBhdWwncyBzdWdnZXN0cyB0aGF0IHBlb3BsZSBzdGlsbCB3aXNoIHRv
IGRvIHNvLCBvbiB0aGUKYXNzdW1wdGlvbiB0aGF0IHN1Y2ggRE1BIHdpbGwgZHJhaW4gc3VmZmlj
aWVudGx5IHF1aWNrbHkuCgo+IChGb3IgdGhhdCBtYXR0ZXIsIHByZXN1bWFibHkgdGhlcmUgYXJl
IHNlY3VyaXR5IGltcGxpY2F0aW9ucyBvZgo+IGFzc2lnbmluZyB0aGUgc2FtZSBkZXZpY2UgaW4g
c2VxdWVuY2UgdG8gZGlmZmVyZW50IGd1ZXN0cz8pCgpSaWdodC4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
