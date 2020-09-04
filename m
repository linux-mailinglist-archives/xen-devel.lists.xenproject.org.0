Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A321F25DDB7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 17:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEDe4-000072-Rh; Fri, 04 Sep 2020 15:28:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kEDe4-00006c-0r
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 15:28:56 +0000
X-Inumbo-ID: 6dc497f7-abe6-483b-8132-8e1de44611e0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dc497f7-abe6-483b-8132-8e1de44611e0;
 Fri, 04 Sep 2020 15:28:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77F81B01F;
 Fri,  4 Sep 2020 15:28:53 +0000 (UTC)
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
 <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
 <17fb8575-8a05-9c31-b777-292b66b0e7e1@citrix.com>
 <07811cc2-2780-b807-7669-80ae20fd9263@suse.com>
 <885f0f9b-14d1-3246-1d5b-a60356fb42f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1d7655a-5aed-2930-7141-0a360da48ed4@suse.com>
Date: Fri, 4 Sep 2020 17:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <885f0f9b-14d1-3246-1d5b-a60356fb42f2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 04.09.2020 16:47, Igor Druzhinin wrote:
> The referenced commit is not unrelated - it's the commit introducing the access
> causing kexec transition to fail. But I can add another one pointing to the mapping
> of ACPI tables that was supposed to fix the failure caused by the first one.

Oh, okay, I finally understand. The purpose of the change is
unrelated, it's what get_acpi_srat_table() does which causes the
problem. Hopefully this will be more obvious with the other commit
also referenced. How about additionally changing "which is now a
requirement after" to "which is now a requirement in order for ...
to work" or "which is a prerequisite for ... actually functioning"
or some such?

Jan

