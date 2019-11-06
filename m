Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55375F1C16
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 18:06:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSOiY-0005j4-DC; Wed, 06 Nov 2019 17:03:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MxIj=Y6=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iSOiW-0005iz-57
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 17:03:36 +0000
X-Inumbo-ID: 5dc3f8f6-00b7-11ea-a1af-12813bfff9fa
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dc3f8f6-00b7-11ea-a1af-12813bfff9fa;
 Wed, 06 Nov 2019 17:03:34 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0E7700E06F38826D23B338.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:7700:e06f:3882:6d23:b338])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4BD5C1EC0CD9;
 Wed,  6 Nov 2019 18:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573059813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=x8TuSO4KobDwLqpo43lCyjTP+tJOg7rrILWAs8jjzZ8=;
 b=moOguzOmHuMaCYKvLkhZqnoQH9DJUJLlXLOYEGXXUFPVx2WRi6AZcEHmtpaWgW/+bVzGoQ
 vUnBlhpK9B3g8s0NAfjDR6Pdd61eqWiy6jp5ZnE9A5ziJExFZN7S/fi6hXgFQr40fwkkEQ
 ZgROC2wJHgC9wg6fCEUYxeWVG9KZCr0=
Date: Wed, 6 Nov 2019 18:03:33 +0100
From: Borislav Petkov <bp@alien8.de>
To: Daniel Kiper <daniel.kiper@oracle.com>
Message-ID: <20191106170333.GD28380@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104151354.28145-1-daniel.kiper@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5 0/3] x86/boot: Introduce the kernel_info
 et consortes
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6MTM6NTFQTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IEhpLAo+IAo+IER1ZSB0byB2ZXJ5IGxpbWl0ZWQgc3BhY2UgaW4gdGhlIHNldHVwX2hl
YWRlciB0aGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIG5ldwo+IGtlcm5lbF9pbmZvIHN0cnVj
dCB3aGljaCB3aWxsIGJlIHVzZWQgdG8gY29udmV5IGluZm9ybWF0aW9uIGZyb20gdGhlIGtlcm5l
bCB0bwo+IHRoZSBib290bG9hZGVyLiBUaGlzIHdheSB0aGUgYm9vdCBwcm90b2NvbCBjYW4gYmUg
ZXh0ZW5kZWQgcmVnYXJkbGVzcyBvZiB0aGUKPiBzZXR1cF9oZWFkZXIgbGltaXRhdGlvbnMuIEFk
ZGl0aW9uYWxseSwgdGhlIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHNvbWUKPiBjb252ZW5pZW5j
ZSBmZWF0dXJlcyBsaWtlIHRoZSBzZXR1cF9pbmRpcmVjdCBzdHJ1Y3QgYW5kIHRoZQo+IGtlcm5l
bF9pbmZvLnNldHVwX3R5cGVfbWF4IGZpZWxkLgoKVGhhdCdzIGFsbCBmaW5lIGFuZCBkYW5keSBi
dXQgSSdtIG1pc3NpbmcgYW4gZXhhbXBsZSBhYm91dCB3aGF0IHRoYXQnbGwKYmUgdXNlZCBmb3Is
IGluIHByYWN0aWNlLgoKVGh4LgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBz
Oi8vcGVvcGxlLmtlcm5lbC5vcmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
