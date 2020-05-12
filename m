Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CB1D017A
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 00:01:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYcwQ-0007Qk-Ty; Tue, 12 May 2020 21:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWS=62=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYcwP-0007Qf-Hh
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 21:59:57 +0000
X-Inumbo-ID: ea17d0d4-949b-11ea-9887-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea17d0d4-949b-11ea-9887-bc764e2007e4;
 Tue, 12 May 2020 21:59:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o14so14395722ljp.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1kBnuCyLYWMDCij7B9yRQ+3dh3pWBlQAb15NdI1M4/s=;
 b=TYf7Iw09yr6QDw2iGLTkkSQD76o+BhADrPLJoB6ZSgenzELnS/IhxwMi91nIRrsX9G
 A+0sBVKVJo+WNu3ru64Bk4smr4zPXHWaALGSGnlQtUnqkKl+afKKqBFx1gM55r+/QnWS
 ElrTqGDKNOVn4NDI5DAkaU4xgj+f6zFiLIFXnNe9rC1tW7YSYmK2fTgqdCkm39WYq8VK
 hdjdQ9z5G3woW2yjibOTNU3RSH1/qBLSw5L1dbrVAGb8p+CiybBfMoH9igoUDKR0qjZ1
 j2Gow+ndm6fPKf+iW3PxYoUDkBdHivZTe8o9DDqjqFVXsE7lm7y7XSzc/qWz04Vlgz8L
 biPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1kBnuCyLYWMDCij7B9yRQ+3dh3pWBlQAb15NdI1M4/s=;
 b=Ho+pbsBtDSv0ETcQ3ehkMuPCFst/7DvmcWOptHn8JE8q8G37pzvqNRZWFQFn/EougX
 +f8miZixNibTKIhbbiY171GO9vzgRVMR3DIT+xBlPe7k8D2SfDJJE7FVf4+0h0X7JgIT
 SD4PW6PYd+/qU+hCl8AkV2p9h7lCDz6++ReWQQNCkx0ddwXqyOnNuUJAJkrlwGEvJCIa
 a5FAj3mmSh/8KfFw+Zft+PlEKOOgjOqw4IKHAEHLon1awh76cuDsaRviZKjZL4thDKzM
 OifIWBNQPM3HPiYEmyO/wM40BkEnjYHli5APaIcarR9/iT30mSVZDPH23Eu/NDUxEzbH
 p0gg==
X-Gm-Message-State: AOAM533ZtWZF5udrAXupn60YP6DdNCCxG0GhLxk5yXV3unDh5NcWRqKE
 xpmG9CoY/MMX8btg/LNO7954HzRZvpbCyYXklg8=
X-Google-Smtp-Source: ABdhPJwvt5RYwmZtpejdCCBF80XIZtKj204yF7jL3X4rqtP1DLQrLLj+xEt7Qg2SUvpyWB4cg/U/aJURcN4vkorcPi4=
X-Received: by 2002:a05:651c:c8:: with SMTP id
 8mr14222697ljr.182.1589320795068; 
 Tue, 12 May 2020 14:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <9f5000ceea14e6818e491df38eba161c800b4cf8.1588282027.git.rosbrookn@ainfosec.com>
 <16919263-9167-4BB1-9583-F7899FE3A246@citrix.com>
In-Reply-To: <16919263-9167-4BB1-9583-F7899FE3A246@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 12 May 2020 17:59:43 -0400
Message-ID: <CAEBZRSd90nhgL7K2Z2BUN=3NShpBO4Awsx3hdO5WSY8NZHzPBQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] golang/xenlight: add necessary module/package
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 1:20 PM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
>
> > On Apr 30, 2020, at 10:39 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote=
:
> >
> > Add a README and package comment giving a brief overview of the package=
.
> > These also help pkg.go.dev generate better documentation.
> >
> > Also, add a copy of Xen's license to tools/golang/xenlight. This is
> > required for the package to be shown on pkg.go.dev and added to the
> > default module proxy, proxy.golang.org.
>
> libxl is actually under the LGPL; I guess we want the xenlight package to=
 be the same?

Thanks, yes it should probably be the same.

> As discussed before, arguably distributing the *.gen.go files won=E2=80=
=99t be sufficient to comply with the license, because they are not the =E2=
=80=9Cpreferred form of modification=E2=80=9D: that would be libxl_types.id=
l, along with the python generators.
>
> OTOH, I suppose that=E2=80=99s sort of Google=E2=80=99s problem in some w=
ays...

Yeah, I guess that's true. Besides, modules are not intended to be
modified (they are store in a read-only cache by default), so I don't
think we need to worry about that until a separate repo is involved.
Anyone who looks on pkg.go.dev for now will see that xen.git is the
source repository.

> >
> > diff --git a/tools/golang/xenlight/README.md b/tools/golang/xenlight/RE=
ADME.md
> > new file mode 100644
> > index 0000000000..42240e2132
> > --- /dev/null
> > +++ b/tools/golang/xenlight/README.md
> > @@ -0,0 +1,17 @@
> > +# xenlight
> > +
> > +## About
> > +
> > +The xenlight package provides Go bindings to Xen's libxl C library via=
 cgo. The package is currently in an unstable "preview" state.
>
> We should probably try to slot it into one of the official terms we use i=
n SUPPORT.md (and also add it to SUPPORT.md!).
>
> ATM you can=E2=80=99t even do a full VM lifecycle with it properly (to in=
clude harvesting destroyed domains); so I think it would come under =E2=80=
=9Cexperimental=E2=80=9D.

Thanks, I wasn't aware of these definitions in SUPPORT.md.

> > This means the package is ready for initial use and evaluation, but is =
not yet fully functional. Namely, only a subset of libxl's API is implement=
ed, and breaking changes may occur in future package versions.
> > +
> > +Much of the package is generated using the libxl IDL. Changes to the g=
enerated code can be made by modifying `tools/golang/xenlight/gengotypes.py=
` in the xen.git tree.
> > +
> > +## Getting Started
> > +
> > +```go
> > +import (
> > +        "xenbits.xen.org/git-http/xen.git/tools/golang/xenlight"
> > +)
> > +```
> > +
> > +The module is not yet tagged independently of xen.git, so expect to se=
e `v0.0.0-<date>-<git hash>` as the package version. If you want to point t=
o a Xen release, such as 4.14.0, you can run `go get xenbits.xen.org/git-ht=
tp/xen.git/tools/golang/xenlight@RELEASE-4.14.0`.
>
> I think I would say something like:
>
> =E2=80=94
>
> The module is not yet tagged independently of xen.git; if you don=E2=80=
=99t specify the version, you=E2=80=99ll get the most recent development ve=
rsion, which is probably not what you want.  A better option would be to sp=
ecify a Xen release tag; for instance: `go get xenbits=E2=80=A6./xenlight@R=
ELEASE-4.14.10`.

That sounds much better. Thanks.

> > diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/=
xenlight.go
> > index 6b4f492550..3eaa5a3d63 100644
> > --- a/tools/golang/xenlight/xenlight.go
> > +++ b/tools/golang/xenlight/xenlight.go
> > @@ -14,6 +14,8 @@
> >  * You should have received a copy of the GNU Lesser General Public
> >  * License along with this library; If not, see <http://www.gnu.org/lic=
enses/>.
> >  */
> > +
> > +// Package xenlight provides bindings to Xen's libxl C library.
> > package xenlight
>
>
> Will this comment replace the comment above it in the pkg.go.dev module p=
age?

Yes, this should be recognized as the "package comment" now.

-NR

