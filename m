Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100534E53A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 12:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103388.197283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBRM-0002nV-On; Tue, 30 Mar 2021 10:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103388.197283; Tue, 30 Mar 2021 10:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBRM-0002n6-Le; Tue, 30 Mar 2021 10:17:40 +0000
Received: by outflank-mailman (input) for mailman id 103388;
 Tue, 30 Mar 2021 10:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRBRK-0002n1-SZ
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRBRK-0001oj-Rl
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:17:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRBRK-0006Xj-Qh
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:17:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lRBRH-0004Lp-9w; Tue, 30 Mar 2021 11:17:35 +0100
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
	bh=kGFjmhwv28S5BmdLGRUB64O4XneaUjd/SKx70mFBhks=; b=klmQjcuAaauvH65JLXUf80ovQA
	8VJbRDJIgOzBlzgM/TB1P6jm5G07RdZMGRAUtig8lwSoln2AWivKi86uLVBXbpL5CqwlhIqdTvKRf
	Y1yoCdXlAzoWdvte0IH0y1/YFSZu7R9Y5r6nCxJe8/QbAbSMjMXmnnsPyzY0lVZ4YEWk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24674.64189.466454.374@mariner.uk.xensource.com>
Date: Tue, 30 Mar 2021 11:17:33 +0100
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org,
    jbeulich@suse.com,
    andrew.cooper3@citrix.com,
    roger.pau@citrix.com,
    wl@xen.org,
    stephen.s.brennan@oracle.com
Subject: Re: [PATCH v3 0/2] Performance regression due to XSA-336
In-Reply-To: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Boris Ostrovsky writes ("[PATCH v3 0/2] Performance regression due to XSA-336"):
> The first patch addresses performance regression introduced by XSA-336 fixes.
> This patch could be considered as a candidate for inclusion in 4.15.

Thank you, but I think this is too late for 4.15.

Regards,
Ian.

