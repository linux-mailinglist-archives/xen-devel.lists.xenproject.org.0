Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE95215B68
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 18:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsTdH-0000PZ-36; Mon, 06 Jul 2020 16:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIq9=AR=gmail.com=brendank310@srs-us1.protection.inumbo.net>)
 id 1jsTdE-0000PU-Sr
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 16:06:12 +0000
X-Inumbo-ID: 9c82b71c-bfa2-11ea-8496-bc764e2007e4
Received: from mail-vk1-xa2a.google.com (unknown [2607:f8b0:4864:20::a2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c82b71c-bfa2-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 16:06:12 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id h190so8700739vkh.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AO+/+dlfB43Jh9L3Jfj1tlqFu6lFfp/rjuSWYXRjhd4=;
 b=sTfQ+G8O8eL5Muvs+3ooGeiWX/nBtpuviDa6AnsfMzh6/F6CScF7vs6JhyIDMyMSrl
 EOuRnqsZ9Q/jxqq8oDzjRK2cd9fMnZv8uwIA2ll25AOrCkkumn+vsZ3vlDtrF57TWNh8
 pqyNyNG28Bz23smu68aSYHd12XSsHMcuF6IbZjExb/ozV02RQL3PI7OQo1fkZm960G/d
 2AG/xc9azAkAWZCXhwmRFouiUCy9yd5SP3Mg/TnSg9bt78dHAHdkkyEWFgbh6PPpnNQo
 p6ndfPs3SFq3LiQLCH5xg2tZAXyoRWUvsFaWA7PZKUK99QB64Mw/49RS4ebtah9HnMJ2
 LsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AO+/+dlfB43Jh9L3Jfj1tlqFu6lFfp/rjuSWYXRjhd4=;
 b=D8di8gh1PM4yzLEDXwOuROZOF8OXqAsXMGWz0bXHI5zfTsQ5n3gdYyZXQuxAsmqmdj
 9E6WmdcKmltpJO1kSRq3h/pswFYY4si6rELHfvb9GBdgHxejpDSCoRJjTcf0I5UChdar
 IrE2kR0J0HyVuHZjnJC0Khbi3aoh0qDtxWgEKpzSjAWW045NBo4G/pIuTq1g92W3ydbw
 ML9M59MMTQlu+1ToAWdhpdgyZ+QMk48KxmPQ2XEmqaVgp1M4f3fzlvFf3D1WL7kYcpxN
 OkezjjllaOm8/+jU0K163ExkkBteLy4KBiwVs4GsT/ES4RN/Y6IEyq1gv83wJmp0rbIy
 wNEw==
X-Gm-Message-State: AOAM530NBU1dPubh73oUf41+2h2TgHf3nHJA/dBden+6iQsjZ1v4neIv
 UkYyh8HbzW7MyqUGxxu+OInsrfWwDJNS1F9hbUvbsf+j
X-Google-Smtp-Source: ABdhPJxcrc/rZrXkqSMPXCxldBwjEO9EvtwWrW48NeL0DreIIHwkWB8BZcvETZdlVaoLpVwh9fQIPbq1v/HzDEx7ISQ=
X-Received: by 2002:a05:6122:32f:: with SMTP id
 d15mr4513397vko.101.1594051571437; 
 Mon, 06 Jul 2020 09:06:11 -0700 (PDT)
MIME-Version: 1.0
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Mon, 6 Jul 2020 12:06:00 -0400
Message-ID: <CAKPa3c1h=eOhLfVt2GaoE9zk5iyoWyvEmWy-BHCMKpjmNsdJ8A@mail.gmail.com>
Subject: Design Session Notes - "How best to upstream Bareflank's
 implementation of the Xen VMM into the Xen Project"
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ab574205a9c80ddf"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000ab574205a9c80ddf
Content-Type: text/plain; charset="UTF-8"

# Design Session Notes - "How best to upstream Bareflank's implementation
of the Xen VMM into the Xen Project"
## Design Session Description
Assured Information Security, Inc. has been working on a new implementation
of the Xen VMM (i.e., just the root component of the Xen hypervisor) using
Bareflank/Boxy (https://github.com/Bareflank/hypervisor). The goals of this
VMM include the ability to reload the hypervisor without having to reboot,
support for a Windows Dom0 (or any Dom0 really), removal of the Xen
scheduling and power management code and instead using the scheduler and
power management logic built into the Dom0 kernel, and removal of PV
support in favor of a pure PVH/HVM implementation. Although there is still
a lot of work to do, we can demonstrate this capability today. The goal of
this design session is to discuss the design of our new approach, ways in
which we can improve it, and ultimately how best to upstream our work into
the Xen Project.

## Current Status of Xen compatibility in Bareflank
Bareflank has compatibility layer to work with the Xen PVH hypercalls, with
the goal of re-using existing Xen VMs, improved performance, less complex
scheduling and power management, and the ability to run non-traditional
dom0s, such as Windows.
* Prototype is up and running:
  * Removal of scheduling/power management code
  * Windows dom0
  * Hotloading the hypervisor (optional late launch, is desirable by gwd)
  * Doesn't share any code directly with Xen at the moment, was referenced
throughout the implementation
* No legacy PV mode, PVH only (currently) though HVM is planned down the
road
* APIC not managed by the hypervisor, but by dom0
* Mostly MSIs are passed directly to dom0
* Minimal interference with power management, lets the operating system
deal with it
* Removal of possible schedule aliasing
* libxl toolstack runs outside of dom0

## Discussion of upstreamability (desirable by andyhhp)
* How to do it organizationally:
  * Subproject (feedback indicated this was undesirable, there would be too
much overhead)
  * Directly bring capabilities into the mainline (feedback indicated this
was more desirable)
* Potential technical requirements:
  * Add scheduling API to allow the use of a host OS scheduler rather than
the built in Xen scheduler (may be difficult)

## Proposed Actions:
* KConfig options to strip out undesirable code portions
* Add ability to do the rootkit like loading of Xen (like hxen/bareflank
support)
* Addition of more hypercalls to support dom0 (or more generally
non-hypervisor context) scheduling
* Stay engaged with xen-devel to align changes with potential ABI changes
that are coming down the road to support updating libxl and the hypervisor
in stages and supporting encrypted memory schemes that are incorporated in
newer architectures

--000000000000ab574205a9c80ddf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"># Design Session Notes - &quot;How best to upstream Barefl=
ank&#39;s implementation of the Xen VMM into the Xen Project&quot;<br>## De=
sign Session Description<br>Assured Information Security, Inc. has been wor=
king on a new implementation of the Xen VMM (i.e., just the root component =
of the Xen hypervisor) using Bareflank/Boxy (<a href=3D"https://github.com/=
Bareflank/hypervisor">https://github.com/Bareflank/hypervisor</a>). The goa=
ls of this VMM include the ability to reload the hypervisor without having =
to reboot, support for a Windows Dom0 (or any Dom0 really), removal of the =
Xen scheduling and power management code and instead using the scheduler an=
d power management logic built into the Dom0 kernel, and removal of PV supp=
ort in favor of a pure PVH/HVM implementation. Although there is still a lo=
t of work to do, we can demonstrate this capability today. The goal of this=
 design session is to discuss the design of our new approach, ways in which=
 we can improve it, and ultimately how best to upstream our work into the X=
en Project.<br><br>## Current Status of Xen compatibility in Bareflank<br>B=
areflank has compatibility layer to work with the Xen PVH hypercalls, with =
the goal of re-using existing Xen VMs, improved performance, less complex s=
cheduling and power management, and the ability to run non-traditional dom0=
s, such as Windows. <br>* Prototype is up and running:<br>=C2=A0 * Removal =
of scheduling/power management code<br>=C2=A0 * Windows dom0<br>=C2=A0 * Ho=
tloading the hypervisor (optional late launch, is desirable by gwd)<br>=C2=
=A0 * Doesn&#39;t share any code directly with Xen at the moment, was refer=
enced throughout the implementation<br>* No legacy PV mode, PVH only (curre=
ntly) though HVM is planned down the road<br>* APIC not managed by the hype=
rvisor, but by dom0<br>* Mostly MSIs are passed directly to dom0<br>* Minim=
al interference with power management, lets the operating system deal with =
it<br>* Removal of possible schedule aliasing<br>* libxl toolstack runs out=
side of dom0<br><br>## Discussion of upstreamability (desirable by andyhhp)=
<br>* How to do it organizationally:<br>=C2=A0 * Subproject (feedback indic=
ated this was undesirable, there would be too much overhead)<br>=C2=A0 * Di=
rectly bring capabilities into the mainline (feedback indicated this was mo=
re desirable)<br>* Potential technical requirements:<br>=C2=A0 * Add schedu=
ling API to allow the use of a host OS scheduler rather than the built in X=
en scheduler (may be difficult)<br><br>## Proposed Actions:<br>* KConfig op=
tions to strip out undesirable code portions<br>* Add ability to do the roo=
tkit like loading of Xen (like hxen/bareflank support)<br>* Addition of mor=
e hypercalls to support dom0 (or more generally non-hypervisor context) sch=
eduling<br>* Stay engaged with xen-devel to align changes with potential AB=
I changes that are coming down the road to support updating libxl and the h=
ypervisor in stages and supporting encrypted memory schemes that are incorp=
orated in newer architectures</div>

--000000000000ab574205a9c80ddf--

