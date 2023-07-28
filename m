Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089376773C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571575.895774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUQb-0003OO-1z; Fri, 28 Jul 2023 20:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571575.895774; Fri, 28 Jul 2023 20:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUQa-0003LU-VL; Fri, 28 Jul 2023 20:51:12 +0000
Received: by outflank-mailman (input) for mailman id 571575;
 Fri, 28 Jul 2023 20:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPUQa-0003LO-8o
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:51:12 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b838f16-2d88-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 22:51:10 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so38951111fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:51:10 -0700 (PDT)
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
X-Inumbo-ID: 7b838f16-2d88-11ee-b24e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690577470; x=1691182270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjzv16CujdZxMwJqHoLWNQZbH6rQET1fq4GvgNmvvB0=;
        b=eQcUWptGppoldAhFFTAePPBuGtqwfnN59K2CBomJFBD4KFvNklgYxkhWohchziyx3M
         hSg10PHrtBDvMBnF6LfkELxjyzjSCLjlmpP2HZGjMMVmY79Q6Xpdeb10k3rSyteiCqqu
         CY0YePAKq/GYg71LPMUjAZgwi2o359cQV3Fo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690577470; x=1691182270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjzv16CujdZxMwJqHoLWNQZbH6rQET1fq4GvgNmvvB0=;
        b=UCafj3tYff8AeXjFHzMe2WsO1r2BQAFvujP//tcbC/PeVl1kOs/TjxK3sVj5GmCxCt
         X+aCOUW+rns75Acuvxy75vJEhhK1i8BSQUExaDBU12DClWbPqntXp+M8Ichzsk1zuzeU
         NT7LWRISxc9Le/qm4juNTVrCy9TQZ3bVPa+wxF3scaElQxQBLj3PuR4XoqLCrKnBNAbX
         4l4KeDmo6x/t+F8j9iQQ4Vl5tayGV0d3RTDZmQVhQSZ2PlkH4vukXL7LeCpELJP8GCJk
         MxbwLdoVBREPb35Y33Cr0f6XJP0I7GabADZOzcMPV0BpGkEKWcQzyLXDyDn6DyuwjrbB
         Rq6g==
X-Gm-Message-State: ABy/qLarZ1E3HkKH7Pj3r6IuMSvnfdZ0kBvGw3imuaQJ2vpCVExCJkQz
	WmMWOCVFeND9fkKpOnJeJ1I56wmXIXmw2App8Z8hcg==
X-Google-Smtp-Source: APBJJlFjvby3HyCToDaPC1SN4r5oGT0DdR6JnpsXuxEuwrsfn5CfhiPTlq0NA2IVoj6FDOuP5lSlPC0T1YmalvJu9/A=
X-Received: by 2002:a2e:80d2:0:b0:2b9:5791:88cc with SMTP id
 r18-20020a2e80d2000000b002b9579188ccmr2221183ljg.37.1690577470216; Fri, 28
 Jul 2023 13:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230601081331.436-1-olaf@aepfle.de>
In-Reply-To: <20230601081331.436-1-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:50:59 +0100
Message-ID: <CA+zSX=bPSda90nk5WMbxfKsqnDwsogUqwR4ZDsKh0BQDUZxrOw@mail.gmail.com>
Subject: Re: [PATCH v1] xenalyze: remove unused defines
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000093ef8f0601923d8a"

--00000000000093ef8f0601923d8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 9:13=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrote:

> These defines are not used by xenalyze.
> NR_CPUS will not match what was used for building Xen itself.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--00000000000093ef8f0601923d8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 9:13=E2=80=AFA=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These def=
ines are not used by xenalyze.<br>
NR_CPUS will not match what was used for building Xen itself.<br>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.du=
nlap@cloud.com</a>&gt;</div></div></div>

--00000000000093ef8f0601923d8a--

