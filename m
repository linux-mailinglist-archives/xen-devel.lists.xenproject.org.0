Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247509CFE03
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838679.1254667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFuW-000575-5O; Sat, 16 Nov 2024 10:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838679.1254667; Sat, 16 Nov 2024 10:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFuW-00054e-2E; Sat, 16 Nov 2024 10:20:12 +0000
Received: by outflank-mailman (input) for mailman id 838679;
 Sat, 16 Nov 2024 10:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zi9u=SL=csgroup.eu=christophe.leroy@srs-se1.protection.inumbo.net>)
 id 1tCFuU-0003WR-IW
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:20:10 +0000
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5a611d70-a404-11ef-a0c8-8be0dac302b0;
 Sat, 16 Nov 2024 11:20:07 +0100 (CET)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Xr8mL1R16z9sSd;
 Sat, 16 Nov 2024 11:10:58 +0100 (CET)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS8O0LnxtKc7; Sat, 16 Nov 2024 11:10:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr8mJ5rw4z9sSb;
 Sat, 16 Nov 2024 11:10:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABE338B7A0;
 Sat, 16 Nov 2024 11:10:56 +0100 (CET)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F1qWTVabQRIL; Sat, 16 Nov 2024 11:10:56 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35D3D8B763;
 Sat, 16 Nov 2024 11:10:53 +0100 (CET)
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
X-Inumbo-ID: 5a611d70-a404-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjkzLjE3LjIzNS4xMCIsImhlbG8iOiJwZWdhc2UyLmMtcy5mciJ9
X-Custom-Transaction: eyJpZCI6IjVhNjExZDcwLWE0MDQtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzUyNDA3LjYyMTcyOCwic2VuZGVyIjoiY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1IiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Message-ID: <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
Date: Sat, 16 Nov 2024 11:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Changes made with the following Coccinelle rules:
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>   {
>          pr_info("%s\n", __func__);
>          schedule_delayed_work(&work,
> -               msecs_to_jiffies(1000 * 0));
> +               secs_to_jiffies(0));

Using secs_to_jiffies() is pointless, 0 is universal, should become 
schedule_delayed_work(&work, 0);

>          return 0;
>   }
> 
> diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
> index 6701641bf12d454a770e49abeeb0dea92560e55e..948ea1f5760fed2fa27baf478c97cf98ad5c99a8 100644
> --- a/samples/livepatch/livepatch-shadow-fix1.c
> +++ b/samples/livepatch/livepatch-shadow-fix1.c
> @@ -73,7 +73,7 @@ static struct dummy *livepatch_fix1_dummy_alloc(void)
>                  return NULL;
> 
>          d->jiffies_expire = jiffies +
> -               msecs_to_jiffies(1000 * EXPIRE_PERIOD);
> +               secs_to_jiffies(EXPIRE_PERIOD);
> 
>          /*
>           * Patch: save the extra memory location into a SV_LEAK shadow
> diff --git a/samples/livepatch/livepatch-shadow-mod.c b/samples/livepatch/livepatch-shadow-mod.c
> index 7e753b0d2fa611524c9e2adbe02c8fa3e9b6015e..79296e6ccb119f521e86a121623855d841c9fc5e 100644
> --- a/samples/livepatch/livepatch-shadow-mod.c
> +++ b/samples/livepatch/livepatch-shadow-mod.c
> @@ -102,7 +102,7 @@ static __used noinline struct dummy *dummy_alloc(void)
>                  return NULL;
> 
>          d->jiffies_expire = jiffies +
> -               msecs_to_jiffies(1000 * EXPIRE_PERIOD);
> +               secs_to_jiffies(EXPIRE_PERIOD);

Should fit on a single line, avoid multiple lines when possible.

> 
>          /* Oops, forgot to save leak! */
>          leak = kzalloc(sizeof(*leak), GFP_KERNEL);
> @@ -153,7 +153,7 @@ static void alloc_work_func(struct work_struct *work)
>          mutex_unlock(&dummy_list_mutex);
> 
>          schedule_delayed_work(&alloc_dwork,
> -               msecs_to_jiffies(1000 * ALLOC_PERIOD));
> +               secs_to_jiffies(ALLOC_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>   }
> 
>   /*
> @@ -185,15 +185,15 @@ static void cleanup_work_func(struct work_struct *work)
>          mutex_unlock(&dummy_list_mutex);
> 
>          schedule_delayed_work(&cleanup_dwork,
> -               msecs_to_jiffies(1000 * CLEANUP_PERIOD));
> +               secs_to_jiffies(CLEANUP_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>   }
> 
>   static int livepatch_shadow_mod_init(void)
>   {
>          schedule_delayed_work(&alloc_dwork,
> -               msecs_to_jiffies(1000 * ALLOC_PERIOD));
> +               secs_to_jiffies(ALLOC_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>          schedule_delayed_work(&cleanup_dwork,
> -               msecs_to_jiffies(1000 * CLEANUP_PERIOD));
> +               secs_to_jiffies(CLEANUP_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


> 
>          return 0;
>   }
> 
> --
> 2.34.1
> 

