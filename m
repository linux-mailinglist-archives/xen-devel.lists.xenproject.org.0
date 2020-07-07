Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B8216A34
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 12:26:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsko2-0003h2-0L; Tue, 07 Jul 2020 10:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dji=AS=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1jsknz-0003gx-4P
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 10:26:27 +0000
X-Inumbo-ID: 50244436-c03c-11ea-8d4a-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50244436-c03c-11ea-8d4a-12813bfff9fa;
 Tue, 07 Jul 2020 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594117586;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ksh7qm6adGST/ZaaaSRGOC5KkyimhdVy3s/dSUsS2wc=;
 b=QTC+1qPAq/g22yJeeYDhoIOn8KBr714fQfUhkU5clN4EfIqCJiVPpsaz09ImuJmPgDtiE7
 NSFwdT9/g2eMsZY3RmlTxj3XQy3EXvhUzecPhK2QBfLjByu3oB9hFQzTY2KJaZH8FQZhb7
 tfWvaX1gBuXPxCYV5KGGLKcHSyegp4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-OgGMpmGzP4aC_p9nKwLp_w-1; Tue, 07 Jul 2020 06:25:55 -0400
X-MC-Unique: OgGMpmGzP4aC_p9nKwLp_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742B2879511;
 Tue,  7 Jul 2020 10:25:50 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF315D9F3;
 Tue,  7 Jul 2020 10:25:13 +0000 (UTC)
Date: Tue, 7 Jul 2020 11:25:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200707102510.GF2649462@redhat.com>
References: <20200706162300.1084753-1-dinechin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200706162300.1084753-1-dinechin@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
> There are a number of unnecessary trailing whitespaces that have
> accumulated over time in the source code. They cause stray changes
> in patches if you use tools that automatically remove them.
> 
> Tested by doing a `git diff -w` after the change.
> 
> This could probably be turned into a pre-commit hook.

scripts/checkpatch.pl ought to be made to check it.

> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  block/iscsi.c                                 |   2 +-
>  disas/cris.c                                  |   2 +-
>  disas/microblaze.c                            |  80 +++---
>  disas/nios2.c                                 | 256 +++++++++---------
>  hmp-commands.hx                               |   2 +-
>  hw/alpha/typhoon.c                            |   6 +-
>  hw/arm/gumstix.c                              |   6 +-
>  hw/arm/omap1.c                                |   2 +-
>  hw/arm/stellaris.c                            |   2 +-
>  hw/char/etraxfs_ser.c                         |   2 +-
>  hw/core/ptimer.c                              |   2 +-
>  hw/cris/axis_dev88.c                          |   2 +-
>  hw/cris/boot.c                                |   2 +-
>  hw/display/qxl.c                              |   2 +-
>  hw/dma/etraxfs_dma.c                          |  18 +-
>  hw/dma/i82374.c                               |   2 +-
>  hw/i2c/bitbang_i2c.c                          |   2 +-
>  hw/input/tsc2005.c                            |   2 +-
>  hw/input/tsc210x.c                            |   2 +-
>  hw/intc/etraxfs_pic.c                         |   8 +-
>  hw/intc/sh_intc.c                             |  10 +-
>  hw/intc/xilinx_intc.c                         |   2 +-
>  hw/misc/imx25_ccm.c                           |   6 +-
>  hw/misc/imx31_ccm.c                           |   2 +-
>  hw/net/vmxnet3.h                              |   2 +-
>  hw/net/xilinx_ethlite.c                       |   2 +-
>  hw/pci/pcie.c                                 |   2 +-
>  hw/sd/omap_mmc.c                              |   2 +-
>  hw/sh4/shix.c                                 |   2 +-
>  hw/sparc64/sun4u.c                            |   2 +-
>  hw/timer/etraxfs_timer.c                      |   2 +-
>  hw/timer/xilinx_timer.c                       |   4 +-
>  hw/usb/hcd-musb.c                             |  10 +-
>  hw/usb/hcd-ohci.c                             |   6 +-
>  hw/usb/hcd-uhci.c                             |   2 +-
>  hw/virtio/virtio-pci.c                        |   2 +-
>  include/hw/cris/etraxfs_dma.h                 |   4 +-
>  include/hw/net/lance.h                        |   2 +-
>  include/hw/ppc/spapr.h                        |   2 +-
>  include/hw/xen/interface/io/ring.h            |  34 +--
>  include/qemu/log.h                            |   2 +-
>  include/qom/object.h                          |   4 +-
>  linux-user/cris/cpu_loop.c                    |  16 +-
>  linux-user/microblaze/cpu_loop.c              |  16 +-
>  linux-user/mmap.c                             |   8 +-
>  linux-user/sparc/signal.c                     |   4 +-
>  linux-user/syscall.c                          |  24 +-
>  linux-user/syscall_defs.h                     |   2 +-
>  linux-user/uaccess.c                          |   2 +-
>  os-posix.c                                    |   2 +-
>  qapi/qapi-util.c                              |   2 +-
>  qemu-img.c                                    |   2 +-
>  qemu-options.hx                               |  26 +-
>  qom/object.c                                  |   2 +-
>  target/cris/translate.c                       |  28 +-
>  target/cris/translate_v10.inc.c               |   6 +-
>  target/i386/hvf/hvf.c                         |   4 +-
>  target/i386/hvf/x86.c                         |   4 +-
>  target/i386/hvf/x86_decode.c                  |  20 +-
>  target/i386/hvf/x86_decode.h                  |   4 +-
>  target/i386/hvf/x86_descr.c                   |   2 +-
>  target/i386/hvf/x86_emu.c                     |   2 +-
>  target/i386/hvf/x86_mmu.c                     |   6 +-
>  target/i386/hvf/x86_task.c                    |   2 +-
>  target/i386/hvf/x86hvf.c                      |  42 +--
>  target/i386/translate.c                       |   8 +-
>  target/microblaze/mmu.c                       |   2 +-
>  target/microblaze/translate.c                 |   2 +-
>  target/sh4/op_helper.c                        |   4 +-
>  target/xtensa/core-de212/core-isa.h           |   6 +-
>  .../xtensa/core-sample_controller/core-isa.h  |   6 +-
>  target/xtensa/core-test_kc705_be/core-isa.h   |   2 +-
>  tcg/sparc/tcg-target.inc.c                    |   2 +-
>  tcg/tcg.c                                     |  32 +--
>  tests/tcg/multiarch/test-mmap.c               |  72 ++---
>  ui/curses.c                                   |   4 +-
>  ui/curses_keys.h                              |   4 +-
>  util/cutils.c                                 |   2 +-
>  78 files changed, 440 insertions(+), 440 deletions(-)

The cleanup is a good idea, however, I think it is probably better to
split the patch approx into subsystems. That will make it much easier
to cherry-pick for people doing backports.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


