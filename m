Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D597EB950
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633358.988082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31rr-0005rr-HF; Tue, 14 Nov 2023 22:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633358.988082; Tue, 14 Nov 2023 22:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31rr-0005pR-Dr; Tue, 14 Nov 2023 22:26:47 +0000
Received: by outflank-mailman (input) for mailman id 633358;
 Tue, 14 Nov 2023 22:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31rp-0005i1-PF
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:26:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4a6d31c-833c-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 23:26:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DDC50B8164E;
 Tue, 14 Nov 2023 22:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF79C433C7;
 Tue, 14 Nov 2023 22:26:42 +0000 (UTC)
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
X-Inumbo-ID: e4a6d31c-833c-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700000804;
	bh=J5kJvILIRL9L1Qz83M/WsLN/jdo9Cck5RHjqYTJVihA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P9mUV9EM6ahmDcwDnbgGT0cPhCAvWS3gXwpR36eomlgI1UAw7Y9dfnGoIsOrcJNow
	 tbCcFD1ZbGYQ25yFZ4+nGM/udEpRDA2Kszlc6B55xUxMV2zV6vKdjVYzW3SX5QT52h
	 2MvOrTrFiutTgrq6yzrS4ut/i8/kQ/eHbX1lXEEo0o+G2k6Y2OT+vtym2ieJs0gsM8
	 +hwhxIVGwZTXshY9ZF07uP2edjvLjSJZ4J/E3JNn5BjoGJSDiJTqn3jr8mhfiwTU69
	 SoGmqlU8pCP7Vv+VT2Izcy8Izfz1Qx48TFVWKIQNRQOJJLXxmWbw2vrlAKYBa+S2AI
	 pAD/XZttS5f+w==
Date: Tue, 14 Nov 2023 14:26:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair: add a deviation for MISRA
 C:2012 Rule 8.6
In-Reply-To: <b9eee04bb7c6436f4951a8737eee60c68cda9df7.1699893554.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311141426300.160649@ubuntu-linux-20-04-desktop>
References: <b9eee04bb7c6436f4951a8737eee60c68cda9df7.1699893554.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the search
> procedure adopted by Unix linkers.
> Update deviations.rst accordingly and tag Rule 8.6 as "clean".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


