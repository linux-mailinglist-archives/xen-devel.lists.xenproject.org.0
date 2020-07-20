Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A162225D7F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxU27-00089U-VO; Mon, 20 Jul 2020 11:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezcM=A7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxU26-00089G-N7
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:32:34 +0000
X-Inumbo-ID: b344822c-ca7c-11ea-848b-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b344822c-ca7c-11ea-848b-bc764e2007e4;
 Mon, 20 Jul 2020 11:32:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o2so24876059wmh.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=2Ws+19cyfyQaVImvalOepHUtg1lkzW9AF73Zc3H5Vio=;
 b=TC9HFvgP+O2oEmRnaDuwc6aQNRtcAgQMOf8gQkAB7g//4P0YaMiuwo4me0i9imhv2r
 ZSyYQmlsC9eHU4/EWm8Y3kdA/NmFWOv9vY64DGsa/5AVxDiRHwJ8WbdSfXW0iqxM4Mns
 BUobRz1wR6c+o0kho35RNdZQn/UL80IMcfi23e6H9eOMqSOQNZboXOpwm34WHu5CuzsV
 1vH/zwiH3F7Usp9JJHI+UzA2nGUpPQl1/Ph3MmxWAQ9ud8AaB49nsbk6gblaTPiknTJI
 lqkoKxk6WHfJrHiU3yGZEoYt2vfKMpjG5ZKyuFNaSr2HS3uutMwdzLekoNhn2Stc5xN9
 QggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=2Ws+19cyfyQaVImvalOepHUtg1lkzW9AF73Zc3H5Vio=;
 b=ZMmHBNXSEoDJuaX+ah6WBUwIkhwsX+3EuClgIyekq07E4hqh/ORTKXZH5J2tus/7O5
 rUTEq3WgRnG4stIXqbYz+vaxLIkU4HngiE4v2OOk4rdo0SP54ibs0qOyuh5LyRvAM7Hi
 9zRXFsl6y/ZB8niS6c3WvAnTOMx0Bzv2ytl3CHdVv3nYed47pDjouK1qOVAnWdAPFNHd
 PEe5kNIFcYlY6ukGx3sNKc6nZG9pqVcOK19AGCnv18gotSSaW89iGg///NWuUYQ2RIhx
 7zsGd5IA+b5sEItG/faGO40BBEXsjfPdg/DFP8dEZgUGdu3mwHu5+1oS6GIDY92tE5ZC
 SIqA==
X-Gm-Message-State: AOAM5319qORbpu9CcS5tlsGgYPhrUYV04/CWXYYv95GVstJy7oqvl53E
 YG5Zwofma8CvOQEw6+ah0T4=
X-Google-Smtp-Source: ABdhPJy81zhpuzTr+RIXsx3WBtvxcP+7u1GkQHOiLzZ+3VoZGANAsCLxwRnoNKBZt5ocHpsbsKEElA==
X-Received: by 2002:a1c:2349:: with SMTP id j70mr20712469wmj.22.1595244752955; 
 Mon, 20 Jul 2020 04:32:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id o7sm18801953wrv.50.2020.07.20.04.32.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 04:32:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200720112137.27327-1-jgross@suse.com>
In-Reply-To: <20200720112137.27327-1-jgross@suse.com>
Subject: RE: [PATCH v3] docs: specify stability of hypfs path documentation
Date: Mon, 20 Jul 2020 12:32:31 +0100
Message-ID: <002101d65e89$75344a60$5f9cdf20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQM5wuAhs7ejpzf9sg3QCNvYrfsi+6ZJjOjw
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 20 July 2020 12:22
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: [PATCH v3] docs: specify stability of hypfs path =
documentation
>=20
> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
> file system are specified. Make it more clear that path availability
> might change, e.g. due to scope widening or narrowing (e.g. being
> limited to a specific architecture).
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-acked-by: Paul Durrant <paul@xen.org>

TBC, this is also exempt from the commit moratorium as it really needs =
to be in 4.14.

  Paul

> ---
> V2: reworded as requested by Jan Beulich
> V3: reworded again as suggested by George Dunlap
> ---
>  docs/misc/hypfs-paths.pandoc | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/docs/misc/hypfs-paths.pandoc =
b/docs/misc/hypfs-paths.pandoc
> index a111c6f25c..68d83d9245 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -5,6 +5,9 @@ in the Xen hypervisor file system (hypfs).
>=20
>  The hypervisor file system can be accessed via the xenhypfs tool.
>=20
> +The availability of the hypervisor file system depends on the =
hypervisor
> +config option CONFIG_HYPFS, which is on per default.
> +
>  ## Notation
>=20
>  The hypervisor file system is similar to the Linux kernel's sysfs.
> @@ -64,6 +67,23 @@ the list elements separated by spaces, e.g. "dom0 =
PCID-on".
>  The entry would be writable and it would exist on X86 only and only =
if the
>  hypervisor is configured to support PV guests.
>=20
> +# Stability
> +
> +Path *presence* is not stable, but path *meaning* is always stable: =
if a tool
> +you write finds a path present, it can rely on behavior in future =
versions of
> +the hypervisors, and in different configurations.  Specifically:
> +
> +1. Conditions under which paths are used may be extended, restricted, =
or
> +   removed.  For example, a path that=E2=80=99s always available only =
on ARM systems
> +   may become available on x86; or a path available on both systems =
may be
> +   restricted to only appearing on ARM systems.  Paths may also =
disappear
> +   entirely.
> +2. However, the meaning of a path will never change.  If a path is =
present,
> +   it will always have exactly the meaning that it always had.  In =
order to
> +   maintain this, removed paths should be retained with the tag =
[REMOVED].
> +   The path may be restored *only* if the restored version of the =
path is
> +   compatible with the previous functionality.
> +
>  ## Example
>=20
>  A populated Xen hypervisor file system might look like the following =
example:
> --
> 2.26.2



