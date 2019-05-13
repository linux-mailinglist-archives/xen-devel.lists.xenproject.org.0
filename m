Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AE1BA24
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:33:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCvZ-0000ih-Su; Mon, 13 May 2019 15:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQCvY-0000ib-Lr
 for xen-devel@lists.xen.org; Mon, 13 May 2019 15:31:44 +0000
X-Inumbo-ID: 3617d2b8-7594-11e9-b018-6f10652ccec0
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3617d2b8-7594-11e9-b018-6f10652ccec0;
 Mon, 13 May 2019 15:31:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A96341;
 Mon, 13 May 2019 08:31:43 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5893F71E;
 Mon, 13 May 2019 08:31:41 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
 <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
 <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <449bd563-f256-432f-a542-110d9eae0d73@arm.com>
Date: Mon, 13 May 2019 16:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzEzLzE5IDQ6MjkgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gCj4gCj4gT24g
MTMuMDUuMTkgMTc6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gTXkgcG9pbnQgb2YgbXkgbWVz
c2FnZSBpcyB0byB1bmRlcnN0YW5kIHRoZSBleGFjdCB3b3JrbG9hZC9zZXR1cCB5b3UgCj4+IGFy
ZSB1c2luZy4gImRkIiB3YXMgbm90IGFuIGVudGlyZWx5IG9idmlvdXMgY2hvaWNlIGZvciBDUFVC
dXJuIGFuZCAKPj4gR29vZ2xlIGRpZG4ndCBwcm92aWRlIGEgbG90IG9mIHdlYnNpdGUgYmFja2lu
ZyB0aGlzIGluZm9ybWF0aW9uLgo+IAo+PiBBbnl3YXksIG5vdyBJIHVuZGVyc3RhbmQgYSBiaXQg
bW9yZSB0aGUgd29ya2xvYWQsIGEgY291cGxlIG9mIG1vcmUgCj4+IHF1ZXN0aW9uczoKPj4gwqDC
oMKgIC0gSG93IG1hbnkgdkNQVXMgYXJlIHlvdSB1c2luZyBpbiBlYWNoIGRvbWFpbj8KPj4gwqDC
oMKgIC0gV2hhdCBzY2hlZHVsZXIgYXJlIHlvdSB1c2luZz8KPj4gwqDCoMKgIC0gV2hhdCBpcyB0
aGUgYWZmaW5pdHk/Cj4gCj4gRm9yIHRoZSB0ZXN0IHdpdGggZ2xtYXJrMjogRG9tMCAoNCBWQ1BV
cyksIERvbUQgKDQgVkNQVXMpLCA0IFBDUFVzLCBubyAKPiBhZmZpbml0eSBzcGVjaWZpZWQuCgpT
bywgYXJlIHlvdSBydW5uaW5nIDQgZGQgKG9uZSBmb3IgZWFjaCBjb3JlKSBpbiBwYXJhbGxlbD8g
QXJlIHRoZXkgcGlubmVkPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
