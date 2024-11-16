Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ACA9CFE10
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838708.1254688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFy4-0002wB-3H; Sat, 16 Nov 2024 10:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838708.1254688; Sat, 16 Nov 2024 10:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFy3-0002th-Vw; Sat, 16 Nov 2024 10:23:51 +0000
Received: by outflank-mailman (input) for mailman id 838708;
 Sat, 16 Nov 2024 10:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqBH=SL=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1tCFy2-0002tb-QI
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:23:50 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca97f14-a404-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 11:23:46 +0100 (CET)
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8kEV-1t87Dv2SuX-00FywX; Sat, 16
 Nov 2024 11:23:22 +0100
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
X-Inumbo-ID: dca97f14-a404-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy43Mi4xOTIuNzgiLCJoZWxvIjoibW91dC53ZWIuZGUifQ==
X-Custom-Transaction: eyJpZCI6ImRjYTk3ZjE0LWE0MDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzUyNjI2LjUyMTY1Niwic2VuZGVyIjoibWFya3VzLmVsZnJpbmdAd2ViLmRlIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731752603; x=1732357403; i=markus.elfring@web.de;
	bh=eoB4Zba0oDILq/GyWjNIQLXHlVmq6QUNlZtjwtBqfrw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tnnl91YQA9DSUV2bdoeF4YOzfbARJimu/tmTDLNdMzul1FlQPw5QAAWt1drAk3Ad
	 UaqUN1luEW9vrGmy5mWB1wRipPzGEoQ4902WuRX35XoQbOkOHx7N5kAyldxyp9LLl
	 1Vk/5239bUtdx8q/sqWvpw2IyfOhJfBK8McXtVpLEuSCNU5mE6cKsy0/6jClBDTUM
	 m+oUTX9sbL6OWR2KY3c7lHUrA/8zzFHEyHN37tBZ9WKhIaGnQCYZaZ/dESL4qqWra
	 HEE9nF1GNM2k2tc67GtBgE+9Wvrb9QIWtacHHbvnKxQVdIEh90Izoix70o+OBS4Mn
	 VfNCU6GXLXJcQEmlEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <9088f9a2-c4ab-4098-a255-25120df5c497@web.de>
Date: Sat, 16 Nov 2024 11:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies
 script
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
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
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ozemPo5Q9OPy+/gWIfbNb/yTAwp7zpbaqzDjn4mcTmOYffBLZAH
 E0gCP/qnqze9l4Bx97cEhIN2OOovptOgRBkBUi+bKyV+a6ol7S4atoRxVmjqBCc2g41VI8a
 ROXhUKP5mlUoyzcJqOavJdVAoW8iKSPURqEhcga4JsnmJm/Pjl1vO+foxZw0grHWEblCrYI
 LJ17n1lYaEdE61JhX5uvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cqxyRecUHWI=;mdNOJxMPXJ1GyzF//eKGdLZ+Q8F
 gZOm7zXyKp5nkSwMIvY2D1Pf29OTgIQNnEk2sxWaloC9j5qlT3qQUm44Qe1eN8K2TrIb7Ylam
 rbOIjXCI16gwyjr6u6Tm4wzXx3QEqIRDJ6vPTxa1qCHZ5nXH9awzzielfDD+nIYBqn+NysMC0
 QZsEszMBUB9IXfIsHktBfi8cBsv+k0746M1afH1AQnbUe7vbWDpvJQfebcg6n+Wz3fvdqxIZD
 kSPPyScjl7oMRh9gl8//4l2V7VzBO9LPR7x4sdROj+PLFL3oFRJx+0h1y9SyUqJ0GnPpxdEL0
 PMzZq88Rt40rnD8qxMQHh7I/uNcMzG6WX18JYqJkBzSmPhgPNeCMeiVI23Ufs+Q4nUJ3qhDsK
 0p5vEIj2tML+6DTh9sRN/Vkr1Nv2iQxQGIWmrKuhxE6H4MNkCnw+r/vzSC3EjHoSsbQuNjTP7
 r+pzwFQBW5yKjimU/E0otnHQxITegw0hqubdGvkG7V+M9Xbvv+rLAmjIvBciAuyFg9KBmCLA8
 CWrj3n83t/hiJIglwxY4Dk0jEZxvykwS9+BkMPoCtPW+iQ8gW/25w94Qj8e0xURq8TAcN0dXU
 AuweP7ynvWG484eB8hCbKDvioN+mlpMsRwjC2FQlrRm4HHD/6yeo6jL47sG63P4yysOuS2zfg
 IN1JwCXmYpKMSvSbVFw4XwyvjYvlKQDYKIw85OFcoZ0jKCnyiqcKt/8cDr+RhTK1EOdwwhDck
 OYb6KgYNVujGNSJD3nwWyFRxhnrOGI6zg/KUG07nQrZrZUdDjSpdUqLqFAptM+j5kRW2zaeV7
 aAINj3gIMOnIF9IxH3vxoaq7UZVlr1ioWkWYi8cog6WCU27yEI6la8XQh2utvVDIt3r9tDYKA
 xoMAYChjmKcdRYrZMLRfSf6EiCXhz9YR9r6L9u2NSImvIGamFAFskjhIg

Why is a change description missing here?


=E2=80=A6
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
=E2=80=A6
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)

I suggest to take another look at corresponding development documentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.12-rc7#n71

Will the attention grow for the proper usage of operation modes
according to the tool =E2=80=9Ccoccicheck=E2=80=9D?


=E2=80=A6
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft

Should personal details and company names be better distinguished in such =
information?


> +//
> +// Keywords: secs, seconds, jiffies

May a (blank) comment line be omitted here?


> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)

I suggest to take a SmPL code variant (like the following)
better into account.


@depends on patch@
constant C;
@@
-msecs_to_jiffies
+secs_to_jiffies
 (C
- * \( 1000 \| MSEC_PER_SEC \)
 )


Can any expressions become relevant besides =E2=80=9Cconstants=E2=80=9D?

Regards,
Markus

