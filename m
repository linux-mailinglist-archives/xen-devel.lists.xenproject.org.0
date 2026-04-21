Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OITiMzCN52m89wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:44:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6C43C3A5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289060.1569286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCK4-0007yU-NQ; Tue, 21 Apr 2026 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289060.1569286; Tue, 21 Apr 2026 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFCK4-0007x1-IQ; Tue, 21 Apr 2026 14:43:32 +0000
Received: by outflank-mailman (input) for mailman id 1289060;
 Tue, 21 Apr 2026 14:43:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFCK2-0007wv-P1
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:43:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFCK2-007ug8-5n
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:43:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e78cfe-5cb7-0a2a0a5109dd-0a2a45039320-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:43:30 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e78d11-672d-0a2a45030019-d155dd34e892-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:43:29 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so2969269f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 07:43:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a174sm42278601f8f.18.2026.04.21.07.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 07:43:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776782609; x=1777387409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kScOhYjXmwFJgN4m8kBjWwOXFEoFlDk5G23Q0aVMLsE=;
        b=Xbg+4VC/4lTUAS2/7ZeHHGic18cDuwHeP1iuNKWV6FjUSVGYeO6d7356NGJBDd2SHL
         tLXrpaza3mIvgxHERBjZDy6YQyixoOhM3knvCeLXbip/ZjdYlu58r2ERtiGgWrdTE+2L
         lI5sd6DKOqGKCBUzVnErBFF956qMOxz5JXxFpKJrGJ72ra7KlxL8gL2ADYw61SKZ1QJN
         Hs0mV9ii0PxEH/L2ECiUeLOf6vmUodV4IH5b21vj9tKZt3N0VKdYWGljHYndfk+oF5Mb
         EoNGpp8ozEg/LJz0QsHBtJsn5uFGFHyDJrREiqSLKxNUn4TpHxQCBtXw5o0Tr8MU1fNR
         4J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782609; x=1777387409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kScOhYjXmwFJgN4m8kBjWwOXFEoFlDk5G23Q0aVMLsE=;
        b=SdYg1e4cRJgX630o6bIowHiL25e6ga9x3xdzcl7BS/9uWYmqZ/FDXCPnO/s/TUKQYA
         ZPl5GR8oE6dO9zCEEA4WRcqk66a/XigfJ10Oz/gWWuCGbQLUGvAf/yr1l2VUfF/Grliy
         d2BKJocAcEMEfhRFwgu1OqCaurmYtWqOQqXoZpgXqWl6L+cLTEfj5N838ql/5T76r8+0
         m1xyc9qk4vnECcjiPaPL4JTthhtY4SzqlxEihNh5BEH3ANx7sVcfBefkPUxxR+4PIXLl
         8Xr4obMAN3miIIlHzIXPdhC99OJrAxLyhqnKUCVLARh2C+tlh5pKHuZIvPoOkWRg/h24
         h+nA==
X-Forwarded-Encrypted: i=1; AFNElJ8MnMtpAGWWkET6ndEasK73gjYUdhY2pPsnF4K0uZsaA3HYJMqKAvTz0Q4IAevlDc9w493AI6573RU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVFT4gTF28Fp7R4PJAHihSXdffRwXCUFoUHfUhV/KNrxy9mzFN
	0PzrcGXUhhUGOnIAkePBuUu22LpuxkZ5Yawiuqb7Xcerf3I/IP7o+9yVHsVg7Xx+TQ==
X-Gm-Gg: AeBDietpkM2Q9wKGJH+gsp1rPK7+hS3bH7i2wyqJNRqJ9dkSAabXu14ZVqygL+DKVPp
	+mucQi0iP8i0YYtTos0B29g20Sv7QG+A9ZFg7vRAfP+28ITiDc2IY+/H8oJohcBjTAGS3hylCtZ
	2F+mVRjBeHtztvVpRVov8iqQeh5xIwn+ArQzwo+OHkY48+pqB/l0T5J2fZYaTlB+utW8Al1n8h+
	VNAqvVYKE51dMxXGzZAmaFcLFaeIedDt/j10JuBmJmb0lpQW19dPd/xIMlMF69xNXPvMVd4qOLX
	2QC77+jQMTQCY3OddiDfwwhsQgsChPpMEY9lWxlcYX1B7SZp1gwHd8wh8UfR8Lf6S24joOrSkxq
	U4zEpRaVXqqkX0j5CXsVBnRT8gn8pF0AuYfb2iLfIJNeUsamAoKdCk4WsUCt0EDiYzPTbeltSCF
	rSVUWpSyjXa8O0a00H+FWCzPI2iLi+N3l/9LKPswtuZXQqIQ/6NxxR+m9SGqa/5ReQHvfzIcQuK
	DJqunkPEZs3LAeDvR5h1Ruqwg==
X-Received: by 2002:a05:6000:184d:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43fe3dd958amr29287479f8f.21.1776782609257;
        Tue, 21 Apr 2026 07:43:29 -0700 (PDT)
Message-ID: <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
Date: Tue, 21 Apr 2026 16:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776782609-A1F7A938-DAF3DDC5/0/0
X-purgate-type: clean
X-purgate-size: 8962
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A5D6C43C3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 16:01, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register. Also force VFs to
> always use emulated reads for command register, this is needed to
> prevent some drivers accidentally unmapping BARs.

This apparently refers to the change to vpci_init_header(). Writes are
already intercepted. How would a read lead to accidental BAR unmap? Even
for writes I don't see how a VF driver could accidentally unmap BARs, as
the memory decode bit there is hardwired to 0.

> Discovery of VFs is
> done by Dom0, which must register them with Xen.

If we intercept control register writes, why would we still require
Dom0 to report the VFs that appear?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

First S-o-b doesn't match From: - is that correct?

> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += cap.o
>  obj-y += vpci.o header.o rebar.o
> +obj-y += sriov.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o

I understand the one line with multiple objects is unhelpful here, but
for new additions (like was the case with cap.o) I think we want to
respect alphabetical ordering, excluding the one odd line.

> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2026 Citrix Systems R&D
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +#include <xsm/xsm.h>
> +#include "private.h"
> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)
> +{
> +    int vf_idx;
> +    unsigned int i;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +    unsigned int sriov_pos = pci_find_ext_capability(pf_pdev,
> +                                                     PCI_EXT_CAP_ID_SRIOV);
> +    uint16_t offset = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_OFFSET);
> +    uint16_t stride = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_STRIDE);
> +
> +    vf_idx = vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + offset);
> +    if ( vf_idx < 0 )
> +        return -EINVAL;

Why is underflow checked for, but too large a value isn't?

> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /= stride;
> +    }

What if stride is 0 and there are multiple VFs?

> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;
> +        bars[i].guest_addr = bars[i].addr;
> +        bars[i].size = physfn_vf_bars[i].size;
> +        bars[i].type = physfn_vf_bars[i].type;
> +        bars[i].prefetchable = physfn_vf_bars[i].prefetchable;

This may end up quite a bit easier to read if &bar[i] and &physfn_vf_bars[i]
were latched into local variables. It might further help if the = were all
aligned with one another.

> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
> +{
> +    struct pci_dev *vf_pdev;
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +
> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
> +    {
> +        rc = vpci_modify_bars(vf_pdev, cmd, false);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
> +                    &vf_pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        vf_pdev->vpci->header.guest_cmd &= ~PCI_COMMAND_MEMORY;
> +        vf_pdev->vpci->header.guest_cmd |= (cmd & PCI_COMMAND_MEMORY);

As mentioned elsewhere as well, this bit is supposed to be 0 for VFs.

> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +    int rc;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_mem_enabled == mem_enabled )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    if ( mem_enabled && !new_mem_enabled )
> +        map_vfs(pdev, 0);

Why are {new_,}enabled not also taken into account here?

> +    if ( !enabled && new_enabled )
> +    {
> +        size_vf_bars(pdev, sriov_pos, (uint64_t *)data);

(The cast is generally unnecessary here. If you want to keep it, I
think a comment is needed.)

> +        /*
> +         * Only update the number of active VFs when enabling, when
> +         * disabling use the cached value in order to always remove the same
> +         * number of VFs that were active.
> +         */
> +        sriov->num_vfs = pci_conf_read16(pdev->sbdf,
> +                                         sriov_pos + PCI_SRIOV_NUM_VF);
> +    }
> +
> +    if ( !mem_enabled && new_mem_enabled )
> +    {
> +        rc = map_vfs(pdev, PCI_COMMAND_MEMORY);

Same here.

> +        if ( rc )
> +            map_vfs(pdev, 0);
> +    }
> +
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +int vpci_vf_init_header(struct pci_dev *vf_pdev)

I think this would better move (up or down), to not sit in the middle of
PF functions.

> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc = 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;

Looking at the sole call site, this apparently wants to be an assertion.

> +    pf_pdev = vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);

The caller doesn't guarantee this, does it?

> +    rc = vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
> +    {
> +        rc = vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false);

Doesn't VF enable also need to be set for the BARs to be mapped?

> +        if ( rc )
> +            return rc;
> +
> +        vf_pdev->vpci->header.guest_cmd |= PCI_COMMAND_MEMORY;

But the bit is required to be zero in the VF command register.

> +    }
> +
> +    return rc;
> +}
> +
> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    ASSERT(!pdev->info.is_virtfn);

Where's the check that prevents this from triggering? Aiui if
vpci_init_capabilities() finds an SR-IOV capability in a VF's config
space, it'll call here.

> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;

Can't this be an assertion? (In fact I was wondering why the caller,
which already had to find the capability, doesn't pass the position.)

> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    unsigned int pos;
> +    int rc;
> +
> +    if ( !pdev->vpci->sriov )
> +        return 0;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +    ASSERT(list_empty(&pdev->vf_list));

What guarantees this latter property?

> +    if ( !hide )
> +    {
> +        XFREE(pdev->vpci->sriov);
> +        return 0;
> +    }
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);

As was explained in 9ebba62ca843 ("vPCI/ReBAR: improve cleanup") and
d734babf8bc3 ("vPCI: re-init extended-capabilities when MMCFG
availability changed"), you may not call this function during cleanup.

Jan

