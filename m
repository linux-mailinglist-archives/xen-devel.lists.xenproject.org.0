Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FF4216A0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 20:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201678.356297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXSp8-0007xx-PA; Mon, 04 Oct 2021 18:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201678.356297; Mon, 04 Oct 2021 18:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXSp8-0007vE-Lj; Mon, 04 Oct 2021 18:36:26 +0000
Received: by outflank-mailman (input) for mailman id 201678;
 Mon, 04 Oct 2021 18:36:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXSp7-0007v8-BR
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 18:36:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXSp7-0001wC-A6
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 18:36:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXSp7-00037k-8x
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 18:36:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mXSp5-0006a5-HS; Mon, 04 Oct 2021 19:36:23 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=hqGfY5gddIbntlXghcUwsteOJh9EezHbcrrPmodZmgs=; b=VvLQvLPHMQxBf4sRMxssnPZURY
	YR15bjDZ15PW6uT8KqIYLDxCJusvProhpj4+H7wffIYEsh0iUhomBoKsLTxchpp6bnrckuuBm0zkJ
	AUuCFRU7dcXBeJYG3Bfr0O2a90r0XrOBK8LdICtw2+PE5ZNVi+PgOyK3AJ23j3es4WXY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24923.18855.156848.559332@mariner.uk.xensource.com>
Date: Mon, 4 Oct 2021 19:36:23 +0100
To: xen-devel@lists.xenproject.org,
    committers@xenproject.org
Subject: Re: osstest down, PDU failure
In-Reply-To: <24922.61930.715312.781769@mariner.uk.xensource.com>
References: <24916.14069.358118.417330@mariner.uk.xensource.com>
	<24916.53633.593814.456485@mariner.uk.xensource.com>
	<24917.61577.291999.406078@mariner.uk.xensource.com>
	<24922.61930.715312.781769@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: osstest down, PDU failure"):
> We replaced two PDUs and did a number of other on-site repairs etc.
> 
> Service is in the process of being restored.  I hope to be fully
> operational by the end of the day.

Everything seems to be good.  All the machines that were in service
before the PDU incident are once more operational.

Some other machines were repaired and will be put into service after
commissioning tests.

Some new machines were wired up and will be undergoing testing.  If
and when they seem in good shape I will ask my Release Manager hat :-)
whether we want to put them into service.

Ian.

