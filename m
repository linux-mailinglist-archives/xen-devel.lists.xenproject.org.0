Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B741D42F8DF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210963.368021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQSe-000096-8Z; Fri, 15 Oct 2021 16:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210963.368021; Fri, 15 Oct 2021 16:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQSe-000074-5R; Fri, 15 Oct 2021 16:53:36 +0000
Received: by outflank-mailman (input) for mailman id 210963;
 Fri, 15 Oct 2021 16:53:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aKp=PD=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1mbQSd-00006p-9Q
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:53:35 +0000
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb46bc0-1163-4960-9021-3306e67006e7;
 Fri, 15 Oct 2021 16:53:34 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y30so22910749edi.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Oct 2021 09:53:34 -0700 (PDT)
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
X-Inumbo-ID: 5fb46bc0-1163-4960-9021-3306e67006e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFAfhL2wTnA/x1oOiRIEIccRhRGZWYerK6em4KwuQr0=;
        b=WhznUYR2nkpwiwbTRwmHKoc047JsFdk3RvHIe/jtOLSDmdxX07MCX9Eow0Bi+yLoQp
         EyU08OzLxLG5ZCsUs7GUsgWdhql+ygc3SL2hgpQj7qkueaPaH4FCl+VEJFbTT66B35gH
         GDagaCdrbJmPFv3m1vjK25dlCo+SurtmwsJpbtn+lVZ1hUtQu8pPUJ/3APaMcce/rMb+
         gK4/JKJga2A5DLyU3cXWQ467mYYMbHs26I04bEcKD9mvTuveZ0BpijvVaw9Fg5WzWNNW
         l7COh3PfIisjI8gWM0rsyxYaukEsrZpFMim7hIuXFIwI4NkGZUXxkbzqxVTnksr3mpP4
         SUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFAfhL2wTnA/x1oOiRIEIccRhRGZWYerK6em4KwuQr0=;
        b=zXW59JpnuDXKIapTKzL11AZzoclk39l8OB7pOB29F14aZ9ZZTp11sYBCsdu35WulBP
         Wr4Nqm8Rb9n9f3DU8WOjUbD9L7/i7mL8hCCXo5fEXKM4mglJBr9vt+AHp3QJuF4SQbrH
         +/qGGqUrQZDxTfQgbmYEh3LIpE1PhC9d2aDKnO9O4pmUqLRJS75xhdJQjjn3dnXoApWs
         /sZqjt71HW5LfGLVwMt3qKYl1112CGiajPq4bA5LR1jP4XJHb/4V2FQ8R7Y2F9VZH3m/
         rRcLxahjVH/VKLkt957cZSTwJAs4uYBLBTWvuzkbD/an6S7ZiMFKQLSemZVzdDbNwKqF
         B6tw==
X-Gm-Message-State: AOAM53174cbMJje67L404c7JHVVbSutLTj9a3NDGWI+SpwlR7gDGk0k5
	Naetn0hs6eZFMP0FsZ4RdThk+4DD9YNar1B2HGE=
X-Google-Smtp-Source: ABdhPJw1GMYkf4/DzQ6xCdDldbViFURlmc0YnNdhDKa/6j1hrF7JWMyfM92nI6tIEj+fn7ChYTDQotvOC+uhf3cE48A=
X-Received: by 2002:a50:e188:: with SMTP id k8mr19911628edl.119.1634316813165;
 Fri, 15 Oct 2021 09:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <YWbdvc7EWEZLVTHM@smile.fi.intel.com> <20211015164653.GA2108651@bhelgaas>
In-Reply-To: <20211015164653.GA2108651@bhelgaas>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Oct 2021 22:52:45 +0300
Message-ID: <CAHp75VdpVwvOkjDWHcnWA-qZFm062UBp7VwdcpWbkdVR=i75Hw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-pci <linux-pci@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, 
	Alexander Duyck <alexanderduyck@fb.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"David S. Miller" <davem@davemloft.net>, Fiona Trahe <fiona.trahe@intel.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ido Schimmel <idosch@nvidia.com>, Ingo Molnar <mingo@redhat.com>, 
	Jack Xu <jack.xu@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Jiri Pirko <jiri@nvidia.com>, Juergen Gross <jgross@suse.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marco Chiappero <marco.chiappero@intel.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Namhyung Kim <namhyung@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, 
	Peter Zijlstra <peterz@infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Russell Currey <ruscur@russell.cc>, Salil Mehta <salil.mehta@huawei.com>, 
	Sathya Prakash <sathya.prakash@broadcom.com>, Simon Horman <simon.horman@corigine.com>, 
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, 
	Taras Chornyi <tchornyi@marvell.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Tomaszx Kowalik <tomaszx.kowalik@intel.com>, Vadym Kochan <vkochan@marvell.com>, 
	Wojciech Ziemba <wojciech.ziemba@intel.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto <linux-crypto@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, 
	"open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>, MPT-FusionLinux.pdl@broadcom.com, 
	netdev <netdev@vger.kernel.org>, oss-drivers@corigine.com, qat-linux@intel.com, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 7:46 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Wed, Oct 13, 2021 at 04:23:09PM +0300, Andy Shevchenko wrote:

...

> so compared to Uwe's v6, I restored that section to the original code.
> My goal here was to make the patch as simple and easy to review as
> possible.

Thanks for elaboration. I have got it.

...

> You're right, this didn't make much sense in that patch.  I moved the
> line join to the previous patch, which unindented this section and
> made space for this to fit on one line.  Here's the revised commit:
>
>   https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=34ab316d7287

Side remark: default without break or return is error prone (okay, to
some extent). Perhaps adding the return statement there will make
things robust and clean.

-- 
With Best Regards,
Andy Shevchenko

