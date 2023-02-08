Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995A268E9DE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 09:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491625.760823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfnK-0002BM-It; Wed, 08 Feb 2023 08:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491625.760823; Wed, 08 Feb 2023 08:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfnK-00028h-Fw; Wed, 08 Feb 2023 08:27:10 +0000
Received: by outflank-mailman (input) for mailman id 491625;
 Wed, 08 Feb 2023 08:27:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPfnJ-00028b-Bp
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 08:27:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPfmt-0003vY-Lk; Wed, 08 Feb 2023 08:26:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.11.45]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPfmt-0008AQ-Ba; Wed, 08 Feb 2023 08:26:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=fu3vjw3MBtxFiRXEBBDdtqVNw4Gwhku2X6kE7vLNfzc=; b=R+259Va7K4AWf70njZ5YztAEQP
	NY9JEu8kS5IAiX4KHlmiX9qPzb+w7nzAk6AvEWO3s193jG6+sqtg2Pw44Osu/AeH2ULHp4NNMgxpY
	/zdFgacUIwWlkjrrcJXCtJqOIlB/IwN01DivizEdIXnv6jrYiKZx3eZ4C8otcIP8fY8Y=;
Message-ID: <1770bab7-3e25-d611-1d3f-58c02a2f7492@xen.org>
Date: Wed, 8 Feb 2023 08:26:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
 <3f3c358e-02b9-94e0-0b06-8a96ff92519b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f3c358e-02b9-94e0-0b06-8a96ff92519b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/02/2023 07:40, Jan Beulich wrote:
> On 08.02.2023 05:51, Demi Marie Obenour wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -11,7 +11,7 @@
>>    * more details.
>>    *
>>    * You should have received a copy of the GNU General Public License along with
>> - * this program; If not, see <http://www.gnu.org/licenses/>.
>> + * this program; If not, see <https://www.gnu.org/licenses/>.
>>    */
>>   
>>   #include <xen/sched.h>
> 
> At the example of this file: While the above matches $subject, ...
> 
>> @@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
>>            * Device [8086:2fc0]
>>            * Erratum HSE43
>>            * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
>> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
>> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
>>            */
>>           { PCI_VENDOR_ID_INTEL, 0x2fc0 },
>>           /*
>>            * Devices [8086:6f60,6fa0,6fc0]
>>            * Errata BDF2 / BDX2
>>            * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
>> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
>> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
>>           */
>>           { PCI_VENDOR_ID_INTEL, 0x6f60 },
>>           { PCI_VENDOR_ID_INTEL, 0x6fa0 },
> 
> ... this doesn't (and would rather belong in the earlier patch).
> 
> As to $subject: Wouldn't it be more logical to replace the license boiler
> plates by SPDX headers instead? This was done to some degree on Arm
> already, but I haven't gone check why it was done incompletely there.

Skimming through xen-devel, it sounds like it was most likely a lack of 
time. I think it would be a good idea here to switch to SPDX.

That said, I can appreciate that Demi may not want to take on that 
works. So I would be happy to give a try if no-one else wants to.

Cheers,

-- 
Julien Grall

