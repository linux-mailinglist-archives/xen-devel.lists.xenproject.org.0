Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FD1D91B8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxJi-0002IA-QI; Tue, 19 May 2020 08:09:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbQz=7B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jaxJh-0002I5-4G
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:09:37 +0000
X-Inumbo-ID: 143c1545-99a8-11ea-a8e3-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 143c1545-99a8-11ea-a8e3-12813bfff9fa;
 Tue, 19 May 2020 08:09:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l18so14776950wrn.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 01:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wr+G6ba0u5WKbNxoCAyuyvl5jZ+YmSujiSW5/xkVRKA=;
 b=E9A/bK7mCxp21Rd2LZPSbXb4AGn8NOu5suZ/tjCrLjHQrtksrR06UFhKHxd2vYUsAx
 ymzAGkOM4CaoHGHsCucynBdszjMkYi6OilVpBrAVdBPhm36v0RnrK9RDgyoo+AYdKVns
 yWQAKoCjvqxLkym3FyM7nxLx03C2VgTf25ZSRDEPuFOabeJK79Wr98pj11ix+OFWQyM4
 BIfvhNMgp7pR9D7l1cI+gJp+3KLcDM7dE686W3lS5scQ1vuFsjW9Xi7hUocfqZrKv0DA
 6AaJ4fcFG03zR/xhezzoKfzj53dpxZ9aVQVJJFaQqIDOkuW0VuUcJKMxSHJHHNXaRd9H
 So4w==
X-Gm-Message-State: AOAM530Hj4+ZZsQOYN/WoTxZfqhk/JOcM2RJ975Y0zI3QjJ2Gh9Bz7+R
 CDzOTrd1wiJ56E5fRZwr3rc=
X-Google-Smtp-Source: ABdhPJz2FdxvQ8kADRoefVL37oAQb+8/uKaivVJ5hPH2Ni487nk8ppaQaG+3IoyG8TLOGkGQPXEXNA==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr23961671wrv.15.1589875775806; 
 Tue, 19 May 2020 01:09:35 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z18sm2656307wmk.46.2020.05.19.01.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 01:09:35 -0700 (PDT)
Date: Tue, 19 May 2020 08:09:33 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10 11/12] tools/libxc: remove xc_set_parameters()
Message-ID: <20200519080933.3pjozwgltpbgl2jp@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519072106.26894-12-jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 09:21:05AM +0200, Juergen Gross wrote:
> There is no user of xc_set_parameters() left, so remove it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

