Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9721863E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 13:35:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt8MQ-0006eL-F5; Wed, 08 Jul 2020 11:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4YfP=AT=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1jt8MO-0006eG-K9
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 11:35:32 +0000
X-Inumbo-ID: 210d60d2-c10f-11ea-8e2a-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 210d60d2-c10f-11ea-8e2a-12813bfff9fa;
 Wed, 08 Jul 2020 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594208131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8Z2Gh8iDn/pnjTwj/tk9pg091TYfdl6bfJD17+GLrn4=;
 b=CkApSgbPAXg7DhbpCbfPLg9fcutA+UwuWT10Xd1HV0jq/iI0tfvuuQZ9vYkPVJjhZ8WMzy
 oGL+q7KEGgPu9H92r7WIfXLB+N3QhTOOQotL39rtWEjA+mLTesJfshrLiD+RTqqqaY1VbE
 7Cdw5PjuhX3+bbqc1IvxsjSGCLGRVqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-wJIGFVQANCeLH0FuHYQ-RQ-1; Wed, 08 Jul 2020 07:35:16 -0400
X-MC-Unique: wJIGFVQANCeLH0FuHYQ-RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD221940920;
 Wed,  8 Jul 2020 11:35:10 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8423660E1C;
 Wed,  8 Jul 2020 11:34:39 +0000 (UTC)
Date: Wed, 8 Jul 2020 12:34:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200708113436.GG3229307@redhat.com>
References: <20200706162300.1084753-1-dinechin@redhat.com>
 <159405307662.7847.17757844911728214859@d1fd068a5071>
MIME-Version: 1.0
In-Reply-To: <159405307662.7847.17757844911728214859@d1fd068a5071>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, dmitry.fleytman@gmail.com, mst@redhat.com,
 jasowang@redhat.com, mark.cave-ayland@ilande.co.uk, armbru@redhat.com,
 jcmvbkbc@gmail.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, marex@denx.de, sstabellini@kernel.org,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, paul@xen.org,
 magnus.damm@gmail.com, mdroth@linux.vnet.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au, philmd@redhat.com, atar4qemu@gmail.com,
 riku.voipio@iki.fi, ehabkost@redhat.com, mjt@tls.msk.ru,
 alistair@alistair23.me, pl@kamp.de, dgilbert@redhat.com, r.bolshakov@yadro.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, ronniesahlberg@gmail.com,
 xen-devel@lists.xenproject.org, alex.bennee@linaro.org, rth@twiddle.net,
 kwolf@redhat.com, ysato@users.sourceforge.jp, crwulff@gmail.com,
 laurent@vivier.eu, mreitz@redhat.com, qemu-ppc@nongnu.org, dinechin@redhat.com,
 pbonzini@redhat.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 06, 2020 at 09:31:21AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200706162300.1084753-1-dinechin@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Subject: [PATCH] trivial: Remove trailing whitespaces
> Type: series
> Message-id: 20200706162300.1084753-1-dinechin@redhat.com
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20200706162300.1084753-1-dinechin@redhat.com -> patchew/20200706162300.1084753-1-dinechin@redhat.com
> Switched to a new branch 'test'
> 9af3e90 trivial: Remove trailing whitespaces
> 
> === OUTPUT BEGIN ===

snip

> ERROR: trailing whitespace
> #2395: FILE: target/sh4/op_helper.c:149:
> +^I$

One case of trailing whitespace missed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


