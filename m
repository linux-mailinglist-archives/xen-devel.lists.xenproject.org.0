Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26822705C13
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 02:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535749.833741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz5H4-000122-JE; Wed, 17 May 2023 00:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535749.833741; Wed, 17 May 2023 00:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz5H4-0000z3-GI; Wed, 17 May 2023 00:44:14 +0000
Received: by outflank-mailman (input) for mailman id 535749;
 Wed, 17 May 2023 00:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz5H2-0000yx-Ql
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 00:44:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef974b00-f44b-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 02:44:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A88563553;
 Wed, 17 May 2023 00:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E578C433EF;
 Wed, 17 May 2023 00:44:07 +0000 (UTC)
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
X-Inumbo-ID: ef974b00-f44b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684284248;
	bh=ehs/r7AZWycXiEY8yCcbKJTzpi6n+5JgucP7q5kCOH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JjKn8qkg0cItcEhKBuO/EYph8aqSXa950FXChxAzZ1ci89OuiXfuVJa1kUR31xH0G
	 F6zRDrKBOJUC/b1Wvm6ukNaWShCTWnBsbioXefTuqWk7mPig95EBKQtmGb16NhNTse
	 XPa3QnH/wG0P9z/E4WtbjUjqYuEoW38LCu0vabe+34+XI/2V781PV4+pnlN672UvZd
	 HFKBksepjsPx8+BtN1BI4jLVQOw3s3dMULClELXWKxylTZiMk6NLa4oLZgcGdT7ul/
	 uCAdqQIGD97aKGYYdqEKyqYXAkPaQ0nX8oHU/m42nqFR/bXa+ZnCuTwMlTqvqxiyEZ
	 cDCT8KP7th7sQ==
Date: Tue, 16 May 2023 17:44:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path
 from the ...
In-Reply-To: <20230504131245.2985400-4-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305161743520.128889@ubuntu-linux-20-04-desktop>
References: <20230504131245.2985400-1-luca.fancellu@arm.com> <20230504131245.2985400-4-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 May 2023, Luca Fancellu wrote:
> repository in the reports
> 
> Currently the cppcheck report entries shows the relative file path
> from the /xen folder of the repository instead of the base folder.
> In order to ease the checks, for example, when looking a git diff
> output and the report, use the repository folder as base.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
> index c3783e8df343..c8abbe0fca79 100644
> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -149,7 +149,7 @@ def generate_cppcheck_deps():
>   --suppress='unusedStructMember:*'
>   --include={}/include/xen/config.h
>   -DCPPCHECK
> -""".format(settings.xen_dir, settings.outdir, settings.xen_dir)
> +""".format(settings.repo_dir, settings.outdir, settings.xen_dir)
>  
>      invoke_cppcheck = utils.invoke_command(
>              "{} --version".format(settings.cppcheck_binpath),
> @@ -240,7 +240,7 @@ def generate_cppcheck_report():
>      try:
>          cppcheck_report_utils.cppcheck_merge_txt_fragments(fragments,
>                                                             report_filename,
> -                                                           [settings.xen_dir])
> +                                                           [settings.repo_dir])
>      except cppcheck_report_utils.CppcheckTXTReportError as e:
>          raise CppcheckReportPhaseError(e)
>  
> @@ -257,7 +257,7 @@ def generate_cppcheck_report():
>          try:
>              cppcheck_report_utils.cppcheck_merge_xml_fragments(fragments,
>                                                                 xml_filename,
> -                                                               settings.xen_dir,
> +                                                               settings.repo_dir,
>                                                                 settings.outdir)
>          except cppcheck_report_utils.CppcheckHTMLReportError as e:
>              raise CppcheckReportPhaseError(e)
> @@ -265,7 +265,7 @@ def generate_cppcheck_report():
>          utils.invoke_command(
>              "{} --file={} --source-dir={} --report-dir={}/html --title=Xen"
>                  .format(settings.cppcheck_htmlreport_binpath, xml_filename,
> -                        settings.xen_dir, html_report_dir),
> +                        settings.repo_dir, html_report_dir),
>              False, CppcheckReportPhaseError,
>              "Error occured generating Cppcheck HTML report:\n{}"
>          )
> @@ -273,7 +273,7 @@ def generate_cppcheck_report():
>          html_files = utils.recursive_find_file(html_report_dir, r'.*\.html$')
>          try:
>              cppcheck_report_utils.cppcheck_strip_path_html(html_files,
> -                                                           (settings.xen_dir,
> +                                                           (settings.repo_dir,
>                                                              settings.outdir))
>          except cppcheck_report_utils.CppcheckHTMLReportError as e:
>              raise CppcheckReportPhaseError(e)
> -- 
> 2.34.1
> 

