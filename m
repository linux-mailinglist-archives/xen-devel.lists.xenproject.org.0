Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061A55F0F6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 00:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357407.585917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6JdS-0007zb-Je; Tue, 28 Jun 2022 22:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357407.585917; Tue, 28 Jun 2022 22:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6JdS-0007wv-Gk; Tue, 28 Jun 2022 22:24:42 +0000
Received: by outflank-mailman (input) for mailman id 357407;
 Tue, 28 Jun 2022 22:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9jI=XD=vivier.eu=laurent@srs-se1.protection.inumbo.net>)
 id 1o6JdQ-0007wp-Dp
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 22:24:40 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 192d91c8-f731-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 00:24:39 +0200 (CEST)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvsMz-1np3Kf27eB-00srJY; Wed, 29 Jun 2022 00:24:34 +0200
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
X-Inumbo-ID: 192d91c8-f731-11ec-bd2d-47488cf2e6aa
Message-ID: <46b178af-57f6-ade9-dea0-f0482d47fb10@vivier.eu>
Date: Wed, 29 Jun 2022 00:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220626094656.15673-1-shentey@gmail.com>
 <20220626094656.15673-2-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220626094656.15673-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SpNdfX8QSasU2Zj6YI+XAVj3/X+6V1WNzWw1qrVY5PUTKnJqE3a
 2T+d26KufAEUmLYQ5OvBneg+brKZ1xqSj44bLjahNgMpA1kq1y64PZYAQwcLQowBzruV5bu
 a+JMy/xu1r0NUB/QA9ZE3YIchtpn0cLNLjaxOV95GeohVHFBmU4/yexbkGfvEIRqhU9xX1F
 fQ9mfJkJVmk1Qto45GZuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:paBfxqDRFb4=:826bM7cbaeOz7uyu4iPfOA
 /rloibS8b+EtqsAZ52CS2h1nf6B2149Ms8hGxpizsg4c/1aUwmrWpdE3hv02ECDg7ajuAUDhu
 yDVQ1zRK8JTT4v/i5JXOk9Q/zl2YKKLt4PB8hRpXDMvxgtPpwR9HItESD7j47FjNyC9tiqPZ3
 p9AombP4PPO0dUGwhMXl9Kdn75AbJ1cgKb5BpF1tqUYNep/pTFJsQdwCLdF+SDE5ciG5P9UAz
 i6NcBFhgXVLkZ0H0AKFMG9F2uWF+T/uHgNLgz4RFajfK2wgQ7E5+SBQjnqW40R9/nh+jTqpYS
 keKfVVWMDKAVItAGVPHuMKYzJcFQ8xoTZsxUUaSalbN+IghxiJYBaRhXBqEqd3lm3L3avcw38
 yuox4/r45PSNHHPNku35OASKxiBl1Q/IWFdH3Kay3zUKNuXCjbMId2Mhu/NzFcpfOHu6yQlZ4
 DGGGg4QrAJ1mg5t+4CpDmX/9OrCf6d2Yc4KJL/cT7gEI1ZTD6ahtSEqGJhRrX8AUWgkg03Zix
 5F31V6khkjUzWOaWVBSCHCl0oT0k8j3zvgPWOT7KXoohZZSJ0IPH8Wz1FZmxLDtnPNSA5yLNZ
 0YcaD9Y06UqmjNxfoEokPTtuZvDXj4sJ+H7TMmpG8SCZW3awC+lAKDDN4BSmFXL/6mDE9NC7w
 QHO0Jvf0Pmm5U39b7qQk0BdrcGC0sieGmupSGFENTwxSq36SHExA1cXMNH75Rrjh+HNfVkzok
 XwDc4JGRo+eZolUd/dO/5fDLIKL8h02cjS4Iaw==

Le 26/06/2022 à 11:46, Bernhard Beschow a écrit :
> The only user of xen_set_pci_link_route() is
> xen_piix_pci_write_config_client() which implements PIIX-specific logic in
> the xen namespace. This makes xen-hvm depend on PIIX which could be
> avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
> order to do this, xen_set_pci_link_route() needs to be stubbable which
> this patch addresses.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/xen/xen-hvm.c       | 7 ++++++-
>   include/hw/xen/xen.h        | 1 +
>   include/hw/xen/xen_common.h | 6 ------
>   stubs/xen-hw-stub.c         | 5 +++++
>   4 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 0731f70410..204fda7949 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -161,11 +161,16 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
>           }
>           v &= 0xf;
>           if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> -            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA, v);
> +            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
>           }
>       }
>   }
>   
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq)
> +{
> +    return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
> +}
> +
>   int xen_is_pirq_msi(uint32_t msi_data)
>   {
>       /* If vector is 0, the msi is remapped into a pirq, passed as
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 0f9962b1c1..13bffaef53 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -21,6 +21,7 @@ extern enum xen_mode xen_mode;
>   extern bool xen_domid_restrict;
>   
>   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq);
>   void xen_piix3_set_irq(void *opaque, int irq_num, int level);
>   void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
>   void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 179741ff79..77ce17d8a4 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -316,12 +316,6 @@ static inline int xen_set_pci_intx_level(domid_t domid, uint16_t segment,
>                                                device, intx, level);
>   }
>   
> -static inline int xen_set_pci_link_route(domid_t domid, uint8_t link,
> -                                         uint8_t irq)
> -{
> -    return xendevicemodel_set_pci_link_route(xen_dmod, domid, link, irq);
> -}
> -
>   static inline int xen_inject_msi(domid_t domid, uint64_t msi_addr,
>                                    uint32_t msi_data)
>   {
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 15f3921a76..743967623f 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -23,6 +23,11 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
>   {
>   }
>   
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq)
> +{
> +    return -1;
> +}
> +
>   void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
>   {
>   }

Applied to my trivial-patches branch.

Thanks,
Laurent

