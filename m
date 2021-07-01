Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C83B9594
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149002.275410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0cG-0006Rg-Ts; Thu, 01 Jul 2021 17:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149002.275410; Thu, 01 Jul 2021 17:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0cG-0006P6-PW; Thu, 01 Jul 2021 17:36:44 +0000
Received: by outflank-mailman (input) for mailman id 149002;
 Thu, 01 Jul 2021 17:36:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uD8v=LZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lz0cG-0006P0-0s
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:36:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5bd724f-da92-11eb-835a-12813bfff9fa;
 Thu, 01 Jul 2021 17:36:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 348F36138C;
 Thu,  1 Jul 2021 17:36:41 +0000 (UTC)
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
X-Inumbo-ID: e5bd724f-da92-11eb-835a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625161001;
	bh=ifTalwTLDbilj/hbcd+BpJi1t2wEHaUzCH7wDp147tU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WP1DaP9iCaHruWwoXcaetrJwzcAxMFS+ilw//fhmsk/NdfiFIypgDX/HuM7NfvviQ
	 4L8T0WQLhGJJPHOgMZQPzD5wNdocLAsiARnwleKPWQgZx80W5w4G6gMKaXcwdn/S6n
	 zB3/ECvedFJcxr2jay3ZBE7yYwmHr1y7srtEG9v7MiHHX/OFe93x1JbH6/FzoRXFFB
	 irqvOgFb7VcGRIP+/tu8ZeVi/hvWeWe70vfdrz64OuGnypkoxXSNhL2xc3NVbO7PNg
	 o+PFzj9YZdmtMoV+YEwzXzgRZtMiJERzjDtvCEezVCquKr9DZseYcMbDhEoPj/FmEO
	 Wh/ekf5rPQbHA==
Date: Thu, 1 Jul 2021 10:36:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 6/9] docs: add doxygen preprocessor and related
 files
In-Reply-To: <5D3534B9-30AC-484F-B2CF-02822D3D1226@arm.com>
Message-ID: <alpine.DEB.2.21.2107011034470.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-7-luca.fancellu@arm.com> <alpine.DEB.2.21.2106231456290.24906@sstabellini-ThinkPad-T480s> <5D3534B9-30AC-484F-B2CF-02822D3D1226@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1068870486-1625161001=:9437"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1068870486-1625161001=:9437
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Jul 2021, Luca Fancellu wrote:
> > On 23 Jun 2021, at 23:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 10 May 2021, Luca Fancellu wrote:
> >> Add preprocessor called by doxygen before parsing headers,
> >> it will include in every header a doxygen_include.h file
> >> that provides missing defines and includes that are
> >> usually passed by the compiler.
> >> 
> >> Add doxy_input.list that is a text file containing the
> >> relative path to the source code file to be parsed by
> >> doxygen. The path sould be relative to the xen folder:
> >> E.g. xen/include/public/grant_table.h
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> docs/xen-doxygen/doxy-preprocessor.py | 110 ++++++++++++++++++++++++++
> >> docs/xen-doxygen/doxy_input.list      |   0
> >> docs/xen-doxygen/doxygen_include.h.in |  32 ++++++++
> >> 3 files changed, 142 insertions(+)
> >> create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
> >> create mode 100644 docs/xen-doxygen/doxy_input.list
> >> create mode 100644 docs/xen-doxygen/doxygen_include.h.in
> >> 
> >> diff --git a/docs/xen-doxygen/doxy-preprocessor.py b/docs/xen-doxygen/doxy-preprocessor.py
> >> new file mode 100755
> >> index 0000000000..496899d8e6
> >> --- /dev/null
> >> +++ b/docs/xen-doxygen/doxy-preprocessor.py
> >> @@ -0,0 +1,110 @@
> >> +#!/usr/bin/python3
> >> +#
> >> +# Copyright (c) 2021, Arm Limited.
> >> +#
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +#
> >> +
> >> +import os, sys, re
> >> +
> >> +
> >> +# Variables that holds the preprocessed header text
> >> +output_text = ""
> >> +header_file_name = ""
> >> +
> >> +# Variables to enumerate the anonymous structs/unions
> >> +anonymous_struct_count = 0
> >> +anonymous_union_count = 0
> >> +
> >> +
> >> +def error(text):
> >> +    sys.stderr.write("{}\n".format(text))
> >> +    sys.exit(1)
> >> +
> >> +
> >> +def write_to_output(text):
> >> +    sys.stdout.write(text)
> >> +
> >> +
> >> +def insert_doxygen_header(text):
> >> +    # Here the strategy is to insert the #include <doxygen_include.h> in the
> >> +    # first line of the header
> >> +    abspath = os.path.dirname(os.path.abspath(__file__))
> >> +    text += "#include \"{}/doxygen_include.h\"\n".format(abspath)
> >> +
> >> +    return text
> >> +
> >> +
> >> +def enumerate_anonymous(match):
> >> +    global anonymous_struct_count
> >> +    global anonymous_union_count
> >> +
> >> +    if "struct" in match.group(1):
> >> +        label = "anonymous_struct_%d" % anonymous_struct_count
> >> +        anonymous_struct_count += 1
> >> +    else:
> >> +        label = "anonymous_union_%d" % anonymous_union_count
> >> +        anonymous_union_count += 1
> >> +
> >> +    return match.group(1) + " " + label + " {"
> >> +
> >> +
> >> +def manage_anonymous_structs_unions(text):
> >> +    # Match anonymous unions/structs with this pattern:
> >> +    # struct/union {
> >> +    #     [...]
> >> +    #
> >> +    # and substitute it in this way:
> >> +    #
> >> +    # struct anonymous_struct_# {
> >> +    #     [...]
> >> +    # or
> >> +    # union anonymous_union_# {
> >> +    #     [...]
> >> +    # where # is a counter starting from zero, different between structs and
> >> +    # unions
> >> +    #
> >> +    # We don't count anonymous union/struct that are part of a typedef because
> >> +    # they don't create any issue for doxygen
> >> +    text = re.sub(
> >> +        "(?<!typedef\s)(struct|union)\s+?\{",
> >> +        enumerate_anonymous,
> >> +        text,
> >> +        flags=re.S
> >> +    )
> 
> Hi Stefano,
> 
> > 
> > My python is a bit rusty but I thought this is really clever!
> > 
> > One question: given that anonymous_struct_count is local per file being
> > processed, it always starts at 0 for each header. I think that is
> > actually better from a documentation readability point of view.
> > 
> > However, is it possible that Doxygen gets confused in a case where we
> > can multiple "struct anonymous_struct_0", e.g. one for grant_table.h,
> > one for event_channel.h, etc. ?
> 
> Yes this is a very good point, I did some experiment and it can happen, however so far we didn’t notice any
> problem because all the anonymous union/struct were part of other data structure, in that case there is no
> problem at all because we have upper_data_structure::anonymous_{struct/union}_0/1/2…
> 
> So given the fact that is difficult to have clash, I would say we can handle any future case separately.
> 
> Having a global numbering can solve the issue but because the script is called separately for each header,
> Implementing it will involve some changes, there should be a file to maintain the number across invocation
> and so on.
> 
> Let me know what do you think about that and if in your opinion we can proceed the way it is now.

I think anonymous union/struct are always part of another data struct in
our headers, so we shouldn't have a problem. I think we can get away
without a global numbering system. Maybe you should add a note about
this limitation in the commit message or an in-code comment.
--8323329-1068870486-1625161001=:9437--

