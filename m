Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD1123112
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:05:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFIa-0005i1-2a; Tue, 17 Dec 2019 16:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihFIY-0005hw-L1
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:02:10 +0000
X-Inumbo-ID: 8fd70a6e-20e6-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd70a6e-20e6-11ea-a1e1-bc764e2007e4;
 Tue, 17 Dec 2019 16:02:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so11848850wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 08:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uavIUzVcXSUCVLFeBuwEM5R8RtbLyfuwOEgoDLHmIVA=;
 b=mtUJRZWuipBrSJRrtkjh0TkEBmL2WX0P7b/iU42xUkLcCnIdNS/slGibU/3B28HZXr
 eKc45wBd5w3PxDDP15D+mBrhxjd8NS7chbYLTlswcXU0AxgRCIYRceKX5fthGBxm0g91
 3gzac6qwrpvwITXHktD2GlW9tcX0z78xvpLR5x6MpNeut0rI3v3ulWYYhdnqwACBgCf1
 lzSxOceUP9C5essbGWoBrrv2GQhsJDOlI/gt1eA9MtKV6ur8mMsdx3SjHCwkJXLv/jYl
 9xbWHpArsw31slxHFv2Fg4/VdsFiQfD3uNxeg2qf47HJmood0wojcIS6f6ulmv1B00tK
 ufmQ==
X-Gm-Message-State: APjAAAXaiti7d92XPs4c3YGaEX4ktcHcFDCvlQaNaFDUsyRQPIw5wNkO
 cheIhJCspIxHVF8Fc6ZIN5U=
X-Google-Smtp-Source: APXvYqzauAoIVo60eUaYvsEc6qETwsIVSgReW5VCDS8lm2emRvOW1UjlvkZW4PAP/2Ar0R+3+lV2VA==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr38095830wrq.134.1576598521307; 
 Tue, 17 Dec 2019 08:02:01 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z3sm25877396wrs.94.2019.12.17.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 08:02:00 -0800 (PST)
Date: Tue, 17 Dec 2019 16:01:58 +0000
From: Wei Liu <wl@xen.org>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20191217160158.azvabdumi4fiymsr@debian>
References: <cover.1576209614.git.netwiz@crc.id.au>
 <aa2b7e60d0e20ffe1e83b10f327efbb6dacd3358.1576209614.git.netwiz@crc.id.au>
 <20191217141330.etqf332fddplsbb4@debian>
 <1576597491.2697.0@crc.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576597491.2697.0@crc.id.au>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/2] Tidy up whitespace and formatting in
 file to be consistent.
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDI6NDQ6NTFBTSArMTEwMCwgU3RldmVuIEhhaWdoIHdy
b3RlOgo+IE9rLCBpZiBpdHMgZ29pbmcgdG8gYmUgNCBzcGFjZXMgZm9yIGVhY2ggZmlsZSwgSSBj
YW4gYmF0Y2ggY29udmVydCAmIHRpZHkKPiBzdHVmZiB1cC4uLgo+IAo+IFRoZSBmaWxlIEkgY2hh
bmdlZCBoYWQgYm90aCB0eXBlcywgc28gSSB3ZW50IHdpdGggbXkgb3duIHByZWZlcmVuY2UgOikK
PiAKPiBJZiBpdCBtaWdodCBiZSBhIGJldHRlciBhcHByb2FjaCwgSSdsbCBzb3J0IG91dCB0aGUg
bWFqb3JpdHkgb2Ygc2NyaXB0cyBpbgo+IHRoYXQgZGlyZWN0b3J5IC0gYW5kIGRvIG5vIGZ1bmN0
aW9uIGNoYW5nZXMgYW5kIHBvc3QgYSBzZXJpZXMgdGhhdCBkb2VzCj4gbm90aGluZyBidXQgY2xl
YW51cCAtIHRoZW4gZG8gdGhlIGJyY3RsIC8gaXAgY2hhbmdlcyBvbiB0b3Agb2YgdGhhdCBpbiBh
Cj4gZGlmZmVyZW50IHBhdGNoLgo+IAoKTGlrZSBKdWVyZ2VuIHNhaWQgb24gSVJDLCBpZiB5b3Ug
dGhpbmsgdGhhdCBwYXRjaCBzaG91bGQgYmUgYmFja3BvcnRlZAooZWl0aGVyIGJ5IHVwc3RyZWFt
IG9yIGRvd25zdHJlYW0gbWFpbnRhaW5lcnMpLCBpdCB3aWxsIG1ha2UgcGVvcGxlJ3MKbGlmZSBl
YXNpZXIgaWYgdGhhdCBnb2VzIGluIGZpcnN0LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
