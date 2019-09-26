Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B2BED40
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 10:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDOwC-0002pv-BZ; Thu, 26 Sep 2019 08:15:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDOwB-0002pq-IY
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 08:15:43 +0000
X-Inumbo-ID: d4aed03c-e035-11e9-964a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d4aed03c-e035-11e9-964a-12813bfff9fa;
 Thu, 26 Sep 2019 08:15:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4EB23AD5C;
 Thu, 26 Sep 2019 08:15:41 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-141841-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94bc383d-b625-1458-ad39-e4669738956d@suse.com>
Date: Thu, 26 Sep 2019 10:15:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-141841-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 141841: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAwNzoyOSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDE4NDEgeGVuLXVuc3RhYmxlLXNtb2tlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTg0MS8KPiAKPiBSZWdyZXNzaW9u
cyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hcm02NC1h
cm02NC14bC14c20gICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQxODIxCgpJJ20gcHJldHR5IHB1enpsZWQgYnkgdGhpcyAtIGl0IGxvb2tzIHRvIGZhaWwg
YXQgdGhlIGJvb3QgbG9hZGVyCmxldmVsOgoKVGhlIGhpZ2hsaWdodGVkIGVudHJ5IHdpbGwgYmUg
ZXhlY3V0ZWQgYXV0b21hdGljYWxseSBpbiAycy4gICAgICAgICAgICAgICAgIBtbNTs3OEgbWzIz
OzFIICAgVGhlIGhpZ2hsaWdodGVkIGVudHJ5IHdpbGwgYmUgZXhlY3V0ZWQgYXV0b21hdGljYWxs
eSBpbiAxcy4gICAgICAgICAgICAgICAgIBtbNTs3OEgbWzIzOzFIICAgVGhlIGhpZ2hsaWdodGVk
IGVudHJ5IHdpbGwgYmUgZXhlY3V0ZWQgYXV0b21hdGljYWxseSBpbiAwcy4gICAgICAgICAgICAg
ICAgIBtbNTs3OEgbWzA7MzA7NDBtG1syShtbMTsxSBtbMDszNzs0MG0bWzA7MzA7NDBtG1syShtb
MTsxSBtbMDszNzs0MG1DaGFpbmxvYWRpbmcgKGhkMCxncHQxKS9FRkkvQk9PVC9CT09UQUE2NC5F
RkkKU2VwIDI2IDAzOjQyOjIwLjEzMjAyMiAKZXJyb3I6IEZpbGUgbm90IGZvdW5kLgpTZXAgMjYg
MDM6NDI6MjAuMTMyMDUyIAplcnJvcjogRmlsZSBub3QgZm91bmQuClNlcCAyNiAwMzo0MjoyMC4x
MzIwNzYgCmVycm9yOiBGaWxlIG5vdCBmb3VuZC4KU2VwIDI2IDAzOjQyOjIwLjE0Mzk1NyAKZXJy
b3I6IEZpbGUgbm90IGZvdW5kLgpTZXAgMjYgMDM6NDI6MjAuMTQzOTU3IAplcnJvcjogRmlsZSBu
b3QgZm91bmQuClNlcCAyNiAwMzo0MjoyMC4xNjc5NTcgCmVycm9yOiBGaWxlIG5vdCBmb3VuZC4K
U2VwIDI2IDAzOjQyOjIwLjE2Nzk1NyAKZXJyb3I6IEZpbGUgbm90IGZvdW5kLgpTZXAgMjYgMDM6
NDI6MjAuMTc5OTQ5IAplcnJvcjogRmlsZSBub3QgZm91bmQuClNlcCAyNiAwMzo0MjoyMC4xOTIw
MjMgCmVycm9yOiBGaWxlIG5vdCBmb3VuZC4KU2VwIDI2IDAzOjQyOjIwLjIwMzkzOSAKZXJyb3I6
IEZpbGUgbm90IGZvdW5kLgpTZXAgMjYgMDM6NDI6MjAuMjAzOTM5IAplcnJvcjogRmlsZSBub3Qg
Zm91bmQuClNlcCAyNiAwMzo0MjoyMC4yMjgwMzUgCmVycm9yOiBGaWxlIG5vdCBmb3VuZC4KU2Vw
IDI2IDAzOjQyOjIwLjIyODA5MCAKZXJyb3I6IEZpbGUgbm90IGZvdW5kLgoKVGhlIHN5c3RlbSBs
b29rcyB0byB0aGVuIGZhbGwgYmFjayB0byBib290aW5nIGJhcmUgbWV0YWwgTGludXguCgo+ICB0
ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBm
YWlsIFJFR1IuIHZzLiAxNDE4MjEKCldoZXJlYXMgdGhpcyBpcyB0aGUgaXNzdWUgYWxyZWFkeSBy
ZXBvcnRlZCBvbiB0aGUgbGlzdCwgd2hlcmUgYQpuZXcgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgdHJp
Z2dlcnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
