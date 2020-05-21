Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DC1DCA77
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 11:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbhpz-0006Cv-Pi; Thu, 21 May 2020 09:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFaT=7D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbhpy-00062p-F0
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 09:50:02 +0000
X-Inumbo-ID: 702eddc2-9b48-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 702eddc2-9b48-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 09:50:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e1so6038020wrt.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=+d0IzG1+YMWC+2mUHTbCIH/IWYDliQDZXZ1jnDEbUKU=;
 b=n17iZNNS/P4KQ7TUGm3qXYLnlNr1E0OsfexmAM5Cn8DZ2Ad0tUoZ5QvrNERab3h/bH
 RXZhw4gVamKLslmZliajYt1XOY5FisjOqfwRNy4qk8R/UJ6r1FG5+toUjcGSjfgZhcm7
 /GNgPlGYTrLq/9iq9mVEMVM+e/yd02ZpwrDG3F0EnEoNB5VHj9urt/bZ9c+iVfe8+4f6
 LSRTaoLzXMptajLSsYSgEy5GmWd4GdLhDllZWzfOw1miZK7c8oXX1pzDx41+1xB1MRK6
 5FGG19wJsMzOOrbr+sLQVfYOR9DxLmqcBnwgR4s9+O9oNbebBE5n9pswzcaY7D5/CDTN
 B9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=+d0IzG1+YMWC+2mUHTbCIH/IWYDliQDZXZ1jnDEbUKU=;
 b=sccpnChkRHqKYNcsjkAT8ajBIVLpXZg/edcjypinTVUHPDUXPWh2LerIRHDCDXZMyG
 6GMtqEVTYV6c8v16DzHVsKYnOIT1VCjEqIZYahDm3RtP0Pn15B+RMhB/XE7a8tise0fH
 rsA2sTPhdMEIOvxgUJ+FE4BFx+MTwxcKLrDj9BAajh1yGHY31MDA8dXnk9vjJ7CaVCMl
 Sb5+ruS6bf4hLeqHPe3/rfRqUwyrV3T90+tm2F02mwPR2wFZu4eLrUfy8SdAUj98OOFo
 JK8waL2ts6vfbx9adK467jBlTZ19lT/7U8zfOksCsyjW4OduOKsBqVGf/FJy6HwjGS8d
 B2lA==
X-Gm-Message-State: AOAM533KI/ECPr+dDSiOFNmaF1HCw33ZV3tGJ0XVls7V90ky8S319W23
 l13NJGeYowhB3z3jHy28kFbleK+lo6c=
X-Google-Smtp-Source: ABdhPJxLFYu5eq/e/TIEq65KOggQQHQwp9EHEw/981p7p2YUElM8rx621n1wXjIXRzaDhzua+R0tEg==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr7923109wrt.341.1590054600438; 
 Thu, 21 May 2020 02:50:00 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id t6sm6191567wma.4.2020.05.21.02.49.59
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 02:49:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Subject: Freeze date for Xen 4.14
Date: Thu, 21 May 2020 10:49:58 +0100
Message-ID: <003d01d62f55$31437b40$93ca71c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdYvU+RMtJio/i3kSdu9RNELiAmwvw==
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

  Code freeze for 4.14 is currently scheduled for CoB tomorrow (Friday May 22nd), however there is a public holiday today in many
countries meaning that a few maintainers and committers are not available. I am also aware of a few pending series that are close to
being fully acked but are not quite there yet. As release manager I therefore think it is prudent to slip the freeze date by one
week to Friday May 29th. Release, however, remains scheduled for Friday June 26th.

  Paul Durrant


