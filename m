Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF151A41
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:06:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTJG-00077H-J3; Mon, 24 Jun 2019 18:03:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfTJE-000774-Fr
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:03:16 +0000
X-Inumbo-ID: 5623b0d6-96aa-11e9-a32b-83aed826b887
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5623b0d6-96aa-11e9-a32b-83aed826b887;
 Mon, 24 Jun 2019 18:03:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F29EB20657;
 Mon, 24 Jun 2019 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561399394;
 bh=V9CCmezonyBDtpd0lBGK03HDmL7k/Q3WsB6raY1M5FQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GLmMTxs6XbZhS8MiD/CiEYijm9IKXWw9e2MuNnE9f7SrhG/HyMsb/JW4DP0Pas0NP
 KmGKjjmrHuZyjq3eqKFjLpS+o5SUvoGAMlS67sUzm6DFQcd9wiJjzQtQm5+1/UzINc
 URsZKQRS0/Fu1Jjho/l0gLplRBdu3Qyu7rhQtwr8=
Date: Mon, 24 Jun 2019 11:03:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
Message-ID: <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-845223557-1561399394=:2468"
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-845223557-1561399394=:2468
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 24 Jun 2019, Lars Kurth wrote:
> Hi all,
> 
> since Andy created https://xenbits.xen.org/docs/sphinx-unstable/ and https://xenbits.xen.org/docs/sphinx-unstable-staging/ (sources in docs/hypervisor-guide, docs/guest-guide, docs/admin-guide) I was wondering whether it would not make sense to migrate some key documents in the wiki (and possible some docs elsewhere in the tree) into the new structure and refresh and update the documentation in the process. I am volunteering to do some of the leg-work.
> 
> I started looking into what some other projects do and the following seem to be sensible and lightweight examples of Information Architecture to structure the content:
> * https://docs.openstack.org/infra/manual/developers.html
> * https://github.com/kubernetes/community/blob/master/contributors/devel/README.md
> 
> Both are fairly lightweight and seem to be sensible guides. But before we get to that level of detail, I thought it makes sense to look at what we have and candidates for moving/improving/creation. However, it is clear that we need two broad categories under docs/hypervisor-guide (Hypervisor developer documentation): note that I don’t much care about the actual labels
> * The process of developing and contributing code
> * Setting up your dev environment, coding, and debugging
> 
> Documentation which may be worth moving or creating
> 
> Text files in tree (which are close to RST file format)
> * Xen.git:CONTRIBUTING – it seems to me that this is a candidate for moving (with a note in the original file which outlines where to look for the source/rendered output) – Even committers occasionally don’t seem to be aware of some of the licensing related common practices we have. Giving some of that content a more prominent place in a new more user friendly and modern looking docset seems sensible  
> * Xen.git:INSTALL may be a good candidate which could live in the admin guide and/or developer guide
> * Xen.git:CODING_STYLE and Xen.git:tools/libxl/CODING_STYLE - Note that in the community call discussion Jan raised the point that we tend to not document precedents for many things which are coding style related. Maybe we can get a bit better 
> * Xen.git:MAINTAINERS should stay as it is, but should probably be referred to appropriately in the docset
> 
> Content from the wiki (the idea would be to redirect those pages in the wiki to the new locations)
> * https://wiki.xenproject.org/wiki/Asking_Developer_Questions - could do with a refresh. Possibly there is also a tie in with https://lists.xenproject.org/archives/html/xen-devel/2019-06/msg01518.html
> * https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source - there seems to be some overlap with Xen.git/INSTALL which may be worth cleaning up
> * https://wiki.xenproject.org/wiki/Xen_Project_Repositories 
> * https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches - This has become a bit unwieldy and could do with some clean-up
>    * Slight overlap with Xen.git:CONTRIBUTING (around DCO and Sign-off) 
>    * Making good patches probably needs some work and maybe should be broken out. It should include good examples and setting expectations of what is deemed good and bad around areas where we have higher standards than other projects (such as commit messages, explaining rationale for a change, technical debt, ...). It should probably also cover things such as Design Documentation and where to find templates, highlight existing documentation and where to find it/update it, the same with text, SUPPORT.md (aka add a new feature), etc.
>    * Setting up git send-email: should probably go into a section related to the development environment set-up and just be referred to
>    * Using git send-email alone - we should nuke this section and focus on the next section 
>    * Simplest workflow: Git format-patch, add_maintainers.pl/get_maintainer.pl and git send-email - I would build the bulk of the doc around this, but maybe move the add_maintainers.pl/get_maintainer.pl  file into a separate document under a Xen specific development tools section and just refer to it
>     * Sending patches manually - we should nuke this section and focus on the next section
>     * I would move the bulk of this into a Contribution Workflow section, which gives an overall workflow and just highlight the reroll count. We should define the tags and conventions such as RFC somewhere in an introductory section of this document
>    * All the QEMU, Linux, ... stuff can either stay on the Wiki or could be broken out
> * https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project - strip all the XAPI stuff. NBot sure whether https://wiki.xenproject.org/wiki/XenParavirtOpsHelp is still applicable: nuke if not
> 
> Key content that is missing
> * An overview for testing, which should include
>    - OSSTEST
>    - XTF
>    - The GitLab CI
> * Outcome from the Minimum Standards and Best Practices discussion at https://lists.xenproject.org/archives/html/xen-devel/2019-06/msg01518.html depending on outcome. I was thinking about a Community Standards section, which would point to a Code of Conduct/Minimum and Best Practices (maybe written by role: aka contributor, reviewer and maybe committer)
> * Release Process Related documentation (from a contributor's perspective)
> * Maybe a description of the source tree
> * Some of the information in SUPPORT.md in a feature lifecycle document
> * Maybe some of the things people need to know about KCONFIG
> 
> Let me know what you think. I will start with some of the easier bits next week if I can find some time, unless there are major objections.

I think we all agree by now that maintaining up-to-date docs on the wiki
and keeping them in sync with code changes is hard. I see moving things
from the wiki to xen.git as a great improvement. We have a few Xen on
ARM docs that are worth importing from the wiki:

https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

And all the board specific docs linked from it, such as:

https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qemu-system-aarch64
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/FastModels
https://wiki.xenproject.org/wiki/HiKey960

etc.
--8323329-845223557-1561399394=:2468
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-845223557-1561399394=:2468--

