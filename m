Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9D5BD84A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409081.651976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQEn-0004AA-Mf; Mon, 19 Sep 2022 23:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409081.651976; Mon, 19 Sep 2022 23:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQEn-00047n-JE; Mon, 19 Sep 2022 23:31:41 +0000
Received: by outflank-mailman (input) for mailman id 409081;
 Mon, 19 Sep 2022 23:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/n2=ZW=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1oaQEl-00047h-EP
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:31:39 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34b6bc07-3873-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 01:31:38 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso4969217pjk.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:31:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 34b6bc07-3873-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
        b=dIO7rKlwpt1a4Rr55TM/1OaCkqXzxn5HQ5hnLXBRwWHTkpqxju5K46xUcpujcqqOhY
         UT1qtY65c18HaDPPSpvVTvhQ9+fVBIzAfgdO1ePcqTnS8abQ/ssqUdN4PA8+BBbGscY4
         zcHOxvhGd/Rw79kJ916G+ztNW9eW1CWpGEOd7bJnYuq86Ev2kMsm0q8+XzwBszG8pjQ2
         Pve2h3B9fmVc6VWU3tTQ2teTgIPA46kmE7p9DGMxzzCgzN9yNZgGgirx1IC7zm5IGED/
         gjezyCWZTWWjo3xYAtiH58mh8QAjO7bV/tNRRbQG7XhlchTkciQZvl7gHKj0RWl+10FH
         DxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
        b=HSIfk0WUtqqhJTUazxxQBl1KTYUsfdAFrOIu7EpsL9lEBB8zypW3bbYYv2cN9EXvp3
         phQNQsagibPvJneeEGyEbV/Za/mKJXbvoUX933SbaKZV8lYbiACeg4guJFO3idRNvzFj
         5zJDCMRORLVocEo6f3iASPOkCrti6RrmDbgXggkwB+nouLZmgkgoHqkskJYmamiXkhKn
         z8Enzdf9srlnZ9UwqOh7Tu/cdysH8xFfpCJIpNiCazncT5XKWakF0Het5y8qoMsHskA6
         vjIvNdVK3UYgMzNUKg2wBsiMK7Kkxjd1sSXIkEoZ9d8aiEAe1cfRQsBldZ35mvXnOBsL
         Mlow==
X-Gm-Message-State: ACrzQf1MOBMX2oh0VN44pZj7+Edo1VMI0Oo4qr+5tVBQZlVEY+h43RFD
	pf4wdlZ8BDpL1I2WWqg3Np/cIprUc1GLrAdyXc0=
X-Google-Smtp-Source: AMsMyM5CNfH4JqOtjO62MVBjvYF0+2r5Smy7El5C/g8RoLI2QIg17MckqusD++UPU8lggRnlhnNJDkN9NdqBYMgnYv8=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr680878pjb.85.1663630296957; Mon, 19
 Sep 2022 16:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-2-shentey@gmail.com>
In-Reply-To: <20220919231720.163121-2-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:31:10 +1000
Message-ID: <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Sergio Lopez <slp@redhat.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>, Song Gao <gaosong@loongson.cn>, 
	Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>, 
	Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Alistair Francis <Alistair.Francis@wdc.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com, 
	Roman Bolshakov <r.bolshakov@yadro.com>, Markus Armbruster <armbru@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>, 
	Havard Skinnemoen <hskinnemoen@google.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	qemu-s390x <qemu-s390x@nongnu.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eric Farman <farman@linux.ibm.com>, 
	Reinoud Zandijk <reinoud@netbsd.org>, Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Tyrone Ting <kfting@nuvoton.com>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Darren Kenny <darren.kenny@oracle.com>, 
	"open list:Overall" <kvm@vger.kernel.org>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
	John G Johnson <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>, 
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Jason Wang <jasowang@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
	Alistair Francis <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
> inherit from TYPE_MACHINE. This is an inconsistency which can cause
> undefined behavior such as memory corruption.
>
> Change SiFiveEState to inherit from MachineState since it is registered
> as a machine.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/sifive_e.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..d738745925 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
> @@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.37.3
>
>

