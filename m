Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3231BDD72
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmfu-0007xB-30; Wed, 29 Apr 2020 13:22:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TOqq=6N=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTmfs-0007wz-Jm
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:22:52 +0000
X-Inumbo-ID: 84d37e78-8a1c-11ea-9887-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84d37e78-8a1c-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 13:22:48 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so2606670ljd.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 06:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rs9WsZy3UHGbspvjzO3df88pFT8WLgTk+2Zcxlo9B34=;
 b=f3XkZRM+HS2WLok4TniJocpSaAQDoCcsRg2eZ1kbYtnNe4HevBF0z3EwR+vtJHa9JP
 b/Wx5SRmKtnLFkIKeW5aKijeko00vsWqTWz7ukvC6FDTSlgQDx9gaEsbcmMYruBaxIzE
 uuHqY6vzISZKniYkxnN/WbYntcOBZektyX71tgKg9wGWl774kLCHfGLQUx8Oagkgc6bX
 hQFgKk9PDAfrTSZKryPOBq6/d88C8MyzVW6GVKNaKJKpthZYlT8VpDe2IW5TOjyIGpq4
 HiZDbWsVCwA7ReCdMwMo/BU2OueeJsGxe1B8oXJbs2+TdK1nmJTRCSCpcjUbBk1Pg5on
 fMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rs9WsZy3UHGbspvjzO3df88pFT8WLgTk+2Zcxlo9B34=;
 b=ltF6xjANTDNFnLmJmkZc1tqHUzHZIuulOwV3SYjt09WFy17HK2Udd0v6GeTnLBUtg8
 btjaXs8BrOyjIrqm/Jrs97kE8gfRi9liI1fZ9RenpCoMqKbxAiIcLT6z64Vs3qbqSTdq
 zIJ6/f9KgYdgS8Jg3NE6Zfr3DR1R8oijPK4nEbOftZld2pcn5Ygtxge5gzOBWSWF6aRH
 Y3SgPHkzWxxKwMmxQqJkDnPVKQAdtXXnC1tW5dJoAGPJmYTOFKVDpOPppO23MXfcld6y
 4O+EUVSQrlg491jjtDYQgaYJfMgNtqR2o9rXcG3O3+J/fHF3vgHbjnnKIGYRRs7uJfQk
 owqQ==
X-Gm-Message-State: AGi0PuaNKW02iWq/Z49LYeLDozkRLwRCSSLOmz24v/qnp2CFIwBsK7Ll
 7/pPmCNQTmL7GQYeiEZm3VayG6D4bbHkmWqKq29JIw==
X-Google-Smtp-Source: APiQypJS7j0POpX3bUUaJOP2Za5NIykhPxp+ktRsjuIS2sAjVhIgm+Pnz0BaiURcWz6CgTGXS64qt2hBl9BdDVHPrLE=
X-Received: by 2002:a2e:700b:: with SMTP id l11mr17194226ljc.255.1588166567421; 
 Wed, 29 Apr 2020 06:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200424073859.89-1-paul@xen.org>
In-Reply-To: <20200424073859.89-1-paul@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 29 Apr 2020 09:22:36 -0400
Message-ID: <CAKf6xptEUFra2QN=sdUEB5+gkP+zt+LXyWP5YBrxaySvXhOXRA@mail.gmail.com>
Subject: Re: [ANNOUNCE] Xen 4.14 Development Update
To: xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Jan Beulich <jbeulich@suse.com>, tamas.k.lengyel@gmail.com, dwmw@amazon.com,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 24, 2020 at 3:40 AM Paul Durrant <paul@xen.org> wrote:
> *  Linux stub domains (v4)
>   -  Marek Marczykowski-G=C3=B3recki

In coordination with Marek, I've posted v5.

-Jason

