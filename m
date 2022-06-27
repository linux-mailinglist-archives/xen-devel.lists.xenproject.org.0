Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C738055B98D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 14:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356569.584789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nzZ-0006xb-NN; Mon, 27 Jun 2022 12:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356569.584789; Mon, 27 Jun 2022 12:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nzZ-0006uc-JW; Mon, 27 Jun 2022 12:37:25 +0000
Received: by outflank-mailman (input) for mailman id 356569;
 Mon, 27 Jun 2022 12:37:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5nzX-0006uP-Rg
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 12:37:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzX-0002we-No; Mon, 27 Jun 2022 12:37:23 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzX-0007Ql-F0; Mon, 27 Jun 2022 12:37:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=9QjI8fP+CzasV/5aMjimyJtteFHRu8dJ9BCH5fbuL/k=; b=ZUmqEN
	VmtuNFlm/lmokNSv8MHN1oUbyhopMdjahJ91fI1tD6vp1WNfw+Z1KJNiawrrVZQRhQTF1qo3wNpdR
	IucQ2NeROw4DP2zJBuHFRQXDyqsEPGMCLQgJqplabERpfwcFrLzHLFBHfwaxBykx/Q2BlaSmNeper
	CqWgbQiI+lI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] public/io: xs_wire: Allow Xenstore to report EPERM
Date: Mon, 27 Jun 2022 13:36:33 +0100
Message-Id: <20220627123635.3416-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small patch series allows xenstore to report EPERM (see patch #2).
Patch #1 was introduced to avoid someone else making the mistake to
introduce a new error before EINVAL.

Cheers,

Julien Grall (2):
  public/io: xs_wire: Document that EINVAL should always be first in
    xsd_errors
  public/io: xs_wire: Allow Xenstore to report EPERM

 xen/include/public/io/xs_wire.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.32.0


