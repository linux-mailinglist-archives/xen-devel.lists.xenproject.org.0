Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D741F695A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 15:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjNZa-0002nX-E0; Thu, 11 Jun 2020 13:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rsWf=7Y=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jjNZY-0002nR-MP
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 13:48:48 +0000
X-Inumbo-ID: 45b2e982-abea-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45b2e982-abea-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 13:48:47 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id w16so5975216ejj.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsnFYtbzFzP/QoDBhCqgQNFkyNpcu1IJ8yezc2HzJrM=;
 b=JYi/oG/akEXJDuehVyYk+KdQGA/7lF7FXLEYVxgffmjNMUGHXMKwa9xd5hJQeEv/oj
 EF0QHTESTpGnZZ2DrqJeRnnSBUTe9MyDpuWOEEthjKl4B0KbJEOKHuGMRxOoPW7M9fRi
 bnkUu2AERA2SKYTYbaKYDy8Dh7UQq4m/RHrSc6wJYnY8AgnInAPIjh2Gkcd1gCKnI411
 n0YHsGMQPER/YbExnr7zZwM7POqT7KClKDQV+c35SSJZyTY/QfOsNEw/jc1kORytzS5g
 JtNrGJadzY2ZaTARj4Tb5+WplMFFGPkPfn94MkYj8txbebCDWsIbvAicPxBIrkyd0moZ
 OLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsnFYtbzFzP/QoDBhCqgQNFkyNpcu1IJ8yezc2HzJrM=;
 b=SM7pqbMf2A5Q4fpIL6Ebmv1CWCZ2lMCCEdhdiO2663B6ixQvOecb6CUF2kqASRVpCP
 UHFKjMKR2xnL7woJMUO+VOCIlCBbYow/U+dU0k+HkcoQgu9V0uvyC/f5yp5BG/uUmv3r
 cHtF/UclWf71VofpfdqLYiyvcZQ/xI0nHi73SKGfkm3kVXkCpc9Wa5MgfCiv95fquKOv
 47duXd0H4uJU6o/ny6LubI3FxuzdAu179YLwwqvnv4c8keaPySBXh8kul2UC6CjoRwc1
 zhNdHtpYpMQE5e0vl4NKe5o39wobaLe6Qybi8VO60OOLpVAcKwg7nICjPyh4B8QtGkyv
 jsCg==
X-Gm-Message-State: AOAM532v3g4UoF84eWkBAknCJ4ppNTTiJ3J5fnLrsH7we+IrqPTVfrQr
 98GoiSAZAT3o5+XsjM1ZPquGm3QlmJm0P7Z2GII=
X-Google-Smtp-Source: ABdhPJzGxJ70Aw8WdRrM3Da4wfXhE9wkU3d/nLwCc6rV0q1ru62dD/XpCJq8bRKvhrMS6cvJQhAEHY8zH44DkI9EYh0=
X-Received: by 2002:a17:906:cd05:: with SMTP id
 oz5mr9015280ejb.335.1591883326500; 
 Thu, 11 Jun 2020 06:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191126100801.124844-1-wipawel@amazon.de>
In-Reply-To: <20191126100801.124844-1-wipawel@amazon.de>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 11 Jun 2020 14:48:35 +0100
Message-ID: <CAFLBxZaejTq21f9a0CzFuTtsg9Au4USLdDEaVwxUbs-65qy__A@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v6 00/12] livepatch: new features and fixes
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: multipart/alternative; boundary="00000000000033327705a7cf38b0"
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
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000033327705a7cf38b0
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 26, 2019 at 10:14 AM Pawel Wieczorkiewicz <wipawel@amazon.de>
wrote:

> This series introduces new features to the livepatch functionality as
> briefly discussed during Xen Developer Summit 2019: [a] and [b].
> It also provides a few fixes and some small improvements.
>
> Main changes in v6:
> - Added missing action pad field zeroing
>
> Main changes in v4:
> - Fix various typos and minor issues
> - Simplify arch_livepatch_{apply,revert} by using
>   common_livepatch_{apply,revert}
> - Improve python bindings and fix few issues
>
> Main changes in v3:
> - Fix expectation test to work on Arm
> - Add test for metadata (Konrad)
> - Minor fixes to documentation
>
> Main changes in v2:
> - added new features to livepatch documentation
> - added livepatch tests
> - enabled Arm support for [5]
> - make .modinfo optional for [11]
> - fixed typos
>
> FEATURES:
>
> 1. independent modules (patches: [1], [2])
>
>   * livepatch-build-tools repo dependency [A]
>
>   Livepatch enforces the following buildid-based dependency chain
>   between hotpatch modules:
>     1) first module depends on given hypervisor buildid
>     2) every consecutive module depends on previous module's buildid
>   This way proper hotpatch stack order is maintained and enforced.
>   While it is important for production hotpatches it limits agility and
>   blocks usage of testing or debug hotpatches. These kinds of hotpatch
>   modules are typically expected to be loaded at any time irrespective
>   of current state of the modules stack.
>
>   [A] livepatch-build: Embed hypervisor build id into every hotpatch
>
> 2. pre- and post- apply|revert actions hooks (patches: [3], [4])
>
>   * livepatch-build-tools repo dependency [B]
>
>   This is an implementation of 4 new livepatch module vetoing hooks,
>   that can be optionally supplied along with modules.
>   Hooks that currently exists in the livepatch mechanism aren't agile
>   enough and have various limitations:
>   * run only from within a quiescing zone
>   * cannot conditionally prevent applying or reverting
>   * do not have access to the module context
>   To address these limitations the following has been implemented:
>   1) pre-apply hook
>   2) post-apply hook
>   3) pre-revert hook
>   4) post-revert hook
>
>   [B] create-diff-object: Handle extra pre-|post- hooks
>
> 3. apply|revert actions replacement hooks (patches: [5], [6], [7])
>
>   * livepatch-build-tools repo dependency: [C], [D], [E]
>
>   To increase hotpatching system's agility and provide more flexiable
>   long-term hotpatch solution, allow to overwrite the default apply
>   and revert action functions with hook-like supplied alternatives.
>   The alternative functions are optional and the default functions are
>   used by default.
>
>   [C] create-diff-object: Do not create empty .livepatch.funcs section
>   [D] create-diff-object: Handle optional apply|revert hooks
>   [E] create-diff-object: Add support for applied/reverted marker
>
> 4. inline asm hotpatching expectations (patches: [8])
>
>   * livepatch-build-tools repo dependency: [F]
>
>   Expectations are designed as optional feature, since the main use of
>   them is planned for inline asm hotpatching.
>   The payload structure is modified as each expectation structure is
>   part of the livepatch_func structure and hence extends the payload.
>   The payload version is bumped to 3 with this change to highlight the
>   ABI modification and enforce proper support.
>   The expectation is manually enabled during inline asm module
>   construction. If enabled, expectation ensures that the expected
>   content of memory is to be found at a given patching (old_addr)
>   location.
>
>   [F] create-diff-object: Add support for expectations
>
> 5. runtime hotpatch metadata support (patches: [9], [10], [11])
>
>   Having detailed hotpatch metadata helps to properly identify module's
>   origin and version. It also allows to keep track of the history of
>   hotpatch loads in the system (at least within dmesg buffer size
>   limits).
>   Extend the livepatch list operation to fetch also payloads' metadata.
>   This is achieved by extending the sysctl list interface with 2 extra
>   guest handles:
>   * metadata     - an array of arbitrary size strings
>   * metadata_len - an array of metadata strings' lengths (uin32_t each)
>   To unify and simplify the interface, handle the modules' name strings
>   of arbitrary size by copying them in adhering chunks to the userland.
>
> 6. python bindings for livepatch operations (patches: [12])
>
>   Extend the XC python bindings library to support all common livepatch
>   operations and actions:
>   - status (pyxc_livepatch_status):
>   - action (pyxc_livepatch_action):
>   - upload (pyxc_livepatch_upload):
>   - list (pyxc_livepatch_list):
>

This series looks like it would be a good candidate for a CHANGELOG.md line.

What about something like this:

- Livepatch improvements: Buildid / hotpatch "stack" restrictions,
Additional {pre,post}-{apply,revert} hooks, inline hotpatching
expectations, runtime hotpatch metdata, python bindings for livepatch
operations

--00000000000033327705a7cf38b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2019 at 10:14 AM Pawe=
l Wieczorkiewicz &lt;<a href=3D"mailto:wipawel@amazon.de">wipawel@amazon.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
This series introduces new features to the livepatch functionality as<br>
briefly discussed during Xen Developer Summit 2019: [a] and [b].<br>
It also provides a few fixes and some small improvements.<br>
<br>
Main changes in v6:<br>
- Added missing action pad field zeroing<br>
<br>
Main changes in v4:<br>
- Fix various typos and minor issues<br>
- Simplify arch_livepatch_{apply,revert} by using<br>
=C2=A0 common_livepatch_{apply,revert}<br>
- Improve python bindings and fix few issues<br>
<br>
Main changes in v3:<br>
- Fix expectation test to work on Arm<br>
- Add test for metadata (Konrad)<br>
- Minor fixes to documentation<br>
<br>
Main changes in v2:<br>
- added new features to livepatch documentation<br>
- added livepatch tests<br>
- enabled Arm support for [5]<br>
- make .modinfo optional for [11]<br>
- fixed typos<br>
<br>
FEATURES:<br>
<br>
1. independent modules (patches: [1], [2])<br>
<br>
=C2=A0 * livepatch-build-tools repo dependency [A]<br>
<br>
=C2=A0 Livepatch enforces the following buildid-based dependency chain<br>
=C2=A0 between hotpatch modules:<br>
=C2=A0 =C2=A0 1) first module depends on given hypervisor buildid<br>
=C2=A0 =C2=A0 2) every consecutive module depends on previous module&#39;s =
buildid<br>
=C2=A0 This way proper hotpatch stack order is maintained and enforced.<br>
=C2=A0 While it is important for production hotpatches it limits agility an=
d<br>
=C2=A0 blocks usage of testing or debug hotpatches. These kinds of hotpatch=
<br>
=C2=A0 modules are typically expected to be loaded at any time irrespective=
<br>
=C2=A0 of current state of the modules stack.<br>
<br>
=C2=A0 [A] livepatch-build: Embed hypervisor build id into every hotpatch<b=
r>
<br>
2. pre- and post- apply|revert actions hooks (patches: [3], [4])<br>
<br>
=C2=A0 * livepatch-build-tools repo dependency [B]<br>
<br>
=C2=A0 This is an implementation of 4 new livepatch module vetoing hooks,<b=
r>
=C2=A0 that can be optionally supplied along with modules.<br>
=C2=A0 Hooks that currently exists in the livepatch mechanism aren&#39;t ag=
ile<br>
=C2=A0 enough and have various limitations:<br>
=C2=A0 * run only from within a quiescing zone<br>
=C2=A0 * cannot conditionally prevent applying or reverting<br>
=C2=A0 * do not have access to the module context<br>
=C2=A0 To address these limitations the following has been implemented:<br>
=C2=A0 1) pre-apply hook<br>
=C2=A0 2) post-apply hook<br>
=C2=A0 3) pre-revert hook<br>
=C2=A0 4) post-revert hook<br>
<br>
=C2=A0 [B] create-diff-object: Handle extra pre-|post- hooks<br>
<br>
3. apply|revert actions replacement hooks (patches: [5], [6], [7])<br>
<br>
=C2=A0 * livepatch-build-tools repo dependency: [C], [D], [E]<br>
<br>
=C2=A0 To increase hotpatching system&#39;s agility and provide more flexia=
ble<br>
=C2=A0 long-term hotpatch solution, allow to overwrite the default apply<br=
>
=C2=A0 and revert action functions with hook-like supplied alternatives.<br=
>
=C2=A0 The alternative functions are optional and the default functions are=
<br>
=C2=A0 used by default.<br>
<br>
=C2=A0 [C] create-diff-object: Do not create empty .livepatch.funcs section=
<br>
=C2=A0 [D] create-diff-object: Handle optional apply|revert hooks<br>
=C2=A0 [E] create-diff-object: Add support for applied/reverted marker<br>
<br>
4. inline asm hotpatching expectations (patches: [8])<br>
<br>
=C2=A0 * livepatch-build-tools repo dependency: [F]<br>
<br>
=C2=A0 Expectations are designed as optional feature, since the main use of=
<br>
=C2=A0 them is planned for inline asm hotpatching.<br>
=C2=A0 The payload structure is modified as each expectation structure is<b=
r>
=C2=A0 part of the livepatch_func structure and hence extends the payload.<=
br>
=C2=A0 The payload version is bumped to 3 with this change to highlight the=
<br>
=C2=A0 ABI modification and enforce proper support.<br>
=C2=A0 The expectation is manually enabled during inline asm module<br>
=C2=A0 construction. If enabled, expectation ensures that the expected<br>
=C2=A0 content of memory is to be found at a given patching (old_addr)<br>
=C2=A0 location.<br>
<br>
=C2=A0 [F] create-diff-object: Add support for expectations<br>
<br>
5. runtime hotpatch metadata support (patches: [9], [10], [11])<br>
<br>
=C2=A0 Having detailed hotpatch metadata helps to properly identify module&=
#39;s<br>
=C2=A0 origin and version. It also allows to keep track of the history of<b=
r>
=C2=A0 hotpatch loads in the system (at least within dmesg buffer size<br>
=C2=A0 limits).<br>
=C2=A0 Extend the livepatch list operation to fetch also payloads&#39; meta=
data.<br>
=C2=A0 This is achieved by extending the sysctl list interface with 2 extra=
<br>
=C2=A0 guest handles:<br>
=C2=A0 * metadata=C2=A0 =C2=A0 =C2=A0- an array of arbitrary size strings<b=
r>
=C2=A0 * metadata_len - an array of metadata strings&#39; lengths (uin32_t =
each)<br>
=C2=A0 To unify and simplify the interface, handle the modules&#39; name st=
rings<br>
=C2=A0 of arbitrary size by copying them in adhering chunks to the userland=
.<br>
<br>
6. python bindings for livepatch operations (patches: [12])<br>
<br>
=C2=A0 Extend the XC python bindings library to support all common livepatc=
h<br>
=C2=A0 operations and actions:<br>
=C2=A0 - status (pyxc_livepatch_status):<br>
=C2=A0 - action (pyxc_livepatch_action):<br>
=C2=A0 - upload (pyxc_livepatch_upload):<br>
=C2=A0 - list (pyxc_livepatch_list):<br></blockquote><div><br></div><div><d=
iv>This series looks like it would be a good candidate for a CHANGELOG.md l=
ine.</div><div><br></div><div>What about something like this:</div><div><br=
></div><div>-
 Livepatch improvements: Buildid / hotpatch &quot;stack&quot; restrictions,=
=20
Additional {pre,post}-{apply,revert} hooks, inline hotpatching=20
expectations, runtime hotpatch metdata, python bindings for livepatch=20
operations</div><font color=3D"#888888"><div><br></div></font></div></div><=
/div>

--00000000000033327705a7cf38b0--

