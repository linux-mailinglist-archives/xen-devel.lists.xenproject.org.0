Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CBA9F5553
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 19:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859793.1271891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbsH-0004Ti-7i; Tue, 17 Dec 2024 18:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859793.1271891; Tue, 17 Dec 2024 18:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbsH-0004R5-4r; Tue, 17 Dec 2024 18:00:49 +0000
Received: by outflank-mailman (input) for mailman id 859793;
 Tue, 17 Dec 2024 18:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAop=TK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tNbsF-0004Qz-Mw
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 18:00:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d720ddc7-bca0-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 19:00:46 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 81C6C4EE0738;
 Tue, 17 Dec 2024 19:00:45 +0100 (CET)
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
X-Inumbo-ID: d720ddc7-bca0-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734458445; bh=71/gskfpgBPoy4Z86mD69zBglqccMoIEYMzNEEsRjFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jSAxHdugSPdRW/gXo+pZZXZa8HbWaVFL9SpZ4duNFRMgYHgJ+bCyTVmZQRajfgndb
	 AGsXlTr7+t72gs492wXvtb62cGPLZanKcg7GmJfpZNkxrX5pYKGAe0GDMnuYy3nM0t
	 gPzpO/08nCH2ZEjz7PgVR/tnGKKS/9RktUpN0irj12LbIoSBjgCvUZnScFYib3O+oX
	 gD/zjbhXA2RmXpOmnOrKp8ZyR0yqw3OGHHlcVPCOGfY9sr0cL74EdCUUv3fy/m2Q37
	 H7++ajVu6e70rlzxWa2xFjtqY0nMYNB7OxfiBykFLfY9qf3m4Ka9rwna94VoiZ+zQG
	 Zbteq0yPg2gyw==
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:00:45 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
In-Reply-To: <8d59f2a1-8fc2-44d0-8c87-fbdf5bcc4d77@citrix.com>
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
 <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
 <d18e6d0e-c3f5-4fec-849c-94a7edb8ae36@suse.com>
 <8d59f2a1-8fc2-44d0-8c87-fbdf5bcc4d77@citrix.com>
Message-ID: <8fcdb72f62008250faa392857a57202e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-17 17:46, Andrew Cooper wrote:
> On 17/12/2024 4:45 pm, Jan Beulich wrote:
>> On 17.12.2024 17:40, Andrew Cooper wrote:
>>> On 17/12/2024 4:24 pm, Nicola Vetrini wrote:
>>>> This extension name is missing from the current list of extension 
>>>> used
>>>> by Xen, therefore is must be added to that configuration in order to
>>>> avoid violations for MISRA C Rule 1.1.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Given CI is broken, I've put this in for testing:
>>> 
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1592826906
>> If this was fixing an earlier commit, shouldn't it come with a Fixes: 
>> tag
>> anyway?
> 
> Yeah, it probably should have a Fixes, even if it is technically a
> combined one with also changing the runner.
> 

I agree. I did forget putting a fixes tag, that was a bit rushed. We can 
unmark R1.1 and R2.1 temporarily and then respin this to properly 
address both rules.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

