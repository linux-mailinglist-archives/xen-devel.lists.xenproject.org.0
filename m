Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A77013B6
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 03:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534089.831312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdsd-0000oZ-Rm; Sat, 13 May 2023 01:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534089.831312; Sat, 13 May 2023 01:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdsd-0000mo-Ot; Sat, 13 May 2023 01:17:03 +0000
Received: by outflank-mailman (input) for mailman id 534089;
 Sat, 13 May 2023 01:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxdsc-0000mh-4Q
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 01:17:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc193b1f-f12b-11ed-b229-6b7b168915f2;
 Sat, 13 May 2023 03:17:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FAE363255;
 Sat, 13 May 2023 01:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D980AC433EF;
 Sat, 13 May 2023 01:16:57 +0000 (UTC)
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
X-Inumbo-ID: dc193b1f-f12b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683940618;
	bh=30eKHqbzQynPu04VrMohs0VGvFQ+qPtTp6DAV8KaRgM=;
	h=Date:From:To:cc:Subject:From;
	b=beS5q9cNoQ3Sat/imqwBY0KHZY09BqY9sdd0uCEgKMryW5G7u1ymRKC8VGwW0Ppeh
	 UFOfbs+T6x5SAm4HesS8LH8Au/rUvD+W3lWcw9EvWiaJI/IT+azMcXuThPRRFgU0Eu
	 5uqTNY8nvHN2K3ANnR9+uQF5nT5KVTX87I9a+LrjuZ7oC1sbSNm+rqbCWeDBHjQ6HF
	 oRD4uIQBpggga+3DpNCMErJVSAaws5VmhziuySvnNnSTTXTbCVh+wvNGO/Fjegr0h4
	 n0Eo8clMqT+vrJbtJSPeSmbeaKQkb8kFDUvwf5GJDLjjFlh6qfYe0Lm6q7hHGyjIy5
	 42iN/okXoowyg==
Date: Fri, 12 May 2023 18:16:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: roger.pau@citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Xenia.Ragiadakou@amd.com
Subject: [PATCH 0/2] PVH Dom0 on QEMU
Message-ID: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

These 2 patches are necessary to boot Xen and Dom0 PVH on QEMU (with or
without KVM acceleration.)

The first one is a genuine fix. The second one is a workaround: I don't
know the underlying root cause of the problem.

Cheers,

Stefano

