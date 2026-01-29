Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKRIHRLqe2mtJQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:15:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C198EB59D5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217086.1526909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbDq-0001ZP-Us; Thu, 29 Jan 2026 23:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217086.1526909; Thu, 29 Jan 2026 23:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbDq-0001X1-SC; Thu, 29 Jan 2026 23:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1217086;
 Thu, 29 Jan 2026 23:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlbDo-0001Wv-UY
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 23:14:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c48f32-fd68-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 00:14:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC7B843B4B;
 Thu, 29 Jan 2026 23:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD25C4CEF7;
 Thu, 29 Jan 2026 23:14:38 +0000 (UTC)
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
X-Inumbo-ID: 49c48f32-fd68-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769728479;
	bh=IMB7VcEJt6ShCjRGSVjQhf+3NOfNUF0WgNW1SVN78TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YE2wG8vGhqNyQfuQLo5f6BpdTUJtj9DE1my+eiwF87Owy/OelF3TvVLhDJgkFRyWe
	 HkyxFrE52LpRkl22VdPwxdTFthAtG7OFnotuRXaSdz5SAEq+Kke9nMQcG0cwNVrSnu
	 CZ872DPCpX4/GQYU8mWRbRt88zWPhLkN+n2bQ5x9/XGgmlbcixw8pThoAFHehuDGi7
	 tVuD5Zb1bbzzfghO+lgJ7aWSNf/9in1L9e/1srEBRaORq+deFpQLU9Eooc/qFCL45h
	 W6C28UohhhEc8UtrQ+lY+ut5SRP7DDtox6/wMVanvecDasUShy4sQ6iBKdnBTEaeiN
	 +kB2/tSSKbwEQ==
Date: Thu, 29 Jan 2026 15:14:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
In-Reply-To: <69d32e2440b2ef194b4893e5dd29c2dd9d216a90.1769696107.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601291510250.2238666@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <69d32e2440b2ef194b4893e5dd29c2dd9d216a90.1769696107.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1779629773-1769728429=:2238666"
Content-ID: <alpine.DEB.2.22.394.2601291513570.2238666@ubuntu-linux-20-04-desktop>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C198EB59D5
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1779629773-1769728429=:2238666
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2601291513571.2238666@ubuntu-linux-20-04-desktop>

On Thu, 29 Jan 2026, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add chained handling of assigned DT devices to support access-controller
> functionality through SCI framework, so a DT device assign request can be
> passed to firmware for processing and enabling VM access to the requested
> device (for example, device power management through SCMI).
> 
> The SCI access-controller DT device processing is called before the IOMMU
> path. It runs for any DT-described device (protected or not, and even when
> the IOMMU is disabled). The IOMMU path remains unchanged for PCI devices;
> only the DT path is relaxed to permit non-IOMMU devices.
> 
> This lets xl.cfg:"dtdev" list both IOMMU-protected and non-protected DT
> devices:
> 
> dtdev = [
>     "/soc/video@e6ef0000", <- IOMMU protected device
>     "/soc/i2c@e6508000", <- not IOMMU protected device
> ]
> 
> The change is done in two parts:
> 1) call sci_do_domctl() in do_domctl() before IOMMU processing. If
> sci_do_domctl() reports an error other than -ENXIO, treat it as
> authoritative and skip the IOMMU path. A return of -ENXIO indicates
> that SCI did not handle the request and is ignored, allowing the
> existing IOMMU handling to run unchanged;
> 2) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> not fail if DT device is not protected by IOMMU. iommu_do_pci_domctl
> doesn't need to be updated because iommu_do_domctl first tries
> iommu_do_pci_domctl (when CONFIG_HAS_PCI) and falls back to
> iommu_do_dt_domctl only if PCI returns -ENODEV.
> 
> The new dt_device_is_protected() bypass in iommu_do_dt_domctl only
> applies to DT-described devices; SCI parameters are carried via DT
> nodes. PCI devices handled by iommu_do_pci_domctl do not carry DT/SCI
> metadata in this path, so there is no notion of “SCI parameters on a
> non-IOMMU-protected PCI device” for it to interpret or to skip. The PCI
> path should continue to report errors if assignment cannot be performed
> by the IOMMU layer. So we should leave iommu_do_pci_domctl unchanged; the
> SCI/DT-specific relaxations belong only in the DT path. Also SCI handling
> only exists when DT is present.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v9:
> - treat SCI as a gate for XEN_DOMCTL_*assign_device: abort before
> IOMMU if sci_do_domctl() returns an error other than -ENXIO, instead
> of trying to propagate SCI errors after a successful IOMMU
> operation. This avoids partial success and the need for IOMMU rollback.
> - remove early return from do_domctl() in the assign_device
> path to keep RCU handling intact.
> - change IS_ENABLED(*) to #ifdef in sci_do_domctl quard
> 
> Changes in v8:
> - check for CONFIG_ARM_SCI to be ebabled instead of COMFIG_ARM before
> calling sci_do_domctl
> - rework sci_do_domctl call to avoid extra checks, improved error
> handling.
> - do not propagate ret1 if sci_do_domctl returned positive ret
> - updated comment in domctl.c code
> 
> Changes in v7:
> - update domctl to build on both Arm and x86 platforms
> - move ret1 declaration to the top of the function as required by code
> style
> 
> Changes in v6:
> - change iommu_do_domctl and sci_do_domctl command order and
> call sci_do_domctl first which will produce cleaner code path.
> Also dropped changing return code when iommu was disabled in
> iommu_do_domctl.
> 
> Changes in v5:
> - return -EINVAL if mediator without assign_dt_device was provided
> - invert return code check for iommu_do_domctl in
> XEN_DOMCTL_assign_device domctl processing to make cleaner code
> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
> - handle -ENXIO return comde of iommu_do_domctl
> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
> code work the same way it's done in "handle_device" call while
> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
> creation
> - drop return check from sci_assign_dt_device call as not needed
> - do not return EINVAL when addign_dt_device is not set. That is
> because this callback is optional and not implemented in single-agent driver
> 
>  xen/arch/arm/firmware/sci.c             | 36 +++++++++++++++++++++++++
>  xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
>  xen/common/domctl.c                     | 15 +++++++++++
>  xen/drivers/passthrough/device_tree.c   |  6 +++++
>  4 files changed, 71 insertions(+)
> 
> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> index aa93cda7f0..a6c647a09d 100644
> --- a/xen/arch/arm/firmware/sci.c
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -126,6 +126,42 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      return 0;
>  }
>  
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    struct dt_device_node *dev;
> +    int ret = 0;

Should this be -ENXIO?

> +
> +    switch ( domctl->cmd )
> +    {
> +    case XEN_DOMCTL_assign_device:
> +        ret = -ENXIO;
> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> +            break;
> +
> +        if ( !cur_mediator )
> +            break;
> +
> +        if ( !cur_mediator->assign_dt_device )
> +            break;
> +
> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> +                                    domctl->u.assign_device.u.dt.size, &dev);
> +        if ( ret )
> +            return ret;
> +
> +        ret = sci_assign_dt_device(d, dev);
> +
> +        break;
> +
> +    default:
> +        /* do not fail here as call is chained with iommu handling */
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
>  static int __init sci_init(void)
>  {
>      struct dt_device_node *np;
> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> index 3500216bc2..a2d314e627 100644
> --- a/xen/arch/arm/include/asm/firmware/sci.h
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
>   * control" functionality.
>   */
>  int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> +
> +/*
> + * SCI domctl handler
> + *
> + * Only XEN_DOMCTL_assign_device is handled for now.
> + */
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
>  
>  static inline bool sci_domain_is_enabled(struct domain *d)
> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
>      return 0;
>  }
>  
> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    return 0;

This should be -ENXIO?


Other than this:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Those two changes can be done on commit


> +}
> +
>  #endif /* CONFIG_ARM_SCI */
>  
>  #endif /* __ASM_ARM_SCI_H */
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32..b3d1381182 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -29,6 +29,9 @@
>  #include <xen/xvmalloc.h>
>  
>  #include <asm/current.h>
> +#ifdef CONFIG_ARM
> +#include <asm/firmware/sci.h>
> +#endif
>  #include <asm/irq.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> @@ -833,6 +836,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        /*
> +         * Chain SCI DT handling ahead of the IOMMU path so an SCI mediator
> +         * can authorise access-controlled DT devices. Unhandled cases report
> +         * -ENXIO, which is ignored. Any other SCI error aborts before the
> +         * IOMMU path runs.
> +         */
> +#ifdef CONFIG_ARM_SCI
> +        ret = sci_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 && ret != -ENXIO )
> +            break;
> +#endif
> +
>          ret = iommu_do_domctl(op, d, u_domctl);
>          break;
>  
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index f5850a2607..29a44dc773 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>          }
>  
> +        if ( !dt_device_is_protected(dev) )
> +        {
> +            ret = 0;
> +            break;
> +        }
> +
>          ret = iommu_assign_dt_device(d, dev);
>  
>          if ( ret )
> -- 
> 2.34.1
> 
--8323329-1779629773-1769728429=:2238666--

