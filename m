Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244271B4CF1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 20:56:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRKXS-0002Yj-3v; Wed, 22 Apr 2020 18:56:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldCW=6G=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRKXQ-0002Ye-5q
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 18:56:00 +0000
X-Inumbo-ID: e73757b2-84ca-11ea-b4f4-bc764e2007e4
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e73757b2-84ca-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 18:55:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g10so2580799lfj.13
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gddG5PZDCbgewde5LFsrnaQZpH7b9VEvC8Um1KlBE4Y=;
 b=mYha5onfeMct02gBKfTECQcjXnR9cz+EgqVe/LdAWwX2NaZ77Y1IXF0z1Eakx57XIW
 WOSXJ6odvESCp/Ye94zaCXmzB19eVKXLFjXx+dzESV4F/zAtdCcYrbFnQ25QPdFm1MM/
 1oO3MokEguCiRsVUxw0N81rwTPFFecjwNENSUewDAE2gKKWtjob67SH2y8zGm3Hq3bFY
 qgzHSPC1CK0bT8/MsMwNjLgIVI2nMk9BDx5gciINeOsBbj9I/t4sdeh6Gmh8IlBUr3Q8
 TJPrrsbD9ZkWpr/ScksMqRtydFQS9oMzdlkSiDYWWYMwHBHiWbpXQlWr6fKh3e6sNv29
 II8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gddG5PZDCbgewde5LFsrnaQZpH7b9VEvC8Um1KlBE4Y=;
 b=ac3WUxMtHy0a3qZOe2a8vIbK0G8R4714yeKUv9LwliclW2uEanOphLOCCiS6P815qF
 IyFQ4bM9f6SdsqWX6kID6rqloWPM9IZ+6D+ktjV6SoNY6zwuj40k1pE4obcZWaBdU/Tc
 P/TdhBO3qnGdLO2h774gXgJbiPNzOgjFxi18D0stQAsM6Out2BygVFnJE0jtxLpQ8U1z
 D6t267g0er6UKnjzBw7lwct/WOn4kKWeLJBDOT+Jx1CCeezoMvl27YlZqAFW+LN+3g5T
 wQmRiY6F8CeHN4UijaOj+MKDVexBR2ZQBzYvpJElQ+w0pr3mtt8aat6v+0eZsGara3da
 GVHA==
X-Gm-Message-State: AGi0PuaYnGXySMgWfBnONlkAetGgqHn1keD5ASvXeCC0Zr7sqb3oVI1U
 vmACAcBUIf12ruu60dWecGCE7oG4CYYYJhTQLsS/TxLk
X-Google-Smtp-Source: APiQypJzaeYlYzHGR2Z41U+t6aDQKbWRs6Av9fAAJKSgW8XTx5rSsobCmNW/QlAHAVWp+sl34kdpih26EQPbCjGG/tM=
X-Received: by 2002:a19:1c3:: with SMTP id 186mr17922436lfb.191.1587581758004; 
 Wed, 22 Apr 2020 11:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
In-Reply-To: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 22 Apr 2020 14:55:46 -0400
Message-ID: <CAEBZRSe=yB6Y1TQSQqAphDw8gVKm8VhpqEYsKXgVnZjvPNPUnQ@mail.gmail.com>
Subject: Re: Golang Xen packages and the golang packaging system
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> One question I have from the above is how the xen.git RELEASE-X.Y.Z shoul=
d correspond to the vA.B.C in the golang package repo.
>
> The obvious answer, of course, is (A, B, C) =3D (X, Y, Z); that is, xen.g=
it tag RELEASE-4.14.0 should create a golang package tag of v4.14.0.
>
> The issue with this is that golang assumes you=E2=80=99re using semantic =
versioning; so a `go get -u` would normally feel justified in upgrading fro=
m v4.14.x to v4.15.x.
>
> A couple of possible responses:
>
> 1. Declare that OK.  That would mean not only that we have to have v4.15.=
x be compatible with golang source code written against v4.14; it would als=
o mean that v4.15.x needs to be able to *compile* against libxl version 4.1=
4.  Which might be a good idea, but we=E2=80=99d want to think carefully be=
fore making that kind of commitment.
>
> 2. Declare that people need to use `go get -u=3Dpatch` when updating, and=
/or use go.mod &c to manually restrict the version of go to use to the curr=
ently-installed Xen version
>
> 3. Map (A, B, C) =3D (Y, Z, 0).  (i.e., RELEASE-4.14.5 would make tag v14=
.5.0 .)  `go get` wouldn=E2=80=99t update automatically, but it might be co=
nfusing which version *should* be used; particularly if we ever roll over a=
 major version for Xen.
>
> Any other possibilities?
>
> I think I=E2=80=99d start out with #2, and then consider moving to #1 at =
some point in the future.
>
> Thoughts?

We should also consider aligning with Go module versioning
conventions. For example, right now the package is unstable, so
according to convention we should be in v0.1.x. A "v0" indicates to
the Go ecosystem that, at this stage, we will likely make breaking
changes to the package API. So, tagging v4.14.0 is a bit confusing
since this indicates that we are on the 4th major version of the
package, and that it's stable. See [1] and [2] for more on these
conventions.

However, things are obviously complicated by the fact that the
xenlight package depends on libxl, and following convention might make
that relationship less clear and difficult to track. But, if we stray
from convention we at least need to be clear about it and have a good
explanation why.

That said, unless we can come up with a good way to follow convention
*and* keep the libxl version sorted, I think #2 makes the most sense
right now.

-NR

[1] https://blog.golang.org/publishing-go-modules
[2] https://blog.golang.org/v2-go-modules

