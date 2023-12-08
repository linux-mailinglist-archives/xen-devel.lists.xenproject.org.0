Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA50780970F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650266.1015595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOZD-0003Do-Os; Fri, 08 Dec 2023 00:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650266.1015595; Fri, 08 Dec 2023 00:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOZD-0003Bc-MF; Fri, 08 Dec 2023 00:18:07 +0000
Received: by outflank-mailman (input) for mailman id 650266;
 Fri, 08 Dec 2023 00:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOZC-0003BW-5S
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:18:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 410e1e7f-955f-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:18:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BE0B9B82A3A;
 Fri,  8 Dec 2023 00:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15C0C433C7;
 Fri,  8 Dec 2023 00:18:01 +0000 (UTC)
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
X-Inumbo-ID: 410e1e7f-955f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701994683;
	bh=8m8gThuAFHN6+EhkQGQNFfzdMqA2bZ0WaP37wrRXwmc=;
	h=Date:From:To:cc:Subject:From;
	b=l8uW8Gkg9516QydKURE7B9KPez+mx1dXBeN0a9EDbyT4yjjuDd7jRVBRn85TA6wD4
	 8KQjeSrCiZFzmRmxYmPbYYzcEStEdSSJrzRuqW77W2Lsq6Cx50Py2F1Cxzk8TAYkle
	 QmtXKD7F986iyy+xgaE+Xt4/tXHkuE1O0q8Xc33fSJJegWIwd8vm6LSobknMiqlidt
	 xtjYSJJNZFDebFHhe/Kt5CKCXYb8TO2bRKKaQ+P5CtPS0wBrQEMFYuR24dKCo0v0rO
	 xF9wkI7lm5QhQRrFkH5WRX/tc9tZnd9BG62kgnB6WQARJX3MPQAdUVsv7MB6ky+irv
	 E5FaMxiOCyyFg==
Date: Thu, 7 Dec 2023 16:18:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com, 
    julien@xen.org, sstabellini@kernel.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com
Subject: [PATCH] docs/misra/rules.rst: add Rule 16.2
Message-ID: <alpine.DEB.2.22.394.2312071612330.1265976@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 2b570af0e0..7cb9544a96 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -469,6 +469,15 @@ maintainers if you want to suggest a change.
      - In addition to break, also other flow control statements such as
        continue, return, goto are allowed.
 
+   * - `Rule 16.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c>`_
+     - Required
+     - A switch label shall only be used when the most closely-enclosing
+       compound statement is the body of a switch statement
+     - The x86 emulator (xen/arch/x86/x86_emulate*) is exempt from
+       compliance with this rule. Efforts to make the x86 emulator
+       adhere to Rule 16.2 would result in increased complexity and
+       maintenance difficulty, and could potentially introduce bugs. 
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type

