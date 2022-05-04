Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F17519C92
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320533.541317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBvX-0003q0-S1; Wed, 04 May 2022 10:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320533.541317; Wed, 04 May 2022 10:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBvX-0003me-Oe; Wed, 04 May 2022 10:08:11 +0000
Received: by outflank-mailman (input) for mailman id 320533;
 Wed, 04 May 2022 10:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y7OC=VM=kojedz.in=richard@srs-se1.protection.inumbo.net>)
 id 1nmBvV-0003mY-0s
 for xen-devel@lists.xen.org; Wed, 04 May 2022 10:08:09 +0000
Received: from pi.kojedz.in (pi.kojedz.in [2a01:be00:10:201:0:80:0:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17be9a5f-cb92-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 12:08:07 +0200 (CEST)
Received: from webmail.srv.kojedz.in (BC9CDDBA.catv.pool.telekom.hu
 [188.156.221.186])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id 5733B201E1
 for <xen-devel@lists.xen.org>; Wed,  4 May 2022 12:08:05 +0200 (CEST)
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
X-Inumbo-ID: 17be9a5f-cb92-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
	t=1651658885; bh=RC0yVnL1JQ++H3nQdzUfeAM3LIsYT6SMc7rwkMlA71M=;
	h=Date:From:To:Subject;
	b=tZoFiN9FsIB41R2WRuEBFwTsaMLlCaxUZI4aT/evLnKKamTdVYNBN7whq9+TVl5IG
	 ll9/KWsb24NXtF8dUlAidjuj5teajqlRYrA9i5mj3A6Lc6ow5vWN2fsxI/WojduVvv
	 kMgGeulWl/4rb61R3qHWIuudRNnbb5btSQjz6w4M6JcfMgbIOwALqX5A+wHOPDaYS7
	 rOfxrce80z3QZ9RhKhpyajFC6dLEktFfpVQh4u/+kg0r0k5h5NXbT5sbyQ8PA1TG45
	 uEdPdzCpVhyGzhfwCMaZpj3oAWZB+oxjShWbDGjKTfXVKFzfpaKn+RYX41J3jhp7IU
	 /M4j9Z7gjPZLi6i2RSzWVw8n38aSXOPXCfHdeps38mS/Cl42ht0IBnWMhSbqCmWj8y
	 kHa9Re59oKngfCvLud/Nm5x10a1I5yhoFcL3nMccyVFvxWUgJH1YMLW2vb7Srdtm3e
	 eYddFmOb6k0+g5xne29C1boxNKzFqvo3GrVQdU7aJkGgvHOqcB7pDOzXcJ3lhGUcpT
	 8shlpRZ/mBCcoZza5N5gcmGR79ol6cEVsUzkDYQQlOmaB5ILcN8YHj/TpZI2PZG4sv
	 4FlLU9PZSwW+GzQtq0UVbO1tbcCffn0nz73HogY8NbPekjzJFbsBVlbSCEAdG5BhCl
	 MxSd1jp3IJNve7vbRnGdQyRo=
MIME-Version: 1.0
Date: Wed, 04 May 2022 12:08:04 +0200
From: Richard Kojedzinszky <richard@kojedz.in>
To: xen-devel@lists.xen.org
Subject: [BUG] libxenstat does parse networks with openvswitch only bridges
Message-ID: <926c2f80d7c9513aa0b44600d727f41b@kojedz.in>
X-Sender: richard@kojedz.in
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Dear xen developers,

When xen is deployed in a way that no linux bridges exists on the host, 
then 
https://github.com/xen-project/xen/blob/stable-4.14/tools/xenstat/libxenstat/src/xenstat_linux.c#L313 
will get devBridge as empty string, and then conditions on 
https://github.com/xen-project/xen/blob/stable-4.14/tools/xenstat/libxenstat/src/xenstat_linux.c#L326 
will evaluate to true, effectively discarding any parsed results. As a 
workaround, just creating a fake unused bridge will resolve the issue, 
howewer libxsenstat itself should take care of such cases.

The same is true for later branches as well.

Regards,
Richard Kojedzinszky

