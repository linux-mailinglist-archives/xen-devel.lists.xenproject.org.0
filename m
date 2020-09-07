Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C225FDAC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 17:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFJUC-0000ZD-Eo; Mon, 07 Sep 2020 15:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFJUA-0000Z8-UD
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 15:55:14 +0000
X-Inumbo-ID: 046707b3-ae9e-4e92-885b-559cec58a4c6
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 046707b3-ae9e-4e92-885b-559cec58a4c6;
 Mon, 07 Sep 2020 15:55:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s13so14769033wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 08:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ceyzvrysym4bNK6jH1hLdSXetFmSBsW1uWfudCzA1n0=;
 b=o1jdBVM8wWly6NUxF6kc7o8HXkgylqSvbxtP79Y5nVeciCbUZfuiLZ9Iyr+eL4nzyh
 L6t+isLl57dm6kRNiGiMSNOYJuUSttaOshxInWM0Y6+pMEQKBTrVZLB1ycAdakreNxQb
 RckX9+PMkJkm7muYY+pRVEnfjWkBQAZjzc0w864A3QFT1zRhgBEBi8HJJ0MO+DmKCoaD
 1QiFgwQT57fyJACjNPGqzKaQjuAJoTlutFs7/0eMOKyjclbOXByagk4WdX2hsMlHa9VL
 xmj9UxJ9U7R5BynX7dpA+wzjDkpwV0kdBRPJi1oKGnv7YaTTFkoDosM5OvBUQEIa78yG
 4vag==
X-Gm-Message-State: AOAM5335MIHobN1Slr8K9Ch/Bl7A2TpkIr440e6hX9nPlikT2Z/fqVlI
 yK5l1z5R/U2a2qo4TKMnUyNgawVWhDM=
X-Google-Smtp-Source: ABdhPJwKVwI9oCIRfLqUrweOSrlihQV5mdVsEuJT5HdjJqqjKCqZf/TXfPluA7qHQV9gJsqi9m1kwA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr21891798wml.149.1599494113114; 
 Mon, 07 Sep 2020 08:55:13 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s5sm29135872wrm.33.2020.09.07.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 08:55:12 -0700 (PDT)
Date: Mon, 7 Sep 2020 15:55:11 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 29/31] tools: rename global libxlutil make variables
Message-ID: <20200907155511.jhpucgrvmthhzlmv@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-30-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-30-jgross@suse.com>
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

On Fri, Aug 28, 2020 at 05:07:45PM +0200, Juergen Gross wrote:
> Rename *_libxlutil make variables to *_libxenutil in order to avoid
> nasty indirections when moving libxlutil under the tools/libs
> infrastructure.

xl means xenlight.

So I think the name should be libxenlightutil here.

Wei.

