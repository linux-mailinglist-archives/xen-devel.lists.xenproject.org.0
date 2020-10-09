Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B13287FEF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 03:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4675.12365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQh2T-0002tS-BK; Fri, 09 Oct 2020 01:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4675.12365; Fri, 09 Oct 2020 01:17:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQh2T-0002tA-6t; Fri, 09 Oct 2020 01:17:41 +0000
Received: by outflank-mailman (input) for mailman id 4675;
 Fri, 09 Oct 2020 01:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2c2X=DQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kQh2R-0002t5-Oi
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 01:17:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faa43fe7-3aa0-4f90-84fc-f112f14ebdf8;
 Fri, 09 Oct 2020 01:17:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3132122240;
 Fri,  9 Oct 2020 01:17:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2c2X=DQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kQh2R-0002t5-Oi
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 01:17:39 +0000
X-Inumbo-ID: faa43fe7-3aa0-4f90-84fc-f112f14ebdf8
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id faa43fe7-3aa0-4f90-84fc-f112f14ebdf8;
	Fri, 09 Oct 2020 01:17:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3132122240;
	Fri,  9 Oct 2020 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602206257;
	bh=N8AHEPFp1lyzBoBDbNRLy/YDZM/OJro+Jwd8IPiFPk4=;
	h=Date:From:To:cc:Subject:From;
	b=lbJX7sNftrCsSL2VKENQzyTQKx502+zAaqZ3+Ajua3uT/Nh3Jp70A6fC6IklQmWEP
	 uQjQp/P4n0wqVIfiob+q3QA8Go6Xu5Wua2g2eNR1NAYkv4lp4VkivKN/MCNdLXnoUV
	 gA8w5Db1ZXGIvg3zKCaRvjbla9l5s5V/xQ3btS2I=
Date: Thu, 8 Oct 2020 18:17:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: committers@xenproject.org
cc: sstabellini@kernel.org, George.Dunlap@citrix.com, bertrand.marquis@arm.com, 
    xen-devel@lists.xenproject.org
Subject: plans on generating docs from Xen in-code comments
Message-ID: <alpine.DEB.2.21.2010081044260.23978@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This email is an update in regards to the Xen documentation effort
driven by the FuSa SIG. We plan to go forward with the proposal below;
please let us know if you have any concerns.

We have been discussing how to generate documentation for Xen public
headers from in-code comments. Initially, we thought of using
kernel-doc, like the Linux kernel. kernel-doc uses a format similar to
Doxygen. I sent out a patch series to convert public headers to the
kernel-doc format in August, see [1].

Afterward, we discussed with an Intel engineer from the Zephyr project,
interested in Zephyr's safety certification. They are solving the same
problem using Doxygen. He demoed the use of Doxygen to generate
documentation and safety requirements from in-code comments and other
docs. They could produce excellent documents, suitable for safety
certifications. For example, see [2]. We should be able to reuse their
scripts and settings in Xen Project, which would save us significant
efforts. It makes sense for us to try to follow the same path with
Doxygen.

Configuring Doxygen is complex because it is much more flexible; we'll
need that flexibility. We plan to working on an appropriate Doxygen
configuration (based on Zephyr's) during the next few months. As soon as
we have it, we'll add Doxygen to Xen Project infrastructure to
automatically generate documents for the master branch (something along
the lines of http://xenbits.xenproject.org/docs/sphinx-unstable/).

In the meantime, we still intend to go ahead with the patch series [1]
to convert the public headers to kernel-doc: kernel-doc and Doxygen use
similar formats, so it is a good step in the right direction. It helps
us get closer to the final objective of Doxygen-based documents. After
we have Doxygen in place, we'll further refine the in-code comments as
necessary.

Cheers,

Stefano

[1] https://marc.info/?l=xen-devel&m=159675781406690
[2] https://docs.zephyrproject.org/latest/index.html

