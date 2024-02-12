Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1A85203C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 22:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679714.1057338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZe6H-0005cO-GT; Mon, 12 Feb 2024 21:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679714.1057338; Mon, 12 Feb 2024 21:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZe6H-0005ZC-Cs; Mon, 12 Feb 2024 21:44:29 +0000
Received: by outflank-mailman (input) for mailman id 679714;
 Mon, 12 Feb 2024 21:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rW7E=JV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rZe6F-0005Z6-Gv
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 21:44:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30eb873-c9ef-11ee-8a4d-1f161083a0e0;
 Mon, 12 Feb 2024 22:44:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5753BCE17B3;
 Mon, 12 Feb 2024 21:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBECC433F1;
 Mon, 12 Feb 2024 21:44:18 +0000 (UTC)
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
X-Inumbo-ID: e30eb873-c9ef-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707774259;
	bh=k+2oYHJQOv9VW4SSvSHPH8ermcNU7OsDSJypaa4rsnE=;
	h=Date:From:To:cc:Subject:From;
	b=mrgOvrG3SJQaCz8Xag+wzHTp/D8XzIGNT7PH4/JiG8v1iXfH95gCIilljmXhDJX2/
	 zviYYHc8TbjNA6RRB1+uJdiDsIJm6y8gRXtufrlrBNFidCpV/oyjPKTQVQg74BMqVV
	 foAz2KssgZXhilxojaNxLNTsZXN8FLn58+4DXeFrxVBlZSi/w5sxPrAy2C+SwEUBye
	 oFkUixhRvZYMyrpw1lqrcngtKSfP1jzci+GklfviTJ8CG0mvtrwC5zFu5esY6YpKb5
	 z8FuYJuPQSlq9Ag0TJa9t4x2LvzNpwV9hSXCPrSku4C4K4oEYx+O9lTGkI1+4KE/10
	 X3TtfXavR7dSw==
Date: Mon, 12 Feb 2024 13:44:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, julien@xen.org, 
    bertrand.marquis@arm.com, roger.pau@citrix.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, s@baer.zone, 
    sebastian.baer@ursus-minor.de, christoph.pirkl@gmail.com, 
    roberto.bagnara@bugseng.com
Subject: OpenFastTrace presentation for the Xen Community 
Message-ID: <alpine.DEB.2.22.394.2402121331540.1925432@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

As we continue our journey toward Xen Safety Certifiability, one of the
next challenges is safety requirements and their traceability. We need
to be able to link high level requirements documents to mid and low
level requirements documents, to test specifications and to gitlab
tests.

Sebastian and Christoph from OpenFastTrace have kindly volunteered to
give a presentation about their tool for the Xen Community.

https://github.com/itsallcode/openfasttrace

Please join the Xen FuSa meeting on Feb 19 at 9AM California time / 5PM
UK to watch the presentation live and for the opportunity to ask
questions to the speakers: https://xilinx.zoom.us/j/92166771973?from=addon

Cheers,

Stefano

