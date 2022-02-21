Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AA4BD95D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276190.472290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6gk-0007pv-Gn; Mon, 21 Feb 2022 11:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276190.472290; Mon, 21 Feb 2022 11:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6gk-0007n9-CO; Mon, 21 Feb 2022 11:17:06 +0000
Received: by outflank-mailman (input) for mailman id 276190;
 Mon, 21 Feb 2022 11:17:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jq6=TE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nM6gj-0007n3-32
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 11:17:05 +0000
Received: from ppsw-30.csi.cam.ac.uk (ppsw-30.csi.cam.ac.uk [131.111.8.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5a71fe-9307-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 12:17:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:58164)
 by ppsw-30.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nM6gg-000trs-eP (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 21 Feb 2022 11:17:02 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 42EAB1FB2D;
 Mon, 21 Feb 2022 11:17:02 +0000 (GMT)
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
X-Inumbo-ID: cb5a71fe-9307-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <13166754-a4c7-b81b-2300-aab8c12a22d3@srcf.net>
Date: Mon, 21 Feb 2022 11:17:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] coverity: disable flight from crontab
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
References: <20220221094800.54169-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220221094800.54169-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2022 09:48, Roger Pau Monne wrote:
> We are currently doing the Coverity Scans using a github workflow.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

