Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C34749D6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246991.426000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBmH-0004zS-BX; Tue, 14 Dec 2021 17:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246991.426000; Tue, 14 Dec 2021 17:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBmH-0004xe-8H; Tue, 14 Dec 2021 17:39:49 +0000
Received: by outflank-mailman (input) for mailman id 246991;
 Tue, 14 Dec 2021 17:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C1I2=Q7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxBmF-0004xW-7a
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:39:47 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d347d94e-5d04-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 18:39:45 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44136)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxBlz-000BnM-1a (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 14 Dec 2021 17:39:31 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 8AFF42056A;
 Tue, 14 Dec 2021 17:39:30 +0000 (GMT)
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
X-Inumbo-ID: d347d94e-5d04-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a7f0b1b0-cf4c-5ff1-cfd1-a2df9076ba46@srcf.net>
Date: Tue, 14 Dec 2021 17:39:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 02/47] xen: move include/asm-* to
 arch/*/include/asm
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-3-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211125134006.1076646-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2021 13:39, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
>
> Whenever a comment refer to an "asm" headers, this patch avoid
> spelling the arch when not needed to avoid some code churn.
>
> One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
> VT FOR X86 (VT-X)"
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

