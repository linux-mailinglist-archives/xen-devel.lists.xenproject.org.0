Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E82293C6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 10:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyAIg-0001K5-2o; Wed, 22 Jul 2020 08:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyAIe-0001K0-CE
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 08:40:28 +0000
X-Inumbo-ID: fda90306-cbf6-11ea-8620-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fda90306-cbf6-11ea-8620-bc764e2007e4;
 Wed, 22 Jul 2020 08:40:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AB2CAD4A;
 Wed, 22 Jul 2020 08:40:33 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.11.4 released
To: xen-announce@lists.xenproject.org
Message-ID: <bd86a400-7e5c-60cd-d25a-a0c5cfa3ad43@suse.com>
Date: Wed, 22 Jul 2020 10:40:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

All,

better late than never, I am pleased to announce the release of Xen 4.11.4.
This has been available immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.11
(tag RELEASE-4.11.4) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-11-series/xen-project-4-11-4/
(where a list of changes can also be found).

We recommend all users of the 4.11 stable series to update to this last
point release to be made by the XenProject team from this stable branch.

Apologies for the much delayed announcement.

Regards, Jan

