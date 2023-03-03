Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0986A9E4E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 19:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506158.779202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY9xb-0003lG-9J; Fri, 03 Mar 2023 18:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506158.779202; Fri, 03 Mar 2023 18:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY9xb-0003ic-66; Fri, 03 Mar 2023 18:16:51 +0000
Received: by outflank-mailman (input) for mailman id 506158;
 Fri, 03 Mar 2023 18:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mZA2=63=kernel.org=song@srs-se1.protection.inumbo.net>)
 id 1pY9xa-0003iW-6o
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 18:16:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dde1a5e-b9ef-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 19:16:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 301806186E
 for <xen-devel@lists.xenproject.org>; Fri,  3 Mar 2023 18:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97092C433EF
 for <xen-devel@lists.xenproject.org>; Fri,  3 Mar 2023 18:16:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id d36so1568248lfv.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 10:16:43 -0800 (PST)
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
X-Inumbo-ID: 8dde1a5e-b9ef-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677867403;
	bh=z9o+Fj7F9hEekeJkNgNCjr/Inru7KzeAHF1ZoYV9Iio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tIJ7IPJ4KHsGCVQmNJVMq0GTuDbB7zi4lEH2qhnGRtaBwTofmI+hMCDYpA9763zfj
	 hnCWxc4EDetFEydMYfJYVCKCnuqX7lzBkQNF/3hHX/fFqg2w68Dz/J2NPZRFMC+ExQ
	 nspd4IdvGbl0PjPL3X5dDPVxgtnZL8vGWmW4GwY5J2Ab+G4cboaTKsqbRv/CUgJjYd
	 AlHYoz2pmiJ8UmkE+Tcrvn5IMXyPncF7oLw9cGdunMOy6vRssudSH3Yt9drtUnuDjJ
	 Tu0KBhBdcw9N12uoTUkInH/QUAcuy6fCuLrl3Q9h0Y1mx8oQdTybds27iOc5OdWhww
	 mcEJSCHEURnWg==
X-Gm-Message-State: AO0yUKXOCveTGc/rOzwZt2ZKN3SuaWQVwPFt507KXs2SplUTWAYOoO8d
	gzJepWgaWUrRkDa5/xEEk7UBf/qdIKMa3Y1L14g=
X-Google-Smtp-Source: AK7set8+TKohTy6ON4qynrd6qM7FwtWsRtV8zfmEmFF5syO7UhwA/Y8VS4hyO7ZdSGW9G+CTTREWUsKalOtJ4y3BnUw=
X-Received: by 2002:a05:6512:3c83:b0:4d8:86c2:75ea with SMTP id
 h3-20020a0565123c8300b004d886c275eamr3273736lfv.3.1677867401669; Fri, 03 Mar
 2023 10:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20230302204612.782387-1-mcgrof@kernel.org> <20230302204612.782387-5-mcgrof@kernel.org>
In-Reply-To: <20230302204612.782387-5-mcgrof@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 3 Mar 2023 10:16:29 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4k1hpLDWcQGCtEeR6LEgSboTY+tqbiPp+30_2T+rFezw@mail.gmail.com>
Message-ID: <CAPhsuW4k1hpLDWcQGCtEeR6LEgSboTY+tqbiPp+30_2T+rFezw@mail.gmail.com>
Subject: Re: [PATCH 4/7] md: simplify sysctl registration
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, robinmholt@gmail.com, steve.wahl@hpe.com, 
	mike.travis@hpe.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org, 
	oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, 
	j.granados@samsung.com, zhangpeng362@huawei.com, tangmeng@uniontech.com, 
	willy@infradead.org, nixiaoming@huawei.com, sujiaxun@uniontech.com, 
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 2, 2023 at 12:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Song Liu <song@kernel.org>

Thanks!

