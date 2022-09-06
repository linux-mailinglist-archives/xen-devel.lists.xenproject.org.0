Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BAA5AE8A4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 14:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399844.641198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXx8-0004vY-6c; Tue, 06 Sep 2022 12:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399844.641198; Tue, 06 Sep 2022 12:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXx8-0004s1-39; Tue, 06 Sep 2022 12:45:18 +0000
Received: by outflank-mailman (input) for mailman id 399844;
 Tue, 06 Sep 2022 12:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XS79=ZJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oVXx6-0004P1-J0
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 12:45:16 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c19d80d8-2de1-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 14:45:15 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id s11so14958117edd.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 05:45:15 -0700 (PDT)
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
X-Inumbo-ID: c19d80d8-2de1-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4DOqWL/NrWGyyVP3oVT57noS3Z8hwqwZyoQH9c98O4M=;
        b=jJUxnvsIVLfOGYMFcrdetJoU2ApbsTJj+gPEu4jU+kQTIOQmqDg1EK6H/SoFfR0lP/
         aSJU3gD4FJh8Uh5N3kam1blmqKBvP3GPoI0+S3sv9O6IBlFGG7NPf8tRQ+sFkyEykCX6
         kEwbOvDVsQd32bFrLwJO+bajiNs5lG0ChNNJiS9pMzMxzJKn/MZgTJi3sB+Jxk86uU6v
         XIps+b3Ko+rQULtfGP6jeODb7DGehl2CgXuKVEqSkepc4WA5WqjNqm3ndLssyPSjhdAp
         HYlqPsSKwUth3MxF/mNvy1cGoEonYhKKFDGyNGkR70JqshwalTx9LZjSdFtxWeaWROCr
         Bsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4DOqWL/NrWGyyVP3oVT57noS3Z8hwqwZyoQH9c98O4M=;
        b=Aq+9Iaf3BBenGHog9hpvsAEqgYVgx+/MejuUipHeY6V52mMuPTHLgNeJszXozWEcZG
         mVdk2keefmE/1Cl47vbacWZysurmpqmKAPCdJgBXtOrr8OziGFZgqZPwm5co6TthcRDS
         4mFEVIqGwaUJuy7We3m7MnVnJBIwUFVbYqu/WPUe4RSIFeZgHJj2Fg1aRSAlHshrMFI/
         acmmKz2CIVCexQ0bp2nr9xZNcNHldrADXyTJlxMFaffmjC98F36CPIC47rb7O/3i3Rpv
         rL+lsebZbKzRyJgAheXX9emAwz8cehc28JqElRBMdEzuGmZIAlcoW8uffvsQGoL9Lc83
         nS+w==
X-Gm-Message-State: ACgBeo03R2tsW2KFKPL5+no4A5OIIiOEuu3X+1iXLWn69XBgkzllCZu4
	Payd7mpLQ7CNxFnQLMSIUWEkNIVl7OlE25FHtxzrMGmooZw=
X-Google-Smtp-Source: AA6agR7AQZsgLNazH+wMJwXhZNHf4xdM4OJP1uO9fmFzQ10DrHFBE+q1/7PU7ak1NeoTKbofVcbL35+vrrJmvkKbl88=
X-Received: by 2002:a05:6402:518b:b0:448:f30:38b0 with SMTP id
 q11-20020a056402518b00b004480f3038b0mr40593574edd.164.1662468315457; Tue, 06
 Sep 2022 05:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com> <20220905135019.3749982-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20220905135019.3749982-2-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 6 Sep 2022 08:45:04 -0400
Message-ID: <CAKf6xpvD_FfodR1NnY-NhEE2EADGAMdYM1WcoqPAKsFeamWnSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/libxl: enable in-band reconnect marker for
 stubdom QMP proxy
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2022 at 9:50 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> This enables stubdom reliably detect when it needs to reconnect QMP
> socket. It is critical, as otherwise QEMU will not send its handshake,
> and so libxl will timeout while waiting on one. When it happens during
> domain startup, it can result in error like this:
>
> libxl: libxl_pci.c:1772:device_pci_add_done: Domain 3:libxl__device_pci_a=
dd failed for PCI device 0:0:14.0 (rc -9)
> libxl: libxl_create.c:1904:domcreate_attach_devices: Domain 3:unable to a=
dd pci devices
>
> See vchan-socket-proxy commit message for details about this reconnect
> corner case.
>
> Stubdomain side needs to use --reconnect-marker=3D1 option too.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

