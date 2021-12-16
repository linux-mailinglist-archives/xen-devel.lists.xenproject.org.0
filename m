Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94F4773F5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247994.427700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrRf-0002fh-Pd; Thu, 16 Dec 2021 14:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247994.427700; Thu, 16 Dec 2021 14:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrRf-0002dQ-MW; Thu, 16 Dec 2021 14:09:19 +0000
Received: by outflank-mailman (input) for mailman id 247994;
 Thu, 16 Dec 2021 14:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxrRf-0002dD-1a
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:09:19 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0dae5a6-5e79-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 15:09:17 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47054)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxrRT-000vL1-oN (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 14:09:07 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2F2CE1FA9B;
 Thu, 16 Dec 2021 14:09:07 +0000 (GMT)
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
X-Inumbo-ID: c0dae5a6-5e79-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <272e223d-e2b0-5bf9-9f7f-f0b8d772eeec@srcf.net>
Date: Thu, 16 Dec 2021 14:09:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 16/57] tools/ocaml: Remove generation of _paths.h
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-17-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-17-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:01, Anthony PERARD wrote:
> _paths.h isn't useful anymore in systemd_stubs.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I poked Christian, who's looked at this and given it an ack.  For some
reason, he doesn't appear to have this email in his inbox.

~Andrew

