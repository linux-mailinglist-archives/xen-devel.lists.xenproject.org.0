Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C92817F3D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656428.1024556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOr7-00014C-Af; Tue, 19 Dec 2023 01:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656428.1024556; Tue, 19 Dec 2023 01:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOr7-000110-7V; Tue, 19 Dec 2023 01:25:09 +0000
Received: by outflank-mailman (input) for mailman id 656428;
 Tue, 19 Dec 2023 01:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFOr5-00010l-S5
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:25:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e88053-9e0d-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 02:25:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A3D1BB81205;
 Tue, 19 Dec 2023 01:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B040BC433C8;
 Tue, 19 Dec 2023 01:25:03 +0000 (UTC)
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
X-Inumbo-ID: 70e88053-9e0d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949105;
	bh=YAmB8bi0iGaHHzeRiLxhKZkDXUQHzDKjLaPb47kX1uE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=orYZr8g7cJ7K7lr0+JA2506+RquybbOwiFLkZEn+3bUVXlGMpwy6aMh7exv8t2sN9
	 hHXOV658IdqmowO6dewDII9VevIurpyllnEz5Em4WaOoMbe295y/5C51HCrZZ3mgNk
	 Jgu3YpcFpNTEKmxMe4x2lHk0GlISZmS11Tz3lTwcr1PvolgJ24wvPY5HNSshvZ8+sP
	 bI8ezoIafkuvcQXoQNS0SFB38glz2hgeQM7gshLuJNXHx8YvMqEvWHC5rS4RpSxKhD
	 b1elGgZmzPfxPq9Tfg1KmCH50ftL0PqmSxrbuFZAUh3cJuJz9UukzO4jIfyEt4jC7+
	 XDGWY4OPg0NOQ==
Date: Mon, 18 Dec 2023 17:25:01 -0800 (PST)
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
Subject: Re: [XEN PATCH v2] automation/eclair: update configuration of MISRA
 C:2012 Rule 5.6
In-Reply-To: <1d0448b5ef2d3c84f5df77b78c832836826bc9fe.1702890135.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181724530.3175268@ubuntu-linux-20-04-desktop>
References: <1d0448b5ef2d3c84f5df77b78c832836826bc9fe.1702890135.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Federico Serafini wrote:
> Deviate typedef names that are delberately defined multiple times.
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Tag Rule 5.6 as clean.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

