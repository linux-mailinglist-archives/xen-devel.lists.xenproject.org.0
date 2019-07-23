Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6207213A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq1sn-0007Sb-QI; Tue, 23 Jul 2019 20:59:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wtZi=VU=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1hq1sm-0007RX-5e
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 20:59:36 +0000
X-Inumbo-ID: c4db0e04-ad8c-11e9-9fd7-17e4905ef504
Received: from emh03.mail.saunalahti.fi (unknown [62.142.5.109])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4db0e04-ad8c-11e9-9fd7-17e4905ef504;
 Tue, 23 Jul 2019 20:59:32 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 6D8F540006;
 Tue, 23 Jul 2019 23:59:29 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 6948D36C0F6; Tue, 23 Jul 2019 23:59:29 +0300 (EEST)
Date: Tue, 23 Jul 2019 23:59:29 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190723205929.GK3433@reaktio.net>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwMjoyMzo0NFBNICswMDAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiBBbGwsCj4gCj4gdGhlIHJlbGVhc2UgaXMgZHVlIGluIGVhcmx5IEF1Z3VzdC4g
UGxlYXNlIHBvaW50IG91dCBiYWNrcG9ydHMgeW91Cj4gZmluZCBtaXNzaW5nIGZyb20gdGhlIHJl
c3BlY3RpdmUgc3RhZ2luZyBicmFuY2gsIGJ1dCB3aGljaCB5b3UKPiBjb25zaWRlciByZWxldmFu
dC4gVGhlIG9uZSBjb21taXQgSSd2ZSBxdWV1ZWQgYWxyZWFkeSBvbiB0b3Agb2YKPiB3aGF0IHdh
cyBqdXN0IHB1c2hlZCBpcwo+IAo+IGVjMmFiNDkxYjUJeDg2L2VwdDogcGFzcyBjb3JyZWN0IGxl
dmVsIHRvIHAybV9lbnRyeV9tb2RpZnkKPiAKCkknZCBsaWtlIHRvIHJlcXVlc3QgYmFja3BvcnQg
b2YgdGhlIGZvbGxvd2luZyBjb21taXQgZm9yIDQuMTIuMToKCiJsaWJ4bDogZml4IHBjaSBkZXZp
Y2UgcmUtYXNzaWduaW5nIGFmdGVyIGRvbWFpbiByZWJvb3QiOgpjb21taXQJYzE5NDM0ZDkyODRl
OTNlNmY5YWFlYzlhNzBmNWYzNjFhZGJmYWJhNgoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD1jMTk0MzRkOTI4NGU5M2U2ZjlhYWVjOWE3MGY1ZjM2
MWFkYmZhYmE2CgoKPiBKYW4KPgoKVGhhbmtzLAoKLS0gUGFzaQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
