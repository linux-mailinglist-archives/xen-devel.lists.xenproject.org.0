Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98018215C86
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUVa-0005gk-Td; Mon, 06 Jul 2020 17:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUVZ-0005gf-10
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:02:21 +0000
X-Inumbo-ID: 7447f44e-bfaa-11ea-bb8b-bc764e2007e4
Received: from mail-il1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7447f44e-bfaa-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 17:02:20 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o3so16132783ilo.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SURriqbHZVXTTwsvXZaGt8gxbHhNclYTbkHoMvIQmpM=;
 b=MioVaGq1jCalxgWYpPdotTkyVsAMeK/bshk85fNYAhYubO4nVFHSOeCUz0kSho8p9p
 6Y83qIJELSpr9VN9VFzq+lTIUscnBNyLwqUC24IyYDjx/4cG7EfaP2YEZc6BAomYyDpg
 4WJqsPVXOVt3XY2x1ZsaQLbg24wvg5Vy/7YqNFE+T3a7KXvhOx34JOs9fSXv1n/wrIC6
 8CzhLDbRxujPAE056QBW2Z/dWImCVitmNebYDtS6btqpo7FzR6vkHFi2ue676ojVEt9W
 vkRi2J6vudadAMoruzF52cpovO1cMqBkDNoVdP47mEGcUSBlNOyPMoeOEOsRimXSU/ZU
 vZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SURriqbHZVXTTwsvXZaGt8gxbHhNclYTbkHoMvIQmpM=;
 b=GatcxvTfjgBsES/13rcXjU13M3fsMLC0SYIER68jOE2cwVdKj3gZag8KwF5YdVuY8A
 yCb4dXdE60ptCKTFa3GsOdrtsuyIfiWa9mkQXLomgiic+8gXHAkIWu1AGqtAxRSmLJKC
 tOzIkUWcfkabDXlEJXov7mqEnUotdD3vNjT1D3FwdjHHnN9OYM1NRM53O824hETORlGM
 clbQa5sKH8IG9Zrx7L5y6yVoSGmDRO2xmEGY/G3UbWGaN6Yg7lnJ1c0OXua0x7X+a3Yu
 BoqpJL2yXB5RZOKlj5xPzPpaM3htj5BUZf1ul0+0T7pWGmnKt0bD5p/2BRbwCpCgirZm
 ht8g==
X-Gm-Message-State: AOAM533YSNP1NUeH2SiNAqaapGJ7FR6PfGtKugPWvUl42U4P1zVdrIzE
 lDPTkQVZUJ1iOD4k0+F0oZBQ0GtDUA3lGqXwjT/AWoQZXn8=
X-Google-Smtp-Source: ABdhPJw3irY14ekgg5HFZwY3uijUbo8j99jRr5i12obU9BK983EmEFW1tqXdt4MQ3PGmM1qTVFVUGr89GwGbxSSoFdg=
X-Received: by 2002:a92:d186:: with SMTP id z6mr33254547ilz.227.1594054940213; 
 Mon, 06 Jul 2020 10:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-5-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:52:26 -0700
Message-ID: <CAKmqyKMm2xhgxSqX5mHAkELfBnWhzqw-ruf3oATFvB8sohnw2w@mail.gmail.com>
Subject: Re: [PATCH 04/26] hw/usb: Reduce 'exec/memory.h' inclusion
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

On Sat, Jul 4, 2020 at 7:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> "exec/memory.h" is only required by "hw/usb/hcd-musb.h".
> Include it there directly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/usb.h          | 1 -
>  include/hw/usb/hcd-musb.h | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 4f04a1a879..15b2ef300a 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -25,7 +25,6 @@
>   * THE SOFTWARE.
>   */
>
> -#include "exec/memory.h"
>  #include "hw/qdev-core.h"
>  #include "qemu/iov.h"
>  #include "qemu/queue.h"
> diff --git a/include/hw/usb/hcd-musb.h b/include/hw/usb/hcd-musb.h
> index c874b9f292..ec3ee5c4b0 100644
> --- a/include/hw/usb/hcd-musb.h
> +++ b/include/hw/usb/hcd-musb.h
> @@ -13,6 +13,8 @@
>  #ifndef HW_USB_MUSB_H
>  #define HW_USB_MUSB_H
>
> +#include "exec/memory.h"
> +
>  enum musb_irq_source_e {
>      musb_irq_suspend =3D 0,
>      musb_irq_resume,
> --
> 2.21.3
>
>

