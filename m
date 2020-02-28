Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AB17400A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 20:00:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7kqZ-0004PR-51; Fri, 28 Feb 2020 18:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7kqX-0004PJ-Hw
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 18:58:49 +0000
X-Inumbo-ID: 5a3354b2-5a5c-11ea-9a04-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a3354b2-5a5c-11ea-9a04-12813bfff9fa;
 Fri, 28 Feb 2020 18:58:49 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p14so4512112edy.13
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 10:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RUV9vD6r4aTfc18zAvqVINT1/Bmofet+IqlfZlDAa2o=;
 b=hXbO5mn5TCmSmed17lXcxRtXqbtlnrLydIUE+HXmB98LdFTazYDLCK7kJzKbpehTUv
 hJj6UbEGHM11pg67EngXZbV27OrG2mYpdWYziQFl7AVFjo2//IQN0OY67iiEyMx+RxpE
 2LVen18L3yskI0lA4WF9hSJMbJBmYMKyBLUenaSYeKp/Xy9ctB2sMS6Oa9KPSfuxjfn7
 vz30a5Wwlr9WByvIthxq0GpaJPcAHhOUZAhmE3KponsB9btiXKnJ1TRDIgV9YT0K2iXK
 U5mxYYIrPcauJ2FJL1xxYcD5Qeyvu7Q1goWf1241AkP8Hbu8s90ti5vEHWUbyD47pvGv
 Pixg==
X-Gm-Message-State: APjAAAV1xuoD3nSk5IuE6/G4lJbq70Y57e73LNlNLyH9bcnjEMR4cXk9
 bcr4a5wU59T5GzpL4/mim7bqXGIFzJrWfQ==
X-Google-Smtp-Source: APXvYqxhEVNkQk/cwiKcKl0cseuL2tx00ZcTNMBFTIj0Jz/RZW+T88Ot2Sb12YDYUvRQjmIGLwnW/w==
X-Received: by 2002:a17:906:ce57:: with SMTP id
 se23mr5445881ejb.362.1582916328142; 
 Fri, 28 Feb 2020 10:58:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id u9sm439065ejj.49.2020.02.28.10.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 10:58:47 -0800 (PST)
To: xen-devel@lists.xenproject.org
References: <20200228185726.7004-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <005d1860-d6a1-12e5-2cee-0c7deddafd1e@xen.org>
Date: Fri, 28 Feb 2020 18:58:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228185726.7004-1-julien@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: Remove 'led' variable in
 map_grant_ref
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
Cc: Julien Grall <jgrall@amazon.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIGlnbm9yZSB0aGlzIHZlcnNpb24gYXMgSSBmb3Jnb3QgdG8gQ0MgdGhlIG1haW50YWlu
ZXJzIG9uIGl0LgoKQ2hlZXJzLAoKT24gMjgvMDIvMjAyMCAxODo1NywgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlIG5h
bWUgb2YgdGhlIHZhcmlhYmxlICdsZWQnIGlzIGNvbmZ1c2luZyBhbmQgb25seSB1c2VkIGluIG9u
ZSBwbGFjZSBhCj4gbGluZSBhZnRlci4gU28gcmVtb3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gLS0tCj4gICB4ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMgfCA0ICstLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
IGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4gaW5kZXggMDU3Yzc4ZjYyMC4uOWZkNmU2MDQx
NiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMKPiBAQCAtOTQ0LDcgKzk0NCw2IEBAIG1hcF9ncmFudF9yZWYoCj4g
ICAgICAgc3RydWN0IGRvbWFpbiAqbGQsICpyZCwgKm93bmVyID0gTlVMTDsKPiAgICAgICBzdHJ1
Y3QgZ3JhbnRfdGFibGUgKmxndCwgKnJndDsKPiAgICAgICBncmFudF9yZWZfdCByZWY7Cj4gLSAg
ICBzdHJ1Y3QgdmNwdSAgICpsZWQ7Cj4gICAgICAgZ3JhbnRfaGFuZGxlX3QgaGFuZGxlOwo+ICAg
ICAgIG1mbl90IG1mbjsKPiAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZyA9IE5VTEw7Cj4gQEAg
LTk1Nyw4ICs5NTYsNyBAQCBtYXBfZ3JhbnRfcmVmKAo+ICAgICAgIHVpbnQxNl90ICpzdGF0dXM7
Cj4gICAgICAgYm9vbF90IG5lZWRfaW9tbXU7Cj4gICAKPiAtICAgIGxlZCA9IGN1cnJlbnQ7Cj4g
LSAgICBsZCA9IGxlZC0+ZG9tYWluOwo+ICsgICAgbGQgPSBjdXJyZW50LT5kb21haW47Cj4gICAK
PiAgICAgICBpZiAoIHVubGlrZWx5KChvcC0+ZmxhZ3MgJiAoR05UTUFQX2RldmljZV9tYXB8R05U
TUFQX2hvc3RfbWFwKSkgPT0gMCkgKQo+ICAgICAgIHsKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
