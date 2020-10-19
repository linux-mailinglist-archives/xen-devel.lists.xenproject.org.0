Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49F2922EE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8605.23063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPWA-0005on-3w; Mon, 19 Oct 2020 07:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8605.23063; Mon, 19 Oct 2020 07:23:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPWA-0005oS-0n; Mon, 19 Oct 2020 07:23:42 +0000
Received: by outflank-mailman (input) for mailman id 8605;
 Mon, 19 Oct 2020 07:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUPW8-0005oM-U5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:23:40 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 840569d3-30a6-44ab-9c17-a072b9b8341a;
 Mon, 19 Oct 2020 07:23:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id q5so11632142wmq.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:23:39 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p9sm15195256wma.12.2020.10.19.00.23.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 00:23:38 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUPW8-0005oM-U5
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:23:40 +0000
X-Inumbo-ID: 840569d3-30a6-44ab-9c17-a072b9b8341a
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 840569d3-30a6-44ab-9c17-a072b9b8341a;
	Mon, 19 Oct 2020 07:23:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id q5so11632142wmq.0
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Yfcbj1U2V9MXMVv6f17g69PJ8r9vg/TmZ0vVVq4aOuw=;
        b=g5EQYaV7J/oYzm6yaMgs124XnLHS5mGI531XFf/o3EB+m+nN50W3zIPjbZcaFImcOt
         c4h3XQCqfa0mb5+hlDWT+c3h4Q3PCyilhAggiidp9W/IRLfJmpYkFSk9131beJjtrmPB
         utUhFQRSwHN8TZamk2ieJcJuOot/kdR65dWx9dX5BwJTLMpFGADGJCcBGGdV9zm/vNqQ
         kzogwG+sicy0tA3LPi/lfnQyDKJCoNrYetR36nl0u5+r+UgL6u6VEYvxvZuuk8DZfQeM
         d0TraeVJc8Aznu6vREtNyT/TbtzLGv6V6bDj+jKmyJeZ6u57n9EbKwLFYKoyqkXrorVH
         l8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=Yfcbj1U2V9MXMVv6f17g69PJ8r9vg/TmZ0vVVq4aOuw=;
        b=C7ieIYNBck0Gdo8xipxcSNCajjZ453AR1NVQ0CpFXcvtPE8G68IBMGVl6pcVxumMVJ
         YUcP3NV0iskqSbORegx96EVCpXtL54yf53M5FLLfVw6iPuc7QuDNKsq+uHDsi8OG3JMK
         OfZZZCG25l0s19m31Rllg/M0r0sN/r7T+/9A7HQ7/nCoraYMn0iBypeCNNZwYNjrT/UF
         3YhdoX0F0EbO4ugyTIaFa60pHPm20jfnjbD5a3uk9tHYaxLK/2iJg+b/iCSSpYrtArCd
         6Jt2FPGFrael7CYX8hYyMDjWdjgLFNPb7ssvsyYhDJbPkDxz1FqibPP4K4azvTA27DBB
         Lq/Q==
X-Gm-Message-State: AOAM532yn2SVXtzwXtAEOLfMuAI+gi/7lfj1Xge8nbVcaV6OnSbLlHZO
	66EqQYRJKpUBK+tRyScLccs=
X-Google-Smtp-Source: ABdhPJzXujww7LqkUau/9jCXuYo1aHObW4z53PsBF42iRS+ri+3+VsQDWFzruHwRW+f1D1TBbXcF1A==
X-Received: by 2002:a1c:1f87:: with SMTP id f129mr16435034wmf.182.1603092218907;
        Mon, 19 Oct 2020 00:23:38 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id p9sm15195256wma.12.2020.10.19.00.23.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 00:23:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20201005094905.2929-1-paul@xen.org> <20201005094905.2929-3-paul@xen.org> <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org>
In-Reply-To: <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org>
Subject: RE: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
Date: Mon, 19 Oct 2020 08:23:36 +0100
Message-ID: <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH+ubxU5MmdI1NaD6dn626TcODZdgGmi3hFAim7XvWpL9smcA==
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 16 October 2020 16:47
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Ian Jackson
> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
> 
> Hi Paul,
> 
> On 05/10/2020 10:49, Paul Durrant wrote:
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 791f0a2592..75e855625a 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
> >                                    */
> >   };
> >
> > +/*
> > + * XEN_DOMCTL_iommu_ctl
> > + *
> > + * Control of VM IOMMU settings
> > + */
> > +
> > +#define XEN_DOMCTL_IOMMU_INVALID 0
> 
> I can't find any user of XEN_DOMCTL_IOMMU_INVALID. What's the purpose
> for it?
> 

It's just a placeholder. I think it's generally safer that a zero opcode value is invalid.

> [...]
> 
> > diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> > index b21c3783d3..1a96d3502c 100644
> > --- a/xen/include/xsm/xsm.h
> > +++ b/xen/include/xsm/xsm.h
> > @@ -106,17 +106,19 @@ struct xsm_operations {
> >       int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
> >       int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
> >       int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
> > -    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t
> end, uint8_t access);
> > +    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t
> end, uint8_t access);
> 
> I can't figure out what changed here. Is it an intended change?
> 

No, I'll check and get rid of it.

  Paul

> >
> > -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> > +#if defined(CONFIG_HAS_PASSTHROUGH)
> > +    int (*iommu_ctl) (struct domain *d, unsigned int op);
> > +#if defined(CONFIG_HAS_PCI)
> >       int (*get_device_group) (uint32_t machine_bdf);
> >       int (*assign_device) (struct domain *d, uint32_t machine_bdf);
> >       int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
> >   #endif
> > -
> > -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> > +#if defined(CONFIG_HAS_DEVICE_TREE)
> >       int (*assign_dtdevice) (struct domain *d, const char *dtpath);
> >       int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
> > +#endif
> >   #endif
> 
> Cheers,
> 
> --
> Julien Grall


