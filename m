Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5C196E19
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 17:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIZW0-0002S6-QB; Sun, 29 Mar 2020 15:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIZVy-0002Rw-N5
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 15:06:18 +0000
X-Inumbo-ID: d7aaf4ca-71ce-11ea-8dc2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7aaf4ca-71ce-11ea-8dc2-12813bfff9fa;
 Sun, 29 Mar 2020 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=G5TG6PvSswYxLq0WZax9kWMsErb71loqaeBmAya/O7Y=; b=kw82nO5x4yVig1VdQuARNoOmnU
 BXrSh+1QwwgldQdc04cODLV04HTxjYwb7F/9XSch54WocIbEgzOMo1DqPE4WDRBGckSZpt7IHP/Ht
 YTvPhgW3Lebe03JmHfj1D7j5pv1XRmcssicSCSyr5x91NCe0uRDaDKxSa9ZcOpQzeesg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZVx-0005MO-PI; Sun, 29 Mar 2020 15:06:17 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZVx-0005Jd-DY; Sun, 29 Mar 2020 15:06:17 +0000
Date: Sun, 29 Mar 2020 16:06:14 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Message-ID: <20200329150614.ofsg7tiipxz35ucc@debian>
References: <cover.1584955616.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/5] use new API for Xen page tables
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

On Mon, Mar 23, 2020 at 09:41:37AM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This small series is basically just rewriting functions using the new
> API to map and unmap PTEs. Each patch is independent.
> 
> Apart from mapping and unmapping page tables, no other functional change
> intended.
> 

The code looks correct to me.

I do wonder if you should've put your SoB instead of Rb in some of the
patches.

Wei.

