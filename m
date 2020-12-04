Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B02CECFA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44481.79704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9AX-0001LK-2f; Fri, 04 Dec 2020 11:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44481.79704; Fri, 04 Dec 2020 11:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9AW-0001Kl-UZ; Fri, 04 Dec 2020 11:22:32 +0000
Received: by outflank-mailman (input) for mailman id 44481;
 Fri, 04 Dec 2020 11:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9AV-0001KX-56
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:22:31 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7d81e9d-cfc1-4165-ae47-1e04633e2b61;
 Fri, 04 Dec 2020 11:22:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s8so4952463wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:22:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a18sm3083500wrr.20.2020.12.04.03.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:22:29 -0800 (PST)
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
X-Inumbo-ID: a7d81e9d-cfc1-4165-ae47-1e04633e2b61
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QaAGpOLtOeW0sBjlbj9vrd9UFJyXaMeS7bsIQ1Sellg=;
        b=ucW8ZQBXVROEQkdUz8Y51G1dgY4weGhpRxZHpA9TP54vQ09sV27bpM9q4Bx5A6n9KW
         lnqQeBF9ZdKrjTjKkR6tEj8jDb749a62WYzd2Eih9jThuyuE5Oj73hfbAs3pFzZ51lhT
         faHjf9juy5rL8MVUMmftckGrlaDgm6Sja/I173IJaG1N9xE742A3SJ9f6bQlOWXiTfgP
         YToy1gRa2V2EP7o1zjVveIjS4MoKCnzgaSlrGIVTweF/kl0cAL6L4ZVYKBT6PdP29VN1
         /QubjZ4cCHVd17AxacE599UXhy5QNP9hu/1WmHGIzJHC9MO4KWYra3wu3BLSiIm7lVno
         mJjA==
X-Gm-Message-State: AOAM530r0XymC0ZVDUesfvWwNUnXENj77KrGIiUZhV9OXIsKJaF/+FXg
	SYQ2xL4BwHGPHxM0Yupfxt4=
X-Google-Smtp-Source: ABdhPJxaX4CsriLCeDHKZU8DTOd/eSknGyzSp5MnikhvLbzfkv5H5pM6qfFxfygHmmBhYnRQbncpvw==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr4335273wre.341.1607080949686;
        Fri, 04 Dec 2020 03:22:29 -0800 (PST)
Date: Fri, 4 Dec 2020 11:22:27 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 08/23] libxl: generalise 'driver_path' xenstore access
 functions in libxl_pci.c
Message-ID: <20201204112227.zpnm5qjlbzwgnks7@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-9-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-9-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:19PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> For the purposes of re-binding a device to its previous driver
> libxl__device_pci_assignable_add() writes the driver path into xenstore.
> This path is then read back in libxl__device_pci_assignable_remove().
> 
> The functions that support this writing to and reading from xenstore are
> currently dedicated for this purpose and hence the node name 'driver_path'
> is hard-coded. This patch generalizes these utility functions and passes
> 'driver_path' as an argument. Subsequent patches will invoke them to
> access other nodes.
> 
> NOTE: Because functions will have a broader use (other than storing a
>       driver path in lieu of pciback) the base xenstore path is also
>       changed from '/libxl/pciback' to '/libxl/pci'.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

