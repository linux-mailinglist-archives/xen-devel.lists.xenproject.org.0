Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633DCFB29
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 15:19:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHpKt-0001mb-M5; Tue, 08 Oct 2019 13:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHpKs-0001mS-5X
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 13:15:30 +0000
X-Inumbo-ID: b2874434-e9cd-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2874434-e9cd-11e9-8c93-bc764e2007e4;
 Tue, 08 Oct 2019 13:15:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1662CB18B;
 Tue,  8 Oct 2019 13:15:28 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <E1iHpCB-00025s-UB@osstest.test-lab.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a801fa04-c85a-96da-1376-71a1a7d18dbc@suse.com>
Date: Tue, 8 Oct 2019 15:15:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <E1iHpCB-00025s-UB@osstest.test-lab.xenproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-i386-qemuu-rhel6hvm-amd
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxNTowNiwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGJyYW5j
aCB4ZW4tdW5zdGFibGUKPiB4ZW5icmFuY2ggeGVuLXVuc3RhYmxlCj4gam9iIHRlc3QtYW1kNjQt
aTM4Ni1xZW11dS1yaGVsNmh2bS1hbWQKPiB0ZXN0aWQgeGVuLWJvb3QKPiAKPiBUcmVlOiBsaW51
eCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXgtMi42LmdpdAo+IFRyZWU6IGxpbnV4ZmlybXdhcmUgZ2l0Oi8veGVuYml0cy54ZW4ub3Jn
L29zc3Rlc3QvbGludXgtZmlybXdhcmUuZ2l0Cj4gVHJlZTogb3ZtZiBnaXQ6Ly94ZW5iaXRzLnhl
bi5vcmcvb3NzdGVzdC9vdm1mLmdpdAo+IFRyZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4ub3Jn
L3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdAo+IFRyZWU6IHFlbXV1IGdpdDovL3hlbmJpdHMueGVu
Lm9yZy9xZW11LXhlbi5naXQKPiBUcmVlOiBzZWFiaW9zIGdpdDovL3hlbmJpdHMueGVuLm9yZy9v
c3N0ZXN0L3NlYWJpb3MuZ2l0Cj4gVHJlZTogeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4u
Z2l0Cj4gCj4gKioqIEZvdW5kIGFuZCByZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKgo+
IAo+ICAgQnVnIGlzIGluIHRyZWU6ICBsaW51eCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgtMi42LmdpdAo+ICAgQnVnIGludHJvZHVj
ZWQ6ICBkYTBjOWVhMTQ2Y2JlOTJiODMyZjFiMGY2OTQ4NDBlYThlYjMzY2NlCj4gICBCdWcgbm90
IHByZXNlbnQ6IDQ2NzEzYzNkMmY4ZGE1ZTNkOGRkZDIyNDliY2IxZDk5NzRmYjVkMjgKPiAgIExh
c3QgZmFpbCByZXBybzogaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVz
dC9sb2dzLzE0MjQzOS8KCkkgZGlkIHNlbmQgYSBwYXRjaCBmb3IgdGhpcyBpc3N1ZSB5ZXN0ZXJk
YXk6Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzcvMjIwIChjYW4ndCBzZWVtIHRvIGZp
bmQgaXQgb24KcGF0Y2h3b3JrKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
