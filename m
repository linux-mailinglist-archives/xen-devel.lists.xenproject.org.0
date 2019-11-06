Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F94F1F2A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 20:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSRD8-00024E-HX; Wed, 06 Nov 2019 19:43:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MxIj=Y6=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iSRD6-000249-He
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 19:43:20 +0000
X-Inumbo-ID: ae366dd0-00cd-11ea-9631-bc764e2007e4
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae366dd0-00cd-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 19:43:18 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0E770015F12088A3A733FB.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:7700:15f1:2088:a3a7:33fb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 476DB1EC0CCC;
 Wed,  6 Nov 2019 20:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573069397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ispzmoCNVnfldM6nKX7veRr0TPeyd0yKxE1spA1TaBc=;
 b=YEKNuwnXhFvXTQKghtkDmqtoKBfr+3vCzK+52VXSmLJzHsUMi2Eszo+4Y3+CPZzZ6FR7Wr
 Psetif/T1gU5xoavkZKEWuju6VydeqZkc4MLlwubc0Ojq+5x3OB7HoSoavN8i3HRs6/KPM
 GUFBk8Z/klTXeVYa+6vDlVbXTmDuni4=
Date: Wed, 6 Nov 2019 20:43:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: hpa@zytor.com
Message-ID: <20191106194310.GE28380@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191106170333.GD28380@zn.tnic>
 <3EABBAB2-5BEF-4FEE-8BB4-9EB4B0180B10@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EABBAB2-5BEF-4FEE-8BB4-9EB4B0180B10@zytor.com>
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
 peterz@infradead.org, ross.philipson@oracle.com,
 Daniel Kiper <daniel.kiper@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6NTY6NDhBTSAtMDgwMCwgaHBhQHp5dG9yLmNvbSB3
cm90ZToKPiBGb3Igb25lIHRoaW5nLCB3ZSBhbHJlYWR5IGhhdmUgcGVvcGxlIGFza2luZyBmb3Ig
bW9yZSB0aGFuIDQgR2lCCj4gd29ydGggb2YgaW5pdHJhbWZzLCBhbmQgZXNwZWNpYWxseSB3aXRo
IGluaXRyYW1mcyB0aGF0IGh1Z2UgaXQgd291bGQKPiBtYWtlIGEgKmxvdCogb2Ygc2Vuc2UgdG8g
YWxsb3cgbG9hZGluZyBpdCBpbiBjaHVua3Mgd2l0aG91dCBoYXZpbmcgdG8KPiBjb25jYXRlbmF0
ZSB0aGVtLgoKWWVhaCwgdGdseCBnYXZlIG1lIGhpcyB1c2UgY2FzZSBvbiBJUkMgd2hlcmUgdGhl
eSBoYXZlIHRoZSByb290ZnMgaW4gdGhlCmluaXRyZCBhbmQgaG93IHRoZXkgd291bGQgaGl0IHRo
ZSBsaW1pdCB3aGVuIHRoZSByb290ZnMgaGFzIGEgYnVuY2ggb2YKZGVidWcgbGlicyBldGMgdG9v
bHMsIHdoaWNoIHdvdWxkIGJsb3cgdXAgaXRzIHNpemUuCgo+IEkgaGF2ZSBiZWVuIGFza2luZyBm
b3IgYSBsb25nIHRpbWUgZm9yIGluaXRyYW1mcyBjcmVhdG9ycyB0byBzcGxpdCB0aGUKPiBrZXJu
ZWwtZGVwZW5kZW50IGFuZCBrZXJuZWwgaW5kZXBlbmRlbnQgcGFydHMgaW50byBzZXBhcmF0ZSBp
bml0cmFtZnMKPiBtb2R1bGVzLgoKUmlnaHQuCgpUaHguCgotLSAKUmVnYXJkcy9HcnVzcywKICAg
IEJvcmlzLgoKaHR0cHM6Ly9wZW9wbGUua2VybmVsLm9yZy90Z2x4L25vdGVzLWFib3V0LW5ldGlx
dWV0dGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
