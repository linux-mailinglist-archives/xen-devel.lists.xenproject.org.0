Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99825445E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:35:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGBv-0004qh-Ff; Thu, 27 Aug 2020 11:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGBu-0004qU-0Q
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:35:38 +0000
X-Inumbo-ID: 3035a322-8909-49cd-8050-cfc32fcec547
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3035a322-8909-49cd-8050-cfc32fcec547;
 Thu, 27 Aug 2020 11:35:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k15so1258729wrn.10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=scs70OMx80TheKvjUGaSe5etep1ppunw5MdWfzlcBOE=;
 b=EMmTBZ6ZbdnDc3PsGqjomwh7jeSTZMgo1c0RoTnFf61Gc5BLLowGP5BNHC5eRMBwfV
 PtzLhrRhBpS8RpYQNKryt8Bw2jerGuT1M2Tv8xg+1XBGvlY5X+wBo+6rlGjx2nk3VZHI
 zLrd3u1zA8jW3HQHlUjr/WDAaPQ7JN/8u/9P/61xNgm2BGc6qe/WIJaTLvBzL7D7IeDs
 6/4RNqysHI9sabKXMk8wx6dPXEvRQwvV6IeSiU9/T5CR5IRZ36CLcMqjWDMP0YJPHOta
 AmCXQ+iMHZHDCLqUoh1myjv5Jf9y3cQSq97irYWVDTM7giPLTbLf805OH6x0SyF+ic9X
 kabA==
X-Gm-Message-State: AOAM5308naDCBKdtHFSbJNY6Z3p2fU6FEmgL622ABDoxXmd4Uu/b+lLh
 SDPy5q1D+BF022+fi4VMwt8=
X-Google-Smtp-Source: ABdhPJxhf7M6kNrgMNIVCXKAxZBC1V1dfChCOUW6FJ9vqLURwUWtFvMaJONC6rzPw2QeL3RjRUtdjA==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr19512020wrp.230.1598528136235; 
 Thu, 27 Aug 2020 04:35:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g16sm5752572wrs.88.2020.08.27.04.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:35:35 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:35:34 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 29/38] tools: split libxenvchan into new
 tools/libs/vchan directory
Message-ID: <20200827113534.bc6wy2rgxcojl5wt@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-30-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-30-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:10AM +0200, Juergen Gross wrote:
> There is no reason why libvchan is not placed in the tools/libs
> directory.
> 
> At the same time move libxenvchan.h to a dedicated include directory
> in tools/libs/vchan in order to follow the same pattern as the other
> libraries in tools/libs.
> 
> As tools/libvchan now contains no library any longer rename it to
> tools/vchan.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

