Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD828A3407
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 11:31:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3dD1-00033n-RN; Fri, 30 Aug 2019 09:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wesd=W2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i3dD0-00033i-Cl
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 09:28:42 +0000
X-Inumbo-ID: 8d616a2e-cb08-11e9-ae7e-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d616a2e-cb08-11e9-ae7e-12813bfff9fa;
 Fri, 30 Aug 2019 09:28:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t9so6693960wmi.5
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2019 02:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C1iTLkudWOor+3/pP1XygkO/KOktMUikU9UzYFth2Nw=;
 b=nJ8kg/gm/VsSNsWe9PmaGXlub2HNasVl2JSUdnkDJ+2eKR1ISc4L3ROZ5A1p94Rsc4
 DsO/psAOr6B5YO3hOKpSi7oP7Pk4ACV+DbMIYQ9WS70Vrc3VGtUe14I7kXaAc9Lc6/re
 zeiyeu2AtdyJn0utzTH5K1mPGQwxTsuTL5vveanIzpFbHRbkirBcTwlk+KRS5MOXeLiu
 cZTd49ej82Hoo/SNQYsDJg3iHvRg41re6ZqT9BKboIDhylzBhVzoFleS2psjkLEb8Fkk
 8x/8WWX90joD5OBPDl/DDd4VnPabhbbMGsXRvPURNxC5X4xQE7V85Od0nQRx8DHihBf/
 aT0Q==
X-Gm-Message-State: APjAAAV8RVWSuJrbxPrc/BewYDjjX23fME18UNAS4fYxjOvODZpqqPhm
 Ca2ewoBnFmAdF0UGlm4LjcU=
X-Google-Smtp-Source: APXvYqwKMYOPAO1HtVZC/tobV0XkqFfqcO6XEDdFZooSc8uoz6z9iaFM7rkdXdd7nRU8AqurMtjNtg==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr17355705wmi.19.1567157320028; 
 Fri, 30 Aug 2019 02:28:40 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id d17sm8452047wre.27.2019.08.30.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 02:28:39 -0700 (PDT)
Date: Fri, 30 Aug 2019 09:28:37 +0000
From: Wei Liu <wl@xen.org>
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <20190830092837.nmsnmelmwryzxyta@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add DornerWorks maintainers
 email
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
Cc: DornerWorks Xen-Devel <xen-devel@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MDg6NTVBTSAtMDQwMCwgSmVmZiBLdWJhc2NpayB3
cm90ZToKPiBXZSB3b3VsZCBsaWtlIHRvIGhhdmUgYSBjb21tb24gbWFpbnRhaW5lcnMgZW1haWwg
YWRkcmVzcyBmb3IgRG9ybmVyV29ya3MKPiBtYWludGFpbmVkIGNvZGUsIHdoaWNoIGN1cnJlbnRs
eSBpcyB0aGUgQVJJTkM2NTMgc2NoZWR1bGVyLiBUaGlzIHdpbGwKPiBlbmFibGUgdXMgdG8gYmV0
dGVyIG1vbml0b3IgYW5kIHJlc3BvbmQgdG8gdGhlIFhlbiBjb21tdW5pdHkuIFRoaXMgcGF0Y2gK
PiBhZGRzIGEgbWFpbnRhaW5lciBsaW5lIHdpdGggdGhlIERvcm5lcldvcmtzIG1haW50YWluZXJz
IGVtYWlsIGFkZHJlc3MuCj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCj4gaW5kZXggNzc0MTNlMGQ5ZS4uM2NjZTI1MzkzMSAxMDA2NDQKPiAtLS0gYS9NQUlO
VEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTE2OCw2ICsxNjgsNyBAQCBGOgl4ZW4v
Y29tbW9uL2FyZ28uYwo+ICBBUklOQzY1MyBTQ0hFRFVMRVIKPiAgTToJSm9zaCBXaGl0ZWhlYWQg
PGpvc2gud2hpdGVoZWFkQGRvcm5lcndvcmtzLmNvbT4KPiAgTToJUm9iZXJ0IFZhblZvc3NlbiA8
cm9iZXJ0LnZhbnZvc3NlbkBkb3JuZXJ3b3Jrcy5jb20+Cj4gK006CURvcm5lcldvcmtzIFhlbi1E
ZXZlbCA8eGVuLWRldmVsQGRvcm5lcndvcmtzLmNvbT4KClRoZSBjb3JyZWN0IHN5bWJvbCBoZXJl
IGlzIEwuIAoKICAgIEw6IE1haWxpbmcgbGlzdCB0aGF0IGlzIHJlbGV2YW50IHRvIHRoaXMgYXJl
YQoKPiAgUzoJU3VwcG9ydGVkCj4gIEY6CXhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYwo+ICBG
Ogl0b29scy9saWJ4Yy94Y19hcmluYzY1My5jCj4gLS0gCj4gMi4xNy4xCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
