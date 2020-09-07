Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2925FBE1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:13:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFHtF-0007B8-MQ; Mon, 07 Sep 2020 14:13:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFHtE-0007B3-66
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:13:00 +0000
X-Inumbo-ID: 264dca9a-e5cb-491a-b500-2c5e8d9e2b0c
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 264dca9a-e5cb-491a-b500-2c5e8d9e2b0c;
 Mon, 07 Sep 2020 14:12:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b79so14351958wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZC5r0bttobRAPUXd5Ad4BWxBqDrGSWLOT5jqzRl97P8=;
 b=WNpGwX/YtXl12qznmljdIEwWbOJyNI3h0aNZDsZ1+hy8IH+mhG7QTiKvk+WMWaANkP
 U2dzP1UmuXqGBLrNWP+F3WBtO9tznGvw3LFFu2te464TqK9GaPTsIBEpehLVoww6EBWA
 PB7HKlG3DlH4eqoOS7Y9aABUhJe8gNag1UlEVdzfWzyr4OFC+blQVdQChhjtIcnWeT7I
 i/oI2jolmqlEuv/BBMxh6acWVZXqSjUEdZsQc3NCGnwUBjxQxQGE0BZXdAFeaIumpDgW
 oJWHr2DqR+/tOTo8WO8oQroysfmn3MamA1LwfhFOz2bntuyOdlQgVGiCK+DZ4VyBfTf+
 WRnQ==
X-Gm-Message-State: AOAM533YX6lx0Fy0ZTpV0TXdO6C2QCJtRdkCcAB9ZE5TrMslRlDDgR0b
 OJlK9TYSB6pOQLd/4MF5Lkw=
X-Google-Smtp-Source: ABdhPJy4+P4Kl+eKlLSDtcVxM3TixgKk5bU/CZPIc6iS/CY+4JERf0mqAaT9mSFo+yco3fSaVecuSQ==
X-Received: by 2002:a1c:2cd7:: with SMTP id
 s206mr21781889wms.165.1599487977304; 
 Mon, 07 Sep 2020 07:12:57 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z13sm28962355wro.97.2020.09.07.07.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:12:56 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:12:55 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libgnttab/freebsd: add tools libs.h
Message-ID: <20200907141255.yar3dh2t2qynhwss@liuwe-devbox-debian-v2>
References: <20200907101805.58458-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200907101805.58458-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 07, 2020 at 12:18:05PM +0200, Roger Pau Monne wrote:
> In order to get the ROUNDUP macro, or else the build fails. I assume
> ROUNDUP would previously get included from a different header.
> 
> Seeing as Linux does explicitly include libs.h do the same for
> FreeBSD.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

And applied.

