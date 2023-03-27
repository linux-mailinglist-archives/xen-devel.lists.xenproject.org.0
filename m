Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7476CA5F4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 15:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515264.797947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvA-00084V-9u; Mon, 27 Mar 2023 13:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515264.797947; Mon, 27 Mar 2023 13:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvA-00082k-6W; Mon, 27 Mar 2023 13:30:00 +0000
Received: by outflank-mailman (input) for mailman id 515264;
 Mon, 27 Mar 2023 13:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jQtV=7T=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pgmv9-00082e-5d
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 13:29:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76e25d97-cca3-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 15:29:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id w9so36305082edc.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 06:29:56 -0700 (PDT)
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
X-Inumbo-ID: 76e25d97-cca3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679923796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2IWQeuNpYqwe5hUtmOdOz1mQfQsXHH0YFrd1VLuxSI=;
        b=YcGlnE9ZXqIIqqs0xXblIU9r6f0pzL09TvIfP33q8DV8NW8mGQJ8mR+5Xfp90cnVud
         wLjRr1PKbJwQb9YJXdcl73MBAevzTni1kFyIp5YLs7z6Peb8OIYwng6HCJ8Fj/N9l3EU
         xZheA/FkR89aIKkvHnrlZ8tHQK84bhWUPM/y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2IWQeuNpYqwe5hUtmOdOz1mQfQsXHH0YFrd1VLuxSI=;
        b=Xln/k4RM6mciU+h+9duLCG0Gdz7xvFlcYYuGEa5X2/jYkh1lGBnSXMvkDeIMfEymDT
         RLWkugPil+Z8DZDle/htA2b5cDiadqgPVbPXexbR66a7qfL8I2CV8JUoCx54CUPZj9xa
         nUXu8dKnIzf6yF/5WkS5AtFTgANenOcdmUXqoUHUORCBWA8i1fVmtyQEbc4z0mzqvsYr
         KQ4KtOHrsYHtKjPsU0eTRIXONiF7huwBi6XbZ0XGqd57G+10ReRE6Gu2t5+eyIv69M7n
         baskozFHV09K1D4DYaVTzH5QgEe1DXbXJ/O0M6tTKKN2OBr4+TQoCePgk3r9VGeHvmQW
         7kTw==
X-Gm-Message-State: AO0yUKUzGgTHYsmPvmUZIv0xzA6OxoSddQv7NKJr0hXRWMf0ARjpaI1J
	3P0iJC8MFKcOSp36pO9on1EPQVVph6UeX8Pn2sk6GQ==
X-Google-Smtp-Source: AK7set85LZGxIFp/2Fg9B5pHIq+E9otKW6+T3IL6w518xuYM0ViVCHkYiabkAhYbEr6f3+dRf3P7iSBQZ5kZZDrRLW0=
X-Received: by 2002:a17:906:ca41:b0:939:a51a:dc30 with SMTP id
 jx1-20020a170906ca4100b00939a51adc30mr9681659ejb.2.1679923796342; Mon, 27 Mar
 2023 06:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230324214430.3277862-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230324214430.3277862-1-andrew.cooper3@citrix.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
Date: Mon, 27 Mar 2023 14:29:45 +0100
Message-ID: <CAPRVcucwjNCiHnioRHN_Rv7k5E3LOwU7N77Kj1NTb_MBmqux0w@mail.gmail.com>
Subject: Re: [PATCH] x86/ucode: Fix error paths control_thread_fn()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Sergey Dyasli <sergey.dyasli@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 9:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> These two early exits skipped re-enabling the watchdog, and restoring the=
 NMI
> callback.  Always execute the tail of the function on the way out.
>
> Fixes: 8dd4dfa92d62 ("x86/microcode: Synchronize late microcode loading")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Thanks,
Sergey

