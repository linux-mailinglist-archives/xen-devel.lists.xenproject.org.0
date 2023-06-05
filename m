Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B072208B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543543.848611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65Eo-00071o-HM; Mon, 05 Jun 2023 08:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543543.848611; Mon, 05 Jun 2023 08:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65Eo-0006yz-E6; Mon, 05 Jun 2023 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 543543;
 Mon, 05 Jun 2023 08:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7G7X=BZ=bu.edu=alxndr@srs-se1.protection.inumbo.net>)
 id 1q65En-0006yW-Ah
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:06:49 +0000
Received: from esa12.hc2706-39.iphmx.com (esa12.hc2706-39.iphmx.com
 [216.71.137.82]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97c6eb7-0377-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 10:06:46 +0200 (CEST)
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 04:06:43 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-75d0a182bdfso735655085a.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 01:06:44 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05620a16af00b00746b2ca65edsm3985583qkj.75.2023.06.05.01.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:06:42 -0700 (PDT)
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
X-Inumbo-ID: e97c6eb7-0377-11ee-8611-37d641c3527e
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 283094216
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SFuZqqKxL48aKkfpFE+RkJQlxSXFcZb7ZxGr2PjKsXjdYENSgTIGn
 zBNUT+DPPfbZzSmKdpxb96+90IGuJOEmoM3GgBorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f7nWYsWo4ow/jb8kg34qyu4GpwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69ttMWscDK4mwctuCFse9
 dIELxMEaznW0opawJrjIgVtrsEqLc2uJYBG/385nGCfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZBDL2M+PXwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTiIlF0tiuGzWDbTUs6XRJ8Lkn6Yn
 0/p1WPWDiAbEfma1yXQpxpAgceKx0sXQrk6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoA3/U2vC8D+Bli2+S/V+BEbXNVUHqsx7wTlJrfo3jt1z1MsFlZpAOHKfudsLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:tGx3IaC24dKhNC3lHemT55DYdb4zR+YMi2TDtnoBLCC9F/by/f
 xG88516faKskdpZJhNo7G90dC7MBXhHP1OkOss1NWZMDUO41HYS72KhLGKqwEIfRefygdz78
 pdmsNFZuEYY2IK7voSmzPId+rIyeP3iJyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AzB/r/GixNJhmnMdlXiEEUUs4lTJuXH7g5l3hAHG?=
 =?us-ascii?q?DJH9gcu2VZ0OX26phup87?=
X-Talos-MUID: 9a23:yYAemggVPxtXlDIOwVD7v8MpJtppufqiMEA0vLosvOaIBC1VHjKDk2Hi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bu.edu; s=s1gsbu; t=1685952403; x=1688544403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBsE6ZSAQNXrqj2aXIdHreYcEOPnXGm8mY8CFnppvpI=;
        b=nWFwrmgMhXbrvHJYeNb7AYhF8QngBNkRz002nVEn7ynzd+XJAVqIX3lem7ePBdFvmG
         QH0cZ/gbjgMDhSsis9QkyVZs2WcweUaIRtpZITQiUGzYQcG4Bd20U/+7k64h/hNG6Trt
         hVGQMi9FYqi2dqhZGYcpyTQZvm08ghjP50A28fBzgNnZ+4DyXBzogbJlZv49rT3JRP1+
         JftEK6tR8ePYmuAuDAjSGKz3zIlCS/A5U1cbxr/QQdACYga2+NlFs8zy+CkvBZKMMhUq
         Fi67Ea9nzuVflsLgmw7OoGmT/mqNluTsuy1U0//GH88tS4P1myXmq4lrvHw0lmpdTcWB
         q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685952403; x=1688544403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBsE6ZSAQNXrqj2aXIdHreYcEOPnXGm8mY8CFnppvpI=;
        b=Ox8a+unLME5f0lT9VrOH4AJ2aj1Ytf2onACtLiFpYS6Q6OORNVsR6ZqcRuD5kjSsQW
         W0WIeE4xqKOv4VOzBSYYXNf7MD11ITwSDnxsybt21c3WizUjwYY13IaGGYhyciBfCAet
         oCMAwa8yx7BOqk3HNLaGsPTdkPFCwzyLU+nE+/4Mn8IveamW03wKLuloMoIJ/3oXBp62
         /ARGzdArZG0njUm77UNxL2RBGY3wV3gKCvQMNA2VvpFWV0+mvqlBMJuGXmZm7Uqlv4gy
         8CmUGuv2xeZ4TQn4MUlJHdNmpfvxraPeTlNgtBkLKcnO9V4KlCCsn26wnXFgKPIP8ce3
         PP9A==
X-Gm-Message-State: AC+VfDz1Z0U16XUVIVx3fO5KofuLno6CCBLZckp1AXM8RtCIljFdKZdi
	bnwZEYXgusbiDi+x4AzlRpLxJ1gYxhgN9Fm6WGV7EcIKCAjB/Fc3OknmZqkawCssdxCb0hYPvFv
	cGUp13dCGuzO4nRJmd124VdKudUAQEXbk5xs5BL7MBQ==
X-Received: by 2002:a05:620a:608a:b0:75b:23a0:deba with SMTP id dx10-20020a05620a608a00b0075b23a0debamr28828592qkb.56.1685952403314;
        Mon, 05 Jun 2023 01:06:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54WffJVAgziK1v5fGXGcEP6ZhKkhUM5WL01CapRdgLlA4i3sV9HcqJ6zPjS6RJdIDOenz0Jw==
X-Received: by 2002:a05:620a:608a:b0:75b:23a0:deba with SMTP id dx10-20020a05620a608a00b0075b23a0debamr28828575qkb.56.1685952403068;
        Mon, 05 Jun 2023 01:06:43 -0700 (PDT)
Date: Mon, 5 Jun 2023 04:06:38 -0400
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
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
Message-ID: <20230605080616.ooanu5pk2pvs57yi@mozz.bu.edu>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601031859.7115-2-akihiko.odaki@daynix.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8

On 230601 1218, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> In preparation for such a change, add MemReentrancyGuard * as a
> parameter of qemu_new_nic().
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>


Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

One minor comment below.

> ---
>  include/net/net.h             | 1 +
>  hw/net/allwinner-sun8i-emac.c | 3 ++-
>  hw/net/allwinner_emac.c       | 3 ++-
>  hw/net/cadence_gem.c          | 3 ++-
>  hw/net/dp8393x.c              | 3 ++-
>  hw/net/e1000.c                | 3 ++-
>  hw/net/e1000e.c               | 2 +-
>  hw/net/eepro100.c             | 4 +++-
>  hw/net/etraxfs_eth.c          | 3 ++-
>  hw/net/fsl_etsec/etsec.c      | 3 ++-
>  hw/net/ftgmac100.c            | 3 ++-
>  hw/net/i82596.c               | 2 +-
>  hw/net/igb.c                  | 2 +-
>  hw/net/imx_fec.c              | 2 +-
>  hw/net/lan9118.c              | 3 ++-
>  hw/net/mcf_fec.c              | 3 ++-
>  hw/net/mipsnet.c              | 3 ++-
>  hw/net/msf2-emac.c            | 3 ++-
>  hw/net/mv88w8618_eth.c        | 3 ++-
>  hw/net/ne2000-isa.c           | 3 ++-
>  hw/net/ne2000-pci.c           | 3 ++-
>  hw/net/npcm7xx_emc.c          | 3 ++-
>  hw/net/opencores_eth.c        | 3 ++-
>  hw/net/pcnet.c                | 3 ++-
>  hw/net/rocker/rocker_fp.c     | 4 ++--
>  hw/net/rtl8139.c              | 3 ++-
>  hw/net/smc91c111.c            | 3 ++-
>  hw/net/spapr_llan.c           | 3 ++-
>  hw/net/stellaris_enet.c       | 3 ++-
>  hw/net/sungem.c               | 2 +-
>  hw/net/sunhme.c               | 3 ++-
>  hw/net/tulip.c                | 3 ++-
>  hw/net/virtio-net.c           | 6 ++++--
>  hw/net/vmxnet3.c              | 2 +-
>  hw/net/xen_nic.c              | 4 ++--
>  hw/net/xgmac.c                | 3 ++-
>  hw/net/xilinx_axienet.c       | 3 ++-
>  hw/net/xilinx_ethlite.c       | 3 ++-
>  hw/usb/dev-network.c          | 3 ++-
>  net/net.c                     | 1 +
>  40 files changed, 75 insertions(+), 41 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index 1448d00afb..a7d8deaccb 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -157,6 +157,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>                         NICConf *conf,
>                         const char *model,
>                         const char *name,
> +                       MemReentrancyGuard *reentrancy_guard,
>                         void *opaque);

Does it make sense to roll *reentrancy_guard into NICConf here?

