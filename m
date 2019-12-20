Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3D127BD6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:39:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiISd-0006xB-3k; Fri, 20 Dec 2019 13:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiISb-0006x2-M2
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:36:53 +0000
X-Inumbo-ID: c3769c60-232d-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3769c60-232d-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 13:36:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 623AFAED5;
 Fri, 20 Dec 2019 13:36:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Date: Fri, 20 Dec 2019 14:37:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/5] x86emul: allow suppressing FPU/MMX/SIMD
 insn emulation
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBpbiBwYXJ0aWN1bGFyIGhlbHBmdWwgZm9yIHB1cmUgUFYgZW52aXJvbm1lbnRzLCBl
LmcuIHRoZQpzaGltLgoKMTogdXNlIENBU0VfU0lNRF9QQUNLRURfSU5UKCkgd2hlcmUgcG9zc2li
bGUKMjogaW50cm9kdWNlIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgpCjM6IGRyb3AgQ0FTRV9T
SU1EX0RPVUJMRV9GUCgpCjQ6IGludHJvZHVjZSBDQVNFX1NJTURfLi4uX0ZQX1ZFWCgpCjU6IGRp
c2FibGUgRlBVL01NWC9TSU1EIGluc24gZW11bGF0aW9uIHdoZW4gIUhWTQoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
