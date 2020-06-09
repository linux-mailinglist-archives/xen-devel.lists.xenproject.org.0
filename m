Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A21F424F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 19:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jii50-0000f7-Ch; Tue, 09 Jun 2020 17:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F1yn=7W=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1jii4y-0000f0-Un
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 17:30:28 +0000
X-Inumbo-ID: e8969c5e-aa76-11ea-b34d-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8969c5e-aa76-11ea-b34d-12813bfff9fa;
 Tue, 09 Jun 2020 17:30:28 +0000 (UTC)
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MidPj-1j33nt0xi3-00fjqy; Tue, 09 Jun 2020 19:30:22 +0200
Subject: Re: [PATCH v2 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-7-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8fc68c5f-2e62-9466-a6d9-873d6e101286@vivier.eu>
Date: Tue, 9 Jun 2020 19:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kWoyWcZqYkxB7s/T0deiqxYb0mV6anwnErhNnJw54CTKcrEExq5
 Wy7WbIuWz8UHJEoQTXCFHlpBnHOFM1pW0qoRKo0dS9cHB/MtZOzHlLpUvQIDIHSNGyWE2lG
 we8YyRESfkZx/Jy8EBR+N9LwZ5nCp2PPkkTYLXv3W+lHEgcvQlg/mVZPbbMEkrwPpAxHYdA
 K+JIWSB51e8+BYwIJ1t+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LPtC63l6hr4=:5ncwvCU6J8Ds3BACsbmPUi
 jd7q7Ndin7jNNOluNsWo953J7uIhze2CX7FfiWSJ6rcUDUcMfEklKnN2LXhVTaALMLkaUk6am
 WaEKH7IayQPQTQrYNupFvtvKCebjhWgzaEBEHxMybSwEqA0v2Lxs92xDJLIjsKWSHi8p3P58M
 JZHaXForg7YWC3CbXOKarbV8qBwTgc+qTGZMoA9V4enq5BQGXPea0t4+/6hojLAGjgLs1WPaH
 ce8eobiQ6J3YyxG5Y1MJVl1HMTw7Fx1v2jPYoplGQYd/y281p8OZIC0JMB9v7JptZFKyEtoFK
 J8va5k11jdtHNrgB+tp/RqUqCYxMgoubhY50SWB/ibSc+OEh/iVNMAkP0ReXnOFPGhwMfD9sO
 E4/rf3Swmb/v5UGdIl0CkksjUg9XNzwdjzyBBTCr5AklKO92SuXyL/cbZdJP4p0EEbFI5SjoE
 E/zKXf/h8CbYhBcY8sl67Ld9y892W6KbUMHIJyOmWVQJxFHdUByQ6Z4Dwbl+dm9aPuCMmoJJc
 clt9wyg/n7nyn6C+VcoBnRpReZlqcNqalvAbmCsOeLekOZi05ZtWNKcrrfuPHq91XRdsc6CLV
 PrwwAsIgkzVCcIInV/BZMPZ0j4BXzWorzG50OYK2bf6NOd3eO5xswqND8tGX+lyATyRWus6u7
 t3VLSRllDFhfVfm0a/XyKDJ9hibl+maQb8q3ldn3PUlcAyK7s7Lr7JP5o0wnhJtwJ9UoDHIWJ
 iZwFbDefDxfCDLWaGEyDhfzE2mBt+Ww9wPNESIj7wjxtMDoANjRYR1pwHeWUJVNaTw7NYL5aZ
 dfDPp5T6SuLp7QZsjam16lPuAe/f9bd+Q2vY8CVzsskNOBzpVI=
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Le 01/06/2020 à 16:29, Philippe Mathieu-Daudé a écrit :
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/hppa/dino.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 2b1b38c58a..7290f23962 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -542,7 +542,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
>                                  &s->parent_obj.data_mem);
>  
>      /* Dino PCI bus memory.  */
> -    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 1ull << 32);
> +    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
>  
>      b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
>                                &s->pci_mem, get_system_io(),
> @@ -561,7 +561,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
>      }
>  
>      /* Set up PCI view of memory: Bus master address space.  */
> -    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 1ull << 32);
> +    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
>      memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
>                               "bm-system", addr_space, 0,
>                               0xf0000000 + DINO_MEM_CHUNK_SIZE);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

