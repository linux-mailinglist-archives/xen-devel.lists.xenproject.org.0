Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690F25D8EC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 14:48:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEB95-0008DH-Hv; Fri, 04 Sep 2020 12:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kEB93-0008D3-TD
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 12:48:45 +0000
X-Inumbo-ID: 3e9225cb-5004-4bb6-b6c1-8975fcdf00fd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e9225cb-5004-4bb6-b6c1-8975fcdf00fd;
 Fri, 04 Sep 2020 12:48:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B6FAACB5;
 Fri,  4 Sep 2020 12:48:45 +0000 (UTC)
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
To: Trammell Hudson <hudson@trmm.net>, George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <h35nKZ8ByB_Mb-jk6WEUO-VlCLDgU0fjVUzhZ1eCNVWwbL5aNnoRQ7lVDxM31Nd3PvuRzSMbcNmyUkflzUiDiHUTdQTGReB8zPoCCi_pff4=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2cf5b5a-ebc8-442d-73b7-c46384c41a01@suse.com>
Date: Fri, 4 Sep 2020 14:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <h35nKZ8ByB_Mb-jk6WEUO-VlCLDgU0fjVUzhZ1eCNVWwbL5aNnoRQ7lVDxM31Nd3PvuRzSMbcNmyUkflzUiDiHUTdQTGReB8zPoCCi_pff4=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.09.2020 13:19, Trammell Hudson wrote:
> On Friday, September 4, 2020 5:54 AM, George Dunlap <George.Dunlap@citrix.com> wrote:
> 
>> And I’d encourage others to try submitting simple one-or-two-patch series as PRs to Gitlab instead, as we continue the experiment.
> 
> I've reworked my unified EFI image patch to merge with the
> recent Makefile changes and submitted it through the website:
> 
> https://gitlab.com/xen-project/xen/-/merge_requests/4

I think for now it should only be really simple, mostly mechanical
changes that go this new route. I'm not happy at all with how many
clicks it took me just to walk through all of Andrew's comments,
and those were purely on style.

If I wanted to be harsh, I'd already now say "experiment failed".

Jan

