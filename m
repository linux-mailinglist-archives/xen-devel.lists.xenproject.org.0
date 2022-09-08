Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAD85B28AC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 23:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403657.645822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWPHw-0007PX-Af; Thu, 08 Sep 2022 21:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403657.645822; Thu, 08 Sep 2022 21:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWPHw-0007Mu-7m; Thu, 08 Sep 2022 21:42:20 +0000
Received: by outflank-mailman (input) for mailman id 403657;
 Thu, 08 Sep 2022 21:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4jV=ZL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWPHv-0007Me-5M
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 21:42:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c6cde20-2fbf-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 23:42:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id m1so26345503edb.7
 for <xen-devel@lists.xenproject.org>; Thu, 08 Sep 2022 14:42:18 -0700 (PDT)
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
X-Inumbo-ID: 1c6cde20-2fbf-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=43LjiARxRil0ORnjLMo8kfDU6oXaHD6Zps3OhjmUekk=;
        b=AP8uMklTFs8KnCcezXkSTWLw/AAV0qazAwxILW5cMjvDFIW7tBEHp4W7Xh5AToclbm
         xV9xwQ8xcLFGUaBSzM8IHrvJCmvo5eeN28ILoiupMVCPpWawI84GXeXha8lAM2WEGQIP
         83HbY/XHQRm8B4MvqNmH2h1CG9aCpWCzDRjWi4rKoj2RDsFDezRd3QxYH9rqzt0kKHUI
         swGQ3pijsZNCSm1ZQOtYSivansCguHp3h2vOkkqG9UdCHu7b6ACs6yOV8WIRcBOMZYBG
         TKG77P1gDgQ6dESNhSavPJLI7qY5b5Jbi7FRTo28d0BkyjP8NG4msGGMbDwHibd8yFQz
         Kp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=43LjiARxRil0ORnjLMo8kfDU6oXaHD6Zps3OhjmUekk=;
        b=YtKAYy6D7O+GT+wLcpbKwEApvltSa84RktjyQ5QvA5ZOseGHbKIYTQ3FMxJJAXLtHG
         eLiuB9m4zTJvheIJR0oIdVGoGUAIMiL07PwBJ4WqsrqxDjY/vPCoJrADfktvEE3CeEWO
         5xhSfKYB9pljdlJJ3MNN6Ek3xr+Fl6rHpDBp13xE5D3GQ4qiQnneoVslMsCo7aO7unXk
         gA3Ev3VQuLToe3bpMlXIzgcliBD864B+M6zitaYU/fbSxlr6pg5wgP5FcZ1i7b9hoE2X
         Jzm7TTJIJEraoCQ1lBGjo/6t4zUuqY6Br1f0xw0WoDoK94Uwo8i2NB1adDvS6c6pBKke
         SlaA==
X-Gm-Message-State: ACgBeo3SYBqRWrNq2bjpIeGj+h5rHw85AfAaf5aUoZNY5zz3/wpBmDoU
	+jNjL0th7P5/RyHvIo9rBv1w33BfNW5/k818DUOdp6T1
X-Google-Smtp-Source: AA6agR6KCZvJabkxJ1gmHWKRAaPFdDL6ePGXqg8Nqc0PTtUUgyGOIh/SywXaz80QGsU23QhbWqEossy0SF85oG69TXQ=
X-Received: by 2002:a05:6402:2712:b0:448:e383:1f37 with SMTP id
 y18-20020a056402271200b00448e3831f37mr8966169edd.375.1662673337264; Thu, 08
 Sep 2022 14:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220908195113.218201-1-jandryuk@gmail.com> <20220908195113.218201-3-jandryuk@gmail.com>
In-Reply-To: <20220908195113.218201-3-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Sep 2022 17:42:06 -0400
Message-ID: <CAKf6xptMiCArNmpzDs_ekemNiNOfFo21KkvpGLr4SY6MNnjeLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xl/libxl: Add ability to specify SMBIOS strings
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 3:51 PM Jason Andryuk <jandryuk@gmail.com> wrote:

> @@ -1783,6 +1784,57 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_replace_string(config, "acpi_firmware",
>                                 &b_info->u.hvm.acpi_firmware, 0);
>
> +        switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
> +        {
> +        case 0: /* Success */
> +            b_info->u.hvm.num_smbios = num_smbios;

...

> +            }
> +            break;
> +        }

Andrew pointed out this stray curly brace breaks bisection - its match
at the beginning of the 'case 0' is introduced in patch 3.  Sorry
about that.  I'm AFK, but will send out an updated patch tomorrow.

-Jason

> +        case ESRCH: /* Option not present */
> +            break;
> +        default:
> +            fprintf(stderr,"xl: Unable to parse smbios options.\n");
> +            exit(EXIT_FAILURE);
> +        }
> +
>          if (!xlu_cfg_get_string(config, "ms_vm_genid", &buf, 0)) {
>              if (!strcmp(buf, "generate")) {
>                  e = libxl_ms_vm_genid_generate(ctx, &b_info->u.hvm.ms_vm_genid);
> --
> 2.37.3
>

