Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E3821699C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jskKW-0000yC-Sy; Tue, 07 Jul 2020 09:56:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ryuI=AS=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1jskKU-0000y7-RP
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 09:55:58 +0000
X-Inumbo-ID: 0a0ba290-c038-11ea-bca7-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0ba290-c038-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 09:55:51 +0000 (UTC)
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsZ3N-1kmdxS2RYp-00u2nJ; Tue, 07 Jul 2020 11:55:23 +0200
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
To: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
References: <20200706162300.1084753-1-dinechin@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <162d20a6-a29d-ccbc-7c72-73269833546b@vivier.eu>
Date: Tue, 7 Jul 2020 11:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706162300.1084753-1-dinechin@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IyHjYXPw9pi37trEtkUN0Z0wyasB7eaEuiJHCzlvZWCFbYkZxw2
 sg/KMtk64S8KcfckXMua+vV+U1EQotGjPn4IawLq1d/tcJuAszUQ/jF+d+1X3xyVVkAYEJo
 Ai6gN+9alk1BerJl8oCBPtqyE+B1FFQs1qPflKSfpmJyXTsmje9a2J72kVySvP4OZpFqQ/e
 2fal/qT79jcGmQQT8fBSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XjPKcYosp4w=:uS+XAeu9mUExO4APmmd9cc
 +IpY3RyXawZ4c4DLglO240AnOkClc8Hl1W++WOnod4TsEy3XgEkrFPmT824d6DqBwIUpGrZ02
 9GX+/t4+74VgqTO+cZ9i2q11+ZdBeCbl0EjwiGSBdZF0+iY/TPJh+1X4WtGe37XUmRYUD9c/0
 9eP/ANeQI0itxCfvo5fB96D1EEEqyW4PRb0XdjRtQCoYyCH7cY5H2d0BjRUH9tfHdxrPYRiLx
 OOg20rF3Ogux+oX+86P1cmKRPmb3n8C/NW5zZ3vbXmPs61MR6YDvdgLtkG52qxLKalHP8ud6l
 rDpM/TcNzotoQD/EV+RqVroZP0HWYhQgRokf7p34ZKECLEkefmfc87EtLsvQBADlqFvDdqyAb
 +0vfImN1sg+O3AmAxMUFxYq+Z6/ix4mTtbVvcjjkXmTXyMXnDDT+vk3NpU9nitQyYdmEPhUZZ
 ospzvVaDUS3t4H1C+HtztXO2WLQSwdICJnq2ZE8Qns6zd5AadHy0I2syQcEwjQW2lyWUDUvBp
 RH1foCrqRgEE2cU+hJv7Vofw4TQTxdjE66azDfwOu/pF5soEE8x6lpxgPHNvoMFA6V3ndSM6n
 fq1wHcEKKtHuyxZwkvxNp77cGxSIY6g61//h+FR5CbZz1Nt0LFGMgI9t0brLKZvzh5dGwWPJ6
 t7r3sC9EACHEVoZGN+T+FkHzjiQg12W4cCvCG2Un6Ae1GD2S8GZB2Jut2muZbs8sxIO80oc4U
 NQ0l9CrG2VG4DmQL4TOXPixFS5hug0d3NR/jBcSb1fZDROxVDqdxcU39haRp7WipJsgAfMQLS
 7SKU1Q/GgLgZv6udLcxKyYrl628B3aZoWr3V5KI4kROPXysQTb/k6QDV8oWF7db/KjsKq7R
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Le 06/07/2020 à 18:23, Christophe de Dinechin a écrit :
> There are a number of unnecessary trailing whitespaces that have
> accumulated over time in the source code. They cause stray changes
> in patches if you use tools that automatically remove them.
> 
> Tested by doing a `git diff -w` after the change.
> 
> This could probably be turned into a pre-commit hook.
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
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index a8b76979d8..884075f4e1 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1412,7 +1412,7 @@ static void iscsi_readcapacity_sync(IscsiLun *iscsilun, Error **errp)
>      struct scsi_task *task = NULL;
>      struct scsi_readcapacity10 *rc10 = NULL;
>      struct scsi_readcapacity16 *rc16 = NULL;
> -    int retries = ISCSI_CMD_RETRIES; 
> +    int retries = ISCSI_CMD_RETRIES;
>  
>      do {
>          if (task != NULL) {
> diff --git a/disas/cris.c b/disas/cris.c
> index 0b0a3fb916..a2be8f1412 100644
> --- a/disas/cris.c
> +++ b/disas/cris.c
> @@ -2569,7 +2569,7 @@ print_insn_cris_generic (bfd_vma memaddr,
>    nbytes = info->buffer_length ? info->buffer_length
>                                 : MAX_BYTES_PER_CRIS_INSN;
>    nbytes = MIN(nbytes, MAX_BYTES_PER_CRIS_INSN);
> -  status = (*info->read_memory_func) (memaddr, buffer, nbytes, info);  
> +  status = (*info->read_memory_func) (memaddr, buffer, nbytes, info);
>  
>    /* If we did not get all we asked for, then clear the rest.
>       Hopefully this makes a reproducible result in case of errors.  */
> diff --git a/disas/microblaze.c b/disas/microblaze.c
> index 0b89b9c4fa..6de66532f5 100644
> --- a/disas/microblaze.c
> +++ b/disas/microblaze.c
> @@ -15,15 +15,15 @@ You should have received a copy of the GNU General Public License
>  along with this program; if not, see <http://www.gnu.org/licenses/>. */
>  
>  /*
> - * Copyright (c) 2001 Xilinx, Inc.  All rights reserved. 
> + * Copyright (c) 2001 Xilinx, Inc.  All rights reserved.
>   *
>   * Redistribution and use in source and binary forms are permitted
>   * provided that the above copyright notice and this paragraph are
>   * duplicated in all such forms and that any documentation,
>   * advertising materials, and other materials related to such
>   * distribution and use acknowledge that the software was developed
> - * by Xilinx, Inc.  The name of the Company may not be used to endorse 
> - * or promote products derived from this software without specific prior 
> + * by Xilinx, Inc.  The name of the Company may not be used to endorse
> + * or promote products derived from this software without specific prior
>   * written permission.
>   * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
>   * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
> @@ -42,7 +42,7 @@ along with this program; if not, see <http://www.gnu.org/licenses/>. */
>  /* Assembler instructions for Xilinx's microblaze processor
>     Copyright (C) 1999, 2000 Free Software Foundation, Inc.
>  
> -   
> +
>  This program is free software; you can redistribute it and/or modify
>  it under the terms of the GNU General Public License as published by
>  the Free Software Foundation; either version 2 of the License, or
> @@ -57,15 +57,15 @@ You should have received a copy of the GNU General Public License
>  along with this program; if not, see <http://www.gnu.org/licenses/>.  */
>  
>  /*
> - * Copyright (c) 2001 Xilinx, Inc.  All rights reserved. 
> + * Copyright (c) 2001 Xilinx, Inc.  All rights reserved.
>   *
>   * Redistribution and use in source and binary forms are permitted
>   * provided that the above copyright notice and this paragraph are
>   * duplicated in all such forms and that any documentation,
>   * advertising materials, and other materials related to such
>   * distribution and use acknowledge that the software was developed
> - * by Xilinx, Inc.  The name of the Company may not be used to endorse 
> - * or promote products derived from this software without specific prior 
> + * by Xilinx, Inc.  The name of the Company may not be used to endorse
> + * or promote products derived from this software without specific prior
>   * written permission.
>   * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
>   * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
> @@ -79,15 +79,15 @@ along with this program; if not, see <http://www.gnu.org/licenses/>.  */
>  #define MICROBLAZE_OPCM
>  
>  /*
> - * Copyright (c) 2001 Xilinx, Inc.  All rights reserved. 
> + * Copyright (c) 2001 Xilinx, Inc.  All rights reserved.
>   *
>   * Redistribution and use in source and binary forms are permitted
>   * provided that the above copyright notice and this paragraph are
>   * duplicated in all such forms and that any documentation,
>   * advertising materials, and other materials related to such
>   * distribution and use acknowledge that the software was developed
> - * by Xilinx, Inc.  The name of the Company may not be used to endorse 
> - * or promote products derived from this software without specific prior 
> + * by Xilinx, Inc.  The name of the Company may not be used to endorse
> + * or promote products derived from this software without specific prior
>   * written permission.
>   * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
>   * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
> @@ -108,8 +108,8 @@ enum microblaze_instr {
>     imm, rtsd, rtid, rtbd, rted, bri, brid, brlid, brai, braid, bralid,
>     brki, beqi, beqid, bnei, bneid, blti, bltid, blei, bleid, bgti,
>     bgtid, bgei, bgeid, lbu, lhu, lw, lwx, sb, sh, sw, swx, lbui, lhui, lwi,
> -   sbi, shi, swi, msrset, msrclr, tuqula, fadd, frsub, fmul, fdiv, 
> -   fcmp_lt, fcmp_eq, fcmp_le, fcmp_gt, fcmp_ne, fcmp_ge, fcmp_un, flt, fint, fsqrt, 
> +   sbi, shi, swi, msrset, msrclr, tuqula, fadd, frsub, fmul, fdiv,
> +   fcmp_lt, fcmp_eq, fcmp_le, fcmp_gt, fcmp_ne, fcmp_ge, fcmp_un, flt, fint, fsqrt,
>     tget, tcget, tnget, tncget, tput, tcput, tnput, tncput,
>     eget, ecget, neget, necget, eput, ecput, neput, necput,
>     teget, tecget, tneget, tnecget, teput, tecput, tneput, tnecput,
> @@ -182,7 +182,7 @@ enum microblaze_instr_type {
>  /* Assembler Register - Used in Delay Slot Optimization */
>  #define REG_AS    18
>  #define REG_ZERO  0
> - 
> +
>  #define RD_LOW  21 /* low bit for RD */
>  #define RA_LOW  16 /* low bit for RA */
>  #define RB_LOW  11 /* low bit for RB */
> @@ -258,7 +258,7 @@ enum microblaze_instr_type {
>  #define OPCODE_MASK_H24 0xFC1F07FF /* High 6, bits 20-16 and low 11 bits */
>  #define OPCODE_MASK_H124  0xFFFF07FF /* High 16, and low 11 bits */
>  #define OPCODE_MASK_H1234 0xFFFFFFFF /* All 32 bits */
> -#define OPCODE_MASK_H3  0xFC000600 /* High 6 bits and bits 21, 22 */  
> +#define OPCODE_MASK_H3  0xFC000600 /* High 6 bits and bits 21, 22 */
>  #define OPCODE_MASK_H32 0xFC00FC00 /* High 6 bits and bit 16-21 */
>  #define OPCODE_MASK_H34B   0xFC0000FF /* High 6 bits and low 8 bits */
>  #define OPCODE_MASK_H34C   0xFC0007E0 /* High 6 bits and bits 21-26 */
> @@ -277,14 +277,14 @@ static const struct op_code_struct {
>    short inst_offset_type; /* immediate vals offset from PC? (= 1 for branches) */
>    short delay_slots; /* info about delay slots needed after this instr. */
>    short immval_mask;
> -  unsigned long bit_sequence; /* all the fixed bits for the op are set and all the variable bits (reg names, imm vals) are set to 0 */ 
> +  unsigned long bit_sequence; /* all the fixed bits for the op are set and all the variable bits (reg names, imm vals) are set to 0 */
>    unsigned long opcode_mask; /* which bits define the opcode */
>    enum microblaze_instr instr;
>    enum microblaze_instr_type instr_type;
>    /* more info about output format here */
> -} opcodes[MAX_OPCODES] = 
> +} opcodes[MAX_OPCODES] =
>  
> -{ 
> +{
>    {"add",   INST_TYPE_RD_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x00000000, OPCODE_MASK_H4, add, arithmetic_inst },
>    {"rsub",  INST_TYPE_RD_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x04000000, OPCODE_MASK_H4, rsub, arithmetic_inst },
>    {"addc",  INST_TYPE_RD_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x08000000, OPCODE_MASK_H4, addc, arithmetic_inst },
> @@ -437,7 +437,7 @@ static const struct op_code_struct {
>    {"tcput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00B000, OPCODE_MASK_H32, tcput,  anyware_inst },
>    {"tnput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00D000, OPCODE_MASK_H32, tnput,  anyware_inst },
>    {"tncput", INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00F000, OPCODE_MASK_H32, tncput, anyware_inst },
> - 
> +
>    {"eget",   INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C000400, OPCODE_MASK_H32, eget,   anyware_inst },
>    {"ecget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C002400, OPCODE_MASK_H32, ecget,  anyware_inst },
>    {"neget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C004400, OPCODE_MASK_H32, neget,  anyware_inst },
> @@ -446,7 +446,7 @@ static const struct op_code_struct {
>    {"ecput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00A400, OPCODE_MASK_H32, ecput,  anyware_inst },
>    {"neput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00C400, OPCODE_MASK_H32, neput,  anyware_inst },
>    {"necput", INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00E400, OPCODE_MASK_H32, necput, anyware_inst },
> - 
> +
>    {"teget",   INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C001400, OPCODE_MASK_H32, teget,   anyware_inst },
>    {"tecget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C003400, OPCODE_MASK_H32, tecget,  anyware_inst },
>    {"tneget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C005400, OPCODE_MASK_H32, tneget,  anyware_inst },
> @@ -455,7 +455,7 @@ static const struct op_code_struct {
>    {"tecput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00B400, OPCODE_MASK_H32, tecput,  anyware_inst },
>    {"tneput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00D400, OPCODE_MASK_H32, tneput,  anyware_inst },
>    {"tnecput", INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00F400, OPCODE_MASK_H32, tnecput, anyware_inst },
> - 
> +
>    {"aget",   INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C000800, OPCODE_MASK_H32, aget,   anyware_inst },
>    {"caget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C002800, OPCODE_MASK_H32, caget,  anyware_inst },
>    {"naget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C004800, OPCODE_MASK_H32, naget,  anyware_inst },
> @@ -464,7 +464,7 @@ static const struct op_code_struct {
>    {"caput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00A800, OPCODE_MASK_H32, caput,  anyware_inst },
>    {"naput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00C800, OPCODE_MASK_H32, naput,  anyware_inst },
>    {"ncaput", INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00E800, OPCODE_MASK_H32, ncaput, anyware_inst },
> - 
> +
>    {"taget",   INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C001800, OPCODE_MASK_H32, taget,   anyware_inst },
>    {"tcaget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C003800, OPCODE_MASK_H32, tcaget,  anyware_inst },
>    {"tnaget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C005800, OPCODE_MASK_H32, tnaget,  anyware_inst },
> @@ -473,7 +473,7 @@ static const struct op_code_struct {
>    {"tcaput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00B800, OPCODE_MASK_H32, tcaput,  anyware_inst },
>    {"tnaput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00D800, OPCODE_MASK_H32, tnaput,  anyware_inst },
>    {"tncaput", INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00F800, OPCODE_MASK_H32, tncaput, anyware_inst },
> - 
> +
>    {"eaget",   INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C000C00, OPCODE_MASK_H32, eget,   anyware_inst },
>    {"ecaget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C002C00, OPCODE_MASK_H32, ecget,  anyware_inst },
>    {"neaget",  INST_TYPE_RD_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C004C00, OPCODE_MASK_H32, neget,  anyware_inst },
> @@ -482,7 +482,7 @@ static const struct op_code_struct {
>    {"ecaput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00AC00, OPCODE_MASK_H32, ecput,  anyware_inst },
>    {"neaput",  INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00CC00, OPCODE_MASK_H32, neput,  anyware_inst },
>    {"necaput", INST_TYPE_R1_RFSL,  INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00EC00, OPCODE_MASK_H32, necput, anyware_inst },
> - 
> +
>    {"teaget",   INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C001C00, OPCODE_MASK_H32, teaget,   anyware_inst },
>    {"tecaget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C003C00, OPCODE_MASK_H32, tecaget,  anyware_inst },
>    {"tneaget",  INST_TYPE_RD_RFSL, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C005C00, OPCODE_MASK_H32, tneaget,  anyware_inst },
> @@ -491,7 +491,7 @@ static const struct op_code_struct {
>    {"tecaput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00BC00, OPCODE_MASK_H32, tecaput,  anyware_inst },
>    {"tneaput",  INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00DC00, OPCODE_MASK_H32, tneaput,  anyware_inst },
>    {"tnecaput", INST_TYPE_RFSL,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x6C00FC00, OPCODE_MASK_H32, tnecaput, anyware_inst },
> - 
> +
>    {"getd",    INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000000, OPCODE_MASK_H34C, getd,    anyware_inst },
>    {"tgetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000080, OPCODE_MASK_H34C, tgetd,   anyware_inst },
>    {"cgetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000100, OPCODE_MASK_H34C, cgetd,   anyware_inst },
> @@ -508,7 +508,7 @@ static const struct op_code_struct {
>    {"tnputd",  INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000680, OPCODE_MASK_H34C, tnputd,  anyware_inst },
>    {"ncputd",  INST_TYPE_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000700, OPCODE_MASK_H34C, ncputd,  anyware_inst },
>    {"tncputd", INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000780, OPCODE_MASK_H34C, tncputd, anyware_inst },
> - 
> +
>    {"egetd",    INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000020, OPCODE_MASK_H34C, egetd,    anyware_inst },
>    {"tegetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0000A0, OPCODE_MASK_H34C, tegetd,   anyware_inst },
>    {"ecgetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000120, OPCODE_MASK_H34C, ecgetd,   anyware_inst },
> @@ -525,7 +525,7 @@ static const struct op_code_struct {
>    {"tneputd",  INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0006A0, OPCODE_MASK_H34C, tneputd,  anyware_inst },
>    {"necputd",  INST_TYPE_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000720, OPCODE_MASK_H34C, necputd,  anyware_inst },
>    {"tnecputd", INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0007A0, OPCODE_MASK_H34C, tnecputd, anyware_inst },
> - 
> +
>    {"agetd",    INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000040, OPCODE_MASK_H34C, agetd,    anyware_inst },
>    {"tagetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0000C0, OPCODE_MASK_H34C, tagetd,   anyware_inst },
>    {"cagetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000140, OPCODE_MASK_H34C, cagetd,   anyware_inst },
> @@ -542,7 +542,7 @@ static const struct op_code_struct {
>    {"tnaputd",  INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0006C0, OPCODE_MASK_H34C, tnaputd,  anyware_inst },
>    {"ncaputd",  INST_TYPE_R1_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000740, OPCODE_MASK_H34C, ncaputd,  anyware_inst },
>    {"tncaputd", INST_TYPE_R2,    INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0007C0, OPCODE_MASK_H34C, tncaputd, anyware_inst },
> - 
> +
>    {"eagetd",    INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000060, OPCODE_MASK_H34C, eagetd,    anyware_inst },
>    {"teagetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C0000E0, OPCODE_MASK_H34C, teagetd,   anyware_inst },
>    {"ecagetd",   INST_TYPE_RD_R2, INST_NO_OFFSET, NO_DELAY_SLOT, IMMVAL_MASK_NON_SPECIAL, 0x4C000160, OPCODE_MASK_H34C, ecagetd,   anyware_inst },
> @@ -648,13 +648,13 @@ get_field_unsigned_imm (long instr)
>  
>  /*
>    char *
> -  get_field_special (instr) 
> +  get_field_special (instr)
>    long instr;
>    {
>    char tmpstr[25];
> -  
> +
>    sprintf(tmpstr, "%s%s", register_prefix, (((instr & IMM_MASK) >> IMM_LOW) & REG_MSR_MASK) == 0 ? "pc" : "msr");
> -  
> +
>    return(strdup(tmpstr));
>    }
>  */
> @@ -684,7 +684,7 @@ get_field_special(long instr, const struct op_code_struct *op)
>        break;
>     case REG_BTR_MASK :
>        strcpy(spr, "btr");
> -      break;      
> +      break;
>     case REG_EDR_MASK :
>        strcpy(spr, "edr");
>        break;
> @@ -719,13 +719,13 @@ get_field_special(long instr, const struct op_code_struct *op)
>       }
>       break;
>     }
> -   
> +
>     sprintf(tmpstr, "%s%s", register_prefix, spr);
>     return(strdup(tmpstr));
>  }
>  
>  static unsigned long
> -read_insn_microblaze (bfd_vma memaddr, 
> +read_insn_microblaze (bfd_vma memaddr,
>  		      struct disassemble_info *info,
>  		      const struct op_code_struct **opr)
>  {
> @@ -736,7 +736,7 @@ read_insn_microblaze (bfd_vma memaddr,
>  
>    status = info->read_memory_func (memaddr, ibytes, 4, info);
>  
> -  if (status != 0) 
> +  if (status != 0)
>      {
>        info->memory_error_func (status, memaddr, info);
>        return 0;
> @@ -761,7 +761,7 @@ read_insn_microblaze (bfd_vma memaddr,
>  }
>  
>  
> -int 
> +int
>  print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>  {
>    fprintf_function    fprintf_func = info->fprintf_func;
> @@ -780,7 +780,7 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>    if (inst == 0) {
>      return -1;
>    }
> -  
> +
>    if (prev_insn_vma == curr_insn_vma) {
>    if (memaddr-(info->bytes_per_chunk) == prev_insn_addr) {
>      prev_inst = read_insn_microblaze (prev_insn_addr, info, &pop);
> @@ -806,7 +806,7 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>    else
>      {
>        fprintf_func (stream, "%s", op->name);
> -      
> +
>        switch (op->inst_type)
>  	{
>    case INST_TYPE_RD_R1_R2:
> @@ -851,7 +851,7 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>  	  break;
>  	case INST_TYPE_R1_IMM:
>  	  fprintf_func(stream, "\t%s, %s", get_field_r1(inst), get_field_imm(inst));
> -	  /* The non-pc relative instructions are returns, which shouldn't 
> +	  /* The non-pc relative instructions are returns, which shouldn't
>  	     have a label printed */
>  	  if (info->print_address_func && op->inst_offset_type == INST_PC_OFFSET && info->symbol_at_address_func) {
>  	    if (immfound)
> @@ -886,7 +886,7 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>  	    if (info->symbol_at_address_func(immval, info)) {
>  	      fprintf_func (stream, "\t// ");
>  	      info->print_address_func (immval, info);
> -	    } 
> +	    }
>  	  }
>  	  break;
>          case INST_TYPE_IMM:
> @@ -938,7 +938,7 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>  	  break;
>  	}
>      }
> -  
> +
>    /* Say how many bytes we consumed? */
>    return 4;
>  }
> diff --git a/disas/nios2.c b/disas/nios2.c
> index c3e82140c7..35d9f40f3e 100644
> --- a/disas/nios2.c
> +++ b/disas/nios2.c
> @@ -96,7 +96,7 @@ enum overflow_type
>    no_overflow
>  };
>  
> -/* This structure holds information for a particular instruction. 
> +/* This structure holds information for a particular instruction.
>  
>     The args field is a string describing the operands.  The following
>     letters can appear in the args:
> @@ -152,26 +152,26 @@ enum overflow_type
>  struct nios2_opcode
>  {
>    const char *name;		/* The name of the instruction.  */
> -  const char *args;		/* A string describing the arguments for this 
> +  const char *args;		/* A string describing the arguments for this
>  				   instruction.  */
> -  const char *args_test;	/* Like args, but with an extra argument for 
> +  const char *args_test;	/* Like args, but with an extra argument for
>  				   the expected opcode.  */
> -  unsigned long num_args;	/* The number of arguments the instruction 
> +  unsigned long num_args;	/* The number of arguments the instruction
>  				   takes.  */
>    unsigned size;		/* Size in bytes of the instruction.  */
>    enum iw_format_type format;	/* Instruction format.  */
>    unsigned long match;		/* The basic opcode for the instruction.  */
> -  unsigned long mask;		/* Mask for the opcode field of the 
> +  unsigned long mask;		/* Mask for the opcode field of the
>  				   instruction.  */
> -  unsigned long pinfo;		/* Is this a real instruction or instruction 
> +  unsigned long pinfo;		/* Is this a real instruction or instruction
>  				   macro?  */
> -  enum overflow_type overflow_msg;  /* Used to generate informative 
> +  enum overflow_type overflow_msg;  /* Used to generate informative
>  				       message when fixup overflows.  */
>  };
>  
> -/* This value is used in the nios2_opcode.pinfo field to indicate that the 
> -   instruction is a macro or pseudo-op.  This requires special treatment by 
> -   the assembler, and is used by the disassembler to determine whether to 
> +/* This value is used in the nios2_opcode.pinfo field to indicate that the
> +   instruction is a macro or pseudo-op.  This requires special treatment by
> +   the assembler, and is used by the disassembler to determine whether to
>     check for a nop.  */
>  #define NIOS2_INSN_MACRO	0x80000000
>  #define NIOS2_INSN_MACRO_MOV	0x80000001
> @@ -207,124 +207,124 @@ struct nios2_reg
>  #define _NIOS2R1_H_
>  
>  /* R1 fields.  */
> -#define IW_R1_OP_LSB 0 
> -#define IW_R1_OP_SIZE 6 
> -#define IW_R1_OP_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R1_OP_SIZE)) 
> -#define IW_R1_OP_SHIFTED_MASK (IW_R1_OP_UNSHIFTED_MASK << IW_R1_OP_LSB) 
> -#define GET_IW_R1_OP(W) (((W) >> IW_R1_OP_LSB) & IW_R1_OP_UNSHIFTED_MASK) 
> -#define SET_IW_R1_OP(V) (((V) & IW_R1_OP_UNSHIFTED_MASK) << IW_R1_OP_LSB) 
> -
> -#define IW_I_A_LSB 27 
> -#define IW_I_A_SIZE 5 
> -#define IW_I_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_A_SIZE)) 
> -#define IW_I_A_SHIFTED_MASK (IW_I_A_UNSHIFTED_MASK << IW_I_A_LSB) 
> -#define GET_IW_I_A(W) (((W) >> IW_I_A_LSB) & IW_I_A_UNSHIFTED_MASK) 
> -#define SET_IW_I_A(V) (((V) & IW_I_A_UNSHIFTED_MASK) << IW_I_A_LSB) 
> -
> -#define IW_I_B_LSB 22 
> -#define IW_I_B_SIZE 5 
> -#define IW_I_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_B_SIZE)) 
> -#define IW_I_B_SHIFTED_MASK (IW_I_B_UNSHIFTED_MASK << IW_I_B_LSB) 
> -#define GET_IW_I_B(W) (((W) >> IW_I_B_LSB) & IW_I_B_UNSHIFTED_MASK) 
> -#define SET_IW_I_B(V) (((V) & IW_I_B_UNSHIFTED_MASK) << IW_I_B_LSB) 
> -
> -#define IW_I_IMM16_LSB 6 
> -#define IW_I_IMM16_SIZE 16 
> -#define IW_I_IMM16_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_IMM16_SIZE)) 
> -#define IW_I_IMM16_SHIFTED_MASK (IW_I_IMM16_UNSHIFTED_MASK << IW_I_IMM16_LSB) 
> -#define GET_IW_I_IMM16(W) (((W) >> IW_I_IMM16_LSB) & IW_I_IMM16_UNSHIFTED_MASK) 
> -#define SET_IW_I_IMM16(V) (((V) & IW_I_IMM16_UNSHIFTED_MASK) << IW_I_IMM16_LSB) 
> -
> -#define IW_R_A_LSB 27 
> -#define IW_R_A_SIZE 5 
> -#define IW_R_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_A_SIZE)) 
> -#define IW_R_A_SHIFTED_MASK (IW_R_A_UNSHIFTED_MASK << IW_R_A_LSB) 
> -#define GET_IW_R_A(W) (((W) >> IW_R_A_LSB) & IW_R_A_UNSHIFTED_MASK) 
> -#define SET_IW_R_A(V) (((V) & IW_R_A_UNSHIFTED_MASK) << IW_R_A_LSB) 
> -
> -#define IW_R_B_LSB 22 
> -#define IW_R_B_SIZE 5 
> -#define IW_R_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_B_SIZE)) 
> -#define IW_R_B_SHIFTED_MASK (IW_R_B_UNSHIFTED_MASK << IW_R_B_LSB) 
> -#define GET_IW_R_B(W) (((W) >> IW_R_B_LSB) & IW_R_B_UNSHIFTED_MASK) 
> -#define SET_IW_R_B(V) (((V) & IW_R_B_UNSHIFTED_MASK) << IW_R_B_LSB) 
> -
> -#define IW_R_C_LSB 17 
> -#define IW_R_C_SIZE 5 
> -#define IW_R_C_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_C_SIZE)) 
> -#define IW_R_C_SHIFTED_MASK (IW_R_C_UNSHIFTED_MASK << IW_R_C_LSB) 
> -#define GET_IW_R_C(W) (((W) >> IW_R_C_LSB) & IW_R_C_UNSHIFTED_MASK) 
> -#define SET_IW_R_C(V) (((V) & IW_R_C_UNSHIFTED_MASK) << IW_R_C_LSB) 
> -
> -#define IW_R_OPX_LSB 11 
> -#define IW_R_OPX_SIZE 6 
> -#define IW_R_OPX_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_OPX_SIZE)) 
> -#define IW_R_OPX_SHIFTED_MASK (IW_R_OPX_UNSHIFTED_MASK << IW_R_OPX_LSB) 
> -#define GET_IW_R_OPX(W) (((W) >> IW_R_OPX_LSB) & IW_R_OPX_UNSHIFTED_MASK) 
> -#define SET_IW_R_OPX(V) (((V) & IW_R_OPX_UNSHIFTED_MASK) << IW_R_OPX_LSB) 
> -
> -#define IW_R_IMM5_LSB 6 
> -#define IW_R_IMM5_SIZE 5 
> -#define IW_R_IMM5_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_IMM5_SIZE)) 
> -#define IW_R_IMM5_SHIFTED_MASK (IW_R_IMM5_UNSHIFTED_MASK << IW_R_IMM5_LSB) 
> -#define GET_IW_R_IMM5(W) (((W) >> IW_R_IMM5_LSB) & IW_R_IMM5_UNSHIFTED_MASK) 
> -#define SET_IW_R_IMM5(V) (((V) & IW_R_IMM5_UNSHIFTED_MASK) << IW_R_IMM5_LSB) 
> -
> -#define IW_J_IMM26_LSB 6 
> -#define IW_J_IMM26_SIZE 26 
> -#define IW_J_IMM26_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_J_IMM26_SIZE)) 
> -#define IW_J_IMM26_SHIFTED_MASK (IW_J_IMM26_UNSHIFTED_MASK << IW_J_IMM26_LSB) 
> -#define GET_IW_J_IMM26(W) (((W) >> IW_J_IMM26_LSB) & IW_J_IMM26_UNSHIFTED_MASK) 
> -#define SET_IW_J_IMM26(V) (((V) & IW_J_IMM26_UNSHIFTED_MASK) << IW_J_IMM26_LSB) 
> -
> -#define IW_CUSTOM_A_LSB 27 
> -#define IW_CUSTOM_A_SIZE 5 
> -#define IW_CUSTOM_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_A_SIZE)) 
> -#define IW_CUSTOM_A_SHIFTED_MASK (IW_CUSTOM_A_UNSHIFTED_MASK << IW_CUSTOM_A_LSB) 
> -#define GET_IW_CUSTOM_A(W) (((W) >> IW_CUSTOM_A_LSB) & IW_CUSTOM_A_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_A(V) (((V) & IW_CUSTOM_A_UNSHIFTED_MASK) << IW_CUSTOM_A_LSB) 
> -
> -#define IW_CUSTOM_B_LSB 22 
> -#define IW_CUSTOM_B_SIZE 5 
> -#define IW_CUSTOM_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_B_SIZE)) 
> -#define IW_CUSTOM_B_SHIFTED_MASK (IW_CUSTOM_B_UNSHIFTED_MASK << IW_CUSTOM_B_LSB) 
> -#define GET_IW_CUSTOM_B(W) (((W) >> IW_CUSTOM_B_LSB) & IW_CUSTOM_B_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_B(V) (((V) & IW_CUSTOM_B_UNSHIFTED_MASK) << IW_CUSTOM_B_LSB) 
> -
> -#define IW_CUSTOM_C_LSB 17 
> -#define IW_CUSTOM_C_SIZE 5 
> -#define IW_CUSTOM_C_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_C_SIZE)) 
> -#define IW_CUSTOM_C_SHIFTED_MASK (IW_CUSTOM_C_UNSHIFTED_MASK << IW_CUSTOM_C_LSB) 
> -#define GET_IW_CUSTOM_C(W) (((W) >> IW_CUSTOM_C_LSB) & IW_CUSTOM_C_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_C(V) (((V) & IW_CUSTOM_C_UNSHIFTED_MASK) << IW_CUSTOM_C_LSB) 
> -
> -#define IW_CUSTOM_READA_LSB 16 
> -#define IW_CUSTOM_READA_SIZE 1 
> -#define IW_CUSTOM_READA_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READA_SIZE)) 
> -#define IW_CUSTOM_READA_SHIFTED_MASK (IW_CUSTOM_READA_UNSHIFTED_MASK << IW_CUSTOM_READA_LSB) 
> -#define GET_IW_CUSTOM_READA(W) (((W) >> IW_CUSTOM_READA_LSB) & IW_CUSTOM_READA_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_READA(V) (((V) & IW_CUSTOM_READA_UNSHIFTED_MASK) << IW_CUSTOM_READA_LSB) 
> -
> -#define IW_CUSTOM_READB_LSB 15 
> -#define IW_CUSTOM_READB_SIZE 1 
> -#define IW_CUSTOM_READB_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READB_SIZE)) 
> -#define IW_CUSTOM_READB_SHIFTED_MASK (IW_CUSTOM_READB_UNSHIFTED_MASK << IW_CUSTOM_READB_LSB) 
> -#define GET_IW_CUSTOM_READB(W) (((W) >> IW_CUSTOM_READB_LSB) & IW_CUSTOM_READB_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_READB(V) (((V) & IW_CUSTOM_READB_UNSHIFTED_MASK) << IW_CUSTOM_READB_LSB) 
> -
> -#define IW_CUSTOM_READC_LSB 14 
> -#define IW_CUSTOM_READC_SIZE 1 
> -#define IW_CUSTOM_READC_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READC_SIZE)) 
> -#define IW_CUSTOM_READC_SHIFTED_MASK (IW_CUSTOM_READC_UNSHIFTED_MASK << IW_CUSTOM_READC_LSB) 
> -#define GET_IW_CUSTOM_READC(W) (((W) >> IW_CUSTOM_READC_LSB) & IW_CUSTOM_READC_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_READC(V) (((V) & IW_CUSTOM_READC_UNSHIFTED_MASK) << IW_CUSTOM_READC_LSB) 
> -
> -#define IW_CUSTOM_N_LSB 6 
> -#define IW_CUSTOM_N_SIZE 8 
> -#define IW_CUSTOM_N_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_N_SIZE)) 
> -#define IW_CUSTOM_N_SHIFTED_MASK (IW_CUSTOM_N_UNSHIFTED_MASK << IW_CUSTOM_N_LSB) 
> -#define GET_IW_CUSTOM_N(W) (((W) >> IW_CUSTOM_N_LSB) & IW_CUSTOM_N_UNSHIFTED_MASK) 
> -#define SET_IW_CUSTOM_N(V) (((V) & IW_CUSTOM_N_UNSHIFTED_MASK) << IW_CUSTOM_N_LSB) 
> +#define IW_R1_OP_LSB 0
> +#define IW_R1_OP_SIZE 6
> +#define IW_R1_OP_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R1_OP_SIZE))
> +#define IW_R1_OP_SHIFTED_MASK (IW_R1_OP_UNSHIFTED_MASK << IW_R1_OP_LSB)
> +#define GET_IW_R1_OP(W) (((W) >> IW_R1_OP_LSB) & IW_R1_OP_UNSHIFTED_MASK)
> +#define SET_IW_R1_OP(V) (((V) & IW_R1_OP_UNSHIFTED_MASK) << IW_R1_OP_LSB)
> +
> +#define IW_I_A_LSB 27
> +#define IW_I_A_SIZE 5
> +#define IW_I_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_A_SIZE))
> +#define IW_I_A_SHIFTED_MASK (IW_I_A_UNSHIFTED_MASK << IW_I_A_LSB)
> +#define GET_IW_I_A(W) (((W) >> IW_I_A_LSB) & IW_I_A_UNSHIFTED_MASK)
> +#define SET_IW_I_A(V) (((V) & IW_I_A_UNSHIFTED_MASK) << IW_I_A_LSB)
> +
> +#define IW_I_B_LSB 22
> +#define IW_I_B_SIZE 5
> +#define IW_I_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_B_SIZE))
> +#define IW_I_B_SHIFTED_MASK (IW_I_B_UNSHIFTED_MASK << IW_I_B_LSB)
> +#define GET_IW_I_B(W) (((W) >> IW_I_B_LSB) & IW_I_B_UNSHIFTED_MASK)
> +#define SET_IW_I_B(V) (((V) & IW_I_B_UNSHIFTED_MASK) << IW_I_B_LSB)
> +
> +#define IW_I_IMM16_LSB 6
> +#define IW_I_IMM16_SIZE 16
> +#define IW_I_IMM16_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_I_IMM16_SIZE))
> +#define IW_I_IMM16_SHIFTED_MASK (IW_I_IMM16_UNSHIFTED_MASK << IW_I_IMM16_LSB)
> +#define GET_IW_I_IMM16(W) (((W) >> IW_I_IMM16_LSB) & IW_I_IMM16_UNSHIFTED_MASK)
> +#define SET_IW_I_IMM16(V) (((V) & IW_I_IMM16_UNSHIFTED_MASK) << IW_I_IMM16_LSB)
> +
> +#define IW_R_A_LSB 27
> +#define IW_R_A_SIZE 5
> +#define IW_R_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_A_SIZE))
> +#define IW_R_A_SHIFTED_MASK (IW_R_A_UNSHIFTED_MASK << IW_R_A_LSB)
> +#define GET_IW_R_A(W) (((W) >> IW_R_A_LSB) & IW_R_A_UNSHIFTED_MASK)
> +#define SET_IW_R_A(V) (((V) & IW_R_A_UNSHIFTED_MASK) << IW_R_A_LSB)
> +
> +#define IW_R_B_LSB 22
> +#define IW_R_B_SIZE 5
> +#define IW_R_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_B_SIZE))
> +#define IW_R_B_SHIFTED_MASK (IW_R_B_UNSHIFTED_MASK << IW_R_B_LSB)
> +#define GET_IW_R_B(W) (((W) >> IW_R_B_LSB) & IW_R_B_UNSHIFTED_MASK)
> +#define SET_IW_R_B(V) (((V) & IW_R_B_UNSHIFTED_MASK) << IW_R_B_LSB)
> +
> +#define IW_R_C_LSB 17
> +#define IW_R_C_SIZE 5
> +#define IW_R_C_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_C_SIZE))
> +#define IW_R_C_SHIFTED_MASK (IW_R_C_UNSHIFTED_MASK << IW_R_C_LSB)
> +#define GET_IW_R_C(W) (((W) >> IW_R_C_LSB) & IW_R_C_UNSHIFTED_MASK)
> +#define SET_IW_R_C(V) (((V) & IW_R_C_UNSHIFTED_MASK) << IW_R_C_LSB)
> +
> +#define IW_R_OPX_LSB 11
> +#define IW_R_OPX_SIZE 6
> +#define IW_R_OPX_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_OPX_SIZE))
> +#define IW_R_OPX_SHIFTED_MASK (IW_R_OPX_UNSHIFTED_MASK << IW_R_OPX_LSB)
> +#define GET_IW_R_OPX(W) (((W) >> IW_R_OPX_LSB) & IW_R_OPX_UNSHIFTED_MASK)
> +#define SET_IW_R_OPX(V) (((V) & IW_R_OPX_UNSHIFTED_MASK) << IW_R_OPX_LSB)
> +
> +#define IW_R_IMM5_LSB 6
> +#define IW_R_IMM5_SIZE 5
> +#define IW_R_IMM5_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_R_IMM5_SIZE))
> +#define IW_R_IMM5_SHIFTED_MASK (IW_R_IMM5_UNSHIFTED_MASK << IW_R_IMM5_LSB)
> +#define GET_IW_R_IMM5(W) (((W) >> IW_R_IMM5_LSB) & IW_R_IMM5_UNSHIFTED_MASK)
> +#define SET_IW_R_IMM5(V) (((V) & IW_R_IMM5_UNSHIFTED_MASK) << IW_R_IMM5_LSB)
> +
> +#define IW_J_IMM26_LSB 6
> +#define IW_J_IMM26_SIZE 26
> +#define IW_J_IMM26_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_J_IMM26_SIZE))
> +#define IW_J_IMM26_SHIFTED_MASK (IW_J_IMM26_UNSHIFTED_MASK << IW_J_IMM26_LSB)
> +#define GET_IW_J_IMM26(W) (((W) >> IW_J_IMM26_LSB) & IW_J_IMM26_UNSHIFTED_MASK)
> +#define SET_IW_J_IMM26(V) (((V) & IW_J_IMM26_UNSHIFTED_MASK) << IW_J_IMM26_LSB)
> +
> +#define IW_CUSTOM_A_LSB 27
> +#define IW_CUSTOM_A_SIZE 5
> +#define IW_CUSTOM_A_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_A_SIZE))
> +#define IW_CUSTOM_A_SHIFTED_MASK (IW_CUSTOM_A_UNSHIFTED_MASK << IW_CUSTOM_A_LSB)
> +#define GET_IW_CUSTOM_A(W) (((W) >> IW_CUSTOM_A_LSB) & IW_CUSTOM_A_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_A(V) (((V) & IW_CUSTOM_A_UNSHIFTED_MASK) << IW_CUSTOM_A_LSB)
> +
> +#define IW_CUSTOM_B_LSB 22
> +#define IW_CUSTOM_B_SIZE 5
> +#define IW_CUSTOM_B_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_B_SIZE))
> +#define IW_CUSTOM_B_SHIFTED_MASK (IW_CUSTOM_B_UNSHIFTED_MASK << IW_CUSTOM_B_LSB)
> +#define GET_IW_CUSTOM_B(W) (((W) >> IW_CUSTOM_B_LSB) & IW_CUSTOM_B_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_B(V) (((V) & IW_CUSTOM_B_UNSHIFTED_MASK) << IW_CUSTOM_B_LSB)
> +
> +#define IW_CUSTOM_C_LSB 17
> +#define IW_CUSTOM_C_SIZE 5
> +#define IW_CUSTOM_C_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_C_SIZE))
> +#define IW_CUSTOM_C_SHIFTED_MASK (IW_CUSTOM_C_UNSHIFTED_MASK << IW_CUSTOM_C_LSB)
> +#define GET_IW_CUSTOM_C(W) (((W) >> IW_CUSTOM_C_LSB) & IW_CUSTOM_C_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_C(V) (((V) & IW_CUSTOM_C_UNSHIFTED_MASK) << IW_CUSTOM_C_LSB)
> +
> +#define IW_CUSTOM_READA_LSB 16
> +#define IW_CUSTOM_READA_SIZE 1
> +#define IW_CUSTOM_READA_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READA_SIZE))
> +#define IW_CUSTOM_READA_SHIFTED_MASK (IW_CUSTOM_READA_UNSHIFTED_MASK << IW_CUSTOM_READA_LSB)
> +#define GET_IW_CUSTOM_READA(W) (((W) >> IW_CUSTOM_READA_LSB) & IW_CUSTOM_READA_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_READA(V) (((V) & IW_CUSTOM_READA_UNSHIFTED_MASK) << IW_CUSTOM_READA_LSB)
> +
> +#define IW_CUSTOM_READB_LSB 15
> +#define IW_CUSTOM_READB_SIZE 1
> +#define IW_CUSTOM_READB_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READB_SIZE))
> +#define IW_CUSTOM_READB_SHIFTED_MASK (IW_CUSTOM_READB_UNSHIFTED_MASK << IW_CUSTOM_READB_LSB)
> +#define GET_IW_CUSTOM_READB(W) (((W) >> IW_CUSTOM_READB_LSB) & IW_CUSTOM_READB_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_READB(V) (((V) & IW_CUSTOM_READB_UNSHIFTED_MASK) << IW_CUSTOM_READB_LSB)
> +
> +#define IW_CUSTOM_READC_LSB 14
> +#define IW_CUSTOM_READC_SIZE 1
> +#define IW_CUSTOM_READC_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_READC_SIZE))
> +#define IW_CUSTOM_READC_SHIFTED_MASK (IW_CUSTOM_READC_UNSHIFTED_MASK << IW_CUSTOM_READC_LSB)
> +#define GET_IW_CUSTOM_READC(W) (((W) >> IW_CUSTOM_READC_LSB) & IW_CUSTOM_READC_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_READC(V) (((V) & IW_CUSTOM_READC_UNSHIFTED_MASK) << IW_CUSTOM_READC_LSB)
> +
> +#define IW_CUSTOM_N_LSB 6
> +#define IW_CUSTOM_N_SIZE 8
> +#define IW_CUSTOM_N_UNSHIFTED_MASK (0xffffffffu >> (32 - IW_CUSTOM_N_SIZE))
> +#define IW_CUSTOM_N_SHIFTED_MASK (IW_CUSTOM_N_UNSHIFTED_MASK << IW_CUSTOM_N_LSB)
> +#define GET_IW_CUSTOM_N(W) (((W) >> IW_CUSTOM_N_LSB) & IW_CUSTOM_N_UNSHIFTED_MASK)
> +#define SET_IW_CUSTOM_N(V) (((V) & IW_CUSTOM_N_UNSHIFTED_MASK) << IW_CUSTOM_N_LSB)
>  
>  /* R1 opcodes.  */
>  #define R1_OP_CALL 0
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 60f395c276..d548a3ab74 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1120,7 +1120,7 @@ ERST
>  
>  SRST
>  ``dump-guest-memory [-p]`` *filename* *begin* *length*
> -  \ 
> +  \
>  ``dump-guest-memory [-z|-l|-s|-w]`` *filename*
>    Dump guest memory to *protocol*. The file can be processed with crash or
>    gdb. Without ``-z|-l|-s|-w``, the dump format is ELF.
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 29d44dfb06..57c7cf0bd3 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -34,7 +34,7 @@ typedef struct TyphoonWindow {
>      uint64_t wsm;
>      uint64_t tba;
>  } TyphoonWindow;
> - 
> +
>  typedef struct TyphoonPchip {
>      MemoryRegion region;
>      MemoryRegion reg_iack;
> @@ -189,7 +189,7 @@ static MemTxResult cchip_read(void *opaque, hwaddr addr,
>      case 0x0780:
>          /* PWR: Power Management Control.   */
>          break;
> -    
> +
>      case 0x0c00: /* CMONCTLA */
>      case 0x0c40: /* CMONCTLB */
>      case 0x0c80: /* CMONCNT01 */
> @@ -441,7 +441,7 @@ static MemTxResult cchip_write(void *opaque, hwaddr addr,
>      case 0x0780:
>          /* PWR: Power Management Control.   */
>          break;
> -    
> +
>      case 0x0c00: /* CMONCTLA */
>      case 0x0c40: /* CMONCTLB */
>      case 0x0c80: /* CMONCNT01 */
> diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
> index 3a4bc332c4..3fdef425ab 100644
> --- a/hw/arm/gumstix.c
> +++ b/hw/arm/gumstix.c
> @@ -10,10 +10,10 @@
>   * Contributions after 2012-01-13 are licensed under the terms of the
>   * GNU GPL, version 2 or (at your option) any later version.
>   */
> - 
> -/* 
> +
> +/*
>   * Example usage:
> - * 
> + *
>   * connex:
>   * =======
>   * create image:
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 6ba0df6b6d..82e60e3b30 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -2914,7 +2914,7 @@ static void omap_rtc_tick(void *opaque)
>  
>      /*
>       * Every full hour add a rough approximation of the compensation
> -     * register to the 32kHz Timer (which drives the RTC) value. 
> +     * register to the 32kHz Timer (which drives the RTC) value.
>       */
>      if (s->auto_comp && !s->current_tm.tm_sec && !s->current_tm.tm_min)
>          s->tick += s->comp_reg * 1000 / 32768;
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 97ef566c12..7089a534d4 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -979,7 +979,7 @@ static void stellaris_adc_fifo_write(stellaris_adc_state *s, int n,
>  {
>      int head;
>  
> -    /* TODO: Real hardware has limited size FIFOs.  We have a full 16 entry 
> +    /* TODO: Real hardware has limited size FIFOs.  We have a full 16 entry
>         FIFO fir each sequencer.  */
>      head = (s->fifo[n].state >> 4) & 0xf;
>      if (s->fifo[n].state & STELLARIS_ADC_FIFO_FULL) {
> diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
> index 947bdb649a..85f6523efe 100644
> --- a/hw/char/etraxfs_ser.c
> +++ b/hw/char/etraxfs_ser.c
> @@ -180,7 +180,7 @@ static void serial_receive(void *opaque, const uint8_t *buf, int size)
>          return;
>      }
>  
> -    for (i = 0; i < size; i++) { 
> +    for (i = 0; i < size; i++) {
>          s->rx_fifo[s->rx_fifo_pos] = buf[i];
>          s->rx_fifo_pos++;
>          s->rx_fifo_pos &= 15;
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index b5a54e2536..f08c3c33a7 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -246,7 +246,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              } else {
>                  if (shift != 0)
>                      div |= (period_frac >> (32 - shift));
> -                /* Look at remaining bits of period_frac and round div up if 
> +                /* Look at remaining bits of period_frac and round div up if
>                     necessary.  */
>                  if ((uint32_t)(period_frac << shift))
>                      div += 1;
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index dab7423c73..adeed30638 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -267,7 +267,7 @@ void axisdev88_init(MachineState *machine)
>  
>      memory_region_add_subregion(address_space_mem, 0x40000000, machine->ram);
>  
> -    /* The ETRAX-FS has 128Kb on chip ram, the docs refer to it as the 
> +    /* The ETRAX-FS has 128Kb on chip ram, the docs refer to it as the
>         internal memory.  */
>      memory_region_init_ram(phys_intmem, NULL, "axisdev88.chipram",
>                             INTMEM_SIZE, &error_fatal);
> diff --git a/hw/cris/boot.c b/hw/cris/boot.c
> index b8947bc660..06a440431a 100644
> --- a/hw/cris/boot.c
> +++ b/hw/cris/boot.c
> @@ -72,7 +72,7 @@ void cris_load_image(CRISCPU *cpu, struct cris_load_info *li)
>      int image_size;
>  
>      env->load_info = li;
> -    /* Boots a kernel elf binary, os/linux-2.6/vmlinux from the axis 
> +    /* Boots a kernel elf binary, os/linux-2.6/vmlinux from the axis
>         devboard SDK.  */
>      image_size = load_elf(li->image_filename, NULL,
>                            translate_kernel_address, NULL,
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index d5627119ec..28caf878cd 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -51,7 +51,7 @@
>  #undef ALIGN
>  #define ALIGN(a, b) (((a) + ((b) - 1)) & ~((b) - 1))
>  
> -#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9" 
> +#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9"
>  
>  #define QXL_MODE(_x, _y, _b, _o)                  \
>      {   .x_res = _x,                              \
> diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
> index c4334e87bf..20173330a0 100644
> --- a/hw/dma/etraxfs_dma.c
> +++ b/hw/dma/etraxfs_dma.c
> @@ -322,12 +322,12 @@ static inline void channel_start(struct fs_dma_ctrl *ctrl, int c)
>  
>  static void channel_continue(struct fs_dma_ctrl *ctrl, int c)
>  {
> -	if (!channel_en(ctrl, c) 
> +	if (!channel_en(ctrl, c)
>  	    || channel_stopped(ctrl, c)
>  	    || ctrl->channels[c].state != RUNNING
>  	    /* Only reload the current data descriptor if it has eol set.  */
>  	    || !ctrl->channels[c].current_d.eol) {
> -		D(printf("continue failed ch=%d state=%d stopped=%d en=%d eol=%d\n", 
> +		D(printf("continue failed ch=%d state=%d stopped=%d en=%d eol=%d\n",
>  			 c, ctrl->channels[c].state,
>  			 channel_stopped(ctrl, c),
>  			 channel_en(ctrl,c),
> @@ -383,7 +383,7 @@ static void channel_update_irq(struct fs_dma_ctrl *ctrl, int c)
>  		ctrl->channels[c].regs[R_INTR]
>  		& ctrl->channels[c].regs[RW_INTR_MASK];
>  
> -	D(printf("%s: chan=%d masked_intr=%x\n", __func__, 
> +	D(printf("%s: chan=%d masked_intr=%x\n", __func__,
>  		 c,
>  		 ctrl->channels[c].regs[R_MASKED_INTR]));
>  
> @@ -492,7 +492,7 @@ static int channel_out_run(struct fs_dma_ctrl *ctrl, int c)
>  	return 1;
>  }
>  
> -static int channel_in_process(struct fs_dma_ctrl *ctrl, int c, 
> +static int channel_in_process(struct fs_dma_ctrl *ctrl, int c,
>  			      unsigned char *buf, int buflen, int eop)
>  {
>  	uint32_t len;
> @@ -517,7 +517,7 @@ static int channel_in_process(struct fs_dma_ctrl *ctrl, int c,
>  	    || eop) {
>  		uint32_t r_intr = ctrl->channels[c].regs[R_INTR];
>  
> -		D(printf("in dscr end len=%d\n", 
> +		D(printf("in dscr end len=%d\n",
>  			 ctrl->channels[c].current_d.after
>  			 - ctrl->channels[c].current_d.buf));
>  		ctrl->channels[c].current_d.after = saved_data_buf;
> @@ -708,7 +708,7 @@ static int etraxfs_dmac_run(void *opaque)
>  	int i;
>  	int p = 0;
>  
> -	for (i = 0; 
> +	for (i = 0;
>  	     i < ctrl->nr_channels;
>  	     i++)
>  	{
> @@ -724,10 +724,10 @@ static int etraxfs_dmac_run(void *opaque)
>  	return p;
>  }
>  
> -int etraxfs_dmac_input(struct etraxfs_dma_client *client, 
> +int etraxfs_dmac_input(struct etraxfs_dma_client *client,
>  		       void *buf, int len, int eop)
>  {
> -	return channel_in_process(client->ctrl, client->channel, 
> +	return channel_in_process(client->ctrl, client->channel,
>  				  buf, len, eop);
>  }
>  
> @@ -739,7 +739,7 @@ void etraxfs_dmac_connect(void *opaque, int c, qemu_irq *line, int input)
>  	ctrl->channels[c].input = input;
>  }
>  
> -void etraxfs_dmac_connect_client(void *opaque, int c, 
> +void etraxfs_dmac_connect_client(void *opaque, int c,
>  				 struct etraxfs_dma_client *cl)
>  {
>  	struct fs_dma_ctrl *ctrl = opaque;
> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> index 6977d85ef8..0db27628d5 100644
> --- a/hw/dma/i82374.c
> +++ b/hw/dma/i82374.c
> @@ -146,7 +146,7 @@ static Property i82374_properties[] = {
>  static void i82374_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> -    
> +
>      dc->realize = i82374_realize;
>      dc->vmsd = &vmstate_i82374;
>      device_class_set_props(dc, i82374_properties);
> diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
> index b000952b98..425b0ed69e 100644
> --- a/hw/i2c/bitbang_i2c.c
> +++ b/hw/i2c/bitbang_i2c.c
> @@ -95,7 +95,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
>      case SENDING_BIT7 ... SENDING_BIT0:
>          i2c->buffer = (i2c->buffer << 1) | data;
>          /* will end up in WAITING_FOR_ACK */
> -        i2c->state++; 
> +        i2c->state++;
>          return bitbang_i2c_ret(i2c, 1);
>  
>      case WAITING_FOR_ACK:
> diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
> index 55d61cc843..df07476c3e 100644
> --- a/hw/input/tsc2005.c
> +++ b/hw/input/tsc2005.c
> @@ -169,7 +169,7 @@ static uint16_t tsc2005_read(TSC2005State *s, int reg)
>  
>      case 0xc:	/* CFR0 */
>          return (s->pressure << 15) | ((!s->busy) << 14) |
> -                (s->nextprecision << 13) | s->timing[0]; 
> +                (s->nextprecision << 13) | s->timing[0];
>      case 0xd:	/* CFR1 */
>          return s->timing[1];
>      case 0xe:	/* CFR2 */
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index 182d3725fc..610b3fca59 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -412,7 +412,7 @@ static uint16_t tsc2102_control_register_read(
>      switch (reg) {
>      case 0x00:	/* TSC ADC */
>          return (s->pressure << 15) | ((!s->busy) << 14) |
> -                (s->nextfunction << 10) | (s->nextprecision << 8) | s->filter; 
> +                (s->nextfunction << 10) | (s->nextprecision << 8) | s->filter;
>  
>      case 0x01:	/* Status / Keypad Control */
>          if ((s->model & 0xff00) == 0x2100)
> diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
> index 12988c7aa9..9f9377798d 100644
> --- a/hw/intc/etraxfs_pic.c
> +++ b/hw/intc/etraxfs_pic.c
> @@ -52,15 +52,15 @@ struct etrax_pic
>  };
>  
>  static void pic_update(struct etrax_pic *fs)
> -{   
> +{
>      uint32_t vector = 0;
>      int i;
>  
>      fs->regs[R_R_MASKED_VECT] = fs->regs[R_R_VECT] & fs->regs[R_RW_MASK];
>  
>      /* The ETRAX interrupt controller signals interrupts to the core
> -       through an interrupt request wire and an irq vector bus. If 
> -       multiple interrupts are simultaneously active it chooses vector 
> +       through an interrupt request wire and an irq vector bus. If
> +       multiple interrupts are simultaneously active it chooses vector
>         0x30 and lets the sw choose the priorities.  */
>      if (fs->regs[R_R_MASKED_VECT]) {
>          uint32_t mv = fs->regs[R_R_MASKED_VECT];
> @@ -113,7 +113,7 @@ static const MemoryRegionOps pic_ops = {
>  };
>  
>  static void nmi_handler(void *opaque, int irq, int level)
> -{   
> +{
>      struct etrax_pic *fs = (void *)opaque;
>      uint32_t mask;
>  
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index 72a55e32dd..4c6e4b89a1 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -236,7 +236,7 @@ static uint64_t sh_intc_read(void *opaque, hwaddr offset,
>      printf("sh_intc_read 0x%lx\n", (unsigned long) offset);
>  #endif
>  
> -    sh_intc_locate(desc, (unsigned long)offset, &valuep, 
> +    sh_intc_locate(desc, (unsigned long)offset, &valuep,
>  		   &enum_ids, &first, &width, &mode);
>      return *valuep;
>  }
> @@ -257,7 +257,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
>      printf("sh_intc_write 0x%lx 0x%08x\n", (unsigned long) offset, value);
>  #endif
>  
> -    sh_intc_locate(desc, (unsigned long)offset, &valuep, 
> +    sh_intc_locate(desc, (unsigned long)offset, &valuep,
>  		   &enum_ids, &first, &width, &mode);
>  
>      switch (mode) {
> @@ -273,7 +273,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
>  	if ((*valuep & mask) == (value & mask))
>              continue;
>  #if 0
> -	printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n", 
> +	printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n",
>  	       k, first, enum_ids[k], (unsigned int)mask);
>  #endif
>          sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
> @@ -466,7 +466,7 @@ int sh_intc_init(MemoryRegion *sysmem,
>      }
>  
>      desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
> - 
> +
>      memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
>                            "interrupt-controller", 0x100000000ULL);
>  
> @@ -498,7 +498,7 @@ int sh_intc_init(MemoryRegion *sysmem,
>      return 0;
>  }
>  
> -/* Assert level <n> IRL interrupt. 
> +/* Assert level <n> IRL interrupt.
>     0:deassert. 1:lowest priority,... 15:highest priority. */
>  void sh_intc_set_irl(void *opaque, int n, int level)
>  {
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index 3e65e68619..dfc049de92 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -113,7 +113,7 @@ pic_write(void *opaque, hwaddr addr,
>  
>      addr >>= 2;
>      D(qemu_log("%s addr=%x val=%x\n", __func__, addr * 4, value));
> -    switch (addr) 
> +    switch (addr)
>      {
>          case R_IAR:
>              p->regs[R_ISR] &= ~value; /* ACK.  */
> diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
> index d3107e5ca2..83dd09a9bc 100644
> --- a/hw/misc/imx25_ccm.c
> +++ b/hw/misc/imx25_ccm.c
> @@ -200,9 +200,9 @@ static void imx25_ccm_reset(DeviceState *dev)
>      memset(s->reg, 0, IMX25_CCM_MAX_REG * sizeof(uint32_t));
>      s->reg[IMX25_CCM_MPCTL_REG] = 0x800b2c01;
>      s->reg[IMX25_CCM_UPCTL_REG] = 0x84042800;
> -    /* 
> +    /*
>       * The value below gives:
> -     * CPU = 133 MHz, AHB = 66,5 MHz, IPG = 33 MHz. 
> +     * CPU = 133 MHz, AHB = 66,5 MHz, IPG = 33 MHz.
>       */
>      s->reg[IMX25_CCM_CCTL_REG]  = 0xd0030000;
>      s->reg[IMX25_CCM_CGCR0_REG] = 0x028A0100;
> @@ -219,7 +219,7 @@ static void imx25_ccm_reset(DeviceState *dev)
>  
>      /*
>       * default boot will change the reset values to allow:
> -     * CPU = 399 MHz, AHB = 133 MHz, IPG = 66,5 MHz. 
> +     * CPU = 399 MHz, AHB = 133 MHz, IPG = 66,5 MHz.
>       * For some reason, this doesn't work. With the value below, linux
>       * detects a 88 MHz IPG CLK instead of 66,5 MHz.
>      s->reg[IMX25_CCM_CCTL_REG]  = 0x20032000;
> diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
> index 6e246827ab..8da2757cbe 100644
> --- a/hw/misc/imx31_ccm.c
> +++ b/hw/misc/imx31_ccm.c
> @@ -115,7 +115,7 @@ static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
>              if (s->reg[IMX31_CCM_CCMR_REG] & CCMR_FPMF) {
>                  freq *= 1024;
>              }
> -        } 
> +        }
>      } else {
>          freq = CKIH_FREQ;
>      }
> diff --git a/hw/net/vmxnet3.h b/hw/net/vmxnet3.h
> index 5b3b76ba7a..020bf70afd 100644
> --- a/hw/net/vmxnet3.h
> +++ b/hw/net/vmxnet3.h
> @@ -246,7 +246,7 @@ struct Vmxnet3_TxDesc {
>          };
>          u32 val1;
>      };
> -    
> +
>      union {
>          struct {
>  #ifdef __BIG_ENDIAN_BITFIELD
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 71d16fef3d..0703f9e444 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -117,7 +117,7 @@ eth_write(void *opaque, hwaddr addr,
>      uint32_t value = val64;
>  
>      addr >>= 2;
> -    switch (addr) 
> +    switch (addr)
>      {
>          case R_TX_CTRL0:
>          case R_TX_CTRL1:
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 5b48bae0f6..4692d9b5a3 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -705,7 +705,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>  
>      hotplug_event_notify(dev);
>  
> -    /* 
> +    /*
>       * 6.7.3.2 Command Completed Events
>       *
>       * Software issues a command to a hot-plug capable Downstream Port by
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index 4088a8a80b..7c6f179578 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -342,7 +342,7 @@ static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
>          return s->arg >> 16;
>  
>      case 0x0c:	/* MMC_CON */
> -        return (s->dw << 15) | (s->mode << 12) | (s->enable << 11) | 
> +        return (s->dw << 15) | (s->mode << 12) | (s->enable << 11) |
>                  (s->be << 10) | s->clkdiv;
>  
>      case 0x10:	/* MMC_STAT */
> diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
> index f410c08883..dddfa8b336 100644
> --- a/hw/sh4/shix.c
> +++ b/hw/sh4/shix.c
> @@ -49,7 +49,7 @@ static void shix_init(MachineState *machine)
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *rom = g_new(MemoryRegion, 1);
>      MemoryRegion *sdram = g_new(MemoryRegion, 2);
> -    
> +
>      cpu = SUPERH_CPU(cpu_create(machine->cpu_type));
>  
>      /* Allocate memory space */
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 9c8655cffc..e3dd1c67a0 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -670,7 +670,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>      s = SYS_BUS_DEVICE(nvram);
>      memory_region_add_subregion(pci_address_space_io(ebus), 0x2000,
>                                  sysbus_mmio_get_region(s, 0));
> - 
> +
>      initrd_size = 0;
>      initrd_addr = 0;
>      kernel_size = sun4u_load_kernel(machine->kernel_filename,
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index afe3d30a8e..797f65b3f4 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -230,7 +230,7 @@ static inline void timer_watchdog_update(ETRAXTimerState *t, uint32_t value)
>      if (wd_en && wd_key != new_key)
>          return;
>  
> -    D(printf("en=%d new_key=%x oldkey=%x cmd=%d cnt=%d\n", 
> +    D(printf("en=%d new_key=%x oldkey=%x cmd=%d cnt=%d\n",
>           wd_en, new_key, wd_key, new_cmd, wd_cnt));
>  
>      if (t->wd_hits)
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 0190aa47d0..0901ca7b05 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -166,7 +166,7 @@ timer_write(void *opaque, hwaddr addr,
>               __func__, addr * 4, value, timer, addr & 3));
>      /* Further decoding to address a specific timers reg.  */
>      addr &= 3;
> -    switch (addr) 
> +    switch (addr)
>      {
>          case R_TCSR:
>              if (value & TCSR_TINT)
> @@ -179,7 +179,7 @@ timer_write(void *opaque, hwaddr addr,
>                  ptimer_transaction_commit(xt->ptimer);
>              }
>              break;
> - 
> +
>          default:
>              if (addr < ARRAY_SIZE(xt->regs))
>                  xt->regs[addr] = value;
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 85f5ff5bd4..f64f47b34f 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -33,8 +33,8 @@
>  
>  #define MUSB_HDRC_INTRTX	0x02	/* 16-bit */
>  #define MUSB_HDRC_INTRRX	0x04
> -#define MUSB_HDRC_INTRTXE	0x06  
> -#define MUSB_HDRC_INTRRXE	0x08  
> +#define MUSB_HDRC_INTRTXE	0x06
> +#define MUSB_HDRC_INTRRXE	0x08
>  #define MUSB_HDRC_INTRUSB	0x0a	/* 8 bit */
>  #define MUSB_HDRC_INTRUSBE	0x0b	/* 8 bit */
>  #define MUSB_HDRC_FRAME		0x0c	/* 16-bit */
> @@ -113,7 +113,7 @@
>   */
>  
>  /* POWER */
> -#define MGC_M_POWER_ISOUPDATE		0x80 
> +#define MGC_M_POWER_ISOUPDATE		0x80
>  #define	MGC_M_POWER_SOFTCONN		0x40
>  #define	MGC_M_POWER_HSENAB		0x20
>  #define	MGC_M_POWER_HSMODE		0x10
> @@ -127,7 +127,7 @@
>  #define MGC_M_INTR_RESUME		0x02
>  #define MGC_M_INTR_RESET		0x04
>  #define MGC_M_INTR_BABBLE		0x04
> -#define MGC_M_INTR_SOF			0x08 
> +#define MGC_M_INTR_SOF			0x08
>  #define MGC_M_INTR_CONNECT		0x10
>  #define MGC_M_INTR_DISCONNECT		0x20
>  #define MGC_M_INTR_SESSREQ		0x40
> @@ -135,7 +135,7 @@
>  #define MGC_M_INTR_EP0			0x01	/* FOR EP0 INTERRUPT */
>  
>  /* DEVCTL */
> -#define MGC_M_DEVCTL_BDEVICE		0x80   
> +#define MGC_M_DEVCTL_BDEVICE		0x80
>  #define MGC_M_DEVCTL_FSDEV		0x40
>  #define MGC_M_DEVCTL_LSDEV		0x20
>  #define MGC_M_DEVCTL_VBUS		0x18
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 1e6e85e86a..a2bc7e05d6 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -670,7 +670,7 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
>  
>      starting_frame = OHCI_BM(iso_td.flags, TD_SF);
>      frame_count = OHCI_BM(iso_td.flags, TD_FC);
> -    relative_frame_number = USUB(ohci->frame_number, starting_frame); 
> +    relative_frame_number = USUB(ohci->frame_number, starting_frame);
>  
>      trace_usb_ohci_iso_td_head(
>             ed->head & OHCI_DPTR_MASK, ed->tail & OHCI_DPTR_MASK,
> @@ -733,8 +733,8 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
>      start_offset = iso_td.offset[relative_frame_number];
>      next_offset = iso_td.offset[relative_frame_number + 1];
>  
> -    if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) || 
> -        ((relative_frame_number < frame_count) && 
> +    if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) ||
> +        ((relative_frame_number < frame_count) &&
>           !(OHCI_BM(next_offset, TD_PSW_CC) & 0xe))) {
>          trace_usb_ohci_iso_td_bad_cc_not_accessed(start_offset, next_offset);
>          return 1;
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 37f7beb3fa..bebc10a723 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -80,7 +80,7 @@ struct UHCIPCIDeviceClass {
>      UHCIInfo       info;
>  };
>  
> -/* 
> +/*
>   * Pending async transaction.
>   * 'packet' must be the first field because completion
>   * handler does "(UHCIAsync *) pkt" cast.
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 7bc8c1c056..f7d8b30fd7 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -836,7 +836,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>  
>      /* If guest supports masking, keep irqfd but mask it.
>       * Otherwise, clean it up now.
> -     */ 
> +     */
>      if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>          k->guest_notifier_mask(vdev, queue_no, true);
>      } else {
> diff --git a/include/hw/cris/etraxfs_dma.h b/include/hw/cris/etraxfs_dma.h
> index 095d76b956..f11a5874cf 100644
> --- a/include/hw/cris/etraxfs_dma.h
> +++ b/include/hw/cris/etraxfs_dma.h
> @@ -28,9 +28,9 @@ struct etraxfs_dma_client
>  void *etraxfs_dmac_init(hwaddr base, int nr_channels);
>  void etraxfs_dmac_connect(void *opaque, int channel, qemu_irq *line,
>  			  int input);
> -void etraxfs_dmac_connect_client(void *opaque, int c, 
> +void etraxfs_dmac_connect_client(void *opaque, int c,
>  				 struct etraxfs_dma_client *cl);
> -int etraxfs_dmac_input(struct etraxfs_dma_client *client, 
> +int etraxfs_dmac_input(struct etraxfs_dma_client *client,
>  		       void *buf, int len, int eop);
>  
>  #endif
> diff --git a/include/hw/net/lance.h b/include/hw/net/lance.h
> index 0357f5f65c..6099c12d37 100644
> --- a/include/hw/net/lance.h
> +++ b/include/hw/net/lance.h
> @@ -6,7 +6,7 @@
>   *
>   * This represents the Sparc32 lance (Am7990) ethernet device which is an
>   * earlier register-compatible member of the AMD PC-Net II (Am79C970A) family.
> - * 
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
>   * in the Software without restriction, including without limitation the rights
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index c421410e3f..fdeed5ecb6 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -131,7 +131,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>  
>      void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
> -                          uint64_t *buid, hwaddr *pio, 
> +                          uint64_t *buid, hwaddr *pio,
>                            hwaddr *mmio32, hwaddr *mmio64,
>                            unsigned n_dma, uint32_t *liobns, hwaddr *nv2gpa,
>                            hwaddr *nv2atsd, Error **errp);
> diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
> index 5d048b335c..fdb2a6ecba 100644
> --- a/include/hw/xen/interface/io/ring.h
> +++ b/include/hw/xen/interface/io/ring.h
> @@ -1,6 +1,6 @@
>  /******************************************************************************
>   * ring.h
> - * 
> + *
>   * Shared producer-consumer ring macros.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
> @@ -61,7 +61,7 @@ typedef unsigned int RING_IDX;
>  /*
>   * Calculate size of a shared ring, given the total available space for the
>   * ring and indexes (_sz), and the name tag of the request/response structure.
> - * A ring contains as many entries as will fit, rounded down to the nearest 
> + * A ring contains as many entries as will fit, rounded down to the nearest
>   * power of two (so we can mask with (size-1) to loop around).
>   */
>  #define __CONST_RING_SIZE(_s, _sz) \
> @@ -75,7 +75,7 @@ typedef unsigned int RING_IDX;
>  
>  /*
>   * Macros to make the correct C datatypes for a new kind of ring.
> - * 
> + *
>   * To make a new ring datatype, you need to have two message structures,
>   * let's say request_t, and response_t already defined.
>   *
> @@ -85,7 +85,7 @@ typedef unsigned int RING_IDX;
>   *
>   * These expand out to give you a set of types, as you can see below.
>   * The most important of these are:
> - * 
> + *
>   *     mytag_sring_t      - The shared ring.
>   *     mytag_front_ring_t - The 'front' half of the ring.
>   *     mytag_back_ring_t  - The 'back' half of the ring.
> @@ -153,15 +153,15 @@ typedef struct __name##_back_ring __name##_back_ring_t
>  
>  /*
>   * Macros for manipulating rings.
> - * 
> - * FRONT_RING_whatever works on the "front end" of a ring: here 
> + *
> + * FRONT_RING_whatever works on the "front end" of a ring: here
>   * requests are pushed on to the ring and responses taken off it.
> - * 
> - * BACK_RING_whatever works on the "back end" of a ring: here 
> + *
> + * BACK_RING_whatever works on the "back end" of a ring: here
>   * requests are taken off the ring and responses put on.
> - * 
> - * N.B. these macros do NO INTERLOCKS OR FLOW CONTROL. 
> - * This is OK in 1-for-1 request-response situations where the 
> + *
> + * N.B. these macros do NO INTERLOCKS OR FLOW CONTROL.
> + * This is OK in 1-for-1 request-response situations where the
>   * requestor (front end) never has more than RING_SIZE()-1
>   * outstanding requests.
>   */
> @@ -263,26 +263,26 @@ typedef struct __name##_back_ring __name##_back_ring_t
>  
>  /*
>   * Notification hold-off (req_event and rsp_event):
> - * 
> + *
>   * When queueing requests or responses on a shared ring, it may not always be
>   * necessary to notify the remote end. For example, if requests are in flight
>   * in a backend, the front may be able to queue further requests without
>   * notifying the back (if the back checks for new requests when it queues
>   * responses).
> - * 
> + *
>   * When enqueuing requests or responses:
> - * 
> + *
>   *  Use RING_PUSH_{REQUESTS,RESPONSES}_AND_CHECK_NOTIFY(). The second argument
>   *  is a boolean return value. True indicates that the receiver requires an
>   *  asynchronous notification.
> - * 
> + *
>   * After dequeuing requests or responses (before sleeping the connection):
> - * 
> + *
>   *  Use RING_FINAL_CHECK_FOR_REQUESTS() or RING_FINAL_CHECK_FOR_RESPONSES().
>   *  The second argument is a boolean return value. True indicates that there
>   *  are pending messages on the ring (i.e., the connection should not be put
>   *  to sleep).
> - * 
> + *
>   *  These macros will set the req_event/rsp_event field to trigger a
>   *  notification on the very next message that is enqueued. If you want to
>   *  create batches of work (i.e., only receive a notification after several
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index f4724f7330..1a4e066160 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -14,7 +14,7 @@ typedef struct QemuLogFile {
>  extern QemuLogFile *qemu_logfile;
>  
>  
> -/* 
> +/*
>   * The new API:
>   *
>   */
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 94a61ccc3f..380007b133 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1443,12 +1443,12 @@ char *object_get_canonical_path(const Object *obj);
>   *   ambiguous match
>   *
>   * There are two types of supported paths--absolute paths and partial paths.
> - * 
> + *
>   * Absolute paths are derived from the root object and can follow child<> or
>   * link<> properties.  Since they can follow link<> properties, they can be
>   * arbitrarily long.  Absolute paths look like absolute filenames and are
>   * prefixed with a leading slash.
> - * 
> + *
>   * Partial paths look like relative filenames.  They do not begin with a
>   * prefix.  The matching rules for partial paths are subtle but designed to make
>   * specifying objects easy.  At each level of the composition tree, the partial
> diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
> index 334edddd1e..25d0861df9 100644
> --- a/linux-user/cris/cpu_loop.c
> +++ b/linux-user/cris/cpu_loop.c
> @@ -27,7 +27,7 @@ void cpu_loop(CPUCRISState *env)
>      CPUState *cs = env_cpu(env);
>      int trapnr, ret;
>      target_siginfo_t info;
> -    
> +
>      while (1) {
>          cpu_exec_start(cs);
>          trapnr = cpu_exec(cs);
> @@ -49,13 +49,13 @@ void cpu_loop(CPUCRISState *env)
>            /* just indicate that signals should be handled asap */
>            break;
>          case EXCP_BREAK:
> -            ret = do_syscall(env, 
> -                             env->regs[9], 
> -                             env->regs[10], 
> -                             env->regs[11], 
> -                             env->regs[12], 
> -                             env->regs[13], 
> -                             env->pregs[7], 
> +            ret = do_syscall(env,
> +                             env->regs[9],
> +                             env->regs[10],
> +                             env->regs[11],
> +                             env->regs[12],
> +                             env->regs[13],
> +                             env->pregs[7],
>                               env->pregs[11],
>                               0, 0);
>              if (ret == -TARGET_ERESTARTSYS) {
> diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
> index 3e0a7f730b..990dda26c3 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -27,7 +27,7 @@ void cpu_loop(CPUMBState *env)
>      CPUState *cs = env_cpu(env);
>      int trapnr, ret;
>      target_siginfo_t info;
> -    
> +
>      while (1) {
>          cpu_exec_start(cs);
>          trapnr = cpu_exec(cs);
> @@ -52,13 +52,13 @@ void cpu_loop(CPUMBState *env)
>              /* Return address is 4 bytes after the call.  */
>              env->regs[14] += 4;
>              env->sregs[SR_PC] = env->regs[14];
> -            ret = do_syscall(env, 
> -                             env->regs[12], 
> -                             env->regs[5], 
> -                             env->regs[6], 
> -                             env->regs[7], 
> -                             env->regs[8], 
> -                             env->regs[9], 
> +            ret = do_syscall(env,
> +                             env->regs[12],
> +                             env->regs[5],
> +                             env->regs[6],
> +                             env->regs[7],
> +                             env->regs[8],
> +                             env->regs[9],
>                               env->regs[10],
>                               0, 0);
>              if (ret == -TARGET_ERESTARTSYS) {
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 0019447892..e48056f6ad 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -401,12 +401,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>      }
>  
>      /* When mapping files into a memory area larger than the file, accesses
> -       to pages beyond the file size will cause a SIGBUS. 
> +       to pages beyond the file size will cause a SIGBUS.
>  
>         For example, if mmaping a file of 100 bytes on a host with 4K pages
>         emulating a target with 8K pages, the target expects to be able to
>         access the first 8K. But the host will trap us on any access beyond
> -       4K.  
> +       4K.
>  
>         When emulating a target with a larger page-size than the hosts, we
>         may need to truncate file maps at EOF and add extra anonymous pages
> @@ -421,7 +421,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>  
>         /* Are we trying to create a map beyond EOF?.  */
>         if (offset + len > sb.st_size) {
> -           /* If so, truncate the file map at eof aligned with 
> +           /* If so, truncate the file map at eof aligned with
>                the hosts real pagesize. Additional anonymous maps
>                will be created beyond EOF.  */
>             len = REAL_HOST_PAGE_ALIGN(sb.st_size - offset);
> @@ -496,7 +496,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>              }
>              goto the_end;
>          }
> -        
> +
>          /* handle the start of the mapping */
>          if (start > real_start) {
>              if (real_end == real_start + qemu_host_page_size) {
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index d796f50f66..53efb61c70 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -104,7 +104,7 @@ struct target_rt_signal_frame {
>      qemu_siginfo_fpu_t  fpu_state;
>  };
>  
> -static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
> +static inline abi_ulong get_sigframe(struct target_sigaction *sa,
>                                       CPUSPARCState *env,
>                                       unsigned long framesize)
>  {
> @@ -506,7 +506,7 @@ void sparc64_get_context(CPUSPARCState *env)
>      if (!lock_user_struct(VERIFY_WRITE, ucp, ucp_addr, 0)) {
>          goto do_sigsegv;
>      }
> -    
> +
>      mcp = &ucp->tuc_mcontext;
>      grp = &mcp->mc_gregs;
>  
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 97de9fb5c9..10d91a9781 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1104,7 +1104,7 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>  {
>      abi_ulong target_rlim_swap;
>      rlim_t result;
> -    
> +
>      target_rlim_swap = tswapal(target_rlim);
>      if (target_rlim_swap == TARGET_RLIM_INFINITY)
>          return RLIM_INFINITY;
> @@ -1112,7 +1112,7 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>      result = target_rlim_swap;
>      if (target_rlim_swap != (rlim_t)result)
>          return RLIM_INFINITY;
> -    
> +
>      return result;
>  }
>  #endif
> @@ -1122,13 +1122,13 @@ static inline abi_ulong host_to_target_rlim(rlim_t rlim)
>  {
>      abi_ulong target_rlim_swap;
>      abi_ulong result;
> -    
> +
>      if (rlim == RLIM_INFINITY || rlim != (abi_long)rlim)
>          target_rlim_swap = TARGET_RLIM_INFINITY;
>      else
>          target_rlim_swap = rlim;
>      result = tswapal(target_rlim_swap);
> -    
> +
>      return result;
>  }
>  #endif
> @@ -1615,9 +1615,9 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
>      abi_ulong target_cmsg_addr;
>      struct target_cmsghdr *target_cmsg, *target_cmsg_start;
>      socklen_t space = 0;
> -    
> +
>      msg_controllen = tswapal(target_msgh->msg_controllen);
> -    if (msg_controllen < sizeof (struct target_cmsghdr)) 
> +    if (msg_controllen < sizeof (struct target_cmsghdr))
>          goto the_end;
>      target_cmsg_addr = tswapal(target_msgh->msg_control);
>      target_cmsg = lock_user(VERIFY_READ, target_cmsg_addr, msg_controllen, 1);
> @@ -1703,7 +1703,7 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>      socklen_t space = 0;
>  
>      msg_controllen = tswapal(target_msgh->msg_controllen);
> -    if (msg_controllen < sizeof (struct target_cmsghdr)) 
> +    if (msg_controllen < sizeof (struct target_cmsghdr))
>          goto the_end;
>      target_cmsg_addr = tswapal(target_msgh->msg_control);
>      target_cmsg = lock_user(VERIFY_WRITE, target_cmsg_addr, msg_controllen, 0);
> @@ -5750,7 +5750,7 @@ abi_long do_set_thread_area(CPUX86State *env, abi_ulong ptr)
>      }
>      unlock_user_struct(target_ldt_info, ptr, 1);
>  
> -    if (ldt_info.entry_number < TARGET_GDT_ENTRY_TLS_MIN || 
> +    if (ldt_info.entry_number < TARGET_GDT_ENTRY_TLS_MIN ||
>          ldt_info.entry_number > TARGET_GDT_ENTRY_TLS_MAX)
>             return -TARGET_EINVAL;
>      seg_32bit = ldt_info.flags & 1;
> @@ -5828,7 +5828,7 @@ static abi_long do_get_thread_area(CPUX86State *env, abi_ulong ptr)
>      lp = (uint32_t *)(gdt_table + idx);
>      entry_1 = tswap32(lp[0]);
>      entry_2 = tswap32(lp[1]);
> -    
> +
>      read_exec_only = ((entry_2 >> 9) & 1) ^ 1;
>      contents = (entry_2 >> 10) & 3;
>      seg_not_present = ((entry_2 >> 15) & 1) ^ 1;
> @@ -5844,8 +5844,8 @@ static abi_long do_get_thread_area(CPUX86State *env, abi_ulong ptr)
>          (read_exec_only << 3) | (limit_in_pages << 4) |
>          (seg_not_present << 5) | (useable << 6) | (lm << 7);
>      limit = (entry_1 & 0xffff) | (entry_2  & 0xf0000);
> -    base_addr = (entry_1 >> 16) | 
> -        (entry_2 & 0xff000000) | 
> +    base_addr = (entry_1 >> 16) |
> +        (entry_2 & 0xff000000) |
>          ((entry_2 & 0xff) << 16);
>      target_ldt_info->base_addr = tswapal(base_addr);
>      target_ldt_info->limit = tswap32(limit);
> @@ -10873,7 +10873,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return get_errno(fchown(arg1, low2highuid(arg2), low2highgid(arg3)));
>  #if defined(TARGET_NR_fchownat)
>      case TARGET_NR_fchownat:
> -        if (!(p = lock_user_string(arg2))) 
> +        if (!(p = lock_user_string(arg2)))
>              return -TARGET_EFAULT;
>          ret = get_errno(fchownat(arg1, p, low2highuid(arg3),
>                                   low2highgid(arg4), arg5));
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 152ec637cb..752ea5ee83 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1923,7 +1923,7 @@ struct target_stat {
>  	abi_long	st_blocks;	/* Number 512-byte blocks allocated. */
>  
>  	abi_ulong	target_st_atime;
> -	abi_ulong 	target_st_atime_nsec; 
> +	abi_ulong 	target_st_atime_nsec;
>  	abi_ulong	target_st_mtime;
>  	abi_ulong	target_st_mtime_nsec;
>  	abi_ulong	target_st_ctime;
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index e215ecc2a6..91e2067933 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -55,7 +55,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
>          unlock_user(ptr, guest_addr, 0);
>          guest_addr += len;
>          /* we don't allow wrapping or integer overflow */
> -        if (guest_addr == 0 || 
> +        if (guest_addr == 0 ||
>              (guest_addr - guest_addr1) > 0x7fffffff)
>              return -TARGET_EFAULT;
>          if (len != max_len)
> diff --git a/os-posix.c b/os-posix.c
> index 3cd52e1e70..fa6dfae168 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -316,7 +316,7 @@ void os_setup_post(void)
>  
>          close(fd);
>  
> -        do {        
> +        do {
>              len = write(daemon_pipe, &status, 1);
>          } while (len < 0 && errno == EINTR);
>          if (len != 1) {
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index 29a6c98b53..48045c3ccc 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -4,7 +4,7 @@
>   * Authors:
>   *  Hu Tao       <hutao@cn.fujitsu.com>
>   *  Peter Lieven <pl@kamp.de>
> - * 
> + *
>   * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
>   * See the COPYING.LIB file in the top-level directory.
>   *
> diff --git a/qemu-img.c b/qemu-img.c
> index bdb9f6aa46..72dfa096b1 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -248,7 +248,7 @@ static bool qemu_img_object_print_help(const char *type, QemuOpts *opts)
>   * an odd number of ',' (or else a separating ',' following it gets
>   * escaped), or be empty (or else a separating ',' preceding it can
>   * escape a separating ',' following it).
> - * 
> + *
>   */
>  static bool is_valid_option_list(const char *optarg)
>  {
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 196f468786..2f728fde47 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -192,15 +192,15 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      QEMU_ARCH_ALL)
>  SRST
>  ``-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
> -  \ 
> +  \
>  ``-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
>    \
>  ``-numa dist,src=source,dst=destination,val=distance``
> -  \ 
> +  \
>  ``-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]``
> -  \ 
> +  \
>  ``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=tpye[,latency=lat][,bandwidth=bw]``
> -  \ 
> +  \
>  ``-numa hmat-cache,node-id=node,size=size,level=level[,associativity=str][,policy=str][,line=size]``
>      Define a NUMA node and assign RAM and VCPUs to it. Set the NUMA
>      distance from a source node to a destination node. Set the ACPI
> @@ -395,7 +395,7 @@ DEF("global", HAS_ARG, QEMU_OPTION_global,
>      QEMU_ARCH_ALL)
>  SRST
>  ``-global driver.prop=value``
> -  \ 
> +  \
>  ``-global driver=driver,property=property,value=value``
>      Set default value of driver's property prop to value, e.g.:
>  
> @@ -926,9 +926,9 @@ SRST
>  ``-hda file``
>    \
>  ``-hdb file``
> -  \ 
> +  \
>  ``-hdc file``
> -  \ 
> +  \
>  ``-hdd file``
>      Use file as hard disk 0, 1, 2 or 3 image (see
>      :ref:`disk_005fimages`).
> @@ -1416,7 +1416,7 @@ DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
>  
>  SRST
>  ``-fsdev local,id=id,path=path,security_model=security_model [,writeout=writeout][,readonly][,fmode=fmode][,dmode=dmode] [,throttling.option=value[,throttling.option=value[,...]]]``
> -  \ 
> +  \
>  ``-fsdev proxy,id=id,socket=socket[,writeout=writeout][,readonly]``
>    \
>  ``-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=writeout][,readonly]``
> @@ -1537,9 +1537,9 @@ DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
>  
>  SRST
>  ``-virtfs local,path=path,mount_tag=mount_tag ,security_model=security_model[,writeout=writeout][,readonly] [,fmode=fmode][,dmode=dmode][,multidevs=multidevs]``
> -  \ 
> +  \
>  ``-virtfs proxy,socket=socket,mount_tag=mount_tag [,writeout=writeout][,readonly]``
> -  \ 
> +  \
>  ``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly]``
>    \
>  ``-virtfs synth,mount_tag=mount_tag``
> @@ -3674,7 +3674,7 @@ DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
>      QEMU_ARCH_ALL)
>  SRST
>  ``-overcommit mem-lock=on|off``
> -  \ 
> +  \
>  ``-overcommit cpu-pm=on|off``
>      Run qemu with hints about host resource overcommit. The default is
>      to assume that host overcommits all resources.
> @@ -4045,7 +4045,7 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
>      QEMU_ARCH_ALL)
>  SRST
>  ``-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]``
> -  \ 
> +  \
>  ``-incoming rdma:host:port[,ipv4][,ipv6]``
>      Prepare for incoming migration, listen on a given tcp port.
>  
> @@ -4753,7 +4753,7 @@ SRST
>                 [...]
>  
>      ``-object secret,id=id,data=string,format=raw|base64[,keyid=secretid,iv=string]``
> -      \ 
> +      \
>      ``-object secret,id=id,file=filename,format=raw|base64[,keyid=secretid,iv=string]``
>          Defines a secret to store a password, encryption key, or some
>          other sensitive data. The sensitive data can either be passed
> diff --git a/qom/object.c b/qom/object.c
> index 6ece96bc2b..30630d789f 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1020,7 +1020,7 @@ static void object_class_foreach_tramp(gpointer key, gpointer value,
>          return;
>      }
>  
> -    if (data->implements_type && 
> +    if (data->implements_type &&
>          !object_class_dynamic_cast(k, data->implements_type)) {
>          return;
>      }
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index aaa46b5bca..df979594c3 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -369,7 +369,7 @@ static inline void t_gen_addx_carry(DisasContext *dc, TCGv d)
>      if (dc->flagx_known) {
>          if (dc->flags_x) {
>              TCGv c;
> -            
> +
>              c = tcg_temp_new();
>              t_gen_mov_TN_preg(c, PR_CCS);
>              /* C flag is already at bit 0.  */
> @@ -402,7 +402,7 @@ static inline void t_gen_subx_carry(DisasContext *dc, TCGv d)
>      if (dc->flagx_known) {
>          if (dc->flags_x) {
>              TCGv c;
> -            
> +
>              c = tcg_temp_new();
>              t_gen_mov_TN_preg(c, PR_CCS);
>              /* C flag is already at bit 0.  */
> @@ -688,7 +688,7 @@ static inline void cris_update_cc_x(DisasContext *dc)
>  }
>  
>  /* Update cc prior to executing ALU op. Needs source operands untouched.  */
> -static void cris_pre_alu_update_cc(DisasContext *dc, int op, 
> +static void cris_pre_alu_update_cc(DisasContext *dc, int op,
>                     TCGv dst, TCGv src, int size)
>  {
>      if (dc->update_cc) {
> @@ -718,7 +718,7 @@ static inline void cris_update_result(DisasContext *dc, TCGv res)
>  }
>  
>  /* Returns one if the write back stage should execute.  */
> -static void cris_alu_op_exec(DisasContext *dc, int op, 
> +static void cris_alu_op_exec(DisasContext *dc, int op,
>                     TCGv dst, TCGv a, TCGv b, int size)
>  {
>      /* Emit the ALU insns.  */
> @@ -1068,7 +1068,7 @@ static void cris_store_direct_jmp(DisasContext *dc)
>      }
>  }
>  
> -static void cris_prepare_cc_branch (DisasContext *dc, 
> +static void cris_prepare_cc_branch (DisasContext *dc,
>                      int offset, int cond)
>  {
>      /* This helps us re-schedule the micro-code to insns in delay-slots
> @@ -1108,7 +1108,7 @@ static void gen_load64(DisasContext *dc, TCGv_i64 dst, TCGv addr)
>      tcg_gen_qemu_ld_i64(dst, addr, mem_index, MO_TEQ);
>  }
>  
> -static void gen_load(DisasContext *dc, TCGv dst, TCGv addr, 
> +static void gen_load(DisasContext *dc, TCGv dst, TCGv addr,
>               unsigned int size, int sign)
>  {
>      int mem_index = cpu_mmu_index(&dc->cpu->env, false);
> @@ -3047,27 +3047,27 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
>   * to give SW a hint that the exception actually hit on the dslot.
>   *
>   * CRIS expects all PC addresses to be 16-bit aligned. The lsb is ignored by
> - * the core and any jmp to an odd addresses will mask off that lsb. It is 
> + * the core and any jmp to an odd addresses will mask off that lsb. It is
>   * simply there to let sw know there was an exception on a dslot.
>   *
>   * When the software returns from an exception, the branch will re-execute.
>   * On QEMU care needs to be taken when a branch+delayslot sequence is broken
>   * and the branch and delayslot don't share pages.
>   *
> - * The TB contaning the branch insn will set up env->btarget and evaluate 
> - * env->btaken. When the translation loop exits we will note that the branch 
> + * The TB contaning the branch insn will set up env->btarget and evaluate
> + * env->btaken. When the translation loop exits we will note that the branch
>   * sequence is broken and let env->dslot be the size of the branch insn (those
>   * vary in length).
>   *
>   * The TB contaning the delayslot will have the PC of its real insn (i.e no lsb
> - * set). It will also expect to have env->dslot setup with the size of the 
> - * delay slot so that env->pc - env->dslot point to the branch insn. This TB 
> - * will execute the dslot and take the branch, either to btarget or just one 
> + * set). It will also expect to have env->dslot setup with the size of the
> + * delay slot so that env->pc - env->dslot point to the branch insn. This TB
> + * will execute the dslot and take the branch, either to btarget or just one
>   * insn ahead.
>   *
> - * When exceptions occur, we check for env->dslot in do_interrupt to detect 
> + * When exceptions occur, we check for env->dslot in do_interrupt to detect
>   * broken branch sequences and setup $erp accordingly (i.e let it point to the
> - * branch and set lsb). Then env->dslot gets cleared so that the exception 
> + * branch and set lsb). Then env->dslot gets cleared so that the exception
>   * handler can enter. When returning from exceptions (jump $erp) the lsb gets
>   * masked off and we will reexecute the branch insn.
>   *
> diff --git a/target/cris/translate_v10.inc.c b/target/cris/translate_v10.inc.c
> index ae34a0d1a3..ad4e213847 100644
> --- a/target/cris/translate_v10.inc.c
> +++ b/target/cris/translate_v10.inc.c
> @@ -299,7 +299,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>  
>              op = CC_OP_LSL;
>              if (imm & (1 << 5)) {
> -                op = CC_OP_LSR; 
> +                op = CC_OP_LSR;
>              }
>              imm &= 0x1f;
>              cris_cc_mask(dc, CC_MASK_NZVC);
> @@ -335,7 +335,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>              LOG_DIS("b%s %d\n", cc_name(dc->cond), imm);
>  
>              cris_cc_mask(dc, 0);
> -            cris_prepare_cc_branch(dc, imm, dc->cond); 
> +            cris_prepare_cc_branch(dc, imm, dc->cond);
>              break;
>  
>          default:
> @@ -487,7 +487,7 @@ static void dec10_reg_mov_pr(DisasContext *dc)
>          return;
>      }
>      if (dc->dst == PR_CCS) {
> -        cris_evaluate_flags(dc); 
> +        cris_evaluate_flags(dc);
>      }
>      cris_alu(dc, CC_OP_MOVE, cpu_R[dc->src],
>                   cpu_R[dc->src], cpu_PR[dc->dst], preg_sizes_v10[dc->dst]);
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index be016b951a..d3f836a0f4 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -967,13 +967,13 @@ static int hvf_accel_init(MachineState *ms)
>      assert_hvf_ok(ret);
>  
>      s = g_new0(HVFState, 1);
> - 
> +
>      s->num_slots = 32;
>      for (x = 0; x < s->num_slots; ++x) {
>          s->slots[x].size = 0;
>          s->slots[x].slot_id = x;
>      }
> -  
> +
>      hvf_state = s;
>      cpu_interrupt_handler = hvf_handle_interrupt;
>      memory_listener_register(&hvf_memory_listener, &address_space_memory);
> diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
> index fdb11c8db9..6fd6e541d8 100644
> --- a/target/i386/hvf/x86.c
> +++ b/target/i386/hvf/x86.c
> @@ -83,7 +83,7 @@ bool x86_write_segment_descriptor(struct CPUState *cpu,
>  {
>      target_ulong base;
>      uint32_t limit;
> -    
> +
>      if (GDT_SEL == sel.ti) {
>          base  = rvmcs(cpu->hvf_fd, VMCS_GUEST_GDTR_BASE);
>          limit = rvmcs(cpu->hvf_fd, VMCS_GUEST_GDTR_LIMIT);
> @@ -91,7 +91,7 @@ bool x86_write_segment_descriptor(struct CPUState *cpu,
>          base  = rvmcs(cpu->hvf_fd, VMCS_GUEST_LDTR_BASE);
>          limit = rvmcs(cpu->hvf_fd, VMCS_GUEST_LDTR_LIMIT);
>      }
> -    
> +
>      if (sel.index * 8 >= limit) {
>          printf("%s: gdt limit\n", __func__);
>          return false;
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 34c5e3006c..8c576febd2 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -63,7 +63,7 @@ static inline uint64_t decode_bytes(CPUX86State *env, struct x86_decode *decode,
>                                      int size)
>  {
>      target_ulong val = 0;
> -    
> +
>      switch (size) {
>      case 1:
>      case 2:
> @@ -77,7 +77,7 @@ static inline uint64_t decode_bytes(CPUX86State *env, struct x86_decode *decode,
>      target_ulong va  = linear_rip(env_cpu(env), env->eip) + decode->len;
>      vmx_read_mem(env_cpu(env), &val, va, size);
>      decode->len += size;
> -    
> +
>      return val;
>  }
>  
> @@ -210,7 +210,7 @@ static void decode_imm_0(CPUX86State *env, struct x86_decode *decode,
>  static void decode_pushseg(CPUX86State *env, struct x86_decode *decode)
>  {
>      uint8_t op = (decode->opcode_len > 1) ? decode->opcode[1] : decode->opcode[0];
> -    
> +
>      decode->op[0].type = X86_VAR_REG;
>      switch (op) {
>      case 0xe:
> @@ -237,7 +237,7 @@ static void decode_pushseg(CPUX86State *env, struct x86_decode *decode)
>  static void decode_popseg(CPUX86State *env, struct x86_decode *decode)
>  {
>      uint8_t op = (decode->opcode_len > 1) ? decode->opcode[1] : decode->opcode[0];
> -    
> +
>      decode->op[0].type = X86_VAR_REG;
>      switch (op) {
>      case 0xf:
> @@ -461,14 +461,14 @@ struct decode_x87_tbl _decode_tbl3[256];
>  static void decode_x87_ins(CPUX86State *env, struct x86_decode *decode)
>  {
>      struct decode_x87_tbl *decoder;
> -    
> +
>      decode->is_fpu = true;
>      int mode = decode->modrm.mod == 3 ? 1 : 0;
>      int index = ((decode->opcode[0] & 0xf) << 4) | (mode << 3) |
>                   decode->modrm.reg;
>  
>      decoder = &_decode_tbl3[index];
> -    
> +
>      decode->cmd = decoder->cmd;
>      if (decoder->operand_size) {
>          decode->operand_size = decoder->operand_size;
> @@ -476,7 +476,7 @@ static void decode_x87_ins(CPUX86State *env, struct x86_decode *decode)
>      decode->flags_mask = decoder->flags_mask;
>      decode->fpop_stack = decoder->pop;
>      decode->frev = decoder->rev;
> -    
> +
>      if (decoder->decode_op1) {
>          decoder->decode_op1(env, decode, &decode->op[0]);
>      }
> @@ -2002,7 +2002,7 @@ static inline void decode_displacement(CPUX86State *env, struct x86_decode *deco
>      int addressing_size = decode->addressing_size;
>      int mod = decode->modrm.mod;
>      int rm = decode->modrm.rm;
> -    
> +
>      decode->displacement_size = 0;
>      switch (addressing_size) {
>      case 2:
> @@ -2115,7 +2115,7 @@ uint32_t decode_instruction(CPUX86State *env, struct x86_decode *decode)
>  void init_decoder()
>  {
>      int i;
> -    
> +
>      for (i = 0; i < ARRAY_SIZE(_decode_tbl1); i++) {
>          memcpy(&_decode_tbl1[i], &invl_inst, sizeof(invl_inst));
>      }
> @@ -2124,7 +2124,7 @@ void init_decoder()
>      }
>      for (i = 0; i < ARRAY_SIZE(_decode_tbl3); i++) {
>          memcpy(&_decode_tbl3[i], &invl_inst_x87, sizeof(invl_inst_x87));
> -    
> +
>      }
>      for (i = 0; i < ARRAY_SIZE(_1op_inst); i++) {
>          _decode_tbl1[_1op_inst[i].opcode] = _1op_inst[i];
> diff --git a/target/i386/hvf/x86_decode.h b/target/i386/hvf/x86_decode.h
> index ef7960113f..c7879c9ea7 100644
> --- a/target/i386/hvf/x86_decode.h
> +++ b/target/i386/hvf/x86_decode.h
> @@ -43,7 +43,7 @@ typedef enum x86_prefix {
>  
>  enum x86_decode_cmd {
>      X86_DECODE_CMD_INVL = 0,
> -    
> +
>      X86_DECODE_CMD_PUSH,
>      X86_DECODE_CMD_PUSH_SEG,
>      X86_DECODE_CMD_POP,
> @@ -174,7 +174,7 @@ enum x86_decode_cmd {
>      X86_DECODE_CMD_CMPXCHG8B,
>      X86_DECODE_CMD_CMPXCHG,
>      X86_DECODE_CMD_POPCNT,
> -    
> +
>      X86_DECODE_CMD_FNINIT,
>      X86_DECODE_CMD_FLD,
>      X86_DECODE_CMD_FLDxx,
> diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
> index 8c05c34f33..fd6a63754d 100644
> --- a/target/i386/hvf/x86_descr.c
> +++ b/target/i386/hvf/x86_descr.c
> @@ -112,7 +112,7 @@ void vmx_segment_to_x86_descriptor(struct CPUState *cpu, struct vmx_segment *vmx
>  {
>      x86_set_segment_limit(desc, vmx_desc->limit);
>      x86_set_segment_base(desc, vmx_desc->base);
> -    
> +
>      desc->type = vmx_desc->ar & 15;
>      desc->s = (vmx_desc->ar >> 4) & 1;
>      desc->dpl = (vmx_desc->ar >> 5) & 3;
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index d3e289ed87..edc7f74903 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -131,7 +131,7 @@ void write_reg(CPUX86State *env, int reg, target_ulong val, int size)
>  target_ulong read_val_from_reg(target_ulong reg_ptr, int size)
>  {
>      target_ulong val;
> -    
> +
>      switch (size) {
>      case 1:
>          val = *(uint8_t *)reg_ptr;
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index 65d4603dbf..168c47fa34 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -143,7 +143,7 @@ static bool test_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
>      if (pae && pt->exec_access && !pte_exec_access(pte)) {
>          return false;
>      }
> -    
> +
>  exit:
>      /* TODO: check reserved bits */
>      return true;
> @@ -175,7 +175,7 @@ static bool walk_gpt(struct CPUState *cpu, target_ulong addr, int err_code,
>      bool is_large = false;
>      target_ulong cr3 = rvmcs(cpu->hvf_fd, VMCS_GUEST_CR3);
>      uint64_t page_mask = pae ? PAE_PTE_PAGE_MASK : LEGACY_PTE_PAGE_MASK;
> -    
> +
>      memset(pt, 0, sizeof(*pt));
>      top_level = gpt_top_level(cpu, pae);
>  
> @@ -184,7 +184,7 @@ static bool walk_gpt(struct CPUState *cpu, target_ulong addr, int err_code,
>      pt->user_access = (err_code & MMU_PAGE_US);
>      pt->write_access = (err_code & MMU_PAGE_WT);
>      pt->exec_access = (err_code & MMU_PAGE_NX);
> -    
> +
>      for (level = top_level; level > 0; level--) {
>          get_pt_entry(cpu, pt, level, pae);
>  
> diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
> index 6f04478b3a..9748220381 100644
> --- a/target/i386/hvf/x86_task.c
> +++ b/target/i386/hvf/x86_task.c
> @@ -1,7 +1,7 @@
>  // This software is licensed under the terms of the GNU General Public
>  // License version 2, as published by the Free Software Foundation, and
>  // may be copied, distributed, and modified under those terms.
> -// 
> +//
>  // This program is distributed in the hope that it will be useful,
>  // but WITHOUT ANY WARRANTY; without even the implied warranty of
>  // MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 5cbcb32ab6..fd33ab4efc 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -88,7 +88,7 @@ void hvf_put_segments(CPUState *cpu_state)
>  {
>      CPUX86State *env = &X86_CPU(cpu_state)->env;
>      struct vmx_segment seg;
> -    
> +
>      wvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_LIMIT, env->idt.limit);
>      wvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_BASE, env->idt.base);
>  
> @@ -105,7 +105,7 @@ void hvf_put_segments(CPUState *cpu_state)
>  
>      hvf_set_segment(cpu_state, &seg, &env->segs[R_CS], false);
>      vmx_write_segment_descriptor(cpu_state, &seg, R_CS);
> -    
> +
>      hvf_set_segment(cpu_state, &seg, &env->segs[R_DS], false);
>      vmx_write_segment_descriptor(cpu_state, &seg, R_DS);
>  
> @@ -126,10 +126,10 @@ void hvf_put_segments(CPUState *cpu_state)
>  
>      hvf_set_segment(cpu_state, &seg, &env->ldt, false);
>      vmx_write_segment_descriptor(cpu_state, &seg, R_LDTR);
> -    
> +
>      hv_vcpu_flush(cpu_state->hvf_fd);
>  }
> -    
> +
>  void hvf_put_msrs(CPUState *cpu_state)
>  {
>      CPUX86State *env = &X86_CPU(cpu_state)->env;
> @@ -178,7 +178,7 @@ void hvf_get_segments(CPUState *cpu_state)
>  
>      vmx_read_segment_descriptor(cpu_state, &seg, R_CS);
>      hvf_get_segment(&env->segs[R_CS], &seg);
> -    
> +
>      vmx_read_segment_descriptor(cpu_state, &seg, R_DS);
>      hvf_get_segment(&env->segs[R_DS], &seg);
>  
> @@ -209,7 +209,7 @@ void hvf_get_segments(CPUState *cpu_state)
>      env->cr[2] = 0;
>      env->cr[3] = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR3);
>      env->cr[4] = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR4);
> -    
> +
>      env->efer = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_IA32_EFER);
>  }
>  
> @@ -217,10 +217,10 @@ void hvf_get_msrs(CPUState *cpu_state)
>  {
>      CPUX86State *env = &X86_CPU(cpu_state)->env;
>      uint64_t tmp;
> -    
> +
>      hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_CS, &tmp);
>      env->sysenter_cs = tmp;
> -    
> +
>      hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_ESP, &tmp);
>      env->sysenter_esp = tmp;
>  
> @@ -237,7 +237,7 @@ void hvf_get_msrs(CPUState *cpu_state)
>  #endif
>  
>      hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_APICBASE, &tmp);
> -    
> +
>      env->tsc = rdtscp() + rvmcs(cpu_state->hvf_fd, VMCS_TSC_OFFSET);
>  }
>  
> @@ -264,15 +264,15 @@ int hvf_put_registers(CPUState *cpu_state)
>      wreg(cpu_state->hvf_fd, HV_X86_R15, env->regs[15]);
>      wreg(cpu_state->hvf_fd, HV_X86_RFLAGS, env->eflags);
>      wreg(cpu_state->hvf_fd, HV_X86_RIP, env->eip);
> -   
> +
>      wreg(cpu_state->hvf_fd, HV_X86_XCR0, env->xcr0);
> -    
> +
>      hvf_put_xsave(cpu_state);
> -    
> +
>      hvf_put_segments(cpu_state);
> -    
> +
>      hvf_put_msrs(cpu_state);
> -    
> +
>      wreg(cpu_state->hvf_fd, HV_X86_DR0, env->dr[0]);
>      wreg(cpu_state->hvf_fd, HV_X86_DR1, env->dr[1]);
>      wreg(cpu_state->hvf_fd, HV_X86_DR2, env->dr[2]);
> @@ -281,7 +281,7 @@ int hvf_put_registers(CPUState *cpu_state)
>      wreg(cpu_state->hvf_fd, HV_X86_DR5, env->dr[5]);
>      wreg(cpu_state->hvf_fd, HV_X86_DR6, env->dr[6]);
>      wreg(cpu_state->hvf_fd, HV_X86_DR7, env->dr[7]);
> -    
> +
>      return 0;
>  }
>  
> @@ -306,16 +306,16 @@ int hvf_get_registers(CPUState *cpu_state)
>      env->regs[13] = rreg(cpu_state->hvf_fd, HV_X86_R13);
>      env->regs[14] = rreg(cpu_state->hvf_fd, HV_X86_R14);
>      env->regs[15] = rreg(cpu_state->hvf_fd, HV_X86_R15);
> -    
> +
>      env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
>      env->eip = rreg(cpu_state->hvf_fd, HV_X86_RIP);
> -   
> +
>      hvf_get_xsave(cpu_state);
>      env->xcr0 = rreg(cpu_state->hvf_fd, HV_X86_XCR0);
> -    
> +
>      hvf_get_segments(cpu_state);
>      hvf_get_msrs(cpu_state);
> -    
> +
>      env->dr[0] = rreg(cpu_state->hvf_fd, HV_X86_DR0);
>      env->dr[1] = rreg(cpu_state->hvf_fd, HV_X86_DR1);
>      env->dr[2] = rreg(cpu_state->hvf_fd, HV_X86_DR2);
> @@ -324,7 +324,7 @@ int hvf_get_registers(CPUState *cpu_state)
>      env->dr[5] = rreg(cpu_state->hvf_fd, HV_X86_DR5);
>      env->dr[6] = rreg(cpu_state->hvf_fd, HV_X86_DR6);
>      env->dr[7] = rreg(cpu_state->hvf_fd, HV_X86_DR7);
> -    
> +
>      x86_update_hflags(env);
>      return 0;
>  }
> @@ -388,7 +388,7 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
>                  intr_type == VMCS_INTR_T_SWEXCEPTION) {
>                  wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_INST_LENGTH, env->ins_len);
>              }
> -            
> +
>              if (env->has_error_code) {
>                  wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_EXCEPTION_ERROR,
>                        env->error_code);
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index 5e5dbb41b0..d824cfcfe7 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -1623,7 +1623,7 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
>      tcg_temp_free_i32(t0);
>      tcg_temp_free_i32(t1);
>  
> -    /* The CC_OP value is no longer predictable.  */ 
> +    /* The CC_OP value is no longer predictable.  */
>      set_cc_op(s, CC_OP_DYNAMIC);
>  }
>  
> @@ -1716,7 +1716,7 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
>          gen_op_ld_v(s, ot, s->T0, s->A0);
>      else
>          gen_op_mov_v_reg(s, ot, s->T0, op1);
> -    
> +
>      if (is_right) {
>          switch (ot) {
>          case MO_8:
> @@ -5353,7 +5353,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  set_cc_op(s, CC_OP_EFLAGS);
>                  break;
>              }
> -#endif        
> +#endif
>              if (!(s->cpuid_features & CPUID_CX8)) {
>                  goto illegal_op;
>              }
> @@ -6398,7 +6398,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x6d:
>          ot = mo_b_d32(b, dflag);
>          tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
> -        gen_check_io(s, ot, pc_start - s->cs_base, 
> +        gen_check_io(s, ot, pc_start - s->cs_base,
>                       SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes) | 4);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
>              gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
> index 6763421ba2..5487696089 100644
> --- a/target/microblaze/mmu.c
> +++ b/target/microblaze/mmu.c
> @@ -53,7 +53,7 @@ static void mmu_flush_idx(CPUMBState *env, unsigned int idx)
>      }
>  }
>  
> -static void mmu_change_pid(CPUMBState *env, unsigned int newpid) 
> +static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
>  {
>      struct microblaze_mmu *mmu = &env->mmu;
>      unsigned int i;
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index f6ff2591c3..1925a93eb2 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -663,7 +663,7 @@ static void dec_div(DisasContext *dc)
>  {
>      unsigned int u;
>  
> -    u = dc->imm & 2; 
> +    u = dc->imm & 2;
>      LOG_DIS("div\n");
>  
>      if (trap_illegal(dc, !dc->cpu->cfg.use_div)) {
> diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
> index 14c3db0f48..fa4f5aee4f 100644
> --- a/target/sh4/op_helper.c
> +++ b/target/sh4/op_helper.c
> @@ -133,7 +133,7 @@ void helper_discard_movcal_backup(CPUSH4State *env)
>  	env->movcal_backup = current = next;
>  	if (current == NULL)
>  	    env->movcal_backup_tail = &(env->movcal_backup);
> -    } 
> +    }
>  }
>  
>  void helper_ocbi(CPUSH4State *env, uint32_t address)
> @@ -146,7 +146,7 @@ void helper_ocbi(CPUSH4State *env, uint32_t address)
>  	{
>  	    memory_content *next = (*current)->next;
>              cpu_stl_data(env, a, (*current)->value);
> -	    
> +	
>  	    if (next == NULL)
>  	    {
>  		env->movcal_backup_tail = current;
> diff --git a/target/xtensa/core-de212/core-isa.h b/target/xtensa/core-de212/core-isa.h
> index 90ac329230..4528dd7942 100644
> --- a/target/xtensa/core-de212/core-isa.h
> +++ b/target/xtensa/core-de212/core-isa.h
> @@ -1,4 +1,4 @@
> -/* 
> +/*
>   * xtensa/config/core-isa.h -- HAL definitions that are dependent on Xtensa
>   *				processor CORE configuration
>   *
> @@ -605,12 +605,12 @@
>  /*----------------------------------------------------------------------
>  				MPU
>    ----------------------------------------------------------------------*/
> -#define XCHAL_HAVE_MPU			0 
> +#define XCHAL_HAVE_MPU			0
>  #define XCHAL_MPU_ENTRIES		0
>  
>  #define XCHAL_MPU_ALIGN_REQ		1	/* MPU requires alignment of entries to background map */
>  #define XCHAL_MPU_BACKGROUND_ENTRIES	0	/* number of entries in background map */
> - 
> +
>  #define XCHAL_MPU_ALIGN_BITS		0
>  #define XCHAL_MPU_ALIGN			0
>  
> diff --git a/target/xtensa/core-sample_controller/core-isa.h b/target/xtensa/core-sample_controller/core-isa.h
> index d53dca8665..de5a5f3ba2 100644
> --- a/target/xtensa/core-sample_controller/core-isa.h
> +++ b/target/xtensa/core-sample_controller/core-isa.h
> @@ -1,4 +1,4 @@
> -/* 
> +/*
>   * xtensa/config/core-isa.h -- HAL definitions that are dependent on Xtensa
>   *				processor CORE configuration
>   *
> @@ -626,13 +626,13 @@
>  /*----------------------------------------------------------------------
>  				MPU
>    ----------------------------------------------------------------------*/
> -#define XCHAL_HAVE_MPU			0 
> +#define XCHAL_HAVE_MPU			0
>  #define XCHAL_MPU_ENTRIES		0
>  
>  #define XCHAL_MPU_ALIGN_REQ		1	/* MPU requires alignment of entries to background map */
>  #define XCHAL_MPU_BACKGROUND_ENTRIES	0	/* number of entries in bg map*/
>  #define XCHAL_MPU_BG_CACHEADRDIS	0	/* default CACHEADRDIS for bg */
> - 
> +
>  #define XCHAL_MPU_ALIGN_BITS		0
>  #define XCHAL_MPU_ALIGN			0
>  
> diff --git a/target/xtensa/core-test_kc705_be/core-isa.h b/target/xtensa/core-test_kc705_be/core-isa.h
> index 408fed871d..382e3f187d 100644
> --- a/target/xtensa/core-test_kc705_be/core-isa.h
> +++ b/target/xtensa/core-test_kc705_be/core-isa.h
> @@ -1,4 +1,4 @@
> -/* 
> +/*
>   * xtensa/config/core-isa.h -- HAL definitions that are dependent on Xtensa
>   *				processor CORE configuration
>   *
> diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
> index 65fddb310d..d856000c16 100644
> --- a/tcg/sparc/tcg-target.inc.c
> +++ b/tcg/sparc/tcg-target.inc.c
> @@ -988,7 +988,7 @@ static void build_trampolines(TCGContext *s)
>              /* Skip the oi argument.  */
>              ra += 1;
>          }
> -                
> +
>          /* Set the retaddr operand.  */
>          if (ra >= TCG_REG_O6) {
>              tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 1362bc6101..45d15fe837 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -872,7 +872,7 @@ void *tcg_malloc_internal(TCGContext *s, int size)
>  {
>      TCGPool *p;
>      int pool_size;
> -    
> +
>      if (size > TCG_POOL_CHUNK_SIZE) {
>          /* big malloc: insert a new pool (XXX: could optimize) */
>          p = g_malloc(sizeof(TCGPool) + size);
> @@ -893,7 +893,7 @@ void *tcg_malloc_internal(TCGContext *s, int size)
>                  p = g_malloc(sizeof(TCGPool) + pool_size);
>                  p->size = pool_size;
>                  p->next = NULL;
> -                if (s->pool_current) 
> +                if (s->pool_current)
>                      s->pool_current->next = p;
>                  else
>                      s->pool_first = p;
> @@ -3093,8 +3093,8 @@ static void dump_regs(TCGContext *s)
>  
>      for(i = 0; i < TCG_TARGET_NB_REGS; i++) {
>          if (s->reg_to_temp[i] != NULL) {
> -            printf("%s: %s\n", 
> -                   tcg_target_reg_names[i], 
> +            printf("%s: %s\n",
> +                   tcg_target_reg_names[i],
>                     tcg_get_arg_str_ptr(s, buf, sizeof(buf), s->reg_to_temp[i]));
>          }
>      }
> @@ -3111,7 +3111,7 @@ static void check_regs(TCGContext *s)
>          ts = s->reg_to_temp[reg];
>          if (ts != NULL) {
>              if (ts->val_type != TEMP_VAL_REG || ts->reg != reg) {
> -                printf("Inconsistency for register %s:\n", 
> +                printf("Inconsistency for register %s:\n",
>                         tcg_target_reg_names[reg]);
>                  goto fail;
>              }
> @@ -3648,14 +3648,14 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
>      nb_iargs = def->nb_iargs;
>  
>      /* copy constants */
> -    memcpy(new_args + nb_oargs + nb_iargs, 
> +    memcpy(new_args + nb_oargs + nb_iargs,
>             op->args + nb_oargs + nb_iargs,
>             sizeof(TCGArg) * def->nb_cargs);
>  
>      i_allocated_regs = s->reserved_regs;
>      o_allocated_regs = s->reserved_regs;
>  
> -    /* satisfy input constraints */ 
> +    /* satisfy input constraints */
>      for (k = 0; k < nb_iargs; k++) {
>          TCGRegSet i_preferred_regs, o_preferred_regs;
>  
> @@ -3713,7 +3713,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
>              /* nothing to do : the constraint is satisfied */
>          } else {
>          allocate_in_reg:
> -            /* allocate a new register matching the constraint 
> +            /* allocate a new register matching the constraint
>                 and move the temporary register into it */
>              temp_load(s, ts, tcg_target_available_regs[ts->type],
>                        i_allocated_regs, 0);
> @@ -3733,7 +3733,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
>          const_args[i] = 0;
>          tcg_regset_set_reg(i_allocated_regs, reg);
>      }
> -    
> +
>      /* mark dead temporaries and free the associated registers */
>      for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
>          if (IS_DEAD_ARG(i)) {
> @@ -3745,7 +3745,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
>          tcg_reg_alloc_bb_end(s, i_allocated_regs);
>      } else {
>          if (def->flags & TCG_OPF_CALL_CLOBBER) {
> -            /* XXX: permit generic clobber register list ? */ 
> +            /* XXX: permit generic clobber register list ? */
>              for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
>                  if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
>                      tcg_reg_free(s, i, i_allocated_regs);
> @@ -3757,7 +3757,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
>                 an exception. */
>              sync_globals(s, i_allocated_regs);
>          }
> -        
> +
>          /* satisfy the output constraints */
>          for(k = 0; k < nb_oargs; k++) {
>              i = def->sorted_args[k];
> @@ -3849,7 +3849,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>  
>      /* assign stack slots first */
>      call_stack_size = (nb_iargs - nb_regs) * sizeof(tcg_target_long);
> -    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) & 
> +    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) &
>          ~(TCG_TARGET_STACK_ALIGN - 1);
>      allocate_args = (call_stack_size > TCG_STATIC_CALL_ARGS_SIZE);
>      if (allocate_args) {
> @@ -3874,7 +3874,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>          stack_offset += sizeof(tcg_target_long);
>  #endif
>      }
> -    
> +
>      /* assign input registers */
>      allocated_regs = s->reserved_regs;
>      for (i = 0; i < nb_regs; i++) {
> @@ -3907,14 +3907,14 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>              tcg_regset_set_reg(allocated_regs, reg);
>          }
>      }
> -    
> +
>      /* mark dead temporaries and free the associated registers */
>      for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
>          if (IS_DEAD_ARG(i)) {
>              temp_dead(s, arg_temp(op->args[i]));
>          }
>      }
> -    
> +
>      /* clobber call registers */
>      for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
>          if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
> @@ -4317,7 +4317,7 @@ void tcg_dump_info(void)
>                  (double)s->code_out_len / tb_div_count);
>      qemu_printf("avg search data/TB  %0.1f\n",
>                  (double)s->search_out_len / tb_div_count);
> -    
> +
>      qemu_printf("cycles/op           %0.1f\n",
>                  s->op_count ? (double)tot / s->op_count : 0);
>      qemu_printf("cycles/in byte      %0.1f\n",
> diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
> index 11d0e777b1..0009e62855 100644
> --- a/tests/tcg/multiarch/test-mmap.c
> +++ b/tests/tcg/multiarch/test-mmap.c
> @@ -17,7 +17,7 @@
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
> - * 
> + *
>   * You should have received a copy of the GNU General Public License
>   * along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> @@ -63,15 +63,15 @@ void check_aligned_anonymous_unfixed_mmaps(void)
>  		size_t len;
>  
>  		len = pagesize + (pagesize * i & 7);
> -		p1 = mmap(NULL, len, PROT_READ, 
> +		p1 = mmap(NULL, len, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> -		p2 = mmap(NULL, len, PROT_READ, 
> +		p2 = mmap(NULL, len, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> -		p3 = mmap(NULL, len, PROT_READ, 
> +		p3 = mmap(NULL, len, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> -		p4 = mmap(NULL, len, PROT_READ, 
> +		p4 = mmap(NULL, len, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> -		p5 = mmap(NULL, len, PROT_READ, 
> +		p5 = mmap(NULL, len, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  
>  		/* Make sure we get pages aligned with the pagesize. The
> @@ -118,7 +118,7 @@ void check_large_anonymous_unfixed_mmap(void)
>  	fprintf(stdout, "%s", __func__);
>  
>  	len = 0x02000000;
> -	p1 = mmap(NULL, len, PROT_READ, 
> +	p1 = mmap(NULL, len, PROT_READ,
>  		  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  
>  	/* Make sure we get pages aligned with the pagesize. The
> @@ -145,14 +145,14 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
>  	for (i = 0; i < 0x2fff; i++)
>  	{
>  		int nlen;
> -		p1 = mmap(NULL, pagesize, PROT_READ, 
> +		p1 = mmap(NULL, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  		fail_unless (p1 != MAP_FAILED);
>  		p = (uintptr_t) p1;
>  		fail_unless ((p & pagemask) == 0);
>  		memcpy (dummybuf, p1, pagesize);
>  
> -		p2 = mmap(NULL, pagesize, PROT_READ, 
> +		p2 = mmap(NULL, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  		fail_unless (p2 != MAP_FAILED);
>  		p = (uintptr_t) p2;
> @@ -162,12 +162,12 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
>  
>  		munmap (p1, pagesize);
>  		nlen = pagesize * 8;
> -		p3 = mmap(NULL, nlen, PROT_READ, 
> +		p3 = mmap(NULL, nlen, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  		fail_unless (p3 != MAP_FAILED);
>  
>  		/* Check if the mmaped areas collide.  */
> -		if (p3 < p2 
> +		if (p3 < p2
>  		    && (p3 + nlen) > p2)
>  			fail_unless (0);
>  
> @@ -191,7 +191,7 @@ void check_aligned_anonymous_fixed_mmaps(void)
>  	int i;
>  
>  	/* Find a suitable address to start with.  */
> -	addr = mmap(NULL, pagesize * 40, PROT_READ | PROT_WRITE, 
> +	addr = mmap(NULL, pagesize * 40, PROT_READ | PROT_WRITE,
>  		    MAP_PRIVATE | MAP_ANONYMOUS,
>  		    -1, 0);
>  	fprintf(stdout, "%s addr=%p", __func__, addr);
> @@ -200,10 +200,10 @@ void check_aligned_anonymous_fixed_mmaps(void)
>  	for (i = 0; i < 40; i++)
>  	{
>  		/* Create submaps within our unfixed map.  */
> -		p1 = mmap(addr, pagesize, PROT_READ, 
> +		p1 = mmap(addr, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
>  			  -1, 0);
> -		/* Make sure we get pages aligned with the pagesize. 
> +		/* Make sure we get pages aligned with the pagesize.
>  		   The target expects this.  */
>  		p = (uintptr_t) p1;
>  		fail_unless (p1 == addr);
> @@ -231,10 +231,10 @@ void check_aligned_anonymous_fixed_mmaps_collide_with_host(void)
>  	for (i = 0; i < 20; i++)
>  	{
>  		/* Create submaps within our unfixed map.  */
> -		p1 = mmap(addr, pagesize, PROT_READ | PROT_WRITE, 
> +		p1 = mmap(addr, pagesize, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
>  			  -1, 0);
> -		/* Make sure we get pages aligned with the pagesize. 
> +		/* Make sure we get pages aligned with the pagesize.
>  		   The target expects this.  */
>  		p = (uintptr_t) p1;
>  		fail_unless (p1 == addr);
> @@ -258,14 +258,14 @@ void check_file_unfixed_mmaps(void)
>  		size_t len;
>  
>  		len = pagesize;
> -		p1 = mmap(NULL, len, PROT_READ, 
> -			  MAP_PRIVATE, 
> +		p1 = mmap(NULL, len, PROT_READ,
> +			  MAP_PRIVATE,
>  			  test_fd, 0);
> -		p2 = mmap(NULL, len, PROT_READ, 
> -			  MAP_PRIVATE, 
> +		p2 = mmap(NULL, len, PROT_READ,
> +			  MAP_PRIVATE,
>  			  test_fd, pagesize);
> -		p3 = mmap(NULL, len, PROT_READ, 
> -			  MAP_PRIVATE, 
> +		p3 = mmap(NULL, len, PROT_READ,
> +			  MAP_PRIVATE,
>  			  test_fd, pagesize * 2);
>  
>  		fail_unless (p1 != MAP_FAILED);
> @@ -307,9 +307,9 @@ void check_file_unfixed_eof_mmaps(void)
>  	fprintf(stdout, "%s", __func__);
>  	for (i = 0; i < 0x10; i++)
>  	{
> -		p1 = mmap(NULL, pagesize, PROT_READ, 
> -			  MAP_PRIVATE, 
> -			  test_fd, 
> +		p1 = mmap(NULL, pagesize, PROT_READ,
> +			  MAP_PRIVATE,
> +			  test_fd,
>  			  (test_fsize - sizeof *p1) & ~pagemask);
>  
>  		fail_unless (p1 != MAP_FAILED);
> @@ -339,7 +339,7 @@ void check_file_fixed_eof_mmaps(void)
>  	int i;
>  
>  	/* Find a suitable address to start with.  */
> -	addr = mmap(NULL, pagesize * 44, PROT_READ, 
> +	addr = mmap(NULL, pagesize * 44, PROT_READ,
>  		    MAP_PRIVATE | MAP_ANONYMOUS,
>  		    -1, 0);
>  
> @@ -349,9 +349,9 @@ void check_file_fixed_eof_mmaps(void)
>  	for (i = 0; i < 0x10; i++)
>  	{
>  		/* Create submaps within our unfixed map.  */
> -		p1 = mmap(addr, pagesize, PROT_READ, 
> -			  MAP_PRIVATE | MAP_FIXED, 
> -			  test_fd, 
> +		p1 = mmap(addr, pagesize, PROT_READ,
> +			  MAP_PRIVATE | MAP_FIXED,
> +			  test_fd,
>  			  (test_fsize - sizeof *p1) & ~pagemask);
>  
>  		fail_unless (p1 != MAP_FAILED);
> @@ -381,7 +381,7 @@ void check_file_fixed_mmaps(void)
>  	int i;
>  
>  	/* Find a suitable address to start with.  */
> -	addr = mmap(NULL, pagesize * 40 * 4, PROT_READ, 
> +	addr = mmap(NULL, pagesize * 40 * 4, PROT_READ,
>  		    MAP_PRIVATE | MAP_ANONYMOUS,
>  		    -1, 0);
>  	fprintf(stdout, "%s addr=%p", __func__, (void *)addr);
> @@ -389,20 +389,20 @@ void check_file_fixed_mmaps(void)
>  
>  	for (i = 0; i < 40; i++)
>  	{
> -		p1 = mmap(addr, pagesize, PROT_READ, 
> +		p1 = mmap(addr, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_FIXED,
>  			  test_fd, 0);
> -		p2 = mmap(addr + pagesize, pagesize, PROT_READ, 
> +		p2 = mmap(addr + pagesize, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_FIXED,
>  			  test_fd, pagesize);
> -		p3 = mmap(addr + pagesize * 2, pagesize, PROT_READ, 
> +		p3 = mmap(addr + pagesize * 2, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_FIXED,
>  			  test_fd, pagesize * 2);
> -		p4 = mmap(addr + pagesize * 3, pagesize, PROT_READ, 
> +		p4 = mmap(addr + pagesize * 3, pagesize, PROT_READ,
>  			  MAP_PRIVATE | MAP_FIXED,
>  			  test_fd, pagesize * 3);
>  
> -		/* Make sure we get pages aligned with the pagesize. 
> +		/* Make sure we get pages aligned with the pagesize.
>  		   The target expects this.  */
>  		fail_unless (p1 == (void *)addr);
>  		fail_unless (p2 == (void *)addr + pagesize);
> @@ -479,7 +479,7 @@ int main(int argc, char **argv)
>          checked_write(test_fd, &i, sizeof i);
>      }
>  
> -	/* Append a few extra writes to make the file end at non 
> +	/* Append a few extra writes to make the file end at non
>  	   page boundary.  */
>      checked_write(test_fd, &i, sizeof i); i++;
>      checked_write(test_fd, &i, sizeof i); i++;
> diff --git a/ui/curses.c b/ui/curses.c
> index a59b23a9cf..ba362eb927 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -1,8 +1,8 @@
>  /*
>   * QEMU curses/ncurses display driver
> - * 
> + *
>   * Copyright (c) 2005 Andrzej Zaborowski  <balrog@zabor.org>
> - * 
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
>   * in the Software without restriction, including without limitation the rights
> diff --git a/ui/curses_keys.h b/ui/curses_keys.h
> index 71e04acdc7..8b62258756 100644
> --- a/ui/curses_keys.h
> +++ b/ui/curses_keys.h
> @@ -1,8 +1,8 @@
>  /*
>   * Keycode and keysyms conversion tables for curses
> - * 
> + *
>   * Copyright (c) 2005 Andrzej Zaborowski  <balrog@zabor.org>
> - * 
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
>   * in the Software without restriction, including without limitation the rights
> diff --git a/util/cutils.c b/util/cutils.c
> index 36ce712271..ce4f756bd9 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -142,7 +142,7 @@ time_t mktimegm(struct tm *tm)
>          m += 12;
>          y--;
>      }
> -    t = 86400ULL * (d + (153 * m - 457) / 5 + 365 * y + y / 4 - y / 100 + 
> +    t = 86400ULL * (d + (153 * m - 457) / 5 + 365 * y + y / 4 - y / 100 +
>                   y / 400 - 719469);
>      t += 3600 * tm->tm_hour + 60 * tm->tm_min + tm->tm_sec;
>      return t;
> 

For the linux-user part:

Acked-by: Laurent Vivier <laurent@vivier.eu>

