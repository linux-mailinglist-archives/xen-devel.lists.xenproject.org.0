Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7923AC6A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2fH1-0001t4-RD; Mon, 03 Aug 2020 18:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rARX=BN=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1k2fH0-0001su-QQ
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:33:22 +0000
X-Inumbo-ID: cf10efa2-d5b7-11ea-90c7-bc764e2007e4
Received: from mail-oi1-x233.google.com (unknown [2607:f8b0:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf10efa2-d5b7-11ea-90c7-bc764e2007e4;
 Mon, 03 Aug 2020 18:33:21 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u24so24231644oiv.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tOj98KWxZfo7k/msteoXOzG655QSkI9RWTBbZ2s3YRY=;
 b=y6oM0HuwhNOMHv3CswCjVXigw95CYKCpxWHCggL8OoQcJxkeRNg5xNgVFZVuTHJtBY
 VKkSC2Ccj0FUCS6t6LXUsSCAx1vUsWEglUkfIyKR4Ga7GWYIJLf99ebsMsEH51vWT4Ho
 93jG8A0FX96zCtfWEG5lE90T5hkdeVnuuMn3Gfy0RewfCgOF64kg5QMkVjZjCde5S+0g
 /08gtE0Pc5ovCteqftn3ITAT5KAc9aY3NYcgtW5dw6AKFcj2hd/GSDJjrvskWQWPijY8
 SmPTw4J0HNsDeydm1xgIt9NSu+OuG8LILxr06BEKqRzHSjpKA9Xg7rMiL9uxzM3K+Dll
 KICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tOj98KWxZfo7k/msteoXOzG655QSkI9RWTBbZ2s3YRY=;
 b=hCakJP99OoxAAbj6cHYsuOc0lq9eOOM+G7RopDD0Q90bQoR2pVNQOOl1wxUxEOyhNK
 r9r9DZ+xkmkrGiagPm8NyiZ8X07tYf5KpJYf8LR7Inruie2V7yTRU3pRkrVqRzre385P
 JQNGiln7Zes5a3iIwS4rbcCXb1a40l9EcN9B7BU/lTsL6ApaEdvjBdCQw+cZWpq7e6U7
 MfZuYeXKAC4QKvNVBclTEYTKOEztMgPfq5DcFXkhzH3feTS4vGhSxh7mA8cMUKPY49gC
 BbWiqYC/XVubFcdKhjUsb8ixQQ4LknM+VLmmv60KOSJcdTt0LlU8DGUftafUV67oGqvo
 3yyg==
X-Gm-Message-State: AOAM5314eZLTBQ+R4z+islAiIwX6/bNnUHu7cyIpVmMbweNJZWW7gqKO
 M0Rqc0l1nXvUnbRCgMHwvAUq8+LDQhnqv67MnejV8g==
X-Google-Smtp-Source: ABdhPJykw6QlTCz5UZlKQ6UvLdnZmhQqKuAQH/eDVsm1AFm/IR10na8Eavap0iKbcegmHSN7XTnjydq+nvN4QSaJRgQ=
X-Received: by 2002:aca:50c4:: with SMTP id e187mr553874oib.146.1596479601455; 
 Mon, 03 Aug 2020 11:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200803165251.907213-1-anthony.perard@citrix.com>
In-Reply-To: <20200803165251.907213-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Aug 2020 19:33:10 +0100
Message-ID: <CAFEAcA-L5Qgoq5xN426DrFQG2W2CDQ+e=0Lc6hzmUxjJDrAueg@mail.gmail.com>
Subject: Re: [PULL 0/1] xen queue 2020-08-03
To: Anthony PERARD <anthony.perard@citrix.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020 at 17:53, Anthony PERARD <anthony.perard@citrix.com> wro=
te:
> ----------------------------------------------------------------
> xen patches
>
> bug fix
>
> ----------------------------------------------------------------
> Philippe Mathieu-Daud=C3=A9 (1):
>       accel/xen: Fix xen_enabled() behavior on target-agnostic objects

This fails to compile, all hosts :-(

  LINK    avr-softmmu/qemu-system-avr
../migration/savevm.o: In function `qemu_loadvm_section_start_full':
/home/petmay01/linaro/qemu-for-merges/migration/savevm.c:2320:
undefined reference to `xen_enabled'
collect2: error: ld returned 1 exit status
[ditto other softmmu link attempts]

Similar but different on OSX:

  LINK    aarch64-softmmu/qemu-system-aarch64
Undefined symbols for architecture x86_64:
  "_xen_enabled", referenced from:
      _msix_is_masked in msix.o
      _msix_write_config in msix.o
      _msix_handle_mask_update in msix.o
      _msix_init in msix.o
      _msix_notify in msix.o
      _msix_reset in msix.o
      _msix_set_vector_notifiers in msix.o
      ...
ld: symbol(s) not found for architecture x86_64

Fails in all the BSD VM builds as well, so I don't think this
is related to incremental vs from-clean builds.

I think the failure here is only on builds where
CONFIG_XEN is not set by configure (which for my merge
build setup appears to be all of them, I think).
In that case when we build a target-agnostic object
it gets an external reference to the xen_enabled()
function, but because Xen is disabled we don't compile
accel/xen/ and so there is no actual implementation of
the function in the link.

This doesn't happen for KVM because there the
CONFIG_KVM_IS_POSSIBLE version of kvm_enabled()
is a #define:
#define kvm_enabled()           (kvm_allowed)
and we provide both the "real" version of the
'bool kvm_allowed' in accel/kvm/kvm-all.c and also
the stub version in accel/stubs/kvm-stub.c which will
be used in configurations thta don't build accel/kvm.

I think then that the fix for this build failure is to
either:
 (1) add a stub version of xen_allowed() to accel/stubs/xen-stub.c
     (which would always return false)

 (2) follow KVM more closely, and have xen_allowed() be
     a #define to (xen_allowed), with a (non-static)
     bool xen_allowed in accel/xen/xen-all.c and another
     one in accel/stubs/xen-stub.c

thanks
-- PMM

