Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0C52DB450
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 20:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54782.95344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFiK-0000Uz-94; Tue, 15 Dec 2020 19:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54782.95344; Tue, 15 Dec 2020 19:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFiK-0000UZ-4m; Tue, 15 Dec 2020 19:10:24 +0000
Received: by outflank-mailman (input) for mailman id 54782;
 Tue, 15 Dec 2020 19:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gY+w=FT=gmail.com=xieliwei@srs-us1.protection.inumbo.net>)
 id 1kpFiI-0000UU-1i
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 19:10:22 +0000
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fee21534-b2bd-45ee-b1d0-0c36ee007a0d;
 Tue, 15 Dec 2020 19:10:21 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n4so21599814iow.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 11:10:21 -0800 (PST)
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
X-Inumbo-ID: fee21534-b2bd-45ee-b1d0-0c36ee007a0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXFjuHVE58ZaaSbU8iuQJAGjLdlVtuTQrlX/TBdKKyc=;
        b=g4MFJX6mzTnY1nL3zmX2eVqU9yUadL/ePYSG1PqrycHoHmrA0cONJJZO8MEjGnvSc/
         BIiM8zwY545N21r0WJZ73NpzZoG7nq950UU/9ALmfhqCqUqh9e9BtIcuw4eGkJg+wgeb
         IyBmrnZlefn3HaUWzJR8Wr19dRKO//a6Mm5rHVS3rY6FW87MlW+PouGVEf6owBwG6IA1
         W6rFOU6P+mPgBIC1b1p0GfxxrZpN+vnNPWXZGHEL/My+pzJs8m/HBnoqXoG5o5HRKaAF
         EwSlVDpn9mKzqoJ9nq/oKHCHtQuPI5egQxaM+G8svViYtKa9e2/B7+t2PuOyC5ZfOZmT
         6e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXFjuHVE58ZaaSbU8iuQJAGjLdlVtuTQrlX/TBdKKyc=;
        b=nL7Jqpit5YOX41DMZpvLgBpdNE4bijanDtvT77HdyQ8At7KR3EXGCrnN3dn8avCtZ1
         5ccICB6Cy5/6mIQILRlZ2nSMc2Jmc7HtUN1Mvlrt8xSVnQyVvxPurc0/PWZGZ/Cpd11m
         5v1RfdJIb0O+UGrSmG9roIFgIvSBRHDY7vcBobuBb1FD3eO1xrXC2BSNcWAt5vIXUP6E
         +8nY7zCg2f5g7U0KwkajfNqLDPu/vC5FeIEY5VUFPID9OVAMCP4so+hUCgS9JTgcCZJ4
         l+0qFZeB2lRG9WBo9Ximm+L7fum6kY8ez9kSfAce7Kybk5+QQQtluoATbjl0dA5S0CZy
         1csQ==
X-Gm-Message-State: AOAM5335Mzp5AmzZ0v7XviKY9YFN26Iap8QLuAorNYZ2JdzHe0AIKIqV
	8GzqL5zv5esoZhTbtgHFRLVF3DiFuQ/APB7a9ywYFvAYCqrCsA==
X-Google-Smtp-Source: ABdhPJzuGvIAfEMJb+Oa8oV9eCxTBWS0sVa2cW4gSaM6M4SpTDbO+WOJ5Nuo0/pVYQ/q/t7vA5/aMwDgcPrRZpJ2bC8=
X-Received: by 2002:a05:6638:1247:: with SMTP id o7mr39987241jas.31.1608059419841;
 Tue, 15 Dec 2020 11:10:19 -0800 (PST)
MIME-Version: 1.0
References: <mailman.2112.1604414193.711.xen-devel@lists.xenproject.org>
In-Reply-To: <mailman.2112.1604414193.711.xen-devel@lists.xenproject.org>
From: Liwei <xieliwei@gmail.com>
Date: Wed, 16 Dec 2020 03:08:50 +0800
Message-ID: <CAPE0SYz0be1ZOoNqDHpeJWeZS-1BM_zy50=Cmeo+4Aq1Na0eNQ@mail.gmail.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>, 
	Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi list,
    This is a reply to the thread of the same title (linked here:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg84916.html
) which I could not reply to because I receive this list by digest.

    I'm unclear if this is exactly the reason, but I experienced the
same symptoms when upgrading to 4.14. The issue does not occur if I
downgrade to 4.11 (the previous version that was provided by Debian).
Kernel is 5.9.11 and unchanged between xen versions.

    One thing I noticed is that if I disable the monitor/mwait
instructions on my CPU (Intel Xeon E5-2699 v4 ES), the stalls seem to
occur later into the boot. With the instructions enabled, the system
usually stalls less than a few minutes after boot; disabled, it can
last for tens of minutes.

    Further disabling the HPET or forcing the kernel to use PIT causes
it to be somewhat usable. The stalls still occur tens of minutes in
but somehow everything seems to continue chugging along fine?

    I've also verified that the stalls do not occur in all the above
cases if I just boot into the kernel without xen.

    When the stalls happen, I get the "rcu: INFO: rcu_sched detected
stalls on CPUs/tasks" backtraces printed on the console periodically,
but keystrokes don't do anything on the console, and I can't spawn new
SSH sessions even though pinging the system produces a reply. The last
item in the call trace is usually "xen_safe_halt", but I've seen it
occur for other functions related to btrfs and the network adapter as
well.

    Do let me know if there's anything I can provide to help
troubleshoot this. At the moment I've reverted to 4.11, but I can
temporarily switch over to 4.14 to collect any necessary information.

Liwei

