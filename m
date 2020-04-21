Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8441B2EEE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 20:21:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQxW8-0002Uq-77; Tue, 21 Apr 2020 18:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jQxW6-0002Ul-1f
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 18:21:06 +0000
X-Inumbo-ID: dd077fc0-83fc-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd077fc0-83fc-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 18:21:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B16720679;
 Tue, 21 Apr 2020 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493264;
 bh=4ftyYLUQ5gLpIK5wPScHNo813E3g44obj0E6BDW9s9o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bg14cRhRTyKeBPn70VZ4qmRGHfkjUGQDU1gjbCescZZlGgygDiCy6jr1fUyq77abo
 rJD0spRoHW5E9S+ZsiiJdYZX3KGvZp4GXjhApZCHtqU3lv4Ch7polpPTH8AcpKn6B7
 5NMPricgLOuaCpk8d5fo8rREMeTmPIAV5EB8Tz14=
Date: Tue, 21 Apr 2020 11:21:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
In-Reply-To: <a4cfb801-f0c5-f08d-02fc-c35820bccd87@suse.com>
Message-ID: <alpine.DEB.2.21.2004211117160.24585@sstabellini-ThinkPad-T480s>
References: <20200417222430.20480-1-sstabellini@kernel.org>
 <35b34e2f-e6cd-6afc-19fd-c7880ec0eace@xen.org>
 <20200420102710.cg3bmjlntgpxqj77@debian>
 <a4cfb801-f0c5-f08d-02fc-c35820bccd87@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 20 Apr 2020, Jan Beulich wrote:
> On 20.04.2020 12:27, Wei Liu wrote:
> > On Mon, Apr 20, 2020 at 10:31:28AM +0100, Julien Grall wrote:
> >> On 17/04/2020 23:24, Stefano Stabellini wrote:
> >>> Create a new document under docs/process to describe our special tags.
> >>> Add a description of the Fixes tag and the new Backport tag. Also
> >>> clarify that lines with tags should not be split.
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> >>> CC: Wei Liu <wl@xen.org>
> >>> CC: jbeulich@suse.com
> >>> CC: george.dunlap@citrix.com
> >>> CC: julien@xen.org
> >>> CC: lars.kurth@citrix.com
> >>> CC: andrew.cooper3@citrix.com
> >>> CC: konrad.wilk@oracle.com
> >>> ---
> >>> Removing Acks as I added the description of "Fixes"
> >>> ---
> >>>   docs/process/tags.pandoc | 55 ++++++++++++++++++++++++++++++++++++++++
> >>>   1 file changed, 55 insertions(+)
> >>>   create mode 100644 docs/process/tags.pandoc
> >>>
> >>> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
> >>> new file mode 100644
> >>> index 0000000000..06b06dda01
> >>> --- /dev/null
> >>> +++ b/docs/process/tags.pandoc
> >>> @@ -0,0 +1,55 @@
> >>> +Tags: No line splitting
> >>> +-----------------------
> >>> +Do not split a tag across multiple lines, tags are exempt from the
> >>> +"wrap at 75 columns" rule in order to simplify parsing scripts.  For
> >>> +example:
> >>> +
> >>> +        Fixes: 67d01cdb5 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
> >>
> >> The SHA-1 ID is 9 characters but...
> >>
> >>> +
> >>> +
> >>> +Fixes Tag
> >>> +---------
> >>> +
> >>> +If your patch fixes a bug in a specific commit, e.g. you found an issue using
> >>> +``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
> >>> +the SHA-1 ID, and the one line summary.
> >>
> >> ... you request 12 characters here. Can you make sure the two match please?
> >>
> >> However, I am not entirely sure why we should mandate 12 characters. With
> >> the title, you should always be able to find back the commit if there is a
> >> clash.
> > 
> > This is copied from Linux's document.
> > 
> > I normally use 8-9 characters, but I don't mind using 12 either.
> 
> Are they still saying 9? I've been asked to switch to 12 several
> weeks back ...

Yes, I just took it from Linux. I don't care 9 or 12. Given the
preference for 12, I'll keep 12 in the text and update the example to
match.

