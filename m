Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5414CC339
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283586.482660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPofI-000657-JT; Thu, 03 Mar 2022 16:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283586.482660; Thu, 03 Mar 2022 16:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPofI-00061r-GG; Thu, 03 Mar 2022 16:50:56 +0000
Received: by outflank-mailman (input) for mailman id 283586;
 Thu, 03 Mar 2022 16:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylIu=TO=citrix.com=prvs=0548df38f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nPofH-00060U-8Y
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:50:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c23540-9b12-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:50:53 +0100 (CET)
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
X-Inumbo-ID: 14c23540-9b12-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646326253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R0oR7tfIq/Z2IW5QUl+LxmBT8t6a9cgGfLm/JxvWPU8=;
  b=WQ2z0BnHfzrbvqu0e9bIjxw2A1LwaFrX/5dIlnbw8EmrSL/IfS6UxkpW
   kboZ18UkJEkz01uiNr/Oq7wDd4Nwr7A0+D1PTy+V/7NtgaVBNL+ALGScu
   GirxtVTdQcgKPWn/mhIgrODAfTgZiwForQoNtiXRiy6U73Uo7tZ2khkrP
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65814765
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4wwrEq0dEMENhZ8B7/bD5TNxkn2cJEfYwER7XKvMYLTBsI5bp2cCy
 WZOXjiPO/yPMWfyft8kYISzo0lVv8DXmNZlQFZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1nibK2RERqPZTFxtgiaRl7Li8mBZVvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiDN
 5NFNmQyBPjGSw1tHhAvLqwhpr7y33/+TRtc9nyZlYNitgA/yyQuieOwYbI5YOeie8JRmUqJo
 3PcyE7wCBoaKd+3xCKM9zSngeqntSn2Qp4IHbu0sPtjmkSOx3c7AQcTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/4+H01bKwHGvn5GXcjEP5ibqUDqd1iosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxT4M4fFyhVErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+DCOiLEEuhYaTNii9zVCove+m05F
 P4FaqO3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVzTOhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57YU6QXF2+eoGx1gFuUhNUKSSlHTDmmZ0KNCAXTtbY7GGQlJveMktPTyRQz
IronPort-HdrOrdr: A9a23:Wgpd6qHuP3Jw+9w5pLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65814765"
Date: Thu, 3 Mar 2022 16:50:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
Message-ID: <YiDxz2QcpzV7NGQ7@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
 <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>
 <YiDhpSZC1z/duG4q@perard.uk.xensource.com>
 <48c58217-30c6-790f-a058-49b887fc1355@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <48c58217-30c6-790f-a058-49b887fc1355@suse.com>

On Thu, Mar 03, 2022 at 05:01:07PM +0100, Jan Beulich wrote:
> On 03.03.2022 16:41, Anthony PERARD wrote:
> > On Thu, Mar 03, 2022 at 11:37:08AM +0100, Jan Beulich wrote:
> >> On 25.01.2022 12:00, Anthony PERARD wrote:
> >>> +# Part of the command line transforms $(obj) in to a relative reverted path.
> >>> +# e.g.: It transforms "dir/foo/bar" into successively
> >>> +#       "dir foo bar", ".. .. ..", "../../.."
> >>> +$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> >>> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
> >>
> >> What is the "reverted" about in the comment? Also (nit) I think you want
> >> s/in to/into/.
> > 
> > I've tried to described in the single word that the result is a relative
> > path that goes in the opposite direction to the original relative path.
> > Instead of going down, it goes up the hierarchy of directories.
> > Maybe "reversed" would be better? Do you have other suggestion?
> 
> I'd simply omit the word. In case you're fine with that, I'd be happy
> to adjust while committing.

I think that would sound kind of strange. $(obj) is already a relative
path. It would probably be better to just drop the end of the sentence
in that case. With the example showing what is happening, that would
probably be enough. The sentence would then be:

    # Part of the command line transforms $(obj).
    # e.g.: It transforms "dir/foo/bar" into successively
    #       "dir foo bar", ".. .. ..", "../../.."

-- 
Anthony PERARD

