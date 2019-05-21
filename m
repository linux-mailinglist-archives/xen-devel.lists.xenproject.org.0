Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D622563E
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 18:57:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT83N-0004Xn-Me; Tue, 21 May 2019 16:55:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT83M-0004Xi-3u
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 16:55:52 +0000
X-Inumbo-ID: 4a1664db-7be9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4a1664db-7be9-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 16:55:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEA29374;
 Tue, 21 May 2019 09:55:50 -0700 (PDT)
Received: from [10.37.9.190] (unknown [10.37.9.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F420E3F718;
 Tue, 21 May 2019 09:55:49 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
 <7bea4485-b0da-ed92-336d-b2307c444cb1@arm.com>
 <23778.53283.804039.753874@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6c79552a-cefa-6213-0bef-aedfb2a149bb@arm.com>
Date: Tue, 21 May 2019 17:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23778.53283.804039.753874@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gNS8yMC8xOSA1OjA0IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4g
R3JhbGwgd3JpdGVzICgiUmU6IFt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEzNjM4NTogcmVncmVz
c2lvbnMgLSBGQUlMIik6Cj4+IEJlZm9yZSB0aGUgbGFzdCAyIGZsaWdodHMsIHRoZSBrZXJuZWwg
d2FzIGNvbXBpbGVkIG5hdGl2ZWx5LiBOb3cgaXQgaXMKPj4gY3Jvc3MtY29tcGlsZWQgb24geDg2
IG1hY2hpbmUuIFNvIHRoZXJlIGFyZSBhIGRpZmZlcmVuY2UgaW4gdGhlIHdheSB0aGUga2VybmVs
Cj4+IGlzIGJ1aWx0Lgo+IAo+IFRoYXQgaXMgaW5kZWVkIHN1c3BpY2lvdXMuCj4gCj4+IENvdWxk
IHdlIHRyeSBhIGZsaWdodCB3aXRoIGtlcm5lbCBidWlsdCBmcm9tIHRoZSBjdWJpZXRydWNrPwo+
IAo+IEkgaGFkIHRvIGRvIHNvbWUgd29yayBvbiB0aGUgdG9vbGluZywgYnV0IEkgdGhpbmsgSSBo
YXZlIHRoaXMgcnVubmluZwo+IG5vdy4gIDEzNjYyNi8xMzY2MjcuICBJIG1heSBuZWVkIHRvIHJl
c3RhcnQgaXQuLi4KCkBJYW46IEkgZGlkbid0IHNlZSB0ZXN0IHJlc3VsdCBpbiBteSBpbmJveCBm
b3IgdGhvc2UgMiBmbGlnaHRzLiBXYXMgCnRoZXJlIGFueSBpc3N1ZXMgd2l0aCB0aGVtPwoKPiAK
Pj4gT24gYSBzaWRlIG5vdGUsIEkgbm90aWNlZCB0aGF0IHRoZSBuYW1lIG9mIHRoZSBmaWxlIFsx
XSBsZWFkcyB0byB0aGluayBpdCBpcyBhCj4+IGd6aXAsIGJ1dCBpdCBpcyBhY3R1YWxseSBhIHBs
YWluIHRleHQuCj4gLi4uCj4+IFsxXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2Mzg1L3Rlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0Mi9jdWJp
ZXRydWNrLWdsZWl6ZXMtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlhbi5ndWVzdC5v
c3N0ZXN0LmxvZy5nego+IAo+ICQgSEVBRCAnaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzLzEzNjM4NS90ZXN0LWFybWhmLWFybWhmLXhsLWNyZWRpdDIvY3Vi
aWV0cnVjay1nbGVpemVzLS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1kZWJpYW4uZ3Vlc3Qu
b3NzdGVzdC5sb2cuZ3onCj4gMjAwIE9LCj4gQ29ubmVjdGlvbjogY2xvc2UKPiBEYXRlOiBNb24s
IDIwIE1heSAyMDE5IDE2OjAwOjM4IEdNVAo+IEFjY2VwdC1SYW5nZXM6IGJ5dGVzCj4gRVRhZzog
IjNmYmEtNTg5MmJkNGE1ZThjNyIKPiBTZXJ2ZXI6IEFwYWNoZS8yLjQuMjUgKERlYmlhbikKPiBD
b250ZW50LUVuY29kaW5nOiB4LWd6aXAKPiBDb250ZW50LUxlbmd0aDogMTYzMTQKPiBDb250ZW50
LVR5cGU6IGFwcGxpY2F0aW9uL3gtZ3ppcAo+IExhc3QtTW9kaWZpZWQ6IFNhdCwgMTggTWF5IDIw
MTkgMTY6MTc6MDcgR01UCj4gQ2xpZW50LURhdGU6IE1vbiwgMjAgTWF5IDIwMTkgMTY6MDA6Mzgg
R01UCj4gQ2xpZW50LVBlZXI6IDIwNS4yMzcuOTguMTQ2OjgwCj4gQ2xpZW50LVJlc3BvbnNlLU51
bTogMQo+IAo+ICQKPiAKPiBUaGlzIGlzIHdyb25nLiAgSXQgaXMgc2F5aW5nIHRoYXQgaXQgaXMg
Z29pbmcgdG8gc2VuZCBhIGd6aXBwZWQKPiBnemlwZmlsZS4KClRoYW5rIHlvdSBmb3IgbG9va2lu
ZyBhdCBpdCEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
