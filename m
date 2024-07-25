Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7293CAF2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 00:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765158.1175746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX7B4-0000Ug-OJ; Thu, 25 Jul 2024 22:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765158.1175746; Thu, 25 Jul 2024 22:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX7B4-0000St-KQ; Thu, 25 Jul 2024 22:43:14 +0000
Received: by outflank-mailman (input) for mailman id 765158;
 Thu, 25 Jul 2024 22:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sX7B3-0000Sl-Gw
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 22:43:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43dac7ce-4ad7-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 00:43:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC22ACE1670;
 Thu, 25 Jul 2024 22:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D8FC116B1;
 Thu, 25 Jul 2024 22:43:06 +0000 (UTC)
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
X-Inumbo-ID: 43dac7ce-4ad7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721947387;
	bh=YSo0ZWw2Rmtmy3caExuqNagDM3pbktT9dEH66VTsiWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ukkrpSypdxqqAToLgn1t1aqea1OMaokstn+NyCARl1fMwLx1i5AcArg0lcL87gLr+
	 /bH5BOF9Quy7f0Lr5mY8K6fOeH7sFT1/Z1VvxbzXo00HEqn4U1q0TPF6dtfKQFzwZy
	 NvhX22sjJeBFGSoNFOfxxtVHynENvEdHnUun03tn43v6L9wR0ERlVEF8vW7pv62W8N
	 xDOZXK0CVUDcsXvZH/Tj9K1lP92cxYfX1y82fF7GyyOdVEaIIe7AcAE3eGk+ZFSNAk
	 qNj5YpD0EMDCbcTvrsWWQ1pInmFSzEvpk9XX90l9lYbGagKLBJ2pUytzCcCHbJg8Jz
	 K2VqxUSZci3Eg==
Date: Thu, 25 Jul 2024 15:43:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com, 
    consulting@bugseng.com, simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
In-Reply-To: <d1a08318bb28df72f95c737627c1a4e5@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407251542230.4857@ubuntu-linux-20-04-desktop>
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com> <d1a08318bb28df72f95c737627c1a4e5@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jul 2024, Nicola Vetrini wrote:
> On 2024-07-25 21:01, victorm.lira@amd.com wrote:
> > From: Victor Lira <victorm.lira@amd.com>
> > 
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> > ---
> > Notes:
> > This is a utilty script for help with the MISRA process.
> > This script matches all linker symbol names in linker script files for
> > arm or x86.
> > Not included are symbol names starting with "." or symbol names enclosed
> > in quotes since the files dont't use any. The regular expression also does
> > not match for "&=" and similar compound assignments.
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: roberto.bagnara@bugseng.com
> > Cc: consulting@bugseng.com
> > Cc: simone.ballarin@bugseng.com
> > ---
> > Changes v2:
> > - address style comments
> > - updated script to use .lds instead of .lds.S
> > - remove sample output from patch
> > 
> > Changes v3:
> > - use #!/bin/sh
> > - update error handling and message similar to ../build.sh
> > ---
> >  automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100755 automation/eclair_analysis/linker-symbols.sh
> > 
> > diff --git a/automation/eclair_analysis/linker-symbols.sh
> > b/automation/eclair_analysis/linker-symbols.sh
> > new file mode 100755
> > index 0000000000..61790fb281
> > --- /dev/null
> > +++ b/automation/eclair_analysis/linker-symbols.sh
> > @@ -0,0 +1,34 @@
> > +#!/bin/sh
> > +
> > +# Stop immediately if any executed command has exit status different from
> > 0.
> > +set -e
> > +
> > +# Extract linker symbol names (except those starting with ".") from
> > assignments.
> > +
> > +script_name=$(basename "$0")
> > +script_dir="$(
> > +  cd "$(dirname "$0")"
> > +  echo "${PWD}"
> > +)"
> > +src_dir="${script_dir}/../.."
> > +
> > +fatal() {
> > +  echo "${script_name}: $*" >&2
> > +  exit 1
> > +}
> > +
> > +usage() {
> > +  fatal "Usage: ${script_name} <arm|x86>"
> > +}
> > +
> > +if [ $# -ne 1 ]; then
> > +  usage
> > +fi
> > +
> > +filepath="${src_dir}/xen/arch/${1}/xen.lds"
> > +
> > +if [ ! -f "$filepath" ]; then
> > +  fatal "Could not find ${1} linker script. Must be run after arm/x86
> > build."
> > +fi
> > +
> 
> A doubt I came across now: since this script must be run after the build (and
> hence the analysis), but the configuration must be generated before the
> analysis, the only way this could work in my opinion is this:
> 
> - a build without analysis is performed, just enough to build xen.lds (maybe
> there is a specific Makefile target to do this)
> - generate the configuration, then clean everything and then run the analysis

Yes, that is one option and it should work. The other option is to run
this script against the xen.lds.S files instead (if it works.)


> > +sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" "$filepath"

