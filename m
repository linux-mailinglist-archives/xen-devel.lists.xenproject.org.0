Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62491B5923
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ3A-0001iG-U7; Thu, 23 Apr 2020 10:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IVNM=6H=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jRZ39-0001hR-Hj
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:25:43 +0000
X-Inumbo-ID: c8bd369e-854c-11ea-933f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8bd369e-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=K6c8z0zSO4hwF1jNd7IKrbrk9Saj8OUXaoMIdtS9eWo=; b=0WnNRUP98oTYTHtbIbBzj1CNMX
 c+kZ0NZylgzBJOUmMzNg4OiZ7WlDstdm+jBCywF0OwuZOjSmlYkXxQxPAqoBt9hZJ4QG5U75XW6NE
 X1JZisI6VFmlncQVr8np+qD3Wta7b2JAyzzUJOxkHhoM5Cma/BFKJYjyZ2/rdw5IDUeQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jRZ37-0000M4-8i; Thu, 23 Apr 2020 10:25:41 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jRZ37-00059C-0R; Thu, 23 Apr 2020 10:25:41 +0000
Date: Thu, 23 Apr 2020 11:25:38 +0100
From: Wei Liu <wl@xen.org>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
Message-ID: <20200423102538.vxuo7s2lamkxhoo7@debian>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 08:25:25PM -0400, Nick Rosbrook wrote:
> By default, if the go compiler is found by the configure script, build
> the golang tools. If the compiler is not found, and
> --enable-golang_tools was not explicitly set, do not build to the golang

--enable-golang-tools here.

> tools.
> 
> The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
> CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
> configure.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Acked-by: Wei Liu <wl@xen.org>

Note to self: fix commit message and maybe rerun autogen.sh.

