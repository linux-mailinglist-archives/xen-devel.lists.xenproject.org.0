Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC021AEC9F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 14:49:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPmty-0005km-2J; Sat, 18 Apr 2020 12:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bbfk=6C=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jPmtw-0005kd-0i
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 12:48:52 +0000
X-Inumbo-ID: f42d8dfc-8172-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f42d8dfc-8172-11ea-b58d-bc764e2007e4;
 Sat, 18 Apr 2020 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=tktXeVI11Y10hQs1qrLMwCmFVrk1+4IMVs9my8vm8D0=; b=rmZTVjXf73SjxVUXkgYHowkzBu
 WGgqoITsdX4A7TZT4N/bR8AHRuY7K0xF+Zhe8BZAMMKL/BW2q8l5zkBjSS7wO0a3V/jbka+PXEdbA
 XHqjVVdDrAAK70ZUIAroVA+9V1h7Wzea+PGrhiWbxBWZHSRpSC1We4QH1RknEXa4rK/I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPmtt-0000yV-O7; Sat, 18 Apr 2020 12:48:49 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPmtt-0003Yw-DZ; Sat, 18 Apr 2020 12:48:49 +0000
Date: Sat, 18 Apr 2020 13:48:46 +0100
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
Message-ID: <20200418124846.kinsiggbw2e5v76t@debian>
References: <20200417222430.20480-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417222430.20480-1-sstabellini@kernel.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, julien@xen.org, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 03:24:30PM -0700, Stefano Stabellini wrote:
> Create a new document under docs/process to describe our special tags.
> Add a description of the Fixes tag and the new Backport tag. Also
> clarify that lines with tags should not be split.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: jbeulich@suse.com
> CC: george.dunlap@citrix.com
> CC: julien@xen.org
> CC: lars.kurth@citrix.com
> CC: andrew.cooper3@citrix.com
> CC: konrad.wilk@oracle.com

Acked-by: Wei Liu <wl@xen.org>

