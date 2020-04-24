Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716111B7ABF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 17:55:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS0fH-0005FR-3i; Fri, 24 Apr 2020 15:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ms4E=6I=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jS0fF-0005FM-Ta
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 15:54:54 +0000
X-Inumbo-ID: ef9adf30-8643-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef9adf30-8643-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 15:54:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id h2so11061815wmb.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZqtHr3+ETOw5JhX8uQgYET34c9M1nH4rH52lecrW7o=;
 b=jzQANrGm+rWu1Zw+TbAtIPzVOV+MueEWMHaFQxVvuoZiQB5DaKEa1QqHr7CIONAQEP
 8azHKnaWGCE8FZTdKmnkS50ZwfHhbN7Q+eMoug11Dl+7PNF6Q6vWMgjMDjY006su2sQL
 +4k7TXhf4jS4c0ra/AfrOWqGbWkW6E/LnwO8N9UVAhX81mxCp8IgURjZQji79J/knbNE
 qU7H42V7QR/go45xAea+i7XK4Iut1aLFp6GGmnhKVzMVtSgr8TFjUjI/VgCQT4e0knxh
 Z4KY/4p53Vzjd+YyyiEdyAKh8w99NlMqrJUKS9nmRmkoDNs0K6XHjU5gzxTt0jwElp9a
 dSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZqtHr3+ETOw5JhX8uQgYET34c9M1nH4rH52lecrW7o=;
 b=DlswIgkG79UVEH27YaIaH/iBta+VB6xT4Bujjtw+ibG/eGkbLCOlfWsrnsO6ZwuPRS
 L9YipVAlwiLYLapn+SsSh4K1PIthywKFLIBfZxCzLZ/Jnufv2p1BBGcanMRJepx0g35o
 5tkbEhBCYpaX2lyR/Z1JneKKRD8k2dwYUsRXpna/e5mvl5bEZTaQCj2EiH335SdQ2aDJ
 AHXqsjxsULweQdg41J5brM+PuLlqxallz+W8qkykmSf2CipoNEQymNcvvjJ/emehHgLO
 ezjbbNT+SkE9ve5zTYS5t53DfI0kMSvbt7mLD3DEx6oHdkRZbYg42hj/xjlipquAqFWT
 Urng==
X-Gm-Message-State: AGi0PuZ4p8s8alZea3ZjW3Eljw9pfPRQJ9W82ecMUUACraGVCZSH6vZl
 /TDZqfNRLM0MpjaVxPAqrcnuSfYg4jynlk/hAkBNQg==
X-Google-Smtp-Source: APiQypIgltABdTL04G0DMEpfH+mSLIdZjesmvikTLrmyLu9U1G/V1JfB9jwku+czCXYTbrwwx2xToT97XT8pDxzERUA=
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr10644672wml.84.1587743692220; 
 Fri, 24 Apr 2020 08:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200424073859.89-1-paul@xen.org>
In-Reply-To: <20200424073859.89-1-paul@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 24 Apr 2020 09:54:15 -0600
Message-ID: <CABfawh=Vkwp96Q=2sFDYXAQrCHqA-MWxZHxfdTJx-fMEs0Md2Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] Xen 4.14 Development Update
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, hongyxia@amazon.com,
 Jan Beulich <jbeulich@suse.com>, dwmw@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> *  VM forking (v11)
>   -  Tamas K Lengyel

v17 sent recently, hypervisor side is completely merged, only the
toolstack patch is waiting for review & merge

Tamas

