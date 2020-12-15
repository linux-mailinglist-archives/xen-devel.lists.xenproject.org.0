Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89662DB0D3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54369.94421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnl-0008OU-Gk; Tue, 15 Dec 2020 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54369.94421; Tue, 15 Dec 2020 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnl-0008O3-Dc; Tue, 15 Dec 2020 16:03:49 +0000
Received: by outflank-mailman (input) for mailman id 54369;
 Tue, 15 Dec 2020 16:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCnk-0008Nw-7b
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:03:48 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77f90baf-5a0a-4be8-858f-52affeb32876;
 Tue, 15 Dec 2020 16:03:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 190so7118269wmz.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:03:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l1sm37788545wrq.64.2020.12.15.08.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:03:46 -0800 (PST)
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
X-Inumbo-ID: 77f90baf-5a0a-4be8-858f-52affeb32876
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/XS+iYso1pLvM2m44w9x3fZSoxfXT53+l9cFnhg15RY=;
        b=p0rtbXqHLDsWBcmz+/XCZdpZqLTqfVzOL537uEWU2wBL/VhQ1svYzdVV/46XcL8TRL
         NQFj5Vf6VMNvJPUip8xxQvrm3fWgOFdNWcdHJY29KZ5bSqkE3TDwR1/BuYuQawQ69NPV
         VFC65vPhXHNS+1orjnqIjCES/ta2PcWWUO7hksEN0R6a8ndM7LuvrPb2MwXBKRHhlARX
         8nw5fY142OfCzsYAFUdNtkN25VNWWyRv3KQLMVgicBCRgFbS6V1/GM0wuqWgSxlAT2/i
         i6SD6YPprgfQGh+EbHG+ImTf0tSFGPotCs/Z4LWbOELa3TCRO6CQdklE7VIovvedrNSS
         8yPg==
X-Gm-Message-State: AOAM532S3zsE3xBMmRCtxXVKaaZ9IH63APB8sQqrySt3yfsncYXokVw/
	yDiRsb/Ml5IUMvlGM4EqK+8=
X-Google-Smtp-Source: ABdhPJyo/9Njv2vs85nX4cq/IsXRnEE7iT/+fLW+8A5VW5kWQ2EyeNQ3fJUy5Pzl8ioT6/V5BgXcXQ==
X-Received: by 2002:a1c:dd07:: with SMTP id u7mr17937542wmg.51.1608048226859;
        Tue, 15 Dec 2020 08:03:46 -0800 (PST)
Date: Tue, 15 Dec 2020 16:03:44 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 23/25] xl: support naming of assignable devices
Message-ID: <20201215160344.4j333d23wj6egmyq@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-24-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-24-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:31PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch converts libxl to use libxl_pci_bdf_assignable_add/remove/list/
> list_free() rather than libxl_device_pci_assignable_add/remove/list/
> list_free(), which then allows naming of assignable devices to be supported.
> 
> With this patch applied 'xl pci-assignable-add' will take an optional '--name'
> parameter, 'xl pci-assignable-remove' can be passed either a BDF or a name and
> 'xl pci-assignable-list' will take a optional '--show-names' flag which
> determines whether names are displayed in its output.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

