Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854682928F1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 16:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8716.23368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVpD-0000Ic-3f; Mon, 19 Oct 2020 14:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8716.23368; Mon, 19 Oct 2020 14:07:47 +0000
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
	id 1kUVpC-0000IC-VW; Mon, 19 Oct 2020 14:07:46 +0000
Received: by outflank-mailman (input) for mailman id 8716;
 Mon, 19 Oct 2020 14:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOPR=D2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kUVpB-0000I7-Pv
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:07:45 +0000
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f1ed62b-e9c2-4a6a-8006-96f0ed54b4d1;
 Mon, 19 Oct 2020 14:07:44 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id q25so13106981ioh.4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 07:07:44 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id b2sm10457909ila.62.2020.10.19.07.07.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 07:07:43 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jOPR=D2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
	id 1kUVpB-0000I7-Pv
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:07:45 +0000
X-Inumbo-ID: 7f1ed62b-e9c2-4a6a-8006-96f0ed54b4d1
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7f1ed62b-e9c2-4a6a-8006-96f0ed54b4d1;
	Mon, 19 Oct 2020 14:07:44 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id q25so13106981ioh.4
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7NycqiBF8FosQT/JZwxwlEhE1XoDQEpaYFkJ/zcz7Fc=;
        b=DFbAyS3DUpQ5fvNvLP1kOGrGm8S7XzL3pJrMIcE+DOPHkOmHX6MA553zoCpLgyQ069
         UM+mzp57BkYYtZA9biU6c4EQgjkvtAR710tOXivfDbeozhkfJf1T23/sTj7Zbw+Wbi13
         or81s3aMZ9LP/qvD7mOIukXJbZN2NZ5kOnTuo9MGCOdhBRWavE2llRnUM+14vIN2B4aS
         XM2tBPdqWrQf46C0HTS3LpczMUmzpsRBIwWzEQFNbTlWXdQqiKlaEtd7F9ZcZdCkLEdE
         mhN4Ji7sZw+GoSBN/gd861gcqZ9GxMrcnRxFvGuUp/5kEpLO5rea0OhPk3BM2dN75wd3
         q9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7NycqiBF8FosQT/JZwxwlEhE1XoDQEpaYFkJ/zcz7Fc=;
        b=Tb1BuzA9CzQXqURdlZncXWG+zXA0lCCcEtGIoQJhJKfqSTKu7w8y/XkiKOheMdUXgF
         68C8mWq82ddWJc32tJmIRjE4ekMWO//WymnNcGiKHW5E9fSh+Sa870VxMBqsb+MqtJ42
         sfG69OLb/BXqhtCGbZN/Uc2C/3YMR3OKbROme8uJleFZfRKyiMi/dH+KREKqkjv5Johw
         VPWd/KsQHNeVVB6IoJs0n2TDW0qWOx4gc4uqam+iAt5Uh8/QY3ZyW74hjWX1Ecmn69Lz
         l8ZTiDtBvDO1h/dovcfGk7eI8wSb5xGAJ0L5nbczEDyjZJosd27Wy1matqVA0LcN8oPA
         TqDw==
X-Gm-Message-State: AOAM531mLRplMvnAXtUzc07Lw1EnsbDFbC1utCKi59NLfNhzqCzJQZEN
	c7kYZkmll/BGkfPrrPo5fd8=
X-Google-Smtp-Source: ABdhPJyEuAmwLrm+xzUvMjd18feNAgxOua5BKKqkixX1h5HAXuH77RLYRNDAAc+v+XpBFv1ZugUTNA==
X-Received: by 2002:a6b:6016:: with SMTP id r22mr3570519iog.93.1603116463863;
        Mon, 19 Oct 2020 07:07:43 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id b2sm10457909ila.62.2020.10.19.07.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 07:07:43 -0700 (PDT)
Date: Mon, 19 Oct 2020 10:07:39 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
	Rich Persaud <persaur@gmail.com>, Ian Jackson <iwj@xenproject.org>,
	Olivier Lambert <olivier.lambert@vates.fr>,
	Edwin Torok <edvin.torok@citrix.com>
Subject: Re: RFC: Early mock-up of a xenopsd based on golang libxl bindings
Message-ID: <20201019140739.GA347335@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <84FEBEAF-5859-421E-B595-2358D8490D3F@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84FEBEAF-5859-421E-B595-2358D8490D3F@citrix.com>

On Fri, Oct 16, 2020 at 04:29:58PM +0000, George Dunlap wrote:
> https://gitlab.com/martyros/go-xen branch `working/xenops` contains a super-basic mock-up of a unix domain xenopsd based on the golang libxl bindings.
> 
> To use:
> 
> * Install Xen >= 4.14 on your target system
> 
> * Make sure you have go >= 1.11 installed
> 
> * Clone & build the server
> 
> $ git clone https://gitlab.com/martyros/go-xen
> 
> $ cd go-xen
> 
> $ git checkout working/xenops
> 
> Note that this is *not* a fast-forwarding branch.
> 
> $ cd xenops/xenopsd
> 
> $ go build
> 
> $ ./xenopsd
> 
> Theoretically this will now accept jsonrpc v1 calls on `/tmp/xenops`.  I haven’t dug into exactly what the wire protocol looks like, but you can test golang’s version of it by using one of the “client examples”.  In another terminal:
> 
> $ cd xenops/client-examples
> 
> $ go run get-domains-example.co
> 
> It should list the currently-running domains and their domain names.
> 
> The core of the actual implementation is in go-xen/xenops/xenops/xenops.go.  Basically, every method you add to the Xenops type of the correct format (described in the “net/rpc” documentation) will be exposed as a method available via RPC.
> 
I haven't had a chance to run it yet, but the code all seems very
straight forward. Looks like a promising approach for prototyping.
> The current code only does a Unix socket, but it could easily be modified to work over http as well.
> 
> Once we have function signatures in the libxl IDL, the xenops methods could all be autogenerated, just like the types are for the golang bindings.
> 
It's on my todo list to get that RFC going again. :)

> It should be noted that at the moment there will be two “layers” of translation both ways here: The golang package will be converting rpc into golang structures, then the libxl libraries will be converting golang structures into C structures; then any return values have to be converted from C structures into golang structures, and then converted a gain from golang structures into json before being sent back over the wire.  This may or may not be a big overhead.
> 
> Two things that are currently sub-optimal about the `xenlight` package for this use case.
> 
> First, although we have a xenlight.Error type, a lot of the xenlight wrappers return a generic “error”.  I’m not sure how that will end up being converted into json, but we might thing about making the xenlight wrappers all return xenlight.Error instead.
>
Returning the "generic error" (i.e. the builtin error interface) is what
we want. Doing otherwise would be very awkward for callers. E.g., if
NameToDomid returned (xenlight.Domid, xenlight.Error), we would have:

  domid, err := ctx.NameToDomid(name)
  if err != nil { // <- Compile-time error; can't compare int to nil
   
  }

So, callers would need to explicitly convert to `error`, or always make
sure they declare `var err error` before assignment. 

This is essentially why the builtin `error` interface exists. 

Re: json, the RPC server will call Error() on any error we return from a
registered function, and set it in the Error field of the response
header (see [1]). So, I think it would be our responsibility to add an
additional "libxl error code" field to our RPC return types.

> Secondly, at the moment the xenlight types are in the same package as the function wrappers.  This means that in order to build even the client, you need to be able to link against an installed libxl library — even though the final binary won’t need to link against libxl at all, and could theoretically be on a completely separate host.
> 
> Unfortunately the way we’ve structured xenlight, it’s not simple to move types.gen.go into its own package, because of the toC and fromC wrappers, which *do* need to link against libxl (for the init and dispose functions).  Nick, we might think about whether we should make separate toC and fromC functions for each of the types, rather than making those methods.
> 
Splitting the package would be one option, but we could also just use a
build tag that allows users to say "I don't need to link agaist libxl, I
just want the types." E.g., users could run `go build -tags nolibxl`, 
assuming we put `// +build !nolibxl` in the appropriate .go files.

I can send a proof of concept patch for that.

Thanks,
NR

[1] https://golang.org/pkg/net/rpc/#Response

