Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC931F3ECF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiflZ-00014v-Cp; Tue, 09 Jun 2020 15:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiflX-00014l-V0
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:02:16 +0000
X-Inumbo-ID: 344bf460-aa62-11ea-8496-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 344bf460-aa62-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 15:02:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u26so2520638wmn.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=s3CKbZ4cdGeIagoNQQCQIiVIGsrlCr7cr1u8QUoLxt4=;
 b=dYMP99xQYZ61axkZ1aiRmqNAUE8DZx7v5lRs/urVZwpSVvKmCqz3ZtnbHPbl7I25u3
 iZnSP8YAkW5+9TZFEhQeBfiZh0uPDlwN05g9AK2TlfnHYfylcJwGZj69acNd8S+5nysr
 gz+t3sjRQuco3w5sjMmR9oWA9F9oxwhRjg93Xm1W0t8d+ML67+mdve5Gg4ws5mC8R7Zg
 wqBDohnvJEm3tN/iCbKvx1VshJ3G3cK+mR/BbNlMh4sP6H1SJfaku++3X0rGFEfafiZ5
 EKepd3uLYNo4kXQHxOGlLvutE7mpdudhkmLK6TPJihdPGCCCJj5PgpsvSZTMgTGWlrvU
 DifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=s3CKbZ4cdGeIagoNQQCQIiVIGsrlCr7cr1u8QUoLxt4=;
 b=kV0beImUvwq65cUSg2epOiKnxj9in8Z4imsDxxSxuZo4maqNfR7LP5N4QafmZ7O3hI
 n0/EDSkHG14yvdc49q6sZRWIBQ8QBGWOv02HmBchUQdwI/uOfl2HUt+m5IkPVKRGKg11
 XhmMMF1FubQAVW13XXOqqHS2UHCIggOmF61kgvzObKt7etIip9JhPZFnZgGalA0Mz1eI
 iD/7ZOK81dm0R3Q0vOg/qcKU3boJHWZca/tkgw8nWZX+iHUv0fVL7N92fuB4EPCHXpzt
 vFxL5EhTWDT0+Aktkcg5PNBQzp3H3t4ZbFCjB8wIg1DQOIq1kkZXWHa24MSOhIm++Ci5
 XK8w==
X-Gm-Message-State: AOAM530A+ON/bBBxVDq2jK6WWfyrDQ9mjNNFRBShB9RxSoJja3sq/r2L
 qb6dsvTMb96z5ys94f2LRaQ=
X-Google-Smtp-Source: ABdhPJyJSwCN73oqHMgDEMu3k6AQHAjeKG8Ru1IXuvtymI0h65sLL7HTsSpxUkutxF6Tqn3Z9hwfUA==
X-Received: by 2002:a1c:6509:: with SMTP id z9mr4754852wmb.144.1591714934559; 
 Tue, 09 Jun 2020 08:02:14 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id 50sm3961168wra.1.2020.06.09.08.02.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 08:02:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200609144850.28619-1-jgross@suse.com>
 <20200609144850.28619-3-jgross@suse.com>
In-Reply-To: <20200609144850.28619-3-jgross@suse.com>
Subject: RE: [PATCH for-4.14 2/2] tools: fix setting of errno in
 xenhypfs_read_raw()
Date: Tue, 9 Jun 2020 16:02:12 +0100
Message-ID: <00ac01d63e6e$f58224c0$e0866e40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJImk/I1P2ywCrTN6Alqf97EMn8vwHT/j8hp90JTqA=
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
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 09 June 2020 15:49
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu
> <wl@xen.org>; George Dunlap <george.dunlap@citrix.com>
> Subject: [PATCH for-4.14 2/2] tools: fix setting of errno in xenhypfs_read_raw()
> 
> Setting of errno is wrong in xenhypfs_read_raw(), fix it.
> 
> Reported-by: George Dunlap <george.dunlap@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  tools/libs/hypfs/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
> index fc23b02586..f94c5ea1e2 100644
> --- a/tools/libs/hypfs/core.c
> +++ b/tools/libs/hypfs/core.c
> @@ -241,10 +241,8 @@ void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
>          if (!ret)
>              break;
> 
> -        if (ret != ENOBUFS) {
> -            errno = -ret;
> +        if (errno != ENOBUFS)
>              goto out;
> -        }
>      }
> 
>      content = malloc(entry->content_len);
> --
> 2.26.2



