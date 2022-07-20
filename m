Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA857BCAE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 19:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372067.603886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEDX5-0006wU-AV; Wed, 20 Jul 2022 17:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372067.603886; Wed, 20 Jul 2022 17:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEDX5-0006rA-6D; Wed, 20 Jul 2022 17:30:47 +0000
Received: by outflank-mailman (input) for mailman id 372067;
 Wed, 20 Jul 2022 17:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTqr=XZ=protonmail.com=mathieu.tarral@srs-se1.protection.inumbo.net>)
 id 1oEDX3-0006m6-Sm
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 17:30:45 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae1bf13c-0851-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 19:30:43 +0200 (CEST)
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
X-Inumbo-ID: ae1bf13c-0851-11ed-bd2d-47488cf2e6aa
Date: Wed, 20 Jul 2022 17:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658338241; x=1658597441;
	bh=szd33vzL3HSe+BF5QKyTv7z99EAnCnS+kHy0kotcKsE=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=lLGTKMX2fPvjuI2VMcmlgBEieu6bSS8RgSvHIoPtdY1E1AvbvhYkM8h7pg5TDG2Ag
	 /l23gye/jndPYHkh7zFXjFB546ZZGS8fkwntjNP974VdTPECH2XmVokWrYMIF683ba
	 qhWFvS+AKYu+4hpPOpqT9zPps6A54T6rQQI83ehe22PCcYn253dSRGXbYsIKsHFved
	 i3DnkYbpF5rNFn9nxyy497IayGwqqix5tgWM/QALv0ruVLvpDeSgD8AHgDlkc7taqY
	 I9K/utfvBhbK8HsttfHGIhqQ3jBhY6GDaCKYzmdks8OScT3BftC92RfiKlBD+/wiAb
	 eIcD+DTMOHbeA==
To: Anthony PERARD <anthony.perard@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Xen-users <xen-users@lists.xenproject.org>, George Dunlap <George.Dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: xen master: xl create hangs
Message-ID: <a55i2GKlE-cRGCR0QTYwVYlaLTWcPORQ_rGOa15Y1xkesH7i7rPf6AogcNXSid-Y7Qnkz7CnyRPDXEbHRb7JuG_R-p0N5aS14cLF8dUsLIk=@protonmail.com>
In-Reply-To: <YtgsNi2cBjov36aZ@perard.uk.xensource.com>
References: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com> <hF_ANsRE_9Sbu2AU-AYkf0uIMtOhY2NGK2eG1QOXsdL8uKwi7K9y3SrJAJ4UrHJ34Mpp2WXUGOh4F2vdtJpguCOVHn-K-XuwtYeISjijagk=@protonmail.com> <YtgsNi2cBjov36aZ@perard.uk.xensource.com>
Feedback-ID: 279104:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I think that this `xl` process just wait for the domain to shutdown
> or die. When we run `xl create`, before exiting there's a fork/exec of
> xl which handle a few domain events, so it looks like this stack trace
> is expected (and look like the one I have). So it don't looks like to be
> the xl process that hangs.

I tested again but this time with XTF test-pv64-example:
https://user-images.githubusercontent.com/964610/180044164-74d12f63-d901-4e=
33-93be-073c7ed8d7dc.png

This is the new xl stacktrace:
https://gist.github.com/Wenzel/969d5c06982246cd6cb2eb8cdf252a18#file-gdb2-x=
s-daemon-close-c

It now shows the first thread waiting on the reading thread to join, as we =
expected:
https://github.com/xen-project/xen/blob/0e60f1d9d1970cae49ee9d03f5759f44afc=
1fdee/tools/libs/store/xs.c#L366

And the second one waiting in read_message:
https://github.com/xen-project/xen/blob/0e60f1d9d1970cae49ee9d03f5759f44afc=
1fdee/tools/libs/store/xs.c#L1265

Mathieu

