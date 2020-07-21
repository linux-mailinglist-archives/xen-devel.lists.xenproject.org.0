Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998C2280F9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 15:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxsMJ-0006r3-LG; Tue, 21 Jul 2020 13:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxsMH-0006qs-Sv
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 13:31:01 +0000
X-Inumbo-ID: 6a5c8411-cb56-11ea-851a-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a5c8411-cb56-11ea-851a-bc764e2007e4;
 Tue, 21 Jul 2020 13:31:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so6272520wrh.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wA4StiJY3M6ySPkaaiLbbLONdObdxHPnE+eyooizazk=;
 b=FDdjsOvaHIpuu1paumcnsMndmyNmXefjEluwRRPYc2/ww2AcFUGh4vpkl6yHieiuWv
 9vz0sZP5nYzpm5gns0zYpdOBAoCqDHgvq7MeY8hUOaagqz1f5a7txJdbd/0Q1RzRZS/J
 u8oXadyCiiXGH0Eyhle2fN7WsQLp1dUzBgsnK7IwWJULbLzNpCvgUScIPZSB6Tc9xORB
 sNQb1rNC+RKZsNJw9MAGwzxct648APq9A3DGv7pU8pQ0wW04CESq5iE5MUjcYJexFw4l
 O9RdKzzG2vfNaYwtmL8m18KzsVOiCt8gatntI3ChRbraK039n8BWd6EQEeYKC9dffpg2
 FA8g==
X-Gm-Message-State: AOAM531JiGEykw4ttDJ+XfvUzsw6F824cILFsOBYWIq2p07moYDZV5yM
 Mf/fIHuZFJ6O6RMXiQEYQ30=
X-Google-Smtp-Source: ABdhPJyItXrtXExsO0etBJYKiKWT5KbujiZmvT39sRe/VNkGrSJyAh112MFfEZgvWC00SvHdJUsbOg==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr18496045wrx.62.1595338260188; 
 Tue, 21 Jul 2020 06:31:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n189sm2974451wmf.38.2020.07.21.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 06:30:59 -0700 (PDT)
Date: Tue, 21 Jul 2020 13:30:57 +0000
From: Wei Liu <wl@xen.org>
To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 02/12] tools: switch XEN_LIBXEN* make variables to lower
 case (XEN_libxen*)
Message-ID: <20200721133057.mpwelpyut6nruxcp@liuwe-devbox-debian-v2>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-4-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715162511.5941-4-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 05:25:01PM +0100, Ian Jackson wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> In order to harmonize names of library related make variables switch
> XEN_LIBXEN* names to XEN_libxen*, as all other related variables (e.g.
> CFLAGS_libxen*, SHDEPS_libxen*, ...) already use this pattern.
> 
> Rename XEN_LIBXC to XEN_libxenctrl, XEN_XENSTORE to XEN_libxenstore,
> XEN_XENLIGHT to XEN_libxenlight, XEN_XLUTIL to XEN_libxlutil, and
> XEN_LIBVCHAN to XEN_libxenvchan for the same reason.
> 
> Introduce XEN_libxenguest with the same value as XEN_libxenctrl.
> 
> No functional change.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Looks fine to me.

(Experiment to see how this mail shows up in Gitlab)

Wei.

