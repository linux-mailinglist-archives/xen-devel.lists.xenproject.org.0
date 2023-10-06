Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D677BC175
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 23:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613841.954655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoscX-0002mB-G2; Fri, 06 Oct 2023 21:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613841.954655; Fri, 06 Oct 2023 21:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoscX-0002jJ-Cd; Fri, 06 Oct 2023 21:44:29 +0000
Received: by outflank-mailman (input) for mailman id 613841;
 Fri, 06 Oct 2023 21:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmit=FU=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1qoscW-0002jD-47
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 21:44:28 +0000
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835bbb2c-6491-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 23:44:24 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1c5c91bece9so21743355ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 14:44:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902c38500b001adf6b21c77sm4428040plg.107.2023.10.06.14.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 14:44:21 -0700 (PDT)
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
X-Inumbo-ID: 835bbb2c-6491-11ee-9b0d-b553b5be7939
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696628662; x=1697233462;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIVn4u1yJXE9GPf/dzGUtUFy43rKq970JPbAFojeRKM=;
        b=b6cmu4Zz4n9pPaI3DkMyTLC/phpvWSGkuxYlXW5qsNdySih4hg5UD2FYe1J6Smrdlq
         qFq2c982p9YTFzWeQ7Sv8WM7Y9hkTZrb9hXZlGj4mdkTl19o/EgV7ql8RQr10Hn2vhEp
         BuJe3IeBEv/YdKrOgQdWPEcuWBezYKQn1hkHFtOv6DPDDW1YzN+SM1WO0VJYDy+3WM1s
         I+Ym+EnWM93wriGXNGnCqXWw+yUlvjjGHIaJpFC6FcF38ScDvB6RMDHkX5XDeA0alOOW
         OVXnRc+3B+v2Ra0Nq6zWUmj4admf1IpO1mAgN3TxrMybfgQoAuPY7bUKmslIpK3nwA/c
         o/tQ==
X-Gm-Message-State: AOJu0YweoABxJ/Lfznr0s9oz+/IWm3P8UiF31qjCVKtSyfLBVYU/JGoK
	Kdxwwpf6t0nQ1axqNdzapMI=
X-Google-Smtp-Source: AGHT+IFUYU/5tT+wcfbTt7FLR7SeyP5pqtB/vKdWiw5BY+hmbuX8hYUXNJeVPi7le5S0sbJt7bwJAQ==
X-Received: by 2002:a17:902:dac8:b0:1bf:22b7:86d with SMTP id q8-20020a170902dac800b001bf22b7086dmr10846553plx.3.1696628662557;
        Fri, 06 Oct 2023 14:44:22 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:44:20 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ian Campbell <Ian.Campbell@citrix.com>,
	Ben Hutchings <bhutchings@solarflare.com>,
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Subject: Re: [PATCH] xen-netback: use default TX queue size for vifs
Message-ID: <ZSB/tKydP056arIy@liuwe-devbox-debian-v2>
References: <20231005140831.89117-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005140831.89117-1-roger.pau@citrix.com>

On Thu, Oct 05, 2023 at 04:08:31PM +0200, Roger Pau Monne wrote:
> Do not set netback interfaces (vifs) default TX queue size to the ring size.
> The TX queue size is not related to the ring size, and using the ring size (32)
> as the queue size can lead to packet drops.  Note the TX side of the vif
> interface in the netback domain is the one receiving packets to be injected
> to the guest.
> 
> Do not explicitly set the TX queue length to any value when creating the
> interface, and instead use the system default.  Note that the queue length can
> also be adjusted at runtime.
> 
> Fixes: f942dc2552b8 ('xen network backend driver')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

