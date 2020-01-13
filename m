Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1D1393B3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 15:31:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir0hj-0002Nt-4r; Mon, 13 Jan 2020 14:28:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir0hi-0002No-3G
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 14:28:30 +0000
X-Inumbo-ID: f2d74324-3610-11ea-a985-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2d74324-3610-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 14:28:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m24so9900997wmc.3
 for <xen-devel@lists.xen.org>; Mon, 13 Jan 2020 06:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tAhSMp3AuWYRlkeRfRIO/58ScTsonRwDhZCMvWy5xQM=;
 b=iPrXErSGcB/AYiziD7v3bmXeNeo5heHroycSp7vk63mDs0OrDNDzaHWLcMi7U1RMpi
 vqFaj9+3CquKnXaTeCAbeUTdsL2SgIkSxjcIEEj+QLsSn8mU1avy/7gLVT3BoQWNDVIG
 ZSYJeC2h2Gv/YBcuo/gkEDeyOw4cCiFAS8gWM+jvHEZkQirfSir7umzL8YLZVKFj31NM
 k72MTUm6hfY+Hagyu0Uf4QMEKOoCve3oOgZFqgTCIYqLmZTI/kKFRLrdoaBm5lcxe8Ex
 yaqtrUGmVzAxp5V5fC/OTc8rOBlw6rYmPcyNXB3gIkq+adG25cw7+8I+l3X3YEPGcwOf
 Jz4A==
X-Gm-Message-State: APjAAAUJQnWxIWzX/RFnsWo5NViQX1CRCOmsBykhxIM7RbAv9rzm0Qwb
 anb70TSwQAa1Tmp7/p57T9Q=
X-Google-Smtp-Source: APXvYqwMFOX24U/yx31WvklVLxWx4hbht5gA0c5ln49ggdH4DAHozkHYC0iMyuHk2dQrWKEyDn7zsA==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr21242274wmj.169.1578925700521; 
 Mon, 13 Jan 2020 06:28:20 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id u14sm14883301wrm.51.2020.01.13.06.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 06:28:19 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
 <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
 <530f7613-299e-651b-c42e-c93ca261d16b@xen.org>
 <ccfc3367-a622-ae1b-8b67-5336bbb19788@citrix.com>
 <9c87e6fb-680d-de36-6c88-7758cc8ce125@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5c5070e-7ebb-fae7-2a8b-e9174cdc8cdb@xen.org>
Date: Mon, 13 Jan 2020 14:28:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <9c87e6fb-680d-de36-6c88-7758cc8ce125@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy8wMS8yMDIwIDE0OjA3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDEvMTMvMjAg
MjowMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTMvMDEvMjAyMCAxMzozOSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgR2VvcmdlLAo+Pj4KPj4+IFRoYW5rIHlvdSBmb3Igc3Vt
bWFyaXNpbmcgdGhlIHBvc3NpYmlsaXR5LiBPbmUgcXVlc3Rpb24gYmVsb3cuCj4+Pgo+Pj4gT24g
MTMvMDEvMjAyMCAxMjo1MSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+PiAyLiBCbG9jayBYRU5W
RVJfZXh0cmF2ZXJzaW9uIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLsKgIExlYXZlIHhlbl9kZW55
KCkKPj4+PiBhcyByZXR1cm5pbmcgIjxkZW5pZWQ+IiwgYnV0IHJlcGxhY2UgIjxkZW5pZWQ+IiB3
aXRoICIiIGluIGh2bWxvYWRlciBzbwo+Pj4+IGl0IGRvZXNuJ3Qgc2hvdyB1cCBpbiB0aGUgU3lz
dGVtIEluZm8gYW5kIHNjYXJlIHVzZXJzLgo+Pj4+Cj4+Pj4gMy4gQmxvY2sgWEVOVkVSX2V4dHJh
dmVyc2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBsZXZlbC7CoCBDaGFuZ2UgeGVuX2RlbnkoKQo+Pj4+
IHRvIHJldHVybiBhIG1vcmUgYmVuaWduIHN0cmluZyBsaWtlICI8aGlkZGVuPiIuwqAgKFBlcmhh
cHMgYWxzbyBmaWx0ZXIgaXQKPj4+PiBpbiBodm1sb2FkZXIsIGp1c3QgZm9yIGdvb2QgbWVhc3Vy
ZS4pCj4+Pgo+Pj4gTXkga25vd2xlZGdlIG9mIGxpdmUgbWlncmF0aW9uIG9uIHg4NiBpcyBhIGJp
dCBsaW1pdGVkLCBidXQgaWYgSQo+Pj4gdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhvc2UgdHdvIG9w
dGlvbnMgd291bGQgcmVxdWlyZSBhIGd1ZXN0IHRvIHJlYm9vdAo+Pj4gaW4gb3JkZXIgdG8gcGlj
ayB1cCB0aGUgY2hhbmdlcy4gQW0gSSBjb3JyZWN0Pwo+Pgo+PiBOb3QgaW4gdGhlIHNsaWdodGVz
dC7CoCBUaGUgY29udGVudCByZXR1cm5lZCBjaGFuZ2VzIHdoZW5ldmVyIHRoZQo+PiBoeXBlcnZp
c29yIGNoYW5nZXMuCj4gCj4gSSBndWVzcyBKdWxpZW4gaXMgdGFsa2luZyBhYm91dCB0aGUgZmls
dGVyaW5nIGRvbmUgaW4gaHZtbG9hZGVyLiAgVGhhdAo+IGZpbHRlcmluZyBpcyBhYm91dCB3aGF0
J3MgaW4gdGhlIGd1ZXN0J3MgQUNQSSB0YWJsZXM7IGFuZCAqdGhhdCogaGFwcGVucwo+IG9ubHkg
b25jZSBhdCBndWVzdCBib290OyBzbyB3aGF0ZXZlciB0aGUgc2NhcnkgbWVzc2FnZSBpcyBpbiB0
aGUgV2luZG93cwo+IFN5c3RlbSBJbmZvcm1hdGlvbiBwYWdlIChvciB3aGVyZXZlciBpdCBpcykg
d291bGQgc3RheSB0aGVyZSB1bnRpbCB0aGUKPiBndWVzdCByZWJvb3RzLCByZWdhcmRsZXNzIG9m
IHdoaWNoIG9wdGlvbiB3ZSBnbyB3aXRoLgoKWWVzLCBJIHdhcyBzcGVha2luZyBhYm91dCB0aGUg
ZmlsdGVyaW5nIGRvbmUgaW4gaHZtbG9hZGVyLiBUaGFuayB5b3UgCmJvdGggZm9yIHRoZSBleHBs
YW5hdGlvbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
