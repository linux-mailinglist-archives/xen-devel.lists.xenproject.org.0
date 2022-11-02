Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E06165D1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 16:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435976.689956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFRs-00027i-Dr; Wed, 02 Nov 2022 15:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435976.689956; Wed, 02 Nov 2022 15:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqFRs-000253-AB; Wed, 02 Nov 2022 15:14:36 +0000
Received: by outflank-mailman (input) for mailman id 435976;
 Wed, 02 Nov 2022 15:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqFRq-00024w-Jh
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 15:14:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf5b643-5ac1-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 16:14:32 +0100 (CET)
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
X-Inumbo-ID: 0cf5b643-5ac1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667402072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Td5ryp8rA6pquA5v2pG6pPMTZhXTU6pX6MSes+dwgM4=;
  b=eTKPmm0hD/g7pWg344BGfraZ6Bid2ElKWSVYcRQp7u49fREVSuAIdCj9
   fD8soco4//flCRMBMWcaCn/V2h4QgB8tdYuACQO5azSxWf1hCa5GK379/
   6+MuH24RBGu4fDJjHEozephZbEfjyIP4x4GNiO4/BulnNDX+2LGALEzRe
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84017866
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+rEuCKk97edUIXUCTa10PJTo5gxMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXTuGaPzZYGamedB1aY+28h9V7ZPcmIM1QQA/ry03HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7amaVA8w5ARkP6kS5AWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fIHBDYmSDPTvMGz8rmqWq58i+gJAMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zhrA/
 z2WoTqR7hcyFZ+HyzqK3E2Q3OqQuyLEW7hJDZayz6s/6LGU7jNKU0BHPbehmtG7l0q/VtR3O
 0ESvC00osAa9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnbttlCr/zsdTzFhn52
 TXMpy8774j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqr8S9/T6iGN7eL7GrQ/OYHPIu1ZHWO6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4hT6FfKsEy/tX1
 XKnnSGEVC9yNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXQMbtjs/zc8VSMr
 76z0vdmLD0GDoXDjtT/q9ZPfTjm01BmbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9z4/1E
 oWGchYBkDLCaYjvc1rihoZLNOyyBv6SbBsTYUQRALpf8yN5O9fwsPZPLspfkHtO3LUL8MOYh
 sItI62oasmjgBydk9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:2TGFI64IpzzwS0cRoQPXwM7XdLJyesId70hD6qhwISY6TiW9rb
 HLoB19726StN9xYgBEpTnuAsS9qB/nmaKdpLNhW4tKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFeaTN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84017866"
Date: Wed, 2 Nov 2022 15:14:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture
 licences from the input headers
Message-ID: <Y2KJUqRMancOmX4y@perard.uk.xensource.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-3-anthony.perard@citrix.com>
 <822f8cb3-6f13-d729-9779-0aeceda46272@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <822f8cb3-6f13-d729-9779-0aeceda46272@citrix.com>

On Wed, Nov 02, 2022 at 12:24:21PM +0000, Andrew Cooper wrote:
> On 02/11/2022 11:28, Anthony PERARD wrote:
> > Notes:
> >     Maybe instead of this, we should just stamp this on the generated header
> >         /* SPDX-License-Identifier: MIT */
> >     
> >     but we would be missing the "Copyright" informations. I guess we could
> >     look for those line with Copyright and copy them.
> >     
> >     Or, we could replace the licence in the input header by a SPDX and have
> >     the script parse that. (Probably still need to grab the Copyright lines)
> 
> All public headers (except one :-( ) are MIT.
>
> We should SPDX the lot, not least because that removes all the
> guestimation from this script; we can require that the SPDX line is the
> first line, and sanity check it as we process it.

Yes, but I'm not sure I want to do the SPDX change when the tree is
supposed to be frozen.

> The headers also ought to say "automatically generated from $OTHER", and
> include no other information.  That's now most autogen headers work.
> 
> So the generated files ought to end up looking like:
> 
> /* SPDX-License-Identifier: MIT */
> /* Automatically generated from $FILE */

So the headers already have:
    /*
     * public xen defines and struct for arm32
     * generated by mkheader.py -- DO NOT EDIT
     */

So we just miss the source files used as input by mkheader.py. I can fix
that.

Thanks,

-- 
Anthony PERARD

