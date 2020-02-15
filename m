Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED93160095
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 22:17:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j34ko-0001Bu-1E; Sat, 15 Feb 2020 21:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q2ua=4D=gmail.com=jbi.octave@srs-us1.protection.inumbo.net>)
 id 1j34km-0001Bp-GG
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2020 21:13:32 +0000
X-Inumbo-ID: 04740a40-5038-11ea-ade5-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04740a40-5038-11ea-ade5-bc764e2007e4;
 Sat, 15 Feb 2020 21:13:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so14515942wma.1
 for <xen-devel@lists.xenproject.org>; Sat, 15 Feb 2020 13:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=eQWTXpjUDuUW0wmVjEqb5kR2EtspQyyxoUZ3RX5b6yc=;
 b=ZJo4dbZ99IAg/Off3zIJPKiTRvf+JLpHpOpQRge2U8thVSS9RjWFukQNLQ1dx4bOQd
 bp8O6Gba5nu03ZmBiVNZsH9YZKEfJOZ4RRPKJXVrUI6YuiiAbonBXb3uqvupv36ehNSQ
 DDw+4qZnP6uDzqf2YjXDkk44RKjqkDK3TbE+Gq8lJnDRIGFPIRnXhr4hJSHJsFXNWe78
 cInZB9mkAJJRf1yneWx0oKYkVllZyKUCNuniiDYD3cb7wdZhYz11iSxIGvEaK7PcdjDD
 8+M0r4m4SC7AZdoqLqCRSOPFfaKDXbjdZLHBrDaP1atZAkH1MYGnuVre1WEL09KGPMDz
 KZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=eQWTXpjUDuUW0wmVjEqb5kR2EtspQyyxoUZ3RX5b6yc=;
 b=LqWF//+jwYuyK2zRyi9JUdjp2HCs9BFlND84TxWcGqCb9MDnagdAAqVleDoGzimpJW
 39orKAVtJkBhvMutvjolR1psMtD0eQA2vzua+LqV3nvn2iIf9J8pbKPsAjy5o2Y4fHfv
 oljMBWWu+QGDF2hEmnLHKU841jnfJA9RnIJ9Ywde9OhzHccQTRbycw0OwZdoBQv2onl/
 U3IVfhmJdMRuFQUzllPx89Xvg/4M4Jx0tEfUQG3wOCGSVl00OI4Fo8MeXAZLv+8e4Eph
 6ExvX5AYrYvjLiUkP0E+HHvXC4nH4ioIkVUMWdb/lZ81niCcqXKvU0mdxi0cRWIGRhJ5
 uUrQ==
X-Gm-Message-State: APjAAAUVxdP/sxIiyN9r5xoylEYru58Y5kviyX6+eIRNXrdTi/dmqHsb
 WrZngoxlqhu7aQixh9WIgQ==
X-Google-Smtp-Source: APXvYqxm4PPfWmXjjVQmNfjd+0mqu1Kn9niQOa1Z/8jvjYj69Hfz7b7axgKDdFZ+ExJeELaRhmXLCA==
X-Received: by 2002:a1c:ddd6:: with SMTP id
 u205mr12831995wmg.151.1581801210697; 
 Sat, 15 Feb 2020 13:13:30 -0800 (PST)
Received: from ninjahub.lan (host-2-102-13-223.as13285.net. [2.102.13.223])
 by smtp.gmail.com with ESMTPSA id n1sm12846151wrw.52.2020.02.15.13.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 13:13:30 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
X-Google-Original-From: Jules Irenge <maxx@ninjahub.org>
Date: Sat, 15 Feb 2020 21:13:12 +0000 (GMT)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <c4206641-4570-3cbd-1d96-f18aa98e86be@oracle.com>
Message-ID: <alpine.LFD.2.21.2002151601230.31459@ninjahub.org>
References: <0/30> <20200214204741.94112-1-jbi.octave@gmail.com>
 <20200214204741.94112-15-jbi.octave@gmail.com>
 <c4206641-4570-3cbd-1d96-f18aa98e86be@oracle.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/30] x86/xen: Add missing annotation for
 xen_pte_lock()
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
Cc: Juergen Gross <jgross@suse.com>, Jules Irenge <jbi.octave@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boqun.feng@gmail.com,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgd2lsbCBzZW5kIHRoZSBtZXJnZWQgdmVyc2lvbiB0
aGVuIGlmIGl0IHMgZmluZSAKd2l0aCB5b3UuClJlZ2FyZHMsCkp1bGVzCgpPbiBGcmksIDE0IEZl
YiAyMDIwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cgo+IAo+IAo+IE9uIDIvMTQvMjAgMzo0NyBQ
TSwgSnVsZXMgSXJlbmdlIHdyb3RlOgo+ID4gU3BhcnNlIHJlcG9ydHMgd2FybmluZyBhdCB4ZW5f
cHRlX2xvY2soKQo+ID4KPiA+IHdhcm5pbmc6IGNvbnRleHQgaW1iYWxhbmNlIGluIHhlbl9wdGVf
bG9jaygpIC0gd3JvbmcgY291bnQgYXQgZXhpdAo+ID4KPiA+IFRoZSByb290IGNhdXNlIGlzIHRo
ZSBtaXNzaW5nIGFubm90YXRpb24gYXQgeGVuX3B0ZV9sb2NrKCkKPiA+IEFkZCB0aGUgbWlzc2lu
ZyBfX2FjcXVpcmVzKHB0bCkgYW5ub3RhdGlvbgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGVz
IElyZW5nZSA8amJpLm9jdGF2ZUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gCj4gYWx0aG91Z2ggSSdkIHBy
ZWZlciB0aGlzIGFuZCB0aGUgbmV4dCBwYXRjaCB0byBiZSBtZXJnZWQgaW50byBhIHNpbmdsZSBv
bmUuCj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
