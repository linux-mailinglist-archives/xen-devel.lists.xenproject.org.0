Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C447C486
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250512.431473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziW2-0001DI-Cf; Tue, 21 Dec 2021 17:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250512.431473; Tue, 21 Dec 2021 17:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziW2-0001AH-9b; Tue, 21 Dec 2021 17:01:30 +0000
Received: by outflank-mailman (input) for mailman id 250512;
 Tue, 21 Dec 2021 17:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mziW0-0001AB-4R
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:01:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c4a141-627f-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 18:01:26 +0100 (CET)
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
X-Inumbo-ID: a0c4a141-627f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640106086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rySdXvcVByeKLHc/oyZ3fHun2YBIwHYfP0xs1RuK9Jw=;
  b=iCiqFbsrBx5R3lfgF0p3Om1shfHZm6M/QXyHJQMCYFT/B7BJiXwE/fko
   NuGttTAUB/ndtW0U8UO1sAFdTw6kt9Y/vaa89UBdrtHGRDm4Q4i+qP26/
   FXW2fMSoGq7ccuh/SNHZ3+zgVwr7HcJ9k07eCPPvUGtl/QjW0S+bC28Yp
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0v8tEyOyNER5R9RudGbj5koCOmdv+Fr9JIGxTyHuDynvvlfTc1StKx8unajwoTrBMHX7F29stw
 a0jebxqLDDvq3wFGJ4/f2erCQqkpfTslIe39upjsGCcWABrPfsX098hz+y85BbxzhKb0m3aOiX
 eoY3a6bEFFjIPcld3yMk3DMrTjjD/5UeaJlnAY4N4FH9QJIjADq2l7x0+eUZphJSZ32IV84kf3
 uQSahCxWGPuphHpEJwcqN1he+ZKT2fmm4CjMGw+Dx+VMccj2A0FAY7p1C051tCvzmrORx5nM2c
 jKwuNn2ito6MdDjGhEJA9wig
X-SBRS: 5.1
X-MesageID: 60021995
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DWBL0q/Rrca3btPli3+0DrUDLHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mNND27Vb6nZZ2unLotwPoWzpk9T6JTVzd9jHQZp+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRj29Yz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhf5
 uRzioDqED0WfZboub5HSTsJDiZXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4WRayHN
 ptEAdZpRAbsZxIeHl4YMaIzheCTjHzbbmBcqHvA8MLb5ECMlVcsgdABKuH9dsSRQMRJnm6Rv
 m/c43niGRYeKcCezjyetHmrg4fnnDz5cJIfEqWi8fxni0HVwXYcYDUJUXOrrP//jVSxM/pTJ
 EAZ9TAnhbQj/0ysCN/mVlu3p2DslhcZUIsOO/Yg4w/LzKfIiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313r6SsTO1PzlTNWIYbDUIZQQA6tjn5oo0i3ryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj+YuKw2/b2WuWmdvyai9vvB/1D3+ix1YsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03231oybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNCqG8gjlmOMEZmOq7EMdGPxb4M4fFyhdErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7ieLEOSHJE+5eajNii9zVCove+G05F
 P4FaKO3J+h3CrWiMkE7D6ZORbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 aRYIJvZXawUItkFkhxEBaTAQEVZXEzDrWqz0+CNOWhXk0dIS1Ob99n6UBHo8SVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hoNpwNij8rv4rOMVQex/N8SSXi
 lSNChACqOiT/4JsqIvVhbqJppuCGvdlGhYIBHHS6Lu7bHGI/meqzYJafvyPeDTRCDH99Km4P
 L0HxPDgKvwX2l1NttMkQbpsyKs/4frppqNbkVs4TCmaMQzzB+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e5QlQfExUoM7aY3vYOlziMsflseBfm5DV69aasWFlJO0XekzRUKbZ4Pd93w
 eolv8JKuQWzhgBzb4SDhyFQsW+NMmYBQ+MssZRDWN3njQ8iy1djZ53AC3CpvMHTOosUakR6c
 CWJgKfihqhHwhuQenU+InHBwO5BiMlcoxtN1lIDewyEl9etaiXbB/GNHeDbljho8yg=
IronPort-HdrOrdr: A9a23:jAb4MK06IJz3nnCSO2eG4AqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60021995"
Date: Tue, 21 Dec 2021 17:00:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 14/57] tools/flask/utils: remove unused
 variables/targets from Makefile
Message-ID: <YcIIP2hNR+FySlur@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-15-anthony.perard@citrix.com>
 <5286a1b7-3db5-1e00-f9bf-36fa537871b1@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5286a1b7-3db5-1e00-f9bf-36fa537871b1@srcf.net>

On Thu, Dec 16, 2021 at 12:36:41PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:01, Anthony PERARD wrote:
> > @@ -35,21 +29,13 @@ flask-set-bool: set-bool.o
> >  
> >  .PHONY: clean
> >  clean: 
> > -	rm -f *.o *.opic *.so
> > +	rm -f *.o
> >  	rm -f $(CLIENTS)
> >  	$(RM) $(DEPS_RM)
> 
> Here and in plenty of subsequent patches, there's manipulation of raw
> `rm -f`'s which ought to be cleaned up to $(RM)

About using $(RM) or `rm -f`, I don't think we need to care if one or
the other is used in Makefiles, they needs to be equivalent or things
are going to fails. GNU make manual says that `rm` should exist,
especially when things like autoconf are used. For example our
./configure scrips is using `rm -f` and I don't think we can configure
that. So having RM configurable doesn't really serve any purpose.

Beyond that, using $(RM) is good in order to be consistent, and changing
"rm -f" to "$(RM)" is fine, I might not doing it myself or ask for it.

> I can fix this on commit if you're happy.

For the avoidance of doubt, yes, I'm happy with the patch that have been
committed.

Thanks,

-- 
Anthony PERARD

