Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18874393D5F
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 08:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133778.249215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWPi-000099-1B; Fri, 28 May 2021 06:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133778.249215; Fri, 28 May 2021 06:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWPh-00005q-TN; Fri, 28 May 2021 06:56:09 +0000
Received: by outflank-mailman (input) for mailman id 133778;
 Fri, 28 May 2021 06:56:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmWPg-00005k-Mu
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 06:56:08 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faa2a749-8b44-45a6-b7da-c11bc5685dda;
 Fri, 28 May 2021 06:56:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71043218B3;
 Fri, 28 May 2021 06:56:05 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4527811A98;
 Fri, 28 May 2021 06:56:05 +0000 (UTC)
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
X-Inumbo-ID: faa2a749-8b44-45a6-b7da-c11bc5685dda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622184965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tLGueST+/+NzoysaKWzkvZCiMsHiJjBkl7QtcnPhGnw=;
	b=YE9vFZ4AybrgKwKGyXo/xRBlNSHoSDy4VdR8wBphMkNOzir43E8bt8mV4bbmC5gbxRgBaB
	Ah8yIHRme73maC+yjlzfi6+/zakH9EekQ9wQFcp9s9WT8Gncg/HwBKfPe4VzvpZ5RHgA6u
	o3L7AsPmleXapy/5nRbYXS23f2R0JMc=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/AMD: MSR handling adjustments
Message-ID: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Date: Fri, 28 May 2021 08:56:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
2: drop MSR_K7_HWCR

Jan

