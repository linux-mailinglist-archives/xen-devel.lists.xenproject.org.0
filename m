Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B151E3F2D
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 12:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdtPN-0006Gk-U6; Wed, 27 May 2020 10:35:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0l=7J=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdtPM-0006Gf-7O
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 10:35:36 +0000
X-Inumbo-ID: cc04dc8e-a005-11ea-a714-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc04dc8e-a005-11ea-a714-12813bfff9fa;
 Wed, 27 May 2020 10:35:35 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:57910
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdtPK-000EiZ-JN (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 27 May 2020 11:35:34 +0100
Subject: Re: patches for Xen 4.13
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <20200527101752.GA3094@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8019c14-6ec0-7037-5202-5b2c1db76f89@citrix.com>
Date: Wed, 27 May 2020 11:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527101752.GA3094@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/05/2020 11:17, Manuel Bouyer wrote:
> Hello,
> I got Xen 4.13 working with NetBSD. Now I'd like to get the patches back
> in the Xen sources. What is the best way to submit the patches ?

Ideally, git-send-email to this list, from a branch based on
xen.git#staging.

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches

~Andrew

