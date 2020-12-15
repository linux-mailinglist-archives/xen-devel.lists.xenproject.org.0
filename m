Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B52DB12D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54425.94548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD4R-0002ok-UM; Tue, 15 Dec 2020 16:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54425.94548; Tue, 15 Dec 2020 16:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD4R-0002oE-Q6; Tue, 15 Dec 2020 16:21:03 +0000
Received: by outflank-mailman (input) for mailman id 54425;
 Tue, 15 Dec 2020 16:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpD4Q-0002np-AZ
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:21:02 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12d316c8-79ea-43a9-bc75-3556e7c1f6d3;
 Tue, 15 Dec 2020 16:21:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i9so20463162wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:21:01 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r20sm39476238wrg.66.2020.12.15.08.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:21:00 -0800 (PST)
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
X-Inumbo-ID: 12d316c8-79ea-43a9-bc75-3556e7c1f6d3
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GOafdAmRo79rgJtTfM0Wg9m70HMISokFlz0tvo2GS4c=;
        b=LcCZC9tx82IOik8P0OEyec78YogZa3n4352zseHI1/TwAmSq/5KaZRxx1N054iyK0j
         wKjUhZcjAX0vwNKthghMvTlV1LbgbuAtlrvaDrCqXRmHQwg5OmQVWTGMOMTjv22zPk4x
         8s/W9k/TBo5hoQTMR1r2t91uO6C4vcvp7UkkmZUnaxlae6BJe4NyMKP4iiOxFtUzvFks
         TaZKGmSQqma9HNz3no/eRySnIXXlPNjCtDu9qWWPMOZwgY+LEhOy6yqVO42gAQ9rpinA
         m/TECKasOY0EvQBEsS0JqxRFIiOk+zJRhr7XBo6KdPHr+FkSV/PEEu26W3t4jmRY/l5p
         oNxA==
X-Gm-Message-State: AOAM5302QvZJ5rPSlEiJvvxtaoNDpeLWcIMvX0T4wg4cNwxPqkGtHY0q
	esfONTzz6poot+TDQ38uoWw=
X-Google-Smtp-Source: ABdhPJy0/0MfXTCXMm/SAlhMmzBVDhrlj+64MxIdB91fL5fqZcyQVckhcW1XTos/9WxTivBWh8DzSw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr7418129wru.197.1608049260793;
        Tue, 15 Dec 2020 08:21:00 -0800 (PST)
Date: Tue, 15 Dec 2020 16:20:58 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 2/3] tools: remove unused ORDER_LONG
Message-ID: <20201215162058.3flhliqfkzsnbvjh@liuwe-devbox-debian-v2>
References: <20201209155452.28376-1-olaf@aepfle.de>
 <20201209155452.28376-2-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209155452.28376-2-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Dec 09, 2020 at 04:54:50PM +0100, Olaf Hering wrote:
> There are no users left, xenpaging has its own variant.
> The last user was removed with commit 11d0044a168994de85b9b328452292852aedc871
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

