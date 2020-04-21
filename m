Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F431B2382
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 12:03:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQpju-0004zY-SU; Tue, 21 Apr 2020 10:02:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YDxJ=6F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jQpjt-0004zR-Di
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 10:02:49 +0000
X-Inumbo-ID: 4188ae74-83b7-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4188ae74-83b7-11ea-9e09-bc764e2007e4;
 Tue, 21 Apr 2020 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=qYEMQ5cVkkzjo74NoNs/EBSLtEjotkHHvf/NsOcC6C0=; b=l/5k8GG/IcBBLc1XF28ahoR++N
 Ke09MqEngVFZBJ4lfMIzrpZtg6j/pcCa6017nsbX/qTHr0ljmLGvBxlERPwlOwh+N09IJZSH6ftPw
 85ewGplON/jgHiK532mJ8iUyAxpeOUgRWJ05ttEVxePI4YENTujhWWX3c7T6cHFkl1sc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jQpjs-00043g-MZ; Tue, 21 Apr 2020 10:02:48 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jQpjs-0008Ig-DV; Tue, 21 Apr 2020 10:02:48 +0000
Date: Tue, 21 Apr 2020 11:02:45 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Enumeration for Control-flow Enforcement Technology
Message-ID: <20200421100245.sdd7cy2i55xwaxu6@debian>
References: <20200420190829.17874-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420190829.17874-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 20, 2020 at 08:08:29PM +0100, Andrew Cooper wrote:
> The CET spec has been published and guest kernels are starting to get support.
> Introduce the CPUID and MSRs, and fully block the MSRs from guest use.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

