Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A611593ABA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 22:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387788.624186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNgll-0006Y1-Lc; Mon, 15 Aug 2022 20:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387788.624186; Mon, 15 Aug 2022 20:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNgll-0006Vv-Hk; Mon, 15 Aug 2022 20:33:05 +0000
Received: by outflank-mailman (input) for mailman id 387788;
 Mon, 15 Aug 2022 20:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Klp=YT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oNglj-0006Tl-S4
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 20:33:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 755b7250-1cd9-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 22:33:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AA51B80EA8;
 Mon, 15 Aug 2022 20:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0315BC433C1;
 Mon, 15 Aug 2022 20:32:58 +0000 (UTC)
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
X-Inumbo-ID: 755b7250-1cd9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660595579;
	bh=jszsWYralBKgaggd0pZchR1qppMaJH10tXlQtdRttgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V8wC5bxKMluxpWNpaYbLNC8gqkdxTo62ggRX6B5F8iZWriPy79Q8tCCXL6fPzIh6r
	 Rx7ANPulKsQiJj8w2vLV2DTxLHWlv34E4BN4xxsuaLPTW/1vjY8TWvMKCaoLEBhov5
	 bCzQfb/4OBX2yG23hM1m5Y3lcbAwDhDyQnwUngImGlpcby6k9jCSb6gmqs7lKgl02O
	 fUWAeU81ToYEjJm5u52WHuTD2xyoS6ANa/iF8nQ1NCHVDGKdPBhpZdBjZr5DdcvXh4
	 9hJcHZjA+Cm+mkBt8jv7nvdcBrQLIO6ahVsH+zE0HG31fRrE5S/ypq2+Kg+UJXOJxi
	 jT4PTJv2OqyjA==
Date: Mon, 15 Aug 2022 13:32:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org, 
    jbeulich@suse.com, wl@xen.org, roger.pau@citrix.com
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
In-Reply-To: <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop> <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Xen maintainers and committers


For context, I wrote a patch to introduce SPDX tags starting from
arch/arm/*.c.

Julien rightfully pointed out that it should be added to our coding
style. He is right. Also as I was reading his replies, I realized there
are a couple of minor coding style things to agree as a group first.
I'll highlighted them here and suggested a proposal. I am happy to go
with the preference of the majority.


## comment format // vs /*

In this patch I used:
// SPDX-License-Identifier: GPL-2.0

But our comment format is actually /* xxx */. I think it is fair to
use /* xxx */ as Julien requested:

/* SPDX-License-Identifier: GPL-2.0 */

Unless there are any concerns, I'll change the patch to /* SPDX... */


## blank line after SPDX

In this series, I didn't add a blank line after the new SPDX comment, no
matter if the following line was an #include or another comment. Now I am
thinking it would be best to add a blank line, as follows:

---
/* SPDX-License-Identifier: GPL-2.0 */

#include <xen/bitops.h>
---

Or:

---
/* SPDX-License-Identifier: GPL-2.0 */

/*
 * xen/arch/arm/device.c
 *
---

Let me know if that's OK for you.


## Original copyright text

As we add the new SDPX tag, It makes sense to remove the older copyright
text at the top of the file, e.g.:

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..d0a409e4fd 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -1,20 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
 /*
  * alternative runtime patching
  * inspired by the x86 version
  *
  * Copyright (C) 2014-2016 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>


Now the question is whether we want to keep what's left:

/*
 * alternative runtime patching
 * inspired by the x86 version
 *
 * Copyright (C) 2014-2016 ARM Ltd.
 */

The Copyright line is not useful and often stale. Also the other comment
is not very interesting in most cases (I am referring to "alternative
runtime patching inspired by the x86 version"), although I realize this
is going to be a on case-by-case basis.

My suggestion is to get rid of it all unless useful (in most cases it is
not useful), leading to:


diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..e363176d1f 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -1,21 +1,4 @@
-/*
- * alternative runtime patching
- * inspired by the x86 version
- *
- * Copyright (C) 2014-2016 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #include <xen/init.h>
 #include <xen/types.h>


Do you guys agree?


Cheers,

Stefano


P.S.
Julien, I'll reply to your other points separately to avoid confusion.


On Sat, 13 Aug 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 13/08/2022 01:59, Stefano Stabellini wrote:
> > Add SPDX license information to all the *.c files under arch/arm.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > We need to start from somewhere and I thought arch/arm/*.c would be a
> > good place to start.
> 
> Thanks for doing it. This will make easier to understand the license in each
> file. There are a couple of places below where the SDPX tag is incorrect. How
> did you figure out the which license to use?
> 
> Also, I think we should consider to add a section about SPDX in our coding
> style so new files are using it. So we don't end up with a mix in arch/arm/*.
> 
> > 
> > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> > index f03cd943c6..8115f89408 100644
> > --- a/xen/arch/arm/alternative.c
> > +++ b/xen/arch/arm/alternative.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Technically, this is a comment. So this should be /* ... */ to follow Xen
> coding style. Also...
> 
> >   /*
> >    * alternative runtime patching
> >    * inspired by the x86 version
> 
> ... this comment contains information about the license. As you add the SPDX,
> the "long" version should be removed. This would also make easier to verify
> the SPDX you add match existing license.
> 
> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > index ec81a45de9..7c986ecb18 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >   /*
> >    * Early Device Tree
> >    *
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index ae649d16ef..887b5426c7 100644
> > --- a/xen/arch/arm/cpuerrata.c
> > +++ b/xen/arch/arm/cpuerrata.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> This file had no explicit license. I had a look at the 'git log' and AFAICT
> this was either new code and came from Linux. So this looks fine to add GPLv2
> here.
> 
> >   #include <xen/cpu.h>
> >   #include <xen/cpumask.h>
> >   #include <xen/init.h>
> > diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> > index 62d5e1770a..a6253cb57f 100644
> > --- a/xen/arch/arm/cpufeature.c
> > +++ b/xen/arch/arm/cpufeature.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >   /*
> >    * Contains CPU feature definitions
> >    *
> > diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> > index f5f6562600..f586c3d781 100644
> > --- a/xen/arch/arm/decode.c
> > +++ b/xen/arch/arm/decode.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> This tag doesn't match the license below. It is currently GPLv2+. I don't
> think you can change it without consulting the author. But if it is, then it
> should be mentioned in the commit message.
> 
> I remember we discussed in the past that some files were GPLv2+. But I can't
> remember what was the outcome (I can't find the thread). IIRC GPLv2+ is a lot
> more restrictive than GPLv2 and could prevent some companies to contribute.
> 
> [...]
> 
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 2cd481979c..1a2dac95a9 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Same here about GPLv2+. Please go through the rest of the files to confirm the
> license.
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

