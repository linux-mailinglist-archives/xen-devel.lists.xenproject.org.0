Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92443116C7E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:48:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHTl-0000Nw-Bd; Mon, 09 Dec 2019 11:45:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zX1n=Z7=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ieHTj-0000Nr-Q4
 for xen-devel@lists.xen.org; Mon, 09 Dec 2019 11:45:27 +0000
X-Inumbo-ID: 63f670bb-1a79-11ea-87bf-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63f670bb-1a79-11ea-87bf-12813bfff9fa;
 Mon, 09 Dec 2019 11:45:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so15815872wrt.6
 for <xen-devel@lists.xen.org>; Mon, 09 Dec 2019 03:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=agBAHOblRcruVXNP+EDq7oWXQbu+CYUnsh/cH0FqJ5w=;
 b=bDuEZyFjPfthjd0i5WcGFoPY36Psc6xpAuOZRC4kj+mt5pfQJICApE8PED3o4yB/fs
 AmoPU8gbPY0XWYiQ6ou+I89VUKMZaUGHPqlOxFuHaQAEYZbykVTapicVaNRlRbkmoP5V
 0NthKmyPVv1doVe9Qhyuu2yrSHrj0RTBShQOI2qKYslGo59yYW3KojtJqLd/qfgaR4ls
 1O1eJ1pLFTudKUGXKliSz/0opFL/nkA1EDureCZi+um2AjBRIar/pWVMXHSvQcbWmzIw
 uiwPmsXnfCmP9ecuMIQZoaP52ACHK+6UdTa97g1LLQH2knc8/5C8emSYnI8hl4rZ5IL0
 2Bqg==
X-Gm-Message-State: APjAAAXDph2QUfLT/lxV+bKfjKaQ+5TKSPI0bT9rG+se+BEokaC89hdw
 n1LJviaLxTm2dpSDEY05zGjPzA/ozUw=
X-Google-Smtp-Source: APXvYqwufgOB+w0CILMCJK02knJy1a0fuWhpN3Mx7Hvfks2y/XhGRaXhafFOCcLSMNeU/QLF05rrJw==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr1751029wru.150.1575891925593; 
 Mon, 09 Dec 2019 03:45:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id z185sm13606922wmg.20.2019.12.09.03.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 03:45:25 -0800 (PST)
To: Ian Jackson <ian.jackson@citrix.com>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
 <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
 <24042.39208.563484.2274@mariner.uk.xensource.com>
 <9b0e4402-574e-4d25-c7ee-5c28fe88a448@xen.org>
 <24046.12935.596930.542875@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <951cb333-2a80-598b-f05e-853b5422711b@xen.org>
Date: Mon, 9 Dec 2019 11:45:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <24046.12935.596930.542875@mariner.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOS8xMi8yMDE5IDExOjM5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4gR3Jh
bGwgd3JpdGVzICgiUmU6IFByb2JsZW0gYm9vdGluZyBEZWJpYW4gYnVzdGVyIG9uIGFybmRhbGUi
KToKPj4gTG9va2luZyBhdCB0aGUgY29tbWFuZCBsaW5lIGZvciBMaW51eCwgd2UgZG9uJ3QgcGFz
cyBjbGtfaWdub3JlX3VudXNlZC4KPj4gV2l0aG91dCBpdCwgdGhlIExpbnV4IG1heSBkaXNhYmxl
IHRoZSBjbG9jayBvZiB0aGUgVUFSVCBpZiBpdCB3YXNuJ3QKPj4gc2hhcmVkIHdpdGggYW5vdGhl
ciBkZXZpY2UuIFRoaXMgd291bGQgZXhwbGFpbiB0aGUgc3VkZGVuIGxvc3Mgb2YgdGhlCj4+IGNv
bnNvbGUuCj4+Cj4+IFRoZSBmb2xsb3dpbmcgbGluZSBpbiBPc3N0ZXN0L0RlYmlhbi5wbSB3b3Vs
ZCBuZWVkIHRvIGJlIHVwZGF0ZWQ6Cj4+Cj4+ICAgICAgICBwdXNoIEB4ZW5rb3B0LCAiY2xrX2ln
bm9yZV91bnVzZWQiCj4+ICAgICAgICAgICAgICAgaWYgJGhvLT57U3VpdGV9ID1+IG0vd2hlZXp5
fGplc3NpZXxzdHJldGNoLzsKPiAKPiBXZWxsIHNwb3R0ZWQuICBJIHdpbGwgdHJ5IHVwZGF0aW5n
IHRoaXMuICBUaGFua3MuCj4gCj4gKElzIHRoZXJlIGFueSBwb3NzaWJpbGl0eSB0aGF0IHRoaXMg
YnVnIHdpbGwgYmUgZml4ZWQgYXQgc29tZSBwb2ludD8pCgpXZSBoYWQgdGhlIHNhbWUgZGlzY3Vz
c2lvbiBhIGZldyBtb250aHMgYWdvIGZvciBTdHJldGNoIDopLgoKU29tZW9uZSBhdHRlbXB0ZWQg
aXQgdG8gZml4IGl0IGEgZmV3IHllYXJzIGFnbyBidXQgdGhpcyBuZXZlciByZWFjaGVkIApMaW51
eCB1cHN0cmVhbS4KCiBGcm9tIG15IHBlcnNwZWN0aXZlLCB0aGlzIGlzIGEgbG93IGhhbmdpbmct
ZnJ1aXQgYXMgdGhlcmUgYXJlIG1vcmUgCmNvbmNlcm5pbmcgYnVncyB0aGF0IGNhbid0IGJlIHdv
cmthcm91bmQuIEJ1dCB0aGUgcHJvYmxlbSBpcyBkb2N1bWVudGVkLCAKc28gc29tZW9uZSBjb3Vs
ZCBlYXNpbHkgcGljayBpdCB1cCBpZiBoZS9zaGUgd2FudGVkLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
