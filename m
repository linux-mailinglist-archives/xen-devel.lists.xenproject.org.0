Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF91EB593
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 08:03:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg00v-00036d-AT; Tue, 02 Jun 2020 06:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AzWc=7P=notk.org=asmadeus@srs-us1.protection.inumbo.net>)
 id 1jg00t-00036X-Ip
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 06:03:03 +0000
X-Inumbo-ID: b76d8c18-a496-11ea-9dbe-bc764e2007e4
Received: from nautica.notk.org (unknown [2001:41d0:1:7a93::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b76d8c18-a496-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 06:03:02 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 4FC2AC009; Tue,  2 Jun 2020 08:03:01 +0200 (CEST)
Date: Tue, 2 Jun 2020 08:02:46 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] 9p/xen: increase XEN_9PFS_RING_ORDER
Message-ID: <20200602060246.GA16791@nautica>
References: <20200521193242.15953-1-sstabellini@kernel.org>
 <20200522055847.GA2833@nautica>
 <alpine.DEB.2.21.2006011406100.12801@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006011406100.12801@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: jgross@suse.com, lucho@ionkov.net, ericvh@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano Stabellini wrote on Mon, Jun 01, 2020:
> > LGTM, I'll try to find some time to test this by the end of next week or
> > will trust you if I can't make it -- ping me around June 1st if I don't
> > reply again until then...
> 
> Ping :-)

I actually did think about this patch this weekend! . . .but didn't
quite make it :/
Anyway, as promised pushed to linux-next, I'll submit this for 5.8

-- 
Dominique

