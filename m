Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6703F1B6C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168852.308339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiq6-0007OL-W0; Thu, 19 Aug 2021 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168852.308339; Thu, 19 Aug 2021 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiq6-0007Ll-T1; Thu, 19 Aug 2021 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 168852;
 Thu, 19 Aug 2021 14:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lr87=NK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mGiq4-0007LZ-Kq
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:16:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ed209c-00f8-11ec-a622-12813bfff9fa;
 Thu, 19 Aug 2021 14:16:11 +0000 (UTC)
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
X-Inumbo-ID: 00ed209c-00f8-11ec-a622-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629382571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=02KIBDVzYYnGejhT3Pa+neuNp7f/+MnZfhjFTFx5J+A=;
  b=Fm+Unvm1UXfLfY/2sI5fafVpjdU7iCGBaDxPvbx9/XhpiO9doViWd5Xm
   0rMmfP3uCQbfohFtSSMvvRaPOquhW/6SWPvskn2jIdrvAclj6YtZxxEqU
   fK4rgxW2mF7MtdwykqoRSlxGmdVxAKAP/KXCJMvSQiotktXnTE2lrQi/K
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1nuZs55cE1zFjPE1nrB4OR/O/th4N64MRnf7aC6Zgldhzh0fgFZ8Z10iq6iLaTrK3hlchsSFtC
 yvo407OQAeUJgFwikh+c0wFdljtq24x12ZO4o5UJvLjlhHAH0KQ1rc84cYVe74Nj7S9A35Ya2U
 d/Y3ZS+XdUww5wVROCG05FXdfhI7Fa9ZSXvk4ZmgDJLjiJh+uIayNDvxz5/k9vnymNU53AzV0u
 C1Kk+/kclAx+9CjByVHA/EkqKYf/o7xSv30J39MR9hCbpo6FqSKesb6vMudFXIiNPDVK+YAswa
 w9ctSz/2LXYri6OwPyF9xIbW
X-SBRS: 5.1
X-MesageID: 50822205
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:h9wRPa52f8CdsaffIAPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.84,334,1620705600"; 
   d="scan'208";a="50822205"
Date: Thu, 19 Aug 2021 15:16:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Wei
 Chen" <Wei.Chen@arm.com>, nd <nd@arm.com>
Subject: Re: Some questions about virtio-net on Xen x86
Message-ID: <YR5npyXm9SwZ8iMT@perard>
References: <VI1PR08MB3056C6F2FF2916207824CC1492C09@VI1PR08MB3056.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <VI1PR08MB3056C6F2FF2916207824CC1492C09@VI1PR08MB3056.eurprd08.prod.outlook.com>

On Thu, Aug 19, 2021 at 10:38:49AM +0000, Jiamei Xie wrote:
> Hi all,
> I tried to run virtio-net on X86 machine according to the Wiki page https://wiki.xenproject.org/wiki/Virtio_On_Xen. 
> And I Encountered some confusing problems.
> 
> It seems eth0 is not virtio-net, properly a pv-net. I am really confused.
> 
>  I have the following questions:
> 1. Does Xen x86 still support virtio-net based on QEMU backend?

Well, we don't test it, and the libxl toolstack doesn't really help
getting virtio devices.

> 2. If yes, is there anything wrong in my guest config file?

The wiki state that you should add 'xen_emul_unplug=never' to the
guest kernel's command line. (That would be "extra" in your guest.cfg.)
I think that will prevent the virtio-net device from been unplug, and so
you will see the virtio-net device in the guest.

But since libxl create Xen PV device anyway, you'll still have the Xen
PV NIC, so two NICs with the same MAC.

I hope that help,

-- 
Anthony PERARD

