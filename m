Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D81E3F08
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 12:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdtKw-00060z-Bz; Wed, 27 May 2020 10:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdtKu-00060u-K4
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 10:31:00 +0000
X-Inumbo-ID: 27a86c46-a005-11ea-a714-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27a86c46-a005-11ea-a714-12813bfff9fa;
 Wed, 27 May 2020 10:30:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26802AD88;
 Wed, 27 May 2020 10:31:01 +0000 (UTC)
Subject: Re: patches for Xen 4.13
To: Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200527101752.GA3094@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9b3dbcc-71a9-f07c-f7ca-00e423c18138@suse.com>
Date: Wed, 27 May 2020 12:30:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527101752.GA3094@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 12:17, Manuel Bouyer wrote:
> I got Xen 4.13 working with NetBSD. Now I'd like to get the patches back
> in the Xen sources. What is the best way to submit the patches ?

Patches generally need to be submitted against the staging tree;
backporting to older trees occurs on an as-needed / as-requested
basis. Note however that the staging tree is about to freeze for
4.14, so only clear bug fixes are likely to get a release
manager approval. Anything else would be deferred until the tree
re-opens.

Jan

