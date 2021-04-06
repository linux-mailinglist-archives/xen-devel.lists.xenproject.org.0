Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A1355E22
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 23:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106312.203328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtWs-0008Pw-OY; Tue, 06 Apr 2021 21:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106312.203328; Tue, 06 Apr 2021 21:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtWs-0008PX-L5; Tue, 06 Apr 2021 21:46:34 +0000
Received: by outflank-mailman (input) for mailman id 106312;
 Tue, 06 Apr 2021 21:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uncx=JD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lTtWr-0008PC-JS
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 21:46:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68deda9a-c195-41e6-8e22-d40798d31ea2;
 Tue, 06 Apr 2021 21:46:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D57A86139C;
 Tue,  6 Apr 2021 21:46:31 +0000 (UTC)
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
X-Inumbo-ID: 68deda9a-c195-41e6-8e22-d40798d31ea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617745592;
	bh=Jgjr8OoeRmHCWaG51kXyNCTjBoJQYTrzB5UXeQQvLvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oPAAVWt7xcIO4aWWp1u8x0+6I8SjGMMTXQ5RyQosx8l9vEbkOTuU4mS9CvcuP6JOc
	 CRGaf3FQS0qqk4Mt+NJPLzOmb55gq8WgOLCcziN2yee+yiCuXYoQbiyqj6OqIRckOg
	 zlWyJdVVIoI/oD5bfilP9Wfx9zgQi8f9657Pmth20B34lE8+l3FzfUt4jrZPqShfqF
	 f9UC03EE1zCg8O24TYXYLyW6A1qYxDcN+u8xshfiMU3UVP1nvvW588OG8tDO2GWvR1
	 wEdDE/KGw5BQ2PmXhtXKC+IDYTUuFTdJl7v09oEnwC3MGjrH1gbg5Zql10uHceOE2A
	 0sW6DH0IhZBgg==
Date: Tue, 6 Apr 2021 14:46:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, bertrand.marquis@arm.com, 
    wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
In-Reply-To: <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
Message-ID: <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
References: <20210406103603.8530-1-luca.fancellu@arm.com> <20210406103603.8530-4-luca.fancellu@arm.com> <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Apr 2021, Jan Beulich wrote:
> On 06.04.2021 12:36, Luca Fancellu wrote:
> > Modification to include/public/grant_table.h:
> > 
> > 1) Change anonymous structure to be named structure,
> >    because doxygen can't deal with them.
> 
> Especially in the form presented (adding further name space clutter
> for consumers to fall over) I object to this, most notably ...
> 
> > @@ -584,7 +599,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
> >   * page granted to the calling domain by a foreign domain.
> >   */
> >  struct gnttab_cache_flush {
> > -    union {
> > +    union a {
> 
> ... this one.

Hi Jan,

It is unfortunate that none of these tools support anonymous structs or
unions well. (You might recall we also had issues with the older
kernel-doc series too, although a bit different.)

It is difficult to provide a good name here, a suggestion would be more
than welcome. I agree with you that calling it "a" is a bad idea: "a"
becomes a globally-visible union name.

Maybe we could call it: StructName_MemberName, so in this case:

  union gnttab_cache_flush_a

It makes sure it is unique and doesn't risk clashing with anything else.
We can follow this pattern elsewhere as well.

Any better suggestions?

