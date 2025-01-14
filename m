Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200BA10D06
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871611.1282592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkO8-0002bM-Mi; Tue, 14 Jan 2025 17:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871611.1282592; Tue, 14 Jan 2025 17:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkO8-0002Zc-K6; Tue, 14 Jan 2025 17:07:36 +0000
Received: by outflank-mailman (input) for mailman id 871611;
 Tue, 14 Jan 2025 17:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbf=UG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1tXkO7-0002ZW-AU
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 17:07:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc271be-d29a-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 18:07:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D43CD4EEC6EE;
 Tue, 14 Jan 2025 18:07:32 +0100 (CET)
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
X-Inumbo-ID: 0bc271be-d29a-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736874453; bh=HlJzU5W9ek/W+SStPI2l2dbgaZAUTJslVv8+FWFX00M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dfx01khs1ewOS05sIsn7m9ibSjAmZh711HY/ZmZcSsqSej02ZTkRQEQvKySQ2bIBw
	 hOFN5lt5rVI0gDDGUvx8ApOY/OzkLY+mBq0puSaet0Oai+yYIttlFiWHIU2XSXENHz
	 VCm71UjCQECnkHp1UHuCNCuPT35i+FLyMg5DcRoV5bXm4GNZ0tVKCtVw7vZOHuFZGm
	 YQJvFQqwGkUiWCAa2eZDpwNMxedI69G0QTaAE4C2DpGNNJyRNy1U2IB9lnK/9fSKns
	 Zbf/SnU7l9zi7lVS59xS1xe+A2yR0VAumuwz29kvx4CrdaXlXDqqeGSAMo62rQx7Xu
	 PvZGITxUMZjqA==
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 18:07:32 +0100
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH] MAINTAINERS: Change reviewer of the ECLAIR
 integration
In-Reply-To: <Z4Z8IMWuz0UqldN9@macbook.local>
References: <8c370ced911457c883360836bd5afda747426a13.1736856521.git.nicola.vetrini@bugseng.com>
 <Z4Z8IMWuz0UqldN9@macbook.local>
Message-ID: <31259db8185522b14a61ac021f76d6fd@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-14 16:00, Roger Pau Monné wrote:
> On Tue, Jan 14, 2025 at 03:48:54PM +0100, Nicola Vetrini wrote:
>> Simone Ballarin is no longer actively involved in reviewing
>> the ECLAIR integration for Xen. I am stepping up as a reviewer.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 

Acked-by: Simone Ballarin <simone.ballarin@bugseng.com>

> Adding Simone to the Cc list, it would be helpful if he can also
> provide an Ack to signal he is OK with begin removed.
> 
> Thanks, Roger.


