Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984B305FC4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76169.137331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4msH-00027P-Qi; Wed, 27 Jan 2021 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76169.137331; Wed, 27 Jan 2021 15:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4msH-00026w-N5; Wed, 27 Jan 2021 15:36:53 +0000
Received: by outflank-mailman (input) for mailman id 76169;
 Wed, 27 Jan 2021 15:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4msG-00026m-SC
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:36:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 305a95e7-7692-4864-a0fd-a54b1cc24e2f;
 Wed, 27 Jan 2021 15:36:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D9C7AE05;
 Wed, 27 Jan 2021 15:36:50 +0000 (UTC)
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
X-Inumbo-ID: 305a95e7-7692-4864-a0fd-a54b1cc24e2f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611761810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r11qVoOGJXCjn49f+hzQUyiPak6/U9rcgI7o8DVvVy8=;
	b=JPX2qVwmiPNvlveN9872Yc5ivSbHc9UIIn1BaJE/e+UR/qGSjcB4yuRD/A4WMK3f340rCA
	5rEHM4TIH3JMD31p9EEpHVvV2h7FGjdcHfreBbN21UJQ8gHGKikREsRuC6pWuU1NAlJS8P
	/v60Ag5ry0myzPLHDUNDf1w+CDDTH64=
To: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: MAINTAINERS vs libxl
Message-ID: <c427c7f7-05ed-e537-76c2-c900a753755d@suse.com>
Date: Wed, 27 Jan 2021 16:36:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In commit 032a96e5ef38 tools/libxl/ was split into
tools/libs/light/ and tools/libs/guest/. Wasn't the latter
rather meant to be tools/libs/util/, as that's the other part
of what had previously resided under tools/libxl/?

Jan

