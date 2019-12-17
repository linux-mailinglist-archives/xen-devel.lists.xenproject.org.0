Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F9122EC3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:30:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDp1-0003DR-Pq; Tue, 17 Dec 2019 14:27:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihDp1-0003DM-98
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:27:35 +0000
X-Inumbo-ID: 5dd72c0e-20d9-11ea-8edd-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dd72c0e-20d9-11ea-8edd-12813bfff9fa;
 Tue, 17 Dec 2019 14:27:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so3146712wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MGBIIeTIB3b0rNcQ/ojIF7Bckbwmnzj/Jpioaxzb1jg=;
 b=mtZ2Zqh3iTGCH8PJQbX6u8KeSGFFOV1XuxXG8JruIzJYLRqTo5FwJcGt9TvLKCB6Xe
 5HZYHGw14bVE8w+LDZe2IVQrLgS5fJVTd6oEAjUJ6NX7KQmCufZks0HfciTVBBusm5MI
 0jTalxcPSdwXhQxYGpxazdK35r4RY29xEMLLRxBxwkCZeilVDIK8U8C67id1+/T/MSLc
 oAw8bgS+ZdBEi+O8Uzhn7f2UPzcRJBimHTy4Gkuz5nbpJSqkq5nWVz71aINMOi3qGvhk
 m3Mw/h0DDxTf6LkplLcg6Wg8jj+H7YqW/gRE1EUewrmlrZLeMRIXIqIvnT42Uw8MxSYU
 xEYA==
X-Gm-Message-State: APjAAAUP1DABuZRZQ+d2h7KieJX9M0enpbqrLpuWnQoHXYwh8k8Yk0yc
 mkTidfw/Pqo/Np4pX0DVqDY=
X-Google-Smtp-Source: APXvYqz9NHSQTGR/qWQg+aYGyuedQ41DfowyM+CxyZQh+3VU6R1A1ZFEOBRNlq/KiaSjS+Otsa7UDw==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr5740953wmb.126.1576592853845; 
 Tue, 17 Dec 2019 06:27:33 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id h2sm26810785wrt.45.2019.12.17.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:27:33 -0800 (PST)
Date: Tue, 17 Dec 2019 14:27:31 +0000
From: Wei Liu <wl@xen.org>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20191217142731.adqhizxcbh7zvudl@debian>
References: <cover.1576209614.git.netwiz@crc.id.au>
 <aa2b7e60d0e20ffe1e83b10f327efbb6dacd3358.1576209614.git.netwiz@crc.id.au>
 <20191217141330.etqf332fddplsbb4@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217141330.etqf332fddplsbb4@debian>
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

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDI6MTM6MzBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIERlYyAxMywgMjAxOSBhdCAwMzowODozNFBNICsxMTAwLCBTdGV2ZW4gSGFpZ2gg
d3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+
Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gCj4gSSB3aWxsIG5lZWQgdG8g
YWRkIHRvb2xzL2hvdHBsdWcgdG8gdGhlIHN1YmplY3QgbGluZSBhbmQgdGhlIGZvbGxvd2luZwo+
IGNvbW1pdCBtZXNzYWdlOgo+IAo+ICAgIFVzZSA0IHNwYWNlcyBmb3IgaW5kZW50YXRpb24gdGhy
b3VnaG91dCB0aGUgZmlsZS4gTm8gZnVuY3Rpb25hbAo+ICAgIGNoYW5nZS4KCkFjdHVhbGx5IHlv
dSB1c2VkIHRhYnMgbm90IHNwYWNlcy4KCkdvaW5nIHRocm91Z2ggb3RoZXIgZmlsZXMgaW4gdGhl
IHNhbWUgZGlyZWN0b3JpZXMsIHRoZXkgYWxsIHVzZSBzcGFjZXMKLS0gYWx0aG91Z2ggdGhleSBh
cmUgYXMgbWVzc3kgYXMgdGhpcyBvbmUgZmlsZSB5b3VyIG1vZGlmaWVkLgoKV2hpbGUgSSB0cnkg
cmVhbGx5IGhhcmQgdG8gYXZvaWQgYmlrZXNoZWRkaW5nIHNwYWNlIHZzIHRhYiwgSSBkbyB3YW50
CnRob3NlIGZpbGVzIHRvIGJlIGNvbnNpc3RlbnQsIHNvIEkgd2lsbCB0YWtlIHRoZSBhbGwtb3It
bm90aGluZyBhcHByb2FjaApoZXJlLiBJIHByb2JhYmx5IHdvbid0IGNvbW1pdCB0aGlzIHBhdGNo
IHVubGVzcyB0aGVyZSBpcyBhIHZlcnkgZ29vZApyZWFzb24gZm9yIGl0IHRvIGJlIGNvbW1pdHRl
ZC4uLgoKV2VpLgoKPiAKPiBXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
