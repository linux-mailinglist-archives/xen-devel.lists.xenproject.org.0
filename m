Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9354825440F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:57:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFaw-0000iH-2I; Thu, 27 Aug 2020 10:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFau-0000hV-I5
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:57:24 +0000
X-Inumbo-ID: afecb968-d17d-40c7-8782-7fc57b2accaa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afecb968-d17d-40c7-8782-7fc57b2accaa;
 Thu, 27 Aug 2020 10:57:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3so4927467wrl.4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1jdBQW9Ib6sei7UY+MG218LtvFJSOsqIAIFWPK2Tsrk=;
 b=EpI0qSIWZFc5cII1OyH2ILaH5xr1W+wh5qKT7BctxVjEPPbxut+dq5tHBdCaVrais/
 6j234BMcQwMiGUZcqpQ/GzkiFs7DHaaOhk36sLR9U8hljiYnnBD0UbYE4SbK+fQxGjRI
 9DnA/miqWIdq//7KOUd+2abuvozhJXQ2TSFaAEQ38L2fRF8g6GzVYiL/+lqG7PvlJp2s
 9/3/MENvqxXUYS64IgThtCSEeRM2KTB0H+bzyjtLTPccAfeWfku/0OSSK3zYcaxy9O7f
 ri8GN7kBiTB2EGZjBcpA1NvLb0ybYi9vA29aqWys1u9x5IHYIr/slNDWbqniCJo7W9oT
 C5WQ==
X-Gm-Message-State: AOAM531JQA92h67LwS82wxbhm3CYWzkTa3TE+tbafUX88tXiAxFI2DDh
 XX1e1O/7pLxqnQJFTgrpsZDOt8fgQJo=
X-Google-Smtp-Source: ABdhPJzc1wA37+v3p2YcRx57E6GLQaCyfqKHO/jdPK2qju4ZrDURjleFlRIlTIKUgSZFm3hDMl7qBQ==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr4931334wrn.295.1598525843058; 
 Thu, 27 Aug 2020 03:57:23 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u205sm4648446wmu.6.2020.08.27.03.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:57:22 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:57:21 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 22/38] tools/misc: rename xc_dom.h do xenctrl_dom.h
Message-ID: <20200827105721.4xumx4hduvg55wzu@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-23-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-23-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:03AM +0200, Juergen Gross wrote:
> For being able to disentangle lixenctrl and libxenguest headers
> xc_dom.h will need to be public. Prepare that by renaming xc_dom.h
> to xenctrl_dom.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

