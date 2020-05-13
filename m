Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B91D13F1
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:05:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYr36-0002j9-Rt; Wed, 13 May 2020 13:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYr34-0002j3-Vs
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:03:47 +0000
X-Inumbo-ID: 2daf0154-951a-11ea-9887-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2daf0154-951a-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 13:03:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f18so17671399lja.13
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XOKqvYgS51zYyBhTlMbM5DoC7qOBC4b/bGpL7WiFAEQ=;
 b=mGJRf4YnFkQ1mpKs205pKlnb/dHaNcuIBLvuaDiH5qkMYXqY7BaKi8ye4tiu8f4i52
 Ff1T6L9TrECR3H+ssUt38sC92TEjbl+FG/E/LAC2bH//qkArV7Y+WOsh10VRrT7ZvnSQ
 fQxTUfkV3ZHIGpaUyWEtMTChpCx4dORmzM+ZTc5WrnAo37BfPQLF3O6d/+UpFLShFzh8
 jWW9qIsWIZpd7YlcLEtKuVAfWrfUwgjHoCA0muKlIWOY1gGoTnf1BSpr06oVm3UujAIh
 ACxN4llS6C9NXr99N1MZgVIcsGhY7ZltlBYvvQicHSAB7Uc6PSH/B8HpbFSrcmqXa0eL
 lFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XOKqvYgS51zYyBhTlMbM5DoC7qOBC4b/bGpL7WiFAEQ=;
 b=Qr0PxGF9hiFACMX08Zxx7mF1iUUFRqyKs6geG6Kkipqh9C9mPg+KibhX33UX5EY5Du
 Ei7wovcKTsrTMw9wljCTCwGp0Lz0N6NQb0c/P7lXycOQWgLutDozQXk+KqUDdgNWtMYa
 bqXbLh4/89KBaVlKs2OzA2EI/ilsckiPVTgXzOITglHAv8iq09oyh9Jj1RDsYwEb7jar
 96Tyr7oEIYsA01Cs/4/sTsYCzQticmJuAD13Q72N6faDitsHdjAGLnnA8IXf8QECl9ue
 P6bIDwGnRp6pI+Fmu8bGp7ezl4knO91yejCvHyn+a4RNfVE8/uBZU1fFcAMFNC3yg/20
 FyXg==
X-Gm-Message-State: AOAM532DA503lW2YkE44158QANjSadAjjiKzWyEytuptnqXsnRdqhhH7
 2Y06Yo+X68mKXqL7fYMf2Yei11ZptIbrkyHaDc0=
X-Google-Smtp-Source: ABdhPJzVAvcoO6m9+UZDWniMLTWgHfb34alX1dNieiUZY0nQN7N1WpDrFpmGtkYX3RYXBL3ljAA7pzKk9kUEexJ0ZLo=
X-Received: by 2002:a2e:958b:: with SMTP id w11mr2590090ljh.262.1589375025202; 
 Wed, 13 May 2020 06:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
 <a42395202aef85d983dd9db361c366a6d03e313f.1589330383.git.rosbrookn@ainfosec.com>
 <BAD53A57-6842-43E6-AA5B-6C42B7290D00@citrix.com>
In-Reply-To: <BAD53A57-6842-43E6-AA5B-6C42B7290D00@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 13 May 2020 09:03:32 -0400
Message-ID: <CAEBZRSfxAeZdbvkOQ+fkVso_6v1qVPih6AQm62NC=oyhkgsU0Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] golang/xenlight: add necessary module/package
 documentation
To: George Dunlap <George.Dunlap@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> One thing I forgot to mention about the README is the long lines =E2=80=
=94 do you mind if I wrap those before checking it in?

I don't mind at all.

> > Also, add a copy of the LGPL (the same license used by libxl) to
> > tools/golang/xenlight. This is required for the package to be shown
> > on pkg.go.dev and added to the default module proxy, proxy.golang.org.
> >
> > Finally, add an entry for the xenlight package to SUPPORT.md.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks!

-NR

