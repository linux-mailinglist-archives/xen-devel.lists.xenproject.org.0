Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F831EBF75
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 17:55:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg9Fu-0003i8-Nj; Tue, 02 Jun 2020 15:55:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FM/C=7P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jg9Ft-0003i1-DD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 15:55:09 +0000
X-Inumbo-ID: 6f20f654-a4e9-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f20f654-a4e9-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 15:55:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CDFD2067B;
 Tue,  2 Jun 2020 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591113308;
 bh=PRxYptlqDh/ho5Adpy8HLDZHSmhfvJbp9cjTmMciy58=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rqolI2+cJdcgCjFb938OQrKwiPnmVdg09hq9mw0rg3s/2xntd5muOFt2qIOjCU6yt
 JL5oyl+4M1uHTMXcV7sDlr3yTxMpdCvOXSYOxOHXfujuQRMO5vZEztUqutLOtD3Atb
 GDB+AIu2CqT/LfTdGrDSRzpjlKflJrrfpVV6Seho=
Date: Tue, 2 Jun 2020 08:55:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [PATCH v2] 9p/xen: increase XEN_9PFS_RING_ORDER
In-Reply-To: <20200602060246.GA16791@nautica>
Message-ID: <alpine.DEB.2.21.2006020855010.12801@sstabellini-ThinkPad-T480s>
References: <20200521193242.15953-1-sstabellini@kernel.org>
 <20200522055847.GA2833@nautica>
 <alpine.DEB.2.21.2006011406100.12801@sstabellini-ThinkPad-T480s>
 <20200602060246.GA16791@nautica>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jgross@suse.com, lucho@ionkov.net,
 Stefano Stabellini <sstabellini@kernel.org>, ericvh@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2 Jun 2020, Dominique Martinet wrote:
> Stefano Stabellini wrote on Mon, Jun 01, 2020:
> > > LGTM, I'll try to find some time to test this by the end of next week or
> > > will trust you if I can't make it -- ping me around June 1st if I don't
> > > reply again until then...
> > 
> > Ping :-)
> 
> I actually did think about this patch this weekend! . . .but didn't
> quite make it :/
> Anyway, as promised pushed to linux-next, I'll submit this for 5.8

Thank you!

