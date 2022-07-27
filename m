Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90943581CBC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 02:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375821.608272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGUji-0007kk-OX; Wed, 27 Jul 2022 00:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375821.608272; Wed, 27 Jul 2022 00:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGUji-0007ia-Lu; Wed, 27 Jul 2022 00:17:14 +0000
Received: by outflank-mailman (input) for mailman id 375821;
 Wed, 27 Jul 2022 00:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGUji-0007iU-37
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 00:17:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7584de6f-0d41-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 02:17:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDEC861723;
 Wed, 27 Jul 2022 00:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD25C433C1;
 Wed, 27 Jul 2022 00:17:10 +0000 (UTC)
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
X-Inumbo-ID: 7584de6f-0d41-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658881030;
	bh=6Qn9kezw6JDiNR1QZruzKrDCMxbOB9yqQKz2MDiNRvY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dWzws4qV+AsFRjDgMOCBipFubSXkR4l/U5iq+HJ1S4+C3GpFCpbr9XymaqBs9K5uB
	 xOCnEqRsgYSQxHNzGD4+r9w37d8zcvvmtqxwBXM7fZUrN23sqRwyWXIQV49K+x/HhI
	 gkCgWxADKJ+ox7SUg8KS/Oof7Q5QQzzLvpgX7i2BH0PgjlFJUAK5sWwwH/FP86HMgt
	 GBSxGNJkjm0mTQYnJSRrek4cuTwIJp/GmYAUkzg25b2XwGdTd8a80LOZSHmSlLY86u
	 bD52xjCo76DPgnSy8tmQGzKOuK2eUZ5XuiXxeTD+TrI8k/Hx3ch6bqGA77RPdghoP5
	 D6tz3L+GEcpkg==
Date: Tue, 26 Jul 2022 17:17:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
In-Reply-To: <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2207261713020.4648@ubuntu-linux-20-04-desktop>
References: <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Jul 2022, Smith, Jackson wrote:
> Hi Stefano,
> 
> My colleague Jason Lei and I would like to submit a patch to imagebuilder.
> 
> It seems that generating a .fit with a true dom0less configuration fails because an extraneous comma is included in the its file.
> 
> We believe this change resolves the issue.

Hi Jackson, thanks for your contribution!

Yes, I see the problem: the code assumes there is a dom0 kernel. If
there is no dom0 kernel then load_files will be wrongly starting with a
","

I would be happy to commit your patch. I assume I can add your
Signed-off-by to it, right?

Signed-off-by: Jackson Smith <rsmith@RiversideResearch.org>

Signed-off-by is the "Developer Certificate of Origin" which means:
https://developercertificate.org/



> 
> Remove extraneous comma in generated its file when no DOM0_KERNEL is specified.
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 8f08cd6..6f94fce 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -676,7 +676,12 @@ create_its_file_xen()
>              i=$(( $i + 1 ))
>              continue
>          fi
> -        load_files+=", \"domU${i}_kernel\""
> +       if test -z "$load_files"
> +       then
> +           load_files+="\"domU${i}_kernel\""
> +       else
> +           load_files+=", \"domU${i}_kernel\""
> +       fi
>          cat >> "$its_file" <<- EOF
>          domU${i}_kernel {
>              description = "domU${i} kernel binary";
> 
> 

