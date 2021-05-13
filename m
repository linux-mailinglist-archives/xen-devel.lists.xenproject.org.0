Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B037F86C
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 15:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126951.238546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhB6N-0007ei-Kl; Thu, 13 May 2021 13:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126951.238546; Thu, 13 May 2021 13:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhB6N-0007cT-HZ; Thu, 13 May 2021 13:10:07 +0000
Received: by outflank-mailman (input) for mailman id 126951;
 Thu, 13 May 2021 13:10:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U61U=KI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lhB6M-0007cN-My
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 13:10:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b0cd3b0-9ed5-41a8-b05a-ce5167fa5761;
 Thu, 13 May 2021 13:10:04 +0000 (UTC)
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
X-Inumbo-ID: 1b0cd3b0-9ed5-41a8-b05a-ce5167fa5761
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620911404;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tLLMue0pia2RSHPtu+KRxD5gYBb/zBQVw+kdxIB/vzQ=;
  b=DP1wGG5Y7Wlc8HA9vqwwYVOFWW2TPUrhp4wAYRsQee9z+IXKLJSJu11n
   3Wg0o5D3tdV9iE96UV6OkGj0Cd9b/GIbNUcFJxEE4jPnFTNBpnd3Dfuwx
   kQuMjM9+4H/gSuydjxB/BvH/QrrkEPyWqB3vU+eLBzubY2ZqwoT9CdLR7
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BP9Lngatup1QCAh0563TstMMBV3EgkQGRO1N2HDsaZ32tK94BE+XToakAvDamANOeIe2vm+MpK
 EQiumc7iHU8ZAaazCRNFJBVNP6Tak/wuorFG9YrnIe/RQlm7MQNsXBzgvfPAh1MdygIN0ZgIUT
 Im6RtWh5GY0TxfhJgUaDQg971Sx9Efb+qLNNUbc5pTJRTqjSJ6eS597rs6TqYQFQjC40ema3zv
 jH8Ev2j59R3cvUEUYce5jpXMxFOO/v8jJpszK1ijO0qjRLAlPl0MNKgR4G7yDd+8iD70ysR8ho
 g5Q=
X-SBRS: 5.1
X-MesageID: 43514647
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AJNt6KrgmCKZ5mqdEnP1w28aV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; 
   d="scan'208";a="43514647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku20cUilb4VzVGm/0dCFNWBFFTMIU3hMW77YxdKICvcmhGtfjNed0iX0HztiYrUTTNi6m3MhT/Rzd/yl9m31GD3OsoE04O2lkRlJtD4+ZIY4lLIe99cC8HwoDQX1yF8kw8Yueil+hJI3Z6N2a8j7rlJeoGfLxS1I7HhIxIxoaaM2UXBZDuCbS2dxBqWSjwVWYs9kb7F0g3kno4JVomcTYHtSezjlbfWuMnk1hbzhOn5PhlVmKDv070lVgRMffNKq2zLCOvYeYHYfDs1N2o2UElGEb7KAgOwbJTn1ERVKrGesigq/CJn7Xcoq0bM6a4YQlXinvY03yzRZAfNTXryDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLLMue0pia2RSHPtu+KRxD5gYBb/zBQVw+kdxIB/vzQ=;
 b=hf1unGZKuU4uHtD6mJ926BvYYoubNi1v1Yg4QhnB854DrYzeWz2ZK6ar2MJVYj2xbLzAISBOHCgpdB5ioGMl5+zAsxpKzFJ+Q+kAd7JSKGyrSNxBJCSX5ypsQbo1bAB963r4c9wKhjCoOr0Rjs7bCcNYXvTXUXcz/UyEp8lXYt0P/MESwZNSOCHlidMRl9o3fEtxlgdD5cyxFF44O/FcbZ5GWQ4U8htGLUAAbZQKpBlFSi/fEdcS0SmNaq1jisNv346ZCg1/E17T92UYR/5rudaE50Tv9RYntzjTxKUkEniJBYOci4zcJNtZ8WC7KYP4eV9DnzRf3VYHtDRrwqnX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLLMue0pia2RSHPtu+KRxD5gYBb/zBQVw+kdxIB/vzQ=;
 b=iNiwmYoOSNdCqewcRfI/c1ZLFZoKeVs5Sz1I4qtPXua61IMR8LMN89uh37l8X9hpicVjST4+frwwMDE9LdFRQWcE8JqBRqMJJN5Z8kBTJch53B70JIjCNkpqLI70Gpu+up105gE06Q0EGeo2od8kr2M94coirYEd8jlSFw85nLc=
Subject: Re: regression in recent pvops kernels, dom0 crashes early
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
 <378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
 <20210513142229.2d2aa0b4.olaf@aepfle.de>
 <389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
 <20210513150033.2448f533.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <67d1fb0f-1cbc-07b7-2224-8f9762b3a7c9@citrix.com>
Date: Thu, 13 May 2021 14:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210513150033.2448f533.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46b0ce1c-c7ac-4483-f6ad-08d9161069a7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6392:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB639223142B8D56F7ED8C6886BA519@SJ0PR03MB6392.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUc/7JSxhQyz7ZvqjVj9mtmmK9+2UpG5GjogGBd5+dynPNcGEMBT1mt/paeMxBmxdGeh9Kl0ASQ5V2XhJXETbE/oZkLAaN2TfYq1PbfuoQOT3dhKZrbBD5E+ys4mM0jT1EGTXQ0gKQkN4UhFGn2ot9rByC8kLlsjGuvl35ibKuzjB83Mjn4itMpR4uMtozPsACfPpc9U6CDZUTGnNMlH7h2ARslheIijstKf5SqwmyacFgbA/oH330/0Y1kpAFInkT4O6dlbEpgtgc3y5ClwGWN++RzH7tei15OxqZGZzEdwpd+OTQpAQbcWcHebLWf69anzRY0firviJw05Wlh+wkF+aujR9MP/6JHxdSWflLbtt60i0BLkC6B49OBGMIh6lK1u2eA3IbpGqMvsFy8kFwHeJNJSX6plr+akx7iVEHr10a+vjixCQYr9963ZPcc+ZKb0+8yuteEb9TLZlhcfbWgz+xHx2mRSjnPswAyqt+wY4yrD2Nf/xb66ASWXNkxuxXX/SL2X0eq9gvQPthHf6OcVNwaSHF9jIA07beay5VUr8eiuWEHF4arndrW2KIfn3lvgJQd+NzC+VE7F0rBdVP6luQ+jQDzCfmDCBKyCnT7wLrtFaVjXgMj5Ijcg/KMH8B/xeU8BRhvm6h5kFlkw7rpz5CT9iyjh7ZGdfIDAK5AkZLidWcCf1kGV3aKYSGzP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(396003)(346002)(376002)(86362001)(8936002)(2906002)(26005)(956004)(186003)(4326008)(2616005)(83380400001)(6666004)(31686004)(16576012)(4744005)(31696002)(8676002)(478600001)(38100700002)(5660300002)(66476007)(66946007)(16526019)(6916009)(66556008)(6486002)(316002)(36756003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?b6Fgut/Ug5dxiyyqtG1XB67WYTiAxc9dJ6Sv6ZSjkn7ke8yOi5ckbtbn?=
 =?Windows-1252?Q?yXGKXp4e/UBa3auMLHtiKfCMImSz95doECl3KFishNrD6KWK0CRNIAfI?=
 =?Windows-1252?Q?1v+LoolYbjpR8KVzlWCYgqP0OY0CgbxOHtxHsEHGNjlG+mWpTC/r5Rmg?=
 =?Windows-1252?Q?wUBzXIucNC6RRuiZE8d+Gbmcsf7xrY0XyMtnQkrIM5vdk+lCrczYhaV0?=
 =?Windows-1252?Q?d3Z9C/Fx8vC5bK5gXLXe2MTi+Mev+w/HrPayF1nFKRWxRePKnU1yzE5W?=
 =?Windows-1252?Q?BXk20AaAvrLDUuHIyUjt53zMb4vlXWjd5ToMfRWledttGH5bXoCjXi+F?=
 =?Windows-1252?Q?Wk02pjHa9yyGEAOssVGDCcwPJ3/BxkSDhOBtSpJVc9j7QYYcI0aBhp8y?=
 =?Windows-1252?Q?jChl4FmyY7dZWQ0G79kjrrkELwFLRd4iN87aiB3lbaWSys+VZu7ByQ7s?=
 =?Windows-1252?Q?t1Adxzr8RxCf+biNW9tZiNA48WiuhL6e4HBlg1tRU8eNSdA2jvopOyd3?=
 =?Windows-1252?Q?kVYzkHtpF/txGGMOsMB5s7YT3DVeUQYAawHd2fIAeRiQIzem0Xgn+lSS?=
 =?Windows-1252?Q?jd5vPwiPdtHRTT+qxhAXNSSZhMzBeXIK2AKd2dy+64hP7gUqKlUtPm++?=
 =?Windows-1252?Q?yclAfQGdurFlQNio+LzsZV9n3JpDyMYgGdf3N4kk56HX799zVuTDEzTq?=
 =?Windows-1252?Q?mOnqF2iwzZv7YTwPbWZtIjaee8oPkPOlY1tWBN6tMOWV1Z4kS9UOpvBS?=
 =?Windows-1252?Q?LFUKo1vYnSED6rcz+j1Du36AVnjbYDVh+mjtQbjC7xYwZLiHrPbJ1fbr?=
 =?Windows-1252?Q?4/Xo2riygTbpFdGABktNB6jvtbCKbtizHO4hbVmtLpmOMct8Klbv54aD?=
 =?Windows-1252?Q?Brl4a0/zJYrxw31ZtFomABc8qU/aHK4nVPVQLS5uEjS5cGnAoKJL3zmw?=
 =?Windows-1252?Q?rKfU2yE9o7KwMEfksrh5UcUrY6Lg6wUrqpEu3qcvMF7FUWAHlQ3hSHEO?=
 =?Windows-1252?Q?w61wqH+rdtAg0vzQKiP4mr8SATUdYDA1L4tskgvlqSMlaO3ilBpWvUYL?=
 =?Windows-1252?Q?dCM/erCi+lOgZ24p+40Tt7FjDKgDvLCAFv1RlAwYpRlKSRUuXNkS6sCy?=
 =?Windows-1252?Q?lkS8p/UhdfGu++uTTgyTHQpR5Vlqj8x+yWx47Y0dNTGX60s8trgsQQjd?=
 =?Windows-1252?Q?hUGu1aJiESuunTtL85dg9jnRsQnoiJ0GcNl7SRrKpROVQPHDPeSDv3SI?=
 =?Windows-1252?Q?I3oyqNem4C54LhnqaLp/8+eRQaQkxx0YaQC3lau9ts7G+aX3r24NPmsS?=
 =?Windows-1252?Q?Mz8caSD8XzIWSi5jquRO0ZmTMgz8iuJTgVC+JwqdAbveroCUeIUKZNRb?=
 =?Windows-1252?Q?0qolEAT5bIutOcf5Uip6+yLBY5a1E8AVymVtPQqEisvP29rMhc6Tzi4B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b0ce1c-c7ac-4483-f6ad-08d9161069a7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 13:10:00.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zh9okuM/eOsZ0XwdXvXDwkBg8FWIX1HJ0ApXEPUtxqMQf5hrsXUn92wgQgvGUE9CPQde28PApP6SR4FRmUYTJq8q22IFSXK2F2fRYx9Vc6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6392
X-OriginatorOrg: citrix.com

On 13/05/2021 14:00, Olaf Hering wrote:
> Am Thu, 13 May 2021 13:29:32 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Warning: NX (Execute Disable) protection not active
> There was a knob in the BIOS, it was set to "Disabled" for some reason.
> Once enabled, the flag is seen and the dom0 starts fine.
>
> If Xen is booted with 'cpuid=no-nx', the dom0 crashes again.
>
> Thanks for the help, Andrew.

Well - I wouldn't say we're quite done yet.

Clearly between sle12sp3 and sle12sp4 you've picked up a regression
where Linux decides to use NX despite its absence.

If NX is a mandatory feature now, then dom0 ought to error out cleanly
stating this fact.

~Andrew

