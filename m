Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A62FEF71
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72229.129901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cED-0001gs-Gi; Thu, 21 Jan 2021 15:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72229.129901; Thu, 21 Jan 2021 15:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cED-0001gS-DD; Thu, 21 Jan 2021 15:50:33 +0000
Received: by outflank-mailman (input) for mailman id 72229;
 Thu, 21 Jan 2021 15:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cEB-0001gL-8N
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:50:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33a54502-b5f2-4995-abf3-a55f5089d2b2;
 Thu, 21 Jan 2021 15:50:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0EEEABD6;
 Thu, 21 Jan 2021 15:50:29 +0000 (UTC)
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
X-Inumbo-ID: 33a54502-b5f2-4995-abf3-a55f5089d2b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611244229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/Jkbzq/dHL05kZlzk1VtEEKlPNCqDuK37IGtMzlnQc=;
	b=hb4OUuTwiiBiYjbmKffbHmy2TCYQR3kY/n1R5e0ezvzl/S5aax8m2+9onh5g11vLUS9ju9
	6YlGbSshjMZwMFYKERI6yL+6hJd610VaVu3KMNxXG6rqqVlv3ZdzouBfHAO1xx3FRf9eI6
	vbcTUEMOst1/8QNu8oX2cD/hdvUwWds=
Subject: Re: [PATCH v4 4/5] xen/cpupool: add scheduling granularity entry to
 cpupool entries
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cda95c67-d4aa-dba5-aa6e-73033b8f7f73@suse.com>
Date: Thu, 21 Jan 2021 16:50:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118115516.11001-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 12:55, Juergen Gross wrote:
> Add a "sched-gran" entry to the per-cpupool hypfs directories.
> 
> For now make this entry read-only and let it contain one of the
> strings "cpu", "core" or "socket".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


