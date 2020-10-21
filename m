Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D72945B6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9793.25819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Xx-0007Ne-9D; Wed, 21 Oct 2020 00:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9793.25819; Wed, 21 Oct 2020 00:00:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Xx-0007LP-4T; Wed, 21 Oct 2020 00:00:05 +0000
Received: by outflank-mailman (input) for mailman id 9793;
 Wed, 21 Oct 2020 00:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1Xv-00074U-A9
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26a960f5-de87-4614-b387-b20100d01318;
 Wed, 21 Oct 2020 00:00:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED62C2076A;
 Wed, 21 Oct 2020 00:00:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1Xv-00074U-A9
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:03 +0000
X-Inumbo-ID: 26a960f5-de87-4614-b387-b20100d01318
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 26a960f5-de87-4614-b387-b20100d01318;
	Wed, 21 Oct 2020 00:00:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ED62C2076A;
	Wed, 21 Oct 2020 00:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238401;
	bh=6ifM7mWeMV6n2fSjpynMysrrMZX/rqHLO3hhKeiec/I=;
	h=Date:From:To:cc:Subject:From;
	b=RU7wK8H0qMqFdGLH/ZepEr+VqIQLfpu5gcUjLYodS6Oa3EN8GDDBZ4f76fVydfUjb
	 zm22Wx9FZk2v9a3N7rJtvn/76lWhsESEoRmsw8NGHj27sxWI7twVBIZIrQMZchbhjL
	 bKXW/5IQTYUsrATkaD+3D+zA4NRVH7NTzcM85VUA=
Date: Tue, 20 Oct 2020 17:00:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, ian.jackson@eu.citrix.com, jbeulich@suse.com, 
    julien@xen.org, wl@xen.org, Bertrand.Marquis@arm.com
Subject: [PATCH v2 00/14] kernel-doc: public/arch-arm.h
Message-ID: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series converts Xen in-code comments to the kernel-doc (and
doxygen) format:

https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html

Please note that this patch series is meant as groundwork. The end goal
is to enable a more sophisticated documents generation with doxygen,
see: https://marc.info/?l=xen-devel&m=160220627022339


# Changes compared to v1:
- addressed review comments
- use oneline comments even for nested struct members



# WHAT WAS CONVERTED

I started from the public/ header files as I thought they are the most
important to generated documentation for.

I didn't cover all files under xen/include/public/, but we don't have to
boil the ocean in one go.

For the header files I addressed, I did cover all in-code comments
except for very few exceptions where the conversion to kernel-doc format
wasn't easily doable without major changes to the comments/code.

The conversion was done by hand (sigh!) but was mechanical, and only
stylistic: I didn't change the content of the comments (only in a couple
of places to make the English work right, e.g. when a comment has been
split into two comments.)


# THE KERNEL-DOC KEYWORDS USED

I used the "struct" keyword for structures, i.e.:

/**
 * struct foobar
 */

"struct" makes kernel-doc go and look at the following struct in the
code, parses struct members comments, and generate a doc optimized to
describe a struct. Note that in these cases the struct needs to follow
immediately the comment. Thus, I had to move an #define between the
comment and the struct in a few places.

Also note that kernel-doc supports nested structs but due to a quirk
comments for nested struct members are not recognized if they are on a
single line. Still, this version of the series uses single line comments
with the idea of fixing the document-generation tool later.


I used the "DOC" keyword otherwise. "DOC" is freeform, not particularly
tied to anything following (functions, enums, etc.) I kept a black line
between "DOC" and the following comment if multiline and no blank line
if it is single line.

  /**
   * DOC: doc1
   * single line comment
   */

   /**
    * DOC: doc2
    *
    * this is
    * multiline
    */

DOC doesn't generate any cross-documents links but it is still a great
place to start as it makes the in-code comments immediately available as
documents. Linking and references can be added later.


# HOW TO TEST IT

Simply run kernel-doc on a header file, for instance:

  ../linux/scripts/kernel-doc xen/include/public/event_channel.h > /tmp/doc.rst

You can inspect the rst file and also generate a html file out of it with
sphinx:

  sphinx-quickstart
  sphinx-build . /path/to/out

Cheers,

Stefano




The following changes since commit 3b49791e4cc2f38dd84bf331b75217adaef636e3:

  xen/arm: Print message if reset did not work (2020-10-20 13:20:31 -0700)

are available in the Git repository at:

  http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git hyp-docs-2

for you to fetch changes up to 393bd090ae4f09bc68aa35af74e087cd4615be5a:

  kernel-doc: public/hvm/params.h (2020-10-20 16:45:54 -0700)

----------------------------------------------------------------
Stefano Stabellini (14):
      kernel-doc: public/arch-arm.h
      kernel-doc: public/hvm/hvm_op.h
      kernel-doc: public/device_tree_defs.h
      kernel-doc: public/event_channel.h
      kernel-doc: public/features.h
      kernel-doc: public/grant_table.h
      kernel-doc: public/hypfs.h
      kernel-doc: public/memory.h
      kernel-doc: public/sched.h
      kernel-doc: public/vcpu.h
      kernel-doc: public/version.h
      kernel-doc: public/xen.h
      kernel-doc: public/elfnote.h
      kernel-doc: public/hvm/params.h

 xen/include/public/arch-arm.h         |  43 ++-
 xen/include/public/device_tree_defs.h |  24 +-
 xen/include/public/elfnote.h          | 109 +++++--
 xen/include/public/event_channel.h    | 184 ++++++-----
 xen/include/public/features.h         |  78 +++--
 xen/include/public/grant_table.h      | 447 +++++++++++++++------------
 xen/include/public/hvm/hvm_op.h       |  20 +-
 xen/include/public/hvm/params.h       | 153 +++++++--
 xen/include/public/hypfs.h            |  72 +++--
 xen/include/public/memory.h           | 236 +++++++++-----
 xen/include/public/sched.h            | 134 +++++---
 xen/include/public/vcpu.h             | 180 ++++++++---
 xen/include/public/version.h          |  73 ++++-
 xen/include/public/xen.h              | 566 ++++++++++++++++++++++------------
 14 files changed, 1544 insertions(+), 775 deletions(-)

