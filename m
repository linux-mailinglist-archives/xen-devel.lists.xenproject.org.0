Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C91B0C35
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:03:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQW4j-0005tl-B7; Mon, 20 Apr 2020 13:03:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VyLZ=6E=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jQW4h-0005tg-Tf
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:02:59 +0000
X-Inumbo-ID: 428a1304-8307-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 428a1304-8307-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 13:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=W09ujvn6zHL+FVq+uHtKF1npnXqYeIi9IbSgfmvfBWY=; b=CeR48/NOEPi4RpjQw2iSDQcS4v
 65xLdBQM0XmIJFbFA8+XilT7ueqfUYseGW/2Uz39w1HHy/FjEDzCiuEoOyvFFVGmivi6/LjopUUn5
 Qe7kSUnS90FrzAki5NiaAAjsUWpFznu+fQ8Ppr7v+HtLkexMPDrewJ6k4a5S5cv01FZQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jQW4f-0004iA-L6; Mon, 20 Apr 2020 13:02:57 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jQW4f-0003jR-Ac; Mon, 20 Apr 2020 13:02:57 +0000
Date: Mon, 20 Apr 2020 14:02:54 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
Message-ID: <20200420130254.unwgbelql75lnprw@debian>
References: <20200417222430.20480-1-sstabellini@kernel.org>
 <35b34e2f-e6cd-6afc-19fd-c7880ec0eace@xen.org>
 <20200420102710.cg3bmjlntgpxqj77@debian>
 <a4cfb801-f0c5-f08d-02fc-c35820bccd87@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4cfb801-f0c5-f08d-02fc-c35820bccd87@suse.com>
User-Agent: NeoMutt/20180716
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

On Mon, Apr 20, 2020 at 02:36:49PM +0200, Jan Beulich wrote:
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

I mean when I work on Xen I normally use 8 or 9. Not sure about Linux.

Wei.

> 
> Jan

