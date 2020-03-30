Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BD197CC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 15:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuJk-0007GJ-W7; Mon, 30 Mar 2020 13:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MEvi=5P=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIuJj-0007GE-Or
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:19:03 +0000
X-Inumbo-ID: 060018a5-7289-11ea-b9d6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 060018a5-7289-11ea-b9d6-12813bfff9fa;
 Mon, 30 Mar 2020 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=39LYt0iGU+8w2Krw5EIo0k5mW8E/w4A0EbHros27LyQ=; b=i4ed3IgH96gYeBxCLYfIhuhoxz
 uy7JQsqO+z1uslPcm4ck6XJmVqnlLZZMcjZtyNyfmzlWknNwQ3LS75Vjq42X6Z3wygb4T2iAiqbbG
 ratEvQmXcNHTyrBtIOPrTriouEx09fmObJuyeHh2VJ9PtkJy4772ZKil825GWly8Ir+U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIuJh-0004ZU-Mq; Mon, 30 Mar 2020 13:19:01 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIuJh-0006rG-DM; Mon, 30 Mar 2020 13:19:01 +0000
Date: Mon, 30 Mar 2020 14:18:58 +0100
From: Wei Liu <wl@xen.org>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200330131858.2jw63fztr4l4sc65@debian>
References: <20200330122308.GA10191@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330122308.GA10191@simran-Inspiron-5558>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Compress lines for immediate
 return
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 30, 2020 at 05:53:08PM +0530, Simran Singhal wrote:
> Compress two lines into a single line if immediate return statement is found.
> It also remove variables retval, freq, effective, vector, ovf and now
> as they are no longer needed.
> 
> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>

Reviewed-by: Wei Liu <wl@xen.org>

