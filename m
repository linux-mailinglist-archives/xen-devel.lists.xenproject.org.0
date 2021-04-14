Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1FD35FB58
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 21:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110810.211690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWkrm-00040V-8T; Wed, 14 Apr 2021 19:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110810.211690; Wed, 14 Apr 2021 19:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWkrm-000406-5K; Wed, 14 Apr 2021 19:07:58 +0000
Received: by outflank-mailman (input) for mailman id 110810;
 Wed, 14 Apr 2021 19:07:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=35og=JL=goodmis.org=rostedt@kernel.org>)
 id 1lWkrk-000401-HS
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 19:07:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3f8c2c8-cd7c-43af-9b1e-27416318e556;
 Wed, 14 Apr 2021 19:07:55 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CAEF61042;
 Wed, 14 Apr 2021 19:07:54 +0000 (UTC)
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
X-Inumbo-ID: e3f8c2c8-cd7c-43af-9b1e-27416318e556
Date: Wed, 14 Apr 2021 15:07:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, Giuseppe Eletto
 <giuseppe.eletto@edu.unito.it>, <linux-trace-devel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, Enrico Bini <enrico.bini@unito.it>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <20210414150752.34366b99@gandalf.local.home>
In-Reply-To: <7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	<f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
	<eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
	<7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Apr 2021 19:11:19 +0100
Andrew Cooper <andrew.cooper3@citrix.com> wrote:

> Where the plugin (ought to) live depends heavily on whether we consider
> the trace format a stable ABI or not.

Agreed. Like the VMware plugin to handle ESX traces. It's internal and not
published as the API is not stable.

But if it ever becomes stable, and you would like it to live with
KernelShark, we are looking to have a place to store third party plugins.

We are working to make sure that the API for KernelShark plugins remains
stable, so your plugins should always work too.

-- Steve

