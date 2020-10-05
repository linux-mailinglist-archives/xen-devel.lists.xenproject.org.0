Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDB42833DD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 12:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2963.8506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPNVJ-0003yb-FW; Mon, 05 Oct 2020 10:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2963.8506; Mon, 05 Oct 2020 10:14:01 +0000
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
	id 1kPNVJ-0003yC-C8; Mon, 05 Oct 2020 10:14:01 +0000
Received: by outflank-mailman (input) for mailman id 2963;
 Mon, 05 Oct 2020 10:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNwf=DM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kPNVH-0003y0-RN
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:13:59 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 880e2c0b-b5b4-4c80-9543-084c5e0a263b;
 Mon, 05 Oct 2020 10:13:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t17so8163577wmi.4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 03:13:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id h4sm14193239wrm.54.2020.10.05.03.13.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2020 03:13:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cNwf=DM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kPNVH-0003y0-RN
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:13:59 +0000
X-Inumbo-ID: 880e2c0b-b5b4-4c80-9543-084c5e0a263b
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 880e2c0b-b5b4-4c80-9543-084c5e0a263b;
	Mon, 05 Oct 2020 10:13:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t17so8163577wmi.4
        for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=NRgMAqf3/i0yh6vU2Gatu/FdpJX+8wN+9W1V5uqyPKg=;
        b=dQXvZ4OJQOl2EGHL9XE/e1+YpOG+p1PPcAv+TqxRUAMFIcK4cQ1c5oe03vmvUbASjK
         OGBY1tz78PXW6SqnAwBlPP6VNFZY+yk9E6Z86McKL6ekAh5iOJ5YsYhJPnksIxkqK0xa
         6TKiRbQRb595oq5218cgYLIhO2NvodtP1BfnPtm72tbdTsE9v2RTVMmbCCojP5sKGMjY
         YKMxypg26iJU+y7LSccau1Sr15eq8WrcrEXjWu2USNM4Awx+f8nLVawORay4oxIhOMQ8
         dQ49fCkvC4Qk544IYaNcJRWY+LGRAs2VY6zzu7mrYnVXKc2Mgg2ULdAfy5oAUtdzxP+0
         vTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=NRgMAqf3/i0yh6vU2Gatu/FdpJX+8wN+9W1V5uqyPKg=;
        b=btkzHmX11FS85gyN+ecdXTqJm4aoDG+XA13u7q3b6eMfn7gPMFNe1MDxi/vBk1WL2F
         aKfap/3CFjcHablIicgVDJKms87ySPkIZIGgDRf9e/nzho3wajQmEyfwFOtl1KueM75t
         HsvK08jmpdZ9ZQMN+YWUSkqIjHmIZaytMdhRLM5FoAjhaKJfT9Wkk5rLnHsPjhKG6y97
         Ms5hXQcy39sCVrZ1Qn9MsmdTIjUC+2s1QoawUCqnWeVBNkt0yxN04UNy4ZQHRNnChhwu
         ePkQwYF86gcTMBDHQuO4liz8oKE+8Go5H8eN4RuVsLM6Twxg7ERLrgv/aEszCYvnJW3p
         ZsSg==
X-Gm-Message-State: AOAM532hdtL6Z+91+fu07Mseh7LMF8R72//Q5gkLIxmqU3q9J/2VhtMf
	JkKbcTBp37NTaISH20CC4WM=
X-Google-Smtp-Source: ABdhPJxfAc7rkLs+2VLOUwsgHUkym6lK/bhb3wx7dY6XpOAgDovl7dMaIh2HpOjBypJZAWVxNNzBXg==
X-Received: by 2002:a1c:495:: with SMTP id 143mr361861wme.63.1601892838199;
        Mon, 05 Oct 2020 03:13:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id h4sm14193239wrm.54.2020.10.05.03.13.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 03:13:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?= <marmarek@invisiblethingslab.com>
References: <20200924131030.1876-1-paul@xen.org> <20200924131030.1876-6-paul@xen.org> <30a67387-37d4-4408-6747-5fc1b193acc7@citrix.com>
In-Reply-To: <30a67387-37d4-4408-6747-5fc1b193acc7@citrix.com>
Subject: RE: [PATCH v9 5/8] docs / tools: specific migration v4 to include DOMAIN_CONTEXT
Date: Mon, 5 Oct 2020 11:13:56 +0100
Message-ID: <000301d69b00$3cc99f00$b65cdd00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwI2tcBBAdGJ5VapfOrRAA==

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 05 October 2020 11:09
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Julien =
Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Marek =
Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
> Subject: Re: [PATCH v9 5/8] docs / tools: specific migration v4 to =
include DOMAIN_CONTEXT
>=20
> On 24/09/2020 14:10, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > A new 'domain context' framework was recently introduced to =
facilitate
> > transfer of state for both PV and HVM guests. Hence this patch =
mandates the
> > presence of a new DOMAIN_CONTEXT record in version 4 of the libxc =
migration
> > stream.
> > This record will incorprate the content of the domain's =
'shared_info' page
> > and the TSC informaiton so the SHARED_INFO and TSC_INFO records are =
deprecated.
> > It is intended that, in future, this record will contain state =
currently
> > present in the HVM_CONTEXT record. However, for compatibility with =
earlier
> > migration streams, the version 4 stream format continues to specify =
an
> > HVM_CONTEXT record and XEN_DOMCTL_sethvmcontext will continue to =
accept all
> > content of that record that may be present in a version 3 stream.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>=20
> What's the plan for the remainder of the work?  We don't want to burn
> multiple version numbers for each bit of incremental work.
>=20
> One option might be to specify the full extent of the work, and use an
> environment variable to alter the behaviour of the sending side, while
> it is still work-in-progress.
>=20

The other missing part for transparent migration is xenstore content, =
but I'd expect that to sit at the next level up so I'm not anticipating =
any more churn at this level.

  Paul


