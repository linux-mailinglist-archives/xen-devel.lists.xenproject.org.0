Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F11DE3A5
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:02:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4Uw-0000pT-W7; Fri, 22 May 2020 10:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nXpb=7E=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jc4Uv-0000pO-O7
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:01:49 +0000
X-Inumbo-ID: 3fe9636f-9c13-11ea-aba9-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fe9636f-9c13-11ea-aba9-12813bfff9fa;
 Fri, 22 May 2020 10:01:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f134so8131267wmf.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 03:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HK4/FwLeGgXI+j5s40BKVWhGHh1cP+TEI9vZo9YfCEc=;
 b=m23ZgspuHqlmrM5OqG0mxoWCmZvgmaR2MJp6nvMqRDKIWISKyKzgQhk/eA0cBuNrTE
 f8CTPIVgdzkWxkre5ywnvanahdAjcJLi4cOvObLDoX6preMQF7hHxFk7k1fmJJbdzctA
 zJ52lazrQqaPjm0FQhLQrp+5q40uORczLUazmzoFZCkD62AzR2kpBh6oIQ7zIyRx3stI
 cTiIUMwxd36R5sni4vYHVN5w82ba3s1OSIRokeuHsY3KGJIIolWphAgX4fXu+VJViGuF
 G6eYXCPiNhrn4Sq4H6+7Bsylw1cvhk7H+mye7GZeL0Li2Oc5Lg8TUAMhtOqwNV+1OBCI
 Anuw==
X-Gm-Message-State: AOAM5311hRWUEq++hf5l4sGm9pRMffgSJoXNrBPmII0AmNCHjV1vguIO
 MANfCNC3EPY5Yzo2cPqWvPQ=
X-Google-Smtp-Source: ABdhPJx3SXpHFJNnubGIQMpwKvWOyu1PaejIWtIouPs1OeOQ9KHrpFQz6lKp634UEYhGLkojrljdwQ==
X-Received: by 2002:a1c:64c1:: with SMTP id
 y184mr11312321wmb.175.1590141707578; 
 Fri, 22 May 2020 03:01:47 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h196sm1202838wme.22.2020.05.22.03.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 03:01:46 -0700 (PDT)
Date: Fri, 22 May 2020 10:01:45 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] golang: Update generated files after libxl_types.idl
 change
Message-ID: <20200522100145.w6xd5v7ioubzkni5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200522094956.3611661-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522094956.3611661-1-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 10:49:56AM +0100, George Dunlap wrote:
> c/s 7efd9f3d45 ("libxl: Handle Linux stubdomain specific QEMU
> options.") modified libl_types.idl.  Run gengotypes.py again to update

libxl_types.idl.

> the geneated golang bindings.
> 

Can we perhaps add a dependency on golang's side such that it can be
auto-generated in the future?

In any case

Acked-by: Wei Liu <wl@xen.org>

(I haven't looked at the generated code)

