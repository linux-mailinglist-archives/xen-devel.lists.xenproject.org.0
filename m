Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1F49550C6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 20:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778736.1188745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1dg-0000mv-Q2; Fri, 16 Aug 2024 18:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778736.1188745; Fri, 16 Aug 2024 18:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1dg-0000lO-N7; Fri, 16 Aug 2024 18:25:28 +0000
Received: by outflank-mailman (input) for mailman id 778736;
 Fri, 16 Aug 2024 18:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sf1df-0000lI-D8
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 18:25:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e714b754-5bfc-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 20:25:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7761ECE1887;
 Fri, 16 Aug 2024 18:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7CEC32782;
 Fri, 16 Aug 2024 18:25:18 +0000 (UTC)
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
X-Inumbo-ID: e714b754-5bfc-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723832718;
	bh=X274vmehy+T0cLBkq9DlcymZt0NxKv91nDcKkuR2PyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JjdENcGzU45yijBpVOE9fv4Mt9HqoWwFsb2zgiN3QxPQcGLkxVwDLDfwh7Co+/jn8
	 ku67G7dyoaCIjXRR+QIoi3APK5fvcE4CS5BGpXSF5+2cYaf5Emmfg6qH8+jyJgX4OJ
	 lXwfiA6vwWr+/if3zA2z4SZj1aCWJ/XFYF65bg4IFxWI0ERBs+/zr5mxLRYCAgUoNk
	 aTq2Ivqz1+n0SbHWyltAmGqVTrp85MR9fxw1l/D7rpEdZ5i0hkXAloCGi8DPrEddxG
	 1Hdhf872R2etpPxH8zp+z4mNWKVcPqRZ3w/eSnyUFF3SRTg/NKVyuYp9/ftwB24Ert
	 n8bBwjdeOJ6+g==
Date: Fri, 16 Aug 2024 11:25:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Kelly Choi <kelly.choi@cloud.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org
Subject: Re: Xen Project statistics help
In-Reply-To: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop>
References: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-859555006-1723832719=:298534"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-859555006-1723832719=:298534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Kelly,

xen.biterg.io was created by a company called Bitergia. Bitergia was
later contracted by the Linux Foundation to create a generic dashboard
for all their Open Source projects. Getting access to the Linux
Foundation dashboard is the best way to go (if it comes to no cost to
our project).

I have used scripts like these in the past to get some data out of a
release. You can copy/paste the output to an Excel datasheet to do
further calculations there.

# List of contributors by name (using the commit "Author" tag) for the
# 4.19 release. One name per commit.
git log 4.18.0-rc4...4.19.0-rc4 --format='%aN' | sort | uniq -c | sort -rn

# List of reviewers (using the Reviewed-by and Acked-by tags) for the
# 4.19 release. One name per review.
git log 4.18.0-rc4...4.19.0-rc4 --pretty=format:%b | grep -E "Reviewed-by|Acked-by" | sed -E 's/.*(Reviewed-by|Acked-by):\s*(.*)\s*<.*/\2/' | sort | uniq -c | sort -rn

# Sorted list of commits by company (using email address in the commit
# "Author" tag) for the 4.19 release.
git log 4.18.0-rc4...4.19.0-rc4 --pretty=format:%b | grep "Signed-off-by" | awk -F '<|@|>' '{print $3}' | sort | uniq -c | sort -rn

You need to run these commands on xen.git on a Linux machine.

Cheers,

Stefano

On Fri, 16 Aug 2024, Kelly Choi wrote:
> Hi all,
> I'm looking for a way to gather some statistics around our project, that would help monitor the health of the community and show our
> progress so far. 
> 
> AFAIK, there used to be a dashboard on https://xen.biterg.io/ (https://wiki.xenproject.org/wiki/Code_Review_Dashboard) which no longer
> exists. 
> 
> Examples of monthly data required:
>  *  Number of commits, reviews, authors, etc per month/release
>  *  Number of contributions per individual and company (we'd need to do some mapping of names for those with multiple email addresses)
>  *  Data to help identify imbalances between reviewers and contributors
>  *  Number of emails on xen-devel
> Linux Foundation does have a dashboard that we're not set up on yet, but I'm looking at possibilities to see if we can.
> 
> If there is an automated process or script that someone has or would be able to create, that would be hugely beneficial. Open to other
> ideas here too. 
> 
> Many thanks,
> Kelly Choi
> 
> Community Manager
> Xen Project 
> 
> 
--8323329-859555006-1723832719=:298534--

