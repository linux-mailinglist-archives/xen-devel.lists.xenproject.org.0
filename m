Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F279145A9C7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 18:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229841.397408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZME-0002wQ-1p; Tue, 23 Nov 2021 17:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229841.397408; Tue, 23 Nov 2021 17:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZMD-0002ud-Ub; Tue, 23 Nov 2021 17:13:25 +0000
Received: by outflank-mailman (input) for mailman id 229841;
 Tue, 23 Nov 2021 17:13:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpZMC-0002uX-LS
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:13:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpZMC-0008TY-Ke
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:13:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpZMC-0005g3-Jt
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:13:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mpZM9-0007AS-3O; Tue, 23 Nov 2021 17:13:21 +0000
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
	bh=4aLvdCzTmQzSE4LTI0WyPKNiDgAGbwzuPVA78RxzTn4=; b=ytVSlCuUyzpZ3J4W5IBXHriIB4
	eqj3a3Hh+QoXssgIb+KeS8v4mwSfAX1iBuz9+ewJYssmMPyJGUbKiIxLBg1ObGiGXqNWMRwHr3dxv
	yAbrJVWy823xMlbHqwQ10s5h+PCr+U1lrdb47x59BfR/qHhFMvzzMFvOXpbcCxzO68dc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24989.8493.377201.854234@mariner.uk.xensource.com>
Date: Tue, 23 Nov 2021 17:13:17 +0000
To: committers@xenproject.org,
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.16 branched, commit moratorium lifted, freeze still in force

Xen 4.16 has now branched.  The staging-4.16 branch et al exists.

The commit moratorium is lifted.  However:

* 4.16 is in deep freeze now.  Nothing should be committed without
  a release ack.  Roger, you have a blanket release ack for your
  CHANGELOG update(s).

* Until 4.16 is released, please avoid significant restructuring or
  other changes which would hinder fixes being back- or forward-
  ported between 4.16 and unstable.

I am hoping to release early of the week of 29th November.
This means *all* non-release-administrative tree changes need to be
committed by the end of this coming Friday, the 26th of November.

If a significant bug is discovered between now and then, we will have
to slip the release.

Ian.

