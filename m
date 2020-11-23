Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7012C0FE2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34815.66055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEVV-0005e1-7B; Mon, 23 Nov 2020 16:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34815.66055; Mon, 23 Nov 2020 16:16:01 +0000
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
	id 1khEVV-0005da-41; Mon, 23 Nov 2020 16:16:01 +0000
Received: by outflank-mailman (input) for mailman id 34815;
 Mon, 23 Nov 2020 16:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1khEVU-0005dV-Cc
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:16:00 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7791be02-7c69-4cb5-9519-eb7a1b0b8520;
 Mon, 23 Nov 2020 16:15:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i2so125135wrs.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:15:59 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c64sm17093555wmd.41.2020.11.23.08.15.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 08:15:58 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1khEVU-0005dV-Cc
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:16:00 +0000
X-Inumbo-ID: 7791be02-7c69-4cb5-9519-eb7a1b0b8520
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7791be02-7c69-4cb5-9519-eb7a1b0b8520;
	Mon, 23 Nov 2020 16:15:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i2so125135wrs.4
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=DUIdO66xWcFwCrqDsQq3zk+eXo4iY2dtdw/XxFTcOTg=;
        b=qJ6OAgiJ2OlB4skX/QIUCdiaDbedeSmjhkQfvIArgBY385uhfhHE9LtOG9qhwD2+HX
         o/ckq8iaRPsrVVB1bXTd7Sm3uo53msF8QRppEU/AvarCEIULKKwI3nemTqUeT/h8HnA4
         nkt8rI6N24gkqFRG79kQNaZ1OnIci/KAdAqAVJQZgrzfHN6oE0dciJos939q3K6g8OnU
         8+2QH5svfTSB7+jl5eXL9cau20yfTlf3fl8rhU7UJ1flRSihsq7QnqpbT55sj5t9zDmV
         eDnobfAFVB+ovNwMSwBOheueWApVWiIpY1bmHyDcz485JrN+lGeGUWq9KnDEG2ak/cNI
         3sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=DUIdO66xWcFwCrqDsQq3zk+eXo4iY2dtdw/XxFTcOTg=;
        b=HGQq0xJz6wgY2aA20v5U8xCu4QBsqhCB05Osz6Kjf368biJby7Ev6Ir5NAO0eR1cw2
         1gRQRx4l8e4ws4+mppoWtJzOXp8v/Dv6h4tNHRJEKLC+yjABY5b79/HHWBjOgoopy10v
         Gqoqjxb9spOO/VwwC+FbnI2aL/b8DWeF8EAuMgQJK3T84GMIMd945ugPoEfr0Uc0iXgd
         mjAEUNgQNjmxDUOvEJJjg4huqtrdQwWEsyI3SO9qlX0Xp3CdhtRWgGyghrMIBOKoJvPA
         j6waPrOkfn7q4xzgPBuz124eOhu6GaPsllnAmBJvyz3fWuFKrhlD0sKNsI4M231kaN08
         gJqA==
X-Gm-Message-State: AOAM531CMCh0tRasGc+DWly8gEd9uJZIFKWAmrGpKHaNpUisan0lvvxQ
	0RDL3fgwF+P2w1PmWn0hDdE=
X-Google-Smtp-Source: ABdhPJwx1Ij0RqLsfIxMRkS6BsWpc0syflT4bsEJbfJnRP4b54MRJiS2FRSgMd7Dd6hOglK13eYdGg==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr418108wru.203.1606148158618;
        Mon, 23 Nov 2020 08:15:58 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id c64sm17093555wmd.41.2020.11.23.08.15.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 08:15:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'George Dunlap'" <george.dunlap@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Ian Jackson'" <ian.jackson@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Roger Pau Monne'" <roger.pau@citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>
References: <20201123160400.1273386-1-george.dunlap@citrix.com>
In-Reply-To: <20201123160400.1273386-1-george.dunlap@citrix.com>
Subject: RE: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
Date: Mon, 23 Nov 2020 16:15:56 -0000
Message-ID: <002601d6c1b3$ed622fb0$c8268f10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMoFzxQ8z2DYHxeStd58zb4GUnL8aczOQRA

> -----Original Message-----
> From: George Dunlap <george.dunlap@citrix.com>
> Sent: 23 November 2020 16:04
> To: xen-devel@lists.xenproject.org
> Cc: George Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@citrix.com>; Wei Liu
> <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau
> Monne <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
> 
> Ian Jackson has agreed to be the release manager for 4.15.  Signify
> this by giving him maintainership over CHANGELOG.md.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Thank you Ian.

Acked-by: Paul Durrant <paul@xen.org>

> ---
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dab38a6a14..a9872df1de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -250,7 +250,7 @@ F:	xen/include/public/arch-arm/
>  F:	xen/include/public/arch-arm.h
> 
>  Change Log
> -M:	Paul Durrant <paul@xen.org>
> +M:	Ian Jackson <ian.jackson@citrix.com>
>  R:	Community Manager <community.manager@xenproject.org>
>  S:	Maintained
>  F:	CHANGELOG.md
> --
> 2.25.1



