Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7A1F5B58
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 20:38:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj5bs-0003Sb-4Z; Wed, 10 Jun 2020 18:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dv4m=7X=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jj5br-0003SW-FM
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 18:37:59 +0000
X-Inumbo-ID: 81c05a8c-ab49-11ea-8496-bc764e2007e4
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81c05a8c-ab49-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 18:37:58 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id v79so3050674qkb.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=bYonscorY+I+rpVIRHqicEvlg4i+HTCU1d5REzvyhPg=;
 b=Ox4YW6AdLDWuknd+YobLJlyTOUciPKzYNi2fhf5MimP8oXOSnSWhzGaRlXoCQdIp9Y
 yD8ZY6rSurSVu4OVmlRHgnDDMI08G2VpRVQpwutL2ANV/6b7ALqxgJLgYijUnqPsESyq
 9M0P1AscDHkzPTaToAcQw35PDQBEjRHCcReCO+so35bS3Jctw6OWntshW7cqhSxOd/Lk
 Lj0xuw6retEhNWeshilljrJMHViqiKl/vZDzlHd7DeA/PTHm/0MdDKIoe7AsmJVN63IY
 EQg1WbnWieb5r3U2CWIpOu8jm4V2jv4cbpB1A493QcM7brJRzqkcIbVCZBhH63OUDCdG
 8vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=bYonscorY+I+rpVIRHqicEvlg4i+HTCU1d5REzvyhPg=;
 b=iYUQ72wdpOWr5EW+NfS8iA2Lv2b/jaABpgalDr94acjStoBH2D4fdLhBmR9wlwu490
 lKY8OGBYWRAL+wYU9G0sj0sy1CrkCbkibRBWg78dt5IX/nt79By+UPCDpoUhZZwe6d4e
 IMGg17a/Gf/mWRh+jXpHu2IqcOEydlgsDTX4g4OUNOzD6dPmZ1iZzcP/4RWVzKGtW9vf
 LWcGoFAMBiCr9A3Y5xnaXHRPGiiHGhraP2I/3hEhnT02RxxJNVmRQRcsgP6lNJJ26oxb
 f0NWt823HddyVVChPMnhZCXiDnzOuwKoZB3xgiXrZ7TPWvnDEo/m9VzZjFjfXlJtcbze
 nraw==
X-Gm-Message-State: AOAM532MHX8+vFvtzsR9KtRFnz7CeUMf/yErPGm15vDvURR2iEOHf93z
 OOlWimIWEMx9aJD+RlGV3NlT4ojKc7g=
X-Google-Smtp-Source: ABdhPJyW9aO4zn1aadDv9ercXUAwi3JS9up8D7nnwPhLV9iAHAuY7QTscC3tCAOCYDfncqiA+JRyCQ==
X-Received: by 2002:a37:65cf:: with SMTP id z198mr4269751qkb.133.1591814277868; 
 Wed, 10 Jun 2020 11:37:57 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id t43sm586208qtj.85.2020.06.10.11.37.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:37:57 -0700 (PDT)
Date: Wed, 10 Jun 2020 14:37:54 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Unexpected diff after autogen.sh
Message-ID: <20200610183754.GA3113@six>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: ian.jackson@citrix.com, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

When writing a patch to tools/configure.ac, re-running autogen.sh
resulted in a diff with unexpected changes. Specifically, these additions:

    diff --git a/configure b/configure
    index 8af54e8a5a..9da3970cef 100755
    --- a/configure
    +++ b/configure
    @@ -644,6 +644,7 @@ infodir
     docdir
     oldincludedir
     includedir
    +runstatedir
     localstatedir
     sharedstatedir
     sysconfdir
    @@ -722,6 +723,7 @@ datadir='${datarootdir}'
     sysconfdir='${prefix}/etc'
     sharedstatedir='${prefix}/com'
     localstatedir='${prefix}/var'
    +runstatedir='${localstatedir}/run'
     includedir='${prefix}/include'
     oldincludedir='/usr/include'
     docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
    @@ -974,6 +976,15 @@ do
       | -silent | --silent | --silen | --sile | --sil)
         silent=yes ;;

    +  -runstatedir | --runstatedir | --runstatedi | --runstated \
    +  | --runstate | --runstat | --runsta | --runst | --runs \
    +  | --run | --ru | --r)
    +    ac_prev=runstatedir ;;
    +  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
    +  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
    +  | --run=* | --ru=* | --r=*)
    +    runstatedir=$ac_optarg ;;
    +
       -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
         ac_prev=sbindir ;;
       -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \

    [...]

...and similar for {docs,tools,stubdom}/configure. These lines were
originally removed in 83c845033d. It seems that the 'runstatedir'
changes in the configure scripts were unintentional and should be added
back.

Thanks,
-NR

