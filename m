Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C056214037
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 22:10:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrS1A-0003M1-GV; Fri, 03 Jul 2020 20:10:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krI5=AO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jrS18-0003Lu-EL
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 20:10:38 +0000
X-Inumbo-ID: 429dbe9e-bd69-11ea-8a39-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 429dbe9e-bd69-11ea-8a39-12813bfff9fa;
 Fri, 03 Jul 2020 20:10:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so22957892wmm.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 13:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nBP9r56Uca8qm75PjBZ2ceuLrm/thJOGmaJslfZnOVM=;
 b=mDY/8oJ3XIXJveJAyBwFdMJk2oYCLsTOXOHw7eIv7xoKex/yailXqrW3loYqWkyu3y
 bZLtjANd6T+m4dRxpjwXg2wwhvaZoe8hEvNq/vuSUFXNGSYtwBOY1nNH01AtY/vPaFM3
 CDNY/pcRZx+yyIJ3CsTQNuDQ6P5T94Gxd4BeUXCDYpc2HXMRDdaCnIdPfa8oyDP/7SnC
 7GMoUTvlB58I/Fi4RJqpWOnpsDBcB7nm23ayCtJhQp2GQmPoi3im/8f//UnZ9wvVrdoG
 1ELVzAMb575AT/8kUwHLhKW8uluVGPw0Uuvg8vceTIi4LlW7rvMkfJvwLME0i9bDAU1z
 Ye/A==
X-Gm-Message-State: AOAM531fNWJ3MqcR3d7adPCy1waaJ5IMgi3TxC+NlO9iSR55ta2VATPZ
 T2bN5Bh8BCN3qC3PAds5+bY=
X-Google-Smtp-Source: ABdhPJyH8LwO/TczKagR144GYqjxJ/ZfuwU1Xlj4397SNnNXnHX/OHa3eA3OTqJoqekOUX6b6m9sww==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr39576260wmk.170.1593807037244; 
 Fri, 03 Jul 2020 13:10:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d201sm14079313wmd.34.2020.07.03.13.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:10:36 -0700 (PDT)
Date: Fri, 3 Jul 2020 20:10:35 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH for-4.14] Config: Update QEMU
Message-ID: <20200703201035.pv6nyhydxyzqsuit@liuwe-devbox-debian-v2>
References: <20200703135533.336625-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703135533.336625-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 03, 2020 at 02:55:33PM +0100, Anthony PERARD wrote:
> Backport 2 commits to fix building QEMU without PCI passthrough
> support.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

FWIW:

Acked-by: Wei Liu <wl@xen.org>

