Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F52CED27
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44586.79907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Pb-0004Nf-P5; Fri, 04 Dec 2020 11:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44586.79907; Fri, 04 Dec 2020 11:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Pb-0004N9-Lo; Fri, 04 Dec 2020 11:38:07 +0000
Received: by outflank-mailman (input) for mailman id 44586;
 Fri, 04 Dec 2020 11:38:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Pa-0004Mt-As
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:38:06 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8f23af4-1ce7-447c-9a20-7347d57d853b;
 Fri, 04 Dec 2020 11:38:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 23so5004503wrc.8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:38:05 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l8sm3031676wmf.35.2020.12.04.03.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:38:04 -0800 (PST)
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
X-Inumbo-ID: d8f23af4-1ce7-447c-9a20-7347d57d853b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vmPUvN8VywZHRkKgOrY9KaFFX4boj2ETYu4jbuWNrYE=;
        b=dJ1mtobzv/8zu+PlNTOtSLv+E0/W8M0oYMbAwBOFB61ftQBgpwEnw59cNSQRrYEQHl
         fWjRazoKbkyw2noJMSPZL6IjmWcIvIhwO1OgJQZR7fMf5+xDynpGhQ2h+n1m3tT5/rn/
         dN8y40K1mkxuelba96P9MlmBN84lkeoBgGIXmktoo0967T2DsvmJxc6n5kE11DjME9oe
         J3c9phwJgELUohUV5O55wzr9v/zXdGpUN8RfpQRsMKD4UM4V3HMKLfDdOLIdv1HUHMaY
         aVSdLUrrsBMGJyAGTPRFM5u/Syp9ci/L/LU3o7AQOgikgIYecT0lTjSZb5fImV93IsQQ
         OMMg==
X-Gm-Message-State: AOAM533wWNmCrdSPoGR6dZNXlxrToamyVsOmBh7VJfAWa9NQ74rGEvJR
	uVPkb8cPYT7wE+MKHggCVuM=
X-Google-Smtp-Source: ABdhPJyRe8U1OPjHMiB/16PKPnvBYXJOHShk+Oqjph1TAHfwZf0E1D86yMkA5JSO9T71n8fx2acibw==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr4390966wrw.139.1607081884865;
        Fri, 04 Dec 2020 03:38:04 -0800 (PST)
Date: Fri, 4 Dec 2020 11:38:03 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 22/23] docs/man: modify xl-pci-configuration(5) to add
 'name' field to PCI_SPEC_STRING
Message-ID: <20201204113803.qikiaxzlkjcwljw6@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-23-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-23-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:33PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Since assignable devices can be named, a subsequent patch will support use
> of a PCI_SPEC_STRING containing a 'name' parameter instead of a 'bdf'. In
> this case the name will be used to look up the 'bdf' in the list of assignable
> (or assigned) devices.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

