Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A7F7671
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAiO-0001x5-NX; Mon, 11 Nov 2019 14:30:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAiM-0001x0-Td
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:30:46 +0000
X-Inumbo-ID: d8644314-048f-11ea-a210-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8644314-048f-11ea-a210-12813bfff9fa;
 Mon, 11 Nov 2019 14:30:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B8C2B543;
 Mon, 11 Nov 2019 14:30:44 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
Date: Mon, 11 Nov 2019 15:30:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZpcnN0IHBhdGNoIGhlcmUgZml4ZXMgYW5vdGhlciByZWdyZXNzaW9uIGZyb20gM2M4OGM2
OTJjMjg3CigieDg2L3N0YWNrZnJhbWUvMzI6IFByb3ZpZGUgY29uc2lzdGVudCBwdF9yZWdzIiks
IGJlc2lkZXMgdGhlCm9uZSBhbHJlYWR5IGFkZHJlc3NlZCBieQpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE5ODguaHRtbC4K
VGhlIHNlY29uZCBwYXRjaCBpcyBhIG1pbmltYWwgYml0IG9mIGNsZWFudXAgb24gdG9wLgoKMTog
bWFrZSB4ZW5faXJldF9jcml0X2ZpeHVwIGluZGVwZW5kZW50IG9mIGZyYW1lIGxheW91dAoyOiBz
aW1wbGlmeSB4ZW5faXJldF9jcml0X2ZpeHVwJ3MgcmluZyBjaGVjawoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
