Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9A2FED35
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72127.129577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bDK-0000ka-Fr; Thu, 21 Jan 2021 14:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72127.129577; Thu, 21 Jan 2021 14:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bDK-0000kB-CR; Thu, 21 Jan 2021 14:45:34 +0000
Received: by outflank-mailman (input) for mailman id 72127;
 Thu, 21 Jan 2021 14:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bDI-0000k6-Hu
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:45:32 +0000
Received: from mail-wr1-f44.google.com (unknown [209.85.221.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c6e79de-9ddd-4172-bd90-a5cf94e6d13f;
 Thu, 21 Jan 2021 14:45:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id 6so2008911wri.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:45:31 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g1sm8882619wrq.30.2021.01.21.06.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:45:29 -0800 (PST)
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
X-Inumbo-ID: 8c6e79de-9ddd-4172-bd90-a5cf94e6d13f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DsDkmWxslKSxmv3JT6Xu8nfRj3PF5HQ+yuFWKH6n+2E=;
        b=LMcBw1WIepZidOgaGwBvCwIU5r7Gox3yq6QnG9ZB8CzmzmH7p1ccEHfpzyYx4QbqhX
         /jpQfVctFg26tAsdAQhWVOw//XG2auoznAO7uGmPs8xYFkkKYwQ/+T1uK+tEZWpqC6DU
         yDxETmBC3CPMjjm4IfR0ojJU0UeDZE1+BT6WNCx6BtlN7KB43dH5sbiJc25TRbHecS1x
         iyMzs8mlmvmcuNWbzPrcAZPToG9gGQtvST2gpxjySgyOY0msQhQ/MrBQkhvehsajWpxH
         wMNzIFHngj1BEUJkdZFhLDr37Nc/WxzN2bd/JmhWIKIXNyv32QINcvTDjtHi/FBlUMCf
         IiyQ==
X-Gm-Message-State: AOAM53302G8Fa3flgrFkbPbNeXGP+ZQZKhZzEc28IXmbsu9ehKMISej7
	2s7ug5aMv3+5Z0w+3LpAibI=
X-Google-Smtp-Source: ABdhPJxYwuEXkb5vtBp6jFte48dOgfxAvP8V+hSnBkA/I1d4HzXE3G0MgGC7xksrgTVuyudwj2RTgw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr14553175wru.197.1611240330602;
        Thu, 21 Jan 2021 06:45:30 -0800 (PST)
Date: Thu, 21 Jan 2021 14:45:27 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 4/7] libxl: add 'name' field to 'libxl_device_pci' in
 the IDL...
Message-ID: <20210121144527.wxvun6y337hbmlpk@liuwe-devbox-debian-v2>
References: <20210105174642.2754-1-paul@xen.org>
 <20210105174642.2754-5-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105174642.2754-5-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 05:46:39PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and modify libxl_pci_bdf_assignable_add/remove/list() to make use of it.
> 
> libxl_pci_bdf_assignable_add() will store the name of the device in xenstore
> if the field is specified (i.e. non-NULL) and libxl_pci_bdf_assignable_remove()
> will remove devices specified only by name, looking up the BDF as necessary.
> 
> libxl_pci_bdf_assignable_list() will also populate the 'name' field if a name
> was stored by libxl_pci_bdf_assignable_add().
> 
> NOTE: This patch also fixes whitespace in the declaration of 'libxl_device_pci'
>       in the IDL.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

