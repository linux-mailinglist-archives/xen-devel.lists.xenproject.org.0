Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D48722073
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543538.848601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65DI-0006QY-5n; Mon, 05 Jun 2023 08:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543538.848601; Mon, 05 Jun 2023 08:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65DI-0006Oc-2s; Mon, 05 Jun 2023 08:05:16 +0000
Received: by outflank-mailman (input) for mailman id 543538;
 Mon, 05 Jun 2023 08:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7G7X=BZ=bu.edu=alxndr@srs-se1.protection.inumbo.net>)
 id 1q65DG-0005o5-G1
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:05:14 +0000
Received: from esa6.hc2706-39.iphmx.com (esa6.hc2706-39.iphmx.com
 [216.71.137.79]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b160829b-0377-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 10:05:12 +0200 (CEST)
Received: from mail-oi1-f200.google.com ([209.85.167.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 04:05:09 -0400
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-38bedafc58dso3393557b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 01:05:09 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 c9-20020ac80549000000b003f4a76d4981sm4435084qth.66.2023.06.05.01.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
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
X-Inumbo-ID: b160829b-0377-11ee-b232-6b7b168915f2
X-IronPort-RemoteIP: 209.85.167.200
X-IronPort-MID: 287170445
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yFEe5q25/vJBX9vqnvbD5ZJwkn2cJEfYwER7XKvMYLTBsI5bp2dUx
 zEZDWzUaPyPamXze9AjOdywoEJTvJPUztdkG1BqqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhXgsagr414rZ8Ek05Kqq5GtB1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1rIBsPH842/t9LQmAU1
 P1bODwMXiuq0rfeLLKTEoGAh+wmJcjveYQe4zRul2mBS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHNnw1NEyojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKDk1UuiOSxbbI5fPSoGYZTm2WSi
 lnrpTWlXBJFM9u00ACKpyfEaujn2HmTtJgpPK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMa8UWqSpz6XkT9riTc5lgTXN1fF+B84waIokbJ3zuk6qE/ZmYpQLQbWAUeHFTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:wY22na9vc+6EMpFtbshuk+AOI+orL9Y04lQ7vn2ZhyYlFfBws/
 re4cjztCWE8gr5PUtLpTnuAtjjfZqxz+8R3WBVB8bfYOCEghrSEGgB1/qa/9SIIUSXnZ8/6U
 4jSdkHNDSZNzhHZK3BkW+F+rgbsb262ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIsE55D/iGOg==
X-Talos-CUID: 9a23:Rx+p3WG01tpCHh74qmJi2BQtOIMLdkThj3aKAk77GWpoeIa8HAo=
X-Talos-MUID: 9a23:D+KcWQU5/nq7f8jq/B2wxzdnF81E2In0WRxTksoBvOKdDyMlbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bu.edu; s=s1gsbu; t=1685952309; x=1688544309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4A3jYCjeUqlQ62V5urF7yBovv+nvp0YeMEm8/LTD4Y=;
        b=gA5JjsgBg6p390ySYrHL+ydSvamxoZy/nfvY+k2HNxSSk5zd/gckfNr2HbkZLJkLKP
         S9Q3NtN4gLZtxi07TIrpw6SHIq6ywBeb0229kMnV6090Aoq/LZdKkiHdf/a6OPGS2Z5X
         yTwqKybLuFdZoxEBDsPR73TZG0xAKbwZYKmjdkHCy5wHP+rOm3ud/LuxotXle4pEMaYc
         lwKzB8K1u49B8wH8EWEHyfC++ef88a5CNfL8DlLG2mLechrLwFA9RWOGn7HwcwcNWCfW
         YlkMAsNBkt2GzqTfDY8M87YIA9m2m1HM0ql0qr+0Wxvq2GYdne1fIS2xpDsiLmgfFrFS
         yIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685952309; x=1688544309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4A3jYCjeUqlQ62V5urF7yBovv+nvp0YeMEm8/LTD4Y=;
        b=ZOFnIqPNuq7/O6gGQvXU9yojTm9sZ+ajYeEK3gWdhSxE/peJ969idqHGkGPsluo5fQ
         4P2JsbOsN5rcUNlz6bJKpHVMLjTX7yveszXicKDcALZMKiRS4IBO3jZ0eOfYyEE4aAlw
         jT+6suTv9aBbmJCTZHXAf6Q/xR/OeJvoTpgUdKxfD4kWRWfJIHVRt4lb7CWd85kp08Pd
         Z96xBW54pUl1gcOBpIaxiEF5HMESkcUO/MgVOn4HM6u6OZNmhx9jAm/uY02SFdUB+Z0O
         mPV3VmT3YhLTyjyjaIUW30BQkmmgzI3Zu8pap2N41v1tuWf+/5wETXRiAcj0ZlVigJ+b
         bqcw==
X-Gm-Message-State: AC+VfDzyatdoZ1lNFEmMjoX5j6pytSDa9e+GqTnCKijprcNqut63D+1U
	YBoKCQqhc4NIsx109yi7u2co/7vYiBvSS2fdXXCSndUKg309RrjweRbEbBWbcSwVsx61ee/oUU4
	EyZj9/SnHCGPvDDPguPQ9pxoAsXIYEC9PRqZoez9LKQ==
X-Received: by 2002:a05:6214:234c:b0:625:e039:5af1 with SMTP id hu12-20020a056214234c00b00625e0395af1mr6631333qvb.42.1685952288849;
        Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qig5w/RKth5j5e7VsoG6Ro3qRwBgFDwzIc+OfuDgKuMNwubkMjommwJhKjlPapm8pNARfmA==
X-Received: by 2002:a05:6214:234c:b0:625:e039:5af1 with SMTP id hu12-20020a056214234c00b00625e0395af1mr6631314qvb.42.1685952288574;
        Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
Date: Mon, 5 Jun 2023 04:04:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
	P J P <pj.pandit@yahoo.co.in>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Stefan Weil <sw@weilnetz.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
	Thomas Huth <huth@tuxfamily.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Sven Schnelle <svens@stackframe.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Rob Herring <robh@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] net: Update MemReentrancyGuard for NIC
Message-ID: <20230605080440.ljfqlc7u6f7ipdty@mozz.bu.edu>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-3-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601031859.7115-3-akihiko.odaki@daynix.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8

On 230601 1218, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> This implementation follows what bottom half does, but it does not add
> a tracepoint for the case that the network device backend started
> delivering a packet to a device which is already engaging in I/O. This
> is because such reentrancy frequently happens for
> qemu_flush_queued_packets() and is insignificant.
> 
> Fixes: CVE-2023-3019
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  include/net/net.h |  1 +
>  net/net.c         | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index a7d8deaccb..685ec58318 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -124,6 +124,7 @@ typedef QTAILQ_HEAD(NetClientStateList, NetClientState) NetClientStateList;
>  typedef struct NICState {
>      NetClientState *ncs;
>      NICConf *conf;
> +    MemReentrancyGuard *reentrancy_guard;
>      void *opaque;
>      bool peer_deleted;
>  } NICState;
> diff --git a/net/net.c b/net/net.c
> index 982df2479f..3523cceafc 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -332,6 +332,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>      nic = g_malloc0(info->size + sizeof(NetClientState) * queues);
>      nic->ncs = (void *)nic + info->size;
>      nic->conf = conf;
> +    nic->reentrancy_guard = reentrancy_guard,
>      nic->opaque = opaque;
>  
>      for (i = 0; i < queues; i++) {
> @@ -805,6 +806,7 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
>                                         int iovcnt,
>                                         void *opaque)
>  {
> +    MemReentrancyGuard *owned_reentrancy_guard;
>      NetClientState *nc = opaque;
>      int ret;
>  
> @@ -817,12 +819,24 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
>          return 0;
>      }
>  
> +    if (nc->info->type != NET_CLIENT_DRIVER_NIC ||
> +        qemu_get_nic(nc)->reentrancy_guard->engaged_in_io) {
> +        owned_reentrancy_guard = NULL;
> +    } else {
> +        owned_reentrancy_guard = qemu_get_nic(nc)->reentrancy_guard;
> +        owned_reentrancy_guard->engaged_in_io = true;
> +    }
> +
>      if (nc->info->receive_iov && !(flags & QEMU_NET_PACKET_FLAG_RAW)) {
>          ret = nc->info->receive_iov(nc, iov, iovcnt);
>      } else {
>          ret = nc_sendv_compat(nc, iov, iovcnt, flags);
>      }
>  
> +    if (owned_reentrancy_guard) {
> +        owned_reentrancy_guard->engaged_in_io = false;
> +    }
> +
>      if (ret == 0) {
>          nc->receive_disabled = 1;
>      }
> -- 
> 2.40.1
> 

