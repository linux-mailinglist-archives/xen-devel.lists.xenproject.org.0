Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F351A370F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 17:27:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMZ4G-0001YY-FF; Thu, 09 Apr 2020 15:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMZ4E-0001YT-Ut
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 15:26:10 +0000
X-Inumbo-ID: 703fc1fc-7a76-11ea-82ef-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 703fc1fc-7a76-11ea-82ef-12813bfff9fa;
 Thu, 09 Apr 2020 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=n/dJPlKyygqQLWVhnrVABh+dMENl/NBSwN+Vm2uJUV4=; b=DKyiUdXN+dg104FIVw9r4NIZ4O
 mBszrNWYhKP44bQNc5LMEWhJAkoWlikYXoAiA2fHvdBrd3SaLrG7D0saxJn4XdSU37TeaZOxUQ/yq
 Ah2ZorLS0KU2tMgl9+P+fBHx1azBiH1QsbSckJnXuKPj3kmATAri1lLUl5/SBcKLDtPU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZ4C-0008KS-5k; Thu, 09 Apr 2020 15:26:08 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZ4B-0008SI-Re; Thu, 09 Apr 2020 15:26:08 +0000
Date: Thu, 9 Apr 2020 16:26:05 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/EFI: also fill boot_tsc_stamp on the xen.efi boot path
Message-ID: <20200409152605.t4dka3yt6xndoib4@debian>
References: <7ed6f7cc-c540-88fb-6073-10ef1a2da6e7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed6f7cc-c540-88fb-6073-10ef1a2da6e7@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 10:00:48AM +0200, Jan Beulich wrote:
> Commit e3a379c35eff ("x86/time: always count s_time from Xen boot")
> introducing this missed adjusting this path as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

