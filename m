Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB64717C2A0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 17:10:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAFWN-00035U-5e; Fri, 06 Mar 2020 16:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BnZ=4X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jAFWM-00035P-4m
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 16:08:18 +0000
X-Inumbo-ID: b0ad61a8-5fc4-11ea-90c4-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ad61a8-5fc4-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 16:08:17 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id y3so3075228edj.13
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 08:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=omTs43FXl4vpx4NnOjZFXKmvlqmgd2m6cBsyTpgh3aE=;
 b=rqIngYBJlheB1KanExksMr+fXdDGYpC20RbNiykVRhBRd9KuduqdfEoIjvyItSKW6I
 p08KoLZ8MdCqrZ7N2LJYUwBhrTgT0OLsWKh8GxdJVm+dyw0S89zq8onmuWLlUAV4QQTJ
 i6ahbRKIX99v+OdlJSWjx8T4PnQBH5tNeDvFLhfiwEOTaU+MGhVNli7Aw3QjgT6aRU9j
 0MjtbIXGUBS/aPVn1o/rOFqfn3/RbQRhki1nA5XHBD4XwwF6jR1YHE3ZDRRqP11tNSRU
 VEHIww/sEgEAvu0JynQdWoMk/OWGb+q3XZ5VWc5L0b0j79NKi8BNq/N7i3vwzZ+62Xzx
 f6vg==
X-Gm-Message-State: ANhLgQ0WnyDL/dtXMjGXD8HI9YdSGz8/EedMRYaqz8OI2olktQJNn4Dj
 rJhfx1EZ+HRbQ1yyar8nWig=
X-Google-Smtp-Source: ADFU+vtafPZDOE1YKKH5G2KkvKoJbzvMSIsY3GDQAbzx0+dFoYcZE4hFFqwof3ui+9eijlMxVeHVJQ==
X-Received: by 2002:a05:6402:1d1b:: with SMTP id
 dg27mr4056996edb.43.1583510896728; 
 Fri, 06 Mar 2020 08:08:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id u13sm1962527ejt.1.2020.03.06.08.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 08:08:16 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200304063212.20843-1-jgross@suse.com>
 <20200304063212.20843-6-jgross@suse.com>
 <de613cc1-d444-7290-d96b-0d3193fce276@xen.org>
 <0e284f2e-0da6-9dc6-9b1e-d6966a8a36e8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d0662bec-06fb-3a01-6338-329cfc75f7ff@xen.org>
Date: Fri, 6 Mar 2020 16:08:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0e284f2e-0da6-9dc6-9b1e-d6966a8a36e8@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/rcu: add assertions to debug
 build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8wMy8yMDIwIDE0OjM1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDA0LjAz
LjIwIDE0OjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAwNC8wMy8yMDIw
IDA2OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9yY3VwZGF0ZS5oIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKPj4+IGluZGV4IDMx
YzhiODZkMTMuLjlmNmQ0MjA4OTggMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmN1
cGRhdGUuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKPj4+IEBAIC0zNCwx
MCArMzQsNDAgQEAKPj4+IMKgICNpbmNsdWRlIDx4ZW4vY2FjaGUuaD4KPj4+IMKgICNpbmNsdWRl
IDx4ZW4vc3BpbmxvY2suaD4KPj4+IMKgICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgo+Pj4gLSNp
bmNsdWRlIDx4ZW4vcHJlZW1wdC5oPgo+Pj4gKyNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4+PiAr
I2luY2x1ZGUgPGFzbS9hdG9taWMuaD4KPj4+IMKgICNkZWZpbmUgX19yY3UKPj4+ICsjaWZuZGVm
IE5ERUJVRwo+Pj4gK0RFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHJjdV9sb2NrX2NudCk7
Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2Rpc2FibGUodm9pZCkK
Pj4+ICt7Cj4+PiArwqDCoMKgIHRoaXNfY3B1KHJjdV9sb2NrX2NudCkrKzsKPj4+ICvCoMKgwqAg
YXJjaF9sb2NrX2FjcXVpcmVfYmFycmllcigpOwo+Pgo+PiBJIGFtIG5vdCBzdXJlIHRvIHVuZGVy
c3RhbmQgdGhlIGdvYWwgb2YgdGhpcyBiYXJyaWVyLiBXaGF0IGFyZSB5b3UgCj4+IHRyeWluZyB0
byBwcm90ZWN0IGFnYWluc3Q/Cj4gCj4gVGhpcyBpcyB0aGUgcmVzdWx0IG9mIGEgcmVxdWVzdCBi
eSBSb2dlciwgd2hpY2ggc2VlbWVkIHJlYXNvbmFibGUsCj4gYWx0aG91Z2ggSSBzaG91bGQgaGF2
ZSBjaGVja2VkIHRoZSBzdWdnZXN0ZWQgYmFycmllciB0eXBlIG1vcmUKPiB0aG9yb3VnaGx5Lgo+
IAo+IEhlIHN1Z2dlc3RlZCB0byBhZGQgYmFycmllcnMgbGlrZSBpbiB0aGUgZm9ybWVyIHByZWVt
cHRfW2VufGRpc11hYmxlKCkKPiBjYXNlcywgYnV0IHRvIHVzZSB0aGUgYWNxdWlyZSBhbmQgcmVs
ZWFzZSBiYXJyaWVycyBsaWtlIGluIGxvY2tzLgoKSSBoYXZlIENDZWQgUm9nZXIgYXMgSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgd2FudCBtZW1vcnkgCm9yZGVyaW5nIHdpdGggYWxs
IHRoZSBDUFVzIG9uIEFybS4KCj4gCj4gVGhpbmtpbmcgbW9yZSBhYm91dCBpdCBJIHRoaW5rIGEg
c2ltcGxlIGJhcnJpZXIoKSBzaG91bGQgZG8gdGhlIHRyaWNrIGFzCj4gb25seSBjcHUgbG9jYWwg
cHJvdGVjdGlvbiBpcyBuZWVkZWQuCgpOb3RlIHRoYXQgb24gQXJtIGJhcnJpZXIoKSBpcyBvbmx5
IGEgY29tcGlsZXIgYmFycmllci4gSXQgZG9lcyBub3QgCnByZXZlbnQgYSBDUFUgdG8gcmUtb3Jk
ZXIgdGhlIG1lbW9yeSBhY2Nlc3MuIEJ1dCBJIHRoaW5rIHRoZSBiYXJyaWVyKCkgCm91Z2h0IHRv
IGJlIGZpbmUgaW4gdGhpcyBjYXNlIChhbHRob3VnaCwgSSBhbSBub3QgMTAwJSBzdXJlKS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
