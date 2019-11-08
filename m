Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B87F4569
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 12:09:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT26l-00081l-Sx; Fri, 08 Nov 2019 11:07:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uSPO=ZA=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iT26l-00081g-03
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 11:07:15 +0000
X-Inumbo-ID: ea2646da-0217-11ea-b678-bc764e2007e4
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2646da-0217-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 11:07:13 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0D3700695E5CE6DC2DF0A9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:3700:695e:5ce6:dc2d:f0a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ED2F51EC0D03;
 Fri,  8 Nov 2019 12:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573211228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=SxhUbKrHkDrtCwuXKZ6zF1k4QlFvkBU3G12snVS+e94=;
 b=B/c9f5O4hdwqYRhrNekEEddvja4Fqj0Hm8uQSTKRbIpJar7ekZZOeinBa79PLrOvbVI7cP
 MY09b8HmGkVTrNtn7lZORotRw9sHr1M88aPVqTX85L56QNYuXFhI0a5trOwaQ24i51dkZH
 hrJE5Luj8IFtRLDHFKq/8MYfDVQU6rk=
Date: Fri, 8 Nov 2019 12:07:03 +0100
From: Borislav Petkov <bp@alien8.de>
To: Daniel Kiper <daniel.kiper@oracle.com>
Message-ID: <20191108110703.GB4503@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
 <20191108100930.GA4503@zn.tnic>
 <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTE6NDc6MDJBTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IFllYWgsIHlvdSBhcmUgcmlnaHQuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlcG9zdCB3
aG9sZSBwYXRjaCBzZXJpZXMgb3IKPiBjb3VsZCB5b3UgZml4IGl0IGJlZm9yZSBjb21taXR0aW5n
PwoKTGVtbWUgZmluaXNoIGxvb2tpbmcgYXQgcGF0Y2ggMyBmaXJzdC4KCklmIHlvdSBoYXZlIHRv
IHJlc2VuZCwgcGxlYXNlIHJlbW92ZSAiVGhpcyBwYXRjaCIgYW5kICJXZSIgaW4geW91ciB0ZXh0
LgoKVGh4LgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBzOi8vcGVvcGxlLmtl
cm5lbC5vcmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
