Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA41B5924
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:26:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ3G-0001jM-87; Thu, 23 Apr 2020 10:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IVNM=6H=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jRZ3E-0001is-Hv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:25:48 +0000
X-Inumbo-ID: cc4cb19a-854c-11ea-933f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc4cb19a-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=sqB0POh+DlkETeDvNvjuZIZRynPRSQnUNmboT+aYH9M=; b=w/6ZTct+9ejejJj7v8lbQfg39F
 evUShwuXIZSEgMsvplQczVjewIIzOUIcQAqmD65DkLRA1pRzVHzUX/PEDtvKvjWmI47lV9vtUeZXu
 nmZM32b+IgYuXuROIHL8sOpPKAb0i6gewAnx+flueSJcCmfK7jNJlibi6pmqYOMh5/ek=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jRZ3D-0000MK-2n; Thu, 23 Apr 2020 10:25:47 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jRZ3C-00059N-QW; Thu, 23 Apr 2020 10:25:47 +0000
Date: Thu, 23 Apr 2020 11:25:43 +0100
From: Wei Liu <wl@xen.org>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/2] golang/xenlight: stop tracking generated files
Message-ID: <20200423102543.iy4szqmbfzsohlwd@debian>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <f4fd2508a9cbceec2d1b8b480d4e4a15422d67d2.1587599095.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4fd2508a9cbceec2d1b8b480d4e4a15422d67d2.1587599095.git.rosbrookn@ainfosec.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 08:25:26PM -0400, Nick Rosbrook wrote:
> The generated go files were tracked temporarily while the initial
> implementation of gengotypes.py was in progress. They can now be removed
> and ignored by git and hg.
> 
> While here, make sure generated files are removed by make clean.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Acked-by: Wei Liu <wl@xen.org>

