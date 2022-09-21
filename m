Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EAE5BF9F5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 11:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409696.652710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oavZx-00082p-RP; Wed, 21 Sep 2022 08:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409696.652710; Wed, 21 Sep 2022 08:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oavZx-0007zr-OU; Wed, 21 Sep 2022 08:59:37 +0000
Received: by outflank-mailman (input) for mailman id 409696;
 Wed, 21 Sep 2022 08:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cBG=ZY=gmail.com=szewcson@srs-se1.protection.inumbo.net>)
 id 1oavZw-0007ud-3A
 for xen-devel@lists.xen.org; Wed, 21 Sep 2022 08:59:36 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b62ac232-398b-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 10:59:34 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 d64-20020a17090a6f4600b00202ce056566so13534681pjk.4
 for <xen-devel@lists.xen.org>; Wed, 21 Sep 2022 01:59:35 -0700 (PDT)
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
X-Inumbo-ID: b62ac232-398b-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9Z2yBpq0sXAAozruTza1rF7bQHQ849JgXikaM2yKWig=;
        b=F/rKVX9hUPImDdfhn0bDf6AZbGoORkVC5+l6145MtAQtXEGLnQJceSM2HJ53MDmdgs
         2EGNLLEvHYrPNOT8yBexIBXR+R6oMIAl7SJgURUnS5mmNPiQP3IKEqWHJF9VnUT8mvsK
         vXOiUcabSxwbna86uebcq7kh+Y7OrjApS3aACvHLEDjCUHVdUair5O1Pop5tLOIrkFbg
         hkRlPDBDB7B560N2fb32CedZmGwKy5S4NYhGN3ejkIVK20PMReHiATQurNQbV7ab0fDY
         qFT9SugEDU3Iu+AAFDkEp4pOKUzy7GagO2jx4FmOx6UQ/Y5zpuFQk2ZlhYq+YrxXpENC
         8cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9Z2yBpq0sXAAozruTza1rF7bQHQ849JgXikaM2yKWig=;
        b=Es7AQuenr3ZKYKrH7Kxb++EzwY9ZntKU5U0USmYAlYHSc5Lujk2ARVMeg27+/l3VsN
         jUr30FcHJNLBFDugAwA79OO6kpUsiZsAVbCmusTUBPP/mI91dd7BEeYnLVqQlhF4G22V
         j4CJG1VNDc4tS6Ck0Mc77wxqzANPyaw/FD0+lbSgkr1nDQLHhqBGHV2XK+CQHNYACiaB
         hmGGwQwgBoAHODbOXH8wKcgVtWNiDNX6/QohQgw0CZ9GjvYWVIbyCsQUCoIgP1+P8clq
         3y15zyAZ2Lc0VEE851P+kE8Bp277mwHFgbPba2joSZxu9RWkx9oEXR+YicBchtnz7Dvw
         voUQ==
X-Gm-Message-State: ACrzQf0qlT7bDrqYApubH88yUmZCQg1nFylNc0RfQX6uuMi7WOHjpjNN
	5A8D5sIO4+xN/lem+eEw39RamGUmr65yNbnx+Jes1cbb
X-Google-Smtp-Source: AMsMyM5IXt65S78F1+5HIjq2skMmrEl/jiW8YfgSqdxm2oUGp16FfhYZ0EIO2C2nVN+8nfCp+waJiKs2127HdWDZYoQ=
X-Received: by 2002:a17:902:d88b:b0:178:264b:5aa4 with SMTP id
 b11-20020a170902d88b00b00178264b5aa4mr3680434plz.44.1663750773806; Wed, 21
 Sep 2022 01:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <YyR1eUfbq9aVSVXV@Air-de-Roger> <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com>
 <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local> <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
 <YymEKZcc+kXyLOHG@MacBook-Air-de-Roger.local>
In-Reply-To: <YymEKZcc+kXyLOHG@MacBook-Air-de-Roger.local>
From: Adam Szewczyk <szewcson@gmail.com>
Date: Wed, 21 Sep 2022 10:59:21 +0200
Message-ID: <CAHsotTitYukNQfqhmdVf-wYd-75X7HA9FDDtNUkXXEEV3yhwKw@mail.gmail.com>
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000de1a2905e92c2933"

--000000000000de1a2905e92c2933
Content-Type: text/plain; charset="UTF-8"

Hi,
I asked Marek about installing Debug Hypervisor, and creating VM without
stubdomain.

It looks like I have to build Xen for myself, and edit libvirt config
(which according to Marek may not work). I will try both this things on
weekend but since I'm more an user then dev/sysadmin don't know if I can
handle that tasks (also it probably be better to mess with such things on
some other installation then my daily driver). Will You have some other
ideas?

BR Adam

--000000000000de1a2905e92c2933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div>I asked Marek about installing Deb=
ug Hypervisor, and creating VM without stubdomain.</div><div><br></div><div=
>It looks like I have to build Xen for myself, and edit libvirt config (whi=
ch according to Marek may not work). I will try both this things on weekend=
 but since I&#39;m more an user then dev/sysadmin don&#39;t know if I can h=
andle that tasks (also it probably be better to mess with such things on so=
me other installation then my daily driver). Will You have some other ideas=
?</div><div><br></div><div>BR Adam<br></div></div>

--000000000000de1a2905e92c2933--

