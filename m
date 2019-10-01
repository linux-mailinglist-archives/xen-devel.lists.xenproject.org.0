Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F483C40A4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:09:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFNUl-0002Z3-UG; Tue, 01 Oct 2019 19:07:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFNUk-0002Yy-6E
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:07:34 +0000
X-Inumbo-ID: b8f456d0-e47e-11e9-9707-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b8f456d0-e47e-11e9-9707-12813bfff9fa;
 Tue, 01 Oct 2019 19:07:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF65C1000;
 Tue,  1 Oct 2019 12:07:32 -0700 (PDT)
Received: from [10.37.10.143] (unknown [10.37.10.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5E8A3F706;
 Tue,  1 Oct 2019 12:07:31 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, Andrii Anisov <andrii.anisov@gmail.com>, 
 xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
 <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
 <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <435b4ce8-6c9c-a9d3-f5b5-b19bf68f1ab9@arm.com>
Date: Tue, 1 Oct 2019 20:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTAvMS8xOSA1OjA3IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4g
T24gMDEuMTAuMTkgMTg6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDEvMTAvMjAxOSAx
NjoyNSwgT2xla3NhbmRyIHdyb3RlOgo+Pj4KPj4+IE9uIDAxLjEwLjE5IDE4OjA0LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiAxLiBHaXZpbmcgdGhlIElPTU1VIHRvIERvbTAgaXMgYSBiYWQgaWRl
YS4KClBsZWFzZSB0byB0cnkgZXhwYW5kIHlvdXIgdGhvdWdodHMgaW4gdGhlIHNhbWUgZS1tYWls
IHdoZW4geW91IHNheSAidGhpcyAKaXMgYSBiYWQgaWRlYSIuCgpCdXQsIHRoaXMgaXMgY2xlYXJs
eSB3aGF0IGhhcHBlbiBpbiBjdXJyZW50IFhlbiBzZXR1cCBpZiB0aGUgZHJpdmVyIGlzIApub3Qg
ZW5hYmxlZC4gV2hhdCBJIHdhbnQgdG8gYXZvaWQgaXMgZXhwb3NpbmcgYW4gaGFsZiBjb21wbGV0
ZSBiaW5kaW5ncyAKdG8gdGhlIGd1ZXN0ICh5b3UgZG9uJ3Qga25vdyBob3cgaXQgd2lsbCBiZWhh
dmUpLgoKU28gd2UgZWl0aGVyIHJlbW92ZSBhbGwgdGhlIHByb3BlcnRpZXMgYW5kIG5vZGUgcmVs
YXRlZCB0byB0aGUgSU9NTVVzIG9yIApub3RoaW5nLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
