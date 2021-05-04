Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E781372F29
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122652.231372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz9U-0005fn-V1; Tue, 04 May 2021 17:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122652.231372; Tue, 04 May 2021 17:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz9U-0005fO-Qu; Tue, 04 May 2021 17:48:08 +0000
Received: by outflank-mailman (input) for mailman id 122652;
 Tue, 04 May 2021 17:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldz9T-0005fA-DH
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:48:07 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d37579af-6b4c-41d4-ab2d-24f9ce1e8629;
 Tue, 04 May 2021 17:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id A25F91D9;
 Tue,  4 May 2021 19:48:05 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0HDWytAod5G; Tue,  4 May 2021 19:48:05 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DC73F194;
 Tue,  4 May 2021 19:48:04 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldz9Q-00GPoq-0s; Tue, 04 May 2021 19:48:04 +0200
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
X-Inumbo-ID: d37579af-6b4c-41d4-ab2d-24f9ce1e8629
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 19:48:03 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 4/9] vtpmmgr: Allow specifying srk_handle for TPM2
Message-ID: <20210504174803.p6wonh4qeqbmk2gq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-5-jandryuk@gmail.com>
 <20210504131328.wtoe4swz7nyzyuts@begin>
 <CAKf6xpsVJQ7LeV63hb8Sm_6gq+xjCwMDOkuMKNsn+-vqHF=9rQ@mail.gmail.com>
 <20210504170719.mnu3e3av7klsvyuq@begin>
 <CAKf6xpvP2TCqZwew8_ykYEcXfsmhsef2TefcV++h2u4BsWVo2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xpvP2TCqZwew8_ykYEcXfsmhsef2TefcV++h2u4BsWVo2A@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: A25F91D9
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 13:27:36 -0400, a ecrit:
> On Tue, May 4, 2021 at 1:07 PM Samuel Thibault
> <samuel.thibault@ens-lyon.org> wrote:
> >
> > Jason Andryuk, le mar. 04 mai 2021 13:04:47 -0400, a ecrit:
> > > owner_auth & srk_auth don't check :, but then they don't skip : or =
> > > when passing the string to parse_auth_string.  So they can't work
> > > properly?
> >
> > They happen to "work" just because there is no other parameter prefixed
> > the same.
> 
> parse_auth_string fails on the ":".
> 
> Just tested "owner_auth:well-known"

owner_auth happens to have the proper size, but srk_auth doesn't.

Samuel

