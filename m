Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D710C1DE2E3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:22:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3sp-0004kE-27; Fri, 22 May 2020 09:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mxZ=7E=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jc3sn-0004k7-Bp
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:22:25 +0000
X-Inumbo-ID: bf00ecd6-9c0d-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf00ecd6-9c0d-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:22:24 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id z5so12230839ejb.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sh+C8y8QBl00UA7On7O9K6RZaiY2Jwq1gQ2haVyYZY8=;
 b=yRgMnrWZntJwvaPhNGPB1K9IEovahaQaQMWce7fkULLsgsb9FNzyQYEh/hBFhXcGsA
 XFofnap883h0kBxs6cagX0d8G78FsEPvwirkTZxOaSL9lGkcqwExDM5sHyY4iKMf6XQy
 xD0X0aWM8sy8HR7HBhjL16GlVzRrrmU5zJGRC4xVp6iYLjVeTa8+uNlP4+bOiPlkrNUw
 4NPds4d6szfh5YoFTUWPHBrzzlv+Z0ETXHkLHdHNaXtaeCPCQnkCUCW1OxswOrjelLXN
 CFmYvpJxpwOuQNBir8aru+lecDrC/DaCFGBIVNt0Z6IwKDWxVSRz4c9n5LnH2cLsSIQV
 e0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sh+C8y8QBl00UA7On7O9K6RZaiY2Jwq1gQ2haVyYZY8=;
 b=L2cUUIZ+Q11e+zpwtkUuctcacTmMlGNT/ThdPOh2/Qm+s7xkBWhFO5gMbPmuu1Fwi8
 nuvldm1C2JQ5tVh7ebqGhaBcEgACP+ajS8eXIIi1Rpt9VevdWY5pCVP0zl0DNHSaBw2w
 0d4qozM24SkO8Q7dqtYJcVavABjV7lB8mTttAsAx5XYc+rSaR2+NlfGg1DL1HO3vm7Bv
 tYY5QYsM56RtlagbiRw5gZAF0gke6Iqw7ANme28ZvU3e6Tf7GlRDQnCXOE35BL6/1zqj
 jw6D8bVUo4GqEZm82r18Et+wqgcsM1cQIokg/HLdwQbslrIz+PR2WbN6FsNRs6zPyLMd
 O+9Q==
X-Gm-Message-State: AOAM5325Hgso8I5spw3d0BtnIXupqC5kHMKWfI5aGnb/+LpwmKgM6buP
 mvEREpsdHTQwJLOG+kJRnfKuMnhA3lH2dsnEwPmdvtQtALc=
X-Google-Smtp-Source: ABdhPJyxgjaTA9zbHVY2bqlDipJWD4+oH5caXRBiEBss48xW1OGpGkE3ZCUEnzSDDx+DQ72BrtimtV1wxBS+jBxSppE=
X-Received: by 2002:a17:906:81c6:: with SMTP id
 e6mr6958185ejx.241.1590139343621; 
 Fri, 22 May 2020 02:22:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Fri, 22 May 2020 02:22:23 -0700 (PDT)
X-Originating-IP: [5.35.46.149]
In-Reply-To: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Fri, 22 May 2020 12:22:23 +0300
Message-ID: <CAOJe8K35MObqmxX=Kfah7+vMxGCezboAGMJ7FiX7hqg8LAJ_KQ@mail.gmail.com>
Subject: Re: [PATCH v4] public/io/netif.h: add a new extra type for XDP
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: jgross@suse.com, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/18/20, Denis Kirjanov <kda@linux-powerpc.org> wrote:
> The patch adds a new extra type to be able to diffirentiate
> between RX responses on xen-netfront side with the adjusted offset
> required for XDP processing.
>
> The offset value from a guest is passed via xenstore.

I'm going to send a new version for Linux with the above changes applied.

>
> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
> ---
> v4:
> - updated the commit and documenation
>
> v3:
> - updated the commit message
>
> v2:
> - added documentation
> - fixed padding for netif_extra_info
> ---
> ---
>  xen/include/public/io/netif.h | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
> index 9fcf91a..a92bf04 100644
> --- a/xen/include/public/io/netif.h
> +++ b/xen/include/public/io/netif.h
> @@ -161,6 +161,17 @@
>   */
>
>  /*
> + * "xdp-headroom" is used to request that extra space is added
> + * for XDP processing.  The value is measured in bytes and passed by
> + * the frontend to be consistent between both ends.
> + * If the value is greater than zero that means that
> + * an RX response is going to be passed to an XDP program for processing.
> + *
> + * "feature-xdp-headroom" is set to "1" by the netback side like other
> features
> + * so a guest can check if an XDP program can be processed.
> + */
> +
> +/*
>   * Control ring
>   * ============
>   *
> @@ -985,7 +996,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>  #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>  #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>  #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>
>  /* netif_extra_info_t flags. */
>  #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
> @@ -1018,6 +1030,10 @@ struct netif_extra_info {
>              uint8_t algorithm;
>              uint8_t value[4];
>          } hash;
> +        struct {
> +            uint16_t headroom;
> +            uint16_t pad[2]
> +        } xdp;
>          uint16_t pad[3];
>      } u;
>  };
> --
> 1.8.3.1
>
>

