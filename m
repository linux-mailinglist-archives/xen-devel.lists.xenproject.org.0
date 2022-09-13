Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166415B7AA1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 21:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406611.648980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBNS-00033n-JI; Tue, 13 Sep 2022 19:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406611.648980; Tue, 13 Sep 2022 19:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBNS-00030Y-FI; Tue, 13 Sep 2022 19:15:22 +0000
Received: by outflank-mailman (input) for mailman id 406611;
 Tue, 13 Sep 2022 19:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYBNQ-00030S-IO
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 19:15:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6776086b-3398-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 21:15:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB030B80DB8;
 Tue, 13 Sep 2022 19:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCFEC433D6;
 Tue, 13 Sep 2022 19:15:15 +0000 (UTC)
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
X-Inumbo-ID: 6776086b-3398-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663096516;
	bh=NBiBu1NMVErzYb/9lyzCIu4nd7Bzz/L+vCxhP/NfWB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CwRND+9LxZsnyx9MnzPPNFpcaKy4D/XYLVyEO3o0FM+3nynl+5hnRpx8nNRcDiOpD
	 MjhUje+H5x7Bad5tTukC+JtrFws+ClkQmeKQ4gYh7eZds/pFI3GnrSXHrMIdvKiL1R
	 sxwDnobxf0/cB6iZhRTEwS+wpaTV0HqggWXe+5/uiP/koK7VF0N7Wjh1zHeHbGzKal
	 DVwisTI3WuHjseahEcwgvxS16kWwIzPLqfzkRvhvRKcpYkbtyabm9Tdk45chJcPEqy
	 sDKw6Y58PpGGTttVUtHRXefPyFvjjJUfyBP6eajtzseHN8c+YO8dLoUKEUemfQGgly
	 ERS8vK9dM3x8A==
Date: Tue, 13 Sep 2022 12:15:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial
 dts
In-Reply-To: <a77584d8-d10b-d2fd-b070-0e37269d1503@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209131211200.157835@ubuntu-linux-20-04-desktop>
References: <20220912115934.19552-1-michal.orzel@amd.com> <20220912115934.19552-3-michal.orzel@amd.com> <276bd45d-7ab8-fc5d-a065-df6188b4f42f@amd.com> <a77584d8-d10b-d2fd-b070-0e37269d1503@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Sep 2022, Michal Orzel wrote:
> On 12/09/2022 18:41, Ayan Kumar Halder wrote:
> > Hi Michal,
> > 
> > On 12/09/2022 12:59, Michal Orzel wrote:
> >> Currently ImageBuilder can compile and merge partial dts obtained from
> >> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
> >> changes done in the lopper, we can use it to generate partial dts
> >> automatically (to some extent as this is still an early support).
> >>
> >> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
> >> that if set, will invoke lopper to generate partial dts for the
> >> passthrough devices specified in DOMU_PASSTHROUGH_PATHS.
> >>
> >> Introduce LOPPER_CMD option to specify custom command line arguments
> >> (if needed) for lopper's extract assist.
> >>
> >> Example usage:
> >> LOPPER_PATH="/home/user/lopper/lopper.py"
> >> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>   README.md                | 22 ++++++++++++--
> >>   scripts/common           | 64 ++++++++++++++++++++++++++++++----------
> >>   scripts/uboot-script-gen | 17 +++++++++--
> >>   3 files changed, 83 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/README.md b/README.md
> >> index da9ba788a3bf..aaee0939b589 100644
> >> --- a/README.md
> >> +++ b/README.md
> >> @@ -128,6 +128,19 @@ Where:
> >>   - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
> >>     to be added at boot time in u-boot
> >>   
> >> +- LOPPER_PATH specifies the path to lopper.py script. This is optional.
> >> +  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
> >> +  to be specified. uboot-script-gen will invoke lopper to generate the partial
> >> +  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
> >> +  This option is currently in experimental state as the corresponding lopper
> >> +  changes are still in an early support state.
> >> +
> >> +- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
> >> +  This is optional and only applicable when LOPPER_PATH is specified. Only to be
> >> +  used to specify which nodes to include (using -i <node_name>) and which
> >> +  nodes/properties to exclude (using -x <regex>). If not set at all, the default
> >> +  one is used applicable for ZynqMP MPSoC boards.
> > 
> > You are using some more arguments (besides -x and -i) :-
> > 
> > --permissive -f
> > -- extract -t
> > -- extract-xen -t $node -o
> These ones are fixed and do not differ depending on the type of device or board.
> That is why LOPPER_CMD is used only to allow users to specify what can be required
> to support a new device (usually not necessary) or a new board.
> 
> > 
> > It will be good to have some explaination for these. See my comments below.
> > 
> We don't seem to do it in general (see all the commands used by disk_image) so I think
> we should only describe what is available to the user. Otherwise we would need to be
> consistent and apply this rule to all the other places.


My thinking is that Lopper documentation is best kept under the Lopper
repository. ImageBuilder documentation should be under the ImageBuilder
repository.

In this case, I think Lopper might benefit from better docs on how to
use extract-xen. extract-xen doesn't even seem to be described in
README.md?

I think it would be good to add at least a mention there, or another doc
under lopper.git.

Here in ImageBuilder I don't know if I would add anything. We could
explain why we chose this set of Lopper command line options, but I
think that if Lopper was well documented we wouldn't need to.

So in conclusion: I am OK with no extra docs in this series but please
have a look at lopper.git to see if we are missing anything there.

Do you guys agree?

