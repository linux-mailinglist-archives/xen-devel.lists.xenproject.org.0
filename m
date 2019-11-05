Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33487F00DD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:12:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0Rr-0004n7-Ia; Tue, 05 Nov 2019 15:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xSMy=Y5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iS0Rp-0004n2-TT
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:08:45 +0000
X-Inumbo-ID: 28b534ce-ffde-11e9-a19a-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28b534ce-ffde-11e9-a19a-12813bfff9fa;
 Tue, 05 Nov 2019 15:08:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c17so13996843wmk.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 07:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mUcghL661axGMgxPbIpghJ+iWhMSheHr+OpMNq3qb5k=;
 b=GaMJxj6wIcjbkVHenlC2/kF6CAvW73NataR4Vz5cwop25paSWeYJXBc8aNTG5E9wDH
 vN/6QFMn3kcHhZb7FiyHYZICsmR2kekJbb0kGTHrxeAJnoqhG1xfizuKKmfIO/NnT3/I
 hVHVIPes3nW29YbbP5Z+yMW1Lk7cOtdPsDF0jl6iUdR8scNRnUC5n8cw3VdW2db02Y5T
 nYgxbEsaUtrObcbY53SUi5rnaGqGLxaLIP/Cbb9qci2KTk177xXqZbcwPBIOY1H1Cdx/
 fxGUdLW86LLf00a/EzWIkjGzjrYFP+rKYqMhEXGMr7WAwGBFRjzAbADWOGS31ytFfrVR
 lLQg==
X-Gm-Message-State: APjAAAXmMgdp29jFYSCzNkaKEfibxmwloMHjDspNJv7Z0BcV8xmGt9P1
 zxey4kYtSb1PUp2nO0kiUMw=
X-Google-Smtp-Source: APXvYqwYf5RV1lCGG6qD7QWroPYV0WZSHHNGc0eMGCtzWVlUsuwGdFYxWuP97MM4w10MLzvXVje9hA==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr4515298wme.57.1572966523911;
 Tue, 05 Nov 2019 07:08:43 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id b196sm25331825wmd.24.2019.11.05.07.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 07:08:43 -0800 (PST)
Date: Tue, 5 Nov 2019 15:08:41 +0000
From: Wei Liu <wl@xen.org>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Message-ID: <20191105150841.hfww7mjahmibrhym@debian>
References: <20191105135152.5168-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105135152.5168-1-stewart.hildebrand@dornerworks.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH v2] MAINTAINERS: ARINC 653 scheduler
 maintainer updates
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
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDg6NTE6NTJBTSAtMDUwMCwgU3Rld2FydCBIaWxkZWJy
YW5kIHdyb3RlOgo+IEFkZCBEb3JuZXJXb3JrcyBpbnRlcm5hbCBsaXN0LiBUaGlzIHdpbGwgZm9y
d2FyZCB0byByZWxldmFudCBwZW9wbGUKPiB3aXRoaW4gRG9ybmVyV29ya3MuCj4gCj4gQWRkIG15
c2VsZiB0byBNQUlOVEFJTkVSUyBmb3IgQVJJTkM2NTMgc2NoZWR1bGVyLgo+IAo+IFJlbW92ZSBS
b2JiaWUgZnJvbSBNQUlOVEFJTkVSUyBmb3IgQVJJTkM2NTMgc2NoZWR1bGVyLgo+IAoKTWlzc2lu
ZyBTb0IgaGVyZS4KCk5vIG5lZWQgdG8gcmVzZW5kLiBUaGUgZm9sbG93aW5nIGNhbiBiZSBhZGRl
ZCB3aGlsZSBjb21taXR0aW5nOgoKICBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQg
PHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+CgpMZXQgbWUga25vdyB3aGF0IHlv
dSB0aGluay4KCj4gLS0tCj4gCj4gTm90ZSB0aGF0IGdldF9tYWludGFpbmVycy5wbC9hZGRfbWFp
bnRhaW5lcnMucGwgZG8gbm90IGN1cnJlbnRseSBhZGQKPiB0aGUgRG9ybmVyV29ya3MgbGlzdCBl
bWFpbCBhZGRyZXNzIGluIENDLiBJIHRlc3RlZCBhZGRfbWFpbnRhaW5lcnMucGwKPiBvbiBhIHBh
dGNoIG1vZGlmeWluZyBzY2hlZF9hcmluYzY1My5jLCBhbmQgSSBkaWQgbm90IHNlZSB0aGUKPiBE
b3JuZXJXb3JrcyBsaXN0IGFwcGVhciBpbiBDQy4KCkxhcnMsIHRoaXMgaXMgZm9yIHlvdS4KCkFz
IGZhciBhcyBJIGNhbiB0ZWxsIGdldF9tYWludGFpbmVycy5wbCBkb2VzIGV4dHJhY3QgTDouIFRo
ZSBwcm9ibGVtIGlzCnByb2JhYmx5IHdpdGggYWRkX21haW50YWluZXJzLnBsLgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
