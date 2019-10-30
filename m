Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C935EA62B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 23:29:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPwQp-0007xc-VU; Wed, 30 Oct 2019 22:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DVBz=YX=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iPwQn-0007xV-TF
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 22:27:09 +0000
X-Inumbo-ID: 66b1f4ca-fb64-11e9-9537-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66b1f4ca-fb64-11e9-9537-12813bfff9fa;
 Wed, 30 Oct 2019 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOK9qN/CkRN95AvVMBFIFA3RaaivfqyfbygP6rj91kI=; b=JGpb2uMgk12RvVXKLoeG0BDWC8
 HQ/IR0lJmPrFF7GSH7e/mv3d9uqtwqEQpi8HEYeVX+K3BppYFlSOKOB/4eVYRuRh/Hi5NR+nuY3vK
 vUPJa4efC7z8Nk4D3bPtO9/h9XTf96Jw9yqe8cS4ZpUgPL16l0bwBZodRJrc3MvNTWcE=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:40418
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iPwRT-0002co-Di; Wed, 30 Oct 2019 23:27:51 +0100
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191030180704.261320-1-anthony.perard@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <c1273699-d5d7-70f2-e7ac-1119033aebf3@eikelenboom.it>
Date: Wed, 30 Oct 2019 23:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030180704.261320-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTAvMjAxOSAxOTowNiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gUGF0Y2ggc2VyaWVz
IGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxlLmdpdCBici5maXgtZXZfcW1wLW11
bHRpLWNvbm5lY3QtdjIKPiAKPiBIaSwKPiAKPiBRRU1VJ3MgUU1QIHNvY2tldCBkb2Vzbid0IGFs
bG93IG11bHRpcGxlIGNvbmN1cnJlbnQgY29ubmVjdGlvbi4gQWxzbywgaXQKPiBsaXN0ZW4oKSBv
biB0aGUgc29ja2V0IHdpdGggYSBgYmFja2xvZycgb2Ygb25seSAxLiBPbiBMaW51eCBhdCBsZWFz
dCwgb25jZSB0aGF0Cj4gYmFja2xvZyBpcyBmaWxsZWQgY29ubmVjdCgpIHdpbGwgcmV0dXJuIEVB
R0FJTiBpZiB0aGUgc29ja2V0IGZkIGlzCj4gbm9uLWJsb2NraW5nLiBsaWJ4bCBtYXkgYXR0ZW1w
dCBtYW55IGNvbmN1cnJlbnQgY29ubmVjdCgpIGF0dGVtcHQgaWYgZm9yCj4gZXhhbXBsZSBhIGd1
ZXN0IGlzIHN0YXJ0ZWQgd2l0aCBzZXZlcmFsIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLCBhbmQg
YQo+IGNvbm5lY3QoKSBmYWlsdXJlIGxlYWQgdG8gYSBmYWlsdXJlIHRvIHN0YXJ0IHRoZSBndWVz
dC4KPiAKPiBTaW5jZSB3ZSBjYW4ndCBjaGFuZ2UgdGhlIGxpc3RlbigpJ3MgYGJhY2tsb2cnIHRo
YXQgUUVNVSB1c2UsIHdlIG5lZWQgb3RoZXIKPiB3YXlzIHRvIHdvcmthcm91bmQgdGhlIGlzc3Vl
LiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2UgYSBsb2NrIHRvIGFjcXVpcmUKPiBiZWZvcmUg
YXR0ZW1wdGluZyB0byBjb25uZWN0KCkgdG8gdGhlIFFNUCBzb2NrZXQuIFNpbmNlIHRoZSBsb2Nr
IG1pZ2h0IGJlIGhlbGQKPiBmb3IgdG8gbG9uZywgdGhlIHNlcmllcyBhbHNvIGludHJvZHVjZSBh
IHdheSB0byBjYW5jZWwgdGhlIGFjcXVpc2l0aW9uIG9mIHRoZQo+IGxvY2ssIHRoaXMgbWVhbnMg
a2lsbGluZyB0aGUgcHJvY2VzcyB0aGF0IHRyaWVzIHRvIGdldCB0aGUgbG9jay4KPiAKPiBTZWUg
dGhyZWFkWzFdIGZvciBkaXNjdXNzZWQgYWx0ZXJuYXRpdmUuCj4gWzFdIGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMC9tc2cwMTgxNS5o
dG1sCj4gCj4gQ2hlZXJzLAo+IAo+IEFudGhvbnkgUEVSQVJEICg2KToKCkhpIEFudGhvbnksCgpS
ZS10ZXN0ZWQsIGVzcGVjaWFsbHkgdGhlIHBjaS1wdCBwYXJ0LCBzdGlsbCB3b3JrcyBmb3IgbWUu
ClRoYW5rcyBhZ2FpbiAoYW5kIHRoYW5rcyBmb3IgcHJvdmlkaW5nIGEgZ2l0IGJyYW5jaCkKCi0t
ClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
