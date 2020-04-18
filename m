Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD81AECD3
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 15:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPnnV-00024r-JV; Sat, 18 Apr 2020 13:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bbfk=6C=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jPnnU-00024m-05
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 13:46:16 +0000
X-Inumbo-ID: f88bb024-817a-11ea-8e72-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f88bb024-817a-11ea-8e72-12813bfff9fa;
 Sat, 18 Apr 2020 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=spdwGc0KgnbRB5gjjv05TunodJTNA0vnhyFB/SZ8hrM=; b=Daj1JSwmsZqnIW0W0iraqLtt1V
 VmRwPPtaAbZ0cQOKtADA6Q/EpooifLRgY1hFyRHbSPZyfv+UvTsw1z8/XloSkdLTzWlwf9tCdUPAe
 xYI+C9batrRQvfpKIl/Ud+vQYus0Koz1fwgbZNLZtLpAcMlAwRG9BfxgFET/zsYZ4P38=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPnnS-00022e-0U; Sat, 18 Apr 2020 13:46:14 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPnnR-0006i4-NO; Sat, 18 Apr 2020 13:46:13 +0000
Date: Sat, 18 Apr 2020 14:46:10 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] x86/pv: Start to trim 32bit support
Message-ID: <20200418134610.hlqcj7v3zoobjrvv@debian>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417155004.16806-1-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 04:50:01PM +0100, Andrew Cooper wrote:
> Downstreams may want this for either security or performance reasons.  Offer
> some options, and take advantage of some of the very low hanging fruit it
> offers.
> 
> There is plenty more incremental cleanup which can be done at a later point.
> 
> Andrew Cooper (3):
>   x86/pv: Options to disable and/or compile out 32bit PV support
>   x86/pv: Short-circuit is_pv_{32,64}bit_domain() in !CONFIG_PV32 builds
>   x86/pv: Compile out compat_gdt in !CONFIG_PV builds

Reviewed-by: Wei Liu <wl@xen.org>

