Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C12F1A9C0C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg7Q-0008VI-4C; Wed, 15 Apr 2020 11:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg7O-0008Ul-AD
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:22:10 +0000
X-Inumbo-ID: 58b6af34-7f0b-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58b6af34-7f0b-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=ge8/awGPFcL356SsWTT1df7dwyO0aIf9/UbP1gM8ze4=; b=CDh4SfHv85tjWe8KOuMcAsenPt
 VAmOMyRDuyn0rAKP4/agpEMnrGeEYOWCpWBtsh1wnJv/H2rwN6AyHpeZPthhCcdxLBRpF3IXcM501
 VTttX50z5rrJwOwRRDx+9RCxnnv+oV5LxpddTpRKBlW3UpkiKz8qaCM8gZl3f6E9p66g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg7M-0001Tq-PP; Wed, 15 Apr 2020 11:22:08 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg7M-00062d-G2; Wed, 15 Apr 2020 11:22:08 +0000
Date: Wed, 15 Apr 2020 12:22:05 +0100
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 04/12] xen: split alloc_heap_pages in two halves for
 reusability
Message-ID: <20200415112205.zan6w7ycgztni7aj@debian>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-4-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415010255.10081-4-sstabellini@kernel.org>
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, jbeulich@suse.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 14, 2020 at 06:02:47PM -0700, Stefano Stabellini wrote:
> This patch splits the implementation of alloc_heap_pages into two halves
> so that the second half can be reused by the next patch.

It would be good if you can put a summary on what each half does here so
that we can check you intent against the implementation.

Wei.

