Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF227EAF6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766.2557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNd97-0001tG-JX; Wed, 30 Sep 2020 14:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766.2557; Wed, 30 Sep 2020 14:31:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNd97-0001st-GF; Wed, 30 Sep 2020 14:31:53 +0000
Received: by outflank-mailman (input) for mailman id 766;
 Wed, 30 Sep 2020 14:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNd96-0001so-EX
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:31:52 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d91fece-a412-4ed8-b454-80602dfa783c;
 Wed, 30 Sep 2020 14:31:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m6so2086284wrn.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:31:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u63sm3155345wmb.13.2020.09.30.07.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:31:49 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNd96-0001so-EX
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:31:52 +0000
X-Inumbo-ID: 1d91fece-a412-4ed8-b454-80602dfa783c
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d91fece-a412-4ed8-b454-80602dfa783c;
	Wed, 30 Sep 2020 14:31:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m6so2086284wrn.0
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SPEUzDdVMxfbH3k66JIE29ZHylkdLNLlesQf9wJi/lc=;
        b=T4OOUVrPm20NiuTgBgtcRGFMtPDuwPme57A+HBsYjLHzC4AdrxPgQKXqsEYlFHN9zP
         fW45Er04IaAy+GM3fdKCzuQN31R+t7ZAMcXu8U2zFoJzmDw44edSvh+9QTkZj2hCJgOk
         EiOEibvvgezsPkxev6LH0XrAD/iXxYNkUDAsqJiKY2OL+jV1Ie0m2eyML5WeRaco0HFc
         SIhb0tpsL+JIZzYhGPGX7xcYHfdTxv0D67EglmEQIWKVkomVAwpOtK/vQ/YTbdDfVAda
         jb+U2j34/Feg1CSAsCzGv5TSmOU4lSoRvh785hHZrl5HTIPAaJXWQHep1auNW//nMv7T
         FKNA==
X-Gm-Message-State: AOAM530SrMNG7cW+yeuGWlCwzTCD45JbQGYX2dFpQGB7Tzmo19keOwLL
	sizcpbK6Ny9MV5+yHisJboI=
X-Google-Smtp-Source: ABdhPJwmzSUdiUeVq0ErAqAoBztIqmT2zt5ApXlKk9rZzHK1prbzmnz0UMnaR+O+khyez+5qLm0hMg==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr3467113wrr.273.1601476310798;
        Wed, 30 Sep 2020 07:31:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u63sm3155345wmb.13.2020.09.30.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:31:49 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:31:48 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Julien Grall <julien@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 2/8] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Message-ID: <20200930143148.mjxkxclxbl4yvydy@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-3-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:24PM +0100, Paul Durrant wrote:
> These domctls provide a mechanism to get and set domain context from
> the toolstack.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Julien Grall <julien@xen.org>

Acked-by: Wei Liu <wl@xen.org>

