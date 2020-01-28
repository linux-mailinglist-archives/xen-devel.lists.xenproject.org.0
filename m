Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445314BE46
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:05:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUGf-0003Bm-7x; Tue, 28 Jan 2020 17:03:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/zE=3R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwUGc-0003Ba-Tf
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:03:10 +0000
X-Inumbo-ID: 0fb1df14-41f0-11ea-a933-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fb1df14-41f0-11ea-a933-bc764e2007e4;
 Tue, 28 Jan 2020 17:03:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so3363371wmi.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YFeR4yup2UpgLl1NabGUmb79xLdPXA2gT2xm9KRbyY=;
 b=W9vO64chkpouBI5cKhsC7HEMh4gRsxMG8ZFa5HKq8qboqSLLE8VOSJMQkUvYcIMgUo
 JwO9fqMigv0QjNj+aWCrzMEjOunZzMQBkf/bGJKodIxLYNQVb/hew050Qqqwp/UYe5Dp
 bzyeHXWPL349iMZ1LCy8H8uoEzIyquKegIADDlfpFFIr2PTaDjhzJh32fwtzeLOKX86z
 5O182c2LztaSZdH55XY/Y3+BK/VsmKt4RGPN00KBFX7QqONMb9jU3sKnusLROreOCKp4
 2HXbbAP9iJk//NiCMKJHpVmmm0HOibsOHvu9o2o/guZGQl+sFQoGoliDAxWpUX6OeyzS
 zJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YFeR4yup2UpgLl1NabGUmb79xLdPXA2gT2xm9KRbyY=;
 b=oJu+Z8xsMhTjKXb9Jx93wglsodSiJDnERQTAbycjS0FtS6lj6Z3h3BE8FqM+w9ZXoh
 lBJJz/2lfRlXiBxogvETTPn6G8TrAvoAUU9nK+Uh9ahG71vppr3dSzmw0GyTPiK06RZg
 P6JXQWbqH+gTB+e3p1x8R18iQ1CcTtluC3cxKNi1EwhNZnicZdWbC50IU4wSRLiYSlvN
 4z21qWdlij54BSp3DIWnE68TIaA8Y0czU1mVfbtEHTdXUyuEUneG6jgj2MJXH/n3Kyo+
 ThzkCBc6nD+EE7jYE0arIL+sRV0oKaH/kVxUUfRMgSEXslubVfgbX71ebZM68t4BZLg9
 Dksg==
X-Gm-Message-State: APjAAAXMwmMOteMn/iHxdcv8VLnK9cWebZ4cQfKAVJB1FDqwwKNSADbM
 a+nPiW7lS9ZbAOKAxKwqWdbbLL9f3nFqfTwXJf0=
X-Google-Smtp-Source: APXvYqw0gB4tU5m4YSDkK7+0WXxa9zIn2LKEaFrqaxSK9yBCpjnvpasmRCJDAvxFTAaWYNs43xPViu1FEmog7tW28Fk=
X-Received: by 2002:a1c:a404:: with SMTP id n4mr6110997wme.186.1580230989522; 
 Tue, 28 Jan 2020 09:03:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
In-Reply-To: <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 Jan 2020 10:02:33 -0700
Message-ID: <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo1NiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gV2hlbiBwbHVnZ2luZyBhIGhvbGUgaW4gdGhlIHRhcmdldCBwaHlzbWFwIGRvbid0
IHVzZSB0aGUgYWNjZXNzIHBlcm1pc3Npb24KPiA+IHJldHVybmVkIGJ5IF9fZ2V0X2dmbl90eXBl
X2FjY2VzcyBhcyBpdCBjYW4gYmUgbm9uLXNlbnNpY2FsLCBsZWFkaW5nIHRvCj4gPiBzcHVyaW91
cyB2bV9ldmVudHMgYmVpbmcgc2VudCBvdXQgZm9yIGFjY2VzcyB2aW9sYXRpb25zIGF0IHVuZXhw
ZWN0ZWQKPiA+IGxvY2F0aW9ucy4gTWFrZSB1c2Ugb2YgcDJtLT5kZWZhdWx0X2FjY2VzcyBpbnN0
ZWFkLgo+Cj4gQXMgYmVmb3JlLCB0byBtZSAiY2FuIGJlIG5vbi1zZW5zaWNhbCIgaXMgaW5zdWZm
aWNpZW50IGFzIGEgcmVhc29uCj4gaGVyZS4gSWYgaXQgY2FuIGFsc28gYmUgYSAiZ29vZCIgdmFs
dWUsIGl0IHN0aWxsIHJlbWFpbnMgdW5jbGVhcgo+IHdoeSBpbiB0aGF0IGNhc2UgcDJtLT5kZWZh
dWx0X2FjY2VzcyBpcyBuZXZlcnRoZWxlc3MgdGhlIHJpZ2h0Cj4gdmFsdWUgdG8gdXNlLgoKSSBo
YXZlIGFscmVhZHkgZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRj
aCB3aHkgSQpzYWlkICJjYW4gYmUiLiBGb3Jnb3QgdG8gY2hhbmdlIHRoZSBjb21taXQgbWVzc2Fn
ZSBmcm9tICJjYW4gYmUiIHRvCiJpcyIuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
