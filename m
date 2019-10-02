Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C6C8A18
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFevN-00051z-IZ; Wed, 02 Oct 2019 13:44:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uMoo=X3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFevM-00051o-11
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:44:12 +0000
X-Inumbo-ID: b5d01593-e51a-11e9-9717-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id b5d01593-e51a-11e9-9717-12813bfff9fa;
 Wed, 02 Oct 2019 13:44:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q9so951200wrm.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 06:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1q7vCYuENc8fUlbYZ7XOsG2wPdRX1hllJ2xaU/uZe2U=;
 b=jSoSW6qpXnYl/emQtjPLM48OACdnyfoFvu3OB1TsZVXUlr7mlWX6MlKf0qLUEeV+6j
 DfAed3t+W514hPLvK/+jsYiM2NeQ/CqUFqWgL10E9Zhb/ehGbhmb3uCe7DvzGR++j9eF
 THEqnAbo5yXhCiBViCa1U/el6VbOpWnnEKz6VQVzetB6NQ+dj4PokX5aB+hYQDPfuqDj
 +aZVQsYXr/o8P2CDMrjjA8a4wMXnPJsSpSIScl6UTGnMPREZgIGNGRxNz5cAQnMfez7d
 Xe7DPAkquVnz0/anPQWZ5yCIyPJK1kmhXZ2quyEhia5saOSX+SUfCfRYmOUgbgFG949X
 vbWA==
X-Gm-Message-State: APjAAAVmi9+ZrmN+QhuITR9cM2V6IkZvBtx+lupV0l0715/jC/59QyYq
 +lGAHuyBDqq9H8wcvcidrbU=
X-Google-Smtp-Source: APXvYqxdPtgDUbkQ585S4Zg1IP49dTUjEUVRAyJv5TiL7s+DyKoam8TqlAhE0Ng8CeOiAQctw16OxQ==
X-Received: by 2002:a5d:670c:: with SMTP id o12mr2923733wru.103.1570023849831; 
 Wed, 02 Oct 2019 06:44:09 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id w125sm12551983wmg.32.2019.10.02.06.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 06:44:08 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:44:07 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191002134407.msokdpr3mg3nx3is@debian>
References: <20191002134156.31073-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002134156.31073-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] docs: remove tmem references from man pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDM6NDE6NTZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgIlRPIEJFIERPQ1VNRU5URUQiIHNlY3Rpb24gb2YgdGhlIHhsIG1hbiBwYWdl
IHN0aWxsIHJlZmVyZW5jZXMKPiB0bWVtLiBTbyBkb2VzIHRoZSB4bC5jb25mIG1hbiBwYWdlLiBS
ZW1vdmUgdGhlIHJlZmVyZW5jZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKTmljZSBjYXRjaC4gVGhhbmtzLgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
