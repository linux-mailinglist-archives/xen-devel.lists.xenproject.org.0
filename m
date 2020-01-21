Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B6143C07
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:28:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itrf0-0002wV-3H; Tue, 21 Jan 2020 11:25:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itrey-0002wO-TL
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:25:28 +0000
X-Inumbo-ID: b66a8a3d-3c40-11ea-ba76-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b66a8a3d-3c40-11ea-ba76-12813bfff9fa;
 Tue, 21 Jan 2020 11:25:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so2581437wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 03:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4W1WPIKOjEOBNklUGAPOVfYAjF1Qj12ce5G7cFXOO9s=;
 b=PmgaGLzItTI0Vyi703/CzdoAdjJtiu69HJzNffKiu53Tm6ER+LAQL2EstKj7SSVkRU
 Vw94SUhpaRaqwr8T2CmsFK8TnLLwTL1PATmX38Br38R3TPJwhw0g8gMDOm7B53IGykWf
 DuG252z4Nt697cZtrcagK6VkuVfpvo6Nwaebut4JHrhvL9nVO3JYFsqcQ9Y3KKOzW10Q
 KK9HG4TYH9K91q0bRISWPU9vD/ro5qDYL5MeheBVTcHbiFurFgSiBGT6n6sZmxt7d2rW
 OlY/YrLOgoXjGZvhGPmDRBs0y3kIsGXPfjqQSLiR959I+NdAKOtjYNW9TkmlOIEXcsP2
 CX/Q==
X-Gm-Message-State: APjAAAXC0OVwLkrkHbgOEbvlPa2y+poDkr6z3dye0H4BHDTi3yGw/kzd
 kkkT7f2AV+Q4Zrbdr3Vw+JU=
X-Google-Smtp-Source: APXvYqxxt0kNlW59ujpnfnGIQCxsHKLQJOcdqs0SLBEmgmZ+2+oxKdqPjhDvKj5Lnaa+YqbOmlVyeA==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr3931970wmc.21.1579605922499; 
 Tue, 21 Jan 2020 03:25:22 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id g18sm3297526wmh.48.2020.01.21.03.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 03:25:21 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Wei Xu <xuwei5@hisilicon.com>
References: <5E26C935.9080107@hisilicon.com>
 <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6a003f33-f5ff-c027-f09b-85b80c6accdb@xen.org>
Date: Tue, 21 Jan 2020 11:25:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjEvMDEvMjAyMCAxMTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEu
MDEuMjAyMCAxMDo0OSwgV2VpIFh1IHdyb3RlOgo+PiBBZGQgX19hY3BpX3VubWFwX3RhYmxlIGZ1
bmN0aW9uIGZvciBBUk0gYW5kIGludm9rZSBpdCBhdCBhY3BpX29zX3VubWFwX21lbW9yeQo+PiB0
byBtYWtlIHN1cmUgdGhlIHJlbGF0ZWQgZml4bWFwIGhhcyBiZWVuIGNsZWFyZWQgYmVmb3JlIHVz
aW5nIGl0IGZvciBhCj4+IGRpZmZlcmVudCBtYXBwaW5nLgo+IAo+IEhvdyBjYW4gaXQgcG9zc2li
bHkgYmUgdGhhdCB0aGlzIGlzIG5lZWRlZCBmb3IgQXJtIG9ubHk/CgpMZXQgbWUgZ2l2ZSBzb21l
IGJhY2tncm91bmQgKEkgd2lsbCBsZXQgV2VpIGRlYWxpbmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUg
CnBhdGNoZXMpLiBPbiBBcm0sIEkgbWFkZSB0aGUgZGVjaXNpb24gdG8gZm9yYmlkIGEgbWFwcGlu
ZyByZXBsYWNlbWVudCBpbiAKdGhlIHBhZ2UtdGFibGVzIGNvZGUuIFRoaXMgbWVhbnMgdGhhdCBp
ZiB5b3Ugd2FudCB0byByZS11c2UgdGhlIHNhbWUgCmZpeG1hcCwgdGhlbiB5b3UgbmVlZCB0byBj
bGVhciBpdCBmaXJzdC4KClRoZSByZWFzb24gZm9yIHRoZSByZXF1aXJlbWVudCBpcyBxdWl0ZSBz
aW1wbGUuIE9uIEFybSwgeW91IG5lZWQgdG8gdXNlIAphIGJyZWFrLWJlZm9yZS1tYWtlIHNlcXVl
bmNlIGFueSB0aW1lIHlvdSByZXBsYWNlIGEgdmFsaWQgZW50cnkgYnkgCmFub3RoZXIgdmFsaWQg
ZW50cnkgKHRoZXJlIGlzIGEgY291cGxlIG9mIGNhc2Ugd2hlcmUgaXQgaXMgbm90IG5lZWRlZCku
CgpBcyB0aGUgc2VxdWVuY2UgbmFtZSBzdWdnZXN0cyBpdCwgd2Ugd2lsbCBoYXZlIGEgc21hbGwg
d2luZG93IHdoZXJlIHRoZSAKdmlydHVhbCBhZGRyZXNzIHdpbGwgcG9pbnQgdG8gbm90aGluZy4g
VGhpcyBtYXkgcmVzdWx0IHRvIGFuIGFib3J0IGlmIAphbm90aGVyIENQVSBpcyBhY2Nlc3Npbmcg
dGhlIGFkZHJlc3MgYXQgdGhlIHNhbWUgdGltZS4KCkluIHRoZSBmaXhtYXAgY2FzZSBiZWxvdywg
dGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLiBCdXQgbm93IGltYWdpbmUgCnNoYXR0ZXJpbmcgYSBz
dXBlcnBhZ2UuLi4KClNvIHJhdGhlciB0aGFuIHRyeWluZyB0byBhbGxvdyBpbiBzb21lIGNhc2Vz
IHRoZSBtb2RpZmljYXRpb24gb2YgYSAKbWFwcGluZywgd2UganVzdCBmb3JiaWQgZm9yIGV2ZXJ5
dGhpbmcgYnV0IHBlcm1pc3Npb24gY2hhbmdlcy4gVGhpcyBpcyAKbXVjaCBzaW1wbGVyIHRvIHJl
YXNvbiBhbmQgYSBtdWNoIHNhbmVyIGludGVyZmFjZS4KClNpbWlsYXJseSwgSSB0aGluayB0aGlz
IGlzIG11Y2ggc2FuZXIgdG8gY2FsbCBoYXZlIGEgY2xlYXJfZml4bWFwKCkgZm9yIAplYWNoIHNl
dF9maXhtYXAoKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
