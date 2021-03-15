Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9933C5C0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 19:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98104.185962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLs2R-0006jc-2R; Mon, 15 Mar 2021 18:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98104.185962; Mon, 15 Mar 2021 18:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLs2Q-0006jD-VR; Mon, 15 Mar 2021 18:33:58 +0000
Received: by outflank-mailman (input) for mailman id 98104;
 Mon, 15 Mar 2021 18:33:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Tu=IN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lLs2P-0006j8-65
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 18:33:57 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d77a38b9-cafc-4164-8056-b33122f25845;
 Mon, 15 Mar 2021 18:33:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so12469wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 11:33:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h62sm497868wmf.37.2021.03.15.11.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:33:54 -0700 (PDT)
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
X-Inumbo-ID: d77a38b9-cafc-4164-8056-b33122f25845
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4D7f2OSz3pBZtWumkrjvu3FzHc2w5TORo1dgod9Oghk=;
        b=psYXFXmf0nSldC44n3dTo/y6c4nF5oNwok6GilrHRXQLW6AGICmyKlIAlSR8in6xAe
         YSWPwDU3thSCzeocpU17T1ZQbbV6eMx7kSwOHAXB04LJ+rpCSxRu6NFhSQsT22sUYEbN
         lPuR5P8O0QKpiz18t796drxoOz2sJDZPSxAEq/SeEppq01bgbiVHGiGjaBRCMBQu8cad
         0VX+FEGLhhmOtSsN2vqAf1e5YlVIZOTNEY82AhPhoho1GaTjtbdJaNOiqkh3m3lyu/Af
         h6EhjS9lqOGqRm7XmaU9PPHukwUA+1xHcT34R5QcVsuV1vsOu1JN9h8wUMpbpCGn8FON
         6taw==
X-Gm-Message-State: AOAM5309wnp+xaktHdmhab5xKk2fBLcOj/TxgLchZicWTvtoBoQs/qoR
	yttYViq+DK5PzQVzdIefbYE=
X-Google-Smtp-Source: ABdhPJyVz8IZJotlz//B/XcGOAMtX7OgOSYLI2jgMf6+916FJhatZnoDPedqIGL8Nzi5owJDhWZ9hQ==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr991205wmk.184.1615833234973;
        Mon, 15 Mar 2021 11:33:54 -0700 (PDT)
Date: Mon, 15 Mar 2021 18:33:52 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] automation: remove allow_failure from Alpine Linux jobs
Message-ID: <20210315183352.mtcefvizfnfrxqy3@liuwe-devbox-debian-v2>
References: <20210312210526.14862-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312210526.14862-1-sstabellini@kernel.org>

On Fri, Mar 12, 2021 at 01:05:26PM -0800, Stefano Stabellini wrote:
> Now that the Alpine Linux build jobs complete successfully on staging we
> can remove the "allow_failure: true" tag.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Wei Liu <wl@xen.org>

