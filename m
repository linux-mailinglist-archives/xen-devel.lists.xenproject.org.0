Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350112922E2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8597.23028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPS2-0004jI-0J; Mon, 19 Oct 2020 07:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8597.23028; Mon, 19 Oct 2020 07:19:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPS1-0004it-TL; Mon, 19 Oct 2020 07:19:25 +0000
Received: by outflank-mailman (input) for mailman id 8597;
 Mon, 19 Oct 2020 07:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPRz-0004io-Ux
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:19:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a37262c2-e655-43ea-87f0-1f6583655d4e;
 Mon, 19 Oct 2020 07:19:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AB3CABD5;
 Mon, 19 Oct 2020 07:19:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPRz-0004io-Ux
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:19:23 +0000
X-Inumbo-ID: a37262c2-e655-43ea-87f0-1f6583655d4e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a37262c2-e655-43ea-87f0-1f6583655d4e;
	Mon, 19 Oct 2020 07:19:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603091962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iEd1reE4mBWWJcVdcup4nuKoiAsz84JQ8s20z7nRMv0=;
	b=cehT+UtFMhRWilwnG/fdvzrI0I7SDSkQGE7kqa2ZIRhwnV3ZEilMPpvvDpxQfZ4VD1XfcE
	bS2tbfH5W85C7AMXGVK75rS2emA73mjIYOF6YldKrCziBGceFkAqL5VeOSByvuudHN9bz0
	MB5L84ETkenao/nPkSmS+jpEfcCNllg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5AB3CABD5;
	Mon, 19 Oct 2020 07:19:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] tools/libs: fix build rules to correctly deal with
 multiple public headers
Message-ID: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Date: Mon, 19 Oct 2020 09:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: fix header symlinking rule
2: fix uninstall rule for header files

Jan

