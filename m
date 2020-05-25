Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA21E1D95
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 10:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdVDz-0007w4-7Q; Tue, 26 May 2020 08:46:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0p4g=7I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jdVDx-0007vv-6V
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:46:13 +0000
X-Inumbo-ID: 57d725a2-9f2d-11ea-a5e9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57d725a2-9f2d-11ea-a5e9-12813bfff9fa;
 Tue, 26 May 2020 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=/70pCIqdBc1+IaihE3qtCdVQmzI0BmRdQTEKFEaq7uw=; b=63MHqGT5n6awT6PUH4TIaQNUto
 FRsxPE2ZqlvxFbUZ/g8CEZCBAhVGBU3PCIT6sL7+1w8UngFhX8MBQknykjtVJsoyoJDhMsAA4jXSL
 IRBHrCduN40NTmaNskc3L6E71vNpe93TdEBvocw5mGv0NdDXzAXzwb9/q459HoX/OYgw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jdVDr-0005zz-9I; Tue, 26 May 2020 08:46:07 +0000
Received: from 82.149.115.87.dyn.plus.net ([87.115.149.82] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jdVDr-0008Lh-18; Tue, 26 May 2020 08:46:07 +0000
Date: Mon, 25 May 2020 19:47:01 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: gate enabling on cpu_has_vmx
Message-ID: <20200525184701.hogeyzd7q7qntiwn@debian>
References: <20200525144606.126767-1-tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525144606.126767-1-tamas.lengyel@intel.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 08:46:06AM -0600, Tamas K Lengyel wrote:
> From: Tamas K Lengyel <tamas@tklengyel.com>
> 
> It is unclear whether mem_sharing was ever made to work on other architectures
> but at this time the only verified platform for it is vmx. No plans to support
> or maintain it on other architectures. Make this explicit by checking during
> initialization.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Reviewed-by: Wei Liu <wl@xen.org>

