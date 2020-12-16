Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F92DC5DD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 19:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55546.96675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpbAB-0000Cy-6w; Wed, 16 Dec 2020 18:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55546.96675; Wed, 16 Dec 2020 18:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpbAB-0000CZ-3j; Wed, 16 Dec 2020 18:04:35 +0000
Received: by outflank-mailman (input) for mailman id 55546;
 Wed, 16 Dec 2020 18:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxtY=FU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpbA9-0000CU-Fu
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 18:04:33 +0000
Received: from mail-wm1-f44.google.com (unknown [209.85.128.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45c4374f-7c42-4406-9527-55091ace2ebb;
 Wed, 16 Dec 2020 18:04:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id x22so3216596wmc.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Dec 2020 10:04:32 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u6sm4374227wrm.90.2020.12.16.10.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 10:04:31 -0800 (PST)
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
X-Inumbo-ID: 45c4374f-7c42-4406-9527-55091ace2ebb
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kf6zKszwv9FQVxm0z3BUXLUYBr/LMl3PQ4xL4HdNhYE=;
        b=Cd5VEKxL6Qa6hzJc6kd53d6ft8XjisCvOr61J/VZ5F2x1EFaq82Kroc3VYDLx0tsIv
         Glynw6FUvoVcKWOUhNgpVhl3HRCWWzRh5NY2XrxENZVVerTn9RTrMRCwSCTzSbKaKeks
         ZcbhFjSRch+8gNDVhHQTmr4XsTMHKGWNjfAFXExa+kH/wtdntbc1S5cfmmt3hFkAe68c
         mT/5K2Y2zX974ovNkj2amNMN+n+Aw3u1fElLeIGfz+WwUy9cDyoQBmcBIyQDYc3PVe0a
         BtgDTglxL1WvSlEvRvXC3Hte+KKyw1W8/YWQGf2duwTPWKfakWAtYRnjBHvG5cq0O20l
         3wAg==
X-Gm-Message-State: AOAM530NZLJftumLRDk/Sorui2EwQhUhHk2Z4O5zMe5kIkWeWKkPQRpJ
	ziRRQteI6p+B3ajVwHN6i98=
X-Google-Smtp-Source: ABdhPJyE1rgjLPn3X92s8gsMtf2dnyOxvEco5DITm2I6PUOZTUkyMVihMAp8ydpspIoHgxztjk/kpg==
X-Received: by 2002:a05:600c:255:: with SMTP id 21mr4520138wmj.69.1608141871924;
        Wed, 16 Dec 2020 10:04:31 -0800 (PST)
Date: Wed, 16 Dec 2020 18:04:29 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Message-ID: <20201216180429.r4szd5wzhlwqoxpi@liuwe-devbox-debian-v2>
References: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org>
 <19ed8894-23f7-0f9d-f3c4-1d5ea5bc0c02@citrix.com>
 <20201216104357.wcggzckdii76d4iz@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216104357.wcggzckdii76d4iz@liuwe-devbox-debian-v2>
User-Agent: NeoMutt/20180716

On Wed, Dec 16, 2020 at 10:43:57AM +0000, Wei Liu wrote:
> Paul, are you able to cook up a patch today? If not I will revert the
> offending patch(es).
> 

I've reverted the offending 8 patches for now.

Wei.

