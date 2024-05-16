Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC08C7E7D
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 00:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723656.1128684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7jNP-00047C-EW; Thu, 16 May 2024 22:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723656.1128684; Thu, 16 May 2024 22:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7jNP-00045g-Ba; Thu, 16 May 2024 22:15:03 +0000
Received: by outflank-mailman (input) for mailman id 723656;
 Thu, 16 May 2024 22:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7jNO-00045a-Tg
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 22:15:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7b0e04-13d1-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 00:15:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1662CE1788;
 Thu, 16 May 2024 22:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BEEC113CC;
 Thu, 16 May 2024 22:14:51 +0000 (UTC)
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
X-Inumbo-ID: bb7b0e04-13d1-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715897693;
	bh=vpH+75ReyQpNGKULQBkFlwini+ATp8/4byOP7+8GzsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TUNCjXxUY4Ng1MJLrBwCMmYu0soYhY5pssyMR5cKiQwNGDE7NAQQS5L/SoL5YDDdK
	 NAmUWFU90G7zodqd2Aggiu6TIdgO7yi4S+eV4tXKsoULkEmx/771dFbbiz8QHIXPqg
	 DThnhvaTVf7aQWcI9ugoN1cFLzIjObXM00Ac/pMb7A98SwrB3HTpSd5slDLIUnDMYm
	 NDukcwmGyEvsRW/zcztwqoKNSiQBt21118XISJ4fgNmkONhjMOzpzj3BCRg+AaHEV9
	 FfmNIURJtMdZC8oMU3gRE8lYwO6pwPXlXJ79ynn463VWXrwacU1AaDyX3vlkecoNpa
	 VPRe5HbbBRUGQ==
Date: Thu, 16 May 2024 15:14:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    =?UTF-8?Q?Edwin_T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: Re: [PATCH v2 1/4] LICENSES: Add MIT-0 (MIT No Attribution)
In-Reply-To: <20240516185804.3309725-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405161514300.2544314@ubuntu-linux-20-04-desktop>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com> <20240516185804.3309725-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1797338315-1715897693=:2544314"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1797338315-1715897693=:2544314
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Andrew Cooper wrote:
> We are about to import code licensed under MIT-0.  It's compatible for us to
> use, so identify it as a permitted license.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin Török <edwin.torok@cloud.com>
> 
> v2:
>  * New
> ---
>  LICENSES/MIT-0 | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 LICENSES/MIT-0
> 
> diff --git a/LICENSES/MIT-0 b/LICENSES/MIT-0
> new file mode 100644
> index 000000000000..70fb90ee3486
> --- /dev/null
> +++ b/LICENSES/MIT-0
> @@ -0,0 +1,31 @@
> +Valid-License-Identifier: MIT-0
> +
> +SPDX-URL: https://spdx.org/licenses/MIT-0.html
> +
> +Usage-Guide:
> +
> +  To use the MIT-0 License put the following SPDX tag/value pair into a
> +  comment according to the placement guidelines in the licensing rules
> +  documentation:
> +    SPDX-License-Identifier: MIT-0
> +
> +License-Text:
> +
> +MIT No Attribution
> +
> +Copyright <year> <copyright holder>
> +
> +Permission is hereby granted, free of charge, to any person obtaining a copy
> +of this software and associated documentation files (the "Software"), to deal
> +in the Software without restriction, including without limitation the rights
> +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> +copies of the Software, and to permit persons to whom the Software is
> +furnished to do so.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> +SOFTWARE.
> -- 
> 2.30.2
> 
--8323329-1797338315-1715897693=:2544314--

