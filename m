Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F53BE27D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 07:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151933.280733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m103Z-0002ug-Sn; Wed, 07 Jul 2021 05:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151933.280733; Wed, 07 Jul 2021 05:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m103Z-0002sI-Pg; Wed, 07 Jul 2021 05:25:09 +0000
Received: by outflank-mailman (input) for mailman id 151933;
 Wed, 07 Jul 2021 05:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0Kw=L7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1m103Y-0002sC-Fs
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 05:25:08 +0000
Received: from mail-oi1-x231.google.com (unknown [2607:f8b0:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c72ff3-a54c-48b3-abcd-b8fd5c7984d2;
 Wed, 07 Jul 2021 05:25:07 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id l26so2058260oic.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 22:25:07 -0700 (PDT)
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
X-Inumbo-ID: 80c72ff3-a54c-48b3-abcd-b8fd5c7984d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jFvNViEw7O59X6kfVcjsY8Z1lYfTyB1kEJaMt/PoUq0=;
        b=fVjtzdk6qv7KE+y/vD6/qF/AM0Tmkgg3gr8Ug0YnLeRbDPC0o7otoIYA2FFlr8yukc
         rjfXdVQJ08neKISmZtVWME4zeK4BrUaj/iDgbMjw0ggeBlMsFV7Od0TKokO0Lqna7rRL
         +ZIw2uGiK8iG5qwIuD+xkcbDPDnvwoIcJzYWxbZZhCWhJb2vPP9iUTed94y451nWYjyO
         MVpOvUaH2a9VbLNWafvlCeOMPICjmAcemFPH7IbGUBeBGB+Jj9776pcUEdFqGplH+LC4
         g5TS+trdBL642Lt9cRIoXzeO9IlbEtkduA4Ka5Fgsvlh8iRBBPBLol1P+DqLQnV9QptR
         N/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFvNViEw7O59X6kfVcjsY8Z1lYfTyB1kEJaMt/PoUq0=;
        b=qKjlwFylWIGcLq00xjNXngIuwT7gXOEEdTw9VkmQcikL712oBuxp1NBDRrqMhHU+fU
         5iDP5SYZ4p8H+kScx0izU9E9qsc53SRrQZBCUN2bPkgrbXfn/iCK802EYaxbZwWXKTk7
         qVrPENzPrk1mrlzdKwB/zBLB47gUIgZ4i9dyCwxAPW2u69MnzjEky1i7WNIkODJRo/9l
         3ZkBcJGiR1sb9wVmY2BztUk3Wdy/VoniNLYtuhimiH4v9xXaRYq1VJs0XSzMscG+Kz2o
         CilQS6ZqV/5FwR+WcvEQPcFt1soqsp7BqWkIywGQ1TQjdBDPdX/QbY5iSu64BorMQdDv
         8n7Q==
X-Gm-Message-State: AOAM532gR1ONmwlnir373JQbPyHFgBEBb3CLml3CODx3jyQ0f+/KOxNa
	CAzKLF2oGaFWpB7kde45jB/ub8Jf2MDhZ3G9UDRCl1Y7wdI=
X-Google-Smtp-Source: ABdhPJy6i2TyYIE5UBA9olz0x36FXPMQ3xk4zO10DsR9YTxcR6jtvLjesdI5FWX4UMHsQBrtAtNqfnEZ5TDoLqvGDBA=
X-Received: by 2002:aca:4952:: with SMTP id w79mr3428748oia.33.1625635507139;
 Tue, 06 Jul 2021 22:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210514034101.3683-1-christopher.w.clark@gmail.com> <16e9e430-e684-46f9-ca48-3fdd80b9e8df@apertussolutions.com>
In-Reply-To: <16e9e430-e684-46f9-ca48-3fdd80b9e8df@apertussolutions.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 6 Jul 2021 22:24:53 -0700
Message-ID: <CACMJ4GajOuoD6nitaS-7_8b8vi_aJkhFP0qPe+75RuV3cgJQDQ@mail.gmail.com>
Subject: Ping: [PATCH v4 0/2] Introducing Hyperlaunch capability design
 (formerly: DomB mode of dom0less)
To: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	Scott Davis <scott.davis@starlab.io>, Christopher Clark <christopher.clark@starlab.io>, 
	openxt <openxt@googlegroups.com>, Daniel DeGraaf <dgdegra@tycho.nsa.gov>, quinnr@ainfosec.com
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 7:19 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 5/13/21 11:40 PM, Christopher Clark wrote:
> > We are submitting for inclusion in the Xen documentation:
> >
> > - the Hyperlaunch design document, and
> > - the Hyperlaunch device tree design document
> >
> > to describe a new method for launching the Xen hypervisor.

We would like to have these design documents merged, please.
We have responded to all of the feedback provided in previous rounds
and no further comments have been received on these since they were
posted in May.

thanks,

Christopher

> >
> > The Hyperlaunch feature builds upon prior dom0less work,
> > to bring a flexible and security-minded means to launch a
> > variety of VM configurations as part of the startup of Xen.
> >
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >
> >
> > Daniel P. Smith (2):
> >   docs/designs/launch: hyperlaunch design document
> >   docs/designs/launch: hyperlaunch device tree
> >
> >  .../designs/launch/hyperlaunch-devicetree.rst |  343 ++++++
> >  docs/designs/launch/hyperlaunch.rst           | 1004 +++++++++++++++++
> >  2 files changed, 1347 insertions(+)
> >  create mode 100644 docs/designs/launch/hyperlaunch-devicetree.rst
> >  create mode 100644 docs/designs/launch/hyperlaunch.rst
> >
>
> All,
>
> Please find a rendered PDF copy of each document attached for ease of
> reading.
>
> V/r,
> Daniel P. Smith
> Apertus Solutions, LLC

