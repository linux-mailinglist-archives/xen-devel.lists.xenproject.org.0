Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA062CECF4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44477.79693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9AD-0001Eh-OX; Fri, 04 Dec 2020 11:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44477.79693; Fri, 04 Dec 2020 11:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9AD-0001EI-Jj; Fri, 04 Dec 2020 11:22:13 +0000
Received: by outflank-mailman (input) for mailman id 44477;
 Fri, 04 Dec 2020 11:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9AC-0001E9-4j
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:22:12 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8efe8e6-0292-45b3-a6bb-d71c78a87573;
 Fri, 04 Dec 2020 11:22:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w206so4510788wma.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:22:11 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n9sm2718841wmd.4.2020.12.04.03.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:22:10 -0800 (PST)
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
X-Inumbo-ID: f8efe8e6-0292-45b3-a6bb-d71c78a87573
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hMbQp47N+fTdzq3TQ2PBzUHDgZt4DnG9ASF2wZjso/Q=;
        b=KIOaIfcHHhj6GBIN+cdEvdmet0+t05hjDj39xGPak1JeotdxtRartEZdxhYE2aMPpg
         ODvKGsCTmm0APW73HQ2APQWd6YebqVeUJBDKzn0vfVylgTaP5/nr5Z8Cky7GMO5ep42k
         iCoNmKho64QVVsAwG1TyUbLI+fTKXZhmNYlLiF01pMBo6dpEkBCtQg/NAAY3nJdtb1rE
         AMmQyAEhjrJRoZJgJFS1MvP3rudWg6lYHf9knHHu7HQsnvwmV0W9XhW4fWp3TOgzvPNf
         r0e5vGqDGULe8MFcjHD7qoNSMfOymyle7XeaYLvE9PfuwFvZHFtGSLQHfQeSmySfT9B4
         Uiqg==
X-Gm-Message-State: AOAM530dUlrOcQ7EGjtvzyth963zXgQ5eczcnYUt7dwOWReF3OFWxadW
	MrntqWETccIj0eW40k9bmv2WS9sKzFc=
X-Google-Smtp-Source: ABdhPJx7OL5bNiNv+Y0H8bcxEMQ/IMnRg85H0pww+Ns+UTNnVfjF5qqiHFmewTuVOttchorNoqxiMw==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3640278wmj.88.1607080930684;
        Fri, 04 Dec 2020 03:22:10 -0800 (PST)
Date: Fri, 4 Dec 2020 11:22:08 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 07/23] libxl: stop using aodev->device_config in
 libxl__device_pci_add()...
Message-ID: <20201204112208.yk5cpm4r4sgcoihs@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-8-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-8-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:18PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to hold a pointer to the device.
> 
> There is already a 'pci' field in 'pci_add_state' so simply use that from
> the start. This also allows the 'pci' (#3) argument to be dropped from
> do_pci_add().
> 
> NOTE: This patch also changes the type of the 'pci_domid' field in
>       'pci_add_state' from 'int' to 'libxl_domid' which is more appropriate
>       given what the field is used for.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

