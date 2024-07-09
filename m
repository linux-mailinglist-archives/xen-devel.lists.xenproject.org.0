Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97692AF83
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755702.1164137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3cw-0005AQ-DK; Tue, 09 Jul 2024 05:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755702.1164137; Tue, 09 Jul 2024 05:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3cw-00058Z-9P; Tue, 09 Jul 2024 05:42:58 +0000
Received: by outflank-mailman (input) for mailman id 755702;
 Tue, 09 Jul 2024 05:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sR3cv-00058H-EX; Tue, 09 Jul 2024 05:42:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sR3cs-00033e-VZ; Tue, 09 Jul 2024 05:42:54 +0000
Received: from buscust21-202.static.cytanet.com.cy ([87.228.190.202]
 helo=[10.10.49.222]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sR3cs-0008No-LT; Tue, 09 Jul 2024 05:42:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gY3HaePMaabOigPfAFjjtMH3zQ3Cfhd/KFBFRw1r2MU=; b=acUmgCqipKcHBnC/ZZAeGNLaaE
	1CKeHnCvWf6TSqL3z1v6tc1d9TYEYwDnhMSmIzyUSou+y0WbmpeDbjwLdvRYTrtHqXXRiLji9vaLC
	ekqKCz1Id4qyjYQEQ3JG9tiban7vZJ7n7uaXVfWeqG39QFIs7XTl9v2g0N+hW6QgwTDA=;
Message-ID: <925ec9b8-83b3-473c-aa7c-dd825cdc3b9a@xen.org>
Date: Tue, 9 Jul 2024 08:42:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Vote] Xen Project Code of Conduct Team Member
Content-Language: en-GB
To: Kelly Choi <kelly.choi@cloud.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 win-pv-devel@lists.xenproject.org
Cc: committers@xenproject.org, minios-devel@lists.xenproject.org,
 mirageos-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@cloud.com>
References: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/07/2024 10:00, Kelly Choi wrote:
> Hi all,
> 
> As you are aware, George Dunlap has recently stepped down from the Xen
> Project as a committer, but he was also a part of the Code of Conduct team.
> 
> As a result, Stefano will be the only member remaining on the CoC team. @Roger
> Pau Monne <roger.pau@cloud.com> has volunteered to join the team, so that
> there are at least two members.
> 
> In accordance with https://xenproject.org/developers/governance/, I need
> the leadership teams of the three mature projects: the Hypervisor, the XAPI
> project, and the Windows PV Driver project to vote on this proposal.
> 
> The specific voting rules, in this case, are outlined in the section:
> https://www.xenproject.org/governance.html#project-decisions
> 
> I propose to tally the votes after July 31st, 2024. You can reply via email
> in public or private:
> +1: for proposal
> -1: against proposal

+1

Cheers,

-- 
Julien Grall

