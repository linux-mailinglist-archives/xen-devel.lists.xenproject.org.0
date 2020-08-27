Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D525440B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFa4-0000VL-1P; Thu, 27 Aug 2020 10:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFa2-0000VG-M0
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:56:30 +0000
X-Inumbo-ID: 8361defd-be9f-4905-a103-e02d34a42b05
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8361defd-be9f-4905-a103-e02d34a42b05;
 Thu, 27 Aug 2020 10:56:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c15so4906620wrs.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5rjIZjs5sKhegGOIRscf6viRVFphHZyButNs2zYUFU=;
 b=PRiE0s6DFvK7/yzdHzp3PSKdggMXZnAbcVekgReRPZvNN00DVfNSH46jLT5tB0qVMz
 Moo8e2mTvPeW10/tYtMJvrv3LnUIotR/Az6Y8ipIE0JMoq4A8NTb5BIww8r/VDhB0Wrd
 Cajw76ufxaxDFtbKHw8iZIsiF2FFEIeN7AmNHlK0hrKEu/OZkIk4PuyNAPKo1K9H1LiO
 o6KSlbo0+EErTpJRJ/oRyO7cx53CelCFmzGq3nOZm2h14qpA4avV3HqXAvZtbjT/te0S
 N7lwBaS9kppknJg0914Tw7uuGPZHNJ/hTDz1ljgTsrT27eoOv2zHVSJO+PvFVDbZsxME
 6BbA==
X-Gm-Message-State: AOAM5306IbxC+1J26putSxJ1bB9mippT49g4EdX3s0R8XlHuq3zH4Ush
 2EbEiSvrLB3E+oX7gMe+ego=
X-Google-Smtp-Source: ABdhPJxH9Vf5+KuJkXJ0TAvOuG5z+iYQIt3P4hfJBPdGIFznBV3sRJjx9su2yRMhx4QpVI2QitpQww==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr4744wrp.387.1598525789211;
 Thu, 27 Aug 2020 03:56:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g17sm5228694wrr.28.2020.08.27.03.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:56:28 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:56:27 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 20/38] tools/libxc: rename all libxenguest sources to
 xg_*
Message-ID: <20200827105627.jdaygtkpgpyaonwk@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-21-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-21-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:01AM +0200, Juergen Gross wrote:
> Some sources of libxenguest are named xg_*.c and some xc_*.c. Rename
> the xc_*.c files to xg_*.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

