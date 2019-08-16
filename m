Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCA901EF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:48:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybbA-0003pK-AJ; Fri, 16 Aug 2019 12:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5V6G=WM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hybb9-0003pD-A5
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:44:51 +0000
X-Inumbo-ID: a1ad5a5a-c023-11e9-8bb5-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1ad5a5a-c023-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:44:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f72so3946254wmf.5
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 05:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i6dWdLaC/f0BNqXflWDkHt5vD5fcbwNlcDjjhEC9TI8=;
 b=bJq9Uk79aEt6jfbad0JquHdsg0KUq8qNGpop3ytHg1DyTAg8Er/JSSrFFNY57e0coB
 u9AW6j6cozlAwozL2kQL7qcnpo7zne+NGn7fxEryyojHjnZ+El4/rQMyrJIEL/pLT/K8
 ftU/B0p8KEuh6Lp31SnqAB0wxTjA7F4manb2/+yyQ3yKUZ0oE3UBw7kKGMsa6iDBTeG/
 9CBiyqwYzkl0J0VzQ0DVamJYucUBcrbvR0Dm4TxOFvqx0NiDV4v0osDC8DH3HBxCS7a+
 5B1MbglPIZLTLjLsJkNivnQ7U9sMXJWRBUXK9ZvE++QSW066nAEPd/w3rfeetaORxTSX
 rijw==
X-Gm-Message-State: APjAAAWrZyK26golyKPflLGCbpFmkHYa3UjtpTsv3vDGXbEElkxOQxqU
 tt7BC9lf6Y3S5RJewrkN8rg=
X-Google-Smtp-Source: APXvYqwEfeyQp+6MCQubXeev7Pcn1xqh0dMRDF1KabPt3waeSTrh+Rg5FJRwoL7mpnjiOYYyNeckLA==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr7116561wmk.108.1565959487638; 
 Fri, 16 Aug 2019 05:44:47 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id f70sm7727572wme.22.2019.08.16.05.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:44:47 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:44:45 +0000
From: Wei Liu <wl@xen.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190816124445.n767e5yra4zodt3z@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190815112750.11581-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815112750.11581-1-wipawel@amazon.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH lp-metadata 3/3] livepatch: Add metadata
 runtime retrieval mechanism
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 mpohlack@amazon.de, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTE6Mjc6NTBBTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRXh0ZW5kIHRoZSBsaXZlcGF0Y2ggbGlzdCBvcGVyYXRpb24gdG8gZmV0
Y2ggYWxzbyBwYXlsb2FkcycgbWV0YWRhdGEuCj4gVGhpcyBpcyBhY2hpZXZlZCBieSBleHRlbmRp
bmcgdGhlIHN5c2N0bCBsaXN0IGludGVyZmFjZSB3aXRoIDIgZXh0cmEKPiBndWVzdCBoYW5kbGVz
Ogo+ICogbWV0YWRhdGEgICAgIC0gYW4gYXJyYXkgb2YgYXJiaXRyYXJ5IHNpemUgc3RyaW5ncwo+
ICogbWV0YWRhdGFfbGVuIC0gYW4gYXJyYXkgb2YgbWV0YWRhdGEgc3RyaW5ncycgbGVuZ3RocyAo
dWluMzJfdCBlYWNoKQo+IAo+IFBheWxvYWRzJyBtZXRhZGF0YSBpcyBhIHN0cmluZyBvZiBhcmJp
dHJhcnkgc2l6ZSBhbmQgZG9lcyBub3QgaGF2ZSBhbgo+IHVwcGVyIGJvdW5kIGxpbWl0LiBJdCBt
YXkgYWxzbyB2YXJ5IGluIHNpemUgYmV0d2VlbiBwYXlsb2Fkcy4KPiAKPiBJbiBvcmRlciB0byBs
ZXQgdGhlIHVzZXJsYW5kIGFsbG9jYXRlIGVub3VnaCBzcGFjZSBmb3IgdGhlIGluY29taW5nCj4g
ZGF0YSBhZGQgYSBtZXRhZGF0YSB0b3RhbCBzaXplIGZpZWxkIHRvIHRoZSBsaXN0IHN5c2N0bCBv
cGVyYXRpb24gYW5kCj4gZmlsbCBpdCB3aXRoIHRvdGFsIHNpemUgb2YgYWxsIHBheWxvYWRzJyBt
ZXRhZGF0YS4KPiAKPiBFeHRlbmQgdGhlIGxpYnhjIHRvIGhhbmRsZSB0aGUgbWV0YWRhdGEgYmFj
ay10by1iYWNrIGRhdGEgdHJhbnNmZXJzCj4gYXMgd2VsbCBhcyBtZXRhZGF0YSBsZW5ndGggYXJy
YXkgZGF0YSB0cmFuc2ZlcnMuCj4gCj4gVGhlIHhlbi1saXZlcGF0Y2ggdXNlcmxhbmQgdG9vbCBp
cyBleHRlbmRlZCB0byBhbHdheXMgZGlzcGxheSB0aGUKPiBtZXRhZGF0YSBmb3IgZWFjaCByZWNl
aXZlZCBtb2R1bGUuIFRoZSBtZXRhZGF0YSBpcyByZWNlaXZlZCB3aXRoIHRoZQo+IGZvbGxvd2lu
ZyBmb3JtYXQ6IGtleT12YWx1ZVwwa2V5PXZhbHVlXDAuLi5rZXk9dmFsdWVcMC4gVGhlIGZvcm1h
dCBpcwo+IG1vZGlmaWVkIHRvIHRoZSBmb2xsb3dpbmcgb25lOiBrZXk9dmFsdWU7a2V5PXZhbHVl
Oy4uLmtleT12YWx1ZS4KPiBUaGUgbmV3IGZvcm1hdCBhbGxvd3MgdG8gZWFzaWx5IHBhcnNlIHRo
ZSBtZXRhZGF0YSBmb3IgYSBnaXZlbiBtb2R1bGUKPiBieSBhIG1hY2hpbmUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmll
d2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2
aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gUmV2aWV3ZWQt
Ynk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+ICB0b29scy9s
aWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCB8IDIyICsrKysrKysrKysrLS0tLQo+ICB0b29scy9saWJ4
Yy94Y19taXNjLmMgICAgICAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiAgdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMgICAgfCA0MyArKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tCj4gIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICAgIHwg
MjIgKysrKysrKysrKystLS0tCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgIHwgMTkg
KysrKysrKysrLS0tLQoKTW9zdGx5IGxvb2sgZ29vZC4gT25lIGNvbW1lbnQgYmVsb3cuLi4KCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9zeXNjdGwuaAo+IGluZGV4IGI4NjgwNGI3YTYuLmU0YzhmNGZlNjMgMTAwNjQ0Cj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGlj
L3N5c2N0bC5oCgpJZiBpdCBoYXNuJ3QgYmVlbiBkb25lIGZvciB0aGlzIHJlbGVhc2UgYWxyZWFk
eSwgY2hhbmdpbmcgc3lzY3RsIGludGVyZmFjZSByZXF1aXJlcwpidW1waW5nIHRoZSB2ZXJzaW9u
IG51bWJlciBpbiB0aGlzIGhlYWRlci4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
