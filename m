Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4062A6524
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 14:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19118.44337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIpZ-0006DH-52; Wed, 04 Nov 2020 13:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19118.44337; Wed, 04 Nov 2020 13:28:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIpZ-0006Cs-1n; Wed, 04 Nov 2020 13:28:05 +0000
Received: by outflank-mailman (input) for mailman id 19118;
 Wed, 04 Nov 2020 13:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i8HL=EK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
 id 1kaIpX-0006Cn-Mw
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:28:03 +0000
Received: from vps0.lunn.ch (unknown [185.16.172.187])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1629d08-ab9a-4c44-a38b-4173cae734d4;
 Wed, 04 Nov 2020 13:27:59 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kaIpF-005D1e-Gs; Wed, 04 Nov 2020 14:27:45 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=i8HL=EK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
	id 1kaIpX-0006Cn-Mw
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:28:03 +0000
X-Inumbo-ID: a1629d08-ab9a-4c44-a38b-4173cae734d4
Received: from vps0.lunn.ch (unknown [185.16.172.187])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a1629d08-ab9a-4c44-a38b-4173cae734d4;
	Wed, 04 Nov 2020 13:27:59 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1kaIpF-005D1e-Gs; Wed, 04 Nov 2020 14:27:45 +0100
Date: Wed, 4 Nov 2020 14:27:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee.jones@linaro.org>
Cc: davem@davemloft.net, kuba@kernel.org, Wei Liu <wei.liu@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Paul Durrant <paul@xen.org>,
	netdev@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>,
	John Fastabend <john.fastabend@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/12] net: xen-netback: xenbus: Demote nonconformant
 kernel-doc headers
Message-ID: <20201104132745.GZ933237@lunn.ch>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104090610.1446616-6-lee.jones@linaro.org>

On Wed, Nov 04, 2020 at 09:06:03AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'dev' not described in 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'frontend_state' not described in 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'dev' not described in 'netback_probe'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'id' not described in 'netback_probe'
> 
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Jesper Dangaard Brouer <hawk@kernel.org>
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> Cc: xen-devel@lists.xenproject.org
> Cc: netdev@vger.kernel.org
> Cc: bpf@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

