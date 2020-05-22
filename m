Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0941DE4AB
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc56l-0005O6-AA; Fri, 22 May 2020 10:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc56j-0005NG-Dz
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:40:53 +0000
X-Inumbo-ID: b558f56a-9c18-11ea-b07b-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b558f56a-9c18-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 10:40:52 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:39184
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc56T-00116l-KE (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 11:40:37 +0100
Subject: Re: [PATCH v3 3/5] x86/HVM: move NOFLUSH handling out of hvm_set_cr3()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <b461a8a6-8a36-4cec-341a-7730f249b3c4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <573a92f9-32e3-3f08-d1fc-e8a8e6c177b0@citrix.com>
Date: Fri, 22 May 2020 11:40:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b461a8a6-8a36-4cec-341a-7730f249b3c4@suse.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/09/2019 16:25, Jan Beulich wrote:
> The bit is meaningful only for MOV-to-CR3 insns, not anywhere else, in
> particular not when loading nested guest state.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

