Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB453281796
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 18:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2255.6708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONhw-0002hQ-GN; Fri, 02 Oct 2020 16:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2255.6708; Fri, 02 Oct 2020 16:14:56 +0000
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
	id 1kONhw-0002h1-Co; Fri, 02 Oct 2020 16:14:56 +0000
Received: by outflank-mailman (input) for mailman id 2255;
 Fri, 02 Oct 2020 16:14:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONhv-0002gw-4J
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:14:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f41fca36-0233-44e7-8b7d-186726f98aca;
 Fri, 02 Oct 2020 16:14:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA811AC65;
 Fri,  2 Oct 2020 16:14:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONhv-0002gw-4J
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:14:55 +0000
X-Inumbo-ID: f41fca36-0233-44e7-8b7d-186726f98aca
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f41fca36-0233-44e7-8b7d-186726f98aca;
	Fri, 02 Oct 2020 16:14:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601655292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q38OKd37Qumz8X0LRWp9yU1q7XBpoxN1vrVgvyYeBSI=;
	b=IHxFJBrX+0b6MyNm9AoDGxzbfYrY/k59fCC/N+qy3DRBNQIGo/dZwqqcImPwf6QtJzLrPA
	fiOp6ueKhO/DQ6GBC+QG9aHXObq++iHrEpr58wbUMYExa/9+VfoYckvuM2jGqWEg2YvnWi
	0MnWrxNlq6MhgBMq9zVZJQsCfGrprXk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA811AC65;
	Fri,  2 Oct 2020 16:14:52 +0000 (UTC)
Subject: Re: [PATCH v1 0/1] drop RO socket from oxenstored
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <cover.1601654648.git.edvin.torok@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a363b6ed-86e0-2fe8-1753-f29ec55508aa@suse.com>
Date: Fri, 2 Oct 2020 18:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1601654648.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.20 18:06, Edwin Török wrote:
> See https://lore.kernel.org/xen-devel/20201002154141.11677-6-jgross@suse.com/T/#u
> 
> Edwin Török (1):
>    tools/ocaml/xenstored: drop the creation of the RO socket
> 
>   tools/ocaml/xenstored/connections.ml |  2 +-
>   tools/ocaml/xenstored/define.ml      |  1 -
>   tools/ocaml/xenstored/xenstored.ml   | 15 ++++++---------
>   3 files changed, 7 insertions(+), 11 deletions(-)
> 

FWIW:

Acked-by: Juergen Gross <jgross@suse.com>


Juergen

