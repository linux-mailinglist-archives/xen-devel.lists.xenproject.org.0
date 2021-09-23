Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E7416644
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 22:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194559.346610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTUte-0004sg-T3; Thu, 23 Sep 2021 20:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194559.346610; Thu, 23 Sep 2021 20:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTUte-0004qt-Pw; Thu, 23 Sep 2021 20:00:42 +0000
Received: by outflank-mailman (input) for mailman id 194559;
 Thu, 23 Sep 2021 20:00:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTUte-0004qW-2m
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 20:00:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed324d26-1ca8-11ec-ba89-12813bfff9fa;
 Thu, 23 Sep 2021 20:00:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BD1760F6D;
 Thu, 23 Sep 2021 20:00:39 +0000 (UTC)
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
X-Inumbo-ID: ed324d26-1ca8-11ec-ba89-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632427239;
	bh=ds92p2VMyOLjwhV8WhWyt/jh2tUUrZrBeNUkmH+/IbU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ry0mam8DUkXj+3s5eAc/3Fd3TKQfxaQsg8HYBYEYHMRquyizJCqssbGOWGWkP2EIS
	 ogXEH3qHou7nVcDXMzmixXXwcizrawx9wmhw5WFAr2M0ikjaBlcqbz1X5E2h/UTP1G
	 DRLyHeGRyAGeL3BoJc78wXBiSFu8AnWU/h/LfgFV19TZRjiHlnk5gJFJP7iLnhTYGP
	 n21Bz4Tiy3F0nODSEDDo0NyaqFJZKaPl27RMHCzm6EBtqTnD4GLBt8lLxrNuleS+N9
	 ediC35mHvG8vMVLrdv9pghTUul1Uzz11MfeNqNeyta0lzAvuGcaHzuXVoppWwic0QR
	 i/ooFwxhqP3Dg==
Date: Thu, 23 Sep 2021 13:00:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org, 
    sstabellini@kernel.org, jbeulich@suse.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: Re: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
In-Reply-To: <20210923095345.185489-2-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109231252270.17979@sstabellini-ThinkPad-T480s>
References: <20210923095345.185489-1-andr2000@gmail.com> <20210923095345.185489-2-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-36133199-1632427239=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-36133199-1632427239=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
> Re-structure the driver in a way that it can be built for other
> platforms as well.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

The patch looks good to me. Only one thing: on ARM32 I get:

drivers/xen/xen-pciback/conf_space_header.c: In function ‘bar_init’:
drivers/xen/xen-pciback/conf_space_header.c:239:34: warning: right shift count >= width of type [-Wshift-count-overflow]
    bar->val = res[pos - 1].start >> 32;
                                  ^~
drivers/xen/xen-pciback/conf_space_header.c:240:49: warning: right shift count >= width of type [-Wshift-count-overflow]
    bar->len_val = -resource_size(&res[pos - 1]) >> 32;
 
 
resource_size_t is defined as phys_addr_t and it can be 32bit on arm32.


One fix is to surround:

		if (pos && (res[pos - 1].flags & IORESOURCE_MEM_64)) {
			bar->val = res[pos - 1].start >> 32;
			bar->len_val = -resource_size(&res[pos - 1]) >> 32;
			return bar;
		}

with #ifdef PHYS_ADDR_T_64BIT



> ---
> Since v2:
>  - swap the patch order
> Since v1:
>  - Do not move pci_xen_initial_domain as it is x86 specific
> ---
>  arch/x86/include/asm/xen/pci.h     | 18 +------
>  arch/x86/pci/xen.c                 | 74 +----------------------------
>  drivers/xen/pci.c                  | 75 ++++++++++++++++++++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c |  3 +-
>  drivers/xen/xen-pciback/xenbus.c   |  2 +-
>  include/xen/pci.h                  | 28 +++++++++++
>  6 files changed, 108 insertions(+), 92 deletions(-)
>  create mode 100644 include/xen/pci.h
> 
> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
> index 3506d8c598c1..2889f091f459 100644
> --- a/arch/x86/include/asm/xen/pci.h
> +++ b/arch/x86/include/asm/xen/pci.h
> @@ -16,26 +16,10 @@ static inline int pci_xen_hvm_init(void)
>  #endif
>  #if defined(CONFIG_XEN_DOM0)
>  int __init pci_xen_initial_domain(void);
> -int xen_find_device_domain_owner(struct pci_dev *dev);
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> -int xen_unregister_device_domain_owner(struct pci_dev *dev);
>  #else
>  static inline int __init pci_xen_initial_domain(void)
>  {
> -	return -1;
> -}
> -static inline int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	return -1;
> -}
> -static inline int xen_register_device_domain_owner(struct pci_dev *dev,
> -						   uint16_t domain)
> -{
> -	return -1;
> -}
> -static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
> -{
> -	return -1;
> +       return -1;
>  }
>  #endif
>  
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 3d41a09c2c14..4a45b0bf9ae4 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -23,6 +23,7 @@
>  
>  #include <xen/features.h>
>  #include <xen/events.h>
> +#include <xen/pci.h>
>  #include <asm/xen/pci.h>
>  #include <asm/xen/cpuid.h>
>  #include <asm/apic.h>
> @@ -583,77 +584,4 @@ int __init pci_xen_initial_domain(void)
>  	}
>  	return 0;
>  }
> -
> -struct xen_device_domain_owner {
> -	domid_t domain;
> -	struct pci_dev *dev;
> -	struct list_head list;
> -};
> -
> -static DEFINE_SPINLOCK(dev_domain_list_spinlock);
> -static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
> -
> -static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	list_for_each_entry(owner, &dev_domain_list, list) {
> -		if (owner->dev == dev)
> -			return owner;
> -	}
> -	return NULL;
> -}
> -
> -int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -	int domain = -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner = find_device(dev);
> -	if (owner)
> -		domain = owner->domain;
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return domain;
> -}
> -EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
> -
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
> -	if (!owner)
> -		return -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	if (find_device(dev)) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		kfree(owner);
> -		return -EEXIST;
> -	}
> -	owner->domain = domain;
> -	owner->dev = dev;
> -	list_add_tail(&owner->list, &dev_domain_list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
> -
> -int xen_unregister_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner = find_device(dev);
> -	if (!owner) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		return -ENODEV;
> -	}
> -	list_del(&owner->list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	kfree(owner);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
>  #endif
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 224df03ce42e..fc8c1249d49f 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -254,3 +254,78 @@ static int xen_mcfg_late(void)
>  	return 0;
>  }
>  #endif
> +
> +#ifdef CONFIG_XEN_DOM0
> +struct xen_device_domain_owner {
> +	domid_t domain;
> +	struct pci_dev *dev;
> +	struct list_head list;
> +};
> +
> +static DEFINE_SPINLOCK(dev_domain_list_spinlock);
> +static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
> +
> +static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	list_for_each_entry(owner, &dev_domain_list, list) {
> +		if (owner->dev == dev)
> +			return owner;
> +	}
> +	return NULL;
> +}
> +
> +int xen_find_device_domain_owner(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +	int domain = -ENODEV;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	owner = find_device(dev);
> +	if (owner)
> +		domain = owner->domain;
> +	spin_unlock(&dev_domain_list_spinlock);
> +	return domain;
> +}
> +EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
> +
> +int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
> +	if (!owner)
> +		return -ENODEV;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	if (find_device(dev)) {
> +		spin_unlock(&dev_domain_list_spinlock);
> +		kfree(owner);
> +		return -EEXIST;
> +	}
> +	owner->domain = domain;
> +	owner->dev = dev;
> +	list_add_tail(&owner->list, &dev_domain_list);
> +	spin_unlock(&dev_domain_list_spinlock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
> +
> +int xen_unregister_device_domain_owner(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	owner = find_device(dev);
> +	if (!owner) {
> +		spin_unlock(&dev_domain_list_spinlock);
> +		return -ENODEV;
> +	}
> +	list_del(&owner->list);
> +	spin_unlock(&dev_domain_list_spinlock);
> +	kfree(owner);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
> +#endif
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index f8e4faa96ad6..bba527620507 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -19,7 +19,8 @@
>  #include <linux/sched.h>
>  #include <linux/atomic.h>
>  #include <xen/events.h>
> -#include <asm/xen/pci.h>
> +#include <xen/pci.h>
> +#include <xen/xen.h>
>  #include <asm/xen/hypervisor.h>
>  #include <xen/interface/physdev.h>
>  #include "pciback.h"
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index f8ba2903a3ff..bde63ef677b8 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -14,7 +14,7 @@
>  #include <linux/workqueue.h>
>  #include <xen/xenbus.h>
>  #include <xen/events.h>
> -#include <asm/xen/pci.h>
> +#include <xen/pci.h>
>  #include "pciback.h"
>  
>  #define INVALID_EVTCHN_IRQ  (-1)
> diff --git a/include/xen/pci.h b/include/xen/pci.h
> new file mode 100644
> index 000000000000..b8337cf85fd1
> --- /dev/null
> +++ b/include/xen/pci.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __XEN_PCI_H__
> +#define __XEN_PCI_H__
> +
> +#if defined(CONFIG_XEN_DOM0)
> +int xen_find_device_domain_owner(struct pci_dev *dev);
> +int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> +int xen_unregister_device_domain_owner(struct pci_dev *dev);
> +#else
> +static inline int xen_find_device_domain_owner(struct pci_dev *dev)
> +{
> +	return -1;
> +}
> +
> +static inline int xen_register_device_domain_owner(struct pci_dev *dev,
> +						   uint16_t domain)
> +{
> +	return -1;
> +}
> +
> +static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
> +{
> +	return -1;
> +}
> +#endif
> +
> +#endif
> -- 
> 2.25.1
> 
--8323329-36133199-1632427239=:17979--

