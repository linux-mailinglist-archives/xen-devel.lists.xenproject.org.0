Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A9F4CA3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 14:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT3vY-0002Ki-8J; Fri, 08 Nov 2019 13:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uSPO=ZA=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iT3vX-0002Kd-Aa
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 13:03:47 +0000
X-Inumbo-ID: 3203802a-0228-11ea-9631-bc764e2007e4
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3203802a-0228-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 13:03:45 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0D3700CD138237C4E0A6A1.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:3700:cd13:8237:c4e0:a6a1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 577001EC0CF0;
 Fri,  8 Nov 2019 14:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573218224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Kum7mEcJwDy/+VDfRaoxsiXEBTdZ7IdRgQcyj7wtFnY=;
 b=GNHQ/WOL6d+xiM77RKDX3Qkhs8FEP0SrCcAL6ORVQNSitqSPEFK9mPQZxlvrOfFKWCb8OS
 67fkPBuMvs7lwJXiCMVRMARtwBSxmCa6Bm8YY7xhtbq6AwoDHxqYB7QYJVB/LPIgxKwH2R
 5reNerJ123Uk7F/tFDnC4E/f2ThePP0=
Date: Fri, 8 Nov 2019 14:03:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Daniel Kiper <daniel.kiper@oracle.com>
Message-ID: <20191108130338.GD4503@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
 <20191108100930.GA4503@zn.tnic>
 <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
 <20191108110703.GB4503@zn.tnic>
 <20191108125248.drmm7xakn7t7oyul@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108125248.drmm7xakn7t7oyul@tomti.i.net-space.pl>
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

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDE6NTI6NDhQTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9LLCBnb3QgeW91ciBjb21tZW50cy4gSSB3aWxsIHJlcG9zdCB0aGUgcGF0Y2ggc2Vy
aWVzIHByb2JhYmx5IG9uIFR1ZXNkYXkuCj4gSSBob3BlIHRoYXQgaXQgd2lsbCBsYW5kIGluIDUu
NSB0aGVuLgoKSSBkb24ndCBzZWUgd2h5IG5vdCBpZiB5b3UgYmFzZSBpdCBvbnRvcCBvZiB0aXA6
eDg2L2Jvb3QgYW5kIHRlc3QgaXQKcHJvcGVybHkgYmVmb3JlIHNlbmRpbmcuCgpPdXQgb2YgY3Vy
aW9zaXR5LCBpcyB0aGVyZSBhbnkgcGFydGljdWxhciByZWFzb24gdGhpcyBzaG91bGQgYmUgaW4g
NS41PwoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBzOi8vcGVvcGxlLmtlcm5l
bC5vcmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
