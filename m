Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD5268876
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkrh-00088J-Su; Mon, 14 Sep 2020 09:33:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHkrf-000888-RJ
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:33:35 +0000
X-Inumbo-ID: 5fd60946-79e0-4674-8f90-4dd4235da7df
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fd60946-79e0-4674-8f90-4dd4235da7df;
 Mon, 14 Sep 2020 09:33:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so9930153wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EpAVIeKcsE15HUUGTR9fq/SGHVqHZS45tSvTxmpsZdc=;
 b=DRgnsyxoCkInoYkl2iaFUvxBBPdAqvi3y992IQ5qZUdH+Pbpw3zpGTz1PhWEBnq/Yq
 a7SgFPEiP7k00N0ZfnVi85zth5oMREGRI2UpNfOMCCs8Rk3aeTFbkJIXiMa1uB0MCxS2
 w58wpp/2ckv1YIS/VooHaP1SStDB60zY1fTMoBpmNa9ScOa0Zl/tBa5HkVqVD0vlUL1L
 XQF/MX2GdeO9+86zJPmdDYXCPAqdeIIRUyystaE8B6vdTKs2S6lFoasHCmUF5/V2dvBS
 dzCmoJtvMDZ/Zm/YZ9ccUsbAIZpqB/kdDXcvFEYcXzNK90w83J7hYmuNxyBevicfiCRs
 Cxag==
X-Gm-Message-State: AOAM5316IfsL1cppLNmTp3XxUDdgKynTfSgvezrpWLRVe1ThOgVS0/p/
 Uhl/vMWJvIhsq9OudCxwcis=
X-Google-Smtp-Source: ABdhPJzd8uuXOq7ddwF/pruhY//Qt+5XrBzw40EjYc1N1LTu7Po+txNVj4pAALcPZpPbsU2gTp9VIg==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr13956985wma.75.1600076004208; 
 Mon, 14 Sep 2020 02:33:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d2sm20401500wro.34.2020.09.14.02.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:33:23 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:33:22 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools/Makefile: Drop the use of $(file ...)
Message-ID: <20200914093322.n726qf4y4rp4mmoe@liuwe-devbox-debian-v2>
References: <20200914092420.20900-1-andrew.cooper3@citrix.com>
 <20200914092420.20900-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914092420.20900-3-andrew.cooper3@citrix.com>
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

On Mon, Sep 14, 2020 at 10:24:20AM +0100, Andrew Cooper wrote:
> It is only available in make 4.0 and later, and not for example in CentOS 7.
> 
> Rewrite the logic to use echo and shell redirection, using a single capture
> group to avoid having 12 different processes in quick succession each
> appending one line to the file.
> 
> Fixes: 52dbd6f07cea7a ("tools: generate pkg-config files from make variables")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

