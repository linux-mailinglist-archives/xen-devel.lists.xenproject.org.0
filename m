Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A51BC226
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:00:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRiV-00022c-5a; Tue, 28 Apr 2020 15:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KfNV=6M=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jTRiT-00021D-Oi
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:00:09 +0000
X-Inumbo-ID: f3ae3dfe-8960-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3ae3dfe-8960-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=J+NHKJa/jRyEJy0/LP08QbrjXlFQcDFOHxnhibHPQfE=; b=6/zrzz9bCHr8cUroV/z0uHJMpm
 30zqYAWmCaqNaVRFIQHCheQUyopBRA4eKHPjn2kGPMT/SHgEng3NlpqfQ45Vx3iIvubs06jn6Zn/N
 svzrGXhB9EftTC46wAW4GJ6Vc6BT53QlkdO9DAvHK0uoSUgOsnSpqvApamtKPcZR4BGw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jTRiS-0006Q3-0q; Tue, 28 Apr 2020 15:00:08 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jTRiR-0002hr-L7; Tue, 28 Apr 2020 15:00:07 +0000
Date: Tue, 28 Apr 2020 16:00:04 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstore: simplify socket initialization
Message-ID: <20200428150004.le3ic6rla2erpfnq@debian>
References: <20200428145837.6099-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428145837.6099-1-jgross@suse.com>
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
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 04:58:37PM +0200, Juergen Gross wrote:
> The setup of file descriptors for the Xenstore sockets is needlessly
> complicated: the space is allocated dynamically, while two static
> variables really would do the job.
> 
> For tearing down the sockets it is easier to widen the scope of the
> file descriptors from function to file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

