Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AC215C80
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:01:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUUV-0005ah-Iy; Mon, 06 Jul 2020 17:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUUU-0005ac-F2
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:01:14 +0000
X-Inumbo-ID: 4ca2e7d2-bfaa-11ea-b7bb-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ca2e7d2-bfaa-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 17:01:14 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t4so20366751iln.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ctzFV2wTSbf5LJWwfLFnbYaCCE17qTbQd0y6awEpBc=;
 b=ThO12PL7aDHTt6y75GpT9dyrfdUt5rmmp4Txh+Dd0WmdKFnGjk/r9Dm6MWbmdmKR2f
 gOl0EW560gWgAJC7KKPMPgy4RIOmmwIgVNkZadxV2u9D/dIfPdqotN2IpqAS9ycNQYHr
 hJ9dyDKYM4nPXV77ZHg3NPuffoCiRMGhmOByeH/avHgJv72C6g/CaXRvi9GUJfH3XClO
 jPo8NpRGszmVDXb43aPBUiVyM1/rwXiSMxzSVdmimKA5ZzWoLBOmJH+tqoSpPtKZ+8bh
 T2k+MkLuNEDO3YFDdNOzo/NtrgfOqqzzZgI1tkCp+0f10xp8ZpF+n8HFKOdAoTs7T00N
 VhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ctzFV2wTSbf5LJWwfLFnbYaCCE17qTbQd0y6awEpBc=;
 b=RD4kaByF5yTlOlFWVHv4NEw1EzG8Y5ZJmhWsPugITGOOlCtJjm/wFes1bnwI2muTzS
 DfVTx+4GJOxdyxpwq+IsqcCudX0H54ejepphP/bXaNAPmx2M09xs3U584isRTE17+sL2
 Z50HjvvJ2d5B/W+rlk4z6MdE66QD8mxZIPf3hHp56LVtw52SiBP9d9ceyI1FRyZEYC3o
 ndjaKDSTqHtTAElDhrF+FYVv0A+zFIK+AKCILoy67eKkyjBOnk+1UqoPc6DIuxhS+8KI
 7DoCX2Apz3G/+aevumiFLsTuCkS/3vwLJXcAYIRNCAkSTUR2DJjqT+jXyq79YRkokjU4
 JNww==
X-Gm-Message-State: AOAM530/5TYyIj/7Cwtt3LMY9RpHZodj8UI0YsplLwWDedB57iJkWdAF
 JOOKo4IjvmGJK3rfDkrm3J1A2mev5A3RN4apRE4=
X-Google-Smtp-Source: ABdhPJwXFWIOkq2ujd/ddpYJrT5qb6ZnY2NEtThTElkRWlGkJW2XtpKOBtiOhFAWAiQeMsquUUzqsZikNh2Q3JoY55o=
X-Received: by 2002:a05:6e02:d51:: with SMTP id
 h17mr31745866ilj.131.1594054872136; 
 Mon, 06 Jul 2020 10:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-4-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:51:17 -0700
Message-ID: <CAKmqyKOXnBzRC6-FQ664k-g8gQkByLEGq1MxBJ97eddL+OcH1A@mail.gmail.com>
Subject: Re: [PATCH 03/26] hw/usb: Remove unused VM_USB_HUB_SIZE definition
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

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Commit a5d2f7273c ("qdev/usb: make qemu aware of usb busses")
> removed the last use of VM_USB_HUB_SIZE, 11 years ago. Time
> to drop it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/usb.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index e29a37635b..4f04a1a879 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -470,10 +470,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, U=
SBPacket *p);
>  void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
>  bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
>
> -/* usb ports of the VM */
> -
> -#define VM_USB_HUB_SIZE 8
> -
>  /* usb-bus.c */
>
>  #define TYPE_USB_BUS "usb-bus"
> --
> 2.21.3
>
>

