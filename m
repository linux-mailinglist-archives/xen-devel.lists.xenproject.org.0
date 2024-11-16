Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E389CFD4A
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 09:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838615.1254588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCE2S-0002GN-Tr; Sat, 16 Nov 2024 08:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838615.1254588; Sat, 16 Nov 2024 08:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCE2S-0002Ed-Qj; Sat, 16 Nov 2024 08:20:16 +0000
Received: by outflank-mailman (input) for mailman id 838615;
 Sat, 16 Nov 2024 08:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zi9u=SL=csgroup.eu=christophe.leroy@srs-se1.protection.inumbo.net>)
 id 1tCE2Q-0002EX-OG
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 08:20:14 +0000
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 98fea856-a3f3-11ef-a0c8-8be0dac302b0;
 Sat, 16 Nov 2024 09:20:11 +0100 (CET)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Xr5YN504Vz9sSR;
 Sat, 16 Nov 2024 08:46:16 +0100 (CET)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhQM5FPtGe1r; Sat, 16 Nov 2024 08:46:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr5YN3dzNz9sSL;
 Sat, 16 Nov 2024 08:46:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 60E718B7A0;
 Sat, 16 Nov 2024 08:46:16 +0100 (CET)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DVfL0PgYOHHm; Sat, 16 Nov 2024 08:46:16 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93F818B763;
 Sat, 16 Nov 2024 08:46:12 +0100 (CET)
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
X-Inumbo-ID: 98fea856-a3f3-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjkzLjE3LjIzNS4xMCIsImhlbG8iOiJwZWdhc2UyLmMtcy5mciJ9
X-Custom-Transaction: eyJpZCI6Ijk4ZmVhODU2LWEzZjMtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzQ1MjExLjIyNzE0NSwic2VuZGVyIjoiY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1IiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Message-ID: <856ae9de-0712-4a44-ab3d-9e5077725877@csgroup.eu>
Date: Sat, 16 Nov 2024 08:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
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
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 15/11/2024 à 22:29, Easwar Hariharan a écrit :
> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 11/15/2024 1:26 PM, Easwar Hariharan wrote:
>> This is a series that follows up on my previous series to introduce
>> secs_to_jiffies() and convert a few initial users.[1] In the review for
>> that series, Anna-Maria requested converting other users with
>> Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
>> that use the multiply pattern of either of:
>> - msecs_to_jiffies(N*1000), or
>> - msecs_to_jiffies(N*MSEC_PER_SEC)
>>
>> The entire conversion is made with Coccinelle in the script added in
>> patch 2. Some changes suggested by Coccinelle have been deferred to
>> later parts that will address other possible variant patterns.
>>
>> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>
>> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20241030-open-coded-timeouts-v3-0-9ba123facf88%40linux.microsoft.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cff4857ad28a74e7051f708dd05bc8d45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638673029556700628%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=q%2FHm%2Fal%2FBtK5J4nd%2BqJHNeSJ3f%2B0lVCKzigUUoL2vjw%3D&reserved=0
>> [2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F8734kngfni.fsf%40somnus%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cff4857ad28a74e7051f708dd05bc8d45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638673029556721028%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=PZiR%2B9GSo3Zk7cD85MyM4ZpqvIQtD0lSxd4G1gZ4UFE%3D&reserved=0
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20241115-converge-secs-to-jiffies-v1-0-19aadc34941b%40linux.microsoft.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cff4857ad28a74e7051f708dd05bc8d45%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638673029556732854%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=NXdY%2FTuSufEPcy4ijIj%2F0%2BW3K%2FhkLs2JGu5C1WFMPOM%3D&reserved=0
>>
> 
> Apologies, I missed out on editing the changelog here. v1 included a
> patch that's already been accepted, there are no other changes in v2.

You should refrain from sending such a patch bomb twice in 4 minutes. If 
there is no other change you could have just replied to that already 
included patch to say so.

In any case wait a few days so that people have time to review and 
provide comments.

Christophe

