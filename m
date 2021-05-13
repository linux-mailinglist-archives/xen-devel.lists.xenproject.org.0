Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F262637F2D9
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 08:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126489.238130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yg-0001Y4-6V; Thu, 13 May 2021 06:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126489.238130; Thu, 13 May 2021 06:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yg-0001W3-2e; Thu, 13 May 2021 06:10:54 +0000
Received: by outflank-mailman (input) for mailman id 126489;
 Thu, 13 May 2021 06:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Mxh=KI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lh4Ye-0001Vx-Jd
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 06:10:52 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 780289eb-2339-4154-b73a-d4fbc703e19e;
 Thu, 13 May 2021 06:10:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90E7A67373; Thu, 13 May 2021 08:10:48 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 780289eb-2339-4154-b73a-d4fbc703e19e
Date: Thu, 13 May 2021 08:10:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
	jgross@suse.com, hch@lst.de,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 1/3] xen/arm: move xen_swiotlb_detect to
 arm/swiotlb-xen.h
Message-ID: <20210513061048.GA26335@lst.de>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s> <20210512201823.1963-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512201823.1963-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

