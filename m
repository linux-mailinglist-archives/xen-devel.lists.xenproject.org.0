Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9B24068A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 15:25:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k57nY-000262-W3; Mon, 10 Aug 2020 13:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZ4s=BU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k57nX-00025x-I9
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 13:25:07 +0000
X-Inumbo-ID: 8aff9d79-ce8a-49db-9ca3-6e496c3b5f98
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aff9d79-ce8a-49db-9ca3-6e496c3b5f98;
 Mon, 10 Aug 2020 13:25:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c80so7621089wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 06:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ynUFJpbuM6ihmRdtWyzhJzCORfgz4nGuPongSlaZv0=;
 b=NIBOsaFZ6GP76OLaoKWeGu0BNpz8/mM5cjcZTJ2gXHbQabksQGTlzc25cq4BCWujcS
 1w3Ld61R7I47gHUjz6Ovg2C1lq8ZeEY95SonsDFV4rmJYXeARj2q+1Z4CDTvSSF5Y3ev
 BjH3YXY6XJ48qnO3DgvgMujNqK5r7DiIncZOCWGj+t0QM5tkoseBy1aidaCDuPFwUmpe
 OQwxkIbTzI9igJq+EbuorZ9g3faMyyDPxKzzH3vP0AZHaLHeOTaqGn0s17IF/h/Iq9go
 wefCpqzqZ3lP1Bmz1k1fFqJxBEdnsvxOvHO8hDOlZ8s1sJhUrAHqOShLggtJiu6N+gpF
 AvrA==
X-Gm-Message-State: AOAM533dzQk2FihvY7PgOnheZ2NRs5/mDGXrfPSfOx64OZwfJFbif30M
 GOEQ5ypL1+eVn3shVi/O4kc=
X-Google-Smtp-Source: ABdhPJxTFYoBHUlKdDg8jHrQxr+2M+BeoEWH256LiDRgkZF5vPDvJht2VdQM3tRFcMsIIcjUiX6SAg==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr24773204wmj.84.1597065905735; 
 Mon, 10 Aug 2020 06:25:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 126sm22079956wme.42.2020.08.10.06.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:25:04 -0700 (PDT)
Date: Mon, 10 Aug 2020 13:25:03 +0000
From: Wei Liu <wl@xen.org>
To: CS17B006 ARNAB DUTTA <cs17b006@iittp.ac.in>
Subject: Re: Xen VMI APIs
Message-ID: <20200810132503.fywmbihmaadaj45i@liuwe-devbox-debian-v2>
References: <CA+_ggFiM+1i9BH2m5+WCgEjjzLXLS6x8823FyuL1JBBO3wc4RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ggFiM+1i9BH2m5+WCgEjjzLXLS6x8823FyuL1JBBO3wc4RA@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 10, 2020 at 06:10:17PM +0530, CS17B006 ARNAB DUTTA wrote:
> Respected Sir/Ma'm
> I am Arnab and I am currently writing rust bindings for xen vmi APIs for a
> project known as Libmicrovmi which aims to provide unified vmi APIs for
> various hypervisors. I am facing some difficulty regarding setting up the
> event system in the sense that after enabling monitoring for events, on
> polling I get a return value of 1, but xenevtchn_pending() returns a value
> -1, which probably means it cannot get a port with pending events. I am
> really confused and need help here.
> 

If you can, please post your code.

Also, you can check why eenevtchn_pending returns -1 by reading kernel /
hypervisor code and adding a few debug prints.

Wei.

> Thanking you
> 
> With regards
> Arnab Dutta
> Computer Science and Engineering Department
> Indian Institute of Technology, Tirupati, India
> Ph no. 8420771531

