Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D027BAD3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 04:29:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN5Me-00019G-Vg; Tue, 29 Sep 2020 02:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+oK=DG=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1kN5Md-00019B-W1
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 02:27:36 +0000
X-Inumbo-ID: 9adc07c7-09c3-42ac-a843-0714f6e5dae0
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9adc07c7-09c3-42ac-a843-0714f6e5dae0;
 Tue, 29 Sep 2020 02:27:35 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id p9so12678343ejf.6
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2020 19:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TZkoAzbnAzWbhou1VxfQR+qVVsg6KtopJjkuWtWP7Vg=;
 b=hCaOaMsDJC5yMG/xUYjFTdPrWfxn2KIZLVEfkYNFnX5p7JOJlNyMGQwDtjG4XVCQNW
 aN7Ve6DvT31yDeUmX5tM/+wbXTYZyeb3ZwVEGTtR4OZ92xVw8elTsxcv92q99rC6OMBw
 XySRt5AGzqU+hTXMFn1w+BuD1uWIoVjuZgIQh9rHn5FnubeHVU9PVVlwFWLoE1W3Sf5L
 d2D3X2Jnazf2j6rV3Cwws35ZhvAG1rbWDm0y3E0m9aiaz5ED40c+w+nIi/3XL+D0TpvL
 2khZZgbbGZ1x4P3wndD+tAwo9quYXefVIBnH5zB8AZUmHTyNemjGA5zQUJMn9EuvsxuI
 gwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TZkoAzbnAzWbhou1VxfQR+qVVsg6KtopJjkuWtWP7Vg=;
 b=UjLM3Ni76aOJ7/bLypH3fhyiEN7FwNi98gOcreBEbxik9hUeFqQdRukEDcOtGiAwX0
 TIUrhgnNIO7Uw6bLxl5/xjmSPsvysqb5qC4LegoXMD8tOmAYUCXf2mRXIwr4YfkGEnYl
 czs6AxtFx89DGKgs1cDHjwEq7Ll1hkRv8wUT45DqvzoA1NIncKx+hCaj3canXwPqDQGs
 2A7n/0NJLZlZlMznFj8w8nWfQqHd2ZulxY0A6Np9jZScvKeWwBO3FU/I/NDfXfM+7hFo
 Jh4/yhyeJFX/lZ+WCbkELgT7bRKWKAkogNbAZbwHtzGJcXE7odHNH9ZbloX22Ab4ic1K
 +wjQ==
X-Gm-Message-State: AOAM532odPBVMGjX+f4n4hXK+EavtF8OWala6hShPscU+2ihdbo8d5EE
 Kan0QYqMbOnLZG2QzoFLp0O+Na40t/8vCOxDqdwMrvfD
X-Google-Smtp-Source: ABdhPJxIJukWmJ9TrVxZA3rgJz8vgYqZY1vky8QBrdyQxYiydOrJEez7q/ZH4mF7I/BLCU6x3LZxRzShVWWClwxSZyc=
X-Received: by 2002:a17:906:170e:: with SMTP id
 c14mr1613702eje.275.1601346454164; 
 Mon, 28 Sep 2020 19:27:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:5a89:0:0:0:0 with HTTP; Mon, 28 Sep 2020 19:27:33
 -0700 (PDT)
From: Pry Mar <pryorm09@gmail.com>
Date: Mon, 28 Sep 2020 19:27:33 -0700
Message-ID: <CAHnBbQ_makue63BgbimKhwuTuu_8stAL7kE_qjhrPav=emeiTA@mail.gmail.com>
Subject: re: [RESEND] [PATCH] tools/python: Pass linker to Python build process
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "ehem+xen" <ehem+xen@m5p.com>, ijackson <ijackson@chiark.greenend.org.uk>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

>Unexpectedly the environment variable which needs to be passed is
>$LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
>of the host `ld`.
>
>Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
>it can load at runtime, not executables.
>
>This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
>to $LDFLAGS which breaks many linkers.
>
>Signed-off-by: Elliott Mitchell <ehem+xen@xxxxxxx>

Tested-by: Mark Pryor <pryorm09@xxxxxxxx>

