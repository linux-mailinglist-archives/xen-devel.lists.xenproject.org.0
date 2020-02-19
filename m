Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790A164053
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 10:25:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4LZF-00070Q-2V; Wed, 19 Feb 2020 09:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bYhU=4H=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j4LZD-00070J-JS
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 09:22:51 +0000
X-Inumbo-ID: 6633ea52-52f9-11ea-bc8e-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6633ea52-52f9-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 09:22:50 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4LZ7-00015z-GQ; Wed, 19 Feb 2020 10:22:45 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 1EF39103A05; Wed, 19 Feb 2020 10:22:45 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
In-Reply-To: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Date: Wed, 19 Feb 2020 10:22:45 +0100
Message-ID: <8736b7q6ca.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/ioperm: add new paravirt function
 update_io_bitmap
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cj4gT24gMTguMDIuMjAgMjI6
MDMsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gQlRXLCB3aHkgaXNuJ3Qgc3R1ZmYgbGlrZSB0
aGlzIG5vdCBjYXRjaGVkIGR1cmluZyBuZXh0IG9yIGF0IGxlYXN0Cj4+IGJlZm9yZSB0aGUgZmlu
YWwgcmVsZWFzZT8gSXMgbm90aGluZyBydW5uaW5nIENJIG9uIHVwc3RyZWFtIHdpdGggYWxsCj4+
IHRoYXQgWEVOIG11Y2sgYWN0aXZlPwo+Cj4gVGhpcyBwcm9ibGVtIHNob3dlZCB1cCBieSBub3Qg
YmVpbmcgYWJsZSB0byBzdGFydCB0aGUgWCBzZXJ2ZXIgKHByb2JhYmx5Cj4gbm90IHRoZSBmcmVz
aGVzdCBvbmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCj4KPiBPdXIg
Q0kgdGVzdHMgdGVuZCBkbyBiZSBtb3JlIHRleHQgY29uc29sZSBiYXNlZCBmb3IgZG9tMC4KCnRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9pb1twZXJtfHBsXSBzaG91bGQgaGF2ZSBjYXVnaHQg
dGhhdCBhcyB3ZWxsLApyaWdodD8gSWYgbm90LCB3ZSBuZWVkIHRvIGZpeCB0aGUgc2VsZnRlc3Rz
LgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
