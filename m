Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB635B0BC7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 19:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402123.644127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVzAm-0004I2-9o; Wed, 07 Sep 2022 17:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402123.644127; Wed, 07 Sep 2022 17:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVzAm-0004FL-6G; Wed, 07 Sep 2022 17:49:12 +0000
Received: by outflank-mailman (input) for mailman id 402123;
 Wed, 07 Sep 2022 17:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTO0=ZK=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1oVzAl-0004FF-IG
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 17:49:11 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fd8d22e-2ed5-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 19:49:10 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVzAh-0003Fg-LE; Wed, 07 Sep 2022 17:49:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVzAh-0004LN-D5; Wed, 07 Sep 2022 17:49:07 +0000
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
X-Inumbo-ID: 5fd8d22e-2ed5-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wtSm/UAPQbJv1pnpeWpxJbmKYxz2eNu5lK1OFxZBJ88=; b=Jkd5q01fFbUzLz6RoRVayg9B8m
	Tyy55FwWveLl3/OaB/dV1CdFzaTBnrK1m60rmi6vXKnE/OuF8ZusZDjIEZAEOdIfRN+Grwkg/j56G
	P1lt/IhpXPzNjIMUQMpLbxVJIRPEAYxZ2uCKOYRiYRR8f0ydof6+LLgiX0A1u2mSUysQ=;
Message-ID: <402d1abf-85f6-b13a-8a6e-80cb1792c2ee@xen.org>
Date: Wed, 7 Sep 2022 18:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
 <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

Jumping in the conversation.

On 07/09/2022 13:32, Viresh Kumar wrote:
> I don't have much knowledge of the Xen code and wanted this code for I2C and
> GPIO to be tested on Xen for the work we are doing around hypervisor agnostic
> backends [1].
> 
> I started looking for a simple device's implementation and began by (blindly)
> copying code from Keyboard device and so much of wasted code in here, which
> isn't really required.
> 
> On 06-09-22, 17:15, Anthony PERARD wrote:
>> On Mon, Aug 22, 2022 at 02:45:13PM +0530, Viresh Kumar wrote:
>>> An example of domain configuration for Virtio I2c:
>>> i2c = [ "" ]
>>
>> Is this doing something meaningful (with the whole series applied)?
> 
> If I am not wrong, this is required by parse_i2c_list()'s implementation.
> Without this I don't get the I2C device populated in the guest.
> 
> Is there another way to achieve it ?

Looking at this series, you will add ~250 lines (assuming your new 
patch) for the i2c and then likely the same amount for GPIO.

I am assuming that for every new virtio device (e.g. gps, sound, 
display...), we would also need to 250 lines of code. I am worry that we 
will end up to bloat libxl with duplicated code and or for device that 
are barely used.

I think it would be better to find a generic way to add new virtio 
device without adding code (very limited) in libxl. The advantage is 
someone will be able to create a new virtio device with less effort.

The approach I can think of is something along the lines:

virtio = ["type=<compatible>,transport=<transport>,..."]

where the compatible is the one that should be written in the DT and 
transport is mmio or pci. the [...] refers to specific parameters that 
would need to be passed to the backend (it is not clear how you provide 
them today?).

AFAICT, the GPIO one may need some tweaking because it requires specific 
properties. I think it would be more acceptable as this will be only a 
few lines (compare to 250 lines today).

Cheers,

-- 
Julien Grall

