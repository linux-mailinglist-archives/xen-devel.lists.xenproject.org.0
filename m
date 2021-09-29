Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC641C1FF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198976.352753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWEi-0006G7-HY; Wed, 29 Sep 2021 09:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198976.352753; Wed, 29 Sep 2021 09:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWEi-0006Cv-DR; Wed, 29 Sep 2021 09:50:48 +0000
Received: by outflank-mailman (input) for mailman id 198976;
 Wed, 29 Sep 2021 09:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVWEh-0006Cp-Bg
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:50:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVWEh-0005HU-9H
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:50:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVWEh-0004uA-8F
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:50:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVWEf-0006dJ-Iu; Wed, 29 Sep 2021 10:50:45 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=RNtcMmJ/l9k3QCli44qClrpgE0n4GrwL9Rc22SiJOdA=; b=196KT+AtWobipRJbhP+lWjFosT
	yFjvY4DwOx45TLskD13QFPNSMd5GOTX729UQoQopkogVL1YB8DwUfn6neYHY/cbYo7vjd84H5nlNA
	Lc1Nutv/r7vsH9cOmfk3kvFmmR4mvBl2RjdXJvAb0onv+0cT+egKDWQVCDJGqb4tqsdw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24916.14069.358118.417330@mariner.uk.xensource.com>
Date: Wed, 29 Sep 2021 10:50:45 +0100
To: xen-devel@lists.xenproject.org
CC: committers@xenproject.org
Subject: osstest down, PDU failure
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Currently, osstest is not working.  We have lost one of our PDUs,
meaning that about half a rack is out of action, including one of the
VM hosts.

There has been quite a bit of outstanding maintenance which has been
deferred due to the pandemic.  I am trying to see if we can get
someone on-site to the colo, in Massachusetts, soon.  A complication
is that the replacement PDU is in still New York.  Again, due to the
pandemic.

Ian.

