Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CB339194
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97207.184533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjuQ-0001Ci-L3; Fri, 12 Mar 2021 15:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97207.184533; Fri, 12 Mar 2021 15:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjuQ-0001CJ-Hr; Fri, 12 Mar 2021 15:41:02 +0000
Received: by outflank-mailman (input) for mailman id 97207;
 Fri, 12 Mar 2021 15:41:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wDky=IK=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lKjuP-0001CE-St
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:41:02 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51fb6761-7839-4c23-8cda-0a20af345df6;
 Fri, 12 Mar 2021 15:41:00 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1615563655040773.0532958690712;
 Fri, 12 Mar 2021 07:40:55 -0800 (PST)
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
X-Inumbo-ID: 51fb6761-7839-4c23-8cda-0a20af345df6
ARC-Seal: i=1; a=rsa-sha256; t=1615563658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=daQN2bBCxHYHiko7j9A6jSW+rksJv91VxZ1VZAEyYwMoeWMIi4En+znZ8Gi4YdbnYE4j/PO2PLgOPe1YoGm9zqywnEQrC5UBmlSHiuCAVJfHbgiRdPb5LniMUs0CVybl1GJQ7mzmMmB5Ic1NA/0sNy+w3PJXrG0r/z7waWSbxCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1615563658; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9sc5kpJKzRcEJczYNIdpfGixV50ZE7JUprDPzxxFia8=; 
	b=Ppl1aBuKtyAUeC4DrMc2Bv/P8I3yGAbWkSYvCCV/FsphFRenGPatU5U4qNN9a7wxCFi0Quxjiusia6YqgjHDX+wqYp20MWRSMv7QMWIpMUsrqwz3/toPpQat+grKwxGwZoaEuiG4GLCv86pnzRIhlXyI3hEIP7hYzW18EN2+ft8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615563658;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9sc5kpJKzRcEJczYNIdpfGixV50ZE7JUprDPzxxFia8=;
	b=q2is3E3XuWISnpp35eCAmWuXRumHGGhwPNSUieNG08SbHH8ZSLwEAzcWK3rd+U1c
	dIxd9jgQ0XzJleyr1onyUdUFH7+moW3L+ppNQtFFX7zVNaRN47CImjtIYpVNIoW7vfV
	fJpiFjRmz1M9dG7QrdJuIi/asL459LnMMN+AbZcc=
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <23821364-c8a2-2fac-97c7-c4f71c9f6424@apertussolutions.com>
Date: Fri, 12 Mar 2021 10:40:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/11/21 1:34 PM, Bob Eshleman wrote:
> Hey all,
> 
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
> 
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
> 
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
> 
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.
> 
> Best regards.
> 
> ---
> 
> Bobby Eshleman
> SE at Vates SAS
> 

Yes, please count me in since it will definitely overlap with the work I
am doing under DomB/Hyperlaunch as well as planned work under the
TrenchBoot project.

V/r,
Daniel P. Smith

