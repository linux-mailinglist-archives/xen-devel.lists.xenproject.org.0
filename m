Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97736143BED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:19:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itrW3-00024Q-Oh; Tue, 21 Jan 2020 11:16:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itrW2-00024K-9k
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:16:14 +0000
X-Inumbo-ID: 6cdae5ac-3c3f-11ea-ba75-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cdae5ac-3c3f-11ea-ba75-12813bfff9fa;
 Tue, 21 Jan 2020 11:16:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so2532563wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 03:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HrNSlthzlKe42uLklpe4LbtomiyxMZULCv5SQ7NKNsw=;
 b=tjItwisMFFRHB1zwGxKGL3S8MQl3DOxXPki3+1sfxXNhbjXbI4YYgdnfJMuqTDuT/F
 oBzcKNeESFGiLIqdEVTQvAxUStB874Am2PprGzfWXm6ovGHcR++cm0R6zqNl+ZAclSWc
 dPJd2bgxeT9R8vJWnrbSXV8lOKxeCzu+xvBslR7TXJe8/TTAbV9Nfdi6E+aFJ33BCCls
 pt+f3Rwur7VdxyqNmwN1Q8XwGZ//k3dW98dn1X92ofWcLHEUWmC25+CD/3FmfVmXKZlG
 f8SJBbsmJjN6EyNPyvSWhuF4yrk8dv0Rq2yIV42mnLhwgpWTaXOQ7UJ9hsX8KNNVGU0g
 iW4w==
X-Gm-Message-State: APjAAAVl3Mdj0BcuMhK5Faz+RJ+zORxfDW9Nst/3Y3NJ5nY61ZI+F4Zt
 gwsk8Sq1bwrbQim5/Erql6g=
X-Google-Smtp-Source: APXvYqzTjoFi6TfGnMEeCMTXoNiu6P0n9p8XTPJOoTWiNW6s0tO9y7F4qn8NpGa2V16Duk+Yys8FsQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr3841485wma.6.1579605369218; 
 Tue, 21 Jan 2020 03:16:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id e8sm52020877wrt.7.2020.01.21.03.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 03:16:08 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Wei Xu <xuwei5@hisilicon.com>
References: <5E26738C.1060605@hisilicon.com>
 <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6297d097-dc86-fe23-abaa-ca26b6c35a0d@xen.org>
Date: Tue, 21 Jan 2020 11:16:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] ns16550: Add ACPI support for ARM only
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMS8yMDIwIDExOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPiAKPj4gKyAgICBpZiAo
IEFDUElfRkFJTFVSRShzdGF0dXMpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHByaW50aygibnMx
NjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKPiAKPiBJcyBzdWNoIGEgbWVzc2Fn
ZSB3YXJyYW50ZWQ/IEkuZS4gd291bGRuJ3QgaXQgdHJpZ2dlciBvbiBhbGwKPiBzeXN0ZW1zIG5v
dCBoYXZpbmcgdGhlIHRhYmxlLCB3aGljaCBpcyBoYXJkbHkgd2hhdCB5b3Uvd2Ugd2FudD8KPiAK
Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gCj4gQWxzbywgaXMgaXQgcmVhbGx5IGFuIGVy
cm9yIGlmIHRoZXJlJ3Mgbm8gc3VjaCB0YWJsZT8KCllvdSBjYW4gb25seSBiZSB0aGVyZSBpZiB0
aGUgYXJtLXVhcnQuYyBmb3VuZCBhbiBTUENSIHRhYmxlLiBTbyB0aGlzIGlzIAphIHNhbml0eSBj
aGVjay4gVGhlcmVmb3JlIEkgdGhpbmsgdGhlIGVycm9yIG1lc3NhZ2UgaXMgd2FycmFudCBoZXJl
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
