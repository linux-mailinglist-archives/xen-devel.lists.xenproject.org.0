Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B3489797
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 12:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255298.437449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6sxM-00008e-OO; Mon, 10 Jan 2022 11:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255298.437449; Mon, 10 Jan 2022 11:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6sxM-00006a-L2; Mon, 10 Jan 2022 11:35:20 +0000
Received: by outflank-mailman (input) for mailman id 255298;
 Mon, 10 Jan 2022 11:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RiBW=R2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n6sxK-00006K-W9
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 11:35:19 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6145abf4-7209-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 12:35:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50276)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n6sxG-000Iau-pO (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 10 Jan 2022 11:35:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 80DD81FBEE;
 Mon, 10 Jan 2022 11:35:14 +0000 (GMT)
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
X-Inumbo-ID: 6145abf4-7209-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <25899482-4b0c-5fb4-5b02-226f75d1e5a6@srcf.net>
Date: Mon, 10 Jan 2022 11:35:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] mini-os: remove device specific struct file members
Content-Language: en-GB
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20220107104706.9859-1-jgross@suse.com>
 <20220109011603.bymferaebanvvmud@begin>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220109011603.bymferaebanvvmud@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2022 01:16, Samuel Thibault wrote:
> Juergen Gross, le ven. 07 janv. 2022 11:47:04 +0100, a ecrit:
>> can only be applied after the Xen libraries have stopped using the
>> related union members.
> Ah, ok :) Was that submitted somewhere?

https://lore.kernel.org/xen-devel/20220107103544.9271-1-jgross@suse.com/T/#u

~Andrew

