Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CD9BA08
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2019 03:19:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1Kfg-00078Y-6C; Sat, 24 Aug 2019 01:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i1Kff-00077o-Dw
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2019 01:16:47 +0000
X-Inumbo-ID: d71e87ba-c60c-11e9-adf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d71e87ba-c60c-11e9-adf0-12813bfff9fa;
 Sat, 24 Aug 2019 01:16:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3C702173B;
 Sat, 24 Aug 2019 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566609406;
 bh=QqbVyJGT/HsCdHx1X7GgYibjcMKobOQbdUPXXxRA8WE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=18Pj7F1totDR80BMxKywR6JMye35rEvtj1pFnabpbdT5/ckT7W4VLFrF0N8TgxEkm
 gdcB2siui4eSFrU+1C2lyIKXe9LJ9U7yA0Or8B5Z6+P4RitMS4e1auHTXvj20NGkHN
 9e5bIMkHucRiTC2jvfHaErSCAIhFhGuTbnpmSIw8=
Date: Fri, 23 Aug 2019 18:16:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <214936D5-863B-425D-9810-B423C93543EE@citrix.com>
Message-ID: <alpine.DEB.2.21.1908231615190.26226@sstabellini-ThinkPad-T480s>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
 <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
 <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
 <E8C5FE89-7C12-4073-9537-9D6773D7646B@xenproject.org>
 <214936D5-863B-425D-9810-B423C93543EE@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-521159572-1566602603=:26226"
Content-ID: <alpine.DEB.2.21.1908231714420.26226@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 'Jan Beulich' <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-521159572-1566602603=:26226
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1908231714421.26226@sstabellini-ThinkPad-T480s>

On Fri, 23 Aug 2019, Lars Kurth wrote:
> 16/08/2019, 06:43, "Lars Kurth" <lars.kurth.xen@gmail.com> wrote:
>     > On 16 Aug 2019, at 14:28, Julien Grall <julien.grall@arm.com> wrote:
>     > 
>     > 
>     > 
>     > On 16/08/2019 13:17, Lars Kurth wrote:
>     >> On 16/08/2019, 11:01, "Julien Grall" <julien.grall@arm.com> wrote:
>     >>      From my understanding, any use on mini-os.git & co will be legitimate. However,
>     >>     we still print the WARNING in those cases.
>     >>          Usually WARNING means something needs attention. As most of the users will
>     >>     likely copy/paste from the wiki, we are going to have report asking why the
>     >>     WARNING is there.
>     >>          I think it would make sense to try to downgrade the message a bit when possible.
>     >>     For instance, we could check if the section "THE REST" is present in the file
>     >>     MAINTAINERS. If not, this is likely not a file we are able to support.
>     >>     I thought about this and it is not as easy as it seems, because the script only parses
>     >> M: ... &c lines
>     > 
>     > The script is able to parse the section name. See get_maintainer_role().
>     > 
>     > Although, I am not sure how early the function can get called.
>     > 
>     > But...
>     
>     That may make it feasible to go down that route.
>     Incidentially both Linux as well as QEMU MAINTAINERs files use the same syntax
>     as us (with a few extra tags which we don't have)
>     
>     Not sure whether this would be a problem
>     
>     >> Maybe the best way to address this would be to include some identifier into the
>     >> MAINTAINERS file (after the header with all the definitions).
>     >> FORMAT: xen-project-maintainers <version>
>     >> (note that this is not currently picked up by the tool)
>     >> Or
>     >> V: xen-project-maintainers <version>
>     >> (note that this would be picked up by the tool)
>     > 
>     > Any of these solutions are also a potential alternative.
>     
>     I will see what others think and take it from there
>     
> Hi all. I would like to get this resolved and was looking for 
> opinions. The thread is about enabling usage of get_maintainer.pl / 
> add_maintainers.pl on sister repositories for xen.git, such as 
> xtf.git, osstest.git, mini-os.git, ... to have a consistent tools story 
> and make patch submission for newcomers easier. We have 
> several options:
> 
> 1) Warn if the tools are applied outside the Xen tree
> Julian felt this is likely confusing
> 
> 2) Do not warn under some conditions
> 2.1) Use THE REST as identifier to avoid the warning
> Cons: Warning would disappear because Linux and QEMU also have THE REST 
> This may not be an issue as both MAINTAINERS files follow the same format
> However, there may be subtle differences in behaviour for unusual options 
> for the get_maintainer.pl script as we have not been tracking all changes
> 
> 2.2) Introduce a unique identifier in MAINTAINERS
> This would imply introducing a unique identifier for xen related
> MAINTAINER files
> Pros: More accurate
> Cons: Pollutes file format
> 
> I don’t have a strong opinion and will follow majority consensus.
> Maybe people can vote on the options and I will just implement
> what most people prefer
 
Any of these options are OK, really. Aside from the other subprojects, I
think one interesting case to consider is when a user calls
get_maintainer.pl on tools/qemu-xen-dir, which should return a warning
or error because that's QEMU, not Xen.

So, I think it would be best to go with 2.2) introducing a new tag to
distinguish the Xen MAINTAINERS file from the QEMU MAINTAINERS file, so
that we can properly return a warning for tools/qemu-xen-dir, but at the
same time it could work fine for mini-os.git.
--8323329-521159572-1566602603=:26226
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-521159572-1566602603=:26226--

