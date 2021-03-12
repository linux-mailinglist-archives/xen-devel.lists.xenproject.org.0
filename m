Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2433905E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 15:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97171.184430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKj9Z-0003w0-Tf; Fri, 12 Mar 2021 14:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97171.184430; Fri, 12 Mar 2021 14:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKj9Z-0003vb-QN; Fri, 12 Mar 2021 14:52:37 +0000
Received: by outflank-mailman (input) for mailman id 97171;
 Fri, 12 Mar 2021 14:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=egQD=IK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
 id 1lKj9Y-0003vW-SC
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:52:36 +0000
Received: from vps0.lunn.ch (unknown [185.16.172.187])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 323cef2e-2768-4c63-bbd8-ccfd19ded29b;
 Fri, 12 Mar 2021 14:52:34 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lKj9M-00AXgg-LW; Fri, 12 Mar 2021 15:52:24 +0100
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
X-Inumbo-ID: 323cef2e-2768-4c63-bbd8-ccfd19ded29b
Date: Fri, 12 Mar 2021 15:52:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: ChiaHao Hsu <andyhsu@amazon.com>
Cc: netdev@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
	davem@davemloft.net, kuba@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YEuAKNyU6Hma39dN@lunn.ch>
References: <20210311225944.24198-1-andyhsu@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311225944.24198-1-andyhsu@amazon.com>

On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
> In order to support live migration of guests between kernels
> that do and do not support 'feature-ctrl-ring', we add a
> module parameter that allows the feature to be disabled
> at run time, instead of using hardcode value.
> The default value is enable.

Hi ChiaHao

There is a general dislike for module parameters. What other mechanisms
have you looked at? Would an ethtool private flag work?

     Andrew

