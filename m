Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4B36909C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116138.221716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtPm-0003fJ-WF; Fri, 23 Apr 2021 10:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116138.221716; Fri, 23 Apr 2021 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtPm-0003eg-SZ; Fri, 23 Apr 2021 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 116138;
 Fri, 23 Apr 2021 10:52:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/M9=JU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZtPl-0003cp-AI
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:52:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2efd8074-e7ea-4217-9fde-6c1325a4f878;
 Fri, 23 Apr 2021 10:52:00 +0000 (UTC)
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
X-Inumbo-ID: 2efd8074-e7ea-4217-9fde-6c1325a4f878
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619175120;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4iSoHmHAtYZFN3QQXJVZucLpLQFks+TOaE2HRAgxDHM=;
  b=e1jsqNGmI6/WB0et0WKRpJVDwEIy4rPaIt5zByNxyNAs6mDh6oaguSzy
   1f6ArvbHP/z1oIAPcVtUuhaLKerlBgAl8YcnKGmsn2KLQ/5VN9O6q2L0m
   eqx1sU/r81zvFwAdLINmbGaU8TUbj8Pbcjiu2hJEQeYjP2ehjknEQpUcn
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1pYgGeN4kT7jsSiQ2GuCWyCX8r8/+s13QqJ3m/8RRM8UUjHAb/sc+p6664Li6pqbWtL3sMh2y7
 MmPjrj9YWeNs/LUypAmJJxaoSDGJBj4JST6XhilarnpKLqX+Xkkgp2W4tF8DoDGAqx+nsVzoo0
 UGPOE4fF8n/NKq6IaOeFim0PDIo2y2zogICFYyc1bmTrjoCbq9p5cM66AV4XACEIgDBFM2mWLW
 jooBguxNNjr5/n+vrzUaQcyGXnTaeYwyQOl/hghcjA3qR6ZxMv9CxiyBT6E3jaRwN02XZgK/Na
 EMU=
X-SBRS: 5.2
X-MesageID: 43759817
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EYmOPaGCdhimO8dwpLqFYZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeLJwTXzcQY76
 tpdsFFY+HYJVJxgd/mpCyxFNg9yNeKmZrY/tv25V0Fd3AIV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsnPZvjTymZHgRc4CHFmAINtKz7eHjubDHRVo9BxAh4BSTlj/A0tLHOjWRwxt2aUIp/Z4M6m
 7A+jaZ2oyCtLWBxgbYxyvv6f1t6aPc4/9iIODJtcQPMDXrjW+TFclccpmPpio8ru3qyHtCqq
 irnz4aM85+62zccwiOyHODtTXI6zog52TvzlWVmxLY0LXEbQgnAMlMj58xSGq612Mcvcpx2K
 8O/2WVu4s/N2KloA3B5sPFXxwvq0ysoXBKq593s1VjV+IlCIN5nMg6xgd4AZ0AFCX15MQMC+
 91FvzR4/5QbBezc23ZlnMH+q3iYl0DWjO9BmQSsM2c1DZb2FpjyVED+cAZlnAcsLogVph/4f
 jeOKgArsABcuYmKYZGQMsRS8q+DWLABTjWNniJHFjhHKYbf1XAtoDw+7dwwO2xYpQHwN8Tlf
 36IRJlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8tab7QLbtLC2fWFEjm8atuJwkc47mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQuttTYSPNnuv7bqnR8sDLevfaI7TgVRw+XHnkP3
 cFVD/vYMFJ7kWhXG7kkAHcMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHlFqaw5fE
 x3Jbv9iaOlrWyq/WLFhl8ZeiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+aPBNlVtjXFw
 Revlxz/qqyI/WrtGQfIuPiFljfo2oYpXqMQZtZp7aK4t39fIgkSrw8XrZqKAnNHxtpuApjpW
 tZcjUYTkvHGj6Gs9TjsLUkQMXkM/h1mkOCPNNdo3O3jzTgmegfAl8gGwOIfeHSqwA0XDZQjk
 B26MYk8ca9sAfqD3A+juQ+OEBLc0KNDtt9fUi4TY1Jh7HmfxxxR2+WhTqczwo+YHbu6l96vB
 2fEQSEPf7MGVZToXZez+Lj9051bHyUewZqZml9qpAVLxWPhl9jleuKbLG0yW2fdx8LxfwcKi
 jMZVIpU3VT7sHy0B6egzCZE3o6gp0oI+zGFbwmN7XewGmkJoHNlaYIGZZvjd9YHcGrtu8ASu
 SEfQCJaDv+FuMywgSQ4m8/JzMckghQrdr4nBn+qGSo1n82BvTfZFxgWrEAOtmZq2zpXeyB3p
 l1hc881NHAeVnZe5qD0+XafjRDIhTcrSqtQ+YkpYtdsKgyuLFwdqOrJgfgxTVCxlEzPc30nE
 QRTOBn+7jHIJZoZNFXdCRD/FYl/e7/XncDo0jzGKs5cl4shXOAYI/M7LrMtLY1AkqO4AH3Ik
 KS9iVB//HDGyuPvIRqe54YMCBTcgw77n8n4eaJM4vXAw+uf/tY/FW7PmSmGYUtPJStCPEVtF
 Ji/9qMn+WLbCL21wDboCtjLst1gheaaNL3BBjJBPVB/NO7M0mdm6em4Ma8izHsVDuwAn5o9r
 FtZAgXdcRMij4rkY0x3GyzU8XM0zwYr2c=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="43759817"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1+IENsqJ+rTdKqqMdfWkXioZtRY/Rx5Bx4VIJV/kJ9L+hJojHqWow26A9jfSSGEYTV3wd4dK/a2UtsgS9boV98jrFCfy9pjx5taiS9RIhkbQEkX/sWHV0skEEW7ndlZ2aXSINJ+DbACJwmYV+NKwRgOPUZE8LSRjdJV5VPCqTpjp5dzw8ly0qxfKLP7RFWoJ9COn2hGvAbtbXNYjK7A32ltP+AKVXJHXj4jADUY/Q0T7sSTswzRQ9I7RNxgcdB0KdJeCHbS6G+7tUW5PZcomtQH7T3OGrN6VcbZW1ehfeWJoE0baxPadCO+EvqNyLIOKTHfxWsdrYKE4Rq8tJNhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBJpmAZmMOhKvscwO6+sExro1lF4MvvaZXvITJuDbcs=;
 b=jSijJE7JxQuDzavjYV3xoFXR66H5OlmhUZYUqAbyYuj3TjYehh9nucAo3QojlN7OAUQ2OQxAI8hqxTVQhzJB5YnjeNxBunU2TfH99HpZlAq1LNQ8aTUGpVEm1op4jRw4w2WhMeCXcOxehcUtbWNA9XER/u9MOsbc3oXC7IrNv4TZXIqOY+QFQmwXX4qo6ei2iFOLHsMYyTmQv6/z7VMf/Nuagk+agU7PfXNOanJ/SHMAD2AzahQclJyChDrL0bOgAexYKUzVhFf7KtC0NrBCwSpAAtch68okTaCJ1uELdSTHNmg5M5nFZAm1wh8iSGNBhGsaBPM1k2VKgtsLQzt4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBJpmAZmMOhKvscwO6+sExro1lF4MvvaZXvITJuDbcs=;
 b=OsDRYfor6yJ9q7Vj+B8yvkJKXTvJjFebQVYxcuR4Fn++YSUaRlmaG+cPPfj4rFW3aDCCTaBR9y9uLMQwKRicny9aIW/sFZtC2NGWDHl4WDmVhAiaUkmWZrdQ0RDZl4dAhEN6pe7pNfLsourtpOdWZH580pzJMQj4DEdBBlXLZt0=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
 <YIKYaCr13TiwxqRq@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
Date: Fri, 23 Apr 2021 11:51:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YIKYaCr13TiwxqRq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6662b9f-acf1-41b6-c351-08d90645cff7
X-MS-TrafficTypeDiagnostic: BYAPR03MB4119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4119AF3FBE519F22F151BFA9BA459@BYAPR03MB4119.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXXgpoZ+DbxAwDv3vmc3r0iBiGddaPN8wCtDZlrePIQbIqi8DH2t6rTYJPCCfOdsQfMPMTtCk99VROKvTggXe9hHQ6o+QxvuuYiVsLhiZAgGvG2dREzRSkeCLO1Ry1w2JVeNIhEaqSO/om5n5m8RbTifdoQr9ip0RGufxLMLZkA+oO1xTQZDQn07jo1jgOVG//01OzmvDO+dJYscpJqSN6Z14eKsnx9UJmOPomHy7i9Yrhn/dYgO8AQw0pntqZPpFUpheofhfczQZKCFXrO1NdACdDloLTBn0xvfkJjLAczOmCowU/jc42NNH2fNPBhjcXpXamTlLSVV25nGcdRa3GsJjEuc+LOaGzD9IIx6UdD1qwNGZqIM6j7CsZFGA1V0DTa4lHOtd/ZnloSFWAmr3r+it+jDdnINVtOuE9lTQtgw8ZsVhwOgCV/owHW1CnvILsdlIei38+oWlXLP0sI02tu9f0MJuliTU9YpWtSzhm+MIDPLSX0ZW3SeUXS9n2UOwRXjaGDeapkHcOkeJt4EYMNRNYeVgRKQyvKB6VgYLNh9m/gKQyhyv3Cf4An5Dwfx3VAgGisl30zreEeNXFar+kMye1PUEUxL/Ed3Rr9olz5/cAls31o8U0Jfbkqw7oVLP3/J/FGDz8sQuD++Q6RvEkXSZqq3g3ytPvXR64rqv2x9Ztoed+mn57dWGjN8WbBo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(31686004)(36756003)(4326008)(6666004)(26005)(83380400001)(54906003)(110136005)(66946007)(186003)(16526019)(53546011)(66556008)(66476007)(478600001)(8936002)(2616005)(8676002)(38100700002)(956004)(2906002)(16576012)(5660300002)(86362001)(316002)(31696002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDMxQ0FUblJlRjJVUXcxa003d0tFVDRNOHB4VXFzZEczdDBKR3A5MkxycldK?=
 =?utf-8?B?VVRrL3FGYld1Z1ZXR1BZcHRMMUc4UzlOV0c1N1pxd1B6SlVpeUhSaGdzeThV?=
 =?utf-8?B?MzhrMnh3T2tWWCtDV3ZKZUw1SjE5cUtUNlFkU3QyMVJYZHpIMCswTFVtL1J3?=
 =?utf-8?B?SktvelJuejNTSVdwVHFtbCt6eTVmNXQ3NnVGRW5QVExNdmZIUkJUajRxR2RH?=
 =?utf-8?B?eGZNaGNZNnUvQWwvQ210WFVnWElQMG1UazlCaUN2OHNMTnJ5SG1XQ2F1anlM?=
 =?utf-8?B?ZlI5UXZPVVMzV0NrbmVHcEZjWmhhOU0zeXJqdkVqZW52V2tEZlRnN2dWQUNG?=
 =?utf-8?B?OEF2bXRBU1A5bzY1UUFORUJuT1E2N1BlVElsMGoybUc5UHpVRXIxNnoxS0lz?=
 =?utf-8?B?UVAzWURzT0krb3ViQjloVWgvTTloUk9YcW43NXVIQWR4WlB4MEw5ZnlmUlk4?=
 =?utf-8?B?L3NjR2lobzNJQ3FzQkQxeVdDYjFuQUJaMlZyR08vNnFheVc2SlVjQXhVV0pW?=
 =?utf-8?B?ZGZsWUN4VjhuNUxaM25FQmdMdlkvYUM1bGNpdFFPek5EMTJrQ0tCMHFCZC8r?=
 =?utf-8?B?azNnVW9DZC9XNTUxU1JLalZTQUt3K1Nsb3JvL2dSR1ZqK2VKN0Vyc0VhczZn?=
 =?utf-8?B?R3cwK0xzMDgxbUIvZUQ4enlISTlncEhMUksvT0w2cWxqMW5CcUcwWXFibnJv?=
 =?utf-8?B?dWlnNU54WDlTRiswUmhzditzaVN5YUI1Ym15emF3TEdyQS9kaFc5S2U1alBW?=
 =?utf-8?B?WHpPZUdqcktDaWMvVVNrdzBENHNlWHJGZ2VtRWVveEZiVlVBUVdHRDhkK2pL?=
 =?utf-8?B?T2JYYStaOEphdnpuZHpNNTErM0Fnai83d1lsOFBnMjBGY2VSR2dFQjNtQ3JV?=
 =?utf-8?B?ZlRQN1RTQitHL1VZY1Q0NnBjY1VFbjlsNytWWFh6RjFMNXk5SHlCendjZ0dr?=
 =?utf-8?B?SDE0cU5YNDhrdTlxOEJUUVM2OUhsMGZ1bWF4MG9FdzMvalBwbDdWL1h2alhw?=
 =?utf-8?B?V1NWNWczR2RpVGdBNnlzdGJId0xTVkd3RitldXhKTFpnbGVBSkt1M3lZbUVZ?=
 =?utf-8?B?Mlk0UDRtVUk1Wm5FT1JtVzdZN1lsV0JLSHFmOEJ4UzZPUEVLVXRjWXRMcGJz?=
 =?utf-8?B?SFA2b2wxdFAwNm9XWXBMUEdUU3A0aDc1cTh5aVE2dU9oeWJWcEZFY3ZWd0pK?=
 =?utf-8?B?NFI1aCtHTjJhbDduSHFucytONXErT1Vna29Cb3VoNysrc053SU9wVW1jY21Y?=
 =?utf-8?B?ays0K2FiOGJaYTB1NnN6TlZib0R6MTlva3E1dS82eTk5OHZvRTJyVG1GOVVI?=
 =?utf-8?B?ak1KQWxCMXpUNVBlNEZybks0VnBILzFPSStWa2k5Njl6em9vMVJYdklhVmU1?=
 =?utf-8?B?OWlHOEpFQnNnQlVReEk1TjdBMWVSYXJxWXNSQ3IwNnZqTEhBMVJrbitVVWNQ?=
 =?utf-8?B?M01pSWM5ckxqd05zMFk5NHFRcmNEVXF0ak9TSUF1dzdGRmt5RGg4dmdoV2xE?=
 =?utf-8?B?WGdxSWwyUFVjZmJjVzFINXhnS3RDbGFvV3g2K1BUSW5jOFFrdGFIN2JHYU5Z?=
 =?utf-8?B?bnlBclhrdUZhbnozRXpqdnUzQk85NmRWcnVsRXhCQUo5UTV6WkJkbmxSN0tE?=
 =?utf-8?B?R1Zkejc1OW9ieGU3NmRqNm1hVk1PRWdJTkl4S05tM1gyT3hSVDJpMXZGeHdz?=
 =?utf-8?B?UHdPdDhKNnVpSjFDLzZsYko5QlB0ODlWSG1vZHIzRlF4Q285QjFVVFg5dEZs?=
 =?utf-8?Q?TE4ztsn2AMNobZHQwU+JFZbkM1sCkwQof8T200W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6662b9f-acf1-41b6-c351-08d90645cff7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 10:51:56.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB94rbBizAnZO1obm+enIaQu9DjEAS67cmVWlA93H/nwnw7tLsS+0Mph8GDPZ2La6axjNykiZTk3otv6qX9sjunR/Vs6tNvFr7fp9wswLnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4119
X-OriginatorOrg: citrix.com

On 23/04/2021 10:50, Roger Pau Monné wrote:
> On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
>> On 16.04.2021 15:41, Andrew Cooper wrote:
>>> On 16/04/2021 09:16, Jan Beulich wrote:
>>>> clang, at the very least, doesn't like unused inline functions, unless
>>>> their definitions live in a header.
>>>>
>>>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> I agree this will fix the build.  However, looking at the code, I'm not
>>> sure the original CONFIG_COMPAT was correct.  In particular, ...
>>>
>>>> --- a/xen/arch/x86/oprofile/backtrace.c
>>>> +++ b/xen/arch/x86/oprofile/backtrace.c
>>>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>>>      return head->ebp;
>>>>  }
>>>>  
>>>> +#ifdef CONFIG_COMPAT
>>>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>>  {
>>>>      if (is_hvm_vcpu(vcpu))
>>> ... this chunk of logic demonstrates that what oprofile is doing isn't
>>> related to the Xen ABI in the slightest.
>>>
>>> I think OProfile is misusing the guest handle infrastructure, and
>>> shouldn't be using it for this task.
>> I'm afraid I consider this something for another day. Both the
>> original #ifdef and the one getting added here are merely
>> measures to get things to build.
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> Without entering on the debate whether CONFIG_COMPAT is the correct
> conditional to use it's not making the issue any worse, and it will
> allow to unblock the build. We can discuss about the CONFIG_COMPAT
> stuff later.

I disagree.  Fixing this less effort than the time wasted arguing about
fixing it.

But if you are going to insist on not fixing it, and putting in a patch
like this, then at a minimum, it needs to include a TODO comment stating
that the use of CONFIG_COMPAT is bogus and needs fixing.

~Andrew

