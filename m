Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF3D34A690
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101713.194677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPktc-0000kt-Ua; Fri, 26 Mar 2021 11:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101713.194677; Fri, 26 Mar 2021 11:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPktc-0000kX-R2; Fri, 26 Mar 2021 11:44:56 +0000
Received: by outflank-mailman (input) for mailman id 101713;
 Fri, 26 Mar 2021 11:44:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0000kM-GK
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0005jZ-Dp
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0007ur-C7
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPktX-0002IM-Nk; Fri, 26 Mar 2021 11:44:51 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=+UewVNXB5X7/GBZ2eWJSW9f/mfh+r1p/FoASrAd6zhA=; b=pRl2Fou9am8kJelT+JgHDczBgw
	wy9hVLMYoytrJR7EpfgBRTVzbjb4SfnDVJZzCfCeOFA99546ULCpqsqrpcvQE1at1zG2h0w4JHowM
	P8+irytrJfhGsfxY/DUBz8sU2Hv2/v31FZ6IIR498QLh5VQA+8dz7RVre2KfgEb04jy0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.51507.523770.695347@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:44:51 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] Branching: Update version files etc. for newly
 unstable
In-Reply-To: <0c938aa8-a954-55f5-7d21-37f2c10ea136@suse.com>
References: <20210324162831.7587-1-iwj@xenproject.org>
	<0c938aa8-a954-55f5-7d21-37f2c10ea136@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/2] Branching: Update version files etc. for newly unstable"):
> I suppose you didn't mean to leave "-rc" in there?

You are right.  I will fix it in a moment.

Ian.

