Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37A1F3699
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 11:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiaD1-0007Pp-Tn; Tue, 09 Jun 2020 09:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jiaD1-0007Pk-7Q
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:06:15 +0000
X-Inumbo-ID: 77cd66a7-aa30-11ea-b2f6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77cd66a7-aa30-11ea-b2f6-12813bfff9fa;
 Tue, 09 Jun 2020 09:06:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42A2CAD4A;
 Tue,  9 Jun 2020 09:06:16 +0000 (UTC)
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
To: paul@xen.org, 'Olaf Hering' <olaf@aepfle.de>,
 'Paul Durrant' <xadimgnik@gmail.com>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609110016.16a52277.olaf@aepfle.de>
 <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e8976262-4406-eaca-6381-0a8c017b4727@suse.com>
Date: Tue, 9 Jun 2020 11:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.06.20 11:04, Paul Durrant wrote:
>> -----Original Message-----
>> From: Olaf Hering <olaf@aepfle.de>
>> Sent: 09 June 2020 10:00
>> To: Paul Durrant <xadimgnik@gmail.com>
>> Cc: paul@xen.org; xen-devel@lists.xenproject.org; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Tim
>> Deegan' <tim@xen.org>; 'Wei Liu' <wl@xen.org>
>> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
>>
>> Am Tue, 9 Jun 2020 09:55:52 +0100
>> schrieb Paul Durrant <xadimgnik@gmail.com>:
>>
>>> Is it not sufficient to just change the declaration of payload in kdd_pkt from [0] to []?
>>
>> AFAIR this lead to compile errors.
>>
> 
> OOI which compiler (might be worth mentioning in the commit comment too, for reference)? I'm not seeing a problem.

We don't use array[] in public headers, but AFAIK using them internally
is fine.


Juergen


