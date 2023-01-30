Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42117681CDA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487229.754790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbpu-0007ms-5D; Mon, 30 Jan 2023 21:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487229.754790; Mon, 30 Jan 2023 21:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbpu-0007kd-26; Mon, 30 Jan 2023 21:37:10 +0000
Received: by outflank-mailman (input) for mailman id 487229;
 Mon, 30 Jan 2023 21:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMbps-0007kX-7X
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:37:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbe4831-a0e6-11ed-b63b-5f92e7d2e73a;
 Mon, 30 Jan 2023 22:37:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31257B8169A;
 Mon, 30 Jan 2023 21:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68269C433EF;
 Mon, 30 Jan 2023 21:37:02 +0000 (UTC)
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
X-Inumbo-ID: 3dbe4831-a0e6-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675114623;
	bh=hRBa5PIW9OZ2WRwVnEEib++9dEUJ+CLEaHzgYur0qq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p40UHOT1O6rqzKlyAuETNTS8KmzSnxW9P2rZAE0PGYKSJ4oNK5hvdSVKtqCla+r7k
	 GCvyQuj8ivW0Ye2zv75uOdFVQNHM8uVlcKi+/LYCCunh+LIgNaY8yPg2DW8Hr/8No9
	 UZ2A11TTEdeJ1eV/pzYItcVNQ4Pv/qGrzFLUstOWNi3Lb/ho8b/QQeMg0Xcdyx2ov4
	 d4+oOV8Miw33N7facVHnTFQD1gIPhjewZuTFoHSMZuj1GEJ4K+sJKybeTmVJMibmIB
	 LYaxsodO+R3tPl423yMEn5JViH+8+9iQM3MXtOBdZL5wrt+Rp90Cq7y2sG32tbE74F
	 XNu7szNcV6x5A==
Date: Mon, 30 Jan 2023 13:37:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
In-Reply-To: <20230130110132.2774782-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301301336530.132504@ubuntu-linux-20-04-desktop>
References: <20230130110132.2774782-1-luca.fancellu@arm.com> <20230130110132.2774782-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1654406162-1675114623=:132504"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1654406162-1675114623=:132504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Jan 2023, Luca Fancellu wrote:
> Sort alphabetically cppcheck report entries when producing the text
> report, this will help comparing different reports and will group
> together findings from the same file.
> 
> The sort operation is performed with two criteria, the first one is
> sorting by misra rule, the second one is sorting by file.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - Sort with two criteria, first misra rule, second filename
>    (Michal, Jan)
> ---
> ---
>  xen/scripts/xen_analysis/cppcheck_report_utils.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> index 02440aefdfec..0b6cc72b9ac1 100644
> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> @@ -104,6 +104,13 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>                  for path in strip_paths:
>                      text_report_content[i] = text_report_content[i].replace(
>                                                                  path + "/", "")
> +                    # Split by : separator
> +                    text_report_content[i] = text_report_content[i].split(":")
> +            # sort alphabetically for second field (misra rule) and as second
> +            # criteria for the first field (file name)
> +            text_report_content.sort(key = lambda x: (x[1], x[0]))
> +            # merge back with : separator
> +            text_report_content = [":".join(x) for x in text_report_content]
>              # Write the final text report
>              outfile.writelines(text_report_content)
>      except OSError as e:
> -- 
> 2.25.1
> 
--8323329-1654406162-1675114623=:132504--

