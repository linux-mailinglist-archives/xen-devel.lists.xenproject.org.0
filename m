Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD71A9BF0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg29-0007PO-MS; Wed, 15 Apr 2020 11:16:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg28-0007PG-5u
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:16:44 +0000
X-Inumbo-ID: 965ad9e2-7f0a-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 965ad9e2-7f0a-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BgC3RHuuwyz8SKjiEeETpqmeE62rDCI7wOFjpCWjtDc=; b=2VH5qIq61mB6KEOWfrmc4qQ6la
 r5CC4xxULrTdM2unC4POPo13AVeSxJYXN3/9oSvWKKgX7hZg3ew/1Uvu3PM3zFArYsAg/vg1+ITWG
 4U8tIUzehCYbvsbAgJ6mH/F6FWSqTL5PmD57F9uCsymAFMl2GfEJyCMkODWwJUd5gj9I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg27-0001Lf-AN; Wed, 15 Apr 2020 11:16:43 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg27-0005dD-1X; Wed, 15 Apr 2020 11:16:43 +0000
Date: Wed, 15 Apr 2020 12:16:40 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/altp2m: add missing break
Message-ID: <20200415111640.lbtoajlrhxyoffsz@debian>
References: <20200415110939.9481-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415110939.9481-1-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 01:09:39PM +0200, Roger Pau Monne wrote:
> Add a missing break in the HVMOP_altp2m_set_visibility case, or else
> code flow will continue into the default case and trigger the assert.
> 
> Fixes: 3fd3e9303ec4b1 ('x86/altp2m: hypercall to set altp2m view visibility')
> Coverity-ID: 1461759
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

