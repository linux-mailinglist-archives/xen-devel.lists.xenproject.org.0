Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2737D2FE1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621271.967576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusBg-00020M-Qy; Mon, 23 Oct 2023 10:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621271.967576; Mon, 23 Oct 2023 10:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusBg-0001xj-OH; Mon, 23 Oct 2023 10:29:32 +0000
Received: by outflank-mailman (input) for mailman id 621271;
 Mon, 23 Oct 2023 10:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qusBg-0001wQ-0W
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:29:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1af58e-718f-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:29:31 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B13594EE0740;
 Mon, 23 Oct 2023 12:29:30 +0200 (CEST)
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
X-Inumbo-ID: 0d1af58e-718f-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 12:29:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 6/8] xen/console: remove stub definition
 in consoled.h
In-Reply-To: <4d229be8-6daf-c27e-c9c0-01af6e4862f3@suse.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <98443e951c5c51fc0dbedf1e530d1c27e564e19e.1698053876.git.nicola.vetrini@bugseng.com>
 <4d229be8-6daf-c27e-c9c0-01af6e4862f3@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <81ad44447e3313711fddb5d6833b40de@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2023 12:21, Jan Beulich wrote:
> On 23.10.2023 11:56, Nicola Vetrini wrote:
>> The stub  definition of 'consoled_guest_tx' can be removed, since its
>> its single caller uses the implementation built with PV_SHIM enabled.
>> 
>> Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 
>> DomU")
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Where did Stefano's R-b go?
> 
> Jan

I didn't notice it. Nothing has changed since, so it should be included

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

