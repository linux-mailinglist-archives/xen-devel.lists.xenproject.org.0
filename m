Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9C35FE4E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 01:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110855.211795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWohF-0001sb-Eu; Wed, 14 Apr 2021 23:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110855.211795; Wed, 14 Apr 2021 23:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWohF-0001sC-Bl; Wed, 14 Apr 2021 23:13:21 +0000
Received: by outflank-mailman (input) for mailman id 110855;
 Wed, 14 Apr 2021 23:13:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCy3=JL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWohD-0001s7-Js
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 23:13:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11b0f9ed-a171-41ff-a185-6cce697e2ac0;
 Wed, 14 Apr 2021 23:13:18 +0000 (UTC)
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
X-Inumbo-ID: 11b0f9ed-a171-41ff-a185-6cce697e2ac0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618441998;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MxiZcR8t5WTHKFr8BYaHpabUW3tVvLhrW1K0P7uJ9/o=;
  b=OQEVxmm5vT+ynuMlCVDfes6RPpRK4rxIrIGngv+iCLSCqRb3R4Yez8mj
   i2aK2ZoBWRcpDsmLKnf6g5w6LD8pUYuCrewOjvMO7ALNJmnvYH3NC5T6e
   apffzhcFj9QFhmT+6QsBYz5Q+7XgWF0Qu88VaueZ7vOHm9laxtr4hf8QP
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: knLixlc8nRJxkAmEDNh77KF1klhIQ49Ckr+d+0rhngnsodcw13vNLFEnDEgdAJ7tZV8HxGBv7E
 0Fg68cAt1bsOYcUMlrtfQuuV63aHI/dlcf31UqkGkUpLTm2C+1te2SMPrnctjEZDH4Xy8pwJK0
 BAMTMccWWlQIN25yB3ZZ/kGUuaRuVd4zSUpM5gd+la8i57DKtt6IzSW/EpEqdeAE6qc1uorw1k
 OvruIYNgkUbV7OIS2Sqg/VRl+HshkCJOoCNWphvPqFkyA6T4FFdojzG+l877Xg5AII9Ev1CcYx
 22Q=
X-SBRS: 5.2
X-MesageID: 41464570
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iJ0gA6Puy37AwcBcT5Dx55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kadUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8XacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKirwPLe
 8GNrC42N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2CfTv8dEe+ZW39EqsKIWjApvfMkfwIzdDvXKZN4Io5mZ
 zHXl8dnWkue3j2AcnL+JFQ6BjCTEi0QDyF8LAe27FJ/pnHAJb7OyyKT14j1+G6pe8EP8HdU/
 GvfLpLHv7KNwLVaMR09jy7f6MXBWgVUcUTtNp+cUmJuNj3JorjsfGeWOrPJYDqDS0vVgrEcz
 g+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf0PMUzKQLK41QoikYgVm0/aiwWHl/m51zWH
 E7DKLsk6u9q2Xz133P9X9VNh1UCVsQwLiIaQIMmSY6d2fPNZoTsdSWfm5fmFGdIAVkcs/QGA
 lD43B++ae9KY2s1TkvYujXdF6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHtGwFqnx1p7E
 NOchUNSEOaNj6Gs9TksLUkQMXkM/VsigaiJsBZ7VjFs1+HmM0pTnwHGxi0UcCWhg4qbyFOhk
 J49pIehLboo0frFUIPxMADdHFcYmWeB7xLSC6fYp9Pp7ztcAZsCVuRiSeikBE1cGry/0A0jm
 jsRBfkIM3jMx54gDR1w6zq+FR7eiG4c1hrYn53i4F7CF/Lo21+y+ONe6q13VaAc1dq+JBuDB
 j1JR8pZi9+zdG+0xCY3AyPEngr3b0CFO3QBrZLScCf5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku+NzXjEd4k3ASTu1coMCR5s2MfjPvtwRHphVLIhEIXML73GhBLVrsbK9aT4yzYXP6Oyo
 x+ls9wku2qMGn9A+T2gZ3/XnpmEFf0rmG3Re1z9swRkqI2qbdpH57UFRHPz2pK2R0iLMHy0G
 MSKZ4Ll4zpC8tKRYg1fSkcw38C0PKoB2EvuhbtAuA/cUo25kWrde+h0v7tk/4XHkaFpAHMIl
 GR/C1WwufdU0K4pMonIpN1BV4TVVM153tj9t6TboH8CA2lcOdY4VqxW0XNBoN1eeygGb8KqA
 x97MzNt+iLdzDg0AS4h0o2Hot+t0KmS9i1GgSCBKph9MG7I02Fhu+P7NSohDn6DRu9ZEJwv/
 wLSWUgKuBCgCIllos5z2ybTbH2uFsslx9m2g5c/2SdkbSO0SP8BkFJMQrQn5VQU31yCxGz/L
 r42Nnd8m/87jhD0YTED2FKcLh1aoMtcrQ=
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41464570"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBSea5Jzpj3qThF1M2CfA+Vj4cqE5xToc4VonFDftZlVh8Kc7sqS4UstUH4BsIw4lkn1Q3/UrNFp8WkDjA9KRgQmTxhINIgOyKjz+vqecs99injWVHuHE+1+dnQdA/Vb/DNJE3PGb7ZUAJiWt6yeoFgMlOiBJqYAAzDdu7sXKD0ne3FA0aV25i5fcLazfMHK7lEYN9vDQPvtBj2jZ+DOGaNNys1SlLftrZr1cZ+r05JVmd8PDJF1LZS60c2mD7cD5Ky9Ex88u9DL3B48BdKZ4o1ZR4qj+0zyNfA4m3w8IxwAN8rniFBysCt185k2LqxhynXuaE5qfb0N6GVZ02rDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UGsZZOB/YkxY1+sk5Tn33PUXOo/nFfeTk9yWYl3k5g=;
 b=alucKAD5PJbcvX/O3c7YdOIXfdaeiwzw0xC7MArEOs12cgeTCYVwuDZ5H25s9jGyxKDuX/39V0umj4Q0ekADYYy2cfdRDVqeuA17AfhAvBcyj8wnIY9iHW+yT/uZBjhsHbJWvbFZMFJpfk/UnkqfhRByrVU5Ja2tlyEqD6wmUJpmeEZKlC0oqAaVzvcnxriURK/YXKqgbWYsyxQk9iCYamDBov1r00KlcvmbzZemZn8Y5S+QR9yFSYoagiAwmeNOw5TtCBIVbKYfeH8+5GpW6AYzUfGS4VApFMQ9K6x74rjckCkN8Or73m5HYLiIZzXivkWyHefpQau/dWTP7Unogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UGsZZOB/YkxY1+sk5Tn33PUXOo/nFfeTk9yWYl3k5g=;
 b=XKU4UtAITwBXS9lynOVcVOWSAxtxah4SMLSVWGQTwYb/hn3nO0/wrbGZ9R2inbX6ILufI/pk7kGsFb0KnYr/0nM38R3dBrr3TnLF/csBX5ELVNIkhlzt5GMKc1TIHTZvp3dwYz0JD+ccRuXZZoPF9L9Tz+VUrsLOh2z3L7FRQLE=
Subject: Re: [PATCH v4 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
 <871c259b-487e-4c67-e648-b1aefef55df3@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <45ab2093-f140-1b91-f683-dc0ca17159c5@citrix.com>
Date: Thu, 15 Apr 2021 00:13:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <871c259b-487e-4c67-e648-b1aefef55df3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::30) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67447c27-24e1-4adf-526a-08d8ff9ae19c
X-MS-TrafficTypeDiagnostic: BN7PR03MB4354:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB43543B8FF929D721CF89E380E44E9@BN7PR03MB4354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kR8AhP5cVyThWuVcITJkYEou6J/kTvCf159kmY/IXIAFY5e0qO95JJ8ioMQqJVGtIeX2UKXEN7VP6jWQz88+z5FD0qx8zJbZp089qZZO9LRiZT+SpsqsksGva8IGRrgAEZAvn6GaoO4ZWZu1pe7hrf2soLj3Nx64oXofc0UztuwFPS25qHlvVzdJt9JRYqIAfGxHaaLo6FO+ncEcCKhXpgvk8GDR01Y6GT7EOJM1NV2BM0raWrMpfiBU2AWvIMPVrVZS2nRTsVd/U/n9Uck0qap5X2bqYJlLmOfTuKDd1d3tmV2w6nAFoGdGya9iu7PUTHVBNcduYujPDMxtrn5NmPT3AzpyHWlFdTuWu6u3LgSNNm+EZrJGd+lzchGwKQssjFzrrBttQ6dKmEHkBchuSB2OBV0klUtXNB7VdmKvF3HR6854lXx9Oiqhcy1ceqwZPPHWszubZueeXl4mttHvEabBrWVj4w86ALZEML2ju5z3mAtE6ZFIgNbDt43gfMybnqdhx7ttxZExKduUSdR+N+UbSYLgODq6KPatJMhw4U6jyoJNnvChwRR1bOZVItOxINzj1+ZUBeXcwJuhhcqGzAhOasGpHu1+fIvN59WNXoP4mFDoLn9qeaqHO9I53Urcl0xS7bWNJr37dBN5JghB1k8FcMsfm4PAhi+QbBk9D6y99bCLkfy6M95Nhk2adFbt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(26005)(2616005)(956004)(53546011)(66476007)(6916009)(5660300002)(16576012)(38100700002)(44832011)(6666004)(186003)(86362001)(31696002)(36756003)(478600001)(31686004)(66556008)(316002)(2906002)(8676002)(66946007)(16526019)(6486002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V215TjU3TEV1aHBmc1hnREoxdERGRy9CN3ZCcWs5VVZSR2NyZmNDM3d3RE5R?=
 =?utf-8?B?dFJuVFA3NnlELytnbWp6aUk0WFNSSGdCZitmcTE3UEZLd1JVcGFJY1dkcFVa?=
 =?utf-8?B?bHZlNEFCY0haQUxEalhNSUJIQ0Vkc0dPWUlwcUx6ZEZVdXc1VkEvaGttRXBJ?=
 =?utf-8?B?RGhNVUN4eGFaMEs1bHdjcXRPcjVCV2dMd3h2ZUVjd3NkWmpZcE51K1FxQ05V?=
 =?utf-8?B?TmhqWFE2T1U0eEpZOHZLL2VZc25hNGZERlI4d3dUOVFWRDVrSklpRlU2RElt?=
 =?utf-8?B?blpISnZpVDV1MnBCQmhkUVVJZnFWRmg3bHBJQ2ZIYTl4NmRERy9qbGtDalFn?=
 =?utf-8?B?T3VQWnQrUEhlQnRRTEd1VzBKeWpaYUlTOG1PQTVySUsyZkFPODRiOE53S2Ex?=
 =?utf-8?B?WXBvQk9LbHJlSXlJd0ExMmRlZFVzaFFXYStsc1JqN0dxTTZ5TFFiOVN4Wno3?=
 =?utf-8?B?N3hLUVVIeCtubjFnN0ZrbjdTbUU1THR0N1d2eGNhZm5vK0tkZHZ5aGlzSVAw?=
 =?utf-8?B?QS9oUEFtemhYMmRqbmEzTzFETUVsczhrRVEyOU81b0pPa2J0akNHcVpIeHdH?=
 =?utf-8?B?d25OODc1RnVFVUM5a05pb1ZoVVNUeU5CSWJ6NnV5UGo2dW1qR0R1cU1SRldh?=
 =?utf-8?B?Mmg2UG0zcjRodmRnVGc0SlBNbDRhTjY5Z2hNUmUrdnhlNDJod3BNQTRkRTFk?=
 =?utf-8?B?TkV0R3hrWHdDeEQ0ZnVLNEwvNjVBcjk3ekFqU3dHNmYvdmQvaVhSQlQ5elgr?=
 =?utf-8?B?Y0p2MndFVVlNa0lZQmo2c095cHBtOURqZkJ4UFAyQ3BITFFWVTBPWDdORFpk?=
 =?utf-8?B?U2l2V0tVQ254RU1tRDluLytWZlVyRG4yUUhYdkJuQTZHOHFlcm82YTJTRjNM?=
 =?utf-8?B?MjhpU2FJNFFRZWR1cG5udUt1YWRZQi9CRC9tMm9EbTRqamZQRTM2cXc3RlJC?=
 =?utf-8?B?VVhoMC9TSkxmU25HTkxqbmVNZFlKSEtkTTJwVGpYZ0Y2QUdKdFBSYWowZDgv?=
 =?utf-8?B?bHp3UmZ6aHRieEhFMElxcnlkRCtZR2N3dFFNM0g3K3QxZ2tBNkVBbkxsQmlU?=
 =?utf-8?B?WDFQUXU4amZ1RmVYcHBkVjh6RFlBL0grYW1pL0YyZVg1ZHJVNjcwNkdaQmRa?=
 =?utf-8?B?T3VPZHU2cFdJMitQMUk5U0tZYW1oYUg2WVpFTzVwS1JCQ09iK0s1d1hLV216?=
 =?utf-8?B?KzloaEY0YndLaDJHRlNXNHdZd0doUExPaDRod2l5Y0U4aHMrdEN4eGhXSjM5?=
 =?utf-8?B?Rk5mdDFFNEpUbE5iTTZpNi95ei9GOS9weWowVDYwM29yWnpHdjdJRnVUejEr?=
 =?utf-8?B?Tjd3T2o2WjhKY3B4c2h3ME12TUF4bEZadHpBTUJQd0NkcTFaN21CbGVhZUNq?=
 =?utf-8?B?UjI3VUxOcytGeEZxQVRQY3d5WWpYQXM1MFNVSFUyN3FqVU9zbGlRSjEvQWlP?=
 =?utf-8?B?dVE0anhjZk14c2l5Q0wwd1IzOXpNNE1idlpSUEgwWEN0bndTbzU4cVRMZjc2?=
 =?utf-8?B?UEpPUG5SZWd0dVRLeHpkYUFUQWJSUjFrakhWdG5BTkdKaGNYV1lWUzl5NEhX?=
 =?utf-8?B?Nks2MjdUV1ZTcERDcXVMeFprZ0ZLOE55a2hNTEM5aEYrcEJTSGV4eVU3YTQz?=
 =?utf-8?B?MEplNzFoOWxIWTN4dGpaS0tTejBtdkxMcmtnUE9ZTXFGQkp6Zm10Kzd2VFhQ?=
 =?utf-8?B?b1hUZWlicHA2bWx6RVU2VXZqSnIzcDIzaGFxaE0zVnJQVEhtZXY3UGh0ZXUx?=
 =?utf-8?Q?jeAdSaXMeYGxuy7lEdPTuAfft61obnAD4SzMc2m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67447c27-24e1-4adf-526a-08d8ff9ae19c
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 23:13:15.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gz6kot7IXVFX5Bv3UudBsbqyUf1IbUjn7/rU/cd8XK8GYKHqLaOfKj8UssyreTprnZ7NsDGqVMA35f7xNhJWGsytuDfZqgXW/aupyU16QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4354
X-OriginatorOrg: citrix.com

On 14/04/2021 12:41, Jan Beulich wrote:
> On 14.04.2021 06:40, Igor Druzhinin wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2915,14 +2915,16 @@ static const struct lbr_info {
>>   }, nh_lbr[] = {
>>       { MSR_IA32_LASTINTFROMIP,       1 },
>>       { MSR_IA32_LASTINTTOIP,         1 },
>> -    { MSR_C2_LASTBRANCH_TOS,        1 },
>> +    { MSR_NHL_LBR_SELECT,           1 },
>> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
>>       { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
>>       { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
>>       { 0, 0 }
>>   }, sk_lbr[] = {
>>       { MSR_IA32_LASTINTFROMIP,       1 },
>>       { MSR_IA32_LASTINTTOIP,         1 },
>> -    { MSR_SKL_LASTBRANCH_TOS,       1 },
>> +    { MSR_NHL_LBR_SELECT,           1 },
>> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
>>       { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
>>       { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
>>       { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
>> @@ -2937,6 +2939,7 @@ static const struct lbr_info {
>>   }, gm_lbr[] = {
>>       { MSR_IA32_LASTINTFROMIP,       1 },
>>       { MSR_IA32_LASTINTTOIP,         1 },
>> +    { MSR_GM_LBR_SELECT,            1 },
> 
> What about Xeon Phi, Silvermont, and Airmont?

Yes, you're right - forgot about those. Will need to shuffle arrays a 
little.

>> --- a/xen/include/asm-x86/msr-index.h
>> +++ b/xen/include/asm-x86/msr-index.h
>> @@ -606,14 +606,18 @@
>>   #define NUM_MSR_C2_LASTBRANCH_FROM_TO	4
>>   #define NUM_MSR_ATOM_LASTBRANCH_FROM_TO	8
>>   
>> +/* Nehalem (and newer) last-branch recording */
>> +#define MSR_NHL_LBR_SELECT		0x000001c8
>> +#define MSR_NHL_LASTBRANCH_TOS		0x000001c9
>> +
>>   /* Skylake (and newer) last-branch recording */
>> -#define MSR_SKL_LASTBRANCH_TOS		0x000001c9
>>   #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
>>   #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
>>   #define MSR_SKL_LASTBRANCH_0_INFO	0x00000dc0
>>   #define NUM_MSR_SKL_LASTBRANCH		32
>>   
>>   /* Goldmont last-branch recording */
>> +#define MSR_GM_LBR_SELECT		0x000001c8
>>   #define MSR_GM_LASTBRANCH_TOS		0x000001c9
> 
> Wouldn't it make sense to also re-use the NHL constants, like you
> do for Skylake?

I didn't really see GM to be derived from NHL so decided to split those. 
Looks cleaner to me that way otherwise might be a little confusing to 
use NHL constants in GM definitions. Given the change above - I will 
have to reshuffle those anyway in v5.

Igor


