Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C0215C9C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:06:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUZS-00066N-Bz; Mon, 06 Jul 2020 17:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUZQ-00066D-U8
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:06:20 +0000
X-Inumbo-ID: 034ee74c-bfab-11ea-8496-bc764e2007e4
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 034ee74c-bfab-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 17:06:20 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id a6so16800404ilq.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B6iU2F4D68kBs4rXCTy4j6Bd4sjgaDyabwwjvi+hW5Q=;
 b=AbJ0ON1qWA3F4Bki8vxBgNFCAj9bKw6GWMHnwjy0BHevGWNnPoRZOMJ0S+D6de1dhl
 0hNekgR0AHtFq5mG7yzL9shawGAV2AmKUgYcpgmrhjZljtKHOBACxfNrtufx07HwKaMW
 qPASD8vFzMlW++21+2uuY8a4B3cYDOiH2vcQJdGo42bfb58doT5aEhXx2+lGYg2TladZ
 Ss8z+SOazk9trK61OW/m2u2TWhD4ewrvaWAJWYnZPzMWA25uCSGGgRXWR8mns1NG9zn/
 Ja/0keDaRQdPfssAe8FscZ3h1S+YYXW9ePYnlkmdrTyY7zU1cCrI9V7RI3HBRPxlyq11
 C4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B6iU2F4D68kBs4rXCTy4j6Bd4sjgaDyabwwjvi+hW5Q=;
 b=AB8gjMZw/CqUlQdqTrxYtu16Fw99kXitqWf4row/MDsLgbfDvH1u/SckXHo++e3Y6K
 pTPS2T9O70MzgJUR7cergmYy9vAa+G7XFFgn+ZuWBCTu2f5ZFhBLnVQV+yvfGSYeuA5O
 qiAhI2jgP0JfXceK4zDiMTaYRIidgTFRi0EKPk3Va0t+Oa/muRig6O/cd+fh/TZFc6k1
 e/npwLiO9ef4zhGcvpXG6QXR81RvYetJqee+3K1CDVZ+KthfQ3hHf27N7UgjvbC3jPwz
 e3nh478PUXXm08e6N5WmJW1vfbqhn18X8UAGy7F8/2LyU1Ad+CaOGrUUEaQj95qqANxR
 qqrA==
X-Gm-Message-State: AOAM533sJ9h3L5cwvwuRP7HJxVVvaHpnlXKLkUvWzo6kG++ViUPWF7pU
 y+VrL8WbQQ5TOGeEbJ5xUfY2A3HZOTTyb7WjnpU=
X-Google-Smtp-Source: ABdhPJxcajQAjV3tK1pO3vVESVT/fL33Jteajm7cQ9OrNrxAE/wXmAHw5YAkhAIBWLMGaVi/cTHnOj0BeNWBXTtUiyQ=
X-Received: by 2002:a92:5f12:: with SMTP id t18mr31713705ilb.267.1594055180052; 
 Mon, 06 Jul 2020 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-10-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:56:33 -0700
Message-ID: <CAKmqyKMivQ6HxaB9DmJ1EgWcpC0sD1VBOC=V_09if_kkcvEwcA@mail.gmail.com>
Subject: Re: [PATCH 09/26] hw/usb/hcd-ehci: Remove unnecessary include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 4, 2020 at 7:55 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> As "qemu/main-loop.h" is not used, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-ehci.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 1495e8f7fa..256fb91e0c 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -34,7 +34,6 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
> -#include "qemu/main-loop.h"
>  #include "sysemu/runstate.h"
>
>  #define FRAME_TIMER_FREQ 1000
> --
> 2.21.3
>
>

