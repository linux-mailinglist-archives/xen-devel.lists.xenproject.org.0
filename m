Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8F63F38A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450835.708311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lIc-0004Ki-Sz; Thu, 01 Dec 2022 15:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450835.708311; Thu, 01 Dec 2022 15:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lIc-0004Ih-P4; Thu, 01 Dec 2022 15:16:30 +0000
Received: by outflank-mailman (input) for mailman id 450835;
 Thu, 01 Dec 2022 15:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0lIb-0004IW-JY
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:16:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fd84359-718b-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 16:16:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AEB67CE1D00;
 Thu,  1 Dec 2022 15:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDD7C433C1;
 Thu,  1 Dec 2022 15:16:22 +0000 (UTC)
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
X-Inumbo-ID: 1fd84359-718b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669907783;
	bh=66NEiIlTrHZZpiZASYlKhgBWxrXF7VIKt7lC6rAyhAg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n9rObCEcxdux3qpYQvoJLfGsvn+U3m2SbzNZp1WVM41hDD1ebBQxsKUGv4kaol+fb
	 IfdwZ9VYSbA9ijo+9ZRq6ST2Ybf+FoSWYzBa1j7aSzierIeAg4ktGWVhj5CaOEuZG3
	 V9AdmaeUQwmzTUjSOy4pLi1VmAfeDLKHdwxF1li0r4oACozlw4ovaq1eU16norOZKF
	 Fl2HLnotl1x99xBdGKdLmHEN4zzmkW/ycEv0KLCxwnSSGncwGD0W8eVaSajQYnsbAS
	 u8py2QJJthC8sod1OBq7D7g1Ag6I/+NC2sh+7OQl9qZjB1Gvtcnk/Xw36RM9fQ1iFq
	 iC320h3DWvkFw==
Date: Thu, 1 Dec 2022 07:16:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] tools/misra: fix skipped rule numbers
In-Reply-To: <677D59B8-839D-4C43-8546-67B2D1C887E6@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212010716140.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-4-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2211291545420.4039@ubuntu-linux-20-04-desktop> <21F6A61B-1476-49A7-8726-7F94BBA627F6@arm.com> <alpine.DEB.2.22.394.2211301534190.4039@ubuntu-linux-20-04-desktop>
 <677D59B8-839D-4C43-8546-67B2D1C887E6@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Dec 2022, Luca Fancellu wrote:
> >> Hi Stefano,
> >> 
> >> MISRA rules are in this format X.Y, misra_c2012_rules is a dictionary where the key is 
> >> X and the value is the maximum number that Y can have.
> >> 
> >> For example rule 13.Y goes from 13.1 to 13.6 (in the dictionary misra_c2012_rules[13] == 6),
> >> so the code can now check which among (13.1 .. 13.6) is not in the rule_list and add it to the
> >> list of skipped rules.
> >> 
> >> Here an example:
> >> {
> >>    "script": "misra.py",
> >>    "args": [
> >>      "--rule-texts=/path/to/cppcheck-misra.txt",
> >>      "--suppress-rules=1.1,1.2,1.4,2.2,2.3,2.4,2.5,2.6,2.7,3.1,4.1,4.2,5.5,5.6,5.7,5.8,5.9,6.1,7.1,7.2,7.3,7.4,8.2,8.3,8.7,8.9,8.11,8.13,8.14,9.3,9.4,9.5,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.1,12.2,12.3,12.4,12.5,13.1,13.2,13.3,13.4,13.5,14.2,14.3,14.4,15.1,15.2,15.3,15.4,15.5,15.6,15.7,16.1,16.2,16.3,16.4,16.5,16.6,17.1,17.2,17.5,17.6,17.7,17.8,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,19.1,19.2,20.1,20.2,20.3,20.4,20.5,20.6,20.8,20.9,20.10,20.11,20.12,21.1,21.2,21.3,21.4,21.5,21.6,21.7,21.8,21.9,21.10,21.11,21.12,21.13,21.14,21.15,21.16,21.17,21.18,21.19,21.20,21.21,22.1,22.2,22.3,22.4,22.5,22.6,22.7,22.8,22.9,22.10"
> >>    ]
> >> }
> >> 
> >> So this patch is solving two issues, the first one was that rule 22.Y was never included in the suppressed
> >> list because range(1,22) produces a range in [1..21], the second issue is that the code was producing
> >> Invalid MISRA C 2012 rules, for example 1.21 and so on.
> > 
> > I see, that makes sense. Please improve the commit message with this
> > information and add
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thank you,
> 
> If you agree, I will change the commit message to be this one:
> 
> MISRA rules are in the format Rule X.Y, currently the script
> convert_misra_doc.py is using two nested loop through range(1,22) to
> enumerate rules that needs to be skipped, using combination of X.Y in
> that range, however there are two issues in the code:
>  - rule 22 is never included because the range(1,22) produces a range 
>    in [1..21]
>  - the second issue is that the code is producing invalid MISRA C 2012
>    rules, for example 1.21 and so on
> 
> Fix the issue using a dictionary that list the rules in misra c2012.

Sounds good

