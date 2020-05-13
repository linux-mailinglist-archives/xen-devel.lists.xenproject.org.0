Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620411D14B8
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:26:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrOh-0004iU-K9; Wed, 13 May 2020 13:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYrOg-0004iN-Ei
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:26:06 +0000
X-Inumbo-ID: 4c2e3fac-951d-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c2e3fac-951d-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 13:26:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g4so17791407ljl.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RTqbyGlhscmjLzn7g/8DGPWMuvrDtNhgtAa3qV08SZ0=;
 b=ei41WyYiSus+zwyX1tO/BeILCPH5i/b5h31+gxwcQV5VHpC32sSXCoP/jlGLyrv7fb
 y1gmTQUYTs8WbUS/CTLbSVSrVnm7qQv3PIkRhoZAh+RiHJrP7H2vMtFADWYF22bQ1UPs
 Axj/4SdJTu/MFmhBZNOrW26bwyrCU/+ZCNzG+522aQKq0Ul4+kMdj/i6e32jvQ9uj4/k
 +RkW696B7aDQ8OdwiyOPpckDHElTjXikKWBdXgQ2TBLerbsdQEANHDVDGUY+CmqxmfUf
 I7Bn/sNH/WZ7xmi/KKjMl4hmLe8ugKnQmr61j6q9PjeB+OQrdUCsWTN8fHE+/HuMCPSP
 OD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTqbyGlhscmjLzn7g/8DGPWMuvrDtNhgtAa3qV08SZ0=;
 b=uae+3yxvoH8CvBocJJPybtwLLFpU/83pOfzL+BwfYlTLO+XX8C165XG6YGKGne8N4f
 TEPbr2l0wDXUMBHW2St+tJzVlq9zVALkHe6TBbo/m/wNEYZJteH4uDa1Ich5D/7gmp+Y
 f1VkBtFBk4Dtx7qZCqTdJVXMrHW1y8Nvi07R+wa6WL9Ob/9crxilv5OUzd/xSLDPdFOI
 QqWifGUTiSOU+sVbRCkc2iP5p3sduB0qaiX6rKBv1ZPC5NgXu9Qkohv2o2YvJpXHUqT9
 L3uTslcBlmEm2gJLgLbMJbs6BkErDRlLKFXxVr3lguu6bo4tBXkQ4ANnb6vGX5cz8G7f
 xIMw==
X-Gm-Message-State: AOAM533QlStim5/tBRtMajpqGwet0Nrs4kIxbt1juiIJJ5DLRmPvFYXC
 BB2LH8TQTLAWZDGuj2V0egD0SbOKu+w66OkZgWU=
X-Google-Smtp-Source: ABdhPJzMKA10p+Fk1SqXnwruvj6HHbv2oHBEoHQtuMi9psdSo1xwNc4HJAiV3ChlwL7Bdm7d0cx07c4KqRzYdmQLoYA=
X-Received: by 2002:a2e:8047:: with SMTP id p7mr16362857ljg.206.1589376364439; 
 Wed, 13 May 2020 06:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
 <a42395202aef85d983dd9db361c366a6d03e313f.1589330383.git.rosbrookn@ainfosec.com>
 <AC49E6E7-BB64-4672-94DE-342E3E288C96@citrix.com>
In-Reply-To: <AC49E6E7-BB64-4672-94DE-342E3E288C96@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 13 May 2020 09:25:52 -0400
Message-ID: <CAEBZRSd1z4RLRzv=drZ=WnR+ZsWTA1u+n4QmbdOZwzmb-+dSrg@mail.gmail.com>
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

> OK, so didn=E2=80=99t notice this at first.  It looks like you read the c=
omments at the top of libxl.c, noticed the comment about =E2=80=9C...the sp=
ecial exception on linking described in file LICENSE=E2=80=9D, looked aroun=
d for such a file, and found it in tools/ocaml, and copied that one?
>
> I had a chat with Ian Jackson on IRC (copied below for the record), and t=
hink that comment is simply in error.  We agreed that we should just copy h=
ttps://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt into the directory ve=
rbatim.

Yeah that's what I did. I'll send a corrected patch shortly.

Thanks,
-NR

