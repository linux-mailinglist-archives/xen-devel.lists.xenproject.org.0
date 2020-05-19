Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6DE1D92D0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:58:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jay55-0007FB-4Z; Tue, 19 May 2020 08:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mazm=7B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jay53-0007F2-Nl
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:58:33 +0000
X-Inumbo-ID: ea5affb8-99ae-11ea-a8e6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea5affb8-99ae-11ea-a8e6-12813bfff9fa;
 Tue, 19 May 2020 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=xoNOQdQYDnjoM3Si6FGbJPFomYZnBiPwJw5n76fyXgg=; b=FswXLYZFh4b+rmktrMJr1BIz5f
 FlKRWyh14K/yaL5utTJtD7VV5WIq3SYL9EkMEViXXneiyjvcm4/HgJ8CzeDjtEJgx95gucKE1PvIO
 elKCd8qBkTrvANunQM4+IhELNV7qloa/DPshX1qDpM43o4THqn5tYwaoL9FAPybWMH48=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jay51-0003r6-Mo; Tue, 19 May 2020 08:58:31 +0000
Received: from 96.142.6.51.dyn.plus.net ([51.6.142.96] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jay51-0004u8-Dm; Tue, 19 May 2020 08:58:31 +0000
Date: Tue, 19 May 2020 09:58:29 +0100
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 2/2] tools: Use INSTALL_PYTHON_PROG
Message-ID: <20200519085829.5nvgbmzcirtovqh5@debian>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
 <20200311175933.1362235-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311175933.1362235-3-anthony.perard@citrix.com>
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
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 11, 2020 at 05:59:33PM +0000, Anthony PERARD wrote:
> Whenever python scripts are install, have the shebang be modified to use
> whatever PYTHON_PATH is. This is useful for system where python isn't available, or
> where the package build tools prevent unversioned shebang.
> 
> INSTALL_PYTHON_PROG only looks for "#!/usr/bin/env python".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

