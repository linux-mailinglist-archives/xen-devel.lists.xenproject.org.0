Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257E25FC2C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIGm-0001Rq-Te; Mon, 07 Sep 2020 14:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFIGl-0001Rc-Nx
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:37:19 +0000
X-Inumbo-ID: 888c7459-1324-4650-834f-bde9c16e047e
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 888c7459-1324-4650-834f-bde9c16e047e;
 Mon, 07 Sep 2020 14:37:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l9so14433120wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UI/5TJ/HsDRPXAnnNz3V6Emygz4w/4FB+KIokptzaSo=;
 b=IEMQ7VUwSKfnEBj8cfrk7y/DUj/3bouSdokXGYqbtfVVeLYCE/wKJHSb6pmOcCiF/3
 IUnYartfI7a4COFTlB/2jZn0ajgBmgOjJvFH8KKBWxZx2qWf6GHEdjI9pkOozLo9rbZk
 c5ncqrF+wfyxpBEa6o122J8N254ozcNQ1usp3wo0fmHVh38ZYDEoHDezk4CLDCB/txGY
 kQWHMzFsAFu0ocmZRH600WR2H6HB1W306CAdPocuvieiuITQN6+f6ae7LN0TTeLXCkZV
 W2/rwJuS31PGB753X+7wkczK/kM5FcaWWIAmd/Qg7FxDSe4n/HdowA4aD7C0HvWIQxh5
 paAQ==
X-Gm-Message-State: AOAM530ElPeg1h4EELBkuXCEvUbY8QlkGxvKQRrTTcNyqIk46M04msZN
 B2wJo00YiOTBE8gauI35G2YTe6hSSoo=
X-Google-Smtp-Source: ABdhPJwuKbmBLtcBcm81zqmO9diLdIMuEr6R7zeKE9qh9jIS1nUKv7HMAGLc4sNHTkOPLYAC2x6gXQ==
X-Received: by 2002:a1c:67d4:: with SMTP id b203mr9068137wmc.120.1599489438407; 
 Mon, 07 Sep 2020 07:37:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s5sm28792998wrm.33.2020.09.07.07.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:37:17 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:37:16 +0000
From: Wei Liu <wl@xen.org>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] tools/hotplug: Extend dhcpd conf, init and arg files
 search
Message-ID: <20200907143716.bof3wjwfjtz6jveo@liuwe-devbox-debian-v2>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <c4fc61f8e5549565a853c5cd2371e68a9f48a258.1597920095.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4fc61f8e5549565a853c5cd2371e68a9f48a258.1597920095.git.diego.sueiro@arm.com>
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

On Thu, Aug 20, 2020 at 12:01:11PM +0100, Diego Sueiro wrote:
> Newer versions of the ISC dhcp server expect the dhcpd.conf file
> to be located at /etc/dhcp directory.
> 
> Also, some distributions and Yocto based ones have these installation
> paths by default: /etc/init.d/{isc-dhcp-server,dhcp-server} and
> /etc/default/dhcp-server.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Acked-by: Wei Liu <wl@xen.org>

